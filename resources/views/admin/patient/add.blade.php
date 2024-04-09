@component('admin.component.content')
    @slot('title') Patient @endslot

    @slot('navigation')
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
            <li class="breadcrumb-item active">Add</li>
        </ol>
    @endslot

    @slot('addicon')
    @endslot

    @slot('content')
        <form name="formData" class="row" onsubmit="return false;" method="POST">
            @csrf

            <div class="form-group mt-3 col-6 err_doctor">
                <label>Doctor</label>
                <select name="doctor" class="form-control">
                    <option value="">Select Doctor</option>
                    @foreach ($doctor as $value)
                        <option value="{{$value->id}}">{{$value->user->name}}</option>
                    @endforeach
                </select>
                <span class="text-danger mt-2 errmsg errmsg_doctor"></span>
            </div>

            <div class="form-group mt-3 col-6 err_name">
                <label>Name</label>
                <input type="text" name="name" class="form-control" placeholder="Enter Name">
                <span class="text-danger mt-2 errmsg errmsg_name"></span>
            </div>

            <div class="form-group mt-3 col-6 err_email">
                <label>Email</label>
                <input type="email" name="email" class="form-control" placeholder="Enter Email">
                <span class="text-danger mt-2 errmsg errmsg_email"></span>
            </div>

            <div class="form-group mt-3 col-6 err_mobile">
                <label>Mobile Number</label>
                <input type="text" name="mobile" class="form-control" placeholder="Enter Mobile Number" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\.*?)\..*/g, '$1');">
                <span class="text-danger mt-2 errmsg errmsg_mobile"></span>
            </div>

            <div class="form-group mt-3 col-12">
                <button class="btn btn-success" id="submitData">Submit</button>
                <a href="{{route('admin.patient.list')}}"><div class="btn btn-danger">Cancel</div></a>
            </div>

        </form>
    @endslot

    @slot('js')
        <script>
            $('#submitData').on('click', function(e)
            {

                $('input').removeClass('border border-danger');
                $('select').removeClass('border-danger');
                $('textarea').removeClass('border border-danger');
                $('.errmsg').text('');

                $.ajaxSetup({
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                        }
                });

                var form = document.formData;
                var formData = new FormData(form);
                var url = '{{ route('admin.patient.add') }}';
                $.ajax({
                        type: 'POST',
                        url: url,
                        processData: false,
                        contentType: false,
                        dataType: 'json',
                        data: formData,
                        dataSrc: "",
                        beforeSend: function()
                        {
                            $('#loader').removeClass('d-none');
                        },
                        complete: function(data, status)
                        {
                            $('#loader').addClass('d-none');
                        },
                        success: function(data)
                        {
                        if (data.status == 401)
                        {
                            $.each(data.error1, function(index, value)
                            {
                                $('.err_' + index + ' input').addClass('border border-danger');
                                $('.err_' + index + ' select').addClass('border-danger');
                                $('.err_' + index + ' textarea').addClass('border border-danger');
                                $('.errmsg_'+index).text(value);
                            });
                        }
                        if (data.status == 1)
                        {
                            window.location.href = data.redirect;
                        }
                    }
                });
            });
        </script>
    @endslot
@endcomponent
