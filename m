Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A54372AD8
	for <platform-driver-x86@vger.kernel.org>; Thu, 20 Nov 2025 13:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763645371; cv=none; b=OsZ5YbZf3Y4iWNUvfmkfcmzz7muedJYbgJuOjLrlj7nISqvoLVGFVei8q8OkcVs/XPkqGQqAHZLsmDCqUqXJiTww0BHsBXl48eDh+m6xQ91z1WrfDMMMBB9YEUW2VfaTcTQ600OzbosKwmOrWgx8zpTSqkR4u+XCsuGAizZOIMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763645371; c=relaxed/simple;
	bh=Mv7CXuKik3QApyGseKx4DGFBVAEG1+yGjHEwnPo7OcA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E2g0lSS3JpMNYnsVoF88WxpHysGTTSLSsD7U5nnjgBgIEP9JZCkCS2ha1R+7h/wNVZjeAcV5VhJe5yGKxKbhnifH2IW/T60SRadtvCbkIV3QDeeYqloPIptbJl30A3/YpKCj5xM2Dce3SmGM7gmqC1Gu91CD0+/Uynk589s+NFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jBw5OZdL; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jBw5OZdL"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42b3c965df5so508616f8f.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 20 Nov 2025 05:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763645368; x=1764250168; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9gJHwXiCYWXaORTsE+KJBd81+C4osD9kDy/Zns4uHsY=;
        b=jBw5OZdLSGE4Q3XPq4wvhuatQs1LtPz8tzSv545AczxhCSiTRdNGutyLWLxqI1qpgy
         pCkZkCE4tFOKuc3J39L6ST/apH3qNmXTtomIxFaMLqyTkkFNTPMHZbtqsCVNxufBi0bf
         y/JlTgLhkSQwxv+uI76qtcWYbksi5phbD0oryxluAwKwCERHJjaSUnYk65l2vKTTEqYz
         KNNwqhrZVyCqgel3SCwqv0JH+FmHXQ2z36RWS7I0pSAvi4+I3yuASwB9J/hgfaHH1kv5
         lPhQs5a/Ub6z2bbGqoJibhOFlWGhkppwadzQAck4b3zCxScC+A4QvU0fnwIbvaXYCXWm
         rPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763645368; x=1764250168;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9gJHwXiCYWXaORTsE+KJBd81+C4osD9kDy/Zns4uHsY=;
        b=l73UkpuETc8E4xdH8ew/A+xkRV/T9CTlPGHowS/b7XqgPejSP4zlyY5dS1KbAN6wXp
         wLSiwrkH3aS7w/ssLXT4877JQZjeuVhOH/5KaU7O3aq44iPvK2q2ZChMMeyx4NMUJQNs
         mvX4l+Lb2h9co61ljDW8NcQQyQLQLOzVmcfGIDb9tNCmImJROFx1ObE1QH69TEGW98mq
         bt0zg7KyFTAg8PYSDEuFvEOA1OCRlqH5k23Zt8YE1DrPnVUyO/7IeoJZYjlWOFelgCvo
         E9ussurIhsN/Evb2Fs9BYxI7kP9ceolRG9KwwXI7ipYkyurHlNR+05/9wMc56NdHY1cA
         8UFQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5cTgP2kLNA9Te2QenpW5BSQ17SxC9PQssagdbvxst6fL5zOG29szgPcZQlCdSWaWHfXhWW1+jrEx+mywSkrS7pVkr@vger.kernel.org
X-Gm-Message-State: AOJu0YzDnfw4mRaWkYSmDYVbLjX5gpls047ASLgh4Iu0E3JXDP+gnmwO
	CzUp85uU1hQS/Yd7bQBQNMPCaaAZZTjsBmVRVJIjwqIc+wM/TeL/wdZ9
X-Gm-Gg: ASbGnctnBVDwMm+bmfL/SKFT21zenRd9zs2Mxh1+DhppflMpv2gKdDMbwPyYpceLXko
	4AFG4+ABTfukvby+H+LO9IiV4k7hHIcEPS7z6qKKSU4HrxQyJkzpbqU3+95a0HnURf35841gffZ
	OZK+u+6PbvzaRYmg3JSDKJiKSz2OBa5WOO4W5m/KLZIrLwHm5NAslQdtva/n+IAHtuhXyRg8Mnl
	YRyjs8ejJsThPtfLYAN1Z0c/WWblKwD9COsn6gp2E+IK5zQwRvpz1+ze/OifTPCMMfxN97wQojx
	KBtjQhbmsx9WOt5FvU4Lz6VOQZvSF+VNtJfvP/tgXjfzCUJ9A//c9STyG0D3NjWXp9QRh1KX2El
	kZRN/cB9Okn0GDpPN8Rom7jz8W8md4gC+WCMhiX3K4sBFSL1bzjxj0kimS2xtPU3C1TSLuZ8L/v
	3j/UOAu8mTynHaqknO1p2sdk0=
X-Google-Smtp-Source: AGHT+IHu9iOLGgXLRqf1kRwcjqnxWD23aUXZEJvx/ai2yOiH44GOaw7cdUrrhIYsmVUQvD1inB9aZg==
X-Received: by 2002:a05:6000:2dc9:b0:42b:3878:beb7 with SMTP id ffacd0b85a97d-42cb9a67a4cmr3115194f8f.43.1763645367651;
        Thu, 20 Nov 2025 05:29:27 -0800 (PST)
Received: from [192.168.1.121] ([176.206.93.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa3a81sm5591570f8f.26.2025.11.20.05.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 05:29:27 -0800 (PST)
Message-ID: <f13a53d9-e5b8-4380-b134-16aa81eb0a88@gmail.com>
Date: Thu, 20 Nov 2025 14:29:26 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 06/11] HID: asus: early return for ROG devices
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20251120094617.11672-1-lkml@antheas.dev>
 <20251120094617.11672-7-lkml@antheas.dev>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20251120094617.11672-7-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 11/20/25 10:46, Antheas Kapenekakis wrote:
> Some ROG devices have a new dynamic backlight interface for control by
> Windows. This interface does not create an ->input device, causing the
> kernel to print an error message and to eject it. In addition, ROG
> devices have proper HID names in their descriptors so renaming them is
> not necessary.
Is this patchset supposed to work without the renaming, correct?

If so consider dropping the drop of renames, taking required time
to organize with Derek and resubmit when things are ready:
there is no point for the rename to stall the rest and quit renaming
is not urgent at all.
> Therefore, if a device is identified as ROG, early return from probe to
> skip renaming and ->input checks.
>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  drivers/hid/hid-asus.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 3047bc54bf2e..6193c9483bec 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -1236,6 +1236,13 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  	    asus_kbd_register_leds(hdev))
>  		hid_warn(hdev, "Failed to initialize backlight.\n");
>  
> +	/*
> +	 * For ROG keyboards, skip rename for consistency and ->input check as
> +	 * some devices do not have inputs.
> +	 */
> +	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD)
> +		return 0;
> +
>  	/*
>  	 * Check that input registration succeeded. Checking that
>  	 * HID_CLAIMED_INPUT is set prevents a UAF when all input devices
Just for clarity is this supposed to fix this: https://gitlab.com/asus-linux/asusctl/-/issues/700 ?
This model works once in windows users disable  that new feature.

Note: that kernel the person submitting the bug is using contains your v8
and asus-armoury.
