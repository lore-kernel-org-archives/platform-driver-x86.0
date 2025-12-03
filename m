Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED332ECE92
	for <platform-driver-x86@vger.kernel.org>; Wed,  3 Dec 2025 10:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764759203; cv=none; b=ixOBps1YYPopvyLUc+fXV9fulJB/7UIdLu7O0pJqkawHuVFkKk4g6MDzK/oF6KMKWSm27ACrRcBm2VNpK5BdEMpeGmtZ+gRoR8t3fIAVpBXjaeZJ4Rx4cAaUX6jkxPujW4Zwcj/qC92w4tSI9jhr9fqBQlnmyBhb0Isqsx6IewU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764759203; c=relaxed/simple;
	bh=sX/FMluP7cm6oBzkdDmIBYZducN6JLY0n6VDOz8piAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bB8b/q1/fzyLhKGumqCHtGOLKg7mZ93HIaHd3fWxvw7wyBvKgccn8cbUX2pEw9dcy8wHNSImMS2GWcOiTzjp4jXOYncKz6x28eYrCtljopN1PM6f4MZCxEbM3ajSpqp4ERGQkNLL+u4BekFkv3E/AgybQNk2C+Qg7m6yOEjZMCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=giPtAnlu; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="giPtAnlu"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-297d4a56f97so95263475ad.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 03 Dec 2025 02:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764759201; x=1765364001; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TvuDz+LB2nlmtHgXkSOi62X+EzFaBu+241NUXS5oP38=;
        b=giPtAnlujke9+rOyvzP6uUYPBywlcR++M3a/aQRxe8Df1/331UK25L/LWmcqMEfdP+
         py0834u8Wimx0jQu8GbdXuw6sx8lcRzb+Jzuv/R0IQ3bajUnFtdFjKWBwSyEPTIY+mMe
         bSdsckF5O4051VdXbCXrg81lQPdI+TcW7rJqFFROpsyh6XSShml1dojpRiakqUiqKVhV
         k6DeMhRWodqkM/1oJzDi/mUEELh54KzGqw3DLks7EeCgzFLgQGhIXGhXzOPiJfk1u66K
         JWgAid0j14S64OgE3n2eWx0NI1GJqmPPjmmyGzIhniHpDU4wTEc6sY0Bxm/+9bxuzOMp
         AtMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764759201; x=1765364001;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TvuDz+LB2nlmtHgXkSOi62X+EzFaBu+241NUXS5oP38=;
        b=gg9xOxIExKzq7GYKbYlqulqRLdBCZYe3vfzd++E5fA6W7gcH+LOCaKaIsBZZv/0fuS
         ocmEseiCuM+gw+LCq8oLjtqbkTftjIphsxNuBc+Fi99DnSMgmpQ4ajWFqM+I5LshlSQQ
         dVxiDiL+tcdeuAbZGUBRnX126STiG07f/P+NZrYSV5G+dq6O9zdDuqicOy0PZMh421SY
         Fk9Wze/jU3VFam+po2HpZ6h28N5elCCOqcAKcHk4IzyjyrpOi9rOs4ckrCQ7DelkXa52
         7OQBg/bxwSnlv+8DOuejWiW1S/ZesPhGg/+Xvx67V2eY38eeOUFfJxbgoTlG0O0he4lw
         6ClQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDj9GQthV630Zd8FFyH/BGFUVvLYGdNVqiqFexAEujPyFVwXe6NAv2HvBYhNMj61bIHW5FnBFhzMpFFflOMhEm5nJU@vger.kernel.org
X-Gm-Message-State: AOJu0YwCdNmrtWscM7xBjj2ae4AsgA//Zj9OIO+P0o0dCJyOUW3MgJ08
	n/gtG4jHksnDwIdpI17+XjRLkGv6o034ZaeeJ4BMUWp5uGuTyIwMXMi+
X-Gm-Gg: ASbGncshvAw0aXCy5Z8iKsUeeFZFuPbyqMPTgyL5kYksQZQIChCcuKEqUHbDuAQ7Wrs
	TixQIHsNTqlB5QtioY7MEJCOrdHIhH9id4ytGR3I2AwBtedOQelbucvBkNRGk7utE+i1F6onY0z
	5V0Ba2o6cI9QJSdRwjFnYxrKMvK0PAwqDy3D7mzd7vu3nmuuFkka6lzje1mE0cwnXqZWpkM+F/p
	GBiB8jYKOzVRPQjIsyZfMos9fS2cvGSohsPmLl3X7W1JUb0ek9K+TVlNhpDdrDqucYrsEE3lr6Y
	dFBKr+oBtkr51BX2b4xpr9xeX/MV7aB6I4lXd0ZpZNa4P0m20TWwlb9hW0fEmxZBbbf3WFsZ3kF
	GwNcFTyw3E7TYExYDmZ5rLVdG3AzhX4BZh35ImuWIBNXFdkNwvUKwrKVmTiqBBvVL5j4SfKDAq8
	pUCyOrp1y8a9Y6CMg2HSfJ4Pm7rZ9Syxw2sNZ09DNe7aI+ifQefpvpvYUytKxKrTInHSc=
X-Google-Smtp-Source: AGHT+IFu6rDs1WjAmEfM15hO6wuMabAqzc9FQplLGsJzz8ObkXxSQU6urKus59RzMtiQQPcdUfnxfQ==
X-Received: by 2002:a17:903:3550:b0:295:5945:2920 with SMTP id d9443c01a7336-29d684013b2mr22438785ad.34.1764759200806;
        Wed, 03 Dec 2025 02:53:20 -0800 (PST)
