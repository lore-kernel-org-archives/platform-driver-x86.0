Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912BE3376AC
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Dec 2025 17:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766512741; cv=none; b=M27ivpgNq7ysSDnSL7TE8J7ZU9wQJhYe1esNOoJJaT6vFR7n0V0n3CeRsnLeQ7cxbt2HWLjVGWbSTB6FOLuo7GtteSaOp0uK0xSg1fnDdkfkZs4c6+FNskEDPE++IU/CQJRymPcQhgyfQJ+54WDIN3u52M9kDD4HUZyEuFS/1SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766512741; c=relaxed/simple;
	bh=NSLbG7k16GHwh64UuDTkXVvGJQLbrCn9gOsXTPfAXUQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NBGG+Kn06lALr3lS6OPmcsOKqv9IdbZHTN7GbvYmD/twH7gLHZ/xewu06zt/bdbiJ9Kz79Fym3ByNUMbZepS73lE+IuVvJWAPj+bUoYDnP10SikKryoB+/z27fLzQnDIoAU+4j+nCoYvXyMdEscDi9D2uDg7xpYgyGSl2WleMOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NEY0eYEI; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NEY0eYEI"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-34cf1e31f85so4173609a91.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Dec 2025 09:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766512739; x=1767117539; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zr5Vb0BogJKiOUbdvmBcbYwly4N5xAVsR+G95NUYqwU=;
        b=NEY0eYEI/SdIPPFFDSMAs5Rn4V8vKyo+nHgM5mV8RvZKe7G+s/dvTTBKWW5Q7Tg6/M
         9Am8uXwgVpekgEWkC5Wt6n47TGliuWTnQMfUAz87kMVGUMH3l1vmv/ufAt/0hDkhp20E
         LwxqQIIfxPEgbKY7Yt4c64z7pv+J/QbPniWt4fnb5f6tkiIXEkLtJOMT7J1WvtY3vmLj
         0QoFIL3dNJkr4zhPV4gXzdwKev0kGkGHZmqQxwcxC2h+vfJoY14JwffvU81VRquLgSrz
         4RX76FxWc1t13ZrRcGJgWeJM4UjLePdmf6DmPaQv74fc0xDb1yAWggNrJ0kAcLZA0oZH
         ipUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766512739; x=1767117539;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zr5Vb0BogJKiOUbdvmBcbYwly4N5xAVsR+G95NUYqwU=;
        b=OiTRvIgLIjcUZDc0RZ4BaeHKJFaoAKXjufcGs7gdJTNe/8XrTi5HmsI66I3TVNgWW6
         3M7p/yiTCV8CRZ7dLqxKtwFg2dhvMkQbEPEqMsj9LmCBhIQW5E4y6qYNLZ65hqAqKKKs
         mFu2k0G11CSuR/4lwxJtMxGJxVy6Wx8v8gbKNEIevglJNutnpWnUL6O1xdOrlyG95I1E
         gJnfxOUY+raytgqhRSvFbHQzgbrFrhPhE0iH0uqKFAFM+7wOxLDVHQkthXxo3EjNuC/Y
         EpdWN6yZYp6ecn6oZn9wBN8zGBjKPHL8WFCnzS/Hl6vlHM7UHGo7rmtJ/ViInlx+j9Y4
         37EA==
X-Forwarded-Encrypted: i=1; AJvYcCWjPXxzs5RNEXda3lvktgkKHxqaSYVpaQgZ/QdRmX4Wf8wKHnq+vJnZW201rYN19/8SSMC5L5LL3LA6/hAY+lkh7uFL@vger.kernel.org
X-Gm-Message-State: AOJu0YwnL+bruXXuphIb8DbzdorQaK7oHZPhCwiQB1I50Eu6e3p2UYg+
	v1yjGPSKKWppNuX2Fxbgz2G3sTuDHF6yF/+LOWu654MdC9FSheG9OQ19
X-Gm-Gg: AY/fxX48+KCQNWpiUaO/gQKOf24XC3S2GtsrR4hw8wbfimhbjU2EQTrHz+pgCMLry63
	LK+n3nSNU/7Ca41TlSoVT4hI7+o7MiA05JQt+e5FegA7dU5oFjT8nrinT3d8Foerd9fHuvVsHMe
	Sb44T1n+NpjwNu7uzUV7nvGVJEgKoUIKNPyDpA2B5jJbDQWnzZgO4C8ev89jRnpWPyoI2fK371O
	xkjsfP+4xvWqb9SnFzRDouGcXkFIxWBmZm57+bsD3IB90e3InSsqqA16Gb2TCOf291k1FOTdkY9
	zP1wA4UZuN1mz7xM9bYpNN7xm7TQaY4W3fHNWeWUv9P5cRc4/h8XqPTM0l0d+n8Wtfv1DRabk5O
	T3dcToM/5excS39XBoxt8QL2MP542hR/MFJgoL6GCDhAECFPcTysYWS0BO+u0d07kkQiZm/sIdU
	bQ1qV8ARyEuShD5QKSrRTSMZYnIxxlFraB0IsA+abok69WkL56fO4wl9oYlw==
