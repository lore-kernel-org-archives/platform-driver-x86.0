Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD561E4A4
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Apr 2025 13:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745416070; cv=none; b=fqB3C898eZI22f5jSZF0s29RQM1Mu+8WzxLFNbmgS6tB8KAesC9UNJOfOgw2oyxtH5SnOLHAHOnDJNIfaL9J7zel6qtLdUAiFhkB75+MOVSlV+2JG4CrhJUq9fVCBNay6lO5blS6Ehsdt9ri1gO/cTvFFKJpIx+WaQ41GaSmCDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745416070; c=relaxed/simple;
	bh=KuM9rFs1nNkW4drhgcMmSMdEmpcsC4/79MOXKs5mgYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e7WHIyVBJE9nTaeDq7/PLXwLpN+KvMV+bnuvMPJtJkrDWNZC4Rq9ixk6AoU80vykyiiOvA04w+rTaU9aZ19EwX1XRDRORJbI7rSxk4QQyFNjYBLYGTXFxYLVb1JdwtL8fcJh+/diIMOi1RswddVSXJ18QIQ4jraVivhXgD4eDnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VMZkSpOy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VMZkSpOy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745416067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pEh8oqHI4NLy6ofA3ZhONsfHcZpJeelP6XBNrh5dM0o=;
	b=VMZkSpOye+43QrCSreYvUDekgBMmPZpKG+jDEoJLO+LFmaKfoKw6spNvyY1aXo/UAxWjiJ
	abViyp/yEg+5+LgEzUgKcSBgidncSTvF3pSyHbYNLHy7PuQ/d95FtoCxtebFmMDSrSFRan
	QDvHyrgE+JBHXKMtZYJouFQ+m3e+enA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-211-ZtUR4646MaeDnvvouteWcA-1; Wed, 23 Apr 2025 09:47:46 -0400
X-MC-Unique: ZtUR4646MaeDnvvouteWcA-1
X-Mimecast-MFC-AGG-ID: ZtUR4646MaeDnvvouteWcA_1745416064
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ac3db5469fbso462864566b.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Apr 2025 06:47:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745416064; x=1746020864;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pEh8oqHI4NLy6ofA3ZhONsfHcZpJeelP6XBNrh5dM0o=;
        b=DHVOO8t9uQGfzWPC1kgisFIYSH/GUDrNN+uE5ZcKd6yIxAHJtkLIt6ipMG0QVMn48y
         mv18TpmNA/uyn9G6eLH2GZcD6NSvZtErejWWwhze//ld8jFgj0nA3Kntdk/UY5AylROy
         mVoGzOOd1zW9GB+9QfmeBvmcOUHjRbEQi4rDAIoSClAV4qkVh8ZkaRMYSITTj6QeyVo4
         Z0u64AnEjY6FrkTJkAheTgBU+3Fw4VEZghCQxa/pWPvIutLdLjn8vANH1uec5M1fqnq4
         ByMgznDAbNHQpWKsQXdFp8xm6rKaqaWiirLwH5dzRPTk7Ya/WXg0ah4ZWprGpfMnc5kJ
         u6ng==
X-Gm-Message-State: AOJu0Yy19TsncnBTwluum89hyzODm9kV24fRWPnaPl/VQ5Y1t0tXf8lh
	SwBtmOlPzXldTLcWSCUf1wKdM2evPOPwsRTcvrCwXHN5Ur58Dmj8Uv4K9K1qn5x6YC8scCfSfOh
	pkNw7OzOMxYofR6AKzBt9q7Y2OSQwoZMP97hSmUw97RC/t3KlbBlHH6fwnUAAhSlPM2HOMgQ=
X-Gm-Gg: ASbGncvNd0X7gUgByE4Lh4/FB9PeotXMwonmfVbBeEDvg0bHUIU1DAS25pAe8+T1Odc
	Q5GSMEbSU5cl8a8+TJjpIP0TCcor55VPlD/68+EX6cWbE1THZEORUCdQ9fIRgjDsdmxf8y34+/R
	74O1DVdSLvIXmC8SLN8WImAHVNFSCT5HoVuhqMfGK6vVUDvQwoq0yzdrPaVuheyBUKyg+ipvzhd
	YrnxyShKTJdY/nRZ4em/Otk2b3d/W0FQfe2tWlzBCdqJ3dGvZilMeK2nKH0vbs/bGRnbWkvzCjV
	M6P6znyNdipdaNQyGlW8PZ4AmbQHkf7Dhl3QeU/SYEceGQGSkRWBfu6/J5NL8KtedkM/nRqRTxU
	NMO+Gf8KVX4yWWFToufw7+hyUt+e+9tBvjxCBEKvV6Tnf3MYuxt5Ajl/qm3X2MQ==
