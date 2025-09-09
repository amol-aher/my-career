# Suppose you have to create a REST API and perform CRUD operations on the book table. Can you write the controller?

```ruby
module Api
  module V1
    class BooksController < ApplicationController
      before_action :set_book, only: %i[show update destroy]
      before_action :authenticate_user! 

      rescue_from ActiveRecord::RecordNotFound, with: :not_found
      rescue_from ActionController::ParameterMissing, with: :bad_request

      # GET /api/v1/books
      # Supports filtering, sorting, and pagination.
      def index
        books = Book.all

        # --- Filtering (simple, safe) ---
        books = books.where('title ILIKE ?', "%#{params[:title]}%") if params[:title].present?
        books = books.where('author ILIKE ?', "%#{params[:author]}%") if params[:author].present?
        if params[:published_after].present?
          books = books.where('published_on >= ?', Date.parse(params[:published_after]))
        end
        if params[:published_before].present?
          books = books.where('published_on <= ?', Date.parse(params[:published_before]))
        end

        # --- Sorting ---
        sort_by = %w[title author published_on created_at].include?(params[:sort_by]) ? params[:sort_by] : 'created_at'
        order   = %w[asc desc].include?(params[:order]) ? params[:order] : 'desc'
        books   = books.order(sort_by => order)

        # --- Pagination (limit/offset) ---
        limit  = [[params.fetch(:limit, 25).to_i, 100].min, 1].max
        offset = [params.fetch(:offset, 0).to_i, 0].max
        total  = books.count
        books  = books.limit(limit).offset(offset)

        render json: {
          data: books.map { |b| BookSerializer.new(b) },
          meta: {
            total: total, limit: limit, offset: offset,
            sort_by: sort_by, order: order
          }
        }, status: :ok
      end

      # GET /api/v1/books/:id
      def show
        authorize! @book # replace with Pundit/CanCanCan if used
        render json: { data: BookSerializer.new(@book) }, status: :ok
      end

      # POST /api/v1/books
      def create
        book = Book.new(book_params)
        authorize! book
        if book.save
          render json: { data: BookSerializer.new(book) }, status: :created
        else
          render json: { errors: format_errors(book) }, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/books/:id
      def update
        authorize! @book
        if @book.update(book_params)
          render json: { data: BookSerializer.new(@book) }, status: :ok
        else
          render json: { errors: format_errors(@book) }, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/books/:id
      def destroy
        authorize! @book
        @book.destroy # soft delete? see sub-Q below
        head :no_content
      end

      private

      def set_book
        @book = Book.find(params[:id])
      end

      # Strong params
      def book_params
        params.require(:book).permit(
          :title, :author, :isbn, :published_on, :price_cents, :in_stock, :description
        )
      end

      # Minimal authz shim (swap with Pundit/CanCanCan in real app)
      def authorize!(record)
        true
      end

      def not_found(error)
        render json: { errors: [{ code: 'not_found', detail: error.message }] }, status: :not_found
      end

      def bad_request(error)
        render json: { errors: [{ code: 'bad_request', detail: error.message }] }, status: :bad_request
      end

      def format_errors(record)
        record.errors.map { |attr, msg| { source: attr, detail: msg } }
      end
    end
  end
end
```

## Follow-up Questions

| How do you secure this API (authn/authz)?          |
| :--------------------------------------------------|
| For authentication I use JWT (e.g., devise-jwt) or OAuth2 via an API gateway. Controllers call authenticate_user! to load current_user. For authorization, I prefer Pundit: policies per model (e.g., BookPolicy) and authorize @book in actions. This decouples access rules from controllers and enables testable, least-privilege checks.|

| How do you handle validation errors and consistency of error shapes?          |
| :--------------------------------------------------|
| I return a consistent { errors: [{ code, source, detail }] } envelope with correct HTTP status (422 for validation, 404 for missing, 400 for bad params). The format_errors helper maps Rails errors to this structure, keeping clients stable.|

| How would you add soft deletes?          |
| :--------------------------------------------------|
| Add deleted_at:datetime and a default scope: default_scope { where(deleted_at: nil) }. In destroy, set update!(deleted_at: Time.current) instead of destroy. Expose ?include_deleted=true only to admins with a separate scope, and index deleted_at for performance.|

| Prevent N+1 queries?          |
| :--------------------------------------------------|
| Eager-load associations in index/show (e.g., books = books.includes(:publisher, :categories)) and verify with bullet in dev/test. Serializers should only expose needed fields to avoid triggering lazy loads.|

| How would you add idempotency to create?          |
| :--------------------------------------------------|
| Accept Idempotency-Key header, store keys with request hash and response digest (e.g., Redis with TTL). On duplicate keys, return the recorded response. This is crucial for mobile or flaky networks.|

| How do you version the API?          |
| :--------------------------------------------------|
| Namespace controllers (Api::V1) and routes (/api/v1). Breaking changes go to v2 while maintaining v1 until clients migrate. Alternatively, header-based versioning can be supported, but URL versioning is explicit and cache-friendly.|

| How do you handle pagination for large data sets?          |
| :--------------------------------------------------|
| Prefer keyset pagination (WHERE created_at < ?) for very large tables to avoid deep OFFSET scans. I expose both limit/offset for simplicity and a cursor approach (next_cursor) when performance matters.|

| How would you document this API?          |
| :--------------------------------------------------|
| Use OpenAPI (rswag or openapi-rails) to generate interactive docs and to keep request/response schemas in sync with request specs.|

| How do you keep controllers skinny?          |
| :--------------------------------------------------|
| Push complex business logic into service objects (e.g., Books::Create.call(params, current_user)), use policies for authz, serializers for presentation, and concerns for shared error handling.|

| How would you add caching?          |
| :--------------------------------------------------|
| Use conditional GET with ETag/Last-Modified and low-TTL fragment caching for index. For read-heavy endpoints, add Redis caching keyed by filter params; bust on create/update/destroy via model callbacks.|
