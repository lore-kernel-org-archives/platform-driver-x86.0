Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF681E2603
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Oct 2024 14:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730296838; cv=none; b=qhL53PajY0SbAce6U/2KOY07qMfEFtwP3vTTJ4Mn4ehl6BZAKtBUz8X10+NKM5fEAcLegaK0K9oDf2g4+qp/Z5ERFfROfg5XPYQLvx4t+8W5duYUkMc3XnCoetOzFuRxZ6jkW0JmvgUevlwBqPOLr7Kz1dg3XtL+mwHAg2mlrPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730296838; c=relaxed/simple;
	bh=ziu275Y7j9Ff4FU84Dpy7KBnVbDvx6PgmZcuI8tjT10=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TfmUOCLFjC2mh9/bFvqzOTQrMjNIzULpJvFVMBhoqZSPk8a6rbESLscwOKR3BRNNLaKD/7yLfeoys6UvTsSwKFRyjzTe7/Xxhu1hukSowFGWCXA6AXfJ1XzyrpMRrAuugeXQ/y3VRTm2MpbKbpa3sd4tcJn9RcFzKeEurHvORpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aV0xEAhu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aV0xEAhu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730296834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bm9rFAMPrc9yyyJRfYP4Yshx4h/njir1BXKVa80220Q=;
	b=aV0xEAhu/aOj+81ybIWp5kKvHS6NPx3Ni3kGIbVw9CR7ult0u7F4MJ0JuvQSF4GFKtpU8O
	QRJYJz2Wkb19Kwhp0/iYEUSkJVkU+kCJ6hN35QlMGFRhokpHFdAFMS7hs0kg7RMUuyrsTk
	eYr17bWFpgatxtxtLtThFM4LQyKXkmw=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-175-auDoXASGNsyEqCF8s08_vw-1; Wed, 30 Oct 2024 10:00:32 -0400
X-MC-Unique: auDoXASGNsyEqCF8s08_vw-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2fb55e102b6so48092671fa.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Oct 2024 07:00:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730296831; x=1730901631;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bm9rFAMPrc9yyyJRfYP4Yshx4h/njir1BXKVa80220Q=;
        b=YQxH3TaaxuP1CEvuVCX/0PPfhsuPRw9LV0Q+mHyoZmG53hAEL8wQbFhQHYgAmcI94I
         eS9TSJLTyeAMTYjQp8s+irhv96ItXJ7YtmFTnvSPBiYbwO5s3apZ88njjDi6GasJIgTH
         T8i3h/AkqFG9nYxWIi7rHl5V0mX1YajKb3NCBtSqyomCRe2C4ko6PsGo0z6csS1DQPq4
         9+f0GzT5sc1gHg5fRuweNxt7Ymsogcgww8AOpkDHOdQc4pkdBK2idjCPJ7TVEy+adejd
         JzWXzBMZuga7g2r7WcAzDAo9P+g4LwVgRLarRmCgxzBuxcuYR9+xBQzsnVoT/09Cx1se
         2wWA==
X-Forwarded-Encrypted: i=1; AJvYcCXUQAO7CSyKLFBB4vyCpA8/EeNlextTUGh5twBsbGNLD27ldoam2Ve1qPyjLBMkElotst0OWRuFBfoyjLVj75HnAfRF@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+UHjXKTCOgcHHdifDqvldNAP8yTdQA2czh3I3PTSeDQAIAAH1
	IQyA3nDex+L1fBDx//pTDiOz/IU6+B1IrSgdUst7IScTBYgsQEnB1P5HOgKrg2S0VwgM4Jfx7/0
	E8XuNcG5W/cnq8F9Wy9I2rA9w5cRKCpCXXl63yoj57qydZMtCdyIrPf/VcdMNVNKhdtEvlxU=
X-Received: by 2002:a2e:b8c3:0:b0:2fb:3445:a4af with SMTP id 38308e7fff4ca-2fcbdfe8b81mr74999011fa.21.1730296829082;
        Wed, 30 Oct 2024 07:00:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvPuRCMp/YqxDsH3DbD876Co4fx8dUYmnxsksem0XHhw4djzJa5NMkKHuMC5aXi0hMAEO+sw==
X-Received: by 2002:a2e:b8c3:0:b0:2fb:3445:a4af with SMTP id 38308e7fff4ca-2fcbdfe8b81mr74997821fa.21.1730296827092;
        Wed, 30 Oct 2024 07:00:27 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cbb62c803asm5059456a12.56.2024.10.30.07.00.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 07:00:26 -0700 (PDT)
