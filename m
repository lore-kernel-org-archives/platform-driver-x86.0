Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D763C76A6;
	Tue, 21 Jul 2026 09:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784625280; cv=none; b=DlZ+iLrIJYxDq7AK2D+UVUsBt2XrdQUci0QSbkxOvqQ5BfKRM7zxOoKU3B4FA7nldOpdGadBtSiYP+1MMBjDMsu/TZR0+fiEDTMaX2A6ftxpo35fPSskVvOuU7E9fMlqy82qGc/3P5RMW5RvCXCR2W81Vx2e5r8WhTmZNY55GS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784625280; c=relaxed/simple;
	bh=+kAczA78WehJngfNWIqUTzEGO5oIfZ3mcqwk/SxGsEA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=UfjKfaCBpPzwKE8KeNTLEv3WKpFE88V+uzSyaL6+mOaUWH046TZTg7Gf6jjDeGf4MOlXxRHVGYtbQ5jekKYC7Kciz8TGOwwAvyC8Tj8nk4LEfPAEqoqWaaPKwvNfAza5wW0QT4hCPFF+2fc2suIc6kUjlqnidS5DX2s7AmDGQPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lj+qUjPT; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lj+qUjPT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784625279; x=1816161279;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=+kAczA78WehJngfNWIqUTzEGO5oIfZ3mcqwk/SxGsEA=;
  b=lj+qUjPTCvWgWnoX/kbjHXuiebB3k8/Vj3stwG3jbfS/+sudFeGhm3m3
   29SIblDl0Z5M2WwPucF1yh/YYeTalB7AqJGyQYh/RiQdBlWxmk6CAuixc
   MxoLBUAsVBwLUvp/6hc4u4j7WGH+GkogwM/6sVSm99mXe56XA6unAKch3
   tHF62EBlO/p9cvFrGYc8CzRmk0pTfogM4DSpxbnJl43Gn8NEGKHs3fosz
   yDGuqmEy4ZmwVSGORNIpN8YV11S338J7V2ZaS2FqkhtKLjKSXF8dkWPJa
   zCFbhP2rpA6NTmUeL3mbk9oFZF3+IuqR4oCOsa4mYF23br6eKYOualJ6/
   A==;
X-CSE-ConnectionGUID: vy+WVu+uRsGIwj/QEHCSRQ==
X-CSE-MsgGUID: 8BRVFFXsSLa3wWc1qdj05g==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="84348152"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; 
   d="scan'208";a="84348152"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 02:14:38 -0700
X-CSE-ConnectionGUID: 8FK+A7ZbQDmJBwZqzTPzSg==
X-CSE-MsgGUID: 8joRMt05QmWkh5uMHZ8VYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; 
   d="scan'208";a="253789872"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.47])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 02:14:29 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 21 Jul 2026 12:14:26 +0300 (EEST)
To: Tzung-Bi Shih <tzungbi@kernel.org>, Sean Rhodes <sean@starlabs.systems>
cc: Hans de Goede <hansg@kernel.org>, corentin.chary@gmail.com, 
    luke@ljones.dev, denis.benato@linux.dev, prasanth.ksr@dell.com, 
    jorge.lopez2@hp.com, Mark Pearson <mpearson-lenovo@squebb.ca>, 
    derekjohn.clark@gmail.com, josh@joshuagrisham.com, 
    briannorris@chromium.org, jwerner@chromium.org, tzimmermann@suse.de, 
    javierm@redhat.com, kees@kernel.org, u.kleine-koenig@baylibre.com, 
    mst@redhat.com, chenhuacai@kernel.org, wenst@chromium.org, 
    florian.fainelli@broadcom.com, titouan.ameline@gmail.com, 
    oliver@liuxiaozhen.dev, LKML <linux-kernel@vger.kernel.org>, 
    platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
    chrome-platform@lists.linux.dev
Subject: Re: [PATCH v7 3/3] firmware: coreboot: Add CFR firmware attributes
 driver
In-Reply-To: <al3EzcPFCx-kL54h@google.com>
Message-ID: <a27de527-245d-7b83-dec9-5b11b5de5869@linux.intel.com>
References: <20260717085003.369496-1-sean@starlabs.systems> <20260717085003.369496-4-sean@starlabs.systems> <al3EzcPFCx-kL54h@google.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 20 Jul 2026, Tzung-Bi Shih wrote:

