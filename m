Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DDC3AEB5D;
	Thu, 17 Sep 2026 08:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789635132; cv=none; b=ASYW/i1MffR9DNrTYX4m8AeTqiKm0GsfBQC/WzmjZNTPMd++vbXuk7J+6w9ZF+KYcZBHUfi45XmXFfJvQhK/h8Da3bjkYScUsRU3dd3JWoIdcA4lk5glnq9zmC+G0gHqITWla5+erMxfv7zEbn8IBbKPSh/fUQetjz8FCryPBIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789635132; c=relaxed/simple;
	bh=/FGylfRZaQ6waq3D2PjTE/n1dsllKXrh7Yr2qSLhGYI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=PDyguhnN6+p8d8pSqprsF0cqsZ6gzykPNj6iOPO1jy4YwmmblAq09VZtibaOog+VpdrydqeL1ZSfXxsACOnC/bIKMttxPuFrfC2za07r7QbsBxMaKYJQb9t0qDglG/Wnz65keYDOP5mun+B2bEctOniKCJq6U/U/KrAXhptMHx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iuuvEenl; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iuuvEenl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789635128; x=1821171128;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=/FGylfRZaQ6waq3D2PjTE/n1dsllKXrh7Yr2qSLhGYI=;
  b=iuuvEenlMNNGHDKx3Ue8L1OdUc5TXr3bkNzTVPMbVixa+aA8HwiLQV9U
   5n3lN+ws2Ux10d0R2FxPnJbK6IWjmVmJOHJRZi10hwxUsvuDyd5DWricW
   A/+yfkXlyfinmNv9e9ikIIfbNO9EcRyU1AzJYXAlt/qOVqV1j4hlTdrV/
   C6ZcNXIm9kjAVjXG6h5bcsslpgX7IFp2T3TVB8vOE05Ee+W2nT4t9T6KJ
   yfseVA9VkHKHTF3pnxo6nfZo0ik2Oa/CYbuIHJC/sGxwjBWzsZgQ/KcjC
   xIWDios5Ai4P/CfNhxwatNYe1LbLw49pHiL2A5zCQnw1ty8Tr/xHS679C
   Q==;
X-CSE-ConnectionGUID: Yyn9U7vnR8mHLIXO6ut1gw==
X-CSE-MsgGUID: 56XEOpuxSrynEI6V2yEaEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93861168"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93861168"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 01:52:05 -0700
X-CSE-ConnectionGUID: MC9eEeDcQbyG3e4l9KMQJw==
X-CSE-MsgGUID: brFmUwqeRo+TfgHd4vgEww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="275620364"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.62])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 01:52:02 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 17 Sep 2026 11:51:56 +0300 (EEST)
To: Asai Neko <sugar@sne.moe>
cc: Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] platform/x86: asus-wmi: don't warn when LPS0 is
 unavailable
In-Reply-To: <20260917-asus-wmi-lps0-unavailable-warn-v2-1-aa8e3d73634a@sne.moe>
Message-ID: <c2be7ab0-8e9f-1b40-b019-c32a3a97fcc9@linux.intel.com>
References: <20260916-asus-wmi-lps0-unavailable-warn-v1-1-9bd6fb4c10f9@sne.moe> <20260917-asus-wmi-lps0-unavailable-warn-v2-1-aa8e3d73634a@sne.moe>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-350711589-1789635116=:1179"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-350711589-1789635116=:1179
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 17 Sep 2026, Asai Neko wrote:

> asus-wmi attempts to register its LPS0 suspend-to-idle callback during
> probe. acpi_register_lps0_dev() returns -ENODEV when the LPS0 interface
> is unavailable or explicitly disabled, but the driver treats this
> expected condition as a registration failure and prints:
>=20
>   failed to register LPS0 sleep handler in asus-wmi
>=20
> This occurs on the ASUS ROG STRIX X670E-A GAMING WIFI with BIOS 2704.
> The system exposes no PNP0D80 ACPI device and uses deep suspend. The
> warning therefore misleadingly suggests a sleep-related malfunction
> on a platform where the LPS0 callback is not applicable.
>=20
> Suppress the warning for -ENODEV while retaining it for other errors.
> Leave callback registration and suspend/resume behavior unchanged.
>=20
> Signed-off-by: Asai Neko <sugar@sne.moe>

Thanks, I've replaced v1 with this one in the review-ilpo-next branch.

Next time, please collect the Reviewed-by (and possible Tested-by) tags=20
from the previous version(s) when sending another version because our=20
maintainer tools only collect them for the current version.

Only if you make really major changes, then you may opt to drop the tags.

--
 i.

> ---
> Avoid the misleading ASUS WMI warning when LPS0 is unavailable.
> The diagnosis and rationale are included in the patch commit
> message.
> ---
> Changes in v2:
> - Fix the missing format specifier for ret reported by kernel test robot.
> - Shorten the warning message to keep the format string on one line.
> - Report: https://lore.kernel.org/oe-kbuild-all/202609170237.IYNujwsM-lkp=
@intel.com/
> - Link to v1: https://patch.msgid.link/20260916-asus-wmi-lps0-unavailable=
-warn-v1-1-9bd6fb4c10f9@sne.moe
>=20
> To: Corentin Chary <corentin.chary@gmail.com>
> To: "Luke D. Jones" <luke@ljones.dev>
> To: Denis Benato <denis.benato@linux.dev>
> To: Hans de Goede <hansg@kernel.org>
> To: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> Cc: platform-driver-x86@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/platform/x86/asus-wmi.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-=
wmi.c
> index a65090429ca7..c2af1f049b67 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -5421,8 +5421,11 @@ static struct acpi_s2idle_dev_ops asus_ally_s2idle=
_dev_ops =3D {
> =20
>  static void asus_s2idle_check_register(void)
>  {
> -=09if (acpi_register_lps0_dev(&asus_ally_s2idle_dev_ops))
> -=09=09pr_warn("failed to register LPS0 sleep handler in asus-wmi\n");
> +=09int ret;
> +
> +=09ret =3D acpi_register_lps0_dev(&asus_ally_s2idle_dev_ops);
> +=09if (ret && ret !=3D -ENODEV)
> +=09=09pr_warn("failed to register LPS0 sleep handler: %d\n", ret);
>  }
> =20
>  static void asus_s2idle_check_unregister(void)
>=20
> ---
> base-commit: 587858367581b9c55c3690f4e63382ad622719d4
> change-id: 20260916-asus-wmi-lps0-unavailable-warn-9a72be44b9ed
>=20
> Best regards,
> -- =20
> Asai Neko <sugar@sne.moe>
>=20
>=20
>=20
--8323328-350711589-1789635116=:1179--
