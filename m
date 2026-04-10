Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6151395D99;
	Fri, 10 Apr 2026 20:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775852808; cv=none; b=CUNMq3tP2Ai+FqTYHlTykmmheXc88hjnbt3EWlbd99FP3eLpSjDIyF777iFu8RMfxM8bGIbyTG43gca0oHfsLoCJZ9uB0oFdMb+7gqAhtoIO4+t/hccn32e3wrJqBJOc9KE2w51AQQxOg/Pu4iJRkJfJ4tygm7s8EgqCSm537gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775852808; c=relaxed/simple;
	bh=C7u2fqTFkLZ1JqKyWtyyJNkubv05rTJYFnvqeBJP+uA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OF7OqQ1PUej6Y0DzKcP3khLRusLfK3IvDNFyQv/T79nrU/89RgooBkzW33990I6qwWb2vT5V4/wHN3N6o1CS/Wtr6/cjGIaFBtfRuQ73E4ccjzgm8vO1NSwQCENwpyJcxMyOymv5yWRp62Dgy+FGdkID9xWVQZ3YfuxY6L4H2X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=OPOl9Oqv; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="OPOl9Oqv"
Received: from [192.168.178.25] (i5C75F434.versanet.de [92.117.244.52])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id E91562FC021B;
	Fri, 10 Apr 2026 22:26:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1775852797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+1P75tp8gmP+jcKQcHJ68NOqCGmSvreDV8envUIHV6A=;
	b=OPOl9OqvTB2Nb9AMH17d5x+WwjntGJ1ZR8MNmjFcwg+Mo/w2NcDq2gY1FQq2eCANXKrb5a
	ejHpOrW0bBk8HQCx8PJEBE58qsCGSoSJgGtWvyUL71AIeUTs28XAhPy/qXTF6bvEP+tzdw
	xpxar7BoMZoTseoSPxPpRwbgxrEfDwI=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <4a9f1a03-f209-4f24-b59c-e93c595958a0@tuxedocomputers.com>
Date: Fri, 10 Apr 2026 22:26:36 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] platform/x86: uniwill-laptop: Properly initialize
 charging threshold
To: Armin Wolf <W_Armin@gmx.de>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260406193653.7799-1-W_Armin@gmx.de>
 <20260406193653.7799-2-W_Armin@gmx.de>
 <d99162c3-a940-46a0-a0e8-3a777cabfcc8@tuxedocomputers.com>
 <f8dc0729-5fec-4c28-8233-1a80ce1fe2f9@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <f8dc0729-5fec-4c28-8233-1a80ce1fe2f9@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Am 10.04.26 um 19:27 schrieb Armin Wolf:
> Am 09.04.26 um 00:59 schrieb Werner Sembach:
>
>>
>> Am 06.04.26 um 21:36 schrieb Armin Wolf:
>>> The EC might initialize the charge threshold with 0 to signal that
>>> said threshold is uninitialized. Detect this and replace said value
>>> with 100 to signal the EC that we want to take control of battery
>>> charging. Also set the threshold to 100 if the EC-provided value
>>> is invalid.
>>>
>>> Fixes: d050479693bb ("platform/x86: Add Uniwill laptop driver")
>>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>>> ---
>>>   drivers/platform/x86/uniwill/uniwill-acpi.c | 28 ++++++++++++++++++++-
>>>   1 file changed, 27 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c 
>>> b/drivers/platform/x86/uniwill/uniwill-acpi.c
>>> index faade4cf08be..8f16c94221aa 100644
>>> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
>>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>>> @@ -1404,7 +1404,12 @@ static int uniwill_get_property(struct power_supply 
>>> *psy, const struct power_sup
>>>           if (ret < 0)
>>>               return ret;
>>>   -        val->intval = clamp_val(FIELD_GET(CHARGE_CTRL_MASK, regval), 0, 
>>> 100);
>>> +        regval = FIELD_GET(CHARGE_CTRL_MASK, regval);
>>> +        if (!regval)
>> personal preference: explicitly compair to the uninitialized-value "0" with 
>> == for better readability, but don't know if that is the normal coding style 
>> for the kernel
>
> Hi,
>
> AFAIK the default kernel coding style encourages people to write NULL/0 checks 
> as !value. However i am not sure
> if this only applies to NULL checks. Ilpo, what is your preference in this case?
ok
>
>>> +            val->intval = 100;
>>> +        else
>>> +            val->intval = min(regval, 100);
>>> +
>> We silently correct invalid values here. Wouldn't it be better to detect that 
>> something is off?
>
> The ACPI code on my device suggests that values equal to or larger than 100 
> will be interpreted as
> "charging limit is disabled", so i think we should replicate this assumption 
> inside the driver.

ok

then:

Reviewed-by: Werner Sembach <wse@tuxedocomputers.com>

>
> Thanks,
> Armin Wolf
>
>>>           return 0;
>>>       default:
>>>           return -EINVAL;
>>> @@ -1499,11 +1504,32 @@ static int uniwill_remove_battery(struct 
>>> power_supply *battery, struct acpi_batt
>>>     static int uniwill_battery_init(struct uniwill_data *data)
>>>   {
>>> +    unsigned int value, threshold;
>>>       int ret;
>>>         if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY))
>>>           return 0;
>>>   +    ret = regmap_read(data->regmap, EC_ADDR_CHARGE_CTRL, &value);
>>> +    if (ret < 0)
>>> +        return ret;
>>> +
>>> +    /*
>>> +     * The charge control threshold might be initialized with 0 by
>>> +     * the EC to signal that said threshold is uninitialized. We thus
>>> +     * need to replace this value with 100 to signal that we want to
>>> +     * take control of battery charging. For the sake of completeness
>>> +     * we also set the charging threshold to 100 if the EC-provided
>>> +     * value is invalid.
>>> +     */
>>> +    threshold = FIELD_GET(CHARGE_CTRL_MASK, value);
>>> +    if (threshold == 0 || threshold > 100) {
>>> +        FIELD_MODIFY(CHARGE_CTRL_MASK, &value, 100);
>>> +        ret = regmap_write(data->regmap, EC_ADDR_CHARGE_CTRL, value);
>>> +        if (ret < 0)
>>> +            return ret;
>>> +    }
>>> +
>>>       ret = devm_mutex_init(data->dev, &data->battery_lock);
>>>       if (ret < 0)
>>>           return ret;
