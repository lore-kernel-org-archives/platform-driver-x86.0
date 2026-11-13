Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794589963;
	b=zicpHkcappc33tb7TpC59Auvy9wg3brxiCs2Yu4Uo3l9bJvqVuYCt8V469YeipRQoeQl
	 0oQHNseDFdljA+6AoIpvP70p4/hdYq17PLtRVTeb7ECDKuuElBtCE3THrMFeGWHF+uQ0T
	 QVfz0tpenRE35gf6EWnfLKn3BbGgCxm+K5pjRAIAi04U/Cy+3kAWvdv2V+jZgZDyPp6T6
	 Z+t77fLVNhu644IY/WbV8H0bZjkT2T3h0D+PVHb0/7EhsAi3NFAoWrtAaL7zhSumu4aMS
	 7PptAbc70WcKoCNoEM4Il1V5zJ1JDiJP3FIQlgLnHqFmtms6Tj28GkAwpWeuKKoscbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794589963;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=PRLdZLsIiXp4iVTHjVz/J/jye1WxfVmEHCV53LClaWU=;
	b=XhcYfdp7jlAqD7xaHsgWielNcFMBgqNvVLsEZCS8wcqZz7D5mGcfCyxzkFyYPFZ4Dy0T
	 Mgxey84AANq/ACKiDpvguW1bWdyAO2VRjh/TMrIjL6+z7AmVcaKSTjxD/r+hnUqpcjCqM
	 4p1t8DSs0YeqMn4IpuHZOA6Wvvpym0I3Kbfl0uSnjDi2Syz4QZDapVEjIui2FuOQFQPMc
	 L3zgS7j/LDkl5zF5QQn0bv/AmiaiFqRq7pmVOVs9FCXoox6vbCH+iNJ85K7qc1hcOtwma
	 mhwr4UsC1Ur9QgUogHBoEyuYmoWkHHfGliUDPmEt0f9gCD6GNEcfQhUCGc3LxZWzokg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hXKnIaFC;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2497606A339
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Nov 2026 17:12:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2497606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hXKnIaFC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794589963; x=1826125963;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=8ZFouv0fstGL2xR1VfL0HN+n0p/gLWeLR8w34WdzKPE=;
  b=hXKnIaFCFOLhoN0XH99lt5oGforItawzBJF5DNcQN1V+iRFHUDLdDyvE
   eaBTNw48kwNWY4qki2ZK4cfqcuau/dPoBsMstWw9F/EQKSWCmKhcKrnLf
   iaDeVRnW3XEAQ7wNje8l5NDrIw/x3Rr1XTKbk0n1k/wTUu9kcLYUU6hND
   ETglEKFk7UdJItqobPuZxxT97pJs6fa2lVaR5UrEfcR2zcz1o9jOOjt6H
   3gK2gJn6fG8BF3matH5bpT0Wl1JtNdExlJb2ZjfZbt11T1KSe6lOeQQyp
   mZM5+9ySU6ZYRwwP39SEKskwNyNjIN6Q4UeLTiMWYHEF1KDhIacHw9XDO
   Q==;
X-CSE-ConnectionGUID: 2m2rEbz1Tiq1OJNp9w/wxQ==
X-CSE-MsgGUID: jHbs5hhUQqOY9Ayt1lHMUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3394809"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3394809"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 09:12:43 -0800
X-CSE-ConnectionGUID: w70p+vIORXazoL7kCD8liw==
X-CSE-MsgGUID: KjPw8I2iTwifIAKtD4cOBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="8882092"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.214])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 09:12:40 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 13 Nov 2026 19:12:36 +0200 (EET)
To: Suma Hegde <suma.hegde@amd.com>, Erwan Velu <erwanaliasr1@gmail.com>
cc: platform-driver-x86@vger.kernel.org, 
    Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>, 
    NaveenKrishna.Chatradhi@amd.com, 
    Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Subject: Re: [PATCH 0/8] platform/x86/amd/hsmp: Unify socket/cpu sysfs
