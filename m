Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E7A21D3DC;
	Mon,  5 Jan 2026 13:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767621143; cv=none; b=KExFvndtU/gyhXXC1aJif5NwXa4W0Mxrrl/DyCU3TuLQt+usCok1N46xZu3Agbr8KRbKSmrVHjJZRFngatATv03fo75A/tW99t+LHpFHHUtfoxO8mVv3yQL2yRdnj8xng+bhBMDAy33oQeMVzExvr7ILatY/aIuNT3QohOm5dwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767621143; c=relaxed/simple;
	bh=O+Jc3zkPaWOY3tFD1kAIG/P8Cq9zWE0nsAmat32Jv+s=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=pzz3lHyc+n0VCkaGojufBMviRK1STKhdNktQY5dSTLqsaTqbwq1cdsEVElClPCea/PO/rQZGppWuMz2etVtS9BDbkkeJJAsZugZnZEr8rDsnZyn9EfRPzjaIWmtXSTJKQIOl/TpH1UIMKEGxLUeIDF2gEWViCqHYjq4qeSHa6/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AORGYoWl; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AORGYoWl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767621142; x=1799157142;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=O+Jc3zkPaWOY3tFD1kAIG/P8Cq9zWE0nsAmat32Jv+s=;
  b=AORGYoWlVF/xqar3UI3kabFOeJluKc/Yiql4TwZYfSnRDEOa7290GpQn
   s3tWdLQ5zOLlA6PFQh0ETbFba7PgX4TLMMcZKk7/CYSECf1HYGuNz3p0m
   0wtOffR0yiVnJJVn8BIYYc0S7ofidTZkdG5RtzcDgUzQa1EUpOZQt7y5I
   6jOoIoPVhC4Epai1/NrdSf15odZpyvxHnWhN4vsSig7fEvptFfyjx5kEo
   FF3UZOrFMwQHBjJJx3Q+hqa1odA3pOFNHolIAzaYhmWiN0W8TLjgZSutG
   YCPP8jbgy+6L73dVdSd7TKA0eHd1ynFGePoHy/tNz1G03eo/UkxBGNvxh
   g==;
X-CSE-ConnectionGUID: 5cD5I/eASB6YOH5tlpqEIQ==
X-CSE-MsgGUID: UtKp8HK+TZOFG8TvRCJdsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="80432634"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="80432634"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 05:52:21 -0800
X-CSE-ConnectionGUID: l9Ibg8oARFy0Wp1kw5ya6Q==
X-CSE-MsgGUID: ARWPolP+Qruha7QjBkiaPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="202633111"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.202])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 05:52:18 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 5 Jan 2026 15:52:14 +0200 (EET)
To: Zilin Guan <zilin@seu.edu.cn>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Markus.Elfring@web.de, 
    Jianhao Xu <jianhao.xu@seu.edu.cn>
Subject: Re: [PATCH v2] platform/x86/amd: Fix memory leak in wbrf_record()
In-Reply-To: <20260103122151.157174-1-zilin@seu.edu.cn>
Message-ID: <513faa30-9241-49d4-873a-96ffdd314504@linux.intel.com>
References: <20260103122151.157174-1-zilin@seu.edu.cn>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1155360001-1767621062=:980"
Content-ID: <a3721dbe-2204-4573-43ef-a3d530eda9b8@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1155360001-1767621062=:980
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <2740b704-71fc-0932-ad0a-886262c61f06@linux.intel.com>

On Sat, 3 Jan 2026, Zilin Guan wrote:

