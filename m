Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51616182
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Apr 2025 12:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745413029; cv=none; b=t5AfB/r8skIzXNHq4o11EtlvItYO0p9OYw20Iz0DhkWd3QcvrkwkoO/pLmM3i9cfafFpWkX6tKNyMSpvfJwKiYNR90QYwa1mvNjLb04xPMf8BotjE3RK4rhECZaurQa/aEfZsqFrcn3uw+w7HhjwqvMc7hoxK6W/dmtR6gVtZGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745413029; c=relaxed/simple;
	bh=Dw3S7VnH9BwRJIwcce46Z97wLhUYfxsLf9yz44wEW7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ULsu2O6TjKU53Ebv/YF8ikqXr6hYaHrwY+vGiClvHQ6t4lhfmMfHg+m63GbNuCs49UWAN7scBWqqKpXX2u//t2H3ev+wlxYtspcjm0iH6Sxhmj00w6zj7qeyXvrJ8JeJLCTeGqdmsGP9wHpzMqYH89wJkvy76qG53im0NS+AYgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NnZi4fle; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NnZi4fle"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745413026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=12B1PA9yEjf0DLZx8TkvEXffVCSElLdrcmHq6YCB56o=;
	b=NnZi4fleRpVSIqmb3zcwf6mliBpi3VTQiqdOGo4nEoca8/+cKSLxzqQoJF7znkxarXhYdU
	nxvJV5Ak9vIW7COKnsEJOaaHfC+na3Y7JZ9jdihJj/1C9leCZt05Ddw40UClidp80Gwia+
	dCISs4/XBs+QFHa9PJyv/clo2ql4HsU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-58-x3XIrZ3rO-es-VzGvdLR0A-1; Wed, 23 Apr 2025 08:57:04 -0400
X-MC-Unique: x3XIrZ3rO-es-VzGvdLR0A-1
X-Mimecast-MFC-AGG-ID: x3XIrZ3rO-es-VzGvdLR0A_1745413023
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ac2db121f95so473416166b.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Apr 2025 05:57:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745413023; x=1746017823;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=12B1PA9yEjf0DLZx8TkvEXffVCSElLdrcmHq6YCB56o=;
        b=WiCT7wh8WIIT17Ml89Lm60Zf6geLAQKscOVuOdy9hdHfp+4BXNJ5Q2R55YBzZ6FyYt
         yHfa5yg+AmFtSSiekonMqlwPK+5KZ7AuILzJ+iwHCojvKPqqWkvRuny5liM+t9HUMA3W
         X8xg3XxlJ8MUJNIR42q9UE1Bc+ZfGGqbQoBmuRXZjh/70aHvwlumX83yVKBui+B8prTu
         ACX7amjiiIdx6y9lZpQyLBsim5PTKTF0ioxuYy0xM9aFKQIMjYrRs7fbw37NP0Q1KF/V
         UyFWa2Z2d4TpCiQudQI6d9Edg+85PhnBJi/XdDOCGR7L71OX9jKtEIV0DvU0ccu/ToVq
         4tZg==
X-Gm-Message-State: AOJu0YxnlNtTArTOfgLXii6No3TdY4voPgkAHpgQ5bkCleUbRelXK8hT
	vSWjTD0IXoPZ5wfxk+d2+7+DBwqjDcDYhMlyxkck5uZm6Z9POe6zIHuvS+Gnpgjk3lcQkU8BMUU
	DHbyUYjdKHihKk2DOcpjbTUJbF+kBqmK0chozIKmmP1gyKn/z1mWiIPevuEHtO3/qEJTbBHE=
X-Gm-Gg: ASbGnctHcDiOHXSjkP5yxCi2fkdPSfDs8b4Gqb21hmcPzMce8NX4+6X8FM4deGz7lvf
	+ai0tUiVqG8n5SAqaHJFkIc/0IdURNbL7w6qyWzMx5NPkixpZ7wPMMakG1V9x0FnaY66Uv2hkm9
	MZEMnPNuCVyeTn3UQCzmY82UNBenbR+KDtz1wWkSxyLFWyfsSh9FLS7UCZzXjkEn9zms7DQrZvw
	aAayDSkuKscNy0wWGEdo07zlngvFSZED1Rpd7vC8OD6TFcvIgmmtn6F40Xoag+2E8k+/E52Q1x+
	IKADdiDFOxzJKoztjRFGxIm/+iECRJRz85se0SsB/+adJoa6H5K5HgEsEBgI8pkxiGBEDIgdUtp
	/HuPO6aPhXUePJOsfvUHvLRRqXDLszajiqvvUQZHRKja6Tk+vfhCDgtwDlgDMmA==