Message-ID: <63ac59dd-a33b-4bc8-b35c-7bf9329351b7@redhat.com>
Date: Wed, 30 Oct 2024 15:00:25 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] platform/x86/amd/pmf: Add PMF driver changes to
 make compatible with PMF-TA
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20241023063245.1404420-1-Shyam-sundar.S-k@amd.com>
 <20241023063245.1404420-6-Shyam-sundar.S-k@amd.com>
 <733dbf68-a1a7-43d8-acc2-7f1b8d222427@amd.com>
 <84fe3b9b-cf98-4f49-ae2b-ec1a8759af4f@amd.com>
 <02bf47e4-f39e-4799-bda4-5a65e7f948f2@amd.com>
 <41d66544-6b49-4f22-8c1c-38f14ca47fbd@amd.com>
 <9260af45-4c7a-4e8e-8ab4-16b83ed51ee9@amd.com>
 <02a2c321-33f9-4bcd-9507-3b0788acc287@amd.com>
 <e1502166-88db-4900-8f2d-ef9adfab42d1@amd.com>
 <d7b8d58b-be23-179e-0618-9bcfc54b8d0b@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <d7b8d58b-be23-179e-0618-9bcfc54b8d0b@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 29-Oct-24 3:07 PM, Ilpo Järvinen wrote:
