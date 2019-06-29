From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 00/10] Intel(R) Speed Select Technology
Date: Sat, 29 Jun 2019 17:29:44 +0300
Message-ID: <CAHp75VfHfpti=yC6RWvz_PPwWXVe+LSSQ0+2rXkXJApPXN+HGg@mail.gmail.com>
References: <20190626223851.19138-1-srinivas.pandruvada@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190626223851.19138-1-srinivas.pandruvada@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Andriy Shevchenko <andriy.shevchenko@intel.com>, Jonathan Corbet <corbet@lwn.net>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Alan Cox <alan@linux.intel.com>, Len Brown <lenb@kernel.org>, prarit@redhat.com, darcari@redhat.com, Linux Documentation List <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Jun 27, 2019 at 1:39 AM Srinivas Pandruvada
<srinivas.pandruvada@linux.intel.com> wrote:
>
> Intel=C2=AE Speed Select Technology (Intel=C2=AE SST) =E2=80=94 A powerfu=
l new collection of
> features giving more granular control over CPU performance for optimized =
total
> cost of ownership and performance. With Intel=C2=AE SST, one server can b=
e configured
> for power and performance for variety of diverse workload requirements. I=
n the
> Linux submission code. we are using ISST to specify Intel=C2=AE SST to av=
oid confusion
> with existing use of SST for "Smart Sound Technology".
>
> Refer to these links for overview of the technology released with some In=
tel=C2=AE Xeon=C2=AE
> Scalable processor (5218N, 6230N, and 6252N):
> https://www.intel.com/content/www/us/en/architecture-and-technology/speed=
-select-technology-article.html
> https://builders.intel.com/docs/networkbuilders/intel-speed-select-techno=
logy-base-frequency-enhancing-performance.pdf
>
> The next generation of Intel=C2=AE Xeon=C2=AE processors are adding more =
features to the
> Intel=C2=AE Speed Select Technology and allow dynamic configuration of th=
ese features
> from OS-software level instead from BIOS. This submission is adding new f=
eatures
> and dynamic configuration capabilities .
>
>
> Intel SST Features:
>
> Intel=C2=AE SST=E2=80=94Performance Profile (PP or perf-profile):
> This feature allows one server to be configured for different workload re=
quirements
> instead of deploying different servers based on the workload requirement =
reducing total
> cost of ownership. With a single server deployed, the same server can be =
reconfigured
> dynamically to one of the supported profiles to suit the specific workloa=
d requirements.
> This feature introduces a mechanism that allows multiple optimized perfor=
mance profiles
> per system via static and/or dynamic adjustment of TDP level and other pe=
rformance
> parameters.
>
> Intel=C2=AE SST=E2=80=94Core power (CP or core-power):
> An Interface that allows user to define per core priority. This defines a=
 mechanism
> to distribute power among cores when there is a power constrained scenari=
o. This defines
> a class of service configuration. Each CPU core can be tied to a class of=
 service and hence
> an associated priority.
>
> Intel=C2=AE SST=E2=80=94Base Frequency (BF or base-freq):
> The Intel=C2=AE SST-BF feature lets user control and direct base frequenc=
y. If some critical
> workload threads demand constant high guaranteed performance, then this f=
eature can be
> used to execute the thread at higher base frequency on specific set of CP=
Us.
>
> Intel=C2=AE SST=E2=80=94Turbo frequency (TF or turbo-freq):
> Enables the ability to set different all core turbo ratio limits to cores=
 based on the priority.
> Using this features some cores can be configured to get higher turbo freq=
uency by designating
> them as high priority at the cost of lower or no turbo frequency on the l=
ow priority cores.
>
> Implementation
>
> The Intel=C2=AE SST features are implemented in the firmware executing in=
 the the power
> management unit (we are calling PUNIT here for short). The mechanism to c=
ontrol these
> features are specific to firmware implementation for Intel=C2=AE Xeon=C2=
=AE CPUs and are not architectural
> features. The interface mechanism and semantics of the messages can chang=
e in future Xeon
> CPUs. Hence there is minimal kernel implementation by offering direct com=
munication
> to PUNIT via set of IOCTLs. The actual messages which can be sent to PUNI=
T are specified
> in the following document link:
>
> https://github.com/intel/CommsPowerManagement/blob/master/intel_sst_os_in=
terface/mailbox.md
>
> The idea here is that user space software like cloud orchestration softwa=
re based on their workload
> requirement configure the system. There is a full featured "Intel Speed S=
elect" utility
> submitted to kernel power tools, which can be used to validate and exerci=
se the features.
>
> Types of PUNIT interfaces
> There are two types of interfaces. One using Mail box communications, whi=
ch is facilitated
> by a PCI device or in some Xeon=C2=AE CPUs using MSRs; and other using an=
 MMIO interface, which is
