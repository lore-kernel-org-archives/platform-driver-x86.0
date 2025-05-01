Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7660E1DE3D6
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 May 2025 11:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746097450; cv=none; b=YHGPnfnnaUHzpekeIS7xOAprOH2xSarz9N2poWxKBvpK4cOzo2F3Eq4JP6mUu+EaYATtu4BIcTvKi5F7ZAyvBaCAfnyv5lJd2MjRiYq/LT6DUZWEt8eWBw69qUTkjuGEc1l4YUFPkrtkj6zJ/SByUT/gNKQpy/v0hBBOp+79kog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746097450; c=relaxed/simple;
	bh=GVRfhrXmPK/4E2oZrY8mkaUxo05Mli4mkzkE9sHdGtU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t7y6w8wwkPd50/u5b7FCXnsH9PQiNQ6FzEAjhWq2Gka3KmVcNosrgmF+2pjR0Ox9383dUpAVjoxy8gMnBshGocmRBMhx+kkTSHiwJ6gj2CPt+/stE/Qj97rKf2OZ46+uvEdKp62CXmTpB/yJVQTxuis7UYmssA/YcvwHsZ1cLTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i5kc4+xP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i5kc4+xP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746097447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mz0vmjJwisUmluXzsGrk3z7j5pBRTnIIjtSZr4C3XOE=;
	b=i5kc4+xPf4QsMwXkxE5+zGcJt2b3rS/YfNciKApx62I+zsM6etc+GIp3cUFWElTjCCANKY
	ZB5Wd0neb/rAwbePlOv9I2Ivgcx1+BHoVwzpewBfqOwqKSLppIjQHHDgSFu45Mstw0sfp1
	QMZXmbfSDkhAQnUtbQUjQ7xdePHAsMQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-99-YtuqJgnKNryTVwf-JRuRZg-1; Thu, 01 May 2025 07:04:06 -0400
X-MC-Unique: YtuqJgnKNryTVwf-JRuRZg-1
X-Mimecast-MFC-AGG-ID: YtuqJgnKNryTVwf-JRuRZg_1746097445
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5e5d9682f53so728212a12.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 01 May 2025 04:04:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746097445; x=1746702245;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mz0vmjJwisUmluXzsGrk3z7j5pBRTnIIjtSZr4C3XOE=;
        b=XTrgKZGwUvBi9KzMJ0gOpPSvn0OE8ZBB8hPI8Zgw/R8FSsYJkBiDw6EKcYlOZnSWvM
         CHVad980plX2hfy6jgplPtEGI5GcQkTRcdM9pWqBwxxEJh3VBiD2vCps8XHDy/vcMGwz
         w6JwKytL1ESaG7C5t+QxVMcn0c4Mwf03Q7XAQl1j0JbQRvpO0Rkwp5b+cPkWS+MLOpDU
         wopPSqgi/ZKQYlqUSCtgwkbQdNn81Sw8pWyoCG//HyvQcO4wFHD19UfohhM9M0Tov24l
         YyBm9l86X1cXa+viLqmipYVZQQ8cB0Am3M31qbvNOG6Ynf0R+yCqOilI+UqgwFcxUqdv
         4SKQ==
X-Gm-Message-State: AOJu0Yz1cl/E7vxqHy4zyUS8YvNymbeoq0mX4O0JOJDijePGwFHbaCV3
	vb7T8DxRfJfRyHALRZn3gBHucO8rpxSuAjwFTSVc2q8pT1OscaAkpU6LInXF5DgTfy+d2K5c7c6
	4+vrzr8HVTYhaV5IPzQy33ZC2QXWV420vIWCdzRWogv3hiZ8VZr9/WTmwtIwCP2ddnhx4fqM=
X-Gm-Gg: ASbGncuhq+NCSAuEkMMVn6BbWOzqJkwHqoaSOs1V5JVVX+waORaFHGiaFRkdcq2rVsO
	WtHlfaWYusLnO4lZl7DklE08sPDSeb+EKJxHYeDvmD07sZZd5BHII6Cc9Yke0rtd3jqSxY5306B
	0OVmaiVOzWihcPJ+45sMRmEY0YxxGT5nmPb28lalsq9DaIZtyVbY2pOPOf1ih0RQcAYiSbbjLLR
	Htz1rU9nEAMgSlpYVBpUmn/zg/9LFMFnDdleraqJ3s55mvywVWNSI0HqXk1BbF9S5WddnxXsfBY
	DH5/RknMcpWmvngY+J8htKKOl0rJhYoT6GNJ9bJP3L9eu5JL0PwQV3UCUeqv2m5PZ2DBoKQl0UB
	ial4OKLMrn0ganXiukAARV+hFn9uJXKW0KZXPOkE4VbPeSSN9TMt2OhrDBLkkQA==
X-Received: by 2002:a17:907:9408:b0:ace:6f8e:e857 with SMTP id a640c23a62f3a-acef38eb40cmr234280466b.0.1746097444740;
        Thu, 01 May 2025 04:04:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQgmqRgjG5XFVL27u4BEJ0c9uqGJhvZNUWRf5tL2nXObw1fLArolAaIpPxwX6S5m4G4tLOoQ==
X-Received: by 2002:a17:907:9408:b0:ace:6f8e:e857 with SMTP id a640c23a62f3a-acef38eb40cmr234278366b.0.1746097444353;
        Thu, 01 May 2025 04:04:04 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0c71214b8sm24896166b.81.2025.05.01.04.04.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 04:04:03 -0700 (PDT)
Message-ID: <c8883178-3ccb-435d-a7c3-a0cbdbb53181@redhat.com>
Date: Thu, 1 May 2025 13:04:03 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] platform/x86: thinkpad-acpi: Add support for new
 hotkey for camera shutter switch
To: Nitin Joshi <nitjoshi@gmail.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
 ibm-acpi-devel@lists.sourceforge.net, njoshi1@lenovo.com,
 Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20250501054951.8442-1-nitjoshi@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250501054951.8442-1-nitjoshi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Nitin,

On 1-May-25 7:49 AM, Nitin Joshi wrote:
> New Lenovo Thinkpad models, e.g. the 'X9-14 Gen 1' and 'X9-15 Gen 1'
> has new shortcut on F9 key i.e to switch camera shutter and it
> send a new 0x131b hkey event when F9 key is pressed.
> 
> This commit adds support for new hkey 0x131b.
> 
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Nitin Joshi <nitjoshi@gmail.com>
> ---
> Changes in v4:
> * Renamed macro from METHOD_ERR to GCES_NO_SHUTTER_DEVICE.

Thank you for the new version, unfortunately I've spotted
a few issues which I missed before, sorry about that.

See my remarks inline.

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
> index 5790095c175e..6c6b9d4e613e 100644
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
> +#define GCES_NO_SHUTTER_DEVICE BIT(31)
> +
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
> +	if (output & GCES_NO_SHUTTER_DEVICE)
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

other keys where are handled fully in the driver, like
TP_HKEY_EV_PRIVACYGUARD_TOGGLE / TP_HKEY_EV_AMT_TOGGLE / TP_HKEY_EV_PROFILE_TOGGLE*
don't have an entry in the keymap. For consistency please drop the unnecessary
(will never be used) adding of this entry.

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

I think it would be better to have this code inside tpacpi_driver_event(),
where all the other special keypresses are handled.

Regards,

Hans




>  	return tpacpi_input_send_key(hkey, send_acpi_ev);
>  }
>  

