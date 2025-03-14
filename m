Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86811E5701
	for <platform-driver-x86@vger.kernel.org>; Fri, 14 Mar 2025 09:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741944885; cv=none; b=fivSq8+ue5R5HEJsir9rTZPPwYiXQdCcSH1zLb+bviaX3woDtQMkM+sTiHfhPLr+6o5yXvCLPoNSXdO88KwE93Gkl0pc2VYTnDyGvEGpMP4suMph37c1kq00+V96E52bAfz4elroiI5jj4/w4G4B2m1aE20Iaxljo0ar2EYTuIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741944885; c=relaxed/simple;
	bh=/QHGyNTxkBGYmNxvkaV7Ph8WtB7cBiAo9r7H7Fk9QrY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fI0RfkGcIGmSvcf8WT50U3xveREOTo2G+NlWiClQyguaGP5KDnfW9NpSQu7jcyNAh0gR2+ppmQbXXPaBqtB+VkUXzRjI9kuzlTWdStY8sdjTz4FEZ+MR4sOeGjO/Fs53nAjCEeLVznK3875ZK+d0bdDYUP4LITefAVqGO+tM/Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SuXoxMcn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SuXoxMcn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741944883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o8xq5quBupqWX+TKt9jL3mL8tzKVIibeaTozXMKawhk=;
	b=SuXoxMcnQ26aV+SCR09Yx2InRl53Fh5NE88NfXGVtYXlAet6TWkghSP6jiyl1x1f7c3dp1
	SdojV2NvdBdSk6GeR4V9SN3iAeQ41F0rykBb9y4EEUQgRp7UOV4ntzpITMKQ/X6IpG/30B
	hAGbdiCPpMtalQQ4ywOCuU0ZJingV6A=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-343--E9ijXrrPOWKyMrl5LlF9Q-1; Fri, 14 Mar 2025 05:34:41 -0400
X-MC-Unique: -E9ijXrrPOWKyMrl5LlF9Q-1
X-Mimecast-MFC-AGG-ID: -E9ijXrrPOWKyMrl5LlF9Q_1741944881
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5e636b06d34so1946064a12.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Mar 2025 02:34:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741944880; x=1742549680;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o8xq5quBupqWX+TKt9jL3mL8tzKVIibeaTozXMKawhk=;
        b=msEKxWM2wYgM3m2Ic01vxBMllPfj6KtQnCXsFvCAzYg82ZRdZvHO96UZM7REQknbsa
         2JbApYKV99YkSne5c4NDjXjiA0PE1NX0nniWwWPDWWG5x4yLnThbdxDCN5k7LRxFqvi7
         EiodXnkVE9NpiTg6Cxdao+tRcQCTLL7YTZcct0YgIYWhlB5KlzegXUmVKxNVzXeBqHyI
         YXOVZ5yPNggqLbvTUO3nVGeSWpg7FuOGlqK/odLxGn6yT0pkkIQhEBT15otNTKBwqm4O
         rkMoTm9TVpqXpKR3GN8p5YT/fNbbI70TSCwA27flmqFUujX76xva4Q+bsBR3RNWypooP
         pRbA==
X-Forwarded-Encrypted: i=1; AJvYcCXmmmQVjkUvG3Qw5FMsKK8NLkdRkVVH54+mIPV8WZrKcmVXCTd1sETbgBDjVr1w7nJkiepFOHc3EL+YpOZJUVupZWEd@vger.kernel.org
X-Gm-Message-State: AOJu0YxQBPDKkve+ZN/HAt7LZjjnTVYpRETMrXPPh8reeFUWZguJSCdA
	i/6hcMnAGYIAc19TjHH82WITB/w+udnW4hz68GOc0oolsBa5LBLPpzl3Y39OzfkMa6n/aywdzK1
	kdh5+QaY4I/XffPIPQRWNRXOUjdnNP/NmUcHZuakdUc0AEq9Tg+AvfZaGoJr0L78bu+Fe+1amWT
	fcZ6Njig==
X-Gm-Gg: ASbGncuZRITFrsm+hNh9SK62IgfxadSsxPGkQhJGylHiiW7oZy9DpVUxtpp4/qocJS1
	PLKg1Vlsqeqgr1Zxp3/l4HbDCpEQ9cZZWSwExxc6k79tE85qO10Q/lZcPwjGa0xp6C3q25ro+XT
	yNq8wUxDcn2Zbnzt3o4x8hyar65w98MsBAruC1pOE82FGhYQa/TCXTcMbz6I+DYfO01YqdgLVoY
	FGVnnaydSEey20Q6u9UuR1wWSTP9hDEbcA5B9AtEfcGV/aOI388fmseJzHmIoZsBbscRLvuoOVA
	UKECQQygBY9jiBd5eX1CFPf+lLW6F6ORbF9JtJOWHBB9ohFI1//ZlFtZ/sYvZaNulO/zVkrZH5V
	hNMkNH9bouL9RrLSht/liEv8gFlzbeHYPyqOdbUzu3cN6JIwp7hqaDk+49eysTZGzGg==
