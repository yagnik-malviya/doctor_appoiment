@component('admin.component.content')
    @slot('title') Appoiment @endslot

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

            <div class="form-group mt-3 col-6 err_patient">
                <label>Patient</label>
                <select name="patient" class="form-control">
                    <option value="">Select Patient</option>
                    @foreach ($patient as $value)
                        <option value="{{$value->id}}">{{$value->user->name}}</option>
                    @endforeach
                </select>
                <span class="text-danger mt-2 errmsg errmsg_patient"></span>
            </div>

            <div class="form-group mt-3 col-6 err_date_time">
                <label>Date & Time</label>
                <input type="datetime-local" name="date_time" class="form-control">
                <span class="text-danger mt-2 errmsg errmsg_date_time"></span>
            </div>

            <div class="form-group mt-3 col-12">
                <button class="btn btn-success" id="submitData">Submit</button>
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
                var url = '{{ route('admin.appoiment.add') }}';
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
