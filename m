Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5191629ACC6
	for <platform-driver-x86@vger.kernel.org>; Thu, 28 Aug 2025 11:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756380464; cv=none; b=rqOhT6oxo1oXyWUvsiy+OzwolTBz8cgWII6Sr87Qoz3Jagxdli1byAayfDM/9aJgm67bQmuUCjSv8jkJ4J7r2bwGq4nZXb5UwnOO8SJr71yp7qVK2BBXAksgTlJd4gR/z2fY0/QOADIezRrnJsU2hhqsqisEruHW4aRWKwXIErE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756380464; c=relaxed/simple;
	bh=oNp9jEq5BmEbVN/b4Js6rQrq8Xst+4tcgv3iZC7SxfE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cr0GZdrz63mjCqFg27wfNRnyB0mJilEisDpX59mqeLDwGHdXi9iWAN7383DS3Mm+bczMvB6YpQsyOzZw3YGGp6aTeI+FshrRq2b1L5zLVmugsZqPdQLWxWbs4mQNbmen04wTr4sOx9hcVtFXmfYOD8RIm9Dz71Hxa0iDMRp6ux4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EbAvnjVq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EbAvnjVq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756380461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NvseKhbRe99z0CmdjuhWgWGyOBPn+zwz/tfo7V9gT6k=;
	b=EbAvnjVqwWx/V+9jK1kW3hu2vlqfcU/yc9tkuwfkMD+JEqCHMRnaLrc/gsJ5fipTtH8juX
	STdzAR66SKqBi0bj6sBsVB++HlQ/SutB/+r59mEauj0C2A6F0y1zTOA0eUDTlEGVDqzK0y
	CkiYDb+hjxDnklubZ6gXQrDwpoOWhjE=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-2zEtXVlFNLqbvsgmfW9ouQ-1; Thu, 28 Aug 2025 07:27:40 -0400
X-MC-Unique: 2zEtXVlFNLqbvsgmfW9ouQ-1
X-Mimecast-MFC-AGG-ID: 2zEtXVlFNLqbvsgmfW9ouQ_1756380459
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-721684f784dso2451527b3.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Aug 2025 04:27:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756380459; x=1756985259;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NvseKhbRe99z0CmdjuhWgWGyOBPn+zwz/tfo7V9gT6k=;
        b=WF8hxzsbCzB+EVqZplVbJSCw2bDyT0matQt0IU+yKx6lW6f+4SK1F5a+0B/HdQZ29U
         ayd1TCiSM4e96sbPfq5knlOpM4GYgr9lM2rLh8Pcg1E9GzvdWdGz09CK6Y28q94yH2p8
         lx3F1YBCxeIkVy7Tis/bCBIlXt4meahrnRbNnDAy9UFnbOFmpUsHR7hKbdmPMzNz2Pky
         C5EJR1aaElGVZj4wCo6qRrPt9iwpjPYPR+qo3eIaJ20XrkxDLXEIutuiSpOPu5o886ia
         8nIiT7Fkyrn4T8qP+hXrM/jBlUWSpDe36rf/WXLv9rvAM01RxrFdyilK0QjEH6rmmmUf
         3ACw==
X-Forwarded-Encrypted: i=1; AJvYcCVj8zVGtvxgC6TEKRXAE6NPWXxK6kACr26FntZvRfiv1VYRQgk8ofWp2DV9cWYSG2vfliX+SgjbXbutIbHcQCDjy21W@vger.kernel.org
X-Gm-Message-State: AOJu0YytbiBh0Mlk6ESdxQDyIzLKaznmdZRp/DrP8ckjjdi6BP9retlo
	pTL0dSh1qfKnlqDd4xbiuNAzpqQts7+ZJkctN7F5YRPiMz5BOjQTgHEz0b5lonJXCKg/ifyyFRo
	mxJaRXEAOA9cS6hMiSPGtjMisSqOJBEF87fT6EmisemmnmamjtPSmgDGQ2Uay0+HXxxBJt9sHeK
	w=
