Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33AB157A43
	for <platform-driver-x86@vger.kernel.org>; Tue,  6 Aug 2024 09:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722936869; cv=none; b=hTHxUekeBJZpd5FN5Xeay5yrCX7fjt5fn/NCNEj/d9zAxYAaxrBssWdM+hzbOLnOT8R5F2QKmarx1doD19A4DbNrgjcpwCwhGP8vvFc1Y7hDczwJGsRplcn6XIFfOBOZJZXnK1+8+HMyI9mcwGkTjR9BQ2j69WibKQkZOTt6K7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722936869; c=relaxed/simple;
	bh=ezIZa+SGim0HsdafsDPubDccuBC+e82Zv1jaF//tGaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PbXFiLZ7Hi3Th4/xBJmKeJ+ZjzvBUvheQJHOw11yTtbrM3Z//ZCONiLv4tDj5xMhvSQTa5CTLiGigusQPFNDMW8fbCjRmF0HTeAwJ49j6uqDy5PHMzQlsZj31AdDPQ11moDgkPwucE3t6ArtKfeCXyYTJeaPYtPnB/DCse7VjHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z2mITSr5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z2mITSr5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722936866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M/mZOK2Acfhq1mHKEIENCFyI9POxKfWEgNkeRverf7Q=;
	b=Z2mITSr5TyrgvO7i+THph/+/756z7DftpBpEYu2yfhn4ZvC32Zr43n+eY+7fYAg2QI2fkP
	CDASBl/bWm2jgvhkpV90Kk6BRjZcodSwW0ttaWxT40FMRo3ewVpq9LIsMc7ZrhVQYWrmN7
	0memvERiziNCx25xr4pYYc/Lmti5WIc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-127-43OMo6K6MHmanQuFvEQH4A-1; Tue, 06 Aug 2024 05:34:25 -0400
X-MC-Unique: 43OMo6K6MHmanQuFvEQH4A-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a7a8281dba5so25895266b.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 06 Aug 2024 02:34:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722936864; x=1723541664;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M/mZOK2Acfhq1mHKEIENCFyI9POxKfWEgNkeRverf7Q=;
        b=ucweundow5W9X3l1V8aSrDN98Xfk00k0Rqynxk+Y5ybYJF32zy4Ymm6rXiJG4MTdpo
         IHMWfENj0oMM5elKxfi+TwPdzii23+7mNqMvS6XtPr31xm59WHYZDLzgxftjji9sAw3W
         xdCMEY+CPNt8/l32Chmc8GN3aKciJ7Y4E+0QPbWuuGkzww3y6/ysgi+18I3s2Vjznkzh
         svJbf5lc+UdGXIS+hDqCa9ViEZTnRBAxN8DDgB6D/N9XEf5lEuckRoHj+4GzSiNJLlpR
         y6V7S20qyv3XxhU5XBXSz94ixNZhGX1nXg9V7DBJzAt1DWVwoPVQRjXe862Ay84JXMP9
         sGWQ==
X-Gm-Message-State: AOJu0YysN+ZQ5ttFD2wjr/siaFEcU/K1KbMlO1kDn2xv0uC6g9q5e+on
	yPwCaGFOgm8ROXDcjz2vQsc9qQAQ2BdL204anbh094LQFGVM461AIQPXxrWQkWYvA1Vxb4f7U1j
	rxso0DM3lWixTBl81BkefiacckcplwGg+RrTMO+wkhOYAjOp49oJigV5/Ck+DnP1FR4qVYEXql4
	T+bEY=
X-Received: by 2002:a17:907:3e94:b0:a77:da14:8409 with SMTP id a640c23a62f3a-a7dc5098872mr1017509466b.48.1722936863647;
        Tue, 06 Aug 2024 02:34:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8RczngD6jvnwd8RGPtWVtBq5IevuWHaI5+qZSMZJouO8g2r/vOVM+ZMf/ISoJ/EPz9CZQgw==
X-Received: by 2002:a17:907:3e94:b0:a77:da14:8409 with SMTP id a640c23a62f3a-a7dc5098872mr1017507866b.48.1722936863000;
        Tue, 06 Aug 2024 02:34:23 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9c0f8d2sm532682966b.46.2024.08.06.02.34.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 02:34:22 -0700 (PDT)
Message-ID: <55756822-4eb8-419e-ae57-655caa70edd9@redhat.com>
Date: Tue, 6 Aug 2024 11:34:21 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] platform/x86: introduce asus-bioscfg
To: Luke Jones <luke@ljones.dev>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, corentin.chary@gmail.com,
 Mario Limonciello <mario.limonciello@amd.com>,
 LKML <linux-kernel@vger.kernel.org>
References: <20240716051612.64842-1-luke@ljones.dev>
 <8273ed57-4c65-41da-ad7d-907acf168c07@redhat.com>
 <e9f4fb37-5277-a7f0-2bec-8a6909b4e674@linux.intel.com>
 <1e309d39-43d3-4054-88a9-0c1da3de26eb@app.fastmail.com>
 <517aa9f5-00cf-4a68-b1d7-a6dc9f942e7c@redhat.com>
 <a35c923e-be2c-4083-8c65-c83b49fe4350@app.fastmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <a35c923e-be2c-4083-8c65-c83b49fe4350@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 8/5/24 11:41 PM, Luke Jones wrote:
