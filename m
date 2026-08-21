Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9283938399E;
	Fri, 21 Aug 2026 08:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787300092; cv=none; b=Kxfl7BmDZm0NZ/gCakmMtxDv6fXljAcWzOmrJ7mfOQrwUxWvnDIMJAtZ9BNoseULj1GlUnq1s3hcjAb2hqyvI1o6wO3P8I1KS7w88Mc477LLqJOtyOBLjLXsgWaqxQgypaq1wtDJc07+IyGzpxLiAobKDtprRQ1uiG0GUk1I/AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787300092; c=relaxed/simple;
	bh=Qt08Ua8YneN9QVn+d12vDszVP+vu5PgU0BhJWpDttCc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=kmYiIfalMfi/1whzsT/65/srQQJ+ATRLSr7rJTeoZ6B2TeJQtmWPyUNBnuBIafJw/FLwGPBEQh7aYpNQwYxRzVebW3EetnQdW63yIPPyUYMXu5Xju7qKqMtLHobxG27CSb4spCS0wG0PfdLJfUwuiKEbseafukY0h1uScm6fVC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kSG3vGbX; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kSG3vGbX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787300089; x=1818836089;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Qt08Ua8YneN9QVn+d12vDszVP+vu5PgU0BhJWpDttCc=;
  b=kSG3vGbXQtVaeLDFEm7QWavluJPDuPxesfUW5DHyscU7WuCC6SdqRMDM
   Y6hrUBp+gq2sN6MSiYKJT6IjtGg0yqbEIel9WQR8BiGsVqyZh8lWzAln5
   sgM301U7n0AIU38Ly68iCrfEs2lOxp0Zma4koXz9trow2CEKSUM3rU0/2
   4f3GET6TO2pHk63cLV6PAgkyFDuEwYsZ3P1GQB5ITIhaBo7ea8zOd1w/R
   mqnNObKfJspaiCqqUQzhLMHM/1XXcU/cp+KtF/pdu9rnd2iytxkm88ojU
   EhyOxKYL2wQVziYc+hFluPaaVM7EeJH9pUf9UZYpQkud9igpdD9rb0th2
   Q==;
X-CSE-ConnectionGUID: WbBxM8C4RSSsCM8GtMvAOg==
X-CSE-MsgGUID: UC8cd8M0QQugtxETistYhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="91719985"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; 
   d="scan'208";a="91719985"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 01:14:49 -0700
X-CSE-ConnectionGUID: N2hGvaPyTXqbIRkqcqvtjg==
X-CSE-MsgGUID: 0t9tVyviRSakj7ExNlfD6w==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.212])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 01:14:46 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 21 Aug 2026 11:14:42 +0300 (EEST)
To: Sakari Ailus <sakari.ailus@linux.intel.com>
cc: linux-media@vger.kernel.org, Daniel Scally <dan.scally@ideasonboard.com>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/2] platform/x86: int3472: Address Coccinelle warning
 on an error print
In-Reply-To: <20260820205148.2910639-2-sakari.ailus@linux.intel.com>
Message-ID: <6e27b82f-5579-8cd2-7dea-298ae2a79100@linux.intel.com>
References: <20260820205148.2910639-1-sakari.ailus@linux.intel.com> <20260820205148.2910639-2-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-560637734-1787300082=:1195"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-560637734-1787300082=:1195
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 20 Aug 2026, Sakari Ailus wrote:

> Fix the following Coccinelle warning:
>=20
> ./tps68470.c:164:58-65: WARNING: Consider using %pe to print PTR_ERR()

It seems coccinelle scripts too employ scare tactics. :-/

The change is fine,

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

> by using %pe specifier for printing an error code.
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/platform/x86/intel/int3472/tps68470.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/plat=
form/x86/intel/int3472/tps68470.c
> index a77ed32abe55..dc777dbac61f 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470.c
> @@ -161,7 +161,7 @@ static int skl_int3472_tps68470_probe(struct i2c_clie=
nt *client)
> =20
>  =09regmap =3D devm_regmap_init_i2c(client, &tps68470_regmap_config);
>  =09if (IS_ERR(regmap)) {
> -=09=09dev_err(&client->dev, "Failed to create regmap: %ld\n", PTR_ERR(re=
gmap));
> +=09=09dev_err(&client->dev, "Failed to create regmap: %pe\n", regmap);
>  =09=09return PTR_ERR(regmap);
>  =09}
> =20
>=20

--=20
 i.

--8323328-560637734-1787300082=:1195--
