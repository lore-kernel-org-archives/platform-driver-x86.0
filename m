Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354D56214E
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 Feb 2024 15:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706799803; cv=none; b=oxDnP5FwHRgTZZnW7CFjxIY0T8GX3LqpOQFPqIj+uhXaXCRH4NQgqQR04sJ02ErOvlWbIZtlTtAqvRPkitdDL+FC0wjsUOpIlJZdLZlUXfaE1kEcydDU+8O/LLDHETf/+Zx7xTYGnATVYYlJeACoPHPVnI2a1BKUyRepev7Azgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706799803; c=relaxed/simple;
	bh=LYu5wuugozrLETHoh44NkJdixaBUzfjYhm8k6GxtZ9M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QGzBzq+iS2q4A49XLRUwjfHpPFuoQTt0A7mWwCvuOdB34elDZ9uFNHDvxSPCBD2HUfaS/pWEwB2p2zU+DwehICATwUzW6FpjC4lSbg90PbSMMyuzwNqeo0aQKlisoolTDlP3fDC0WYXgm5ofZb5/YL9jlkftX3CUuUbPRl0MwlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GVkzDhfs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GVkzDhfs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706799801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c3cCCkk5ZuiWHSDMS0BCowtAWeuCjs8BHvUFFwWbMPw=;
	b=GVkzDhfsMOEiJ4P73Ix1UZqywRC7B3PkQAeqRFVnrvZ0S9K9rUQUUihsViHC6OS4V6xASj
	Ni7K2KFWeM5Kf/JKIe5IJJAmwYOKUXMDj23zNn/172hwlOnyyOBZRginFFhLW0mYOeJ47e
	zMKsVx4h0F6W/6JuLT+TFjdKInhF1SM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-461-6-rmQwJYO-y2pmUq662eew-1; Thu, 01 Feb 2024 10:03:18 -0500
X-MC-Unique: 6-rmQwJYO-y2pmUq662eew-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-55fbf844bacso400191a12.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 01 Feb 2024 07:03:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706799796; x=1707404596;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c3cCCkk5ZuiWHSDMS0BCowtAWeuCjs8BHvUFFwWbMPw=;
        b=uHjYqxNwPPACw3Haj+/omYajMkdWcPBV1MlnpizlD1tMCmBZw+dfjHpjDykcZT1J+J
         zg2pnyK6j7hT/I6TNxv8C4t375x+Am6U7q0B2NR6w2vuCWRMMFKaChWXbf5TbQMhH/kN
         5svW+li4+dFyFC7RCzAT/FdghDnEsiSroGUvgAW8HO1UwQpGMzi5JVSBIxd7KJU12gu5
         vCXZjGYDSbnYMJerXrzvXZTMnMc2UVYuwxqc9xvKH9E8zUSD5ow726SK7jhsAb4Bx/zm
         mNDvDYSmTaiM+/yTkHjyfWjeZuEM0zhtMmqsg8tRE/4TF2DUt8aCRXNyY4bbiFSSzDtv
         ahwg==
X-Gm-Message-State: AOJu0YwA9DwDrcAYrm81uFzMMqiohIlZiKTMqLnMlMBKjYWEUh6DjVM0
	Phy2RD4a0i0bDdZCZhDHy5R+eG1noem3rLhbbXUAJ4zGm/OU4KfBtBLdfh4ps4x2eCguy5j7mYq
	LnFekEBQIgAmrlsYMEvEv2lV7OqnsYOE0vYIMePK1Vd9FQG4w6jdCZ+8eQ+SCb/umesUGn+h52l
	tvnSQ=
X-Received: by 2002:aa7:da47:0:b0:55f:c83b:15a6 with SMTP id w7-20020aa7da47000000b0055fc83b15a6mr1090258eds.26.1706799796090;
        Thu, 01 Feb 2024 07:03:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEard3Z4JCJ1lmDsFYyky7vFnGIYiqd8chEgXKsmAQc2Tq1hEsLFtIJgAWaWYt7FuRn7bOkjA==
