Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E533B3AC0CD;
	Mon, 20 Jul 2026 06:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784530133; cv=none; b=fSFmzThlW/F4v6omrJOa2tbXAkE3B/FW06wHygSej5gGGyfEln8Qb5rdBJmmReCpV4MRcmBLMqVKPsNDJ5X2Q4qs3h0VDAvwHLmRwqk9T1VgcfY62PRMupsg/dDiWTWqIUqI9+NB/afEc72LHIwjQTldqYoE/6nBNuPPDX0VNaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784530133; c=relaxed/simple;
	bh=Vhnm8lrdDRf0epc30pe6Y/rM44fD9O42x/Wpb6LG/rI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g8uE/Mw3pwafKYMHhr7Kp/JxQkbGG0vofy2F3DPLrBSEpLV9Qmz/fQZyAozfiHv4hkkoupZk2dTuZ3Bs3hkzGRrSTJZy+8aIl1eucO3kywH/bpQqE40NBeW+ROBUUn0rNB2bSVCQBiiSmvmM55GcFN+ha1IYG4+TKYbxA3Uo0w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BXl3K9zk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BXl3K9zk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F7D41F00A3A;
	Mon, 20 Jul 2026 06:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784530131;
	bh=3zGlCAYxT4kdcVNo48fLGG7NXVkA9ShimNGbMF62maQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BXl3K9zkWc6LEucqrCk2ShsZ2mm3Ct9In6TYswVSj8D0r4NFlxCTMExJqApGRtq5b
	 /utc2IKHkMasbiFkM0VpLazmR6455AIiDUrT3DDSsbtPJIJJNasXpaUtPTY/sB1UZW
	 t0VcXiFb/K8irDqVWcOhBy0qOVm2YTyiiDBNyulnDNDgJBp+BL7xyCNSH5C7oyWQHw
	 T27boLxim5fRG5TI5Jdvi6g5qHqEirUMmC5lWU5PdFa8YVB4XDzfYGZX12zoKcpLHW
	 JyQmGLFCAC3JlXLmiHmGRUcQj0QAPToDinWM0LxkaJ9LMQjutf299f8NFvkvhLEtsn
	 0mbhMYH1NJh7A==
Date: Mon, 20 Jul 2026 06:48:45 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Sean Rhodes <sean@starlabs.systems>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
	corentin.chary@gmail.com, luke@ljones.dev, denis.benato@linux.dev,
	prasanth.ksr@dell.com, jorge.lopez2@hp.com,
	mpearson-lenovo@squebb.ca, derekjohn.clark@gmail.com,
	josh@joshuagrisham.com, briannorris@chromium.org,
	jwerner@chromium.org, tzimmermann@suse.de, javierm@redhat.com,
	kees@kernel.org, u.kleine-koenig@baylibre.com, mst@redhat.com,
	chenhuacai@kernel.org, wenst@chromium.org,
	florian.fainelli@broadcom.com, titouan.ameline@gmail.com,
	oliver@liuxiaozhen.dev, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v7 3/3] firmware: coreboot: Add CFR firmware attributes
 driver
Message-ID: <al3EzcPFCx-kL54h@google.com>
References: <20260717085003.369496-1-sean@starlabs.systems>
 <20260717085003.369496-4-sean@starlabs.systems>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717085003.369496-4-sean@starlabs.systems>

