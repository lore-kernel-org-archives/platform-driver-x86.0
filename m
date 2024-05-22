Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEB5210EC
	for <platform-driver-x86@vger.kernel.org>; Wed, 22 May 2024 18:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716403254; cv=none; b=snPJG8SE6g7eFJFfKfcZvLEvJ+sXXaQZ2x3UyWjbnFY4D51NK+aCjDbGwrBE7mDYw8/kjHwuvUqgqBfc/PIPjSM6WzMXDADx8uK/1Q2iP3keYZC876VCFO/xnFDi1sfxQdcidEASvmgFN4aHWEj0YaFPIq0CNVcmDuljS8098Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716403254; c=relaxed/simple;
	bh=kfWPc47n+xNY8ScSXPAx+/nXRMQDNbhcCrc79j62zFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=id4+0DfqvN3apU7KpYEICoEs5mkQWN+88TeMbdbwKUWzyoRdB4o2tXx5d+riio6utSQpKh1amY+tezrMamECcapveXo3hgikVrz4tPIo0izyX5+1BGijeYQ7vBesSt0cKhQg/fGXeoKCPPUOCbuqk8XqmJGIyiYev2BNLUDCjZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WxmKfxeZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WxmKfxeZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716403251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CPwF1TaNBx29zDNzvWA/4YzffC3qGVggot/IQN0OYEE=;
	b=WxmKfxeZjQTwjhMRAgQAFgbdfMbvB1X1bZC7MmbBqcUdFqHy2lw4H0a+oIsGFZqGvtb/Py
	s8Nev7apwuWN+K+6qKtE9YJDXEZyTor8IskVnHetefrmpXmOdgY6avFB588tRQ3pHU7yjL
	ZHQ6Yzg1bTSZZoyPYgSl9FAop1i6fg0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-75-HhNusdBuNSOiJtP-8sQ1Cw-1; Wed, 22 May 2024 14:40:50 -0400
X-MC-Unique: HhNusdBuNSOiJtP-8sQ1Cw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a59a0d2280cso84925666b.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 May 2024 11:40:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716403249; x=1717008049;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CPwF1TaNBx29zDNzvWA/4YzffC3qGVggot/IQN0OYEE=;
        b=AYjQndl8Vnk+DKg5PB2MDZ66Oilq5j8qJd0AAR8KX7FfBbgH/K68a7kzDsSs1mevHO
         LGD/A2ZrZjdbUohoUJ44+ba0UQCfoS4XOwfePizDdvl2WHgcKSxSQBjfeuJP2xIWFVDn
         MKXIC6e6ujUNsTEfWG5rHzAWQPf9/+6mH2f8ScxGKrTvhE70TPiWa986RW4/Gh7vTJdI
         R1GHUhyfpPj5T03wS0iK/r9dA5j3lZqECPBRGdsWKszXgsH+n//g6B5obFFWHQUAIZFb
         jMNz8bXagO3BXJuL1dUg2Jca4Kldg5mHjNr3mkVVrdHZIswALY/kQN4ucrzqNmSqv0oK
         GgGw==
X-Forwarded-Encrypted: i=1; AJvYcCUgr+tUZsPMjl3o8lNYpIkcjpUOOhKUzJ9sjMJ7hcWUJaSKifHb2LmWNw9p7sIq5iIWhb+tukRFnSMNI75gVftTJ4xUNiYgjG/ft96fQJMs06gvBw==
X-Gm-Message-State: AOJu0YyK81J/F2OTJS4GtVyeutI1o8BSTCYufIecW86ckRfwvx0DliHx
	M1UYS+g97z4Wu9PtNITwJKlts7ZHNlI17qxXYqGq3EKgr9Yx8mxerDtxRi/DZl9pgP7pHXas5v2
	Ub5isZRF+CshwaCvN/1rKvwq1kjePH+fS7DhH3c4IGuD+KK0Pp27LNg97ZFQO1FqNF2e15kebYH
	XqoAM=
X-Received: by 2002:a17:906:a2da:b0:a5c:fd35:df3d with SMTP id a640c23a62f3a-a622814343cmr188021866b.61.1716403248876;
        Wed, 22 May 2024 11:40:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEE6KfpYUqzox81JzcwyaeFW/jZndTHsQvocHCOMLoC5ZKZjZculgF72uOblyLITGeaiSImJw==
X-Received: by 2002:a17:906:a2da:b0:a5c:fd35:df3d with SMTP id a640c23a62f3a-a622814343cmr188020766b.61.1716403248446;
        Wed, 22 May 2024 11:40:48 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a178a9d81sm1811113066b.83.2024.05.22.11.40.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 11:40:47 -0700 (PDT)
