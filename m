Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C1C2AE84
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Mar 2025 15:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742571762; cv=none; b=AHxXgZj4Won2oq/jS8ZGDleKQMpXyLz4ct5BpdF2hye1Tm4uaIwIdz7iQvjjCT2JgsNQtxpXQIPxP42eEDlsjVfNhw8UzuSh5HRoH1FB3CgfvLKKXUPjui0lGLBdHq8tBCkELu2PciEXbjllUUusQVJ+JjImE+hc1C5CSOUzDv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742571762; c=relaxed/simple;
	bh=lvNbYDBqfUjeLAW1i9pArbDEa2g+vPFwHOrUwK7W1m0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=m/CgqQPEvGC8sVoe756cNKy74H71sDiqZk0OKS0VQRl8Cf/x4IyjrAY9lbAw3xDvECFSi+UlEMm7OFZ5Sj54RkzS+GI/ZcffkEeHq2XF1KYHM/PZWeSfJf55Rs2dJEOJfMX1aJydspsv2ek+tc0vVGmlnHwBTrxEX3CTMDrA/mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dDRPR996; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dDRPR996"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742571760; x=1774107760;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=lvNbYDBqfUjeLAW1i9pArbDEa2g+vPFwHOrUwK7W1m0=;
  b=dDRPR996wWLFrT3sxpKjGlkKaaxwBZsbgE7HaeOXNx8nkjP5rBPeNiAC
   NohYIrfixh917vPMRBXA8X6f9o5iKkUZMrVXUBW+yp/pEVW6zaHYDy1kN
   isCBbzk/5mSfwlpZ2VxN4HdWah4ip9QDwVo0VJ+y6UfUAHeHotFJpIZfa
   Is/p8uQhTIjVORTvpRMgZGcR8tf+RxHqL7s4a5dK3noBl1qkWszwPpgvq
   Av7eHQCtru4BnvciZ97ocNeOdNnqc8t6HBG99mHywMYaI+QVpXPnS80sx
   uHebrx/T+GWQ4ETMxc7wppWxw8TQ2rStG50rvOwTm17gZoCt1QQzzcY0g
   g==;
X-CSE-ConnectionGUID: N0HjWyKoR4CU225BQ+dbHQ==
X-CSE-MsgGUID: LeRp8KdVSoSni8esJU44Lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="61236073"
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; 
   d="scan'208";a="61236073"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 08:42:39 -0700
X-CSE-ConnectionGUID: EQWUIk0NSh2Z0vOBqXbNVA==
X-CSE-MsgGUID: pmwUAclHRJeF1CgJ9yQ/Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; 
   d="scan'208";a="123235816"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.112])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 08:42:37 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 21 Mar 2025 17:42:34 +0200 (EET)
To: Kevin Stravers <kevin@stravers.net>
cc: corentin.chary@gmail.com, luke@ljones.dev, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: asus-wmi: Add quirk for ASUS Vivobook
 S14
In-Reply-To: <fe59465c-3dfc-4d91-baca-ffbc3d4ff138@stravers.net>
Message-ID: <1d0863e0-eba2-d8b8-f13a-40ce37aed03d@linux.intel.com>
References: <fe59465c-3dfc-4d91-baca-ffbc3d4ff138@stravers.net>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1697519018-1742571521=:931"
Content-ID: <34b2878c-b732-a9bf-9589-aa376262289c@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1697519018-1742571521=:931
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <a3f6d451-c611-1020-bba1-a2c380c803b4@linux.intel.com>

On Mon, 17 Mar 2025, Kevin Stravers wrote:

> From 9af8ba6cfd6305d7696d6cfc8eedb12405cb572f Mon Sep 17 00:00:00 2001
>=20
> From: Kevin Robert Stravers <kevin@stravers.net>
> Date: Mon, 17 Mar 2025 20:41:44 -0400
> Subject: [PATCH] platform/x86: asus-wmi: Add quirk for ASUS Vivobook S14
>=20
> The ASUS Vivobook S14 will have wifi disabled on boot as well as
> resumption from suspend if the asus-wmi driver invokes rfkill functions.
>=20
> This patch disables asus-wmi's rfkill usage to prevent the wifi card
> from being software disabled.
> ---

