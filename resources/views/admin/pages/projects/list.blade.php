@extends("admin.pages.app")
@section("content")
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">

                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="fw-bold mb-0">{{ __("Projects") }}</h4>
                    <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#createProjectModal">
                        <i class="bi bi-plus-lg me-1"></i> {{ __("Add New Project") }}
                    </button>
                </div>

                <!-- Toast container -->
                <div class="position-fixed end-0 top-0 p-3" style="z-index: 1100;">
                    <div id="liveToast" class="toast align-items-center text-bg-success border-0" role="alert"
                        aria-live="assertive" aria-atomic="true">
                        <div class="d-flex">
                            <div class="toast-body" id="toastMessage">{{ __("Success message") }}</div>
                            <button type="button" class="btn-close btn-close-white m-auto me-2" data-bs-dismiss="toast"
                                aria-label="{{ __("Close") }}"></button>
                        </div>
                    </div>
                </div>
                <div class="card border-0 shadow-sm">
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table-hover mb-0 table align-middle" id="ProjectsTable">
                                <thead class="table-light">
                                    <tr class="text-center">
                                        <th style="width:50px;">#</th>
                                        <th style="width:80px;">{{ __("Image") }}</th>
                                        <th>{{ __("Address") }}</th>
                                        <th>{{ __("Category") }}</th>
                                        <th>{{ __("Status") }}</th>
                                        <th>{{ __("Price") }}</th>
                                        <th>{{ __("Area (m²)") }}</th>
                                        <th>{{ __("Floor") }}</th>
                                        <th>{{ __("Bedrooms") }}</th>
                                        <th>{{ __("Bathrooms") }}</th>
                                        <th>{{ __("Parking") }}</th>
                                        <th>{{ __("Short Description") }}</th>
                                        <th style="width:140px;">{{ __("Actions") }}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($projects as $index => $project)
                                        <tr id="ProjectRow{{ $project->id }}" class="text-center">
                                            <td class="fw-bold">{{ $index + 1 }}</td>
                                            <div class="row">
                                                <td class="col-6 Project-image">
                                                    @if ($project->image && is_array($project->image))
                                                        @foreach ($project->image as $img)
                                                            <img src="{{ asset("storage/" . $img) }}" width="60"
                                                                height="60" class="mb-1 me-1 rounded border"
                                                                style="object-fit: cover;">
                                                        @endforeach
                                                    @else
                                                        <span class="text-muted small">No Image</span>
                                                    @endif

                                                </td>
                                            </div>
                                            <td class="Project-title fw-semibold text-start">{{ $project->title }}</td>
                                            <td class="Project-category" data-id="{{ $project->category_id }}">
                                                {{ $project->category->name ?? "-" }}
                                            </td>
                                            <td class="Project-status">
                                                <span
                                                    class="badge {{ $project->status == "active" ? "bg-success" : "bg-secondary" }}">
                                                    {{ ucfirst($project->status) }}
                                                </span>
                                            </td>
                                            <td class="Project-price">{{ $project->price }}</td>
                                            <td class="Project-area">{{ $project->area }}</td>
                                            <td class="Project-floor">{{ $project->floor }}</td>
                                            <td class="Project-bedrooms">{{ $project->bedrooms }}</td>
                                            <td class="Project-bathrooms">{{ $project->bathrooms }}</td>
                                            <td class="Project-parking">{{ $project->parking }}</td>
                                            <td class="Project-short small text-start">
                                                {{ trim($project->short_description) }}
                                            </td>

                                            <td class="text-center">
                                                <button class="btn btn-sm btn-outline-secondary edit-Project"
                                                    data-id="{{ $project->id }}">
                                                    <i class="bi bi-pencil-fill"></i>
                                                </button>
                                                <button class="btn btn-sm btn-outline-danger delete-Project"
                                                    data-id="{{ $project->id }}">
                                                    <i class="bi bi-trash-fill"></i>
                                                </button>
                                            </td>

                                            {{-- Hidden detailed data for JS --}}
                                            <td class="Project-description d-none">{!! $project->description !!}</td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>

                            <div class="mt-3 px-5">
                                {{ $projects->links("pagination::bootstrap-5") }}
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    {{-- Add New property --}}
    <div class="modal fade" id="createProjectModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content shadow-lg">
                <div class="modal-header">
                    <h5 class="modal-title">{{ __("Add New property") }}</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form id="createProjectForm" enctype="multipart/form-data">
                        @csrf
                        <div class="mb-3">
                            <label class="form-label">{{ __("Address") }}</label>
                            <input type="text" name="title" class="form-control" id="createProjectTitle" required>
                            <div class="invalid-feedback" id="createProjectTitleError"></div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">{{ __("Short Description") }}</label>
                            <input type="text" name="short_description" class="form-control"
                                id="createProjectShortDescription">
                            <div class="invalid-feedback" id="createProjectShortDescriptionError"></div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">{{ __("Category") }}</label>
                            <select class="form-control" name="category_id" id="createProjectCategory" required>
                                @foreach (\App\Models\Category::where("lang", app()->getLocale())->get() as $cat)
                                    <option value="{{ $cat->id }}">{{ $cat->name }} </option>
                                @endforeach
                            </select>
                            <div class="invalid-feedback" id="createProjectCategoryError"></div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">{{ __("Status") }}</label>
                            <select class="form-control" name="status" id="createProjectStatus" required>
                                <option value="active">{{ __("Active") }}</option>
                                <option value="inactive">{{ __("Inactive") }}</option>
                            </select>
                            <div class="invalid-feedback" id="createProjectStatusError"></div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">{{ __("Description") }}</label>
                            <textarea class="form-control" name="description" id="createProjectDescription"></textarea>
                            <div class="invalid-feedback" id="createProjectDescriptionError"></div>
                        </div>
                        <div class="row">
                            <div class="col-6 mb-3">
                                <label class="form-label">{{ __("Price") }}</label>
                                <input type="number" name="price" class="form-control" id="createProjectPrice">
                                <div class="invalid-feedback" id="createProjectPriceError"></div>
                            </div>
                            <div class="col-6 mb-3">
                                <label class="form-label">{{ __("Parking") }}</label>
                                <input type="number" name="parking" class="form-control" id="createProjectParking">
                                <div class="invalid-feedback" id="createProjectParkingError"></div>
                            </div>
                            <div class="col-6 mb-3">
                                <label class="form-label">{{ __("Floor") }}</label>
                                <input type="number" name="floor" class="form-control" id="createProjectFloor">
                                <div class="invalid-feedback" id="createProjectFloorError"></div>
                            </div>
                            <div class="col-6 mb-3">
                                <label class="form-label">{{ __("Area") }}</label>
                                <input type="number" name="area" class="form-control" id="createProjectArea">
                                <div class="invalid-feedback" id="createProjectAreaError"></div>
                            </div>
                            <div class="col-6 mb-3">
                                <label class="form-label">{{ __("Bathrooms") }}</label>
                                <input type="number" name="bathrooms" class="form-control" id="createProjectBathrooms">
                                <div class="invalid-feedback" id="createProjectBathroomsError"></div>
                            </div>
                            <div class="col-6 mb-3">
                                <label class="form-label">{{ __("Bedrooms") }}</label>
                                <input type="number" name="bedrooms" class="form-control" id="createProjectBedrooms">
                                <div class="invalid-feedback" id="createProjectBedroomsError"></div>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">{{ __("Images") }}</label>
                            <input type="file" class="form-control" name="image[]" id="createProjectImage" multiple>
                            <div class="invalid-feedback" id="createProjectImageError"></div>
                        </div>

                        <div class="text-end">
                            <button type="button" class="btn btn-secondary"
                                data-bs-dismiss="modal">{{ __("Cancel") }}</button>
                            <button type="submit" data-disable-on-submit
                                class="btn btn-success">{{ __("Add") }}</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    {{-- Edit property --}}
    <div class="modal fade" id="editProjectModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content shadow-lg">
                <div class="modal-header">
                    <h5 class="modal-title">{{ __("Edit property") }} - <span id="modalProjectTitle"></span></h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form id="editProjectForm" enctype="multipart/form-data">
                        @csrf
                        @method("PUT")
                        <input type="hidden" id="modalProjectId" name="id">
                        <div class="mb-3">
                            <label class="form-label">{{ __("Address") }}</label>
                            <input type="text" class="form-control" id="ProjectTitleInput" name="title" required>
                            <div class="invalid-feedback" id="ProjectTitleInputError"></div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">{{ __("Short Description") }}</label>
                            <input type="text" class="form-control" name="short_description"
                                id="ProjectShortDescriptionInput">
                            <div class="invalid-feedback" id="ProjectShortDescriptionInputError"></div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">{{ __("Category") }}</label>
                            <select class="form-control" id="ProjectCategoryInput" name="category_id" required>
                                @foreach (\App\Models\Category::where("lang", app()->getLocale())->get() as $cat)
                                    <option value="{{ $cat->id }}">{{ $cat->name }} </option>
                                @endforeach
                            </select>
                            <div class="invalid-feedback" id="ProjectCategoryInputError"></div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">{{ __("Status") }}</label>
                            <select class="form-control" id="ProjectStatusInput" name="status" required>
                                <option value="active">{{ __("Active") }}</option>
                                <option value="inactive">{{ __("Inactive") }}</option>
                            </select>
                            <div class="invalid-feedback" id="ProjectStatusInputError"></div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">{{ __("Description") }}</label>
                            <textarea class="form-control" name="description" id="ProjectDescriptionInput"></textarea>
                            <div class="invalid-feedback" id="ProjectDescriptionInputError"></div>
                        </div>
                        <div class="row">
                            <div class="col-6 mb-3">
                                <label class="form-label">{{ __("Price") }}</label>
                                <input type="number" class="form-control" name="price" id="ProjectPriceInput">
                                <div class="invalid-feedback" id="ProjectPriceInputError"></div>
                            </div>
                            <div class="col-6 mb-3">
                                <label class="form-label">{{ __("Parking") }}</label>
                                <input type="number" name="parking" class="form-control" id="ProjectParkingInput">
                                <div class="invalid-feedback" id="ProjectParkingInputError"></div>
                            </div>
                            <div class="col-6 mb-3">
                                <label class="form-label">{{ __("Floor") }}</label>
                                <input type="number" name="floor" class="form-control" id="ProjectFloorInput">
                                <div class="invalid-feedback" id="ProjectFloorInputError"></div>
                            </div>
                            <div class="col-6 mb-3">
                                <label class="form-label">{{ __("Area") }}</label>
                                <input type="number" name="area" class="form-control" id="ProjectAreaInput">
                                <div class="invalid-feedback" id="ProjectAreaInputError"></div>
                            </div>
                            <div class="col-6 mb-3">
                                <label class="form-label">{{ __("Bathrooms") }}</label>
                                <input type="number" name="bathrooms" class="form-control" id="ProjectBathroomsInput">
                                <div class="invalid-feedback" id="ProjectBathroomsInputError"></div>
                            </div>
                            <div class="col-6 mb-3">
                                <label class="form-label">{{ __("Bedrooms") }}</label>
                                <input type="number" name="bedrooms" class="form-control" id="ProjectBedroomsInput">
                                <div class="invalid-feedback" id="ProjectBedroomsInputError"></div>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">{{ __("Images") }}</label>
                            <input type="file" class="form-control" name="image[]" id="ProjectImageInput" multiple>
                            <div class="invalid-feedback" id="ProjectImageInputError"></div>
                            <div id="currentImagePreview" class="mt-2"></div>
                        </div>

                        <div class="text-end">
                            <button type="button" class="btn btn-secondary"
                                data-bs-dismiss="modal">{{ __("Cancel") }}</button>
                            <button type="submit" data-disable-on-submit
                                class="btn btn-primary">{{ __("Save Changes") }}</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    {{-- Delete property --}}
    <div class="modal fade" id="deleteProjectModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content shadow-lg">
                <div class="modal-header border-0">
                    <h5 class="modal-title text-danger">{{ __("Delete Confirmation") }}</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <p>{{ __("Are you sure you want to delete") }} <strong id="deleteProjectTitle"></strong>?</p>
                    <input type="hidden" id="deleteProjectId">
                </div>
                <div class="modal-footer border-0">
                    <button type="button" class="btn btn-secondary"
                        data-bs-dismiss="modal">{{ __("Cancel") }}</button>
                    <button type="button" class="btn btn-danger"
                        id="confirmDeleteProjectBtn">{{ __("Delete") }}</button>
                </div>
            </div>
        </div>
    </div>
