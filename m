Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF11313277;
	Tue, 15 Sep 2026 20:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789503898; cv=none; b=mh6z1eYhduPUOlxpY/9tLGtsG0fD2GGbCjERceNYryRzwVblQaNzSO6c5ma125VGm6u/SG5Lbj9Jrkg945Yg0YIAQ5QpkEwCgfB/1r1O7LJNnSYZ21hsypfuDZGKX4PiIB3LTIAekJieaoxUyt3AoL/Q1SsJnn0LPIm2YNOh4W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789503898; c=relaxed/simple;
	bh=HELeNhGGVHRzKh6Ew2z2aydflGVE1vJ/BrsxN7CxOrA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=aqGCNuE3uKlL0HQtL6WJTMV/E4wZVVu3RIymyjre8jrLTdklif0jbRuInxWPdK6zB7nBn4V0XWIAYBX/NgTeLr2Uq480NKvAxdoGbCKguSb7bilROyWm1wCOFbr7hXfRSBBmihOrhz6scyTKy00k4/nwX0dxXaqXG/NSIt+Kn/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AVuTuoYi; arc=none smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AVuTuoYi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789503896; x=1821039896;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=HELeNhGGVHRzKh6Ew2z2aydflGVE1vJ/BrsxN7CxOrA=;
  b=AVuTuoYi9nc05mwnYCXVbE00pDBX/Lr09GUL9VINnb7xx9bCi42FtraS
   F8gAoP7kPAx74m6pAar6VG+miZXOSSKHl6KEOkUsqEIPymB6OzkbwVCxJ
   +V8SGEyCbIfj6Gpw959qwT4ZC6GQN65BG91NSbj6e1d94cKg92tEV4rYZ
   /Asq0j2qnRALAi0PornUTCENeFizGoQuscdB60Fp7LrX/YL9Y0MM500zf
   fB6DgTMG66Or8uSiuAlnIpI3AvzsuG1CcRIy+KrH86TsNyBr4y+gVJ86a
   Zbo0zuim/RXNE2e2Qrtmirx9IawFfKD0JZsT7iVpuDHLDakQFrMOp5y+R
   g==;
X-CSE-ConnectionGUID: brgLpUacS9qXrmcJUWQmLw==
X-CSE-MsgGUID: fdphHOYrRmOTqWssYvOb8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="386736"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="386736"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 13:24:54 -0700
X-CSE-ConnectionGUID: yygLDzqKTlKHqRknoASejw==
X-CSE-MsgGUID: NczMJzYORcOj3D02C4SbFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="272647808"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 13:24:51 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 15 Sep 2026 23:24:47 +0300 (EEST)
To: Mario Limonciello <mario.limonciello@amd.com>
cc: "Nirujogi, Pratap" <pnirujog@amd.com>, Xueqin Luo <luoxueqin@kylinos.cn>, 
    Hans de Goede <hansg@kernel.org>, pratap.nirujogi@amd.com, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: Fix NULL deref in amd_isp_probe
In-Reply-To: <096d4329-fad8-4fc2-88a3-dd50869f7f19@amd.com>
Message-ID: <9b8c2e92-caaf-6664-750b-fd27caf2601f@linux.intel.com>
References: <20260810032450.692844-1-luoxueqin@kylinos.cn> <7ad7533f-c55c-44ec-91a1-53153d632fb3@amd.com> <096d4329-fad8-4fc2-88a3-dd50869f7f19@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-934087563-1789503887=:27301"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-934087563-1789503887=:27301
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 11 Aug 2026, Mario Limonciello wrote:

>=20
>=20
> On 8/10/26 16:52, Nirujogi, Pratap wrote:
> >=20
> >=20
> > On 8/9/2026 11:24 PM, Xueqin Luo wrote:
> > > [You don't often get email from luoxueqin@kylinos.cn. Learn why this =
is
> > > important at https://aka.ms/LearnAboutSenderIdentification ]
> > >=20
> > > Caution: This message originated from an External Source. Use proper
> > > caution when opening attachments, clicking links, or responding.
> > >=20
> > >=20
> > > amd_isp_probe() uses ACPI_COMPANION() without NULL check. Add it to
> > > prevent crash when driver_override matches a device without ACPI
> > > companion.
> > >=20
> > > Fixes: e1af6f0146d6 ("platform/x86: Update swnode graph for amd isp4"=
)
> > > Signed-off-by: Xueqin Luo <luoxueqin@kylinos.cn>
> > > ---
> > > =C2=A0 drivers/platform/x86/amd/amd_isp4.c | 7 +++++++
> > > =C2=A0 1 file changed, 7 insertions(+)
> > >=20
> > > diff --git a/drivers/platform/x86/amd/amd_isp4.c b/drivers/platform/
> > > x86/amd/amd_isp4.c
> > > index 0d494899502c..0026d6663c5c 100644
> > > --- a/drivers/platform/x86/amd/amd_isp4.c
> > > +++ b/drivers/platform/x86/amd/amd_isp4.c
> > > @@ -379,6 +379,11 @@ static int amd_isp_probe(struct platform_device
> > > *pdev)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto error_unregister_sw_node;
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 adev =3D ACPI_COMPAN=
ION(&pdev->dev);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!adev) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ret =3D -ENODEV;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 goto error_unregister_notifier;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > +
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* initialize root a=
md_camera_node */
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 adev->driver_data =
=3D (void *)pinfo->swnodes[0];
> > >=20
> > > @@ -388,6 +393,8 @@ static int amd_isp_probe(struct platform_device *=
pdev)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 platform_set_drvdata=
(pdev, isp4_platform);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> > >=20
> > > +error_unregister_notifier:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bus_unregister_notifier(&i2c_bu=
s_type, &isp4_platform->i2c_nb);
> > > =C2=A0 error_unregister_sw_node:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 software_node_unregi=
ster_node_group(isp4_platform->pinfo-
> > > >swnodes);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
> > LGTM. I agree that adding the NULL check is good practice. That said, I
> > believe it's not strictly needed as the device_get_match_data() in line=
#366
> > is expected to fail if there is no ACPI companion.
>=20
> It sounds like it's essentially dead code then.

Yeah, lets not add dead-code NULL checks.

> > https://github.com/torvalds/linux/blob/master/drivers/platform/x86/amd/
> > amd_isp4.c#L366
> >=20
> > Reviewed-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
> >=20
> > > --=20
> > > 2.43.0
> > >=20
> >=20
>=20

--=20
 i.

--8323328-934087563-1789503887=:27301--