X-Received: by 2002:a17:907:868a:b0:ace:3ede:9d23 with SMTP id a640c23a62f3a-ace3ede9ef6mr294555266b.34.1745416064113;
        Wed, 23 Apr 2025 06:47:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZwCd4q8Iokzw2yZU81DNOMfOSrFMtikCSA7cLDSXiPQczujmjm2QDHuxC93G+YzH5mjtTGg==
X-Received: by 2002:a17:907:868a:b0:ace:3ede:9d23 with SMTP id a640c23a62f3a-ace3ede9ef6mr294552766b.34.1745416063693;
        Wed, 23 Apr 2025 06:47:43 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6efaa976sm803547466b.180.2025.04.23.06.47.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 06:47:43 -0700 (PDT)
Message-ID: <045d37f5-259c-4553-8257-51ab6fc43534@redhat.com>
Date: Wed, 23 Apr 2025 15:47:42 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] platform/x86: thinkpad-acpi: Add support for new
 hotkey for camera shutter switch
To: Nitin Joshi <nitjoshi@gmail.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
 ibm-acpi-devel@lists.sourceforge.net, njoshi1@lenovo.com,
 Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20250423133912.16334-1-nitjoshi@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250423133912.16334-1-nitjoshi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 23-Apr-25 3:39 PM, Nitin Joshi wrote:
> New Lenovo Thinkpad models, e.g. the 'X9-14 Gen 1' and 'X9-15 Gen 1'
> has new shortcut on F9 key i.e to switch camera shutter and it
> send a new 0x131b hkey event when F9 key is pressed.
> 
> This commit adds support for new hkey 0x131b.
> 
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Nitin Joshi <nitjoshi@gmail.com>
> ---
> Changes in v3:
> * Avoid wasteful get_camera_shutter() calls and Minor changes based on review comments to make
>   code more readable.
> Changes in v2:
> * Added ASL method to get camera shutter status and send it to userspace.
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 46 +++++++++++++++++++++++++++-
>  1 file changed, 45 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 5790095c175e..0b011dcfc626 100644
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
> +#define GCES_METHOD_ERR BIT(31)

Does this bit really indicate an error ? From other vendors
this often is a device-not-present bit and the bit being set
would mean in this case that there is no camera-shutter on
the laptop we're running on.

This also matches with the -ENODEV return.

If this indeed is a device-not-present bit then this define
should be renamed to match that.


> +static int get_camera_shutter(void)
> +{
> +	acpi_handle gces_handle;
> +	int output;
> +
> +	if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "GCES", &gces_handle)))
> +		return -ENODEV;
> +
> +	if (!acpi_evalf(gces_handle, &output, NULL, "dd", 0))
> +		return -EIO;
> +
> +	if (output & GCES_METHOD_ERR)
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
> @@ -3467,6 +3488,12 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
>  	if (res)
>  		return res;
>  
> +	camera_shutter_state = get_camera_shutter();
> +	if (camera_shutter_state >= 0) {
> +		input_set_capability(tpacpi_inputdev, EV_SW, SW_CAMERA_LENS_COVER);
> +		input_report_switch(tpacpi_inputdev, SW_CAMERA_LENS_COVER, camera_shutter_state);
> +	}
> +
>  	if (tp_features.hotkey_wlsw) {
>  		input_set_capability(tpacpi_inputdev, EV_SW, SW_RFKILL_ALL);
>  		input_report_switch(tpacpi_inputdev,
> @@ -3633,6 +3660,8 @@ static void adaptive_keyboard_s_quickview_row(void)
>  /* 0x1000-0x1FFF: key presses */
>  static bool hotkey_notify_hotkey(const u32 hkey, bool *send_acpi_ev)
>  {
> +	int camera_shutter_state;
> +
>  	/* Never send ACPI netlink events for original hotkeys (hkey: 0x1001 - 0x1020) */
>  	if (hkey >= TP_HKEY_EV_ORIG_KEY_START && hkey <= TP_HKEY_EV_ORIG_KEY_END) {
>  		*send_acpi_ev = false;
> @@ -3643,6 +3672,21 @@ static bool hotkey_notify_hotkey(const u32 hkey, bool *send_acpi_ev)
>  			return true;
>  	}
>  
> +	if (hkey == TP_HKEY_EV_CAMERASHUTTER_TOGGLE) {
> +		camera_shutter_state = get_camera_shutter();
> +		if (camera_shutter_state < 0) {
> +			pr_err("Error retrieving camera shutter state after shutter event\n");
> +			return true;
> +		}
> +		mutex_lock(&tpacpi_inputdev_send_mutex);
> +
> +		input_report_switch(tpacpi_inputdev, SW_CAMERA_LENS_COVER, camera_shutter_state);
> +		input_sync(tpacpi_inputdev);
> +
> +		mutex_unlock(&tpacpi_inputdev_send_mutex);
> +		return true;
> +	}
> +
>  	return tpacpi_input_send_key(hkey, send_acpi_ev);
>  }
>  

Otherwise this looks good to me now.

Regards,

Hans


