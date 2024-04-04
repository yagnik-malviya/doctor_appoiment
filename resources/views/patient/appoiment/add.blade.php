@component('patient.component.content')
    @slot('title') Appoiment @endslot

    @slot('navigation')
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('patient.dashboard') }}">Home</a></li>
            <li class="breadcrumb-item active">Add</li>
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
                        <option value="{{$value->id}}">{{$value->name}}</option>
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

            <div class="form-group mt-3 col-4 err_date_time">
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
                                dataHtml += `<option value="${value.id}">${value.name}</option>`;
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
                var url = '{{ route('patient.appoiment.add') }}';
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