X-Gm-Gg: ASbGncsu0+kBXRDV1a152q1+e2HgRW65/ZldvLJlux4y2CKHQDU3WW7o8nP3y5m/p0H
	QwamtEQ3495OTIZOsf8AUe5rsgViuyxgk3IUgxcab+DVFPEdRRGPOpe+JLCLiHYolfD8fOoyw3r
	L90zBXTRl80J82dZXSTSZDxFtksmo2EbtZF0rMJ4aOA2GtLArI5DX8OittoGOJv/xXz4yncWHfJ
	kVpFTBsm0jRmbu+Ybc1DBTkpqY92PBZVKZB53C+jVk/bet0A+TiKZMLKJ2bzQzVVkC36jROAH3A
	vZ4NCzJUk++eTkJ82cvt4jdSR1S8VEX81ggVgoE=
X-Received: by 2002:a05:690c:67c6:b0:720:58fd:6433 with SMTP id 00721157ae682-72058fd6980mr196110297b3.35.1756380459406;
        Thu, 28 Aug 2025 04:27:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEs1gMfCshj+EI8bjuXG0ZlCYFlPKnwKuax5qtq3eiiOcfsRu4MQD8QtE8fsNsRs28xOi1lEA==
X-Received: by 2002:a05:690c:67c6:b0:720:58fd:6433 with SMTP id 00721157ae682-72058fd6980mr196109997b3.35.1756380458909;
        Thu, 28 Aug 2025 04:27:38 -0700 (PDT)
Received: from [10.26.1.94] ([66.187.232.136])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-71ff173cd93sm38418157b3.22.2025.08.28.04.27.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 04:27:38 -0700 (PDT)
Message-ID: <67ebb7d5-418c-4eaf-aa94-8ecf76bd44eb@redhat.com>
Date: Thu, 28 Aug 2025 07:27:36 -0400
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/intel: power-domains validate domain in
 tpmi_cpu_online()
To: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>,
 platform-driver-x86@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Tero Kristo <tero.kristo@linux.intel.com>, linux-kernel@vger.kernel.org
References: <20250826164331.1372856-1-darcari@redhat.com>
 <00466c7a41bd4a0120a7798318ac5bba8878ada5.camel@linux.intel.com>
 <adbc0e8b-199a-42af-a45e-cb3791923554@redhat.com>
 <abdd6c22714984782fbbb7dab5a7e1ab0fa4799c.camel@linux.intel.com>
Content-Language: en-US
From: David Arcari <darcari@redhat.com>
In-Reply-To: <abdd6c22714984782fbbb7dab5a7e1ab0fa4799c.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 8/27/25 7:49 AM, srinivas pandruvada wrote:
> On Tue, 2025-08-26 at 21:39 -0400, David Arcari wrote:
>>
>> Hi Srinivas,
>>
>> On 8/26/25 4:26 PM, srinivas pandruvada wrote:
>>> Hi David,
>>>
>>> On Tue, 2025-08-26 at 12:43 -0400, David Arcari wrote:
>>>> Although tpmi_get_power_domain_mask() calls
>>>> tpmi_domain_is_valid()
>>>> prior to indexing tpmi_power_domain_mask[],
>>> Because this an API call so that caller parameter needs to be
>>> sanitized.
>>>
>>>>    tpmi_cpu_online() does
>>>> not.
>>> This is hotplug callback, which should have correct topology
>>> information.
>>>
>>>>    In the case where a VM creates non-contiguous package ids the
>>>> result can be memory corruption. This can be prevented by adding
>>>> the same validation in tpmi_cpu_online().
>>>>
>>>
>>> This driver is getting loaded means MSR 0x54 is virtualised
>>> otherwise
>>> this driver will not load.
>>
>> I don't have direct access to the system, but this appears to be the
>> case.  The driver is reading MSR 0x54:
>>
>> drivers/platform/x86/intel/tpmi_power_domains.c:#define
>> MSR_PM_LOGICAL_ID       0x54
>> drivers/platform/x86/intel/tpmi_power_domains.c:        ret =
>> rdmsrl_safe(MSR_PM_LOGICAL_ID, &data);
>> drivers/platform/x86/intel/tpmi_power_domains.c:        ret =
>> rdmsrl_safe(MSR_PM_LOGICAL_ID, &data);
>>
>>
>>> Not sure this is an upstream kernel or not.
>>
>> This was not an upstream kernel, but I don't see anything in the
>> upstream driver that would have prevented the access that is
>> occurring.
>>
> The issue here the topology_max_packages() is 2 but cpu 1 package ID is
> also 2. So everywhere topology_max_packages() is used there may be
> issue as you have to verify the package ID is fine.

