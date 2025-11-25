Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9512629D;
	Tue, 25 Nov 2025 14:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764079549; cv=none; b=U4vE5HqW4Xpz0CzWnMPNGKLm61korlALimC0g/5vK79LzaLI8xSAS28/slYh3ZWMoBx88+LOB9EaUCm8kxAjf6whM4mZndN5PqjN4FrjSqPJTj4CVtHFZ4gSC/m2n4DJzG0satN9GaRdvjqHLCihkKELIx7/zav4LqREdRu/4fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764079549; c=relaxed/simple;
	bh=R4Dm6nLBqPJFJFuanerAyjEaCJ5Kgj0QMkU8CiBjmjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dJaUd7uwvnOLoou3Lhq27UUSQWBhHvIED5yDlH+XAWPV2Z8QLHpqw/dpBMkL7dWZTzakUi/bdRuzbwvpUI4pzkVekdYbHcBJBIpM0NwNg4yziQaZ81fixxtPQJy5w81O/KrTXTHlInYRQhzi3ZVSIVquJ3GVDGD1MawHs/jiJE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=aON+4o6i; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="aON+4o6i"
Received: from [192.168.42.116] (pd9e597c7.dip0.t-ipconnect.de [217.229.151.199])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 62B5F2FC004D;
	Tue, 25 Nov 2025 15:05:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1764079544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CLL8X8JfQGjfYKh3NpEx1HCrsibCCATVT+hv2s8N+CM=;
	b=aON+4o6iO0AmTG/nv7mjCdP/Z+v74AHw1QRmlAyPcm9UjlS52viPlHbtLVMrJ1M4SoBlov
	5joepmE+vxPhPn06ayIwh0SH+1OX1zlI28mwCIBXZN0NZFt2xnFbzfkpPDLapbtPYYdqEb
	rwicpqIfUTtpnH+UVeUYsPmTGKFZKuY=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <f6b96a90-938f-4277-a9ca-92d99285f3d9@tuxedocomputers.com>
Date: Tue, 25 Nov 2025 15:05:44 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] platform/x86/uniwill: Handle more WMI events required
 for TUXEDO devices
To: Armin Wolf <W_Armin@gmx.de>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251117132530.32460-1-wse@tuxedocomputers.com>
 <20251117132530.32460-3-wse@tuxedocomputers.com>
 <fc1b75ce-113d-4de1-ac98-7616b17f915c@gmx.de>
 <29b24831-92d4-47c6-8daf-7d1879951d43@tuxedocomputers.com>
 <7cd7081f-b138-4548-a9fb-5c4d5165b036@gmx.de>
 <7276b961-8649-4bc0-87f7-a1f06cd4f3ad@tuxedocomputers.com>
 <5b554128-7466-4b34-9020-c0c39572f100@gmx.de>
 <3c075220-79f3-4dff-a760-6fe065147793@tuxedocomputers.com>
 <2d5d88fe-cd54-4311-b5cd-b1c435ff973d@gmx.de>
 <d4c7b31b-1335-47d5-992a-beace78614e5@tuxedocomputers.com>
 <f0161676-fde7-4c6f-8774-25d176265716@gmx.de>
 <eb66f09f-6f14-43c9-a319-8f2bc745e055@tuxedocomputers.com>
 <ac1e1b1b-68e3-45a0-9e12-440801af7e0f@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <ac1e1b1b-68e3-45a0-9e12-440801af7e0f@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Am 25.11.25 um 01:50 schrieb Armin Wolf:
> Am 24.11.25 um 19:40 schrieb Werner Sembach:
>
>> Hi
>>
>> Am 20.11.25 um 01:53 schrieb Armin Wolf:
>>> [snip]
>>>
>>> Anyway, i attached the patch with the device descriptor infrastructure. The 
>>> callback called during probe cannot modify
>>> the feature bitmap anymore, but i suggest that you simply set the limit for 
>>> cTGP to zero. The code responsible for
>>> initializing cTGP support can then check if the cTGP limit is zero and 
>>> return early. 
>>
>> Looked into it: whats the reason for the "__ro_after_init" in "static struct 
>> uniwill_device_descriptor device_descriptor __ro_after_init;"?
>>
> __ro_after_init tells the kernel to mark the variables annotated with it as 
> read-only after module initialization has finished.
> I used it to ensure that the static device configuration data cannot be 
> (accidentally) modified after module initialization.
Hope it's ok that in my rfc the copy in driver data is no longer read only, but 
is outside of the probe only accessed via a getter method.
>
>> The thing Ilpo wrote sounded like just .driver_data itself should be read 
>> only, but as soon as it has an indirection, like here being copied over to a 
>> static variable, read/write is ok.
>
> No, the device descriptor needs to be treated as read-only because, 
> theoretically, multiple instances of the uniwill-laptop driver might probe.
> If one of those instances modifies the descriptor, the other instances might 
> run into trouble.
Every instance in my RFC has now it's own copy of the feature bitmap.
>
> I suggest that in order to dynamically modify the supported_features bitmap, 
> you simply copy said variable from the descriptor
> into uniwill_data and then use the probe() callback to modify it.
Yes, I did that.
>
>>
>> Also: Why not just copy the device_descriptor over to uniwill_data instead of 
>> a static variable?
>
> uniwill_data is not available during module initialization, so we have store 
> it separately.
sorry I'm stupid xD
>
>>
>> And do I get that correctly: All you can do during the init callback is doing 
>> more sophisticated DMI matching?
>>
> Inside the callback provided dmi_system_id, you indeed can only do more 
> sophisticated DMI matching. You should
> use the probe() callback inside the descriptor to perform device-specific 
> initialization that requires access
> to the EC and/or uniwill_data.

I sent a RFC based on your PoC patch, I would suggest moving the discussion 
thread there.

Thanks so far for your PoC/WIP patch

Best regards

Werner

>
> Thanks,
> Armin Wolf
>
>> Best regards,
>>
>> Werner
>>
>>> [snip]
>>
