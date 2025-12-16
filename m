Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D742E7179
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Dec 2025 02:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765852161; cv=none; b=gCg1+Zw/s7O+kkny9ZZCA73p7StOEq/HfPg+4m0nkAMu9G261qfz3VUdmJjAm4+Q/7Y16bkeipEqogqy4WGYTUWGM1WpDNMHvPoqFK9G5OA+vJH/LFtxbvzohui+QhInA55DDAtTkR0ewjqC986LAIQpWheEuANEaA37WGtUHrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765852161; c=relaxed/simple;
	bh=rOrqIm5yzPZ1+NhY95GTbpe9uBI28/rzZu0uZZH7eQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XUZiD1B22o1UPSKSUU5iwd8/4ZPLhrYazq6MZb/taD02R63Fm8JamGKrB8MqwTowv+hNKLKMDmNYXbZN0WdGTRl3OyJESfm1MWKABOiJQ0pQdHe40CTRiGpt++NU11AARZkKag4+f07IOaSNe4xe6caHXOzTQiwDc03Bz7T8f/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DggoYs1T; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DggoYs1T"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7b22ffa2a88so3807788b3a.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Dec 2025 18:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765852157; x=1766456957; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ULCZYLT60MGMdje4Il/iRob/OFjJYM9zEb5HnG006jM=;
        b=DggoYs1TyMfhm+nbAQPx/+fRzpIJICqsZ82GQVkRq254C02uDjDdIw/xJc4R1d4WlE
         5TuVSKcxvDj8r6Dr3+w5qE/DGRqF4AakH3wDpu9uWGUGPaPoBi+SihI8XYOYG32FvDr0
         OilzLI31RF8YoMbZlJQHBX2yfxkk4utvAE1MER14EhULIu/48R+KxMRuo/j5YKhlwyz5
         UTf0GfEjwKw+zlS70P4Pkz/iubBj16sI7Y6b2EoMVCbZY4v9u46JXkXRY+97g/eOPo9q
         88XOLFFw2+EwwhGWoMdiFgesddHE065rroUY9bwKkF/W+NnCBPTXE6COg/mZcC2+FuvI
         BRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765852157; x=1766456957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ULCZYLT60MGMdje4Il/iRob/OFjJYM9zEb5HnG006jM=;
        b=bxdjROo2zZCPpTKtAfZJOrQnV4KVGwhOCrwCEh/MHVZsw6sF2z4yA7LOJUOI/ldYcn
         LspRv8cwNtGBFphifMbXRwdS8yWDw70tbJEJU9xNeUhUoecnX93noLRox4m34KqnVNWk
         ElsOVRZ4vjm0daKs6TdfiMe2+F4/S3sEU3KyfmyVhbYdEwcKuYT6xdR8yFkv+JH8m/WY
         wLKyhNWd44c+PlXOU0LBaOn6VMIr4Ql82RB0CsPOretJDO/nqdoM94HizJdSWOaO5erS
         7iiGqeklsPFiKCNE8weOjOHH96lAQCaPHPZyDtinA2XU6N1tqz34Bjy89tkaSyuQB/4e
         sn3w==
X-Forwarded-Encrypted: i=1; AJvYcCWb1RKE14OIv6E4ASCOu9+gfCzULZBjjjEf7k2ZfX45xYs/teDgMvTaE5UDwnvREoTDOHLTZj9ePFYZCAkYeVuhoX8U@vger.kernel.org
X-Gm-Message-State: AOJu0YzHxX2wuI1wWcauSbRpGskdQqAXlVvoNIo9TGnT7Qcq7EjtHL4k
	LFPm5hMWetbM1ev9Ob4D9pSgZ0nBUSH/06S4oudg5FV9CFeNl+3NEJIv
