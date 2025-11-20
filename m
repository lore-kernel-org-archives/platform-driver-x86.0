Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761F12E2EF9
	for <platform-driver-x86@vger.kernel.org>; Thu, 20 Nov 2025 14:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763648976; cv=none; b=O+gH02S0dHU0v4OV08w60X6es+Np7i/cZbWBgldE9cB+vFJ43qiyU5cwT7TPNbmRfJxGqOCdbouI+lfxVDrn/fQHsi2RXAM69zkDDheZR0vdLDqWEhSnWu8aI7czh+ZNRUI8W7VxYvkOEvMGo43fixNM6XQgUpfMJfuMuImG78k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763648976; c=relaxed/simple;
	bh=4sGPhk6b77JM0haaV7ma1VhS6WwzG6m+e1s3k2buRmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=clFQhsV0ktngribIaupBo9qU7Ra4gFR2cvfw6p3jut2/qQSOIiHIn54GvIEXZk5Ha3yJ6dtm3ZXt37UprxiboCiaqYgRwpmyb8l9Dq/1AF+ZVh4qX++eDcDkbpEa8RWJo/uSWmgPb7wZBJhT/uKOLTiw3vkVpACfW4dPcIyyzKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W0RZZJy4; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W0RZZJy4"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-477b1cc8fb4so6440315e9.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 20 Nov 2025 06:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763648973; x=1764253773; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PaSB0JDzx/KeBkAD7qB+B6gdM9jZdTTt3lJ/HLrBHFY=;
        b=W0RZZJy421jfGqUZ0vH1qUiI26r2+jccqMkwz3f4v66tlUR8QbxNd0l3Nt4pF5Hl4D
         tTLvAI4KOLCwkLhNsMFlnNTkvkar+ScOUJa9ojqhMSj+VbTPo4ZA1T4lwhA5yE+U8PXE
         MosgrvwqeKfMw2ZC9+QN5WYMAF71h4mPhwEJv/PFzJtM3J9ZFOTxXQeDV8JLIFeUavCo
         LQ6kzb5vgyKZKsbJb7WCnkSC2Ue/voQsW0sm/Ztrljc4bParK7eg4GA+t8boCOFLi4ji
         kez7PFeUDQLmP6/ek5nlQ/s/hj+ty4RIK9ZBli4P758klpaXb45jvoRxZ9USF5x0Y4v5
         v19w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763648973; x=1764253773;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PaSB0JDzx/KeBkAD7qB+B6gdM9jZdTTt3lJ/HLrBHFY=;
        b=trMT7+gAzuHn2QKWnqk3rVc6MnXB8W494ynwdGnLorute/R2z/wTdDO8GCEqdI8MC9
         1xLMtOqP6CeVbWAKk3BSDQQsniWUDDOayEQfCHe8d0Vko4yzPZA4sdC+SIM/jMx+XRtG
         JVfV8iUBaeneN2nSrWFTm/48NZNcg0PaBA2jQAWH7+GKtYB/YSLEPI2LLWNQv+4IgpXa
         6Csb3wgSUITyxp4D1WZi3LhUPiz1v88+faCs2ACyM0B8WWRrzwFQmgJIgF/pAcs32R7m
         QDkbD2Irq/iLtxUWJzUcdCEwklR6wCGu8s+gb3pAjbm+3J395yj6MOJXuPSbp2GyPt98
         rdbw==
X-Gm-Message-State: AOJu0YxHMPFXukNhep7gcac5e+14pOF5LxMDCsnrQA4FOlwlhDokcdiJ
	TrjbRsFVpYVekRrAzEKgmF8M+wKjosKu0OrEHNG1Yawo1l+Iww+5tBwG8IwxPQ==
X-Gm-Gg: ASbGncuxgAAhG7VPBSe+2UK3gtX4n2x+GU6QDvRPs6HiG9Jg/vo6UAt0SRuG2IS+Ecf
	yB/xCpwjIamXGcXkVGahJbh+ryHhKcA7Eq/u4+3pP1c02+L4e51Z9z8Qk0aZqw7ffHobso1xRmW
	lbaMDyEI3Qz4aUfPjKUq8ddBDFDZ5QN5F5IWDGCCUjWn4CuSFSuPKdHP1e+ElAhsXR3uuvJ4Q6T
	YSzyNLgAfZIyZuLEz2GbcqIusLKa7aLA5fxQqKuDHmTtnIJleZbic+Oyo1tjZdWOuMqypvg0ykO
	O2ZcLmkQTTZ3WlOjH4xc9x3PbI8zjZWt8QGdQQHLgnUn7pRKbrtsOPml7JXA06vVUOnDdB2CdYF
	6V4MHG+2x4J1UDJeJK7G0TNA/42Ga7xR8fBCDIULWhKynwfm8qKdrboff67pmImwRLSillkHw9y
	Bo3IXH5zy+MHvhOFqMulIBcwfDrUrk5ohWHg==