X-Received: by 2002:a05:6402:5186:b0:5de:39fd:b2f5 with SMTP id 4fb4d7f45d1cf-5e89e6b0197mr1954921a12.1.1741944880080;
        Fri, 14 Mar 2025 02:34:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpliGVYSifHjurmVbgm/VmWpvbgqgAQYjQGwczC1Nf1XUS4HyN4u1bKDnD5mrJoxrR0ct+mA==
X-Received: by 2002:a05:6402:5186:b0:5de:39fd:b2f5 with SMTP id 4fb4d7f45d1cf-5e89e6b0197mr1954881a12.1.1741944879441;
        Fri, 14 Mar 2025 02:34:39 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e816ad3921sm1792779a12.61.2025.03.14.02.34.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 02:34:38 -0700 (PDT)
Message-ID: <4970c2cd-9637-460a-8e85-bc44f7b0a550@redhat.com>
Date: Fri, 14 Mar 2025 10:34:38 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Fixed ideapad-laptop driver to support Yoga 9 2 in 1
 14imh9 unknown keys
To: =?UTF-8?Q?Ga=C5=A1per_Nemgar?= <gasper.nemgar@gmail.com>,
 ike.pan@canonical.com
Cc: linux-kernel@vger.kernel.org,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
References: <20250313151744.34010-1-gasper.nemgar@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250313151744.34010-1-gasper.nemgar@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Gašper,

Thank you for your patch. 

First if all a few generic notes:

1. When sending out v2 of the patch please add
   platform-driver-x86@vger.kernel.org to the Cc

2. The patch subject (first line of commit message) should have
   a prefix describing the subsystem + driver, e.g. use:
   "platform/x86: ideapad-laptop: Add a few new keymap entries"

3. Your patch is missing a signed-off-by, see:
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

4. Your commit message / patch should also have a body, e.g.
   the entirety of the commit message could look something like this:

-- begin --
platform/x86: ideapad-laptop: Add a few new keymap entries

The Yoga 9 2 in 1 14imh9 introduces 4 new hotkeys which are not
yet in ideapad_keymap[], add entries to map these keys.

Signed-off-by: Gašper Nemgar <your-email-here>
-- end --

A few more specific remarks below based on looking at
this picture of the keyboard:

https://ardes.bg/uploads/original/lenovo-yoga-9-2-in-1-14-g9-550178.jpg

On 13-Mar-25 4:17 PM, Gašper Nemgar wrote:
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index 30bd366d7..af124aafe 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -1308,6 +1308,14 @@ static const struct key_entry ideapad_keymap[] = {
>  	/* Specific to some newer models */
>  	{ KE_KEY,	0x3e | IDEAPAD_WMI_KEY, { KEY_MICMUTE } },
>  	{ KE_KEY,	0x3f | IDEAPAD_WMI_KEY, { KEY_RFKILL } },
> +	/*Star- (User Asignable Key)*/
> +	{ KE_KEY,	0x44 | IDEAPAD_WMI_KEY, { KEY_PROG1 } },

Ack.

> +	/*Eye*/
> +	{ KE_KEY,	0x45 | IDEAPAD_WMI_KEY, { KEY_DISPLAYTOGGLE } },

It looks like the laptop already does display-toggle as Fn-F7 although
it like sends super + P for this (AKA meta + P).

So mapping this to KEY_DISPLAYTOGGLE seems wrong, what does this
do under Windows?

Maybe KEY_ZOOM ?

> +	/*Performance*/
> +	{ KE_KEY,	0x3d | IDEAPAD_WMI_KEY, { KEY_SPORT } },

I think that instead of mapping this it should be handled specially
and call platform_profile_cycle() instead of sending a key-press
to userspace

> +	/*shift + prtsc*/
> +	{ KE_KEY,	0x2d | IDEAPAD_WMI_KEY, { KEY_PROG3 } },

Looking a the symbol on the keyboard this should send
KEY_SELECTIVE_SCREENSHOT

>  
>  	{ KE_END },
>  };
> 

Regards,

Hans


