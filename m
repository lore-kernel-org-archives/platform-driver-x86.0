Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E018F18132A
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 Nov 2024 09:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730799459; cv=none; b=U0TG9gtxi4fX0jDHAwbzh4P+Pd9cUOrZAUozLkbfsHbTV4OPzJdWXSNj/t6k8Z57Ojffym5BRlC/qEgk4YSmChyyrfdEC/Jv1RAllS5pW2cNGpd3x1X3oHhrnr+OQHWVjrvjpifOAhlO8SW7lN4sRR1FHfg1xKjrppKSv9GlCK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730799459; c=relaxed/simple;
	bh=f3wIbKrVQOQuK3wGOKUuwA6ik+aPFA5MDCZuW/2nXF8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=R5eQc25el/o8MZyBfAzcs1ehc/3dF0d4EXbFujCHz118SnQka4mkGS8NYOWfr+2mUqcXzk2lI4hZmafE0B2VBtQZWQDXTXnVPsyV9IScFyQ+WISFidHTI3NKcCXSOahvroEFOQnOtp4nKHD2AxY98OSUahI4ojxJLksr0VPN7lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e/eBcxin; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e/eBcxin"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730799458; x=1762335458;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=f3wIbKrVQOQuK3wGOKUuwA6ik+aPFA5MDCZuW/2nXF8=;
  b=e/eBcxin8aEE/LZ7qmhjtb3N4tS+OVuBEzUnHpo6TfCWG0VW7Rqewrjl
   bAYleSCFhKAruSaUQBZz0qh9dovJOVG4Hj/RgGt7wgu5/GPZhGelEaRMS
   ajCr07twvrDLM7h6pWEufKMt6xi3BTO7QcvKfRJurPwlirliIsKwqhWA6
   6xhUHRDBxgGUTUrJA8aOdEk/a9AOhdgafZfDicvk/TmsvTJGc3Cmg/KHo
   vi/+I0SLcNxKU3UVhJ0GuDh0W2pSGRtLDipT7Uunocvgqd39wjgpYYtrg
   w6xRrWqZBjSOdpbHWeNrzJsE9/OoqW/HVjyN08Uu0g51DnTgVXuLMSRmL
   Q==;
X-CSE-ConnectionGUID: 00kEM7LGQP6r7FYrNMt9YA==
X-CSE-MsgGUID: Xu4xhbLuQhmq9vwHNvX5cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="30758020"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="30758020"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 01:37:31 -0800
X-CSE-ConnectionGUID: 3K+TYzgrQ5yjiwwpR3v4aA==
X-CSE-MsgGUID: MrwUxJaZRF2aA6VGV+g21A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="84056341"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.201])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 01:37:29 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 5 Nov 2024 11:37:26 +0200 (EET)
To: Hans de Goede <hdegoede@redhat.com>
cc: Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 1/3] platform/x86: x86-android-tablets: Add
 get_i2c_adap_by_handle() helper
In-Reply-To: <20241104200848.58693-2-hdegoede@redhat.com>
Message-ID: <2027eeb6-f5c6-4ad3-042e-2cf3daf683db@linux.intel.com>
References: <20241104200848.58693-1-hdegoede@redhat.com> <20241104200848.58693-2-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-2089002903-1730799446=:949"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-2089002903-1730799446=:949
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 4 Nov 2024, Hans de Goede wrote:

> Add get_i2c_adap_by_handle() helper function, this is a preparation patch
> for adding support for getting i2c_adapter-s by PCI parent devname().
>=20
> Suggested-by: Andy Shevchenko <andy@kernel.org>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> - New patch in v2 of this series
> ---
>  .../platform/x86/x86-android-tablets/core.c   | 25 ++++++++++++-------
>  1 file changed, 16 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/pl=
atform/x86/x86-android-tablets/core.c
> index ef572b90e06b..4154395c60bb 100644
> --- a/drivers/platform/x86/x86-android-tablets/core.c
> +++ b/drivers/platform/x86/x86-android-tablets/core.c
> @@ -155,26 +155,33 @@ static struct gpiod_lookup_table * const *gpiod_loo=
kup_tables;
>  static const struct software_node *bat_swnode;
>  static void (*exit_handler)(void);
> =20
> +static struct i2c_adapter *
> +get_i2c_adap_by_handle(const struct x86_i2c_client_info *client_info)
> +{
> +=09acpi_handle handle;
> +=09acpi_status status;
> +
> +=09status =3D acpi_get_handle(NULL, client_info->adapter_path, &handle);
> +=09if (ACPI_FAILURE(status)) {
> +=09=09pr_err("Error could not get %s handle\n", client_info->adapter_pat=
h);
> +=09=09return NULL;
> +=09}
> +
> +=09return i2c_acpi_find_adapter_by_handle(handle);
> +}
> +
>  static __init int x86_instantiate_i2c_client(const struct x86_dev_info *=
dev_info,
>  =09=09=09=09=09     int idx)
>  {
>  =09const struct x86_i2c_client_info *client_info =3D &dev_info->i2c_clie=
nt_info[idx];
>  =09struct i2c_board_info board_info =3D client_info->board_info;
>  =09struct i2c_adapter *adap;
> -=09acpi_handle handle;
> -=09acpi_status status;
> =20
>  =09board_info.irq =3D x86_acpi_irq_helper_get(&client_info->irq_data);
>  =09if (board_info.irq < 0)
>  =09=09return board_info.irq;
> =20
> -=09status =3D acpi_get_handle(NULL, client_info->adapter_path, &handle);
> -=09if (ACPI_FAILURE(status)) {
> -=09=09pr_err("Error could not get %s handle\n", client_info->adapter_pat=
h);
> -=09=09return -ENODEV;
> -=09}
> -
> -=09adap =3D i2c_acpi_find_adapter_by_handle(handle);
> +=09adap =3D get_i2c_adap_by_handle(client_info);
>  =09if (!adap) {
>  =09=09pr_err("error could not get %s adapter\n", client_info->adapter_pa=
th);
>  =09=09return -ENODEV;

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

Not a big deal, but you might want to consider if printing both error=20
messages is fine or if the error printing should be somehow modified when=
=20
that other print moves into the inner function.

--=20
 i.

--8323328-2089002903-1730799446=:949--
