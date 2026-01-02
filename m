Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E7D1F0994
	for <platform-driver-x86@vger.kernel.org>; Fri,  2 Jan 2026 06:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767335056; cv=none; b=uQMiXbjhmM6GZRPMrC54qmT+C/TxRPeXvWFHm7SzLup7c0/25xYiajvWUjhegzIHZ4hGYDfzLeVedRxcm3WAWMnmfzGwOJMDALOiTVo8i90GR+wMSj3iq9JVtr7GJgjEsBZlQSHU7qkZNhq7GgNRFnm0zakDb/+80UL9h+XDTOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767335056; c=relaxed/simple;
	bh=9bzBfr08+IEmJIWG2LANqmJsICXXby+sd3q/EboRJNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GLtcpRB1SgxXXkH4rNVKFyjZFgXwPhWz94ludIvDAfqmSRN+RoFir8ygIyRwzlTiFu7CIqa9pedYGzXDrf68TfEp9PBDhCuhS8xE3HokokvLL0J97tZifKPhaIgxiI8TKbxhLbh61ZbGhQz7xLvlqOylidsd2vr0mOhLgp0MFPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WjFKMwoM; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WjFKMwoM"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a102494058so63768275ad.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 01 Jan 2026 22:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767335055; x=1767939855; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JFvH9cy/X4mqt+/CowADnADDmqYUegocrS0ZIjaaLkE=;
        b=WjFKMwoMAIrwZ0D/7p6MMBj9NXEctWvspPOqlr+0awj3IazHU8FvUl3Nldkoga/12K
         eXY8l51ia++JlkKPPRgc0QfnWi0LWi4AAmL2y27NMPRMck/qDpNGK2rzVVeNv/1GBKtZ
         aJrHgnImq/WjS6g8rcGhfgztl1OGiAy4U4yGpw3TFy95pNeTe/IhF6IY5vh3okYqwjRR
         tDp05WW+nm8VvaUvoSCR2r98lq2W6I03ZdOtBR6wK5I8+lZRHKpTEAKGApb9fKX8MY1m
         RV4WPIyESKSMHcTP6doth76URkn8crVAmKRp+OSFMErrnXYIdixukQT37o3Y+f/RMalq
         wowA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767335055; x=1767939855;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JFvH9cy/X4mqt+/CowADnADDmqYUegocrS0ZIjaaLkE=;
        b=qirMzZ/L4mk+msl5cf4qTuL+2cKEAbbphtId/bqetQ5DWCXegBFT9ID2mghX2Q5CMv
         7UFATy5iNVscofoICquCyRWhSTII9PaP8y+NQZGP5Bw5P2DxRcglIMhNPq+zrYAVQvuf
         7CqbL9Qo8Cur0CyVDYAvB822XEi7AZIGbByj9Q6/N7dh9nvR1ZJ+NAwRp9tpQB3sFxQY
         50UlBJtkorOfTF5C9QjEOxAXuxxLrMQaiYLquEStoasT1jpo8BT+yoxOpXfo6glpDDXP
         1Zm5F0QD5IGxCfoky3aQOnW4hroVSDnTsWvuG/l1K921NaEWDSOoXJOi31GdNRRpuOf6
         hJEA==
X-Forwarded-Encrypted: i=1; AJvYcCUPjcPXeLqmFCuW3++1Sh5msZ9Sfn4vC1KwiMVEa8SB+5l9upSYqqQKPToXtO1SzPiqQUyeCDbnD8Wihcodw0QJrwEf@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3HHhPcmTHS3GsInLDyPv7lSfqcNIS5zso7GkK6brSnPfPuevE
	dK5NUZNHgCk6Ft3THhqZZERN1Qn8Zgzph0ALwqQelo3+bUQtqBl/9jbJ
X-Gm-Gg: AY/fxX7NUvYCgwNhlG395+PU7nHvXwKJD1+ULLdJxkR2PHPpBZcb86tMNFsACFAff2r
	M96vP6YfF+z0/JdB5wTmNn9kyJeRHIMwbvROs8oWnb8qZnsLFUJebjZt9IY11SvyffJcUrGOH2t
	EMJ7Dgtk0izn0F8lUZ8ZNBUwCLcosTmCNliG8qa9194zlG12y4kS4zJxizt9BiMne+RQYTeSqBz
	llzd1rh/xGi/Z2W9eBN1AKZ9T37FYY+IkdDbP4PFLBuYizfec2hCVkJWwKzwwFVFW4DayM3hg9E
	tZVUyjnakx0DFMfbMGJqK1WgxZPH/KcrqQPnah6wSjrzp/fIV1JRQx2q9om6TdyMemZiqErpLk+
	7MHnnqXgQP3tETCsmzm/lN5l6PNuuMG8Jwm30Hh7Wqdgd7T0g8OWvsjZZEPsSKYnoRTC3wsUS/S
	fmiCfxL83GKBEZAyqWUpRVLz/0safzxHQwj9EuYisck35BYKSBd2hyNTe6XQ==
