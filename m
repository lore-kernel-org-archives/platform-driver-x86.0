Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31CE14EC60
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Apr 2025 13:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745414509; cv=none; b=hcx3Fs95+MJcJbsUm3gSJ4ySObpL8gY/yuZw64VgpSLiI/mGUY9qwj7w9trghJKb7689Xx9os2udu7eQ4S3zaiuWYNLLlUsZkJka6Z/TtRdS/3xGTFy0FMsbSmvH8P1ky85eroD22DwAV4DiXrHIAv9xh0+j9Cc2Da27YJqPNKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745414509; c=relaxed/simple;
	bh=SR//9/l2qpPxvpnWxAU5jh0mbw+MoUF7oToIpdgCbbs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WYBqtqfo9eHZ1rX88WrMkfwtS7IoY+ez1NgpJerXnzpNXSw5SMTNi/eFjH7e3RbJyKHab6FbQ0MsHx+mi/+jcjJt5BB5Iy/4xW9dki6NXAPHA0RdzJDXRx7psm4yQM9+nWR7q/uGyVNdV3qEHXizfHi1XJzRd6WBlvMSFqGzuB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mx2xTTea; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mx2xTTea"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22d95f0dda4so35301745ad.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Apr 2025 06:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745414506; x=1746019306; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mW+rRTc0kapcy4GIf8Vzg3oX62su+ta5GqZpvNFjk4w=;
        b=mx2xTTeaLvPVDU0YmQTJICMjxuyATd0zWpj119zfi+1b2zz9sQhAh0i39LWAVFFAQG
         9sizVPTP95ZrFjs6bTtn2TRsIorrwpDxbJQoyz/o0p8C9d9h2449UsHEU0ZdFWvLWcwX
         kga4i2Q7W9MfwQYn3zs7tc23WXg0Wli4yNmQNO05aaTr/77pq3aW2K0VBZCAEUmmyfFm
         K9kHbBP5aYL5X7mMdSFc4+4Kos/lo836GE8sDPA2FxP/rYmN1bH1v3XzG3sKGB1T+LFG
         tfVOxCXtRdjVLMbj8j3qJvPTz3MBV4w/6tZUAphg1y76NagUfM/0OrYVLWJsy2jhnkf0
         UC1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745414506; x=1746019306;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mW+rRTc0kapcy4GIf8Vzg3oX62su+ta5GqZpvNFjk4w=;
        b=CnC27EoHSx/ev6BJQ4oQjzYk/qBxiDZS4SUglLZ6yEifLZywSyJZI45mqXiI4ufoa4
         Xi938NYhvvHPE1jvJhWAWijG/GNv37bwpyJYcEhenwzDYW8LWssw5UHw4kkV7whtu/Zn
         q+ejkY7BJhLbh3liaxsVcEh9RmabuioaSDl4jTrAHZpvd52OQAZwT8y30fk1GAPR5yVP
         aYWY+JSqTtEMVcY6TGGEsGkAP/DNNnaONllzTGa+9FnOVkuOE6WgNzF17DleHY8uctpW
         sd7nxeHqPA9bVXiN0FhJmSC2DHceOfXdejlTYr/oHh4OFl8rukaaaKoY2Hn6K/YUsibA
         5B7A==
X-Gm-Message-State: AOJu0YwI6Oezc3/AYAyT5CAt6t75kRCkW3zS18aUJnxNn0NV8jY5istg
	S+VZmrPcD5Mp4atoLF7xSCLBuXhKblQ1/RfRyT9uHOD8A4BlPLlJ
X-Gm-Gg: ASbGnctcHi+J+/Y71raOArfDxvDzcmDHcyrFK/XyC1rvG1TRS8vSF55IaI0IrJMBkVA
	wGlqIIm+koESCog/cBl16u2xK9aqK0LAsRcgxoOVXk7FE9TM9Hm9nRpEMVB/+z58/flHV8JTdnC
	Lz7c5qkMEv72vrKsnRCCxvu6177CYN4WJWMA1y53rZxTYbH02PxlRDarVlreWawcHR0So4WbTNh
	ZmQgr5lOh0gDqzQnJuaTO1BYjVAK6mAT/CxrrzA9Rf6LosV4oZBrUuikgjHDR+JBoexKUp+7LHP
	h+alyCWeL9V+XqaVgZchPCijgUJA8276x/WmQCb/M8nhhiwhACBeOvOg9UDg+uKxfQWnQ81RZKw
	EHX1gW5w=
X-Google-Smtp-Source: AGHT+IFnzk8+cUDeAHijHK+txsJvqKtcOqeTOihS9pLeavgSoXnJANlNvG6+WXagr/MCz1wrwJTZ+A==
X-Received: by 2002:a17:902:db01:b0:223:501c:7581 with SMTP id d9443c01a7336-22c535a4e39mr276640025ad.16.1745414505896;
        Wed, 23 Apr 2025 06:21:45 -0700 (PDT)
Received: from [192.168.0.5] (127.37.178.217.static.user.transix.jp. [217.178.37.127])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50fde883sm103071205ad.242.2025.04.23.06.21.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 06:21:45 -0700 (PDT)
Message-ID: <74aca503-0c9d-4720-b433-24549c845f9f@gmail.com>
Date: Wed, 23 Apr 2025 22:19:27 +0900
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: thinkpad-acpi: Add support for new
 hotkey for camera shutter switch
