Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E92D4CB46
	for <platform-driver-x86@vger.kernel.org>; Mon,  4 Mar 2024 14:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709563169; cv=none; b=sucdQkkJQYMqW7El3UWFuFMYcF8JFpVjONj/9YgDO4ihsUw9Fcfl+jKV58CKNARmQEiOmGuwFcKPST3tYib1PxpwOpYaYWMHs9XsodWwUVksff7jDKjD0fvcaWJjqKRK7VRqQuKD94DNLBWTcRE0MJMjp7ZxdV0VHs+BdyS3jTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709563169; c=relaxed/simple;
	bh=Mqr7Wc6v/MxtXApQoaGFLvngt0YqNrepdLjEjMG3fNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NM4Sb4tgQ6GidN9OI0ZgbrMs4YrIt9tJSieihRchibdxfAewqtmWdSZjQvwgu07G3UcCd9aqFdF4bbexM5Ovf/xgwgm5juXYL34RyaqTzaHIOmT5C1S28RzJ2RttTOrRfgc0HBNzlrHp8xt+aiJr6zpG4IyGfE9wbyY4LshlNMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F/XWFXxr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F/XWFXxr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709563166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LGbz3r9je+q9MSse852hdDSPPU/NaMNK+IP0oEC1auI=;
	b=F/XWFXxr/ilbpfhS/KIDDcTTjsDCn/77Lv8stDugFS4TsSKEtJqIMbQz4DwjiAIW5GhGoe
	MPwneVqFc7uozpjd0AbX47HS3XnnPkLB7+O8LMhOLDWqj4wRsaK+g5KCk547bQQtoguYOI
	RwiG06Q+JmO65+gU5EJdsV66JAiSjPY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-474-tYTaLUepMpy1Q_cXIUEkvg-1; Mon, 04 Mar 2024 09:39:24 -0500
X-MC-Unique: tYTaLUepMpy1Q_cXIUEkvg-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a448cfe2266so347316566b.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Mar 2024 06:39:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709563163; x=1710167963;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LGbz3r9je+q9MSse852hdDSPPU/NaMNK+IP0oEC1auI=;
        b=hD9JWYDlG3qLXbmJez9OECDzNuFF0Vpm2df6ruZPXrFWCeo51wJKXcAb3BXcEHKSfl
         EhLD5KhWdZuO81VsI9pkzdapXaMCEcDNjWGG+WC54LyeYVESqFt6ekurFDhYtdZZP8M6
         oWQqvkXGskSVXqdcXXjIFZOVHYJPTf6HKrU7VdM2VT81e1koTgsNmVlgCnCgzeV1o55R
         qdIu73enK5UeLjN7ugb6RR0fTZhUn19yZkof51woENatGjBkckwEPKWSxvrHsDdPoBIS
         YafUzuDAG5t4WRydz2b/yJmCOdf0+eAT81cerf8EDOZksbFlWRZERARhvFuNd5fRvzR9
         j/7A==
X-Forwarded-Encrypted: i=1; AJvYcCVMf5yaqHOjWg0MeVm6mUyeOu+/4vqXj3z3KNIDpj8OQEU6t0no5Ec/qm6S8MLDy+Sg/BHa+EH/TWLGb+C5WFqW7Qbwh2G5v+MEQnktBEMQ2o+hiA==
X-Gm-Message-State: AOJu0YyJYN14/pzkxxiXVGsOLjmh+0O7BTNUr8mxQWhuE0DFJCKt/Mb6
	AXj0rOj3kfpsfMVTUuentfw6DuJWfzpUo0EY6S3hSBDFW/5NECOkeRDJ+jv2rPOc+ey9N1wuOef
	SOG60gTeJhp5PsUZj5R69g+z5gEQ57831ZPCfaxJhOD/xo9Qd+/U5J+zwWRsO292TsmYZByxEcZ
	9OR0A=
X-Received: by 2002:a17:906:c49:b0:a44:1e32:a503 with SMTP id t9-20020a1709060c4900b00a441e32a503mr6298733ejf.22.1709563163396;
        Mon, 04 Mar 2024 06:39:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFS0Ob5o52VBAGcvvKdZiOSgVZJiIMcD6oyjC9ZQBXHZgVAHpJdE46bfrJ+nFtEMdtQkpSunQ==