X-Google-Smtp-Source: AGHT+IHh5cgnSpqzJNtUeuHqvA6rCUFv1c/TWLYJNLF9apl2tuXdiNWTogRCm+O7QnCBDGYusCBZhw==
X-Received: by 2002:a17:902:e785:b0:2a0:93e7:eba with SMTP id d9443c01a7336-2a2f0d5fea4mr417666295ad.30.1767335054665;
        Thu, 01 Jan 2026 22:24:14 -0800 (PST)
Received: from ?IPV6:2405:201:3006:188a:ab1c:a345:8b47:60e8? ([2405:201:3006:188a:ab1c:a345:8b47:60e8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c66629sm369715935ad.14.2026.01.01.22.24.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jan 2026 22:24:14 -0800 (PST)
Message-ID: <5795292f-d732-4f75-a827-b86bb6c69ab7@gmail.com>
Date: Fri, 2 Jan 2026 15:24:09 +0900
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] platform/x86: thinkpad_acpi: Add support to detect
 hardware damage detection capability.
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, njoshi1@lenovo.com,
 Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20251224095019.11622-1-nitjoshi@gmail.com>
 <f359e9e7-ade6-a022-f21e-47a581ab97c7@linux.intel.com>
Content-Language: en-US
From: Nitin <nitjoshi@gmail.com>
In-Reply-To: <f359e9e7-ade6-a022-f21e-47a581ab97c7@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/30/25 01:49, Ilpo Järvinen wrote:
> On Wed, 24 Dec 2025, Nitin Joshi wrote:
>
>> Thinkpads are adding the ability to detect and report hardware damage
>> status. Add new sysfs interface to identify whether hardware damage
>> is detected or not.
>>
>> Initial support is available for the USB-C replaceable connector.
>>
>> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>> Signed-off-by: Nitin Joshi<nitjoshi@gmail.com>
>> ---
>> Changes since v1:
>> -Split patch between hwdd_status and hwdd_detail
>> -Incorporated review comments
>> Changes since v2:
>> -Control visibility of the sysfs attribute based upon ucdd_supported
>> Changes since v3:
>> -Fix documentation build warning
>> Changes since v4:
>> -Removed extra line
>> Changes since v5:
>> -Improved code indentation
>> ---
>>   .../admin-guide/laptops/thinkpad-acpi.rst     |  21 ++++
>>   drivers/platform/x86/lenovo/thinkpad_acpi.c   | 105 ++++++++++++++++++
>>   2 files changed, 126 insertions(+)
>>
>> diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
>> index 4ab0fef7d440..2db05f718b11 100644
>> --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
>> +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
>> @@ -54,6 +54,7 @@ detailed description):
>>   	- Setting keyboard language
>>   	- WWAN Antenna type
>>   	- Auxmac
>> +	- Hardware damage detection capability
>>   
>>   A compatibility table by model and feature is maintained on the web
>>   site, http://ibm-acpi.sf.net/. I appreciate any success or failure
>> @@ -1576,6 +1577,26 @@ percentage level, above which charging will stop.
>>   The exact semantics of the attributes may be found in
>>   Documentation/ABI/testing/sysfs-class-power.
>>   
>> +Hardware damage detection capability
>> +------------------------------------
>> +
>> +sysfs attributes: hwdd_status
>> +
>> +Thinkpads are adding the ability to detect and report hardware damage.
>> +Add new sysfs interface to identify the damaged device status.
>> +Initial support is available for the USB-C replaceable connector.
>> +
>> +The command to check device damaged status is::
>> +
>> +        cat /sys/devices/platform/thinkpad_acpi/hwdd_status
>> +
>> +This value displays status of device damaged
>> +- 0 = Not Damaged
>> +- 1 = Damaged
> This seems to result in not the best formatting for htmldocs:
>
> "This value displays status of device damaged - 0 = Not Damaged - 1 = Damaged"

Ack. I will modify it and send updated patch for this. I will also 
modify slightly for Patch 2/2 as well.

  Happy New Year !

Best Regards,

Nitin Joshi

