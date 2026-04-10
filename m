Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51682F12C5;
	Fri, 10 Apr 2026 20:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775853050; cv=none; b=YJyQwSV6oTeLWDr5bEThJN0d2mgiqfoPIqbn7lncTo7epfhbGnN5MmIFUR8vByR6c8BcR/YmFcwnbp973V5YaJaeE1/CHZp08PFp3J3N3JEyYX0KDepuWRT3jTOnn3xtN47J2FGr5sW5Glr85dmzBsPAJGKVMETpSs+TjykCEnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775853050; c=relaxed/simple;
	bh=wdm/z5rSuo5LI/ZRKmG1iyaqz/AjzzOlgs0JuWzNyiA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=obpqkmdWdb+yoQuu4+JTxnBs7WGnMURkxkAMuCMnX8qkjS3332OMKrUnGMZyLR+PVPfRLHKaq3/g0csnQqrfj9s2/3J1d/QG2dMHKyI7jPnzjC1lxAXO0hEVDRRSe2IFAgrUxzxoioI6Cba5Z0rZ33lbKCIf8a4EkOObkKK3epc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=q2gSog1P; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="q2gSog1P"
Received: from [192.168.178.25] (i5C75F434.versanet.de [92.117.244.52])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id B1B422FC021B;
	Fri, 10 Apr 2026 22:30:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1775853044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iFQF7uB3Fp8u5oiHAwZPRVqpf92Ep69wk7hP+hb4C2I=;
	b=q2gSog1PzqRHmPxUtl2Xz43r6pnAFEg+yCWLpHn06Oh30Kzn0B0Tk+U1P26xlLdHNM63lG
	aMTkexrqUcFJVwQ7a+ytIi13KDDwysh+Z/J/cRb+TMCdFt4wSP+awZK8O+fCz6fINjiYmb
	PHyu0yX8ZlaNwaZo30TV+mTf95lFtMg=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <d8de9606-da5d-4977-8636-89386a3a7a99@tuxedocomputers.com>
Date: Fri, 10 Apr 2026 22:30:44 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] platform/x86: uniwill-laptop: Fix behavior of "force"
 module param
To: Armin Wolf <W_Armin@gmx.de>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260406193653.7799-1-W_Armin@gmx.de>
 <20260406193653.7799-4-W_Armin@gmx.de>
 <b184557e-545d-4829-847e-b52655757e10@tuxedocomputers.com>
 <641163be-6d3c-4d4b-b437-7a960188d0a0@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <641163be-6d3c-4d4b-b437-7a960188d0a0@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Am 10.04.26 um 19:32 schrieb Armin Wolf:
> Am 09.04.26 um 01:08 schrieb Werner Sembach:
>
>>
>> Am 06.04.26 um 21:36 schrieb Armin Wolf:
>>> Users might want to force-enable all possible features even on
>>> machines with a valid device descriptor. Until now the "force"
>>> module param was ignored on such machines. Fix this to make
>>> it easier to test for support of new features.
>>>
>>> Fixes: d050479693bb ("platform/x86: Add Uniwill laptop driver")
>>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>>> ---
>>>   drivers/platform/x86/uniwill/uniwill-acpi.c | 8 ++++++--
>>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c 
>>> b/drivers/platform/x86/uniwill/uniwill-acpi.c
>>> index 5551f193c2c1..7c7ea0e76966 100644
>>> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
>>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>>> @@ -2481,8 +2481,6 @@ static int __init uniwill_init(void)
>>>           if (!force)
>>>               return -ENODEV;
>>>   -        /* Assume that the device supports all features */
>>> -        device_descriptor.features = UINT_MAX;
>>>           pr_warn("Loading on a potentially unsupported device\n");
>>>       } else {
>>>           /*
>>> @@ -2500,6 +2498,12 @@ static int __init uniwill_init(void)
>>>           device_descriptor = *descriptor;
>>>       }
>>>   +    if (force) {
>>> +        /* Assume that the device supports all features */
>>> +        device_descriptor.features = UINT_MAX;
>>> +        pr_warn("Enabling potentially unsupported features\n");
>>> +    }
>>> +
>> this should already exclude the potentially harmfull "charging threshold"
>
> I decided to keep this patch small so that it can be picked up by the stable team
> without much fuss. Personally i believe that the charging limit should be 
> dealt with
> inside the last patch where we add support for the (safe) charging modes.

Stable should get this protection too, and it is just one more line.

Could even be an own patch with just that line

>
> Thanks,
> Armin Wolf
>
>>>       ret = platform_driver_register(&uniwill_driver);
>>>       if (ret < 0)
>>>           return ret;
