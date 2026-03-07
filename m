Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D5737BE6C;
	Sat,  7 Mar 2026 21:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772920647; cv=pass; b=aXlm5lFSN3sALBHG2XAigqtis09slIkIcDt4I7Y5RncuudrukXckKERxQENoMC2I0VlnDpLGVwkFPQQTUoOWU2160xe4cCbVRwg5LtxNKmxa6FbAad6Lh9MDS2w0vjS6WyFaDsrWE85Z2nF5sEI7eoY1FQoWBKjEm2DzqPB6O2Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772920647; c=relaxed/simple;
	bh=3DUh6CNCjNWkCA5BexQq4GIYTS7orgb9BbgkDq3U5ro=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ujuvixFLrk9TbLwWUUNqLkJcpghMkQegXEfwdgmPPhcGzIT8wwZm7jfCQ3VH96bMWLfE/a8XKcj91Yjh7BNAtn+GvT9F8vxxapgzpD5/lkWcMhOb9QuoBE2poIbrHhRMF5xYr+gXksd6vXhCSd7wd+A0UVATfsggSQ799rknq84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=Cq2c2nom; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="Cq2c2nom"
ARC-Seal: i=1; a=rsa-sha256; t=1772920620; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PwaUj8MkJmHeQA9BxRhUXAO+6/mvfMEoP7f2vuR6hQlwa7ysg/+EuLl62TpAEGkhjjNiEhPhbTsZ1nS09XskI1IGqJpgLnTRkgGfFEaOuzFBWrkRwq793YSXPMePHaNXmEzglVc/XLmO6EhnQN/OURzuESYrJeibeyfzA6n+vNw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772920620; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8CGHBNFMAPbg01OV7WWRCHQmzcbCsHchf3RSayqPZ2w=; 
	b=ONzoMsPW3CQKJ/1j8T4znOHEFhnso3cfE1fCXQ1Fbs8YDsxGzVYEVUhE24aMpZp6wCpHoSYBfHynFLPqUdISg/JSgBZYso3lEouaLcoqImfttuY/T/fMm6SOlyR/pRWTXxNQcWSf/UbPftyym/4YL2cecDV0RxexsrLqexjCbDA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772920620;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=8CGHBNFMAPbg01OV7WWRCHQmzcbCsHchf3RSayqPZ2w=;
	b=Cq2c2nomWyLUkreSyID9mGaDUs0NsK4xBHk2/ip5xT2eRQem0xBfbPH6hvYBdGlh
	PX9TLac7VmsC6NCYmyMdjm6jrwAr8HMQFeaaNfrVOoLnLM1SFvhqKw0J2QDvQ/naLvD
	niYO/HAmdUNXTx2JjWDNJhJOau08YEJ2ZeH88haaPXB0lI2YeWQZwrYAf39RR50sc/O
	Uxc9jTOHTCI/vj8lkrrWC0EdZgNn6qdjKMdu8IYznjanl6PUwdeRE6QPPXXqEvjkLJn
	Y09+D9G0qhvwsQQ1joYaxdibvnWzXeYNCqJh7U9YQ9HaiZQOV07QxGgtWSdmgaWvdLT
	NyI8gFSPVA==
Received: by mx.zohomail.com with SMTPS id 177292061886698.35456704565274;
	Sat, 7 Mar 2026 13:56:58 -0800 (PST)
Message-ID: <f416507304bb4c7c179109ff10bc97a2daeb7e87.camel@rong.moe>
Subject: Re: [RFC v3 3/4] platform/x86/amd: dptc: Add platform profile
 support
From: Rong Zhang <i@rong.moe>
To: Antheas Kapenekakis <lkml@antheas.dev>, Mario.Limonciello@amd.com
Cc: W_Armin@gmx.de, sashal@kernel.org, Shyam-Sundar.S-k@amd.com, 
	derekjohn.clark@gmail.com, denis.benato@linux.dev,
 linux-kernel@vger.kernel.org, 	platform-driver-x86@vger.kernel.org
