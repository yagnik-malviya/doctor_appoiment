@component('patient.component.content')
    @slot('title')
        Prescription
    @endslot

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

            <input type="hidden" name="appoiment_id" value="{{ $appoiment_id ?? '' }}" />
            <input type="hidden" name="id" value="{{ $data->id ?? '' }}" />
            <div class="form-group col-12 err_prescription">
                <label>Prescription</label>
                <textarea name="prescription" class="form-control" rows="4">{!! $data->text ?? '' !!}</textarea>
                <span class="text-danger mt-2 errmsg errmsg_prescription"></span>
            </div>
        </form>
    @endslot
    @slot('js')
    @endslot
@endcomponent
