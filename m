Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B143C0A00;
	Mon, 27 Jul 2026 18:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785178019; cv=none; b=FEWvywH8nqVkkJlJuKbo6E2a8WS8buaih3t8eZ1R5dSiMyPk5UDuXGW1l4TqqG/YIY9M/e/17cQwRYtXazQjVMw1zm7rYHjb+JY9CcyoguGc4eWHsusF+5y6KpzhzNqw6o/Ka0iYL0nwDaTE6XH/ltlaeifWPZPzRiVOLoACCFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785178019; c=relaxed/simple;
	bh=N/onQAIvx7T5UpV4YGWAESxfDBwlKRT8JfqvsGiga7w=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=fdluyqW7N585bgGBRkkBL0ovUaTTWfbbqF18xd37bcVqAn0Orh/DefOCI8e3vqoLZBQP7DzzyN95YHCemyZFcj/Ermwt3WFVgw1sxJ/3AMxcap84X8JmE53k753ZImDh9YfXktKPCmlud4sY899aFWMMhjYzvb/2NNQKG2h/aS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cZ00Mn8+; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cZ00Mn8+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785178017; x=1816714017;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=N/onQAIvx7T5UpV4YGWAESxfDBwlKRT8JfqvsGiga7w=;
  b=cZ00Mn8+zfhiH1fxJWlnX/8PLpC0v2yq/kTS4iDnO4oDQxoSXloSg3vh
   v1YQfbA48FKLCIX6bBTWXKnKF/dHHfE66wl0CbwUXMkAzElYl+Duxeddh
   c6hAh95A4HS00eFIWy7BtoVO9nA0kgcb9yfe+QSp/6Q2hUSYgkNy6mhLc
   mQWL1pBEm4BQJNQTXdIXU5ydiMagyOB3EooU+wstx1Mhdke780D6Qqlsw
   IE1IGk65w4cHP5XTZx2p/Iy9QcPpTT1Y8EbAPF6o21rzD4oGiuD2wpy7J
   Di59RoeKmn+esDTqL1UR6tpXHbHQq2WyLiacBuP9ifYK9/sRvsR1NoDet
   w==;
X-CSE-ConnectionGUID: oukK8ysZRyKNi0F7YjldQg==
X-CSE-MsgGUID: sSLPXf/9TZyRF+0ux9f59g==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="85793768"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="85793768"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 11:46:55 -0700
X-CSE-ConnectionGUID: adT/UrDfTLu8axRslK5R7g==
X-CSE-MsgGUID: E8wOcHdbQuu34gaeGv54Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="261465165"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.226])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 11:46:53 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 27 Jul 2026 21:46:49 +0300 (EEST)
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
cc: Danilo Krummrich <dakr@kernel.org>, brgl@kernel.org, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/surface: gpe: add missing err.h include
In-Reply-To: <20260727144308.61842-1-bartosz.golaszewski@oss.qualcomm.com>
Message-ID: <07f6bc90-bb30-9b28-3bb7-eda9c83b3ce8@linux.intel.com>
References: <20260727144308.61842-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1335558188-1785178009=:1169"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1335558188-1785178009=:1169
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 27 Jul 2026, Bartosz Golaszewski wrote:

> We now use PTR_ERR() and IS_ERR() in this module so pull in the header
> that provides them.
>=20
> Fixes: 1e0bd438b876 ("platform/surface: gpe: use platform_device_register=
_full()")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> This must go through the driver core tree as a follow up to the commit
> it fixes.
>=20
>  drivers/platform/surface/surface_gpe.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/platform/surface/surface_gpe.c b/drivers/platform/su=
rface/surface_gpe.c
> index 4ca7ad76f3b9d..29b264f2a444e 100644
> --- a/drivers/platform/surface/surface_gpe.c
> +++ b/drivers/platform/surface/surface_gpe.c
> @@ -11,6 +11,7 @@
> =20
>  #include <linux/acpi.h>
>  #include <linux/dmi.h>
> +#include <linux/err.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>

Acked-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-1335558188-1785178009=:1169--