X-Received: by 2002:a17:906:f58e:b0:ac7:ed56:8a34 with SMTP id a640c23a62f3a-acb74b38ba7mr1275529266b.21.1745413023438;
        Wed, 23 Apr 2025 05:57:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcgYy5tLoCSouhG5GrAwJ191lCJmSl2bY21h12SJe30vu8KQiBBanEpoiW5zb7psxiio+7eQ==
X-Received: by 2002:a17:906:f58e:b0:ac7:ed56:8a34 with SMTP id a640c23a62f3a-acb74b38ba7mr1275527666b.21.1745413023026;
        Wed, 23 Apr 2025 05:57:03 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb8cca2323sm644457766b.181.2025.04.23.05.57.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 05:57:02 -0700 (PDT)
Message-ID: <191aad89-689c-4d34-ac8c-274e13fd6936@redhat.com>
Date: Wed, 23 Apr 2025 14:57:01 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: thinkpad-acpi: Add support for new
 hotkey for camera shutter switch
To: Nitin Joshi <nitjoshi@gmail.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
 ibm-acpi-devel@lists.sourceforge.net, njoshi1@lenovo.com,
 Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20250423055130.9146-1-nitjoshi@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250423055130.9146-1-nitjoshi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Nitin,

On 23-Apr-25 7:51 AM, Nitin Joshi wrote:
> New Lenovo Thinkpad models, e.g. the 'X9-14 Gen 1' and 'X9-15 Gen 1'
> has new shortcut on F9 key i.e to switch camera shutter and it
> send a new 0x131b hkey event when F9 key is pressed.
> 
> This commit adds support for new hkey 0x131b.
> 
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Nitin Joshi <nitjoshi@gmail.com>
> ---
> Changes in v2:
> 
> * Added ASL method to get camera shutter status and send it to userspace.

Thank you for the new version, overall this looks good,
one small remark below.