> On Tue, 6 Aug 2024, at 3:18 AM, Hans de Goede wrote:
>> Hi Luke,
>>
>> On 7/17/24 4:34 AM, Luke Jones wrote:
>>> On Wed, 17 Jul 2024, at 3:11 AM, Ilpo Järvinen wrote:
>>>> On Tue, 16 Jul 2024, Hans de Goede wrote:
>>>>> On 7/16/24 7:16 AM, Luke D. Jones wrote:
>>>>>> This is the first major patch I've ever done with the intention of
>>>>>> introducing a new module, so it's highly likely I've made some mistakes
>>>>>> or misunderstood something.
>>>>>>
>>>>>> TL;DR:
>>>>>> 1. introduce new module to contain bios attributes, using fw_attributes_class
>>>>>> 2. deprecate all possible attributes from asus-wmi that were added ad-hoc
>>>>>> 3. remove those in the next LTS cycle
>>>>>>
>>>>>> The idea for this originates from a conversation with Mario Limonciello
>>>>>> https://lore.kernel.org/platform-driver-x86/371d4109-a3bb-4c3b-802f-4ec27a945c99@amd.com/
>>>>>>
>>>>>> It is without a doubt much cleaner to use, easier to discover, and the
>>>>>> API is well defined as opposed to the random clutter of attributes I had
>>>>>> been placing in the platform sysfs.
>>>>>
>>>>> This is a bit of a novel use of the fw_attributes_class and I'm not
>>>>> entirely sure of what to think of this.
>>>>>
>>>>> The fw_attributes_class API was designed for (mostly enterprise)
>>>>> x86 machines where it is possible to change all BIOS settings directly
>>>>> from the OS without entering the BIOS.
>>>>>
>>>>> Here some ACPI or WMI function is present to actually enumerate all
>>>>> the BIOS options (which can be set this way) and get there type.
>>>>>
>>>>> IOW there is not a static list of options inside the driver, nor
>>>>> is there special handling in the driver other then handling differences
>>>>> per type.
>>>>>
>>>>> And if a new BIOS version has new options or a different machine model
>>>>> has different options then these are discovered automatically.
>>>>>
>>>>> This new use is quite different from this. Although I do see that
>>>>> at least for the attributes using WMI_STORE_INT() + WMI_SHOW_INT()
>>>>> that there is quite some commonality between some of the attributes.
>>>>>
>>>>> I see how using the existing firmware-attributes class API definition
>>>>> for this, including allow tweaking this with some of the fwupd
>>>>> firmware-attributes class commandline util work Mario did is a useful
>>>>> thing to have.
>>>>>
>>>>> I guess using the firmware-attributes class for this is ok, but
>>>>> this _must_ not be named bioscfg, since the existing hp-bioscfg
>>>>> driver is a "classic" firmware-attributes drivers enumerating all
>>>>> the options through BIOS provided enumeration functions and I want
>>>>> the name to make it clear that this is not that. And the Dell
>>>>> implementation is called dell-wmi-sysman so lets also avoid sysman
>>>>> as name.
>>>>>
>>>>> Maybe call it "asus-bios-tunables" ?   And then if Asus actually
>>>>> implements some more classic firmware-attributes enumerable interface
>>>>> we can use "asus-bioscfg" for that.
>>>>>
>>>>> Mario, Ilpo what is your opinion on this ?
>>>>
>>>> What you suggested sounds good to me.
>>>
>>> Thanks guys. I think there might be a few names that could be suitable
>>>
>>> 1. asus_bios_tuning/tunables
>>> 2. asus_fw_tuning/tunables
>>> 3. asus_fw_settings
>>> 4. asus_armoury
>>>
>>> I'm shying away from the "tuning/tunables" label since there are also a lot of settings which are just toggles for various features rather than actual tunable things. It makes sense in some contexts at least.
>>>
>>> Armoury Crate is the software collection that Asus uses for the gaming laptops, and they tend to lump these settings under that label.
>>>
>>> Personally I'm leaning towards "asus_fw_settings" as it more accurately describes what the module does.
>>
>> "asus_fw_settings" sounds good to me. I'm looking forward to v2 of this series.
> 
> I've actually done a poll on my discord, folks voted overwhelmingly for `asus-armoury` and I went with this before your response. The reasoning here is that many of these users are coming from windows where Armoury Crate is an app that exposes all the same functions and so that's what they look for on linux.
> 
> If you don't think this is suitable I'm happy to change.

asus-armoury works for me, I like that that name makes it clear that this
is not changing BIOS settings like other firmware_attributes class devices
are doing.

So asus-armoury it is.

Regards,

Hans




> 
>> Regards,
>>
>> Hans
>>
>>
>>
> 

