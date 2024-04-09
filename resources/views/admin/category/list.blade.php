@component('admin.component.content')
    @slot('title') Category @endslot

    @slot('navigation')
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
            <li class="breadcrumb-item active">List</li>
        </ol>
    @endslot

    @slot('addicon')
        {{-- <a href="{{route('admin.category.add')}}"><img src="{{asset('public/admin/icon/more.png') }}" class="mt-2" alt="" style="width: 30px"></a> --}}
    @endslot

    @slot('content')
        <table class="table">
		        <thead>
		            <tr>
		                <th> SL </th>
		                <th> Title </th>
		                <th> Action </th>
		            </tr>
		        </thead>
		        <tbody>
		        </tbody>
		    </table>
    @endslot

    @slot('js')
        <script>
            $(function () {
		        var table = $('.table').DataTable({
		            processing: true,
searching: false,
		            serverSide: true,
		            ajax: "{{ route('admin.category.list') }}",
		            columns: [
		                { data: 'DT_RowIndex', name: 'DT_RowIndex', orderable: false, searchable: false },
		                {data: 'name', name: 'name'},
		                {data: 'action',name: 'action',orderable: true,searchable: true},
		            ]
		        });
		    });

            function Delete(id)
            {
                var url = '{{ route('admin.category.delete',['id'=>':ids']) }}';
                url = url.replace(':ids',id);
                $.ajax({
                        type: 'GET',
                        url: url,
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
                        if (data.status == 1)
                        {
                            $('table').DataTable().draw(true);
                        }
                    }
                });
            }
        </script>
    @endslot
@endcomponent