> ---
>  drivers/platform/x86/thinkpad_acpi.c | 43 +++++++++++++++++++++++++++-
>  1 file changed, 42 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 5790095c175e..80b02e8538e8 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -182,6 +182,7 @@ enum tpacpi_hkey_event_t {
>  						   * directly in the sparse-keymap.
>  						   */
>  	TP_HKEY_EV_AMT_TOGGLE		= 0x131a, /* Toggle AMT on/off */
> +	TP_HKEY_EV_CAMERASHUTTER_TOGGLE = 0x131b, /* Toggle Camera Shutter */
>  	TP_HKEY_EV_DOUBLETAP_TOGGLE	= 0x131c, /* Toggle trackpoint doubletap on/off */
>  	TP_HKEY_EV_PROFILE_TOGGLE	= 0x131f, /* Toggle platform profile in 2024 systems */
>  	TP_HKEY_EV_PROFILE_TOGGLE2	= 0x1401, /* Toggle platform profile in 2025 + systems */
> @@ -2250,6 +2251,25 @@ static void tpacpi_input_send_tabletsw(void)
>  	}
>  }
>  
> +static int get_camera_shutter(void)
> +{
> +	acpi_handle gces_handle;
> +	int output;
> +
> +	if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "GCES", &gces_handle))) {
> +		/* Platform doesn't support GCES */
> +		return -ENODEV;
> +	}
> +
> +	if (!acpi_evalf(gces_handle, &output, NULL, "dd", 0))
> +		return -EIO;
> +
> +	if (output & BIT(31))
> +		return -ENODEV;
> +
> +	return output;
> +}
> +
>  static bool tpacpi_input_send_key(const u32 hkey, bool *send_acpi_ev)
>  {
>  	bool known_ev;
> @@ -3272,6 +3292,7 @@ static const struct key_entry keymap_lenovo[] __initconst = {
>  	 * after switching to sparse keymap support. The mappings above use translated
>  	 * scancodes to preserve uAPI compatibility, see tpacpi_input_send_key().
>  	 */
> +	{ KE_KEY, TP_HKEY_EV_CAMERASHUTTER_TOGGLE, { KEY_CAMERA_ACCESS_TOGGLE } },
>  	{ KE_KEY, 0x131d, { KEY_VENDOR } }, /* System debug info, similar to old ThinkPad key */
>  	{ KE_KEY, 0x1320, { KEY_LINK_PHONE } },
>  	{ KE_KEY, TP_HKEY_EV_TRACK_DOUBLETAP /* 0x8036 */, { KEY_PROG4 } },
> @@ -3303,7 +3324,7 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
>  	const struct key_entry *keymap;
>  	bool radiosw_state  = false;
>  	bool tabletsw_state = false;
> -	int hkeyv, res, status;
> +	int hkeyv, res, status, camera_shutter_state;
>  
>  	vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_HKEY,
>  			"initializing hotkey subdriver\n");
> @@ -3467,6 +3488,13 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
>  	if (res)
>  		return res;
>  
> +	camera_shutter_state = get_camera_shutter();
> +	if (camera_shutter_state >= 0) {
> +		input_set_capability(tpacpi_inputdev, EV_SW, SW_CAMERA_LENS_COVER);
> +		input_report_switch(tpacpi_inputdev,
> +				SW_CAMERA_LENS_COVER, camera_shutter_state);
> +	}
> +
>  	if (tp_features.hotkey_wlsw) {
>  		input_set_capability(tpacpi_inputdev, EV_SW, SW_RFKILL_ALL);
>  		input_report_switch(tpacpi_inputdev,
> @@ -3633,6 +3661,8 @@ static void adaptive_keyboard_s_quickview_row(void)
>  /* 0x1000-0x1FFF: key presses */
>  static bool hotkey_notify_hotkey(const u32 hkey, bool *send_acpi_ev)
>  {
> +	int camera_shutter_state;
> +
>  	/* Never send ACPI netlink events for original hotkeys (hkey: 0x1001 - 0x1020) */
>  	if (hkey >= TP_HKEY_EV_ORIG_KEY_START && hkey <= TP_HKEY_EV_ORIG_KEY_END) {
>  		*send_acpi_ev = false;
> @@ -3643,6 +3673,17 @@ static bool hotkey_notify_hotkey(const u32 hkey, bool *send_acpi_ev)
>  			return true;
>  	}
>  
> +	camera_shutter_state = get_camera_shutter();

Doing this on every hotkey_notify_hotkey() seems wasteful /
inefficient. I suggest to move this inside the if, like this:

	if (hkey == TP_HKEY_EV_CAMERASHUTTER_TOGGLE) {
		camera_shutter_state = get_camera_shutter();
		if (camera_shutter_state < 0) {
			pr_err("Error retrieving camera shutter state after shutter event\n");
			return true;
		}

		mutex_lock(&tpacpi_inputdev_send_mutex);

		input_report_switch(tpacpi_inputdev,
		...

> +	if (hkey == TP_HKEY_EV_CAMERASHUTTER_TOGGLE && (camera_shutter_state >= 0)) {
> +		mutex_lock(&tpacpi_inputdev_send_mutex);
> +
> +		input_report_switch(tpacpi_inputdev,
> +			SW_CAMERA_LENS_COVER, camera_shutter_state);
> +		input_sync(tpacpi_inputdev);
> +
> +		mutex_unlock(&tpacpi_inputdev_send_mutex);


I believe you should add a "return true" after the unlock to avoid this
code from triggering later:

                if (!known_ev) {
                        pr_notice("unhandled HKEY event 0x%04x\n", hkey);
                        pr_notice("please report the conditions when this event happened to %s
                                  TPACPI_MAIL);
		}

and also to avoid needlessly going through hotkey_notify_hotkey();

> +	}
> +
>  	return tpacpi_input_send_key(hkey, send_acpi_ev);
>  }

Regards,

Hans



