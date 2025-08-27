Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F17D20B7EE
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 Aug 2025 01:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756258784; cv=none; b=dPkutD6qpwMTo8mFaOlqQb73HkgdkNKJpDwvn2oFbIOC+5jfhHp1w1/W3EN0KMhJeTERHRhkKq0Zz8JJIDl47inijLz3rcB27z0HebHrzYpcBNqsmEeGcFTNPIWEjQ9xiSeI6W6sFssCTBgMrWSd5QINshHiuVqzVNId6raKheM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756258784; c=relaxed/simple;
	bh=jeXU9Xe2Dmb1wP26RAr3Ldy7ZqHCVmQ+ybFc53+N3no=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SQmPf6tkxDHycnDgHjhlZHCTI93Cr6XX33VYK/3hqlDJsppl4orck/OFi9kNM0RBcFiVlcbntB6/yzrQAlJtWZMij7+HbUoEgr5ZHHiEhr+XOypEvANu+vyaD3CacA1IMG1NgPXPyFSxoHBzoNd+B5Ze2J2+861YMN0t+S+EULU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZmTqjR3C; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZmTqjR3C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756258781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UQY2nkDeqTs8gqhNvNe1w77H/ik2M+Mc0ECiwRbonJM=;
	b=ZmTqjR3CsG2rBA95f239p7dWEHjw6aHmp3jkMJ5FxDW+gUJPj4XuQeViOW4jk2Kd6knQfJ
	Px6aAbUvZvjrO4hkwzDd7K3HdxeiCa4VOrXQ4idSyfgOYo/ne+1RC1VKKo65yKcQAcZvcs
	o7RzzfFPsPHgEbcKavrWZu5rPf1zRnY=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-25-FWmTMrYzM26TeSIg_IBQaw-1; Tue, 26 Aug 2025 21:39:39 -0400
X-MC-Unique: FWmTMrYzM26TeSIg_IBQaw-1
X-Mimecast-MFC-AGG-ID: FWmTMrYzM26TeSIg_IBQaw_1756258778
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-72009b20933so41725387b3.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 Aug 2025 18:39:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756258778; x=1756863578;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UQY2nkDeqTs8gqhNvNe1w77H/ik2M+Mc0ECiwRbonJM=;
        b=UWn8MmUtDh1BkqlYqZQmFJpt13oaM4jGBL3dNRkAP5jQHuQPRTtgapaLpt+F/Dd4iQ
         8uUFDzzVg56IKYdsEjhAZ+XC05FdWyU9+eElG7ySAoyJyIK6ZOPwtF2yhE17a+4lZv4e
         LCkvACDo27KlG3mrTioDscW58hm8NH0WZjtngg6exyFUqhP+ofsZSEoPLohQBhBNTKjS
         NDs6+HXVyWpl0m2piUN5Y11b6QrIneF/Ztyy36vzbi+1Kv4VcBxG0pcH07Pi7FAwnNeg
         1/MhYl3U62Jj4RsjKYIwvIqzomASV07uL6CsvZ/sf18Q3MjzZfcz6W2eXsXylNaxACaO
         L6AQ==
X-Forwarded-Encrypted: i=1; AJvYcCXovTE7r6bVL65CEmWGccRcA2oR98pFaKWCggjIUNZPbSJxbdBNYfwnDwuJRmkvTwSY29rvtsIN4wlpUloCpKwDy0m4@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7ga5ozCE2Ts94hj8sc5pJoq+++h7c1BiYybUQPCDSeto2l9uT
	4wnlMVmEyVtq5uUcfwj2a/p5UmiY9Ey7Zlmjm+L6sN3lh504+fnNmniZKz/5ogI4PzT2okg6Dbk
	eyaZG0Z8MCmJ/JBC68fy8o3/WJvBXyIkHxqg24Q8S4kURpuM1Ioek6/jSu4f1tlUt7jny9vFtm8
	M=
X-Gm-Gg: ASbGnctGfei6+cKDU6KhYAf+IfhuMQn53tVJFv3i2qOftOYdpjLbthPAMuBkZBAM18P
	b0cQcSxZVyubTOIrM1Q0kl8hO0WSKJ7+BBvFocoJgB/uY5QHbQoLxidlYU8ZZROw8QAF5hqqft7
	ne7x27mxK0nMNHzByxAbBOtnLjW+PXaa3/Z6aBlWDJ0PqJ6A5cEKHTqx0PFmzga97CRCkCaq6OE
	FPOgCDbMf5Aeq5435WV293MhTd/qk/73x6P0B6wOCGrAyNprZj0qa8BnqTt1mX5MyvSiCylx/cw
	o/uJXhJa/ddZoVmaVOZsIby9dVn+9zj57L1EOMY=
X-Received: by 2002:a05:690c:6001:b0:720:5db:1220 with SMTP id 00721157ae682-72005db1a83mr109613467b3.8.1756258778310;
        Tue, 26 Aug 2025 18:39:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGONWuDrjLuuLZa+yt5heOLjkeEny8jaPwIVQrhlucUklL7r3XzH06NRj7GhdodnncpmGeeFw==
