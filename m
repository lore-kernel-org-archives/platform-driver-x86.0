Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DBC189F5C
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Nov 2024 13:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730900996; cv=none; b=HsxjYp3FWUlZgMhS2avHPGdKWIlVd0MrVm/c9XJ52LgWwvZKznnDbl8MYgVJqlQ+M+/IzlJ3XGnz4iulvJHcBXTGcv2tCSb4J2LZnhAv/xwvgucEUrUyKOvR5wsaMs+CodPq+5QZfmtMQV1X8ZWLaLdNHeiZVNKaWh91lnTi/9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730900996; c=relaxed/simple;
	bh=k8egwxRaY52aPdpel5LR/SvBZllq25tSIhOFTh239aY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=EzuFp3lxKBP09M07z37TDEujQUGPQT6ZMjQDolcNc04OzNZdWhzKuhGwMPtasIGRvisuhDfGNzKfseeIt9aFgWFeT7qNhdyzaybjnonVlYHClGYCyBPPoxb3r0wlPdrelxHax9UBtZDRAwNk/3UtRFRwDW2xvGZ1F7KAD0QnOP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FkxfpqhT; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FkxfpqhT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730900995; x=1762436995;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=k8egwxRaY52aPdpel5LR/SvBZllq25tSIhOFTh239aY=;
  b=FkxfpqhTAVIn1S3yU+qJ0OpI42UsDyJPneoKyC7MzkIh2+a0bdh5kUUk
   bGZvgDuK1dGlmqPeV+Xk8cHoUK+f3wEtLqaqo0O1+iI24tsGewECPZlrK
   q37VHiTfDiZ1plnW1eWKOPhO0xveZcJqecjqZNhsTO2YyNkvTiQOw4gro
   DSnUOHxm9yqasA+is44maUT4h+aFDXTOQhID77HvfXiavucyIkqRX+JGu
   e01eNhuqLmJDBxYG2PIzb7D36O9pD9RQ3sgomL3qy2+SsFrZOSkEoq5Aj
   V6SMhl/D3fwx1nazOwt9uS7ETwX6Hr2O0XV0r4HwokflLs4jAeCH8y09z
   A==;
X-CSE-ConnectionGUID: IIUZKY24TjCmDfscE+RM3w==
X-CSE-MsgGUID: VIE6eeKdQgqLIAsWIuIpbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="30804955"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="30804955"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 05:49:55 -0800
X-CSE-ConnectionGUID: //5NVd9gQ5q96T4wXXdSdw==
X-CSE-MsgGUID: CjMqPQXJS3+b/eHc1uAWTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="84463265"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.110])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 05:49:51 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 6 Nov 2024 15:49:49 +0200 (EET)
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    perry.yuan@amd.com, mario.limonciello@amd.com, Shyam-sundar.S-k@amd.com, 
    W_Armin@gmx.de
Subject: Re: [PATCH v4 2/2] platform/x86/amd: amd_3d_vcache: Add sysfs ABI
 documentation
In-Reply-To: <20241106112821.1012452-3-Basavaraj.Natikar@amd.com>
Message-ID: <192882bf-e272-082c-ec4f-88577bf68e73@linux.intel.com>
References: <20241106112821.1012452-1-Basavaraj.Natikar@amd.com> <20241106112821.1012452-3-Basavaraj.Natikar@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-234290094-1730900989=:928"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-234290094-1730900989=:928
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 6 Nov 2024, Basavaraj Natikar wrote:

> Add documentation for the amd_3d_vcache sysfs bus platform driver
> interface so that userspace applications can use it to change mode
> preferences, either frequency or cache.
>=20
> Co-developed-by: Perry Yuan <perry.yuan@amd.com>
> Signed-off-by: Perry Yuan <perry.yuan@amd.com>
> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> ---
>  .../sysfs-bus-platform-drivers-amd_x3d_vcache        | 12 ++++++++++++
>  MAINTAINERS                                          |  1 +
>  2 files changed, 13 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-platform-drivers-=
amd_x3d_vcache
>=20
> diff --git a/Documentation/ABI/testing/sysfs-bus-platform-drivers-amd_x3d=
_vcache b/Documentation/ABI/testing/sysfs-bus-platform-drivers-amd_x3d_vcac=
he
> new file mode 100644
> index 000000000000..5ff1f1a8c9b6
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-platform-drivers-amd_x3d_vcache
> @@ -0,0 +1,12 @@
> +What:=09=09/sys/bus/platform/drivers/amd_x3d_vcache/AMDI0101:00/amd_x3d_=
mode
> +Date:           October 2024

Space -> tabs.

With that addressed,

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

> +KernelVersion:=096.13
> +Contact:=09Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> +Description:=09(RW) AMD 3D V-Cache optimizer allows users to switch CPU =
core
> +=09=09rankings dynamically.
> +
> +=09=09This file switches between these two modes:
> +=09=09- "frequency" cores within the faster CCD are prioritized before
> +=09=09those in the slower CCD.
> +=09=09- "cache" cores within the larger L3 CCD are prioritized before
> +=09=09those in the smaller L3 CCD.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 60155effead9..5c29cdc6c1a4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -970,6 +970,7 @@ M:=09Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>  R:=09Mario Limonciello <mario.limonciello@amd.com>
>  L:=09platform-driver-x86@vger.kernel.org
>  S:=09Supported
> +F:=09Documentation/ABI/testing/sysfs-bus-platform-drivers-amd_x3d_vcache
>  F:=09drivers/platform/x86/amd/x3d_vcache.c
> =20
>  AMD ADDRESS TRANSLATION LIBRARY (ATL)
>=20

--=20
 i.

--8323328-234290094-1730900989=:928--
