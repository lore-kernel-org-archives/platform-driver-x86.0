Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32BD485502
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2026 07:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792395589; cv=none; b=dLQ2OGykZIlEW3WwDJQcX8M3n/KVOL+ar2u1HDEUeyi4MFGA7yplP7z5DP3Z4gaqDqkkBVai/l2oPgbpgd8giF/8yYh1KnnJGN/Tpekq4ZlnNJEf/IwMG3IayM/UEP7T/WR363boMRSWtmYLi1KBmFijMF2gPvSDMwZlKgfBKGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792395589; c=relaxed/simple;
	bh=yz4lJFXfnCvivh5u3WgrrKBoFX/q1Aj9vf6TrdyCCAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n2zFBuUraM4HA1nITavqVi+0Qlq9xu99NzOU3G06LhfLKEVcmeV0tV5YKoznLab2wcD/yOJTGOMEyvnsX5DADklFO01JBGESHyyrpCYSPe6xpnrrGuEdxBabRJnasRBKWbsncg/Vez4AxBY0Xd8qRvxk98imHkl/nYrqNNETK/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C238QT1e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Op/f9br6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C238QT1e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Op/f9br6"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J4j0NA683100
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2026 07:39:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3NMXRZIAXbN5ubrRHl91nXjcVJSySD2IW/I
	R9E3UOe4=; b=C238QT1elCSY0/EfsJ70mCUZII1KnsFYqXmqhQPaXvfu9ga1yue
	L/VpyjyY8y9/Esgw9BWDSKhFFlnl4UtJoyPKDKqJzmSpe9AI0sP1R2CeAO+ODU7L
	b7G9SdjV67UWkAbEii9qjO3zj/xM2SHDNfPHZdjp2kliGOnwEkVN+zKCPexud08r
	ABlOSRAsN2KKh4Q9LsxlXrQwcTD0Wd67SfO7cfklLWo1+Ctx6dhiVuADOP+HJxyc
	RXP2QlN41wnjY7Nh13OZrlkaxBc2HRvriRdkJhMCrxHhwn9D6ay2gPszEqvt4ZRe
	W3+kbUi9YnVGzVgCWQdIQ24sWpTqvcrnA7A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc1d7wgfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2026 07:39:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f20addba1so348668385a.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2026 00:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792395584; x=1793000384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3NMXRZIAXbN5ubrRHl91nXjcVJSySD2IW/IR9E3UOe4=;
        b=Op/f9br6vBhEW/qEQFnpD+YToS0gBYoJ2lduESdHlLCJ0GwzyYM8kxjvesgwOTfquo
         S5swvjYR503oypvPCEKbF0Bf1ilwSBSoRGUTQkiy3A5A/Gc1z93185QmdANT28Y/mPPx
         DcTzzZzOjrLrX7Vahl5I71EPHbVxdfXrm5YwQoAqfuys116oZbw6bcP+F68CTXFsRyv1
         dbeF+1s6wuTzjBDp9orSM8CLLFmkStW+bFxHV5dp8Iz3hQjQ9QSDUvRHIqpCFOORhD4I
         pN8dxhC3/S6Q+Nx3YRyX7ZhMRTINCHWv1O1oFWTTR2rZyWyqrVb7jf48PR4yWkrZ1/9B
         AEVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792395584; x=1793000384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3NMXRZIAXbN5ubrRHl91nXjcVJSySD2IW/IR9E3UOe4=;
        b=Q+BuaDbLF071PVboYpCqU3s8W2CU2DVo+qTsfwzOaj7aar+IOXFXaMOI/6trLhgH9y
         cAT+Ux2AppJuteJwCVPjPWFcNVSxuV7rCpLcyx6/BXbyZRMoUsAqqocY/77x3xuxQyYo
         UPjlCkqVSdCi/sGB7Iuq7AW5LV65xIzV6qiaAgXV/h5y/A/+XluR0blTImlSjqpRoydl
         hI20WilmnNZmdMiWvjT5U5R8wAfknfjq09j15uForsNei5BzLIz3aFSHtMdeKMfi5Ftj
         5tPr/tc3ExlZGVTFZdhDsJ0XpYoceGk33Fl828Gk2W7DS5p7dm/F+sVpBs95Obhfnuh6
         e8uA==
