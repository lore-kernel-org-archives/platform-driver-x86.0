Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B010B22371F
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 May 2025 11:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746100204; cv=none; b=j1w2S3erXkKDgietT9ZZjxECp2S14IF6IpzIO9Iza5ucYDmCFMSz9OsbWgh5Kof9Hrc1uV8vjA+Y1UwDzS15QQuU3iMCtv42Ri2IfPxIK9t02GYFUdrnG0C/Ge6KtVYqyQNN1rtptVJbxyM/RM7I2sPdauNQ/JVUfiC1aBcgOV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746100204; c=relaxed/simple;
	bh=f9/4tC55wNC6LwnpmRtYL6XioZ/1A6PMJCMHGNzLiTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T6co7rSnqZWZ3xiNL2x52W9FPn2LMeIC76GpIrRCZ8m6va+m4lWkq9DXEWrvZvcuzIze/0LmVtdXOMW4vUd3nhJsqq5sQiSmzuEhoY/+bWSjhLG6gWSnmtyCAc4LiZR+6/zxHVY+UOsTou2SpHKlW+cxsGfhHf1CHevg2O9ZqxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AemyX+fd; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AemyX+fd"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-225477548e1so8376555ad.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 01 May 2025 04:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746100202; x=1746705002; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TJ/hc7rnB/WDM3PqsvtdE3JM2yn0Mpa3nA4YINPYJyU=;
        b=AemyX+fdrAgR2ByVd/oP0JLI7mFb3vbh95fMnM6u32fW/RxEHkxOdvzcpmu+mA/4lD
         6j4tlQ5XV5+8RN+MIKkvGynF8+QP+pnrNnmlW7NuKbMdRTY0nXGKSRbuzkMKJxGkU5zt
         rCPtW7YXx6/tKvFNLKey3TcGLLVw3REmAyHLEAPqtEVe5cdDHw5pUDGZmDHKE498CRkh
         nclMzSSbEbq21h1zSybqeFr+SZ3fv3HIHhD+Qc50NrdtkZZNLNNU37CNdCFKgLopi463
         AJkqTkFEds364g7VQiRBKdsKM+h6xxUtE8GHnSparrWy6XfwfwMsadcgQtHMsrBOeDL+
         M3OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746100202; x=1746705002;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TJ/hc7rnB/WDM3PqsvtdE3JM2yn0Mpa3nA4YINPYJyU=;
        b=DEI0Fc+sGym/+FuTuxn1THWqSVlYhzWMyxv2GJPNbV8zzJ07bsrab/wOchIUPBgIUB
         KJuxoY8vk7pntCfVG8LhH2Ey8ml86PP6zWhxeFDqp1F0ynR4sVMLqU2eeH6dVfLH65c/
         3WMH/eE3/zkKB6DlZjRqSdAz61yueY0jNuD9sDkYsD0FWSW+M5hO7gSyO+iQx+rglXAy
         V6FzIw2DOpGi7dkW/gjwT5tdmCiTtHdYyLwoliQfd80AKQmDlWr3u5m72xvzhpZINNn8
         qrBibbBrS3IeGN5L02B1YL82blb8WvGfJMDoCubPCBVSXx96TgcIzOOhPPiLpm8K+AB5
         2EFw==
X-Gm-Message-State: AOJu0YzvQk6wFV19R60P817SIl1nqmdfT6JrgK9BgnC3rfnqifBjpO8u
	HtUa1vZqVanW/ouFRVyBx0qwEXzNbOZH8FB4hgGQgkg5usbJ+AIh
X-Gm-Gg: ASbGncv6JJXewLjVgd4PJ2uV54VfYLqHgjhbS4ghZ1e4PtKp7/H8VE6Ji9KVrJ4eBPG
	OdYTS8DpqN9z5Suqgmc4AhSSFgaXgwIKIQk/98p/fG5xmQu/IBGrXM3vDipcNcC5sA+iRFOYvZX
	LeGKElL3mkihYuFqspxCCUJsT7OTryG1Pn5VDPi0OwX73KJyb4LoQFQP8xbKzF9of5wSs/cDgwd
	N2jL86ry0nez7GJqAI3qNB7SPOg+xUkKXbwSfkILJQCa9bKC2IQliikrx88MKia3Scg0co9rmsD
	Lfg4S6iGzvTpIDfdvu2L2fJf3Wlsq4HQVEKHJkBaetJBTOo96hD12RydUfI52aAcC6/fKngctIo
	zPYtn78vmSAGc1Oy+dw==
