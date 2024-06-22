Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF821514DE
	for <platform-driver-x86@vger.kernel.org>; Sat, 22 Jun 2024 13:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719064573; cv=none; b=WKndjSr7N4CVQIBIqJ5lhZflEzzi6V1rzKjw+C2xjlk2mYgGgflv5roLjRs73s/DRvno5RDYRBNfBKGDuvzRc4R9xWGEi5eWhcFp9JJl0PDPeCNMYZOWjNs/U0xZkPPWvn/UD/7+dO+PsoKuPQ74sRxXWBnljRcrMY+DCllo79c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719064573; c=relaxed/simple;
	bh=PghcEPuZ3T4nU92bbiup9DUwT//ssGBUXV8nMFGxKE4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g4GjB65ByxJ5ke4BHx0raJ4+GKKJVTqiv3JEIWEsVJNhCyVToUaXc9iR76k0uzCOH+8c1ztT7vZAT3O+YketSVb59315rxYmmr6K6MDKfRJpogBTm950SjYb0zupwWoccagk/9nAtTW0huFiMimVr7W0ColYUu9iVZxcMw2rrro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hXWMOEeY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hXWMOEeY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719064570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GUVwfHEkM7gqsu8oDdsML+qBRX6RggkpKKDG0pmSM3Y=;
	b=hXWMOEeYzp3Em0vAao/TQ9E4jEIRprGisaEwG8tCGb9wyux1iXqGVicoRaM4ep++LOQxD8
	4y12gWLoZhnchuR97GDh3ZXILJXr3OjkHncg30Kh8t/GsEpnBYxwC7rQUuD9AZ+n49WyGf
	PjBvjjumsRkBc/YqeieZFwawFRnfpPU=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-192-YBxAAVrvNtaSmozoMJCA4w-1; Sat, 22 Jun 2024 09:56:06 -0400
X-MC-Unique: YBxAAVrvNtaSmozoMJCA4w-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-52cd67973e0so1372525e87.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 22 Jun 2024 06:56:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719064565; x=1719669365;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GUVwfHEkM7gqsu8oDdsML+qBRX6RggkpKKDG0pmSM3Y=;
        b=XfU/m0bf8VhyJ1QVqLTsFF89ys9y2Tk3MIQ7J3UCza1k+03erGqr/JcSo8SekrpxFF
         Oixf9dDvS/WeJhb7VejP3mks4NxFvmm1BHLwXvIvtX/MjXZ13UM1bBE80IVLzycUTiRt
         C54BNOU+77VMvL7/QhjU1bcXPWd/LBk4unGKmCre6R7XvkaxVk30jE3lggPX8u2UhiPS
         bqnCsNxIOzuSchl+0/nDIFewxD4xu3tD2ujO2gNXrdMlPuTbu5N+wjvV8tmhQW5kzEcu
         zZl9Q/WrRWiAdOYPT6Ik/ZzhOzGE2iC0M/0PHrrDoWmnbF/3EMzOLXRUfIZTRj/8e/hE
         ayqw==
X-Forwarded-Encrypted: i=1; AJvYcCWT/tQvKJAVGlN3xNlZci9wjo5l/tjSev0c9CkRV6IvMIMwnoD+nFXRiBpRqtktJ63r7mboNAXuQ1zwfGr4xLcA+phgHrYUcq1zaknE3Gx0ZKPdBw==
X-Gm-Message-State: AOJu0YykFl6UlOPRiNZFnrkbryhBBSXroj5c5Zv8TOPIph/8+chxwx64
	QxHRXDjTsHbQGbNezZat6aIMmhIA69uJoRCFNqdlDkfl4T69PdRTG/YHgrFrn8PG8cHqs0V+GeY
	sJRyH0heU9xfjWKim+HcDXRnslljWpJnn1FqKxbue9m7wd0dg1qSsXJi62+9qzFfZ31CzqRY=
X-Received: by 2002:a05:6512:34da:b0:52c:dba2:4f1 with SMTP id 2adb3069b0e04-52cdba2057dmr2327440e87.48.1719064564916;
        Sat, 22 Jun 2024 06:56:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFg7Y/CkWsSPCRxmQpnXN/KE6mAyBWO/lyyB1jVqQdwo2pviDX36pPTZpFD1Y3Bt98bI1pPYg==
X-Received: by 2002:a05:6512:34da:b0:52c:dba2:4f1 with SMTP id 2adb3069b0e04-52cdba2057dmr2327427e87.48.1719064564440;
        Sat, 22 Jun 2024 06:56:04 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a724377a1c3sm16330966b.19.2024.06.22.06.56.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Jun 2024 06:56:03 -0700 (PDT)
Message-ID: <8c45cc19-2164-46ea-a388-de23885c3323@redhat.com>
Date: Sat, 22 Jun 2024 15:56:03 +0200
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
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240622124644.hndwwp44sfbiiq7o@pali>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 6/22/24 2:46 PM, Pali Rohár wrote:
> On Friday 21 June 2024 14:24:57 Hans de Goede wrote:
>> On chipsets with a second 'Integrated Device Function' SMBus controller use
>> a different adapter-name for the second IDF adapter.
>>
>> This allows platform glue code which is looking for the primary i801
>> adapter to manually instantiate i2c_clients on to differentiate
>> between the 2.
>>
>> This allows such code to find the primary i801 adapter by name, without
>> needing to duplicate the PCI-ids to feature-flags mapping from i2c-i801.c.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/i2c/busses/i2c-i801.c | 9 +++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
>> index d2d2a6dbe29f..5ac5bbd60d45 100644
>> --- a/drivers/i2c/busses/i2c-i801.c
>> +++ b/drivers/i2c/busses/i2c-i801.c
>> @@ -1760,8 +1760,13 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
>>  
>>  	i801_add_tco(priv);
>>  
>> -	snprintf(priv->adapter.name, sizeof(priv->adapter.name),
>> -		"SMBus I801 adapter at %04lx", priv->smba);
>> +	if (priv->features & FEATURE_IDF)
>> +		snprintf(priv->adapter.name, sizeof(priv->adapter.name),
>> +			"SMBus I801 IDF adapter at %04lx", priv->smba);
>> +	else
>> +		snprintf(priv->adapter.name, sizeof(priv->adapter.name),
>> +			"SMBus I801 adapter at %04lx", priv->smba);
>> +
> 
> User visible name is identifier for user / human.
> 
> If somebody is going to read this code in next 10 years then can ask
> question why to have different name for IDF FEATURE and not also for
> other features? And can come to conclusion to unify all names to be
> same (why not? it is user identifier).

That is a good point, I'll add a comment about this for the next
version.

> Depending on user names between different kernel subsystem is fragile,
> specially for future as rename can happen.

Relying no devices names to find devices is standard practice. E.g.
this is how 99% of the platform drivers bind to platform devices
by the driver and the device having the same name.

> If you are depending on FEATURE_IDF flag then check for the flag
> directly, and not hiding the flag by serializing it into the user
> visible name (char[] variable) and then de-serializing it in different
> kernel subsystem. If the flag is not exported yet then export it via
> some function or other API.

Exporting this through some new function is non trivial and adds
extra dependencies between modules, causing issues when one is builtin
and the other is build as a module.

The name check OTOH allows the modules to be less tightly coupled
and there is plenty of precedence for using a name check here.

Regards,

Hans



>>  	err = i2c_add_adapter(&priv->adapter);
>>  	if (err) {
>>  		platform_device_unregister(priv->tco_pdev);
>> -- 
>> 2.45.1
>>
> 

