Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE24D31ED84
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Dec 2025 11:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765883712; cv=none; b=XlEArb0OkicXN2nKK6J8SWzFRxE8i2YPgUJuZq1moM5PLyoyguXa5Z/wFH+accRO64PvQLGbRjUHUkVZLcGsWIIqgsS/kuEF4F3rXgGEbcDpijW/GOdnvfsVur0uuRkJ4E+GD22frDljt9vyyr/odrNcXYGGDr3yM2nKe7Y+/PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765883712; c=relaxed/simple;
	bh=BBwbPv6peH1O5d0/RsOUMDxJe6Kt8Lw20gPkU3Haqeo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rM3T61p5K0Px/1vGdZCOQaeN1ukeUX1Gmt/RBf4AcnAFmRELIttfDgi9Uk5l5Y9MRd4nIYG0gkSeFtoMKPZX6iU6Eya9mQVpb2ydjXhWfKImKmdvES8cvESt/SfaVLx31G2nd32a66eoYrnDBOLIrwTpzZ4rNCfz5Gt9T1jq5cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ib1O4mXK; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ib1O4mXK"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a0d0788adaso21700425ad.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 16 Dec 2025 03:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765883710; x=1766488510; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pa/R0f7apMOn2D0iStNavYUHvbbAQjxSO588dE4NM9E=;
        b=ib1O4mXKacf474w94H+zYreBgwPKjJ6LlYy8yhzm2ElNJIKINZlZQSl18Ly1f2ytFl
         FGYQLMH26oXlZ9V7gc/d7b5zjGwL/lq7yj+UrI5j8fmmKYNrhwyxoNw7SqVOsp3oP6S9
         KAAbHgO4wjsu+AZCawygSbGH3tWV52oElIcd/8WwnRhWFVK3ZeTKlo1q/+d04/ZaDecI
         YbBL4OmUrMDeTrDuegWS7/C73Empx2qLJMc3r6P8p3QH4v8Rgi1EfwckdVWWxzErw/TX
         NF7Cxl6FpH4pxKTYZqjrxBiIob4/ZV1tc1YH3fIqJU0kYtpzHepkWKw192DlHLYtyzck
         C5wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765883710; x=1766488510;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pa/R0f7apMOn2D0iStNavYUHvbbAQjxSO588dE4NM9E=;
        b=jiu8tIzpicwkREO3S61FNbhN8neAaCwL6+FlZ1S3kntVp/l5Vd78pNiW+YULRG4HDN
         AlWhwGS3mLF6kO0zgOzRPiHIsqQGRDg0pQLANXwBXcNynl+me7SvEZw1KqSEvGnlcD5N
         ANum5u/eftazwk0u0okdUDR6WBGF3ErSz3onWlNLrwMf4M2yKalsBbwWydaFziGnB0o6
         6h8pfsZItbwOeilFr51/hOa+mHqn8hPz2sx6oK/6BgDe3G7RBI92gYH8MwPXPLhknOVH
         qx8NAfpp/T++ji9Z9uRGXBT9ZxQ9rQJjkSIgxYk/TEEVd/zbFAt+QR2CJ1053Fikj9K4
         zA6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXduEvyCFMH+lyNzey5pHcYQMQh+u/hiDLOlj4YL9WL1a5eauaS9ooG7EpjGct0fLLzxZFDwQUeCJ4j3/cSSP8iX9aG@vger.kernel.org
X-Gm-Message-State: AOJu0YxJQtMwYYEcQ4w1ckbRs/G9Y13uiO8D+YkSNCNfJfkCcR1NjAYM
	4aSRTL1uvq9tTzAfWPULouwtc6y1z+ZBwYxl5upE35q8uqZPniGHoQiv
X-Gm-Gg: AY/fxX7KZx5DS2iNkOpCMAqq3OgLXmkzaCmnGLWoU2oQvHN/g3thFIL9BbCeFD1pT17
	0jRV4Y2c2Q6fv3WR0oWUsISuEkvJRd9P2wTEupQKAvL+RIa6uptSxRnng/SB8f3ok8FPQO0r0e/
	cwXgHJdwj9leVz927ZZRhT0XxMBO9yKnXWhKDok4UrXftbidqVFdG5lbYmP2ntsdStrbo0nRtk1
	Wyz0GIG9ZcUFAGAPqfJIZMgZRy/E5DsvFQDXNSltokMVdiR6dZYjO2XcIgPrTsO6jb42SPURswX
	V7r/oM5WxvsaWrkNHd4j7kvnAB6nSodxj8UbCCJxwseEOSAqUzYTAoL54sI/D4+3+ag+sRvLIEG
	pTgOeVsGdaaZYJeI4q+Ge6LbZR8Cwf6s/dtn9aspUgAAmleozGh7Fw8hFqK+RZzfCxPpSnJTk0R
	f/Fq2885FoHy4lH5Mxpf5MyV0JWz4ZB6b8ZF41E1EPeH0EAzA+Ks0MzzaVag==