> The tmp buffer is allocated using kcalloc() but is not freed if
> acpi_evaluate_dsm() fails. This causes a memory leak in the error path.
>=20
> Fix this by using the scope-based cleanup helper __free() for automatic
> resource cleanup. This ensures that both the tmp buffer and the ACPI
> object are automatically freed when they go out of scope, simplifying
> error handling and preventing leaks.
>=20
> Fixes: 58e82a62669d ("platform/x86/amd: Add support for AMD ACPI based Wi=
fi band RFI mitigation feature")\
> Suggested-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
> Suggested-by: Markus Elfring <Markus.Elfring@web.de>
> Co-developed-by: Jianhao Xu <jianhao.xu@seu.edu.cn>
> Signed-off-by: Jianhao Xu <jianhao.xu@seu.edu.cn>
> Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
> ---
> Changes in v2:
> - using scope-based cleanup helper __free() for automatic resource cleanu=
p.

While I'm certainly not against in converting also 'obj', this patch=20
should be split to two, where the first patch fixes the case that is=20
current lacking kfree(), and the second that does convert 'obj'. IIRC, on=
=20
can just use kfree() directly for releasing it so adding the new=20
DEFINE_FREE() doesn't seem necessary.

--=20
 i.

>  drivers/platform/x86/amd/wbrf.c | 21 ++++++++-------------
>  1 file changed, 8 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/platform/x86/amd/wbrf.c b/drivers/platform/x86/amd/w=
brf.c
> index dd197b3aebe0..4517d139d768 100644
> --- a/drivers/platform/x86/amd/wbrf.c
> +++ b/drivers/platform/x86/amd/wbrf.c
> @@ -39,11 +39,11 @@ static const guid_t wifi_acpi_dsm_guid =3D
>   */
>  static BLOCKING_NOTIFIER_HEAD(wbrf_chain_head);
> =20
> +DEFINE_FREE(acpi_object, union acpi_object *, if (_T) ACPI_FREE(_T))
> +
>  static int wbrf_record(struct acpi_device *adev, uint8_t action, struct =
wbrf_ranges_in_out *in)
>  {
>  =09union acpi_object argv4;
> -=09union acpi_object *tmp;
> -=09union acpi_object *obj;
>  =09u32 num_of_ranges =3D 0;
>  =09u32 num_of_elements;
>  =09u32 arg_idx =3D 0;
> @@ -74,7 +74,7 @@ static int wbrf_record(struct acpi_device *adev, uint8_=
t action, struct wbrf_ran
>  =09 */
>  =09num_of_elements =3D 2 * num_of_ranges + 2;
> =20
> -=09tmp =3D kcalloc(num_of_elements, sizeof(*tmp), GFP_KERNEL);
> +=09union acpi_object *tmp __free(kfree) =3D kcalloc(num_of_elements, siz=
eof(*tmp), GFP_KERNEL);
>  =09if (!tmp)
>  =09=09return -ENOMEM;
> =20
> @@ -101,25 +101,20 @@ static int wbrf_record(struct acpi_device *adev, ui=
nt8_t action, struct wbrf_ran
>  =09=09tmp[arg_idx++].integer.value =3D in->band_list[i].end;
>  =09}
> =20
> -=09obj =3D acpi_evaluate_dsm(adev->handle, &wifi_acpi_dsm_guid,
> -=09=09=09=09WBRF_REVISION, WBRF_RECORD, &argv4);
> +=09union acpi_object *obj __free(acpi_object) =3D
> +=09=09acpi_evaluate_dsm(adev->handle, &wifi_acpi_dsm_guid,
> +=09=09=09=09  WBRF_REVISION, WBRF_RECORD, &argv4);
> =20
>  =09if (!obj)
>  =09=09return -EINVAL;
> =20
> -=09if (obj->type !=3D ACPI_TYPE_INTEGER) {
> -=09=09ret =3D -EINVAL;
> -=09=09goto out;
> -=09}
> +=09if (obj->type !=3D ACPI_TYPE_INTEGER)
> +=09=09return -EINVAL;
> =20
>  =09ret =3D obj->integer.value;
>  =09if (ret)
>  =09=09ret =3D -EINVAL;
> =20
> -out:
> -=09ACPI_FREE(obj);
> -=09kfree(tmp);
> -
>  =09return ret;
>  }
> =20
>=20
--8323328-1155360001-1767621062=:980--