@endsection

@push("scripts")
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            let createDescriptionEditor, editDescriptionEditor;

            ClassicEditor.create(document.querySelector("#createProjectDescription"))
                .then(editor => createDescriptionEditor = editor);
            ClassicEditor.create(document.querySelector("#ProjectDescriptionInput"))
                .then(editor => editDescriptionEditor = editor);

            const createForm = document.getElementById('createProjectForm');
            const editForm = document.getElementById('editProjectForm');
            const createModal = new bootstrap.Modal('#createProjectModal');
            const editModal = new bootstrap.Modal('#editProjectModal');
            const deleteModal = new bootstrap.Modal('#deleteProjectModal');

            const toastEl = document.getElementById('liveToast');
            const toastMsg = document.getElementById('toastMessage');
            const toast = new bootstrap.Toast(toastEl);

            function showToast(message, type = 'success') {
                toastMsg.textContent = message;
                toastEl.className = `toast align-items-center text-bg-${type} border-0`;
                toast.show();
            }

            // Create project
            createForm.addEventListener('submit', e => {
                e.preventDefault();
                resetValidation(createForm);

                const fd = new FormData();
                fd.append('title', document.getElementById('createProjectTitle').value);
                fd.append('short_description', document.getElementById('createProjectShortDescription')
                    .value);
                fd.append('category_id', document.getElementById('createProjectCategory').value);
                fd.append('status', document.getElementById('createProjectStatus').value);
                fd.append('price', document.getElementById('createProjectPrice').value);
                fd.append('parking', document.getElementById('createProjectParking').value);
                fd.append('floor', document.getElementById('createProjectFloor').value);
                fd.append('area', document.getElementById('createProjectArea').value);
                fd.append('bathrooms', document.getElementById('createProjectBathrooms').value);
                fd.append('bedrooms', document.getElementById('createProjectBedrooms').value);
                fd.append('description', createDescriptionEditor.getData());

                const imgs = document.getElementById('createProjectImage').files;
                for (let i = 0; i < imgs.length; i++) {
                    fd.append('image[]', imgs[i]);
                }

                fetch("{{ route("admin.projects.store") }}", {
                        method: 'POST',
                        headers: {
                            'X-CSRF-TOKEN': '{{ csrf_token() }}',
                            'Accept': 'application/json'
                        },
                        body: fd
                    })
                    .then(r => r.json())
                    .then(data => {
                        if (data.success) {
                            addProjectRow(data.project);
                            createForm.reset();
                            createDescriptionEditor.setData('');
                            createModal.hide();
                            showToast(data.message, 'success');
                        } else {
                            showErrors('createProject', data.errors);
                        }
                    });
            });

            // Edit project
            editForm.addEventListener('submit', e => {
                e.preventDefault();
                resetValidation(editForm);

                const id = document.getElementById('modalProjectId').value;
                const fd = new FormData(editForm);
                fd.append('description', editDescriptionEditor.getData());
                fd.append('_method', 'PUT');
                fetch(`/admin/projects/${id}`, {
                        method: 'POST',
                        headers: {
                            'X-CSRF-TOKEN': '{{ csrf_token() }}',
                            'Accept': 'application/json'
                        },
                        body: fd
                    })
                    .then(async response => {
                        const data = await response.json();

                        if (response.ok && data.success) {
                            updateProjectRow(data.project);
                            editModal.hide();
                            showToast(data.message, 'success');
                        } else if (response.status === 422) {
                            showErrors('Project', data.errors); // errors from validation
                        } else {
                            showToast("Unexpected error occurred", "danger");
                        }
                    })
                    .catch(() => {
                        showToast("Connection error", "danger");
                    });

            });

            // Delete project
            document.getElementById('confirmDeleteProjectBtn').addEventListener('click', () => {
                const id = document.getElementById('deleteProjectId').value;
                fetch(`/admin/projects/${id}`, {
                        method: 'DELETE',
                        headers: {
                            'X-CSRF-TOKEN': '{{ csrf_token() }}',
                            'Accept': 'application/json'
                        }
                    }).then(r => r.json())
                    .then(data => {
                        if (data.success) {
                            document.getElementById('ProjectRow' + id).remove();
                            deleteModal.hide();
                            showToast(data.message, 'success');
                        }
                    });
            });

            // Open edit modal
            document.addEventListener('click', e => {
                const btn = e.target.closest('.edit-Project');
                if (!btn) return;
                const id = btn.dataset.id;
                const row = document.getElementById('ProjectRow' + id);

                document.getElementById('modalProjectId').value = id;
                document.getElementById('modalProjectTitle').textContent = row.querySelector(
                    '.Project-title').textContent;
                document.getElementById('ProjectTitleInput').value = row.querySelector('.Project-title')
                    .textContent;
                document.getElementById('ProjectShortDescriptionInput').value = row.querySelector(
                    '.Project-short').textContent;
                document.getElementById('ProjectCategoryInput').value = row.querySelector(
                    '.Project-category').dataset.id;
                document.getElementById('ProjectStatusInput').value =
                    row.querySelector('.Project-status').textContent.trim().toLowerCase();
                document.getElementById('ProjectPriceInput').value = row.querySelector('.Project-price')
                    .textContent.trim();
                document.getElementById('ProjectParkingInput').value = row.querySelector('.Project-parking')
                    .textContent.trim();
                document.getElementById('ProjectFloorInput').value = row.querySelector('.Project-floor')
                    .textContent.trim();
                document.getElementById('ProjectAreaInput').value = row.querySelector('.Project-area')
                    .textContent.trim();
                document.getElementById('ProjectBathroomsInput').value = row.querySelector(
                    '.Project-bathrooms').textContent.trim();
                document.getElementById('ProjectBedroomsInput').value = row.querySelector(
                    '.Project-bedrooms').textContent.trim();
                editDescriptionEditor.setData(row.querySelector('.Project-description').innerHTML);

                const imgs = row.querySelectorAll('.Project-image img');
                let previewHTML = '';
                imgs.forEach(i => {
                    previewHTML +=
                        `<img src="${i.src}" class="rounded border me-1 mb-1" width="100" height="100" style="object-fit:cover;">`;
                });
                document.getElementById('currentImagePreview').innerHTML = previewHTML ||
                    '<span class="text-muted small">No Image</span>';

                editModal.show();
            });

            // Open delete modal
            document.addEventListener('click', e => {
                const btn = e.target.closest('.delete-Project');
                if (!btn) return;
                document.getElementById('deleteProjectId').value = btn.dataset.id;
                document.getElementById('deleteProjectTitle').textContent =
                    document.querySelector(`#ProjectRow${btn.dataset.id} .Project-title`).textContent;
                deleteModal.show();
            });

            // Add row dynamically
            function addProjectRow(project) {
                const tbody = document.querySelector('#ProjectsTable tbody');
                const row = document.createElement('tr');
                row.id = 'ProjectRow' + project.id;
                row.classList.add('text-center');

                let imageHTML = '';
                if (Array.isArray(project.image)) {
                    project.image.forEach(img => {
                        imageHTML +=
                            `<img src="/storage/${img}" class="rounded border me-1 mb-1" width="60" height="60" style="object-fit: cover;">`;
                    });
                } else if (project.image) {
                    imageHTML =
                        `<img src="/storage/${project.image}" class="rounded border" width="60" height="60" style="object-fit: cover;">`;
                } else {
                    imageHTML = '<span class="text-muted small">{{ __("No Image") }}</span>';
                }

                row.innerHTML = `
        <td class="fw-bold">${tbody.children.length + 1}</td>
        <td class="Project-image">${imageHTML}</td>
        <td class="Project-title fw-semibold text-start">${project.title}</td>
        <td class="Project-category" data-id="${project.category_id}">${project.category ? project.category.name : '-'}</td>
        <td class="Project-status">
            <span class="badge ${project.status === 'active' ? 'bg-success' : 'bg-secondary'}">
                ${project.status.charAt(0).toUpperCase() + project.status.slice(1)}
            </span>
        </td>
        <td class="Project-price">${project.price}</td>
        <td class="Project-area">${project.area ?? ''}</td>
        <td class="Project-floor">${project.floor ?? ''}</td>
        <td class="Project-bedrooms">${project.bedrooms ?? ''}</td>
        <td class="Project-bathrooms">${project.bathrooms ?? ''}</td>
        <td class="Project-parking">${project.parking ?? ''}</td>
        <td class="Project-short small text-start">${project.short_description ?? ''}</td>
        <td class="text-center">
            <button class="btn btn-sm btn-outline-secondary edit-Project" data-id="${project.id}">
                <i class="bi bi-pencil-fill"></i>
            </button>
            <button class="btn btn-sm btn-outline-danger delete-Project" data-id="${project.id}">
                <i class="bi bi-trash-fill"></i>
            </button>
        </td>
        <td class="Project-description d-none">${project.description ?? ''}</td>
    `;
                tbody.prepend(row);
            }


            // Update existing row
            function updateProjectRow(project) {
                const row = document.getElementById('ProjectRow' + project.id);
                if (!row) return;

                row.querySelector('.Project-title').textContent = project.title;
                row.querySelector('.Project-short').textContent = project.short_description ?? '';
                row.querySelector('.Project-category').textContent = project.category ? project.category.name : '';
                row.querySelector('.Project-category').dataset.id = project.category_id;
                row.querySelector('.Project-status').innerHTML = `
                <span class="badge ${project.status === 'active' ? 'bg-success' : 'bg-secondary'}">
                    ${project.status.charAt(0).toUpperCase() + project.status.slice(1)}
                </span>`;
                row.querySelector('.Project-price').textContent = project.price;
                row.querySelector('.Project-parking').textContent = project.parking ?? '';
                row.querySelector('.Project-floor').textContent = project.floor ?? '';
                row.querySelector('.Project-area').textContent = project.area ?? '';
                row.querySelector('.Project-bathrooms').textContent = project.bathrooms ?? '';
                row.querySelector('.Project-bedrooms').textContent = project.bedrooms ?? '';
                row.querySelector('.Project-description').innerHTML = project.description ?? '';

                let imageHTML = '';
                if (Array.isArray(project.image)) {
                    project.image.forEach(img => {
                        imageHTML +=
                            `<img src="/storage/${img}" class="rounded border me-1 mb-1" width="60" height="60" style="object-fit: cover;">`;
                    });
                } else if (project.image) {
                    imageHTML =
                        `<img src="/storage/${project.image}" width="60" height="60" class="rounded border">`;
                } else {
                    imageHTML = '<span class="text-muted small">{{ __("No Image") }}</span>';
                }
                row.querySelector('.Project-image').innerHTML = imageHTML;
            }


            // Validation handling
            function showErrors(prefix, errors) {
                for (const key in errors) {
                    let cleanKey = key.includes('.') ? key.split('.')[0] : key; // لو المفتاح image.0 أو image.1
                    const field = document.getElementById(`${prefix}${capitalize(cleanKey)}`);
                    const err = document.getElementById(`${prefix}${capitalize(cleanKey)}Error`);

                    if (field && err) {
                        field.classList.add('is-invalid');
                        err.textContent = errors[key][0];
                    }
                }
            }


            function resetValidation(form) {
                form.querySelectorAll('.is-invalid').forEach(el => el.classList.remove('is-invalid'));
                form.querySelectorAll('.invalid-feedback').forEach(el => el.textContent = '');
            }

            function capitalize(str) {
                return str.charAt(0).toUpperCase() + str.slice(1);
            }
        });
    </script>

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            document.querySelectorAll('form').forEach(form => {
                form.addEventListener('submit', function(e) {
                    const btn = form.querySelector('[data-disable-on-submit]');
                    if (btn) {
                        if (btn.disabled) {
                            e.preventDefault();
                            return;
                        }

                        btn.disabled = true;
                        const originalText = btn.innerHTML;
                        btn.setAttribute('data-original-text', originalText);
                        btn.innerHTML = '{{ __("sending ...") }}';
                        setTimeout(() => {
                            btn.disabled = false;
                            btn.innerHTML = btn.getAttribute('data-original-text');
                        }, 4000);
                    }
                });
            });
        });
    </script>
@endpush
