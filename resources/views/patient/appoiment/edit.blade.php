@component('patient.component.content')
    @slot('title') Appointment @endslot

    @slot('navigation')
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('patient.dashboard') }}">Home</a></li>
            <li class="breadcrumb-item active">Edit</li>
        </ol>
    @endslot

    @slot('addicon')
    @endslot

    @slot('content')
        <form name="formData" class="row" onsubmit="return false;" method="POST">
            @csrf
            <div class="form-group mt-3 col-4 err_category">
                <label>Category</label>
                <select name="category" class="form-control category" onchange="changecategory()">
                    <option value="">Select Category</option>
                    @foreach ($category as $value)
                        <option value="{{$value->id}}" {{$value->id == $data->category_id ? 'selected' : ''}}>{{$value->name}}</option>
                    @endforeach
                </select>
                <span class="text-danger mt-2 errmsg errmsg_category"></span>
            </div>

            <div class="form-group mt-3 col-4 err_doctor">
                <label>Doctor</label>
                <select name="doctor" class="form-control doctor">
                    <option value="">Select Doctor</option>
                </select>
                <span class="text-danger mt-2 errmsg errmsg_doctor"></span>
            </div>

            <div class="form-group mt-3 col-3 err_date_time">
                <label>Date & Time</label>
                <input type="hidden" name="id" id="id" value="{{$data->id}}">
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
                <a href="{{route('patient.appoiment.list')}}"><div class="btn btn-danger">Cancel</div></a>
            </div>

        </form>
    @endslot

    @slot('js')
        <script>
            changecategory()
            function  changecategory()
            {
                var formData = new FormData();
                var url = '{{ route('patient.appoiment.change_category') }}';
                formData.append("category", $('.category').val());
                formData.append("_token", "{{ csrf_token() }}");

                $.ajax({
                    type: "POST",
                    url: url,
                    processData: false,
                    contentType: false,
                    dataType: 'json',
                    data: formData,
                    dataSrc: "",
                    beforeSend: function() {
                        $('.loader').removeClass('d-none');
                    },
                    complete: function(data, status) {
                        $('.loader').addClass('d-none');
                    },
                    success: function(data) {
                        if (data.status == 1) {
                            var dataHtml = `<option value="">Select Doctor</option>`;
                            $.each(data.data, function(index, value)
                            {
                                var doctor_id = '{{$data->doctor_id}}';
                                var selected = ''
                                if(doctor_id == (value.id))
                                {
                                    selected = 'selected'
                                }
                                dataHtml += `<option value="${value.id}" ${selected}>${value.name}</option>`;
                            });
                            $('.doctor').html(dataHtml);
                        }
                    },
                });
            }

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
                var url = '{{ route('patient.appoiment.edit',['id'=>':ids']) }}';
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
