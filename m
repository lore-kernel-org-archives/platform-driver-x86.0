Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA9340E8D7
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Oct 2026 19:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791400051; cv=none; b=t2ynwofuExtHY0I3y5jM6bU0up4JayXbVkNEzlWlBpQPRuAauLyjNEIwU68d45BVIFP/0XZIflkMG1p6vs3jWvydCrHWA6mW2b1DIpldUPMJ1vXS1ZcNTTm2fLbvC6jZWURAluxjkWv56MwJaTpBAnSBqHTsg9gTxpLzpcehGw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791400051; c=relaxed/simple;
	bh=1fnau558rqBwopr4gCTm1ueAE/g/qgOsEp6tP/8Z6MU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=okA1IW3OPGOjRMRIpxhNm6dVkcbQ1Q4o+h2g6fXjMuV9rh+ehgJ2COzzOVW1VthFERHQRXdScHiKdJhKw0JROy7H1+RFmCUIsN5bxbwl+OXcqcLgtjPdgvznpp8w7nrK4auU/klbJH8Tf4BMyeHPnBcB9P2FeuCONAMi6guhr50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nhbcWRxO; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nhbcWRxO"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5e519c39196so729033e0c.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Oct 2026 12:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791400048; x=1792004848; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ddp5n1+qL1RozXjR65sfg64BjVIx/uqCV0e6ynhIBi8=;
        b=nhbcWRxO+QH/6VHP/2xi/GLFLziBaP9Luena2m27UnMSSqfOZAePfRhn+7NJP0AzZg
         B4SHm+8g0mpfWNaC4uVmF163wKYYu15J2pRtmyq4A5TBydBgwxYMT92xNp3XAj4K0NNz
         l1+dcLCzRlTF1NJcpJl25W14A+m/9DzPPMjYcrvLkuSvWiPiczKBJb/3V4CbzZPfPcG8
         QYjMuzMP5SmYRBzGnZFp2nET8TQuy8jntGEHuMerECrwt0lQp3pXFhHd/MKFGmgWEJEF
         IO7SLjZsSHkZulwxIqI2gbnPg37JMuejd8LcYhr5r4D72xbHAOor0EADS+5FyNNuCZ4b
         WG2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791400048; x=1792004848;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ddp5n1+qL1RozXjR65sfg64BjVIx/uqCV0e6ynhIBi8=;
        b=efpe6qH/RvqHPQPjoJpYo8RhH+M+cyaogd5/TwjjJJODPZJivR2psohgIPwgr9V6En
         6eNZkJc4g8QN4Id4iXLjPqDMxdG7V0tYsvrIAVxm1a2zT9TRu68ZTTG2M2TIDlIClpz3
         LJbdPe1+lwLF2BZEoGSflx9H1vCmkg9C91XV1Um/vfxG066yBWW0S+xw/Ze0JCWHYSQk
         rSJh8XrOCx0xKE1Gedo5s8sbzqUfqxUtxAEiC/KuTVDEv9xwUtuBmxTUNgFrPXaO1cQL
         bHrXDq+qjqGqam5cd1Qscj9mOXAx8N3rbFHWf7H1SzGoz/suKf7yoTRgwA8P8CYPqazH
         tUAQ==
X-Gm-Message-State: AFq9FYKo5zt0ngwaYLF8dSusu7sFhBu+bq8esmv1jpdVdrIIbW4HEsIS
	y5YdJGaPawXQMFMESEwco5+8xNm2tFYQB49+t1zcw4qFCaI/d11bNNLa
