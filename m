Received: from mail-106120.protonmail.ch (mail-106120.protonmail.ch [79.135.106.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006BC4963AB
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 08:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778575257; cv=none; b=R9AuGPypuaqYh5XhuTW94BKIkfvxDpVjQEhVsh+SK8JvgcuJUlSxH6TZPmQfcRGz8H2C/1D5zI3atSuXcvQqRjGQFAedVRtpKUGwhXz/dgn9Mf9GWoqd94KDIEsZlgKKMrd9ipiHETeECreSDeAK7nzG/lCuwdCWQQHTE7QsVuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778575257; c=relaxed/simple;
	bh=Hav2E2bid6gjY1+YPA2luxbaDGNu1MqlX+OUV/ty2cw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RHqUGIkAVVj3pvTYkgNlFNB8Qp/08Ibwk1VB9oPrTTVmWXaLoNPoQ0tgeUpkxFN41H9yZrXn+V3F4/kMLahtUNZ8p3NesNBdF9RzCfvsbSnVZl90/BrNENJvKHd1sHx98sRaaQk529hZbYcZuibr/Npn0hE1qs7voC6X8i/knMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=RKgq1t3M; arc=none smtp.client-ip=79.135.106.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="RKgq1t3M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1778575244; x=1778834444;
	bh=4gLCcbBFiFpZ4Zatky/DyP5thont4W1FOaP1QH6DD94=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=RKgq1t3MVRX6NSC/kI6AlPqhgQ/GAOQkgFyvjCYcRl/9bLDq9ifeJz/vv2jSz89/L
	 q/YZtjxUMGXu/8IJJ1Qi+SSQ8V5nn87zUrzX5w6JY0YnsiZbyKsJ4lxas714uUzEYF
	 tLKbGhG+/t/FTJ0tlXzyDodJr8fDrWmmqu3sgc5L78DuxcPSyn1E+xzwb3MUbKBhuk
	 xoYmoIMTJV8QqI9DrGIkWrAkWD+p8rFi0dYG8kXePX3Co84MgPYosffHp6CtxW4ywK
	 4HQctJbImPxADwxS/F4xwRFfetkY3ouYELULP1rth1EAmBEejz3CGLYoV6Gr+dEllq
	 YqUVJPg4/aX0w==
Date: Tue, 12 May 2026 08:40:37 +0000
To: srinivas.pandruvada@linux.intel.com, fabio.m.de.francesco@linux.intel.com, rafael@kernel.org
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: noor.u.mubeen@intel.com, vinod.gomathinayagam@intel.com, deepak.sundar@intel.com, mohsin.shariff@intel.com, kloczek@github.com, xiaqinxin@huawei.com, jack@jackkelly.name, rui.zhang@intel.com, baohua@kernel.org, colin.i.king@gmail.com, libin3479@gmail.com, m.szyprowski@samsung.com, ali.erdinc.koroglu@intel.com, admin@ptr1337.dev, maciej.wieczor-retman@intel.com, venkatesh.j@intel.com, ThatQubicFox@protonmail.com, trenn@suse.de, jengelh@inai.de, robert.dower@intel.com, hpa@redhat.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, m.wieczorretman@pm.me
Subject: [PATCH v1 3/3] tools: Add LPMD entry to tools Makefile
Message-ID: <d1cff1c7e79f141049d952a006c0dcecbb954b5e.1778560215.git.m.wieczorretman@pm.me>
In-Reply-To: <cover.1778560215.git.m.wieczorretman@pm.me>
References: <cover.1778560215.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 7a9f53bf89819dd5634147b7f9e5311481cf77f8
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>

Make LPMD buildable from the tools/power/x86/intel-lpmd directory.

Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>
Tested-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
 tools/Makefile | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/tools/Makefile b/tools/Makefile
index cb40961a740f..fe4a31a9075e 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -21,6 +21,7 @@ help:
 =09@echo '  gpio                   - GPIO tools'
 =09@echo '  hv                     - tools used when in Hyper-V clients'
 =09@echo '  iio                    - IIO tools'
+=09@echo '  intel-lpmd             - Intel Low Power Mode Daemon tool'
 =09@echo '  intel-speed-select     - Intel Speed Select tool'
 =09@echo '  kvm_stat               - top-like utility for displaying kvm s=
tatistics'
 =09@echo '  leds                   - LEDs  tools'
@@ -102,7 +103,7 @@ selftests: FORCE
 thermal: FORCE
 =09$(call descend,lib/$@)
=20
-turbostat x86_energy_perf_policy intel-speed-select: FORCE
+turbostat x86_energy_perf_policy intel-lpmd intel-speed-select: FORCE
 =09$(call descend,power/x86/$@)
=20
 tmon: FORCE
@@ -144,7 +145,7 @@ selftests_install:
 thermal_install:
 =09$(call descend,lib/$(@:_install=3D),install)
=20
-turbostat_install x86_energy_perf_policy_install intel-speed-select_instal=
l:
+turbostat_install x86_energy_perf_policy_install intel-lpmd_install intel-=
speed-select_install:
 =09$(call descend,power/x86/$(@:_install=3D),install)
=20
 tmon_install:
@@ -170,7 +171,7 @@ install: acpi_install counter_install cpupower_install =
dma_install gpio_install
 =09=09perf_install selftests_install turbostat_install usb_install \
 =09=09virtio_install mm_install bpf_install x86_energy_perf_policy_install=
 \
 =09=09tmon_install freefall_install objtool_install kvm_stat_install \
-=09=09wmi_install debugging_install intel-speed-select_install \
+=09=09wmi_install debugging_install intel-lpmd_install intel-speed-select_=
install \
 =09=09tracing_install thermometer_install thermal-engine_install ynl_insta=
ll
=20
 acpi_clean:
@@ -204,7 +205,7 @@ selftests_clean:
 thermal_clean:
 =09$(call descend,lib/thermal,clean)
=20
-turbostat_clean x86_energy_perf_policy_clean intel-speed-select_clean:
+turbostat_clean x86_energy_perf_policy_clean intel-lpmd_clean intel-speed-=
select_clean:
 =09$(call descend,power/x86/$(@:_clean=3D),clean)
=20
 thermometer_clean:
@@ -230,7 +231,7 @@ clean: acpi_clean counter_clean cpupower_clean dma_clea=
n hv_clean firewire_clean
 =09=09mm_clean bpf_clean iio_clean x86_energy_perf_policy_clean tmon_clean=
 \
 =09=09freefall_clean build_clean libbpf_clean libsubcmd_clean \
 =09=09gpio_clean objtool_clean leds_clean wmi_clean firmware_clean debuggi=
ng_clean \
-=09=09intel-speed-select_clean tracing_clean thermal_clean thermometer_cle=
an thermal-engine_clean \
-=09=09sched_ext_clean ynl_clean
+=09=09intel-lpmd_clean intel-speed-select_clean tracing_clean thermal_clea=
n \
+=09=09thermometer_clean thermal-engine_clean sched_ext_clean ynl_clean
=20
 .PHONY: FORCE
--=20
2.53.0


