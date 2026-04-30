Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC20402B8F;
	Thu, 30 Apr 2026 12:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777553765; cv=none; b=MpzNwTXhJlym+xaHwmF9RQRDuUZGM6RbJtS0AWZJ9AXX97NM3ibHwfD5BZqM7iLB3iiizBq/ivdAoQI8H0jByStfxaMg54jlAZ26IsY6o861P6lYFseEhz5STYXAxRJxlU/+AuPxyMQ8avJihTOnQGQ53EqUf5G6NNU4zxfZU/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777553765; c=relaxed/simple;
	bh=DqTbXZG9AzfZcLYSNu5BNH5GOL6vOpd5FUqcmcsaxWo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=komyg28cjMDDO8T9goGeL+dRmflhKrLBRndZ5lOzKhUqQfjZKoGQfh2RwYZnPvVr69qvNaGKMlacWMBigr7xsvp+uxizEIWAtOFj76ePo6l5AJLg4rpNWR7K6346IT5s62G2aM6zVeuJluVxtN+5sPaO4N4jD+o2PA4NMlFqZdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eu7U6WDI; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eu7U6WDI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777553765; x=1809089765;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=DqTbXZG9AzfZcLYSNu5BNH5GOL6vOpd5FUqcmcsaxWo=;
  b=eu7U6WDID8N5SH6PKC+B6KfCUFTc90IQeBitBLlb4H6qWUish0RPFSSH
   WtZKfAb4expTewvyfSlYx6w6P3AfzrE29eS1wWj+baKQPXWD4tzQ/SExN
   AShpMNQdGj61pUwoIDDwqpXVj1x8I0dDI7vYuKGhvg667hG6JWEgGcrZj
   ZQ9uXsCFAidXoWbQqMGBxKNTDPpEGZpIcm0U2OJO7311ZpCg1sqL5NdvP
   NEHes15XyOHgI5JiTu/GjN376omU6prr4cxqmbUYwiNyCHX7ojYv6xyUm
   /aQrDxRtmTnf85hS79eT40nZI8sUvtrwX4hL7WkcnJ41Iv4xl9L9VOo7M
   A==;
X-CSE-ConnectionGUID: Dcds1RptTFyMN2GTDh2i4Q==
X-CSE-MsgGUID: fR81SayVT9mkVfy5qOJShw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="89594991"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="89594991"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 05:56:04 -0700
X-CSE-ConnectionGUID: mrwJs5SlTtuuUcIIyjxgWQ==
X-CSE-MsgGUID: m2dv529oTAuaW3yZzDGQRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="272692845"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.130])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 05:56:01 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 30 Apr 2026 15:55:57 +0300 (EEST)
To: Armin Wolf <W_Armin@gmx.de>
cc: Hans de Goede <hansg@kernel.org>, wse@tuxedocomputers.com, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/7] platform/x86: uniwill-laptop: Accept charging
 threshold of 0
In-Reply-To: <20260417050912.5582-3-W_Armin@gmx.de>
Message-ID: <29485445-6c19-2b5e-101b-3192ff26f269@linux.intel.com>
References: <20260417050912.5582-1-W_Armin@gmx.de> <20260417050912.5582-3-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-202132219-1777553757=:971"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-202132219-1777553757=:971
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 17 Apr 2026, Armin Wolf wrote:

> The power supply sysfs ABI states that:
>=20
> =09Not all hardware is capable of setting this to an arbitrary
> =09percentage. Drivers will round written values to the nearest
> =09supported value. Reading back the value will show the actual
> =09threshold set by the driver.
>=20
> The driver currently violates this ABI by rejecting a charging
> threshold of 0. Fix this by clamping this value to 1.
>=20
> Fixes: d050479693bb ("platform/x86: Add Uniwill laptop driver")
> Reviewed-by: Werner Sembach <wse@tuxedocomputers.com>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  drivers/platform/x86/uniwill/uniwill-acpi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfo=
rm/x86/uniwill/uniwill-acpi.c
> index 8f16c94221aa..5551f193c2c1 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -1424,11 +1424,11 @@ static int uniwill_set_property(struct power_supp=
ly *psy, const struct power_sup
> =20
>  =09switch (psp) {
>  =09case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
> -=09=09if (val->intval < 1 || val->intval > 100)
> +=09=09if (val->intval < 0 || val->intval > 100)
>  =09=09=09return -EINVAL;
> =20
>  =09=09return regmap_update_bits(data->regmap, EC_ADDR_CHARGE_CTRL, CHARG=
E_CTRL_MASK,
> -=09=09=09=09=09  val->intval);
> +=09=09=09=09=09  max(val->intval, 1));
>  =09default:
>  =09=09return -EINVAL;
>  =09}
>=20

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-202132219-1777553757=:971--