> On Fri, Jul 17, 2026 at 09:50:03AM +0100, Sean Rhodes wrote:
> > diff --git a/drivers/firmware/coreboot/coreboot-cfr.c b/drivers/firmware/coreboot/coreboot-cfr.c
> ...
> > +static int coreboot_cfr_read_efi_value_locked(efi_char16_t *efi_name,
> > +					      u32 *value, u32 *attrs)
> > +{
> 
> There is no coreboot_cfr_read_efi_value() and the symbol isn't exported
> anyway.  The "_locked" suffix here is redundant.  Instead, it can leave a
> note in the comment to indicate the lock requirement.
>
> > +static int coreboot_cfr_read_value(const struct coreboot_cfr_setting *setting,
> > +				   u32 *value, u32 *attrs)
> > +{
> > +	efi_char16_t *efi_name;
> > +	int ret;
> > +
> > +	efi_name = coreboot_cfr_efi_name(setting->name);
> > +	if (IS_ERR(efi_name))
> > +		return PTR_ERR(efi_name);
> > +
> > +	ret = efivar_lock();
> > +	if (ret) {
> > +		kfree(efi_name);
> > +		return ret;
> 
> To be neat, use a goto statement to clean up.

It should use __free(), not goto.

-- 
 i.

> > +static int coreboot_cfr_write_efi_value_locked(efi_char16_t *efi_name,
> > +					       u32 value, u32 attrs)
> 
> Same here.  s/_locked//.
> 
> > +static int coreboot_cfr_write_value(struct coreboot_cfr_setting *setting,
> > +				    u32 value)
> > +{
> > +	efi_char16_t *efi_name;
> > +	u32 attrs;
> > +	u32 old;
> > +	int restore_ret;
> > +	int ret;
> > +	bool changed = false;
> 
> The initialization can be eliminated.  See comments below.
> 
> > +
> > +	if (setting->read_only)
> > +		return -EACCES;
> > +
> > +	efi_name = coreboot_cfr_efi_name(setting->name);
> > +	if (IS_ERR(efi_name))
> > +		return PTR_ERR(efi_name);
> > +
> > +	mutex_lock(&setting->drvdata->lock);
> 
> Since it already includes cleanup.h, how about using a guard()?
> 
> > +	ret = coreboot_cfr_write_efi_value_locked(efi_name, value, attrs);
> > +	if (ret)
> > +		goto out_unlock_efi;
> > +	changed = true;
> > +
> > +	ret = coreboot_cfr_apply_runtime(setting);
> > +	if (ret == -EOPNOTSUPP) {
> > +		/* EFI changed; firmware will consume it after reboot. */
> > +		setting->drvdata->pending_reboot = true;
> > +		ret = 0;
> > +	} else if (ret) {
> > +		restore_ret = coreboot_cfr_write_efi_value_locked(efi_name, old, attrs);
> > +		if (restore_ret) {
> > +			setting->drvdata->pending_reboot = true;
> > +			ret = restore_ret;
> > +		} else if (coreboot_cfr_apply_runtime(setting)) {
> 
> Does it need to apply runtime again for old values?  The previous
> coreboot_cfr_apply_runtime() for new values was just failed (i.e., the new
> values shouldn't take effect).
> 
> > +			setting->drvdata->pending_reboot = true;
> > +		} else {
> > +			changed = false;
> > +		}
> > +	}
> > +
> > +out_unlock_efi:
> > +	efivar_unlock();
> > +out_unlock_mutex:
> > +	mutex_unlock(&setting->drvdata->lock);
> > +	kfree(efi_name);
> > +
> > +	if (changed)
> > +		kobject_uevent(&setting->drvdata->class_dev->kobj, KOBJ_CHANGE);
> 
> This shouldn't be in the cleanup path.  Move it before the label
> "out_unlock_efi".  `changed` only makes sense after calling
> coreboot_cfr_write_efi_value_locked().
> 
> > +static bool
> > +coreboot_cfr_possible_values_fit(const struct coreboot_cfr_setting *setting)
> 
> The function needs some comments to explain why and what.
> 
> > +{
> > +	size_t len = 1; /* Trailing newline. */
> > +	unsigned int i;
> > +
> > +	for (i = 0; i < setting->n_values; i++) {
> > +		if (i)
> > +			len++;
> 
> What is this for?  For ';'?
> 
> > +
> > +		if (strlen(setting->values[i].label) >= PAGE_SIZE - len)
> > +			return false;
> > +
> > +		len += strlen(setting->values[i].label);
> 
> A straightforward way:
> 
>     len += strlen(...);
>     if (len >= PAGE_SIZE)
>         ...
> 
> > +static int coreboot_cfr_add_numeric_option(struct coreboot_cfr_drvdata *data,
> > +					   const struct lb_cfr_numeric_option *option,
> > +					   bool parent_read_only)
> > +{
> ...
> > +	if (setting->type != COREBOOT_CFR_SETTING_NUMBER &&
> > +	    !coreboot_cfr_possible_values_fit(setting)) {
> > +		ret = 0;
> > +		goto err_put_setting;
> > +	}
> 
> Why it skips if the possible values can be truncated?  Is it seen as a
> critical setting?
> 
> This needs some comments to explain why and what.
> 
> > +
> > +	ret = coreboot_cfr_setting_is_usable(setting);
> > +	if (ret) {
> > +		if (ret == -ENOENT || ret == -EINVAL || ret == -EOPNOTSUPP ||
> > +		    ret == -ENAMETOOLONG)
> > +			ret = 0;
> 
> Does it check for values from coreboot table have corresponding EFI vars?
> Why these errors aren't considered as failures?
> 
> This needs some comments to explain why and what.
> 
> > +		goto err_put_setting;
> > +	}
> > +
> > +	ret = coreboot_cfr_register_setting(data, setting);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return 0;
> 
> A simple way:
> 
>     return coreboot_cfr_register_setting(...);
> 
> Also it may be worth some comments to mention that after calling
> coreboot_cfr_register_setting(), `coreboot_cfr_setting_ktype` takes care of
> the resource release.
> 
