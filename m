Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1F05F46A
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 Feb 2024 14:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706798659; cv=none; b=lRR5BJZWXuP8kj7BSU9QqUNn+9m6NN/vMcx1OLnHBX93ZBn89GkGRm62gP2I2fUcQYsMh7TdovzQjhjQpZBKXf4fLiqbIEdlHZgSrhLmFV2c+2lKCSk+7bePORK9xoqnRUMPaArXMZNVzo+u/k5my3rPiSfwyt3vB1ZSgVqUBFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706798659; c=relaxed/simple;
	bh=bYcvqOcmX4sVEo40QTMLlhvyMYJ6lF0y073kFarQzSI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f2Vb6NrKCv6jHV3x0MjucjcAE1OZpUvs0XC6sTiQRYN4wH5c5bTfAXCdCsiWSKUR4CsgFWGSOxDgwQ1nPVtMuvPtE8W/wLAbq+DL6s4Bj3ckuH2MMsV/FZKn47jlWNqTVY7AMSWhFgKBtePzWj8y1mlVYP3jpRwbNd4dw9eFFRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VsBJzFum; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VsBJzFum"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706798656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wOlxDZUDfNuTESZbPZaBxtReu7v1SIAZS1vKHC4UTJQ=;
	b=VsBJzFumuqbZy2YF52gBgQBPCd5gL3ZM+5sWT3ZNqf6v7jZkZQkD97r2vEcNksJ6C6dTsa
	DRX2q8LOotMK+8LwocrRPaoMeZo8CHQoJBfyBThLQPLyU35dNAkHseyvZlZtwVCBp0FIuh
	xyB1doviz8mdA3ST/bQl7uqaEd/pMYM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-rmI8WdwMOQCX6lZGDZJ3sQ-1; Thu, 01 Feb 2024 09:44:15 -0500
X-MC-Unique: rmI8WdwMOQCX6lZGDZJ3sQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a2b047e8f9fso67575166b.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 01 Feb 2024 06:44:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706798653; x=1707403453;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wOlxDZUDfNuTESZbPZaBxtReu7v1SIAZS1vKHC4UTJQ=;
        b=dCCCzTxRV/xrKEl4+iUuGLE4U7nAfRwM/rql0r71gwJJwdjoDROCK0peNriDY9Nr77
         REr9boZdTs4iVLn8wn7+Be2iIDhmhzR313uQfDevS0LjCIN5eSHhy0zXRbqZq9vAvJ3i
         dUy9c0P1vW8biETfO7/6+UWxBCcXQpy0VQKKp3nmKzCMsRP72D2UGDmsfbd+DnDqxcBl
         Gzeuwmo6kSFKDVkEgtWxF7BUnvPZgAYaVuLjhHWtLThXHEg1mIDBi6Du1ngatj5qHEhY
         v96+i/+raG2E3lnaHANXw9Qk028go91KZozSoB3hqa5fT0YuIPOGoSOO2iMIs93+lJO2
         9CNQ==
X-Gm-Message-State: AOJu0YzmQc0WZ7oktDeWJQH0UWRXMZTln2bSPHzlgcDSJLi15Cz+Jegs
	gGzuu/HY0BfXujEHUMvwU+qP97FixXDPookivbs4MFhx9bwhAEUr8I71N36gpK6saPU6OSY13Xd
	1ZqEAuYJH02NBbiDHxrwZCjuBWUDlPPX0UE2yc8TaciYFReGgGLzGcjeOcCj5f1v6ENWpezz2nq
	MwV7Y=
X-Received: by 2002:aa7:ccd1:0:b0:55e:e829:1461 with SMTP id y17-20020aa7ccd1000000b0055ee8291461mr3461445edt.42.1706798653810;
        Thu, 01 Feb 2024 06:44:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFtt6ZDdKY0CU9HANS5yqji2MwV7BS4e1EPRXM00A4njbCOq6vcER8c+uxNMu2v4jAaD1bKwQ==
X-Received: by 2002:aa7:ccd1:0:b0:55e:e829:1461 with SMTP id y17-20020aa7ccd1000000b0055ee8291461mr3461435edt.42.1706798653524;
        Thu, 01 Feb 2024 06:44:13 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCX6i67Yg5I0LBuQQUwYe/0jqOpbwbJ8q/JfiX3hYT8RXstelEZQK/+E2YcRtQ1EWvAZYC5m5/pb68vlwMdFiQ==
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id k11-20020a056402340b00b0055f11bd3564sm3671330edc.8.2024.02.01.06.44.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 06:44:13 -0800 (PST)
Message-ID: <83692b7c-3797-4a78-9f5e-f935c43cceac@redhat.com>
Date: Thu, 1 Feb 2024 15:44:12 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] platform/x86: Add ACPI quickstart button driver
To: Dennis Nezic <dennisn@dennisn.mooo.com>, Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org
References: <20240131111641.4418-1-W_Armin@gmx.de> <ZbpqZqyIHuX0s5vz@panther>
 <4bd98f0f-831d-43e4-acfb-f8e65ca027fd@gmx.de> <ZbqAkNe3ONcteSQ9@panther>
 <ed222583-e7e0-46f7-929f-4e076f746883@gmx.de> <ZbumN9GuFHp_pJRt@panther>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZbumN9GuFHp_pJRt@panther>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dennis,

On 2/1/24 15:09, Dennis Nezic wrote:
> On 31 Jan 18:36, Armin Wolf wrote:
>> Am 31.01.24 um 18:17 schrieb Dennis Nezic:
>>
>>> On 31 Jan 18:07, Armin Wolf wrote:
>>>> The issue is that you machine does not support runtime button events on the quickstart button,
>>>> only wake events.
>>>>
>>>> Can you check if you can now use the unresponsive button to wake the system?
>>> Nope, only the main power button can wake it from a sleep state, those
>>> quickstart buttons do nothing.
>>
>> Can you check if this is still the case when you configure the PNP0C32 ACPI device to be able
>> to generate wakeup events (from S5, S4 and S3)?
>> Maybe you should unload the quickstart driver for this test.
>>
>> If the button still does nothing, then it could be that the quickstart device is not handling
>> this button. Then we need some new ideas.
> 
> Yea I don't think quickstart/hp-wmi is handling it. As I said, the
> behavior is exactly the same as if I didn't have it compiled at all.
> 
> I enabled it via /proc/acpi/wakeup (it was disabled initially) (the
> S-state in that file only mentions S5, but I guess that should include
> all the less sleepy states too). No effect. I tried with and without the
> quickstart device.

Perhaps this is simply a hw defect, have you seen the button
working under Windows? Maybe at some point some liquid
got inside the keyboard around that button?

The main keyboard buttons are typically membrane style buttons.

But extra media keys might be more remote control style, where
there are not rubber domes beneath hard plastic keys, but the
keys themselves are rubber, with some carbon conductor on
the bottom and they directly connect 2 copper pads on the PCB.

These remote style buttons are quite sensitive to dirt getting
underneath (just like the buttons in a typical TV remote).

Assuming you can get things disassembled easily you may want
to try and clean things.

Regards,

Hans





