Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84AE9449
	for <platform-driver-x86@vger.kernel.org>; Sat, 22 Jun 2024 14:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719066568; cv=none; b=IvNTCu8zZAkJ0PhrkHbgDBHU8TJOBTiUn6xDXbaffaIYPTSXSq9y3NbXB0NXw1HefA3qxKeWn7X5j7wSkPmU5ACi60zzCjSCjTWlrq1kPpJWfprAQdJviNp+T01R3ns444A9EAT51usAoEWcVtaVkw31bU/8YmoUBGwxSzknitQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719066568; c=relaxed/simple;
	bh=bXBZF6r3C04erQOjteCyUzYVY2FNxqlysz5evAgEej4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B8HlTj6CS7tNvXqMxoyOG5XhFf9SlgiPkK6nLvRjP5fGHaXxCKoNt3ZN1F5TK/lfmblChyXDo90NTWm7Xi/uj+6x4VfULE9Zxv5r4HHPJjC+nwcWXJdbOCy4F5BacZ4+XXj97GHFL//tTYpvjLhaoeM4oP2/L3TlXfu+GfgKEXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ey0Y/io7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ey0Y/io7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719066565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yFpTFySMgJ1CwYdejqW/yyEIUmxp8ClO+S32FzHc9Sc=;
	b=Ey0Y/io7IJSY9rmw6w3FEZuinmp4sfvNob6dDAPLXm6zbntGezOslsFEJO8OPy6kSy+dqC
	JCB/nL3YtiH2sRRaQgypzyP79v1qgiAGN+3C8d+/1CS3MEi4LLpysbU89GV8uJyqNlM5Z5
	pv3SWgsx4aXTJtecMiyE/UrDElKqLlo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-412-GeLEjGLMPSKJcDVji_QTEA-1; Sat, 22 Jun 2024 10:29:24 -0400
X-MC-Unique: GeLEjGLMPSKJcDVji_QTEA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a6fe871a5aeso21984966b.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 22 Jun 2024 07:29:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719066563; x=1719671363;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yFpTFySMgJ1CwYdejqW/yyEIUmxp8ClO+S32FzHc9Sc=;
        b=YxJCrkvjfhd2WaXF+0q32YmjaCWoTpjXqEms6nl1AurcVPLcTxBnzzJmSrlKVPHnM1
         yZe8os4+jRFpDTUbxNHbzLC3JdHX7dtFhoPQ8bHhPIiA+OAaZRY7hzF1hHAMPwZvxHOm
         8vtcIZvoVe187m7ugEZuioKYDMOY8ArF5q/LEVkEaj7lbZRYdRK+LKv3bmswHbBldBvd
         eYnOK+lq/v0fxmLqfZB+uZx/bnBNLcQCXeEFieiQUZyIyrhQqY/1s/F8xdlC0F1z1IT5
         MHUsw7sMdy7T/8t1nSDq9HSCAZEt95LTsDJqgLVPOUlpojzojBgfsHQOMqWTI/1Sxxjy
         7KKQ==
X-Forwarded-Encrypted: i=1; AJvYcCX440nf/KbfIbJZ6Qmbwvtu5Ze5ukiWlrO93mVvWjH7nN/SfOjAs4cP4slY9wDeZ+Lhbfo8Q6t9mE6UF4Sag4iCaQnwOCQdZobMMyif9qyrZqereA==
X-Gm-Message-State: AOJu0YxNLMpm4F/dlS6k/VsBm2wnLEqdd4Ov10outvgx/xuHc6iNRbQt
	qH0DLetpaYondLKdvJj/Trz38Tr4Q7M0zpcJENEFffkkujGUTxkYm9LaTSZLiRhUUh4fzY60oOq
	cMfKfzFwCqFpT+TfFo1Y64b8ZLoyGrIZQ6T5+4ppmICwNp2lL+8HvbJ83Gp9HXMAMLScAtAw=
X-Received: by 2002:a17:906:15c5:b0:a6f:6cde:150a with SMTP id a640c23a62f3a-a7242c4df7amr32386666b.15.1719066562875;
        Sat, 22 Jun 2024 07:29:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGT1W1DT3f3uVDSMFQhFu51f/sU1xTPemlmT7/EcnlVxQ/q3MS87eoO+T5n7RFMI5iZPvpUeQ==
X-Received: by 2002:a17:906:15c5:b0:a6f:6cde:150a with SMTP id a640c23a62f3a-a7242c4df7amr32384566b.15.1719066562232;
        Sat, 22 Jun 2024 07:29:22 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fd0838345sm193297266b.99.2024.06.22.07.29.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Jun 2024 07:29:21 -0700 (PDT)
Message-ID: <00d0d92c-322c-4970-9fc3-986f308a93b1@redhat.com>
Date: Sat, 22 Jun 2024 16:29:21 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] i2c: i801: Use a different adapter-name for IDF
 adapters
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
 Wolfram Sang <wsa@kernel.org>, eric.piel@tremplin-utc.net,
 Marius Hoch <mail@mariushoch.de>, Dell.Client.Kernel@dell.com,
 Kai Heng Feng <kai.heng.feng@canonical.com>,
 platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