X-Google-Smtp-Source: AGHT+IFRXp1PdrvCziYVlZhZPS+kvq66GveiKYFYWzSPfuPYcPK4t//nyW6R5AUbCQZ7bSE1VqWV6A==
X-Received: by 2002:a05:600c:444c:b0:45d:e28c:875a with SMTP id 5b1f17b1804b1-477b8aa06c0mr36976405e9.31.1763648972549;
        Thu, 20 Nov 2025 06:29:32 -0800 (PST)
Received: from [192.168.1.121] ([176.206.93.222])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b0ffd37bsm115336785e9.3.2025.11.20.06.29.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 06:29:32 -0800 (PST)
Message-ID: <5e577dcf-995e-441b-9351-11d6da097fcc@gmail.com>
Date: Thu, 20 Nov 2025 15:29:31 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 06/11] HID: asus: early return for ROG devices
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20251120094617.11672-1-lkml@antheas.dev>
 <20251120094617.11672-7-lkml@antheas.dev>
 <f13a53d9-e5b8-4380-b134-16aa81eb0a88@gmail.com>
 <CAGwozwEk0k3K8v2GOX2+9Rrcx_pp4xAmiJExzoRNADeridRTfA@mail.gmail.com>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <CAGwozwEk0k3K8v2GOX2+9Rrcx_pp4xAmiJExzoRNADeridRTfA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/20/25 15:15, Antheas Kapenekakis wrote:
> On Thu, 20 Nov 2025 at 14:29, Denis Benato <benato.denis96@gmail.com> wrote:
>>
>> On 11/20/25 10:46, Antheas Kapenekakis wrote:
>>> Some ROG devices have a new dynamic backlight interface for control by
>>> Windows. This interface does not create an ->input device, causing the
>>> kernel to print an error message and to eject it. In addition, ROG
>>> devices have proper HID names in their descriptors so renaming them is
>>> not necessary.
>> Is this patchset supposed to work without the renaming, correct?
>>
>> If so consider dropping the drop of renames, taking required time
>> to organize with Derek and resubmit when things are ready:
>> there is no point for the rename to stall the rest and quit renaming
>> is not urgent at all.
> I feel like two months is enough of a timeframe for a simple rename
> fix to go in.
>
> I do not want to have to reorder the checks just so the rename can
> stay in _for now_. Skipping the ->input check is important for both
> Xbox Ally/Z13 as it causes errors and the device to stay partially
> uninitialized.
>
>>> Therefore, if a device is identified as ROG, early return from probe to
>>> skip renaming and ->input checks.
>>>
>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>>> ---
>>>  drivers/hid/hid-asus.c | 7 +++++++
>>>  1 file changed, 7 insertions(+)
>>>
>>> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
>>> index 3047bc54bf2e..6193c9483bec 100644
>>> --- a/drivers/hid/hid-asus.c
>>> +++ b/drivers/hid/hid-asus.c
>>> @@ -1236,6 +1236,13 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
>>>           asus_kbd_register_leds(hdev))
>>>               hid_warn(hdev, "Failed to initialize backlight.\n");
>>>
>>> +     /*
>>> +      * For ROG keyboards, skip rename for consistency and ->input check as
>>> +      * some devices do not have inputs.
>>> +      */
>>> +     if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD)
>>> +             return 0;
>>> +
>>>       /*
>>>        * Check that input registration succeeded. Checking that
>>>        * HID_CLAIMED_INPUT is set prevents a UAF when all input devices
>> Just for clarity is this supposed to fix this: https://gitlab.com/asus-linux/asusctl/-/issues/700 ?
>> This model works once in windows users disable  that new feature.
>>
>> Note: that kernel the person submitting the bug is using contains your v8
>> and asus-armoury.
>>
> No. This user has a laptop that has at least a WMI implementation of
> RGB controls (this is why you can see rgb settings). Since you did not
> ask for logs, it is not clear if it also has a HID implementation that
> is skipped due to e.g., a missing product ID. Very likely it is a bug
> on the WMI implementation that is out of scope for this series.
I will ask for logs, but I recall someone with the same model sent dmesg already,
I'll try to find it, but if this is true... Are we lending control of LEDs to a bugged WMI
implementation for this laptop?
