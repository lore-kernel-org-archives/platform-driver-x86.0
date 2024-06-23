Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A34140E50
	for <platform-driver-x86@vger.kernel.org>; Sun, 23 Jun 2024 13:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719151095; cv=none; b=iNuzemogRJOpFD50Z7cAWSOf98X8A+fKAd31IdbAgW8U/w2SHORLWLZPX75CKNGJNUPiie7FqobvdUgzx815h/oEH09qherBTAfbIf4VWS6ZY8Fvm2rxdaHXdnC7wclFag1eDoQuc7A4ol3hekgq2Dx06msriicF6bvz1LI8wbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719151095; c=relaxed/simple;
	bh=fkDUiRKMpyPno8AUYh3F5pS6M0NVxqyuR1+wA3iid5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XBcwm8aSqjwzN5wKxYzUCETy0+HY1zaYxikK5tpLfcfojCpa4oXgGDZzsZuHp67FtrBJgpPClhjR0Bm27W3gETnMLPdaSgNeFTMVeju4b8kmjR5VMPBmzURxTZ0IfQ+IcDPitIH/DmiwE21MCSu7GkwQFroWcx5o9A+SEpEjnOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xvhh/mmh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xvhh/mmh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719151091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9piC3w9F1GokoziQaxKXn6JEbKJ+Yfb7/W+lN56T8cA=;
	b=Xvhh/mmhLlCJLpf5Hwq9n2d2pZprye4N3Y2ahgKRRfFuSh/gj0Afl+8H9L/Id1YbI1ksEr
	TGBMVx+62z09yuL4/nE81J8ajxM0oPtl3A6YGGQrJg6Vknp2OUI0sC51gWW/aENuyp8xXc
	qFbLQ2FlRR0WzS1tM+vynZlPsB8kOF0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-217-rq-HB7w_N_WRNdnbMLZ32g-1; Sun, 23 Jun 2024 09:58:09 -0400
X-MC-Unique: rq-HB7w_N_WRNdnbMLZ32g-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a6f1db7e425so194463966b.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 23 Jun 2024 06:58:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719151088; x=1719755888;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9piC3w9F1GokoziQaxKXn6JEbKJ+Yfb7/W+lN56T8cA=;
        b=xD47jTFgZ4tVfILqWAZNHnuIovuRO3E5g9rNQe1iUiXl+m3ZMcSpfa22sTCgUsgi/b
         rbMS/5v8na30uvkV0a+nLIzA2v1qOTx3aha5fTnNReInlZnAVC+ntcIHTarePnmChz7P
         H7VZEIpgwKwZa+hLzGCC/K8JOx67/Fo5NuJkeB6V0PpG47tJUL8YmkgjK0ePqxBgOdud
         gc3hDMRUICUqIqjyvGOnjTycIwjDMmWor2n9WABRixnGLR8ZktLAueDu5sNAFvVPPNns
         JNJU3ayma/EEaxALPjOzT3xyN0dHZN4LJMmCixxevQ9sYzZHsnZcd2oCMyJVaoy4B0bp
         y4jA==
X-Forwarded-Encrypted: i=1; AJvYcCWPJEqggC35f2hPIrYpn3CKkdJDqtGV63oSM+dMe8QIVost1CtJeHWZ0ya9BwOGqRZZNC2fCgawejqqUS9HVpyhwzVuim7jN0cm8J4ifQhqEpNuUw==
X-Gm-Message-State: AOJu0YyYTcmNqUtEwL4XvLxznyHyOWr99CKO0obfv90f2ER0CwdFJopw
	PT3+PI0cWdAif/UHdTjfs6Y/SvlMtlNeJJiNQG+MejwCL0HzVBC7vb95q+I7Y0SKH+etCgYaYEb
	DJDdLiBoZr/4KEfO2TdJVB3MdYknfrnn2XBYZCZAYJv4nCLag4LCUz6xzOTGTpuzOVQwccAU=
X-Received: by 2002:a17:906:29c8:b0:a6f:c43b:82ce with SMTP id a640c23a62f3a-a7245cc4946mr154245366b.75.1719151087915;
        Sun, 23 Jun 2024 06:58:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmN0ox/W9unXJ/B2XlMCACyZtbtEVcZinN6kVZx7BeMXCP69Hiy+5UKsmFuNqo5WwEbtWTLw==
X-Received: by 2002:a17:906:29c8:b0:a6f:c43b:82ce with SMTP id a640c23a62f3a-a7245cc4946mr154243966b.75.1719151087508;
        Sun, 23 Jun 2024 06:58:07 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fd5f7b80csm263664166b.29.2024.06.23.06.58.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Jun 2024 06:58:07 -0700 (PDT)
Message-ID: <bd13e145-6fd3-4d6d-a76f-90de97ca2f41@redhat.com>
Date: Sun, 23 Jun 2024 15:58:06 +0200
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
 <00d0d92c-322c-4970-9fc3-986f308a93b1@redhat.com>
 <20240622150735.ndw23oqabsnnmn2z@pali>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240622150735.ndw23oqabsnnmn2z@pali>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 6/22/24 5:07 PM, Pali Rohár wrote:
