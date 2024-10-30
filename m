Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F731E7C3A
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Oct 2024 17:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730308768; cv=none; b=f8Rq2hFySm+OniasfvhcCxgLPcDNnyw81uY40EqGm7BAbeJQ8xR8XjWQncp7N50YNC4nx8sAcem1AgKHD86pytETZy9i45Nn5dKg7BfcuOOv29w5Aw5FnbQDIYGl5SGxCk2SfD3T/UIiu1HzKck45znbEXF5U7aX8AuwHdRKbk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730308768; c=relaxed/simple;
	bh=ODKExH6SqNJKuihdqD2ihIMaaNKzjqn4RxMu0opxhBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IkvlcvBGry/TxVlt+U74+6vHrv4EMFrtd6RRZTaWZsaNLA+8ICu+XmpdyW/f4X3r6YABJ2e5g+6O+CTbhR/N6hLlYniOltsc1zBHjjPKxQ4Mdx0qVsaly39EMHJPY6Qy2GCV3antcGbF+Ajbi1VM5X8SRVMRINnpi/RGScVw7sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JESdIbHO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JESdIbHO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730308764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0CXYdrpY0G4YOjQXB6qtceyTk1oB5KzdVSpoY3koXcM=;
	b=JESdIbHOZb2gfCJd8Qvvd6QITEiVHe27+d09wWaKGKWDI+Tz+J+mzMGS1z0ZPJ3pWkg/aB
	gambUHLiJrT7oUEBWwdqJ7XP4xCoig+u3Fa6m2DLIr4XzZMvO4Jea1Ku0S0n24DULRL//M
	O9DVamkgLLhqXpFupSGsREmH714kvgM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-379-3iZZ93lGNuW0D_sJUazG-w-1; Wed, 30 Oct 2024 13:19:22 -0400
X-MC-Unique: 3iZZ93lGNuW0D_sJUazG-w-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a9a273e4251so1515866b.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Oct 2024 10:19:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730308761; x=1730913561;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0CXYdrpY0G4YOjQXB6qtceyTk1oB5KzdVSpoY3koXcM=;
        b=wDiBxaWRKNW+nf3TAHu5hs2NJzAPs6Ov7FpAWpw8wyCPh/TN1m+3qRLIgQ0OB+TS1o
         BoEe7e83BJ4gncREYow3lMhTp2a1jpLHKQ9lWzwihWQ6R1YYP0bNMesyrG1yx/vVZnh0
         ooP8sumW6NcoXvDSjvemp8kBX2KEtclPjAVsrOyj5/WPzEdGc6ZorueNBsmTz3l5j6My
         QcAoaZWHoqhrnw1uxMxmARmZql/hPUaxkAriZUuZANU5LXy+eU+nYGrl4FUXerIw76T1
         vH9jilAYl8MJGWzaJNJXhNmnlBHBNc0I9zPTcFvY0hdQTnXdbOiRNhlDYtJrknJWalDk
         B8nw==
X-Gm-Message-State: AOJu0Yy1NfytDMMWYx1RSHcCiqO1ySiWOXQpuqy41wQH8H3I4TbBAFmN
	u9+ZVh2fbKuMOe9m+f3Q6dujMNhBR6a/txHQTit+YBAT/N9A/aEbjlTjqNUhEwHFAAUgl2WCyq9
	xORbnrBwV5cOrYz87bSs2az24DSpS6tUBvaP6fDE+9cE3RSO+oW6oqJmPChqyVtKyGxPV83E=
X-Received: by 2002:a17:906:da8a:b0:a99:742c:5b5 with SMTP id a640c23a62f3a-a9de5ca48c3mr1651171366b.13.1730308761056;
        Wed, 30 Oct 2024 10:19:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7qwf3dZnQgZD02LFudDoYvSIN+Y+Yg/xrhe/DF1Lq2EL4MRnexYOxnsGIcO3C98yGlfXJYQ==
X-Received: by 2002:a17:906:da8a:b0:a99:742c:5b5 with SMTP id a640c23a62f3a-a9de5ca48c3mr1651168066b.13.1730308760554;
        Wed, 30 Oct 2024 10:19:20 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f0298dcsm589055066b.77.2024.10.30.10.19.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 10:19:19 -0700 (PDT)
Message-ID: <e3e6501c-cd05-4690-9f33-b52b5d76e56f@redhat.com>
Date: Wed, 30 Oct 2024 18:19:19 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] platform/x86/amd/pmf: Add PMF driver changes to
 make compatible with PMF-TA