Hi Kevin,

Thank you for the patch. I tried to apply this but git am say the patch=20
is corrupted so I cannot apply it. Please resubmit, thank you.

(It might be worth testing it first by emailing the patch only to yourself=
=20
and checking that you can apply it before resubmitting publicly.)

--
 i.

> =A0drivers/platform/x86/asus-nb-wmi.c | 13 +++++++++++++
> =A0drivers/platform/x86/asus-wmi.c=A0=A0=A0 |=A0 5 +++++
> =A02 files changed, 18 insertions(+)
>=20
> diff --git a/drivers/platform/x86/asus-nb-wmi.c
> b/drivers/platform/x86/asus-nb-wmi.c
> index 3f8b2a324efd..1e6fb9308560 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -150,6 +150,10 @@ static struct quirk_entry quirk_asus_zenbook_duo_kbd=
 =3D {
> =A0=A0=A0=A0 .ignore_key_wlan =3D true,
> =A0};
>=20
> +static struct quirk_entry quirk_asus_vivobook_s14 =3D {
> +=A0=A0=A0 .skip_rfkill =3D true,
> +};
> +
> =A0static int dmi_matched(const struct dmi_system_id *dmi)
> =A0{
> =A0=A0=A0=A0 pr_info("Identified laptop model '%s'\n", dmi->ident);
> @@ -530,6 +534,15 @@ static const struct dmi_system_id asus_quirks[] =3D =
{
> =A0=A0=A0=A0 =A0=A0=A0 },
> =A0=A0=A0=A0 =A0=A0=A0 .driver_data =3D &quirk_asus_zenbook_duo_kbd,
> =A0=A0=A0=A0 },
> +=A0=A0=A0 {
> +=A0=A0=A0 =A0=A0=A0 .callback =3D dmi_matched,
> +=A0=A0=A0 =A0=A0=A0 .ident =3D "ASUS VivoBook S14",
> +=A0=A0=A0 =A0=A0=A0 .matches =3D {
> +=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTE=
R INC."),
> +=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 DMI_MATCH(DMI_PRODUCT_NAME, "S5406SA"),
> +=A0=A0=A0 =A0=A0=A0 },
> +=A0=A0=A0 =A0=A0=A0 .driver_data =3D &quirk_asus_vivobook_s14,
> +=A0=A0=A0 },
> =A0=A0=A0=A0 {},
> =A0};
>=20
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-=
wmi.c
> index 38ef778e8c19..42e58a28c3e2 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -2138,6 +2138,8 @@ static int asus_new_rfkill(struct asus_wmi *asus,
>=20
> =A0static void asus_wmi_rfkill_exit(struct asus_wmi *asus)
> =A0{
> +=A0=A0=A0 if (asus->driver->quirks->skip_rfkill)
> +=A0=A0=A0 =A0=A0=A0 return;
> =A0=A0=A0=A0 if (asus->driver->wlan_ctrl_by_user && ashs_present())
> =A0=A0=A0=A0 =A0=A0=A0 return;
>=20
> @@ -2188,6 +2190,9 @@ static void asus_wmi_rfkill_exit(struct asus_wmi *a=
sus)
>=20
> =A0static int asus_wmi_rfkill_init(struct asus_wmi *asus)
> =A0{
> +=A0=A0=A0 if (asus->driver->quirks->skip_rfkill)
> +=A0=A0=A0 =A0=A0=A0 return 0;
> +
> =A0=A0=A0=A0 int result =3D 0;
>=20
> =A0=A0=A0=A0 mutex_init(&asus->hotplug_lock);
>=20
--8323328-1697519018-1742571521=:931--