Message-ID: <4c14d61f-dc0c-4495-a74c-fa0cef4362d5@redhat.com>
Date: Wed, 22 May 2024 20:40:46 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add support for setting
 touchscreen properties from cmdline
To: Andy Shevchenko <andy@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, Gregor Riepl <onitake@gmail.com>
References: <20240522164807.28936-1-hdegoede@redhat.com>
 <Zk4pC0dkmTEcS_qA@smile.fi.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Zk4pC0dkmTEcS_qA@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andy,

Thank you for the review.

On 5/22/24 7:19 PM, Andy Shevchenko wrote:
> On Wed, May 22, 2024 at 06:48:07PM +0200, Hans de Goede wrote:
>> On x86/ACPI platforms touchscreens mostly just work without needing any
>> device/model specific configuration. But in some cases (mostly with Silead
>> and Goodix touchscreens) it is still necessary to manually specify various
>> touchscreen-properties on a per model basis.
>>
>> touchscreen_dmi is a special place for DMI quirks for this, but it can be
>> challeging for users to figure out the right property values, especially
>> for Silead touchscreens where non of these can be read back from the ctrl.
>>
>> ATM users can only test touchscreen properties by editing touchscreen_dmi.c
>> and then building a completely new kernel which makes it unnecessary
>> difficult for users to test and submit properties when necessary for their
>> laptop / tablet model.
>>
>> Add support for specifying properties on the kernel commandline to allow
>> users to easily figure out the right settings. See the added documentation
>> in kernel-parameters.txt for the commandline syntax.
> 
> ...
> 
>> +	/*
>> +	 * str is part of the static_command_line from init/main.c and poking
>> +	 * holes in that by writing 0 to it is allowed, as is taking long
>> +	 * lasting references to it.
>> +	 */
>> +	ts_cmdline_data.acpi_name = strsep(&str, ",");
>> +
>> +	for (i = 0; i < MAX_CMDLINE_PROPS; i++) {
>> +		name = strsep(&str, ",");
>> +		if (!name)
>> +			break;
>> +
>> +		/* Replace '=' with 0 and make value point past '=' or NULL */
>> +		value = name;
>> +		strsep(&value, "=");
>> +		if (!value) {
>> +			ts_cmdline_props[i] = PROPERTY_ENTRY_BOOL(name);
>> +		} else if (isdigit(value[0])) {
>> +			ret = kstrtou32(value, 10, &u32val);
>> +			if (ret)
>> +				return ret;
>> +
>> +			ts_cmdline_props[i] = PROPERTY_ENTRY_U32(name, u32val);
>> +		} else {
>> +			ts_cmdline_props[i] = PROPERTY_ENTRY_STRING(name, value);
>> +		}
>> +	}
> 
> This reminds me a lot from the next_arg(), can we not reinvent a wheel?

next_arg is meant for parsing different arguments on the kernel cmdline
split by spaces. It has space as separator hardcoded so it cannot be
used here.

> 
>> +
>> +	if (!i)
>> +		return -EINVAL; /* No properties specified */
>> +
>> +	if (str)
>> +		return -ENOSPC; /* More then MAX_CMDLINE_PROPS properties specified */
>> +
>> +	ts_data = &ts_cmdline_data;
>> +	return 0;
>> +}
> 
> ...
> 
>> +	struct ts_dmi_data *ts_data_dmi = NULL;
> 
> I prefer to see 'else' branch closer to the 'if' which will avoid a need to
> look somewhere else in the code to answer the question "what if condition is
> false".

Ok.

> ...
> 
>> +	if (!ts_data && !ts_data_dmi)
>>  		return 0; /* Not an error */
> 
> This is basically a part of the below now:
> 
>> -	ts_data = dmi_id->driver_data;
>> +	if (ts_data) {
>> +		/*
>> +		 * Kernel cmdline provided data takes precedence, copy over
>> +		 * DMI efi_embedded_fw info if available.
>> +		 */
>> +		if (ts_data_dmi)
>> +			ts_data->embedded_fw = ts_data_dmi->embedded_fw;
> 
>> +	} else {
>> +		ts_data = ts_data_dmi;
>> +	}
> 
> 	} else if (ts_data_dmi) {
> 		ts_data = ts_data_dmi;
> 	} else {
> 		return 0; /* Not an error */
> 	}
> 

Yes that is better I'll fix that for v2.

From your other reply:

>>> +			ret = kstrtou32(value, 10, &u32val);
> 
> One more thing, why to limit to the decimal only?
> Should be up to user to choose. And some properties (now or in the future)
> actually might benefit from being able to be entered in hexadecimal form.

That is a good point I'll replace the "10" with "0" for v2.

Regards,

Hans




