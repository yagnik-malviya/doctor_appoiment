<aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item">
        <a class="nav-link " href="{{route('patient.dashboard')}}">
          <i class="bi bi-grid"></i>
          <span>Dashboard</span>
        </a>
      </li>

        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#appoiment" data-bs-toggle="collapse" href="#">
                <i class="bi bi-menu-button-wide"></i><span>Appointment</span><i class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="appoiment" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                <li>
                    <a href="{{ route('patient.appoiment.add') }}">
                        <i class="bi bi-circle"></i><span>Appointment Add</span>
                    </a>
                </li>
                <li>
                    <a href="{{ route('patient.appoiment.list') }}">
                        <i class="bi bi-circle"></i><span>Appointment View</span>
                    </a>
                </li>
            </ul>
        </li>

    </ul>

  </aside>
