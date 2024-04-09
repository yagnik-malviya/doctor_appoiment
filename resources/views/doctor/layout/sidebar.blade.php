<aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item">
        <a class="nav-link " href="{{route('doctor.dashboard')}}">
          <i class="bi bi-grid"></i>
          <span>Dashboard</span>
        </a>
      </li>

      <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#patient" data-bs-toggle="collapse" href="#">
                <i class="bi bi-menu-button-wide"></i><span>Patient</span><i class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="patient" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                <li>
                    <a href="{{ route('doctor.patient.add') }}">
                        <i class="bi bi-circle"></i><span>Patient Add</span>
                    </a>
                </li>
                <li>
                    <a href="{{ route('doctor.patient.list') }}">
                        <i class="bi bi-circle"></i><span>Patient View</span>
                    </a>
                </li>
            </ul>
        </li>

        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#appoiment" data-bs-toggle="collapse" href="#">
                <i class="bi bi-menu-button-wide"></i><span>Appointment</span><i class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="appoiment" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                <li>
                    <a href="{{ route('doctor.appoiment.add') }}">
                        <i class="bi bi-circle"></i><span>Appointment Add</span>
                    </a>
                </li>
                <li>
                    <a href="{{ route('doctor.appoiment.list') }}">
                        <i class="bi bi-circle"></i><span>Appointment View</span>
                    </a>
                </li>
            </ul>
        </li>

    </ul>

  </aside>
