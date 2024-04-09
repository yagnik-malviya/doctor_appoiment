@component('admin.component.content')
    @slot('title') Doctor @endslot

    @slot('navigation')
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
            <li class="breadcrumb-item active">Edit</li>
        </ol>
    @endslot

    @slot('addicon')
    @endslot

    @slot('content')
        <form name="formData" class="row" onsubmit="return false;" method="POST">
            @csrf

            <div class="form-group mt-3 col-6 err_name">
                <label>Name</label>
                <input type="hidden" name="user_id" value="{{ $data->user_id }}">
                <input type="hidden" name="id" value="{{ $data->id }}">
                <input type="text" name="name" class="form-control" placeholder="Enter Name"  value="{{ $data->user->name ?? '' }}">
                <span class="text-danger mt-2 errmsg errmsg_name"></span>
            </div>

            <div class="form-group mt-3 col-6 err_email">
                <label>Email</label>
                <input type="email" name="email" class="form-control" placeholder="Enter Email" value="{{ $data->user->email ?? '' }}">
                <span class="text-danger mt-2 errmsg errmsg_email"></span>
            </div>

            <div class="form-group mt-3 col-6 err_mobile">
                <label>Mobile Number</label>
                <input type="text" name="mobile" class="form-control" placeholder="Enter Mobile Number" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\.*?)\..*/g, '$1');" value="{{ $data->user->mobile ?? '' }}">
                <span class="text-danger mt-2 errmsg errmsg_mobile"></span>
            </div>

            <div class="form-group mt-3 col-6 err_category">
                <label>Category</label>
                <div class="form-control">
                    @php
                        $category_id = json_decode($data->category_id);
                    @endphp
                    @foreach ($category as $value)
                        <input type="checkbox" name="category[]"  {{ in_array($value->id, $category_id)  ? 'checked' :'' }} class="mx-2" value="{{$value->id}}">{{$value->name}}
                    @endforeach
                </div>
                <span class="text-danger mt-2 errmsg errmsg_category"></span>
            </div>

            <div class="form-group mt-3 col-12">
                <button class="btn btn-success" id="submitData">Submit</button>
                <a href="{{route('admin.doctor.list')}}"><div class="btn btn-danger">Cancel</div></a>
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
                var url = '{{ route('admin.doctor.edit',['id'=>':ids']) }}';
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
