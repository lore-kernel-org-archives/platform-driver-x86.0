Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC74D2D46C0
	for <platform-driver-x86@vger.kernel.org>; Sat, 18 Apr 2026 15:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776527377; cv=none; b=XsqJ6PxHp6CDDuoupmB1fac+GC5xM8VpW9DA2AW4D1/hLgBrSzhBFL9FZouy77eG55ytDulH5JmuEnVnbg9pPWK0n05bAVWqr60xBHDeo93RzE1a+gePKX9EFh2+CjQZ1beTH1Ne9w7KkJI6Hgjyf2C2zaQ7bRGmNMSU7OZ2WNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776527377; c=relaxed/simple;
	bh=Gc8LUIqFDOPIShSqQaDRlUqcJQ5FSr3KzP8QMFZFNnk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZnEKnAfJmule02i1+gBoKnRTAAGPRk+24f8t5mLMnCKpUlazD82QAn2Ir4vz+710DppTdOqmG0vIhatzExNpgtqH1soG0TwO+iuTpXOx0AMf2r4UBa+ZTGtULgYpV2QZRtLYwMRx9cZ7y82v1UHK5o8aBnh8rZ7OfNZCbgOATHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QLJghVJJ; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QLJghVJJ"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2b45cb89f7eso12881725ad.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 18 Apr 2026 08:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776527375; x=1777132175; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=rrPn6UxPZBxRpYnhQkSmTP0wa8nccH72Tby/VYHj/MU=;
        b=QLJghVJJ9Tj+LDPbuiqiN9dck+nTMLMoO4bA+Q0scNRJw526h6uwmTnRIKFpnDehEd
         t1Er/c1J/vSDJQHSI2puphSfb+5oPb7zRjQcJ68VBQju0Rb2mh+5tTftnpr5cm7s4q94
         VW38jd6B0FMQpsJCmV2F1Qe9CjAwmheqo3OlKydLHuQOHiBGSLLgROrojc4CsnxVkP4o
         mcQFzbnjNjjNOrcE8mQ5cuA9B5puwckP7JvmChBrnc55otAAFyYbc/wmvxTDIqll70Nn
         0TQzPmHz6sNjkpq0YMZGyYu44xXGIFSym2VDYeP5tilvzrqARk//nGPNLXdJB44RXQPu
         XnHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776527375; x=1777132175;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rrPn6UxPZBxRpYnhQkSmTP0wa8nccH72Tby/VYHj/MU=;
        b=GNF7enwulFVemG4gXmQ0GoZBcA8srJuTySRAjjUWSzVoIhe89lffF72TSNBO/Drt8X
         NlEcRmvmQv7+59asQmLZgrm3zsrndjAOvvJI1IkRpRbwmT06l1sOz/k/al7RyYm06qSd
         urqhJWUFx45Qze85XGK/e7TB2uwfao9LD3OQ4BrUUvLqv//TFuqNOBQCjWF1bLsh7Vkm
         udukr2/+nZSMrPwQqUyiYU0wh8CKRmPKUAzaNTPXX1itHJ4ErugDZY2RYcA9bPkU3Z/P
         oKcx66p/mj8kmEqRgILcWV5MhOqSLnoKuhgTe2s0JdwRqRg2ui3AlEmPJ/QpBWgpGMvT
         LkUQ==
X-Forwarded-Encrypted: i=1; AFNElJ8dpyX7CuX6SgIf/JJPQBVYYm16lImizLfiqGmGVdUW1YHFAFexxcv5Noym9kutF+2qJPA+b73BNdtKvlh+U4HqLYUb@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0rpK4vXOAvz+lO1H6Q5GpU0N0iJQqoBmrkmQyiPZqp4VvhBkz
	yeHLIK+VZic0izudDDnBNU9p0Y3/N+lhXXB6YBv21XTL6qN4VFFc+Bpf
X-Gm-Gg: AeBDieu0/Rz+30B36Q97FEV5ywsFfW4Ui+23ABUXzDjzKurLpF+KISCa3d6p449JZcf
	yJVCAmX4Y6mK1HAwS2AqMVPasMw4VFr396Px63vuo3sSddH9YnLkuLNfxYI381A3V0ea7CXerIk
	fakSBpUnS3HdwT9qzPjaHcjP6n/AbKmihx5Id72xjNfZpp5220pnYeA58afE5iiquvJ8QpfWyqk
	43Y+6Cn7MScYNFI/y8i2NjnQDql92OjmOPwrVl3JmFoJHN4Mk7kr3lTQ9CwaLBCHKf4jgfgtxdF
	i2Ho9SAs40sBDt6KfuIgGPFw6jiIxoAg4GaycH/NAuwPAXnJUsEoLcictD0x5nlIBuFfzSrcecd
	y4izDEZ/aaAUeVfZvXQkawHm0DDTY/hTLR7VSBLdp8GB3M2uXXRcrP4QUxSI6WYpzgriFA6enkE
	UQ52mtMLs1PaF3zyIL7LcuAw8befDfBEDlhdeq3WbQ/YyjzokNTYSKG4cOjv0qBnEwoYtO+whs7
	O7jg0SckyE=
