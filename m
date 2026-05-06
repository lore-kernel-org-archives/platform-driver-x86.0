Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E898347799D;
	Wed,  6 May 2026 13:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778074953; cv=none; b=tVrLC9cnFHtuu4es9V/MDML6NkombWIZzLMs3MWaE+zatoCyc+F++yjqBVwu3NN592jcAwWLUqg8TAn4ZBp1eXAeYNJ0gJgAKltB8pgGNJIgATcybs9oWSQGi2YIjlQKsvIYPQsgX5ulBfrme/7059EHaOGCPOabe7A8U34SCsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778074953; c=relaxed/simple;
	bh=GfG6v2xvPUfbCB93ujmkF1SZWIMgacxnKhUUMEgznTI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ZPmC4zNAAwvO0QpK6CmyoI8e33CtdEPQ4sD6j3PBTH2C3BaxRZxy7aQMUlIG448KS1BTXBtx6zBMCttPZ1+3oz6Pf1u8OzBm/vqh1TVbZN2kfEmLnKLuhm9C/0kVwpIRbWxhRbmo/31uKDGeid7Bbym3vF7Nuv8+MX44rrdJ/d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VO/uuEr0; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VO/uuEr0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778074937; x=1809610937;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=GfG6v2xvPUfbCB93ujmkF1SZWIMgacxnKhUUMEgznTI=;
  b=VO/uuEr0f080d2JC5piRCcvEplFl3FK1+8ncAATLK61s+y4GyWWWJrkI
   8TBSmzJaicB2AIWgpTyNdPv3MLX25dCQLmeMnD87DvncUPGGVEKk5of6i
   ftexaaSXs4u7hC3pA+j+Uq0C/yacWYbBzoTYjOz2ajGizPgIjm36EXqm2
   kPR8Dh+9QMv70uiLz5jpn8VgNAYIIF2t4qawgqguDeqwd50AwJb7C6HUM
   t0MqHgZ5oXlu0GRqZFT5Gs4e4Fk4nHULR2pUbC2Bgek5lEiknbGyYpJyb
   z10g9tZkQ1YOaLlkPhzNaEWD8IBTHrm1gwYAcmDR0immeTyHi5fyTXs/p
   g==;
X-CSE-ConnectionGUID: LYAoJQeCQRa0TErUyfDU6A==
X-CSE-MsgGUID: OSk1DH9+T3q06IOfLaHy7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="90102987"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="90102987"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 06:42:16 -0700
X-CSE-ConnectionGUID: hFmSr2AJQxuf2yLgifFO2g==
X-CSE-MsgGUID: sQriKx8TQlucHOmmz6Idaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="240486436"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.231])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 06:42:13 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 6 May 2026 16:42:08 +0300 (EEST)
To: Armin Wolf <W_Armin@gmx.de>
cc: Hans de Goede <hansg@kernel.org>, wse@tuxedocomputers.com, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/7] platform/x86: uniwill-laptop: Properly initialize
 charging threshold
In-Reply-To: <903a013e-a3fb-49ea-a6f9-ad6577d57a44@gmx.de>
Message-ID: <4766afa5-4128-a9fc-0792-b83e2fb48e6e@linux.intel.com>
References: <20260417050912.5582-1-W_Armin@gmx.de> <20260417050912.5582-2-W_Armin@gmx.de> <9cc1d286-f41a-c920-aaad-1c24c4e6f2f7@linux.intel.com> <903a013e-a3fb-49ea-a6f9-ad6577d57a44@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1302729695-1778074928=:980"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1302729695-1778074928=:980
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sun, 3 May 2026, Armin Wolf wrote:

> Am 30.04.26 um 14:53 schrieb Ilpo J=C3=A4rvinen:
> > On Fri, 17 Apr 2026, Armin Wolf wrote:
> >=20
> > > The EC might initialize the charge threshold with 0 to signal that
> > > said threshold is uninitialized. Detect this and replace said value
> > > with 100 to signal the EC that we want to take control of battery
> > > charging. Also set the threshold to 100 if the EC-provided value
> > > is invalid.
> > >=20
> > > Fixes: d050479693bb ("platform/x86: Add Uniwill laptop driver")
> > > Reviewed-by: Werner Sembach <wse@tuxedocomputers.com>
> > > Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> > > ---
> > >   drivers/platform/x86/uniwill/uniwill-acpi.c | 28 ++++++++++++++++++=
++-
> > >   1 file changed, 27 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c
> > > b/drivers/platform/x86/uniwill/uniwill-acpi.c
> > > index faade4cf08be..8f16c94221aa 100644
> > > --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> > > +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> > > @@ -1404,7 +1404,12 @@ static int uniwill_get_property(struct power_s=
upply
> > > *psy, const struct power_sup
> > >   =09=09if (ret < 0)
> > >   =09=09=09return ret;
> > >   -=09=09val->intval =3D clamp_val(FIELD_GET(CHARGE_CTRL_MASK, regval=
),
> > > 0, 100);
> > > +=09=09regval =3D FIELD_GET(CHARGE_CTRL_MASK, regval);
> > > +=09=09if (!regval)
> > > +=09=09=09val->intval =3D 100;
> > > +=09=09else
> > > +=09=09=09val->intval =3D min(regval, 100);
> >=20
> > ...
> >=20
> > > +=09/*
> > > +=09 * The charge control threshold might be initialized with 0 by
> > > +=09 * the EC to signal that said threshold is uninitialized. We thus
> > > +=09 * need to replace this value with 100 to signal that we want to
> > > +=09 * take control of battery charging. For the sake of completeness
> > > +=09 * we also set the charging threshold to 100 if the EC-provided
> > > +=09 * value is invalid.
> > > +=09 */
> > > +=09threshold =3D FIELD_GET(CHARGE_CTRL_MASK, value);
> > > +=09if (threshold =3D=3D 0 || threshold > 100) {
> > > +=09=09FIELD_MODIFY(CHARGE_CTRL_MASK, &value, 100);
> >=20
> > AFAICT, this does exactly the same thing as the other code above (but
> > looks very different on surface). Wouldn't it make sense to have them
> > share code?
>=20
> I do not think that this would be a good idea. The two call sides are two
> different, creating a helper function for both would likely be very
> difficult.

Both seem to be sanitizing the charge control threshold (AFAICT, both map=
=20
0 and out-of-range values to 100) isn't that the case? Why cannot we have=
=20
uniwill_charge_ctrl_thres_sanitize() or something along those lines?

--=20
 i.

--8323328-1302729695-1778074928=:980--