> On Saturday 22 June 2024 16:29:21 Hans de Goede wrote:
>> Hi,
>>
>> On 6/22/24 4:23 PM, Pali Rohár wrote:
>>> On Saturday 22 June 2024 16:14:11 Hans de Goede wrote:
>>>> Hi Pali,
>>>>
>>>> On 6/22/24 4:08 PM, Pali Rohár wrote:
>>>>> On Saturday 22 June 2024 15:56:03 Hans de Goede wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 6/22/24 2:46 PM, Pali Rohár wrote:
>>>>>>> On Friday 21 June 2024 14:24:57 Hans de Goede wrote:
>>>>>>>> On chipsets with a second 'Integrated Device Function' SMBus controller use
>>>>>>>> a different adapter-name for the second IDF adapter.
>>>>>>>>
>>>>>>>> This allows platform glue code which is looking for the primary i801
>>>>>>>> adapter to manually instantiate i2c_clients on to differentiate
>>>>>>>> between the 2.
>>>>>>>>
>>>>>>>> This allows such code to find the primary i801 adapter by name, without
>>>>>>>> needing to duplicate the PCI-ids to feature-flags mapping from i2c-i801.c.
>>>>>>>>
>>>>>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>>>>>> ---
>>>>>>>>  drivers/i2c/busses/i2c-i801.c | 9 +++++++--
>>>>>>>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
>>>>>>>> index d2d2a6dbe29f..5ac5bbd60d45 100644
>>>>>>>> --- a/drivers/i2c/busses/i2c-i801.c
>>>>>>>> +++ b/drivers/i2c/busses/i2c-i801.c
>>>>>>>> @@ -1760,8 +1760,13 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
>>>>>>>>  
>>>>>>>>  	i801_add_tco(priv);
>>>>>>>>  
>>>>>>>> -	snprintf(priv->adapter.name, sizeof(priv->adapter.name),
>>>>>>>> -		"SMBus I801 adapter at %04lx", priv->smba);
>>>>>>>> +	if (priv->features & FEATURE_IDF)
>>>>>>>> +		snprintf(priv->adapter.name, sizeof(priv->adapter.name),
>>>>>>>> +			"SMBus I801 IDF adapter at %04lx", priv->smba);
>>>>>>>> +	else
>>>>>>>> +		snprintf(priv->adapter.name, sizeof(priv->adapter.name),
>>>>>>>> +			"SMBus I801 adapter at %04lx", priv->smba);
>>>>>>>> +
>>>>>>>
>>>>>>> User visible name is identifier for user / human.
>>>>>>>
>>>>>>> If somebody is going to read this code in next 10 years then can ask
>>>>>>> question why to have different name for IDF FEATURE and not also for
>>>>>>> other features? And can come to conclusion to unify all names to be
>>>>>>> same (why not? it is user identifier).
>>>>>>
>>>>>> That is a good point, I'll add a comment about this for the next
>>>>>> version.
>>>>>>
>>>>>>> Depending on user names between different kernel subsystem is fragile,
>>>>>>> specially for future as rename can happen.
>>>>>>
>>>>>> Relying no devices names to find devices is standard practice. E.g.
>>>>>> this is how 99% of the platform drivers bind to platform devices
>>>>>> by the driver and the device having the same name.
>>>>>
>>>>> But here it is adapter name which is more likely description, not the
>>>>> device name which is used for binding.
>>>>
>>>> It is still matching on a name.
>>>>
>>>>>>> If you are depending on FEATURE_IDF flag then check for the flag
>>>>>>> directly, and not hiding the flag by serializing it into the user
>>>>>>> visible name (char[] variable) and then de-serializing it in different
>>>>>>> kernel subsystem. If the flag is not exported yet then export it via
>>>>>>> some function or other API.
>>>>>>
>>>>>> Exporting this through some new function is non trivial and adds
>>>>>> extra dependencies between modules, causing issues when one is builtin
>>>>>> and the other is build as a module.
>>>>>
>>>>> Access to "struct i801_priv *" is not possible? For example via
>>>>> dev_get_drvdata() on "struct device *" which you have in
>>>>> smo8800_find_i801()?
>>>>>
>>>>> Because if it is possible then you can create an inline function in some
>>>>> shared header file which access this flag. Not perfect (as accessing
>>>>> private data is not the best thing) but can avoid dependences between
>>>>> modules.
>>>>
>>>> Prodding inside another drivers private driver struct is a big nono
>>>> and much much more fragile then the name checking.
>>>
>>> I know, that is why I wrote to access this structure and flags in
>>> separate function which can be an inline in e.g. i2c-i801.h header file.
>>
>> We would still need to be very very sure the device we are calling that
>> function on actually has the i2c-i801.c driver bound to it, so that
>> e.g. we are not dereferencing a NULL pointer drvdata, or worse
>> poking at some other drivers private data because we are calling
>> the helper on the wrong device.
>>
>> To make sure that is the case we would need to e.g. check that:
>> a) The device in question is an i2c adapter
>> b) the adapter name matches, so we would still be doing name matching ...
>>
>> Really just matching on the adapter name is by far the cleanest
>> option here.
>>
>> Regards,
>>
>> Hans
> 
> Ok, I have looked at it now.
> 
> For a) you are already using i2c_verify_adapter(). So this part is done.
> 
> For b) you do not need to check adapter name, but rather adapter driver
> name (in case driver data are begin accessed). And I think you can use
> dev->driver.name to get it.

This would still be checking a name and on top of that requires adding
a new helper to i2c-i801.c so we are still checking a name and the code
has gotten more complex.

Regards,

Hans


