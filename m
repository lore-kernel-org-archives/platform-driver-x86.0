Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12954246327
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Dec 2024 14:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733926856; cv=none; b=GxVTNn6JvkCwROQI3qcinN4pVLXdm3B5OGcIUJiZjtp9FHVdJfpM0l5Ab5wPXk59NdnU11FpA/44i4XFte4tyZIY4JJUmJ6y2jc+/mbaQUedltIG6OgmSuIcN/OHsw6R5VfFmFFDSq0O2Y0nByURcK84G/QVFnO0r30dt3MF7zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733926856; c=relaxed/simple;
	bh=4ja7Ekd3UTjTeLLyxmr4hjRndJy7UiKwjtwBAHraEeQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ut/itYn9WTtNGRgtyyiw3nr3wI3xZ49+Rs10T+88mBVa3xIZB2Q9J6LH4IDkpdsXU6kd52MzMuU+8SNEYeWMjreSdel3UqLYfMgL72Hdb32iuAfX3jKRbNfQ/I5uMyWLDKtEWCX0lbefhSbuXcGKI8BGAXEiVzlJM0Zt8CalT/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EUCNTEKq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EUCNTEKq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733926853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OthdDFuMmr81jbzUYIDjlyf4TtmQf2QPDaQiDXQhn0Q=;
	b=EUCNTEKqYIW4wEZACl41cIQgdlTMjQm/d58pa/kTSMHrbxsCIkyWmHpFvdoCNbxhpshX33
	X82YHL/bYiS630OlCBlHubmgnmq8tiMKjS2N1Jga7ChKZAeTHiB4EryYXHi0rF4UI20yQZ
	d7YjvY/Vv1K5xYW74kwpegGHXspu/e4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-AKjpMydrMlidMzWEomuCyw-1; Wed, 11 Dec 2024 09:20:51 -0500
X-MC-Unique: AKjpMydrMlidMzWEomuCyw-1
X-Mimecast-MFC-AGG-ID: AKjpMydrMlidMzWEomuCyw
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5d3d9d6293fso3812382a12.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Dec 2024 06:20:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733926850; x=1734531650;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OthdDFuMmr81jbzUYIDjlyf4TtmQf2QPDaQiDXQhn0Q=;
        b=Ko2GZyn28iwzR8bKdDz17I15dxRoHPEiARw9Y9V0IiW6aF4N2ukY1G81uMulh/2Oxp
         YqmWF/ZfXa/Bp1lHoY8l0GpND80p7zOS+dfsvuyq9+yK1WPuy4Es4aXXE3Q9LUZfKQ58
         d9mziFcTphZKCV+1LXC35shVOAb/KVCUhtGxn84M99ryGIivxMFxm4c0FlGxuIGtX0Ei
         /7DuFtQCHEdV4Y5Z0bMxluZzoFPxFQ5d63op5rEM3YdlC3iH0jxB+iDoVtFHHRgpHsir
         42klSoRvHWLN7u4SmO+O7CTm5dKNiqM3FXjZ1ktDa7E+ERD109RL//CxY+AbQEMsOajU
         DBRg==
X-Gm-Message-State: AOJu0YxEwT79anE+nGhUjoY9ELrWrU5P6Q7iJ990vr5Zw9rxF15PfFdQ
	f46EMFxAvZeG3Ox5GHqvVr8ViASvF3J5U+2mIKZOMTeDAAPYCFhSw5vPEAJt/EupUh8rCwURbLo
	02Sp5SdVWqKnKwO0Me68Mh+Zm7TY+/Q9xYC8cioZbmngucYxi3/lHJW92w+6CLf56gAR5m60=
X-Gm-Gg: ASbGncsAowXTMh7+jR9TmTc1ALtLCASc8wR5SfvKZsnvdmX7JXUXcvuhDBHXlRT1SKi
	HcDsF/8U7fi1KmpppYcMZogMAz4/w+TQ/Er3Vn8KQ71MXpJM3FWukJj5/oEf4z4UhFd7YiHKqX2
	VYJjGdjJccR27KzUg/25F1LatE1uHQThREJ5cNlMFZrmqbUEkZNeX0+MZH1R9XZyR78y46KKLIu
	il6H177pRnTTii8G+eJfVnb9rEuq4brLxBQ0UIh7uW+a2se6HnlQ+CBbbPmgZ4MF6DTEaQTOp/H
	Z9ir2QSDtReW9k/pnHu+TmPtq88CeSpiZ36xGE3wNrMOHFZC0xNz/QtAaRsEXlWhbC7hGzLTZx4
	bgak7a5zTrXWYSw6nzOia0RsWgXHg
X-Received: by 2002:a05:6402:13d3:b0:5d0:feec:e15d with SMTP id 4fb4d7f45d1cf-5d433091e79mr2986431a12.8.1733926849952;
        Wed, 11 Dec 2024 06:20:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzy1HtoYfDVMY4L1tria1SZ638TwBxwRy3s9Y7eHeZDF4/06gzrHKnLRpA/JyxuNnmiK4Y+g==
