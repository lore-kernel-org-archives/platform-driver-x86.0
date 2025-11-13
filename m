Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61091E2834
	for <platform-driver-x86@vger.kernel.org>; Thu, 13 Nov 2025 00:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762994762; cv=none; b=reTGuXj9ezjVDmJS9xV0ZxHWcD/lV0GVUZ+PRUDvUchYjI66FwgYPtyIWAzITAhTSKrXu8ndEteADmbPL/vZ6ND0TvD2ADPFGwam+H3aWmQjLWKvNA16NtGTImmeSLexnNRkiJGo186nqgNTHnuiaS/pkvxBPLmWK3wqAuN7fZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762994762; c=relaxed/simple;
	bh=L6MdIryciHIIdyMFc25M+QNex8Bs9rTNozsEgXpbrcE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n5dyzGS64iXQw4FVvP3XtPtXqbN8SCa52y40uKuUQf1UkBRV85vgv2ekBRe/pTN84wQAboIKo7u/CHw5MUVDkO8xatYg6iroswYhqbcQBWZM0u2613+TXIPFZsbhUObpGE3b2pcaZWMweqjzQf2W6QC2yPnG3VOxjc7O1nggHvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kPBaYa46; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kPBaYa46"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47778b23f64so1734215e9.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Nov 2025 16:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762994759; x=1763599559; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L6MdIryciHIIdyMFc25M+QNex8Bs9rTNozsEgXpbrcE=;
        b=kPBaYa46DcTCyF8+det4oWE7acR45Xwt4J4zRE/LTBLziV0r+frd1+Tlv0q//U2OqQ
         5E+wwDQjSFo8RR+4Llruw8bZkX+p/6cWNfNx2YxXV8X+PkZYo0/KXWXtpItYT5pmV9AF
         ZAyxGYNNUQjhWIwB686Z65C5Y1mxnWQZ9lsYcg7RatNGBvN14Lc1KQQaSsep3BWiw08W
         Hx0iT50t18tLLugjYABCayOOnHRi3mOVCcVd9t4k1V6oXFHdp5DMbjW7bc67AUS48RDy
         8CKbq8Oz9fG9Y7v06I+pttZYn2vCyaTAZJz1X6t740Mztuz0uKlPl6mJuDJrs5oYaWku
         1B1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762994759; x=1763599559;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L6MdIryciHIIdyMFc25M+QNex8Bs9rTNozsEgXpbrcE=;
        b=LI3IxiQ0OwIpGAv/cXfkIuQYy9rvZyCSeyVHimMwPe6BuqjgONduIGW3TrRQJ7sBOG
         YWC2NwPI515THCrgOjgN6T0rln1ndcfoVbDYjTqAm36bAefoS6eWYhUZ5K0YVWWTszfv
         uLkw+XjqGYS2z1ta5PmbJVMdFrJR5dRfTadwIHxNzTnWoJSfkFE775UyAp0lsO855yVl
         udPydUtUYXafh6E2StvWzQbZhka2Sf9rT+t2HSzrh+sT5vSZQfSi1PZugWoZL24LA5Z3
         NstPWOmStD6NRCvQHK4KPl5tM8Ll22Q2XivwKKfUzpg+6uPxGPExk0CIaV6m3xCUbztg
         cAfQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/5+fOt1sGn46HA0/XUnjWkTGTiiHFsAjDq0n9UGqWc50xgPuBNf5jH+PXnVr7NXvaYGJlw/r0ZcmHASIm293CTA7N@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6WI4h97ma3dBeyznK0dajO4cXVYW0WHkqOPLlhWx7xP3Q2us0
	SXRAk1A/62aSMKXY0A4teGwsznGaYAQ/4txlnnJy7Fi0wJuLGNzK8/+k