X-Forwarded-Encrypted: i=1; AKwUvBwUjDy6hcPGuZzeqbkhsQoXt/Nbz5TLf+QZjCYDWuCSr29yMAKzODF5FAIcBT2P6VYXCL1pNOjpMbrKyl8dY0NP5r49@vger.kernel.org
X-Gm-Message-State: AFq9FYKUofLJJxmkxwIgcL5f+T1MYu1aJWLw3zRW4wF0EughybOBtbQs
	+tmD3aMWknn/itk/du2DgX4FTppOFDjDY39LFKBDsChcEGmhkdp5kjMTeswQkd3SwoiSkZ+BZTQ
	TiD8FlCV4R1m7RE1I/D7i4cP486ziA/Z5f9Tw2eIcAGCQC/lvPJL1HYrCSRH5iW0g+AILbEjvZQ
	nCCj5OQRAZ
X-Gm-Gg: AYBFou1SG1CJUZ1Z2QucROMAj4THj5rHHxy0rg0q2S4Wok/FaQc5X8Iq0C7hbfwtF8S
	7PTq0R78awBUeDO8Pug4DLqaiZa42bpAziSADVCNk4OCeQV3iT3a08NmHBtYsy77XOmgCXjsEIh
	IuEJjoP09XOowFPweWfvV0Umv48OFse1g7gQSE3B0kdYH4W2uDnrsxNbuSyngboJ+QeWADZi1yX
	y+K3xuTnU2HJPvTqQPU9eLUPjeNyohAvgCifKzLGipo9THAixyqu+OadBzU+5qKP+JmY09+sMk+
	ky5J0chf3OUkQyuMNcryZyNOLe2vf8JQImcYd40Nk4vJPkFUG1vaa28WVjU8cJKPJ2L4hFUt2xb
	AILJ6a3jAEczCLhW/TU3GupghfQw=
X-Received: by 2002:a05:620a:27d0:b0:93f:1936:b229 with SMTP id af79cd13be357-93f29dbec24mr1027625185a.77.1792395583811;
        Mon, 19 Oct 2026 00:39:43 -0700 (PDT)
X-Received: by 2002:a05:620a:27d0:b0:93f:1936:b229 with SMTP id af79cd13be357-93f29dbec24mr1027621985a.77.1792395583305;
        Mon, 19 Oct 2026 00:39:43 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:d01d:2002:4b7d:4c30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce325107sm212812955e9.3.2026.10.19.00.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 00:39:42 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: Len Brown <lenb@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Mark Pearson <mpearson-lenovo@squebb.ca>,
        "Derek J. Clark" <derekjohn.clark@gmail.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Armin Wolf <W_Armin@gmx.de>, Jai Luthra <jai.luthra@ideasonboard.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Mario Limonciello (AMD)" <superm1@kernel.org>,
        Jack Wu <jackbb_wu@compal.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Zhang DM <jixianqiang1540@gmail.com>, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-pm@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 0/5] Make platform profiles firmware independent
Date: Mon, 19 Oct 2026 09:39:03 +0200
Message-ID: <20261019073930.2352283-1-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzMCBTYWx0ZWRfX9sgjDpDBojFw
 6zt5vbqTbN1RBV/MGKTsZ/91OMXlcQ4Ca0Hhfu55SzUkIgFgvRNIbnk+8ipnEo+tsNCDLrqjiUK
 i0WCCJ4TI5M4kfFy08W1kZD9QoXeVlY=