X-Received: by 2002:a05:690c:6001:b0:720:5db:1220 with SMTP id 00721157ae682-72005db1a83mr109613317b3.8.1756258777908;
        Tue, 26 Aug 2025 18:39:37 -0700 (PDT)
Received: from [10.26.1.94] ([66.187.232.136])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-71ff18ae99dsm28015687b3.54.2025.08.26.18.39.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 18:39:37 -0700 (PDT)
Message-ID: <adbc0e8b-199a-42af-a45e-cb3791923554@redhat.com>
Date: Tue, 26 Aug 2025 21:39:35 -0400
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
Content-Language: en-US
From: David Arcari <darcari@redhat.com>
In-Reply-To: <00466c7a41bd4a0120a7798318ac5bba8878ada5.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Hi Srinivas,

On 8/26/25 4:26 PM, srinivas pandruvada wrote:
> Hi David,
> 
> On Tue, 2025-08-26 at 12:43 -0400, David Arcari wrote:
>> Although tpmi_get_power_domain_mask() calls tpmi_domain_is_valid()
>> prior to indexing tpmi_power_domain_mask[],
> Because this an API call so that caller parameter needs to be
> sanitized.
> 
>>   tpmi_cpu_online() does
>> not.
> This is hotplug callback, which should have correct topology
> information.
> 
>>   In the case where a VM creates non-contiguous package ids the
>> result can be memory corruption. This can be prevented by adding
>> the same validation in tpmi_cpu_online().
>>
> 
> This driver is getting loaded means MSR 0x54 is virtualised otherwise
> this driver will not load.

I don't have direct access to the system, but this appears to be the 
case.  The driver is reading MSR 0x54:

drivers/platform/x86/intel/tpmi_power_domains.c:#define 
MSR_PM_LOGICAL_ID       0x54
drivers/platform/x86/intel/tpmi_power_domains.c:        ret = 
rdmsrl_safe(MSR_PM_LOGICAL_ID, &data);
drivers/platform/x86/intel/tpmi_power_domains.c:        ret = 
rdmsrl_safe(MSR_PM_LOGICAL_ID, &data);


> Not sure this is an upstream kernel or not.

This was not an upstream kernel, but I don't see anything in the 
upstream driver that would have prevented the access that is occurring.

> 
> Some comments below.
> 
>> Fixes: 17ca2780458c ("platform/x86/intel: TPMI domain id and CPU
>> mapping")
>>
> Andy already pointed about new line here.
> 
>> Cc: Hans de Goede <hansg@kernel.org>
>> Cc: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
>> Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
>> Cc: Peter Zijlstra <peterz@infradead.org>
>> Cc: Ingo Molnar <mingo@kernel.org>
>> Cc: Dan Carpenter <dan.carpenter@linaro.org>
>> Cc: David Arcari <darcari@redhat.com>
>> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> Cc: Tero Kristo <tero.kristo@linux.intel.com>
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: David Arcari <darcari@redhat.com>
>> ---
>>   drivers/platform/x86/intel/tpmi_power_domains.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/platform/x86/intel/tpmi_power_domains.c
>> b/drivers/platform/x86/intel/tpmi_power_domains.c
>> index 9d8247bb9cfa..ae5b58679e29 100644
>> --- a/drivers/platform/x86/intel/tpmi_power_domains.c
>> +++ b/drivers/platform/x86/intel/tpmi_power_domains.c
>> @@ -194,6 +194,9 @@ static int tpmi_cpu_online(unsigned int cpu)
>>   	if (ret)
>>   		return 0;
>>   
> Need some more information.
> 
> The only case this check is required if
> topology_physical_package_id(cpu) is returning greater or equal to
> topology_max_packages(). If this true in this case, please check the
> value of info->pkg_id. If this is bad then then some other places also
> this may have issue. info->punit_domain_id is already checked for valid
> value in tpmi_get_logical_id().

That is correct.  In the case of the crash we have:

crash> p/x __max_logical_packages
$1 = 0x2

static inline unsigned int topology_max_packages(void)
{
	return __max_logical_packages;
}


$2 = {
   hnode = {
     next = 0xffff9651bbc37010,
     pprev = 0xffffffffc0b7a640 <tpmi_cpu_hash>
   },
   linux_cpu = 1,
   pkg_id = 2 '\002',
   punit_thread_id = 0 '\000',
   punit_core_id = 0 '\000',
   punit_domain_id = 0 '\000'
}

The pkg_id of 2 leads to the bad reference.

FWIW this change has been tested and resolves the issue.

Let me know if there is any other information I can provide.  I will be 
out of the office on Wednesday, so response may be delayed.

Best,
-DA

> 
> Thanks,
> Srinivas
> 
>> +	if (!tpmi_domain_is_valid(info))
>> +		return 0;
>> +
>>   	index = info->pkg_id * MAX_POWER_DOMAINS + info-
>>> punit_domain_id;
>>   
>>   	guard(mutex)(&tpmi_lock);
> 
> 

