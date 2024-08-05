Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353465464B
	for <platform-driver-x86@vger.kernel.org>; Mon,  5 Aug 2024 15:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722871108; cv=none; b=DkhyzewMGyBXe3W4q9fOEOtxjfZOuRkYnffzWsjvuvuRZ9DJNyx8AXDAXE0eMcIKsXC/R1ajfUgjOfRjgfL6wCXaIBXcTs8TU0ru2H+OcTfOUnKtilscgUAaZYZE59nX+Cmb8J3VRQX6ZxsqqRgPvOT0ZyakjFq0NBllXPhg8z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722871108; c=relaxed/simple;
	bh=kkvGoi0f0c5PpGxgHArGJ5Ke+O/35l1auQGnTlvYrRY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PcUx0ja9+NSIFdvBRpqmsFUIMUh+7smGF1vfZEp1HjQxQpKChZn21+isJsxvqxN/yXILPZYw31+unUKO6k7Bc1dfvDgAlcncfdCJrxsnZHT1bMjyf3eMORA/8QytxO2hqC2Oyru14VqeHotkOt/nBecHq7P5JFAX1PwfwFMujfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WWjxoeqF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WWjxoeqF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722871106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WrDM2KuIhRw2gmftz8XlBvUcpa2vmPZk/i+1I5URTgY=;
	b=WWjxoeqFdz/M3uEUTId8tJra4yp/2HnSvjNdxz/n0PcnvD0PPsTtpN/skNiWokufZllpcC
	UDMJg60hsQpjY8L6jMu4HosxZwv8PDIODmiJUvH1koUWUvPySkcRLbdS2UHeB2CG4NzYDP
	noLWnEdD++XiNImkR/Ye8Z8uNDmMicE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-195-pPe7s5evPcGhhlRe1soBZA-1; Mon, 05 Aug 2024 11:18:24 -0400
X-MC-Unique: pPe7s5evPcGhhlRe1soBZA-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5a74845546bso9678565a12.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 05 Aug 2024 08:18:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722871104; x=1723475904;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WrDM2KuIhRw2gmftz8XlBvUcpa2vmPZk/i+1I5URTgY=;
        b=RAsX+LkBrSw2Yx/r44Am651zR6/SzdoPDT13Br0x5SNlKEWX5bj0JHKchwaQDIlzKZ
         K8bvu2h7AIBdXDRJkedsPbjjqklMAE/dAco2ZfilS/HnUFaOLtuW2p9BP0DW4b86SnnB
         AXQn57nd0pstNpfUJzaX3MYZjpmrCR/mz94jgJcOzb/x9cW+0bzwj1j77aB0w8fZWBak
         P9j9VadpDo8ro/oBmcnTQx+x7qg2coggxWfiAwnEOdyGPiZZv/zMw9f8czKtRtnqMJee
         INlDiVS1QZlO7Z8jCZNmkMvhOV9OS0FTcKP2ttAed4W6OlvOzolBpSvyXSZPncBIInBD
         k7zw==
X-Gm-Message-State: AOJu0YzZXgyZMZAYvQ8aTe1dyPkuBheH83rchBrJEwHb0cqwvJjWM7RW
	0qlFL3y2c8hi3kZ2Y1odOctuPunsCsENPQuZGmBFRZzDq0HVV3FesNmYFGBsLHAIJzv6W2/iT5o
	WX0QJtFU7geFX1twnhwl0G1RX5AD8TrJITYK4IZJKMymeM57XH1zZNMw1YaktgJLeONF/Sm4=
X-Received: by 2002:a17:907:6e9f:b0:a77:d441:c6f1 with SMTP id a640c23a62f3a-a7dc4e6cc2dmr917806666b.33.1722871103647;
        Mon, 05 Aug 2024 08:18:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgBBb8Vnn38uxWxtoDdQN//1QoihGDm9GoBI2yfEDi6U/GFMX7lDJqB017d9qiYNaaHZ30FA==
X-Received: by 2002:a17:907:6e9f:b0:a77:d441:c6f1 with SMTP id a640c23a62f3a-a7dc4e6cc2dmr917805266b.33.1722871103184;
        Mon, 05 Aug 2024 08:18:23 -0700 (PDT)