To: Hans de Goede <hdegoede@redhat.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
 ibm-acpi-devel@lists.sourceforge.net, njoshi1@lenovo.com,
 Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20250423055130.9146-1-nitjoshi@gmail.com>
 <191aad89-689c-4d34-ac8c-274e13fd6936@redhat.com>
Content-Language: en-US
From: Nitin Joshi <nitjoshi@gmail.com>
In-Reply-To: <191aad89-689c-4d34-ac8c-274e13fd6936@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Hans,

Thank you for review.

On 4/23/25 21:57, Hans de Goede wrote:
> Hi Nitin,
> 
> On 23-Apr-25 7:51 AM, Nitin Joshi wrote:
>> New Lenovo Thinkpad models, e.g. the 'X9-14 Gen 1' and 'X9-15 Gen 1'
>> has new shortcut on F9 key i.e to switch camera shutter and it
>> send a new 0x131b hkey event when F9 key is pressed.
>>
>> This commit adds support for new hkey 0x131b.
>>
>> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>> Signed-off-by: Nitin Joshi <nitjoshi@gmail.com>
>> ---
>> Changes in v2:
>>
>> * Added ASL method to get camera shutter status and send it to userspace.
> 
> Thank you for the new version, overall this looks good,
> one small remark below.
> 
> 
>> ---
>>   drivers/platform/x86/thinkpad_acpi.c | 43 +++++++++++++++++++++++++++-
>>   1 file changed, 42 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
>> index 5790095c175e..80b02e8538e8 100644
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
>> +static int get_camera_shutter(void)
>> +{
>> +	acpi_handle gces_handle;
>> +	int output;
>> +
>> +	if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "GCES", &gces_handle))) {
>> +		/* Platform doesn't support GCES */
>> +		return -ENODEV;
>> +	}
>> +
>> +	if (!acpi_evalf(gces_handle, &output, NULL, "dd", 0))
>> +		return -EIO;
>> +
>> +	if (output & BIT(31))
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
>> @@ -3467,6 +3488,13 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
>>   	if (res)
>>   		return res;
>>   
>> +	camera_shutter_state = get_camera_shutter();
>> +	if (camera_shutter_state >= 0) {
>> +		input_set_capability(tpacpi_inputdev, EV_SW, SW_CAMERA_LENS_COVER);
>> +		input_report_switch(tpacpi_inputdev,
>> +				SW_CAMERA_LENS_COVER, camera_shutter_state);
>> +	}
>> +
>>   	if (tp_features.hotkey_wlsw) {
>>   		input_set_capability(tpacpi_inputdev, EV_SW, SW_RFKILL_ALL);
>>   		input_report_switch(tpacpi_inputdev,
>> @@ -3633,6 +3661,8 @@ static void adaptive_keyboard_s_quickview_row(void)
>>   /* 0x1000-0x1FFF: key presses */
>>   static bool hotkey_notify_hotkey(const u32 hkey, bool *send_acpi_ev)
>>   {
>> +	int camera_shutter_state;
>> +
>>   	/* Never send ACPI netlink events for original hotkeys (hkey: 0x1001 - 0x1020) */
>>   	if (hkey >= TP_HKEY_EV_ORIG_KEY_START && hkey <= TP_HKEY_EV_ORIG_KEY_END) {
>>   		*send_acpi_ev = false;
>> @@ -3643,6 +3673,17 @@ static bool hotkey_notify_hotkey(const u32 hkey, bool *send_acpi_ev)
>>   			return true;
>>   	}
>>   
>> +	camera_shutter_state = get_camera_shutter();
> 
> Doing this on every hotkey_notify_hotkey() seems wasteful /
> inefficient. I suggest to move this inside the if, like this:
Ack , Thanks for pointing this out. I will modify it.
> 
> 	if (hkey == TP_HKEY_EV_CAMERASHUTTER_TOGGLE) {
> 		camera_shutter_state = get_camera_shutter();
> 		if (camera_shutter_state < 0) {
> 			pr_err("Error retrieving camera shutter state after shutter event\n");
> 			return true;
> 		}
> 
> 		mutex_lock(&tpacpi_inputdev_send_mutex);
> 
> 		input_report_switch(tpacpi_inputdev,
> 		...
> 
>> +	if (hkey == TP_HKEY_EV_CAMERASHUTTER_TOGGLE && (camera_shutter_state >= 0)) {
>> +		mutex_lock(&tpacpi_inputdev_send_mutex);
>> +
>> +		input_report_switch(tpacpi_inputdev,
>> +			SW_CAMERA_LENS_COVER, camera_shutter_state);
>> +		input_sync(tpacpi_inputdev);
>> +
>> +		mutex_unlock(&tpacpi_inputdev_send_mutex);
> 
> 
> I believe you should add a "return true" after the unlock to avoid this
> code from triggering later:
> 
>                  if (!known_ev) {
>                          pr_notice("unhandled HKEY event 0x%04x\n", hkey);
>                          pr_notice("please report the conditions when this event happened to %s
>                                    TPACPI_MAIL);
> 		}
> 
> and also to avoid needlessly going through hotkey_notify_hotkey();
> 
Thanks for pointing this out. I have already modified it and will send 
updated patch soon.
>> +	}
>> +
>>   	return tpacpi_input_send_key(hkey, send_acpi_ev);
>>   }
> 
> Regards,
> 
> Hans
Thanks & Regards,
Nitin Joshi
> 
> 
> 

