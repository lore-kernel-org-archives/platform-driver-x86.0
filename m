Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E694F34A773;
	Mon, 29 Jun 2026 11:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782733164; cv=none; b=Vsppi0jmISUSlRwjVqlRlvhugdrVd5XxarGtG6KoJ2eDKoeAVVJJGBDtpr6vkNios0p/s0i8B1nury60ondZUpqS9qVxGIvmIhMLTpkJvOkFx0qwfa6NMeF6keHG7uHpaYgfX+pfXY0BcniDymgSDWYvRDu7pVNjD0ZivTS5ysw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782733164; c=relaxed/simple;
	bh=6fra5UKeLXqwRVsk7emRPupmBrgqMGaavdLSJe2lDdA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=qevdJk7EBqIGBCeRUtvEIuZ4PrYd9/JjymA82WEhMDpN0yGsaguREmjJz+qbmsPf6u3cc29qarc0APQbbPLyNp6Wx50vAeTJyvyXecxqlCnYKoKR7OPfZ0IVb0RZYS5MpdI8Jqk+kiHb9WIJRS5gqilY4EvPo0+TVAUf8ym9SN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wl9boXRl; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wl9boXRl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782733163; x=1814269163;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=6fra5UKeLXqwRVsk7emRPupmBrgqMGaavdLSJe2lDdA=;
  b=Wl9boXRlmrVER3XFSttFasafxJEhxY88Oc9mlm8ZD6MFKl5pto2SRfGt
   yy4562NKvSQOvvkVRjjL/Tl29xV5Xj3MwUIENbwrP51AsOt3nTb7tOVU3
   JkULYWwgNFnfv3HF/2bNOER/GvK5lZBYkxRyR90JJ+UeelSZ/SCKT0zci
   uourK5e/ftZmRAnRdIPCNPHunJWfHGcLXcU3C5gOzNaZVhBPuDBdKKxiB
   hqetLcTpY56ITG0CDhMTW8014rE72LiBI/Pi1ABmhix7/ONrkHh1oHH46
   jHsOeGPG1ABVr5nPk+kq8bc7Iz+Wc0bJzeYmU3Sr08kjlJQiHlRlzq4KA
   Q==;
X-CSE-ConnectionGUID: ZybqCSnXSkW3VFJ+Z2ipdw==
X-CSE-MsgGUID: W5yBY/pNRnyBznt4HcR7oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="83425315"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="83425315"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 04:39:22 -0700
X-CSE-ConnectionGUID: pSFNMOGKT3+WbX87ohiWag==
X-CSE-MsgGUID: OB1ZmYzaS/qgc35dhD3h0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="255534958"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.42])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 04:39:20 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 29 Jun 2026 14:39:16 +0300 (EEST)
To: =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
cc: Linus Torvalds <torvalds@linux-foundation.org>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Nikita Kravets <teackot@gmail.com>, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v3 06/16] platform/x86: msi-ec: Ensure dmi_system_id is
 defined
In-Reply-To: <0998f0a790036ea630bab82a8b78af79167c3e4a.1782682124.git.ukleinek@kernel.org>
Message-ID: <5bb27b61-c376-cb7d-9de7-27b0845ea721@linux.intel.com>
References: <cover.1782682124.git.ukleinek@kernel.org> <0998f0a790036ea630bab82a8b78af79167c3e4a.1782682124.git.ukleinek@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1018887144-1782733156=:1167"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1018887144-1782733156=:1167
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sun, 28 Jun 2026, Uwe Kleine-K=C3=B6nig (The Capable Hub) wrote:

> Currently <linux/acpi.h> includes <linux/mod_devicetable.h> and thus
> dmi_system_id is available for the driver. To disentangle includes
> <linux/acpi.h> will be changed to only include the header for
> acpi_device_id instead of the full <linux/mod_devicetable.h>. To prepare
> for that include the dedicated header for struct dmi_device_id.
>=20
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>
> ---
>  drivers/platform/x86/msi-ec.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/platform/x86/msi-ec.c b/drivers/platform/x86/msi-ec.=
c
> index 0157e233e430..dfe4532ebe56 100644
> --- a/drivers/platform/x86/msi-ec.c
> +++ b/drivers/platform/x86/msi-ec.c
> @@ -23,6 +23,7 @@
>  #include <linux/init.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/device-id/dmi.h>
>  #include <linux/platform_device.h>
>  #include <linux/seq_file.h>
>  #include <linux/string.h>
>=20

Acked-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-1018887144-1782733156=:1167--