X-Received: by 2002:aa7:da47:0:b0:55f:c83b:15a6 with SMTP id w7-20020aa7da47000000b0055fc83b15a6mr1090241eds.26.1706799795813;
        Thu, 01 Feb 2024 07:03:15 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCV9CRdZ1OW/OaqQCrO5HwbAEuBCH1ms1zKVI6hTYZlESyWeI49cfe2ec1q52dEaVpTdr+jVIIMzkElvwrRjvEfPBeewUlcL/EY2cFFSp+hom0F4Bw==
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id x13-20020aa7dacd000000b0055eb8830906sm5707990eds.85.2024.02.01.07.03.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 07:03:15 -0800 (PST)
Message-ID: <63004059-ce2e-4896-977f-c2c8f1b1316d@redhat.com>
Date: Thu, 1 Feb 2024 16:03:14 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] platform/x86: Add ACPI quickstart button driver
Content-Language: en-US, nl
To: Dennis Nezic <dennisn@dennisn.mooo.com>
Cc: Armin Wolf <W_Armin@gmx.de>, platform-driver-x86@vger.kernel.org
References: <20240131111641.4418-1-W_Armin@gmx.de> <ZbpqZqyIHuX0s5vz@panther>
 <4bd98f0f-831d-43e4-acfb-f8e65ca027fd@gmx.de> <ZbqAkNe3ONcteSQ9@panther>
 <ed222583-e7e0-46f7-929f-4e076f746883@gmx.de> <ZbumN9GuFHp_pJRt@panther>
 <83692b7c-3797-4a78-9f5e-f935c43cceac@redhat.com> <ZbuxlZq6sGEAlI4n@panther>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZbuxlZq6sGEAlI4n@panther>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2/1/24 15:58, Dennis Nezic wrote:
> On 01 Feb 15:44, Hans de Goede wrote:
>> Hi Dennis,
>>
>> On 2/1/24 15:09, Dennis Nezic wrote:
>>> On 31 Jan 18:36, Armin Wolf wrote:
>>>> Am 31.01.24 um 18:17 schrieb Dennis Nezic:
>>>>
>>>>> On 31 Jan 18:07, Armin Wolf wrote:
>>>>>> The issue is that you machine does not support runtime button events on the quickstart button,
>>>>>> only wake events.
>>>>>>
>>>>>> Can you check if you can now use the unresponsive button to wake the system?
>>>>> Nope, only the main power button can wake it from a sleep state, those
>>>>> quickstart buttons do nothing.
>>>>
>>>> Can you check if this is still the case when you configure the PNP0C32 ACPI device to be able
>>>> to generate wakeup events (from S5, S4 and S3)?
>>>> Maybe you should unload the quickstart driver for this test.
>>>>
>>>> If the button still does nothing, then it could be that the quickstart device is not handling
>>>> this button. Then we need some new ideas.
>>>
>>> Yea I don't think quickstart/hp-wmi is handling it. As I said, the
>>> behavior is exactly the same as if I didn't have it compiled at all.
>>>
>>> I enabled it via /proc/acpi/wakeup (it was disabled initially) (the
>>> S-state in that file only mentions S5, but I guess that should include
>>> all the less sleepy states too). No effect. I tried with and without the
>>> quickstart device.
>>
>> Perhaps this is simply a hw defect, have you seen the button
>> working under Windows? Maybe at some point some liquid
>> got inside the keyboard around that button?
> 
> Unlikely. I have 2 of these laptops, same behavior. Never saw them with
> Windows.
> 
>> The main keyboard buttons are typically membrane style buttons.
>>
>> But extra media keys might be more remote control style, where
>> there are not rubber domes beneath hard plastic keys, but the
>> keys themselves are rubber, with some carbon conductor on
>> the bottom and they directly connect 2 copper pads on the PCB.
>>
>> These remote style buttons are quite sensitive to dirt getting
>> underneath (just like the buttons in a typical TV remote).
>>
>> Assuming you can get things disassembled easily you may want
>> to try and clean things.
> 
> These ones are more like a phone touchscreen ... it's just a long solid
> plastic sheet, no distinct edges (annoying), with leds underneath. All
> the led's get illuminated when touched, even this mysterious "info" key.

Interesting. If the LED underneath lights up when touching then
I agree that it is unlikely that this is a hw defect.

Regards.

Hans