To: Mario Limonciello <mario.limonciello@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
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
 <63ac59dd-a33b-4bc8-b35c-7bf9329351b7@redhat.com>
 <26109281-38a2-4166-b65d-b52dddceb542@amd.com>
 <0b1094af-fcf3-4df6-a8b7-9c05c3e20fd5@amd.com>
 <4060a47d-c05c-4b6c-b508-f3ae96a3829f@amd.com>
 <db6acd29-8e66-4088-ac71-a5099c278405@amd.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <db6acd29-8e66-4088-ac71-a5099c278405@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 30-Oct-24 5:38 PM, Mario Limonciello wrote:
> On 10/30/2024 11:23, Shyam Sundar S K wrote:
>>
>>
>> On 10/30/2024 21:38, Mario Limonciello wrote:
>>> On 10/30/2024 11:03, Shyam Sundar S K wrote:
>>>> Hi,
>>>>
>>>> On 10/30/2024 19:30, Hans de Goede wrote:
>>>>> Hi,
>>>>>
>>>>> On 29-Oct-24 3:07 PM, Ilpo Järvinen wrote:
>>>>>> Hi Hens,
>>>>>>
>>>>>> There a question / item needing your input below.
>>>>>>
>>>>>> On Wed, 23 Oct 2024, Mario Limonciello wrote:
>>>>>>> On 10/23/2024 10:52, Shyam Sundar S K wrote:
>>>>>>>> On 10/23/2024 21:10, Mario Limonciello wrote:
>>>>>>>>> On 10/23/2024 10:32, Shyam Sundar S K wrote:
>>>>>>>>>> On 10/23/2024 20:04, Mario Limonciello wrote:
>>>>>>>>>>> On 10/23/2024 09:29, Shyam Sundar S K wrote:
>>>>>>>>>>>> On 10/23/2024 19:41, Mario Limonciello wrote:
>>>>>>>>>>>>> On 10/23/2024 01:32, Shyam Sundar S K wrote:
>>>>>>>>>>>>>> The PMF driver will allocate shared buffer memory using the
>>>>>>>>>>>>>> tee_shm_alloc_kernel_buf(). This allocated memory is
>>>>>>>>>>>>>> located in
>>>>>>>>>>>>>> the
>>>>>>>>>>>>>> secure world and is used for communication with the PMF-TA.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> The latest PMF-TA version introduces new structures with OEM
>>>>>>>>>>>>>> debug
>>>>>>>>>>>>>> information and additional policy input conditions for
>>>>>>>>>>>>>> evaluating the
>>>>>>>>>>>>>> policy binary. Consequently, the shared memory size must be
>>>>>>>>>>>>>> increased to
>>>>>>>>>>>>>> ensure compatibility between the PMF driver and the updated
>>>>>>>>>>>>>> PMF-TA.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>>>>>>>>>>>>>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>>>>>>>>>>>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>>>>>>>>>>>
>>>>>>>>>>>>> How does this present to a user?  From what you describe it
>>>>>>>>>>>>> seems
>>>>>>>>>>>>> to
>>>>>>>>>>>>> me like this means a new TA will fail on older kernel in
>>>>>>>>>>>>> some way.
>>>>>>>>>>>>
>>>>>>>>>>>> Newer TA will not fail on older systems. This change is just
>>>>>>>>>>>> about
>>>>>>>>>>>> the
>>>>>>>>>>>> increase in TA reserved memory that is presented as "shared
>>>>>>>>>>>> memory",
>>>>>>>>>>>> as TA needs the additional memory for its own debug data
>>>>>>>>>>>> structures.
>>>>>>>>>>>
>>>>>>>>>>> Thx for comments. But so if you use new TA with older kernel
>>>>>>>>>>> driver,
>>>>>>>>>>> what will happen?  Can TA do a buffer overrun because the
>>>>>>>>>>> presented
>>>>>>>>>>> shared memory was too small?
>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> New TA will fail on older kernel and hence this change will be
>>>>>>>>>> required for new TA to work.
>>>>>>>>>
>>>>>>>>> OK, that's what I was worried about.
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>>      From user standpoint, always be on latest FW,
>>>>>>>>>>>> irrespective of the
>>>>>>>>>>>> platform. At this point in time, I don't see a need for FW
>>>>>>>>>>>> versioning
>>>>>>>>>>>> name (in the future, if there is a need for having a limited
>>>>>>>>>>>> support
>>>>>>>>>>>> to older platforms, we can carve out a logic to do versioning
>>>>>>>>>>>> stuff).
>>>>>>>>>>>
>>>>>>>>>>> I wish we could enforce this, but In the Linux world there is an
>>>>>>>>>>> expectation that these two trains don't need to arrive at
>>>>>>>>>>> station at
>>>>>>>>>>> the same time.
>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>>> Some ideas:
>>>>>>>>>>>>>
>>>>>>>>>>>>> 1) Should there be header version check on the TA and
>>>>>>>>>>>>> dynamically
>>>>>>>>>>>>> allocate the structure size based on the version of the F/W?
>>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> This can be done, when the TA versioning upgrade happens,
>>>>>>>>>>>> like from
>>>>>>>>>>>> 1.3 to 1.4, apart from that there is no header stuff
>>>>>>>>>>>> association.
>>>>>>>>>>>>
>>>>>>>>>>>>> 2) Or is there a command to the TA that can query the expected
>>>>>>>>>>>>> output
>>>>>>>>>>>>> size?
>>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> No, this is just the initial shared memory that the driver
>>>>>>>>>>>> allocates
>>>>>>>>>>>> to pass the inputs and the commands to TA.
>>>>>>>>>>>>
>>>>>>>>>>>>> 3) Or should the new TA filename be versioned, and the
>>>>>>>>>>>>> driver has
>>>>>>>>>>>>> a
>>>>>>>>>>>>> fallback policy?
>>>>>>>>>>>>>
>>>>>>>>>>>>> Whatever the outcome is; I think it's best that if possible
>>>>>>>>>>>>> this
>>>>>>>>>>>>> change goes back to stable to try to minimize regressions to
>>>>>>>>>>>>> users as
>>>>>>>>>>>>> distros update linux-firmware.  For example Fedora updates
>>>>>>>>>>>>> this
>>>>>>>>>>>>> monthly, but also tracks stable kernels.
>>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> Advisory to distros should be to pick the latest PMF TA
>>>>>>>>>>>> (note that,
>>>>>>>>>>>> I
>>>>>>>>>>>> have not still submitted to new TA FW).
>>>>>>>>>>>
>>>>>>>>>>> Yeah we can advise distros to pick it up when upstreamed as
>>>>>>>>>>> long as
>>>>>>>>>>> there isn't tight dependency on this patch being present.
>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> That is the reason I am waiting for this change to land. Once
>>>>>>>>>> that is
>>>>>>>>>> done, I will submit the new TA, you can send out a advisory to
>>>>>>>>>> upgrade
>>>>>>>>>> the kernel or this change has to be back-ported to stable/oem
>>>>>>>>>> kernels
>>>>>>>>>> for their enablement.
>>>>>>>>>>
>>>>>>>>>> Makes sense?
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> I think we need Hans' and Ilpo's comments here to decide what
>>>>>>>>> to do.
>>>>>>>>>
>>>>>>>>
>>>>>>>> Sure.
>>>>>>>>
>>>>>>>>> I will say that when we had this happen in amdgpu for a breaking
>>>>>>>>> reason there was a new firmware binary filename
>>>>>>>>> created/upstreamed for
>>>>>>>>> the breaking version (IIRC foo.bin -> foo_1.bin) and amdgpu had to
>>>>>>>>> have fallback code so it could be compatible with either binary.
>>>>>>>>>
>>>>>>>>
>>>>>>>> True. In case of amdgpu, the FW loading is part of the amdgpu
>>>>>>>> driver.
>>>>>>>> But in case of PMF, the PMF TA gets picked from the AMD TEE driver
>>>>>>>> through the TEE commands.
>>>>>>>>
>>>>>>>> So, there is no need for FW versioning logic in PMF driver.
>>>>>>>>
>>>>>>>
>>>>>>> That's a very good point, and this is a lot of complexity then.
>>>>>>>
>>>>>>>>
>>>>>>>>> * If user on older kernel took newer linux-firmware package
>>>>>>>>> they used
>>>>>>>>> older binary.
>>>>>>>>> * If user on newer kernel took older linux-firmware package
>>>>>>>>> they used
>>>>>>>>> older binary.
>>>>>>>>> * If user on newer kernel took newer linux-firmware package
>>>>>>>>> they used
>>>>>>>>> newer binary.
>>>>>>>>>
>>>>>>>>> If the decision is this goes in "as is" it definitely needs to
>>>>>>>>> go back
>>>>>>>>> to stable kernels.
>>>>>>>>>
>>>>>>>>
>>>>>>>> IMHO, let's not put too many fallback mechanisms. The philosophy
>>>>>>>> should be use latest driver and latest FW that avoids a lot of
>>>>>>>> confusion and yeah for that to happen this change has to go to
>>>>>>>> stable.
>>>>>>>>
>>>>>>>> Thanks,
>>>>>>>> Shyam
>>>>>>>
>>>>>>> Of course Hans and Ilpo make the final call, but I think from our
>>>>>>> discussions
>>>>>>> here it would be ideal that patch 1 and patch 5 from this series
>>>>>>> go into 6.12
>>>>>>> and have stable tags, the rest would be 6.13 material.
>>>>>>
>>>>>> Distros and SW component management challenges are more in the
>>>>>> domain of
>>>>>> Hans' expertise so I'd prefer to hear his opinion on this.
>>>>>>
>>>>>> Personally I feel though that the commit message is not entirely
>>>>>> honest
>>>>>> on all the impact as is. The wordings are sounding quite innocent
>>>>>> while if
>>>>>> I infer the above right, an incorrect combination will cause a
>>>>>> non-gracious failure.
>>>>>
>>>>> There are basically 4 possible scenarios and to me it
>>>>> is only clear from this thread what will happen in 3 of
>>>>> the 4 scenarios :
>>>>>
>>>>> 1. Old TA fw, Old kernel (TA_OUTPUT_RESERVED_MEM=906) -> works
>>>>> 2. New TA fw, Old kernel (TA_OUTPUT_RESERVED_MEM=906) -> broken
>>>>> 3. Old TA fw, new kernel (TA_OUTPUT_RESERVED_MEM=922) -> ???
>>>>> 4. New TA fw, new kernel (TA_OUTPUT_RESERVED_MEM=922) -> works
>>>>>
>>>>> If the answer to 3 is: "works" then I agree that this patch
>>>>> should be submitted to Linus as a fix with Cc: stable ASAP
>>>>> and then once that has hit most stable series it should be
>>>>> ok to upgrade the fw in linux-firmware
>>>>>
>>>>
>>>> Short answer, "yes" it does not work for "3." and you can consider it
>>>> a broken.
>>>>
>>>>> Note this is still not ideal but IMHO it would be ok.
>>>>>
>>>>> But if the answer is "broken" then we will really need to
>>>>> find some way to unbreak this, which could be as simple
>>>>> as querying the fw-version and basing the size on this,
>>>>> but having a kernel change which will regress things for
>>>>> users who do not have the old firmware yet is simply
>>>>> not acceptable.
>>>>>
>>>>
>>>> I am not sure if there is a firmware versioning interface that the ASP
>>>> (AMD Security Processor) returns back the kernel/driver.
>>>   > The code path in this case is:
>>>>
>>>> AMD PMF driver -> AMD TEE driver -> AMD CCP driver -> ASP TEE -> ASP
>>>> TA -> ASP HW.
>>>>
>>>> So, I uncertain which module has this information and where exactly
>>>> the code of fw versioning has to reside. It will take a while for me
>>>> to dig this in.
>>>
>>> As a solution to this, can amd-pmf explicitly do it's own
>>> request_firmware() call to load the firmware binary and determine the
>>> size to use in the array and then discard the loaded binary?
>>>
>>> This would let the TEE module still do it's own load later like normal
>>> without having to plumb this information across subsystems.
>>>
>>
>> TEE driver feeds in a lot of metadata and the structure information
>> for PSP headers and I don't think just having a request_firmware()
>> will help.
>>
>> Sidebar, TEE driver has a lot of plumbing that can be used decrypt the
>> policy binaries to debug issues related to TA load failures and policy
>> binary issues (basically the descriptors)
>>
>> So we might end up in replicating a majority of TEE code into PMF
>> driver, which might not be a good design choice.
>>
>> Let me first talk to internal folks to see if we can solve it by not
>> making complex changes.
>>
> 
> OK, I think for the purpose of 6.13 then this series minus the last patch probably makes sense.
> 
> I also think the first patch should ideally come in 6.12 if Hans is OK with that.  As 6.12 is probably going to be the next LTS we'll want hardware supported as widely as possible within stable rules.

Yes I have already tagged the first patch in patchwork for picking it up
for 6.12 .

Regards,

Hans



