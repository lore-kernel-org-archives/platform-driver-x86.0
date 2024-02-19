Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE2728DBF
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Feb 2024 11:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708342947; cv=none; b=XJrncJmhl5XEpC6nyaLttRhz2/7MMPZdQ1iFKsDcxC+hBmKU1mBnPWkO8X9EdyPypwxQdxjMMu5NhnS2IxS1zuK4cYQ5yIOfK5SIvP7iUxncqCU6m5HyJbSoECeuRO2xQCgT9ijDTjUy5uDaxZZClHFeCp3U5sXO8g73FjDe8NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708342947; c=relaxed/simple;
	bh=xVrZq0k578Ta6e9cwUakUAtWkwWGPurKsXa5tX34Yus=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cUyZ7EXrCkCmWrrGUNDyppiohPcKjlD8lXF2h/KySZIDiavRNdX0KiZOAFb85462jFzR5NzVUrkunkSc3AlvhttlHgUPewdmAmazRJ2zwE57HH9EC/ZUArSzMLBSMBYbpadjB5kQfn/L+Udf4baSR7pG2XN1xe1oAlXyN89kEBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z9i7ChIC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z9i7ChIC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708342944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tKcOzB+b8xiWKo81pRN5t4tRz6OU2CtlQBj/U7ImHok=;
	b=Z9i7ChIC//HjS4k9OZxCRJ0ApROOMkMLEUCiFh2UnICr3hKEkKR3itKMrY/E3kYz52f4Cm
	OOiCmZyEGlGaBxPPjTUYoTMPTvYiC1cM+UXhYloQ93oa23Z8LcySBgnzL58WWPqqv2coen
	uQrhXVaqlI9MYrTcJszHudVpClJynUo=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-TCFRUjCNODmFpG8gPFhArQ-1; Mon, 19 Feb 2024 06:42:21 -0500
X-MC-Unique: TCFRUjCNODmFpG8gPFhArQ-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-512a820c444so1493337e87.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Feb 2024 03:42:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708342939; x=1708947739;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tKcOzB+b8xiWKo81pRN5t4tRz6OU2CtlQBj/U7ImHok=;
        b=d+uQ9cfjIjr5HYVqunyMOX1dUaGP9vfvAyoWuJ/ZCkAbRFzo2Qs267kT5yZodV3ybo
         PnqdNq20Pg3Iwbn71r5h7EM1LE/cxsygOmvKs+sruqplfwnFmb4x2woQPSg6pelXx+lB
         wpwp/svZvZsnor1CqH8rCLYs0k6UiP1MkTeT03e+MjISXMnbA7WxYG6EK+z63eVkAZce
         wZmT5WJ1NrSQRseFaIIKNvYNF2MN2uZKpQ5FB6EPR9x+j4AfPAeET7NqQFyXTjcZDigS
         TBKsNZjZzklU0ZRF5mHa2ltLPl9YnEC2DI+4j7c6rmUTKMDX+QuDMvCBnU+rwW+TxnOc
         1PsQ==
X-Gm-Message-State: AOJu0YxUXR4FOFIT61QHVPczrTGoqBPoleaGLFI/zgSBV1xnuhvyS/cd
	UTnWbM0ThSyB+hThGgGFxMbqkarsea7jcYBfxLQkxrnkWVxUv9HKFw0Nmx6XPcKomvb41sFhcJQ
	UknotMtjYiqVADnUZQhM1RxTMzoLFl+paUwbNECLQxAVJNxBBQWwajDRLnIkCTfEO6GIpC4U=
X-Received: by 2002:a19:7416:0:b0:511:a578:db7b with SMTP id v22-20020a197416000000b00511a578db7bmr7155647lfe.7.1708342939601;
        Mon, 19 Feb 2024 03:42:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEdt+WSWovoUHkdR2bhNNOSIN9J6PDMb/OeWhhBRMCiB+41INjdFSdRPGY9UNZYI+OEpyobPw==
X-Received: by 2002:a19:7416:0:b0:511:a578:db7b with SMTP id v22-20020a197416000000b00511a578db7bmr7155639lfe.7.1708342939252;
        Mon, 19 Feb 2024 03:42:19 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id es11-20020a056402380b00b00561e675a3casm2623539edb.68.2024.02.19.03.42.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 03:42:18 -0800 (PST)
Message-ID: <7cdb8c21-71dd-4ead-9fba-d48a37eb9788@redhat.com>
Date: Mon, 19 Feb 2024 12:42:17 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86: touchscreen_dmi: Allow partial (prefix)
 matches for ACPI names
Content-Language: en-US
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: platform-driver-x86@vger.kernel.org
References: <20240212120608.30469-1-hdegoede@redhat.com>
 <aaeb4332-e6a3-4e21-880f-69b4bcc42ba5@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <aaeb4332-e6a3-4e21-880f-69b4bcc42ba5@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2/13/24 02:01, Kuppuswamy Sathyanarayanan wrote:
> 
> On 2/12/24 4:06 AM, Hans de Goede wrote:
>> On some devices the ACPI name of the touchscreen is e.g. either
>> MSSL1680:00 or MSSL1680:01 depending on the BIOS version.
>>
>> This happens for example on the "Chuwi Hi8 Air" tablet where the initial
>> commit's ts_data uses "MSSL1680:00" but the tablets from the github issue
>> and linux-hardware.org probe linked below both use "MSSL1680:01".
>>
>> Replace the strcmp() match on ts_data->acpi_name with a strstarts()
>> check to allow using a partial match on just the ACPI HID of "MSSL1680"
>> and change the ts_data->acpi_name for the "Chuwi Hi8 Air" accordingly
>> to fix the touchscreen not working on models where it is "MSSL1680:01".
>>
>> Note this drops the length check for I2C_NAME_SIZE. This never was
>> necessary since the ACPI names used are never more then 11 chars and
>> I2C_NAME_SIZE is 20 so the replaced strncmp() would always stop long
>> before reaching I2C_NAME_SIZE.
>>
>> Link: https://linux-hardware.org/?computer=AC4301C0542A
>> Closes: https://github.com/onitake/gsl-firmware/issues/91
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
> 
> Since this is a bug fix, don't you want to add stable tag?

Good point, done.

I've added these to my review-hans (soon to be fixes) branch now.

Regards,

Hans

> 
> Otherwise, it looks good.
> 
> Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> 
>>  drivers/platform/x86/touchscreen_dmi.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
>> index 7aee5e9ff2b8..969477c83e56 100644
>> --- a/drivers/platform/x86/touchscreen_dmi.c
>> +++ b/drivers/platform/x86/touchscreen_dmi.c
>> @@ -81,7 +81,7 @@ static const struct property_entry chuwi_hi8_air_props[] = {
>>  };
>>  
>>  static const struct ts_dmi_data chuwi_hi8_air_data = {
>> -	.acpi_name	= "MSSL1680:00",
>> +	.acpi_name	= "MSSL1680",
>>  	.properties	= chuwi_hi8_air_props,
>>  };
>>  
>> @@ -1821,7 +1821,7 @@ static void ts_dmi_add_props(struct i2c_client *client)
>>  	int error;
>>  
>>  	if (has_acpi_companion(dev) &&
>> -	    !strncmp(ts_data->acpi_name, client->name, I2C_NAME_SIZE)) {
>> +	    strstarts(client->name, ts_data->acpi_name)) {
>>  		error = device_create_managed_software_node(dev, ts_data->properties, NULL);
>>  		if (error)
>>  			dev_err(dev, "failed to add properties: %d\n", error);
> 