> Hi Hens,
> 
> There a question / item needing your input below.
> 
> On Wed, 23 Oct 2024, Mario Limonciello wrote:
>> On 10/23/2024 10:52, Shyam Sundar S K wrote:
>>> On 10/23/2024 21:10, Mario Limonciello wrote:
>>>> On 10/23/2024 10:32, Shyam Sundar S K wrote:
>>>>> On 10/23/2024 20:04, Mario Limonciello wrote:
>>>>>> On 10/23/2024 09:29, Shyam Sundar S K wrote:
>>>>>>> On 10/23/2024 19:41, Mario Limonciello wrote:
>>>>>>>> On 10/23/2024 01:32, Shyam Sundar S K wrote:
>>>>>>>>> The PMF driver will allocate shared buffer memory using the
>>>>>>>>> tee_shm_alloc_kernel_buf(). This allocated memory is located in
>>>>>>>>> the
>>>>>>>>> secure world and is used for communication with the PMF-TA.
>>>>>>>>>
>>>>>>>>> The latest PMF-TA version introduces new structures with OEM
>>>>>>>>> debug
>>>>>>>>> information and additional policy input conditions for
>>>>>>>>> evaluating the
>>>>>>>>> policy binary. Consequently, the shared memory size must be
>>>>>>>>> increased to
>>>>>>>>> ensure compatibility between the PMF driver and the updated
>>>>>>>>> PMF-TA.
>>>>>>>>>
>>>>>>>>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>>>>>>>>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>>>>>>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>>>>>>
>>>>>>>> How does this present to a user?  From what you describe it seems
>>>>>>>> to
>>>>>>>> me like this means a new TA will fail on older kernel in some way.
>>>>>>>
>>>>>>> Newer TA will not fail on older systems. This change is just about
>>>>>>> the
>>>>>>> increase in TA reserved memory that is presented as "shared memory",
>>>>>>> as TA needs the additional memory for its own debug data structures.
>>>>>>
>>>>>> Thx for comments. But so if you use new TA with older kernel driver,
>>>>>> what will happen?  Can TA do a buffer overrun because the presented
>>>>>> shared memory was too small?
>>>>>>
>>>>>
>>>>> New TA will fail on older kernel and hence this change will be
>>>>> required for new TA to work.
>>>>
>>>> OK, that's what I was worried about.
>>>>
>>>>>
>>>>>>>
>>>>>>>    From user standpoint, always be on latest FW, irrespective of the
>>>>>>> platform. At this point in time, I don't see a need for FW
>>>>>>> versioning
>>>>>>> name (in the future, if there is a need for having a limited support
>>>>>>> to older platforms, we can carve out a logic to do versioning
>>>>>>> stuff).
>>>>>>
>>>>>> I wish we could enforce this, but In the Linux world there is an
>>>>>> expectation that these two trains don't need to arrive at station at
>>>>>> the same time.
>>>>>>
>>>>>>>
>>>>>>>> Some ideas:
>>>>>>>>
>>>>>>>> 1) Should there be header version check on the TA and dynamically
>>>>>>>> allocate the structure size based on the version of the F/W?
>>>>>>>>
>>>>>>>
>>>>>>> This can be done, when the TA versioning upgrade happens, like from
>>>>>>> 1.3 to 1.4, apart from that there is no header stuff association.
>>>>>>>
>>>>>>>> 2) Or is there a command to the TA that can query the expected
>>>>>>>> output
>>>>>>>> size?
>>>>>>>>
>>>>>>>
>>>>>>> No, this is just the initial shared memory that the driver allocates
>>>>>>> to pass the inputs and the commands to TA.
>>>>>>>
>>>>>>>> 3) Or should the new TA filename be versioned, and the driver has
>>>>>>>> a
>>>>>>>> fallback policy?
>>>>>>>>
>>>>>>>> Whatever the outcome is; I think it's best that if possible this
>>>>>>>> change goes back to stable to try to minimize regressions to
>>>>>>>> users as
>>>>>>>> distros update linux-firmware.  For example Fedora updates this
>>>>>>>> monthly, but also tracks stable kernels.
>>>>>>>>
>>>>>>>
>>>>>>> Advisory to distros should be to pick the latest PMF TA (note that,
>>>>>>> I
>>>>>>> have not still submitted to new TA FW).
>>>>>>
>>>>>> Yeah we can advise distros to pick it up when upstreamed as long as
>>>>>> there isn't tight dependency on this patch being present.
>>>>>>
>>>>>
>>>>> That is the reason I am waiting for this change to land. Once that is
>>>>> done, I will submit the new TA, you can send out a advisory to upgrade
>>>>> the kernel or this change has to be back-ported to stable/oem kernels
>>>>> for their enablement.
>>>>>
>>>>> Makes sense?
>>>>>
>>>>
>>>> I think we need Hans' and Ilpo's comments here to decide what to do.
>>>>
>>>
>>> Sure.
>>>
>>>> I will say that when we had this happen in amdgpu for a breaking
>>>> reason there was a new firmware binary filename created/upstreamed for
>>>> the breaking version (IIRC foo.bin -> foo_1.bin) and amdgpu had to
>>>> have fallback code so it could be compatible with either binary.
>>>>
>>>
>>> True. In case of amdgpu, the FW loading is part of the amdgpu driver.
>>> But in case of PMF, the PMF TA gets picked from the AMD TEE driver
>>> through the TEE commands.
>>>
>>> So, there is no need for FW versioning logic in PMF driver.
>>>
>>
>> That's a very good point, and this is a lot of complexity then.
>>
>>>
>>>> * If user on older kernel took newer linux-firmware package they used
>>>> older binary.
>>>> * If user on newer kernel took older linux-firmware package they used
>>>> older binary.
>>>> * If user on newer kernel took newer linux-firmware package they used
>>>> newer binary.
>>>>
>>>> If the decision is this goes in "as is" it definitely needs to go back
>>>> to stable kernels.
>>>>
>>>
>>> IMHO, let's not put too many fallback mechanisms. The philosophy
>>> should be use latest driver and latest FW that avoids a lot of
>>> confusion and yeah for that to happen this change has to go to stable.
>>>
>>> Thanks,
>>> Shyam
>>
>> Of course Hans and Ilpo make the final call, but I think from our discussions
>> here it would be ideal that patch 1 and patch 5 from this series go into 6.12
>> and have stable tags, the rest would be 6.13 material.
> 
> Distros and SW component management challenges are more in the domain of 
> Hans' expertise so I'd prefer to hear his opinion on this.
> 
> Personally I feel though that the commit message is not entirely honest 
> on all the impact as is. The wordings are sounding quite innocent while if 
> I infer the above right, an incorrect combination will cause a 
> non-gracious failure.

There are basically 4 possible scenarios and to me it
is only clear from this thread what will happen in 3 of
the 4 scenarios :

1. Old TA fw, Old kernel (TA_OUTPUT_RESERVED_MEM=906) -> works
2. New TA fw, Old kernel (TA_OUTPUT_RESERVED_MEM=906) -> broken
3. Old TA fw, new kernel (TA_OUTPUT_RESERVED_MEM=922) -> ???
4. New TA fw, new kernel (TA_OUTPUT_RESERVED_MEM=922) -> works

If the answer to 3 is: "works" then I agree that this patch
should be submitted to Linus as a fix with Cc: stable ASAP
and then once that has hit most stable series it should be
ok to upgrade the fw in linux-firmware

Note this is still not ideal but IMHO it would be ok.

But if the answer is "broken" then we will really need to
find some way to unbreak this, which could be as simple
as querying the fw-version and basing the size on this,
but having a kernel change which will regress things for
users who do not have the old firmware yet is simply
not acceptable.

Regards,

Hans