X-Google-Smtp-Source: AGHT+IFr3U0b3AZ8uZeqEa23wJbe0WS2avXnkRnttvh4O/+GQcaYX1uOFzLh4Nzr49AcjEPZ4qN93A==
X-Received: by 2002:a17:902:e74b:b0:224:160d:3f54 with SMTP id d9443c01a7336-22e0842c63fmr34220845ad.31.1746100201718;
        Thu, 01 May 2025 04:50:01 -0700 (PDT)
Received: from [192.168.0.5] (127.37.178.217.static.user.transix.jp. [217.178.37.127])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e0bb0f3b5sm4867125ad.83.2025.05.01.04.49.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 04:50:01 -0700 (PDT)
Message-ID: <f4c338a0-d0d1-4677-bd00-da87441d444a@gmail.com>
Date: Thu, 1 May 2025 20:47:41 +0900
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] platform/x86: thinkpad-acpi: Add support for new
 hotkey for camera shutter switch
To: Hans de Goede <hdegoede@redhat.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
 ibm-acpi-devel@lists.sourceforge.net, njoshi1@lenovo.com,
 Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20250501054951.8442-1-nitjoshi@gmail.com>
 <c8883178-3ccb-435d-a7c3-a0cbdbb53181@redhat.com>
Content-Language: en-US
From: Nitin Joshi <nitjoshi@gmail.com>
In-Reply-To: <c8883178-3ccb-435d-a7c3-a0cbdbb53181@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Hans,