In-Reply-To: <20260307115516.26892-4-lkml@antheas.dev>
References: <20260307115516.26892-1-lkml@antheas.dev>
	 <20260307115516.26892-4-lkml@antheas.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Mar 2026 05:51:15 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-8 
X-ZohoMailClient: External

Hi Antheas,

On Sat, 2026-03-07 at 12:55 +0100, Antheas Kapenekakis wrote:
> Register a platform_profile handler so the driver exposes standard
> power profiles (low-power, balanced, performance, max-power) alongside
> the manual tunable interface. max-power is only supplied when the
> performance profile's preset values are below the tunable limits.
>=20
> When a non-custom profile is active, parameter writes are blocked
> (-EPERM) and current_value reflects the profile's preset values.
> Selecting the "custom" profile returns control to the user for manual
> staging and committing. On resume, the active profile is automatically
> re-applied.
>=20
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  drivers/platform/x86/amd/Kconfig |   1 +
>  drivers/platform/x86/amd/dptc.c  | 116 +++++++++++++++++++++++++++++--
>  2 files changed, 113 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/=
Kconfig
> index d610092467fc..41ffbd722524 100644
> --- a/drivers/platform/x86/amd/Kconfig
> +++ b/drivers/platform/x86/amd/Kconfig
> @@ -48,6 +48,7 @@ config AMD_ISP_PLATFORM
>  config AMD_DPTC
>  	tristate "AMD Dynamic Power and Thermal Configuration Interface (DPTCi)=
"
>  	depends on X86_64 && ACPI && DMI
> +	select ACPI_PLATFORM_PROFILE
>  	select FIRMWARE_ATTRIBUTES_CLASS
>  	help
>  	  Driver for AMD AGESA ALIB Function 0x0C, the Dynamic Power and
> diff --git a/drivers/platform/x86/amd/dptc.c b/drivers/platform/x86/amd/d=
ptc.c
> index acfe9cc01bab..1f07e2e6f278 100644
> --- a/drivers/platform/x86/amd/dptc.c
> +++ b/drivers/platform/x86/amd/dptc.c
> @@ -23,6 +23,7 @@
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/platform_device.h>
> +#include <linux/platform_profile.h>
>  #include <linux/processor.h>
>  #include <linux/sysfs.h>
>  #include <linux/unaligned.h>
> @@ -56,8 +57,13 @@ struct dptc_param_limits {
>  	u32 expanded_max;
>  };
> =20
> +struct dptc_profile {
> +	u32 vals[DPTC_NUM_PARAMS];	/* 0 =3D don't set / unstage this param */
> +};
> +
>  struct dptc_device_limits {
>  	struct dptc_param_limits params[DPTC_NUM_PARAMS];
> +	struct dptc_profile profiles[PLATFORM_PROFILE_LAST];
>  };
> =20
>  struct dptc_param_desc {
> @@ -85,6 +91,10 @@ static const struct dptc_device_limits limits_maxhh =
=3D { .params =3D {
>  	[DPTC_PPT_PL2_SPPT] =3D {  0,  4, 27,  82, 100 },
>  	[DPTC_PPT_PL3_FPPT] =3D {  0,  4, 40,  85, 100 },
>  	[DPTC_CPU_TEMP]     =3D { 60, 70, 95,  95, 100 },
> +}, .profiles =3D {
> +	[PLATFORM_PROFILE_LOW_POWER]   =3D { .vals =3D { 15, 15, 25, 0 } },
> +	[PLATFORM_PROFILE_BALANCED]    =3D { .vals =3D { 25, 27, 40, 0 } },
> +	[PLATFORM_PROFILE_PERFORMANCE] =3D { .vals =3D { 60, 63, 85, 0 } },
>  }};
> =20
>  /* Substring matches against boot_cpu_data.x86_model_id; order matters. =
*/
> @@ -134,6 +144,9 @@ struct dptc_priv {
> =20
>  	bool expanded;
> =20
> +	enum platform_profile_option profile;
> +	struct device *ppdev;
> +
>  	enum dptc_save_mode { SAVE_SINGLE, SAVE_BULK } save_mode;
> =20
>  	u32 staged[DPTC_NUM_PARAMS];
> @@ -269,6 +282,14 @@ static ssize_t dptc_current_value_show(struct kobjec=
t *kobj,
> =20
>  	guard(mutex)(&dptc->lock);
> =20
> +	if (dptc->profile !=3D PLATFORM_PROFILE_CUSTOM) {
> +		u32 val =3D dptc->dev_limits->profiles[dptc->profile].vals[ps->idx];
> +
> +		if (!val)
> +			return sysfs_emit(buf, "\n");
> +		return sysfs_emit(buf, "%u\n", val);
> +	}
> +
>  	if (!dptc->has_staged[ps->idx])
>  		return sysfs_emit(buf, "\n");
>  	return sysfs_emit(buf, "%u\n", dptc->staged[ps->idx]);
> @@ -287,6 +308,8 @@ static ssize_t dptc_current_value_store(struct kobjec=
t *kobj,
>  	if (count =3D=3D 1 && buf[0] =3D=3D '\n') {
>  		guard(mutex)(&dptc->lock);
> =20
> +		if (dptc->profile !=3D PLATFORM_PROFILE_CUSTOM)
> +			return -EPERM;

It has nothing to do with permissions. I'd prefer -EBUSY.

To maintain readability, usually a blank line should be added after
returning early.

>  		dptc->has_staged[ps->idx] =3D false;
>  		return count;
>  	}
> @@ -297,6 +320,8 @@ static ssize_t dptc_current_value_store(struct kobjec=
t *kobj,
> =20
>  	guard(mutex)(&dptc->lock);
> =20
> +	if (dptc->profile !=3D PLATFORM_PROFILE_CUSTOM)
> +		return -EPERM;
>  	min =3D dptc_get_min(dptc, ps->idx);
>  	max =3D dptc_get_max(dptc, ps->idx);
>  	if (val < min || (max && val > max))
> @@ -426,6 +451,8 @@ static ssize_t dptc_expanded_current_value_store(stru=
ct kobject *kobj,
> =20
>  	guard(mutex)(&dptc->lock);
> =20
> +	if (dptc->profile !=3D PLATFORM_PROFILE_CUSTOM)
> +		return -EPERM;

IMO kstrtou32() isn't really a blocker of acquiring the mutex earlier
to prevent duplicating the same check. After all, firmware-attributes
is not a performance critical interface, and dptc_save_settings_store()
also calls sysfs_eq() with the mutex held.

>  	dptc->expanded =3D val;
>  	/* Clear staged values: limits changed, old values may be out of range =
*/
>  	memset(dptc->has_staged, 0, sizeof(dptc->has_staged));
> @@ -594,6 +621,78 @@ static void dptc_kset_unregister(void *data)
>  	kset_unregister(data);
>  }
> =20
> +/* Platform profile */
> +
> +static void dptc_apply_profile(struct dptc_priv *dptc,
> +			       enum platform_profile_option profile)
> +{
> +	const struct dptc_profile *pp;
> +	int i;
> +
> +	memset(dptc->has_staged, 0, sizeof(dptc->has_staged));
> +
> +	if (profile =3D=3D PLATFORM_PROFILE_CUSTOM)
> +		return;
> +
> +	pp =3D &dptc->dev_limits->profiles[profile];
> +	for (i =3D 0; i < DPTC_NUM_PARAMS; i++) {
> +		if (!pp->vals[i])
> +			continue;
> +		dptc->staged[i] =3D pp->vals[i];
> +		dptc->has_staged[i] =3D true;
> +	}
> +}
> +
> +static int dptc_pp_probe(void *drvdata, unsigned long *choices)
> +{
> +	struct dptc_priv *dptc =3D drvdata;
> +	int i, j;
> +
> +	set_bit(PLATFORM_PROFILE_CUSTOM, choices);
> +	for (i =3D 0; i < PLATFORM_PROFILE_LAST; i++) {
> +		for (j =3D 0; j < DPTC_NUM_PARAMS; j++) {
> +			if (dptc->dev_limits->profiles[i].vals[j]) {
> +				set_bit(i, choices);
> +				break;
> +			}
> +		}
> +	}
> +	return 0;
> +}
> +
> +static int dptc_pp_get(struct device *dev,
> +		       enum platform_profile_option *profile)
> +{
> +	struct dptc_priv *dptc =3D dev_get_drvdata(dev);
> +
> +	guard(mutex)(&dptc->lock);
> +
> +	*profile =3D dptc->profile;
> +	return 0;
> +}
> +
> +static int dptc_pp_set(struct device *dev,
> +		       enum platform_profile_option profile)
> +{
> +	struct dptc_priv *dptc =3D dev_get_drvdata(dev);
> +	int ret =3D 0;
> +
> +	guard(mutex)(&dptc->lock);
> +
> +	dptc->profile =3D profile;
> +	dptc_apply_profile(dptc, profile);
> +	if (profile !=3D PLATFORM_PROFILE_CUSTOM)
> +		ret =3D dptc_alib_save(dptc);

I'd prefer simply calling dptc_alib_save() in dptc_apply_profile()
since the latter already checks the profile.

> +
> +	return ret;
> +}
> +
> +static const struct platform_profile_ops dptc_pp_ops =3D {
> +	.probe       =3D dptc_pp_probe,
> +	.profile_get =3D dptc_pp_get,
> +	.profile_set =3D dptc_pp_set,
> +};
> +
>  static int dptc_resume(struct device *dev)
>  {
>  	struct dptc_priv *dptc =3D dev_get_drvdata(dev);
> @@ -601,10 +700,14 @@ static int dptc_resume(struct device *dev)
> =20
>  	guard(mutex)(&dptc->lock);
> =20
> -	if (dptc->save_mode =3D=3D SAVE_SINGLE)
> +	if (dptc->profile !=3D PLATFORM_PROFILE_CUSTOM) {
> +		dptc_apply_profile(dptc, dptc->profile);
>  		ret =3D dptc_alib_save(dptc);
> -	else
> +	} else if (dptc->save_mode =3D=3D SAVE_SINGLE) {
> +		ret =3D dptc_alib_save(dptc);
> +	} else {
>  		ret =3D 0;
> +	}
> =20
>  	if (ret)
>  		dev_warn(dev, "failed to restore settings on resume: %d\n", ret);
> @@ -636,8 +739,7 @@ static int dptc_probe(struct platform_device *pdev)
>  		 boot_cpu_data.x86_model_id);
> =20
>  	dptc->fw_attr_dev =3D device_create(&firmware_attributes_class,
> -					  NULL, MKDEV(0, 0), NULL,
> -					  DRIVER_NAME);
> +					  NULL, MKDEV(0, 0), NULL, DRIVER_NAME);

Squash the change into the previous patch.

Thanks,
Rong

>  	if (IS_ERR(dptc->fw_attr_dev))
>  		return PTR_ERR(dptc->fw_attr_dev);
> =20
> @@ -680,6 +782,12 @@ static int dptc_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
> =20
> +	dptc->profile =3D PLATFORM_PROFILE_CUSTOM;
> +	dptc->ppdev =3D devm_platform_profile_register(dev, "amd-dptc", dptc,
> +						     &dptc_pp_ops);
> +	if (IS_ERR(dptc->ppdev))
> +		return PTR_ERR(dptc->ppdev);
> +
>  	return 0;
>  }
> =20
