Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865FE38237D;
	Mon, 29 Jun 2026 11:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782733123; cv=none; b=QrGqly27bDSgTCXO+RdOfJufzwFxyAb36K74Kw3bUUPfRWW1zaQohWMPyMQv/sLiAZ93NDJtXI7YHixnKfNt4RmPrOwgCwFjDkTwQa7Wa1V4y0COFo3fjKyykbHTwxAW43d3lYu01Pjcid2LERhN9MTUt5l7v0grq8Qrvrc+msY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782733123; c=relaxed/simple;
	bh=lGj8wZH9uFzA70rfCdG0cD51NJY+SgOwIllnzCf2CSs=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=EqxqFlVJd6S+mlDjfyAZ6dTLZJ+sIitcrPeeAiahUu8tTLPk6MJSBP3w/r4I4WgiZ6FzoxkaQnejjZCCI4v+veDTPpV0IT3PBW2RKb8xCfLBPyylauyjLzvRGfl2RmhCX2mB4gCm0dWrySVRvacwqKOw5SNhCB9brKrw6N0CgZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DDWp0bgG; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DDWp0bgG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782733121; x=1814269121;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=lGj8wZH9uFzA70rfCdG0cD51NJY+SgOwIllnzCf2CSs=;
  b=DDWp0bgGJP/2CkIwNHZRPYrwpVqO+DfLs2tfrtQhpt643Z8nvqi3Gl5L
   3jI0IEgQb5c1ie/8N9RMZh7XxypCYyPZmG/SjrkekOxBc+D3wCAnv2jB8
   31omYUChyEx7V0LPqyEaqucG4ARclRiuczN7njAsuRPicxFoloTaSBLEr
   90mqPCr/i57Kw+lRLK3cYFub1DLyVk2wbabeY1OiwqPygt/HhgFJhhZSr
   79GiUvF3iWq9hGCYfbv6oQUWJbUaZZNq9fsJvS2zrrU1ibqPHNqgFHf0c
   9rkCVjNmKWX87adW+iKNYjvq/lguVq3xk28zAY8gWgxXjBso0kWGZzEOF
   g==;
X-CSE-ConnectionGUID: ofKrF5b9S1WbkKos0keJpw==
X-CSE-MsgGUID: 6/bK+QYySg66Ke5ifFZhRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="87259326"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="87259326"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 04:38:41 -0700
X-CSE-ConnectionGUID: caLDQAtPR+Gdn41Q7i+1iQ==
X-CSE-MsgGUID: RswRZdwVQLWOSn9j5BAZyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="251541011"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.42])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 04:38:38 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 29 Jun 2026 14:38:35 +0300 (EEST)
To: =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
cc: Linus Torvalds <torvalds@linux-foundation.org>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v3 09/16] platform/x86: x86-android-tablets: Add include
 defining struct dmi_system_id
In-Reply-To: <ad0c801eb9c5814bd2430f1e8c370fee82742897.1782682124.git.ukleinek@kernel.org>
Message-ID: <3bcb32f8-00d2-905c-3dc1-e8730611fb6a@linux.intel.com>
References: <cover.1782682124.git.ukleinek@kernel.org> <ad0c801eb9c5814bd2430f1e8c370fee82742897.1782682124.git.ukleinek@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1000872987-1782733115=:1167"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1000872987-1782733115=:1167
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sun, 28 Jun 2026, Uwe Kleine-K=C3=B6nig (The Capable Hub) wrote:

> Currently <linux/i2c.h> includes <linux/mod_devicetable.h> transitively
> which ensures that struct dmi_system_id is defined in
> drivers/platform/x86/x86-android-tablets/x86-android-tablets.h. However
> this include in <linux/i2c.h> will be replaced by one for i2c_device_id
> only. To ensure that dmi_system_id is available add the include for that
> explicitly.
>=20
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>
> ---
>  drivers/platform/x86/x86-android-tablets/x86-android-tablets.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/platform/x86/x86-android-tablets/x86-android-tablets=
=2Eh b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
> index 2498390958ad..c756961ae5fd 100644
> --- a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
> +++ b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
> @@ -13,6 +13,7 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/i2c.h>
>  #include <linux/irqdomain_defs.h>
> +#include <linux/device-id/dmi.h>
>  #include <linux/spi/spi.h>
> =20
>  struct gpio_desc;

Indirect include patchs are never a good idea as it always makes header=20
reorganizations minefield. So for this change,

Acked-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>


When it comes to the series, I certainly like the direction it goes very=20
much (never have been fan of mod_devicetable.h) but I'd have preferred=20
stepwise approach over trying to introduce it to some mid-rc.

--=20
 i.

--8323328-1000872987-1782733115=:1167--
