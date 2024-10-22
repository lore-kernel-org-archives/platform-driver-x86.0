Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC8C45945
	for <platform-driver-x86@vger.kernel.org>; Tue, 22 Oct 2024 13:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729605570; cv=none; b=cqqy2xHufZN9+uUSM9OwbGQO5qzpQY1nRayg3ElKhAW9Wb6DdwwZu7sYh4gZ8qs+8262vHYOUEZWXnxgdup6P2R/yNHpHzMHducW7Wwiwk6152Ijv7yTKA+xt8tv4BIkPjxYRExEZfoZWwhpBjNKt1OmG19fFhZ84Bd5aKnIriE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729605570; c=relaxed/simple;
	bh=BLiAv6iEEnYlP8FXGCVXn7dEYgX4XlIPUpETGQGRONY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Z1A39nqytGbs1lgGr+g3aOypvjw3QBlMIgLVmVHtI6tA2Zbrzy1ml5A0fpvh78TcIK+CZW/QFP9KmEXTebxzJmk52b/rNRMMU6juCdutN+mHvTn5uS1Y1YEOch31XyE1gQtF90GEEAEJ7oplk/BheDv2ld4we1cW9PGeWenLkGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kwyBRmii; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kwyBRmii"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729605569; x=1761141569;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=BLiAv6iEEnYlP8FXGCVXn7dEYgX4XlIPUpETGQGRONY=;
  b=kwyBRmiik9WJ8rZm3INaWEhWMiYmYR9bBsBJUkM645I8/pteUdLdIsbr
   eXx6AhYA88CurC4YSi+M0XtiYCUd7sMCPu9sqrTAyxsbcgDmzx+COzQ1l
   xbJMzG95rTS5OwStBHqRyPOpHd8rVpbgF8vTlgBrM0gZmBqO8F2v4XcWJ
   vFF6yGzECOZfPNilUeltqMHLo5hsOchxF8GxLBvTHxhkmKq6lSD8mMAXP
   naB7npM9Axn7Ch7YzR2z4P5tdA/xF4W1bDgCiNjhcOwwlTK2Jev5nMGGf
   y+FB2/+Unuvwe+3ne1fYpah4Z9U78/vuiCT8Mzx3DnY2wvduJLM0GjtoQ
   Q==;
X-CSE-ConnectionGUID: C7GoUP2CRU2767QX0YHARA==
X-CSE-MsgGUID: 1HwEiDE7R2SkqZ/1AighGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32835184"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="32835184"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 06:59:28 -0700
X-CSE-ConnectionGUID: ZgTSCLFeRgeMX07twIoSyw==
X-CSE-MsgGUID: /9A+SF0uSaC5dbzwc13+vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="80294267"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.146])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 06:59:26 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 22 Oct 2024 16:59:22 +0300 (EEST)
To: Mario Limonciello <mario.limonciello@amd.com>
cc: Basavaraj Natikar <bnatikar@amd.com>, Armin Wolf <W_Armin@gmx.de>, 
    Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
    Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    perry.yuan@amd.com, Shyam-sundar.S-k@amd.com
Subject: Re: [PATCH v3 1/2] platform/x86/amd: amd_3d_vcache: Add AMD 3D
 V-Cache optimizer driver
In-Reply-To: <630596ce-d298-4513-8fea-9b2dca5782e2@amd.com>
Message-ID: <06f2af82-9ba5-bf96-958d-1ca22f50f1a4@linux.intel.com>
References: <20241021165820.339567-1-Basavaraj.Natikar@amd.com> <20241021165820.339567-2-Basavaraj.Natikar@amd.com> <72c0b021-9778-4bbe-aa54-c7ef887c04fa@gmx.de> <5dce0b9f-2b91-1cac-5150-899547cd042f@amd.com> <7be0b988-013d-4dd4-8a85-0a72cdb1b924@amd.com>
 <f60964d0-6c10-e353-b556-0461f0d6ce7c@linux.intel.com> <630596ce-d298-4513-8fea-9b2dca5782e2@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1729799162-1729605562=:969"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1729799162-1729605562=:969
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 22 Oct 2024, Mario Limonciello wrote:

> On 10/22/2024 08:22, Ilpo J=C3=A4rvinen wrote:
> > On Tue, 22 Oct 2024, Mario Limonciello wrote:
> >=20
> > > On 10/22/2024 00:54, Basavaraj Natikar wrote:
> > > >=20
> > > > On 10/22/2024 2:05 AM, Armin Wolf wrote:
> > > > > Am 21.10.24 um 18:58 schrieb Basavaraj Natikar:
> > > > >=20
> > > > > > AMD X3D processors, also known as AMD 3D V-Cache, feature dual =
Core
> > > > > > Complex Dies (CCDs) and enlarged L3 cache, enabling dynamic mod=
e
> > > > > > switching between Frequency and Cache modes. To optimize
> > > > > > performance,
> > > > > > implement the AMD 3D V-Cache Optimizer, which allows selecting
> > > > > > either:
> > > > > >=20
> > > > > > Frequency mode: cores within the faster CCD are prioritized bef=
ore
> > > > > > those in the slower CCD.
> > > > > >=20
> > > > > > Cache mode: cores within the larger L3 CCD are prioritized befo=
re
> > > > > > those in the smaller L3 CCD.
> > > > > >=20
> > > > > > Co-developed-by: Perry Yuan <perry.yuan@amd.com>
> > > > > > Signed-off-by: Perry Yuan <perry.yuan@amd.com>
> > > > > > Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
> > > > > > Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> > > > > > Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> > > > > > Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> >=20
> > > > > > +static int amd_x3d_resume_handler(struct device *dev)
> > > > > > +{
> > > > > > +=C2=A0=C2=A0=C2=A0 struct amd_x3d_dev *data =3D dev_get_drvdat=
a(dev);
> > > > > > +=C2=A0=C2=A0=C2=A0 int ret =3D amd_x3d_get_mode(data);
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0 ret =3D amd_x3d_mode_switch(data, ret);
> > > > > > +=C2=A0=C2=A0=C2=A0 if (ret < 0)
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0 return 0;
> > > > >=20
> > > > > Please directly return the result of amd_x3d_mode_switch() here.
> > > > >=20
> > > > > Also i think that maybe there exists a way to avoid locking data-=
>lock
> > > > > twice
> > > > > during resume, but i will leave that to you.
> > > >=20
> > > > I will leave as it is.
> > > >=20
> > > > > Other than that:
> > > > >=20
> > > > > Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> > > >=20
> > > > Thanks for the feedback. I will re-spin a new version after looking=
 for
> > > > more
> > > > feedback from others. Thanks, -- Basavaraj
> > > >=20
> > >=20
> > > FYI - if no other feedback comes in there is no need to re-spin just =
to
> > > add
> > > R-b tags.  Maintainers will automatically pick them up when they use =
'b4
> > > $LORE_URL'.
> >=20
> > ?? There's the return change requested above.
> >=20
>=20
> Basavaraj said he will leave it as is in response to Armin's comment.

To me that seemed related to the locking paragraph, not the return related=
=20
one.

--=20
 i.

--8323328-1729799162-1729605562=:969--
