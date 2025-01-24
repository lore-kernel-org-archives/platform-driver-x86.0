Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008C33C00;
	Fri, 24 Jan 2025 08:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737705849; cv=none; b=P8cdQkpXs+ql5gM970rpWEmCWxWjsaMBBFVKeXF+2BVS+kTMfcQL5zSySSvMLdMZDFdo0PCu7RsJ17wzY45FR1j7BHG2EKMjQvlN8XS4inhzRf7/UqKwq14nDLV7Uc9RZpOA5hCohrPzIuvWcpcTyo18prHXSJDGQnb4WW9Utt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737705849; c=relaxed/simple;
	bh=UpKmDr0jWm7XspJ8HxOcIRRgO3ZPGfV7s2gCbBGG1VY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=GyMrn8qZs2kgnCGx59bxLHoWsCYkVIf7z7Q8yzqYaYtKDmmsot6RlXaOqfnRKN/cnAik7HqUTzSwAK9nO0sDcWtvuPf2dYcAXaBrLicmUSUUmFuw9Jjhvgk9JZLMFyBowe8x/Tp6o8QaFeI/czG301Y23kvjTDTzKfLK67fSt6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b39fkXex; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b39fkXex"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737705848; x=1769241848;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=UpKmDr0jWm7XspJ8HxOcIRRgO3ZPGfV7s2gCbBGG1VY=;
  b=b39fkXexhPmqembcWkUY4vNObPf/yhtVYhZHeDIdKCkDngqrjltVA/iD
   3VQv8oC7z4NprosKebvWZXw/ibnmStyv0pS1S7wOCzXbPVddJAwsfU9nO
   XYm33nU/dxP6Hz5TQCVt+q644LBL6+WmpkaqF/qqqX+7rrFC04KnUB4Xd
   uNvBhdB1pNGPAAFmXuMOJ+Yl8hTczngbbRieuv/dQTuEJdmgH0lyt/JQ5
   AwNWGn78Bd/7nF8AqWIe4asNb0XRq3URrbF9dysPL5e4PaGYN4KmFobUS
   EvavoK3fZMJo45wmDmjVuEDI16npqGYMbRAd9uAfxYr8gv+bNYdtdk1tF
   Q==;
X-CSE-ConnectionGUID: 7oyiPGITRXK00dIhenrcQA==
X-CSE-MsgGUID: DD//qySyRf2/oHynHmd33w==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="55777267"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="55777267"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 00:04:07 -0800
X-CSE-ConnectionGUID: gmGVdVqgRYKWfOPMnH2XhA==
X-CSE-MsgGUID: dUpQlYwSRVmCbVfPrpHQVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108590291"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.158])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 00:04:04 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 24 Jan 2025 10:04:00 +0200 (EET)
To: Dmitry Kandybka <d.kandybka@gmail.com>
cc: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, 
    David E Box <david.e.box@intel.com>, Hans de Goede <hdegoede@redhat.com>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    lvc-project@linuxtesting.org
Subject: Re: [PATCH v2] platform/x86/intel: pmc: fix ltr decode in
 pmc_core_ltr_show()
In-Reply-To: <20250123220739.68087-1-d.kandybka@gmail.com>
Message-ID: <62cf35b4-c317-ed2f-46e0-2c22119b04e8@linux.intel.com>
References: <20250123220739.68087-1-d.kandybka@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1643785768-1737705840=:931"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1643785768-1737705840=:931
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 24 Jan 2025, Dmitry Kandybka wrote:

> In pmc_core_ltr_show(), promote 'val' to 'u64' to avoid possible integer
> overflow. Values (10 bit) are multiplied by the scale, the result of
> expression is in a range from 1 to 34,326,183,936 which is bigger then
> UINT32_MAX. Compile tested only.
>=20
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>=20
> Signed-off-by: Dmitry Kandybka <d.kandybka@gmail.com>
> ---
> v1 -> v2: 'val' variable declared as 'u64' instead of type casting
> at usage points
>=20
>  drivers/platform/x86/intel/pmc/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86=
/intel/pmc/core.c
> index 10f04b944117..1ee0fb5f8250 100644
> --- a/drivers/platform/x86/intel/pmc/core.c
> +++ b/drivers/platform/x86/intel/pmc/core.c
> @@ -626,8 +626,8 @@ static u32 convert_ltr_scale(u32 val)
>  static int pmc_core_ltr_show(struct seq_file *s, void *unused)
>  {
>  =09struct pmc_dev *pmcdev =3D s->private;
> -=09u64 decoded_snoop_ltr, decoded_non_snoop_ltr;
> -=09u32 ltr_raw_data, scale, val;
> +=09u64 decoded_snoop_ltr, decoded_non_snoop_ltr, val;
> +=09u32 ltr_raw_data, scale;
>  =09u16 snoop_ltr, nonsnoop_ltr;
>  =09unsigned int i, index, ltr_index =3D 0;

Thanks for the update,

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-1643785768-1737705840=:931--
