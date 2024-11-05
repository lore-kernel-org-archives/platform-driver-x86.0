Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D4D1D174E
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 Nov 2024 10:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730803556; cv=none; b=H/CG6La3V+6gEPCmsZ2za/BP9B9y+Gpf0IB2vty8V0oN42dByNK5aAXD8wnPod9bClBbkOWvqcjElcYvR3wFpZN6dO57IzDq8EFfhQLAWytWyZQRCEOl5lDPtHAVysoVedoTgkpwIPJnPeyW3ub+1IngjrUWZG1Ks3KBkjhq7Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730803556; c=relaxed/simple;
	bh=petNDYqpO9lInOwN0aeXn7foYpIJFc8N4dNPAHim0A4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WhbSfnPgSzp5UkJFPnB8aW6m+607ti80Yj+aoa1Y+3VDi/kUWXMrYflnohxjPGwNsHBaxRqOKU7LKmOxlhL5NJ1C0p4owHmWyL28NPbXHNEGGZ/n0YHoWk/3OvioRgGyeMEHYgxPsj7BZ4MgbwJSTreIFT0dusIq5Ds9L0UNdCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i52YRUot; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i52YRUot"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730803554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6yDYMQCJFtsroc/rmuHc1u3vxQFcvTWVkWEPeSyhlQg=;
	b=i52YRUotDcrl1eahkon9/B79fCgBTjuwoDFlm9Ex7SL6ojDXubBq90UoX0kJVy0ljpT3qa
	dKUR91puVpPLxP7Q/nFB9XR+eDO5RQZrvjCNV8S0SdXGqR/7xQJaCO9X+dcbKOrFS/snvA
	Kg2AkIdZSXvP7Thzfibd5Cg2vOfyL7I=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-378-m_DTp570MN2AFb0l83XKkg-1; Tue, 05 Nov 2024 05:45:52 -0500
X-MC-Unique: m_DTp570MN2AFb0l83XKkg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a99f084683fso29696366b.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 Nov 2024 02:45:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730803552; x=1731408352;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6yDYMQCJFtsroc/rmuHc1u3vxQFcvTWVkWEPeSyhlQg=;
        b=bYEmi8vAli+LvEuhwfXue6ze4CPlZCHUPB8iXGRevMBJyRrOr4rDx9aV4xsvbs/Fpt
         aml+u5JuT6mrKK7xTuWKLRXMl0qMc76P9m2zXGlcdGgYO0J13xAchK7kV1ZuJ2NjhGtr
         m4/tOxMjtuloQ2AfSQbRAjmiLP0+4GUq6insH8HWQpyrC1XFGX7kjfcHAzNrj6yIEnSE
         tt/X1oJ9wP6tsIGdP1JSGhPjivozq/xYnvKkQQm6yvg0ltplFsLGQXP3dt1FmmwjPtQ8
         I3O0VaM6MpRcM5wjzuyHHOOcc4JPrVemIwJ12l28uoP6fTq7j/6vtHixKXF02Iu6sSaZ
         kxHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUmCyY0f5lVYGl5H771vv9C9sgIAfyAG8n7VlGOdxaO7v1Hhfr8jHcptgpLnwzpJp3Ztd+cei79H7PiSp6l6Alykzl@vger.kernel.org
X-Gm-Message-State: AOJu0YxD5j04mLSDYxS9aVoOmI/OPvu+qFf7aJXTp33N93e+9w0KWmSC
	b7FuWan39bpl9UuPWRwo9WJdOolqJl18PwovGEBepZPBWYcnqapfGXDpYrvdhVWQ/9YUkLdRbuV
	HAvD0pK7RMvN/hvWOjt8wHJ4PSewz5Rs7wiuB3E0S8Qpv24oo004hVjY2rab4Cs3qjvWMDkM=
X-Received: by 2002:a17:907:9407:b0:a9a:4d1:c628 with SMTP id a640c23a62f3a-a9de6166babmr3718416766b.45.1730803551724;
        Tue, 05 Nov 2024 02:45:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEo2Py+Mp1ulk4Z9nvkh5azGxfln7FUviynZhmm511tcNUI2P9QIbkj2sD+zHmfqEbacOVBKA==
