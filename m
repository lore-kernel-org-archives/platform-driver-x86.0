Received: from mail-106120.protonmail.ch (mail-106120.protonmail.ch [79.135.106.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12624968E2
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 08:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778575223; cv=none; b=IYngPuHAflw7K/tj/spMGmrO5L4DtkfYwGznKCuaGEQC+fl3W8xwvP9DChacCAVWE4GbsEkpcNI8d9nS2SxbYc3LSp+KwSUDgmiNU3usgyvk02W/TfjcaJghzIgFkb09pnAZlGoXZ+omJUqd//A93Vq4WS9K0sTbJVTMlatD+n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778575223; c=relaxed/simple;
	bh=7s0x2ZAjMb60R/Nz70gnKq+iFd9SV9PiQbcevthSPWo=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=axJY8thMeqNnouPbg3VNsf0zRDCkU6lVAqf6QF9DwZb/zfuvmCROSTLnEaON8t6uLPvFreRpZL5goe+zDX86AbvfNrWPBQ88Yx8bq4jeCoLPwzSMDKc2Y6XwM+6GxwhiNV8BzlR7a8KOtDSEnTzY/DKsQWi+0Rh4Q583Yu+Pcj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=avpr3O+Z; arc=none smtp.client-ip=79.135.106.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="avpr3O+Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1778575208; x=1778834408;
	bh=nNknJ0wreFoOw4YJcjJLl4/H8DuJKDXsq5Az/XPAe9A=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=avpr3O+Z31aGeueqcTKwJkTc6XHNC04114lmEkpuNlO85cgdUQSwHbQd+YYm1Bgul
	 Fb8VY8UtkJxgCo6dbJmgzSedBGR4wtdxKl1Nx4ZQHSc61fpwGh9K3r0ZFMLv1ZLU90
	 1cOdjQrtc7gWVa5G7jBOka5PwnOfrZnBUl83dzpEoLP86mSMWUl1zanRa/35VQgrG4
	 3tdeZLs9MhHsng5h0PqdyTYqhtphUWbpNm2iU3oosGLD0eIkjHKgHZV4Bktchp2zLN
	 zbtnxqLIGtyIhSUODqjSGvkxT3gwENhSbITe0VdAbGYiaCfgU5z7IwXKi9A4qgHlL9
	 lULZNbmD7mbTw==
Date: Tue, 12 May 2026 08:40:00 +0000
To: srinivas.pandruvada@linux.intel.com, fabio.m.de.francesco@linux.intel.com, rafael@kernel.org
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: noor.u.mubeen@intel.com, vinod.gomathinayagam@intel.com, deepak.sundar@intel.com, mohsin.shariff@intel.com, kloczek@github.com, xiaqinxin@huawei.com, jack@jackkelly.name, rui.zhang@intel.com, baohua@kernel.org, colin.i.king@gmail.com, libin3479@gmail.com, m.szyprowski@samsung.com, ali.erdinc.koroglu@intel.com, admin@ptr1337.dev, maciej.wieczor-retman@intel.com, venkatesh.j@intel.com, ThatQubicFox@protonmail.com, trenn@suse.de, jengelh@inai.de, robert.dower@intel.com, hpa@redhat.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, m.wieczorretman@pm.me
Subject: [PATCH v1 0/3] tools: Add intel-lpmd to the kernel tools
Message-ID: <cover.1778560215.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: d15a0b409cb2f1b9b2231ee057b1fe16bcc07089
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

LPMD (Low Power Mode Daemon) [1] is a program that helps increase
mobile platform power efficiency based on current workload and user
configuration. On newer systems hardware hints guide the decision
making while on older ones software calculated system utilization can be
used.

Depending on the workload LPMD manages active CPUs through cgroups,
and if available balances different sysfs knobs and sliders to get the
most power efficient result. Special emphasis is put on L-cores - low
power CPUs management to get the most value out of newer hardware that
supports such distinction.

Moving the development of LPMD to the kernel tree can increase it's
effectiveness through maintaining higher quality standards and better
community cooperation.

Notable differences between this patchset and the github version [1] are
 - reformatting the whole codebase in kernel coding style
 - the autogen system is dropped in favour of a simpler Makefile

Other than that no functional changes should be introduced in
comparison.

[1] https://github.com/intel/intel-lpmd

Fabio M. De Francesco (3):
  tools/LPMD: Add Intel Low Power Mode Daemon
  tools/LPMD: Add Makefile
  tools: Add LPMD entry to tools Makefile

 MAINTAINERS                                   |   6 +
 tools/Makefile                                |  13 +-
 tools/power/x86/intel-lpmd/Makefile           | 155 ++++
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
 46 files changed, 10050 insertions(+), 6 deletions(-)
 create mode 100644 tools/power/x86/intel-lpmd/Makefile
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

--=20
2.53.0


