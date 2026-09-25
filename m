Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFEC4BD7BF
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2026 18:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790362444; cv=none; b=eEGuAR6GPJ4tK456yMQrZUfnvCgCZTif1f0ulq3WCvhaBfDryD5e7S7jmF17caAtc42E0cOFOD4Ua1W4wroGJ1jsZSmEP8nwXHYta+yAFhPc7lbtGXdP98eYesm781mZeNSD76qtELOcJgzLFGH6qMZBF+BBxzzBKPzi7ghoc5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790362444; c=relaxed/simple;
	bh=usaKw8fyOMLJ62ZswWZE9zU3pW4mGtmG0kmvZHsKDrI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hiTpjN9NF/6uom3x57K/bZ6lznOvzO3IBkaU43WGmf7lyEh1itLH/RsvvnaAJscJxGqej8mpA1Ng4Fhrrtl05zqwvOAfZHTNutnqOWssh25siPwUS5rWpdQ3mp2IqoUtMcSUpK/7LwLyd9zjUqBVQwSGv3MTxQIT+1V/NR2iYPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=AAbMhFUn; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="AAbMhFUn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1790362423; x=1790967223; i=w_armin@gmx.de;
	bh=OnUWNo4D9SwUC2B+pY4OrdlC+LT1MwrlTbkFmXhk7BI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=AAbMhFUnWdVHejV7AhWgCGN/2ynLN9zfMK/KDCUpCgST3bSITwENkUUuxp0iZChJ
	 JjKAWfv8Fiun1lqaQ3JQtd1RtfbPrzRnfc/e5KtNqRSdYXzkggYWwyiBbG37HYTaH
	 1vnV/CZNOc26iGd/+P+/1z10gT8EcT/RFC6SEJUHhyPz3dMhAmC3uk9AtLHn0jxie
	 shJCFYOIyzkJx1qCDwxEhkuTl0+Iv3PSXi1uzH/5vrLmgW38vh4hgQm4JN7IAVPUs
	 kVGn4K/rwc9905G6yteZxghKQ1fJJSNFvGOOsNxdn7hDc9XbH8g9A+q5KFHUu4VF/
	 VsB1P7d6Vui6hSG8iw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MHoN2-1wvNj737oM-00E3wR; Fri, 25
 Sep 2026 20:53:43 +0200
Message-ID: <f0407ed1-3b8f-4285-8349-926edf80e54f@gmx.de>
Date: Fri, 25 Sep 2026 20:53:42 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 5/7] platform/x86: think-lmi: Initial ThinkLMI v2
 driver
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: prasanth.ksr@dell.com, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
 derekjohn.clark@gmail.com, Dell.Client.Kernel@dell.com,
 platform-driver-x86@vger.kernel.org
References: <mpearson-lenovo@squebb.ca>
 <20260925160047.2063361-1-mpearson-lenovo@squebb.ca>
 <20260925160047.2063361-6-mpearson-lenovo@squebb.ca>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260925160047.2063361-6-mpearson-lenovo@squebb.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:nWhdGfWdt9Mpl2nU1zZqQVuOQJKT32z5Zm+Up168U/NKofTlmLD
 gOjdRxNbLr3q0shdkOEqJq3dYyjjpULIGAvjHvRKWUfQYim8ScQFRZadpZhaDxJpQwn8pur
 H6ciegcw9VLphHtmtpWCWrhcE8uYsDMG7bhiCYSgdaeG7QeWk/ztyqUMREHlrnGgv5LUxxY
 Rm9vHJBHSG+zm/xkdD8BA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:R9NaZUfsTwc=;OmGPQXxUEuqkh6VKSKKVFmzEugl
 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

Am 25.09.26 um 18:00 schrieb Mark Pearson:

