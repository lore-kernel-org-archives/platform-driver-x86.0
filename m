Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F392459DB
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 Jan 2025 13:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736946477; cv=none; b=heP+hyE37Lrw4RocfIieCvpxtOBT/PR+TELiztHYU9JpBUdmsboN44yjR6pztpBJ0rrlOMkGsALnhVkaqE3Y3NeGnr1602ZiR6qbYhSb8RpCGf3pHKDIEnp3SMo1jFfgZRGO6OFGY0SXHfb8xxBVroXgJVKmd5G6dW1EBMt0dWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736946477; c=relaxed/simple;
	bh=m59t6VC8sLMVky3ii4f7vOZQJP71I7pnEak5PTzosxc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=H7Q2yu37ZTWCQVdeE+Zgz2Z+b5c1+/CtFlGGb6e8ONeSbDrSrEy6sse18V9thP3FWsqrYDIT7R72qglBIar0RbpPOz6bNwW2bQzZ0+XJQbkdpzDcrN4XF2s0txPlzqhn203ZzCyjMd35Wx8lyxsAUOKqra0KPxEyJJrYlbMwadM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EvhHkh/q; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EvhHkh/q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736946476; x=1768482476;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=m59t6VC8sLMVky3ii4f7vOZQJP71I7pnEak5PTzosxc=;
  b=EvhHkh/qLcnkBM6ww3BXD5RAK1iTYbDQ0nA1IWJGEkpw6uM6K9schk4H
   8LouKClltH6+PwQfjjZade3vgKd1q/w9YRHkr9c8tYyRIwlfFfpOrwMeb
   5qTM/6yGxfHUDaA0iP8QfrVPgN/znymq7klZbtCmNp2XrFYrEJSS9kcUj
   lzJ7lV1ijvW3Iv3jXnNwplNYakw9LmQFciq76anV+0xqpHxFplTlC3Yxf
   lYG38cg2Ts/7r9/5YXj89QBq9LMoyPCCDNYS/lzxB+Brr7vRKuCO/9JqO
   eQ+uygt/MAEq2+p4cpVAues/4bozosrA2V5JspqN3lNMaOb9IffRE+B50
   w==;
X-CSE-ConnectionGUID: 3WTc8s19SOOgYo5gkm0zew==
X-CSE-MsgGUID: 4RAzeZD1Q3itL05vrkPNdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="40960570"
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; 
   d="scan'208";a="40960570"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 05:07:26 -0800
X-CSE-ConnectionGUID: ttEhSTxJT/SFOKPX1Lif6A==
X-CSE-MsgGUID: P1SMG2FFSIWZvbIgCNh23g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="110119928"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.214])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 05:07:25 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 15 Jan 2025 15:07:21 +0200 (EET)
To: Julien ROBIN <julien.robin28@free.fr>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: hp-wmi: Add fan and thermal profile
 support for Victus 16-s1000
In-Reply-To: <56832678-58a6-45f2-a462-a6275b5d8dc1@free.fr>
Message-ID: <19549b0b-0a73-6948-bde3-00c36d83270f@linux.intel.com>
References: <24b54c4c-6c4d-47a6-bc6f-1be8922bbf69@free.fr> <5dd4d3f4-a643-49fb-cf03-c68fb1bdd8e9@linux.intel.com> <56832678-58a6-45f2-a462-a6275b5d8dc1@free.fr>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1773974665-1736946385=:952"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1773974665-1736946385=:952
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 14 Jan 2025, Julien ROBIN wrote:

> Thanks for the fast answer,
>=20
> On 1/14/25 5:20 PM, Ilpo J=C3=A4rvinen wrote:
> >> Changes since v1:
> >> - More clear description of 0xFF special effect when setting power lim=
its
> >> - Added structs for clearer naming of power limits and GPU power modes=
 settings
> >> - Retrieve and keep current GPU slowdown temp threshold (instead of ha=
rd coded)
> >> - Removed platform_profile_victus_s_get(), re-using platform_profile_o=
men_get()
> >> - Changed char variable types to u8 where it was more relevant
> >> - Moved some comments
> >> - Minor typo / alignment corrections
> >=20
> > I wrote a few comments to the v1 thread as the relevant discussion was=
=20
> > there but they'll be relevant to a few places in this v2.
>=20
> >> +static int hp_wmi_get_fan_count_userdefine_trigger(void)
> >> +{
> >> +=09u8 fan_data[4] =3D { 0 };
> >=20
> > {} is enough to initialize the entire array.
>=20
> >> +static int hp_wmi_get_fan_speed_victus_s(int fan)
> >> +{
> >> +=09u8 fan_data[128] =3D { 0 };
> >=20
> > Ditto.
>=20
> Understood, I just applied that.
>=20
> While discussing these array initialisations to zero: I'm addressing=20
> what we finished discussing in the v1 thread by defining and using the=20
> following self explanatory named literals (instead of comments):
>=20
> #define HP_FAN_SPEED_AUTOMATIC=09 0x00
> #define HP_POWER_LIMIT_DEFAULT=09 0x00
> #define HP_POWER_LIMIT_NO_CHANGE 0xFF

Sound good.

> In this particular case, while technically the {} would work, I suppose i=
t would still be preferable to change from:
> u8 fan_speed[2] =3D { 0 }; /* Restores automatic speed */
> to:
> u8 fan_speed[2] =3D { HP_FAN_SPEED_AUTOMATIC }

Do you actually want this?

u8 fan_speed[2]  =3D { HP_FAN_SPEED_AUTOMATIC, HP_FAN_SPEED_AUTOMATIC };

That is, are those both bytes fans?

> >> +static int hp_wmi_fan_speed_max_reset(void)
> >> +{
> >> +=09int ret =3D hp_wmi_fan_speed_max_set(0);
> >> +
> >> +=09if (ret)
> >=20
> > To keep the call and its error handling together, please use this form:
> >=20
> > =09int ret;
> >=20
> > =09ret =3D hp_wmi_fan_speed_max_set(0);
> > =09if (ret)
>=20
> Understood, and applied.
>=20
> Before sending the resulting v3, would you like me to apply this form=20
> change, alongside with { 0 } becoming {}, to some others already=20
> existing functions around? I prefer asking before doing so, because by=20
> default I'm not sure changing unrelated already existing lines is=20
> expected when sending a patch.=20

Yes, please change all similar cases. I always assume/hope people look=20
through their own patches for similar things to address. If I'd try to=20
mark all of cases, I'd anyway miss a few because my review is not going to=
=20
be perfect (often I only realize these mid-patch, having passed n similar=
=20
cases already; I try to focus on finding logic problems but I catch many=20
many style things too while at it).

> If not, I suppose this may be the matter of another future and unrelated=
=20
> patch submission.=20
>=20
> Thanks again for the review work.

You can always improve the patches beyond what is mentioned by the review=
=20
comments! :-)

--=20
 i.

--8323328-1773974665-1736946385=:952--
