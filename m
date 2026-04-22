Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97841E86E;
	Wed, 22 Apr 2026 09:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776850430; cv=none; b=MFTwzQP9DZDKWbIiAb+whH6Yv0EeUtaASv7UTFinQHGeDw3sNNKvSRuAKQMuSM6LJvz9NY50XbgK5En+/suwQc58vesN9qvWNP8U0raKBunvOt3VH6QOp3X5Y2GtIkThsiglTKlNnv1Gf6O3hoOmHQ4vH8uB+6U+Z7rvkGNXYu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776850430; c=relaxed/simple;
	bh=uZVPpHsznlRLwbfAKcdZTf8mugdTDrDN3yOiZRyqDik=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=GFiCT103IXIF3QZMxwPndGRrjwjyHWEWTRcF6zNaIy+UVbVMyixBsegSsFoNxvKtL5uBXoozSQeeymu+Jb3Ho+LfC4hwRJ1ZJ/H9pB2EqpzUulQpOeXZopeDLtMoEYR2zcwWWMkkR1h9dc4BQr2/CWy9hXVGD+miOA1LPLlsscE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UsfweiUj; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UsfweiUj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776850429; x=1808386429;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=uZVPpHsznlRLwbfAKcdZTf8mugdTDrDN3yOiZRyqDik=;
  b=UsfweiUjLTvbR7AwXGC0OuwKz+jA54nQaVkACMZ7fhsQ2c4U+7O2OpfW
   AS5W/OLNXw86YChvohvrT2fDpF8GDPEF4HnHuSePMzPScTZSCnZMbzzkp
   6bhbTeIZvs62Sfb2fJJzp6D29lOdQvnOTXFJAPjef62SbJRHxmTkVHLoH
   Lukjlg6bLEpaYLWZbHQZRma+twLP1P4HS7roL2/RYGU1S4yQ/balB5Ny7
   PU5agMGdnq9UJmn8DRtb8gaERhCPYA/TLV7FxhUBSw3uSHBPsAC/yMnPk
   WjbxNvxJ/5zUk+SFyUMMtfh9wzPupYBtP2MDeseqru7C5P+U19V3tE1jS
   g==;
X-CSE-ConnectionGUID: 2mF3yjxfRhSuSS7rMS4AfQ==
X-CSE-MsgGUID: BTP11rqfSQmhK4c5/STOWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="88409282"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="88409282"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 02:33:48 -0700
X-CSE-ConnectionGUID: iWYdSiASTu2bJ6L7BJeAiQ==
X-CSE-MsgGUID: La8LcKZOTzG80EBvg78MDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="232607052"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.4])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 02:33:45 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 22 Apr 2026 12:33:41 +0300 (EEST)
To: Werner Sembach <wse@tuxedocomputers.com>
cc: W_Armin@gmx.de, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 1/3] platform/x86: uniwill-laptop: Make super key
 init lineup with other inits
In-Reply-To: <20260421201103.142403-2-wse@tuxedocomputers.com>
Message-ID: <6f8f06d2-d0f4-04fd-986a-0466d987266b@linux.intel.com>
References: <20260421201103.142403-1-wse@tuxedocomputers.com> <20260421201103.142403-2-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-2086096041-1776850421=:1863"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-2086096041-1776850421=:1863
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 21 Apr 2026, Werner Sembach wrote:

> The super key init, while being trivial, was the only one not in its own
> method and before the EC init.
>=20
> Make an own method and move it after EC init and probe call to make it
> consistent with other initialization steps.
>=20
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>  drivers/platform/x86/uniwill/uniwill-acpi.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfo=
rm/x86/uniwill/uniwill-acpi.c
> index 766bc1ee192d2..7d1fdbacc6871 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -768,6 +768,14 @@ static ssize_t super_key_enable_show(struct device *=
dev, struct device_attribute
> =20
>  static DEVICE_ATTR_RW(super_key_enable);
> =20
> +static int super_key_enable_init(struct uniwill_data *data)
> +{
> +=09if (!uniwill_device_supports(data, UNIWILL_FEATURE_SUPER_KEY))
> +=09=09return 0;
> +
> +=09return devm_mutex_init(&data->dev, &data->super_key_lock);
> +}
> +
>  static int uniwill_write_touchpad_toggle_enable(struct uniwill_data *dat=
a, bool status)
>  {
>  =09unsigned int value;
> @@ -1869,10 +1877,6 @@ static int uniwill_probe(struct platform_device *p=
dev)
> =20
>  =09data->regmap =3D regmap;
> =20
> -=09ret =3D devm_mutex_init(&pdev->dev, &data->super_key_lock);
> -=09if (ret < 0)
> -=09=09return ret;
> -
>  =09ret =3D uniwill_ec_init(data);
>  =09if (ret < 0)
>  =09=09return ret;
> @@ -1890,6 +1894,10 @@ static int uniwill_probe(struct platform_device *p=
dev)
>  =09=09=09return ret;
>  =09}
> =20
> +=09ret =3D super_key_enable_init(data);
> +=09if (ret < 0)
> +=09=09return ret;
> +
>  =09ret =3D uniwill_battery_init(data);
>  =09if (ret < 0)
>  =09=09return ret;
>=20

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-2086096041-1776850421=:1863--
