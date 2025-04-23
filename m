Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E02F279793
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Apr 2025 14:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745417441; cv=none; b=kmyqvVwvnLIh6Jz9rE085iUSIhW/6DpRE4dDjdjQSDrYeFl5mWGKbJobhzHvSQ7Q7JZWSzxACRtPogrew8Ho1KMT2bLp6GcvBcQFJWS4Mheuu1EZVqtTEeUjFcpWzNX1iMU2OHMVt8fUyllQrh/ESEE9AQ7sbVwlEcBf70SGl3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745417441; c=relaxed/simple;
	bh=tnBTZmyalAj4fMTbW8PqIn9dAHSwop/3JEtZIG9hj+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hWiJWAB9QvlWuPK89xqDySbr4OqtN2ScgAmgYOfcPvddmQnuWvKNxjMUgAzCmTsQHyBE9Dx6d4d5xBlMMJZZHjeHcCgpTnUqYk/0x/JqIae/x4zbKQLOlmoqJidbrWLTX6ycR0GssD2eKnT28JcF3pZ2gH16jkVAj6l3dhmjGYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yruax9mM; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yruax9mM"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-225477548e1so65817155ad.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Apr 2025 07:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745417439; x=1746022239; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z+b/z5Aa5pQkLhrTdf9oWFruTEjEkz2BPVxhTPS7nWE=;
        b=Yruax9mMG7BsBAirwr7QKHI+P4vlfHhOFwOBBKarSwyIRH3XlFnfE0WmC+QPPjX+QR
         U+mRxCYFRifgIrfCiDbfYUFXs+J7y5iWNtfBODBImltpE2c3Vim3UkoK/O7CRMh50FS6
         Y/dp0UNMkjMiYpMDDkDa4s9J6at4zBQRnDveHcItGyx9F/M/BZf2q5a2F3o/n6PHFF2R
         haddpqTUR0N1xmWdqKf8i4oaF6cC1JeHMYM4qWTi3ffTxRz/1zmw/B2p+TKqptGxwq7S
         Q29g9GavM1Ak8MTD2PQiJq6IqtBtar/Nw5R46Rig7mgqhsWUoTwX9mkOnMswaTvwkgrZ
         sUJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745417439; x=1746022239;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z+b/z5Aa5pQkLhrTdf9oWFruTEjEkz2BPVxhTPS7nWE=;
        b=JaTG/tHQW403B4J/IGHzRST7b4E7JQq7fVwbflAC3emONX6GIQEIir6lkjP8+bfD3c
         pq2BzscviFSsYLgASK1n6sRF9R4QclTZ9sJM5vtuYnR/cKvk40xP+2Wpmpqc/e1wumcD
         0LM9sOV6tqgdx/IgdLLy4yUzwaiuz6ZfoGHIuA/gcJpNuo0TSYYF7a3ukXW2uE3Bddl9
         snDjRMrfpUOFxe5Up0M4ucBYqGftsZeiuQl/QXedyM95EoOo1df6/rFfgGu20a0dTXHC
         wX6prB2dTYNm3m+rjl0cpbymFJGN1RxLto/oKkwljwYPyfewNnoDR3tafXrwd43BIby6
         SyfA==
X-Gm-Message-State: AOJu0YxpfsliD8lLpqam7fPKF/T7Ed9lwRyv5YsU4SJlvQS0UEH2uz9e
	Yc9h9ThH/v0U8ROwMqS5QlSbWTPrnM7CqH2wtPrD4f4IqGSyJAar
X-Gm-Gg: ASbGncuDv3Ac1LWTJxGW4BJRYJjzQbeNZhQE3ndKwv1FYZtJkJ9sFNJdcjiRL8vGhpM
	LSgr6SIPs9QAb3fBj9hdk6XkcAvT8jchSe2XxwxAnqBjZzKV23F2DFFcnAmmF9SFe4v6nK+97Cz
	tLwqGdLAyzRwSWIPWmMkMAV4Xe6PftqQ3GrVGt3lPUaOuuUHeleh2Z7rGIGhuYt7Hw88rNr/Sv4
	doQb1BDQkWPJOJq1q+YoVIPbX5g1bLyTJdJLbp7jKVHacRFUnZzUI18HadLw6Pwe/FlRJNAzhmn
	xXlbzQ18yVk0inFilUIQNyTX6ks1B1L0W+skBoJvW5LYvb9DP1ycVfbH/zhqAiI1RpdsVRXuy59
	M3mutthI=
X-Google-Smtp-Source: AGHT+IG+Lsh0pXClktpW1kOcT62vYkhPp5/ywdXNVLE7MoL5xRs0NoECbBGFs4zBjx1pKHYeHn4kyw==
X-Received: by 2002:a17:902:ef0a:b0:22c:35c5:e30a with SMTP id d9443c01a7336-22c53580d0dmr272475005ad.16.1745417438816;
        Wed, 23 Apr 2025 07:10:38 -0700 (PDT)
Received: from [192.168.0.5] (127.37.178.217.static.user.transix.jp. [217.178.37.127])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c60474848sm85732555ad.125.2025.04.23.07.10.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 07:10:38 -0700 (PDT)
Message-ID: <7dad9be6-7551-426d-abf8-47446f30f112@gmail.com>
Date: Wed, 23 Apr 2025 23:08:20 +0900
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
Yes, my understanding is also that this is device-not-present but let me 
double confirm it tomorrow.
In spec, Bit 31 is shown as error status that's why i had mentioned it 
as error.
I will reuse METHOD_ERR, after confirming that its device-not-present 
and send updated patch tomorrow.
> 
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