X-Received: by 2002:a17:903:2f08:b0:2b0:7d3d:756a with SMTP id d9443c01a7336-2b5f9f64c9cmr81119105ad.35.1776527375158;
        Sat, 18 Apr 2026 08:49:35 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab2112csm49261195ad.62.2026.04.18.08.49.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Apr 2026 08:49:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <7fa7d4dd-7b05-4af2-a8da-6e605fa91f90@roeck-us.net>
Date: Sat, 18 Apr 2026 08:49:33 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] hwmon: (yogafan) Massive hardware expansion and
 structural refactoring
To: Rong Zhang <i@rong.moe>, kernel test robot <lkp@intel.com>,
 Sergio Melas <sergiomelas@gmail.com>, Jean Delvare <jdelvare@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-hwmon@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, Armin Wolf <W_Armin@gmx.de>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>
References: <20260413060931.31091-2-sergiomelas@gmail.com>
 <202604180539.EuswNnjG-lkp@intel.com>
 <b876cbcce7763041d93f9cad28b8aa4cac0a001a.camel@rong.moe>
 <fed0feb4770f7fab8d4336eb349d8703839e8ce4.camel@rong.moe>
 <27b467c7-7ca0-4198-b4ea-efb38f2ac787@roeck-us.net>
 <b70674d5a2152ed6123966f96acbd2872518a6f1.camel@rong.moe>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <b70674d5a2152ed6123966f96acbd2872518a6f1.camel@rong.moe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/18/26 08:14, Rong Zhang wrote:
> Hi Guenter,
> 
> On Sat, 2026-04-18 at 06:49 -0700, Guenter Roeck wrote:
>> On 4/18/26 04:23, Rong Zhang wrote:
>>> Hi Sergio,
>>>
>>> On Sat, 2026-04-18 at 18:31 +0800, Rong Zhang wrote:
>>>> Hi Sergio,
>>>>
>>>> On Sat, 2026-04-18 at 05:37 +0800, kernel test robot wrote:
>>>>> Hi Sergio,
>>>>>
>>>>> kernel test robot noticed the following build errors:
>>>>>
>>>>> [auto build test ERROR on groeck-staging/hwmon-next]
>>>>> [also build test ERROR on linus/master next-20260416]
>>>>> [cannot apply to v7.0]
>>>>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>>>>> And when submitting patch, we suggest to use '--base' as documented in
>>>>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>>>>
>>>>> url:    https://github.com/intel-lab-lkp/linux/commits/Sergio-Melas/hwmon-yogafan-Massive-hardware-expansion-and-structural-refactoring/20260417-063319
>>>>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
>>>>> patch link:    https://lore.kernel.org/r/20260413060931.31091-2-sergiomelas%40gmail.com
>>>>> patch subject: [PATCH v1] hwmon: (yogafan) Massive hardware expansion and structural refactoring
>>>>> config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260418/202604180539.EuswNnjG-lkp@intel.com/config)
>>>>> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
>>>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260418/202604180539.EuswNnjG-lkp@intel.com/reproduce)
>>>>>
>>>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>>>> the same patch/commit), kindly add following tags
>>>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>>>> Closes: https://lore.kernel.org/oe-kbuild-all/202604180539.EuswNnjG-lkp@intel.com/
>>>>>
>>>>> All errors (new ones prefixed by >>):
>>>>>
>>>>>>> drivers/hwmon/yogafan.c:712:6: error: call to undeclared function 'wmi_has_guid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>>>>>        712 |         if (wmi_has_guid(LENOVO_WMI_OTHER_MODE_GUID) ||
>>>>>            |             ^
>>>>>      1 error generated.
>>>>
>>>> Hmm, that's a bit troublesome. Usually we should have been able to
>>>> declare `depends on ACPI_WMI if ACPI_WMI' (new syntax since v7.0) or
>>>> `depends on ACPI_WMI || !ACPI_WMI' as an optional dependency to prevent
>>>> such an issue, but there is no static inline stubs for !ACPI_WMI...
>>>>
>>>> I'd suggest declaring `select ACPI_WMI if ACPI && X86' in Kconfig as
>>>> some drm drivers do, at least for the time being.
>>>
>>> Of course you'll still need to guard the wmi_has_guid() checks behind
>>> `#ifdef CONFIG_ACPI_WMI'. Just forgot to mention that.
>>>
>>> Hmm, in this way `depends on ACPI_WMI if ACPI_WMI' should also be OK...
>>
>> I don't know is this is a misspelling, but `depends on ACPI_WMI if ACPI_WMI'
>> doesn't make any sense.
> 
> This is the new syntax for optional dependencies since commit
> 76df6815dab7 ("kconfig: Support conditional deps using "depends on X if
> Y""), which is equivalent to the old-fashioned `depends on ACPI_WMI ||
> !ACPI_WMI'.
> 

Hmm, interesting. We live and learn. Thanks for the clarification.

Guenter

