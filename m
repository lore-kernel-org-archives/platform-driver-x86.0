Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F74F212F98;
	Mon, 29 Dec 2025 10:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767002908; cv=none; b=JgK1Cy4bA/qE+5169VdB2JBgijbUTfKwNTz8R9HGjrX5Uhknla8F/gIF5rOEq4cBpSUrFUD8cL7tiBtnR5EVhVFXVd7vRJAobm36aTWYt8gHs18BLvwb47dkJE8b6UsXUft7inicrQNFKLdRFh0ry7xHH/kaz1DgS6POIc2fps0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767002908; c=relaxed/simple;
	bh=MV//UcYh+u4VwpmK5ZwJHdBF+Fug2AnfF5Apf5vVGwM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=JSvnuP3WmfRYhNE6ZSeinXGV7O0nAZfHwymhGDent1vZ7rMYIsCelRjLybN2OdHP8ehuFgzcH7o1XnKb+hKEFH3/O8kjji/KTMh2Aq/DZmyHkYXyTdQ92y6p9BMlB1OmItXSUn0W/o0z64+dRlyhkKVl57ketMAd4d4n5JjPn44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XwiPFW7c; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XwiPFW7c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767002906; x=1798538906;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=MV//UcYh+u4VwpmK5ZwJHdBF+Fug2AnfF5Apf5vVGwM=;
  b=XwiPFW7cDmT6OMvdDSHxZmcaDbCcWtrbtXtd6XH/EZP9NcOZEYapPEmQ
   SW799fh2e+oGEckAjBMGwYKNSdoG5i0EsfJoISM9wCZFvFWvOVdCQPEfi
   2hVhGK56lro6rJJabanx2bvvbn3W6lrX4fsDG46s0R6IwtcS/qt88Az1Z
   WaVelZssVilnVa03GfLOb4GAaJg3oAdrK7xHyfxehjrttVfbp5lcDVFmT
   Ix/NwQOOpjlWEc399oTVKJwXBATRD9gx5nzwNDnRDXufRjoCkMPaq0Uy3
   QILk6x61pv16U00s/ZN+on8c5MYHKymKoCMqddcYplrSziLOs1+cXpe/B
   w==;
X-CSE-ConnectionGUID: SL15tZS8RCihnZozHunXRA==
X-CSE-MsgGUID: yqe3kE7wQz6VLU61jI76ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="80065896"
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="80065896"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 02:08:25 -0800
X-CSE-ConnectionGUID: LQjYeyDqSSC40dPylml2/w==
X-CSE-MsgGUID: Ze3CT/KFQvS7D4N95W5ynQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="205795356"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.30])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 02:08:22 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 29 Dec 2025 12:08:19 +0200 (EET)
To: Denis Benato <denis.benato@linux.dev>
cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    Hans de Goede <hansg@kernel.org>, "Luke D . Jones" <luke@ljones.dev>, 
    Mateusz Schyboll <dragonn@op.pl>, Denis Benato <benato.denis96@gmail.com>
Subject: Re: [PATCH 2/3] platform/x86: asus-wmi: fix sending OOBE at probe
In-Reply-To: <f7537660-2b7a-e157-ec6a-17057dcdfbd9@linux.intel.com>
Message-ID: <bea7543c-744f-156b-365f-c86116df9ca2@linux.intel.com>
References: <20251225143007.2684239-1-denis.benato@linux.dev> <20251225143007.2684239-3-denis.benato@linux.dev> <f7537660-2b7a-e157-ec6a-17057dcdfbd9@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-86253462-1767002899=:974"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-86253462-1767002899=:974
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 29 Dec 2025, Ilpo J=E4rvinen wrote:

> On Thu, 25 Dec 2025, Denis Benato wrote:
>=20
> > Disabling oobe is an important step to be able to fully control

Also, please capitalize OOBE here as well.

--=20
 i.

> > the hardware in TUF laptops that supports this feature,
> > but the command has been incorrectly tied to deprecated
> > attributes: restore sending the OOBE exit command.
>=20
> Please reflow to 72 chars.
>=20
> Fixes tag seems to be missing.
>=20
> > Signed-off-by: Denis Benato <denis.benato@linux.dev>
> > ---
> >  drivers/platform/x86/asus-wmi.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asu=
s-wmi.c
> > index a49447eff4f4..8dfdde7877a8 100644
> > --- a/drivers/platform/x86/asus-wmi.c
> > +++ b/drivers/platform/x86/asus-wmi.c
> > @@ -4899,7 +4899,6 @@ static int asus_wmi_add(struct platform_device *p=
dev)
> >  =09asus->egpu_enable_available =3D asus_wmi_dev_is_present(asus, ASUS_=
WMI_DEVID_EGPU);
> >  =09asus->dgpu_disable_available =3D asus_wmi_dev_is_present(asus, ASUS=
_WMI_DEVID_DGPU);
> >  =09asus->kbd_rgb_state_available =3D asus_wmi_dev_is_present(asus, ASU=
S_WMI_DEVID_TUF_RGB_STATE);
> > -=09asus->oobe_state_available =3D asus_wmi_dev_is_present(asus, ASUS_W=
MI_DEVID_OOBE);
> > =20
> >  =09if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_MINI_LED_MODE))
> >  =09=09asus->mini_led_dev_id =3D ASUS_WMI_DEVID_MINI_LED_MODE;
> > @@ -4912,6 +4911,8 @@ static int asus_wmi_add(struct platform_device *p=
dev)
> >  =09=09asus->gpu_mux_dev =3D ASUS_WMI_DEVID_GPU_MUX_VIVO;
> >  #endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
> > =20
> > +=09asus->oobe_state_available =3D asus_wmi_dev_is_present(asus, ASUS_W=
MI_DEVID_OOBE);
> > +
> >  =09if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_THROTTLE_THERMAL_P=
OLICY))
> >  =09=09asus->throttle_thermal_policy_dev =3D ASUS_WMI_DEVID_THROTTLE_TH=
ERMAL_POLICY;
> >  =09else if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_THROTTLE_THER=
MAL_POLICY_VIVO))
> >=20
>=20
>=20

--8323328-86253462-1767002899=:974--