X-Google-Smtp-Source: AGHT+IFhqQKduDJCfsD5RaFoKWHJcnglvJKlFNKC8PLYsYszv7n7wlJteXwixcj77TLrniWu3mrpwQ==
X-Received: by 2002:a17:90b:2248:b0:340:7b2e:64cc with SMTP id 98e67ed59e1d1-34e921353d3mr13517616a91.15.1766512738505;
        Tue, 23 Dec 2025 09:58:58 -0800 (PST)
Received: from ?IPV6:2405:201:3006:188a:d6f5:9bc4:b71e:1f14? ([2405:201:3006:188a:d6f5:9bc4:b71e:1f14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e921b165bsm13399870a91.6.2025.12.23.09.58.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 09:58:57 -0800 (PST)
Message-ID: <07640446-b277-418e-95ab-6ee7ac75a66c@gmail.com>
Date: Tue, 23 Dec 2025 17:58:52 +0000
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] platform/x86: thinkpad_acpi: Add support to detect
 hardware damage detection capability.
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, njoshi1@lenovo.com,
 Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20251217065523.48399-1-nitjoshi@gmail.com>
 <5ba8fe79-ff4f-2dc1-f80d-8e3a32a29efa@linux.intel.com>
Content-Language: en-US
From: Nitin Joshi <nitjoshi@gmail.com>
In-Reply-To: <5ba8fe79-ff4f-2dc1-f80d-8e3a32a29efa@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/23/25 12:14, Ilpo Järvinen wrote:
> On Wed, 17 Dec 2025, Nitin Joshi wrote:
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
>> +
>> +The property is read-only. If feature is not supported then sysfs
>> +attribute is not created.
>> +
>>   Multiple Commands, Module Parameters
>>   ------------------------------------
>>   
>> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
>> index cc19fe520ea9..cb1f6dae9334 100644
>> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
>> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
>> @@ -11080,6 +11080,106 @@ static const struct attribute_group auxmac_attr_group = {
>>   	.attrs = auxmac_attributes,
>>   };
>>   
>> +/*************************************************************************
>> + * HWDD subdriver, for the Lenovo Hardware Damage Detection feature.
>> + */
>> +
>> +#define HWDD_GET_DMG_USBC	0x80000001
>> +#define HWDD_GET_CAP		0
>> +#define HWDD_NOT_SUPPORTED	BIT(31)
>> +#define HWDD_SUPPORT_USBC	BIT(0)
>> +
>> +#define PORT_STATUS		GENMASK(7, 4)
>> +#define NUM_PORTS		4
>> +
>> +static bool hwdd_support_available;
>> +static bool ucdd_supported;
>> +
>> +static int hwdd_command(int command, int *output)
>> +{
>> +	acpi_handle hwdd_handle;
>> +
>> +	if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "HWDD", &hwdd_handle)))
>> +		return -ENODEV;
>> +
>> +	if (!acpi_evalf(hwdd_handle, output, NULL, "dd", command))
>> +		return -EIO;
>> +
>> +	return 0;
>> +}
>> +
>> +/* sysfs type-c damage detection capability */
>> +static ssize_t hwdd_status_show(struct device *dev,
>> +				struct device_attribute *attr,
>> +				char *buf)
>> +{
>> +	unsigned int damage_status, port_status;
>> +	int err, i;
>> +
>> +	if (ucdd_supported) {
>> +		/* Get USB TYPE-C damage status */
>> +		err = hwdd_command(HWDD_GET_DMG_USBC, &damage_status);
>> +		if (err)
>> +			return err;
>> +
>> +		port_status = FIELD_GET(PORT_STATUS, damage_status);
>> +		for (i = 0; i < NUM_PORTS; i++) {
>> +			if (!(damage_status & BIT(i)))
>> +				continue;
>> +			if (port_status & BIT(i))
>> +				return sysfs_emit(buf, "1\n");
>> +		}
>> +	} else
>> +		return -ENODEV;
> The usual approach is to first check not supported + return errno, then
> you don't even need "else". The same comment to the other patch.

Ack , I will modify it and send next revision. Thank you for review.