On Fri, Jul 17, 2026 at 09:50:03AM +0100, Sean Rhodes wrote:
> diff --git a/drivers/firmware/coreboot/coreboot-cfr.c b/drivers/firmware/coreboot/coreboot-cfr.c
...
> +static int coreboot_cfr_read_efi_value_locked(efi_char16_t *efi_name,
> +					      u32 *value, u32 *attrs)
> +{

There is no coreboot_cfr_read_efi_value() and the symbol isn't exported
anyway.  The "_locked" suffix here is redundant.  Instead, it can leave a
note in the comment to indicate the lock requirement.

> +static int coreboot_cfr_read_value(const struct coreboot_cfr_setting *setting,
> +				   u32 *value, u32 *attrs)
> +{
> +	efi_char16_t *efi_name;
> +	int ret;
> +
> +	efi_name = coreboot_cfr_efi_name(setting->name);
> +	if (IS_ERR(efi_name))
> +		return PTR_ERR(efi_name);
> +
> +	ret = efivar_lock();
> +	if (ret) {
> +		kfree(efi_name);
> +		return ret;

To be neat, use a goto statement to clean up.

> +static int coreboot_cfr_write_efi_value_locked(efi_char16_t *efi_name,
> +					       u32 value, u32 attrs)

Same here.  s/_locked//.

> +static int coreboot_cfr_write_value(struct coreboot_cfr_setting *setting,
> +				    u32 value)
> +{
> +	efi_char16_t *efi_name;
> +	u32 attrs;
> +	u32 old;
> +	int restore_ret;
> +	int ret;
> +	bool changed = false;

The initialization can be eliminated.  See comments below.

> +
> +	if (setting->read_only)
> +		return -EACCES;
> +
> +	efi_name = coreboot_cfr_efi_name(setting->name);
> +	if (IS_ERR(efi_name))
> +		return PTR_ERR(efi_name);
> +
> +	mutex_lock(&setting->drvdata->lock);

Since it already includes cleanup.h, how about using a guard()?

> +	ret = coreboot_cfr_write_efi_value_locked(efi_name, value, attrs);
> +	if (ret)
> +		goto out_unlock_efi;
> +	changed = true;
> +
> +	ret = coreboot_cfr_apply_runtime(setting);
> +	if (ret == -EOPNOTSUPP) {
> +		/* EFI changed; firmware will consume it after reboot. */
> +		setting->drvdata->pending_reboot = true;
> +		ret = 0;
> +	} else if (ret) {
> +		restore_ret = coreboot_cfr_write_efi_value_locked(efi_name, old, attrs);
> +		if (restore_ret) {
> +			setting->drvdata->pending_reboot = true;
> +			ret = restore_ret;
> +		} else if (coreboot_cfr_apply_runtime(setting)) {

Does it need to apply runtime again for old values?  The previous
coreboot_cfr_apply_runtime() for new values was just failed (i.e., the new
values shouldn't take effect).

> +			setting->drvdata->pending_reboot = true;
> +		} else {
> +			changed = false;
> +		}
> +	}
> +
> +out_unlock_efi:
> +	efivar_unlock();
> +out_unlock_mutex:
> +	mutex_unlock(&setting->drvdata->lock);
> +	kfree(efi_name);
> +
> +	if (changed)
> +		kobject_uevent(&setting->drvdata->class_dev->kobj, KOBJ_CHANGE);

This shouldn't be in the cleanup path.  Move it before the label
"out_unlock_efi".  `changed` only makes sense after calling
coreboot_cfr_write_efi_value_locked().

> +static bool
> +coreboot_cfr_possible_values_fit(const struct coreboot_cfr_setting *setting)

The function needs some comments to explain why and what.

> +{
> +	size_t len = 1; /* Trailing newline. */
> +	unsigned int i;
> +
> +	for (i = 0; i < setting->n_values; i++) {
> +		if (i)
> +			len++;

What is this for?  For ';'?

> +
> +		if (strlen(setting->values[i].label) >= PAGE_SIZE - len)
> +			return false;
> +
> +		len += strlen(setting->values[i].label);

A straightforward way:

    len += strlen(...);
    if (len >= PAGE_SIZE)
        ...

> +static int coreboot_cfr_add_numeric_option(struct coreboot_cfr_drvdata *data,
> +					   const struct lb_cfr_numeric_option *option,
> +					   bool parent_read_only)
> +{
...
> +	if (setting->type != COREBOOT_CFR_SETTING_NUMBER &&
> +	    !coreboot_cfr_possible_values_fit(setting)) {
> +		ret = 0;
> +		goto err_put_setting;
> +	}

Why it skips if the possible values can be truncated?  Is it seen as a
critical setting?

This needs some comments to explain why and what.

> +
> +	ret = coreboot_cfr_setting_is_usable(setting);
> +	if (ret) {
> +		if (ret == -ENOENT || ret == -EINVAL || ret == -EOPNOTSUPP ||
> +		    ret == -ENAMETOOLONG)
> +			ret = 0;

Does it check for values from coreboot table have corresponding EFI vars?
Why these errors aren't considered as failures?

This needs some comments to explain why and what.

> +		goto err_put_setting;
> +	}
> +
> +	ret = coreboot_cfr_register_setting(data, setting);
> +	if (ret)
> +		return ret;
> +
> +	return 0;

A simple way:

    return coreboot_cfr_register_setting(...);

Also it may be worth some comments to mention that after calling
coreboot_cfr_register_setting(), `coreboot_cfr_setting_ktype` takes care of
the resource release.