X-Proofpoint-ORIG-GUID: bHwuY7nmqlcdu_31dSskCPOnqmYrUxXs
X-Proofpoint-GUID: bHwuY7nmqlcdu_31dSskCPOnqmYrUxXs
X-Authority-Analysis: v=2.4 cv=K4O3jCWI c=1 sm=1 tr=0 ts=6ad5c940 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=Jz4pyKl_ZvpwoOR9CwoA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzMCBTYWx0ZWRfX+VL8f3oRTqUT
 DRgNgO/Dd0PS7fzGUlBocE3IQVG+27hPJXH2NSl/AAhLsMVf6TeZsJv0bYq+OscO2yvisTE7nSD
 rg2vuNABO/59cqhzdvllsPQCHtMJT0UqFucQ4QxX75HrlGrmIFnXnLTuMqlgtgvM3f3m4vjYyrk
 906q4eQF+9KKwei4/vUVPK4gGZFsGdo7t7ZLD5kiiJBBCAEL/SExpbNgQWq91G1lt5mnrXTxXgp
 CTnnedV+ekuNWQnz2Jq+Ahzy2r4YlIsdz4+qEYGPhG4NCuoegSuDHrlRh2+zw/7+hYqjpusoeFl
 lg3xOsRcuNBWOKIUfLGQCaVhqQeEj8D38CnMDZ6OaisqBH9+wVNUUWj38RTZxC54xUq/kQ+uAth
 DWYPIamhSrmMMMPuBi1ZTLP0mMqs70I03jugrfbEvShAQitGSJnIU2Ke3FSptBn7cw+SDlgdI1l
 7EsZUbdAqTJ1Yr0n0AQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190030

Make platform profile selection independent of ACPI firmware.

The provider API already uses struct device, profile enums and callbacks;
it does not require an ACPI handle or firmware node. However, the core is
built under drivers/acpi/, its Kconfig symbol depends implicitly on ACPI,
and initialization fails when ACPI is disabled, preventing non-ACPI
providers from using the existing firmware-independent class interface.

This series moves the core to drivers/platform/profile/ and introduces
CONFIG_PLATFORM_PROFILE, updating all existing provider selectors. It
retains the tristate configuration and platform_profile module name.
Firmware-specific discovery and profile operations remain with providers.
The core can also be selected directly through its Kconfig prompt.

An optional ACPI adapter obtains the legacy sysfs kobject and is linked
into the same module. The generic core contains no ACPI types or symbols
and initializes without ACPI support or with ACPI disabled at boot.
The existing /sys/firmware/acpi/platform_profile and
/sys/firmware/acpi/platform_profile_choices attributes remain available
on active ACPI systems.

CONFIG_PLATFORM_PROFILE_LEGACY controls the backwards-compatible aggregate
sysfs interface. It defaults to enabled to preserve existing userspace.
Disabling it omits the legacy sysfs callbacks and ACPI adapter while
retaining class devices and kernel profile cycling. New userspace should
discover and control individual class devices instead.
The interface is deprecated, with removal intended after the 2028 LTS
kernel once userspace migration is complete. A shared pr_notice_once()
warns on legacy attribute access rather than on merely loading the core.
The default remains enabled while userspace adopts released class-device
support; this series does not claim that ecosystem migration is complete.

The existing firmware-independent interface remains:

  /sys/class/platform-profile/platform-profile-X/name
  /sys/class/platform-profile/platform-profile-X/choices
  /sys/class/platform-profile/platform-profile-X/profile

Non-ACPI userspace controls providers individually through these class
devices. Aggregate selection remains available through the legacy ACPI
attributes, and aggregate profile cycling remains available to kernel
callers. No new sysfs directory or userspace ABI is introduced.

The first patch fixes the lock/lifetime boundary: sysfs teardown must not
drain callbacks while holding the mutex those callbacks need. A separate
registration mutex serializes lifecycle
changes, while a profile-lock-protected handler list determines aggregate
membership independently of the class device's teardown state.

The second patch extracts the core and uses subsys_initcall_sync() so it
initializes after ACPI and before built-in thermal and CPUFreq consumers.
The third completes notifications on direct class-device writes and
restores aggregate visibility after registration failure. The fourth
documents the existing interfaces and extends maintainer coverage.
The fifth makes the legacy ACPI aggregate interface optional.

Validation:

  - ARM64 built-in core with CONFIG_ACPI=n: W=1 build and sparse.
  - x86 modular core with CONFIG_ACPI=y: W=1 object build and sparse.
    Both CONFIG_PLATFORM_PROFILE_LEGACY=y and =n are covered.
  - Full x86 kernel link and QEMU boot with lockdep and list debugging,
    with active ACPI and with acpi=off.
  - Firmware-less providers exercising common and hidden choices,
    profile reads/writes, invalid input, mixed profiles, cycling,
    partial callback failures and POLLPRI on the class and legacy ACPI
    interfaces. With acpi=off, class get/set, notifications and kernel
    cycling are exercised. Both runs check that no new aggregate sysfs
    directory is created.
  - Concurrent sysfs I/O with two persistent providers while a third
    provider is registered and removed 200 times, last-provider attribute
    removal and repeated provider module reloads.
  - QEMU with active ACPI and CONFIG_PLATFORM_PROFILE_LEGACY=n: verify
    the legacy attributes are absent, class get/set and notifications
    work, and kernel cycling and registration/removal stress pass.

