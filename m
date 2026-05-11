Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A591532BF41;
	Mon, 11 May 2026 12:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778502253; cv=none; b=rtvFYevt1VH83EO/+Pj8AWSXVvrnjFvozVpaDg8PNnVQaMcVsNtrn823gy417ni+EN4XrXh3/7RM1z8TrfiEL+YCWqRqahhn/mwjPfO+KpUStkzzJ00u1tOGVsdzR3du+7+ChGORirlSFFrNMmamcyGBDX3NImmixRYHRU7uhZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778502253; c=relaxed/simple;
	bh=xRHIRzfouC1/DZFkJmvDAlVXDHpgVNNtdVNbBInAZLA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=SINAtfeDsn+2RVMoKDyYOc0Z5f+kQ91xv31BZGMM1E9e0BLLzJhC0GgisQ4s7pVErKNLpKTeRLJRYA4eeeD7yKSW2jRJTxBf43Y6jo3WlgvIt4zHBYKgFOW68FqIhADKxKE/k/+RRQkr79HZPRcq8R/EuC57pQ+SfU62zeeGS9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E4EnnckK; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E4EnnckK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778502252; x=1810038252;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=xRHIRzfouC1/DZFkJmvDAlVXDHpgVNNtdVNbBInAZLA=;
  b=E4EnnckKH29lQw4VFayxRComUl7jKxNJVx0LPkI5tJ1XkZlOeW0Djk0P
   yo6REJd2sCJl8K4Q3f2e30mzvuvljqeRGhjDf02gMA//PbOtjDgpSdmQD
   mtu8HdG99/KYq9sRiKQFYD3BjIeogJsu33ERWkQ9ADI2fmxOzgs2+7ovB
   GI2JoRcKdpzs8uHmHiP0NOiubAioZyYH0TqZBdTsQ3OEp/uMhLCqUNFfD
   6VvvoVP8Fctvmd1t6XoFctEkdtZzkXyh4nbybMbnOGYufpPhtgH6eGWaS
   9JSsv2Xua//CyYVo7pUj4+1CyLZp+UUw+V/oGsO4Z7fjBF3BRchWXOZDh
   w==;
X-CSE-ConnectionGUID: sr/3szy/TZi1Y85aZ3mEQg==
X-CSE-MsgGUID: qwAtPuqDQ/WZjmee03t0Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="81950935"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="81950935"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 05:24:11 -0700
X-CSE-ConnectionGUID: fexu7dvBQRmfD8woWe+Snw==
X-CSE-MsgGUID: uw5VRbGDQkuUcVLUxh/V0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="241796609"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.28])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 05:24:08 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 11 May 2026 15:24:04 +0300 (EEST)
To: Daniel Gibson <daniel@gibson.sh>
cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, 
    Sindre Henriksen <sindrehenriksen93@gmail.com>, 
    "Mario Limonciello (AMD)" <superm1@kernel.org>
Subject: Re: [PATCH v2 2/5] platform/x86/amd/pmc: Delay suspend for some
 Lenovo Laptops
In-Reply-To: <20260509013105.816339-3-daniel@gibson.sh>
Message-ID: <2fd86d67-b9e6-57ab-775c-1297e34a2e7f@linux.intel.com>
References: <20260509013105.816339-1-daniel@gibson.sh> <20260509013105.816339-3-daniel@gibson.sh>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-568771658-1778502244=:981"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-568771658-1778502244=:981
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sat, 9 May 2026, Daniel Gibson wrote:

> Some IdeaPad Slim 3 devices and similar with AMD CPUs have a
> nonfunctional keyboard and lid switch after s2idle.
> It helps to delay suspend by 2.5 seconds so the EC has some time
> to do whatever it needs to get done before suspend - unfortunately
> at least on my 16ABR8 waking it with a timer (wakealarm) still
> triggers the issue, but at least normal resume via keypress or
> lid works fine.
>=20
> This issue has been reported for many different devices, this patch
> has been tested with the Zen3-based IdeaPad Slim 3 16ABR8 (82XR)
> and the Zen3+-based IdeaPad Slim 3 14ARP10 (83K6).
>=20
> Reported-by: Sindre Henriksen <sindrehenriksen93@gmail.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D221383

Cc: stable@vger.kernel.org

would be warranted for this.