> used primarily for core prioritization. For hiding details a single chara=
cter device is created
> to handle IOCTLs. The following block diagram shows the implementation ov=
erview.
>
>
> User            User Space tool(intel-speed-select)/Cloud Orchestration s=
oftware
>                                            IOCTLs
> ---------------------------------------character device------------------=
------------
> kernel                          Common driver handling IOCTLs
>                         Mail Box drivers(PCI & MSR)     PCI MMIO driver
> -------------------------------------------------------------------------=
-
> Hardware                                    PUNIT
>
>
>

Pushed to my review and testing queue, thanks!

> Srinivas Pandruvada (10):
>   platform/x86: ISST: Update ioctl-number.txt for Intel Speed Select
>     interface
>   platform/x86: ISST: Add common API to register and handle ioctls
>   platform/x86: ISST: Store per CPU information
>   platform/x86: ISST: Add IOCTL to Translate Linux logical CPU to PUNIT
>     CPU number
>   platform/x86: ISST: Add Intel Speed Select mmio interface
>   platform/x86: ISST: Add Intel Speed Select mailbox interface via PCI
>   platform/x86: ISST: Add Intel Speed Select mailbox interface via MSRs
>   platform/x86: ISST: Add Intel Speed Select PUNIT MSR interface
>   platform/x86: ISST: Restore state on resume
>   tools/power/x86: A tool to validate Intel Speed Select commands
>
>  Documentation/ioctl/ioctl-number.txt          |    1 +
>  drivers/platform/x86/Kconfig                  |    2 +
>  drivers/platform/x86/Makefile                 |    1 +
>  .../x86/intel_speed_select_if/Kconfig         |   17 +
>  .../x86/intel_speed_select_if/Makefile        |   10 +
>  .../intel_speed_select_if/isst_if_common.c    |  672 +++++++
>  .../intel_speed_select_if/isst_if_common.h    |   69 +
>  .../intel_speed_select_if/isst_if_mbox_msr.c  |  216 +++
>  .../intel_speed_select_if/isst_if_mbox_pci.c  |  214 +++
>  .../x86/intel_speed_select_if/isst_if_mmio.c  |  180 ++
>  include/uapi/linux/isst_if.h                  |  172 ++
>  tools/power/x86/intel_speed_select/Makefile   |   31 +
>  tools/power/x86/intel_speed_select/isst.h     |  231 +++
>  .../x86/intel_speed_select/isst_config.c      | 1607 +++++++++++++++++
>  .../power/x86/intel_speed_select/isst_core.c  |  721 ++++++++
>  .../x86/intel_speed_select/isst_display.c     |  479 +++++
>  16 files changed, 4623 insertions(+)
>  create mode 100644 drivers/platform/x86/intel_speed_select_if/Kconfig
>  create mode 100644 drivers/platform/x86/intel_speed_select_if/Makefile
>  create mode 100644 drivers/platform/x86/intel_speed_select_if/isst_if_co=
mmon.c
>  create mode 100644 drivers/platform/x86/intel_speed_select_if/isst_if_co=
mmon.h
>  create mode 100644 drivers/platform/x86/intel_speed_select_if/isst_if_mb=
ox_msr.c
>  create mode 100644 drivers/platform/x86/intel_speed_select_if/isst_if_mb=
ox_pci.c
>  create mode 100644 drivers/platform/x86/intel_speed_select_if/isst_if_mm=
io.c
>  create mode 100644 include/uapi/linux/isst_if.h
>  create mode 100644 tools/power/x86/intel_speed_select/Makefile
>  create mode 100644 tools/power/x86/intel_speed_select/isst.h
>  create mode 100644 tools/power/x86/intel_speed_select/isst_config.c
>  create mode 100644 tools/power/x86/intel_speed_select/isst_core.c
>  create mode 100644 tools/power/x86/intel_speed_select/isst_display.c
>
> --
> 2.17.2
>


--=20
With Best Regards,
Andy Shevchenko
