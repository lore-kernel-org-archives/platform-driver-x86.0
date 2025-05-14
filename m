Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B49C1E04BD
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 May 2025 10:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747218248; cv=none; b=g5AfLBjNAHvm+MQ0E55zk532lZvehT0KpIlmMreELO4Hj5KtX1ePtks+yDMrTzz2AIYmVXxFfotICbxJ9qQsk3Q1S5zCPqEz0QKpBQRA4K0ckKhfb6/nKvHUa4mJU6t2m8r9TUu/IhstSAOyet6fyeXLlUx8QcylohqWKx11iFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747218248; c=relaxed/simple;
	bh=9nh7qho2kCx+6rwiqp0Mymt1jKEyg5caCQVmne+OhnU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=GqqeY5uk7ZOKrR4nT7mtXD3leZq9NYH2PXGeGy17oQyZ18g2IqqYCmqUwM6TBiNQ5XAY6cpbmmXL+nAJ2TlEkZ1in6KtD4+dRJld5Lvd2gEoOqdXrN5CRVaHJJcI2yFcPigVLjyZoEAzC96ASSO0jlW3x05e7nBlnXOp06sUfms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K09aS1E+; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K09aS1E+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747218248; x=1778754248;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=9nh7qho2kCx+6rwiqp0Mymt1jKEyg5caCQVmne+OhnU=;
  b=K09aS1E+q8fxDLu+rolS5Ea/1cYxqQ02NIH2atvUHWHfXK2znchfzE38
   SOwVW1SmsTcL54mHpzIgGv2N8vA1W8+ZKsOG4hthIu+APSrQU/sS/9YWw
   oIfF3eI0x3nrCxiK49abXPswMQQuebwO4jfDVsCL1kun1OEIaIwamQC4h
   3CGaBXYTWtLTYq2qjbJ49ldUBCFxvRau1c6l9oDomt9fQWL5i0ESNVqpr
   PIhzLIpUMO/dwG0ix4/Tb1qaDZlOfWQSc6sSvlO/CNYJMrmK6r81sjmXt
   Ln8L0aja3k1d6glfVErTsIEd5SIWl2HU52sfs5FRiIk8UQZvwXr+4g67f
   g==;
X-CSE-ConnectionGUID: lEr5CfrvSDeycnZ+4JQxtA==
X-CSE-MsgGUID: e1F0hdspR36LyImN9gTegQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48978251"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="48978251"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 03:24:07 -0700
X-CSE-ConnectionGUID: zmS+IDhKQV2XAZ1p76piSA==
X-CSE-MsgGUID: XA3DtTl2TIq/Fj5EzWdqfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="175131193"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.231])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 03:24:05 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 14 May 2025 13:24:01 +0300 (EEST)
To: Jelle van der Waa <jvanderw@redhat.com>
cc: Armin Wolf <W_Armin@gmx.de>, Ike Panhc <ikepanhc@gmail.com>, 
    Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/1] platform/x86: ideapad: Expose charge_types
In-Reply-To: <e6cbd30b-5e97-49ba-9f62-2e7e1fe835fc@redhat.com>
Message-ID: <73f7bcd0-d9e3-ff9a-133f-3b8c94b0139d@linux.intel.com>
References: <20250511113012.9251-1-jvanderw@redhat.com> <20250511113012.9251-2-jvanderw@redhat.com> <964a9e0b-8901-4f50-a725-9f841fa6914d@gmx.de> <e6cbd30b-5e97-49ba-9f62-2e7e1fe835fc@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1913238170-1747218241=:1054"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1913238170-1747218241=:1054
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 13 May 2025, Jelle van der Waa wrote:

> On 5/12/25 00:54, Armin Wolf wrote:
> > Am 11.05.25 um 13:30 schrieb Jelle van der Waa:
> >=20
> > > From: Jelle van der Waa <jvanderwaa@redhat.com>
> > >=20
> > > Some Ideapad models support a battery conservation mode which limits =
the
> > > battery charge threshold for longer battery longevity. This is curren=
tly
> > > exposed via a custom conservation_mode attribute in sysfs.
> > >=20
> > > The newly introduced charge_types sysfs attribute is a standardized
> > > replacement for laptops with a fixed end charge threshold. Setting it=
 to
> > > `Long Life` would enable battery conservation mode. The standardized
> > > user space API would allow applications such as UPower to detect lapt=
ops
> > > which support this battery longevity mode and set it.
> > >=20
> > > Tested on an Lenovo ideapad U330p.
> >=20
> > Hi,
> >=20
> > i like the idea behind this patch series, the charge_types attribute is
> > indeed
> > exactly what we need in this case.
>=20
> Thanks! Credit where credit is due, this idea came from Hans de Goede (wh=
o
> also added charge_types). I only wrote the code.

Add a Suggested-by tag then so the relevant people are easier to find,=20
lets say, after 5 years from now.

> > > =C2=A0 .../ABI/testing/sysfs-platform-ideapad-laptop |=C2=A0=C2=A0 2 =
+
> > > =C2=A0 drivers/platform/x86/ideapad-laptop.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 126 +++++++++++++++++-
> > > =C2=A0 2 files changed, 125 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
> > > b/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
> > > index 4989ab266682..83eca4c14503 100644
> > > --- a/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
> > > +++ b/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
> > > @@ -32,6 +32,8 @@ Date:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Aug=
 2017
> > > =C2=A0 KernelVersion:=C2=A0=C2=A0=C2=A0 4.14
> > > =C2=A0 Contact:=C2=A0=C2=A0=C2=A0 platform-driver-x86@vger.kernel.org
> > > =C2=A0 Description:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This interface is depreca=
ted; please use /sys/class/
> > > power_supply/*/charge_types.
> > > +
> >=20
> > Maybe it would make sense to move this attribute to Documentation/ABI/
> > obsolete?
>=20
> I am not sure what the normal workflow is so I've applied this suggestion=
 in
> v2.
>=20
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *ex=
t_data,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum pow=
er_supply_property psp,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const un=
ion power_supply_propval *val)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0 struct ideapad_private *priv =3D ext_data;
> > > +=C2=A0=C2=A0=C2=A0 int err;
> > > +
> > > +=C2=A0=C2=A0=C2=A0 if (psp !=3D POWER_SUPPLY_PROP_CHARGE_TYPES)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
> > > +
> > > +=C2=A0=C2=A0=C2=A0 err =3D exec_sbmc(priv->adev->handle,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (=
val->intval =3D=3D POWER_SUPPLY_CHARGE_TYPE_LONGLIFE ?
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 SBMC_CONSERVATION_ON : SBMC_CONSERVATION_OFF));
> >=20
> > AFAIK the power supply core does not check if val->intval holds a suppo=
rted
> > charge type value.
> > Please use a switch case to return -EINVAL in such cases.
>=20
> From my testing checking val->intval wasn't needed, you'll get an "write
> error: invalid argument" when trying to set "Long lifeee".
>=20
> I believe that is handled in power_supply_store_property, but reading the=
 code
> I don't really believe that's true? So I've simply switched it over to a
> switch/case.
>=20
> Thanks,
>=20
> Jelle
>=20

--=20
 i.

--8323328-1913238170-1747218241=:1054--
