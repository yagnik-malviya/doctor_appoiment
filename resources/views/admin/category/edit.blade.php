@component('admin.component.content')
    @slot('title') Category @endslot

    @slot('navigation')
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
            <li class="breadcrumb-item active">Edit</li>
        </ol>
    @endslot

    @slot('addicon')
    @endslot

    @slot('content')
        <form name="formData" onsubmit="return false;" method="POST">
            @csrf

            <div class="form-group err_name">
                <label>Name</label>
                <input type="hidden" name="id" id="id" value="{{$data->id}}>">
                <input type="text" name="name" class="form-control" placeholder="New Name" value="{{$data->name}}">
                <span class="text-danger errmsg errmsg_name"></span>
            </div>

            <div class="form-group mt-3">
                <button class="btn btn-success" id="submitData">Submit</button>
                <a href="{{route('admin.category.list')}}"><div class="btn btn-danger">Cancel</div></a>
            </div>

        </form>
    @endslot

    @slot('js')
        <script>
            $('#submitData').on('click', function(e)
            {
                $('input').removeClass('border border-danger');
                $('textarea').removeClass('border border-danger');
                $('.errmsg').text('');

                $.ajaxSetup({
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                        }
                });

                var form = document.formData;
                var formData = new FormData(form);
                var url = '{{ route('admin.category.edit',['id'=>':ids']) }}';
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