X-Received: by 2002:a17:906:c49:b0:a44:1e32:a503 with SMTP id t9-20020a1709060c4900b00a441e32a503mr6298715ejf.22.1709563163068;
        Mon, 04 Mar 2024 06:39:23 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id m26-20020a17090607da00b00a441ff174a3sm4928776ejc.90.2024.03.04.06.39.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 06:39:22 -0800 (PST)
Message-ID: <e6f4dc89-935b-4030-828e-95b2dba54602@redhat.com>
Date: Mon, 4 Mar 2024 15:39:22 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: p2sb: Defer P2SB device scan when P2SB
 device has func 0
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "danilrybakov249@gmail.com" <danilrybakov249@gmail.com>,
 Lukas Wunner <lukas@wunner.de>, Klara Modin <klarasmodin@gmail.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
References: <r6ezdjqb5hz5jvvaj2beyulr2adwht2sonxw3bhcjdvwduyt66@2hlsmnppfsk2>
 <7935add6-a643-43dd-82a8-b7bcfb94d297@redhat.com>
 <6sbllfapnclmu5sjdtjcs4tyzkkr76ipg3i3rtqyyj7syhtkwd@d2l6zq2co7zt>
 <a5dac02b-c16a-45d1-8157-0dae1b034418@redhat.com>
 <d6a95bd9-dac2-4464-af84-9394a36b7090@redhat.com>
 <2c3gyhvwncqgfa6t3tb6fj3fk3nkbzpmlgfyzwjgwmmlnhxssu@d25ihdnpwado>
 <8afa1f78-8b89-4bbc-95e5-35eea76356e4@redhat.com>
 <ZeXWLVHxOAZCHoJZ@smile.fi.intel.com> <ZeXX37B1xT4bt018@smile.fi.intel.com>
 <3cb6a678-e1e6-4849-927c-5157e269b9c0@redhat.com>
 <ZeXcJfXnhkPQ6M8J@smile.fi.intel.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZeXcJfXnhkPQ6M8J@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3/4/24 3:35 PM, Andy Shevchenko wrote:
> On Mon, Mar 04, 2024 at 03:24:58PM +0100, Hans de Goede wrote:
>> On 3/4/24 3:17 PM, Andy Shevchenko wrote:
>>> On Mon, Mar 04, 2024 at 04:09:49PM +0200, Andy Shevchenko wrote:
>>>> On Mon, Mar 04, 2024 at 02:59:57PM +0100, Hans de Goede wrote:
>>>>> On 3/4/24 1:13 PM, Shinichiro Kawasaki wrote:
>>>>>> On Mar 04, 2024 / 12:04, Hans de Goede wrote:
> 
> ...
> 
>>>>>> Thanks for sharing the insights.
>>>>>
>>>>> Looking closer at the actual unhiding I don't think accessing func 0
>>>>> is the problem. The unhiding is always done on function 0 even when
>>>>> retreiving the bar for function 2 (the SPI function).
>>>>>
>>>>> So taking that into account, as mentioned in the bugzilla, I think
>>>>> the problem is probing the other functions (1, 3-7) by calling
>>>>> pci_scan_single_device() on them.
>>>>
>>>> So, why we can't simply call pci_dev_present() on the function in a loop?
>>>
>>> pci_device_is_present()
>>
>> That takes a pci_dev as argument which we only have after calling
>> pci_scan_single_device() and the calling of pci_scan_single_device()
>> on some of the other functions is what is suspected of maybe causing
>> the issue.
>>
>> Also it is likely that if pci_scan_single_device() is actually
>> a problem that then what is a problem is running it on an actual
>> present device.
> 
> Which is weird. But okay, let's work around first the real issue, then
> if I have time I will look into datasheet to see if there is anything
> special about P2SB device(s).

Note atm pci_scan_single_device() on one of the "other" being
the problem is still only a theory!

It is also possible that pci_scan_single_device() on the P2SB
itself is somehow an issue on this laptop, since on this laptop
p2sb_bar() is only called for the SPI controller, so before
the caching to avoid the deadlock issue pci_scan_single_device()
was not called on the P2SB devfn itself.

Regards,

Hans