In-Reply-To: <20261014111430.23156-1-suma.hegde@amd.com>
Message-ID: <bf9f4104-6e1f-9782-37f0-23a720cea35f@linux.intel.com>
References: <20261014111430.23156-1-suma.hegde@amd.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-126927015-1794589956=:6498"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-126927015-1794589956=:6498
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 14 Oct 2026, Suma Hegde wrote:

> From: Suma Hegde <Suma.Hegde@amd.com>
>=20
> This series aligns the ACPI and platform HSMP drivers on a common
> sysfs layout and reduces duplication.
>=20
>   - Create /sys/devices/platform/amd_hsmp/socket/socketN/ for the
>     platform driver, and matching socketN links from the ACPI path
>   - Add platform telemetry sysfs, then move shared show handlers into
>     a new sysfs.c used by both drivers
>   - Expose per-CPU boost_limit under amd_hsmp/cpu/cpuX/
>   - Gate read and write visibility on separate message IDs
>   - Add sysfs for additional HSMP control and telemetry messages, and
>     document the shared socket path and the new files

Hi,

This seems to largely overlap with Erwan's series:

  https://lore.kernel.org/platform-driver-x86/20261007125908.321186-1-erwan=
aliasr1@gmail.com/

=2E..I don't know what are Erwan's plans as there has not been an update=20
but at least the approach he used in the first patch seems better than=20
yours (I don't know why you didn't put the common code into common?).

Your series didn't even apply cleanup because of the deps so sashiko=20
didn't get to review it at all but it likely finds some of the problem=20
that I got when LLM compared these series, about your series it says:

  1. Build failure when both drivers are built in (patch=C2=A05). sysfs.o i=
s linked into both  =20
     the amd_hsmp and hsmp_acpi modules, and its functions are not static. =
With           =20
     AMD_HSMP_PLAT=3Dy and AMD_HSMP_ACPI=3Dy (both tristates, so this is al=
lowed) the kernel  =20
     link should fail with "multiple definition" errors. As modules, it's s=
till a         =20
     duplicated object. Erwan avoided this by putting sysfs.o in hsmp_commo=
n.             =20
  2. Mismatched function types (patches 4 and=C2=A08). The device-style fil=
e handlers (struct  =20
     device_attribute) are attached to a plain kobject. Plain kobjects call=
 their file    =20
     handlers through kobj_attr_show()/kobj_attr_store(), which expect stru=
ct             =20
     kobj_attribute handlers. It only works because the two structs happen =
to have the same
     layout and the handlers never actually use the dev argument. With kCFI=
 enabled       =20
     (CONFIG_CFI_CLANG), this indirect call should trip the CFI check.     =
               =20
  3. Possible deadlock on removal (patches 1 and=C2=A06). Removing sysfs fi=
les waits for any   =20
     reads or writes still running, and those take hsmp_sock_rwsem for read=
 inside        =20
     hsmp_send_message(). Suma removes files while holding that lock for wr=
ite:           =20
     - in hsmp_pltdrv_release() (the platform probe-failure path);         =
               =20
     - more importantly, the hsmp_remove_per_cpu_kobjects() calls in ACPI r=
emove and      =20
       probe-failure cleanup.                                              =
               =20
                                                                           =
               =20
     Erwan's patch 2 commit message describes exactly this problem and adds=
               =20
     lockdep_assert_not_held() to guard against it. The base tree isn't vis=
ible to me, so =20
     I'm inferring from the context lines that ACPI remove holds the lock a=
t that point.  =20
  4. Breaks an existing path. /sys/devices/platform/amd_hsmp/socketN/metric=
s_bin is       =20
     documented, and patch 1 moves it to .../socket/socketN/ without leavin=
g anything at  =20
     the old location.                                                     =
               =20
  5. Plain directories under /sys/devices. This applies to socket/, cpu/, c=
puX/, and to the
     ACPI driver creating its own amd_hsmp directory under platform_bus. Th=
