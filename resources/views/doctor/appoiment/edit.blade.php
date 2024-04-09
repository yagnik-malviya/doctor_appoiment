@component('doctor.component.content')
    @slot('title') Appointment @endslot

    @slot('navigation')
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('doctor.dashboard') }}">Home</a></li>
            <li class="breadcrumb-item active">Edit</li>
        </ol>
    @endslot

    @slot('addicon')
    @endslot

    @slot('content')
        <form name="formData" class="row" onsubmit="return false;" method="POST">
            @csrf

            <div class="form-group mt-3 col-6 err_patient">
                <label>Patient</label>
                <select name="patient" class="form-control">
                    <option value="">Select Patient</option>
                    @foreach ($patient as $value)
                        <option value="{{$value->id}}" {{$value->id == $data->patient_id ? 'selected' : ''}}>{{$value->user->name}}</option>
                    @endforeach
                </select>
                <span class="text-danger mt-2 errmsg errmsg_patient"></span>
            </div>

            <div class="form-group mt-3 col-6 err_date_time">
                <label>Date & Time</label>
                <input type="hidden" name="id" id="id"  value="{{$data->id}}">
                <input type="date" name="date_time" class="form-control" value="{{$data->date_time}}">
                <span class="text-danger mt-2 errmsg errmsg_date_time"></span>
            </div>

            <div class="form-group mt-3 col-6 err_slot">
                <label>Slot</label>
                <select name="slot" class="form-control">
                    <option value="">Select Slot</option>
                    @foreach ($slot as $value)
                        <option value="{{$value->id}}" {{$data->slot_id == $value->id ? 'selected' : ''}}>{{$value->slot}}</option>
                    @endforeach
                </select>
                <span class="text-danger mt-2 errmsg errmsg_slot"></span>
            </div>

            <div class="form-group mt-3 col-12">
                <button class="btn btn-success" id="submitData">Submit</button>
                <a href="{{route('doctor.appoiment.list')}}"><div class="btn btn-danger">Cancel</div></a>
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
                var url = '{{ route('doctor.appoiment.edit',['id'=>':ids']) }}';
                url = url.replace(':ids',$('#id').val());
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