X-Received: by 2002:a05:6402:13d3:b0:5d0:feec:e15d with SMTP id 4fb4d7f45d1cf-5d433091e79mr2986398a12.8.1733926849553;
        Wed, 11 Dec 2024 06:20:49 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3ecef4c07sm5601610a12.1.2024.12.11.06.20.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 06:20:49 -0800 (PST)
Message-ID: <a14591e7-0f7f-4f1a-b69b-b1cc6a042e2c@redhat.com>
Date: Wed, 11 Dec 2024 15:20:48 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add info for SARY Tab 3
 tablet
To: Huy Minh <buingoc67@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org
References: <20241202221802.9711-1-buingoc67@gmail.com>
 <07b324aa-8d32-55e6-3200-0e846ccbf127@linux.intel.com>
 <4961546.GXAFRqVoOG@hmarchlinux-thinkpad>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <4961546.GXAFRqVoOG@hmarchlinux-thinkpad>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 10-Dec-24 4:04 PM, Huy Minh wrote:
> On Tuesday, December 10, 2024 9:31:37 PM Indochina Time Ilpo Järvinen wrote:
>> On Tue, 3 Dec 2024, buingoc67@gmail.com wrote:
>>> From: hmtheboy154 <buingoc67@gmail.com>
>>>
>>> There's no info about the OEM behind the tablet, only online stores
>>> listing. This tablet uses an Intel Atom x5-Z8300, 4GB of RAM & 64GB
>>> of storage.
>>>
>>> Signed-off-by: hmtheboy154 <buingoc67@gmail.com>
>>
>> Hi,
>>
>> Thank you for the patch.
>>
>> We need to have your proper name in From and Signed-off-by tag before a
>> patch can be accepted. Please send a v2 with that fixed, thanks.
>>
>> --
>>  i.
>>
> 
> Thank you. I'll send a new patch. I thought I can keep this as I used to send 
> patches with the same name to Hans de Goede. 

To clarify this, a while ago there was a clarification of the:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

policy:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d4563201f33a022fc0353033d9dfeb1606a88330

changing from requiring "using your real name" to "using a known identity".

Since Huy Minh also uses hmtheboy154 as e.g. github username (1) that counts
to me as a known identity. So I merged Huy Minh's contributions with
hmtheboy154 as author + S-o-b name based on that.

Regards,

Hans


1) See e.g. https://github.com/onitake/gsl-firmware/pull/242





> 
> 
>>> ---
>>>
>>>  drivers/platform/x86/touchscreen_dmi.c | 26 ++++++++++++++++++++++++++
>>>  1 file changed, 26 insertions(+)
>>>
>>> diff --git a/drivers/platform/x86/touchscreen_dmi.c
>>> b/drivers/platform/x86/touchscreen_dmi.c index 0a39f68c641d..bdc19cd8d3ed
>>> 100644
>>> --- a/drivers/platform/x86/touchscreen_dmi.c
>>> +++ b/drivers/platform/x86/touchscreen_dmi.c
>>> @@ -855,6 +855,23 @@ static const struct ts_dmi_data rwc_nanote_next_data
>>> = {> 
>>>  	.properties = rwc_nanote_next_props,
>>>  
>>>  };
>>>
>>> +static const struct property_entry sary_tab_3_props[] = {
>>> +	PROPERTY_ENTRY_U32("touchscreen-size-x", 1730),
>>> +	PROPERTY_ENTRY_U32("touchscreen-size-y", 1151),
>>> +	PROPERTY_ENTRY_BOOL("touchscreen-inverted-x"),
>>> +	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
>>> +	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
>>> +	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-sary-tab-3.fw"),
>>> +	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
>>> +	PROPERTY_ENTRY_BOOL("silead,home-button"),
>>> +	{ }
>>> +};
>>> +
>>> +static const struct ts_dmi_data sary_tab_3_data = {
>>> +	.acpi_name	= "MSSL1680:00",
>>> +	.properties	= sary_tab_3_props,
>>> +};
>>> +
>>>
>>>  static const struct property_entry schneider_sct101ctm_props[] = {
>>>  
>>>  	PROPERTY_ENTRY_U32("touchscreen-size-x", 1715),
>>>  	PROPERTY_ENTRY_U32("touchscreen-size-y", 1140),
>>>
>>> @@ -1615,6 +1632,15 @@ const struct dmi_system_id touchscreen_dmi_table[]
>>> = {> 
>>>  			DMI_MATCH(DMI_BIOS_VERSION, "S8A70R100-
> V005"),
>>>  		
>>>  		},
>>>  	
>>>  	},
>>>
>>> +	{
>>> +		/* SARY Tab 3 */
>>> +		.driver_data = (void *)&sary_tab_3_data,
>>> +		.matches = {
>>> +			DMI_MATCH(DMI_SYS_VENDOR, "SARY"),
>>> +			DMI_MATCH(DMI_PRODUCT_NAME, "C210C"),
>>> +			DMI_MATCH(DMI_PRODUCT_SKU, "TAB3"),
>>> +		},
>>> +	},
>>>
>>>  	{
>>>  	
>>>  		/* Schneider SCT101CTM */
>>>  		.driver_data = (void *)&schneider_sct101ctm_data,
> 
> 
> 
> 
> 