ey produce no  =20
     uevents, so udev never sees them, and sysfs maintainers usually reject=
 this. The     =20
     cpu/cpuX names also look like /sys/devices/system/cpu/cpuX.           =
               =20
  6. Per-CPU implementation (patch=C2=A06).                                =
                    =20
     - It uses a static cpu_kobj_info[NR_CPUS] table, which is large on big=
 configs and,  =20
       because of item 1, duplicated in both modules.                      =
               =20
     - Every read, write and visibility check scans the whole table to find=
 its CPU.      =20
     - It loops with for_each_possible_cpu, so CPUs that are possible but n=
ot present get =20
       entries too, and x86_cpu_to_apicid for those is probably not a valid=
 APIC ID.      =20
     - The cpu_id field is never used.                                     =
               =20
  7. Duplicates existing hwmon files (patch=C2=A08). socket_power, socket_p=
ower_limit and      =20
     socket_power_limit_max repeat what hwmon.c already exposes as power1_i=
nput, power1_cap
     and power1_cap_max.                                                   =
               =20
  8. apb_disable looks wrong (patch=C2=A08).                               =
                    =20
     - It reads with "bit 31 =3D get" and uses bit 8 on HSMP_SET_DF_PSTATE.=
 In the upstream =20
       descriptor table that message is SET-only, with one argument and no =
response.      =20
     - Turning APB back on normally goes through HSMP_SET_AUTO_DF_PSTATE.  =
               =20
     - With response_sz =3D 1 the message probably fails the driver's own m=
essage-format    =20
       check.                                                              =
               =20
                                                                           =
               =20
     Unless a newer protocol version redefines this message, it's worth che=
cking against
     the spec.
  9. Minor.
     - In patch 4, freqlimit_srcnames is a static array in a header, so eve=
ry file that
       includes it gets a copy. Patch 5 fixes this.
     - Patch 4's doc says the platform path is amd_hsmp/socketX/, though pa=
tch 1 already
       moved it. Patch 8 fixes this too.
     - The value ranges checked on writes (100=E2=80=9310000 MHz, 1=E2=80=
=931000 W) are arbitrary.

I haven't spent time on checking each these individually.

--=20
 i.
=20
> This series applies on top of HSMP client series v8 and a rebase of the H=
SMP
> dynamic bitmap series onto client v8. The rebased patch set for dynamic
> bitmap series has not been posted. Based on the changes in client series,
> dynamic bitmap series and this series(unify sysfs) will be rebased again =
and
> sent.
>
> Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
> Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
>=20
> Suma Hegde (8):
>   platform/x86/amd/hsmp: Create socket sysfs directory in platform
>     driver
>   platform/x86/amd/hsmp: Add amd_hsmp/socket sysfs links for ACPI
>     devices
>   platform/x86/amd/hsmp: Rename the HSMP_BIN_ATTR_GRP macro
>   platform/x86/amd/hsmp: plat: Add sysfs files to display HSMP telemetry
>   platform/x86/amd/hsmp: Move common sysfs show handlers to sysfs.c
>   platform/x86/amd/hsmp: Add per-CPU sysfs attributes for ACPI and
>     platform
>   platform/x86/amd/hsmp: Add wr_msg_id for sysfs attribute visibility
>   platform/x86/amd/hsmp: Add sysfs support for new HSMP messages
>=20
>  Documentation/arch/x86/amd_hsmp.rst    |  33 +-
>  drivers/platform/x86/amd/hsmp/Makefile |   4 +-
>  drivers/platform/x86/amd/hsmp/acpi.c   | 331 ++++-------
>  drivers/platform/x86/amd/hsmp/plat.c   | 412 ++++++++++++-
>  drivers/platform/x86/amd/hsmp/sysfs.c  | 762 +++++++++++++++++++++++++
>  drivers/platform/x86/amd/hsmp/sysfs.h  | 112 ++++
>  6 files changed, 1420 insertions(+), 234 deletions(-)
>  create mode 100644 drivers/platform/x86/amd/hsmp/sysfs.c
>  create mode 100644 drivers/platform/x86/amd/hsmp/sysfs.h
>=20
>=20
--8323328-126927015-1794589956=:6498--