X-Gm-Gg: AYBFou3QfeVj9frFCcJf7mXdca2jPnjX7eRZPh+WJZszanFIrKesfWTfqiZ7iBOrmkL
	tTSuiy8JAqHVPgdWkbj3+pws3+RpmYkmr71+g9Vo9yspQkFl4sriu7X8MGEZ37T3uknalGp0kGo
	cbyvGjkvJG5gnNcoPcY6agxOMn+qhuM4ND7EqonQQHRQKKBijQF2+vnAkcFdtxfXMkm4uVQINx5
	WuV9q3dVt8AnBUngHGtAIEeSolZqWR59ERxBbKy+xdm8+RKksYIscYPu2/WD7BT2Jd5Mr5Y/Hzc
	oAK1i9okjv38BhliI14oMWDsrpGar1syb3gEjqSTQ4eIVaPJCmVG6pP6RyLy37Cg8CSMQsRswuo
	cYDqB7KqsP4I44zuW1xYLsd/BnL7f3k9VNKfZlLay1lcj2i1siV4Imd413/73C0DUzrNwTjz+JK
	kvXTmpbJTfBU2H33A+Fq5fqoTsEisIHcG7OWSbLu7V0wab3hBcVKQkH1BJrHh6RvENeuI3Ga/GO
	9Rzj9L7AXGqXN3DoyQnNPgaAmYZFZrUkf/xZQ55cLDg
X-Received: by 2002:a05:6122:310c:b0:5d9:82c1:b343 with SMTP id 71dfb90a1353d-5e6cf587159mr1287430e0c.1.1791400047865;
        Wed, 07 Oct 2026 12:07:27 -0700 (PDT)
Received: from [192.168.60.5] ([207.115.103.98])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5e6c5742446sm2719928e0c.17.2026.10.07.12.07.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 12:07:27 -0700 (PDT)
Message-ID: <5331a0a0-7080-4311-84c7-433d5bebbf19@gmail.com>
Date: Thu, 8 Oct 2026 03:07:22 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2] platform/x86: panasonic-laptop: Add
 platform_profile support
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
 Kenneth Chan <kenneth.t.chan@gmail.com>, LKML <linux-kernel@vger.kernel.org>
References: <20261006085021.853827-1-alexyeo362@gmail.com>
 <de93474c-8d00-0382-bd46-e40f850f0bb9@linux.intel.com>
Content-Language: en-US
From: Alex Yeo <alexyeo362@gmail.com>
In-Reply-To: <de93474c-8d00-0382-bd46-e40f850f0bb9@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thank you for taking the time to do a code review. I have made the 
specified changes for v3.

v3: 
https://lore.kernel.org/platform-driver-x86/20261007190446.38862-1-alexyeo362@gmail.com/

>> @@ -130,9 +134,12 @@
>>   #include <linux/kernel.h>
>>   #include <linux/module.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/platform_profile.h>
>> +#include <linux/printk.h>
>>   #include <linux/seq_file.h>
>>   #include <linux/serio.h>
>>   #include <linux/slab.h>
>> +#include <linux/sysfs.h>
> 
> Thanks for the update.
> 
> I no longer recall if I suggested adding sysfs.h in the earlier review
> but I cannot now seem to locate anything that would be directly related to
> sysfs in this patch.
> 

Removed as no code uses that directly. Still builds with W=1 C=1.

>> +static int pcc_profile_platform_profile_probe(void *drvdata, unsigned long *choices)
>> +{
>> +	enum platform_profile_option pp_opt;
>> +	struct pcc_profile *pcc = drvdata;
>> +
>> +	for (pp_opt = 0; pp_opt < ARRAY_SIZE(pcc->quirks->platform_profiles); pp_opt++) {
>> +		const struct pcc_platform_profile *profile =
>> +			&pcc->quirks->platform_profiles[pp_opt];
>> +
>> +		if (profile->fan_mode != PCC_FAN_MODE_UNSET &&
>> +		    profile->tdp_mode != PCC_TDP_MODE_UNSET) {
>> +			set_bit(pp_opt, choices);
>> +		} else if (WARN_ON(profile->fan_mode != PCC_FAN_MODE_UNSET ||
>> +				   profile->tdp_mode != PCC_TDP_MODE_UNSET)) {
>> +			/* Both TDP and fan mode should be set */
>> +			return -EINVAL;
>> +		}
> 
> First check the error and return.
> 
> Then check double UNSET case and use continue.
> 
> Lastly, else is no longer needed for the set_bit() in the remaining cases.
> 

The code was refactored to fit that flow.
For the WARN_ON error check (first if statement), it follows the XOR 
pattern so != was used.

Thanks

