Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3732A25A2AD
	for <platform-driver-x86@vger.kernel.org>; Mon,  5 May 2025 14:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746457055; cv=none; b=fQclwkbVegEFMKlqY33O8fSaWjFRsz1ZrZ+7pnNc/gnhwU0m2O14u8iDQrUtt7o4d/qtK42VGDWxXVAPhayucPXIkmbHMrbvtqUUbTg03PPZhr0cRzudJoZrsgzbapiO6nhTQNARGv4G4mdsllhgaZYWbVNn4HA6W9TzbRehxew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746457055; c=relaxed/simple;
	bh=uF4wA2h6UOpmSuHOLNUDiMrVL2HSiMlrlLnUPHUNeWo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tKuYFz3FBk0HnoiNni7gi/6lwQBD1Vj86BiPSYTy6w0ebQsIonwT3PJh1rMJPrFwfg92xfRrlSSzry8wCqJz1HwCKQEny9cII7A6fFI5IinGf2AfpRJo/NHcADbK9lNaPRpu016cmWNNm5N+h4+L9XnRtuOOh77LnIYJJ94d+Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nkmKNjUR; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nkmKNjUR"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-223fb0f619dso53405765ad.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 05 May 2025 07:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746457053; x=1747061853; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=chXAnW2VQ1084tQ0qO+5pU5M903Y0dDkaTwORBx4OX4=;
        b=nkmKNjURLIk5WcPZssi5BoFCGFJaaTkE+wJ3F7dyM4iW8daC/XQ5MesPTKpmyOfK8D
         XrOshfOFPf92Q250C+hi7itv7e+zVyv5ui5EY5e8D8B+dwW308kaUOxopdvxnnOB2JAJ
         fWrzWwSBpWWbJzJhoEUs2qswRBerjpuzUNJN+Fqpmr3AhHwg1oNgdiBpfjWmUhiNK+1y
         lHiBHsFBSStLrSLt8b04nzNXDAqQ9BeCL0GdiUQkEteNqlZRR2nWyLURyCbz8JHWrJkX
         4l0EPgskUv810mKbAtXhkQpDWces6uQtEzOWssl1MSqrtpRk+X7ikww8A7oxs8uGs8XH
         TZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746457053; x=1747061853;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=chXAnW2VQ1084tQ0qO+5pU5M903Y0dDkaTwORBx4OX4=;
        b=pRei4SfUXPApacRJV5Fj21nNnG8Z/qtPzw2Ta6EZq3g/pj7iFpwSR1vFloWN06AueY
         vJHhEyaZd159hpZSU7etNBjOnYsUh8J2Qq/9oEaXyZlFURXyP5NwiZgFAGxiG5sULSEI
         fpnyddGyv740aj6Fq/JL3jloKf4G84F0YE+lZzI9t7aKSrTtubXGsc5J8TqRUYrHzfq6
         CclrdzK6qRQAvac1O3vaFteat/021IdL+WgaMnwWkFB2Aq1N3sJae4qFhYxcu7dMe0P7
         5nacDv9c3X7Gw8ryx0cpJi4VbTyf0Vzmu+je8z/W1yuGGwSSfU/h1mGIFr5U+ZALUmj0
         E2BQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDTn8nsa34YmlGWfD1tQABVLJ8qq5v77IFl4HY7wwDbk3ZZ7LrcqbgK/7VcHVkFIdYJhtRUEOzesoNGxBvTyjqBKBc@vger.kernel.org
X-Gm-Message-State: AOJu0YyCnYKQxe0qBO8gqi01wxzCnWwFHxj5uc7nErpo3gyMBoAqMvpw
	VATiDJBifpBMBSj39fnkTlh62LZAvBh/M+kFipCb5UpSv7eR8UL+n6vw0DdF9YQ=
X-Gm-Gg: ASbGncv57bYkGh74UQNt1I7MSWe4FIwkmlTB0H0XcCT3Px7aQngwVuL6c/P993A6Ogz
	46k5H9qFidf5DVcEYIFGufdC8T6lxt9lWOxtdVDwPkgPcKSqvNb2+9h2jKGHtm5k3OIIOLA4WKX
	IvT4xsHBkndAgQUSOpyneY0A/KsdpOGpAonCKo8My1fHfEL7josBUOprAQ37uPMRAn5HImQCnKG
	qN89SzLE3pheN6XZM/4eQlyjKQ3yhv1u3VfpOvHTTl8u/ZntDcEnWhj/9EzU4evyMed5T1+3R1V
	UKmKg28wvqCw1baq+IZAqMteYCadMJYfvJg+J/ec1KAgPmcTrBWg8rzEpP0WjXXaH4Q8AqrGXwL
	Ao5AOjSaQJCPgWpAsFg==
