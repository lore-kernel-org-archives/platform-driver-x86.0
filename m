Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B782FBDED
	for <platform-driver-x86@vger.kernel.org>; Thu, 20 Nov 2025 14:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763648530; cv=none; b=AIErIsEcxq+alMnVBmgm6kGSRsCUZ+m1CkgNwfcEHEWrplbWbvHpSSgw0njb1lZ3tka+4UhWSP9/5IYjTULjvEHEiXpA7ff1JEU4chR8ZtgsGc2gV+M9o5/ZmbRU2zoDOLCOjcdfxHI0cJty8CNRbX4uH7wfdzxktzSGiQ/O7i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763648530; c=relaxed/simple;
	bh=YRVeBBMj7ef056SPY/EQlwP1RflC2jv6harh/WizL7c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hq1Ye6mh5mXo7cskeAzK7jjHNcYB55+eYIN7XKNLeZN0J/+og5UVYZHcq3MzoIzVwBP9xDKj/5BktiJLCLxd3sl/7+ZSPQUBUWe2kv2yFnuIxw1Njn7jE9cdnvG7i6g2MeVjWGc3Rq4pT6GZ0NvJlTGaWI3xcFVylaB+5Lt5MBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TSum62jL; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TSum62jL"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-477b1cc8fb4so6389175e9.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 20 Nov 2025 06:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763648527; x=1764253327; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6r7fI0WPBuZgy0AO/PTqbLex+cwYpycr4cGAYLGeSOY=;
        b=TSum62jLfRoXkVxdIFpH/dAQgLcP1sbfH3+aSELBdZp5S77VxaH/8oszxlzS+WfKId
         5LM/18KSZtZ2KUymcItaOC+pzr1unYOia+buBTv12VLtlPfts6KwSqEcxB5ZNHIL0x2V
         rh4aT0+SiYzJLSkfXXD1HcNFCj2HkK7nkBRBjhuyrG9iT/rXsbli2mn6D3cNZhmrMxzJ
         7n/DvYt0rSPjEWTZtdeuSae4rGbZmyTMgjl2hAVWTlHxdvpN8ryPP81QSUNC38fuR0bL
         Q/95oFsG49RtfmxlsaTP/1Y15xo4x9dgbgPzUoEUWNSa6yMpxBCHV82Z2+//1kO5vxYJ
         sykA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763648527; x=1764253327;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6r7fI0WPBuZgy0AO/PTqbLex+cwYpycr4cGAYLGeSOY=;
        b=TLexJk5ixob87b0wmsvLRNAloBGnAZvILdYT0cbEYWjzn/ThFzNYaFdztsl0qAmap6
         UBRCf1HTiyZQEiMhuC2z5gVv2JXFeD1YtsO93aM9zQJrAPFobE2PZD/m0Ru7xRWMASLF
         QYIzGywAK7kh2xHZUjqZoU+khNuRjJTrYkAz2aHlDiHzWNlOWFV2t3Be2Y6UxM8/siMu
         C01c2eXwL1I+/bu9Uxfke+B8CbIUQZMMlKn6KtZmqxzeXXBPnrqNNtabxs3Eomou+IQD
         NjGsHVUnQRCzbieUDk4xZLWQQ7m/El07cnMHJTnyX9+gwB1Y4YM+OGZa/QsgwgYZXW2U
         3VNA==
X-Forwarded-Encrypted: i=1; AJvYcCWpUfxw9SkWTYlFMa6jXKs1tJLyPllCtR1Hbto1BH5rkgjqfzS3E9kIud3mNI6Kpy9vTwxG6FIFgljLoIPE1CAcNB22@vger.kernel.org
X-Gm-Message-State: AOJu0YwPQxoC/I6zdxZsJZglZu6BObTekWqZsmxIK0dkBKSnzuqQfibH
	u0rH19DmP16+r09/up3VmfOc2GJqOqJuU8z383AJ4BxnNxI69098TM/1
X-Gm-Gg: ASbGncuJyohr1aLesQ7K5q9IF0kCz/lUy/Raz8qeWaL9RkTOLa1M2xHl4g725cvMZ95
	qe3ZfgqkceY7Izu9Y3uEi8qyWreHEXAJrLBRTZsAb9riABDjOOYZvPXLRXNyMcXbDeKbsNhUkpj
	kBudy14saoujO1RgmQVyO/PgBmjv9uE9y1AKxQ7gmAaszUxI2AoXqEDKCRa4oX7PdBEHYoBKOvY
	4o2d0nkNBiP/QabqeCLKHcZXdoHt/ajMXGnFaFCRU9fJKkNkJLSe/zwt4nKawYwjeJjbMcSS/Sr
	xjbwwHRAi7OojRcusv1bG/0VhhAKZhXKuz8KQT7vLD3KJqBklpQKqi+kPTun88iKJilGhhw5Wc4
	33DDn4Bdz9FTVFCLRe+oqGj15cE8xOrJqDNIJNwUmVSv8piVOYyyar21GM76mIZSJuOmGG4WsfI
	gE2auuiWJ7/xUPOhyAED3wEgfhDdthJBq66g==
X-Google-Smtp-Source: AGHT+IG5vqkGiu0GvlQgoxCMGD0CADTUMG278xB+EOd9IXf28tm4i8blPZUxFfIazh/0hI0Gyggy9w==
X-Received: by 2002:a05:600c:1f86:b0:477:73e9:dc17 with SMTP id 5b1f17b1804b1-477b8c935d2mr39449735e9.35.1763648527306;
        Thu, 20 Nov 2025 06:22:07 -0800 (PST)
Received: from [192.168.1.121] ([176.206.93.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f2e454sm5944605f8f.2.2025.11.20.06.22.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 06:22:06 -0800 (PST)
Message-ID: <7f10404f-de61-4284-b70a-5f0c839896d1@gmail.com>
Date: Thu, 20 Nov 2025 15:22:06 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 11/11] HID: asus: add support for the asus-wmi
 brightness handler
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20251120094617.11672-1-lkml@antheas.dev>
 <20251120094617.11672-12-lkml@antheas.dev>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20251120094617.11672-12-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/20/25 10:46, Antheas Kapenekakis wrote:
> If the asus-wmi brightness handler is available, send the
> keyboard brightness events to it instead of passing them
> to userspace. If it is not, fall back to sending them to it.
>
> Reviewed-by: Luke D. Jones <luke@ljones.dev>
> Tested-by: Luke D. Jones <luke@ljones.dev>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  drivers/hid/hid-asus.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 6a355c174f29..ff5aaebc38e3 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -324,6 +324,17 @@ static int asus_event(struct hid_device *hdev, struct hid_field *field,
>  			 usage->hid & HID_USAGE);
>  	}
>  
> +	if (usage->type == EV_KEY && value) {
> +		switch (usage->code) {
> +		case KEY_KBDILLUMUP:
> +			return !asus_hid_event(ASUS_EV_BRTUP);
> +		case KEY_KBDILLUMDOWN:
> +			return !asus_hid_event(ASUS_EV_BRTDOWN);
> +		case KEY_KBDILLUMTOGGLE:
> +			return !asus_hid_event(ASUS_EV_BRTTOGGLE);
> +		}
> +	}
> +
>  	return 0;
>  }
>  
Reviewed-by: Denis Benato <benato.denis96@gmail.com>
