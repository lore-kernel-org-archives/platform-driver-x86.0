Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2714219ABD5
	for <platform-driver-x86@vger.kernel.org>; Tue, 22 Oct 2024 13:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729603362; cv=none; b=AmyFa6KxOJHy5xvFL2sQQoMN/moNFAZsrwy26NJ7uUcDHvnNvhCOFjtWPqSvFclfcrTE050kiqsbBYfHjCxc6V0rFGokEaIDAWLZWNciLd2k8UnCaUXJhxKuiDGxVmhGrUKDFvUyWMoqG9oIe2rbzO7cteL0mwCBrZjVggGW8x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729603362; c=relaxed/simple;
	bh=M1Rm/xZM4U7YcKMgy/efuR8AREEbe0ZxIBYuxALVdtw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=qEbj++oyDF8fcM7i54m9LlRJky+sVR0OEPwjcgKRs+L6HiqioCz5er0Upgl0GMie0nq9pxspDGLJgvQ1L0yPe+0uRPjUsMk29BK4L9l5DG0ZNfoMtLEtuusAZSuOKbGS/PWn/XnTGnDlHWEQD9Ad2X31gafcQB2C9qGfYdbQDIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cihK2aqn; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cihK2aqn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729603361; x=1761139361;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=M1Rm/xZM4U7YcKMgy/efuR8AREEbe0ZxIBYuxALVdtw=;
  b=cihK2aqno462Q8dL9Eqh9/N9bz8A2sFo0H5V8CMhkfvu6GGEJjBu+5oJ
   eP5LXrhpSqDoVxCmw03wBpA/OM96hthaR3a0ix+xZhSrXcyY32Y13M27x
   6EkQZgUEwgoNWsruOZJIEYEWu73vANy0jCOSYJG+SiussNPd/ucDDkBwy
   Cpn1ZMPz9eh2M6qA4m/8LKCsevMaynaYdX4w97UKW3bEWC0Su6qsw2xyi
   /5fUOMxyole13XUPyubzz+EzY2Lmfn4oIytY3GJflSV0nCPSBo0g6/sur
   yHnqgMSs8fVLVQxjMTovncfTaD0+RLrnZco1xEmY7X/6fxdLP2NW6OYSo
   w==;
X-CSE-ConnectionGUID: 9cSm5k6rQJuho86OWhD+DA==
X-CSE-MsgGUID: 0YeabZIQSSW7MD6q3wpOqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="29344294"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="29344294"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 06:22:40 -0700
X-CSE-ConnectionGUID: EifxKj4KTfSJf+bERMtoJg==
X-CSE-MsgGUID: Om7bGgBxQXuz41YOQmQDhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="117312049"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.146])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 06:22:37 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 22 Oct 2024 16:22:33 +0300 (EEST)
To: Mario Limonciello <mario.limonciello@amd.com>
cc: Basavaraj Natikar <bnatikar@amd.com>, Armin Wolf <W_Armin@gmx.de>, 
    Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
    Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    perry.yuan@amd.com, Shyam-sundar.S-k@amd.com
Subject: Re: [PATCH v3 1/2] platform/x86/amd: amd_3d_vcache: Add AMD 3D
 V-Cache optimizer driver
In-Reply-To: <7be0b988-013d-4dd4-8a85-0a72cdb1b924@amd.com>
Message-ID: <f60964d0-6c10-e353-b556-0461f0d6ce7c@linux.intel.com>
References: <20241021165820.339567-1-Basavaraj.Natikar@amd.com> <20241021165820.339567-2-Basavaraj.Natikar@amd.com> <72c0b021-9778-4bbe-aa54-c7ef887c04fa@gmx.de> <5dce0b9f-2b91-1cac-5150-899547cd042f@amd.com> <7be0b988-013d-4dd4-8a85-0a72cdb1b924@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-2027509565-1729603353=:969"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-2027509565-1729603353=:969
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 22 Oct 2024, Mario Limonciello wrote:

> On 10/22/2024 00:54, Basavaraj Natikar wrote:
> >=20
> > On 10/22/2024 2:05 AM, Armin Wolf wrote:
> > > Am 21.10.24 um 18:58 schrieb Basavaraj Natikar:
> > >=20
> > > > AMD X3D processors, also known as AMD 3D V-Cache, feature dual Core
> > > > Complex Dies (CCDs) and enlarged L3 cache, enabling dynamic mode
> > > > switching between Frequency and Cache modes. To optimize performanc=
e,
> > > > implement the AMD 3D V-Cache Optimizer, which allows selecting eith=
er:
> > > >=20
> > > > Frequency mode: cores within the faster CCD are prioritized before
> > > > those in the slower CCD.
> > > >=20
> > > > Cache mode: cores within the larger L3 CCD are prioritized before
> > > > those in the smaller L3 CCD.
> > > >=20
> > > > Co-developed-by: Perry Yuan <perry.yuan@amd.com>
> > > > Signed-off-by: Perry Yuan <perry.yuan@amd.com>
> > > > Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
> > > > Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> > > > Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> > > > Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>

> > > > +static int amd_x3d_resume_handler(struct device *dev)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 struct amd_x3d_dev *data =3D dev_get_drvdata(de=
v);
> > > > +=C2=A0=C2=A0=C2=A0 int ret =3D amd_x3d_get_mode(data);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 ret =3D amd_x3d_mode_switch(data, ret);
> > > > +=C2=A0=C2=A0=C2=A0 if (ret < 0)
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 return 0;
> > >=20
> > > Please directly return the result of amd_x3d_mode_switch() here.
> > >=20
> > > Also i think that maybe there exists a way to avoid locking data->loc=
k
> > > twice
> > > during resume, but i will leave that to you.
> >=20
> > I will leave as it is.
> >=20
> > > Other than that:
> > >=20
> > > Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> >=20
> > Thanks for the feedback. I will re-spin a new version after looking for=
 more
> > feedback from others. Thanks, -- Basavaraj
> >=20
>=20
> FYI - if no other feedback comes in there is no need to re-spin just to a=
dd
> R-b tags.  Maintainers will automatically pick them up when they use 'b4
> $LORE_URL'.

?? There's the return change requested above.

--=20
 i.

--8323328-2027509565-1729603353=:969--