X-Gm-Gg: ASbGncsPfpOZokvjgXZSeCGhbq8oMTIHrrJrWhcn/JNMN85OX4Ry+3aEWmL+PKGnJ2w
	UQLXv8bajouHrU/QwECIPm2GfW9vY0MhP5+JYUkZyUGASD6QOaeXDDzRfzPiOtmmLiwMOV93XEH
	3ZgVfyljLESNd8OrkVZXq62+wGqpZn5Sm5XZ4tDxcv2eZKT+Ld2x67UseVp07YN4lPsF3ZA0V/p
	8mzrCEoCjmZ4DgVqmYx1UAylu77aOlmAX9LJ3UQo9oAVTyZ03yUaMPNBdsBs2vLTIqfSUS6wlQp
	fmWRFD8wgCq1GeTRwI26Q9vqBMtDapkoH6iSoEMYLJbmHlqqFypJckzC/EkQjGt9kwa9VWkhtZg
	hta0MSpXEH5ZBP/+w+jhsEVv0WQrK4ZqHY794U+EiDOmBxQmZhVQRO/iIqtZzn44LXEBbwRDCwo
	mCxjoBF5DCLPZm
X-Google-Smtp-Source: AGHT+IG8UNRUrUrgXbekaKPn2Po1l5mxi8W3YJa544txuMvsGRwAmb+3uXskvL2GPN1MJkZnmeqFMg==
X-Received: by 2002:a05:600c:3550:b0:45d:f81d:eae7 with SMTP id 5b1f17b1804b1-477871c4762mr52607495e9.28.1762994758707;
        Wed, 12 Nov 2025 16:45:58 -0800 (PST)
Received: from [192.168.1.121] ([176.206.83.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e85cc0sm625869f8f.17.2025.11.12.16.45.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 16:45:58 -0800 (PST)
Message-ID: <7566a1df-35d8-4c47-adeb-4f1087a7ce0b@gmail.com>
Date: Thu, 13 Nov 2025 01:45:57 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/10] HID: asus: Fix ASUS ROG Laptop's Keyboard
 backlight handling
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>
References: <20251101104712.8011-1-lkml@antheas.dev>
 <CAGwozwE+3vkm0-amRqnNJBzxTvXabgBF9h_G_vG_L7OJj91LBg@mail.gmail.com>
 <27a74ecc-bff7-f3ae-b23e-a8362ac3a6b3@linux.intel.com>
 <CAGwozwGpacR=wYXpf3vOiwWNxaV6pJ6CdE-E-G1gRRpO4VHVMg@mail.gmail.com>
 <74f91d3c-6494-4754-a10f-4d8c1d45f7ff@gmail.com>
 <CAGwozwEKqqJxxmtjJhy2MzNVhmBTMmy8xG5TZGkKJqJCgK=X5w@mail.gmail.com>
 <CAGwozwH4_5LnJ4kt-sbdwzL5Ezt74ddPOpGqvTvKiiVzkorSMQ@mail.gmail.com>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <CAGwozwH4_5LnJ4kt-sbdwzL5Ezt74ddPOpGqvTvKiiVzkorSMQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/13/25 00:22, Antheas Kapenekakis wrote:
> On Wed, 12 Nov 2025 at 23:08, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>> snip
>>>> Sure, sorry if it came out this way. Dennis had two comments on the V7
>>>> version of the series.
>>>>
>>>> The first one was that asusctl has a hang bug, which he hasn't had
>>>> time to look into yet. This should have been fixed by dropping the
>>>> HID_QUIRK_INPUT_PER_APP. I retested the series and that QUIRK was a
>>>> bit of a NOOP that does not need to be added in the future.
>>> So it is supposed to not regress it now, correct?
> I missed this. Spaces. Yes, quirk input per app created around 3 more
> input devices per USB device, plus the dynamic lighting one, so you
> went from 2 to 6, and there seems to be an issue with asusctl and a
> large number of event devices, that caused some intermittent freezing
> when the user typed on certain keyboards. I removed it. Although, not
> a problem with the kernel itself, per say.
Okay, I will ask asus-linux kernel man to load this patchset then.
> Antheas
>
>>>> The second is he is concerned with dropping the 0x5d/0x5e inits. Luke
>>>> said (back in March) that it is fine to drop 0x5e because it is only
>>>>> snip