The provider API and profile names are unchanged. Aggregate writes retain
their sequential, non-transactional behavior: a failing callback does not
roll back providers already updated.

Changes in v2:
  - Add the Fixes tag to patch 1 and explain how the mutex-guard conversion
    reintroduced the teardown deadlock previously fixed in 041142d7d252,
    and how class-device support subsequently extended the affected paths.
  - Drop the proposed /sys/kernel/platform_profile/ aggregate interface
    and its ABI documentation. Use the existing firmware-independent
    /sys/class/platform-profile/platform-profile-X/ devices instead.
  - Preserve aggregate selection through the legacy ACPI attributes and
    retain internal aggregation for kernel profile cycling.
  - Refocus patch 3 on class-device notifications for direct writes and
    restoring aggregate visibility after failed registration.
  - Update the Kconfig help and documentation to describe the existing
    class interface and distinguish it from ACPI aggregate selection.
  - Revalidate class controls and notifications with acpi=off, legacy
    aggregation with ACPI active, and the absence of a new aggregate ABI.
  - Add CONFIG_PLATFORM_PROFILE_LEGACY (default y) to make legacy aggregate
    sysfs code optional, independently of class devices and kernel cycling.
  - Mark the legacy ABI deprecated and describe removal after the 2028 LTS
    kernel, conditional on userspace migration. Emit one shared notice on
    legacy attribute access; retain the enabled default during migration.
  - Move the legacy ACPI ABI documentation from testing/ to obsolete/,
    document the replacement class attributes and update MAINTAINERS.

Changes in v1:
  - Initial series extracting the core from ACPI, separating handler
    locking from sysfs lifetime operations and retaining the legacy ABI.
  - Proposed a firmware-neutral aggregate sysfs interface alongside the
    existing per-provider class devices (removed in v2).

Daniel Lezcano (5):
  platform profile: Separate handler locking from sysfs lifetime
  platform profile: Extract the core from ACPI
  platform profile: Complete class notifications and registration cleanup
  platform profile: Document firmware-independent profile selection
  platform profile: Make legacy ACPI aggregate interface optional

 .../{testing => obsolete}/sysfs-platform_profile   |  12 ++
 .../ABI/testing/sysfs-class-platform-profile       |   2 +-
 .../userspace-api/sysfs-platform_profile.rst       |  55 ++++--
 MAINTAINERS                                        |   5 +
 drivers/acpi/Kconfig                               |   3 -
 drivers/acpi/Makefile                              |   1 -
 drivers/cpufreq/Kconfig.x86                        |   2 +-
 drivers/platform/Kconfig                           |  35 ++++
 drivers/platform/Makefile                          |   2 +
 drivers/platform/profile/Makefile                  |   5 +
 drivers/platform/profile/acpi.c                    |  15 ++
 .../platform_profile.c => platform/profile/core.c} | 195 +++++++++++++++------
 drivers/platform/profile/profile.h                 |  17 ++
 drivers/platform/surface/Kconfig                   |   6 +-
 drivers/platform/x86/Kconfig                       |  10 +-
 drivers/platform/x86/amd/pmf/Kconfig               |   2 +-
 drivers/platform/x86/dell/Kconfig                  |   4 +-
 drivers/platform/x86/hp/Kconfig                    |   2 +-
 drivers/platform/x86/lenovo/Kconfig                |   6 +-
 drivers/thermal/intel/int340x_thermal/Kconfig      |   2 +-
 include/linux/platform_profile.h                   |   3 +
 21 files changed, 296 insertions(+), 88 deletions(-)

base-commit: d0cd1e850e1602729dd60dc3c5fd96f80e0cdc5d
-- 
2.43.0