X-Received: by 2002:a17:907:9407:b0:a9a:4d1:c628 with SMTP id a640c23a62f3a-a9de6166babmr3718414666b.45.1730803551331;
        Tue, 05 Nov 2024 02:45:51 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb17cecedsm117164066b.128.2024.11.05.02.45.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 02:45:50 -0800 (PST)
Message-ID: <1b60b0ff-bbc9-4d14-9b3f-ebec0d1743b6@redhat.com>
Date: Tue, 5 Nov 2024 11:45:50 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] platform/x86: x86-android-tablets: Add
 get_i2c_adap_by_handle() helper
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org
References: <20241104200848.58693-1-hdegoede@redhat.com>
 <20241104200848.58693-2-hdegoede@redhat.com>
 <2027eeb6-f5c6-4ad3-042e-2cf3daf683db@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <2027eeb6-f5c6-4ad3-042e-2cf3daf683db@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Ilpo,

On 5-Nov-24 10:37 AM, Ilpo Järvinen wrote:
> On Mon, 4 Nov 2024, Hans de Goede wrote:
> 
>> Add get_i2c_adap_by_handle() helper function, this is a preparation patch
>> for adding support for getting i2c_adapter-s by PCI parent devname().
>>
>> Suggested-by: Andy Shevchenko <andy@kernel.org>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Changes in v2:
>> - New patch in v2 of this series
>> ---
>>  .../platform/x86/x86-android-tablets/core.c   | 25 ++++++++++++-------
>>  1 file changed, 16 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
>> index ef572b90e06b..4154395c60bb 100644
>> --- a/drivers/platform/x86/x86-android-tablets/core.c
>> +++ b/drivers/platform/x86/x86-android-tablets/core.c
>> @@ -155,26 +155,33 @@ static struct gpiod_lookup_table * const *gpiod_lookup_tables;
>>  static const struct software_node *bat_swnode;
>>  static void (*exit_handler)(void);
>>  
>> +static struct i2c_adapter *
>> +get_i2c_adap_by_handle(const struct x86_i2c_client_info *client_info)
>> +{
>> +	acpi_handle handle;
>> +	acpi_status status;
>> +
>> +	status = acpi_get_handle(NULL, client_info->adapter_path, &handle);
>> +	if (ACPI_FAILURE(status)) {
>> +		pr_err("Error could not get %s handle\n", client_info->adapter_path);
>> +		return NULL;
>> +	}
>> +
>> +	return i2c_acpi_find_adapter_by_handle(handle);
>> +}
>> +
>>  static __init int x86_instantiate_i2c_client(const struct x86_dev_info *dev_info,
>>  					     int idx)
>>  {
>>  	const struct x86_i2c_client_info *client_info = &dev_info->i2c_client_info[idx];
>>  	struct i2c_board_info board_info = client_info->board_info;
>>  	struct i2c_adapter *adap;
>> -	acpi_handle handle;
>> -	acpi_status status;
>>  
>>  	board_info.irq = x86_acpi_irq_helper_get(&client_info->irq_data);
>>  	if (board_info.irq < 0)
>>  		return board_info.irq;
>>  
>> -	status = acpi_get_handle(NULL, client_info->adapter_path, &handle);
>> -	if (ACPI_FAILURE(status)) {
>> -		pr_err("Error could not get %s handle\n", client_info->adapter_path);
>> -		return -ENODEV;
>> -	}
>> -
>> -	adap = i2c_acpi_find_adapter_by_handle(handle);
>> +	adap = get_i2c_adap_by_handle(client_info);
>>  	if (!adap) {
>>  		pr_err("error could not get %s adapter\n", client_info->adapter_path);
>>  		return -ENODEV;
> 
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> 
> Not a big deal, but you might want to consider if printing both error 
> messages is fine or if the error printing should be somehow modified when 
> that other print moves into the inner function.

I already considered this and since this should never happen
printing both messages if it does happen is fine IMHO.

Basically the idea is if the acpi_get_handle() fails print both
messages, if the i2c_acpi_find_adapter_by_handle() fails only
print the latter message. This way one can tell one scenario
from the other while keeping the logic simple.

The same applies to the get_i2c_adap_by_pci_parent() helper
added in patch 2.

Regards,

Hans

