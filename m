Received: from mail-106121.protonmail.ch (mail-106121.protonmail.ch [79.135.106.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F88F4963D7
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 08:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778575270; cv=none; b=Ck7GVngVPYErQPwPn77iGNkW+k17u9IbYkQHZ2wCUfrdOtQGack2wWTxKLlCJbV1P4NWJUqzNpuBYQmLHILOmBKhSCSqs4MErfowHqXJjhjLqwdFnvuOXXj91khhmp+MyuL7qLmpU2JO1mD/os2yMPgAcpbgzxLalIy1sxVJ0MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778575270; c=relaxed/simple;
	bh=7XALdlDD2bxy31ACEPO5bjgYi1Rc79dWt/+PhmMiHX8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C393X8MoZfJ2VYqGh/hhbLBPQqc4G6MCxk+sXYa6OrH/+lhHOeiAiG0WwZIQ6NVcLf4eppqOVddWrdeR9fdxmWb74on+IMseDhE5FxLPW1IvdY/iYRZBrBt/EKDEGxABT50N/Ha4xMR/s/Zl9AzN+cTULwLg+yvcYoJFyEMOaoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=fDIUcmm6; arc=none smtp.client-ip=79.135.106.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="fDIUcmm6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1778575225; x=1778834425;
	bh=zTNPMecVLgYq0BEuua4u21AHSLFUcdZUWq6J8UsR/iY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=fDIUcmm6U6b8jP4iSYEyp4fnO/I7dGNLASLoPpE5c4ZAPmkP50JQYGqtzhVykNoVC
	 Pqy5c26hU2COAAUFl2/nApXY/9cxpw5P5FvTG0qaNdBkfaCFLaTBpPx7Iv3rLIvsvW
	 vJ0sbd6ppzBmacvkcqY0nrwy6SfptQjbktUiGBWDqrXgwFxdt+sE3GSoX0nYeZ7hG0
	 oB2s/5Rle5k0efVCfC/UCBY+QfGz0WDVq3wZFRFpr2bQBpMYDPmlNFMskv8aElQIre
	 +pWb1Um6cTJQnY8p4nmimFTVOwVPq9ju51abkrxQdCAR3pmLM9+urq7uMgtowOedny
	 DS7B1IvlZ2e1g==
Date: Tue, 12 May 2026 08:40:16 +0000
To: srinivas.pandruvada@linux.intel.com, fabio.m.de.francesco@linux.intel.com, rafael@kernel.org
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: noor.u.mubeen@intel.com, vinod.gomathinayagam@intel.com, deepak.sundar@intel.com, mohsin.shariff@intel.com, kloczek@github.com, xiaqinxin@huawei.com, jack@jackkelly.name, rui.zhang@intel.com, baohua@kernel.org, colin.i.king@gmail.com, libin3479@gmail.com, m.szyprowski@samsung.com, ali.erdinc.koroglu@intel.com, admin@ptr1337.dev, maciej.wieczor-retman@intel.com, venkatesh.j@intel.com, ThatQubicFox@protonmail.com, trenn@suse.de, jengelh@inai.de, robert.dower@intel.com, hpa@redhat.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, m.wieczorretman@pm.me
Subject: [PATCH v1 1/3] tools/LPMD: Add Intel Low Power Mode Daemon
Message-ID: <834c9f22f0f9cf57d681ee52fa235276cefa5bd4.1778560215.git.m.wieczorretman@pm.me>
In-Reply-To: <cover.1778560215.git.m.wieczorretman@pm.me>
References: <cover.1778560215.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 616a3159a33d15ffa056eecaa76ad07ac73a83cc
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>

Add the Intel Low Power Mode Daemon (intel-lpmd) userspace tool.
Intel LPMD monitors system activity and dynamically constrains
tasks to the most power-efficient CPU cores during low utilization
periods, reducing package power consumption.

Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>
Co-developed-by: Ali Erdin=C3=A7 K=C3=B6ro=C4=9Flu <ali.erdinc.koroglu@inte=
l.com>
Signed-off-by: Ali Erdin=C3=A7 K=C3=B6ro=C4=9Flu <ali.erdinc.koroglu@intel.=
com>
Co-developed-by: Bin Li <libin3479@gmail.com>
Signed-off-by: Bin Li <libin3479@gmail.com>
Co-developed-by: Colin Ian King <colin.i.king@gmail.com>
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
Co-developed-by: Gomathinayagam, Vinod <vinod.gomathinayagam@intel.com>
Signed-off-by: Gomathinayagam, Vinod <vinod.gomathinayagam@intel.com>
Co-developed-by: Jack Kelly <jack@jackkelly.name>
Signed-off-by: Jack Kelly <jack@jackkelly.name>
Co-developed-by: Jan Engelhardt <jengelh@inai.de>
Signed-off-by: Jan Engelhardt <jengelh@inai.de>
Co-developed-by: Kate Hsuan <hpa@redhat.com>
Signed-off-by: Kate Hsuan <hpa@redhat.com>
Co-developed-by: Mohsin Shariff <mohsin.shariff@intel.com>
Signed-off-by: Mohsin Shariff <mohsin.shariff@intel.com>
Co-developed-by: Mubeen, Noor U <noor.u.mubeen@intel.com>
Signed-off-by: Mubeen, Noor U <noor.u.mubeen@intel.com>
Co-developed-by: Peter Jung <admin@ptr1337.dev>
Signed-off-by: Peter Jung <admin@ptr1337.dev>
Co-developed-by: Qubic <ThatQubicFox@protonmail.com>
Signed-off-by: Qubic <ThatQubicFox@protonmail.com>
Co-developed-by: Robert Dower <robert.dower@intel.com>
Signed-off-by: Robert Dower <robert.dower@intel.com>
Co-developed-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Co-developed-by: Sundar, Deepak <deepak.sundar@intel.com>
Signed-off-by: Sundar, Deepak <deepak.sundar@intel.com>
Co-developed-by: Thomas Renninger <trenn@suse.de>
Signed-off-by: Thomas Renninger <trenn@suse.de>
Co-developed-by: Tomasz K=C5=82oczko <kloczek@github.com>
Signed-off-by: Tomasz K=C5=82oczko <kloczek@github.com>
Co-developed-by: Venkatesh J <venkatesh.j@intel.com>
Signed-off-by: Venkatesh J <venkatesh.j@intel.com>
Co-developed-by: Zhang Rui <rui.zhang@intel.com>
Signed-off-by: Zhang Rui <rui.zhang@intel.com>
Co-developed-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
 MAINTAINERS                                   |   6 +
 tools/power/x86/intel-lpmd/README.md          | 182 +++++
 .../x86/intel-lpmd/data/intel_lpmd.service.in |  19 +
 .../x86/intel-lpmd/data/intel_lpmd_config.xml | 106 +++
 .../data/intel_lpmd_config_F6_M170.xml        | 166 ++++
 .../data/intel_lpmd_config_F6_M189.xml        | 188 +++++
 .../data/intel_lpmd_config_F6_M204.xml        | 213 +++++
 .../data/intel_lpmd_config_examples.xml       | 213 +++++
 .../data/intel_lpmd_config_experimental.xml   | 252 ++++++
 .../data/org.freedesktop.intel_lpmd.conf      |  20 +
 .../org.freedesktop.intel_lpmd.service.in     |   5 +
 tools/power/x86/intel-lpmd/doc/WLT_proxy.md   |  84 ++
 .../intel-lpmd/lpmd-resource.gresource.xml    |   6 +
 tools/power/x86/intel-lpmd/man/intel_lpmd.8   |  79 ++
 .../intel-lpmd/man/intel_lpmd_config.xml.5    | 329 ++++++++
 .../x86/intel-lpmd/man/intel_lpmd_control.8   |  44 ++
 tools/power/x86/intel-lpmd/src/include/lpmd.h | 408 ++++++++++
 .../x86/intel-lpmd/src/include/thermal.h      |  94 +++
 .../src/intel_lpmd_dbus_interface.xml         |  27 +
 tools/power/x86/intel-lpmd/src/lpmd_cgroup.c  | 213 +++++
 tools/power/x86/intel-lpmd/src/lpmd_config.c  | 493 ++++++++++++
 tools/power/x86/intel-lpmd/src/lpmd_cpu.c     | 481 +++++++++++
 tools/power/x86/intel-lpmd/src/lpmd_cpumask.c | 479 +++++++++++
 .../x86/intel-lpmd/src/lpmd_dbus_server.c     | 274 +++++++
 tools/power/x86/intel-lpmd/src/lpmd_helpers.c | 385 +++++++++
 tools/power/x86/intel-lpmd/src/lpmd_hfi.c     | 373 +++++++++
 tools/power/x86/intel-lpmd/src/lpmd_irq.c     | 262 ++++++
 tools/power/x86/intel-lpmd/src/lpmd_main.c    | 297 +++++++
 tools/power/x86/intel-lpmd/src/lpmd_misc.c    | 483 +++++++++++
 tools/power/x86/intel-lpmd/src/lpmd_proc.c    | 492 ++++++++++++
 tools/power/x86/intel-lpmd/src/lpmd_socket.c  | 149 ++++
 .../x86/intel-lpmd/src/lpmd_state_machine.c   | 747 ++++++++++++++++++
 tools/power/x86/intel-lpmd/src/lpmd_uevent.c  | 133 ++++
 tools/power/x86/intel-lpmd/src/lpmd_util.c    | 369 +++++++++
 tools/power/x86/intel-lpmd/src/lpmd_wlt.c     | 107 +++
 .../src/wlt_proxy/include/state_common.h      | 106 +++
 .../src/wlt_proxy/include/wlt_proxy.h         |  10 +
 .../x86/intel-lpmd/src/wlt_proxy/spike_mgmt.c | 202 +++++
 .../intel-lpmd/src/wlt_proxy/state_machine.c  | 314 ++++++++
 .../intel-lpmd/src/wlt_proxy/state_manager.c  | 302 +++++++
 .../x86/intel-lpmd/src/wlt_proxy/state_util.c | 584 ++++++++++++++
 .../x86/intel-lpmd/src/wlt_proxy/wlt_proxy.c  |  31 +
 .../intel-lpmd/tests/lpm_test_interface.sh    |  64 ++
 .../x86/intel-lpmd/tools/intel_lpmd_control.c |  97 +++
 44 files changed, 9888 insertions(+)
 create mode 100644 tools/power/x86/intel-lpmd/README.md
 create mode 100644 tools/power/x86/intel-lpmd/data/intel_lpmd.service.in
 create mode 100644 tools/power/x86/intel-lpmd/data/intel_lpmd_config.xml
 create mode 100644 tools/power/x86/intel-lpmd/data/intel_lpmd_config_F6_M1=
70.xml
 create mode 100644 tools/power/x86/intel-lpmd/data/intel_lpmd_config_F6_M1=
89.xml
 create mode 100644 tools/power/x86/intel-lpmd/data/intel_lpmd_config_F6_M2=
04.xml
 create mode 100644 tools/power/x86/intel-lpmd/data/intel_lpmd_config_examp=
les.xml
 create mode 100644 tools/power/x86/intel-lpmd/data/intel_lpmd_config_exper=
imental.xml
 create mode 100644 tools/power/x86/intel-lpmd/data/org.freedesktop.intel_l=
pmd.conf
 create mode 100644 tools/power/x86/intel-lpmd/data/org.freedesktop.intel_l=
pmd.service.in
 create mode 100644 tools/power/x86/intel-lpmd/doc/WLT_proxy.md
 create mode 100644 tools/power/x86/intel-lpmd/lpmd-resource.gresource.xml
 create mode 100644 tools/power/x86/intel-lpmd/man/intel_lpmd.8
 create mode 100644 tools/power/x86/intel-lpmd/man/intel_lpmd_config.xml.5
 create mode 100644 tools/power/x86/intel-lpmd/man/intel_lpmd_control.8
 create mode 100644 tools/power/x86/intel-lpmd/src/include/lpmd.h
 create mode 100644 tools/power/x86/intel-lpmd/src/include/thermal.h
 create mode 100644 tools/power/x86/intel-lpmd/src/intel_lpmd_dbus_interfac=
e.xml
 create mode 100644 tools/power/x86/intel-lpmd/src/lpmd_cgroup.c
 create mode 100644 tools/power/x86/intel-lpmd/src/lpmd_config.c
 create mode 100644 tools/power/x86/intel-lpmd/src/lpmd_cpu.c
 create mode 100644 tools/power/x86/intel-lpmd/src/lpmd_cpumask.c
 create mode 100644 tools/power/x86/intel-lpmd/src/lpmd_dbus_server.c
 create mode 100644 tools/power/x86/intel-lpmd/src/lpmd_helpers.c
 create mode 100644 tools/power/x86/intel-lpmd/src/lpmd_hfi.c
 create mode 100644 tools/power/x86/intel-lpmd/src/lpmd_irq.c
 create mode 100644 tools/power/x86/intel-lpmd/src/lpmd_main.c
 create mode 100644 tools/power/x86/intel-lpmd/src/lpmd_misc.c
 create mode 100644 tools/power/x86/intel-lpmd/src/lpmd_proc.c
 create mode 100644 tools/power/x86/intel-lpmd/src/lpmd_socket.c
 create mode 100644 tools/power/x86/intel-lpmd/src/lpmd_state_machine.c
 create mode 100644 tools/power/x86/intel-lpmd/src/lpmd_uevent.c
 create mode 100644 tools/power/x86/intel-lpmd/src/lpmd_util.c
 create mode 100644 tools/power/x86/intel-lpmd/src/lpmd_wlt.c
 create mode 100644 tools/power/x86/intel-lpmd/src/wlt_proxy/include/state_=
common.h
 create mode 100644 tools/power/x86/intel-lpmd/src/wlt_proxy/include/wlt_pr=
oxy.h
 create mode 100644 tools/power/x86/intel-lpmd/src/wlt_proxy/spike_mgmt.c
 create mode 100644 tools/power/x86/intel-lpmd/src/wlt_proxy/state_machine.=
c
 create mode 100644 tools/power/x86/intel-lpmd/src/wlt_proxy/state_manager.=
c
 create mode 100644 tools/power/x86/intel-lpmd/src/wlt_proxy/state_util.c
 create mode 100644 tools/power/x86/intel-lpmd/src/wlt_proxy/wlt_proxy.c
 create mode 100755 tools/power/x86/intel-lpmd/tests/lpm_test_interface.sh
 create mode 100644 tools/power/x86/intel-lpmd/tools/intel_lpmd_control.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 2fb1c75afd16..f7181ff4ad8c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13099,6 +13099,12 @@ F:=09drivers/spi/spi-ljca.c
 F:=09drivers/usb/misc/usb-ljca.c
 F:=09include/linux/usb/ljca.h
=20
+INTEL LOW POWER MODE DAEMON (intel-lpmd)
+M:=09Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
+L:=09platform-driver-x86@vger.kernel.org
+S:=09Maintained
+F:=09tools/power/x86/intel-lpmd/
+
 INTEL MANAGEMENT ENGINE (mei)
 M:=09Alexander Usyskin <alexander.usyskin@intel.com>
 L:=09linux-kernel@vger.kernel.org
diff --git a/tools/power/x86/intel-lpmd/README.md b/tools/power/x86/intel-l=
pmd/README.md
new file mode 100644
index 000000000000..fb420e8184a1
--- /dev/null
+++ b/tools/power/x86/intel-lpmd/README.md
@@ -0,0 +1,182 @@
+# Intel Low Power Mode Daemon
+
+Intel Low Power Mode Daemon (lpmd) is a Linux daemon designed to optimize =
active
+idle power. It selects the most power-efficient CPUs based on a configurat=
ion
+file or CPU topology. Depending on system utilization and other hints, it =
puts
+the system into Low Power Mode by activating the power-efficient CPUs and
+disabling the rest, and restores the system from Low Power Mode by activat=
ing
+all CPUs.
+
+## Before You Start
+
+**Please note** that the installed configuration files serve as templates =
of
+best practices for specific platform models and disable lpmd by default. F=
or
+LPMD to start the user is expected to either edit the main
+"intel_lpmd_config.xml" config file or after starting the program, enable =
LPMD
+by using the intel_lpmd_control tool.
+
+Refer to the man pages for command line arguments and XML configurations:
+
+```sh
+man intel_lpmd
+man intel_lpmd_control
+man intel_lpmd_config.xml
+```
+
+## Install Dependencies
+
+### Fedora
+
+```sh
+dnf install automake autoconf-archive gcc glib2-devel libxml2-devel libnl3=
-devel systemd-devel gtk-doc upower-devel
+```
+
+### Ubuntu
+
+```sh
+sudo apt install autoconf autoconf-archive gcc libglib2.0-dev libdbus-1-de=
v libxml2-dev libnl-3-dev libnl-genl-3-dev libsystemd-dev gtk-doc-tools lib=
upower-glib-dev
+```
+
+### OpenSUSE
+
+```sh
+zypper in automake gcc
+```
+
+## Build and Install
+
+```sh
+./autogen.sh
+make
+sudo make install
+```
+
+The generated artifacts are copied to respective directories under `/usr/l=
ocal`.
+If a custom install path is preferred other than system default,  make sur=
e
+`--localstatedir` and `--sysconfdir` are set to the right path that the sy=
stem
+can understand. If installed via RPM then artifacts would be under `/usr`.
+
+Example command for installation using prefix under `/opt/lpmd_install` di=
r with
+`--localstatedir` and `--sysconfdir` set to system default
+
+```sh
+./autogen.sh prefix=3D/opt/lpmd_install --localstatedir=3D/var --sysconfdi=
r=3D/etc
+```
+
+## Run
+
+### Start Service
+
+```sh
+sudo systemctl start intel_lpmd.service
+```
+
+### Get Status
+
+```sh
+sudo systemctl status intel_lpmd.service
+```
+
+### Stop Service
+
+```sh
+sudo systemctl stop intel_lpmd.service
+```
+
+### Terminate using DBUS Interface
+
+```sh
+sudo tests/lpm_test_interface.sh 1
+```
+
+## Testing Installation from Source
+
+Launch `lpmd` in no-daemon mode:
+```sh
+./intel_lpmd --no-daemon --dbus-enable --loglevel=3Ddebug
+```
+
+Start `lpmd` using:
+```sh
+sudo sh tests/lpm_test_interface.sh 4
+```
+
+Run a workload and monitor `lpmd` to ensure it puts the system in the
+appropriate state based on the load.
+
+## Releases
+
+### Release 0.1.0
+- Add support for Panther Lake
+
+### Release 0.0.9
+
+- Fix lpmd from processing HFI/WLT updates when it is not in auto mode.
+- Improve README and other documents.
+- Add support for graphics utilization detection.
+- Add support for config states based on both WLT and graphics utilization=
.
+- Introduce LunarLake platform specific config file.
+- Minor fixes and cleanups.
+
+### Release 0.0.8
+
+- Introduce workload type proxy support.
+- Add support for model/sku specific config file.
+- Add detection for AC/DC status.
+- Honor power profile daemon default EPP when restoring.
+- Introduce MeteorLake-P platform specific config file.
+- Minor fixes and cleanups.
+
+### Release 0.0.7
+
+- Change lpmd description from "Low Power Mode Daemon" to "Energy Optimize=
r (lpmd)" because it covers more scenarios.
+- Fix invalid cgroup setting during probe, in case lpmd doesn't quit smoot=
hly and cleanups are not done properly in the previous run.
+- Introduce a new parameter `--ignore-platform-check`.
+- Provide more detailed information when lpmd fails to probe on an unvalid=
ated platform.
+- Various fixes for array bound check, potential memory leak, etc.
+- Autotool improvements.
+
+### Release 0.0.6
+
+- Remove automake and autoconf improvements due to a regression.
+- Deprecate the dbus-glib dependency.
+
+### Release 0.0.5
+
+- Fix compiling errors with `-Wall`.
+- Remove unintended default config file change to keep it unchanged since =
v0.0.3.
+
+### Release 0.0.4
+
+- Enhance HFI monitor to handle back-to-back HFI LPM hints.
+- Enhance HFI monitor to handle HFI hints for banned CPUs.
+- Introduce support for multiple Low Power states.
+- Introduce support for workload type hint.
+- Allow change EPP during Low Power modes transition.
+- Minor fixes and cleanups.
+
+### Release 0.0.3
+
+- Convert from glib-dbus to GDBus.
+- Add handling for CPU hotplug.
+- Use strict CPU model check to allow intel_lpmd to run on validated platf=
orms only, including ADL/RPL/MTL for now.
+- CPUID.7 Hybrid bit is set
+- /sys/firmware/acpi/pm_profile returns 2 (mobile platform)
+- Use `cpuid()` to detect Lcores instead of using cache sysfs.
+- Enhance Ecore module detection.
+- Fix pthread error handling, suggested by ColinIanKing.
+- Werror fixes from aekoroglu.
+
+### Release 0.0.2
+
+- Various fixes and cleanups.
+
+### Release 0.0.1
+
+- Add initial lpmd support.
+
+## Security
+
+See Intel's [Security Center](https://www.intel.com/content/www/us/en/secu=
rity-center/default.html) for information on how to report a potential secu=
rity issue or vulnerability.
+
+See also: [Security Policy](security.md)
diff --git a/tools/power/x86/intel-lpmd/data/intel_lpmd.service.in b/tools/=
power/x86/intel-lpmd/data/intel_lpmd.service.in
new file mode 100644
index 000000000000..a87c231d8594
--- /dev/null
+++ b/tools/power/x86/intel-lpmd/data/intel_lpmd.service.in
@@ -0,0 +1,19 @@
+[Unit]
+Description=3D Intel Linux Energy Optimizer (lpmd) Service
+Documentation=3Dman:intel_lpmd(8)
+ConditionVirtualization=3Dno
+StartLimitInterval=3D200
+StartLimitBurst=3D5
+
+[Service]
+Type=3Ddbus
+SuccessExitStatus=3D2
+BusName=3Dorg.freedesktop.intel_lpmd
+ExecStart=3D@sbindir@/intel_lpmd --systemd --dbus-enable
+Restart=3Don-failure
+RestartSec=3D30
+PrivateTmp=3Dyes
+
+[Install]
+WantedBy=3Dmulti-user.target
+Alias=3Dorg.freedesktop.intel_lpmd.service
diff --git a/tools/power/x86/intel-lpmd/data/intel_lpmd_config.xml b/tools/=
power/x86/intel-lpmd/data/intel_lpmd_config.xml
new file mode 100644
index 000000000000..2ef361a7f706
--- /dev/null
+++ b/tools/power/x86/intel-lpmd/data/intel_lpmd_config.xml
@@ -0,0 +1,106 @@
+<?xml version=3D"1.0"?>
+
+<!--
+Specifies the configuration data
+for Intel Energy Optimizer (LPMD) daemon
+-->
+
+<Configuration>
+=09<!--
+=09=09CPU format example: 1,2,4..6,8-10
+=09-->
+=09<lp_mode_cpus></lp_mode_cpus>
+
+=09<!--
+=09=09Mode values
+=09=090: Cgroup v2
+=09=091: Cgroup v2 isolate
+=09=092: CPU idle injection
+=09-->
+=09<Mode>0</Mode>
+
+=09<!--
+=09=09Default behavior when Performance power setting is used
+=09=09-1: force off. (Never enter Low Power Mode)
+=09=09 1: force on. (Always stay in Low Power Mode)
+=09=09 0: auto. (opportunistic Low Power Mode enter/exit)
+=09-->
+=09<PerformanceDef>-1</PerformanceDef>
+
+=09<!--
+=09=09Default behavior when Balanced power setting is used
+=09=09-1: force off. (Never enter Low Power Mode)
+=09=09 1: force on. (Always stay in Low Power Mode)
+=09=09 0: auto. (opportunistic Low Power Mode enter/exit)
+=09-->
+=09<BalancedDef>-1</BalancedDef>
+
+=09<!--
+=09=09Default behavior when Power saver setting is used
+=09=09-1: force off. (Never enter Low Power Mode)
+=09=09 1: force on. (Always stay in Low Power Mode)
+=09=09 0: auto. (opportunistic Low Power Mode enter/exit)
+=09-->
+=09<PowersaverDef>-1</PowersaverDef>
+
+=09<!--
+=09=09Use HFI LPM hints
+=09=090 : No
+=09=091 : Yes
+=09-->
+=09<HfiLpmEnable>0</HfiLpmEnable>
+
+=09<!--
+=09=09Use HFI SUV hints
+=09=090 : No
+=09=091 : Yes
+=09-->
+=09<HfiSuvEnable>0</HfiSuvEnable>
+
+=09<!--
+=09=09System utilization threshold to enter LP mode
+=09=09from 0 - 100
+=09=09clear both util_entry_threshold and util_exit_threshold to disable u=
til monitor
+=09-->
+=09<util_entry_threshold>10</util_entry_threshold>
+
+=09<!--
+=09=09System utilization threshold to exit LP mode
+=09=09from 0 - 100
+=09=09clear both util_entry_threshold and util_exit_threshold to disable u=
til monitor
+=09-->
+=09<util_exit_threshold>95</util_exit_threshold>
+
+=09<!--
+=09=09Entry delay. Minimum delay in non Low Power mode to
+=09=09enter LPM mode.
+=09-->
+=09<EntryDelayMS>0</EntryDelayMS>
+
+=09<!--
+=09=09Exit delay. Minimum delay in Low Power mode to
+=09=09exit LPM mode.
+=09-->
+=09<ExitDelayMS>0</ExitDelayMS>
+
+=09<!--
+=09=09Lowest hysteresis average in-LP-mode time in msec to enter LP mode
+=09=090: to disable hysteresis support
+=09-->
+=09<EntryHystMS>0</EntryHystMS>
+
+=09<!--
+=09=09Lowest hysteresis average out-of-LP-mode time in msec to exit LP mod=
e
+=09=090: to disable hysteresis support
+=09-->
+=09<ExitHystMS>0</ExitHystMS>
+
+=09<!--
+=09=09Ignore ITMT setting during LP-mode enter/exit
+=09=090: disable ITMT upon LP-mode enter and re-enable ITMT upon LP-mode e=
xit
+=09=091: do not touch ITMT setting during LP-mode enter/exit
+=09-->
+=09<IgnoreITMT>0</IgnoreITMT>
+
+</Configuration>
+
diff --git a/tools/power/x86/intel-lpmd/data/intel_lpmd_config_F6_M170.xml =
b/tools/power/x86/intel-lpmd/data/intel_lpmd_config_F6_M170.xml
new file mode 100644
index 000000000000..e6e6d061ff00
--- /dev/null
+++ b/tools/power/x86/intel-lpmd/data/intel_lpmd_config_F6_M170.xml
@@ -0,0 +1,166 @@
+<?xml version=3D"1.0"?>
+
+<!--
+Specifies the configuration data
+for Intel Energy Optimizer (LPMD) daemon
+Proxy WLT enabled with MTL specific epp values.
+-->
+
+<Configuration>
+    <!--
+        CPU format example: 1,2,4..6,8-10
+    -->
+    <lp_mode_cpus></lp_mode_cpus>
+
+    <!--
+        Mode values
+        0: Cgroup v2
+        1: Cgroup v2 isolate
+        2: CPU idle injection
+    -->
+    <Mode>1</Mode>
+
+    <!--
+        Default behavior when Performance power setting is used
+        -1: force off. (Never enter Low Power Mode)
+         1: force on. (Always stay in Low Power Mode)
+         0: auto. (opportunistic Low Power Mode enter/exit)
+    -->
+    <PerformanceDef>-1</PerformanceDef>
+
+    <!--
+        Default behavior when Balanced power setting is used
+        -1: force off. (Never enter Low Power Mode)
+         1: force on. (Always stay in Low Power Mode)
+         0: auto. (opportunistic Low Power Mode enter/exit)
+    -->
+    <BalancedDef>-1</BalancedDef>
+
+    <!--
+        Default behavior when Power saver setting is used
+        -1: force off. (Never enter Low Power Mode)
+         1: force on. (Always stay in Low Power Mode)
+         0: auto. (opportunistic Low Power Mode enter/exit)
+    -->
+    <PowersaverDef>-1</PowersaverDef>
+
+    <!--
+        Use HFI LPM hints
+        0 : No
+        1 : Yes
+    -->
+    <HfiLpmEnable>0</HfiLpmEnable>
+
+    <!--
+        Use WLT hints
+        0 : No
+        1 : Yes
+    -->
+    <WLTHintEnable>1</WLTHintEnable>
+
+    <!--
+        Use WLT software proxy hints
+        0 : No
+        1 : Yes
+    -->
+    <WLTProxyEnable>1</WLTProxyEnable>
+
+    <!--
+        Use HFI SUV hints
+        0 : No
+        1 : Yes
+    -->
+    <HfiSuvEnable>0</HfiSuvEnable>
+
+    <!--
+        System utilization threshold to enter LP mode
+        from 0 - 100
+        clear both util_entry_threshold and util_exit_threshold to disable=
 util monitor
+    -->
+    <util_entry_threshold></util_entry_threshold>
+
+    <!--
+        System utilization threshold to exit LP mode
+        from 0 - 100
+        clear both util_entry_threshold and util_exit_threshold to disable=
 util monitor
+    -->
+    <util_exit_threshold></util_exit_threshold>
+
+    <!--
+        Entry delay. Minimum delay in non Low Power mode to
+        enter LPM mode.
+    -->
+    <EntryDelayMS>0</EntryDelayMS>
+
+    <!--
+        Exit delay. Minimum delay in Low Power mode to
+        exit LPM mode.
+    -->
+    <ExitDelayMS>0</ExitDelayMS>
+
+    <!--
+        Lowest hysteresis average in-LP-mode time in msec to enter LP mode
+        0: to disable hysteresis support
+    -->
+    <EntryHystMS>0</EntryHystMS>
+
+    <!--
+        Lowest hysteresis average out-of-LP-mode time in msec to exit LP m=
ode
+        0: to disable hysteresis support
+    -->
+    <ExitHystMS>0</ExitHystMS>
+
+    <!--
+        Ignore ITMT setting during LP-mode enter/exit
+        0: disable ITMT upon LP-mode enter and re-enable ITMT upon LP-mode=
 exit
+        1: do not touch ITMT setting during LP-mode enter/exit
+    -->
+    <IgnoreITMT>0</IgnoreITMT>
+
+    <States>
+        <CPUFamily> 6 </CPUFamily>
+        <CPUModel> 170 </CPUModel>
+        <CPUConfig> * </CPUConfig>
+    <State>
+        <ID> 1 </ID> <!-- no significance. number can be anything -->
+        <Name> WLT_IDLE </Name>
+        <WLTType> 0 </WLTType> <!-- WLTType mapped to Name -->
+        <EPP> 255 </EPP>
+        <EPB> 15 </EPB>
+        <MinPollInterval>2000</MinPollInterval>
+        <ITMTState> -1 </ITMTState>
+        <IRQMigrate> -1 </IRQMigrate>
+    </State>
+    <State>
+        <ID> 2 </ID>
+        <Name> WLT_BATTERY_LIFE </Name>
+        <WLTType> 1 </WLTType>
+        <EPP> 178 </EPP>
+        <EPB> 6 </EPB>
+        <MinPollInterval>2000</MinPollInterval>
+        <ITMTState> -1 </ITMTState>
+        <IRQMigrate> -1 </IRQMigrate>
+    </State>
+    <State>
+        <ID> 3 </ID>
+        <Name> WLT_SUSTAINED </Name>
+        <WLTType> 2 </WLTType>
+        <EPP> 64 </EPP>
+        <EPB> 6 </EPB>
+        <MinPollInterval>2000</MinPollInterval>
+        <ITMTState> -1 </ITMTState>
+        <IRQMigrate> -1 </IRQMigrate>
+    </State>
+    <State>
+        <ID> 4 </ID>
+        <Name> WLT_BURSTY </Name>
+        <WLTType> 3 </WLTType>
+        <EPP> 64 </EPP>
+        <EPB> 4 </EPB>
+        <MinPollInterval>2000</MinPollInterval>
+        <ITMTState> -1 </ITMTState>
+        <IRQMigrate> -1 </IRQMigrate>
+    </State>
+</States>
+
+</Configuration>
diff --git a/tools/power/x86/intel-lpmd/data/intel_lpmd_config_F6_M189.xml =
b/tools/power/x86/intel-lpmd/data/intel_lpmd_config_F6_M189.xml
new file mode 100644
index 000000000000..b9f1fa46f454
--- /dev/null
+++ b/tools/power/x86/intel-lpmd/data/intel_lpmd_config_F6_M189.xml
@@ -0,0 +1,188 @@
+<?xml version=3D"1.0"?>
+
+<!--
+Specifies the configuration data
+for Intel Energy Optimizer (LPMD) daemon
+-->
+
+<Configuration>
+=09<!--
+=09=09CPU format example: 1,2,4..6,8-10
+=09-->
+=09<lp_mode_cpus></lp_mode_cpus>
+
+=09<!--
+=09=09EPP to use in Low Power Mode
+=09=090-255: Valid EPP value to use in Low Power Mode
+=09=09   -1: Don't change EPP in Low Power Mode
+=09-->
+=09<lp_mode_epp></lp_mode_epp>
+
+=09<!--
+=09=09Mode values
+=09=090: Cgroup v2
+=09=091: Cgroup v2 isolate
+=09=092: CPU idle injection
+=09-->
+=09<Mode>1</Mode>
+
+=09<!--
+=09=09Default behavior when Performance power setting is used
+=09=09-1: force off. (Never enter Low Power Mode)
+=09=09 1: force on. (Always stay in Low Power Mode)
+=09=09 0: auto. (opportunistic Low Power Mode enter/exit)
+=09-->
+=09<PerformanceDef>-1</PerformanceDef>
+
+=09<!--
+=09=09Default behavior when Balanced power setting is used
+=09=09-1: force off. (Never enter Low Power Mode)
+=09=09 1: force on. (Always stay in Low Power Mode)
+=09=09 0: auto. (opportunistic Low Power Mode enter/exit)
+=09-->
+=09<BalancedDef>-1</BalancedDef>
+
+=09<!--
+=09=09Default behavior when Power saver setting is used
+=09=09-1: force off. (Never enter Low Power Mode)
+=09=09 1: force on. (Always stay in Low Power Mode)
+=09=09 0: auto. (opportunistic Low Power Mode enter/exit)
+=09-->
+=09<PowersaverDef>-1</PowersaverDef>
+
+=09<!--
+=09=09Use HFI LPM hints
+=09=090 : No
+=09=091 : Yes
+=09-->
+=09<HfiLpmEnable>0</HfiLpmEnable>
+
+=09<!--
+=09=09Use WLT hints
+=09=090 : No
+=09=091 : Yes
+=09-->
+=09<WLTHintEnable>1</WLTHintEnable>
+
+=09<!--
+=09=09Use WLT hint Poll enable
+=09=090 : No
+=09=091 : Yes
+=09-->
+=09<WLTHintPollEnable>1</WLTHintPollEnable>
+
+=09<!--
+=09=09Use HFI SUV hints
+=09=090 : No
+=09=091 : Yes
+=09-->
+=09<HfiSuvEnable>0</HfiSuvEnable>
+
+=09<!--
+=09=09System utilization threshold to enter LP mode
+=09=09from 0 - 100
+=09=09clear both util_entry_threshold and util_exit_threshold to disable u=
til monitor
+=09-->
+=09<util_entry_threshold>10</util_entry_threshold>
+
+=09<!--
+=09=09System utilization threshold to exit LP mode
+=09=09from 0 - 100
+=09=09clear both util_entry_threshold and util_exit_threshold to disable u=
til monitor
+=09-->
+=09<util_exit_threshold>95</util_exit_threshold>
+
+=09<!--
+=09=09Entry delay. Minimum delay in non Low Power mode to
+=09=09enter LPM mode.
+=09-->
+=09<EntryDelayMS>0</EntryDelayMS>
+
+=09<!--
+=09=09Exit delay. Minimum delay in Low Power mode to
+=09=09exit LPM mode.
+=09-->
+=09<ExitDelayMS>0</ExitDelayMS>
+
+=09<!--
+=09=09Lowest hysteresis average in-LP-mode time in msec to enter LP mode
+=09=090: to disable hysteresis support
+=09-->
+=09<EntryHystMS>0</EntryHystMS>
+
+=09<!--
+=09=09Lowest hysteresis average out-of-LP-mode time in msec to exit LP mod=
e
+=09=090: to disable hysteresis support
+=09-->
+=09<ExitHystMS>0</ExitHystMS>
+
+=09<!--
+=09=09Ignore ITMT setting during LP-mode enter/exit
+=09=090: disable ITMT upon LP-mode enter and re-enable ITMT upon LP-mode e=
xit
+=09=091: do not touch ITMT setting during LP-mode enter/exit
+=09-->
+=09<IgnoreITMT>0</IgnoreITMT>
+
+=09<!--
+=09=09Example WorkLoad Type hints based config states applied to
+=09=0912Pcore-8Ecore-2Lcore 28W TDP Meteor Lake platform.
+=09=09Need to set WLTHintEnable to make it work.
+=09-->
+=09<States>
+=09=09<CPUFamily> 6 </CPUFamily>
+=09=09<CPUModel> 189 </CPUModel>
+=09=09<CPUConfig> * </CPUConfig>
+=09=09<State>
+=09=09=09<ID> 1 </ID>
+=09=09=09<Name> UTIL_IDLE </Name>
+=09=09=09<WLTType> 1 </WLTType>
+=09=09=09<EnterGFXLoadThres>50</EnterGFXLoadThres>
+=09=09=09<IRQMigrate> -1 </IRQMigrate>
+=09=09=09<EPP> 192 </EPP>
+=09=09=09<EPB> 8 </EPB>
+=09=09=09<ITMTState> -1 </ITMTState>
+=09=09=09<MinPollInterval> 1000 </MinPollInterval>
+=09=09=09<PollIntervalIncrement> 500 </PollIntervalIncrement>
+=09=09=09<MaxPollInterval> 2000 </MaxPollInterval>
+=09=09</State>
+=09=09<State>
+=09=09=09<ID> 2 </ID>
+=09=09=09<Name> UTIL_IDLE_SUSTAIN </Name>
+=09=09=09<EnterGFXLoadThres>75</EnterGFXLoadThres>
+=09=09=09<WLTType> 2 </WLTType>
+=09=09=09<IRQMigrate> -1 </IRQMigrate>
+=09=09=09<EPP> 64 </EPP>
+=09=09=09<EPB> 8 </EPB>
+=09=09=09<ITMTState> -1 </ITMTState>
+=09=09=09<MinPollInterval> 1000 </MinPollInterval>
+=09=09=09<PollIntervalIncrement> 500 </PollIntervalIncrement>
+=09=09=09<MaxPollInterval> 2000 </MaxPollInterval>
+=09=09</State>
+=09=09<State>
+=09=09=09<ID> 3 </ID>
+=09=09=09<Name> UTIL_IDLE_BURSTY </Name>
+=09=09=09<WLTType> 3 </WLTType>
+=09=09=09<EnterGFXLoadThres>75</EnterGFXLoadThres>
+=09=09=09<IRQMigrate> -1 </IRQMigrate>
+=09=09=09<EPP> 64 </EPP>
+=09=09=09<EPB> 8 </EPB>
+=09=09=09<ITMTState> -1 </ITMTState>
+=09=09=09<MinPollInterval> 1000 </MinPollInterval>
+=09=09=09<PollIntervalIncrement> 500 </PollIntervalIncrement>
+=09=09=09<MaxPollInterval> 2000 </MaxPollInterval>
+=09=09</State>
+=09=09<State>
+=09=09=09<ID> 4 </ID>
+=09=09=09<Name> UTIL_IDLE_GFX_BUSY </Name>
+=09=09=09<EnterGFXLoadThres>100</EnterGFXLoadThres>
+=09=09=09<IRQMigrate> -1 </IRQMigrate>
+=09=09=09<EPP> 128 </EPP>
+=09=09=09<EPB> 8 </EPB>
+=09=09=09<ITMTState> -1 </ITMTState>
+=09=09=09<MinPollInterval> 1000 </MinPollInterval>
+=09=09=09<PollIntervalIncrement> 500 </PollIntervalIncrement>
+=09=09=09<MaxPollInterval> 2000 </MaxPollInterval>
+=09=09</State>
+=09</States>
+
+</Configuration>
diff --git a/tools/power/x86/intel-lpmd/data/intel_lpmd_config_F6_M204.xml =
b/tools/power/x86/intel-lpmd/data/intel_lpmd_config_F6_M204.xml
new file mode 100644
index 000000000000..123daef5f47c
--- /dev/null
+++ b/tools/power/x86/intel-lpmd/data/intel_lpmd_config_F6_M204.xml
@@ -0,0 +1,213 @@
+<?xml version=3D"1.0"?>
+
+<!--
+Specifies the configuration data
+for Intel Energy Optimizer (LPMD) daemon
+-->
+
+<Configuration>
+=09<!--
+=09=09CPU format example: 1,2,4..6,8-10
+=09-->
+=09<lp_mode_cpus></lp_mode_cpus>
+
+=09<!--
+=09=09EPP to use in Low Power Mode
+=09=090-255: Valid EPP value to use in Low Power Mode
+=09=09   -1: Don't change EPP in Low Power Mode
+=09-->
+=09<lp_mode_epp></lp_mode_epp>
+
+=09<!--
+=09=09Mode values
+=09=090: Cgroup v2
+=09=091: Cgroup v2 isolate
+=09=092: CPU idle injection
+=09<Mode>0</Mode>
+=09-->
+
+=09<!--
+=09=09Default behavior when Performance power setting is used
+=09=09-1: force off. (Never enter Low Power Mode)
+=09=09 1: force on. (Always stay in Low Power Mode)
+=09=09 0: auto. (opportunistic Low Power Mode enter/exit)
+=09-->
+=09<PerformanceDef>-1</PerformanceDef>
+
+=09<!--
+=09=09Default behavior when Balanced power setting is used
+=09=09-1: force off. (Never enter Low Power Mode)
+=09=09 1: force on. (Always stay in Low Power Mode)
+=09=09 0: auto. (opportunistic Low Power Mode enter/exit)
+=09-->
+=09<BalancedDef>-1</BalancedDef>
+
+=09<!--
+=09=09Default behavior when Power saver setting is used
+=09=09-1: force off. (Never enter Low Power Mode)
+=09=09 1: force on. (Always stay in Low Power Mode)
+=09=09 0: auto. (opportunistic Low Power Mode enter/exit)
+=09-->
+=09<PowersaverDef>-1</PowersaverDef>
+
+=09<!--
+=09=09Use HFI LPM hints
+=09=090 : No
+=09=091 : Yes
+=09-->
+=09<HfiLpmEnable>0</HfiLpmEnable>
+
+=09<!--
+=09=09Use WLT hints
+=09=090 : No
+=09=091 : Yes
+=09-->
+=09<WLTHintEnable>1</WLTHintEnable>
+
+=09<!--
+=09=09Use WLT hint Poll enable
+=09=090 : No
+=09=091 : Yes
+=09-->
+=09<WLTHintPollEnable>0</WLTHintPollEnable>
+
+=09<!--
+=09=09Use WLT hint Mask
+=09=090 : Non
+=09=09* : Value to AND with the hardware hint
+=09-->
+=09<WLTHintMask>15</WLTHintMask>
+
+=09<!--
+=09=09Use HFI SUV hints
+=09=090 : No
+=09=091 : Yes
+=09-->
+=09<HfiSuvEnable>0</HfiSuvEnable>
+
+=09<!--
+=09=09System utilization threshold to enter LP mode
+=09=09from 0 - 100
+=09=09clear both util_entry_threshold and util_exit_threshold to disable u=
til monitor
+=09<util_entry_threshold>0</util_entry_threshold>
+=09-->
+
+=09<!--
+=09=09System utilization threshold to exit LP mode
+=09=09from 0 - 100
+=09=09clear both util_entry_threshold and util_exit_threshold to disable u=
til monitor
+=09<util_exit_threshold>0</util_exit_threshold>
+=09-->
+
+=09<!--
+=09=09Entry delay. Minimum delay in non Low Power mode to
+=09=09enter LPM mode.
+=09<EntryDelayMS>0</EntryDelayMS>
+=09-->
+
+=09<!--
+=09=09Exit delay. Minimum delay in Low Power mode to
+=09=09exit LPM mode.
+=09<ExitDelayMS>0</ExitDelayMS>
+=09-->
+
+=09<!--
+=09=09Lowest hysteresis average in-LP-mode time in msec to enter LP mode
+=09=090: to disable hysteresis support
+=09<EntryHystMS>0</EntryHystMS>
+=09-->
+
+=09<!--
+=09=09Lowest hysteresis average out-of-LP-mode time in msec to exit LP mod=
e
+=09=090: to disable hysteresis support
+=09<ExitHystMS>0</ExitHystMS>
+=09-->
+
+=09<!--
+=09=09Ignore ITMT setting during LP-mode enter/exit
+=09=090: disable ITMT upon LP-mode enter and re-enable ITMT upon LP-mode e=
xit
+=09=091: do not touch ITMT setting during LP-mode enter/exit
+=09-->
+=09<IgnoreITMT>0</IgnoreITMT>
+
+=09<!--
+=09=09Slider default configuration for AC and DC
+=09-->
+=09<BalancedSliderAC>1</BalancedSliderAC>
+=09<BalancedSliderDC>3</BalancedSliderDC>
+=09<SliderOffsetAC>0</SliderOffsetAC>
+=09<SliderOffsetDC>3</SliderOffsetDC>
+
+=09<States>
+=09=09<CPUFamily> 6 </CPUFamily>
+=09=09<CPUModel> 204 </CPUModel>
+=09=09<CPUConfig> 4P8E4L-25W </CPUConfig>
+=09=09<State>
+=09=09=09<ID> 1 </ID>
+=09=09=09<Name> UTIL_IDLE </Name>
+=09=09=09<WLTType> 1 </WLTType>
+=09=09=09<ActiveCPUs>12-15</ActiveCPUs>
+=09=09</State>
+=09=09<State>
+=09=09=09<ID> 2 </ID>
+=09=09=09<Name> UTIL_IDLE_SUSTAIN </Name>
+=09=09=09<WLTType> 2 </WLTType>
+=09=09=09<ActiveCPUs>0-15</ActiveCPUs>
+=09=09</State>
+=09=09<State>
+=09=09=09<ID> 3 </ID>
+=09=09=09<Name> UTIL_IDLE_BURSTY </Name>
+=09=09=09<WLTType> 3 </WLTType>
+=09=09=09<ActiveCPUs>0-15</ActiveCPUs>
+=09=09</State>
+=09</States>
+
+=09<States>
+=09=09<CPUFamily> 6 </CPUFamily>
+=09=09<CPUModel> 204 </CPUModel>
+=09=09<CPUConfig> 4P4E4L-25W </CPUConfig>
+=09=09<State>
+=09=09=09<ID> 1 </ID>
+=09=09=09<Name> UTIL_IDLE </Name>
+=09=09=09<WLTType> 1 </WLTType>
+=09=09=09<ActiveCPUs>8-11</ActiveCPUs>
+=09=09</State>
+=09=09<State>
+=09=09=09<ID> 2 </ID>
+=09=09=09<Name> UTIL_IDLE_SUSTAIN </Name>
+=09=09=09<WLTType> 2 </WLTType>
+=09=09=09<ActiveCPUs>0-11</ActiveCPUs>
+=09=09</State>
+=09=09<State>
+=09=09=09<ID> 3 </ID>
+=09=09=09<Name> UTIL_IDLE_BURSTY </Name>
+=09=09=09<WLTType> 3 </WLTType>
+=09=09=09<ActiveCPUs>0-11</ActiveCPUs>
+=09=09</State>
+=09</States>
+
+=09<States>
+=09=09<CPUFamily> 6 </CPUFamily>
+=09=09<CPUModel> 204 </CPUModel>
+=09=09<CPUConfig> 4P0E4L-25W </CPUConfig>
+=09=09<State>
+=09=09=09<ID> 1 </ID>
+=09=09=09<Name> UTIL_IDLE </Name>
+=09=09=09<WLTType> 1 </WLTType>
+=09=09=09<ActiveCPUs>4-7</ActiveCPUs>
+=09=09</State>
+=09=09<State>
+=09=09=09<ID> 2 </ID>
+=09=09=09<Name> UTIL_IDLE_SUSTAIN </Name>
+=09=09=09<WLTType> 2 </WLTType>
+=09=09=09<ActiveCPUs>0-7</ActiveCPUs>
+=09=09</State>
+=09=09<State>
+=09=09=09<ID> 3 </ID>
+=09=09=09<Name> UTIL_IDLE_BURSTY </Name>
+=09=09=09<WLTType> 3 </WLTType>
+=09=09=09<ActiveCPUs>0-7</ActiveCPUs>
+=09=09</State>
+=09</States>
+
+</Configuration>
diff --git a/tools/power/x86/intel-lpmd/data/intel_lpmd_config_examples.xml=
 b/tools/power/x86/intel-lpmd/data/intel_lpmd_config_examples.xml
new file mode 100644
index 000000000000..fcfbe8806558
--- /dev/null
+++ b/tools/power/x86/intel-lpmd/data/intel_lpmd_config_examples.xml
@@ -0,0 +1,213 @@
+<?xml version=3D"1.0"?>
+
+<!--
+Specifies the configuration data
+for Intel Energy Optimizer (LPMD) daemon
+-->
+
+<Configuration>
+=09<!--
+=09=09CPU format example: 1,2,4..6,8-10
+=09-->
+=09<lp_mode_cpus></lp_mode_cpus>
+
+=09<!--
+=09=09EPP to use in Low Power Mode
+=09=090-255: Valid EPP value to use in Low Power Mode
+=09=09   -1: Don't change EPP in Low Power Mode
+=09-->
+=09<lp_mode_epp>-1</lp_mode_epp>
+
+=09<!--
+=09=09Mode values
+=09=090: Cgroup v2
+=09=091: Cgroup v2 isolate
+=09=092: CPU idle injection
+=09-->
+=09<Mode>0</Mode>
+
+=09<!--
+=09=09Default behavior when Performance power setting is used
+=09=09-1: force off. (Never enter Low Power Mode)
+=09=09 1: force on. (Always stay in Low Power Mode)
+=09=09 0: auto. (opportunistic Low Power Mode enter/exit)
+=09-->
+=09<PerformanceDef>-1</PerformanceDef>
+
+=09<!--
+=09=09Default behavior when Balanced power setting is used
+=09=09-1: force off. (Never enter Low Power Mode)
+=09=09 1: force on. (Always stay in Low Power Mode)
+=09=09 0: auto. (opportunistic Low Power Mode enter/exit)
+=09-->
+=09<BalancedDef>-1</BalancedDef>
+
+=09<!--
+=09=09Default behavior when Power saver setting is used
+=09=09-1: force off. (Never enter Low Power Mode)
+=09=09 1: force on. (Always stay in Low Power Mode)
+=09=09 0: auto. (opportunistic Low Power Mode enter/exit)
+=09-->
+=09<PowersaverDef>-1</PowersaverDef>
+
+=09<!--
+=09=09Use HFI LPM hints
+=09=090 : No
+=09=091 : Yes
+=09-->
+=09<HfiLpmEnable>0</HfiLpmEnable>
+
+=09<!--
+=09=09Use WLT hints
+=09=090 : No
+=09=091 : Yes
+=09-->
+=09<WLTHintEnable>0</WLTHintEnable>
+
+=09<!--
+=09=09Use HFI SUV hints
+=09=090 : No
+=09=091 : Yes
+=09-->
+=09<HfiSuvEnable>0</HfiSuvEnable>
+
+=09<!--
+=09=09System utilization threshold to enter LP mode
+=09=09from 0 - 100
+=09=09clear both util_entry_threshold and util_exit_threshold to disable u=
til monitor
+=09-->
+=09<util_entry_threshold>10</util_entry_threshold>
+
+=09<!--
+=09=09System utilization threshold to exit LP mode
+=09=09from 0 - 100
+=09=09clear both util_entry_threshold and util_exit_threshold to disable u=
til monitor
+=09-->
+=09<util_exit_threshold>95</util_exit_threshold>
+
+=09<!--
+=09=09Entry delay. Minimum delay in non Low Power mode to
+=09=09enter LPM mode.
+=09-->
+=09<EntryDelayMS>0</EntryDelayMS>
+
+=09<!--
+=09=09Exit delay. Minimum delay in Low Power mode to
+=09=09exit LPM mode.
+=09-->
+=09<ExitDelayMS>0</ExitDelayMS>
+
+=09<!--
+=09=09Lowest hysteresis average in-LP-mode time in msec to enter LP mode
+=09=090: to disable hysteresis support
+=09-->
+=09<EntryHystMS>0</EntryHystMS>
+
+=09<!--
+=09=09Lowest hysteresis average out-of-LP-mode time in msec to exit LP mod=
e
+=09=090: to disable hysteresis support
+=09-->
+=09<ExitHystMS>0</ExitHystMS>
+
+=09<!--
+=09=09Ignore ITMT setting during LP-mode enter/exit
+=09=090: disable ITMT upon LP-mode enter and re-enable ITMT upon LP-mode e=
xit
+=09=091: do not touch ITMT setting during LP-mode enter/exit
+=09-->
+=09<IgnoreITMT>0</IgnoreITMT>
+
+=09<!--
+=09=09Example WorkLoad Type hints based config states applied to
+=09=0912Pcore-8Ecore-2Lcore 28W TDP Meteor Lake platform.
+=09=09Need to set WLTHintEnable to make it work.
+=09-->
+=09<States>
+=09=09<CPUFamily> 6 </CPUFamily>
+=09=09<CPUModel> 170 </CPUModel>
+=09=09<CPUConfig> 12P8E2L-28W </CPUConfig>
+=09=09<State>
+=09=09=09<ID> 1 </ID>
+=09=09=09<Name> WLT_IDLE </Name>
+=09=09=09<WLTType> 0 </WLTType>
+=09=09=09<EPP> 255 </EPP>
+=09=09=09<ITMTState> -1 </ITMTState>
+=09=09=09<IRQMigrate> -1 </IRQMigrate>
+=09=09</State>
+=09=09<State>
+=09=09=09<ID> 2 </ID>
+=09=09=09<Name> WLT_BATTERY_LIFE </Name>
+=09=09=09<WLTType> 1 </WLTType>
+=09=09=09<EPP> 192 </EPP>
+=09=09=09<ITMTState> -1 </ITMTState>
+=09=09=09<IRQMigrate> -1 </IRQMigrate>
+=09=09</State>
+=09=09<State>
+=09=09=09<ID> 3 </ID>
+=09=09=09<Name> WLT_SUSTAINED </Name>
+=09=09=09<WLTType> 2 </WLTType>
+=09=09=09<EPP> 64 </EPP>
+=09=09=09<ITMTState> -1 </ITMTState>
+=09=09=09<IRQMigrate> -1 </IRQMigrate>
+=09=09</State>
+=09=09<State>
+=09=09=09<ID> 4 </ID>
+=09=09=09<Name> WLT_BURSTY </Name>
+=09=09=09<WLTType> 3 </WLTType>
+=09=09=09<EPP> 64 </EPP>
+=09=09=09<ITMTState> -1 </ITMTState>
+=09=09=09<IRQMigrate> -1 </IRQMigrate>
+=09=09</State>
+=09</States>
+
+=09<!--
+=09=09Example Utilization based config states applied to
+=09=094Pcore-8Ecore-2Lcore 15W TDP Meteor Lake platform.
+=09-->
+=09<States>
+=09=09<CPUFamily> 6 </CPUFamily>
+=09=09<CPUModel> 170 </CPUModel>
+=09=09<CPUConfig> 4P8E2L-15W </CPUConfig>
+=09=09<State>
+=09=09=09<ID> 1 </ID>
+=09=09=09<Name> LPM_DEEP </Name>
+=09=09=09<EntrySystemLoadThres> 2 </EntrySystemLoadThres>
+=09=09=09<EnterCPULoadThres> 50 </EnterCPULoadThres>
+=09=09=09<EPP> -1 </EPP>
+=09=09=09<EPB> -1 </EPB>
+=09=09=09<ITMTState> -1 </ITMTState>
+=09=09=09<IRQMigrate> -1 </IRQMigrate>
+=09=09=09<ActiveCPUs>16,17</ActiveCPUs>
+=09=09=09<MinPollInterval> 500 </MinPollInterval>
+=09=09=09<PollIntervalIncrement> 500 </PollIntervalIncrement>
+=09=09=09<MaxPollInterval> 2000 </MaxPollInterval>
+=09=09</State>
+=09=09<State>
+=09=09=09<ID> 2 </ID>
+=09=09=09<Name> LPM_LOW </Name>
+=09=09=09<EntrySystemLoadThres> 10 </EntrySystemLoadThres>
+=09=09=09<ExitSystemLoadhysteresis> 3 </ExitSystemLoadhysteresis>
+=09=09=09<EPP> -1 </EPP>
+=09=09=09<EPB> -1 </EPB>
+=09=09=09<ITMTState> -1 </ITMTState>
+=09=09=09<IRQMigrate> -1 </IRQMigrate>
+=09=09=09<ActiveCPUs>12,13,14,15</ActiveCPUs>
+=09=09=09<MinPollInterval> 1000 </MinPollInterval>
+=09=09=09<PollIntervalIncrement> 1000 </PollIntervalIncrement>
+=09=09=09<MaxPollInterval> 3000 </MaxPollInterval>
+=09=09</State>
+=09=09<State>
+=09=09=09<ID> 3 </ID>
+=09=09=09<Name> FULL_POWER </Name>
+=09=09=09<EntrySystemLoadThres></EntrySystemLoadThres>
+=09=09=09<EnterCPULoadThres></EnterCPULoadThres>
+=09=09=09<EPP> -1 </EPP>
+=09=09=09<EPB> -1 </EPB>
+=09=09=09<ITMTState> -1 </ITMTState>
+=09=09=09<IRQMigrate> -1 </IRQMigrate>
+=09=09=09<ActiveCPUs>0-17</ActiveCPUs>
+=09=09=09<MinPollInterval> 500 </MinPollInterval>
+=09=09=09<PollIntervalIncrement> -1 </PollIntervalIncrement>
+=09=09=09<MaxPollInterval> 2000 </MaxPollInterval>
+=09=09</State>
+=09</States>
+</Configuration>
diff --git a/tools/power/x86/intel-lpmd/data/intel_lpmd_config_experimental=
.xml b/tools/power/x86/intel-lpmd/data/intel_lpmd_config_experimental.xml
new file mode 100644
index 000000000000..3aa8c75a1ffd
--- /dev/null
+++ b/tools/power/x86/intel-lpmd/data/intel_lpmd_config_experimental.xml
@@ -0,0 +1,252 @@
+<?xml version=3D"1.0"?>
+
+<!--
+Specifies the configuration data
+for Intel Energy Optimizer (LPMD) daemon
+-->
+
+<Configuration>
+=09<!--
+=09=09CPU format example: 1,2,4..6,8-10
+=09-->
+=09<lp_mode_cpus></lp_mode_cpus>
+
+=09<!--
+=09=09EPP to use in Low Power Mode
+=09=090-255: Valid EPP value to use in Low Power Mode
+=09=09   -1: Don't change EPP in Low Power Mode
+=09-->
+=09<lp_mode_epp></lp_mode_epp>
+
+=09<!--
+=09=09Mode values
+=09=090: Cgroup v2
+=09=091: Cgroup v2 isolate
+=09=092: CPU idle injection
+=09-->
+=09<Mode>1</Mode>
+
+=09<!--
+=09=09Default behavior when Performance power setting is used
+=09=09-1: force off. (Never enter Low Power Mode)
+=09=09 1: force on. (Always stay in Low Power Mode)
+=09=09 0: auto. (opportunistic Low Power Mode enter/exit)
+=09-->
+=09<PerformanceDef>-1</PerformanceDef>
+
+=09<!--
+=09=09Default behavior when Balanced power setting is used
+=09=09-1: force off. (Never enter Low Power Mode)
+=09=09 1: force on. (Always stay in Low Power Mode)
+=09=09 0: auto. (opportunistic Low Power Mode enter/exit)
+=09-->
+=09<BalancedDef>-1</BalancedDef>
+
+=09<!--
+=09=09Default behavior when Power saver setting is used
+=09=09-1: force off. (Never enter Low Power Mode)
+=09=09 1: force on. (Always stay in Low Power Mode)
+=09=09 0: auto. (opportunistic Low Power Mode enter/exit)
+=09-->
+=09<PowersaverDef>-1</PowersaverDef>
+
+=09<!--
+=09=09Use HFI LPM hints
+=09=090 : No
+=09=091 : Yes
+=09-->
+=09<HfiLpmEnable>1</HfiLpmEnable>
+
+=09<!--
+=09=09Use WLT hints
+=09=090 : No
+=09=091 : Yes
+=09-->
+=09<WLTHintEnable>1</WLTHintEnable>
+
+=09<!--
+=09=09Use WLT hint Poll enable
+=09=090 : No
+=09=091 : Yes
+=09-->
+=09<WLTHintPollEnable>1</WLTHintPollEnable>
+
+=09<!--
+=09=09Use HFI SUV hints
+=09=090 : No
+=09=091 : Yes
+=09-->
+=09<HfiSuvEnable>0</HfiSuvEnable>
+
+=09<!--
+=09=09System utilization threshold to enter LP mode
+=09=09from 0 - 100
+=09=09clear both util_entry_threshold and util_exit_threshold to disable u=
til monitor
+=09-->
+=09<util_entry_threshold>10</util_entry_threshold>
+
+=09<!--
+=09=09System utilization threshold to exit LP mode
+=09=09from 0 - 100
+=09=09clear both util_entry_threshold and util_exit_threshold to disable u=
til monitor
+=09-->
+=09<util_exit_threshold>95</util_exit_threshold>
+
+=09<!--
+=09=09Entry delay. Minimum delay in non Low Power mode to
+=09=09enter LPM mode.
+=09-->
+=09<EntryDelayMS>0</EntryDelayMS>
+
+=09<!--
+=09=09Exit delay. Minimum delay in Low Power mode to
+=09=09exit LPM mode.
+=09-->
+=09<ExitDelayMS>0</ExitDelayMS>
+
+=09<!--
+=09=09Lowest hysteresis average in-LP-mode time in msec to enter LP mode
+=09=090: to disable hysteresis support
+=09-->
+=09<EntryHystMS>0</EntryHystMS>
+
+=09<!--
+=09=09Lowest hysteresis average out-of-LP-mode time in msec to exit LP mod=
e
+=09=090: to disable hysteresis support
+=09-->
+=09<ExitHystMS>0</ExitHystMS>
+
+=09<!--
+=09=09Ignore ITMT setting during LP-mode enter/exit
+=09=090: disable ITMT upon LP-mode enter and re-enable ITMT upon LP-mode e=
xit
+=09=091: do not touch ITMT setting during LP-mode enter/exit
+=09-->
+=09<IgnoreITMT>0</IgnoreITMT>
+
+=09<!--
+=09=09config states for PantherLake 2P + 4E + 4L + 25W TDP platform in Cli=
ent Power Lab
+=09-->
+=09<States>
+=09=09<CPUFamily> 6 </CPUFamily>
+=09=09<CPUModel> 202 </CPUModel>
+=09=09<CPUConfig> 4P8E4L-15W </CPUConfig>
+=09=09<State>
+=09=09=09<ID> 1 </ID>
+=09=09=09<Name> WLT_IDLE </Name>
+=09=09=09<WLTType> 0 </WLTType>
+=09=09=09<EnterGFXLoadThres>50</EnterGFXLoadThres>
+=09=09=09<EntrySystemLoadThres>5</EntrySystemLoadThres>
+=09=09=09<EnterCPULoadThres>90</EnterCPULoadThres>
+=09=09=09<IRQMigrate> -1 </IRQMigrate>
+=09=09=09<EPP> 192 </EPP>
+=09=09=09<EPB> 8 </EPB>
+=09=09=09<ActiveCPUs> hfi </ActiveCPUs>
+=09=09=09<ITMTState> -1 </ITMTState>
+=09=09=09<MinPollInterval> 1000 </MinPollInterval>
+=09=09=09<PollIntervalIncrement> 500 </PollIntervalIncrement>
+=09=09=09<MaxPollInterval> 2000 </MaxPollInterval>
+=09=09</State>
+=09=09<State>
+=09=09=09<ID> 2 </ID>
+=09=09=09<Name> WLT_BATTERY_LIFE </Name>
+=09=09=09<WLTType> 1 </WLTType>
+=09=09=09<EnterGFXLoadThres>50</EnterGFXLoadThres>
+=09=09=09<EntrySystemLoadThres>10</EntrySystemLoadThres>
+=09=09=09<EnterCPULoadThres>95</EnterCPULoadThres>
+=09=09=09<IRQMigrate> -1 </IRQMigrate>
+=09=09=09<EPP> 192 </EPP>
+=09=09=09<EPB> 8 </EPB>
+=09=09=09<ActiveCPUs> hfi </ActiveCPUs>
+=09=09=09<ITMTState> -1 </ITMTState>
+=09=09=09<MinPollInterval> 1000 </MinPollInterval>
+=09=09=09<PollIntervalIncrement> 500 </PollIntervalIncrement>
+=09=09=09<MaxPollInterval> 2000 </MaxPollInterval>
+=09=09</State>
+=09=09<State>
+=09=09=09<ID> 3 </ID>
+=09=09=09<Name> WLT_SUSTAIN </Name>
+=09=09=09<WLTType> 2 </WLTType>
+=09=09=09<EntrySystemLoadThres>30</EntrySystemLoadThres>
+=09=09=09<EnterGFXLoadThres>50</EnterGFXLoadThres>
+=09=09=09<IRQMigrate> -1 </IRQMigrate>
+=09=09=09<EPP> 64 </EPP>
+=09=09=09<EPB> 8 </EPB>
+=09=09=09<ActiveCPUs> lp </ActiveCPUs>
+=09=09=09<ITMTState> -1 </ITMTState>
+=09=09=09<MinPollInterval> 1000 </MinPollInterval>
+=09=09=09<PollIntervalIncrement> 500 </PollIntervalIncrement>
+=09=09=09<MaxPollInterval> 2000 </MaxPollInterval>
+=09=09</State>
+=09=09<State>
+=09=09=09<ID> 4 </ID>
+=09=09=09<Name> WLT_BURSTY </Name>
+=09=09=09<WLTType> 3 </WLTType>
+=09=09=09<EnterGFXLoadThres>50</EnterGFXLoadThres>
+=09=09=09<EntrySystemLoadThres>50</EntrySystemLoadThres>
+=09=09=09<IRQMigrate> -1 </IRQMigrate>
+=09=09=09<EPP> 64 </EPP>
+=09=09=09<EPB> 8 </EPB>
+=09=09=09<ActiveCPUs> all </ActiveCPUs>
+=09=09=09<ITMTState> -1 </ITMTState>
+=09=09=09<MinPollInterval> 1000 </MinPollInterval>
+=09=09=09<PollIntervalIncrement> 500 </PollIntervalIncrement>
+=09=09=09<MaxPollInterval> 2000 </MaxPollInterval>
+=09=09</State>
+=09=09<State>
+=09=09=09<ID> 5 </ID>
+=09=09=09<Name> UTIL_IDLE </Name>
+=09=09=09<EnterGFXLoadThres>50</EnterGFXLoadThres>
+=09=09=09<EntrySystemLoadThres>5</EntrySystemLoadThres>
+=09=09=09<EnterCPULoadThres>90</EnterCPULoadThres>
+=09=09=09<IRQMigrate> -1 </IRQMigrate>
+=09=09=09<EPP> 192 </EPP>
+=09=09=09<EPB> 8 </EPB>
+=09=09=09<ActiveCPUs> hfi </ActiveCPUs>
+=09=09=09<ITMTState> -1 </ITMTState>
+=09=09=09<MinPollInterval> 1000 </MinPollInterval>
+=09=09=09<PollIntervalIncrement> 500 </PollIntervalIncrement>
+=09=09=09<MaxPollInterval> 2000 </MaxPollInterval>
+=09=09</State>
+=09=09<State>
+=09=09=09<ID> 6 </ID>
+=09=09=09<Name> UTIL_SUSTAIN </Name>
+=09=09=09<EntrySystemLoadThres>10</EntrySystemLoadThres>
+=09=09=09<EnterGFXLoadThres>50</EnterGFXLoadThres>
+=09=09=09<IRQMigrate> -1 </IRQMigrate>
+=09=09=09<EPP> 64 </EPP>
+=09=09=09<EPB> 8 </EPB>
+=09=09=09<ActiveCPUs> lp </ActiveCPUs>
+=09=09=09<ITMTState> -1 </ITMTState>
+=09=09=09<MinPollInterval> 1000 </MinPollInterval>
+=09=09=09<PollIntervalIncrement> 500 </PollIntervalIncrement>
+=09=09=09<MaxPollInterval> 2000 </MaxPollInterval>
+=09=09</State>
+=09=09<State>
+=09=09=09<ID> 7 </ID>
+=09=09=09<Name> UTIL_BURSTY </Name>
+=09=09=09<EnterGFXLoadThres>50</EnterGFXLoadThres>
+=09=09=09<EntrySystemLoadThres>50</EntrySystemLoadThres>
+=09=09=09<IRQMigrate> -1 </IRQMigrate>
+=09=09=09<EPP> 64 </EPP>
+=09=09=09<EPB> 8 </EPB>
+=09=09=09<ActiveCPUs> all </ActiveCPUs>
+=09=09=09<ITMTState> -1 </ITMTState>
+=09=09=09<MinPollInterval> 1000 </MinPollInterval>
+=09=09=09<PollIntervalIncrement> 500 </PollIntervalIncrement>
+=09=09=09<MaxPollInterval> 2000 </MaxPollInterval>
+=09=09</State>
+=09=09<State>
+=09=09=09<ID> 8 </ID>
+=09=09=09<Name> UTIL_BUSY </Name>
+=09=09=09<IRQMigrate> -1 </IRQMigrate>
+=09=09=09<EPP> 32 </EPP>
+=09=09=09<EPB> 6 </EPB>
+=09=09=09<ActiveCPUs> all </ActiveCPUs>
+=09=09=09<ITMTState> -1 </ITMTState>
+=09=09=09<MinPollInterval> 1000 </MinPollInterval>
+=09=09=09<PollIntervalIncrement> 500 </PollIntervalIncrement>
+=09=09=09<MaxPollInterval> 2000 </MaxPollInterval>
+=09=09</State>
+=09</States>
+
+</Configuration>
diff --git a/tools/power/x86/intel-lpmd/data/org.freedesktop.intel_lpmd.con=
f b/tools/power/x86/intel-lpmd/data/org.freedesktop.intel_lpmd.conf
new file mode 100644
index 000000000000..f06fd34e4e6f
--- /dev/null
+++ b/tools/power/x86/intel-lpmd/data/org.freedesktop.intel_lpmd.conf
@@ -0,0 +1,20 @@
+<?xml version=3D"1.0"?> <!--*-nxml-*-->
+<!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration 1.=
0//EN"
+        "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
+
+<busconfig>
+
+        <policy user=3D"root">
+                <allow own=3D"org.freedesktop.intel_lpmd"/>
+                <allow send_destination=3D"org.freedesktop.intel_lpmd"/>
+                <allow receive_sender=3D"org.freedesktop.intel_lpmd"/>
+        </policy>
+
+        <!-- Only allow members of the power group to communicate
+             with the daemon -->
+        <policy context=3D"default">
+                <deny send_destination=3D"org.freedesktop.intel_lpmd"/>
+                <allow receive_sender=3D"org.freedesktop.intel_lpmd"/>
+        </policy>
+
+</busconfig>
diff --git a/tools/power/x86/intel-lpmd/data/org.freedesktop.intel_lpmd.ser=
vice.in b/tools/power/x86/intel-lpmd/data/org.freedesktop.intel_lpmd.servic=
e.in
new file mode 100644
index 000000000000..ec41c6b47595
--- /dev/null
+++ b/tools/power/x86/intel-lpmd/data/org.freedesktop.intel_lpmd.service.in
@@ -0,0 +1,5 @@
+[D-BUS Service]
+Name=3Dorg.freedesktop.intel_lpmd
+Exec=3D/bin/false
+User=3Droot
+SystemdService=3Dorg.freedesktop.intel_lpmd.service
diff --git a/tools/power/x86/intel-lpmd/doc/WLT_proxy.md b/tools/power/x86/=
intel-lpmd/doc/WLT_proxy.md
new file mode 100644
index 000000000000..ffd06fc44994
--- /dev/null
+++ b/tools/power/x86/intel-lpmd/doc/WLT_proxy.md
@@ -0,0 +1,84 @@
+
+WLT (workload type) proxy hints use predefined CPU utilization thresholds =
and software algorithm to retrieve and detect WLT (same as WLT hints from h=
ardware (WLTEnable)). When proxy hints detection (WLTProxyEnable) is enable=
d through config option, the hardware WLT hints will be ignored. On detecti=
ng workload type, framework takes predefined action with values in config f=
ile.
+
+# Pre-requisite
+
+|Workload Type (WLT) |Description |Internal states |EPP/EPB|
+| :---:              | :---:      |:---:           |:---:  |
+|Idle |Very low system usage and low power consumption |DEEP_MODE|PS/BAT |
+|BL(Battery Life)|Continuous light system usage with low power consumption=
 |NORM_MODE, RESP_MODE   |PS/BAT (platform optimal value)|
+|Sustained |Continuous heavy tasks without idleness|MDRT_MODE INIT_MODE |P=
erf/AC (platform optimal value)|
+|Bursty |Heavy short tasks with idleness in between |PERF_MODE |Perf/AC|
+
+PS - Power saver; Perf - performance; BAT - Battery bias; AC - AC bias.
+
+# Enabling and leveraging wlt proxy hints for dynamic energy optimization.
+    * Software based WLT Proxy hint overwrites hardware based WLT Hint. To=
 enable proxy hints, both WLT Hint and WLTProxy has to be enabled.
+        ** WLTHintEnable set to Yes
+        <WLTHintEnable>1</WLTHintEnable>
+        ** WLTProxyEnable set to Yes
+        <WLTProxyEnable>1</WLTProxyEnable>
+
+    * WLT Proxy hints are calculated and dynamic energy optimizations are =
applied only in balanced power profile. Set to auto or force on.
+        ** BalancedDef set to AUTO
+        <BalancedDef>0<BalancedDef>
+
+# Value add
+    with Dynamic EPP [based on workload] enabled on Core Ultra Gen 1 [Mete=
or Lake H], HP Baymax14W, CDB, PV SKU8W - N15479-021, in Balanced power pro=
file, 10% performance improvement observed on Crossmark and Speedometer ben=
chmarks.
+
+## Known issues
+    * Performance may suffer on some use cases.
+        ** As algorithm currently takes average of all p-cores and e-cores=
 utilization to identify workload type, solution has limitation of identify=
ing single threaded workloads and memory related workloads. Benchmarks like=
 Geekbench ST, WebXprt, Stream may not show improvement compared to Geekben=
ch MT, Speedometer and Crossmark.
+
+# Workload detection algorithm - pseudo code
+   * System CPU utilization thresholds and conditions are predefined and m=
apped to workload type.
+   * Operating CPU frequency, Spike count rate, state stay time counter an=
d operating frequency-voltage points makes up state switch conditions.
+   * Enabling WLT proxy through config file calls WLT proxy handler.
+   * On WLT Proxy handler,
+        ** CPU load retrieved from system through perf MSR registers (syst=
em snapshot)
+        ** State machine, switch state when predefined conditions are met
+        ** Apply state actions
+        ** Calculate/set new timer interval
+   * When timer expires, WLT Proxy handler called again
+
+# WLT proxy states
+|       | Init  | Perf | Mod4e | Mod3e | Mod2e | Resp | Normal | deep |
+| :---: |:---:  |:---: | :---: | :---: | :---: | :---: | :---: | :---: |
+| init  |     x | [1 cpu].lo < 10 utilization| -| -| -| -| -| - |
+| Perf  | [all cpu].lo > 10 utilization| x| -| C0 max < 10%| -| sum_c0 uti=
l < 20% && sma avg < 70 %| -| - |
+| MOD4E | -     | C0_max > 90%| x| -| -| worst_stall < 70%| sma_avg1 < 25 =
AND sma_avg2 < 25 AND sum_c0 < 50%| - |
+| MOD3E | -     | C0_max > 90%| sma_avg1 > 25 AND sma_avg2 > 20| x| sma_av=
g1 b.w 4 and 25 AND sma_avg2 b/w 4 and 25| worst_stall < 70%| sma_avg1 < 4 =
AND sma_avg2 < 2 AND sma_avg3 < 2| - |
+| MOD2E | -     | -     | -| C0_max > 90% OR sma_avg1 > 25  AND sma_avg2 >=
 15| x| sorst_stall < 70%| sma_avg1 b/w 4 and 25 AND sma_avg2 < 25 countdow=
n and switch| - |
+| Resp  | -     | C0_max > 70% && sma_avg1 > 40%| -| worst stall > 70%| -|=
 x| -| - |
+| Normal| -     | -     | -| -| C0_max > 50% OR sma_avg1 > 40| worst stall=
 < 70%| x| C0_max < 10% AND C0_2ndMax < 1% OR sma_avg1 < 2%; countdown and =
switch |
+| Deep  | -     | -     | -| -| -| worst_stall < 70%| C0_max > 35%| x |
+
+x =E2=80=93 invalid/same state; - not allowed state
+
+Variables used in state switch condition:
+*    Multithreaded workload: all applicable CPUs for state utilized more t=
hat 10%. Not multithread workload: at least one CPU is utilized < 10%.
+*    CPU.L0=3D 100 * perf_stats[t].mperf_diff /  perf_stats[t].tsc_diff
+        * Also following values will be calculated based on L0. C0_max , M=
in_load[C0.min]; max_load, max_2nd, max_3rd
+*    sum_c0 =3D grp.c0_max + grp.c0_2nd_max + grp.c0_3rd_max
+*    sma - simple moving average [tracks 3 max utilizations]
+*    worst stall - perf_stats[t].pperf_diff /  perf_stats[t].aperf_diff. c=
pu in wait due to memory of other dependency.
+
+# Files & functionality
+
+## wlt_proxy.c
+   * wlt proxy detection interface file
+   * handles wlt_proxy enable/disable; entry/exit, timer expiry handler
+## state_machine.c
+   * handle current state
+   * determine state change
+## spike_mgmt.c
+   * counts CPU utilization spike counts in given period
+   * handles bursty workload type detection entry and exit
+## state_util.c
+   * retrieval  of pref, HFM and SMA
+   * calculations for state switch
+## state_manager.c
+   * state definition & management
+   * state initialization/deinitialization
+   * mapping state to workload type
+   * polling frequency calculations
diff --git a/tools/power/x86/intel-lpmd/lpmd-resource.gresource.xml b/tools=
/power/x86/intel-lpmd/lpmd-resource.gresource.xml
new file mode 100644
index 000000000000..fe1c028f9858
--- /dev/null
+++ b/tools/power/x86/intel-lpmd/lpmd-resource.gresource.xml
@@ -0,0 +1,6 @@
+<?xml version=3D"1.0" encoding=3D"UTF-8"?>
+<gresources>
+  <gresource prefix=3D"/org/freedesktop/intel_lpmd">
+    <file preprocess=3D"xml-stripblanks">src/intel_lpmd_dbus_interface.xml=
</file>
+  </gresource>
+</gresources>
diff --git a/tools/power/x86/intel-lpmd/man/intel_lpmd.8 b/tools/power/x86/=
intel-lpmd/man/intel_lpmd.8
new file mode 100644
index 000000000000..9d2484e3adff
--- /dev/null
+++ b/tools/power/x86/intel-lpmd/man/intel_lpmd.8
@@ -0,0 +1,79 @@
+.\" SPDX-License-Identifier: GPL-2.0-only
+.\" Copyright (C) 2026 Intel Corporation */
+.TH intel_lpmd "8" "08 Apr 2026"
+
+.SH NAME
+intel_lpmd \- Intel Energy Optimizer (LPMD) Daemon
+.SH SYNOPSIS
+.B intel_lpmd
+.RI " [ " OPTIONS " ]
+
+.SH DESCRIPTION
+.B intel_lpmd
+is a Linux daemon used for energy optimization on Intel hybrid systems. Th=
is
+daemon uses a configuration file called "intel_lpmd_config.xml". The other
+installed configuration files are to be treated as best practice templates=
. The
+main configuration file should be edited by the user to enable LPMD and it=
's
+desired functionalities. Based on the configuration and system utilization=
 LPMD
+can:
+
+- choose the best set of CPU cores to enable for a given moment in time
+
+- choose the best EPP (energe performance preference) and EPB (energy
+performance bias) value
+
+- pick the best SoC power slider settings
+
+There is a control utility distributed along with this daemon. It's called
+"intel_lpmd_control" and it can be used to change modes in the running LPM=
D
+instance.
+
+.SH OPTIONS
+.TP
+.B -h --help
+Print the help message
+
+.TP
+.B --version
+Print intel_lpmd version and exit
+
+.TP
+.B --no-daemon
+Don't run as a daemon: Default is daemon mode
+
+.TP
+.B --systemd
+Assume daemon is started by systemd
+
+.TP
+.B --loglevel=3D
+log severity: can be info or debug
+
+.TP
+.B --dbus-enable
+Enable Dbus server to receive requests via Dbus
+
+.TP
+.B --ignore-platform-check
+Ignore platform check
+
+.SH EXAMPLES
+.TP
+.B intel_lpmd --loglevel=3Dinfo --no-daemon --dbus-enable
+Run intel_lpmd with log directed to stdout
+
+.TP
+.B intel_lpmd --systemd --dbus-enable
+Run intel_lpmd as a service with logs directed to system journal
+
+.TP
+.B sudo systemctl enable intel_lpmd.service --now
+Enable and run intel_lpmd as a systemd service that's persistent after sys=
tem
+reboot.
+
+.SH SEE ALSO
+intel_lpmd_config.xml(5), intel_lpmd_control(8)
+
+.SH AUTHOR
+Written by Zhang Rui <rui.zhang@intel.com>
+
diff --git a/tools/power/x86/intel-lpmd/man/intel_lpmd_config.xml.5 b/tools=
/power/x86/intel-lpmd/man/intel_lpmd_config.xml.5
new file mode 100644
index 000000000000..45320307fd24
--- /dev/null
+++ b/tools/power/x86/intel-lpmd/man/intel_lpmd_config.xml.5
@@ -0,0 +1,329 @@
+.\" SPDX-License-Identifier: GPL-2.0-only
+.\" Copyright (C) 2026 Intel Corporation */
+.TH intel_lpmd_config.xml "5" "8 Apr 2026"
+
+.SH NAME
+intel_lpmd_config.xml \- Configuration file for intel_lpmd
+.SH SYNOPSIS
+$(TDCONFDIR)/etc/intel_lpmd/intel_lpmd_config.xml
+
+.SH DESCRIPTION
+.B intel_lpmd_config.xml
+is a configuration file for the Intel Low Power Mode Daemon. It's used to
+describe states and rules of switching between the states. These states ar=
e
+custom, user defined sets of parameters that the platform should use for o=
ptimal
+performance and energy saving. The rules of switching refer to what system
+information dictates whether a change of state is needed or not. It can be
+either information from a hardware source or software calculated if the ha=
rdware
+features are not supported.
+
+.PP
+.B lp_mode_cpus
+is a set of active CPUs when system is in Low Power Mode. This usually equ=
als a
+group of most power efficient CPUs on a platform to achieve best power sav=
ing.
+When not specified, intel_lpmd tool can detect this automatically. E.g. it=
 uses
+L-cores on Intel PantherLake platform, the E-core Module on Intel Alderlak=
e
+platform, and it uses the Low Power E-cores on SoC Die on Intel Meteorlake
+platform.
+.PP
+.B Mode
+specifies the way to migrate the tasks to the lp_mode_cpus.
+.IP \(bu 2
+Mode 0: set cpuset to the lp_mode_cpus for systemd. All tasks created by
+systemd will run on these CPUs only. This is supported for cgroup v2 based
+systemd only.
+.IP \(bu 2
+Mode 1: Isolate the non-lp_mode_cpus so that tasks are scheduled to the
+lp_mode_cpus only.
+.IP \(bu 2
+Mode 2: Force idle injection to the non-lp_mode_cpus and leverage the
+scheduler to schedule the other tasks to the lp_mode_cpus.
+.PP
+.B PerformanceDef / BalancedDef / PowersaverDef
+specifies the default behavior for a given power profile.
+.IP \(bu 2
+-1 : Never enter Low Power Mode.
+.IP \(bu 2
+0 : opportunistic Low Power Mode enter/exit based on HFI/Utilization reque=
st.
+.IP \(bu 2
+1 : Always stay in Low Power Mode.
+.PP
+.B HfiLpmEnable
+specifies if the HFI monitor can capture the HFI hints for Low Power Mode.
+.PP
+.B HfiSuvEnable
+specifies if the HFI monitor can capture the HFI hints for survivability m=
ode.
+.PP
+.B WLTHintEnable
+Enable use of hardware Workload type hints.
+.PP
+.B WLTProxyEnable
+Enable use of Proxy Workload type hints.
+.PP
+.B util_entry_threshold
+specifies the system utilization threshold for entering Low Power Mode.
+The system workload is considered to fit the lp_mode_cpus capacity when sy=
stem
+utilization is under this threshold.
+Setting to 0 or leaving this empty disables the utilization monitor.
+.PP
+.B util_exit_threshold
+specifies the CPU utilization threshold for exiting Low Power Mode.
+The system workload is considered to not fit the lp_mode_cpus capacity whe=
n
+the utilization of the busiest lp_mode_cpus is above this threshold.
+Setting to 0 or leaving this empty disables the utilization monitor.
+.PP
+.B IgnoreITMT
+Avoid changing scheduler ITMT flag. This means that during transition to
+low power mode, ITMT flag is not changed. This reduces latency during
+switching. This flag is not used when configuration uses "State" based
+configuration, where this flag can be defined per state. ITMT is only rele=
vant
+for platforms before Lunar Lake and the debugfs file is not present on lat=
er
+platforms.
+.PP
+.B States
+Allows one to define per platform low power states. Each state defines
+has an entry condition and set of parameters to use.
+
+.SH State Definition
+There can be multiple state configurations present. Each configuration is =
valid
+for a platform. A state header defines parameters, which are used to match=
 a
+platform.
+.B CPUFamily
+CPU generation to match.
+.PP
+.B CPUModel
+CPU model to match.
+.PP
+.B CPUConfig
+Define a configuration of CPUs and TDP to match different skews for the
+same CPU model and family. CPU configuration string format is:
+xPyEzL-tdpW. For example: 12P8E2L-28W, defines a platform with 6 P-cores
+with hyper threading enabled, 8 E cores, 2 LPE cores and the TDP is 28W.
+This configuration allows wildcard "*" to match any combination.
+
+.SH Per State Definition
+Each "State" defines entry criteria and parameters to use.
+.B ID
+A unique ID for the state.
+.PP
+.B Name
+A name for the state.
+.PP
+.B EntrySystemLoadThres
+System Entry load threshold in percent. System utilization is different
+based on the number of active CPUs in a configuration. This value
+is calculated from /proc/stat sysfs. To enter into this state, the
+system utilization must be less or equal to this value.
+.PP
+.B EnterCPULoadThres
+CPU Entry load threshold in percent. Per CPU utilization is also obtained
+from /proc/stat. To enter into this state any active CPU utilization must
+be less or equal to this value.
+EnterCPULoadThres is checked before EntrySystemLoadThres to match a state.
+.PP
+.B WLTType
+Workload type value to enter into this state. If this value is defined
+then utilization based entry triggers are not used. To use this
+WLTHintEnable must be enabled, so that hardware notifications are enabled.
+.PP
+.B ActiveCPUs
+Active CPUs in this state. The list can be comma separated or use "-" for
+a range. This is optional to have active CPUs in a state.
+.PP
+.B EPP
+EPP to apply for this state. -1 to ignore.
+.PP
+.B EPB
+EPB to apply for this state. -1 to ignore.
+.PP
+.B ITMTState
+Set the state of ITMT flag. -1 to ignore. ITMT is only relevant for platfo=
rms
+before MTL and the debugfs file is not present on later platforms.
+.PP
+.B IRQMigrate
+Migrate IRQs to the active CPUs in this state. -1 to ignore.
+.PP
+.B MinPollInterval
+Minimum polling interval in milliseconds.
+.PP
+.B MaxPollInterval
+Maximum polling interval in milli seconds. This is optional,
+if there is no maximum is desired.
+.PP
+.B PollIntervalIncrement
+Polling interval increment in milli seconds. If this value
+is -1, then polling increment is adaptive based on the utilization.
+
+
+.SH FILE FORMAT
+The configuration file format conforms to XML specifications.
+.sp 1
+.EX
+<Configuration>
+=09<!--
+=09=09CPU format example: 1,2,4..6,8-10
+=09-->
+=09<lp_mode_cpus>Example CPUs</lp_mode_cpus>
+
+=09<!--
+=09=09Mode values
+=09=090: Cgroup v2
+=09=091: Cgroup v2 isolate
+=09=092: CPU idle injection
+=09-->
+=09<Mode>0|1|2</Mode>
+
+=09<!--
+=09=09Default behavior when Performance power setting is used
+=09=09-1: force off. (Never enter Low Power Mode)
+=09=09 1: force on. (Always stay in Low Power Mode)
+=09=09 0: auto. (opportunistic Low Power Mode enter/exit)
+=09-->
+=09<PerformanceDef>-1|0|1</PerformanceDef>
+
+=09<!--
+=09=09Default behavior when Balanced power setting is used
+=09=09-1: force off. (Never enter Low Power Mode)
+=09=09 1: force on. (Always stay in Low Power Mode)
+=09=09 0: auto. (opportunistic Low Power Mode enter/exit)
+=09-->
+=09<BalancedDef>-1|0|1</BalancedDef>
+
+=09<!--
+=09=09Default behavior when Power saver setting is used
+=09=09-1: force off. (Never enter Low Power Mode)
+=09=09 1: force on. (Always stay in Low Power Mode)
+=09=09 0: auto. (opportunistic Low Power Mode enter/exit)
+=09-->
+=09<PowersaverDef>-1|0|1</PowersaverDef>
+
+=09<!--
+=09=09Use HFI LPM hints
+=09=090 : No
+=09=091 : Yes
+=09-->
+=09<HfiLpmEnable>0|1</HfiLpmEnable>
+
+=09<!--
+=09=09Use HFI SUV hints
+=09=090 : No
+=09=091 : Yes
+=09-->
+=09<HfiSuvEnable>0|1</HfiSuvEnable>
+
+=09<!--
+=09=09System utilization threshold to enter LP mode
+=09=09from 0 - 100
+=09-->
+=09<util_entry_threshold>Example threshold</util_entry_threshold>
+
+=09<!--
+=09=09System utilization threshold to exit LP mode
+=09=09from 0 - 100
+=09-->
+=09<util_exit_threshold>Example threshold</util_exit_threshold>
+
+=09<!--
+=09=09EPP to use in Low Power Mode
+=09=090-255: Valid EPP value to use in Low Power Mode
+=09=09   -1: Don't change EPP in Low Power Mode
+=09-->
+=09<lp_mode_epp>-1 | EPP value</lp_mode_epp>
+
+</Configuration>
+
+.EE
+.SH EXAMPLE CONFIGURATIONS
+.PP
+.B Example 1:
+This is the minimum configuration.
+.IP \(bu 2
+lp_mode_cpus: not set. Detects the lp_mode_cpus automatically.
+.IP \(bu 2
+Mode: 0. Use cgroup-v2 systemd for task migration.
+.IP \(bu 2
+HfiLpmEnable: 0. Ignore HFI Low Power mode hints.
+.IP \(bu 2
+HfiSuvEnable: 0. Ignore HFI Survivability mode hints. With both HfiLpmEnab=
le and HfiSuvEnable cleared, the HFI monitor will be disabled.
+.IP \(bu 2
+util_entry_threshold: 0. Disable utilization monitor.
+.IP \(bu 2
+util_exit_threshold: 0. Disable utilization monitor.
+.IP \(bu 2
+lp_mode_epp: -1. Do not change EPP when entering Low Power Mode.
+
+.sp 1
+.EX
+<?xml version=3D"1.0"?>
+<Configuration>
+=09<lp_mode_cpus></lp_mode_cpus>
+=09<Mode>0</Mode>
+=09<HfiLpmEnable>0</HfiLpmEnable>
+=09<HfiSuvEnable>0</HfiSuvEnable>
+=09<util_entry_threshold>0</util_entry_threshold>
+=09<util_exit_threshold>0</util_exit_threshold>
+=09<lp_mode_epp>-1</lp_mode_epp>
+</Configuration>
+.PP
+.B Example 2:
+This is the typical configuration. The utilization thresholds and delays m=
ay be different based on requirement.
+.IP \(bu 2
+lp_mode_cpus: not set. Detects the lp_mode_cpus automatically.
+.IP \(bu 2
+Mode: 0. Use cgroup-v2 systemd for task migration.
+.IP \(bu 2
+HfiLpmEnable: 1. Enter/Exit Low Power Mode based on HFI hints.
+.IP \(bu 2
+HfiSuvEnable: 1. Enter/Exit Survivability mode based on HFI hints.
+.IP \(bu 2
+util_entry_threshold: 5. Enter Low Power Mode when system utilization is l=
ower than 5%.
+.IP \(bu 2
+util_exit_threshold: 95. Exit Low Power Mode when the utilization of any o=
f the lp_mode_cpus is higher than 95%.
+.IP \(bu 2
+lp_mode_epp: -1. Do not change EPP when entering Low Power Mode.
+
+.sp 1
+.EX
+<?xml version=3D"1.0"?>
+<Configuration>
+=09<lp_mode_cpus></lp_mode_cpus>
+=09<Mode>0</Mode>
+=09<HfiLpmEnable>1</HfiLpmEnable>
+=09<HfiSuvEnable>1</HfiSuvEnable>
+=09<util_entry_threshold>5</util_entry_threshold>
+=09<util_exit_threshold>95</util_exit_threshold>
+=09<lp_mode_epp>-1</lp_mode_epp>
+</Configuration>
+.EE
+
+.SH Currently unimplemented options
+.PP
+.B EntryDelayMS
+specifies the sample interval used by the utilization Monitor when system
+wants to enter Low Power Mode based on system utilization.
+Setting to 0 or leaving this empty will cause the utilization Monitor to u=
se
+the default interval, 1000 milli seconds.
+.PP
+.B ExitDelayMS
+specifies the sample interval used by the utilization Monitor when system
+wants to exit Low Power Mode based on CPU utilization.
+Setting to 0 or leaving this empty will cause the utilization Monitor to u=
se
+the adaptive value. The adaptive interval is based on CPU utilization.
+The busier the CPU is, the shorter interval the utilization monitor uses.
+.PP
+.B EntryHystMS
+specifies a hysteresis threshold when system is in Low Power Mode.
+If set, when the previous average time stayed in Low Power Mode is lower t=
han
+this value, the current enter Low Power Mode request will be ignored becau=
se
+it is expected that the system will exit Low Power Mode soon.
+Setting to 0 or leaving this empty disables this hysteresis algorithm.
+.PP
+.B ExitHystMS
+specifies a hysteresis threshold when system is not in Low Power Mode.
+If set, when the previous average time stayed out of Low-Power-Mode is low=
er
+than this value, the current exit Low Power Mode request will be ignored
+because it is expected that the system will enter Low Power Mode soon.
+Setting to 0 or leaving this empty disables this hysteresis algorithm.
+
+.SH SEE ALSO
+intel_lpmd(8), intel_lpmd_control(8)
diff --git a/tools/power/x86/intel-lpmd/man/intel_lpmd_control.8 b/tools/po=
wer/x86/intel-lpmd/man/intel_lpmd_control.8
new file mode 100644
index 000000000000..0a4de5a7f834
--- /dev/null
+++ b/tools/power/x86/intel-lpmd/man/intel_lpmd_control.8
@@ -0,0 +1,44 @@
+.\" SPDX-License-Identifier: GPL-2.0-only
+.\" Copyright (C) 2026 Intel Corporation */
+.TH intel_lpmd_control "8" "8 Apr 2026"
+
+.SH NAME
+intel_lpmd_control \- Control utility for the Intel Low Power Mode Daemon =
(LPMD)
+.SH SYNOPSIS
+.B intel_lpmd_control
+.RI " [ " OPTIONS " ]
+
+.SH DESCRIPTION
+.B intel_lpmd_control
+is a command-line utility used to control the Intel Low Power Mode Daemon
+(LPMD). It allows users to enable, disable, or set the daemon to automatic=
 mode
+based on system utilization.
+
+.SH OPTIONS
+.TP
+.B ON
+Enables low power mode operation.
+.TP
+.B OFF
+Disables low power mode operation.
+.TP
+.B AUTO
+Enables operation in automatic mode, allowing system utilization to determ=
ine
+low power state activation.
+
+.SH EXAMPLES
+.TP
+.B intel_lpmd_control ON
+Turns on low power mode operation.
+.TP
+.B intel_lpmd_control OFF
+Turns off low power mode operation.
+.TP
+.B intel_lpmd_control AUTO
+Turns on low power mode operation in automatic mode.
+
+.SH SEE ALSO
+.B intel_lpmd_config.xml(5), intel_lpmd(8)
+
+.SH AUTHOR
+Written by Deepak Sundar <deepak.sundar@intel.com>
diff --git a/tools/power/x86/intel-lpmd/src/include/lpmd.h b/tools/power/x8=
6/intel-lpmd/src/include/lpmd.h
new file mode 100644
index 000000000000..996ca082f29d
--- /dev/null
+++ b/tools/power/x86/intel-lpmd/src/include/lpmd.h
@@ -0,0 +1,408 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef LPMD_INTEL_LPMD_H
+#define LPMD_INTEL_LPMD_H
+
+#include <stdio.h>
+#include <getopt.h>
+#include <locale.h>
+#include <errno.h>
+#include <stdbool.h>
+#include <stdlib.h>
+#include <stdint.h>
+#include <signal.h>
+#include <pthread.h>
+#include <unistd.h>
+#include <fcntl.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+#include <string.h>
+#include <signal.h>
+#include <poll.h>
+#include <cpuid.h>
+
+#include "config.h"
+#include "thermal.h"
+
+#define LOG_DEBUG_INFO=091
+
+#define LOCKF_SUPPORT
+
+#ifdef GLIB_SUPPORT
+#include <glib.h>
+#include <glib/gi18n.h>
+#include <gmodule.h>
+
+extern gint watcher_id;
+
+// Log macros
+enum log_level {
+=09LPMD_LOG_NONE,
+=09LPMD_LOG_INFO,
+=09LPMD_LOG_DEBUG,
+=09LPMD_LOG_MSG,
+=09LPMD_LOG_WARN,
+=09LPMD_LOG_ERROR,
+=09LPMD_LOG_FATAL,
+};
+
+#define lpmd_log_fatal=09=09g_error=09=09// Print error and terminate
+#define lpmd_log_error=09=09g_critical
+#define lpmd_log_warn=09=09g_warning
+#define lpmd_log_msg=09=09g_message
+#define lpmd_log_debug=09=09g_debug
+#define lpmd_log_info(...)=09g_log(NULL, G_LOG_LEVEL_INFO, __VA_ARGS__)
+#else
+static int dummy_printf(const char *__restrict __format, ...)
+{
+=09return 0;
+}
+
+#define lpmd_log_fatal=09=09printf
+#define lpmd_log_error=09=09printf
+#define lpmd_log_warn=09=09printf
+#define lpmd_log_msg=09=09printf
+#define lpmd_log_debug=09=09dummy_printf
+#define lpmd_log_info=09=09printf
+#endif
+
+// Common return value defines
+#define LPMD_SUCCESS=09=090
+#define LPMD_ERROR=09=09-1
+#define LPMD_FATAL_ERROR=09=09-2
+
+// Dbus related
+/* Well-known name for this service. */
+#define INTEL_LPMD_SERVICE_NAME=09=09"org.freedesktop.intel_lpmd"
+#define INTEL_LPMD_SERVICE_OBJECT_PATH=09"/org/freedesktop/intel_lpmd"
+#define INTEL_LPMD_SERVICE_INTERFACE=09"org.freedesktop.intel_lpmd"
+
+enum message_name_t {
+=09TERMINATE, LPM_FORCE_ON, LPM_FORCE_OFF, LPM_AUTO, HFI_EVENT,
+};
+
+#define MAX_MSG_SIZE=09=09512
+
+struct message_capsul_t {
+=09enum message_name_t msg_id;
+=09int msg_size;
+=09unsigned long msg[MAX_MSG_SIZE];
+};
+
+#define MAX_STR_LENGTH=09=09256
+#define MAX_CONFIG_STATES=0910
+#define MAX_STATE_NAME=09=0932
+#define MAX_CONFIG_LEN=09=0964
+
+enum lpmd_states {
+=09LPMD_OFF,
+=09LPMD_ON,
+=09LPMD_AUTO,
+=09LPMD_FREEZE,
+=09LPMD_RESTORE,
+=09LPMD_TERMINATE,
+};
+
+enum lpmd_update_reason {
+=09UPDATE_USER,
+=09UPDATE_UTIL,
+=09UPDATE_HFI,
+=09UPDATE_CPUHOTPLUG,
+=09UPDATE_WLT,
+};
+
+struct lpmd_data_t {
+=09int util_cpu;=09/* From Util monitor */
+=09int util_sys;=09/* From Util monitor */
+=09int util_gfx;=09/* From Util monitor */
+=09int wlt_hint;=09/* From WLT monitor */
+=09int polling_interval;
+=09int need_update;
+};
+
+enum default_config_state {
+=09DEFAULT_OFF,=09/* lpmd force off: state with all default power settings=
 */
+=09DEFAULT_ON,=09/* lpmd force on: state with global CPU/IRQ/ITMT/EPP conf=
igurations */
+=09DEFAULT_HFI,=09/* LPM state with CPU isolation based on HFI hints only =
*/
+=09CONFIG_STATE_BASE,
+=09MAX_STATES =3D CONFIG_STATE_BASE + MAX_CONFIG_STATES,
+=09STATE_NONE =3D MAX_STATES,
+};
+
+struct lpmd_config_state_t {
+=09int id;
+=09int valid;
+=09char name[MAX_STATE_NAME];
+=09int wlt_type;
+=09int entry_system_load_thres;
+=09int exit_system_load_thres;
+=09int exit_system_load_hyst;
+=09int enter_cpu_load_thres;
+=09int exit_cpu_load_thres;
+=09int enter_gfx_load_thres;
+=09int exit_gfx_load_thres;
+=09int min_poll_interval;
+=09int max_poll_interval;
+=09int poll_interval_increment;
+=09int epp;
+=09int epb;
+=09char active_cpus[MAX_STR_LENGTH];
+=09// If active CPUs are specified then
+=09// the below counts don't matter
+=09int island_0_number_p_cores;
+=09int island_0_number_e_cores;
+=09int island_1_number_p_cores;
+=09int island_1_number_e_cores;
+=09int island_2_number_p_cores;
+=09int island_2_number_e_cores;
+
+=09int itmt_state;
+=09int irq_migrate;
+
+=09int balance_slider_ac;
+=09int slider_offset_ac;
+=09int balance_slider_dc;
+=09int slider_offset_dc;
+
+=09// Private state variables, not configurable
+=09int entry_load_sys;
+=09int entry_load_cpu;
+=09int cpumask_idx;
+=09int steady;
+};
+
+// lpmd config data
+struct lpmd_config_t {
+=09int mode;
+=09int performance_def;
+=09int balanced_def;
+=09int powersaver_def;
+=09int hfi_lpm_enable;
+=09int wlt_hint_enable;
+=09int wlt_hint_poll_enable;
+=09int wlt_proxy_enable;
+=09int wlt_hint_mask;
+
+=09union {
+=09=09struct {
+=09=09=09uint32_t util_sys_enable:1;
+=09=09=09uint32_t util_cpu_enable:1;
+=09=09=09uint32_t util_gfx_enable:1;
+=09=09=09uint32_t util_reserved:29;
+=09=09};
+=09=09uint32_t util_enable;
+=09};
+=09int util_entry_threshold;
+=09int util_exit_threshold;
+=09int util_entry_delay;
+=09int util_exit_delay;
+=09int util_entry_hyst;
+=09int util_exit_hyst;
+=09int ignore_itmt;
+=09int lp_mode_epp;
+=09char lp_mode_cpus[MAX_STR_LENGTH];
+=09int cpu_family;
+=09int cpu_model;
+=09char cpu_config[MAX_CONFIG_LEN];
+=09int config_state_count;
+=09int tdp;
+
+=09int balance_slider_def_ac;
+=09int slider_offset_def_ac;
+=09int balance_slider_def_dc;
+=09int slider_offset_def_dc;
+
+=09struct lpmd_config_state_t config_states[MAX_STATES];
+=09struct lpmd_data_t data;
+};
+
+enum lpm_cpu_process_mode {
+=09LPM_CPU_CGROUPV2,
+=09LPM_CPU_ISOLATE,
+=09LPM_CPU_POWERCLAMP,
+=09LPM_CPU_OFFLINE,
+=09LPM_CPU_MODE_MAX =3D LPM_CPU_POWERCLAMP,
+};
+
+#define NUM_USER_CPUMASKS=0910
+enum cpumask_idx {
+=09CPUMASK_LPM_DEFAULT,
+=09CPUMASK_ONLINE,
+=09CPUMASK_HFI,
+=09CPUMASK_HFI_BANNED,
+=09CPUMASK_HFI_LAST,
+=09CPUMASK_UTIL,
+=09CPUMASK_USER,
+=09CPUMASK_MAX =3D CPUMASK_USER + NUM_USER_CPUMASKS,
+=09CPUMASK_NONE =3D CPUMASK_MAX,
+};
+
+#define UTIL_DELAY_MAX=09=095000
+#define UTIL_HYST_MAX=09=0910000
+
+#define cpuid(leaf, eax, ebx, ecx, edx)=09=09=09=09=09=09=09=09=09\
+=09do {=09=09=09=09=09=09=09=09=09=09=09=09\
+=09=09__cpuid(leaf, eax, ebx, ecx, edx);=09=09=09=09=09=09=09\
+=09=09lpmd_log_debug("CPUID 0x%08x: eax =3D 0x%08x ebx =3D 0x%08x ecx =3D =
0x%08x edx =3D 0x%08x\n",=09\
+=09=09=09=09leaf, eax, ebx, ecx, edx);=09=09=09=09=09=09\
+=09} while (0)
+
+#define cpuid_count(leaf, subleaf, eax, ebx, ecx, edx)=09=09=09=09=09=09=
=09\
+=09do {=09=09=09=09=09=09=09=09=09=09=09=09\
+=09=09__cpuid_count(leaf, subleaf, eax, ebx, ecx, edx);=09=09=09=09=09\
+=09=09lpmd_log_debug("CPUID 0x%08x subleaf 0x%08x: eax =3D 0x%08x ebx =3D =
0x%08x ecx =3D 0x%08x"=09\
+=09=09=09=09"edx =3D 0x%08x\n", leaf, subleaf, eax, ebx, ecx, edx);=09=09=
=09\
+=09} while (0)
+
+#define SETTING_RESTORE=09-2
+#define SETTING_IGNORE=09-1
+
+/* WLT hints parsing */
+enum wlt_type_t {
+=09WLT_IDLE =3D 0,
+=09WLT_BATTERY_LIFE =3D 1,
+=09WLT_SUSTAINED =3D 2,
+=09WLT_BURSTY =3D 3,
+=09WLT_INVALID =3D 4,
+};
+
+enum power_profile_daemon_mode {
+=09PPD_PERFORMANCE,
+=09PPD_BALANCED,
+=09PPD_POWERSAVER,
+=09PPD_INVALID
+};
+
+#define DEF_POLLING_INTERVAL=09100
+
+/* lpmd_main.c */
+int in_debug_mode(void);
+int do_platform_check(void);
+
+/* lpmd_proc.c: interfaces */
+struct lpmd_config_t *get_lpmd_config(void);
+
+int lpmd_lock(void);
+int lpmd_unlock(void);
+
+void lpmd_terminate(void);
+void lpmd_force_on(void);
+void lpmd_force_off(void);
+void lpmd_set_auto(void);
+
+int is_on_battery(void);
+int get_ppd_mode(void);
+
+/* lpmd_proc.c: init func */
+int lpmd_main(void);
+void update_reason(int reason);
+
+/* lpmd_dbus_server.c */
+int intel_dbus_server_init(gboolean (*exit_handler)(void));
+
+/* lpmd_config.c */
+int lpmd_get_config(struct lpmd_config_t *lpmd_config);
+
+/* lpmd_state_machine.c */
+int update_lpmd_state(int state);
+int get_lpmd_state(void);
+int lpmd_init_config_state(struct lpmd_config_state_t *state);
+int lpmd_build_config_states(struct lpmd_config_t *config);
+int lpmd_enter_next_state(void);
+
+/* lpmd_util.c */
+int util_update(struct lpmd_config_t *lpmd_config);
+
+/* lpmd_hfi.c */
+int hfi_init(void);
+int hfi_kill(void);
+int hfi_update(void);
+
+/* lpmd_wlt.c */
+int wlt_init(void);
+int wlt_exit(void);
+int wlt_update(int fd);
+
+/* lpmd_misc.c */
+void itmt_init(void);
+int get_itmt(void);
+int process_itmt(struct lpmd_config_state_t *state);
+
+int epp_epb_init(void);
+int get_epp_epb(int *epp, char *epp_str, int size, int *epb);
+int process_epp_epb(struct lpmd_config_state_t *state);
+
+void process_balance_slider_default_update(struct lpmd_config_t *config);
+void process_slider_offset_default_update(struct lpmd_config_t *config);
+void process_slider(struct lpmd_config_t *config, struct lpmd_config_state=
_t *state);
+
+/* lpmd_irq.c */
+int irq_init(void);
+int process_irq(struct lpmd_config_state_t *state);
+
+/* lpmd_cgroup.c*/
+int cgroup_init(struct lpmd_config_t *config);
+int cgroup_cleanup(void);
+int process_cgroup(struct lpmd_config_state_t *state, enum lpm_cpu_process=
_mode mode);
+
+/* lpmd_uevent.c */
+int uevent_init(void);
+int check_cpu_hotplug(void);
+
+/* lpmd_cpu.c */
+int detect_supported_platform(struct lpmd_config_t *lpmd_config);
+int detect_cpu_topo(struct lpmd_config_t *lpmd_config);
+int detect_lpm_cpus(char *cmd_cpus);
+
+int is_cpu_ecore(int cpu);
+int is_cpu_pcore(int cpu);
+
+/* lpmd_cpumask.c */
+int is_cpu_online(int cpu);
+int get_max_cpus(void);
+void set_max_cpus(int num);
+int get_max_online_cpu(void);
+void set_max_online_cpu(int num);
+int cpu_migrate(int cpu);
+int cpu_clear_affinity(void);
+
+int cpumask_alloc(void);
+int cpumask_free(enum cpumask_idx idx);
+int cpumask_reset(enum cpumask_idx idx);
+
+int cpumask_add_cpu(int cpu, enum cpumask_idx idx);
+int cpumask_init_cpus(char *buf, enum cpumask_idx idx);
+int cpumask_nr_cpus(enum cpumask_idx idx);
+int cpumask_has_cpu(enum cpumask_idx idx);
+
+int cpumask_equal(enum cpumask_idx idx1, enum cpumask_idx idx2);
+void cpumask_copy(enum cpumask_idx source, enum cpumask_idx dest);
+void cpumask_exclude_copy(enum cpumask_idx source, enum cpumask_idx dest, =
enum cpumask_idx exclude);
+
+char *get_cpus_str(enum cpumask_idx idx);
+char *get_cpus_hexstr(enum cpumask_idx idx);
+char *get_proc_irq_str(enum cpumask_idx idx);
+char *get_irqbalance_str(enum cpumask_idx idx);
+char *get_cpu_isolation_str(enum cpumask_idx idx);
+uint8_t *get_cgroup_systemd_vals(enum cpumask_idx idx, int *size);
+
+/* socket.c */
+int socket_init_connection(char *name);
+int socket_send_cmd(char *name, char *data);
+
+/* helper */
+int copy_user_string(char *src, char *dst, int size);
+int lpmd_read_str(char *path, char *str, int size);
+int lpmd_write_str(const char *name, char *str, int print_level);
+int lpmd_write_str_verbose(const char *name, char *str, int print_level);
+int lpmd_write_str_append(const char *name, char *str, int print_level);
+int lpmd_write_int(const char *name, int val, int print_level);
+int lpmd_open(const char *name, int print_level);
+int lpmd_read_int(const char *name, int *val, int print_level);
+int lpmd_read_yn(const char *name, int *val, int print_level);
+int lpmd_write_yn(const char *name, int val, int print_level);
+char *get_time(void);
+void time_start(void);
+char *time_delta(void);
+uint64_t read_msr(int cpu, uint32_t msr);
+#endif
diff --git a/tools/power/x86/intel-lpmd/src/include/thermal.h b/tools/power=
/x86/intel-lpmd/src/include/thermal.h
new file mode 100644
index 000000000000..e2d2eb1eb0b6
--- /dev/null
+++ b/tools/power/x86/intel-lpmd/src/include/thermal.h
@@ -0,0 +1,94 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _UAPI_LINUX_THERMAL_H
+#define _UAPI_LINUX_THERMAL_H
+
+#define THERMAL_NAME_LENGTH=0920
+
+enum thermal_device_mode {
+=09THERMAL_DEVICE_DISABLED =3D 0, THERMAL_DEVICE_ENABLED,
+};
+
+enum thermal_trip_type {
+=09THERMAL_TRIP_ACTIVE =3D 0, THERMAL_TRIP_PASSIVE, THERMAL_TRIP_HOT, THER=
MAL_TRIP_CRITICAL,
+};
+
+/* Adding event notification support elements */
+#define THERMAL_GENL_FAMILY_NAME=09=09"thermal"
+#define THERMAL_GENL_VERSION=09=09=090x01
+#define THERMAL_GENL_SAMPLING_GROUP_NAME=09"sampling"
+#define THERMAL_GENL_EVENT_GROUP_NAME=09=09"event"
+
+/* Attributes of thermal_genl_family */
+enum thermal_genl_attr {
+=09THERMAL_GENL_ATTR_UNSPEC,
+=09THERMAL_GENL_ATTR_TZ,
+=09THERMAL_GENL_ATTR_TZ_ID,
+=09THERMAL_GENL_ATTR_TZ_TEMP,
+=09THERMAL_GENL_ATTR_TZ_TRIP,
+=09THERMAL_GENL_ATTR_TZ_TRIP_ID,
+=09THERMAL_GENL_ATTR_TZ_TRIP_TYPE,
+=09THERMAL_GENL_ATTR_TZ_TRIP_TEMP,
+=09THERMAL_GENL_ATTR_TZ_TRIP_HYST,
+=09THERMAL_GENL_ATTR_TZ_MODE,
+=09THERMAL_GENL_ATTR_TZ_NAME,
+=09THERMAL_GENL_ATTR_TZ_CDEV_WEIGHT,
+=09THERMAL_GENL_ATTR_TZ_GOV,
+=09THERMAL_GENL_ATTR_TZ_GOV_NAME,
+=09THERMAL_GENL_ATTR_CDEV,
+=09THERMAL_GENL_ATTR_CDEV_ID,
+=09THERMAL_GENL_ATTR_CDEV_CUR_STATE,
+=09THERMAL_GENL_ATTR_CDEV_MAX_STATE,
+=09THERMAL_GENL_ATTR_CDEV_NAME,
+=09THERMAL_GENL_ATTR_GOV_NAME,
+=09THERMAL_GENL_ATTR_CAPACITY,
+=09THERMAL_GENL_ATTR_CAPACITY_CPU_COUNT,
+=09THERMAL_GENL_ATTR_CAPACITY_CPU_ID,
+=09THERMAL_GENL_ATTR_CAPACITY_CPU_PERF,
+=09THERMAL_GENL_ATTR_CAPACITY_CPU_EFF,
+=09__THERMAL_GENL_ATTR_MAX,
+};
+
+#define THERMAL_GENL_ATTR_MAX (__THERMAL_GENL_ATTR_MAX - 1)
+
+enum thermal_genl_sampling {
+=09THERMAL_GENL_SAMPLING_TEMP, __THERMAL_GENL_SAMPLING_MAX,
+};
+
+#define THERMAL_GENL_SAMPLING_MAX (__THERMAL_GENL_SAMPLING_MAX - 1)
+
+/* Events of thermal_genl_family */
+enum thermal_genl_event {
+=09THERMAL_GENL_EVENT_UNSPEC, THERMAL_GENL_EVENT_TZ_CREATE, /* Thermal zon=
e creation */
+=09THERMAL_GENL_EVENT_TZ_DELETE, /* Thermal zone deletion */
+=09THERMAL_GENL_EVENT_TZ_DISABLE, /* Thermal zone disabled */
+=09THERMAL_GENL_EVENT_TZ_ENABLE, /* Thermal zone enabled */
+=09THERMAL_GENL_EVENT_TZ_TRIP_UP, /* Trip point crossed the way up */
+=09THERMAL_GENL_EVENT_TZ_TRIP_DOWN, /* Trip point crossed the way down */
+=09THERMAL_GENL_EVENT_TZ_TRIP_CHANGE, /* Trip point changed */
+=09THERMAL_GENL_EVENT_TZ_TRIP_ADD, /* Trip point added */
+=09THERMAL_GENL_EVENT_TZ_TRIP_DELETE, /* Trip point deleted */
+=09THERMAL_GENL_EVENT_CDEV_ADD, /* Cdev bound to the thermal zone */
+=09THERMAL_GENL_EVENT_CDEV_DELETE, /* Cdev unbound */
+=09THERMAL_GENL_EVENT_CDEV_STATE_UPDATE, /* Cdev state updated */
+=09THERMAL_GENL_EVENT_TZ_GOV_CHANGE, /* Governor policy changed  */
+=09THERMAL_GENL_EVENT_CAPACITY_CHANGE, /* CPU capacity changed */
+=09__THERMAL_GENL_EVENT_MAX,
+};
+
+#define THERMAL_GENL_EVENT_MAX (__THERMAL_GENL_EVENT_MAX - 1)
+
+/* Commands supported by the thermal_genl_family */
+enum thermal_genl_cmd {
+=09THERMAL_GENL_CMD_UNSPEC, THERMAL_GENL_CMD_TZ_GET_ID, /* List of thermal=
 zones id */
+=09THERMAL_GENL_CMD_TZ_GET_TRIP, /* List of thermal trips */
+=09THERMAL_GENL_CMD_TZ_GET_TEMP, /* Get the thermal zone temperature */
+=09THERMAL_GENL_CMD_TZ_GET_GOV, /* Get the thermal zone governor */
+=09THERMAL_GENL_CMD_TZ_GET_MODE, /* Get the thermal zone mode */
+=09THERMAL_GENL_CMD_CDEV_GET, /* List of cdev id */
+=09__THERMAL_GENL_CMD_MAX,
+};
+
+#define THERMAL_GENL_CMD_MAX (__THERMAL_GENL_CMD_MAX - 1)
+
+#endif /* _UAPI_LINUX_THERMAL_H */
diff --git a/tools/power/x86/intel-lpmd/src/intel_lpmd_dbus_interface.xml b=
/tools/power/x86/intel-lpmd/src/intel_lpmd_dbus_interface.xml
new file mode 100644
index 000000000000..b723034ca107
--- /dev/null
+++ b/tools/power/x86/intel-lpmd/src/intel_lpmd_dbus_interface.xml
@@ -0,0 +1,27 @@
+<?xml version=3D"1.0" encoding=3D"UTF-8" ?>
+
+<!DOCTYPE node PUBLIC
+  "-//freedesktop//DTD D-Bus Object Introspection 1.0//EN"
+  "http://standards.freedesktop.org/dbus/1.0/introspect.dtd">
+
+<node>
+=09<interface name=3D"org.freedesktop.intel_lpmd">
+
+=09=09<method name=3D"Terminate">
+=09=09</method>
+
+=09=09<method name=3D"LPM_FORCE_ON">
+=09=09</method>
+
+=09=09<method name=3D"LPM_FORCE_OFF">
+=09=09</method>
+
+=09=09<method name=3D"LPM_AUTO">
+=09=09</method>
+
+=09=09<method name=3D"GetState">
+=09=09=09<arg type=3D"s" name=3D"state" direction=3D"out"/>
+=09=09</method>
+
+=09</interface>
+</node>
diff --git a/tools/power/x86/intel-lpmd/src/lpmd_cgroup.c b/tools/power/x86=
/intel-lpmd/src/lpmd_cgroup.c
new file mode 100644
index 000000000000..679b80387766
--- /dev/null
+++ b/tools/power/x86/intel-lpmd/src/lpmd_cgroup.c
@@ -0,0 +1,213 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (C) 2026 Intel Corporation */
+
+#define _GNU_SOURCE
+#include <systemd/sd-bus.h>
+#include "lpmd.h"
+
+/* Support for LPM_CPU_CGROUPV2 */
+#define PATH_CGROUP=09=09=09"/sys/fs/cgroup"
+#define PATH_CG2_SUBTREE_CONTROL=09PATH_CGROUP "/cgroup.subtree_control"
+
+static int update_allowed_cpus(const char *unit, uint8_t *vals, int size)
+{
+=09sd_bus_error error =3D SD_BUS_ERROR_NULL;
+=09sd_bus_message *m =3D NULL;
+=09char buf[MAX_STR_LENGTH];
+=09sd_bus *bus =3D NULL;
+=09int offset;
+=09int ret;
+=09int i;
+
+=09ret =3D sd_bus_open_system(&bus);
+=09if (ret < 0) {
+=09=09fprintf(stderr, "Failed to connect to system bus: %s\n", strerror(-r=
et));
+=09=09goto finish;
+=09}
+
+=09ret =3D sd_bus_message_new_method_call(bus, &m, "org.freedesktop.system=
d1", "/org/freedesktop/systemd1",
+=09=09=09=09=09     "org.freedesktop.systemd1.Manager", "SetUnitProperties=
");
+=09if (ret < 0) {
+=09=09fprintf(stderr, "Failed to issue method call: %s\n", error.message);
+=09=09goto finish;
+=09}
+
+=09ret =3D sd_bus_message_append(m, "sb", unit, 1);
+=09if (ret < 0) {
+=09=09fprintf(stderr, "Failed to append unit: %s\n", error.message);
+=09=09goto finish;
+=09}
+
+=09ret =3D sd_bus_message_open_container(m, SD_BUS_TYPE_ARRAY, "(sv)");
+=09if (ret < 0) {
+=09=09fprintf(stderr, "Failed to append array: %s\n", error.message);
+=09=09goto finish;
+=09}
+
+=09ret =3D sd_bus_message_open_container(m, SD_BUS_TYPE_STRUCT, "sv");
+=09if (ret < 0) {
+=09=09fprintf(stderr, "Failed to open container struct: %s\n", error.messa=
ge);
+=09=09goto finish;
+=09}
+
+=09ret =3D sd_bus_message_append_basic(m, SD_BUS_TYPE_STRING, "AllowedCPUs=
");
+=09if (ret < 0) {
+=09=09fprintf(stderr, "Failed to append string: %s\n", error.message);
+=09=09goto finish_1;
+=09}
+
+=09ret =3D sd_bus_message_open_container(m, 'v', "ay");
+=09if (ret < 0) {
+=09=09fprintf(stderr, "Failed to open container: %s\n", error.message);
+=09=09goto finish_2;
+=09}
+
+=09ret =3D sd_bus_message_append_array(m, 'y', vals, size);
+=09if (ret < 0) {
+=09=09fprintf(stderr, "Failed to append allowed_cpus: %s\n", error.message=
);
+=09=09goto finish_2;
+=09}
+
+=09offset =3D snprintf(buf, MAX_STR_LENGTH, "\tSending Dbus message to sys=
temd: %s: ", unit);
+=09for (i =3D 0; i < size; i++) {
+=09=09if (offset < MAX_STR_LENGTH)
+=09=09=09offset +=3D snprintf(buf + offset, MAX_STR_LENGTH - offset, "0x%0=
2x ", vals[i]);
+=09}
+=09buf[MAX_STR_LENGTH - 1] =3D '\0';
+=09lpmd_log_info("%s\n", buf);
+
+=09sd_bus_message_close_container(m);
+
+finish_2:
+=09sd_bus_message_close_container(m);
+
+finish_1:
+=09  sd_bus_message_close_container(m);
+
+finish:
+=09if (ret >=3D 0) {
+=09=09ret =3D sd_bus_call(bus, m, 0, &error, NULL);
+=09=09if (ret < 0)
+=09=09=09fprintf(stderr, "Failed to call: %s\n", error.message);
+=09}
+
+=09sd_bus_error_free(&error);
+=09sd_bus_message_unref(m);
+=09sd_bus_unref(bus);
+
+=09return ret < 0 ? -1 : 0;
+}
+
+static int restore_systemd_cgroup(void)
+{
+=09int size;
+=09uint8_t *vals;
+
+=09vals =3D get_cgroup_systemd_vals(CPUMASK_ONLINE, &size);
+=09if (!vals)
+=09=09return -1;
+
+=09update_allowed_cpus("system.slice", vals, size);
+=09update_allowed_cpus("user.slice", vals, size);
+=09update_allowed_cpus("machine.slice", vals, size);
+
+=09return 0;
+}
+
+static int update_systemd_cgroup(struct lpmd_config_state_t *state)
+{
+=09int size;
+=09uint8_t *vals;
+=09int ret;
+
+=09vals =3D get_cgroup_systemd_vals(state->cpumask_idx, &size);
+=09if (!vals)
+=09=09return -1;
+
+=09ret =3D update_allowed_cpus("system.slice", vals, size);
+=09if (ret)
+=09=09goto restore;
+
+=09ret =3D update_allowed_cpus("user.slice", vals, size);
+=09if (ret)
+=09=09goto restore;
+
+=09ret =3D update_allowed_cpus("machine.slice", vals, size);
+=09if (ret)
+=09=09goto restore;
+
+=09return 0;
+
+restore:
+=09restore_systemd_cgroup();
+=09return ret;
+}
+
+static int process_cpu_cgroupv2(struct lpmd_config_state_t *state)
+{
+=09if (cpumask_equal(state->cpumask_idx, CPUMASK_ONLINE)) {
+=09=09restore_systemd_cgroup();
+=09=09return lpmd_write_str(PATH_CG2_SUBTREE_CONTROL, "-cpuset", LPMD_LOG_=
DEBUG);
+=09}
+
+=09if (lpmd_write_str(PATH_CG2_SUBTREE_CONTROL, "+cpuset", LPMD_LOG_DEBUG)=
)
+=09=09return 1;
+=09return update_systemd_cgroup(state);
+}
+
+/* Support for cgroup based cpu isolation */
+static int process_cpu_isolate(struct lpmd_config_state_t *state)
+{
+=09if (lpmd_write_str("/sys/fs/cgroup/lpm/cpuset.cpus.partition", "member"=
, LPMD_LOG_DEBUG))
+=09=09return 1;
+
+=09if (!cpumask_equal(state->cpumask_idx, CPUMASK_ONLINE)) {
+=09=09if (lpmd_write_str("/sys/fs/cgroup/lpm/cpuset.cpus.exclusive", get_c=
pu_isolation_str(state->cpumask_idx), LPMD_LOG_DEBUG))
+=09=09=09return 1;
+=09=09if (lpmd_write_str("/sys/fs/cgroup/lpm/cpuset.cpus.partition", "isol=
ated", LPMD_LOG_DEBUG))
+=09=09=09return 1;
+=09=09if (lpmd_write_str("/sys/fs/cgroup/lpm/cpuset.cpus", get_cpu_isolati=
on_str(state->cpumask_idx), LPMD_LOG_DEBUG))
+=09=09=09return 1;
+=09} else {
+=09=09if (lpmd_write_str("/sys/fs/cgroup/lpm/cpuset.cpus", get_cpu_isolati=
on_str(CPUMASK_ONLINE), LPMD_LOG_DEBUG))
+=09=09=09return 1;
+=09}
+
+=09return 0;
+}
+
+int cgroup_cleanup(void)
+{
+=09DIR *dir =3D opendir("/sys/fs/cgroup/lpm");
+
+=09if (dir) {
+=09=09closedir(dir);
+=09=09rmdir("/sys/fs/cgroup/lpm");
+=09}
+=09restore_systemd_cgroup();
+=09return 0;
+}
+
+int cgroup_init(struct lpmd_config_t *config)
+{
+=09if (lpmd_write_str(PATH_CG2_SUBTREE_CONTROL, "+cpuset", LPMD_LOG_DEBUG)=
)
+=09=09return 1;
+=09if (config->mode =3D=3D LPM_CPU_ISOLATE)
+=09=09return mkdir("/sys/fs/cgroup/lpm", 0744);
+=09return 0;
+}
+
+int process_cgroup(struct lpmd_config_state_t *state, enum lpm_cpu_process=
_mode mode)
+{
+=09if (state->cpumask_idx =3D=3D CPUMASK_NONE) {
+=09=09lpmd_log_debug("Ignore cgroup processing\n");
+=09=09return 0;
+=09}
+
+=09lpmd_log_info("Process Cgroup ...\n");
+=09if (mode =3D=3D LPM_CPU_CGROUPV2)
+=09=09return process_cpu_cgroupv2(state);
+=09if (mode =3D=3D LPM_CPU_ISOLATE)
+=09=09return process_cpu_isolate(state);
+=09return 0;
+}
diff --git a/tools/power/x86/intel-lpmd/src/lpmd_config.c b/tools/power/x86=
/intel-lpmd/src/lpmd_config.c
new file mode 100644
index 000000000000..56545876498c
--- /dev/null
+++ b/tools/power/x86/intel-lpmd/src/lpmd_config.c
@@ -0,0 +1,493 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (C) 2026 Intel Corporation */
+
+#include "lpmd.h"
+#include <libxml/parser.h>
+#include <libxml/tree.h>
+
+#define CONFIG_FILE_NAME "intel_lpmd_config.xml"
+#define MAX_FILE_NAME_PATH=09128
+
+static void lpmd_parse_state(xmlDoc *doc, xmlNode *a_node, struct lpmd_con=
fig_t *config, int idx)
+{
+=09struct lpmd_config_state_t *state =3D &config->config_states[idx];
+=09xmlNode *cur_node =3D NULL;
+=09char *tmp_value;
+=09char *pos;
+
+=09if (!doc || !a_node || !state)
+=09=09return;
+
+=09lpmd_log_debug("%s: %d\n", __func__, idx);
+=09lpmd_init_config_state(state);
+
+=09for (cur_node =3D a_node; cur_node; cur_node =3D cur_node->next) {
+=09=09if (cur_node->type !=3D XML_ELEMENT_NODE)
+=09=09=09continue;
+
+=09=09tmp_value =3D (char *)xmlNodeListGetString(doc, cur_node->xmlChildre=
nNode, 1);
+=09=09if (!tmp_value)
+=09=09=09continue;
+
+=09=09if (!strncmp((const char *)cur_node->name, "ID", strlen("ID")))
+=09=09=09state->id =3D strtol(tmp_value, &pos, 10);
+=09=09if (!strncmp((const char *)cur_node->name, "Name", strlen("Name"))) =
{
+=09=09=09snprintf(state->name, MAX_STATE_NAME - 1, "%s", tmp_value);
+=09=09=09state->name[MAX_STATE_NAME - 1] =3D '\0';
+=09=09}
+=09=09if (!strncmp((const char *)cur_node->name, "WLTType", strlen("WLTTyp=
e")))
+=09=09=09state->wlt_type =3D strtol(tmp_value, &pos, 10);
+=09=09if (!strncmp((const char *)cur_node->name, "EntrySystemLoadThres", s=
trlen("EntrySystemLoadThres")))
+=09=09=09state->entry_system_load_thres =3D strtol(tmp_value, &pos, 10);
+=09=09if (!strncmp((const char *)cur_node->name, "ExitSystemLoadThres", st=
rlen("ExitSystemLoadThres")))
+=09=09=09state->exit_system_load_thres =3D strtol(tmp_value, &pos, 10);
+=09=09if (!strncmp((const char *)cur_node->name, "ExitSystemLoadhysteresis=
", strlen("ExitSystemLoadhysteresis")))
+=09=09=09state->exit_system_load_hyst =3D strtol(tmp_value, &pos, 10);
+=09=09if (!strncmp((const char *)cur_node->name, "EnterCPULoadThres", strl=
en("EnterCPULoadThres")))
+=09=09=09state->enter_cpu_load_thres =3D strtol(tmp_value, &pos, 10);
+=09=09if (!strncmp((const char *)cur_node->name, "ExitCPULoadThres", strle=
n("ExitCPULoadThres")))
+=09=09=09state->exit_cpu_load_thres =3D strtol(tmp_value, &pos, 10);
+=09=09if (!strncmp((const char *)cur_node->name, "EnterGFXLoadThres", strl=
en("EnterGFXLoadThres")))
+=09=09=09state->enter_gfx_load_thres =3D strtol(tmp_value, &pos, 10);
+=09=09if (!strncmp((const char *)cur_node->name, "ExitGFXLoadThres", strle=
n("ExitGFXLoadThres")))
+=09=09=09state->exit_gfx_load_thres =3D strtol(tmp_value, &pos, 10);
+=09=09if (!strncmp((const char *)cur_node->name, "MinPollInterval", strlen=
("MinPollInterval")))
+=09=09=09state->min_poll_interval =3D strtol(tmp_value, &pos, 10);
+=09=09if (!strncmp((const char *)cur_node->name, "MaxPollInterval", strlen=
("MaxPollInterval")))
+=09=09=09state->max_poll_interval =3D strtol(tmp_value, &pos, 10);
+=09=09if (!strncmp((const char *)cur_node->name, "PollIntervalIncrement", =
strlen("PollIntervalIncrement")))
+=09=09=09state->poll_interval_increment =3D strtol(tmp_value, &pos, 10);
+=09=09if (!strncmp((const char *)cur_node->name, "EPP", strlen("EPP")))
+=09=09=09state->epp =3D strtol(tmp_value, &pos, 10);
+=09=09if (!strncmp((const char *)cur_node->name, "EPB", strlen("EPB")))
+=09=09=09state->epb =3D strtol(tmp_value, &pos, 10);
+=09=09if (!strncmp((const char *)cur_node->name, "ITMTState", strlen("ITMT=
State")))
+=09=09=09state->itmt_state =3D strtol(tmp_value, &pos, 10);
+=09=09if (!strncmp((const char *)cur_node->name, "IRQMigrate", strlen("IRQ=
Migrate")))
+=09=09=09state->irq_migrate =3D strtol(tmp_value, &pos, 10);
+=09=09if (!strncmp((const char *)cur_node->name, "Island0Pcores", strlen("=
Island0Pcores")))
+=09=09=09state->island_0_number_p_cores =3D strtol(tmp_value, &pos, 10);
+=09=09if (!strncmp((const char *)cur_node->name, "Island0Ecores", strlen("=
Island0Ecores")))
+=09=09=09state->island_0_number_e_cores =3D strtol(tmp_value, &pos, 10);
+=09=09if (!strncmp((const char *)cur_node->name, "Island1Pcores", strlen("=
Island1Pcores")))
+=09=09=09state->island_1_number_p_cores =3D strtol(tmp_value, &pos, 10);
+=09=09if (!strncmp((const char *)cur_node->name, "Island1Ecores", strlen("=
Island1Ecores")))
+=09=09=09state->island_1_number_e_cores =3D strtol(tmp_value, &pos, 10);
+=09=09if (!strncmp((const char *)cur_node->name, "Island2Pcores", strlen("=
Island2Pcores")))
+=09=09=09state->island_2_number_p_cores =3D strtol(tmp_value, &pos, 10);
+=09=09if (!strncmp((const char *)cur_node->name, "Island2Ecores", strlen("=
Island2Ecores")))
+=09=09=09state->island_2_number_e_cores =3D strtol(tmp_value, &pos, 10);
+=09=09if (!strncmp((const char *)cur_node->name, "ActiveCPUs", strlen("Act=
iveCPUs"))) {
+=09=09=09if (!strncmp(tmp_value, "-1", strlen("-1")))
+=09=09=09=09state->active_cpus[0] =3D '\0';
+=09=09=09else
+=09=09=09=09copy_user_string(tmp_value, state->active_cpus, sizeof(state->=
active_cpus));
+=09=09}
+=09=09if (!strncmp((const char *)cur_node->name, "BalanceSliderAC", strlen=
("BalanceSliderAC")))
+=09=09=09state->balance_slider_ac =3D strtol(tmp_value, &pos, 10);
+=09=09if (!strncmp((const char *)cur_node->name, "SliderOffsetAC", strlen(=
"SliderOffsetAC")))
+=09=09=09state->slider_offset_ac =3D strtol(tmp_value, &pos, 10);
+
+=09=09if (!strncmp((const char *)cur_node->name, "BalanceSliderDC", strlen=
("BalanceSliderDC")))
+=09=09=09state->balance_slider_dc =3D strtol(tmp_value, &pos, 10);
+=09=09if (!strncmp((const char *)cur_node->name, "SliderOffsetDC", strlen(=
"SliderOffsetDC")))
+=09=09=09state->slider_offset_dc =3D strtol(tmp_value, &pos, 10);
+
+=09=09xmlFree(tmp_value);
+=09}
+}
+
+static int is_wildcard(char *str)
+{
+=09if (!str)
+=09=09return 1;
+=09if (!strncmp(str, "*", strlen("*")))
+=09=09return 1;
+=09if (!strncmp(str, " * ", strlen(" * ")))
+=09=09return 1;
+
+=09return 0;
+}
+
+static void lpmd_parse_states(xmlDoc *doc, xmlNode *a_node, struct lpmd_co=
nfig_t *lpmd_config)
+{
+=09int cpu_family =3D -1, cpu_model =3D -1, config_state_count =3D 0;
+=09char cpu_config[MAX_CONFIG_LEN];
+=09xmlNode *cur_node =3D NULL;
+=09char *tmp_value;
+=09char *pos;
+
+=09if (!doc || !a_node || !lpmd_config)
+=09=09return;
+
+=09/* A valid states table has been parsed */
+=09if (lpmd_config->config_state_count)
+=09=09return;
+
+=09cpu_config[0] =3D '\0';
+
+=09for (cur_node =3D a_node; cur_node; cur_node =3D cur_node->next) {
+=09=09if (cur_node->type !=3D XML_ELEMENT_NODE)
+=09=09=09continue;
+
+=09=09if (!cur_node->name)
+=09=09=09continue;
+
+=09=09tmp_value =3D (char *)xmlNodeListGetString(doc, cur_node->xmlChildre=
nNode, 1);
+=09=09if (!strncmp((const char *)cur_node->name, "CPUFamily", strlen("CPUF=
amily"))) {
+=09=09=09if (is_wildcard(tmp_value))
+=09=09=09=09cpu_family =3D lpmd_config->cpu_family;
+=09=09=09else
+=09=09=09=09cpu_family =3D strtol(tmp_value, &pos, 10);
+=09=09}
+
+=09=09if (!strncmp((const char *)cur_node->name, "CPUModel", strlen("CPUMo=
del"))) {
+=09=09=09if (is_wildcard(tmp_value))
+=09=09=09=09cpu_model =3D lpmd_config->cpu_model;
+=09=09=09else
+=09=09=09=09cpu_model =3D strtol(tmp_value, &pos, 10);
+=09=09}
+
+=09=09if (!strncmp((const char *)cur_node->name, "CPUConfig", strlen("CPUC=
onfig"))) {
+=09=09=09if (is_wildcard(tmp_value))
+=09=09=09=09strncpy(cpu_config, lpmd_config->cpu_config, MAX_CONFIG_LEN);
+=09=09=09else
+=09=09=09=09snprintf(cpu_config, MAX_CONFIG_LEN - 1, "%s", tmp_value);
+=09=09=09cpu_config[MAX_CONFIG_LEN - 1] =3D '\0';
+=09=09}
+
+=09=09if (tmp_value)
+=09=09=09xmlFree(tmp_value);
+
+=09=09if (strncmp((const char *)cur_node->name, "State", strlen("State")))
+=09=09=09continue;
+
+=09=09/* Must check cpu family/model/config first to make sure the states =
applies */
+=09=09if (cpu_family !=3D lpmd_config->cpu_family ||
+=09=09    cpu_model !=3D lpmd_config->cpu_model ||
+=09=09    strncmp(cpu_config, lpmd_config->cpu_config,
+=09=09=09    MAX_CONFIG_LEN)) {
+=09=09=09lpmd_log_info("Ignore unsupported states for CPU family:%d,model%=
d,config:%s\n",
+=09=09=09=09      cpu_family, cpu_model, cpu_config);
+=09=09=09return;
+=09=09}
+
+=09=09if (lpmd_config->config_state_count >=3D MAX_CONFIG_STATES)
+=09=09=09break;
+=09=09lpmd_parse_state(doc, cur_node->children, lpmd_config,
+=09=09=09=09 CONFIG_STATE_BASE + config_state_count);
+=09=09config_state_count++;
+=09}
+=09lpmd_log_debug("Found %d config states\n", config_state_count);
+=09lpmd_config->config_state_count =3D config_state_count;
+}
+
+static void lpmd_init_config(struct lpmd_config_t *config)
+{
+=09config->performance_def =3D LPM_FORCE_OFF;
+=09config->balanced_def =3D LPM_FORCE_OFF;
+=09config->powersaver_def =3D LPM_FORCE_OFF;
+=09config->lp_mode_epp =3D -1;
+=09config->data.util_sys =3D -1;
+=09config->data.util_cpu =3D -1;
+=09config->data.util_gfx =3D -1;
+=09config->data.wlt_hint =3D -1;
+=09config->balance_slider_def_ac =3D -1;
+=09config->balance_slider_def_dc =3D -1;
+=09config->slider_offset_def_ac =3D -1;
+=09config->slider_offset_def_dc =3D -1;
+=09config->wlt_hint_mask =3D -1;
+}
+
+static int lpmd_fill_config(xmlDoc *doc, xmlNode *a_node, struct lpmd_conf=
ig_t *lpmd_config)
+{
+=09xmlNode *cur_node =3D NULL;
+=09char *tmp_value;
+=09char *pos;
+
+=09if (!doc || !a_node || !lpmd_config)
+=09=09return LPMD_ERROR;
+
+=09lpmd_init_config(lpmd_config);
+
+=09for (cur_node =3D a_node; cur_node; cur_node =3D cur_node->next) {
+=09=09if (cur_node->type !=3D XML_ELEMENT_NODE)
+=09=09=09continue;
+
+=09=09tmp_value =3D (char *)xmlNodeListGetString(doc, cur_node->xmlChildre=
nNode, 1);
+=09=09if (!tmp_value)
+=09=09=09continue;
+
+=09=09if (!strncmp((const char *)cur_node->name, "Mode", strlen("Mode"))) =
{
+=09=09=09errno =3D 0;
+=09=09=09lpmd_config->mode =3D strtol(tmp_value, &pos, 10);
+=09=09=09if (errno || *pos !=3D '\0' ||
+=09=09=09    lpmd_config->mode > LPM_CPU_MODE_MAX ||
+=09=09=09    lpmd_config->mode < 0)
+=09=09=09=09goto err;
+=09=09} else if (!strncmp((const char *)cur_node->name,
+=09=09=09=09    "HfiLpmEnable", strlen("HfiLpmEnable"))) {
+=09=09=09errno =3D 0;
+=09=09=09lpmd_config->hfi_lpm_enable =3D strtol(tmp_value, &pos, 10);
+=09=09=09if (errno || *pos !=3D '\0' ||
+=09=09=09    (lpmd_config->hfi_lpm_enable !=3D 1 &&
+=09=09=09     lpmd_config->hfi_lpm_enable !=3D 0))
+=09=09=09=09goto err;
+=09=09} else if (!strncmp((const char *)cur_node->name,
+=09=09=09=09    "WLTHintEnable", strlen("WLtHintEnable"))) {
+=09=09=09errno =3D 0;
+=09=09=09lpmd_config->wlt_hint_enable =3D strtol(tmp_value, &pos, 10);
+=09=09=09if (errno || *pos !=3D '\0' ||
+=09=09=09    (lpmd_config->wlt_hint_enable !=3D 1 &&
+=09=09=09     lpmd_config->wlt_hint_enable !=3D 0))
+=09=09=09=09goto err;
+=09=09} else if (!strncmp((const char *)cur_node->name, "WLTHintMask",
+=09=09=09=09    strlen("WLTHintMask"))) {
+=09=09=09errno =3D 0;
+=09=09=09lpmd_config->wlt_hint_mask =3D strtol(tmp_value, &pos, 10);
+=09=09} else if (!strncmp((const char *)cur_node->name,
+=09=09=09=09    "WLTHintPollEnable",
+=09=09=09=09    strlen("WLtHintPollEnable"))) {
+=09=09=09errno =3D 0;
+=09=09=09lpmd_config->wlt_hint_poll_enable =3D strtol(tmp_value, &pos, 10)=
;
+=09=09=09if (errno || *pos !=3D '\0' ||
+=09=09=09    (lpmd_config->wlt_hint_poll_enable !=3D 1 &&
+=09=09=09     lpmd_config->wlt_hint_poll_enable !=3D 0))
+=09=09=09=09goto err;
+=09=09} else if (!strncmp((const char *)cur_node->name,
+=09=09=09=09    "WLTProxyEnable",
+=09=09=09=09    strlen("WLTProxyEnable"))) {
+=09=09=09errno =3D 0;
+=09=09=09lpmd_config->wlt_proxy_enable =3D strtol(tmp_value, &pos, 10);
+=09=09=09if (errno || *pos !=3D '\0' ||
+=09=09=09    (lpmd_config->wlt_proxy_enable !=3D 1 &&
+=09=09=09     lpmd_config->wlt_proxy_enable !=3D 0))
+=09=09=09=09goto err;
+=09=09} else if (!strncmp((const char *)cur_node->name,
+=09=09=09=09    "EntryDelayMS", strlen("EntryDelayMS"))) {
+=09=09=09errno =3D 0;
+=09=09=09lpmd_config->util_entry_delay =3D strtol(tmp_value, &pos, 10);
+=09=09=09if (errno || *pos !=3D '\0' ||
+=09=09=09    lpmd_config->util_entry_delay < 0 ||
+=09=09=09    lpmd_config->util_entry_delay > UTIL_DELAY_MAX)
+=09=09=09=09goto err;
+=09=09} else if (!strncmp((const char *)cur_node->name, "ExitDelayMS",
+=09=09=09=09    strlen("ExitDelayMS"))) {
+=09=09=09errno =3D 0;
+=09=09=09lpmd_config->util_exit_delay =3D strtol(tmp_value, &pos, 10);
+=09=09=09if (errno || *pos !=3D '\0' ||
+=09=09=09    lpmd_config->util_exit_delay < 0 ||
+=09=09=09    lpmd_config->util_exit_delay > UTIL_DELAY_MAX)
+=09=09=09=09goto err;
+=09=09} else if (!strncmp((const char *)cur_node->name,
+=09=09=09=09    "util_entry_threshold",
+=09=09=09=09    strlen("util_entry_threshold"))) {
+=09=09=09errno =3D 0;
+=09=09=09lpmd_config->util_entry_threshold =3D strtol(tmp_value, &pos, 10)=
;
+=09=09=09if (errno || *pos !=3D '\0' ||
+=09=09=09    lpmd_config->util_entry_threshold < 0 ||
+=09=09=09    lpmd_config->util_entry_threshold > 100)
+=09=09=09=09goto err;
+=09=09} else if (!strncmp((const char *)cur_node->name,
+=09=09=09=09    "util_exit_threshold",
+=09=09=09=09    strlen("util_exit_threshold"))) {
+=09=09=09errno =3D 0;
+=09=09=09lpmd_config->util_exit_threshold =3D strtol(tmp_value, &pos, 10);
+=09=09=09if (errno || *pos !=3D '\0' ||
+=09=09=09    lpmd_config->util_exit_threshold < 0 ||
+=09=09=09    lpmd_config->util_exit_threshold > 100)
+=09=09=09=09goto err;
+=09=09} else if (!strncmp((const char *)cur_node->name, "EntryHystMS",
+=09=09=09=09    strlen("EntryHystMS"))) {
+=09=09=09errno =3D 0;
+=09=09=09lpmd_config->util_entry_hyst =3D strtol(tmp_value, &pos, 10);
+=09=09=09if (errno || *pos !=3D '\0' ||
+=09=09=09    lpmd_config->util_entry_hyst < 0 ||
+=09=09=09    lpmd_config->util_entry_hyst > UTIL_HYST_MAX)
+=09=09=09=09goto err;
+=09=09} else if (!strncmp((const char *)cur_node->name, "ExitHystMS",
+=09=09=09=09    strlen("ExitHystMS"))) {
+=09=09=09errno =3D 0;
+=09=09=09lpmd_config->util_exit_hyst =3D strtol(tmp_value, &pos, 10);
+=09=09=09if (errno || *pos !=3D '\0' ||
+=09=09=09    lpmd_config->util_exit_hyst < 0 ||
+=09=09=09    lpmd_config->util_exit_hyst > UTIL_HYST_MAX)
+=09=09=09=09goto err;
+=09=09} else if (!strncmp((const char *)cur_node->name, "lp_mode_epp",
+=09=09=09=09    strlen("lp_mode_epp"))) {
+=09=09=09errno =3D 0;
+=09=09=09lpmd_config->lp_mode_epp =3D strtol(tmp_value, &pos, 10);
+=09=09=09if (errno || *pos !=3D '\0' ||
+=09=09=09    lpmd_config->lp_mode_epp > 255 ||
+=09=09=09    lpmd_config->lp_mode_epp < -1)
+=09=09=09=09goto err;
+=09=09=09if (lpmd_config->lp_mode_epp < 0)
+=09=09=09=09lpmd_config->lp_mode_epp =3D -1;
+=09=09} else if (!strncmp((const char *)cur_node->name, "IgnoreITMT",
+=09=09=09=09    strlen("IgnoreITMT"))) {
+=09=09=09errno =3D 0;
+=09=09=09lpmd_config->ignore_itmt =3D strtol(tmp_value, &pos, 10);
+=09=09=09if (errno || *pos !=3D '\0' ||
+=09=09=09    lpmd_config->ignore_itmt < 0 ||
+=09=09=09    lpmd_config->ignore_itmt > 1)
+=09=09=09=09goto err;
+=09=09} else if (!strncmp((const char *)cur_node->name,
+=09=09=09=09    "lp_mode_cpus", strlen("lp_mode_cpus"))) {
+=09=09=09if (!strncmp(tmp_value, "-1", strlen("-1")))
+=09=09=09=09lpmd_config->lp_mode_cpus[0] =3D '\0';
+=09=09=09else
+=09=09=09=09copy_user_string(tmp_value, lpmd_config->lp_mode_cpus,
+=09=09=09=09=09=09 sizeof(lpmd_config->lp_mode_cpus));
+=09=09} else if (!strncmp((const char *)cur_node->name,
+=09=09=09=09    "PerformanceDef",
+=09=09=09=09    strlen("PerformanceDef"))) {
+=09=09=09errno =3D 0;
+=09=09=09lpmd_config->performance_def =3D strtol(tmp_value, &pos, 10);
+=09=09=09if (errno || *pos !=3D '\0')
+=09=09=09=09goto err;
+=09=09=09if (lpmd_config->performance_def =3D=3D -1)
+=09=09=09=09lpmd_config->performance_def =3D LPM_FORCE_OFF;
+=09=09=09else if (lpmd_config->performance_def =3D=3D 1)
+=09=09=09=09lpmd_config->performance_def =3D LPM_FORCE_ON;
+=09=09=09else if (!lpmd_config->performance_def)
+=09=09=09=09lpmd_config->performance_def =3D LPM_AUTO;
+=09=09=09else
+=09=09=09=09goto err;
+=09=09} else if (!strncmp((const char *)cur_node->name, "BalancedDef",
+=09=09=09=09    strlen("BalancedDef"))) {
+=09=09=09errno =3D 0;
+=09=09=09lpmd_config->balanced_def =3D strtol(tmp_value, &pos, 10);
+=09=09=09if (errno || *pos !=3D '\0')
+=09=09=09=09goto err;
+=09=09=09if (lpmd_config->balanced_def =3D=3D -1)
+=09=09=09=09lpmd_config->balanced_def =3D LPM_FORCE_OFF;
+=09=09=09else if (lpmd_config->balanced_def =3D=3D 1)
+=09=09=09=09lpmd_config->balanced_def =3D LPM_FORCE_ON;
+=09=09=09else if (!lpmd_config->balanced_def)
+=09=09=09=09lpmd_config->balanced_def =3D LPM_AUTO;
+=09=09=09else
+=09=09=09=09goto err;
+=09=09} else if (!strncmp((const char *)cur_node->name,
+=09=09=09=09    "PowersaverDef", strlen("PowersaverDef"))) {
+=09=09=09errno =3D 0;
+=09=09=09lpmd_config->powersaver_def =3D strtol(tmp_value, &pos, 10);
+=09=09=09if (errno || *pos !=3D '\0')
+=09=09=09=09goto err;
+=09=09=09if (lpmd_config->powersaver_def =3D=3D -1)
+=09=09=09=09lpmd_config->powersaver_def =3D LPM_FORCE_OFF;
+=09=09=09else if (lpmd_config->powersaver_def =3D=3D 1)
+=09=09=09=09lpmd_config->powersaver_def =3D LPM_FORCE_ON;
+=09=09=09else if (!lpmd_config->powersaver_def)
+=09=09=09=09lpmd_config->powersaver_def =3D LPM_AUTO;
+=09=09=09else
+=09=09=09=09goto err;
+=09=09} else if (!strncmp((const char *)cur_node->name, "States",
+=09=09=09=09    strlen("States"))) {
+=09=09=09errno =3D 0;
+=09=09=09lpmd_parse_states(doc, cur_node->children, lpmd_config);
+=09=09} else if (!strncmp((const char *)cur_node->name,
+=09=09=09=09    "BalancedSliderAC",
+=09=09=09=09    strlen("BalancedSliderAC"))) {
+=09=09=09errno =3D 0;
+=09=09=09lpmd_config->balance_slider_def_ac =3D strtol(tmp_value, &pos, 10=
);
+
+=09=09} else if (!strncmp((const char *)cur_node->name,
+=09=09=09=09    "BalancedSliderDC",
+=09=09=09=09    strlen("BalancedSliderDC"))) {
+=09=09=09errno =3D 0;
+=09=09=09lpmd_config->balance_slider_def_dc =3D strtol(tmp_value, &pos, 10=
);
+=09=09} else if (!strncmp((const char *)cur_node->name,
+=09=09=09=09    "SliderOffsetAC",
+=09=09=09=09    strlen("SliderOffsetAC"))) {
+=09=09=09errno =3D 0;
+=09=09=09lpmd_config->slider_offset_def_ac =3D strtol(tmp_value, &pos, 10)=
;
+=09=09} else if (!strncmp((const char *)cur_node->name,
+=09=09=09=09    "SliderOffsetDC",
+=09=09=09=09    strlen("SliderOffsetDC"))) {
+=09=09=09errno =3D 0;
+=09=09=09lpmd_config->slider_offset_def_dc =3D strtol(tmp_value, &pos, 10)=
;
+=09=09} else {
+=09=09=09if (!strncmp((const char *)cur_node->name, "HfiSuvEnable", strlen=
("HfiSuvEnable"))) {
+=09=09=09=09lpmd_log_debug("Ignore deprecated HfiSuvEnable setting\n");
+=09=09=09} else {
+=09=09=09=09lpmd_log_info("Invalid configuration data\n");
+=09=09=09=09goto err;
+=09=09=09}
+=09=09}
+=09=09xmlFree(tmp_value);
+=09=09continue;
+err:
+=09=09xmlFree(tmp_value);
+=09=09lpmd_log_error("node type: Element, name: %s value: %s\n",
+=09=09=09       cur_node->name, tmp_value);
+=09=09return LPMD_ERROR;
+=09}
+
+=09return LPMD_SUCCESS;
+}
+
+int lpmd_get_config(struct lpmd_config_t *lpmd_config)
+{
+=09char file_name[MAX_FILE_NAME_PATH];
+=09xmlNode *root_element;
+=09xmlNode *cur_node;
+=09struct stat s;
+=09xmlDoc *doc;
+
+=09if (!lpmd_config)
+=09=09return LPMD_ERROR;
+
+=09snprintf(file_name, MAX_FILE_NAME_PATH, "%s/intel_lpmd_config_F%d_M%d_T=
%d.xml",
+=09=09 TDCONFDIR, lpmd_config->cpu_family, lpmd_config->cpu_model, lpmd_co=
nfig->tdp);
+
+=09lpmd_log_msg("Looking for config file %s\n", file_name);
+=09if (!stat(file_name, &s))
+=09=09goto process_xml;
+
+=09snprintf(file_name, MAX_FILE_NAME_PATH, "%s/intel_lpmd_config_F%d_M%d.x=
ml",
+=09=09 TDCONFDIR, lpmd_config->cpu_family, lpmd_config->cpu_model);
+=09lpmd_log_msg("Looking for config file %s\n", file_name);
+=09if (!stat(file_name, &s))
+=09=09goto process_xml;
+
+=09snprintf(file_name, MAX_FILE_NAME_PATH, "%s/%s", TDCONFDIR, CONFIG_FILE=
_NAME);
+
+=09lpmd_log_msg("Reading configuration file %s\n", file_name);
+
+=09if (stat(file_name, &s)) {
+=09=09lpmd_log_msg("error: could not find file %s\n", file_name);
+=09=09return LPMD_ERROR;
+=09}
+
+process_xml:
+=09doc =3D xmlReadFile(file_name, NULL, 0);
+=09if (!doc) {
+=09=09lpmd_log_msg("error: could not parse file %s\n", file_name);
+=09=09return LPMD_ERROR;
+=09}
+
+=09root_element =3D xmlDocGetRootElement(doc);
+=09if (!root_element) {
+=09=09lpmd_log_warn("error: could not get root element\n");
+=09=09return LPMD_ERROR;
+=09}
+
+=09cur_node =3D NULL;
+
+=09for (cur_node =3D root_element; cur_node; cur_node =3D cur_node->next) =
{
+=09=09if (cur_node->type !=3D XML_ELEMENT_NODE)
+=09=09=09continue;
+
+=09=09if (strncmp((const char *)cur_node->name, "Configuration", strlen("C=
onfiguration")))
+=09=09=09continue;
+
+=09=09if (lpmd_fill_config(doc, cur_node->children, lpmd_config) !=3D LPMD=
_SUCCESS) {
+=09=09=09xmlFreeDoc(doc);
+=09=09=09return LPMD_ERROR;
+=09=09}
+=09}
+
+=09xmlFreeDoc(doc);
+
+=09return LPMD_SUCCESS;
+}
diff --git a/tools/power/x86/intel-lpmd/src/lpmd_cpu.c b/tools/power/x86/in=
tel-lpmd/src/lpmd_cpu.c
new file mode 100644
index 000000000000..0098542613e8
--- /dev/null
+++ b/tools/power/x86/intel-lpmd/src/lpmd_cpu.c
@@ -0,0 +1,481 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (C) 2026 Intel Corporation */
+
+#define _GNU_SOURCE
+#include <err.h>
+
+#include "lpmd.h"
+
+/* Bit 15 of CPUID.7 EDX stands for Hybrid support */
+#define CPUFEATURE_HYBRID=09(1 << 15)
+#define PATH_PM_PROFILE "/sys/firmware/acpi/pm_profile"
+
+struct cpu_model_entry {
+=09unsigned int family;
+=09unsigned int model;
+};
+
+static struct cpu_model_entry id_table[] =3D {
+=09=09{ 6, 0x97 }, // Alderlake
+=09=09{ 6, 0x9a }, // Alderlake
+=09=09{ 6, 0xb7 }, // Raptorlake
+=09=09{ 6, 0xba }, // Raptorlake
+=09=09{ 6, 0xbf }, // Raptorlake S
+=09=09{ 6, 0xaa }, // Meteorlake
+=09=09{ 6, 0xac }, // Meteorlake
+=09=09{ 6, 0xbd }, // Lunarlake
+=09=09{ 6, 0xcc }, // Pantherlake
+=09=09{ 0, 0 } // Last Invalid entry
+};
+
+int detect_supported_platform(struct lpmd_config_t *lpmd_config)
+{
+=09unsigned int max_level, family, model, stepping;
+=09unsigned int eax, ebx, ecx, edx;
+=09int val;
+
+=09cpuid(0, eax, ebx, ecx, edx);
+
+=09/* Unsupported vendor */
+=09if (ebx !=3D 0x756e6547 || edx !=3D 0x49656e69 || ecx !=3D 0x6c65746e) =
{
+=09=09lpmd_log_info("Unsupported vendor\n");
+=09=09return -1;
+=09}
+
+=09max_level =3D eax;
+=09cpuid(1, eax, ebx, ecx, edx);
+=09family =3D (eax >> 8) & 0xf;
+=09model =3D (eax >> 4) & 0xf;
+=09stepping =3D eax & 0xf;
+
+=09if (family =3D=3D 6)
+=09=09model +=3D ((eax >> 16) & 0xf) << 4;
+
+=09lpmd_log_info("%u CPUID levels; family:model:stepping 0x%x:%x:%x (%u:%u=
:%u)\n",
+=09=09      max_level, family, model, stepping, family, model, stepping);
+
+=09if (!do_platform_check()) {
+=09=09lpmd_log_info("Ignore platform check\n");
+=09=09goto end;
+=09}
+
+=09/* Need CPUID.1A to detect CPU core type */
+=09if (max_level < 0x1a) {
+=09=09lpmd_log_info("CPUID leaf 0x1a not supported, unable to detect CPU t=
ype\n");
+=09=09return -1;
+=09}
+
+=09cpuid_count(7, 0, eax, ebx, ecx, edx);
+
+=09/* Run on Hybrid platforms only */
+=09if (!(edx & CPUFEATURE_HYBRID)) {
+=09=09lpmd_log_info("Non-Hybrid platform detected\n");
+=09=09return -1;
+=09}
+
+=09/* /sys/firmware/acpi/pm_profile is mandatory */
+=09if (lpmd_read_int(PATH_PM_PROFILE, &val, -1)) {
+=09=09lpmd_log_info("Failed to read PM profile %s\n", PATH_PM_PROFILE);
+=09=09return -1;
+=09}
+
+=09if (val !=3D 2 && val !=3D 8) {
+=09=09lpmd_log_info("Non-Mobile PM profile detected. %s returns %d\n",
+=09=09=09      PATH_PM_PROFILE, val);
+=09=09return -1;
+=09}
+
+=09/* Platform meets all the criteria for lpmd to run, check the allow lis=
t */
+=09val =3D 0;
+=09while (id_table[val].family) {
+=09=09if (id_table[val].family =3D=3D family && id_table[val].model =3D=3D=
 model)
+=09=09=09break;
+=09=09val++;
+=09}
+
+=09/* Unsupported model */
+=09if (!id_table[val].family) {
+=09=09lpmd_log_info("Platform not supported yet.\n");
+=09=09lpmd_log_debug("Supported platforms:\n");
+=09=09val =3D 0;
+=09=09while (id_table[val].family) {
+=09=09=09lpmd_log_debug("\tfamily %d model %d\n",
+=09=09=09=09       id_table[val].family,
+=09=09=09=09       id_table[val].model);
+=09=09=09val++;
+=09=09}
+=09=09return -1;
+=09}
+
+end:
+=09lpmd_config->cpu_family =3D family;
+=09lpmd_config->cpu_model =3D model;
+
+=09return 0;
+}
+
+/*
+ * Use one Ecore Module as LPM CPUs.
+ * Applies on Hybrid platforms like AlderLake/RaptorLake.
+ */
+int is_cpu_atom(int cpu)
+{
+=09unsigned int eax, ebx, ecx, edx;
+=09unsigned int type;
+
+=09if (cpu_migrate(cpu) < 0) {
+=09=09lpmd_log_error("Failed to migrated to cpu%d\n", cpu);
+=09=09return -1;
+=09}
+
+=09cpuid(0x1a, eax, ebx, ecx, edx);
+
+=09type =3D (eax >> 24) & 0xFF;
+
+=09cpu_clear_affinity();
+=09return type =3D=3D 0x20;
+}
+
+static int is_cpu_in_l3(int cpu)
+{
+=09unsigned int eax, ebx, ecx, edx, subleaf;
+
+=09if (cpu_migrate(cpu) < 0) {
+=09=09lpmd_log_error("Failed to migrated to cpu%d\n", cpu);
+=09=09err(1, "cpu migrate");
+=09}
+
+=09for (subleaf =3D 0; ; subleaf++) {
+=09=09unsigned int type, level;
+
+=09=09cpuid_count(4, subleaf, eax, ebx, ecx, edx);
+
+=09=09type =3D eax & 0x1f;
+=09=09level =3D (eax >> 5) & 0x7;
+
+=09=09/* No more caches */
+=09=09if (!type)
+=09=09=09break;
+=09=09/* Unified Cache */
+=09=09if (type !=3D 3)
+=09=09=09continue;
+=09=09/* L3 */
+=09=09if (level !=3D 3)
+=09=09=09continue;
+
+=09=09cpu_clear_affinity();
+=09=09return 1;
+=09}
+
+=09cpu_clear_affinity();
+=09return 0;
+}
+
+int is_cpu_pcore(int cpu)
+{
+=09return !is_cpu_atom(cpu);
+}
+
+int is_cpu_ecore(int cpu)
+{
+=09if (!is_cpu_atom(cpu))
+=09=09return 0;
+=09return is_cpu_in_l3(cpu);
+}
+
+int is_cpu_lcore(int cpu)
+{
+=09if (!is_cpu_atom(cpu))
+=09=09return 0;
+=09return !is_cpu_in_l3(cpu);
+}
+
+#define PATH_RAPL=09"/sys/class/powercap"
+static int get_tdp(void)
+{
+=09char path[MAX_STR_LENGTH * 2];
+=09char str[MAX_STR_LENGTH];
+=09struct dirent *entry;
+=09int ret, tdp =3D 0;
+=09FILE *filep;
+=09char *pos;
+=09DIR *dir;
+
+=09dir =3D opendir(PATH_RAPL);
+=09if (!dir) {
+=09=09perror("opendir() error");
+=09=09return 1;
+=09}
+
+=09while ((entry =3D readdir(dir)) !=3D NULL) {
+=09=09if (strlen(entry->d_name) > 100)
+=09=09=09continue;
+
+=09=09if (strncmp(entry->d_name, "intel-rapl", strlen("intel-rapl")))
+=09=09=09continue;
+
+=09=09snprintf(path, MAX_STR_LENGTH * 2, "%s/%s/name", PATH_RAPL, entry->d=
_name);
+=09=09filep =3D fopen(path, "r");
+=09=09if (!filep)
+=09=09=09continue;
+
+=09=09ret =3D fread(str, 1, MAX_STR_LENGTH, filep);
+=09=09fclose(filep);
+
+=09=09if (ret <=3D 0)
+=09=09=09continue;
+
+=09=09if (strncmp(str, "package", strlen("package")))
+=09=09=09continue;
+
+=09=09snprintf(path, MAX_STR_LENGTH * 2,
+=09=09=09 "%s/%s/constraint_0_max_power_uw", PATH_RAPL,
+=09=09=09 entry->d_name);
+=09=09filep =3D fopen(path, "r");
+=09=09if (!filep)
+=09=09=09continue;
+
+=09=09ret =3D fread(str, 1, MAX_STR_LENGTH, filep);
+=09=09fclose(filep);
+
+=09=09if (ret <=3D 0)
+=09=09=09continue;
+
+=09=09if (ret >=3D MAX_STR_LENGTH)
+=09=09=09ret =3D MAX_STR_LENGTH - 1;
+
+=09=09str[ret] =3D '\0';
+=09=09tdp =3D strtol(str, &pos, 10);
+=09=09break;
+=09}
+=09closedir(dir);
+
+=09return tdp / 1000000;
+}
+
+#define BITMASK_SIZE 32
+int detect_max_cpus(void)
+{
+=09unsigned long dummy;
+=09int max_cpus, i;
+=09FILE *filep;
+
+=09max_cpus =3D 0;
+=09for (i =3D 0; i < 256; ++i) {
+=09=09char path[MAX_STR_LENGTH];
+
+=09=09snprintf(path, sizeof(path),
+=09=09=09 "/sys/devices/system/cpu/cpu%d/topology/thread_siblings", i);
+
+=09=09filep =3D fopen(path, "r");
+=09=09if (filep)
+=09=09=09break;
+=09}
+
+=09if (!filep) {
+=09=09lpmd_log_error("Can't get max cpu number\n");
+=09=09return -1;
+=09}
+
+=09while (fscanf(filep, "%lx,", &dummy) =3D=3D 1)
+=09=09max_cpus +=3D BITMASK_SIZE;
+=09fclose(filep);
+
+=09lpmd_log_debug("\t%d CPUs supported in maximum\n", max_cpus);
+
+=09set_max_cpus(max_cpus);
+=09return 0;
+}
+
+int detect_cpu_topo(struct lpmd_config_t *lpmd_config)
+{
+=09FILE *filep;
+=09int i;
+=09char path[MAX_STR_LENGTH];
+=09int ret;
+=09int pcores, ecores, lcores;
+=09int tdp;
+
+=09ret =3D detect_max_cpus();
+=09if (ret)
+=09=09return ret;
+
+=09cpumask_reset(CPUMASK_ONLINE);
+=09pcores =3D 0;
+=09ecores =3D 0;
+=09lcores =3D 0;
+
+=09for (i =3D 0; i < get_max_cpus(); i++) {
+=09=09unsigned int online =3D 0;
+
+=09=09snprintf(path, sizeof(path), "/sys/devices/system/cpu/cpu%d/online",=
 i);
+=09=09filep =3D fopen(path, "r");
+=09=09if (filep) {
+=09=09=09if (fscanf(filep, "%u", &online) !=3D 1)
+=09=09=09=09lpmd_log_warn("fread failed for %s\n", path);
+=09=09=09fclose(filep);
+=09=09} else if (!i) {
+=09=09=09online =3D 1;
+=09=09} else {
+=09=09=09break;
+=09=09}
+
+=09=09if (!online)
+=09=09=09continue;
+
+=09=09cpumask_add_cpu(i, CPUMASK_ONLINE);
+=09=09set_max_online_cpu(i);
+=09}
+
+=09/* Here it is the first time we migrate CPUs, must clear the previous c=
group settings */
+=09cgroup_cleanup();
+
+=09for (i =3D 0; i < get_max_cpus(); i++) {
+=09=09if (!is_cpu_online(i))
+=09=09=09continue;
+=09=09if (is_cpu_pcore(i))
+=09=09=09pcores++;
+=09=09else if (is_cpu_ecore(i))
+=09=09=09ecores++;
+=09=09else if (is_cpu_lcore(i))
+=09=09=09lcores++;
+=09}
+
+=09tdp =3D get_tdp();
+=09lpmd_log_info("Detected %d Pcores, %d Ecores, %d Lcores, TDP %dW\n",
+=09=09      pcores, ecores, lcores, tdp);
+=09ret =3D snprintf(lpmd_config->cpu_config, MAX_CONFIG_LEN - 1,
+=09=09       " %dP%dE%dL-%dW ", pcores, ecores, lcores, tdp);
+
+=09lpmd_config->tdp =3D tdp;
+
+=09return 0;
+}
+
+static int detect_lpm_cpus_cmd(char *cmd)
+{
+=09int ret;
+
+=09ret =3D cpumask_init_cpus(cmd, CPUMASK_LPM_DEFAULT);
+=09if (ret <=3D 0)
+=09=09cpumask_reset(CPUMASK_LPM_DEFAULT);
+
+=09return ret;
+}
+
+static int detect_lpm_cpus_cluster(void)
+{
+=09char path[MAX_STR_LENGTH];
+=09char str[MAX_STR_LENGTH];
+=09FILE *filep;
+=09int i, ret;
+
+=09for (i =3D get_max_cpus(); i >=3D 0; i--) {
+=09=09if (!is_cpu_online(i))
+=09=09=09continue;
+
+=09=09snprintf(path, sizeof(path),
+=09=09=09 "/sys/devices/system/cpu/cpu%d/topology/cluster_cpus_list", i);
+=09=09path[MAX_STR_LENGTH - 1] =3D '\0';
+
+=09=09filep =3D fopen(path, "r");
+=09=09if (!filep)
+=09=09=09continue;
+
+=09=09ret =3D fread(str, 1, MAX_STR_LENGTH - 1, filep);
+=09=09fclose(filep);
+
+=09=09if (ret <=3D 0)
+=09=09=09continue;
+
+=09=09str[ret] =3D '\0';
+
+=09=09if (cpumask_init_cpus(str, CPUMASK_LPM_DEFAULT) <=3D 0)
+=09=09=09continue;
+
+=09=09/* An Ecore module contains 4 Atom cores */
+=09=09if (cpumask_nr_cpus(CPUMASK_LPM_DEFAULT) =3D=3D 4 && is_cpu_atom(i))
+=09=09=09break;
+
+=09=09cpumask_reset(CPUMASK_LPM_DEFAULT);
+=09}
+
+=09if (!cpumask_has_cpu(CPUMASK_LPM_DEFAULT))
+=09=09return 0;
+
+=09return cpumask_nr_cpus(CPUMASK_LPM_DEFAULT);
+}
+
+static int detect_cpu_lcore(int cpu)
+{
+=09if (is_cpu_lcore(cpu))
+=09=09cpumask_add_cpu(cpu, CPUMASK_LPM_DEFAULT);
+=09return 0;
+}
+
+/*
+ * Use Lcore CPUs as LPM CPUs.
+ * Applies on platforms like MeteorLake.
+ */
+static int detect_lpm_cpus_lcore(void)
+{
+=09int i;
+
+=09for (i =3D 0; i < get_max_cpus(); i++) {
+=09=09if (!is_cpu_online(i))
+=09=09=09continue;
+=09=09if (detect_cpu_lcore(i) < 0)
+=09=09=09return -1;
+=09}
+
+=09/* All cpus has L3 */
+=09if (!cpumask_has_cpu(CPUMASK_LPM_DEFAULT))
+=09=09return 0;
+
+=09/* All online cpus don't have L3 */
+=09if (cpumask_equal(CPUMASK_LPM_DEFAULT, CPUMASK_ONLINE))
+=09=09goto err;
+
+=09return cpumask_nr_cpus(CPUMASK_LPM_DEFAULT);
+
+err:
+=09cpumask_reset(CPUMASK_LPM_DEFAULT);
+=09return 0;
+}
+
+int detect_lpm_cpus(char *cmd_cpus)
+{
+=09int ret;
+=09char *str =3D NULL;
+
+=09if (cmd_cpus && cmd_cpus[0] !=3D '\0') {
+=09=09ret =3D detect_lpm_cpus_cmd(cmd_cpus);
+=09=09if (ret <=3D 0) {
+=09=09=09lpmd_log_error("\tInvalid -c parameter: %s\n", cmd_cpus);
+=09=09=09exit(-1);
+=09=09}
+=09=09str =3D "CommandLine";
+=09=09goto end;
+=09}
+
+=09ret =3D detect_lpm_cpus_lcore();
+=09if (ret < 0)
+=09=09return ret;
+
+=09if (ret > 0) {
+=09=09str =3D "Lcores";
+=09=09goto end;
+=09}
+
+=09if (detect_lpm_cpus_cluster()) {
+=09=09str =3D "Ecores";
+=09=09goto end;
+=09}
+
+end:
+=09if (cpumask_has_cpu(CPUMASK_LPM_DEFAULT))
+=09=09lpmd_log_info("\tUse CPU %s as Default Low Power CPUs (%s)\n",
+=09=09=09      get_cpus_str(CPUMASK_LPM_DEFAULT), str);
+
+=09return 0;
+}
diff --git a/tools/power/x86/intel-lpmd/src/lpmd_cpumask.c b/tools/power/x8=
6/intel-lpmd/src/lpmd_cpumask.c
new file mode 100644
index 000000000000..62d0f8978889
--- /dev/null
+++ b/tools/power/x86/intel-lpmd/src/lpmd_cpumask.c
@@ -0,0 +1,479 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#define _GNU_SOURCE
+#include <err.h>
+
+#include "lpmd.h"
+
+static int topo_max_cpus;
+static int max_online_cpu;
+static size_t size_cpumask;
+
+struct lpm_cpus {
+=09cpu_set_t *mask;
+=09char *name;
+=09char *str;
+=09char *str_reverse;
+=09char *hexstr;
+=09char *hexstr_reverse;
+=09uint8_t *hexvals;
+};
+
+static struct lpm_cpus cpumasks[CPUMASK_MAX] =3D {
+=09=09[CPUMASK_LPM_DEFAULT] =3D { .name =3D "Low Power", },
+=09=09[CPUMASK_ONLINE] =3D { .name =3D "Online", },
+=09=09[CPUMASK_HFI] =3D { .name =3D "HFI Low Power", },
+=09=09[CPUMASK_HFI_BANNED] =3D { .name =3D "HFI BANNED", },
+=09=09[CPUMASK_HFI_LAST] =3D { .name =3D "HFI LAST", },
+};
+
+int is_cpu_online(int cpu)
+{
+=09if (cpu < 0 || cpu >=3D topo_max_cpus)
+=09=09return 0;
+
+=09if (!cpumasks[CPUMASK_ONLINE].mask)
+=09=09return 0;
+
+=09return CPU_ISSET_S(cpu, size_cpumask, cpumasks[CPUMASK_ONLINE].mask);
+}
+
+int get_max_cpus(void)
+{
+=09return topo_max_cpus;
+}
+
+void set_max_cpus(int num)
+{
+=09topo_max_cpus =3D num;
+}
+
+int get_max_online_cpu(void)
+{
+=09return max_online_cpu;
+}
+
+void set_max_online_cpu(int num)
+{
+=09max_online_cpu =3D num;
+}
+
+static size_t alloc_cpu_set(cpu_set_t **cpu_set)
+{
+=09cpu_set_t *_cpu_set;
+=09size_t size;
+
+=09_cpu_set =3D CPU_ALLOC((topo_max_cpus + 1));
+=09if (!_cpu_set)
+=09=09err(3, "CPU_ALLOC");
+=09size =3D CPU_ALLOC_SIZE((topo_max_cpus + 1));
+=09CPU_ZERO_S(size, _cpu_set);
+
+=09*cpu_set =3D _cpu_set;
+
+=09if (!size_cpumask)
+=09=09size_cpumask =3D size;
+
+=09if (size_cpumask && size_cpumask !=3D size) {
+=09=09lpmd_log_error("Conflict cpumask size %zu vs. %zu\n", size, size_cpu=
mask);
+=09=09exit(-1);
+=09}
+=09return size;
+}
+
+int cpu_migrate(int cpu)
+{
+=09cpu_set_t *mask;
+=09int ret;
+
+=09alloc_cpu_set(&mask);
+=09CPU_SET_S(cpu, size_cpumask, mask);
+=09ret =3D sched_setaffinity(0, size_cpumask, mask);
+=09CPU_FREE(mask);
+
+=09if (ret =3D=3D -1)
+=09=09return -1;
+=09else
+=09=09return 0;
+}
+
+int cpu_clear_affinity(void)
+{
+=09return  sched_setaffinity(0, size_cpumask, cpumasks[CPUMASK_ONLINE].mas=
k);
+}
+
+int cpumask_alloc(void)
+{
+=09int idx;
+
+=09for (idx =3D CPUMASK_USER; idx < CPUMASK_MAX; idx++) {
+=09=09if (!cpumasks[idx].mask) {
+=09=09=09alloc_cpu_set(&cpumasks[idx].mask);
+=09=09=09break;
+=09=09}
+=09}
+=09return idx;
+}
+
+int cpumask_free(enum cpumask_idx idx)
+{
+=09if (!cpumasks[idx].mask)
+=09=09return 0;
+
+=09cpumask_reset(idx);
+=09free(cpumasks[idx].mask);
+=09cpumasks[idx].mask =3D NULL;
+=09return 0;
+}
+
+int cpumask_reset(enum cpumask_idx idx)
+{
+=09if (!cpumasks[idx].mask)
+=09=09alloc_cpu_set(&cpumasks[idx].mask);
+=09else
+=09=09CPU_ZERO_S(size_cpumask, cpumasks[idx].mask);
+
+=09free(cpumasks[idx].str);
+=09free(cpumasks[idx].str_reverse);
+=09free(cpumasks[idx].hexstr);
+=09free(cpumasks[idx].hexstr_reverse);
+=09free(cpumasks[idx].hexvals);
+=09cpumasks[idx].str =3D NULL;
+=09cpumasks[idx].str_reverse =3D NULL;
+=09cpumasks[idx].hexstr =3D NULL;
+=09cpumasks[idx].hexstr_reverse =3D NULL;
+=09cpumasks[idx].hexvals =3D NULL;
+=09return 0;
+}
+
+int cpumask_add_cpu(int cpu, enum cpumask_idx idx)
+{
+=09if (idx !=3D CPUMASK_ONLINE && !is_cpu_online(cpu))
+=09=09return 0;
+
+=09if (!cpumasks[idx].mask)
+=09=09alloc_cpu_set(&cpumasks[idx].mask);
+
+=09CPU_SET_S(cpu, size_cpumask, cpumasks[idx].mask);
+
+=09return LPMD_SUCCESS;
+}
+
+int cpumask_init_cpus(char *buf, enum cpumask_idx idx)
+{
+=09unsigned int start, end;
+=09char *next;
+=09int nr_cpus =3D 0;
+
+=09if (buf[0] =3D=3D '\0')
+=09=09return 0;
+
+=09next =3D buf;
+
+=09while (next && *next) {
+=09=09if (*next =3D=3D '\n')
+=09=09=09*next =3D '\0';
+=09=09next++;
+=09}
+=09next =3D buf;
+
+=09while (next && *next) {
+=09=09if (*next =3D=3D '\n')
+=09=09=09*next =3D '\0';
+
+=09=09if (*next =3D=3D '-') /* no negative cpu numbers */
+=09=09=09goto error;
+
+=09=09start =3D strtoul(next, &next, 10);
+
+=09=09cpumask_add_cpu(start, idx);
+=09=09nr_cpus++;
+
+=09=09if (*next =3D=3D '\0')
+=09=09=09break;
+
+=09=09if (*next =3D=3D ',') {
+=09=09=09next +=3D 1;
+=09=09=09continue;
+=09=09}
+
+=09=09if (*next =3D=3D '-') {
+=09=09=09next +=3D 1; /* start range */
+=09=09} else if (*next =3D=3D '.') {
+=09=09=09next +=3D 1;
+=09=09=09if (*next =3D=3D '.')
+=09=09=09=09next +=3D 1; /* start range */
+=09=09=09else
+=09=09=09=09goto error;
+=09=09}
+
+=09=09end =3D strtoul(next, &next, 10);
+=09=09if (end <=3D start)
+=09=09=09goto error;
+
+=09=09while (++start <=3D end) {
+=09=09=09cpumask_add_cpu(start, idx);
+=09=09=09nr_cpus++;
+=09=09}
+
+=09=09if (*next =3D=3D ',')
+=09=09=09next +=3D 1;
+=09=09else if (*next !=3D '\0')
+=09=09=09goto error;
+=09}
+
+=09return nr_cpus;
+error:
+=09lpmd_log_error("CPU string malformed: %s\n", buf);
+=09return -1;
+}
+
+int cpumask_nr_cpus(enum cpumask_idx idx)
+{
+=09if (idx =3D=3D CPUMASK_NONE)
+=09=09return 0;
+
+=09if (!cpumasks[idx].mask)
+=09=09return 0;
+
+=09return CPU_COUNT_S(size_cpumask, cpumasks[idx].mask);
+}
+
+int cpumask_has_cpu(enum cpumask_idx idx)
+{
+=09return cpumask_nr_cpus(idx);
+}
+
+int cpumask_equal(enum cpumask_idx idx1, enum cpumask_idx idx2)
+{
+=09if (!cpumasks[idx1].mask || !cpumasks[idx2].mask)
+=09=09return 0;
+
+=09if (CPU_EQUAL_S(size_cpumask, cpumasks[idx1].mask, cpumasks[idx2].mask)=
)
+=09=09return 1;
+
+=09return 0;
+}
+
+void cpumask_copy(enum cpumask_idx source, enum cpumask_idx dest)
+{
+=09int i;
+
+=09cpumask_reset(dest);
+=09for (i =3D 0; i < topo_max_cpus; i++) {
+=09=09if (!CPU_ISSET_S(i, size_cpumask, cpumasks[source].mask))
+=09=09=09continue;
+
+=09=09cpumask_add_cpu(i, dest);
+=09}
+}
+
+void cpumask_exclude_copy(enum cpumask_idx source, enum cpumask_idx dest, =
enum cpumask_idx exclude)
+{
+=09int i;
+
+=09cpumask_reset(dest);
+=09for (i =3D 0; i < topo_max_cpus; i++) {
+=09=09if (!CPU_ISSET_S(i, size_cpumask, cpumasks[source].mask))
+=09=09=09continue;
+
+=09=09if (CPU_ISSET_S(i, size_cpumask, cpumasks[exclude].mask))
+=09=09=09continue;
+=09}
+}
+
+static int cpumask_to_str(cpu_set_t *mask, char *buf, int length)
+{
+=09int i;
+=09int offset =3D 0;
+
+=09buf[0] =3D '\0';
+=09for (i =3D 0; i < topo_max_cpus; i++) {
+=09=09if (!CPU_ISSET_S(i, size_cpumask, mask))
+=09=09=09continue;
+=09=09if (length - 1 < offset) {
+=09=09=09lpmd_log_debug("%s: Too many cpus\n", __func__);
+=09=09=09return 1;
+=09=09}
+=09=09offset +=3D snprintf(buf + offset, length - 1 - offset, "%d,", i);
+=09}
+=09if (offset)
+=09=09buf[offset - 1] =3D '\0';
+=09return 0;
+}
+
+static char to_hexchar(int val)
+{
+=09if (val <=3D 9)
+=09=09return val + '0';
+=09if (val >=3D 16)
+=09=09return -1;
+=09return val - 10 + 'a';
+}
+
+static int cpumask_to_hexstr(cpu_set_t *mask, char *str, int size)
+{
+=09int cpu;
+=09int i;
+=09int pos =3D 0;
+=09char c =3D 0;
+
+=09for (cpu =3D 0; cpu < topo_max_cpus; cpu++) {
+=09=09i =3D cpu % 4;
+
+=09=09if (!i)
+=09=09=09c =3D 0;
+
+=09=09if (CPU_ISSET_S(cpu, size_cpumask, mask))
+=09=09=09c +=3D (1 << i);
+
+=09=09if (i =3D=3D 3) {
+=09=09=09str[pos] =3D to_hexchar (c);
+=09=09=09pos++;
+=09=09=09if (pos >=3D size)
+=09=09=09=09return -1;
+=09=09}
+=09}
+=09str[pos] =3D '\0';
+
+=09pos--;
+=09for (i =3D 0; i <=3D pos / 2; i++) {
+=09=09c =3D str[i];
+=09=09str[i] =3D str[pos - i];
+=09=09str[pos - i] =3D c;
+=09}
+
+=09return 0;
+}
+
+char *get_cpus_str(enum cpumask_idx idx)
+{
+=09if (!cpumasks[idx].mask)
+=09=09return NULL;
+
+=09if (!CPU_COUNT_S(size_cpumask, cpumasks[idx].mask))
+=09=09return NULL;
+
+=09if (cpumasks[idx].str)
+=09=09return cpumasks[idx].str;
+
+=09cpumasks[idx].str =3D calloc(MAX_STR_LENGTH, 1);
+=09if (!cpumasks[idx].str)
+=09=09err(3, "STR_ALLOC");
+
+=09cpumask_to_str(cpumasks[idx].mask, cpumasks[idx].str, MAX_STR_LENGTH);
+=09return cpumasks[idx].str;
+}
+
+char *get_cpus_hexstr(enum cpumask_idx idx)
+{
+=09if (!cpumasks[idx].mask)
+=09=09return NULL;
+
+=09if (!CPU_COUNT_S(size_cpumask, cpumasks[idx].mask))
+=09=09return NULL;
+
+=09if (cpumasks[idx].hexstr)
+=09=09return cpumasks[idx].hexstr;
+
+=09cpumasks[idx].hexstr =3D calloc(MAX_STR_LENGTH, 1);
+=09if (!cpumasks[idx].hexstr)
+=09=09err(3, "STR_ALLOC");
+
+=09cpumask_to_hexstr(cpumasks[idx].mask, cpumasks[idx].hexstr, MAX_STR_LEN=
GTH);
+=09return cpumasks[idx].hexstr;
+}
+
+static char *get_cpus_str_reverse(enum cpumask_idx idx)
+{
+=09cpu_set_t *mask;
+
+=09if (!cpumasks[idx].mask)
+=09=09return NULL;
+
+=09if (!CPU_COUNT_S(size_cpumask, cpumasks[idx].mask))
+=09=09return NULL;
+
+=09if (cpumasks[idx].str_reverse)
+=09=09return cpumasks[idx].str_reverse;
+
+=09cpumasks[idx].str_reverse =3D calloc(MAX_STR_LENGTH, 1);
+=09if (!cpumasks[idx].str_reverse)
+=09=09err(3, "STR_ALLOC");
+
+=09alloc_cpu_set(&mask);
+=09CPU_XOR_S(size_cpumask, mask, cpumasks[idx].mask, cpumasks[CPUMASK_ONLI=
NE].mask);
+=09cpumask_to_str(mask, cpumasks[idx].str_reverse, MAX_STR_LENGTH);
+=09CPU_FREE(mask);
+
+=09return cpumasks[idx].str_reverse;
+}
+
+static uint8_t *get_cpus_hexvals(enum cpumask_idx idx, int *size)
+{
+=09int i, j, k;
+=09uint8_t v =3D 0;
+=09uint8_t *vals;
+
+=09if (!cpumasks[idx].mask)
+=09=09return NULL;
+
+=09if (!CPU_COUNT_S(size_cpumask, cpumasks[idx].mask))
+=09=09return NULL;
+
+=09*size =3D topo_max_cpus / 8;
+
+=09if (cpumasks[idx].hexvals)
+=09=09return cpumasks[idx].hexvals;
+
+=09vals =3D calloc(*size, 1);
+=09if (!vals)
+=09=09return NULL;
+
+=09for (i =3D 0; i < topo_max_cpus; i++) {
+=09=09j =3D i % 8;
+=09=09k =3D i / 8;
+
+=09=09if (k >=3D *size) {
+=09=09=09lpmd_log_error("size too big\n");
+=09=09=09free(vals);
+=09=09=09return NULL;
+=09=09}
+
+=09=09if (!CPU_ISSET_S(i, size_cpumask, cpumasks[idx].mask))
+=09=09=09goto set_val;
+
+=09=09v |=3D 1 << j;
+set_val:
+=09=09if (j =3D=3D 7) {
+=09=09=09vals[k] =3D v;
+=09=09=09v =3D 0;
+=09=09}
+=09}
+
+=09cpumasks[idx].hexvals =3D vals;
+=09return cpumasks[idx].hexvals;
+}
+
+char *get_proc_irq_str(enum cpumask_idx idx)
+{
+=09return get_cpus_hexstr(idx);
+}
+
+char *get_irqbalance_str(enum cpumask_idx idx)
+{
+=09return get_cpus_str_reverse(idx);
+}
+
+char *get_cpu_isolation_str(enum cpumask_idx idx)
+{
+=09if (idx =3D=3D CPUMASK_ONLINE)
+=09=09return get_cpus_str(idx);
+=09else
+=09=09return get_cpus_str_reverse(idx);
+}
+
+uint8_t *get_cgroup_systemd_vals(enum cpumask_idx idx, int *size)
+{
+=09return get_cpus_hexvals(idx, size);
+}
diff --git a/tools/power/x86/intel-lpmd/src/lpmd_dbus_server.c b/tools/powe=
r/x86/intel-lpmd/src/lpmd_dbus_server.c
new file mode 100644
index 000000000000..5e02e7eb22ae
--- /dev/null
+++ b/tools/power/x86/intel-lpmd/src/lpmd_dbus_server.c
@@ -0,0 +1,274 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (C) 2026 Intel Corporation */
+
+#include <gio/gio.h>
+#include <glib.h>
+#include <glib/gprintf.h>
+#include <glib-object.h>
+
+#include "lpmd.h"
+
+struct _PrefObject {
+=09GObject parent;
+};
+
+#define PREF_TYPE_OBJECT (pref_object_get_type())
+G_DECLARE_FINAL_TYPE(PrefObject, pref_object, PREF, OBJECT, GObject)
+
+#define MAX_DBUS_REPLY_STR_LEN=09100
+G_DEFINE_TYPE(PrefObject, pref_object, G_TYPE_OBJECT)
+
+static gboolean
+dbus_interface_terminate(PrefObject *obj, GError **error);
+
+static gboolean
+dbus_interface_l_pm__fo_rc_e__on(PrefObject *obj, GError **error);
+
+static gboolean
+dbus_interface_l_pm__fo_rc_e__of_f(PrefObject *obj, GError **error);
+
+static gboolean
+dbus_interface_l_pm__au_to(PrefObject *obj, GError **error);
+
+static gboolean
+(*intel_lpmd_dbus_exit_callback)(void);
+
+// Dbus object initialization
+static void pref_object_init(PrefObject *obj)
+{
+=09g_assert(obj);
+}
+
+// Dbus object class initialization
+static void pref_object_class_init(PrefObjectClass *_class)
+{
+=09g_assert(_class);
+}
+
+static gboolean dbus_interface_terminate(PrefObject *obj, GError **error)
+{
+=09lpmd_log_debug("intel_lpmd_dbus_interface_terminate\n");
+=09lpmd_terminate();
+=09if (intel_lpmd_dbus_exit_callback)
+=09=09intel_lpmd_dbus_exit_callback();
+
+=09return TRUE;
+}
+
+static gboolean dbus_interface_l_pm__fo_rc_e__on(PrefObject *obj, GError *=
*error)
+{
+=09lpmd_log_debug("intel_lpmd_dbus_interface_lpm_enter\n");
+=09lpmd_force_on();
+
+=09return TRUE;
+}
+
+static gboolean dbus_interface_l_pm__fo_rc_e__of_f(PrefObject *obj, GError=
 **error)
+{
+=09lpmd_log_debug("intel_lpmd_dbus_interface_lpm_exit\n");
+=09lpmd_force_off();
+
+=09return TRUE;
+}
+
+static gboolean dbus_interface_l_pm__au_to(PrefObject *obj, GError **error=
)
+{
+=09lpmd_set_auto();
+=09return TRUE;
+}
+
+#pragma GCC diagnostic push
+
+static GDBusInterfaceVTable interface_vtable;
+
+static GDBusNodeInfo *
+lpmd_dbus_load_introspection(const gchar *filename, GError **error)
+{
+=09g_autoptr(GBytes) data =3D NULL;
+=09g_autofree gchar *path =3D NULL;
+
+=09path =3D g_build_filename("/org/freedesktop/intel_lpmd", filename, NULL=
);
+=09data =3D g_resources_lookup_data(path, G_RESOURCE_LOOKUP_FLAGS_NONE, er=
ror);
+=09if (!data)
+=09=09return NULL;
+
+=09return g_dbus_node_info_new_for_xml((gchar *)g_bytes_get_data(data, NUL=
L), error);
+}
+
+static void
+lpmd_dbus_handle_method_call(GDBusConnection       *connection,
+=09=09=09     const gchar           *sender,
+=09=09=09     const gchar           *object_path,
+=09=09=09     const gchar           *interface_name,
+=09=09=09     const gchar           *method_name,
+=09=09=09     GVariant              *parameters,
+=09=09=09     GDBusMethodInvocation *invocation,
+=09=09=09     gpointer               user_data)
+{
+=09PrefObject *obj =3D PREF_OBJECT(user_data);
+=09g_autoptr(GError) error =3D NULL;
+
+=09lpmd_log_debug("Dbus method called %s %s.\n", interface_name, method_na=
me);
+
+=09if (g_strcmp0(method_name, "Terminate") =3D=3D 0) {
+=09=09g_dbus_method_invocation_return_value(invocation, NULL);
+=09=09dbus_interface_terminate(obj, &error);
+=09=09return;
+=09}
+
+=09if (g_strcmp0(method_name, "LPM_FORCE_ON") =3D=3D 0) {
+=09=09g_dbus_method_invocation_return_value(invocation, NULL);
+=09=09dbus_interface_l_pm__fo_rc_e__on(obj, &error);
+=09=09return;
+=09}
+
+=09if (g_strcmp0(method_name, "LPM_FORCE_OFF") =3D=3D 0) {
+=09=09g_dbus_method_invocation_return_value(invocation, NULL);
+=09=09dbus_interface_l_pm__fo_rc_e__of_f(obj, &error);
+=09=09return;
+=09}
+=09if (g_strcmp0(method_name, "LPM_AUTO") =3D=3D 0) {
+=09=09g_dbus_method_invocation_return_value(invocation, NULL);
+=09=09dbus_interface_l_pm__au_to(obj, &error);
+=09=09return;
+=09}
+
+=09if (g_strcmp0(method_name, "GetState") =3D=3D 0) {
+=09=09static const char * const state_names[] =3D {
+=09=09=09[LPMD_OFF] =3D "OFF",
+=09=09=09[LPMD_ON] =3D "ON",
+=09=09=09[LPMD_AUTO] =3D "AUTO",
+=09=09=09[LPMD_FREEZE] =3D "FREEZE",
+=09=09=09[LPMD_RESTORE] =3D "RESTORE",
+=09=09=09[LPMD_TERMINATE] =3D "TERMINATE",
+=09=09};
+=09=09int state =3D get_lpmd_state();
+=09=09const char *name =3D (state >=3D 0 && state <=3D LPMD_TERMINATE) ? s=
tate_names[state] : "UNKNOWN";
+
+=09=09g_dbus_method_invocation_return_value(invocation,
+=09=09=09=09=09=09      g_variant_new("(s)", name));
+=09=09return;
+=09}
+
+=09g_set_error(&error,
+=09=09    G_DBUS_ERROR,
+=09=09    G_DBUS_ERROR_UNKNOWN_METHOD,
+=09=09    "no such method %s",
+=09=09    method_name);
+=09g_dbus_method_invocation_return_gerror(invocation, error);
+}
+
+static GVariant *
+lpmd_dbus_handle_get_property(GDBusConnection  *connection,
+=09=09=09      const gchar      *sender,
+=09=09=09      const gchar      *object_path,
+=09=09=09      const gchar      *interface_name,
+=09=09=09      const gchar      *property_name,
+=09=09=09      GError          **error,
+=09=09=09      gpointer          user_data)
+{
+=09return NULL;
+}
+
+static gboolean
+lpmd_dbus_handle_set_property(GDBusConnection  *connection,
+=09=09=09      const gchar      *sender,
+=09=09=09      const gchar      *object_path,
+=09=09=09      const gchar      *interface_name,
+=09=09=09      const gchar      *property_name,
+=09=09=09      GVariant         *value,
+=09=09=09      GError          **error,
+=09=09=09      gpointer          user_data)
+{
+=09return TRUE;
+}
+
+static void
+lpmd_dbus_on_bus_acquired(GDBusConnection *connection,
+=09=09=09  const gchar     *name,
+=09=09=09  gpointer         user_data)
+{
+=09GDBusNodeInfo *introspection_data =3D NULL;
+=09GDBusProxy *proxy_id =3D NULL;
+=09guint registration_id;
+=09GError *error =3D NULL;
+
+=09if (!user_data) {
+=09=09lpmd_log_error("user_data is NULL\n");
+=09=09return;
+=09}
+
+=09introspection_data =3D lpmd_dbus_load_introspection("src/intel_lpmd_dbu=
s_interface.xml",
+=09=09=09=09=09=09=09  &error);
+=09if (!introspection_data || error) {
+=09=09lpmd_log_error("Couldn't create introspection data: %s:\n",
+=09=09=09       error->message);
+=09=09return;
+=09}
+
+=09registration_id =3D g_dbus_connection_register_object(connection,
+=09=09=09=09=09=09=09    "/org/freedesktop/intel_lpmd",
+=09=09=09=09=09=09=09    introspection_data->interfaces[0],
+=09=09=09=09=09=09=09    &interface_vtable,
+=09=09=09=09=09=09=09    user_data,
+=09=09=09=09=09=09=09    NULL,
+=09=09=09=09=09=09=09    &error);
+
+=09proxy_id =3D g_dbus_proxy_new_sync(connection,
+=09=09=09=09=09 G_DBUS_PROXY_FLAGS_DO_NOT_LOAD_PROPERTIES,
+=09=09=09=09=09 NULL,
+=09=09=09=09=09 "org.freedesktop.DBus",
+=09=09=09=09=09 "/org/freedesktop/DBus",
+=09=09=09=09=09 "org.freedesktop.DBus",
+=09=09=09=09=09 NULL,
+=09=09=09=09=09 &error);
+=09g_assert(registration_id > 0);
+=09g_assert(proxy_id);
+}
+
+static void
+lpmd_dbus_on_name_acquired(GDBusConnection *connection,
+=09=09=09   const gchar     *name,
+=09=09=09   gpointer         user_data)
+{
+}
+
+static void
+lpmd_dbus_on_name_lost(GDBusConnection *connection,
+=09=09       const gchar     *name,
+=09=09       gpointer         user_data)
+{
+=09g_warning("Lost the name %s\n", name);
+=09exit(1);
+}
+
+// Set up Dbus server with GDBus
+int intel_dbus_server_init(gboolean (*exit_handler)(void))
+{
+=09PrefObject *value_obj;
+
+=09intel_lpmd_dbus_exit_callback =3D exit_handler;
+
+=09value_obj =3D PREF_OBJECT(g_object_new(PREF_TYPE_OBJECT, NULL));
+=09if (!value_obj) {
+=09=09lpmd_log_error("Failed to create one Value instance:\n");
+=09=09return LPMD_FATAL_ERROR;
+=09}
+
+=09interface_vtable.method_call =3D lpmd_dbus_handle_method_call;
+=09interface_vtable.get_property =3D lpmd_dbus_handle_get_property;
+=09interface_vtable.set_property =3D lpmd_dbus_handle_set_property;
+
+=09watcher_id =3D g_bus_own_name(G_BUS_TYPE_SYSTEM,
+=09=09=09=09    "org.freedesktop.intel_lpmd",
+=09=09=09=09    G_BUS_NAME_OWNER_FLAGS_REPLACE,
+=09=09=09=09    lpmd_dbus_on_bus_acquired,
+=09=09=09=09    lpmd_dbus_on_name_acquired,
+=09=09=09=09    lpmd_dbus_on_name_lost,
+=09=09=09=09    g_object_ref(value_obj),
+=09=09=09=09    NULL);
+
+=09return LPMD_SUCCESS;
+}
+
+#pragma GCC diagnostic pop
diff --git a/tools/power/x86/intel-lpmd/src/lpmd_helpers.c b/tools/power/x8=
6/intel-lpmd/src/lpmd_helpers.c
new file mode 100644
index 000000000000..4cae4e885f5c
--- /dev/null
+++ b/tools/power/x86/intel-lpmd/src/lpmd_helpers.c
@@ -0,0 +1,385 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (C) 2026 Intel Corporation */
+
+#define _GNU_SOURCE
+#include <stdio.h>
+#include <err.h>
+#include <stdlib.h>
+#include <stdarg.h>
+#include <string.h>
+#include <time.h>
+
+#include "lpmd.h"
+
+int copy_user_string(char *src, char *dst, int size)
+{
+=09int offset_src, offset_dst;
+
+=09for (offset_src =3D 0, offset_dst =3D 0; src[offset_src] !=3D '\0' && o=
ffset_src < size; offset_src++) {
+=09=09/* Ignore heading spaces */
+=09=09if (src[offset_src] =3D=3D ' ' && !offset_dst)
+=09=09=09continue;
+=09=09dst[offset_dst] =3D src[offset_src];
+=09=09offset_dst++;
+=09}
+=09dst[offset_dst] =3D '\0';
+
+=09/* Remove tailing spaces */
+=09while (dst[--offset_dst] =3D=3D ' ')
+=09=09dst[offset_dst] =3D '\0';
+
+=09return 0;
+}
+
+int lpmd_read_str(char *path, char *str, int size)
+{
+=09FILE *filep;
+=09int ret;
+
+=09filep =3D fopen(path, "r");
+=09if (!filep) {
+=09=09lpmd_log_error("Cannot open %s\n", path);
+=09=09return 1;
+=09}
+
+=09ret =3D fread(str, 1, size, filep);
+=09fclose(filep);
+
+=09if (ret <=3D 0)
+=09=09return 1;
+
+=09if (ret >=3D size)
+=09=09ret =3D size - 1;
+=09str[ret - 1] =3D '\0';
+
+=09lpmd_log_debug("Read \"%s\" from %s\n", str, path);
+=09return 0;
+}
+
+static int _write_str(const char *name, char *str, int print_level, int lo=
g_level, const char *mode)
+{
+=09char prefix[16];
+=09FILE *filep;
+=09int i, ret;
+
+=09if (print_level >=3D 15)
+=09=09return 1;
+
+=09if (print_level <=3D 0) {
+=09=09prefix[0] =3D '\0';
+=09} else {
+=09=09for (i =3D 0; i < print_level; i++)
+=09=09=09prefix[i] =3D '\t';
+=09=09prefix[i] =3D '\0';
+=09}
+
+=09filep =3D fopen(name, mode);
+=09if (!filep) {
+=09=09lpmd_log_error("%sOpen %s failed\n", prefix, name);
+=09=09return 1;
+=09}
+
+=09ret =3D fprintf(filep, "%s", str);
+=09if (ret <=3D 0) {
+=09=09lpmd_log_error("%sWrite \"%s\" to %s failed, strlen %zu, ret %d\n",
+=09=09=09       prefix, str, name, strlen(str), ret);
+=09=09fclose(filep);
+=09=09return 1;
+=09}
+
+=09switch (print_level) {
+=09case LPMD_LOG_INFO:
+=09=09lpmd_log_info("%sWrite \"%s\" to %s\n", prefix, str, name);
+=09=09break;
+=09case LPMD_LOG_DEBUG:
+=09=09lpmd_log_debug("%sWrite \"%s\" to %s\n", prefix, str, name);
+=09=09break;
+=09case LPMD_LOG_MSG:
+=09=09lpmd_log_msg("%sWrite \"%s\" to %s\n", prefix, str, name);
+=09=09break;
+=09default:
+=09=09break;
+=09}
+
+=09fclose(filep);
+=09return 0;
+}
+
+int lpmd_write_str(const char *name, char *str, int print_level)
+{
+=09if (!name || !str)
+=09=09return 0;
+
+=09return _write_str(name, str, print_level, 2, "r+");
+}
+
+int lpmd_write_str_append(const char *name, char *str, int print_level)
+{
+=09if (!name || !str)
+=09=09return 0;
+
+=09return _write_str(name, str, print_level, 2, "a+");
+}
+
+int lpmd_write_str_verbose(const char *name, char *str, int print_level)
+{
+=09if (!name || !str)
+=09=09return 0;
+
+=09return _write_str(name, str, print_level, 3, "r+");
+}
+
+int lpmd_write_int(const char *name, int val, int print_level)
+{
+=09FILE *filep;
+=09char prefix[16];
+=09int i, ret;
+=09struct timespec tp1 =3D { }, tp2 =3D { };
+
+=09if (!name)
+=09=09return 1;
+
+=09clock_gettime(CLOCK_MONOTONIC, &tp1);
+
+=09if (print_level >=3D 15)
+=09=09return 1;
+
+=09if (print_level < 0) {
+=09=09prefix[0] =3D '\0';
+=09} else {
+=09=09for (i =3D 0; i < print_level; i++)
+=09=09=09prefix[i] =3D '\t';
+=09=09prefix[i] =3D '\0';
+=09}
+
+=09filep =3D fopen(name, "r+");
+=09if (!filep) {
+=09=09lpmd_log_error("%sOpen %s failed\n", prefix, name);
+=09=09return 1;
+=09}
+
+=09ret =3D fprintf(filep, "%d", val);
+=09if (ret <=3D 0) {
+=09=09lpmd_log_error("%sWrite \"%d\" to %s failed, ret %d\n", prefix, val,=
 name, ret);
+=09=09fclose(filep);
+=09=09return 1;
+=09}
+
+=09clock_gettime(CLOCK_MONOTONIC, &tp2);
+
+=09switch (print_level) {
+=09case LPMD_LOG_INFO:
+=09=09lpmd_log_info("%sWrite \"%d\" to %s (%lu ns)\n", prefix, val, name,
+=09=09=09      1000000000 * (tp2.tv_sec - tp1.tv_sec) + tp2.tv_nsec - tp1.=
tv_nsec);
+=09=09break;
+=09case LPMD_LOG_DEBUG:
+=09=09lpmd_log_debug("%sWrite \"%d\" to %s (%lu ns)\n", prefix, val, name,
+=09=09=09       1000000000 * (tp2.tv_sec - tp1.tv_sec) + tp2.tv_nsec - tp1=
.tv_nsec);
+=09=09break;
+=09case LPMD_LOG_MSG:
+=09=09lpmd_log_msg("%sWrite \"%d\" to %s (%lu ns)\n", prefix, val, name,
+=09=09=09     1000000000 * (tp2.tv_sec - tp1.tv_sec) + tp2.tv_nsec - tp1.t=
v_nsec);
+=09=09break;
+=09default:
+=09=09break;
+=09}
+
+=09fclose(filep);
+=09return 0;
+}
+
+int lpmd_read_int(const char *name, int *val, int print_level)
+{
+=09char prefix[16];
+=09int i, t, ret;
+=09FILE *filep;
+
+=09if (!name || !val)
+=09=09return 1;
+
+=09if (print_level >=3D 15)
+=09=09return 1;
+
+=09if (print_level < 0) {
+=09=09prefix[0] =3D '\0';
+=09} else {
+=09=09for (i =3D 0; i < print_level; i++)
+=09=09=09prefix[i] =3D '\t';
+=09=09prefix[i] =3D '\0';
+=09}
+
+=09filep =3D fopen(name, "r");
+=09if (!filep) {
+=09=09lpmd_log_error("%sOpen %s failed\n", prefix, name);
+=09=09return 1;
+=09}
+
+=09ret =3D fscanf(filep, "%d", &t);
+=09if (ret !=3D 1) {
+=09=09lpmd_log_error("%sRead %s failed, ret %d\n", prefix, name, ret);
+=09=09fclose(filep);
+=09=09return 1;
+=09}
+
+=09fclose(filep);
+
+=09*val =3D t;
+
+=09if (print_level >=3D 0)
+=09=09lpmd_log_debug("%sRead \"%d\" from %s\n", prefix, *val, name);
+
+=09return 0;
+}
+
+int lpmd_write_yn(const char *name, int val, int print_level)
+{
+=09char str[5];
+=09int ret;
+
+=09if (!name)
+=09=09return 0;
+
+=09ret =3D snprintf(str, 4, "%d", val);
+=09if (ret < 0)
+=09=09return 1;
+
+=09return _write_str(name, str, print_level, 2, "r+");
+}
+
+int lpmd_read_yn(const char *name, int *val, int print_level)
+{
+=09char prefix[16];
+=09FILE *filep;
+=09int i, ret;
+
+=09if (!name || !val)
+=09=09return 1;
+
+=09if (print_level >=3D 15)
+=09=09return 1;
+
+=09if (print_level < 0) {
+=09=09prefix[0] =3D '\0';
+=09} else {
+=09=09for (i =3D 0; i < print_level; i++)
+=09=09=09prefix[i] =3D '\t';
+=09=09prefix[i] =3D '\0';
+=09}
+
+=09filep =3D fopen(name, "r");
+=09if (!filep) {
+=09=09lpmd_log_error("%sOpen %s failed\n", prefix, name);
+=09=09return 1;
+=09}
+
+=09ret =3D fgetc(filep);
+=09if (ret =3D=3D EOF) {
+=09=09if (feof(filep))
+=09=09=09lpmd_log_error("%sRead %s failed due to EOF\n", prefix,
+=09=09=09=09       name);
+=09=09else if (ferror(filep))
+=09=09=09lpmd_log_error("%sRead %s failed, error %s\n", prefix,
+=09=09=09=09       name, strerror(errno));
+=09=09fclose(filep);
+=09=09return 1;
+=09}
+
+=09fclose(filep);
+
+=09if (ret =3D=3D 'Y') {
+=09=09*val =3D 1;
+=09} else if (ret =3D=3D 'N') {
+=09=09*val =3D 0;
+=09} else {
+=09=09lpmd_log_error("%sRead %s failed, read %c\n", prefix, name, ret);
+=09=09return 1;
+=09}
+
+=09if (print_level >=3D 0)
+=09=09lpmd_log_debug("%sRead \"%c\" from %s\n", prefix, *val, name);
+
+=09return 0;
+}
+
+/*
+ * lpmd_open does not require print on success
+ * print_level: -1: don't print on error
+ */
+int lpmd_open(const char *name, int print_level)
+{
+=09FILE *filep;
+=09char prefix[16];
+=09int i;
+
+=09if (!name)
+=09=09return 1;
+
+=09if (print_level >=3D 15)
+=09=09return 1;
+
+=09if (print_level < 0) {
+=09=09prefix[0] =3D '\0';
+=09} else {
+=09=09for (i =3D 0; i < print_level; i++)
+=09=09=09prefix[i] =3D '\t';
+=09=09prefix[i] =3D '\0';
+=09}
+
+=09filep =3D fopen(name, "r");
+=09if (!filep) {
+=09=09if (print_level >=3D 0)
+=09=09=09lpmd_log_error("%sOpen %s failed\n", prefix, name);
+=09=09return 1;
+=09}
+
+=09fclose(filep);
+=09return 0;
+}
+
+char *get_time(void)
+{
+=09static time_t time_cur;
+
+=09time_cur =3D time(NULL);
+=09return ctime(&time_cur);
+}
+
+static struct timespec timespec;
+static char time_buf[MAX_STR_LENGTH];
+void time_start(void)
+{
+=09clock_gettime(CLOCK_MONOTONIC, &timespec);
+}
+
+char *time_delta(void)
+{
+=09static struct timespec tp1;
+
+=09clock_gettime(CLOCK_MONOTONIC, &tp1);
+=09snprintf(time_buf, MAX_STR_LENGTH, "%ld ns",
+=09=09 1000000000 * (tp1.tv_sec - timespec.tv_sec) + tp1.tv_nsec - timespe=
c.tv_nsec);
+=09memset(&timespec, 0, sizeof(timespec));
+=09return time_buf;
+}
+
+uint64_t read_msr(int cpu, uint32_t msr)
+{
+=09char msr_file_name[64];
+=09int fd;
+=09uint64_t value;
+
+=09snprintf(msr_file_name, sizeof(msr_file_name), "/dev/cpu/%d/msr", cpu);
+
+=09fd =3D open(msr_file_name, O_RDONLY);
+=09if (fd < 0)
+=09=09return UINT64_MAX;
+
+=09if (pread(fd, &value, sizeof(value), msr) !=3D sizeof(value)) {
+=09=09close(fd);
+=09=09return UINT64_MAX;
+=09}
+
+=09close(fd);
+
+=09return value;
+}
diff --git a/tools/power/x86/intel-lpmd/src/lpmd_hfi.c b/tools/power/x86/in=
tel-lpmd/src/lpmd_hfi.c
new file mode 100644
index 000000000000..0b52feeef995
--- /dev/null
+++ b/tools/power/x86/intel-lpmd/src/lpmd_hfi.c
@@ -0,0 +1,373 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright(c) 2023 Intel Corporation */
+
+#ifndef _GNU_SOURCE
+#define _GNU_SOURCE
+#endif
+
+#include <stdio.h>
+#include <err.h>
+#include <stdlib.h>
+#include <stdarg.h>
+#include <string.h>
+#include <unistd.h>
+#include <fcntl.h>
+#include <sys/file.h>
+#include <sys/types.h>
+#include <sys/time.h>
+#include <sys/stat.h>
+#include <sys/socket.h>
+#include <sys/un.h>
+#include <errno.h>
+#include <getopt.h>
+#include <sched.h>
+#include <dirent.h>
+#include <ctype.h>
+#include <signal.h>
+#include <pthread.h>
+#include <netlink/genl/genl.h>
+#include <netlink/genl/family.h>
+#include <netlink/genl/ctrl.h>
+
+#include "thermal.h"
+#include "lpmd.h"
+
+struct hfi_event_data {
+=09struct nl_sock *nl_handle;
+=09struct nl_cb *nl_cb;
+};
+
+struct hfi_event_data drv;
+
+static int ack_handler(struct nl_msg *msg, void *arg)
+{
+=09int *err =3D arg;
+=09*err =3D 0;
+
+=09return NL_STOP;
+}
+
+static int finish_handler(struct nl_msg *msg, void *arg)
+{
+=09int *ret =3D arg;
+=09*ret =3D 0;
+
+=09return NL_SKIP;
+}
+
+static int error_handler(struct sockaddr_nl *nla, struct nlmsgerr *err, vo=
id *arg)
+{
+=09int *ret =3D arg;
+=09*ret =3D err->error;
+
+=09return NL_SKIP;
+}
+
+static int seq_check_handler(struct nl_msg *msg, void *arg)
+{
+=09return NL_OK;
+}
+
+static int send_and_recv_msgs(struct hfi_event_data *drv, struct nl_msg *m=
sg,
+=09=09=09      int (*valid_handler)(struct nl_msg*, void*),
+=09=09=09      void *valid_data)
+{
+=09struct nl_cb *cb;
+=09int err =3D -ENOMEM;
+
+=09cb =3D nl_cb_clone(drv->nl_cb);
+=09if (!cb)
+=09=09goto out;
+
+=09err =3D nl_send_auto_complete(drv->nl_handle, msg);
+=09if (err < 0)
+=09=09goto out;
+
+=09err =3D 1;
+
+=09nl_cb_err(cb, NL_CB_CUSTOM, error_handler, &err);
+=09nl_cb_set(cb, NL_CB_FINISH, NL_CB_CUSTOM, finish_handler, &err);
+=09nl_cb_set(cb, NL_CB_ACK, NL_CB_CUSTOM, ack_handler, &err);
+
+=09if (valid_handler)
+=09=09nl_cb_set(cb, NL_CB_VALID, NL_CB_CUSTOM, valid_handler, valid_data);
+
+=09while (err > 0)
+=09=09err =3D nl_recvmsgs(drv->nl_handle, cb);
+out: nl_cb_put(cb);
+=09nlmsg_free(msg);
+=09return err;
+}
+
+struct family_data {
+=09const char *group;
+=09int id;
+};
+
+static int family_handler(struct nl_msg *msg, void *arg)
+{
+=09struct family_data *res =3D arg;
+=09struct nlattr *tb[CTRL_ATTR_MAX + 1];
+=09struct genlmsghdr *gnlh =3D nlmsg_data(nlmsg_hdr(msg));
+=09struct nlattr *mcgrp;
+=09int i;
+
+=09nla_parse(tb, CTRL_ATTR_MAX, genlmsg_attrdata(gnlh, 0),
+=09=09  genlmsg_attrlen(gnlh, 0), NULL);
+=09if (!tb[CTRL_ATTR_MCAST_GROUPS])
+=09=09return NL_SKIP;
+
+=09nla_for_each_nested(mcgrp, tb[CTRL_ATTR_MCAST_GROUPS], i) {
+=09=09struct nlattr *tb2[CTRL_ATTR_MCAST_GRP_MAX + 1];
+
+=09=09nla_parse(tb2, CTRL_ATTR_MCAST_GRP_MAX,
+=09=09=09  nla_data(mcgrp), nla_len(mcgrp), NULL);
+=09=09if (!tb2[CTRL_ATTR_MCAST_GRP_NAME] ||
+=09=09    !tb2[CTRL_ATTR_MCAST_GRP_ID] ||
+=09=09    strncmp(nla_data(tb2[CTRL_ATTR_MCAST_GRP_NAME]), res->group,
+=09=09=09    nla_len(tb2[CTRL_ATTR_MCAST_GRP_NAME])) !=3D 0)
+=09=09=09continue;
+=09=09res->id =3D nla_get_u32(tb2[CTRL_ATTR_MCAST_GRP_ID]);
+=09=09break;
+=09};
+
+=09return 0;
+}
+
+static int nl_get_multicast_id(struct hfi_event_data *drv, const char *fam=
ily,
+=09=09=09       const char *group)
+{
+=09struct nl_msg *msg;
+=09int ret =3D -1;
+=09struct family_data res =3D { group, -ENOENT };
+
+=09msg =3D nlmsg_alloc();
+=09if (!msg)
+=09=09return -ENOMEM;
+=09genlmsg_put(msg, 0, 0, genl_ctrl_resolve(drv->nl_handle, "nlctrl"),
+=09=09    0, 0, CTRL_CMD_GETFAMILY, 0);
+=09NLA_PUT_STRING(msg, CTRL_ATTR_FAMILY_NAME, family);
+
+=09ret =3D send_and_recv_msgs(drv, msg, family_handler, &res);
+=09msg =3D NULL;
+=09if (ret =3D=3D 0)
+=09=09ret =3D res.id;
+
+nla_put_failure: nlmsg_free(msg);
+=09return ret;
+}
+
+/* Process HFI event */
+struct perf_cap {
+=09int cpu;
+=09int perf;
+=09int eff;
+};
+
+/*
+ * Detect different kinds of CPU HFI hint
+ * "LPM". EFF =3D=3D 255
+ * "SUV". PERF =3D=3D EFF =3D=3D 0, suv bit set. Not supported for now.
+ * "BAN". PERF =3D=3D EFF =3D=3D 0, suv bit not set.
+ * "NOR".
+ */
+static char *update_one_cpu(struct perf_cap *perf_cap)
+{
+=09if (perf_cap->cpu < 0)
+=09=09return NULL;
+
+=09if (!perf_cap->cpu) {
+=09=09cpumask_reset(CPUMASK_HFI);
+=09=09cpumask_reset(CPUMASK_HFI_BANNED);
+=09}
+
+=09if (perf_cap->eff =3D=3D 255 * 4) {
+=09=09cpumask_add_cpu(perf_cap->cpu, CPUMASK_HFI);
+=09=09return "LPM";
+=09}
+=09if (!perf_cap->perf && !perf_cap->eff) {
+=09=09cpumask_add_cpu(perf_cap->cpu, CPUMASK_HFI_BANNED);
+=09=09return "BAN";
+=09}
+=09return "NOR";
+}
+
+static void process_one_event(int first, int last, int nr)
+{
+=09/* Need to update more CPUs */
+=09if (nr =3D=3D 16 && last !=3D get_max_online_cpu())
+=09=09return;
+
+=09if (cpumask_has_cpu(CPUMASK_HFI)) {
+=09=09/* Ignore duplicate event */
+=09=09if (cpumask_equal(CPUMASK_HFI_LAST, CPUMASK_HFI)) {
+=09=09=09lpmd_log_debug("\tDuplicated HFI LPM hints ignored\n\n");
+=09=09=09return;
+=09=09}
+=09=09lpmd_log_debug("\tDetect HFI LPM event\n");
+=09=09update_reason(UPDATE_HFI);
+=09=09cpumask_copy(CPUMASK_HFI, CPUMASK_HFI_LAST);
+=09} else if (cpumask_has_cpu(CPUMASK_HFI_BANNED)) {
+=09=09cpumask_exclude_copy(CPUMASK_ONLINE, CPUMASK_HFI, CPUMASK_HFI_BANNED=
);
+=09=09/* Ignore duplicate event */
+=09=09if (cpumask_equal(CPUMASK_HFI_LAST, CPUMASK_HFI)) {
+=09=09=09lpmd_log_debug("\tDuplicated HFI BANNED hints ignored\n\n");
+=09=09=09return;
+=09=09}
+=09=09lpmd_log_debug("\tDetect HFI LPM event with banned CPUs\n");
+=09=09update_reason(UPDATE_HFI);
+=09=09cpumask_copy(CPUMASK_HFI, CPUMASK_HFI_LAST);
+=09} else if (cpumask_has_cpu(CPUMASK_HFI_LAST)) {
+=09=09lpmd_log_debug("\tHFI LPM recover\n");
+//=09=09 Don't override the DETECT_LPM_CPU_DEFAULT so it is auto recovered
+=09=09cpumask_copy(CPUMASK_ONLINE, CPUMASK_HFI);
+=09=09update_reason(UPDATE_HFI);
+=09=09cpumask_reset(CPUMASK_HFI_LAST);
+=09} else {
+=09=09lpmd_log_info("\t\t\tUnsupported HFI event ignored\n");
+=09}
+}
+
+static void __handle_event(struct nlattr *cap, int *index,
+=09=09=09   int *offset, char *buf, struct perf_cap *perf_cap,
+=09=09=09   int *first_cpu, int *last_cpu, int *nr_cpus)
+{
+=09switch (*index) {
+=09case 0:
+=09=09*offset +=3D snprintf(buf + *offset, MAX_STR_LENGTH -
+=09=09=09=09    *offset, "\tCPU %3d: ", nla_get_u32(cap));
+=09=09perf_cap->cpu =3D nla_get_u32(cap);
+=09=09break;
+=09case 1:
+=09=09*offset +=3D snprintf(buf + *offset, MAX_STR_LENGTH -
+=09=09=09=09    *offset, " PERF [%4d] ", nla_get_u32(cap));
+=09=09perf_cap->perf =3D nla_get_u32(cap);
+=09=09break;
+=09case 2:
+=09=09*offset +=3D snprintf(buf + *offset, MAX_STR_LENGTH -
+=09=09=09=09    *offset, " EFF [%4d] ", nla_get_u32(cap));
+=09=09perf_cap->eff =3D nla_get_u32(cap);
+=09=09break;
+=09default:
+=09=09break;
+=09}
+=09*index +=3D 1;
+
+=09if (*index =3D=3D 3) {
+=09=09char *str;
+
+=09=09str =3D update_one_cpu(perf_cap);
+=09=09*offset +=3D snprintf(buf + *offset, MAX_STR_LENGTH -
+=09=09=09=09    *offset, " TYPE [%s]", str);
+=09=09buf[MAX_STR_LENGTH - 1] =3D '\0';
+=09=09lpmd_log_debug("\t\t\t%s\n", buf);
+
+=09=09*index =3D 0;
+=09=09*offset =3D 0;
+
+=09=09if (*first_cpu =3D=3D -1)
+=09=09=09*first_cpu =3D perf_cap->cpu;
+=09=09*last_cpu =3D perf_cap->cpu;
+=09=09*nr_cpus +=3D 1;
+=09}
+}
+
+static int handle_event(struct nl_msg *n, void *arg)
+{
+=09struct nlmsghdr *nlh =3D nlmsg_hdr(n);
+=09struct genlmsghdr *genlhdr =3D genlmsg_hdr(nlh);
+=09struct nlattr *attrs[THERMAL_GENL_ATTR_MAX + 1];
+=09struct nlattr *cap;
+=09struct perf_cap perf_cap;
+=09int first_cpu =3D -1, last_cpu =3D -1, nr_cpus =3D 0;
+=09int j, index =3D 0, offset =3D 0;
+=09char buf[MAX_STR_LENGTH];
+
+=09if (genlhdr->cmd !=3D THERMAL_GENL_EVENT_CAPACITY_CHANGE)
+=09=09return 0;
+
+=09if (genlmsg_parse(nlh, 0, attrs, THERMAL_GENL_ATTR_MAX, NULL))
+=09=09return -1;
+
+=09perf_cap.eff =3D -1;
+=09perf_cap.perf =3D -1;
+=09perf_cap.cpu =3D -1;
+
+=09nla_for_each_nested(cap, attrs[THERMAL_GENL_ATTR_CAPACITY], j)
+=09=09__handle_event(cap, &index, &offset, buf, &perf_cap,
+=09=09=09       &first_cpu, &last_cpu, &nr_cpus);
+=09process_one_event(first_cpu, last_cpu, nr_cpus);
+
+=09return 0;
+}
+
+static int done;
+
+int hfi_kill(void)
+{
+=09nl_socket_free(drv.nl_handle);
+=09done =3D 1;
+=09return 0;
+}
+
+int hfi_update(void)
+{
+=09int err =3D 0;
+
+=09while (!err)
+=09=09err =3D nl_recvmsgs(drv.nl_handle, drv.nl_cb);
+
+=09return 0;
+}
+
+int hfi_init(void)
+{
+=09struct nl_sock *sock;
+=09struct nl_cb *cb;
+=09int mcast_id;
+
+=09cpumask_reset(CPUMASK_HFI_LAST);
+
+=09signal(SIGPIPE, SIG_IGN);
+
+=09sock =3D nl_socket_alloc();
+=09if (!sock) {
+=09=09lpmd_log_error("nl_socket_alloc failed\n");
+=09=09goto err_proc;
+=09}
+
+=09if (genl_connect(sock)) {
+=09=09lpmd_log_error("genl_connect(sk_event) failed\n");
+=09=09goto err_proc;
+=09}
+
+=09drv.nl_handle =3D sock;
+=09cb =3D nl_cb_alloc(NL_CB_DEFAULT);
+=09drv.nl_cb =3D cb;
+=09if (!drv.nl_cb) {
+=09=09lpmd_log_error("Failed to allocate netlink callbacks");
+=09=09goto err_proc;
+=09}
+
+=09mcast_id =3D nl_get_multicast_id(&drv, THERMAL_GENL_FAMILY_NAME,
+=09=09=09=09       THERMAL_GENL_EVENT_GROUP_NAME);
+=09if (mcast_id < 0) {
+=09=09lpmd_log_error("nl_get_multicast_id failed\n");
+=09=09goto err_proc;
+=09}
+
+=09if (nl_socket_add_membership(sock, mcast_id)) {
+=09=09lpmd_log_error("nl_socket_add_membership failed");
+=09=09goto err_proc;
+=09}
+
+=09nl_cb_set(cb, NL_CB_SEQ_CHECK, NL_CB_CUSTOM, seq_check_handler, &done);
+=09nl_cb_set(cb, NL_CB_VALID, NL_CB_CUSTOM, handle_event, NULL);
+
+=09nl_socket_set_nonblocking(sock);
+
+=09if (drv.nl_handle)
+=09=09return nl_socket_get_fd(drv.nl_handle);
+
+err_proc: return -1;
+}
diff --git a/tools/power/x86/intel-lpmd/src/lpmd_irq.c b/tools/power/x86/in=
tel-lpmd/src/lpmd_irq.c
new file mode 100644
index 000000000000..cb8a3a55da32
--- /dev/null
+++ b/tools/power/x86/intel-lpmd/src/lpmd_irq.c
@@ -0,0 +1,262 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (C) 2026 Intel Corporation */
+
+#define _GNU_SOURCE
+#include <stdio.h>
+#include <err.h>
+#include <stdlib.h>
+#include <stdarg.h>
+#include <string.h>
+#include <unistd.h>
+#include <fcntl.h>
+#include <sys/file.h>
+#include <sys/types.h>
+#include <sys/time.h>
+#include <sys/stat.h>
+#include <sys/socket.h>
+#include <sys/un.h>
+#include <errno.h>
+#include <getopt.h>
+#include <sched.h>
+#include <dirent.h>
+#include <ctype.h>
+#include <signal.h>
+#include <netlink/genl/genl.h>
+#include <netlink/genl/family.h>
+#include <netlink/genl/ctrl.h>
+
+#include "lpmd.h"
+
+static char irq_socket_name[64];
+
+static int irqbalance_pid =3D -1;
+
+#define MAX_IRQS=09=09128
+
+struct info_irq {
+=09int irq;
+=09char affinity[MAX_STR_LENGTH];
+};
+
+struct info_irqs {
+=09/* Cached IRQ smp_affinity info */
+=09int nr_irqs;
+=09struct info_irq irq[MAX_IRQS];
+};
+
+struct info_irqs info_irqs;
+struct info_irqs *info =3D &info_irqs;
+
+/* Interrupt Management */
+#define SOCKET_PATH "irqbalance"
+#define SOCKET_TMPFS "/run/irqbalance"
+
+static int irqbalance_ban_cpus(char *irq_str)
+{
+=09char socket_cmd[MAX_STR_LENGTH];
+=09int offset;
+
+=09lpmd_log_debug("\tUpdate IRQ affinity (irqbalance)\n");
+=09offset =3D snprintf(socket_cmd, MAX_STR_LENGTH, "settings cpus %s", irq=
_str);
+=09if (offset >=3D MAX_STR_LENGTH)
+=09=09offset =3D MAX_STR_LENGTH - 1;
+
+=09socket_cmd[offset] =3D '\0';
+=09socket_send_cmd(irq_socket_name, socket_cmd);
+
+=09lpmd_log_debug("\tSend socket command %s\n", socket_cmd);
+=09return 0;
+}
+
+static int native_restore_irqs(void)
+{
+=09char path[MAX_STR_LENGTH];
+=09int i;
+
+=09lpmd_log_debug("\tRestore IRQ affinity (native)\n");
+
+=09for (i =3D 0; i < info->nr_irqs; i++) {
+=09=09char *str =3D info->irq[i].affinity;
+
+=09=09snprintf(path, MAX_STR_LENGTH, "/proc/irq/%i/smp_affinity", info->ir=
q[i].irq);
+
+=09=09lpmd_write_str(path, str, LPMD_LOG_DEBUG);
+=09}
+=09memset(info, 0, sizeof(*info));
+=09return 0;
+}
+
+static int irq_updated;
+
+static int update_one_irq(int irq, char *irq_str)
+{
+=09char path[MAX_STR_LENGTH];
+=09char *str =3D NULL;
+=09size_t size =3D 0;
+=09FILE *filep;
+
+=09if (info->nr_irqs >=3D (MAX_IRQS - 1)) {
+=09=09lpmd_log_error("Too many IRQs\n");
+=09=09return -1;
+=09}
+
+=09snprintf(path, MAX_STR_LENGTH, "/proc/irq/%i/smp_affinity", irq);
+
+=09if (!irq_updated) {
+=09=09info->irq[info->nr_irqs].irq =3D irq;
+=09=09filep =3D fopen(path, "r");
+=09=09if (!filep)
+=09=09=09return -1;
+
+=09=09if (getline(&str, &size, filep) <=3D 0) {
+=09=09=09lpmd_log_error("Failed to get IRQ%d smp_affinity\n", irq);
+=09=09=09free(str);
+=09=09=09fclose(filep);
+=09=09=09return -1;
+=09=09}
+
+=09=09fclose(filep);
+
+=09=09snprintf(info->irq[info->nr_irqs].affinity, MAX_STR_LENGTH, "%s", st=
r);
+
+=09=09free(str);
+
+=09=09/* Remove the Newline */
+=09=09size =3D strnlen(info->irq[info->nr_irqs].affinity, MAX_STR_LENGTH);
+=09=09info->irq[info->nr_irqs].affinity[size - 1] =3D '\0';
+
+=09=09info->nr_irqs++;
+=09}
+
+=09return lpmd_write_str(path, irq_str, LPMD_LOG_DEBUG);
+}
+
+static int native_update_irqs(char *irq_str)
+{
+=09char *line =3D NULL;
+=09size_t size =3D 0;
+=09FILE *filep;
+
+=09lpmd_log_debug("\tUpdate IRQ affinity (native)\n");
+
+=09filep =3D fopen("/proc/interrupts", "r");
+=09if (!filep) {
+=09=09perror("Error open /proc/interrupts\n");
+=09=09return -1;
+=09}
+
+=09/* first line is the header we don't need; nuke it */
+=09if (getline(&line, &size, filep) <=3D 0) {
+=09=09perror("Error getline\n");
+=09=09free(line);
+=09=09fclose(filep);
+=09=09return -1;
+=09}
+=09free(line);
+
+=09while (!feof(filep)) {
+=09=09int number;
+=09=09char *c;
+
+=09=09line =3D NULL;
+=09=09size =3D 0;
+
+=09=09if (getline(&line, &size, filep) <=3D 0) {
+=09=09=09free(line);
+=09=09=09break;
+=09=09}
+
+=09=09/* lines with letters in front are special, like NMI count. Ignore *=
/
+=09=09c =3D line;
+=09=09while (isblank(*(c)))
+=09=09=09c++;
+
+=09=09if (!isdigit(*c)) {
+=09=09=09free(line);
+=09=09=09break;
+=09=09}
+=09=09c =3D strchr(line, ':');
+=09=09if (!c) {
+=09=09=09free(line);
+=09=09=09continue;
+=09=09}
+
+=09=09*c =3D 0;
+=09=09number =3D strtoul(line, NULL, 10);
+
+=09=09update_one_irq(number, irq_str);
+=09=09free(line);
+=09}
+
+=09fclose(filep);
+
+=09irq_updated =3D 1;
+=09return 0;
+}
+
+int process_irq(struct lpmd_config_state_t *state)
+{
+=09switch (state->irq_migrate) {
+=09case SETTING_IGNORE:
+=09=09lpmd_log_info("Ignore IRQ migration\n");
+=09=09return 0;
+=09case SETTING_RESTORE:
+=09=09if (irqbalance_pid =3D=3D -1)
+=09=09=09native_restore_irqs();
+=09=09else
+=09=09=09irqbalance_ban_cpus("NULL");
+=09=09return 0;
+=09default:
+=09=09if (state->cpumask_idx =3D=3D CPUMASK_NONE)
+=09=09=09return 0;
+=09=09if (irqbalance_pid =3D=3D -1)
+=09=09=09native_update_irqs(get_proc_irq_str(state->cpumask_idx));
+=09=09else
+=09=09=09irqbalance_ban_cpus(get_irqbalance_str(state->cpumask_idx));
+=09=09return 0;
+=09}
+=09return 0;
+}
+
+int irq_init(void)
+{
+=09DIR *dir;
+=09int socket_fd;
+=09int ret;
+
+=09lpmd_log_info("Detecting IRQs ...\n");
+
+=09dir =3D opendir("/run/irqbalance");
+=09if (dir) {
+=09=09struct dirent *entry;
+
+=09=09do {
+=09=09=09entry =3D readdir(dir);
+=09=09=09if (entry) {
+=09=09=09=09if (!strncmp(entry->d_name, "irqbalance", 10)) {
+=09=09=09=09=09ret =3D sscanf(entry->d_name, "irqbalance%d.sock", &irqbala=
nce_pid);
+=09=09=09=09=09if (!ret)
+=09=09=09=09=09=09irqbalance_pid =3D -1;
+=09=09=09=09}
+=09=09=09}
+=09=09} while ((entry) && (irqbalance_pid =3D=3D -1));
+
+=09=09closedir(dir);
+=09}
+
+=09if (irqbalance_pid =3D=3D -1) {
+=09=09lpmd_log_info("\tirqbalance not running, run in native mode\n");
+=09=09return LPMD_SUCCESS;
+=09}
+
+=09snprintf(irq_socket_name, 64, "%s/%s%d.sock", SOCKET_TMPFS, SOCKET_PATH=
, irqbalance_pid);
+=09socket_fd =3D socket_init_connection(irq_socket_name);
+=09if (socket_fd < 0) {
+=09=09lpmd_log_error("Can not connect to irqbalance socket /run/irqbalance=
/irqbalance%d.sock\n",
+=09=09=09       irqbalance_pid);
+=09=09return LPMD_ERROR;
+=09}
+=09close(socket_fd);
+=09lpmd_log_info("\tFind irqbalance socket %s\n", irq_socket_name);
+=09return LPMD_SUCCESS;
+}
diff --git a/tools/power/x86/intel-lpmd/src/lpmd_main.c b/tools/power/x86/i=
ntel-lpmd/src/lpmd_main.c
new file mode 100644
index 000000000000..56a163c80ff5
--- /dev/null
+++ b/tools/power/x86/intel-lpmd/src/lpmd_main.c
@@ -0,0 +1,297 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (C) 2026 Intel Corporation */
+
+#include <gio/gio.h>
+#include <glib.h>
+#include <glib-unix.h>
+#include <syslog.h>
+
+#include "lpmd.h"
+
+#if !defined(INTEL_LPMD_DIST_VERSION)
+#define INTEL_LPMD_DIST_VERSION PACKAGE_VERSION
+#endif
+
+#define EXIT_UNSUPPORTED 2
+
+// Lock file
+static int lock_file_handle =3D -1;
+static const char *lock_file =3D TDRUNDIR "/intel_lpmd.pid";
+
+// Default log level
+static int lpmd_log_level =3D G_LOG_LEVEL_ERROR | G_LOG_LEVEL_CRITICAL | G=
_LOG_LEVEL_WARNING
+=09=09=09    | G_LOG_LEVEL_MESSAGE;
+
+int in_debug_mode(void)
+{
+=09return !!(lpmd_log_level & G_LOG_LEVEL_DEBUG);
+}
+
+// Daemonize or not
+static gboolean intel_lpmd_daemonize;
+static gboolean use_syslog;
+
+// Disable dbus
+static gboolean ignore_platform_check =3D FALSE;
+static gboolean dbus_enable;
+
+int do_platform_check(void)
+{
+=09if (ignore_platform_check)
+=09=09return 0;
+
+=09return 1;
+}
+
+static GMainLoop *g_main_loop;
+
+#ifdef GDBUS
+gint watcher_id =3D 0;
+#endif
+
+// g_log handler. All logs will be directed here
+static void intel_lpmd_logger(const gchar *log_domain, GLogLevelFlags log_=
level,
+=09=09=09      const gchar *message, gpointer user_data)
+{
+=09int syslog_priority;
+=09const char *prefix;
+=09time_t seconds;
+
+=09if (!(lpmd_log_level & log_level))
+=09=09return;
+
+=09switch (log_level) {
+=09case G_LOG_LEVEL_ERROR:
+=09=09prefix =3D "[CRIT]";
+=09=09syslog_priority =3D LOG_CRIT;
+=09=09break;
+=09case G_LOG_LEVEL_CRITICAL:
+=09=09prefix =3D "[ERR]";
+=09=09syslog_priority =3D LOG_ERR;
+=09=09break;
+=09case G_LOG_LEVEL_WARNING:
+=09=09prefix =3D "[WARN]";
+=09=09syslog_priority =3D LOG_WARNING;
+=09=09break;
+=09case G_LOG_LEVEL_MESSAGE:
+=09=09prefix =3D "[MSG]";
+=09=09syslog_priority =3D LOG_NOTICE;
+=09=09break;
+=09case G_LOG_LEVEL_DEBUG:
+=09=09prefix =3D "[DEBUG]";
+=09=09syslog_priority =3D LOG_DEBUG;
+=09=09break;
+=09case G_LOG_LEVEL_INFO:
+=09default:
+=09=09prefix =3D "[INFO]";
+=09=09syslog_priority =3D LOG_INFO;
+=09=09break;
+=09}
+
+=09seconds =3D time(NULL);
+
+=09if (use_syslog)
+=09=09syslog(syslog_priority, "%s", message);
+=09else
+=09=09g_print("[%lld]%s%s", (long long)seconds, prefix, message);
+}
+
+static void clean_up_lockfile(void)
+{
+=09if (lock_file_handle !=3D -1) {
+=09=09(void)close(lock_file_handle);
+=09=09(void)unlink(lock_file);
+=09}
+}
+
+static bool check_intel_lpmd_running(void)
+{
+=09lock_file_handle =3D open(lock_file, O_RDWR | O_CREAT, 0600);
+=09if (lock_file_handle =3D=3D -1) {
+//=09=09 Couldn't open lock file
+=09=09lpmd_log_error("Could not open PID lock file %s, exiting\n", lock_fi=
le);
+=09=09return false;
+=09}
+//=09 Try to lock file
+=09if (lockf(lock_file_handle, F_TLOCK, 0) =3D=3D -1) {
+//=09=09 Couldn't get lock on lock file
+=09=09lpmd_log_error("Couldn't get lock file %d\n", getpid());
+=09=09close(lock_file_handle);
+=09=09return true;
+=09}
+
+=09return false;
+}
+
+// SIGTERM & SIGINT handler
+static gboolean sig_int_handler(void)
+{
+//=09 Call terminate function
+=09lpmd_terminate();
+
+=09sleep(1);
+
+=09if (g_main_loop)
+=09=09g_main_loop_quit(g_main_loop);
+
+//=09 Clean up if any
+=09clean_up_lockfile();
+
+=09exit(EXIT_SUCCESS);
+
+=09return FALSE;
+}
+
+int main(int argc, char *argv[])
+{
+=09gboolean show_version =3D FALSE;
+=09gboolean log_debug =3D FALSE;
+=09gboolean no_daemon =3D FALSE;
+=09gboolean log_info =3D FALSE;
+=09gboolean systemd =3D FALSE;
+=09GOptionContext *opt_ctx;
+=09gboolean success;
+=09int ret;
+
+=09intel_lpmd_daemonize =3D TRUE;
+=09dbus_enable =3D FALSE;
+=09use_syslog =3D TRUE;
+
+=09GOptionEntry options[] =3D {
+=09=09{ "version", 0, 0, G_OPTION_ARG_NONE, &show_version, N_("Print intel=
_lpmd version and exit"), NULL },
+=09=09{ "no-daemon", 0, 0, G_OPTION_ARG_NONE, &no_daemon, N_("Don't become=
 a daemon: Default is daemon mode"), NULL },
+=09=09{ "systemd", 0, 0, G_OPTION_ARG_NONE, &systemd, N_("Assume daemon is=
 started by systemd, always run in non-daemon mode when using this paramete=
r"), NULL },
+=09=09{ "loglevel=3Dinfo", 0, 0, G_OPTION_ARG_NONE, &log_info, N_("Log sev=
erity: info level and up"), NULL },
+=09=09{ "loglevel=3Ddebug", 0, 0, G_OPTION_ARG_NONE, &log_debug, N_("Log s=
everity: debug level and up: Max logging"), NULL },
+=09=09{ "dbus-enable", 0, 0, G_OPTION_ARG_NONE, &dbus_enable, N_("Enable D=
bus"), NULL },
+=09=09{ "ignore-platform-check", 0, 0, G_OPTION_ARG_NONE, &ignore_platform=
_check, N_("Ignore platform check"), NULL },
+=09=09{ NULL, 0, 0, G_OPTION_ARG_NONE, NULL, NULL, NULL }
+=09};
+
+=09if (!g_module_supported()) {
+=09=09fprintf(stderr, "GModules are not supported on your platform!\n");
+=09=09exit(EXIT_FAILURE);
+=09}
+
+//=09Set locale to be able to use environment variables
+=09setlocale(LC_ALL, "");
+
+=09bindtextdomain(GETTEXT_PACKAGE, TDLOCALEDIR);
+=09bind_textdomain_codeset(GETTEXT_PACKAGE, "UTF-8");
+=09textdomain(GETTEXT_PACKAGE);
+
+//=09 Parse options
+=09opt_ctx =3D g_option_context_new(NULL);
+=09g_option_context_set_translation_domain(opt_ctx, GETTEXT_PACKAGE);
+=09g_option_context_set_ignore_unknown_options(opt_ctx, FALSE);
+=09g_option_context_set_help_enabled(opt_ctx, TRUE);
+=09g_option_context_add_main_entries(opt_ctx, options, NULL);
+
+=09g_option_context_set_summary(opt_ctx,
+=09=09=09=09     "Intel Energy Optimizer (LPMD) Daemon based on system usa=
ge takes action "
+=09=09=09=09     "to improve energy efficiency the system.\n\n"
+=09=09=09=09     "Copyright (c) 2024, Intel Corporation\n"
+=09=09=09=09     "This program comes with ABSOLUTELY NO WARRANTY.\n"
+=09=09=09=09     "This work is licensed under GPL v2.\n\n"
+=09=09=09=09     "Use \"man intel_lpmd\" to get more details.");
+
+=09success =3D g_option_context_parse(opt_ctx, &argc, &argv, NULL);
+=09g_option_context_free(opt_ctx);
+
+=09if (!success) {
+=09=09fprintf(stderr,
+=09=09=09"Invalid option.  Please use --help to see a list of valid option=
s.\n");
+=09=09exit(EXIT_FAILURE);
+=09}
+
+=09if (show_version) {
+=09=09fprintf(stdout, INTEL_LPMD_DIST_VERSION "\n");
+=09=09exit(EXIT_SUCCESS);
+=09}
+
+=09if (getuid() !=3D 0) {
+=09=09fprintf(stderr, "You must be root to run intel_lpmd!\n");
+=09=09exit(EXIT_FAILURE);
+=09}
+
+=09if (g_mkdir_with_parents(TDRUNDIR, 0755) !=3D 0) {
+=09=09fprintf(stderr, "Cannot create '%s': %s", TDRUNDIR, strerror(errno))=
;
+=09=09exit(EXIT_FAILURE);
+=09}
+
+=09if (g_mkdir_with_parents(TDCONFDIR, 0755) !=3D 0) {
+=09=09fprintf(stderr, "Cannot create '%s': %s", TDCONFDIR, strerror(errno)=
);
+=09=09exit(EXIT_FAILURE);
+=09}
+
+=09if (log_info)
+=09=09lpmd_log_level |=3D G_LOG_LEVEL_INFO;
+
+=09if (log_debug)
+=09=09lpmd_log_level |=3D G_LOG_LEVEL_INFO | G_LOG_LEVEL_DEBUG;
+
+=09openlog("intel_lpmd", LOG_PID, LOG_USER | LOG_DAEMON | LOG_SYSLOG);
+//=09 Don't care return val
+
+=09intel_lpmd_daemonize =3D !no_daemon && !systemd;
+=09use_syslog =3D !no_daemon || systemd;
+=09g_log_set_handler(NULL, G_LOG_LEVEL_MASK, intel_lpmd_logger, NULL);
+
+=09if (check_intel_lpmd_running()) {
+=09=09lpmd_log_error("An instance of intel_lpmd is already running, exitin=
g ...\n");
+=09=09exit(EXIT_FAILURE);
+=09}
+
+=09if (!intel_lpmd_daemonize) {
+=09=09g_unix_signal_add(SIGINT, G_SOURCE_FUNC(sig_int_handler), NULL);
+=09=09g_unix_signal_add(SIGTERM, G_SOURCE_FUNC(sig_int_handler), NULL);
+=09}
+
+=09// Create a main loop that will dispatch callbacks
+=09g_main_loop =3D g_main_loop_new(NULL, FALSE);
+=09if (!g_main_loop) {
+=09=09clean_up_lockfile();
+=09=09lpmd_log_error("Couldn't create GMainLoop:\n");
+=09=09return LPMD_FATAL_ERROR;
+=09}
+
+=09if (intel_lpmd_daemonize) {
+=09=09printf("Ready to serve requests: Daemonizing..\n");
+=09=09lpmd_log_info("intel_lpmd ver %s: Ready to serve requests: Daemonizi=
ng..\n",
+=09=09=09      INTEL_LPMD_DIST_VERSION);
+
+=09=09if (daemon(0, 0) !=3D 0) {
+=09=09=09clean_up_lockfile();
+=09=09=09lpmd_log_error("Failed to daemonize.\n");
+=09=09=09return LPMD_FATAL_ERROR;
+=09=09}
+=09}
+
+=09if (dbus_enable)
+=09=09intel_dbus_server_init(sig_int_handler);
+
+=09ret =3D lpmd_main();
+
+=09if (ret !=3D LPMD_SUCCESS) {
+=09=09clean_up_lockfile();
+=09=09closelog();
+
+=09=09if (ret =3D=3D LPMD_ERROR)
+=09=09=09exit(EXIT_UNSUPPORTED);
+=09=09else
+=09=09=09exit(EXIT_FAILURE);
+=09}
+
+//=09Start service requests on the D-Bus
+=09lpmd_log_debug("Start main loop\n");
+=09g_main_loop_run(g_main_loop);
+=09lpmd_log_warn("Oops g main loop exit..\n");
+
+#ifdef GDBUS
+=09g_bus_unwatch_name(watcher_id);
+#endif
+
+=09fprintf(stdout, "Exiting ..\n");
+=09clean_up_lockfile();
+=09closelog();
+}
diff --git a/tools/power/x86/intel-lpmd/src/lpmd_misc.c b/tools/power/x86/i=
ntel-lpmd/src/lpmd_misc.c
new file mode 100644
index 000000000000..2618f7d3e25f
--- /dev/null
+++ b/tools/power/x86/intel-lpmd/src/lpmd_misc.c
@@ -0,0 +1,483 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#define _GNU_SOURCE
+#include "lpmd.h"
+
+/* ITMT Management */
+#define PATH_ITMT_CONTROL "/proc/sys/kernel/sched_itmt_enabled"
+#define PATH_ITMT_CONTROL_DEBUGFS "/sys/kernel/debug/x86/sched_itmt_enable=
d"
+
+static int has_itmt;
+static int saved_itmt =3D SETTING_IGNORE;
+
+int get_itmt(void)
+{
+=09int val, ret;
+
+=09if (!has_itmt)
+=09=09return -1;
+
+=09ret =3D lpmd_read_yn(PATH_ITMT_CONTROL_DEBUGFS, &val, -1);
+=09if (!ret)
+=09=09return val;
+
+=09lpmd_log_debug("Read ITMT debugfs failed, fallback to sysctl\n");
+=09ret =3D lpmd_read_int(PATH_ITMT_CONTROL, &val, -1);
+=09if (ret) {
+=09=09lpmd_log_error("Read ITMT sysctl failed\n");
+=09=09=09return -1;
+=09}
+
+=09return val;
+}
+
+void itmt_init(void)
+{
+=09if (lpmd_read_yn(PATH_ITMT_CONTROL_DEBUGFS, &saved_itmt, -1)) {
+=09=09lpmd_log_debug("ITMT debugfs not detected\n");
+=09} else {
+=09=09has_itmt =3D 1;
+=09=09return;
+=09}
+
+=09if (lpmd_read_int(PATH_ITMT_CONTROL, &saved_itmt, -1))
+=09=09lpmd_log_debug("ITMT not detected\n");
+=09else
+=09=09has_itmt =3D 1;
+}
+
+int process_itmt(struct lpmd_config_state_t *state)
+{
+=09int ret;
+
+=09if (!has_itmt)
+=09=09return 0;
+
+=09switch (state->itmt_state) {
+=09case SETTING_IGNORE:
+=09=09lpmd_log_debug("Ignore ITMT\n");
+=09=09return 0;
+=09case SETTING_RESTORE:
+=09=09ret =3D lpmd_write_yn(PATH_ITMT_CONTROL_DEBUGFS, saved_itmt, -1);
+=09=09if (ret)
+=09=09=09return lpmd_write_int(PATH_ITMT_CONTROL, saved_itmt, -1);
+=09=09return ret;
+=09default:
+=09=09lpmd_log_debug("%s ITMT\n", state->itmt_state ? "Enable" : "Disable"=
);
+=09=09ret =3D lpmd_write_yn(PATH_ITMT_CONTROL_DEBUGFS, state->itmt_state, =
-1);
+=09=09if (ret)
+=09=09=09return lpmd_write_int(PATH_ITMT_CONTROL, state->itmt_state, -1);
+=09=09return ret;
+=09}
+}
+
+/* Slider Management */
+
+#define PATH_PLATFORM_PROFILE=09"/sys/class/platform-profile"
+#define NAME_SOC_SLD=09=09"SoC Power Slider"
+
+static char soc_sld_path[MAX_STR_LENGTH];
+static char soc_sld_profile[MAX_STR_LENGTH];
+static int slider_available;
+static int slider_unavailable;
+
+#define PATH_SOC_BALANCE_SLIDER=09"/sys/module/processor_thermal_soc_slide=
r/parameters/slider_balance"
+#define PATH_SOC_OFFSET=09=09"/sys/module/processor_thermal_soc_slider/par=
ameters/slider_offset"
+
+static void init_slider_path(void)
+{
+=09struct dirent *entry;
+=09DIR *dir;
+=09int ret;
+
+=09snprintf(soc_sld_path, MAX_STR_LENGTH, "%s", PATH_PLATFORM_PROFILE);
+
+=09dir =3D opendir(soc_sld_path);
+=09if (!dir) {
+=09=09lpmd_log_debug("Cannot find %s\n", soc_sld_path);
+=09=09goto slider_failed;
+=09}
+
+=09while ((entry =3D readdir(dir)) !=3D NULL) {
+=09=09if (strlen(entry->d_name) > 100)
+=09=09=09continue;
+=09=09if (strncmp(entry->d_name, "platform-profile",
+=09=09=09    strlen("platform-profile")))
+=09=09=09continue;
+
+=09=09snprintf(soc_sld_path, MAX_STR_LENGTH, "%s/%s/name",
+=09=09=09 PATH_PLATFORM_PROFILE, entry->d_name);
+
+=09=09ret =3D lpmd_read_str(soc_sld_path, soc_sld_profile, MAX_STR_LENGTH)=
;
+=09=09if (ret)
+=09=09=09continue;
+
+=09=09if (!strncmp(soc_sld_profile, NAME_SOC_SLD, strlen(NAME_SOC_SLD))) {
+=09=09=09snprintf(soc_sld_path, MAX_STR_LENGTH, "%s/%s/profile",
+=09=09=09=09 PATH_PLATFORM_PROFILE, entry->d_name);
+=09=09=09slider_available =3D 1;
+=09=09=09break;
+=09=09}
+=09}
+
+=09closedir(dir);
+
+=09if (!entry) {
+=09=09lpmd_log_debug("\tCannot find %s\n", NAME_SOC_SLD);
+=09=09goto slider_failed;
+=09}
+
+=09lpmd_log_info("\tAvailable at %s/%s, use profile [%s]\n",
+=09=09      PATH_PLATFORM_PROFILE, entry->d_name, soc_sld_profile);
+
+=09return;
+
+slider_failed:
+=09lpmd_log_debug("\tIgnore soc_sld/sld_offset setting\n");
+=09slider_unavailable =3D 1;
+}
+
+static int update_balance_slider(int slider)
+{
+=09int ret;
+=09static int current_slider =3D -1;
+
+=09lpmd_log_debug("%s\n", __func__);
+
+=09if (slider < 0)
+=09=09return 0;
+
+=09if (slider_unavailable)
+=09=09return -1;
+
+=09if (!slider_available) {
+=09=09init_slider_path();
+=09=09if (slider_unavailable)
+=09=09=09return -1;
+=09}
+
+=09if (current_slider >=3D 0 && current_slider =3D=3D slider)
+=09=09return 0;
+
+=09ret =3D lpmd_write_int(PATH_SOC_BALANCE_SLIDER, slider, 1);
+=09if (ret)
+=09=09return ret;
+
+=09/* Read the current profile and rewrite to make the module params effec=
tive */
+=09ret =3D lpmd_read_str(soc_sld_path, soc_sld_profile, MAX_STR_LENGTH);
+=09if (ret)
+=09=09return ret;
+
+=09ret =3D lpmd_write_str(soc_sld_path, soc_sld_profile, 1);
+=09if (ret)
+=09=09return ret;
+
+=09current_slider =3D slider;
+
+=09return 0;
+}
+
+static int update_slider_offset(int offset)
+{
+=09int ret;
+=09static int current_slider_offset =3D -1;
+
+=09if (slider_unavailable)
+=09=09return -1;
+
+=09if (offset < 0)
+=09=09return 0;
+
+=09if (!slider_available) {
+=09=09init_slider_path();
+=09=09if (slider_unavailable)
+=09=09=09return -1;
+=09}
+
+=09if (current_slider_offset >=3D 0 && current_slider_offset =3D=3D offset=
)
+=09=09return 0;
+
+=09ret =3D lpmd_write_int(PATH_SOC_OFFSET, offset, 1);
+=09if (ret)
+=09=09return ret;
+
+=09/* Read the current profile and rewrite to make the module params effec=
tive */
+=09ret =3D lpmd_read_str(soc_sld_path, soc_sld_profile, MAX_STR_LENGTH);
+=09if (ret)
+=09=09return ret;
+
+=09ret =3D lpmd_write_str(soc_sld_path, soc_sld_profile, 1);
+=09if (ret)
+=09=09return ret;
+
+=09current_slider_offset =3D offset;
+
+=09return 0;
+}
+
+void process_balance_slider_default_update(struct lpmd_config_t *config)
+{
+=09lpmd_log_debug("%s\n", __func__);
+
+=09if (is_on_battery()) {
+=09=09if (config->balance_slider_def_dc >=3D 0)
+=09=09=09update_balance_slider(config->balance_slider_def_dc);
+=09} else {
+=09=09if (config->balance_slider_def_ac >=3D 0)
+=09=09=09update_balance_slider(config->balance_slider_def_ac);
+=09}
+}
+
+void process_slider_offset_default_update(struct lpmd_config_t *config)
+{
+=09lpmd_log_debug("%s\n", __func__);
+
+=09if (is_on_battery()) {
+=09=09if (config->slider_offset_def_dc >=3D 0)
+=09=09=09update_slider_offset(config->slider_offset_def_dc);
+=09} else {
+=09=09if (config->slider_offset_def_ac >=3D 0)
+=09=09=09update_slider_offset(config->slider_offset_def_ac);
+=09}
+}
+
+static int process_balance_slider(struct lpmd_config_state_t *state)
+{
+=09lpmd_log_debug("%s\n", __func__);
+
+=09if (is_on_battery())
+=09=09return update_balance_slider(state->balance_slider_dc);
+=09else
+=09=09return update_balance_slider(state->balance_slider_ac);
+}
+
+static int process_slider_offset(struct lpmd_config_state_t *state)
+{
+=09lpmd_log_debug("%s\n", __func__);
+
+=09if (is_on_battery())
+=09=09return update_slider_offset(state->slider_offset_dc);
+=09else
+=09=09return update_slider_offset(state->slider_offset_ac);
+}
+
+void process_slider(struct lpmd_config_t *config, struct lpmd_config_state=
_t *state)
+{
+=09int ret;
+
+=09ret =3D process_balance_slider(state);
+=09if (ret)
+=09=09process_balance_slider_default_update(config);
+
+=09ret =3D process_slider_offset(state);
+=09if (ret)
+=09=09process_slider_offset_default_update(config);
+}
+
+/* EPP/EPB Management */
+#define MAX_EPP_STRING_LENGTH=0932
+struct cpu_info {
+=09char epp_str[MAX_EPP_STRING_LENGTH];
+=09int epp;
+=09int epb;
+};
+
+static struct cpu_info *saved_cpu_info;
+
+static int get_epp(char *path, int *val, char *str, int size)
+{
+=09FILE *filep;
+=09int epp;
+=09int ret;
+
+=09filep =3D fopen(path, "r");
+=09if (!filep)
+=09=09return 1;
+
+=09ret =3D fscanf(filep, "%d", &epp);
+=09if (ret =3D=3D 1) {
+=09=09*val =3D epp;
+=09=09ret =3D 0;
+=09=09goto end;
+=09}
+
+=09ret =3D fread(str, 1, size, filep);
+=09if (ret <=3D 0) {
+=09=09ret =3D 1;
+=09} else {
+=09=09if (ret >=3D size)
+=09=09=09ret =3D size - 1;
+=09=09str[ret - 1] =3D '\0';
+=09=09ret =3D 0;
+=09}
+end:
+=09fclose(filep);
+=09return ret;
+}
+
+static int set_epp(char *path, int val, char *str)
+{
+=09FILE *filep;
+=09int ret;
+
+=09filep =3D fopen(path, "r+");
+=09if (!filep)
+=09=09return 1;
+
+=09if (val >=3D 0) {
+=09=09ret =3D fprintf(filep, "%d", val);
+=09} else if (str && str[0] !=3D '\0') {
+=09=09ret =3D fprintf(filep, "%s", str);
+=09} else {
+=09=09fclose(filep);
+=09=09return 1;
+=09}
+
+=09fclose(filep);
+
+=09if (ret <=3D 0) {
+=09=09if (val >=3D 0)
+=09=09=09lpmd_log_error("Write \"%d\" to %s failed, ret %d\n", val, path, =
ret);
+=09=09else
+=09=09=09lpmd_log_error("Write \"%s\" to %s failed, ret %d\n", str, path, =
ret);
+=09}
+=09return !(ret > 0);
+}
+
+static char *get_ppd_default_epp(void)
+{
+=09int ppd_mode =3D get_ppd_mode();
+
+=09if (ppd_mode =3D=3D PPD_INVALID)
+=09=09return NULL;
+
+=09if (ppd_mode =3D=3D PPD_PERFORMANCE)
+=09=09return "performance";
+
+=09if (ppd_mode =3D=3D PPD_POWERSAVER)
+=09=09return "power";
+
+=09if (is_on_battery())
+=09=09return "balance_power";
+
+=09return "balance_performance";
+}
+
+int get_epp_epb(int *epp, char *epp_str, int size, int *epb)
+{
+=09char path[MAX_STR_LENGTH];
+
+=09*epp =3D -1;
+=09epp_str[0] =3D '\0';
+=09/* CPU0 is always online */
+=09snprintf(path, sizeof(path),
+=09=09 "/sys/devices/system/cpu/cpu%d/cpufreq/energy_performance_preferenc=
e", 0);
+=09get_epp(path, epp, epp_str, size);
+=09epp_str[size - 1] =3D '\0';
+
+=09snprintf(path, MAX_STR_LENGTH, "/sys/devices/system/cpu/cpu%d/power/ene=
rgy_perf_bias", 0);
+=09lpmd_read_int(path, epb, -1);
+=09return 0;
+}
+
+int process_epp_epb(struct lpmd_config_state_t *state)
+{
+=09int max_cpus =3D get_max_cpus();
+=09char path[MAX_STR_LENGTH];
+=09int ret;
+=09int c;
+
+=09if (state->epp =3D=3D SETTING_IGNORE)
+=09=09lpmd_log_info("Ignore EPP\n");
+=09if (state->epb =3D=3D SETTING_IGNORE)
+=09=09lpmd_log_info("Ignore EPB\n");
+=09if (state->epp =3D=3D SETTING_IGNORE && state->epb =3D=3D SETTING_IGNOR=
E)
+=09=09return 0;
+
+=09for (c =3D 0; c < max_cpus; c++) {
+=09=09int val;
+=09=09char *str =3D NULL;
+
+=09=09if (!is_cpu_online(c))
+=09=09=09continue;
+
+=09=09if (state->epp !=3D SETTING_IGNORE) {
+=09=09=09if (state->epp =3D=3D SETTING_RESTORE) {
+=09=09=09=09val =3D -1;
+=09=09=09=09str =3D get_ppd_default_epp();
+=09=09=09=09if (!str) {
+=09=09=09=09=09/* Fallback to cached EPP */
+=09=09=09=09=09val =3D saved_cpu_info[c].epp;
+=09=09=09=09=09str =3D saved_cpu_info[c].epp_str;
+=09=09=09=09}
+=09=09=09} else {
+=09=09=09=09val =3D state->epp;
+=09=09=09}
+
+=09=09=09snprintf(path, sizeof(path),
+=09=09=09=09 "/sys/devices/system/cpu/cpu%d/cpufreq/energy_performance_pre=
ference", c);
+=09=09=09ret =3D set_epp(path, val, str);
+=09=09=09if (!ret) {
+=09=09=09=09if (val !=3D -1)
+=09=09=09=09=09lpmd_log_debug("Set CPU%d EPP to 0x%x\n",
+=09=09=09=09=09=09       c, val);
+=09=09=09=09else
+=09=09=09=09=09lpmd_log_debug("Set CPU%d EPP to %s\n",
+=09=09=09=09=09=09       c, saved_cpu_info[c].epp_str);
+=09=09=09}
+=09=09}
+
+=09=09if (state->epb !=3D SETTING_IGNORE) {
+=09=09=09if (state->epb =3D=3D SETTING_RESTORE)
+=09=09=09=09val =3D saved_cpu_info[c].epb;
+=09=09=09else
+=09=09=09=09val =3D state->epb;
+
+=09=09=09snprintf(path, MAX_STR_LENGTH,
+=09=09=09=09 "/sys/devices/system/cpu/cpu%d/power/energy_perf_bias", c);
+=09=09=09ret =3D lpmd_write_int(path, val, -1);
+=09=09=09if (!ret)
+=09=09=09=09lpmd_log_debug("Set CPU%d EPB to 0x%x\n", c, val);
+=09=09}
+=09}
+=09return 0;
+}
+
+int epp_epb_init(void)
+{
+=09int max_cpus =3D get_max_cpus();
+=09char path[MAX_STR_LENGTH];
+=09int ret;
+=09int c;
+
+=09saved_cpu_info =3D calloc(max_cpus, sizeof(struct cpu_info));
+
+=09for (c =3D 0; c < max_cpus; c++) {
+=09=09saved_cpu_info[c].epp_str[0] =3D '\0';
+=09=09saved_cpu_info[c].epp =3D -1;
+
+=09=09if (!is_cpu_online(c))
+=09=09=09continue;
+
+=09=09snprintf(path, sizeof(path),
+=09=09=09 "/sys/devices/system/cpu/cpu%d/cpufreq/energy_performance_prefer=
ence", c);
+=09=09ret =3D get_epp(path, &saved_cpu_info[c].epp,
+=09=09=09      saved_cpu_info[c].epp_str, MAX_EPP_STRING_LENGTH);
+=09=09if (!ret) {
+=09=09=09if (saved_cpu_info[c].epp !=3D -1)
+=09=09=09=09lpmd_log_debug("CPU%d EPP: 0x%x\n", c, saved_cpu_info[c].epp);
+=09=09=09else
+=09=09=09=09lpmd_log_debug("CPU%d EPP: %s\n", c, saved_cpu_info[c].epp_str=
);
+=09=09}
+
+=09=09snprintf(path, MAX_STR_LENGTH,
+=09=09=09 "/sys/devices/system/cpu/cpu%d/power/energy_perf_bias", c);
+=09=09ret =3D lpmd_read_int(path, &saved_cpu_info[c].epb, -1);
+=09=09if (ret) {
+=09=09=09saved_cpu_info[c].epb =3D -1;
+=09=09=09continue;
+=09=09}
+=09=09lpmd_log_debug("CPU%d EPB: 0x%x\n", c, saved_cpu_info[c].epb);
+=09}
+=09return 0;
+}
diff --git a/tools/power/x86/intel-lpmd/src/lpmd_proc.c b/tools/power/x86/i=
ntel-lpmd/src/lpmd_proc.c
new file mode 100644
index 000000000000..e34f631bc2e2
--- /dev/null
+++ b/tools/power/x86/intel-lpmd/src/lpmd_proc.c
@@ -0,0 +1,492 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include "lpmd.h"
+#include <upower.h>
+#include "wlt_proxy.h"
+
+static struct lpmd_config_t lpmd_config;
+
+struct lpmd_config_t *get_lpmd_config(void)
+{
+=09return &lpmd_config;
+}
+
+static UpClient *upower_client;
+
+static pthread_mutex_t lpmd_mutex;
+
+int lpmd_lock(void)
+{
+=09return pthread_mutex_lock(&lpmd_mutex);
+}
+
+int lpmd_unlock(void)
+{
+=09return pthread_mutex_unlock(&lpmd_mutex);
+}
+
+static int has_hfi_capability(void)
+{
+=09unsigned int eax =3D 0, ebx =3D 0, ecx =3D 0, edx =3D 0;
+
+=09cpuid(6, eax, ebx, ecx, edx);
+=09if (eax & (1 << 19)) {
+=09=09lpmd_log_info("HFI capability detected\n");
+=09=09return 1;
+=09}
+=09return 0;
+}
+
+/* Main functions */
+
+static int write_pipe_fd;
+
+static void lpmd_send_message(enum message_name_t msg_id, int size, unsign=
ed char *msg)
+{
+=09struct message_capsul_t msg_cap;
+=09int result;
+
+=09memset(&msg_cap, 0, sizeof(struct message_capsul_t));
+
+=09msg_cap.msg_id =3D msg_id;
+=09msg_cap.msg_size =3D (size > MAX_MSG_SIZE) ? MAX_MSG_SIZE : size;
+=09if (msg)
+=09=09memcpy(msg_cap.msg, msg, msg_cap.msg_size);
+
+=09result =3D write(write_pipe_fd, &msg_cap, sizeof(struct message_capsul_=
t));
+=09if (result < 0)
+=09=09lpmd_log_warn("Write to pipe failed\n");
+}
+
+void lpmd_terminate(void)
+{
+=09lpmd_send_message(TERMINATE, 0, NULL);
+=09sleep(1);
+=09if (upower_client)
+=09=09g_clear_object(&upower_client);
+}
+
+void lpmd_force_on(void)
+{
+=09lpmd_send_message(LPM_FORCE_ON, 0, NULL);
+}
+
+void lpmd_force_off(void)
+{
+=09lpmd_send_message(LPM_FORCE_OFF, 0, NULL);
+}
+
+void lpmd_set_auto(void)
+{
+=09lpmd_send_message(LPM_AUTO, 0, NULL);
+}
+
+#define LPMD_NUM_OF_POLL_FDS=095
+
+static pthread_t lpmd_core_main;
+static pthread_attr_t lpmd_attr;
+
+static struct pollfd poll_fds[LPMD_NUM_OF_POLL_FDS];
+static int poll_fd_cnt;
+
+static int idx_pipe_fd =3D -1;
+static int idx_uevent_fd =3D -1;
+static int idx_hfi_fd =3D -1;
+static int idx_wlt_fd =3D -1;
+
+#include <gio/gio.h>
+
+static GDBusProxy *power_profiles_daemon;
+
+static enum power_profile_daemon_mode ppd_mode =3D PPD_INVALID;
+
+int get_ppd_mode(void)
+{
+=09return ppd_mode;
+}
+
+static void power_profiles_changed_cb(void)
+{
+=09g_autoptr(GVariant)
+=09active_profile_v =3D NULL;
+
+=09active_profile_v =3D g_dbus_proxy_get_cached_property(power_profiles_da=
emon,
+=09=09=09=09=09=09=09    "ActiveProfile");
+
+=09if (active_profile_v && g_variant_is_of_type(active_profile_v, G_VARIAN=
T_TYPE_STRING)) {
+=09=09const char *active_profile =3D g_variant_get_string(active_profile_v=
, NULL);
+
+=09=09lpmd_log_debug("%s: %s\n", __func__, active_profile);
+
+=09=09if (strcmp(active_profile, "power-saver") =3D=3D 0) {
+=09=09=09ppd_mode =3D PPD_POWERSAVER;
+=09=09=09lpmd_send_message(lpmd_config.powersaver_def, 0, NULL);
+=09=09} else if (strcmp(active_profile, "performance") =3D=3D 0) {
+=09=09=09ppd_mode =3D PPD_PERFORMANCE;
+=09=09=09lpmd_send_message(lpmd_config.performance_def, 0, NULL);
+=09=09} else if (strcmp(active_profile, "balanced") =3D=3D 0) {
+=09=09=09ppd_mode =3D PPD_BALANCED;
+=09=09=09lpmd_send_message(lpmd_config.balanced_def, 0, NULL);
+=09=09} else {
+=09=09=09lpmd_log_warn("Ignore unsupported power profile: %s\n", active_pr=
ofile);
+=09=09}
+
+=09=09if (lpmd_config.wlt_proxy_enable)
+=09=09=09lpmd_config.data.polling_interval =3D DEF_POLLING_INTERVAL;
+=09}
+}
+
+static int connect_to_power_profile_daemon(void)
+{
+=09g_autoptr(GDBusConnection)
+=09bus =3D NULL;
+
+=09bus =3D g_bus_get_sync(G_BUS_TYPE_SYSTEM, NULL, NULL);
+=09if (bus) {
+=09=09power_profiles_daemon =3D
+=09=09=09g_dbus_proxy_new_sync(bus, G_DBUS_PROXY_FLAGS_DO_NOT_AUTO_START,
+=09=09=09=09=09      NULL, "net.hadess.PowerProfiles",
+=09=09=09=09=09      "/net/hadess/PowerProfiles",
+=09=09=09=09=09      "net.hadess.PowerProfiles", NULL, NULL);
+
+=09=09if (power_profiles_daemon) {
+=09=09=09g_signal_connect_swapped(power_profiles_daemon,
+=09=09=09=09=09=09 "g-properties-changed",
+=09=09=09=09=09=09 (GCallback)power_profiles_changed_cb,
+=09=09=09=09=09=09 NULL);
+=09=09=09power_profiles_changed_cb();
+=09=09=09return 0;
+=09=09}
+=09=09lpmd_log_info("Could not setup DBus watch for power-profiles-daemon"=
);
+=09}
+=09return 1;
+}
+
+static int battery_mode =3D -1;
+
+int is_on_battery(void)
+{
+=09if (battery_mode < 0)
+=09=09battery_mode =3D up_client_get_on_battery(upower_client);
+
+=09return battery_mode;
+}
+
+static void upower_daemon_cb(UpClient *client, GParamSpec *pspec, gpointer=
 user_data)
+{
+=09static int mode =3D -1;
+
+=09battery_mode =3D up_client_get_on_battery(upower_client);
+=09if (mode !=3D battery_mode) {
+=09=09process_balance_slider_default_update(&lpmd_config);
+=09=09process_slider_offset_default_update(&lpmd_config);
+=09}
+
+=09mode =3D battery_mode;
+}
+
+static void connect_to_upower_daemon(void)
+{
+=09GError *error =3D NULL;
+=09GPtrArray *devices;
+=09UpDevice *device;
+=09int i;
+
+=09upower_client =3D up_client_new_full(NULL, &error);
+=09if (!upower_client) {
+=09=09g_warning("Cannot connect to upowerd: %s", error->message);
+=09=09g_error_free(error);
+=09=09return;
+=09}
+
+=09lpmd_log_info("connected to upower daemon\n");
+=09g_signal_connect(upower_client, "notify", G_CALLBACK(upower_daemon_cb),=
 NULL);
+
+=09devices =3D up_client_get_devices2(upower_client);
+=09for (i =3D 0; i < devices->len; i++) {
+=09=09device =3D g_ptr_array_index(devices, i);
+=09=09g_signal_connect(device, "notify", G_CALLBACK(upower_daemon_cb), NUL=
L);
+=09}
+}
+
+/* Poll time out default */
+#define POLL_TIMEOUT_DEFAULT_SECONDS=091
+
+// called from LPMD main thread to process user and system messages
+static int proc_message(struct message_capsul_t *msg)
+{
+=09lpmd_log_debug("Received message %d\n", msg->msg_id);
+=09switch (msg->msg_id) {
+=09case TERMINATE:
+=09=09lpmd_log_msg("Terminating ...\n");
+=09=09update_lpmd_state(LPMD_TERMINATE);
+=09=09break;
+=09case LPM_FORCE_ON:
+=09=09// Always stay in LPM mode
+=09=09update_lpmd_state(LPMD_ON);
+=09=09break;
+=09case LPM_FORCE_OFF:
+=09=09// Never enter LPM mode
+=09=09update_lpmd_state(LPMD_OFF);
+=09=09break;
+=09case LPM_AUTO:
+=09=09// Enable oppotunistic LPM
+=09=09update_lpmd_state(LPMD_AUTO);
+=09=09break;
+=09default:
+=09=09break;
+=09}
+
+=09return 0;
+}
+
+static void dump_poll_results(int ret)
+{
+=09int i =3D 0;
+
+//=09if (!in_debug_mode())
+=09if (1)
+=09=09return;
+
+=09if (idx_pipe_fd !=3D -1) {
+=09=09lpmd_log_debug("poll_fds[%s]: event %d, revent %d\n", "  Pipe",
+=09=09=09       poll_fds[i].events, poll_fds[i].revents);
+=09=09i++;
+=09}
+
+=09if (idx_uevent_fd !=3D -1) {
+=09=09lpmd_log_debug("poll_fds[%s]: event %d, revent %d\n", "Uevent",
+=09=09=09       poll_fds[i].events, poll_fds[i].revents);
+=09=09i++;
+=09}
+
+=09if (idx_hfi_fd !=3D -1) {
+=09=09lpmd_log_debug("poll_fds[%s]: event %d, revent %d\n", "   HFI",
+=09=09=09       poll_fds[i].events, poll_fds[i].revents);
+=09=09i++;
+=09}
+
+=09if (idx_wlt_fd !=3D -1) {
+=09=09lpmd_log_debug("poll_fds[%s]: event %d, revent %d\n", "   WLT",
+=09=09=09       poll_fds[i].events, poll_fds[i].revents);
+=09=09i++;
+=09}
+}
+
+void update_reason(int reason)
+{
+=09lpmd_config.data.need_update |=3D 1 << reason;
+}
+
+// LPMD processing thread. This is callback to pthread lpmd_core_main
+static void *lpmd_core_main_loop(void *arg)
+{
+=09struct message_capsul_t msg;
+=09int wlt_hint, result, n;
+
+=09lpmd_config.data.polling_interval =3D DEF_POLLING_INTERVAL;
+
+=09for (;;) {
+=09=09if (get_lpmd_state() =3D=3D LPMD_TERMINATE)
+=09=09=09break;
+
+=09=09n =3D poll(poll_fds, poll_fd_cnt, lpmd_config.data.polling_interval)=
;
+=09=09if (n < 0) {
+=09=09=09lpmd_log_warn("Write to pipe failed\n");
+=09=09=09continue;
+=09=09}
+=09=09dump_poll_results(n);
+
+=09=09/* Polling time out, update polling data */
+=09=09if (n =3D=3D 0 && lpmd_config.data.polling_interval > 0) {
+=09=09=09update_reason(UPDATE_UTIL);
+=09=09=09util_update(&lpmd_config);
+
+=09=09=09if (lpmd_config.wlt_proxy_enable)
+=09=09=09=09lpmd_config.data.wlt_hint =3D
+=09=09=09=09=09read_wlt_proxy(&lpmd_config.data.polling_interval);
+=09=09}
+
+=09=09/* Check CPU hotplug. Maybe need to freeze lpmd */
+=09=09if (idx_uevent_fd >=3D 0 && (poll_fds[idx_uevent_fd].revents & POLLI=
N))
+=09=09=09check_cpu_hotplug();
+
+=09=09/* Update CPUMASK_HFI */
+=09=09if (idx_hfi_fd >=3D 0 && (poll_fds[idx_hfi_fd].revents & POLLIN))
+=09=09=09hfi_update();
+
+=09=09/* Update WLT hint */
+=09=09if (idx_wlt_fd >=3D 0 && (poll_fds[idx_wlt_fd].revents & POLLPRI)) {
+=09=09=09wlt_hint =3D wlt_update(poll_fds[idx_wlt_fd].fd);
+=09=09=09if (wlt_hint !=3D lpmd_config.data.wlt_hint) {
+=09=09=09=09lpmd_config.data.wlt_hint =3D wlt_hint;
+=09=09=09=09update_reason(UPDATE_WLT);
+=09=09=09}
+=09=09}
+
+=09=09/* Respond Dbus commands */
+=09=09if (idx_pipe_fd >=3D 0 && (poll_fds[idx_pipe_fd].revents & POLLIN)) =
{
+//=09=09=09 process message written on pipe here
+
+=09=09=09result =3D read(poll_fds[idx_pipe_fd].fd, &msg,
+=09=09=09=09      sizeof(struct message_capsul_t));
+=09=09=09if (result < 0) {
+=09=09=09=09lpmd_log_warn("read on wakeup fd failed\n");
+=09=09=09=09poll_fds[idx_pipe_fd].revents =3D 0;
+=09=09=09=09continue;
+=09=09=09}
+=09=09=09if (proc_message(&msg) < 0)
+=09=09=09=09lpmd_log_debug("Terminating thread..\n");
+=09=09=09update_reason(UPDATE_USER);
+=09=09}
+
+=09=09if (lpmd_config.data.need_update) {
+=09=09=09/* Enter next state after collecting all system statistics */
+=09=09=09lpmd_enter_next_state();
+=09=09=09lpmd_config.data.need_update =3D 0;
+=09=09}
+=09}
+
+=09if (lpmd_config.wlt_proxy_enable)
+=09=09wlt_proxy_uninit();
+=09hfi_kill();
+=09cgroup_cleanup();
+
+=09return NULL;
+}
+
+int lpmd_main(void)
+{
+=09int wake_fds[2];
+=09int ret;
+
+=09lpmd_log_debug("%s begin\n", __func__);
+
+=09ret =3D detect_supported_platform(&lpmd_config);
+=09if (ret)
+=09=09return ret;
+
+=09ret =3D detect_cpu_topo(&lpmd_config);
+=09if (ret)
+=09=09return ret;
+
+//=09 Call all lpmd related functions here
+=09ret =3D lpmd_get_config(&lpmd_config);
+=09if (ret)
+=09=09return ret;
+
+=09pthread_mutex_init(&lpmd_mutex, NULL);
+
+=09ret =3D detect_lpm_cpus(lpmd_config.lp_mode_cpus);
+=09if (ret)
+=09=09return ret;
+
+=09ret =3D cgroup_init(&lpmd_config);
+=09if (ret)
+=09=09return ret;
+
+=09itmt_init();
+
+=09ret =3D epp_epb_init();
+=09if (ret)
+=09=09return ret;
+
+=09if (!has_hfi_capability())
+=09=09lpmd_config.hfi_lpm_enable =3D 0;
+
+=09/* Must done after init_cpu() */
+=09lpmd_build_config_states(&lpmd_config);
+
+=09ret =3D irq_init();
+=09if (ret)
+=09=09return ret;
+
+=09connect_to_upower_daemon();
+//=09 Pipe is used for communication between two processes
+=09ret =3D pipe(wake_fds);
+=09if (ret) {
+=09=09lpmd_log_error("pipe creation failed %d:\n", ret);
+=09=09return LPMD_FATAL_ERROR;
+=09}
+=09if (fcntl(wake_fds[0], F_SETFL, O_NONBLOCK) < 0) {
+=09=09lpmd_log_error("Cannot set non-blocking on pipe: %s\n", strerror(err=
no));
+=09=09(void)close(wake_fds[0]);
+=09=09(void)close(wake_fds[1]);
+=09=09return LPMD_FATAL_ERROR;
+=09}
+=09if (fcntl(wake_fds[1], F_SETFL, O_NONBLOCK) < 0) {
+=09=09lpmd_log_error("Cannot set non-blocking on pipe: %s\n", strerror(err=
no));
+=09=09(void)close(wake_fds[0]);
+=09=09(void)close(wake_fds[1]);
+=09=09return LPMD_FATAL_ERROR;
+=09}
+=09write_pipe_fd =3D wake_fds[1];
+
+=09memset(poll_fds, 0, sizeof(poll_fds));
+
+=09idx_pipe_fd =3D poll_fd_cnt;
+=09poll_fds[idx_pipe_fd].fd =3D wake_fds[0];
+=09poll_fds[idx_pipe_fd].events =3D POLLIN;
+=09poll_fds[idx_pipe_fd].revents =3D 0;
+=09poll_fd_cnt++;
+
+=09poll_fds[poll_fd_cnt].fd =3D uevent_init();
+=09if (poll_fds[poll_fd_cnt].fd > 0) {
+=09=09idx_uevent_fd =3D poll_fd_cnt;
+=09=09poll_fds[idx_uevent_fd].events =3D POLLIN;
+=09=09poll_fds[idx_uevent_fd].revents =3D 0;
+=09=09poll_fd_cnt++;
+=09}
+
+=09if (lpmd_config.hfi_lpm_enable) {
+=09=09poll_fds[poll_fd_cnt].fd =3D hfi_init();
+=09=09if (poll_fds[poll_fd_cnt].fd > 0) {
+=09=09=09idx_hfi_fd =3D poll_fd_cnt;
+=09=09=09poll_fds[idx_hfi_fd].events =3D POLLIN;
+=09=09=09poll_fds[idx_hfi_fd].revents =3D 0;
+=09=09=09poll_fd_cnt++;
+=09=09}
+=09}
+
+=09if (lpmd_config.wlt_hint_enable &&
+=09    lpmd_config.wlt_proxy_enable &&
+=09    wlt_proxy_init() !=3D LPMD_SUCCESS) {
+=09=09lpmd_config.wlt_proxy_enable =3D 0;
+=09=09lpmd_log_error("Error setting up WLT Proxy. wlt_proxy_enable disable=
d\n");
+=09}
+
+=09if (lpmd_config.wlt_hint_enable && !lpmd_config.hfi_lpm_enable) {
+=09=09lpmd_config.util_enable =3D 0;
+=09=09if (!lpmd_config.wlt_proxy_enable) {
+=09=09=09poll_fds[poll_fd_cnt].fd =3D wlt_init();
+=09=09=09if (poll_fds[poll_fd_cnt].fd > 0) {
+=09=09=09=09idx_wlt_fd =3D poll_fd_cnt;
+=09=09=09=09poll_fds[idx_wlt_fd].events =3D POLLPRI;
+=09=09=09=09poll_fds[idx_wlt_fd].revents =3D 0;
+=09=09=09=09poll_fd_cnt++;
+=09=09=09}
+=09=09}
+=09}
+
+=09pthread_attr_init(&lpmd_attr);
+=09pthread_attr_setdetachstate(&lpmd_attr, PTHREAD_CREATE_DETACHED);
+
+=09/* Enable lpmd auto run when power profile daemon is not connected */
+=09if (connect_to_power_profile_daemon())
+=09=09lpmd_set_auto();
+
+=09process_balance_slider_default_update(&lpmd_config);
+=09process_slider_offset_default_update(&lpmd_config);
+
+=09/*
+=09 * lpmd_core_main_loop: is the thread where all LPMD actions take place=
.
+=09 * All other thread send message via pipe to trigger processing
+=09 */
+=09ret =3D pthread_create(&lpmd_core_main, &lpmd_attr, lpmd_core_main_loop=
, NULL);
+=09if (ret)
+=09=09return LPMD_FATAL_ERROR;
+
+=09lpmd_log_debug("lpmd_init succeeds\n");
+
+=09return LPMD_SUCCESS;
+}
diff --git a/tools/power/x86/intel-lpmd/src/lpmd_socket.c b/tools/power/x86=
/intel-lpmd/src/lpmd_socket.c
new file mode 100644
index 000000000000..eae0d1615d45
--- /dev/null
+++ b/tools/power/x86/intel-lpmd/src/lpmd_socket.c
@@ -0,0 +1,149 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright(c) 2023 Intel Corporation. All rights reserved. */
+
+#ifndef _GNU_SOURCE
+#define _GNU_SOURCE
+#endif
+
+#include <stdio.h>
+#include <err.h>
+#include <stdlib.h>
+#include <stdarg.h>
+#include <string.h>
+#include <unistd.h>
+#include <fcntl.h>
+#include <sys/file.h>
+#include <sys/types.h>
+#include <sys/time.h>
+#include <sys/stat.h>
+#include <sys/socket.h>
+#include <sys/un.h>
+#include <errno.h>
+#include <getopt.h>
+#include <sched.h>
+#include <dirent.h>
+#include <ctype.h>
+#include <signal.h>
+#include <pthread.h>
+
+#include <sys/un.h>
+#include <sys/socket.h>
+#include <malloc.h>
+#include <syslog.h>
+#include <signal.h>
+#include <time.h>
+#include <inttypes.h>
+
+#include "lpmd.h"
+
+/* socket helpers */
+int socket_init_connection(char *name)
+{
+=09struct sockaddr_un addr;
+=09static int socket_fd;
+
+=09if (!name)
+=09=09return 0;
+
+=09memset(&addr, 0, sizeof(struct sockaddr_un));
+=09socket_fd =3D socket(AF_LOCAL, SOCK_STREAM, 0);
+=09if (socket_fd < 0) {
+=09=09perror("Error opening socket");
+=09=09return 0;
+=09}
+=09addr.sun_family =3D AF_UNIX;
+
+=09snprintf(addr.sun_path, sizeof(addr.sun_path), "%s", name);
+
+=09if (connect(socket_fd, (struct sockaddr *)&addr, sizeof(addr)) < 0) {
+=09=09/* Try connect to abstract */
+=09=09memset(&addr, 0, sizeof(struct sockaddr_un));
+=09=09addr.sun_family =3D AF_UNIX;
+=09=09if (connect(socket_fd, (struct sockaddr *)&addr, sizeof(addr)) < 0) =
{
+=09=09=09close(socket_fd);
+=09=09=09return 0;
+=09=09}
+=09}
+
+=09return socket_fd;
+}
+
+static struct msghdr *create_credentials_msg(void)
+{
+=09struct ucred *credentials;
+=09struct msghdr *msg;
+=09struct cmsghdr *cmsg;
+
+=09credentials =3D malloc(sizeof(struct ucred));
+=09if (!credentials)
+=09=09return NULL;
+
+=09credentials->pid =3D getpid();
+=09credentials->uid =3D geteuid();
+=09credentials->gid =3D getegid();
+
+=09msg =3D malloc(sizeof(struct msghdr));
+=09if (!msg) {
+=09=09free(credentials);
+=09=09return msg;
+=09}
+
+=09memset(msg, 0, sizeof(struct msghdr));
+=09msg->msg_iovlen =3D 1;
+=09msg->msg_control =3D malloc(CMSG_SPACE(sizeof(struct ucred)));
+=09if (!msg->msg_control) {
+=09=09free(credentials);
+=09=09free(msg);
+=09=09return NULL;
+=09}
+
+=09msg->msg_controllen =3D CMSG_SPACE(sizeof(struct ucred));
+
+=09cmsg =3D CMSG_FIRSTHDR(msg);
+=09cmsg->cmsg_level =3D SOL_SOCKET;
+=09cmsg->cmsg_type =3D SCM_CREDENTIALS;
+=09cmsg->cmsg_len =3D CMSG_LEN(sizeof(struct ucred));
+=09memcpy(CMSG_DATA(cmsg), credentials, sizeof(struct ucred));
+
+=09free(credentials);
+=09return msg;
+}
+
+int socket_send_cmd(char *name, char *data)
+{
+=09int socket_fd;
+=09struct msghdr *msg;
+=09struct iovec iov;
+=09char buf[MAX_STR_LENGTH];
+=09int ret;
+
+=09if (!name || !data)
+=09=09return LPMD_ERROR;
+
+=09socket_fd =3D socket_init_connection(name);
+=09if (!socket_fd)
+=09=09return LPMD_ERROR;
+
+=09msg =3D create_credentials_msg();
+=09if (!msg)
+=09=09return LPMD_ERROR;
+
+=09iov.iov_base =3D (void *)data;
+=09iov.iov_len =3D strlen(data);
+=09msg->msg_iov =3D &iov;
+
+=09if (sendmsg(socket_fd, msg, 0) < 0) {
+=09=09free(msg->msg_control);
+=09=09free(msg);
+=09=09return LPMD_ERROR;
+=09}
+
+=09ret =3D read(socket_fd, buf, MAX_STR_LENGTH);
+=09if (ret < 0)
+=09=09lpmd_log_debug("read failed\n");
+
+=09close(socket_fd);
+=09free(msg->msg_control);
+=09free(msg);
+=09return LPMD_SUCCESS;
+}
diff --git a/tools/power/x86/intel-lpmd/src/lpmd_state_machine.c b/tools/po=
wer/x86/intel-lpmd/src/lpmd_state_machine.c
new file mode 100644
index 000000000000..b6fb31cad19d
--- /dev/null
+++ b/tools/power/x86/intel-lpmd/src/lpmd_state_machine.c
@@ -0,0 +1,747 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#define _GNU_SOURCE
+#include <stdio.h>
+#include <err.h>
+#include <stdlib.h>
+#include <stdarg.h>
+#include <string.h>
+#include <unistd.h>
+#include <fcntl.h>
+#include <sys/file.h>
+#include <sys/types.h>
+#include <sys/time.h>
+#include <sys/stat.h>
+#include <sys/un.h>
+#include <errno.h>
+#include <pthread.h>
+
+#include "lpmd.h"
+
+/* LPMD state control: ON/OFF/AUTO/FREEZE/RESTORE/TERMINATE */
+static int lpmd_state =3D LPMD_OFF;
+static int saved_lpmd_state =3D LPMD_OFF;
+
+static char *lpmd_state_name[] =3D {
+=09[LPMD_ON]=09=09=3D "     ON",
+=09[LPMD_OFF]=09=09=3D "    OFF",
+=09[LPMD_AUTO]=09=09=3D "   AUTO",
+=09[LPMD_FREEZE]=09=09=3D " FREEZE",
+=09[LPMD_RESTORE]=09=09=3D "RESTORE",
+=09[LPMD_TERMINATE]=09=3D "   TERM",
+};
+
+int update_lpmd_state(int new)
+{
+=09lpmd_lock();
+=09switch (new) {
+=09case LPMD_FREEZE:
+=09=09if (lpmd_state =3D=3D LPMD_FREEZE)
+=09=09=09break;
+=09=09lpmd_log_debug("Freeze lpmd\n");
+=09=09saved_lpmd_state =3D lpmd_state;
+=09=09lpmd_state =3D LPMD_FREEZE;
+=09=09break;
+=09case LPMD_RESTORE:
+=09=09if (lpmd_state !=3D LPMD_FREEZE)
+=09=09=09break;
+=09=09lpmd_log_debug("Restore lpmd\n");
+=09=09lpmd_state =3D saved_lpmd_state;
+=09=09saved_lpmd_state =3D lpmd_state;
+=09=09break;
+=09default:
+=09=09if (lpmd_state =3D=3D LPMD_FREEZE)
+=09=09=09saved_lpmd_state =3D new;
+=09=09else
+=09=09=09lpmd_state =3D new;
+=09=09break;
+=09}
+=09lpmd_unlock();
+=09return 0;
+}
+
+int get_lpmd_state(void)
+{
+=09return lpmd_state;
+}
+
+/* LPMD config states control */
+
+int lpmd_init_config_state(struct lpmd_config_state_t *state)
+{
+=09state->id =3D -1;
+=09state->valid =3D 0;
+=09state->name[0] =3D '\0';
+
+=09state->wlt_type =3D -1;
+
+=09state->entry_system_load_thres =3D 0;
+=09state->exit_system_load_thres =3D 0;
+=09state->exit_system_load_hyst =3D 0;
+=09state->enter_cpu_load_thres =3D 0;
+=09state->exit_cpu_load_thres =3D 0;
+=09state->enter_gfx_load_thres =3D 0;
+=09state->exit_gfx_load_thres =3D 0;
+
+=09state->min_poll_interval =3D 0;
+=09state->max_poll_interval =3D 0;
+=09state->poll_interval_increment =3D 0;
+
+=09state->epp =3D SETTING_IGNORE;
+=09state->epb =3D SETTING_IGNORE;
+=09state->active_cpus[0] =3D '\0';
+=09state->cpumask_idx =3D CPUMASK_NONE;
+
+=09state->island_0_number_p_cores =3D 0;
+=09state->island_0_number_e_cores =3D 0;
+=09state->island_1_number_p_cores =3D 0;
+=09state->island_1_number_e_cores =3D 0;
+=09state->island_2_number_p_cores =3D 0;
+=09state->island_2_number_e_cores =3D 0;
+
+=09state->itmt_state =3D SETTING_IGNORE;
+=09state->irq_migrate =3D SETTING_IGNORE;
+
+=09state->entry_load_sys =3D 0;
+=09state->entry_load_cpu =3D 0;
+=09state->cpumask_idx =3D CPUMASK_NONE;
+
+=09state->balance_slider_ac =3D -1;
+=09state->balance_slider_dc =3D -1;
+=09state->slider_offset_ac =3D -1;
+=09state->slider_offset_dc =3D -1;
+
+=09return 0;
+}
+
+static int current_idx =3D DEFAULT_OFF;
+
+static int config_state_match(struct lpmd_config_t *config, int idx)
+{
+=09struct lpmd_config_state_t *state =3D &config->config_states[idx];
+=09int bcpu =3D config->data.util_cpu;
+=09int bsys =3D config->data.util_sys;
+=09int bgfx =3D config->data.util_gfx;
+=09int wlt_index =3D config->data.wlt_hint;
+
+=09if (!state->valid)
+=09=09return 0;
+
+=09if (state->wlt_type !=3D -1) {
+=09=09if (config->wlt_hint_mask !=3D -1)
+=09=09=09wlt_index &=3D config->wlt_hint_mask;
+
+=09=09if (state->wlt_type !=3D wlt_index)
+=09=09=09return 0;
+=09}
+
+=09if (state->enter_cpu_load_thres && state->enter_cpu_load_thres < bcpu)
+=09=09return 0;
+
+=09if (state->enter_gfx_load_thres && state->enter_gfx_load_thres < bgfx)
+=09=09return 0;
+
+=09if (state->entry_system_load_thres && state->entry_system_load_thres < =
bsys) {
+=09=09if (!state->exit_system_load_hyst)
+=09=09=09return 0;
+=09=09if ((state->entry_load_sys + state->exit_system_load_hyst) < bsys ||
+=09=09    (state->entry_system_load_thres + state->exit_system_load_hyst) =
< bsys)
+=09=09=09return 0;
+=09}
+
+=09return 1;
+}
+
+static int polling_enabled;
+
+static int get_config_state_interval(struct lpmd_config_t *config, int idx=
)
+{
+=09struct lpmd_config_state_t *state =3D &config->config_states[idx];
+
+=09/* wlt proxy updates polling separately */
+=09if (config->wlt_proxy_enable)
+=09=09return 0;
+
+=09/* Start polling only when needed */
+=09if (!polling_enabled) {
+=09=09config->data.polling_interval =3D -1;
+=09=09return 0;
+=09}
+
+=09/* Always start with minimum polling interval for a new state */
+=09if (idx !=3D current_idx) {
+=09=09config->data.polling_interval =3D state->min_poll_interval;
+=09=09return 0;
+=09}
+
+=09/* CPU utilization based adaptive polling */
+=09if (state->poll_interval_increment =3D=3D -1) {
+=09=09config->data.polling_interval =3D
+=09=09=09state->max_poll_interval * (10000 - config->data.util_cpu) / 1000=
0;
+=09=09config->data.polling_interval /=3D 100;
+=09=09config->data.polling_interval *=3D 100;
+=09=09goto end;
+=09}
+
+=09/* lazy polling if load is sustained */
+=09if (state->poll_interval_increment > 0)
+=09=09config->data.polling_interval +=3D state->poll_interval_increment;
+
+end:
+=09/* Adjust based on min/max limitation */
+=09if (config->data.polling_interval < state->min_poll_interval)
+=09=09config->data.polling_interval =3D state->min_poll_interval;
+=09if (config->data.polling_interval > state->max_poll_interval)
+=09=09config->data.polling_interval =3D state->max_poll_interval;
+=09return 0;
+}
+
+static void dump_state(struct lpmd_config_state_t *state, char *str, int d=
ebug)
+{
+=09char buf[MAX_STR_LENGTH];
+=09int offset =3D 0;
+
+=09if (debug && !in_debug_mode())
+=09=09return;
+
+=09offset +=3D snprintf(buf + offset, MAX_STR_LENGTH - offset,
+=09=09=09   "[%6s] [%s] [%s]: ", str,
+=09=09=09   lpmd_state_name[lpmd_state], state->name);
+
+=09if (state->wlt_type)
+=09=09offset +=3D snprintf(buf + offset, MAX_STR_LENGTH - offset,
+=09=09=09=09   "WLT [%2d] ", state->wlt_type);
+
+=09if (state->entry_system_load_thres)
+=09=09offset +=3D snprintf(buf + offset, MAX_STR_LENGTH - offset,
+=09=09=09=09   "SYS [%6d] ",
+=09=09=09=09   state->entry_system_load_thres / 100);
+
+=09if (state->enter_cpu_load_thres)
+=09=09offset +=3D snprintf(buf + offset, MAX_STR_LENGTH - offset,
+=09=09=09=09   "CPU [%6d] ",
+=09=09=09=09   state->enter_cpu_load_thres / 100);
+
+=09if (state->enter_gfx_load_thres)
+=09=09offset +=3D snprintf(buf + offset, MAX_STR_LENGTH - offset,
+=09=09=09=09   "GFX [%6d] ",
+=09=09=09=09   state->enter_gfx_load_thres / 100);
+
+=09offset +=3D snprintf(buf + offset, MAX_STR_LENGTH - offset,
+=09=09=09   "CPUMASK [%d] ", state->cpumask_idx);
+=09offset +=3D snprintf(buf + offset, MAX_STR_LENGTH - offset,
+=09=09=09   "IRQ [%d] ", state->irq_migrate);
+=09offset +=3D snprintf(buf + offset, MAX_STR_LENGTH - offset,
+=09=09=09   "ITMT [%d] ", state->itmt_state);
+=09offset +=3D snprintf(buf + offset, MAX_STR_LENGTH - offset,
+=09=09=09   "EPB [%d] ", state->epb);
+=09offset +=3D snprintf(buf + offset, MAX_STR_LENGTH - offset,
+=09=09=09   "EPP [%d] ", state->epp);
+=09offset +=3D snprintf(buf + offset, MAX_STR_LENGTH - offset,
+=09=09=09   "SliderAC [%d] ", state->balance_slider_ac);
+=09offset +=3D snprintf(buf + offset, MAX_STR_LENGTH - offset,
+=09=09=09   "SliderDC [%d] ", state->balance_slider_ac);
+=09offset +=3D snprintf(buf + offset, MAX_STR_LENGTH - offset,
+=09=09=09   "OffsetAC [%d] ", state->slider_offset_ac);
+=09offset +=3D snprintf(buf + offset, MAX_STR_LENGTH - offset,
+=09=09=09   "OffsetDC [%d] ", state->slider_offset_dc);
+
+=09if (debug)
+=09=09lpmd_log_debug("%s\n", buf);
+=09else
+=09=09lpmd_log_info("%s\n", buf);
+}
+
+static int choose_next_state(struct lpmd_config_t *config)
+{
+=09int i;
+
+=09switch (lpmd_state) {
+=09case LPMD_ON:
+=09=09return DEFAULT_ON;
+=09case LPMD_OFF:
+=09case LPMD_TERMINATE:
+=09=09return DEFAULT_OFF;
+=09}
+
+=09/*
+=09 * DEFAULT_HFI is enabled only if HFI monitor is enabled
+=09 * and there is no user config states defined in the config file
+=09 */
+=09if (config->config_states[DEFAULT_HFI].valid)
+=09=09return DEFAULT_HFI;
+
+=09/* Choose a config state */
+=09for (i =3D CONFIG_STATE_BASE; i < CONFIG_STATE_BASE + config->config_st=
ate_count; ++i) {
+=09=09if (config_state_match(config, i)) {
+=09=09=09dump_state(&config->config_states[i], "Choose", 1);
+=09=09=09return i;
+=09=09}
+=09=09dump_state(&config->config_states[i], "Ignore", 1);
+=09}
+
+=09return STATE_NONE;
+}
+
+static int get_state_interval(struct lpmd_config_t *config, int idx)
+{
+=09switch (idx) {
+=09case DEFAULT_ON:
+=09case DEFAULT_OFF:
+=09case DEFAULT_HFI:
+=09=09config->data.polling_interval =3D -1;
+=09=09return 0;
+=09default:
+=09=09get_config_state_interval(config, idx);
+=09=09return 0;
+=09}
+}
+
+static int need_enter(struct lpmd_config_t *config, int idx)
+{
+=09if (idx !=3D current_idx)
+=09=09return 1;
+=09if (!config->config_states[idx].steady)
+=09=09return 1;
+
+=09return 0;
+}
+
+static int enter_state(struct lpmd_config_t *config, int idx)
+{
+=09struct lpmd_config_state_t *state =3D &config->config_states[idx];
+
+=09state->entry_load_sys =3D config->data.util_sys;
+=09state->entry_load_cpu =3D config->data.util_cpu;
+
+=09process_slider(config, state);
+
+=09process_itmt(state);
+
+=09process_epp_epb(state);
+
+=09process_irq(state);
+
+=09process_cgroup(state, config->mode);
+
+=09return 0;
+}
+
+static void dump_data(struct lpmd_config_t *config, int idx)
+{
+=09char buf[MAX_STR_LENGTH];
+=09char epp_str[32];
+=09int epp, epb;
+=09int offset =3D 0;
+=09struct lpmd_config_state_t *state =3D &config->config_states[idx];
+
+=09if (!in_debug_mode())
+=09=09return;
+
+=09offset +=3D snprintf(buf + offset, MAX_STR_LENGTH - offset,
+=09=09=09   "[  Data] [%s] [%s]: ", lpmd_state_name[lpmd_state],
+=09=09=09   state->name);
+
+=09if (config->wlt_hint_enable)
+=09=09offset +=3D snprintf(buf + offset, MAX_STR_LENGTH - offset,
+=09=09=09=09   "WLT [%2d] ", config->data.wlt_hint);
+
+=09if (config->util_sys_enable) {
+=09=09if (config->data.util_sys =3D=3D -1)
+=09=09=09offset +=3D snprintf(buf + offset,
+=09=09=09=09=09   MAX_STR_LENGTH - offset,
+=09=09=09=09=09   "SYS [   N/A] ");
+=09=09else
+=09=09=09offset +=3D snprintf(buf + offset,
+=09=09=09=09=09   MAX_STR_LENGTH - offset,
+=09=09=09=09=09   "SYS [%3d.%02d] ",
+=09=09=09=09=09   config->data.util_sys / 100,
+=09=09=09=09=09   config->data.util_sys % 100);
+=09}
+
+=09if (config->util_cpu_enable) {
+=09=09if (config->data.util_cpu =3D=3D -1)
+=09=09=09offset +=3D snprintf(buf + offset,
+=09=09=09=09=09   MAX_STR_LENGTH - offset,
+=09=09=09=09=09   "CPU [   N/A] ");
+=09=09else
+=09=09=09offset +=3D snprintf(buf + offset,
+=09=09=09=09=09   MAX_STR_LENGTH - offset,
+=09=09=09=09=09   "CPU [%3d.%02d] ",
+=09=09=09=09=09   config->data.util_cpu / 100,
+=09=09=09=09=09   config->data.util_cpu % 100);
+=09}
+
+=09if (config->util_gfx_enable) {
+=09=09if (config->data.util_gfx =3D=3D -1)
+=09=09=09offset +=3D snprintf(buf + offset,
+=09=09=09=09=09   MAX_STR_LENGTH - offset,
+=09=09=09=09=09   "GFX [   N/A] ");
+=09=09else
+=09=09=09offset +=3D snprintf(buf + offset,
+=09=09=09=09=09   MAX_STR_LENGTH - offset,
+=09=09=09=09=09   "GFX [%3d.%02d] ",
+=09=09=09=09=09   config->data.util_gfx / 100,
+=09=09=09=09=09   config->data.util_gfx % 100);
+=09}
+
+=09if (state->cpumask_idx !=3D CPUMASK_NONE)
+=09=09offset +=3D snprintf(buf + offset, MAX_STR_LENGTH - offset,
+=09=09=09=09   "CPUMASK [%s] ",
+=09=09=09=09   get_cpus_hexstr(state->cpumask_idx));
+=09else
+=09=09offset +=3D snprintf(buf + offset, MAX_STR_LENGTH - offset,
+=09=09=09=09   "CPUMASK [%s] ",
+=09=09=09=09   get_cpus_hexstr(CPUMASK_ONLINE));
+
+=09offset +=3D snprintf(buf + offset, MAX_STR_LENGTH - offset,
+=09=09=09=09   "ITMT [%d] ", get_itmt());
+
+=09get_epp_epb(&epp, epp_str, 32, &epb);
+=09if (epp =3D=3D -1)
+=09=09offset +=3D snprintf(buf + offset, MAX_STR_LENGTH - offset,
+=09=09=09=09   "EPB [%d] EPP[%s] ", epb, epp_str);
+=09else
+=09=09offset +=3D snprintf(buf + offset, MAX_STR_LENGTH - offset,
+=09=09=09=09   "EPB [%d] EPP[%d] ", epb, epp);
+
+=09if (config->hfi_lpm_enable)
+=09=09offset +=3D snprintf(buf + offset, MAX_STR_LENGTH - offset,
+=09=09=09=09   "UPDATE [%d] ", config->data.need_update);
+
+=09offset +=3D snprintf(buf + offset, MAX_STR_LENGTH - offset,
+=09=09=09   "Interval [%d]", config->data.polling_interval);
+
+=09lpmd_log_debug("%s\n", buf);
+}
+
+int lpmd_enter_next_state(void)
+{
+=09struct lpmd_config_t *config =3D get_lpmd_config();
+=09int idx =3D current_idx;
+
+=09lpmd_lock();
+
+=09if (lpmd_state =3D=3D LPMD_FREEZE) {
+=09=09/* Wait till RESTORE */
+=09=09config->data.polling_interval =3D -1;
+=09=09goto end;
+=09}
+
+=09idx =3D choose_next_state(config);
+
+=09/*
+=09 * After switching power profiles polling gets disabled and needs to be
+=09 * updated.
+=09 */
+=09if (config->data.polling_interval =3D=3D -1 && polling_enabled && idx !=
=3D DEFAULT_OFF)
+=09=09get_config_state_interval(config, idx);
+
+=09/* No action needed, keep previous idx and interval */
+=09if (idx =3D=3D STATE_NONE)
+=09=09goto end;
+
+=09get_state_interval(config, idx);
+
+=09if (need_enter(config, idx)) {
+=09=09enter_state(config, idx);
+=09=09current_idx =3D idx;
+=09=09dump_state(&config->config_states[idx], "Enter", 0);
+=09}
+
+end:
+=09dump_data(config, current_idx);
+=09lpmd_unlock();
+
+=09return 0;
+}
+
+static void dump_states(struct lpmd_config_t *lpmd_config)
+{
+=09int i;
+=09struct lpmd_config_state_t *state;
+
+=09if (!lpmd_config)
+=09=09return;
+
+=09lpmd_log_info("Mode:%d\n", lpmd_config->mode);
+=09lpmd_log_info("HFI LPM Enable:%d\n", lpmd_config->hfi_lpm_enable);
+=09lpmd_log_info("WLT Hint Enable:%d\n", lpmd_config->wlt_hint_enable);
+=09lpmd_log_info("WLT Proxy Enable:%d\n", lpmd_config->wlt_proxy_enable);
+=09lpmd_log_info("WLT Proxy Enable:%d\n", lpmd_config->wlt_hint_poll_enabl=
e);
+=09lpmd_log_info("WLT Hint mask:%d\n", lpmd_config->wlt_hint_mask);
+=09lpmd_log_info("Util Enable:%d\n", lpmd_config->util_enable);
+=09lpmd_log_info("Util entry threshold:%d\n", lpmd_config->util_entry_thre=
shold);
+=09lpmd_log_info("Util exit threshold:%d\n", lpmd_config->util_exit_thresh=
old);
+=09lpmd_log_info("Util LP Mode CPUs:%s\n", lpmd_config->lp_mode_cpus);
+=09lpmd_log_info("EPP in LP Mode:%d\n", lpmd_config->lp_mode_epp);
+=09lpmd_log_info("CPU Family:%d\n", lpmd_config->cpu_family);
+=09lpmd_log_info("CPU Model:%d\n", lpmd_config->cpu_model);
+=09lpmd_log_info("CPU Config:%s\n", lpmd_config->cpu_config);
+
+=09lpmd_log_info("balance_slider_def_ac:%d\n", lpmd_config->balance_slider=
_def_ac);
+=09lpmd_log_info("balance_slider_def_dc:%d\n", lpmd_config->balance_slider=
_def_dc);
+=09lpmd_log_info("slider_offset_def_ac:%d\n", lpmd_config->slider_offset_d=
ef_ac);
+=09lpmd_log_info("slider_offset_def_dc:%d\n", lpmd_config->slider_offset_d=
ef_dc);
+
+=09for (i =3D 0; i < MAX_STATES; ++i) {
+=09=09state =3D &lpmd_config->config_states[i];
+
+=09=09if (!state->valid)
+=09=09=09continue;
+=09=09lpmd_log_info("Index:%d\n", i);
+=09=09lpmd_log_info("\tID:%d\n", state->id);
+=09=09lpmd_log_info("\tName:%s\n", state->name);
+=09=09lpmd_log_info("\tentry_system_load_thres:%d\n", state->entry_system_=
load_thres);
+=09=09lpmd_log_info("\texit_system_load_thres:%d\n", state->exit_system_lo=
ad_thres);
+=09=09lpmd_log_info("\texit_system_load_hyst:%d\n", state->exit_system_loa=
d_hyst);
+=09=09lpmd_log_info("\tentry_cpu_load_thres:%d\n", state->enter_cpu_load_t=
hres);
+=09=09lpmd_log_info("\texit_cpu_load_thres:%d\n", state->exit_cpu_load_thr=
es);
+=09=09lpmd_log_info("\tentry_gfx_load_thres:%d\n", state->enter_gfx_load_t=
hres);
+=09=09lpmd_log_info("\texit_gfx_load_thres:%d\n", state->exit_gfx_load_thr=
es);
+=09=09lpmd_log_info("\tWLT Type:%d\n", state->wlt_type);
+=09=09lpmd_log_info("\tmin_poll_interval:%d\n", state->min_poll_interval);
+=09=09lpmd_log_info("\tmax_poll_interval:%d\n", state->max_poll_interval);
+=09=09lpmd_log_info("\tpoll_interval_increment:%d\n", state->poll_interval=
_increment);
+=09=09lpmd_log_info("\tEPP:%d\n", state->epp);
+=09=09lpmd_log_info("\tEPB:%d\n", state->epb);
+=09=09lpmd_log_info("\tITMTState:%d\n", state->itmt_state);
+=09=09lpmd_log_info("\tIRQMigrate:%d\n", state->irq_migrate);
+=09=09if (state->active_cpus[0] !=3D '\0')
+=09=09=09lpmd_log_info("\tactive_cpus:%s\n", state->active_cpus);
+=09=09lpmd_log_info("\tCPUMASK idx:%d\n", state->cpumask_idx);
+=09=09lpmd_log_info("\tisland_0_number_p_cores:%d\n", state->island_0_numb=
er_p_cores);
+=09=09lpmd_log_info("\tisland_0_number_e_cores:%d\n", state->island_0_numb=
er_e_cores);
+=09=09lpmd_log_info("\tisland_1_number_p_cores:%d\n", state->island_1_numb=
er_p_cores);
+=09=09lpmd_log_info("\tisland_1_number_e_cores:%d\n", state->island_1_numb=
er_e_cores);
+=09=09lpmd_log_info("\tisland_2_number_p_cores:%d\n", state->island_2_numb=
er_p_cores);
+=09=09lpmd_log_info("\tisland_2_number_e_cores:%d\n", state->island_2_numb=
er_e_cores);
+=09=09lpmd_log_info("\tBalancedSliderAC:%d\n", state->balance_slider_ac);
+=09=09lpmd_log_info("\tBalancedSliderDC:%d\n", state->balance_slider_dc);
+=09=09lpmd_log_info("\tSliderOffsetAC:%d\n", state->slider_offset_ac);
+=09=09lpmd_log_info("\tSliderOffsetDC:%d\n", state->slider_offset_dc);
+=09}
+}
+
+static int build_default_states(struct lpmd_config_t *config)
+{
+=09struct lpmd_config_state_t *state;
+
+=09state =3D &config->config_states[DEFAULT_OFF];
+=09lpmd_init_config_state(state);
+=09state->id =3D -1;
+=09snprintf(state->name, MAX_STATE_NAME, "DEFAULT_OFF");
+=09state->itmt_state =3D SETTING_RESTORE;
+=09state->irq_migrate =3D SETTING_RESTORE;
+=09state->epp =3D SETTING_RESTORE;
+=09state->epb =3D SETTING_RESTORE;
+=09state->cpumask_idx =3D CPUMASK_ONLINE;
+=09state->steady =3D 1;
+=09state->valid =3D 1;
+
+=09state =3D &config->config_states[DEFAULT_ON];
+=09lpmd_init_config_state(state);
+=09state->id =3D -1;
+=09snprintf(state->name, MAX_STATE_NAME, "DEFAULT_ON");
+=09state->itmt_state =3D config->ignore_itmt ? SETTING_IGNORE : 0;
+=09state->irq_migrate =3D 1;
+=09state->epp =3D config->lp_mode_epp;
+=09state->epb =3D SETTING_IGNORE;
+=09state->cpumask_idx =3D CPUMASK_LPM_DEFAULT;
+=09state->steady =3D 1;
+=09state->valid =3D 1;
+
+=09if (config->config_state_count)
+=09=09return 0;
+
+=09/*
+=09 * When HFI monitor is enabled and config states are not used,
+=09 * Switch system with different CPU affinity based on HFI hints
+=09 */
+=09if (config->hfi_lpm_enable) {
+=09=09state =3D &config->config_states[DEFAULT_HFI];
+=09=09lpmd_init_config_state(state);
+=09=09state->id =3D -1;
+=09=09snprintf(state->name, MAX_STATE_NAME, "DEFAULT_HFI");
+=09=09state->itmt_state =3D SETTING_IGNORE;
+=09=09state->irq_migrate =3D SETTING_IGNORE;
+=09=09state->epp =3D SETTING_IGNORE;
+=09=09state->epb =3D SETTING_IGNORE;
+=09=09state->cpumask_idx =3D CPUMASK_HFI;
+=09=09state->steady =3D 0;
+=09=09state->valid =3D 1;
+
+=09=09config->config_state_count =3D 1;
+=09=09return 0;
+=09}
+
+=09/*
+=09 * When HFI monitor is not enabled and config states are not used,
+=09 * Switch system following global setting based on utilization.
+=09 */
+=09state =3D &config->config_states[CONFIG_STATE_BASE];
+=09lpmd_init_config_state(state);
+=09state->id =3D 1;
+=09snprintf(state->name, MAX_STATE_NAME, "UTIL_POWER");
+=09state->entry_system_load_thres =3D config->util_entry_threshold;
+=09state->enter_cpu_load_thres =3D config->util_exit_threshold;
+=09state->itmt_state =3D config->ignore_itmt ? SETTING_IGNORE : 0;
+=09state->irq_migrate =3D 1;
+=09state->min_poll_interval =3D 100;
+=09state->max_poll_interval =3D 1000;
+=09state->poll_interval_increment =3D -1;
+=09state->epp =3D config->lp_mode_epp;
+=09state->epb =3D SETTING_IGNORE;
+=09state->cpumask_idx =3D CPUMASK_LPM_DEFAULT;
+=09state->steady =3D 1;
+=09state->valid =3D 1;
+
+=09state =3D &config->config_states[CONFIG_STATE_BASE + 1];
+=09lpmd_init_config_state(state);
+=09state->id =3D 2;
+=09snprintf(state->name, MAX_STATE_NAME, "UTIL_PERF");
+=09state->entry_system_load_thres =3D 100;
+=09state->enter_cpu_load_thres =3D 100;
+=09state->itmt_state =3D config->ignore_itmt ? SETTING_IGNORE : SETTING_RE=
STORE;
+=09state->irq_migrate =3D 1;
+=09state->min_poll_interval =3D 1000;
+=09state->max_poll_interval =3D 1000;
+=09state->epp =3D config->lp_mode_epp =3D=3D SETTING_IGNORE ? SETTING_IGNO=
RE : SETTING_RESTORE;
+=09state->epb =3D SETTING_IGNORE;
+=09state->cpumask_idx =3D CPUMASK_ONLINE;
+=09state->steady =3D 1;
+=09state->valid =3D 1;
+
+=09config->config_state_count =3D 2;
+=09return 0;
+}
+
+static int config_states_update_config(struct lpmd_config_t *config)
+{
+=09struct lpmd_config_state_t *state;
+=09int i;
+
+=09for (i =3D CONFIG_STATE_BASE; i < CONFIG_STATE_BASE + config->config_st=
ate_count; i++) {
+=09=09state =3D &config->config_states[i];
+
+=09=09if (!state->valid)
+=09=09=09continue;
+
+=09=09if (state->cpumask_idx =3D=3D CPUMASK_HFI)
+=09=09=09config->hfi_lpm_enable =3D 1;
+
+=09=09if (state->wlt_type !=3D -1)
+=09=09=09config->wlt_hint_enable =3D 1;
+
+=09=09if (state->entry_system_load_thres)
+=09=09=09config->util_sys_enable =3D 1;
+
+=09=09if (state->enter_cpu_load_thres)
+=09=09=09config->util_cpu_enable =3D 1;
+
+=09=09if (state->enter_gfx_load_thres)
+=09=09=09config->util_gfx_enable =3D 1;
+=09}
+=09return 0;
+}
+
+static int build_state_cpumask(struct lpmd_config_state_t *state)
+{
+=09state->steady =3D 1;
+
+=09if (state->cpumask_idx !=3D CPUMASK_NONE)
+=09=09return 0;
+
+=09if (state->active_cpus[0] =3D=3D '\0')
+=09=09return 0;
+
+=09if (!strncmp(state->active_cpus, "all", sizeof("all")) ||
+=09    !strncmp(state->active_cpus, "ALL", sizeof("ALL"))) {
+=09=09state->cpumask_idx =3D CPUMASK_ONLINE;
+=09=09return 0;
+=09}
+
+=09if (!strncmp(state->active_cpus, "lp", sizeof("lp")) ||
+=09    !strncmp(state->active_cpus, "LP", sizeof("LP"))) {
+=09=09state->cpumask_idx =3D CPUMASK_LPM_DEFAULT;
+=09=09return 0;
+=09}
+
+=09if (!strncmp(state->active_cpus, "hfi", sizeof("hfi")) ||
+=09    !strncmp(state->active_cpus, "HFI", sizeof("HFI"))) {
+=09=09state->cpumask_idx =3D CPUMASK_HFI;
+=09=09state->steady =3D 0;
+=09=09return 0;
+=09}
+
+=09state->cpumask_idx =3D cpumask_alloc();
+=09if (state->cpumask_idx =3D=3D CPUMASK_NONE) {
+=09=09lpmd_log_error("Cannot alloc CPUMASK\n");
+=09=09return -1;
+=09}
+
+=09if (cpumask_init_cpus(state->active_cpus, state->cpumask_idx) <=3D 0) {
+=09=09cpumask_free(state->cpumask_idx);
+=09=09lpmd_log_error("Cannot parse cpumask string: %s\n", state->active_cp=
us);
+=09=09return -1;
+=09}
+
+=09return 0;
+}
+
+#define DEFAULT_POLL_RATE_MS=091000
+
+int lpmd_build_config_states(struct lpmd_config_t *lpmd_config)
+{
+=09struct lpmd_config_state_t *state;
+=09int i;
+
+=09build_default_states(lpmd_config);
+
+=09for (i =3D CONFIG_STATE_BASE; i < CONFIG_STATE_BASE + lpmd_config->conf=
ig_state_count; i++) {
+=09=09state =3D &lpmd_config->config_states[i];
+
+=09=09if (build_state_cpumask(state))
+=09=09=09continue;
+
+=09=09if (state->entry_system_load_thres ||
+=09=09    state->enter_cpu_load_thres || state->enter_gfx_load_thres)
+=09=09=09polling_enabled =3D 1;
+
+=09=09if (state->min_poll_interval <=3D 0)
+=09=09=09state->min_poll_interval =3D state->max_poll_interval > DEFAULT_P=
OLL_RATE_MS ?
+=09=09=09=09=09=09   DEFAULT_POLL_RATE_MS : state->max_poll_interval;
+=09=09if (state->max_poll_interval <=3D 0)
+=09=09=09state->max_poll_interval =3D state->min_poll_interval > DEFAULT_P=
OLL_RATE_MS ?
+=09=09=09=09=09=09   state->min_poll_interval : DEFAULT_POLL_RATE_MS;
+=09=09if (state->poll_interval_increment <=3D 0)
+=09=09=09state->poll_interval_increment =3D -1;
+
+=09=09if (state->entry_system_load_thres < 0 || state->entry_system_load_t=
hres > 100)
+=09=09=09continue;
+=09=09else
+=09=09=09state->entry_system_load_thres *=3D 100;
+
+=09=09if (state->enter_cpu_load_thres < 0 || state->enter_cpu_load_thres >=
 100)
+=09=09=09continue;
+=09=09else
+=09=09=09state->enter_cpu_load_thres *=3D 100;
+
+=09=09if (state->exit_cpu_load_thres < 0 || state->exit_cpu_load_thres > 1=
00)
+=09=09=09continue;
+=09=09else
+=09=09=09state->exit_cpu_load_thres *=3D 100;
+
+=09=09if (state->enter_gfx_load_thres < 0 || state->enter_gfx_load_thres >=
 100)
+=09=09=09continue;
+=09=09else
+=09=09=09state->enter_gfx_load_thres *=3D 100;
+
+=09=09state->valid =3D 1;
+=09}
+
+=09config_states_update_config(lpmd_config);
+=09dump_states(lpmd_config);
+
+=09return 0;
+}
diff --git a/tools/power/x86/intel-lpmd/src/lpmd_uevent.c b/tools/power/x86=
/intel-lpmd/src/lpmd_uevent.c
new file mode 100644
index 000000000000..3fd34375922e
--- /dev/null
+++ b/tools/power/x86/intel-lpmd/src/lpmd_uevent.c
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright(c) 2025 Intel Corporation. All rights reserved. */
+
+#ifndef _GNU_SOURCE
+#define _GNU_SOURCE
+#endif
+
+#include <err.h>
+#include <netlink/genl/ctrl.h>
+
+#include "lpmd.h"
+
+static int uevent_fd =3D -1;
+
+static int has_cpu_uevent(void)
+{
+=09ssize_t i =3D 0;
+=09ssize_t len;
+=09const char *dev_path =3D "DEVPATH=3D";
+=09unsigned int dev_path_len =3D strlen(dev_path);
+=09const char *cpu_path =3D "/devices/system/cpu/cpu";
+=09char buffer[MAX_STR_LENGTH];
+
+=09len =3D recv(uevent_fd, buffer, sizeof(buffer) - 1, MSG_DONTWAIT);
+=09if (len <=3D 0)
+=09=09return 0;
+=09buffer[len] =3D '\0';
+
+=09lpmd_log_debug("Receive uevent: %s\n", buffer);
+
+=09while (i < len) {
+=09=09if (strlen(buffer + i) > dev_path_len &&
+=09=09    !strncmp(buffer + i, dev_path, dev_path_len)) {
+=09=09=09if (!strncmp(buffer + i + dev_path_len, cpu_path,
+=09=09=09=09     strlen(cpu_path))) {
+=09=09=09=09lpmd_log_debug("\tMatches: %s\n",
+=09=09=09=09=09       buffer + i + dev_path_len);
+=09=09=09=09return 1;
+=09=09=09}
+=09=09}
+=09=09i +=3D strlen(buffer + i) + 1;
+=09}
+
+=09return 0;
+}
+
+#define PATH_PROC_STAT "/proc/stat"
+
+int check_cpu_hotplug(void)
+{
+=09FILE *filep;
+=09int curr;
+=09int ret;
+
+=09if (!has_cpu_uevent())
+=09=09return 0;
+
+=09filep =3D fopen(PATH_PROC_STAT, "r");
+=09if (!filep)
+=09=09return 0;
+
+=09curr =3D cpumask_alloc();
+=09if (curr =3D=3D CPUMASK_NONE)
+=09=09err(3, "ALLOC_CPUMASK");
+
+=09while (!feof(filep)) {
+=09=09char *tmpline =3D NULL;
+=09=09size_t size =3D 0;
+=09=09char *line;
+=09=09int cpu;
+=09=09char *p;
+=09=09int ret;
+
+=09=09tmpline =3D NULL;
+=09=09size =3D 0;
+
+=09=09if (getline(&tmpline, &size, filep) <=3D 0) {
+=09=09=09free(tmpline);
+=09=09=09break;
+=09=09}
+
+=09=09line =3D strdup(tmpline);
+
+=09=09p =3D strtok(line, " ");
+
+=09=09ret =3D sscanf(p, "cpu%d", &cpu);
+=09=09if (ret !=3D 1)
+=09=09=09goto free;
+
+=09=09cpumask_add_cpu(cpu, curr);
+
+free:
+=09=09free(tmpline);
+=09=09free(line);
+=09}
+
+=09fclose(filep);
+
+=09ret =3D cpumask_equal(curr, CPUMASK_ONLINE);
+=09cpumask_free(curr);
+
+=09update_reason(UPDATE_CPUHOTPLUG);
+
+=09if (ret)
+=09=09return update_lpmd_state(LPMD_RESTORE);
+
+=09return update_lpmd_state(LPMD_FREEZE);
+}
+
+int uevent_init(void)
+{
+=09struct sockaddr_nl nls;
+
+=09memset(&nls, 0, sizeof(struct sockaddr_nl));
+
+=09nls.nl_family =3D AF_NETLINK;
+=09nls.nl_pid =3D getpid();
+=09nls.nl_groups =3D -1;
+
+=09uevent_fd =3D socket(PF_NETLINK, SOCK_DGRAM, NETLINK_KOBJECT_UEVENT);
+=09if (uevent_fd < 0)
+=09=09return uevent_fd;
+
+=09if (bind(uevent_fd, (struct sockaddr *)&nls,
+=09=09 sizeof(struct sockaddr_nl))) {
+=09=09lpmd_log_warn("kob_uevent bind failed\n");
+=09=09close(uevent_fd);
+=09=09return -1;
+=09}
+
+=09lpmd_log_debug("Uevent binded\n");
+=09return uevent_fd;
+}
diff --git a/tools/power/x86/intel-lpmd/src/lpmd_util.c b/tools/power/x86/i=
ntel-lpmd/src/lpmd_util.c
new file mode 100644
index 000000000000..292190a580e8
--- /dev/null
+++ b/tools/power/x86/intel-lpmd/src/lpmd_util.c
@@ -0,0 +1,369 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright(c) 2022 Intel Corporation. All rights reserved. */
+
+#define _GNU_SOURCE
+#include <stdio.h>
+#include <err.h>
+#include <stdlib.h>
+#include <stdarg.h>
+#include <string.h>
+#include <unistd.h>
+#include <fcntl.h>
+#include <sys/file.h>
+#include <sys/types.h>
+#include <sys/time.h>
+#include <sys/stat.h>
+#include <sys/un.h>
+#include <errno.h>
+#include <pthread.h>
+
+#include "lpmd.h"
+
+#define PATH_PROC_STAT "/proc/stat"
+
+enum type_stat {
+=09STAT_CPU,
+=09STAT_USER,
+=09STAT_NICE,
+=09STAT_SYSTEM,
+=09STAT_IDLE,
+=09STAT_IOWAIT,
+=09STAT_IRQ,
+=09STAT_SOFTIRQ,
+=09STAT_STEAL,
+=09STAT_GUEST,
+=09STAT_GUEST_NICE,
+=09STAT_MAX,
+};
+
+struct proc_stat_info {
+=09int cpu;
+=09int valid;
+=09unsigned long long stat[STAT_MAX];
+};
+
+struct proc_stat_info *proc_stat_prev;
+struct proc_stat_info *proc_stat_cur;
+
+static int busy_sys =3D -1;
+static int busy_cpu =3D -1;
+static int busy_gfx =3D -1;
+
+char *path_gfx_rc6;
+char *path_sam_mc6;
+
+static int probe_gfx_util_sysfs(void)
+{
+=09FILE *fp;
+=09char buf[8];
+=09int ret;
+
+=09if (access("/sys/class/drm/card0/device/tile0/gt0/gtidle/idle_residency=
_ms", R_OK))
+=09=09return 1;
+
+=09fp =3D fopen("/sys/class/drm/card0/device/tile0/gt0/gtidle/name", "r");
+=09if (!fp)
+=09=09return 1;
+
+=09ret =3D fread(buf, sizeof(char), 7, fp);
+=09if (!ret) {
+=09=09fclose(fp);
+=09=09return 1;
+=09}
+
+=09fclose(fp);
+
+=09if (ret >=3D strlen("gt0-rc") && !strncmp(buf, "gt0-rc", strlen("gt0-rc=
"))) {
+=09=09if (!access("/sys/class/drm/card0/device/tile0/gt0/gtidle/idle_resid=
ency_ms", R_OK))
+=09=09=09path_gfx_rc6 =3D "/sys/class/drm/card0/device/tile0/gt0/gtidle/id=
le_residency_ms";
+=09=09if (!access("/sys/class/drm/card0/device/tile0/gt1/gtidle/idle_resid=
ency_ms", R_OK))
+=09=09=09path_sam_mc6 =3D "/sys/class/drm/card0/device/tile0/gt1/gtidle/id=
le_residency_ms";
+=09} else if (ret >=3D strlen("gt0-mc") && !strncmp(buf, "gt0-mc", strlen(=
"gt0-mc"))) {
+=09=09if (!access("/sys/class/drm/card0/device/tile0/gt1/gtidle/idle_resid=
ency_ms", R_OK))
+=09=09=09path_gfx_rc6 =3D "/sys/class/drm/card0/device/tile0/gt1/gtidle/id=
le_residency_ms";
+=09=09if (!access("/sys/class/drm/card0/device/tile0/gt0/gtidle/idle_resid=
ency_ms", R_OK))
+=09=09=09path_sam_mc6 =3D "/sys/class/drm/card0/device/tile0/gt0/gtidle/id=
le_residency_ms";
+=09}
+=09lpmd_log_debug("Use %s for gfx rc6\n", path_gfx_rc6);
+=09lpmd_log_debug("Use %s for sam mc6\n", path_sam_mc6);
+=09return 0;
+}
+
+static int get_gfx_util_sysfs(unsigned long long time_ms)
+{
+=09static unsigned long long gfx_rc6_prev =3D ULLONG_MAX, sam_mc6_prev =3D=
 ULLONG_MAX;
+=09unsigned long long gfx_rc6 =3D ULLONG_MAX, sam_mc6 =3D ULLONG_MAX;
+=09FILE *fp;
+=09unsigned long long gfx_util, sam_util;
+=09int ret;
+
+=09gfx_util =3D -1;
+=09sam_util =3D -1;
+
+=09fp =3D fopen(path_gfx_rc6, "r");
+=09if (fp) {
+=09=09ret =3D fscanf(fp, "%lld", &gfx_rc6);
+=09=09if (ret !=3D 1)
+=09=09=09gfx_rc6 =3D ULLONG_MAX;
+=09=09fclose(fp);
+=09}
+
+=09fp =3D fopen(path_sam_mc6, "r");
+=09if (fp) {
+=09=09ret =3D fscanf(fp, "%lld", &sam_mc6);
+=09=09if (ret !=3D 1)
+=09=09=09sam_mc6 =3D ULLONG_MAX;
+=09=09fclose(fp);
+=09}
+
+=09if (gfx_rc6 =3D=3D ULLONG_MAX && sam_mc6 =3D=3D ULLONG_MAX)
+=09=09return -1;
+
+=09if (gfx_rc6 !=3D ULLONG_MAX) {
+=09=09if (gfx_rc6_prev !=3D ULLONG_MAX)
+=09=09=09gfx_util =3D 10000 - (gfx_rc6 - gfx_rc6_prev) * 10000 / time_ms;
+=09=09gfx_rc6_prev =3D gfx_rc6;
+=09}
+
+=09if (sam_mc6 !=3D ULLONG_MAX) {
+=09=09if (sam_mc6_prev !=3D ULLONG_MAX)
+=09=09=09sam_util =3D 10000 - (sam_mc6 - sam_mc6_prev) * 10000 / time_ms;
+=09=09sam_mc6_prev =3D sam_mc6;
+=09}
+
+=09return gfx_util > sam_util ? gfx_util : sam_util;
+}
+
+/* Get GFX_RC6 and SAM_MC6 from sysfs and calculate gfx util based on this=
 */
+static int parse_gfx_util_sysfs(void)
+{
+=09static int gfx_sysfs_available =3D 1;
+=09static struct timespec ts_prev;
+=09struct timespec ts_cur;
+=09unsigned long time_ms;
+=09int ret;
+
+=09busy_gfx =3D -1;
+
+=09if (!gfx_sysfs_available)
+=09=09return 1;
+
+=09clock_gettime(CLOCK_MONOTONIC, &ts_cur);
+
+=09if (!ts_prev.tv_sec && !ts_prev.tv_nsec) {
+=09=09ret =3D probe_gfx_util_sysfs();
+=09=09if (ret) {
+=09=09=09gfx_sysfs_available =3D 0;
+=09=09=09return 1;
+=09=09}
+=09=09ts_prev =3D ts_cur;
+=09=09return 0;
+=09}
+
+=09time_ms =3D (ts_cur.tv_sec - ts_prev.tv_sec) * 1000 +
+=09=09   (ts_cur.tv_nsec - ts_prev.tv_nsec) / 1000000;
+
+=09ts_prev =3D ts_cur;
+=09busy_gfx =3D get_gfx_util_sysfs(time_ms);
+
+=09return 0;
+}
+
+#define MSR_TSC=09=09=090x10
+#define MSR_PKG_ANY_GFXE_C0_RES=090x65A
+static int parse_gfx_util_msr(void)
+{
+=09static uint64_t val_prev, tsc_prev;
+=09uint64_t _busy_gfx, val, tsc;
+=09int cpu;
+
+=09busy_gfx =3D -1;
+
+=09cpu =3D sched_getcpu();
+=09tsc =3D read_msr(cpu, MSR_TSC);
+=09if (tsc =3D=3D UINT64_MAX)
+=09=09goto err;
+
+=09val =3D read_msr(cpu, MSR_PKG_ANY_GFXE_C0_RES);
+=09if (val =3D=3D UINT64_MAX)
+=09=09goto err;
+
+=09if (!tsc_prev || !val_prev) {
+=09=09tsc_prev =3D tsc;
+=09=09val_prev =3D val;
+=09=09return 0;
+=09}
+
+=09if (val > val_prev && tsc > tsc_prev) {
+=09=09_busy_gfx =3D abs(val - val_prev) * 10000ULL / abs(tsc - tsc_prev);
+=09=09if (_busy_gfx < INT_MAX)
+=09=09=09busy_gfx =3D (int)_busy_gfx;
+=09}
+
+=09tsc_prev =3D tsc;
+=09val_prev =3D val;
+=09return 0;
+err:
+=09lpmd_log_debug("%s failed\n", __func__);
+=09return 1;
+}
+
+static int parse_gfx_util(void)
+{
+=09int ret;
+
+=09/* Prefer to get graphics utilization from GFX/SAM RC6 sysfs */
+=09ret =3D parse_gfx_util_sysfs();
+=09if (!ret)
+=09=09return 0;
+
+=09/* Fallback to MSR */
+=09return parse_gfx_util_msr();
+}
+
+static int calculate_busypct(struct proc_stat_info *cur, struct proc_stat_=
info *prev)
+{
+=09int idx;
+=09unsigned long long busy =3D 0, total =3D 0;
+
+=09for (idx =3D STAT_USER; idx < STAT_MAX; idx++) {
+=09=09total +=3D (cur->stat[idx] - prev->stat[idx]);
+//=09=09 Align with the "top" utility logic
+=09=09if (idx !=3D STAT_IDLE && idx !=3D STAT_IOWAIT)
+=09=09=09busy +=3D (cur->stat[idx] - prev->stat[idx]);
+=09}
+
+=09if (total)
+=09=09return busy * 10000 / total;
+=09else
+=09=09return 0;
+}
+
+static int parse_proc_stat(void)
+{
+=09FILE *filep;
+=09int i;
+=09int val;
+=09int count =3D get_max_online_cpu() + 1;
+=09int sys_idx =3D count - 1;
+=09size_t size =3D sizeof(struct proc_stat_info) * count;
+
+=09filep =3D fopen(PATH_PROC_STAT, "r");
+=09if (!filep)
+=09=09return 1;
+
+=09if (!proc_stat_prev)
+=09=09proc_stat_prev =3D calloc(count, sizeof(struct proc_stat_info));
+
+=09if (!proc_stat_prev) {
+=09=09fclose(filep);
+=09=09return 1;
+=09}
+
+=09if (!proc_stat_cur)
+=09=09proc_stat_cur =3D calloc(count, sizeof(struct proc_stat_info));
+
+=09if (!proc_stat_cur) {
+=09=09free(proc_stat_prev);
+=09=09fclose(filep);
+=09=09proc_stat_prev =3D NULL;
+=09=09return 1;
+=09}
+
+=09memcpy(proc_stat_prev, proc_stat_cur, size);
+=09memset(proc_stat_cur, 0, size);
+
+=09while (!feof(filep)) {
+=09=09int idx;
+=09=09char *tmpline =3D NULL;
+=09=09struct proc_stat_info *info;
+=09=09char *line;
+=09=09int cpu;
+=09=09char *p;
+=09=09int ret;
+
+=09=09tmpline =3D NULL;
+=09=09size =3D 0;
+
+=09=09if (getline(&tmpline, &size, filep) <=3D 0) {
+=09=09=09free(tmpline);
+=09=09=09break;
+=09=09}
+
+=09=09line =3D strdup(tmpline);
+
+=09=09p =3D strtok(line, " ");
+
+=09=09if (strncmp(p, "cpu", 3)) {
+=09=09=09free(tmpline);
+=09=09=09free(line);
+=09=09=09continue;
+=09=09}
+
+=09=09ret =3D sscanf(p, "cpu%d", &cpu);
+=09=09if (ret =3D=3D -1 && !(strncmp(p, "cpu", 3))) {
+=09=09=09/* Read system line */
+=09=09=09info =3D &proc_stat_cur[sys_idx];
+=09=09} else if (ret =3D=3D 1) {
+=09=09=09info =3D &proc_stat_cur[cpu];
+=09=09} else {
+=09=09=09free(tmpline);
+=09=09=09free(line);
+=09=09=09continue;
+=09=09}
+
+=09=09info->valid =3D 1;
+=09=09idx =3D STAT_CPU;
+
+=09=09while (p) {
+=09=09=09if (idx >=3D STAT_MAX)
+=09=09=09=09break;
+
+=09=09=09if (idx =3D=3D STAT_CPU) {
+=09=09=09=09idx++;
+=09=09=09=09p =3D strtok(NULL, " ");
+=09=09=09=09continue;
+=09=09=09}
+
+=09=09=09if (sscanf(p, "%llu", &info->stat[idx]) <=3D 0)
+=09=09=09=09lpmd_log_debug("Failed to parse /proc/stat, defer update in ne=
xt snapshot.");
+
+=09=09=09p =3D strtok(NULL, " ");
+=09=09=09idx++;
+=09=09}
+
+=09=09free(tmpline);
+=09=09free(line);
+=09}
+
+=09fclose(filep);
+=09busy_sys =3D calculate_busypct(&proc_stat_cur[sys_idx], &proc_stat_prev=
[sys_idx]);
+
+=09busy_cpu =3D 0;
+=09for (i =3D 1; i <=3D get_max_online_cpu(); i++) {
+=09=09if (!proc_stat_cur[i].valid)
+=09=09=09continue;
+
+=09=09val =3D calculate_busypct(&proc_stat_cur[i], &proc_stat_prev[i]);
+=09=09if (busy_cpu < val)
+=09=09=09busy_cpu =3D val;
+=09}
+
+=09return 0;
+}
+
+int util_update(struct lpmd_config_t *lpmd_config)
+{
+=09if (lpmd_config->util_sys_enable || lpmd_config->util_cpu_enable) {
+=09=09parse_proc_stat();
+=09=09lpmd_config->data.util_sys =3D busy_sys;
+=09=09lpmd_config->data.util_cpu =3D busy_cpu;
+=09}
+
+=09if (lpmd_config->util_gfx_enable) {
+=09=09parse_gfx_util();
+=09=09lpmd_config->data.util_gfx =3D busy_gfx;
+=09}
+
+=09return 0;
+}
diff --git a/tools/power/x86/intel-lpmd/src/lpmd_wlt.c b/tools/power/x86/in=
tel-lpmd/src/lpmd_wlt.c
new file mode 100644
index 000000000000..98a2ab9bf1d5
--- /dev/null
+++ b/tools/power/x86/intel-lpmd/src/lpmd_wlt.c
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright(c) 2025 Intel Corporation. All rights reserved. */
+
+#ifndef _GNU_SOURCE
+#define _GNU_SOURCE
+#endif
+
+#include "lpmd.h"
+
+// Workload type classification
+#define WORKLOAD_NOTIFICATION_DELAY_ATTRIBUTE "/sys/bus/pci/devices/0000:0=
0:04.0/workload_hint/notification_delay_ms"
+#define WORKLOAD_ENABLE_ATTRIBUTE "/sys/bus/pci/devices/0000:00:04.0/workl=
oad_hint/workload_hint_enable"
+#define WORKLOAD_TYPE_INDEX_ATTRIBUTE  "/sys/bus/pci/devices/0000:00:04.0/=
workload_hint/workload_type_index"
+
+#define NOTIFICATION_DELAY=09100
+
+// Read current Workload type
+int wlt_update(int fd)
+{
+=09char index_str[4];
+=09int index, ret;
+
+=09if (fd < 0)
+=09=09return WLT_INVALID;
+
+=09if ((lseek(fd, 0L, SEEK_SET)) < 0)
+=09=09return WLT_INVALID;
+
+=09ret =3D read(fd, index_str, sizeof(index_str));
+=09if (ret <=3D 0)
+=09=09return WLT_INVALID;
+
+=09ret =3D sscanf(index_str, "%d", &index);
+=09if (ret < 0)
+=09=09return WLT_INVALID;
+
+=09lpmd_log_debug("wlt: %d\n", index);
+
+=09return index;
+}
+
+// Clear workload type notifications
+int wlt_exit(void)
+{
+=09int fd;
+
+=09/* Disable feature via sysfs knob */
+=09fd =3D open(WORKLOAD_ENABLE_ATTRIBUTE, O_RDWR);
+=09if (fd < 0)
+=09=09return 0;
+
+=09// Disable WLT notification
+=09if (write(fd, "0\n", 2) < 0) {
+=09=09close(fd);
+=09=09return 0;
+=09}
+
+=09close(fd);
+
+=09return 0;
+}
+
+// Initialize Workload type notifications
+int wlt_init(void)
+{
+=09char delay_str[64];
+=09int fd;
+
+=09lpmd_log_debug("init_wlt begin\n");
+
+=09// Set notification delay
+=09fd =3D open(WORKLOAD_NOTIFICATION_DELAY_ATTRIBUTE, O_RDWR);
+=09if (fd < 0)
+=09=09return fd;
+
+=09sprintf(delay_str, "%d\n", NOTIFICATION_DELAY);
+
+=09if (write(fd, delay_str, strlen(delay_str)) < 0) {
+=09=09close(fd);
+=09=09return -1;
+=09}
+
+=09close(fd);
+
+=09// Enable WLT notification
+=09fd =3D open(WORKLOAD_ENABLE_ATTRIBUTE, O_RDWR);
+=09if (fd < 0)
+=09=09return fd;
+
+=09if (write(fd, "1\n", 2) < 0) {
+=09=09close(fd);
+=09=09return -1;
+=09}
+
+=09close(fd);
+
+=09// Open FD for workload type attribute
+=09fd =3D open(WORKLOAD_TYPE_INDEX_ATTRIBUTE, O_RDONLY);
+=09if (fd < 0) {
+=09=09wlt_exit();
+=09=09return fd;
+=09}
+
+=09lpmd_log_debug("init_wlt end wlt fd:%d\n", fd);
+
+=09return fd;
+}
diff --git a/tools/power/x86/intel-lpmd/src/wlt_proxy/include/state_common.=
h b/tools/power/x86/intel-lpmd/src/wlt_proxy/include/state_common.h
new file mode 100644
index 000000000000..5d89eb98d77a
--- /dev/null
+++ b/tools/power/x86/intel-lpmd/src/wlt_proxy/include/state_common.h
@@ -0,0 +1,106 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _WLT_PROXY_COMMON_H_
+#define _WLT_PROXY_COMMON_H_
+
+/* threshold (%) for instantaneous utilizations */
+#define UTIL_LOWEST=09=091
+#define UTIL_LOWER=09=092
+#define UTIL_LOW=09=0910
+#define UTIL_FILL_START=09=0935
+#define UTIL_BELOW_HALF=09=0940
+#define UTIL_HALF=09=0950
+#define UTIL_ABOVE_HALF=09=0970
+#define UTIL_NEAR_FULL=09=0990
+
+/* floating point comparison */
+#define EPSILON=09=09(0.01)
+#define A_LTE_B(A, B)=09((((B) - (A)) >=3D EPSILON) ? 1 : 0)
+#define A_GTE_B(A, B)=09((((A) - (B)) >=3D EPSILON) ? 1 : 0)
+#define A_GT_B(A, B)=09((((A) - (B)) > EPSILON) ? 1 : 0)
+
+/* state indexes for  WLT proxy detection based cpu usage high to low */
+enum state_idx {
+=09INIT_MODE,
+=09PERF_MODE,
+=09MDRT4E_MODE,
+=09MDRT3E_MODE,
+=09MDRT2E_MODE,
+=09RESP_MODE,
+=09NORM_MODE,
+=09DEEP_MODE
+};
+
+extern int state_demote;=09/* from state_manager.c */
+extern int burst_count;=09=09/* from spike_mgmt.c */
+extern struct group_util grp;=09/* from state_util.c */
+extern int next_proxy_poll;=09/* from wlt_proxy.c */
+extern int max_util;=09=09/* from state_machine.c */
+extern int wlt_type;=09=09/* from wlt_proxy.c */
+
+#define=09=09MAX_MODE 8
+
+struct group_util {
+=09/* top 3 max utils and last (min) util */
+=09float c0_max;
+=09float c0_min;
+=09float worst_stall;
+=09int worst_stall_cpu;
+=09float c0_2nd_max;
+=09float c0_3rd_max;
+=09int delta;
+
+=09/* simple moving average for top 3 utils */
+=09int sma_sum[3];
+=09int sma_avg1;
+=09int sma_avg2;
+=09int sma_avg3;
+=09int sma_pos;
+};
+
+/* feature states */
+#define DEACTIVATED=09(-1)
+#define UNDEFINED=09(0)
+#define RUNNING=09=09(1)
+#define ACTIVATED=09(2)
+#define PAUSE=09=09(3)
+
+/* state_manager.c */
+void uninit_state_manager(void);
+
+enum state_idx get_cur_state(void);
+
+int get_last_poll(void);
+int get_poll_ms(enum state_idx);
+int get_state_poll(int util, enum state_idx);
+
+int set_stay_count(enum state_idx, int count);
+int get_stay_count(enum state_idx);
+
+int staytime_to_staycount(enum state_idx state);
+int prep_state_change(enum state_idx, enum state_idx, int reset);
+
+int do_countdown(enum state_idx);
+
+/* state_util.c */
+int util_init_proxy(void);
+void util_uninit_proxy(void);
+
+int state_max_avg(void);
+int update_perf_diffs(float *sum_norm_perf, int stat_init_only);
+
+int max_mt_detected(enum state_idx);
+
+/* state_machine.c */
+int state_machine_auto(void);
+
+/* spike_mgmt.c */
+int add_spike_time(int duration);
+int add_non_spike_time(int duration);
+int get_spike_rate(void);
+int get_burst_rate_per_min(void);
+int fresh_burst_response(int initial_val);
+int burst_rate_breach(void);
+int strikeout_once(int n);
+
+#endif /* _WLT_PROXY_COMMON_H_ */
diff --git a/tools/power/x86/intel-lpmd/src/wlt_proxy/include/wlt_proxy.h b=
/tools/power/x86/intel-lpmd/src/wlt_proxy/include/wlt_proxy.h
new file mode 100644
index 000000000000..4f36d0c7514f
--- /dev/null
+++ b/tools/power/x86/intel-lpmd/src/wlt_proxy/include/wlt_proxy.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _WLT_PROXY_H_
+#define _WLT_PROXY_H_
+
+int read_wlt_proxy(int *interval);
+int wlt_proxy_init(void);
+void wlt_proxy_uninit(void);
+
+#endif/* _WLT_PROXY_H_ */
diff --git a/tools/power/x86/intel-lpmd/src/wlt_proxy/spike_mgmt.c b/tools/=
power/x86/intel-lpmd/src/wlt_proxy/spike_mgmt.c
new file mode 100644
index 000000000000..dd54bd4b9510
--- /dev/null
+++ b/tools/power/x86/intel-lpmd/src/wlt_proxy/spike_mgmt.c
@@ -0,0 +1,202 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#define _GNU_SOURCE
+
+#include <stdio.h>
+#include <time.h> //clockid_t
+#include <err.h> //perror
+#include <errno.h>
+#include <stdbool.h> //bool
+
+#include "state_common.h"
+
+/*
+ * spike burst refers to continuous  spikes in a series of back to back sa=
mples.
+ * burt count and strength (as %) are good indicators to segregate random =
noise
+ * (that doesn't deserve performance) from bursty workload needing perform=
ance.
+ *
+ * Example of spike burst (|) and non-spike (.) sampling:
+ *      ...||..||||...|...|||.....
+ * - here, first burst has two spikes.
+ * - second and third burst have 4 and 3 spikes respectively
+ * - the single spike in between is not considered as burst
+ *
+ * Using this a few indicators are derived:
+ *   spike rate =3D total_spike_time * 100/ MAX_TRACKED_SPIKE_TIME
+ * spike_rate is defined as spike-time % of some MAX_TRACKED_SPIKE_TIME
+ *
+ *   spike rate avg =3D spike_rate_total / spike_rate_samples
+ * spike rate avg is used to control how long "1 min" in bc_reset_min appe=
ars to the algo.
+ *
+ *  bc_rest_min is used to control how long to wait before reset of past s=
pike burst count
+ *   SPIKE_TIME_BIAS macro will bias this to be longer or shorter based on
+ *   recent history (i.e more prominent the spiking, the longer it will be=
 remembered)
+ */
+#define MAX_TRACKED_SPIKE_TIME=091000
+#define MAX_BURST_COUNT=09=091000
+#define BURST_COUNT_THRESHOLD=093
+
+//shorten time by 50% if spike rate was as low as 0. No change if spike ra=
te was 100
+#define SPIKE_TIME_BIAS(avg, min) ((100 - (avg)) * (min) / (2 * 100))
+
+int burst_count;
+
+/*local variables*/
+static int total_spike_time;
+static int spike_sec_prev;
+static int spike_rate_total;
+static int spike_rate_samples;
+static int burst_rate_per_min;
+static bool spike_burst_flag;
+static float bc_reset_min =3D 90.0;
+static int once_flag;
+static int strike_count;
+
+/** increment avg spike rate */
+int update_spike_rate_avg(int sr)
+{
+=09spike_rate_total +=3D sr;
+=09spike_rate_samples++;
+=09return 1;
+}
+
+/** reset avg spike rate */
+int clear_spike_rate_avg(void)
+{
+=09spike_rate_samples =3D 0;
+=09spike_rate_total =3D 0;
+=09return 1;
+}
+
+/**
+ * burst count determines number of bursts occurred in recent past (1 min)
+ * arg real_spike specifies if invoked to update actual spike (1) or
+ * just a refresh to burst_count (0)
+ * burst count is decremented if no spikes in last 1 min
+ */
+static int update_burst_count(int real_spike_burst)
+{
+=09float minutes =3D 1.0;
+=09clockid_t clk =3D CLOCK_MONOTONIC;
+=09struct timespec ts;
+
+=09if (clock_gettime(clk, &ts)) {
+=09=09perror("clock_gettime1");
+=09=09return -1;
+=09}
+
+=09if (spike_sec_prev) {
+=09=09minutes =3D (float)(ts.tv_sec - spike_sec_prev) / bc_reset_min;
+=09} else {
+=09=09spike_sec_prev =3D ts.tv_sec;
+=09=09return 0;
+=09}
+
+=09if (real_spike_burst && (get_cur_state() <=3D MDRT4E_MODE)) {
+=09=09burst_count++;
+=09=09spike_sec_prev =3D ts.tv_sec;
+=09} else if ((minutes > 1.0) || (burst_count > MAX_BURST_COUNT)) {
+=09=09burst_count =3D 0;
+=09=09spike_sec_prev =3D ts.tv_sec;
+=09}
+
+=09if (minutes < 1.0)
+=09=09burst_rate_per_min =3D burst_count;
+=09else if (minutes && (minutes > 1.0))
+=09=09burst_rate_per_min =3D (int)((float)burst_count / minutes);
+
+=09return burst_rate_per_min;
+}
+
+int get_burst_rate_per_min(void)
+{
+=09return burst_rate_per_min;
+}
+
+int fresh_burst_response(int initial_burst_rate)
+{
+=09if (!initial_burst_rate)
+=09=09return 0;
+=09if (initial_burst_rate >=3D BURST_COUNT_THRESHOLD ||
+=09    get_burst_rate_per_min() > initial_burst_rate)
+=09=09return 1;
+=09return 0;
+}
+
+int burst_rate_breach(void)
+{
+=09return (get_burst_rate_per_min() >=3D BURST_COUNT_THRESHOLD) ? 1 : 0;
+}
+
+/* Calculate spike rate */
+int get_spike_rate(void)
+{
+=09int spike_pct =3D total_spike_time * 100 / MAX_TRACKED_SPIKE_TIME;
+
+=09return (spike_pct > 100) ? 100 : spike_pct;
+}
+
+/* count spikes */
+int add_spike_time(int duration)
+{
+=09int spike_rate;
+
+=09if (total_spike_time < MAX_TRACKED_SPIKE_TIME)
+=09=09total_spike_time +=3D duration;
+
+=09/* spike burst has more than 1 spike */
+=09if (!spike_burst_flag) {
+=09=09/* rising edge of spike burst */
+=09=09spike_burst_flag =3D true;
+=09} else if (state_demote && !once_flag) {
+=09=09update_burst_count(1);
+=09=09once_flag =3D 1;
+=09}
+
+=09spike_rate =3D get_spike_rate();
+=09update_spike_rate_avg(spike_rate);
+=09return 1;
+}
+
+/* count idleness / non spike times */
+int add_non_spike_time(int duration)
+{
+=09float avg;
+=09int sr;
+
+=09if (total_spike_time > 0)
+=09=09total_spike_time -=3D duration;
+=09total_spike_time =3D (total_spike_time < 0) ? 0 : total_spike_time;
+
+=09sr =3D get_spike_rate();
+=09if (!sr && spike_burst_flag) {
+=09=09/* falling edge of burst */
+=09=09spike_burst_flag =3D false;
+=09=09avg =3D spike_rate_total / spike_rate_samples;
+
+=09=09if (!once_flag)
+=09=09=09update_burst_count(1);
+
+=09=09bc_reset_min =3D 60.0 - (int)SPIKE_TIME_BIAS(avg, bc_reset_min);
+=09=09clear_spike_rate_avg();
+=09=09once_flag =3D 0;
+=09} else {
+=09=09update_burst_count(0);
+=09=09once_flag =3D 0;
+=09}
+=09return 1;
+}
+
+/* decrement strike count */
+int strikeout_once(int n)
+{
+=09if (!strike_count)
+=09=09strike_count =3D n;
+=09else
+=09=09strike_count -=3D 1;
+
+=09if (strike_count < 0)
+=09=09strike_count =3D 0;
+
+=09return strike_count;
+}
diff --git a/tools/power/x86/intel-lpmd/src/wlt_proxy/state_machine.c b/too=
ls/power/x86/intel-lpmd/src/wlt_proxy/state_machine.c
new file mode 100644
index 000000000000..00666d014093
--- /dev/null
+++ b/tools/power/x86/intel-lpmd/src/wlt_proxy/state_machine.c
@@ -0,0 +1,314 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#define _GNU_SOURCE
+#include <stdio.h>
+#include <math.h>
+
+#include "state_common.h"
+#include "lpmd.h" //logs
+
+/*
+ * stall scalability refer to non-stallable percentage of utilization.
+ * e.g due to memory or other dependency. If work is reasonably scaling we=
ll,
+ * values in 80 to 90+% is expected
+ */
+#define STALL_SCALE_LOWER_MARK=0960
+
+#define N_STRIKE=09=09(10)
+
+/* threshold (%) for sustained (avg) utilizations */
+#define SUS_LOWER=09=092
+#define SUS_LOW_RANGE_START=094
+#define SUS_LOW_RANGE_END=0925
+
+int max_util;
+
+static int only_once;
+
+/* function checks conditions for state switch */
+int state_machine_auto(void)
+{
+=09float dummy;
+=09int present_state =3D get_cur_state();
+
+=09update_perf_diffs(&dummy, 0);
+=09max_util =3D (int)round(grp.c0_max); //end
+
+=09/*
+=09 * we do not want to track avg util for following case:
+=09 * a) Responsive transit mode (fast poll can flood avg leading to incor=
rect decisions)
+=09 */
+=09if (present_state !=3D RESP_MODE)
+=09=09state_max_avg();
+
+=09int completed_poll =3D get_last_poll();
+=09float sum_c0 =3D grp.c0_max + grp.c0_2nd_max + grp.c0_3rd_max;
+=09int mdrt_count;
+=09int perf_count, initial_burst_count;
+=09initial_burst_count =3D get_burst_rate_per_min();
+
+=09mdrt_count =3D get_stay_count(MDRT3E_MODE);
+=09int sr =3D get_spike_rate();
+
+=09if (A_LTE_B(grp.c0_max, UTIL_NEAR_FULL))
+=09=09add_non_spike_time(completed_poll);
+=09else if (A_GT_B(grp.c0_max, UTIL_NEAR_FULL) || sr)
+=09=09add_spike_time(completed_poll);
+
+=09/* should we reset perf-count due to new burst? */
+=09if (fresh_burst_response(initial_burst_count)) {
+=09=09set_stay_count(PERF_MODE, staytime_to_staycount(PERF_MODE));
+=09=09set_stay_count(MDRT3E_MODE, 0);
+=09}
+
+=09perf_count =3D get_stay_count(PERF_MODE);
+=09if (!perf_count && !mdrt_count)
+=09=09set_stay_count(MDRT3E_MODE, staytime_to_staycount(MDRT3E_MODE));
+
+=09state_demote =3D 0;
+=09int ismt =3D !max_mt_detected(INIT_MODE);
+
+=09if (only_once =3D=3D 0) {
+=09=09lpmd_log_debug("present_state, isMT, C0_max, C0_2ndMax, sum_c0, sma =
avg1, sma avg2, sma avg3, worst_stall, next_proxy_poll\n");
+=09=09only_once =3D 1;
+=09}
+
+=09lpmd_log_debug("%d, %d,     %.2f,       %.2f,   %.2f,       %d,      %d=
,        %d,        %.2f, %d\n",
+=09=09       present_state,
+=09=09       ismt,
+=09=09       grp.c0_max,
+=09=09       grp.c0_2nd_max,
+=09=09       sum_c0,
+=09=09       grp.sma_avg1,
+=09=09       grp.sma_avg2,
+=09=09       grp.sma_avg3,
+=09=09       grp.worst_stall,
+=09=09       next_proxy_poll);
+
+=09switch (present_state) {
+=09case INIT_MODE:
+=09=09// init mode is super-set of all default/available cpu on the system
+=09=09// promote -- if not high multi-thread trend
+=09=09if (!max_mt_detected(INIT_MODE)) {
+=09=09=09lpmd_log_debug("INIT_MODE to PERF_MODE\n");
+=09=09=09prep_state_change(INIT_MODE, PERF_MODE, 0);
+=09=09=09break;
+=09=09}
+=09=09// stay -- full MT
+=09=09break;
+
+=09case PERF_MODE:
+=09=09// Demote -- if highly MT
+=09=09if (max_mt_detected(PERF_MODE)) {
+=09=09=09lpmd_log_debug("PERF_MODE to INIT_MODE =3D mt detected.\n");
+=09=09=09prep_state_change(PERF_MODE, INIT_MODE, 0);
+=09=09=09break;
+=09=09}
+=09=09// Stay -- if there was recent perf/resp bursts
+=09=09if (burst_count > 0 && !do_countdown(PERF_MODE)) {
+=09=09=09lpmd_log_debug("PERF_MODE: burst_count is %d > 0 && !do_countdown=
\n",
+=09=09=09=09       burst_count);
+=09=09=09break;
+=09=09}
+=09=09// Promote but through responsive watch -- if top sampled util and t=
heir avg are receding.
+=09=09if (A_LTE_B(sum_c0, (2 * UTIL_LOW)) &&
+=09=09    A_LTE_B(grp.sma_avg1, UTIL_ABOVE_HALF)) {
+=09=09=09lpmd_log_debug("PERF_MODE to RESP_MODE\n");
+=09=09=09prep_state_change(PERF_MODE, RESP_MODE, 0);
+=09=09=09break;
+=09=09}
+=09=09// Promote -- to moderate (3) MT state
+=09=09if (!burst_rate_breach() &&
+=09=09    A_LTE_B(grp.c0_max, UTIL_LOW)) { // && A_LTE_B(sum_avg, UTIL_BEL=
OW_HALF))
+=09=09=09set_stay_count(MDRT3E_MODE, 0);
+=09=09=09lpmd_log_debug("PERF_MODE to MDRT3E_MODE\n");
+=09=09=09prep_state_change(PERF_MODE, MDRT3E_MODE, 0);
+=09=09=09break;
+=09=09}
+=09=09//Stay -- all else
+=09=09break;
+
+=09case RESP_MODE:
+=09=09// Demote -- if ST above halfway mark and avg trending higher
+=09=09if (A_GT_B(grp.c0_max, UTIL_ABOVE_HALF) &&
+=09=09    A_GT_B(grp.sma_avg1, UTIL_BELOW_HALF)) {
+=09=09=09lpmd_log_debug("RESP_MODE to PERF_MODE\n");
+=09=09=09prep_state_change(RESP_MODE, PERF_MODE, 0);
+=09=09=09break;
+=09=09}
+=09=09// Stay -- if there were recent burst of spikes
+=09=09if (perf_count && burst_rate_breach())
+=09=09=09break;
+
+=09=09// Promote -- all else
+=09=09if (A_LTE_B(grp.worst_stall * 100, STALL_SCALE_LOWER_MARK)) {
+=09=09=09lpmd_log_debug("worst stall is less than STALL_SCALE_LOWER_MARK -=
- stay here.\n");
+=09=09} else {
+=09=09=09lpmd_log_debug("RESP_MODE to MDRT3E_MODE\n");
+=09=09=09prep_state_change(RESP_MODE, MDRT3E_MODE, 0);
+=09=09}
+=09=09break;
+
+=09case MDRT4E_MODE:
+=09=09if (A_LTE_B(grp.worst_stall * 100, STALL_SCALE_LOWER_MARK)) {
+=09=09=09lpmd_log_debug("MDRT4E_MODE to RESP_MODE\n");
+=09=09=09prep_state_change(MDRT4E_MODE, RESP_MODE, 0);
+=09=09=09break;
+=09=09}
+=09=09// Demote
+=09=09if (A_GT_B(grp.c0_max, UTIL_NEAR_FULL)) {
+=09=09=09if (!burst_rate_breach() && strikeout_once(N_STRIKE))
+=09=09=09=09break;
+=09=09=09lpmd_log_debug("MDRT4E_MODE to PERF_MODE\n");
+=09=09=09prep_state_change(MDRT4E_MODE, PERF_MODE, 0);
+=09=09=09break;
+=09=09}
+=09=09// promote
+=09=09if (A_LTE_B(grp.sma_avg1, SUS_LOW_RANGE_END) &&
+=09=09    A_LTE_B(grp.sma_avg2, SUS_LOW_RANGE_END) &&
+=09=09    A_LTE_B(sum_c0, UTIL_HALF)) {
+=09=09=09if (!do_countdown(MDRT4E_MODE))
+=09=09=09=09break;
+=09=09=09lpmd_log_debug("MDRT4E_MODE to NORM_MODE\n");
+=09=09=09prep_state_change(MDRT4E_MODE, NORM_MODE, 0);
+=09=09=09break;
+=09=09}
+=09=09// stay
+=09=09break;
+
+=09case MDRT3E_MODE:
+=09=09// Demote -- if mem bound work is stalling but didn't show higher ut=
ilization
+=09=09if (A_LTE_B(grp.worst_stall * 100, STALL_SCALE_LOWER_MARK)) {
+=09=09=09lpmd_log_debug("MDRT3E_MODE to RESP_MODE %.2f < %d\n",
+=09=09=09=09       grp.worst_stall, STALL_SCALE_LOWER_MARK);
+=09=09=09prep_state_change(MDRT3E_MODE, RESP_MODE, 0);
+=09=09=09break;
+=09=09}
+=09=09// Demote to perf
+=09=09if (A_GT_B(grp.c0_max, UTIL_NEAR_FULL)) {
+=09=09=09if (!burst_rate_breach() && strikeout_once(N_STRIKE)) {
+=09=09=09=09lpmd_log_debug("MDRT3E_MODE: burst_rate_breach AND strikeout_o=
nce - not met\n");
+=09=09=09=09break;
+=09=09=09}
+=09=09=09lpmd_log_debug("MDRT3E_MODE to PERF_MODE\n");
+=09=09=09prep_state_change(MDRT3E_MODE, PERF_MODE, 0);
+=09=09=09break;
+=09=09}
+
+=09=09// Demote to 4 thread sustained
+=09=09if (A_GTE_B(grp.sma_avg1, SUS_LOW_RANGE_END) &&
+=09=09    A_GTE_B(grp.sma_avg2, (SUS_LOW_RANGE_END - 5))) {
+=09=09=09lpmd_log_debug("MDRT3E_MODE to MDRT4E_MODE %d > %d\n",
+=09=09=09=09       grp.sma_avg1, SUS_LOW_RANGE_END);
+=09=09=09prep_state_change(MDRT3E_MODE, MDRT4E_MODE, 0);
+=09=09=09break;
+=09=09}
+=09=09// promote
+=09=09if ((A_GT_B(grp.sma_avg1, SUS_LOW_RANGE_START) &&
+=09=09     A_LTE_B(grp.sma_avg1, SUS_LOW_RANGE_END)) &&
+=09=09    (A_GT_B(grp.sma_avg2, SUS_LOW_RANGE_START) &&
+=09=09     A_LTE_B(grp.sma_avg2, SUS_LOW_RANGE_END))) {
+=09=09=09if (!do_countdown(MDRT3E_MODE)) {
+=09=09=09=09lpmd_log_debug("MDRT3E_MODE: to MDRT2E_MODE - do countdown not=
 met\n");
+=09=09=09=09break;
+=09=09=09}
+=09=09=09lpmd_log_debug("MDRT3E_MODE to MDRT2E_MODE %d < %d\n",
+=09=09=09=09       grp.sma_avg1, MDRT2E_MODE);
+=09=09=09prep_state_change(MDRT3E_MODE, MDRT2E_MODE, 0);
+=09=09=09break;
+=09=09}
+=09=09// Promote -- if top three avg util are trending lower.
+=09=09if (A_LTE_B(grp.sma_avg1, SUS_LOW_RANGE_END) &&
+=09=09   (A_LTE_B(grp.sma_avg2, SUS_LOWER) &&
+=09=09    A_LTE_B(grp.sma_avg3, SUS_LOWER))) {
+=09=09=09if (!do_countdown(MDRT3E_MODE)) {
+=09=09=09=09lpmd_log_debug("MDRT3E_MODE: to NORM_MODE - do countdown not m=
et\n");
+=09=09=09=09break;
+=09=09=09}
+=09=09=09lpmd_log_debug("MDRT3E_MODE to NORM_MODE\n");
+=09=09=09prep_state_change(MDRT3E_MODE, NORM_MODE, 0);
+=09=09=09break;
+=09=09}
+
+=09=09lpmd_log_debug("MDRT3E_MODE: stay\n");
+=09=09break;
+
+=09case MDRT2E_MODE:
+=09=09// Demote -- if mem bound work is stalling but didn't show higher ut=
ilization
+=09=09if (A_LTE_B(grp.worst_stall * 100, STALL_SCALE_LOWER_MARK)) {
+=09=09=09lpmd_log_debug("MDRT2E_MODE to RESP_MODE\n");
+=09=09=09prep_state_change(MDRT2E_MODE, RESP_MODE, 0);
+=09=09=09break;
+=09=09}
+=09=09// Demote -- if instant util nearing full or sustained moderate avg1=
 trend with avg2 trailing closeby
+=09=09if (A_GT_B(grp.c0_max, UTIL_NEAR_FULL) ||
+=09=09   (A_GTE_B(grp.sma_avg1, SUS_LOW_RANGE_END) &&
+=09=09    A_GTE_B(grp.sma_avg2, SUS_LOW_RANGE_END - 10))) {
+=09=09=09if (!burst_rate_breach() && strikeout_once(N_STRIKE))
+=09=09=09=09break;
+=09=09=09lpmd_log_debug("MDRT2E_MODE to MDRT3E_MODE\n");
+=09=09=09prep_state_change(MDRT2E_MODE, MDRT3E_MODE, 0);
+=09=09=09break;
+=09=09}
+=09=09// Promote -- if top two avg util are trending lower.
+=09=09if ((A_GT_B(grp.sma_avg1, SUS_LOW_RANGE_START) &&
+=09=09     A_LTE_B(grp.sma_avg1, SUS_LOW_RANGE_END)) &&
+=09=09     A_LTE_B(grp.sma_avg2, SUS_LOW_RANGE_END)) {
+=09=09=09if (!do_countdown(MDRT2E_MODE))
+=09=09=09=09break;
+=09=09=09lpmd_log_debug("MDRT2E_MODE to NORM_MODE\n");
+=09=09=09prep_state_change(MDRT2E_MODE, NORM_MODE, 0);
+=09=09=09break;
+=09=09}
+=09=09// stay
+=09=09break;
+
+=09case NORM_MODE:
+=09=09// Demote -- if mem bound work is stalling but didn't show higher ut=
ilization
+=09=09if (A_LTE_B(grp.worst_stall * 100, STALL_SCALE_LOWER_MARK)) {
+=09=09=09lpmd_log_debug("NORM_MODE to RESP_MODE\n");
+=09=09=09prep_state_change(NORM_MODE, RESP_MODE, 0);
+=09=09=09break;
+=09=09}
+=09=09// Demote -- if instant util more than half or if signs of sustained=
 ST activity.
+=09=09if (A_GT_B(grp.c0_max, UTIL_HALF) ||
+=09=09    (A_GT_B(grp.sma_avg1, UTIL_BELOW_HALF))) {
+=09=09=09/* In this state its better to absorb few spike (noise) before re=
acting */
+=09=09=09if (!burst_rate_breach() && strikeout_once(N_STRIKE))
+=09=09=09=09break;
+=09=09=09lpmd_log_debug("NORM_MODE to MDRT2E_MODE\n");
+=09=09=09prep_state_change(NORM_MODE, MDRT2E_MODE, 0);
+=09=09=09break;
+=09=09}
+=09=09// Promote -- if top few instant util or top avg is trending lower.
+=09=09if ((A_LTE_B(grp.c0_max, UTIL_LOW) &&
+=09=09     A_LTE_B(grp.c0_2nd_max, UTIL_LOWEST)) ||
+=09=09     A_LTE_B(grp.sma_avg1, SUS_LOWER)) {
+=09=09=09/* its better to absorb few dips before reacting out of a steady-=
state */
+=09=09=09if (!do_countdown(NORM_MODE))
+=09=09=09=09break;
+=09=09=09lpmd_log_debug("NORM_MODE to DEEP_MODE\n");
+=09=09=09prep_state_change(NORM_MODE, DEEP_MODE, 0);
+=09=09=09break;
+=09=09}
+=09=09break;
+
+=09case DEEP_MODE:
+=09=09// Demote -- if mem bound work is stalling but didn't show higher ut=
il.
+=09=09if (A_LTE_B(grp.worst_stall * 100, STALL_SCALE_LOWER_MARK)) {
+=09=09=09lpmd_log_debug("DEEP_MODE to RESP_MODE\n");
+=09=09=09prep_state_change(DEEP_MODE, RESP_MODE, 0);
+=09=09=09break;
+=09=09}
+=09=09// Demote -- if there are early signs of instantaneous utilization b=
uild-up.
+=09=09if (A_GT_B(grp.c0_max, UTIL_FILL_START)) {
+=09=09=09lpmd_log_debug("DEEP_MODE to NORM_MODE\n");
+=09=09=09prep_state_change(DEEP_MODE, NORM_MODE, 0);
+=09=09=09break;
+=09=09}
+
+=09=09break;
+=09}
+
+=09return 1;
+}
diff --git a/tools/power/x86/intel-lpmd/src/wlt_proxy/state_manager.c b/too=
ls/power/x86/intel-lpmd/src/wlt_proxy/state_manager.c
new file mode 100644
index 000000000000..d80d1eb405fc
--- /dev/null
+++ b/tools/power/x86/intel-lpmd/src/wlt_proxy/state_manager.c
@@ -0,0 +1,302 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#define _GNU_SOURCE
+#include <sched.h>
+
+#include "lpmd.h" //logs
+#include "state_common.h"
+#include "wlt_proxy.h" //set_workload_hint
+
+#ifdef __GNUC__
+#define likely(x)=09=09=09__builtin_expect(!!(x), 1)
+#define unlikely(x)=09=09=09__builtin_expect(!!(x), 0)
+#else
+#define likely(x)=09=09=09(x)
+#define unlikely(x)=09=09=09(x)
+#endif
+
+/*
+ * If polling is too fast some of the stats (such as util)
+ * could be momentarily high owing to state change disturbances.
+ * avoid unexpected decision due to this as it may not be tied to workload=
 per-se.
+ * any setting below, say 100ms, needs careful assessment.
+ */
+#define MIN_POLL_PERIOD=09=09=09100
+
+#define BASE_POLL_RESP=09=09=0996
+#define BASE_POLL_MT=09=09=09100
+#define BASE_POLL_PERF=09=09=09280
+#define BASE_POLL_MDRT4E=09=09600  // e.g., 4E cores of a module
+#define BASE_POLL_MDRT3E=09=09800  // e.g., 3E cores of a module
+#define BASE_POLL_MDRT2E=09=091000 // e.g., 2E cores of a module
+#define BASE_POLL_NORM=09=09=091200
+#define BASE_POLL_DEEP=09=09=091800
+
+/* hold period (ms) before moving to deeper state */
+#define MDRT_MODE_STAY=09=09=09(4000)
+#define PERF_MODE_STAY=09=09=09(10000)
+
+/* poll interval type */
+enum elastic_poll {
+=09ZEROTH,
+=09LINEAR,
+=09QUADRATIC,
+=09CUBIC,
+};
+
+/* state properties */
+struct st_state {
+=09bool disabled;
+=09char *name;
+=09char *str;
+=09char *str_reverse;
+=09char *hexstr;
+=09char *hexstr_reverse;
+=09int poll;
+=09enum elastic_poll poll_order;
+=09int stay_count;
+=09int stay_count_update_sec;
+=09int stay_count_update_sec_prev;
+=09int spike_type;
+=09float stay_scalar;
+=09int ppw_enabled;
+=09int last_max_util;
+=09int last_poll;
+};
+
+static struct st_state state_info[MAX_MODE] =3D {
+=09[INIT_MODE] =3D { .name =3D "Avail cpu: P/E/L",
+=09=09=09.poll =3D BASE_POLL_MT,
+=09=09=09.poll_order =3D ZEROTH },
+=09[PERF_MODE] =3D { .name =3D "Perf:non-soc cpu",
+=09=09=09.poll =3D BASE_POLL_PERF,
+=09=09=09.poll_order =3D ZEROTH },
+=09[MDRT2E_MODE] =3D { .name =3D "Moderate 2E",
+=09=09=09  .poll =3D BASE_POLL_MDRT2E,
+=09=09=09  .poll_order =3D LINEAR },
+=09[MDRT3E_MODE] =3D { .name =3D "Moderate 3E",
+=09=09=09  .poll =3D BASE_POLL_MDRT3E,
+=09=09=09  .poll_order =3D LINEAR },
+=09[MDRT4E_MODE] =3D { .name =3D "Moderate 4E",
+=09=09=09  .poll =3D BASE_POLL_MDRT4E,
+=09=09=09  .poll_order =3D LINEAR },
+=09[RESP_MODE] =3D { .name =3D "Responsive 2L",
+=09=09=09.poll =3D BASE_POLL_RESP,
+=09=09=09.poll_order =3D CUBIC },
+=09[NORM_MODE] =3D { .name =3D "Normal LP 2L",
+=09=09=09.poll =3D BASE_POLL_NORM,
+=09=09=09.poll_order =3D QUADRATIC },
+=09[DEEP_MODE] =3D { .name =3D "Deep LP 1L",
+=09=09=09.poll =3D BASE_POLL_DEEP,
+=09=09=09.poll_order =3D CUBIC },
+};
+
+static enum state_idx cur_state =3D NORM_MODE;
+static int needs_state_reset =3D 1;
+
+int state_demote;
+
+static void set_state_reset(void)
+{
+=09needs_state_reset =3D 1;
+}
+
+enum state_idx get_cur_state(void)
+{
+=09return cur_state;
+}
+
+static void set_cur_state(enum state_idx state)
+{
+=09cur_state =3D state;
+}
+
+static int is_state_valid(enum state_idx state)
+{
+=09return ((state >=3D INIT_MODE) && (state < MAX_MODE) &&
+=09=09!state_info[state].disabled);
+}
+
+int get_poll_ms(enum state_idx state)
+{
+=09return state_info[state].poll;
+}
+
+int get_stay_count(enum state_idx state)
+{
+=09return state_info[state].stay_count;
+}
+
+int set_stay_count(enum state_idx state, int count)
+{
+=09return (state_info[state].stay_count =3D count);
+}
+
+/* return 1 if stay count reaches 0 */
+int do_countdown(enum state_idx state)
+{
+=09state_info[state].stay_count -=3D 1;
+
+=09if (state_info[state].stay_count <=3D 0) {
+=09=09state_info[state].stay_count =3D 0;
+=09=09return 1;
+=09}
+
+=09return 0;
+}
+
+/* get poll value in microsec */
+int get_state_poll(int util, enum state_idx state)
+{
+=09int poll, scale =3D (100 - util);
+=09float scale2;
+=09int order =3D (int)state_info[state].poll_order;
+
+=09/* avoiding fpow() overhead */
+=09switch (order) {
+=09case ZEROTH:
+=09=09scale2 =3D (float)1;
+=09=09break;
+=09case LINEAR:
+=09=09scale2 =3D (float)scale / 100;
+=09=09break;
+=09case QUADRATIC:
+=09=09scale2 =3D (float)scale * scale / 10000;
+=09=09break;
+=09case CUBIC:
+=09=09scale2 =3D (float)scale * scale * scale / 1000000;
+=09=09break;
+=09default:
+=09=09scale2 =3D (float)scale / 100;
+=09=09break;
+=09}
+
+=09poll =3D (int)(state_info[cur_state].poll * scale2);
+
+=09/* limiting min poll to MIN_POLL_PERIOD ms */
+=09if (poll < MIN_POLL_PERIOD)
+=09=09return MIN_POLL_PERIOD;
+
+=09return poll;
+}
+
+int get_last_maxutil(void)
+{
+=09return state_info[cur_state].last_max_util;
+}
+
+static int set_last_maxutil(int v)
+{
+=09state_info[cur_state].last_max_util =3D v;
+=09return 1;
+}
+
+int set_last_poll(int v)
+{
+=09state_info[cur_state].last_poll =3D v;
+=09return 1;
+}
+
+int get_last_poll(void)
+{
+=09return state_info[cur_state].last_poll;
+}
+
+/* initiate state change */
+static int apply_state_change(void)
+{
+=09float test;
+
+=09if (!needs_state_reset)
+=09=09return 0;
+
+=09update_perf_diffs(&test, 1);
+=09needs_state_reset =3D 0;
+
+=09return 1;
+}
+
+/* Internal state to WLT mapping*/
+static int get_state_mapping(enum state_idx state)
+{
+=09switch (state) {
+=09case PERF_MODE:
+=09=09return WLT_BURSTY;
+
+=09case RESP_MODE:
+=09case NORM_MODE:
+=09=09return WLT_BATTERY_LIFE;
+
+=09case DEEP_MODE:
+=09=09return WLT_IDLE;
+
+=09case INIT_MODE:
+=09case MDRT4E_MODE:
+=09case MDRT3E_MODE:
+=09case MDRT2E_MODE:
+=09=09return WLT_SUSTAINED;
+
+=09default:
+=09=09return WLT_IDLE;
+=09}
+}
+
+/* prepare for state change */
+int prep_state_change(enum state_idx from_state, enum state_idx to_state,
+=09=09      int reset)
+{
+=09set_cur_state(to_state);
+=09set_state_reset();
+=09set_last_maxutil(DEACTIVATED);
+
+=09if (to_state < from_state)
+=09=09state_demote =3D 1;
+
+=09//proxy: apply state change and get poll interval
+=09apply_state_change();
+
+=09if (likely(is_state_valid(to_state)))
+=09=09next_proxy_poll =3D get_state_poll(max_util, to_state);
+
+=09wlt_type =3D get_state_mapping(to_state);
+
+=09return 1;
+}
+
+/* return staycount for the state */
+int staytime_to_staycount(enum state_idx state)
+{
+=09int stay_count =3D 0;
+
+=09switch (state) {
+=09case MDRT2E_MODE:
+=09case MDRT3E_MODE:
+=09case MDRT4E_MODE:
+=09=09stay_count =3D (int)MDRT_MODE_STAY / get_poll_ms(MDRT3E_MODE);
+=09=09break;
+=09case PERF_MODE:
+=09=09stay_count =3D (int)PERF_MODE_STAY / get_poll_ms(PERF_MODE);
+=09=09break;
+=09default:
+=09=09break;
+=09}
+=09return stay_count;
+}
+
+/* cleanup */
+void uninit_state_manager(void)
+{
+=09for (int idx =3D INIT_MODE; idx < MAX_MODE; idx++) {
+=09=09if (state_info[idx].str)
+=09=09=09free(state_info[idx].str);
+
+=09=09if (state_info[idx].str_reverse)
+=09=09=09free(state_info[idx].str_reverse);
+
+=09=09if (state_info[idx].hexstr)
+=09=09=09free(state_info[idx].hexstr);
+
+=09=09if (state_info[idx].hexstr_reverse)
+=09=09=09free(state_info[idx].hexstr_reverse);
+=09}
+}
diff --git a/tools/power/x86/intel-lpmd/src/wlt_proxy/state_util.c b/tools/=
power/x86/intel-lpmd/src/wlt_proxy/state_util.c
new file mode 100644
index 000000000000..9a9a8428c139
--- /dev/null
+++ b/tools/power/x86/intel-lpmd/src/wlt_proxy/state_util.c
@@ -0,0 +1,584 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/perf_event.h> //perf_event_attr
+#include <asm/unistd.h> //syscall __NR_perf_event_open
+#include <stdio.h>
+#include <stdint.h> //uint64_t
+#include <math.h> //round
+
+#include "lpmd.h"
+#include "state_common.h"
+
+/*
+ * simple moving average (sma), event count based - not time.
+ * updated for up to top 3 max util streams.
+ * exact cpu # is not tracked; only the max since continuum of task
+ * keeps switching cpus anyway.
+ * array implementation with SMA_LENGTH number of values.
+ */
+#define SMA_LENGTH=09=09(25)
+#define SMA_CPU_COUNT=09=09(3)
+#define SCALE_DECIMAL=09=09(100)
+
+static int sample[3][SMA_LENGTH];
+
+enum core_type {
+=09P_CORE =3D 1,
+=09E_CORE =3D 2,
+=09L_CORE =3D 3
+};
+
+struct perf_stats_t {
+=09int cpu;
+
+=09enum core_type cpu_type;
+
+=09int aperf_fd;
+=09int mperf_fd;
+=09int pperf_fd;
+
+=09uint64_t aperf_diff;
+=09uint64_t mperf_diff;
+=09uint64_t pperf_diff;
+=09uint64_t tsc_diff;
+
+=09uint64_t nperf;
+=09/*
+=09 * As initial freq f0 changes to some other value
+=09 * in the next cycle, it influences the initial
+=09 * load l0 and associated stall-factor (1-s0)
+=09 * track them for perf-per-watt evaluation.
+=09 */
+=09float f0;
+=09float l0;
+=09float s0;
+};
+
+struct perf_stats_t *perf_stats;
+struct group_util grp;
+
+struct thread_data {
+=09unsigned long long tsc;
+=09unsigned long long aperf;
+=09unsigned long long mperf;
+=09unsigned long long pperf;
+} *thread_even, *thread_odd;
+
+static uint64_t *last_aperf;
+static uint64_t *last_mperf;
+static uint64_t *last_pperf;
+static uint64_t *last_tsc;
+
+/*
+ * Intel Alderlake hardware errata #ADL026: pperf bits 31:64 could be inco=
rrect.
+ * https://edc.intel.com/content/www/us/en/design/ipla/software-developmen=
t-plat
+ * forms/client/platforms/alder-lake-desktop/682436/007/errata-details/#AD=
L026
+ * u644diff() implements a workaround. Assuming real diffs less than MAX(u=
int32)
+ */
+#define u64diff(b, a) (((uint64_t)b < (uint64_t)a) ?=09=09=09\
+=09    (uint64_t)((uint32_t)~0UL - (uint32_t)a + (uint32_t)b) :=09\
+=09    ((uint64_t)b - (uint64_t)a))
+
+/* routine to evaluate & store a per-cpu msr value's diff */
+#define VARI(a, b, i) (a##b[i])
+#define cpu_generate_msr_diff(scope)=09=09=09=09=09\
+uint64_t cpu_get_diff_##scope(uint64_t cur_value, int instance)=09=09\
+{=09=09=09=09=09=09=09=09=09\
+=09uint64_t diff;=09=09=09=09=09=09=09\
+=09diff =3D (VARI(last_, scope, instance) =3D=3D 0) ?=09=09=09\
+=09    0 : u64diff(cur_value, VARI(last_, scope, instance));=09\
+=09VARI(last_, scope, instance) =3D cur_value;=09=09=09\
+=09return diff;=09=09=09=09=09=09=09\
+}
+
+/********************Perf calculation - begin ****************************=
*************/
+
+cpu_generate_msr_diff(aperf);
+cpu_generate_msr_diff(mperf);
+cpu_generate_msr_diff(pperf);
+cpu_generate_msr_diff(tsc);
+
+/* initialize perf_stat structure */
+static int perf_stat_init(void)
+{
+=09int max_cpus =3D get_max_cpus();
+
+=09perf_stats =3D NULL;
+=09perf_stats =3D calloc(max_cpus, sizeof(struct perf_stats_t));
+=09if (!perf_stats) {
+=09=09lpmd_log_error("WLT_Proxy: memory failure\n");
+=09=09return 0;
+=09}
+
+=09for (int t =3D 0; t < max_cpus; t++) {
+=09=09if (!is_cpu_online(t))
+=09=09=09continue;
+
+=09=09perf_stats[t].cpu =3D t;
+
+=09=09if (is_cpu_pcore(t))
+=09=09=09perf_stats[t].cpu_type =3D P_CORE;
+=09=09else if (is_cpu_ecore(t))
+=09=09=09perf_stats[t].cpu_type =3D E_CORE;
+=09=09else
+=09=09=09perf_stats[t].cpu_type =3D L_CORE;
+=09}
+
+=09return 1;
+}
+
+/* is cpu applicable for the given state*/
+static int cpu_applicable(int cpu, enum state_idx state)
+{
+=09switch (state) {
+=09case INIT_MODE:
+=09=09//for INIT mode need all cores [P,E,L]
+=09=09return 1;
+=09case NORM_MODE: // 2 L cores
+=09case DEEP_MODE: // 1 L core
+=09case RESP_MODE: // all L core
+=09case MDRT2E_MODE: // 2 E cores
+=09case MDRT3E_MODE: // 3 E cores
+=09case MDRT4E_MODE: // 4 E cores
+=09case PERF_MODE:
+=09=09if (perf_stats[cpu].cpu_type !=3D L_CORE)
+=09=09=09return 1;
+=09default:
+=09=09break;
+=09}
+
+=09return 0;
+}
+
+static int init_perf_calculations(int n)
+{
+=09if (!perf_stat_init()) {
+=09=09lpmd_log_error("\nerror initiating cpu proxy\n");
+=09=09return -1;
+=09}
+
+=09last_aperf =3D calloc(n, sizeof(uint64_t));
+=09last_mperf =3D calloc(n, sizeof(uint64_t));
+=09last_pperf =3D calloc(n, sizeof(uint64_t));
+=09last_tsc =3D calloc(n, sizeof(uint64_t));
+=09if (!last_aperf || !last_mperf || !last_mperf || !last_tsc) {
+=09=09lpmd_log_error("calloc failure perf vars\n");
+=09=09return -2;
+=09}
+
+=09return LPMD_SUCCESS;
+}
+
+/* helper - pperf reading */
+static int read_perf_counter_info(const char *const path,
+=09=09=09=09  const char *const parse_format,
+=09=09=09=09  void *value_ptr)
+{
+=09int fdmt;
+=09int bytes_read;
+=09char buf[64];
+=09int ret =3D -1;
+
+=09fdmt =3D open(path, O_RDONLY, 0);
+=09if (fdmt =3D=3D -1) {
+=09=09lpmd_log_error("Failed to parse perf counter info %s\n", path);
+=09=09ret =3D -1;
+=09=09goto cleanup_and_exit;
+=09}
+
+=09bytes_read =3D read(fdmt, buf, sizeof(buf) - 1);
+=09if (bytes_read <=3D 0 || bytes_read >=3D (int)sizeof(buf)) {
+=09=09lpmd_log_error("Failed to parse perf counter info %s\n", path);
+=09=09ret =3D -1;
+=09=09goto cleanup_and_exit;
+=09}
+
+=09buf[bytes_read] =3D '\0';
+
+=09if (sscanf(buf, parse_format, value_ptr) !=3D 1) {
+=09=09lpmd_log_error("Failed to parse perf counter info %s\n", path);
+=09=09ret =3D -1;
+=09=09goto cleanup_and_exit;
+=09}
+
+=09ret =3D 0;
+
+cleanup_and_exit:
+=09if (fdmt >=3D 0)
+=09=09close(fdmt);
+
+=09return ret;
+}
+
+/* helper - pperf reading */
+static unsigned int read_perf_counter_info_n(const char *const path,
+=09=09=09=09=09     const char *const parse_format)
+{
+=09unsigned int v;
+=09int status;
+
+=09status =3D read_perf_counter_info(path, parse_format, &v);
+=09if (status)
+=09=09v =3D -1;
+
+=09return v;
+}
+
+/* helper - pperf reading */
+static int read_pperf_config(void)
+{
+=09const char *const path =3D "/sys/bus/event_source/devices/msr/events/pp=
erf";
+=09const char *const format =3D "event=3D%x";
+
+=09return read_perf_counter_info_n(path, format);
+}
+
+/* helper - pperf reading */
+static unsigned int read_aperf_config(void)
+{
+=09const char *const path =3D "/sys/bus/event_source/devices/msr/events/ap=
erf";
+=09const char *const format =3D "event=3D%x";
+
+=09return read_perf_counter_info_n(path, format);
+}
+
+/* helper - pperf reading */
+static unsigned int read_mperf_config(void)
+{
+=09const char *const path =3D "/sys/bus/event_source/devices/msr/events/mp=
erf";
+=09const char *const format =3D "event=3D%x";
+
+=09return read_perf_counter_info_n(path, format);
+}
+
+/* helper - pperf reading */
+static unsigned int read_msr_type(void)
+{
+=09const char *const path =3D "/sys/bus/event_source/devices/msr/type";
+=09const char *const format =3D "%u";
+
+=09return read_perf_counter_info_n(path, format);
+}
+
+/* helper - pperf reading */
+static long perf_event_open(struct perf_event_attr *hw_event, pid_t pid,
+=09=09=09    int cpu, int group_fd, unsigned long flags)
+{
+=09return syscall(__NR_perf_event_open, hw_event, pid, cpu, group_fd, flag=
s);
+}
+
+/* helper - pperf reading */
+static long open_perf_counter(int cpu, unsigned int type, unsigned int con=
fig,
+=09=09=09      int group_fd, __u64 read_format)
+{
+=09struct perf_event_attr attr;
+=09const pid_t pid =3D -1;
+=09const unsigned long flags =3D 0;
+
+=09memset(&attr, 0, sizeof(struct perf_event_attr));
+
+=09attr.type =3D type;
+=09attr.size =3D sizeof(struct perf_event_attr);
+=09attr.config =3D config;
+=09attr.disabled =3D 0;
+=09attr.sample_type =3D PERF_SAMPLE_IDENTIFIER;
+=09attr.read_format =3D read_format;
+
+=09const int fd =3D perf_event_open(&attr, pid, cpu, group_fd, flags);
+
+=09return fd;
+}
+
+/* helper - pperf reading */
+static void open_amperf_fd(int cpu)
+{
+=09const unsigned int msr_type =3D read_msr_type();
+=09const unsigned int aperf_config =3D read_aperf_config();
+=09const unsigned int mperf_config =3D read_mperf_config();
+=09const unsigned int pperf_config =3D read_pperf_config();
+
+=09perf_stats[cpu].aperf_fd =3D open_perf_counter(cpu, msr_type, aperf_con=
fig, -1, PERF_FORMAT_GROUP);
+=09perf_stats[cpu].mperf_fd =3D open_perf_counter(cpu, msr_type, mperf_con=
fig, perf_stats[cpu].aperf_fd, PERF_FORMAT_GROUP);
+=09perf_stats[cpu].pperf_fd =3D open_perf_counter(cpu, msr_type, pperf_con=
fig, perf_stats[cpu].aperf_fd, PERF_FORMAT_GROUP);
+}
+
+/* helper - pperf reading */
+static int get_amperf_fd(int cpu)
+{
+=09if (perf_stats[cpu].aperf_fd)
+=09=09return perf_stats[cpu].aperf_fd;
+
+=09open_amperf_fd(cpu);
+
+=09return perf_stats[cpu].aperf_fd;
+}
+
+/* helper - pperf reading */
+static unsigned long long rdtsc(void)
+{
+=09unsigned int low, high;
+
+=09asm volatile ("rdtsc" : "=3Da" (low), "=3Dd"(high));
+
+=09return low | ((unsigned long long)high) << 32;
+}
+
+/*
+ * Helper for - Reading APERF, MPERF and TSC using the perf API.
+ * Calc perf [cpu utilization per core] difference from MSR registers
+ */
+static int read_aperf_mperf_tsc_perf(struct thread_data *t, int cpu)
+{
+=09union {
+=09=09struct {
+=09=09=09unsigned long nr_entries;
+=09=09=09unsigned long aperf;
+=09=09=09unsigned long mperf;
+=09=09=09unsigned long pperf;
+=09=09};
+
+=09=09unsigned long as_array[4];
+=09} cnt;
+=09const int fd_amperf =3D get_amperf_fd(cpu);
+
+=09if (fd_amperf =3D=3D -1)
+=09=09return LPMD_ERROR;
+
+=09/*
+=09 * Read the TSC with rdtsc, because we want the absolute value and not
+=09 * the offset from the start of the counter.
+=09 */
+=09t->tsc =3D rdtsc();
+
+=09const int n =3D read(fd_amperf, &cnt.as_array[0], sizeof(cnt.as_array))=
;
+
+=09if (n !=3D sizeof(cnt.as_array))
+=09=09return -2;
+
+=09t->aperf =3D cnt.aperf;
+=09t->mperf =3D cnt.mperf;
+=09t->pperf =3D cnt.pperf;
+
+=09return LPMD_SUCCESS;
+}
+
+/* Calc perf [cpu utilization per core] difference from MSR registers */
+int update_perf_diffs(float *sum_norm_perf, int stat_init_only)
+{
+=09float max_load =3D 0, max_2nd_load =3D 0, max_3rd_load =3D 0, next_load=
 =3D 0;
+=09float min_load =3D 100.0, min_s0 =3D 1.0, next_s0 =3D 1.0;
+=09int t, min_s0_cpu =3D 0, first_pass =3D 1;
+=09struct thread_data tdata;
+=09int maxed_cpu =3D -1;
+
+=09for (t =3D 0; t < get_max_online_cpu(); t++) {
+=09=09if (!cpu_applicable(t, get_cur_state()))
+=09=09=09continue;
+
+=09=09/*reading through perf api*/
+=09=09if (read_aperf_mperf_tsc_perf(&tdata, t) !=3D LPMD_SUCCESS) {
+=09=09=09lpmd_log_error("read_aperf_mperf_tsc_perf failed for cpu =3D %d\n=
", t);
+=09=09=09continue;
+=09=09}
+=09=09perf_stats[t].pperf_diff =3D cpu_get_diff_pperf(tdata.pperf, t);
+=09=09perf_stats[t].aperf_diff =3D cpu_get_diff_aperf(tdata.aperf, t);
+=09=09perf_stats[t].mperf_diff =3D cpu_get_diff_mperf(tdata.mperf, t);
+=09=09perf_stats[t].tsc_diff =3D cpu_get_diff_tsc(tdata.tsc, t);
+
+=09=09if (stat_init_only)
+=09=09=09continue;
+
+=09=09/*
+=09=09 * Normalized perf metric defined as pperf per load per time.
+=09=09 * The rationale is detailed here:
+=09=09 * github.com/intel/psst >whitepapers >Generic_perf_per_watt.pdf
+=09=09 * Given that delta_load =3D delta_mperf/delta_tsc, we can rewrite
+=09=09 * as given below.
+=09=09 */
+=09=09if (perf_stats[t].tsc_diff) {
+=09=09=09next_load =3D (float)100 * perf_stats[t].mperf_diff /
+=09=09=09=09    perf_stats[t].tsc_diff;
+=09=09=09perf_stats[t].l0 =3D next_load;
+=09=09}
+
+=09=09if (A_LTE_B(max_load, next_load)) {
+=09=09=09max_load =3D next_load;
+=09=09=09maxed_cpu =3D perf_stats[t].cpu;
+=09=09} else if (A_LTE_B(max_2nd_load, next_load)) {
+=09=09=09max_2nd_load =3D next_load;
+=09=09} else if (A_LTE_B(max_3rd_load, next_load)) {
+=09=09=09max_3rd_load =3D next_load;
+=09=09}
+=09=09/* min scalability */
+=09=09if (perf_stats[t].aperf_diff) {
+=09=09=09next_s0 =3D (float)perf_stats[t].pperf_diff /
+=09=09=09=09  perf_stats[t].aperf_diff;
+=09=09=09/* since aperf/pperf are not read oneshot, ratio > 1 is not ruled=
 out */
+=09=09=09next_s0 =3D (next_s0 >=3D 1) ? (1 - EPSILON) : next_s0;
+=09=09}
+=09=09if (A_LTE_B(next_s0, min_s0) || first_pass) {
+=09=09=09min_s0 =3D next_s0;
+=09=09=09min_s0_cpu =3D perf_stats[t].cpu;
+=09=09}
+
+=09=09if (A_GT_B(min_load, next_load))
+=09=09=09min_load =3D next_load;
+
+=09=09first_pass =3D 0;
+=09}
+
+=09if (stat_init_only)
+=09=09return 0;
+
+=09grp.worst_stall =3D min_s0;
+=09grp.worst_stall_cpu =3D min_s0_cpu;
+
+=09grp.c0_max =3D max_load;
+=09grp.c0_2nd_max =3D max_2nd_load;
+=09grp.c0_3rd_max =3D max_3rd_load;
+=09grp.c0_min =3D min_load;
+
+=09return maxed_cpu;
+}
+
+/* close perf fd's */
+static void close_amperf_fd(int cpu)
+{
+=09if (perf_stats[cpu].aperf_fd)
+=09=09close(perf_stats[cpu].aperf_fd);
+=09if (perf_stats[cpu].mperf_fd)
+=09=09close(perf_stats[cpu].mperf_fd);
+=09if (perf_stats[cpu].pperf_fd)
+=09=09close(perf_stats[cpu].pperf_fd);
+}
+
+/* cleanup perf_stat structure */
+static void perf_stat_uninit(void)
+{
+=09int max_cpus =3D get_max_cpus();
+
+=09if (perf_stats) {
+=09=09for (size_t i =3D 0; i < max_cpus; ++i) {
+=09=09=09close_amperf_fd(i);
+=09=09=09memset(&perf_stats[i], 0, sizeof(struct perf_stats_t));
+=09=09}
+=09=09free(perf_stats);
+=09}
+}
+
+static void uninit_perf_calculations(void)
+{
+=09perf_stat_uninit();
+
+=09if (last_aperf)
+=09=09free(last_aperf);
+=09if (last_mperf)
+=09=09free(last_mperf);
+=09if (last_pperf)
+=09=09free(last_pperf);
+=09if (last_tsc)
+=09=09free(last_tsc);
+}
+
+/********************perf calculation - end ******************************=
***********/
+
+/********************SMA calculation - begin *****************************=
************/
+
+/* initialize avg calculation variables */
+static void init_sma_calculations(void)
+{
+=09for (int i =3D 0; i < SMA_CPU_COUNT; i++) {
+=09=09grp.sma_sum[i] =3D -1;
+=09=09for (int j =3D 0; j < SMA_LENGTH; j++)
+=09=09=09sample[i][j] =3D 0;
+=09}
+=09grp.sma_pos =3D -1;
+}
+
+/* Helper avg calculation */
+static int do_sum(int *sam, int len)
+{
+=09int sum =3D 0;
+
+=09for (int i =3D 0; i < len; i++)
+=09=09sum +=3D sam[i];
+=09return sum;
+}
+
+/* average cpu usage */
+int state_max_avg(void)
+{
+=09grp.sma_pos +=3D 1;
+
+=09int v1 =3D (int)round(grp.c0_max * SCALE_DECIMAL);
+=09int v2 =3D (int)round(grp.c0_2nd_max * SCALE_DECIMAL);
+=09int v3 =3D (int)round(grp.c0_3rd_max * SCALE_DECIMAL);
+
+=09if (grp.sma_pos =3D=3D SMA_LENGTH)
+=09=09grp.sma_pos =3D 0;
+=09if (grp.sma_sum[0] =3D=3D -1) {
+=09=09sample[0][grp.sma_pos] =3D v1;
+=09=09sample[1][grp.sma_pos] =3D v2;
+=09=09sample[2][grp.sma_pos] =3D v3;
+=09=09if (grp.sma_pos =3D=3D SMA_LENGTH - 1) {
+=09=09=09grp.sma_sum[0] =3D do_sum(sample[0], SMA_LENGTH);
+=09=09=09grp.sma_sum[1] =3D do_sum(sample[1], SMA_LENGTH);
+=09=09=09grp.sma_sum[2] =3D do_sum(sample[2], SMA_LENGTH);
+=09=09}
+=09} else {
+=09=09grp.sma_sum[0] =3D grp.sma_sum[0] - sample[0][grp.sma_pos] + v1;
+=09=09grp.sma_sum[1] =3D grp.sma_sum[1] - sample[1][grp.sma_pos] + v2;
+=09=09grp.sma_sum[2] =3D grp.sma_sum[2] - sample[2][grp.sma_pos] + v3;
+=09=09sample[0][grp.sma_pos] =3D v1;
+=09=09sample[1][grp.sma_pos] =3D v2;
+=09=09sample[2][grp.sma_pos] =3D v3;
+=09}
+
+=09grp.sma_avg1 =3D (int)round((double)grp.sma_sum[0] /
+=09=09=09=09  (double)(SMA_LENGTH * SCALE_DECIMAL));
+=09grp.sma_avg2 =3D (int)round((double)grp.sma_sum[1] /
+=09=09=09=09  (double)(SMA_LENGTH * SCALE_DECIMAL));
+=09grp.sma_avg3 =3D (int)round((double)grp.sma_sum[2] /
+=09=09=09=09  (double)(SMA_LENGTH * SCALE_DECIMAL));
+
+=09return 1;
+}
+
+/********************SMA calculation - end *******************************=
**********/
+
+/* return multi threaded false if at least one cpu is under utilizied */
+int max_mt_detected(enum state_idx state)
+{
+=09for (int t =3D 0; t < get_max_online_cpu(); t++) {
+=09=09if (!cpu_applicable(t, state))
+=09=09=09continue;
+
+=09=09if A_LTE_B(perf_stats[t].l0, (UTIL_LOW))
+=09=09=09return 0;
+=09}
+=09return 1;
+}
+
+/* initialize */
+int util_init_proxy(void)
+{
+=09float dummy;
+
+=09if (init_perf_calculations(get_max_online_cpu()) < 0) {
+=09=09lpmd_log_error("WLT_Proxy: error initializing perf calculations");
+=09=09return LPMD_ERROR;
+=09}
+
+=09update_perf_diffs(&dummy, 1);
+
+=09init_sma_calculations();
+
+=09return LPMD_SUCCESS;
+}
+
+/* cleanup */
+void util_uninit_proxy(void)
+{
+=09uninit_perf_calculations();
+=09uninit_state_manager();
+}
diff --git a/tools/power/x86/intel-lpmd/src/wlt_proxy/wlt_proxy.c b/tools/p=
ower/x86/intel-lpmd/src/wlt_proxy/wlt_proxy.c
new file mode 100644
index 000000000000..04e815eec491
--- /dev/null
+++ b/tools/power/x86/intel-lpmd/src/wlt_proxy/wlt_proxy.c
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include "lpmd.h" //wlt_type
+#include "state_common.h"
+
+/* wlt_proxy polling interval - updated at every state change */
+int next_proxy_poll =3D 1000;
+
+/* wlt_proxy hint - updated at every state change */
+int wlt_type =3D WLT_IDLE;
+
+/* called at the configured interval to take action; return next interval =
and workload type*/
+int read_wlt_proxy(int *interval)
+{
+=09state_machine_auto();
+=09*interval =3D next_proxy_poll;
+
+=09return wlt_type;
+}
+
+/* Returns success if proxy supported on platform */
+int wlt_proxy_init(void)
+{
+=09return util_init_proxy();
+}
+
+/* make sure all resource are properly released and closed */
+void wlt_proxy_uninit(void)
+{
+=09util_uninit_proxy();
+}
diff --git a/tools/power/x86/intel-lpmd/tests/lpm_test_interface.sh b/tools=
/power/x86/intel-lpmd/tests/lpm_test_interface.sh
new file mode 100755
index 000000000000..2371b551e5d3
--- /dev/null
+++ b/tools/power/x86/intel-lpmd/tests/lpm_test_interface.sh
@@ -0,0 +1,64 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0-only
+# Copyright (C) 2026 Intel Corporation
+
+if [ "$(whoami)" !=3D "root" ]
+then
+=09echo "This script must be run as root"
+=09exit 1
+fi
+
+opt_no=3D
+if [ ! -z "$1" ]
+then
+        opt_no=3D$1
+fi
+
+while true;
+do
+=09if [ -z "$1" ]
+=09then
+=09=09echo "****options****"
+=09=09echo "0 : Allow All CPUs"
+=09=09echo "1 : Terminate"
+=09=09echo "2 : LPM force on"
+=09=09echo "3 : LPM force off"
+=09=09echo "4 : LPM auto"
+=09=09echo "5 : Quit"
+=09        echo -n " Enter choice: "
+=09        read opt_no
+=09fi
+
+=09case $opt_no in
+=090)
+=09=09echo "0 : Allow All CPUs"
+=09=09echo -n " Enter Maximum CPU number"
+=09=09read max_cpu
+=09=09sudo systemctl set-property --runtime user.slice AllowedCPUs=3D0-$ma=
x_cpu
+=09=09sudo systemctl set-property --runtime system.slice AllowedCPUs=3D0-$=
max_cpu
+=09=09;;
+=091)
+=09=09echo "1 : Terminate"
+=09=09dbus-send --system --dest=3Dorg.freedesktop.intel_lpmd --print-reply=
 /org/freedesktop/intel_lpmd org.freedesktop.intel_lpmd.Terminate
+=09=09;;
+=092)
+=09=09echo "2 : LPM force on"
+=09=09dbus-send --system --dest=3Dorg.freedesktop.intel_lpmd --print-reply=
 /org/freedesktop/intel_lpmd org.freedesktop.intel_lpmd.LPM_FORCE_ON
+=09=09;;
+=093)
+=09=09echo "3 : LPM force off"
+=09=09dbus-send --system --dest=3Dorg.freedesktop.intel_lpmd --print-reply=
 /org/freedesktop/intel_lpmd org.freedesktop.intel_lpmd.LPM_FORCE_OFF
+=09=09;;
+=094)
+=09=09echo "4 : LPM auto"
+=09=09dbus-send --system --dest=3Dorg.freedesktop.intel_lpmd --print-reply=
 /org/freedesktop/intel_lpmd org.freedesktop.intel_lpmd.LPM_AUTO
+=09=09;;
+=095)
+=09=09exit 0
+=09=09;;
+=09*)
+=09=09echo "5 : Quit"
+=09=09echo "Invalid option"
+=09esac
+=09[ ! -z "$1" ] && break
+done
diff --git a/tools/power/x86/intel-lpmd/tools/intel_lpmd_control.c b/tools/=
power/x86/intel-lpmd/tools/intel_lpmd_control.c
new file mode 100644
index 000000000000..c69b144bdadb
--- /dev/null
+++ b/tools/power/x86/intel-lpmd/tools/intel_lpmd_control.c
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (C) 2026 Intel Corporation */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <sys/types.h>
+
+#include <glib.h>
+#include <glib/gprintf.h>
+
+#include <gio/gio.h>
+#include <gio/gdbusmessage.h>
+
+#define INTEL_LPMD_SERVICE_NAME         "org.freedesktop.intel_lpmd"
+#define INTEL_LPMD_SERVICE_OBJECT_PATH  "/org/freedesktop/intel_lpmd"
+#define INTEL_LPMD_SERVICE_INTERFACE    "org.freedesktop.intel_lpmd"
+
+int main(int argc, char **argv)
+{
+=09g_autoptr(GDBusConnection) connection =3D NULL;
+=09g_autoptr(GString) command =3D NULL;
+=09g_autoptr(GVariant) result =3D NULL;
+=09GError *error =3D NULL;
+=09const gchar *state;
+
+=09if (geteuid()) {
+=09=09g_warning("Must run as root");
+=09=09exit(1);
+=09}
+
+=09if (argc < 2) {
+=09=09fprintf(stderr, "intel_lpmd_control: missing control command\n");
+=09=09fprintf(stderr, "syntax:\n");
+=09=09fprintf(stderr, "intel_lpmd_control ON|OFF|AUTO|STATUS\n");
+=09=09exit(0);
+=09}
+
+=09connection =3D g_bus_get_sync(G_BUS_TYPE_SYSTEM, NULL, &error);
+=09if (!connection)
+=09=09return FALSE;
+
+=09if (!strncmp(argv[1], "STATUS", 6)) {
+=09=09result =3D g_dbus_connection_call_sync(connection,
+=09=09=09=09=09=09     INTEL_LPMD_SERVICE_NAME,
+=09=09=09=09=09=09     INTEL_LPMD_SERVICE_OBJECT_PATH,
+=09=09=09=09=09=09     INTEL_LPMD_SERVICE_INTERFACE,
+=09=09=09=09=09=09     "GetState",
+=09=09=09=09=09=09     NULL,
+=09=09=09=09=09=09     G_VARIANT_TYPE("(s)"),
+=09=09=09=09=09=09     G_DBUS_CALL_FLAGS_NONE,
+=09=09=09=09=09=09     -1,
+=09=09=09=09=09=09     NULL,
+=09=09=09=09=09=09     &error);
+
+=09=09if (error) {
+=09=09=09g_warning("Fail on connecting lpmd: %s", error->message);
+=09=09=09exit(1);
+=09=09}
+
+=09=09g_variant_get(result, "(&s)", &state);
+=09=09g_print("%s\n", state);
+
+=09=09return 0;
+=09}
+
+=09if (!strncmp(argv[1], "ON", 2)) {
+=09=09command =3D g_string_new("LPM_FORCE_ON");
+=09} else if (!strncmp(argv[1], "OFF", 3)) {
+=09=09command =3D g_string_new("LPM_FORCE_OFF");
+=09} else if (!strncmp(argv[1], "AUTO", 4)) {
+=09=09command =3D g_string_new("LPM_AUTO");
+=09} else {
+=09=09g_warning("intel_lpmd_control: Invalid command");
+=09=09exit(1);
+=09}
+
+=09g_dbus_connection_call_sync(connection,
+=09=09=09=09    INTEL_LPMD_SERVICE_NAME,
+=09=09=09=09    INTEL_LPMD_SERVICE_OBJECT_PATH,
+=09=09=09=09    INTEL_LPMD_SERVICE_INTERFACE,
+=09=09=09=09    command->str,
+=09=09=09=09    NULL,
+=09=09=09=09    NULL,
+=09=09=09=09    G_DBUS_CALL_FLAGS_NONE,
+=09=09=09=09    -1,
+=09=09=09=09    NULL,
+=09=09=09=09    &error);
+
+=09if (error) {
+=09=09g_warning("Fail on connecting lpmd: %s", error->message);
+=09=09exit(1);
+=09}
+
+=09return 0;
+}
--=20
2.53.0