> Tested-by: Sindre Henriksen <sindrehenriksen93@gmail.com>
> Suggested-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Signed-off-by: Daniel Gibson <daniel@gibson.sh>
> ---
>  drivers/platform/x86/amd/pmc/pmc-quirks.c | 31 +++++++++++++++++++++++
>  drivers/platform/x86/amd/pmc/pmc.c        | 24 +++++++++++++++++-
>  drivers/platform/x86/amd/pmc/pmc.h        |  1 +
>  3 files changed, 55 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/platform=
/x86/amd/pmc/pmc-quirks.c
> index 24506e342943..842a8f442fb5 100644
> --- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
> +++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
> @@ -18,6 +18,7 @@
>  struct quirk_entry {
>  =09u32 s2idle_bug_mmio;
>  =09bool spurious_8042;
> +=09bool need_suspend_delay;
>  };
> =20
>  static struct quirk_entry quirk_s2idle_bug =3D {
> @@ -33,6 +34,10 @@ static struct quirk_entry quirk_s2idle_spurious_8042 =
=3D {
>  =09.spurious_8042 =3D true,
>  };
> =20
> +static struct quirk_entry quirk_s2idle_need_suspend_delay =3D {
> +=09.need_suspend_delay =3D true,
> +};
> +
>  static const struct dmi_system_id fwbug_list[] =3D {
>  =09{
>  =09=09.ident =3D "L14 Gen2 AMD",
> @@ -203,6 +208,27 @@ static const struct dmi_system_id fwbug_list[] =3D {
>  =09=09=09DMI_MATCH(DMI_PRODUCT_NAME, "82XQ"),
>  =09=09}
>  =09},
> +=09/* https://bugzilla.kernel.org/show_bug.cgi?id=3D221383 */
> +=09{
> +=09=09.ident =3D "Zen3-based IdeaPad Slim and similar",
> +=09=09.driver_data =3D &quirk_s2idle_need_suspend_delay,
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +=09=09=09/*
> +=09=09=09 * Note: there are also some Zen2-based 82X* devices that
> +=09=09=09 * need different quirks, they're already handled above
> +=09=09=09 */
> +=09=09=09DMI_MATCH(DMI_PRODUCT_NAME, "82X"),
> +=09=09}
> +=09},
> +=09{
> +=09=09.ident =3D "Zen3+-based IdeaPad Slim and similar",
> +=09=09.driver_data =3D &quirk_s2idle_need_suspend_delay,
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +=09=09=09DMI_MATCH(DMI_PRODUCT_NAME, "83K"),
> +=09=09}
> +=09},
>  =09/* https://bugzilla.kernel.org/show_bug.cgi?id=3D221273 */
>  =09{
>  =09=09.ident =3D "Thinkpad L14 Gen3",
> @@ -356,6 +382,11 @@ void amd_pmc_process_restore_quirks(struct amd_pmc_d=
ev *dev)
>  =09=09amd_pmc_skip_nvme_smi_handler(dev->quirks->s2idle_bug_mmio);
>  }
> =20
> +bool amd_pmc_quirk_need_suspend_delay(struct amd_pmc_dev *dev)
> +{
> +=09return dev->quirks && dev->quirks->need_suspend_delay;
> +}
> +
>  void amd_pmc_quirks_init(struct amd_pmc_dev *dev)
>  {
>  =09const struct dmi_system_id *dmi_id;
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/am=
d/pmc/pmc.c
> index 2b9e5730170a..6bafd8661d68 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -611,6 +611,27 @@ static bool amd_pmc_intermediate_wakeup_need_delay(s=
truct amd_pmc_dev *pdev)
>  =09return get_metrics_table(pdev, &table) =3D=3D 0 && table.s0i3_last_en=
try_status;
>  }
> =20
> +static bool amd_pmc_want_suspend_delay(struct amd_pmc_dev *pdev)
> +{
> +=09/*
> +=09 * Some Lenovo Laptops (like different IdeaPad 3 Slims) need some
> +=09 * me-time before sleeping or they get uncooperative after waking
> +=09 * up and don't send events for keyboard and lid switch anymore.
> +=09 *
> +=09 * Unfortunately this doesn't entirely fix the problem: It can still
> +=09 * happen when resuming with a timer (wakealarm), but at least the
> +=09 * more common usecases (wakeup by opening lid or pressing a key)
> +=09 * work fine with this workaround.
> +=09 *
> +=09 * See https://bugzilla.kernel.org/show_bug.cgi?id=3D221383
> +=09 */
> +=09if (!disable_workarounds && amd_pmc_quirk_need_suspend_delay(pdev)) {
> +=09=09dev_info(pdev->dev, "Delaying suspend by 2.5s to avoid platform bu=
g\n");
> +=09=09return true;
> +=09}
> +=09return false;
> +}
> +
>  static void amd_pmc_s2idle_prepare(void)
>  {
>  =09struct amd_pmc_dev *pdev =3D &pmc;
> @@ -647,7 +668,8 @@ static void amd_pmc_s2idle_check(void)
>  =09struct amd_pmc_dev *pdev =3D &pmc;
>  =09int rc;
> =20
> -=09if (amd_pmc_intermediate_wakeup_need_delay(pdev))
> +=09if (amd_pmc_intermediate_wakeup_need_delay(pdev) ||
> +=09    amd_pmc_want_suspend_delay(pdev))

Thanks, this looks much cleaner. :-)

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

>  =09=09msleep(2500);
> =20
>  =09/* Dump the IdleMask before we add to the STB */
> diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/am=
d/pmc/pmc.h
> index fe3f53eb5955..f5257e47b8c4 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.h
> +++ b/drivers/platform/x86/amd/pmc/pmc.h
> @@ -147,6 +147,7 @@ enum amd_pmc_def {
>  };
> =20
>  void amd_pmc_process_restore_quirks(struct amd_pmc_dev *dev);
> +bool amd_pmc_quirk_need_suspend_delay(struct amd_pmc_dev *dev);
>  void amd_pmc_quirks_init(struct amd_pmc_dev *dev);
>  void amd_mp2_stb_init(struct amd_pmc_dev *dev);
>  void amd_mp2_stb_deinit(struct amd_pmc_dev *dev);
>=20

--=20
 i.

--8323328-568771658-1778502244=:981--
