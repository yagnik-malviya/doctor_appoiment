@component('doctor.component.content')
    @slot('title')
        Prescription
    @endslot

    @slot('navigation')
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('doctor.dashboard') }}">Home</a></li>
            <li class="breadcrumb-item active">Add</li>
        </ol>
    @endslot

    @slot('addicon')
    @endslot

    @slot('content')
        <form name="formData" class="row" onsubmit="return false;" method="POST">
            @csrf

            <input type="hidden" name="appoiment_id" value="{{ $appoiment_id ?? '' }}" />
            <input type="hidden" name="id" value="{{ $data->id ?? '' }}" />
            <div class="form-group col-12 err_prescription">
                <label>Prescription</label>
                <textarea name="prescription" class="form-control" rows="4">{!! $data->text ?? '' !!}</textarea>
                <span class="text-danger mt-2 errmsg errmsg_prescription"></span>
            </div>

            <div class="form-group mt-3 text-end col-12">
                <button class="btn btn-success" id="submitData">Submit</button>
            </div>

        </form>
    @endslot
    @slot('js')
        <script>
            $('#submitData').on('click', function(e) {

                $('textarea').removeClass('border border-danger');
                $('.errmsg').text('');

                $.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    }
                });
                var form = document.formData;
                var formData = new FormData(form);

                var url = '{{ route('doctor.prescription.add') }}';
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
