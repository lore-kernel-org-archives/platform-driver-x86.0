Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B641EC019
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 Nov 2024 10:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730976286; cv=none; b=S8vONY01ZBBlX2xhiR3l36UG1WLMkLyYymPTY091DB5F+Ku48BQsELId1QCGlW3E6n1FRJfikQUKwb/eI55xIRzUvuLMIEcwKpuVYhi3smxDzDznS3At9DgNown8kt3K9meRki1q95oBpRjFxH7hg0sCirRl8HyvjW2qSw761/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730976286; c=relaxed/simple;
	bh=rXe7p4DZ2YKe+zsJzB2tPPMyM2V1I2WgDlLTetCjh5A=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=NNqEaKI+K3y+B3xN4YeDkj07rqwmEx6W+zTIwtn8sMFQ6f8cnmKoU3o/DtzgtY4oh2EQKuM251vWYRmJQwx7SxzetBIof8CLJXflsywAHgKfIzZAav4gdpqHjUJ/DXvjZN73ZqMTxCyrEr2162veTeSEtbup9sZuhrlUPl4zhIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HfbZKT0F; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HfbZKT0F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730976285; x=1762512285;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=rXe7p4DZ2YKe+zsJzB2tPPMyM2V1I2WgDlLTetCjh5A=;
  b=HfbZKT0F38TH05LI+ZwyiemQ5+bXcxKxrBl6+Zou4Wr+DJLIwzKiGROY
   fkayw1sZwdjeBNP+CzxuASU53aETlfdSdSGy8JdrWl0pyxLv99vckEjtN
   BUaYUtQ4UYRcfAqDcNiy6hx3ZYKy1HerAehUG7A9whnElLs78K4JWYHZK
   Z0OmqJl232bgHB/ZeG7/m6+t/ynD49HZqL73wvL+JpoWuRjXF5O6TGbPu
   RrwdP9ve442Mwgv5qrmNAkLo364QX2o0O/KY+amOZFueAKQDIZd3fMwD1
   ITKdUHzh2fr6HnXGMhfXnlKkYWWb8TfSNqWDJQcd2hdp3SKQUwbkfBvyR
   g==;
X-CSE-ConnectionGUID: mh63+zErQcSesT/QEwpTmg==
X-CSE-MsgGUID: YUGnzlgUSlC9MD0e6bJPYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="33654700"
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="33654700"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 02:44:44 -0800
X-CSE-ConnectionGUID: KVySHsc2QBORu08gJGVbAg==
X-CSE-MsgGUID: 0+uDVJG8R/qoxiIyG239GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="85212720"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.4])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 02:44:42 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 7 Nov 2024 12:44:39 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, Sanket.Goswami@amd.com, 
    platform-driver-x86@vger.kernel.org, 
    Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v4 07/11] platform/x86/amd/pmc: Use ARRAY_SIZE() to fill
 num_ips information
In-Reply-To: <20241107072714.943423-8-Shyam-sundar.S-k@amd.com>
Message-ID: <ffcdf9a5-fa69-c8b7-67cd-44b37235518c@linux.intel.com>
References: <20241107072714.943423-1-Shyam-sundar.S-k@amd.com> <20241107072714.943423-8-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-504371869-1730976279=:936"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-504371869-1730976279=:936
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 7 Nov 2024, Shyam Sundar S K wrote:

> Instead of manually specifying num_ips, use ARRAY_SIZE() to set this valu=
e
> based on the actual number of elements in the array.
>=20
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmc/pmc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/am=
d/pmc/pmc.c
> index e03b576105a5..7c3204110bf8 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -12,6 +12,7 @@
> =20
>  #include <asm/amd_nb.h>
>  #include <linux/acpi.h>
> +#include <linux/array_size.h>
>  #include <linux/bitfield.h>
>  #include <linux/bits.h>
>  #include <linux/debugfs.h>
> @@ -117,7 +118,6 @@ static const struct amd_pmc_bit_map soc15_ip_blk[] =
=3D {
>  =09{"IPU",=09=09BIT(19)},
>  =09{"UMSCH",=09BIT(20)},
>  =09{"VPE",=09=09BIT(21)},
> -=09{}
>  };
> =20
>  static bool disable_workarounds;
> @@ -169,7 +169,7 @@ static void amd_pmc_get_ip_info(struct amd_pmc_dev *d=
ev)
>  =09=09break;
>  =09case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>  =09case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> -=09=09dev->num_ips =3D 22;
> +=09=09dev->num_ips =3D ARRAY_SIZE(soc15_ip_blk);
>  =09=09dev->smu_msg =3D 0x938;
>  =09=09break;
>  =09}
>=20

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-504371869-1730976279=:936--
