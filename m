Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1766B28A3ED
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Aug 2025 09:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754472979; cv=none; b=FkyYbUwziH8rtcbb7+xXtze2JU2ErJNDiiDID5nBjw+Q4LXf4N5+CNVw7UdgzNgyGltJVNRhc1dQuVDWE7WiAq72BRXIpPc6309Am2oQve0K5QuJy+lzM/bDLN9WdDL2nkm1Y3Qw+Y+Zpo5PIHy2B9W7D2OyxM+3bkSp9cx0N98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754472979; c=relaxed/simple;
	bh=cTC9gxdB7Y1gTUCmuMEBzjjS9erY7/w0mUva+0D/FVI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=lqYxyAmdhEUqUGQBm6hw6SyWlv/s1eDDSjLSKPqr9UnbZjHvFrIZeYE0CD2ylKpj79AZqAaS8sBqBtiWhxATBKISBsT8mzi9UeEm8gOwfL2voCq/njP29teQq+n9gafjnsZ285zYDo2j58ss8Zis068ysQ7gOO80Lr8V9JTzxqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BH1AK+Rt; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BH1AK+Rt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754472978; x=1786008978;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=cTC9gxdB7Y1gTUCmuMEBzjjS9erY7/w0mUva+0D/FVI=;
  b=BH1AK+RtFs8BPgwoZUcrMxGaQ3J9ZFk48B8Cnu86HmRtpPu17mOpi3Ny
   u3/MyB1FSyn5/x2JzfJtMqVTfm/jphLDbPUMZysVzibZ35OwimaEy3Iys
   67q7vsOBPj/1pLaCS5ksm81a9ZOafOVuuoRDeRhW+ALSreQBX3LRFdWrl
   h+hGlQjYogI8aniCc/22fKf/aNgw8N2jz5ssGqaOueSyHDGY9flZM9E2j
   KctnYN2Rdtz3dOFPaIjGDEue5DcOzPFn28Pzt1WADIqLutiwcUDtyYCyA
   FEbJnYo249ll7rpBWNQ+Cna2nbYMKU0uQhcEH4UlVAj8y5MLChv2o4gS2
   Q==;
X-CSE-ConnectionGUID: zPQ29FLxS6Gw6ZwCsfkdfg==
X-CSE-MsgGUID: R5mNCSKLSvCix1gyyC0I1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="68234528"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="68234528"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 02:36:17 -0700
X-CSE-ConnectionGUID: FtU3NJ0VSuu/NHtUJU8ViA==
X-CSE-MsgGUID: tmCzl2WuQlCoGyhDWkUf0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="165068795"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.170])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 02:36:15 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 6 Aug 2025 12:36:12 +0300 (EEST)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] platform/x86/amd/hsmp: Ensure success even if hwmon
 registration fails
In-Reply-To: <20250804101551.89866-1-suma.hegde@amd.com>
Message-ID: <56b5e58b-7e02-b091-9d23-2cea4c484c20@linux.intel.com>
References: <20250804101551.89866-1-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-945932140-1754472972=:930"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-945932140-1754472972=:930
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 4 Aug 2025, Suma Hegde wrote:

> Even if hwmon registration fails, HSMP remains accessible through the
> device file, so the operation should return success.
>=20
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> ---
> Rebased on review-ilpo-next
>=20
>  drivers/platform/x86/amd/hsmp/acpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/=
amd/hsmp/acpi.c
> index d974c2289f5a..19f0ca7958b6 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -504,7 +504,7 @@ static int init_acpi(struct device *dev)
> =20
>  =09dev_set_drvdata(dev, &hsmp_pdev->sock[sock_ind]);
> =20
> -=09return ret;
> +=09return 0;
>  }
> =20
>  static const struct bin_attribute  hsmp_metric_tbl_attr =3D {
>=20

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-945932140-1754472972=:930--
