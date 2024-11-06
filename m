Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB731DF97A
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Nov 2024 13:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730899567; cv=none; b=geDhnq6hH0jqvP1CVpc04fZ/kNtF0b/XUeuFnPB4PkldIC2yXjLGMOcAXPFgTzIpJtv5e+oDoeoe1dPtwE5L5Gzfgs+u4dwf3MjZhQUUkoVvu3lFjbQkoMhmhoT9jSrYuL2En5RQleioleOloaqPRefyYW06ENDkrKvCVO4FgtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730899567; c=relaxed/simple;
	bh=6TJ3NxpjHMP1SfVTGrtmM+C9upWeOVtOCeDh+NjYYnc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=pRlOQzVLTrOSCTdYbFhfqwr8ec62Tp6bTHiA/nFwZ84vAw+PnTdrgDtrditMbguH4GVtMxNWcR9khKxN1d5usoFq0MdpsOewecAnDza1+jbiaRpDq01winE4lKee4TwBXyL6/Llg2eRc0T1SE4jpX29rVX5nwFYXYGdfxLV8NkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LYSPs067; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LYSPs067"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730899566; x=1762435566;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=6TJ3NxpjHMP1SfVTGrtmM+C9upWeOVtOCeDh+NjYYnc=;
  b=LYSPs067MrB1V/Jb06uQ51SMCuIkcDI7BcS2bmSuUt65hj4tGDDiDeoW
   nZViQfJQQ03JnvdOsrfQtgUbuCsHnHraAenND9tvRv88OTKSd56BxCjz9
   oQHlc4ciTwZwu5dgMNC1HEd1r07A57TNvvzP+Xh7E9XvtUc2hgkVKYuwT
   Foc2JA4yLVzotk8mMNf5UNluToRXm1ZPW9Glwv7gNUFILB6Ss1LI5NcH9
   PD76t8Fa5YnTN4KoQHjmfhrNz8UF3Lhft4kzvQmC9OeAI9hyCGR9v0bYg
   w550aCNa6I9VrT3ON/5PzwLYKtDGb7e6MtTsQNheqaRrkYzgMC3ne4sPo
   w==;
X-CSE-ConnectionGUID: WILgd31+T2uPJvFsbGfVVQ==
X-CSE-MsgGUID: wm7V4WpRTNqlscRrDqSkew==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41245262"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41245262"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 05:26:06 -0800
X-CSE-ConnectionGUID: jb3j7NneSPqNt5DLtyBMag==
X-CSE-MsgGUID: FCIkQFKtReyPwGfQqdtq8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="84638560"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.110])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 05:26:03 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 6 Nov 2024 15:25:59 +0200 (EET)
To: Hans de Goede <hdegoede@redhat.com>
cc: Andy Shevchenko <andy.shevchenko@gmail.com>, 
    Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 2/3] platform/x86: x86-android-tablets: Add support
 for getting i2c_adapter by PCI parent devname()
In-Reply-To: <20b471ed-2e49-4a45-9b1c-25d9c2a181dd@redhat.com>
Message-ID: <f1911338-37fb-931e-5045-20029a5897f0@linux.intel.com>
References: <20241104200848.58693-1-hdegoede@redhat.com> <20241104200848.58693-3-hdegoede@redhat.com> <CAHp75VdJZeVmAjceMYQ-QZf-+RHAY5Y0nuyXgtVFzSiQ4yMPag@mail.gmail.com> <20b471ed-2e49-4a45-9b1c-25d9c2a181dd@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-2029054700-1730899559=:928"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-2029054700-1730899559=:928
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 5 Nov 2024, Hans de Goede wrote:

> Hi,
>=20
> On 5-Nov-24 9:22 AM, Andy Shevchenko wrote:
> > On Mon, Nov 4, 2024 at 10:09=E2=80=AFPM Hans de Goede <hdegoede@redhat.=
com> wrote:
> >>
> >> On the Vexia EDU ATLA 10 tablet, which ships with Android + a custom L=
inux
> >> (guadalinex) using the custom Android kernel the I2C controllers are n=
ot
> >> enumerated as ACPI devices as they typically are.
> >>
> >> Instead they are enumerated as PCI devices which do not have ACPI firm=
ware
> >> nodes associated with them, so getting the i2c_adapter by the ACPI pat=
h of
> >> its firmware node does not work.
> >>
> >> Add support for getting the i2c_adapter by the devname() of its PCI pa=
rent
> >> instead.
> >=20
> > Reviewed-by: Andy Shevchenko <andy@kernel.org>
> >=20
> > ...
> >=20
> >>         struct i2c_board_info board_info =3D client_info->board_info;
> >> -       struct i2c_adapter *adap;
> >> +       struct i2c_adapter *adap =3D NULL;
> >=20
> > Unneeded change.
>=20
> Ack I noticed this myself and I thought I had dropped this change,
> but apparently I did not.
>=20
> Ilpo can you fix this up while merging or do you want a v3 series?

Thanks both.

I removed this change while applying. I also made minor adjustments to the=
=20
braces in the patch 3 for stylish consistency.

--=20
 i.

--8323328-2029054700-1730899559=:928--