On 5/1/25 20:04, Hans de Goede wrote:
> Hi Nitin,
> 
> On 1-May-25 7:49 AM, Nitin Joshi wrote:
>> New Lenovo Thinkpad models, e.g. the 'X9-14 Gen 1' and 'X9-15 Gen 1'
>> has new shortcut on F9 key i.e to switch camera shutter and it
>> send a new 0x131b hkey event when F9 key is pressed.
>>
>> This commit adds support for new hkey 0x131b.
>>
>> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>> Signed-off-by: Nitin Joshi <nitjoshi@gmail.com>
>> ---
>> Changes in v4:
>> * Renamed macro from METHOD_ERR to GCES_NO_SHUTTER_DEVICE.
> 
> Thank you for the new version, unfortunately I've spotted
> a few issues which I missed before, sorry about that.
No Problem , Thank you for your review.
> 
> See my remarks inline.
> 
>> Changes in v3:
>> * Avoid wasteful get_camera_shutter() calls and Minor changes based on review comments to make
>>    code more readable.
>> Changes in v2:
>> * Added ASL method to get camera shutter status and send it to userspace.
>> ---
>>   drivers/platform/x86/thinkpad_acpi.c | 46 +++++++++++++++++++++++++++-
>>   1 file changed, 45 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
>> index 5790095c175e..6c6b9d4e613e 100644
>> --- a/drivers/platform/x86/thinkpad_acpi.c
>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>> @@ -182,6 +182,7 @@ enum tpacpi_hkey_event_t {
>>   						   * directly in the sparse-keymap.
>>   						   */
>>   	TP_HKEY_EV_AMT_TOGGLE		= 0x131a, /* Toggle AMT on/off */
>> +	TP_HKEY_EV_CAMERASHUTTER_TOGGLE = 0x131b, /* Toggle Camera Shutter */
>>   	TP_HKEY_EV_DOUBLETAP_TOGGLE	= 0x131c, /* Toggle trackpoint doubletap on/off */
>>   	TP_HKEY_EV_PROFILE_TOGGLE	= 0x131f, /* Toggle platform profile in 2024 systems */
>>   	TP_HKEY_EV_PROFILE_TOGGLE2	= 0x1401, /* Toggle platform profile in 2025 + systems */
>> @@ -2250,6 +2251,25 @@ static void tpacpi_input_send_tabletsw(void)
>>   	}
>>   }
>>   
>> +#define GCES_NO_SHUTTER_DEVICE BIT(31)
>> +
>> +static int get_camera_shutter(void)
>> +{
>> +	acpi_handle gces_handle;
>> +	int output;
>> +
>> +	if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "GCES", &gces_handle)))
>> +		return -ENODEV;
>> +
>> +	if (!acpi_evalf(gces_handle, &output, NULL, "dd", 0))
>> +		return -EIO;
>> +
>> +	if (output & GCES_NO_SHUTTER_DEVICE)
>> +		return -ENODEV;
>> +
>> +	return output;
>> +}
>> +
>>   static bool tpacpi_input_send_key(const u32 hkey, bool *send_acpi_ev)
>>   {
>>   	bool known_ev;
>> @@ -3272,6 +3292,7 @@ static const struct key_entry keymap_lenovo[] __initconst = {
>>   	 * after switching to sparse keymap support. The mappings above use translated
>>   	 * scancodes to preserve uAPI compatibility, see tpacpi_input_send_key().
>>   	 */
>> +	{ KE_KEY, TP_HKEY_EV_CAMERASHUTTER_TOGGLE, { KEY_CAMERA_ACCESS_TOGGLE } },
> 
> other keys where are handled fully in the driver, like
> TP_HKEY_EV_PRIVACYGUARD_TOGGLE / TP_HKEY_EV_AMT_TOGGLE / TP_HKEY_EV_PROFILE_TOGGLE*
> don't have an entry in the keymap. For consistency please drop the unnecessary
> (will never be used) adding of this entry.
Ack, I will drop it.

> 
>>   	{ KE_KEY, 0x131d, { KEY_VENDOR } }, /* System debug info, similar to old ThinkPad key */
>>   	{ KE_KEY, 0x1320, { KEY_LINK_PHONE } },
>>   	{ KE_KEY, TP_HKEY_EV_TRACK_DOUBLETAP /* 0x8036 */, { KEY_PROG4 } },
>> @@ -3303,7 +3324,7 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
>>   	const struct key_entry *keymap;
>>   	bool radiosw_state  = false;
>>   	bool tabletsw_state = false;
>> -	int hkeyv, res, status;
>> +	int hkeyv, res, status, camera_shutter_state;
>>   
>>   	vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_HKEY,
>>   			"initializing hotkey subdriver\n");
>> @@ -3467,6 +3488,12 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
>>   	if (res)
>>   		return res;
>>   
>> +	camera_shutter_state = get_camera_shutter();
>> +	if (camera_shutter_state >= 0) {
>> +		input_set_capability(tpacpi_inputdev, EV_SW, SW_CAMERA_LENS_COVER);
>> +		input_report_switch(tpacpi_inputdev, SW_CAMERA_LENS_COVER, camera_shutter_state);
>> +	}
>> +
>>   	if (tp_features.hotkey_wlsw) {
>>   		input_set_capability(tpacpi_inputdev, EV_SW, SW_RFKILL_ALL);
>>   		input_report_switch(tpacpi_inputdev,
>> @@ -3633,6 +3660,8 @@ static void adaptive_keyboard_s_quickview_row(void)
>>   /* 0x1000-0x1FFF: key presses */
>>   static bool hotkey_notify_hotkey(const u32 hkey, bool *send_acpi_ev)
>>   {
>> +	int camera_shutter_state;
>> +
>>   	/* Never send ACPI netlink events for original hotkeys (hkey: 0x1001 - 0x1020) */
>>   	if (hkey >= TP_HKEY_EV_ORIG_KEY_START && hkey <= TP_HKEY_EV_ORIG_KEY_END) {
>>   		*send_acpi_ev = false;
>> @@ -3643,6 +3672,21 @@ static bool hotkey_notify_hotkey(const u32 hkey, bool *send_acpi_ev)
>>   			return true;
>>   	}
>>   
>> +	if (hkey == TP_HKEY_EV_CAMERASHUTTER_TOGGLE) {
>> +		camera_shutter_state = get_camera_shutter();
>> +		if (camera_shutter_state < 0) {
>> +			pr_err("Error retrieving camera shutter state after shutter event\n");
>> +			return true;
>> +		}
>> +		mutex_lock(&tpacpi_inputdev_send_mutex);
>> +
>> +		input_report_switch(tpacpi_inputdev, SW_CAMERA_LENS_COVER, camera_shutter_state);
>> +		input_sync(tpacpi_inputdev);
>> +
>> +		mutex_unlock(&tpacpi_inputdev_send_mutex);
>> +		return true;
>> +	}
>> +
> 
> I think it would be better to have this code inside tpacpi_driver_event(),
> where all the other special keypresses are handled.
Ack , I will modify it and resend patch soon .
> 
> Regards,
> 
> Hans

Thanks & Regards,
Nitin Joshi
> 
> 
> 
> 
>>   	return tpacpi_input_send_key(hkey, send_acpi_ev);
>>   }
>>   
> 