References: <20240621122503.10034-1-hdegoede@redhat.com>
 <20240621122503.10034-3-hdegoede@redhat.com>
 <20240622124644.hndwwp44sfbiiq7o@pali>
 <8c45cc19-2164-46ea-a388-de23885c3323@redhat.com>
 <20240622140840.n5733l4ere26gnra@pali>
 <9736d178-ae8b-4e70-9b9f-7933d285f74c@redhat.com>
 <20240622142324.eocv3iv2tkxeig2c@pali>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240622142324.eocv3iv2tkxeig2c@pali>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 6/22/24 4:23 PM, Pali Rohár wrote:
> On Saturday 22 June 2024 16:14:11 Hans de Goede wrote:
>> Hi Pali,
>>
>> On 6/22/24 4:08 PM, Pali Rohár wrote:
>>> On Saturday 22 June 2024 15:56:03 Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 6/22/24 2:46 PM, Pali Rohár wrote:
>>>>> On Friday 21 June 2024 14:24:57 Hans de Goede wrote:
>>>>>> On chipsets with a second 'Integrated Device Function' SMBus controller use
>>>>>> a different adapter-name for the second IDF adapter.
>>>>>>
>>>>>> This allows platform glue code which is looking for the primary i801
>>>>>> adapter to manually instantiate i2c_clients on to differentiate
>>>>>> between the 2.
>>>>>>
>>>>>> This allows such code to find the primary i801 adapter by name, without
>>>>>> needing to duplicate the PCI-ids to feature-flags mapping from i2c-i801.c.
>>>>>>
>>>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>>>> ---
>>>>>>  drivers/i2c/busses/i2c-i801.c | 9 +++++++--
>>>>>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
>>>>>> index d2d2a6dbe29f..5ac5bbd60d45 100644
>>>>>> --- a/drivers/i2c/busses/i2c-i801.c
>>>>>> +++ b/drivers/i2c/busses/i2c-i801.c
>>>>>> @@ -1760,8 +1760,13 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
>>>>>>  
>>>>>>  	i801_add_tco(priv);
>>>>>>  
>>>>>> -	snprintf(priv->adapter.name, sizeof(priv->adapter.name),
>>>>>> -		"SMBus I801 adapter at %04lx", priv->smba);
>>>>>> +	if (priv->features & FEATURE_IDF)
>>>>>> +		snprintf(priv->adapter.name, sizeof(priv->adapter.name),
>>>>>> +			"SMBus I801 IDF adapter at %04lx", priv->smba);
>>>>>> +	else
>>>>>> +		snprintf(priv->adapter.name, sizeof(priv->adapter.name),
>>>>>> +			"SMBus I801 adapter at %04lx", priv->smba);
>>>>>> +
>>>>>
>>>>> User visible name is identifier for user / human.
>>>>>
>>>>> If somebody is going to read this code in next 10 years then can ask
>>>>> question why to have different name for IDF FEATURE and not also for
>>>>> other features? And can come to conclusion to unify all names to be
>>>>> same (why not? it is user identifier).
>>>>
>>>> That is a good point, I'll add a comment about this for the next
>>>> version.
>>>>
>>>>> Depending on user names between different kernel subsystem is fragile,
>>>>> specially for future as rename can happen.
>>>>
>>>> Relying no devices names to find devices is standard practice. E.g.
>>>> this is how 99% of the platform drivers bind to platform devices
>>>> by the driver and the device having the same name.
>>>
>>> But here it is adapter name which is more likely description, not the
>>> device name which is used for binding.
>>
>> It is still matching on a name.
>>
>>>>> If you are depending on FEATURE_IDF flag then check for the flag
>>>>> directly, and not hiding the flag by serializing it into the user
>>>>> visible name (char[] variable) and then de-serializing it in different
>>>>> kernel subsystem. If the flag is not exported yet then export it via
>>>>> some function or other API.
>>>>
>>>> Exporting this through some new function is non trivial and adds
>>>> extra dependencies between modules, causing issues when one is builtin
>>>> and the other is build as a module.
>>>
>>> Access to "struct i801_priv *" is not possible? For example via
>>> dev_get_drvdata() on "struct device *" which you have in
>>> smo8800_find_i801()?
>>>
>>> Because if it is possible then you can create an inline function in some
>>> shared header file which access this flag. Not perfect (as accessing
>>> private data is not the best thing) but can avoid dependences between
>>> modules.
>>
>> Prodding inside another drivers private driver struct is a big nono
>> and much much more fragile then the name checking.
> 
> I know, that is why I wrote to access this structure and flags in
> separate function which can be an inline in e.g. i2c-i801.h header file.

We would still need to be very very sure the device we are calling that
function on actually has the i2c-i801.c driver bound to it, so that
e.g. we are not dereferencing a NULL pointer drvdata, or worse
poking at some other drivers private data because we are calling
the helper on the wrong device.

To make sure that is the case we would need to e.g. check that:
a) The device in question is an i2c adapter
b) the adapter name matches, so we would still be doing name matching ...

Really just matching on the adapter name is by far the cleanest
option here.

Regards,

Hans