Received: from [192.168.211.203] ([109.38.139.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9bc3cfesm464524266b.2.2024.08.05.08.18.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Aug 2024 08:18:22 -0700 (PDT)
Message-ID: <517aa9f5-00cf-4a68-b1d7-a6dc9f942e7c@redhat.com>
Date: Mon, 5 Aug 2024 17:18:21 +0200
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
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <1e309d39-43d3-4054-88a9-0c1da3de26eb@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Luke,

On 7/17/24 4:34 AM, Luke Jones wrote:
> On Wed, 17 Jul 2024, at 3:11 AM, Ilpo Järvinen wrote:
>> On Tue, 16 Jul 2024, Hans de Goede wrote:
>>> On 7/16/24 7:16 AM, Luke D. Jones wrote:
>>>> This is the first major patch I've ever done with the intention of
>>>> introducing a new module, so it's highly likely I've made some mistakes
>>>> or misunderstood something.
>>>>
>>>> TL;DR:
>>>> 1. introduce new module to contain bios attributes, using fw_attributes_class
>>>> 2. deprecate all possible attributes from asus-wmi that were added ad-hoc
>>>> 3. remove those in the next LTS cycle
>>>>
>>>> The idea for this originates from a conversation with Mario Limonciello
>>>> https://lore.kernel.org/platform-driver-x86/371d4109-a3bb-4c3b-802f-4ec27a945c99@amd.com/
>>>>
>>>> It is without a doubt much cleaner to use, easier to discover, and the
>>>> API is well defined as opposed to the random clutter of attributes I had
>>>> been placing in the platform sysfs.
>>>
>>> This is a bit of a novel use of the fw_attributes_class and I'm not
>>> entirely sure of what to think of this.
>>>
>>> The fw_attributes_class API was designed for (mostly enterprise)
>>> x86 machines where it is possible to change all BIOS settings directly
>>> from the OS without entering the BIOS.
>>>
>>> Here some ACPI or WMI function is present to actually enumerate all
>>> the BIOS options (which can be set this way) and get there type.
>>>
>>> IOW there is not a static list of options inside the driver, nor
>>> is there special handling in the driver other then handling differences
>>> per type.
>>>
>>> And if a new BIOS version has new options or a different machine model
>>> has different options then these are discovered automatically.
>>>
>>> This new use is quite different from this. Although I do see that
>>> at least for the attributes using WMI_STORE_INT() + WMI_SHOW_INT()
>>> that there is quite some commonality between some of the attributes.
>>>
>>> I see how using the existing firmware-attributes class API definition
>>> for this, including allow tweaking this with some of the fwupd
>>> firmware-attributes class commandline util work Mario did is a useful
>>> thing to have.
>>>
>>> I guess using the firmware-attributes class for this is ok, but
>>> this _must_ not be named bioscfg, since the existing hp-bioscfg
>>> driver is a "classic" firmware-attributes drivers enumerating all
>>> the options through BIOS provided enumeration functions and I want
>>> the name to make it clear that this is not that. And the Dell
>>> implementation is called dell-wmi-sysman so lets also avoid sysman
>>> as name.
>>>
>>> Maybe call it "asus-bios-tunables" ?   And then if Asus actually
>>> implements some more classic firmware-attributes enumerable interface
>>> we can use "asus-bioscfg" for that.
>>>
>>> Mario, Ilpo what is your opinion on this ?
>>
>> What you suggested sounds good to me.
> 
> Thanks guys. I think there might be a few names that could be suitable
> 
> 1. asus_bios_tuning/tunables
> 2. asus_fw_tuning/tunables
> 3. asus_fw_settings
> 4. asus_armoury
> 
> I'm shying away from the "tuning/tunables" label since there are also a lot of settings which are just toggles for various features rather than actual tunable things. It makes sense in some contexts at least.
> 
> Armoury Crate is the software collection that Asus uses for the gaming laptops, and they tend to lump these settings under that label.
> 
> Personally I'm leaning towards "asus_fw_settings" as it more accurately describes what the module does.

"asus_fw_settings" sounds good to me. I'm looking forward to v2 of this series.

Regards,

Hans