Correct.  There are two logical packages on this system, but they are 0 
and 2.

> 
> 
> Repost the patch by adding the above root cause in the description, so
> we know why we need this change.

I will do that.

Best,
-DA

> 
> Thanks,
> Srinivas
> 
>>>
>>> Some comments below.
>>>
>>>> Fixes: 17ca2780458c ("platform/x86/intel: TPMI domain id and CPU
>>>> mapping")
>>>>
>>> Andy already pointed about new line here.
>>>
>>>> Cc: Hans de Goede <hansg@kernel.org>
>>>> Cc: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
>>>> Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
>>>> Cc: Peter Zijlstra <peterz@infradead.org>
>>>> Cc: Ingo Molnar <mingo@kernel.org>
>>>> Cc: Dan Carpenter <dan.carpenter@linaro.org>
>>>> Cc: David Arcari <darcari@redhat.com>
>>>> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>>> Cc: Tero Kristo <tero.kristo@linux.intel.com>
>>>> Cc: linux-kernel@vger.kernel.org
>>>> Signed-off-by: David Arcari <darcari@redhat.com>
>>>> ---
>>>>    drivers/platform/x86/intel/tpmi_power_domains.c | 3 +++
>>>>    1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/drivers/platform/x86/intel/tpmi_power_domains.c
>>>> b/drivers/platform/x86/intel/tpmi_power_domains.c
>>>> index 9d8247bb9cfa..ae5b58679e29 100644
>>>> --- a/drivers/platform/x86/intel/tpmi_power_domains.c
>>>> +++ b/drivers/platform/x86/intel/tpmi_power_domains.c
>>>> @@ -194,6 +194,9 @@ static int tpmi_cpu_online(unsigned int cpu)
>>>>    	if (ret)
>>>>    		return 0;
>>>>    
>>> Need some more information.
>>>
>>> The only case this check is required if
>>> topology_physical_package_id(cpu) is returning greater or equal to
>>> topology_max_packages(). If this true in this case, please check
>>> the
>>> value of info->pkg_id. If this is bad then then some other places
>>> also
>>> this may have issue. info->punit_domain_id is already checked for
>>> valid
>>> value in tpmi_get_logical_id().
>>
>> That is correct.  In the case of the crash we have:
>>
>> crash> p/x __max_logical_packages
>> $1 = 0x2
>>
>> static inline unsigned int topology_max_packages(void)
>> {
>> 	return __max_logical_packages;
>> }
>>
>>
>> $2 = {
>>     hnode = {
>>       next = 0xffff9651bbc37010,
>>       pprev = 0xffffffffc0b7a640 <tpmi_cpu_hash>
>>     },
>>     linux_cpu = 1,
>>     pkg_id = 2 '\002',
>>     punit_thread_id = 0 '\000',
>>     punit_core_id = 0 '\000',
>>     punit_domain_id = 0 '\000'
>> }
>>
>> The pkg_id of 2 leads to the bad reference.
>>
>> FWIW this change has been tested and resolves the issue.
>>
>> Let me know if there is any other information I can provide.  I will
>> be
>> out of the office on Wednesday, so response may be delayed.
>>
>> Best,
>> -DA
>>
>>>
>>> Thanks,
>>> Srinivas
>>>
>>>> +	if (!tpmi_domain_is_valid(info))
>>>> +		return 0;
>>>> +
>>>>    	index = info->pkg_id * MAX_POWER_DOMAINS + info-
>>>>> punit_domain_id;
>>>>    
>>>>    	guard(mutex)(&tpmi_lock);
>>>
>>>
>>
> 

