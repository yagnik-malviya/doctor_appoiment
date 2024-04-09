@component('patient.component.auth')
    @slot('meta')
        <title>Register</title>
    @endslot

    @slot('cardTitle')
    @endslot
    {{-- @slot('cardTitle') Login to Your Account @endslot --}}

    @slot('cardText')
    @endslot
    {{-- @slot('cardText') Enter your username & password to login @endslot --}}

    @slot('form')
        <form class="row g-3 needs-validation" name="formData" onsubmit="return false;" method="POST">
            @csrf

            <div class="col-12 err_name">
                <label for="yourPassword" class="form-label">Name</label>
                <input type="text" name="name" class="form-control" placeholder="Enter Name">
                <span class="text-danger errmsg errmsg_name"></span>
            </div>

            <div class="col-12 err_email">
                <label for="yourPassword" class="form-label">Email</label>
                <input type="email" name="email" class="form-control" placeholder="Enter Email">
                <span class="text-danger errmsg errmsg_email"></span>
            </div>

            <div class="col-12 err_mobile">
                <label for="yourPassword" class="form-label">Mobile No.</label>
                <input type="text" name="mobile" class="form-control" placeholder="Enter Mobile">
                <span class="text-danger errmsg errmsg_mobile"></span>
            </div>

            <div class="col-12 err_password">
                <label for="yourPassword" class="form-label">Password</label>
                <input type="password" name="password" class="form-control" placeholder="Enter Password">
                <span class="text-danger errmsg errmsg_password"></span>
            </div>

            <div class="col-12 err_conform_password">
                <label for="yourPassword" class="form-label">Conform Password</label>
                <input type="password" name="conform_password" class="form-control" placeholder="Conform Password">
                <span class="text-danger errmsg errmsg_conform_password"></span>
            </div>

            <div class="col-12 text-end">
                <p class="small mb-0"><a href="{{ route('admin.forgot_password') }}">Forgot Password</a></p>
            </div>

            <div class="col-12">
                <button class="btn btn-primary w-100" type="submit" id="submitData">Sign Up</button>
                <div class="w-100 text-center mt-3">
                    <a href="{{route('patient.login')}}" class="test-center w-100">Login In</a>
                </div>
            </div>
        </form>
    @endslot

    @slot('js')
        <script>
            $('#submitData').on('click', function(e) {

                $('input').removeClass('border border-danger');
                $('.errmsg').text('');

                $.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    }
                });

                var form = document.formData;
                var formData = new FormData(form);
                var url = '{{ route('patient.register') }}';
                $.ajax({
                    type: 'POST',
                    url: url,
                    processData: false,
                    contentType: false,
                    dataType: 'json',
                    data: formData,
                    dataSrc: "",
                    beforeSend: function() {
                        $('#loader').removeClass('d-none');
                    },
                    complete: function(data, status) {
                        $('#loader').addClass('d-none');
                    },
                    success: function(data) {
                        if (data.status == 401) {
                            $.each(data.error1, function(index, value) {
                                $('.err_' + index + ' input').addClass('border border-danger');
                                $('.err_' + index + ' select').addClass('border-danger');
                                $('.err_' + index + ' textarea').addClass('border border-danger');
                                $('.errmsg_' + index).text(value);
                            });
                        }
                        if (data.status == 1) {
                            window.location.href = data.redirect;
                        }
                    }
                });
            });
        </script>
    @endslot
@endcomponent
