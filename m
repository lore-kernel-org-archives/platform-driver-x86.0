Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB6A21A435
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Apr 2025 12:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745411494; cv=none; b=ItcwJXKuNoak2vN7EYlEvkzFkCvJxYWKl81BElqHDXdixQUhY8FapypXAl4sK3gwKoJGcPJ3lV+j7e53OwnNZkajI0tDxGPBprPkxClPQs5VMTQRt81PnokCDXytdy4exHTSoAHMNxngGngtnmbV3VTR+b/MGWJQiU52C7VzaQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745411494; c=relaxed/simple;
	bh=9gc9i6zhnl4E04eiNilnREhtnb/JNGlpiX5VD8mQTtw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kIST3pdote+bo+JTS1H1A6mgn0jruJfoKSAWpK8h9E9mAWDgyyeEN4giG74ieQVqHP+qnJOs4Kr2eqHT4fEf4uuosU5P7S4sYXUWK+dm7zvZw+z/Hey4Xmp7G9MZBqmOR5urAJk4a5rnowD84ODn9K+zvoj4jA/FZNpyKoGbNck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YkUG1+Yq; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YkUG1+Yq"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22928d629faso60203825ad.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Apr 2025 05:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745411492; x=1746016292; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7QH8JZxhwBDDF7qodzBKW+AlrnuqJOpETqwfN3WECxs=;
        b=YkUG1+YqaAHnl6syu8xIrWO/e8jFJN0CzFMIK5vU9QGSgJ9Ik9iiGzr4mpMapLEYIL
         KbjNgizsDYMVraEh80rnF4SuB+JllyARQkm+2iZdhBLRKvBX+DaN4wJ08j7UQXjktmHo
         vtPrE6u8UZMc8eTMj11DyAjJ1hwZmKb6h1ryZjSqeKiKckIBOZyumt1K0LyW6jz7Z3mk
         ifSY/k1bCz2eQfuSORM+RzIAGbmUnkjX4/KM6Vsy2xfoYCeUPXjTz3qsOwnd4wnup/Mn
         uY07wu44/dN38RObS8jxhg/Up2kALrvk1DERg7+C4tK44ykAJKkNUmwByUgb8VOmhy0M
         csrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745411492; x=1746016292;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7QH8JZxhwBDDF7qodzBKW+AlrnuqJOpETqwfN3WECxs=;
        b=gZ2YNh7YPX1YbB7DwbrDhEaEKHCFq4qMS5xlT5kDVjo7WmDyB/IL/Ce9O8DUG5a4O3
         Vkv6ZTK/QAVYaKf2woZuADaXpPvRoLqUD2OkVzI9yWww1ZI9+yjm/M0x4oR6RslN2wd4
         0ZEOQAK5wWSawkZCP4BDokUROlzJa4AsEaf2gLskIoMeoN91HH61cRwPAl1Bk1h11U4S
         xSx4sD2ftW5AamtpBGBqP+1vtlSiAsPNhg0TmsndhLX3qNJ/jM4XnYZdtfU6BVQq1dhz
         PUTfnitnNXx9ltKpjj74tWHuU93Iqo20r81z5QZ7ybJMjU7XGSxae8hDmwo4VYBhhgms
         wkhA==
X-Forwarded-Encrypted: i=1; AJvYcCXQ+VmNveMhqZ8MTc5Olbc+Xq313e/6oCsrXZlJ/yQU6CRrpoGUX19j6dS6cZ3TcVSysI4PgRK/V2j2JyYK1LBxxXG7@vger.kernel.org
X-Gm-Message-State: AOJu0YyAV0jFztN0iLCq7W3wfgbpS3Cpvxx6Zx478h225dKWyXXnWYFL
	JUbH8LSMMa1cXh90P1IYPQJKUpWgQZzWtQj6GcT1znEoWCWBCMOMclqL2ibeQno=
X-Gm-Gg: ASbGnctqDXP0vvFBJs26HoHCQh0spJlqmWS2vP87gbu/QiqZ3O6sIjuoZ1v4Sw1xEI6
	eMJZ0ZwpHT4me8gm/Efpe6FKpy2nv5SSzONNokcfPhhgZqKmuNo2547zsLzaFuJqzZU3kR3F/F/
	tta8pWeSN5b3vfGEXMTusSuwEs3ws9PErZCy37qn3D+jy/XqL13lZATw9U7YA0J+98Uf1eYibwM
	1dJ1ag/sJE94g9zgt/QYYNuaCQpQizZgbHXeODleRaphmPgWyN66q1mzxar+Jp+V9wCxNqMrI2v
	V+gYolMTTZK3FMdwnr9qESsJWldk/+NBFs/PM6aaotmLZ5yEu+FbBa2Do6mLeEBceP3A7RCK5/O
	GOm74NPY=
X-Google-Smtp-Source: AGHT+IHUwOhtrt6/AHt9NjWIJgTVx3137C5RTtsZotsUlDC6jqFMmq8bkf7aUP++p1qrPXuiA4acJA==
X-Received: by 2002:a17:903:3c6b:b0:223:5c33:56a2 with SMTP id d9443c01a7336-22c535ac9bfmr304318175ad.28.1745411491690;
        Wed, 23 Apr 2025 05:31:31 -0700 (PDT)
Received: from [192.168.0.5] (127.37.178.217.static.user.transix.jp. [217.178.37.127])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4925sm103023095ad.117.2025.04.23.05.31.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 05:31:31 -0700 (PDT)
Message-ID: <f201d618-a770-4c3e-8ffa-5c8026c51628@gmail.com>
Date: Wed, 23 Apr 2025 21:29:11 +0900
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: thinkpad-acpi: Add support for new
 hotkey for camera shutter switch
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org,
 ibm-acpi-devel@lists.sourceforge.net, njoshi1@lenovo.com,
 Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20250423055130.9146-1-nitjoshi@gmail.com>
 <669674a9-935b-78a7-0556-ec597ce2b1a5@linux.intel.com>
Content-Language: en-US
From: Nitin Joshi <nitjoshi@gmail.com>
In-Reply-To: <669674a9-935b-78a7-0556-ec597ce2b1a5@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Ilpo,

Thanks for review.

On 4/23/25 18:42, Ilpo Järvinen wrote:
> On Wed, 23 Apr 2025, Nitin Joshi wrote:
> 
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
> 
> Drop this as it's unnecessary/very obvious.
Ack , I will remove it.
> 
>> +		return -ENODEV;
>> +	}
>> +
>> +	if (!acpi_evalf(gces_handle, &output, NULL, "dd", 0))
>> +		return -EIO;
>> +
>> +	if (output & BIT(31))
> 
> Please use a named define instead of using BIT(31) directly as it improves
> code readability a lot.
Ack, I will use named define GCES_METHOD_ERR instead of BIT(31).
> 
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
> 
> The second parameter fits on the previous line.
Ack , I will modify it .

Thanks & Regards,
Nitin Joshi
> 
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
>> +	if (hkey == TP_HKEY_EV_CAMERASHUTTER_TOGGLE && (camera_shutter_state >= 0)) {
>> +		mutex_lock(&tpacpi_inputdev_send_mutex);
>> +
>> +		input_report_switch(tpacpi_inputdev,
>> +			SW_CAMERA_LENS_COVER, camera_shutter_state);
>> +		input_sync(tpacpi_inputdev);
>> +
>> +		mutex_unlock(&tpacpi_inputdev_send_mutex);
>> +	}
>> +
>>   	return tpacpi_input_send_key(hkey, send_acpi_ev);
>>   }
>>   
>>
> 

