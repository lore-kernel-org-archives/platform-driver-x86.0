Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9AC1FA261
	for <platform-driver-x86@vger.kernel.org>; Thu, 24 Apr 2025 08:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745482500; cv=none; b=O5yMsN/V/8ZLCUkGNWTtXOz0JTMELVH89nuP7LuoyFNClqnkJ3yWv+XMgAbRiMUncLoddP+esNra0fUdc/IrhO497J4xj/LR0ELvD/6z70eiqbPfbiCRCyFBaNMrMNDik/HSKIvPrQiy7tp6s0DnAQGfnKUxbwWGBKrDU29dHHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745482500; c=relaxed/simple;
	bh=KJRMi4yzcR0iKa6PSevbJ2oAgKHnd96ORClJH4szsfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FkvRpOgDGLthIJtDjUcrsCUYNNZBRNTdON15cuCzQlikf1+x9QCLFAM9CG77CZObZfmckZlWbM+jLu1zn+3iMBfd4zPLFq/MtM9SdldlGy3oDi4dpFxiGMOXobcYRVi36pRz3FZvOdFg3vSvOdaPOblzERcFg1oi4GhQ7Dd3Ll0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=irqxnjhL; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="irqxnjhL"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-227cf12df27so6861055ad.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Apr 2025 01:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745482498; x=1746087298; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GY8Yn852fAdpDCmPtEtmJUkwdtU/HFDJFtbr8/jkc2k=;
        b=irqxnjhLAHBrDg4jo+6Dar/lsGZOtyf97E51n96GFgEwznjbVJ/x/JafTO08AB/GPv
         KGbWVJvGxnhHySRS99JhPFOYwGoD8ULg7SF4O1/C9gWY7wwYLMfHeXb4F2HtsijapIVy
         AHd6zYSY8twD+8MzoUmjBdyDATj1tYdOvZDuiozChfjG649C37rpy8B/2yfyoxJvH/W/
         9M4uE/iYaJyJa8RQuGzQrTwKzVhv4Ko09ydO/6UweVWqs5PBXXJogCozCOe34gG8cnRd
         tIft8WVc4CTuRqSjVHJTazPfjpaz5igafR8MBF7BQFeoeCJUOMvXbn8phUY+3vPOWW/5
         S2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745482498; x=1746087298;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GY8Yn852fAdpDCmPtEtmJUkwdtU/HFDJFtbr8/jkc2k=;
        b=qhDTciXP13Tu/pOuc9LlLdMPAkulSjFdQ5TgA0YKI9lNr6ZDQgdZEmIrNrz4RAbom7
         Ix4wBAW+Flyz48IwBYGh64SYaOkOxuvG/QHx9UrGRDqc7/BCg5Za96nJQ1P9l7gLGMph
         f/6FalF9EBXufcXcgvTUDoOpE9icfFctKuJF3xZNQtjXvA1APqpfNKi/x227BvDSe/Qr
         TQj1diUGl564xCq6Az1bgKymQTwSJFYVe90Sgy3X6K8NL5wKYzsVPyJJEEajyaTeWKgB
         saaHToEEnbVwlImcZFITcsFOv3tOGRKq3bg3zLPKOXTM9OuMvxF3GV7GFyqi53d+6ytX
         +ROA==
X-Gm-Message-State: AOJu0YxtyOagvbLfKBfntVmkLy3sB3M3di9nogJpJDARlrVERilSsM4s
	NFwfaUWJeuigPWOWpLRegQAsD1jb7QlTAqIw/K2KNuLSQL0TCJQI