Received: from [10.131.179.186] (zz20234032476F6CA7C6.userreverse.dion.ne.jp. [111.108.167.198])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce40b993sm186012355ad.14.2025.12.03.02.53.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 02:53:20 -0800 (PST)
Message-ID: <4a2f44d1-e81c-48e8-a8ba-1ed66bfde7b8@gmail.com>
Date: Wed, 3 Dec 2025 19:53:17 +0900
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Add support to detect
 hardware damage detection capability.
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, njoshi1@lenovo.com,
 Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20251203034032.6018-1-nitjoshi@gmail.com>
 <22f766d6-9010-3e87-f05b-bfd9b5888881@linux.intel.com>
 <2f94f4bb-c0e5-40c0-9cf3-7ba31fefbc2b@gmail.com>
 <e53819ec-ab6b-a036-245b-c2da26d5d411@linux.intel.com>
Content-Language: en-US
From: Nitin <nitjoshi@gmail.com>
In-Reply-To: <e53819ec-ab6b-a036-245b-c2da26d5d411@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/3/25 19:39, Ilpo Järvinen wrote:
> On Wed, 3 Dec 2025, Nitin wrote:
>
>> Hi Ilpo,
>>
>> Thank you for reviewing the patch.
>>
>> On 12/3/25 18:44, Ilpo Järvinen wrote:
>>> On Wed, 3 Dec 2025, Nitin Joshi wrote:
>>>
>>>> Thinkpads are adding the ability to detect and report hardware damage
>>>> status. Add new sysfs interface to identify the impacted component
>>>> with status.
>>>> Initial support is available for the USB-C replaceable connector.
>>>>
>>>> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>>>> Signed-off-by: Nitin Joshi<nitjoshi@gmail.com>
>>>> ---
>>>>    .../admin-guide/laptops/thinkpad-acpi.rst     |  26 +++
>>>>    drivers/platform/x86/lenovo/thinkpad_acpi.c   | 179 ++++++++++++++++++
>>>>    2 files changed, 205 insertions(+)
>>>>
>>>> diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
>>>> b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
>>>> index 4ab0fef7d440..4a3220529489 100644
>>>> --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
>>>> +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
>>>> @@ -54,6 +54,7 @@ detailed description):
>>>>    	- Setting keyboard language
>>>>    	- WWAN Antenna type
>>>>    	- Auxmac
>>>> +	- Hardware damage detection capability
>>>>      A compatibility table by model and feature is maintained on the web
>>>>    site, http://ibm-acpi.sf.net/. I appreciate any success or failure
>>>> @@ -1576,6 +1577,31 @@ percentage level, above which charging will stop.
>>>>    The exact semantics of the attributes may be found in
>>>>    Documentation/ABI/testing/sysfs-class-power.
>>>>    +Hardware damage detection capability
>>>> +-----------------
>>>> +
>>>> +sysfs attributes: hwdd_status
>>>> +
>>>> +Thinkpads are adding the ability to detect and report hardware damage.
>>>> +Add new sysfs interface to identify the impacted component.
>>>> +Initial support is available for the USB-C replaceable connector.
>>>> +
>>>> +The available commands are::
>>>> +
>>>> +        cat /sys/devices/platform/thinkpad_acpi/hwdd_status
>>>> +
>>>> +This value displays device type and location of device with damage
>>>> status.
>>>> +For example:
>>>> +if no damage is detected:
>>>> +  No damage detected
>>>> +if damage detected:
>>>> +  Damage detected:
>>>> +  Device: TYPE-C
>>>> +  Location: Base, Right side, Center port
>>>> +
>>>> +The property is read-only. If feature is not supported then sysfs
>>>> +class is not created.
>>>> +
>>>>    Multiple Commands, Module Parameters
>>>>    ------------------------------------
>>>>    diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c
>>>> b/drivers/platform/x86/lenovo/thinkpad_acpi.c
>>>> index cc19fe520ea9..c3629bed9a8e 100644
>>>> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
>>>> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
>>>> @@ -11080,6 +11080,180 @@ static const struct attribute_group
>>>> auxmac_attr_group = {
>>>>    	.attrs = auxmac_attributes,
>>>>    };
>>>>    +/*************************************************************************
>>>> + * HWDD subdriver, for the Lenovo Hardware Damage Detection feature.
>>>> + */
>>>> +
>>>> +#define HWDD_GET_DMG_USBC 0x80000001
>>>> +#define HWDD_GET_CAP 0
>>>> +#define HWDD_NOT_SUPPORTED BIT(31)
>>>> +#define HWDD_SUPPORT_USBC BIT(0)
>>> Align values.
>> Ack, i will align values like below:
>>
>> #define HWDD_GET_CAP 0
>> #define HWDD_GET_DMG_USBC 0x80000001
>> #define HWDD_SUPPORT_USBC BIT(0)
>> #define HWDD_NOT_SUPPORTED BIT(31)
> These are not aligned as values starts from different columns. Please
> put a tab char there in between so the values start at the same column (or
> varying number of tabs depending on the length of the name).
>
> There are plenty of good examples in the code, including in this file
> you're modifying.
Ack, i will modify it . Thank you !
>