> Lenovo Thinkpad, Thinkstation and ThinkCenter are moving to a new common
> WMI implementation.
>
> This driver adds initial support for the new implementation, allowing
> attributes to be read and modified.
>
> Certificate based authentication is not implemented in this
> version.
>
> think-lmi is updated to use this driver if supported by the HW and
> requested by the user.
>
> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> ---
>   drivers/platform/x86/lenovo/think-lmi-v2.c | 960 +++++++++++++++++++++
>   drivers/platform/x86/lenovo/think-lmi.c    |   9 +-
>   drivers/platform/x86/lenovo/think-lmi.h    |  59 ++
>   3 files changed, 1025 insertions(+), 3 deletions(-)
>   create mode 100644 drivers/platform/x86/lenovo/think-lmi-v2.c
>
> diff --git a/drivers/platform/x86/lenovo/think-lmi-v2.c b/drivers/platform/x86/lenovo/think-lmi-v2.c
> new file mode 100644
> index 000000000000..5bc0a349c5fb
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo/think-lmi-v2.c
> @@ -0,0 +1,960 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Think LMI V2 BIOS configuration driver
> + *
> + * Copyright(C) 2026 Lenovo
> + * Distributed under the GPL-2.0 license
> + */
> +

...

> +/* Get password settings from BIOS */
> +static int tlmi_get_pwd_settings(void)
> +{
> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
> +	const union acpi_object *obj;
> +	acpi_status status;
> +
> +	if (!tlmi_priv.can_get_password_settings)
> +		return -EOPNOTSUPP;
> +
> +	status = wmi_query_block(LENOVO_BIOS_ACCESS_DATA_GUID, 0, &output);

Big NACK from my side, this function is deprecated and scheduled for removal.

If i understand correctly the core drivers needs two WMI GUIDs, one for discovering
settings and one for operating on those settings. Please use the component framework
to link those two together by register a component for the data GUID and a component
master for the method GUID.

This also allows you to use the modern buffer-based WMI API, so you can leave ACPI
behind when writing this driver.

> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +
> +	obj = output.pointer;
> +	if (!obj)
> +		return -ENOMEM;
> +
> +	if (obj->type != ACPI_TYPE_PACKAGE) {
> +		kfree(obj);
> +		return -EIO;
> +	}
> +
> +	tlmi_priv.pwdcfg_v2.password_state = obj->package.elements[0].integer.value;
> +	tlmi_priv.pwdcfg_v2.minlen = obj->package.elements[1].integer.value;
> +	tlmi_priv.pwdcfg_v2.maxlen = obj->package.elements[2].integer.value;
> +	tlmi_priv.pwdcfg_v2.strong_password = obj->package.elements[3].integer.value;
> +	tlmi_priv.pwdcfg_v2.supported_encodings = obj->package.elements[4].integer.value;
> +	tlmi_priv.pwdcfg_v2.supported_keyboard = obj->package.elements[5].integer.value;
> +	tlmi_priv.pwdcfg_v2.hdd_user_password = obj->package.elements[6].integer.value;
> +	tlmi_priv.pwdcfg_v2.hdd_master_password = obj->package.elements[7].integer.value;
> +	tlmi_priv.pwdcfg_v2.nvme_user_password = obj->package.elements[8].integer.value;
> +	tlmi_priv.pwdcfg_v2.nvme_master_password = obj->package.elements[9].integer.value;
> +	tlmi_priv.pwdcfg_v2.deploy_mode = obj->package.elements[10].integer.value;
> +	tlmi_priv.pwdcfg_v2.sys_mgr_pwd_ctrl = obj->package.elements[11].integer.value;
> +	tlmi_priv.pwdcfg_v2.power_on_pwd_ctrl = obj->package.elements[12].integer.value;
> +	tlmi_priv.pwdcfg_v2.storage_pwd_ctrl = obj->package.elements[13].integer.value;
> +	tlmi_priv.pwdcfg_v2.sys_mgr_setup_ctrl = obj->package.elements[14].integer.value;
> +
> +	if (WARN_ON(tlmi_priv.pwdcfg_v2.maxlen >= TLMI_PWD_BUFSIZE))
> +		tlmi_priv.pwdcfg_v2.maxlen = TLMI_PWD_BUFSIZE - 1;
> +
> +	tlmi_priv.pwd_admin = tlmi_create_auth(SVP, "bios-admin");
> +	if (tlmi_priv.pwdcfg_v2.password_state & TLMI_SVP_PWD)
> +		tlmi_priv.pwd_admin->pwd_enabled = true;
> +
> +	tlmi_priv.pwd_power = tlmi_create_auth(POP, "power-on");
> +	if (tlmi_priv.pwdcfg_v2.password_state & TLMI_POP_PWD)
> +		tlmi_priv.pwd_power->pwd_enabled = true;
> +
> +	tlmi_priv.pwd_system = tlmi_create_auth(SMP, "system");
> +	if (tlmi_priv.pwdcfg_v2.password_state & TLMI_SMP_PWD)
> +		tlmi_priv.pwd_system->pwd_enabled = true;
> +
> +	tlmi_priv.pwd_hdd = tlmi_create_auth(HDD1, "hdd");
> +	tlmi_priv.pwd_hdd->index = 1;
> +	if (tlmi_priv.pwdcfg.ext.hdd_user_password ||
> +	    tlmi_priv.pwdcfg.ext.hdd_master_password) {
> +		tlmi_priv.pwd_hdd->pwd_enabled = true;
> +		if (tlmi_priv.pwdcfg.ext.hdd_master_password)
> +			tlmi_priv.pwd_hdd->index =
> +				ffs(tlmi_priv.pwdcfg.ext.hdd_master_password) - 1;
> +		else
> +			tlmi_priv.pwd_hdd->index =
> +				ffs(tlmi_priv.pwdcfg.ext.hdd_user_password) - 1;
> +	}
> +
> +	tlmi_priv.pwd_nvme = tlmi_create_auth(NVME1, "nvme");
> +	tlmi_priv.pwd_nvme->index = 1;
> +	if (tlmi_priv.pwdcfg.ext.nvme_user_password ||
> +	    tlmi_priv.pwdcfg.ext.nvme_master_password) {
> +		tlmi_priv.pwd_nvme->pwd_enabled = true;
> +		if (tlmi_priv.pwdcfg.ext.nvme_master_password)
> +			tlmi_priv.pwd_nvme->index =
> +				ffs(tlmi_priv.pwdcfg.ext.nvme_master_password) - 1;
> +		else
> +			tlmi_priv.pwd_nvme->index =
> +				ffs(tlmi_priv.pwdcfg.ext.nvme_user_password) - 1;
> +	}
> +
> +	kfree(obj);
> +
> +	return 0;
> +}
> +
> +static int tlmi_analyze(struct wmi_device *wdev)
> +{
> +	int i, ret;
> +
> +	if (wmi_has_guid(LENOVO_BIOS_CONFIGURATION_GUID))
> +		tlmi_priv.can_set_bios_settings = true;
> +	if (wmi_has_guid(LENOVO_BIOS_ACCESS_DATA_GUID))
> +		tlmi_priv.can_get_password_settings = true;
> +	if (wmi_has_guid(LENOVO_BIOS_ACCESS_GUID)) {
> +		tlmi_priv.can_set_bios_password = true;
> +		tlmi_priv.certificate_support = true;
> +	}

This should be used to determine which components the component master wants
to bind to, as some of them seem to be optional.

Using wmi_has_guid() will not work for duplicated GUIDs, so we need a new function
here. I can write a patch that adds:

	bool wmidev_exists(const char *guid);

You could then carry this patch with this patch series.

Thanks,
Armin Wolf

> +
> +	/*
> +	 * Try to find the number of valid settings of this machine
> +	 * and use it to create sysfs attributes.
> +	 */
> +	for (i = 0; i < TLMI_SETTINGS_COUNT - 1; ++i) {
> +		tlmi_priv.setting[i] = NULL;
> +		ret = tlmi_setting(wdev, i);
> +		if (ret)
> +			goto fail_clear_attr;
> +	}
> +
> +	/* Probe and create password setting structure */
> +	ret = tlmi_get_pwd_settings();
> +	if (ret)
> +		goto fail_clear_attr;
> +
> +	return 0;
> +
> +fail_clear_attr:
> +	for (i = 0; i < TLMI_SETTINGS_COUNT; ++i) {
> +		if (tlmi_priv.setting[i])
> +			tlmi_release_setting(tlmi_priv.setting[i]);
> +	}
> +	kfree(tlmi_priv.pwd_admin);
> +	kfree(tlmi_priv.pwd_power);
> +	kfree(tlmi_priv.pwd_system);
> +	kfree(tlmi_priv.pwd_hdd);
> +	kfree(tlmi_priv.pwd_nvme);
> +
> +	return ret;
> +}