X-Gm-Gg: ASbGnctuUirwUGYuhHhnUEchOb7wge8V+axJdNAOpwFMtwpHEKzD4AZosHnCF0tr2Wa
	tAEj3n7yTe07xyjR4Zsu7cpWbOCKv16lPJIyftxv5aNvZ3gtE+h1Ky5aG86PzfG7AvM0iewYmTW
	czv/06+37FCA+tPF+gqkuQC4TtnN7AYZiz+GqPsbK//OcTAG3CXe2HYZ93ESg/zslf48osUz6h0
	zDIIGeg3Xx30DX7zuF9+0CPw/us9aI4N2SvwfIclV7rYUfmRGZfTDX1YMTTU4eRlbi5XZoktcsH
	0qSPeazFPyXqJqUl/T9MariPYpPVFgB0VKt+n2XUXN8MNNzslS4FmxHx/7mhjZRRisPZ5Cs2Jd/
	X+4N4OpUSPi/jN7SiPg==
X-Google-Smtp-Source: AGHT+IHmgMyPnMb0JYRBxbEaNhGWfNOVB7kcihxuFFYlO1Y6HYp7unDxv6p0q14GQUBJm+Xp9ZLP4A==
X-Received: by 2002:a17:903:3c64:b0:215:6c5f:d142 with SMTP id d9443c01a7336-22db4957f83mr20749085ad.20.1745482497934;
        Thu, 24 Apr 2025 01:14:57 -0700 (PDT)
Received: from [192.168.0.5] (127.37.178.217.static.user.transix.jp. [217.178.37.127])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e7b50sm7313145ad.130.2025.04.24.01.14.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 01:14:57 -0700 (PDT)
Message-ID: <63008847-719e-4a60-b33c-5a7d53068a1c@gmail.com>
Date: Thu, 24 Apr 2025 17:12:41 +0900
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] platform/x86: thinkpad-acpi: Add support for new
 hotkey for camera shutter switch
To: Hans de Goede <hdegoede@redhat.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
 ibm-acpi-devel@lists.sourceforge.net, njoshi1@lenovo.com,
 Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20250423133912.16334-1-nitjoshi@gmail.com>
 <045d37f5-259c-4553-8257-51ab6fc43534@redhat.com>
Content-Language: en-US
From: Nitin Joshi <nitjoshi@gmail.com>
In-Reply-To: <045d37f5-259c-4553-8257-51ab6fc43534@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Hans,

On 4/23/25 22:47, Hans de Goede wrote:
> Hi,
> 
> On 23-Apr-25 3:39 PM, Nitin Joshi wrote:
>> New Lenovo Thinkpad models, e.g. the 'X9-14 Gen 1' and 'X9-15 Gen 1'
>> has new shortcut on F9 key i.e to switch camera shutter and it
>> send a new 0x131b hkey event when F9 key is pressed.
>>
>> This commit adds support for new hkey 0x131b.
>>
>> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>> Signed-off-by: Nitin Joshi <nitjoshi@gmail.com>
>> ---
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
>> index 5790095c175e..0b011dcfc626 100644
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
>> +#define GCES_METHOD_ERR BIT(31)
> 
> Does this bit really indicate an error ? From other vendors
> this often is a device-not-present bit and the bit being set
> would mean in this case that there is no camera-shutter on
> the laptop we're running on.
> 
> This also matches with the -ENODEV return.
> 
> If this indeed is a device-not-present bit then this define
> should be renamed to match that.
> 
This BIT being set would mean there is no camera shutter.
So, shall i change name to "#define DEVICE_NOT_PRESENT BIT(31)"
OR
I can just replace "METHOD_ERR" with "DEVICE_NOT_PRESENT" in below enum 
and replace all METHOD_ERR in this file to "DEVICE_NOT_PRESENT":
enum {
	/* Error condition bit */
	METHOD_ERR = BIT(31),
};

I may have missed something but I think for consistency, its better to 
rename METHOD_ERR. if its OK, i can modify like this in another patch 
for this change.

> 
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
>> +	if (output & GCES_METHOD_ERR)
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
>>   	return tpacpi_input_send_key(hkey, send_acpi_ev);
>>   }
>>   
> 
> Otherwise this looks good to me now.
> 
> Regards,
> 
> Hans
Thanks & Regards,
Nitin Joshi
> 
> 

