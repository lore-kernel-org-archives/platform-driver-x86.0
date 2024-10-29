Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C991DF960
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Oct 2024 12:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730204269; cv=none; b=gi3goCLayDt/UWrOYTRz0xwQUgqHjezforcsEUTjePoMMkPLDtnqYgmSPPMkkQaNI4QYz8dmAHnrwbwEvW/M9fU6psc7ImMOa9YSB4M0TeM18dBLZsvM9u7LqmrL6C9vVCpEyXcLxyvCJoP6rCeM68rhUOmc9Onsjo0nD2DV654=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730204269; c=relaxed/simple;
	bh=VFNbXhglNxzpzYBpPIKqdlixUVxyR3893X7rTQ6GR2E=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Mdafhz6zDMs4x1RTDHF7Ljc0JzjJjL0N+H7Za5H+VWcLSjmOf9YFw8atTaepkLdBwr4J0b65uOm+WCgXOXXQrGs2IOxcyDB3Kf+zfApnSh/R8s+zBZKWqRjXTlhBMatMai/tWwXJoKdwFeNag9fBFej2IyP8QjctNCrcerm+P1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JCeIbq+k; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JCeIbq+k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730204268; x=1761740268;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=VFNbXhglNxzpzYBpPIKqdlixUVxyR3893X7rTQ6GR2E=;
  b=JCeIbq+kxBlpdfljTJH7WLyC3Gm2b4fjOGhAadX4ir2QP1rnrslNAQ0M
   feFrAorSc9FywBs8n4eUSB3F7m7DsnpFV6kBFj2fxU/fFVRXEv1NQoaKd
   BuGch2FuWgU53nC/Z3WfVg7MGeAs9DhzDrPDXOWhAtpBZ2TZ0dy50esDE
   aYTY/wH87imC+pw0SG9TaglYmSz8e0iTcA3DVlWL+rduR74U6FFIdAKvl
   DfKbuU7PqD5/yZ42k4dx5laR1kumTi6xEGFWD84PtQRNFRKvYZJjUsHet
   2JxdHm23AsffPJLIu+87+5oJL/hWkW70zFt/zRZx9xGA5AFkWVxMzsTwQ
   Q==;
X-CSE-ConnectionGUID: lzvH+BrNRqK82P3pIyCokQ==
X-CSE-MsgGUID: N3+r3y1ORBG0pK+yTe9YFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40938933"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40938933"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 05:17:47 -0700
X-CSE-ConnectionGUID: /+DXXN7lSnSEroL4YjTUhg==
X-CSE-MsgGUID: 5SRXl3WjS26+DE77Ofl2Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="82373059"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.83])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 05:17:46 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 29 Oct 2024 14:17:42 +0200 (EET)
To: Corey Hickey <bugfood-ml@fatooh.org>
cc: platform-driver-x86@vger.kernel.org, 
    Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH v3] platform/x86/amd/pmc: Detect when STB is not
 available
In-Reply-To: <20241028180241.1341624-1-bugfood-ml@fatooh.org>
Message-ID: <75f43cee-1b12-5e4c-9f8b-5b47e8653a3b@linux.intel.com>
References: <20241025051141.924760-1-bugfood-ml@fatooh.org> <20241028180241.1341624-1-bugfood-ml@fatooh.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-714823922-1730204262=:951"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-714823922-1730204262=:951
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 28 Oct 2024, Corey Hickey wrote:

> From: Corey Hickey <bugfood-c@fatooh.org>
>=20
> Loading the amd_pmc module as:
>=20
>     amd_pmc enable_stb=3D1
>=20
> ...can result in the following messages in the kernel ring buffer:
>=20
>     amd_pmc AMDI0009:00: SMU cmd failed. err: 0xff
>     ioremap on RAM at 0x0000000000000000 - 0x0000000000ffffff
>     WARNING: CPU: 10 PID: 2151 at arch/x86/mm/ioremap.c:217 __ioremap_cal=
ler+0x2cd/0x340
>=20
> Further debugging reveals that this occurs when the requests for
> S2D_PHYS_ADDR_LOW and S2D_PHYS_ADDR_HIGH return a value of 0,
> indicating that the STB is inaccessible. To prevent the ioremap
> warning and provide clarity to the user, handle the invalid address
> and display an error message.
>=20
> Link: https://lore.kernel.org/platform-driver-x86/c588ff5d-3e04-4549-9a86=
-284b9b4419ba@amd.com
> Fixes: 3d7d407dfb05 ("platform/x86: amd-pmc: Add support for AMD Spill to=
 DRAM STB feature")
> Acked-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Corey Hickey <bugfood-c@fatooh.org>
> ---
>  drivers/platform/x86/amd/pmc/pmc.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/am=
d/pmc/pmc.c
> index bbb8edb62e00..5669f94c3d06 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -998,6 +998,11 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
>  =09amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low, dev->s2d_msg=
_id, true);
>  =09amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi, dev->s2d_msg=
_id, true);
> =20
> +=09if (!phys_addr_hi && !phys_addr_low) {
> +=09=09dev_err(dev->dev, "STB is not enabled on the system; disable enabl=
e_stb or contact system vendor\n");
> +=09=09return -EINVAL;
> +=09}
> +
>  =09stb_phys_addr =3D ((u64)phys_addr_hi << 32 | phys_addr_low);
> =20
>  =09/* Clear msg_port for other SMU operation */
>=20

Thanks for the update,

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-714823922-1730204262=:951--