X-Google-Smtp-Source: AGHT+IFoIjizrYSbfLsCDCT4HnqHLAVv8u/d2lJYJm/tLGbrwfOiGfJ+dr07fV44BcIx5z689d8bmQ==
X-Received: by 2002:a17:902:e546:b0:220:ca39:d453 with SMTP id d9443c01a7336-22e102d5b02mr211558295ad.17.1746457053484;
        Mon, 05 May 2025 07:57:33 -0700 (PDT)
Received: from [192.168.0.5] (127.37.178.217.static.user.transix.jp. [217.178.37.127])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74059021067sm7084959b3a.107.2025.05.05.07.57.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 07:57:33 -0700 (PDT)
Message-ID: <fefe4b62-7887-45f9-84c7-13d36a5543ae@gmail.com>
Date: Mon, 5 May 2025 23:55:15 +0900
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] platform/x86: thinkpad-acpi: Add support for new
 hotkey for camera shutter switch
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org,
 ibm-acpi-devel@lists.sourceforge.net, njoshi1@lenovo.com,
 Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20250501123607.14171-1-nitjoshi@gmail.com>
 <b9b2edc1-f830-2811-b0f5-8bd0667e9175@linux.intel.com>
Content-Language: en-US
From: Nitin Joshi <nitjoshi@gmail.com>
In-Reply-To: <b9b2edc1-f830-2811-b0f5-8bd0667e9175@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 5/5/25 22:56, Ilpo Järvinen wrote:
> On Thu, 1 May 2025, Nitin Joshi wrote:
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
>> Changes in v5:
>> * Incorporated review comments for consistency.
>> Changes in v4:
>> * Renamed macro from METHOD_ERR to GCES_NO_SHUTTER_DEVICE.
>> Changes in v3:
>> * Avoid wasteful get_camera_shutter() calls and Minor changes based on review comments to make
>>    code more readable.
>> Changes in v2:
>> * Added ASL method to get camera shutter status and send it to userspace.
> 
> Hi,
> 
> Sparse is not happy with this change:
> 
> $ make C=2 drivers/platform/x86/thinkpad_acpi.o
> ...
>    CC      drivers/platform/x86/thinkpad_acpi.o
>    CHECK   drivers/platform/x86/thinkpad_acpi.c
> drivers/platform/x86/thinkpad_acpi.c:11267:17: error: typename in expression
> drivers/platform/x86/thinkpad_acpi.c:11267:21: error: Expected ; at end of statement
> drivers/platform/x86/thinkpad_acpi.c:11267:21: error: got camera_shutter_state
> drivers/platform/x86/thinkpad_acpi.c:11267:17: error: undefined identifier 'int'
> drivers/platform/x86/thinkpad_acpi.c:11269:17: error: undefined identifier 'camera_shutter_state'
> drivers/platform/x86/thinkpad_acpi.c:11270:21: error: undefined identifier 'camera_shutter_state'
> drivers/platform/x86/thinkpad_acpi.c:11276:76: error: undefined identifier 'camera_shutter_state'
> 
> Please fix and send v6.
Thanks for pointing this out. Sorry, I did not check this.
I will send updated patch soon .

Thanks & Regards,
Nitin Joshi
> 
>> ---
>>   drivers/platform/x86/thinkpad_acpi.c | 43 +++++++++++++++++++++++++++-
>>   1 file changed, 42 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
>> index 5790095c175e..3c75161667cf 100644
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
>> @@ -3303,7 +3323,7 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
>>   	const struct key_entry *keymap;
>>   	bool radiosw_state  = false;
>>   	bool tabletsw_state = false;
>> -	int hkeyv, res, status;
>> +	int hkeyv, res, status, camera_shutter_state;
>>   
>>   	vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_HKEY,
>>   			"initializing hotkey subdriver\n");
>> @@ -3467,6 +3487,12 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
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
>> @@ -11236,6 +11262,21 @@ static bool tpacpi_driver_event(const unsigned int hkey_event)
>>   		else
>>   			dytc_control_amt(!dytc_amt_active);
>>   
>> +		return true;
>> +	case TP_HKEY_EV_CAMERASHUTTER_TOGGLE:
>> +		int camera_shutter_state;
>> +
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
>>   		return true;
>>   	case TP_HKEY_EV_DOUBLETAP_TOGGLE:
>>   		tp_features.trackpoint_doubletap = !tp_features.trackpoint_doubletap;
>>
> 

