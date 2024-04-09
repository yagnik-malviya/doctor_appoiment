@component('patient.component.content')
    @slot('title') Appointment @endslot

    @slot('navigation')
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('patient.dashboard') }}">Home</a></li>
            <li class="breadcrumb-item active">List</li>
        </ol>
    @endslot

    @slot('addicon')
        {{-- <a href="{{route('patient.patient.add')}}"><img src="{{asset('public/doctor/icon/more.png') }}" class="mt-2" alt="" style="width: 30px"></a> --}}
    @endslot

    @slot('content')
        <table class="table">
		        <thead>
		            <tr>
		                <th> SL </th>
		                <th> Appointment Date </th>
		                <th> Slot </th>
		                <th> Status </th>
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
		            ajax: "{{ route('patient.appoiment.list') }}",
		            columns: [
		                { data: 'DT_RowIndex', name: 'DT_RowIndex', orderable: false, searchable: false },
		                {data: 'date', name: 'date', orderable: false, searchable: false },
		                {data: 'slot', name: 'slot', orderable: false, searchable: false },
		                {data: 'status', name: 'status',orderable: true,searchable: true},
		                {data: 'action',name: 'action',orderable: true,searchable: true},
		            ]
		        });
		    });

            function Delete(id)
            {
                var url = '{{ route('patient.appoiment.delete',['id'=>':ids']) }}';
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

            function changestatus(data){
                var url = '{{ route('patient.appoiment.changestatus')}}'

                var id = $(data).attr('data_id');
                var status = $(data).val();

                $.ajax({
                        type: 'GET',
                        url: url,
                        data: {id:id,status:status},
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