X-Gm-Gg: AY/fxX7GiLG02fks/byfZnNdksY5KZzcnIGmnn/TPGdWXwSutJnOvi/nIrN3pel1Tlj
	PdLW6WXFvyzxiE0btmIdYgKEm4VM1h1pznGlw9HY9ma0kRGe3pAEM88EXRpTc1Y6WoaY/5J39WC
	RuuzVDgVgKatL2dlYoTIp9VKpm7uShAPRvZydBweM24Y+uAFCls7I6oBJh0/kwRZMzWlzqSQ79H
	WL0bhyyQsWtqutTD8wScigNBe+vXlQBoylmbbxS9CPAGGKsmmQy66pnFJZDQTYcWV0LfO8UIcJw
	6Ex9ibX8rBgnxv47NVYvPLS2LBTdmPX6pUmEdzbOjUum7VzYm273Bcb30QWiCqXLMgBt9+SAnwP
	5X2U/oNsMsfml/Ou/qsQRz/a/Ulihzj6rkjh4g2sJFmPsJRsXsGaDJTFnIWIiK7Sayohb4iXVMI
	AEANUhV/ItaU/svNRBQ9ZGGAXMEj+CpOlbifKUUei/8+Cog6tGt593/WVacQ==
X-Google-Smtp-Source: AGHT+IErF52AXXczQ3G+zOFS94xkqOFP8m8C/Qix97CtXS0jSDK2TXzNwtk0REWI0YWm46bll4Yy2w==
X-Received: by 2002:a05:6a00:451a:b0:7e8:4471:ae79 with SMTP id d2e1a72fcca58-7f66a375c23mr11420246b3a.69.1765852157404;
        Mon, 15 Dec 2025 18:29:17 -0800 (PST)
Received: from ?IPV6:2405:201:3006:188a:294b:a829:99f2:e384? ([2405:201:3006:188a:294b:a829:99f2:e384])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c5093a56sm13807735b3a.47.2025.12.15.18.29.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Dec 2025 18:29:16 -0800 (PST)
Message-ID: <213b3f29-09ee-4305-940b-89d4652101b1@gmail.com>
Date: Tue, 16 Dec 2025 11:29:10 +0900
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] platform/x86: thinkpad_acpi: Add support to detect
 hardware damage detection capability.
To: kernel test robot <lkp@intel.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, njoshi1@lenovo.com,
 Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20251210151133.7933-1-nitjoshi@gmail.com>
 <202512160219.94nMjvxO-lkp@intel.com>
Content-Language: en-US
From: Nitin <nitjoshi@gmail.com>
In-Reply-To: <202512160219.94nMjvxO-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello ,

On 12/16/25 10:19, kernel test robot wrote:
> Hi Nitin,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on linus/master]
> [also build test WARNING on v6.19-rc1 next-20251215]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Nitin-Joshi/platform-x86-thinkpad_acpi-Add-sysfs-to-display-details-of-damaged-device/20251210-231409
> base:   linus/master
> patch link:    https://lore.kernel.org/r/20251210151133.7933-1-nitjoshi%40gmail.com
> patch subject: [PATCH v2 1/2] platform/x86: thinkpad_acpi: Add support to detect hardware damage detection capability.
> reproduce: (https://download.01.org/0day-ci/archive/20251216/202512160219.94nMjvxO-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512160219.94nMjvxO-lkp@intel.com/

Thank you for reporting this issue and I will fix this issue .

I have already send patch v3 for this and will fix this warning in next 
patch version i.e v4 .

May i know, if its OK to add this Reported-by and closes tag in patch 
version v4 ?

>
> All warnings (new ones prefixed by >>):
>
>     WARNING: No kernel-doc for file ./include/linux/pci.h
>     ERROR: Cannot find file ./include/linux/mod_devicetable.h
>     WARNING: No kernel-doc for file ./include/linux/mod_devicetable.h
>     ERROR: Cannot find file ./include/linux/bootconfig.h
>     WARNING: No kernel-doc for file ./include/linux/bootconfig.h
>>> Documentation/admin-guide/laptops/thinkpad-acpi.rst:1581: WARNING: Title underline too short.
> --
>     Hardware damage detection capability
>     ----------------- [docutils]
>>> Documentation/admin-guide/laptops/thinkpad-acpi.rst:1581: WARNING: Title underline too short.

Ack. Thank you !

>
> vim +1581 Documentation/admin-guide/laptops/thinkpad-acpi.rst
>
>    1579	
>    1580	Hardware damage detection capability
>> 1581	-----------------
>    1582	
>
