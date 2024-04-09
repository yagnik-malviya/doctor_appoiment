@component('doctor.component.content')
    @slot('title')
        Dashboard
    @endslot

    @slot('navigation')
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('doctor.dashboard') }}">Home</a></li>
            <li class="breadcrumb-item active">Dashboard</li>
        </ol>
    @endslot

    @slot('addicon')
    @endslot

    @slot('content')
        <section class="section dashboard">
            <div class="row">

                @php
                    $appoiment_data = [
                        ['title' => 'Total Patient', 'count' => $patient],
                        ['title' => 'Total Appointment', 'count' => $all],
                        ['title' => 'Pending Appointment', 'count' => $pending],
                        ['title' => 'Approve Appointment', 'count' => $approve],
                        ['title' => 'Reject Appointment', 'count' => $reject],
                    ];
                @endphp
                <div class="col-lg-12">
                    <div class="row">
                        @foreach ($appoiment_data as $value)
                        <div class="col-xxl-3 col-xl-12">
                            <div class="card info-card customers-card">
                                <div class="card-body">
                                    <h5 class="card-title">{{$value['title']}}</h5>
                                    <div class="d-flex align-items-center">
                                        <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                            <i class="bi bi-people"></i>
                                        </div>
                                        <div class="ps-3">
                                            <h6>{{$value['count']}}</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </section>
    @endslot

    @slot('js')

    @endslot
@endcomponent