X-Google-Smtp-Source: AGHT+IHjShZlqtrNatz0TeEfKLc+IYxMG7B7LV4mS/9omwYiNMA01BR3glT4ouu8CwPVBZrnNUvMwQ==
X-Received: by 2002:a17:902:ec8b:b0:29f:251b:c9d7 with SMTP id d9443c01a7336-29f251bcb21mr121735895ad.12.1765883709679;
        Tue, 16 Dec 2025 03:15:09 -0800 (PST)
Received: from ?IPV6:2405:201:3006:188a:9344:a089:f162:6625? ([2405:201:3006:188a:9344:a089:f162:6625])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29ee9d38ad1sm160754585ad.29.2025.12.16.03.15.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 03:15:09 -0800 (PST)
Message-ID: <1ca74be1-7b4c-4a38-b507-f320104a7a60@gmail.com>
Date: Tue, 16 Dec 2025 20:15:04 +0900
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] platform/x86: thinkpad_acpi: Add support to detect
 hardware damage detection capability.
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: kernel test robot <lkp@intel.com>, Hans de Goede <hansg@kernel.org>,
 oe-kbuild-all@lists.linux.dev, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, njoshi1@lenovo.com,
 Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20251210151133.7933-1-nitjoshi@gmail.com>
 <202512160219.94nMjvxO-lkp@intel.com>
 <213b3f29-09ee-4305-940b-89d4652101b1@gmail.com>
 <2433802f-ba32-1549-41f1-5a77e998c139@linux.intel.com>
Content-Language: en-US
From: Nitin <nitjoshi@gmail.com>
In-Reply-To: <2433802f-ba32-1549-41f1-5a77e998c139@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/16/25 19:19, Ilpo Järvinen wrote:
> On Tue, 16 Dec 2025, Nitin wrote:
>
>> Hello ,
>>
>> On 12/16/25 10:19, kernel test robot wrote:
>>> Hi Nitin,
>>>
>>> kernel test robot noticed the following build warnings:
>>>
>>> [auto build test WARNING on linus/master]
>>> [also build test WARNING on v6.19-rc1 next-20251215]
>>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>>> And when submitting patch, we suggest to use '--base' as documented in
>>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>>
>>> url:
>>> https://github.com/intel-lab-lkp/linux/commits/Nitin-Joshi/platform-x86-thinkpad_acpi-Add-sysfs-to-display-details-of-damaged-device/20251210-231409
>>> base:   linus/master
>>> patch link:
>>> https://lore.kernel.org/r/20251210151133.7933-1-nitjoshi%40gmail.com
>>> patch subject: [PATCH v2 1/2] platform/x86: thinkpad_acpi: Add support to
>>> detect hardware damage detection capability.
>>> reproduce:
>>> (https://download.01.org/0day-ci/archive/20251216/202512160219.94nMjvxO-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version
>>> of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes:
>>> https://lore.kernel.org/oe-kbuild-all/202512160219.94nMjvxO-lkp@intel.com/
>> Thank you for reporting this issue and I will fix this issue .
>>
>> I have already send patch v3 for this and will fix this warning in next patch
>> version i.e v4 .
>>
>> May i know, if its OK to add this Reported-by and closes tag in patch version
>> v4 ?
> Hi,
>
> Please only add those tags when you're fixing code that exists in a repo
> already. For new work, we don't normally add lkp report tags despite the
> email suggesting you to do so (I know it's a bit confusing but it's sort
> of same as we don't normally mention all reviewers who gave improvement
> suggestions either).

Noted, Thank you for clarification . I will send next patch revision soon.

Thank you !

>>> All warnings (new ones prefixed by >>):
>>>
>>>      WARNING: No kernel-doc for file ./include/linux/pci.h
>>>      ERROR: Cannot find file ./include/linux/mod_devicetable.h
>>>      WARNING: No kernel-doc for file ./include/linux/mod_devicetable.h
>>>      ERROR: Cannot find file ./include/linux/bootconfig.h
>>>      WARNING: No kernel-doc for file ./include/linux/bootconfig.h
>>>>> Documentation/admin-guide/laptops/thinkpad-acpi.rst:1581: WARNING: Title
>>>>> underline too short.
>>> --
>>>      Hardware damage detection capability
>>>      ----------------- [docutils]
>>>>> Documentation/admin-guide/laptops/thinkpad-acpi.rst:1581: WARNING: Title
>>>>> underline too short.
>> Ack. Thank you !
>>
>>> vim +1581 Documentation/admin-guide/laptops/thinkpad-acpi.rst
>>>
>>>     1579	
>>>     1580	Hardware damage detection capability
>>>> 1581	-----------------
>>>     1582	
>>>
