Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0954B31A065
	for <platform-driver-x86@vger.kernel.org>; Sun, 21 Dec 2025 20:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766347773; cv=none; b=KkHTxChuwmAXqwFivE1rWASmTFeCf46YVo666cD72qmJyCyqbZGYRp1YP49AYJDGbZxn0+KNM7bFXTC1StDllJNIl1rAG96u64pplFK5OvveE320fpf74Vr/ifMa4nVE6t/Se3Cia0wNnsoMd569cTwu34QUeFB08WYNg5CnqWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766347773; c=relaxed/simple;
	bh=pkSHrtlpjtTr4esB7K212Q3jAyGZ90Xq19EK0ko3rjE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OFWIKNLObaaHZ/OiLQ39KeW26VW2UxB5i5kTU1x1UAUGvxKmbu+2A2jvmoZQ3CMGBupg9tt80HjdE9k1mWGry/dmiEb/iwyLH2zbfen0FlRM5J9LcYEl3iZBvfZim+VAcVI4zi4MJ4y2wgWEFdFUCei3z8DJZTZ06saedFgsPUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i+Hpnn5x; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i+Hpnn5x"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-37b96cbd875so27737511fa.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 21 Dec 2025 12:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766347770; x=1766952570; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gOM/Zs08kE5JjXrr7rPcPdeZybR5dEwaO1Uiob/hfTo=;
        b=i+Hpnn5xuy4Mb1BOL8ndfd+WWwUVRi8Cg0m9KXJ2KOBS7paAp1SD4aOOdIpS400R8L
         Zgxol0I5KblSqmlEWdE+ajZFzcpsPtvTepD/nZQtzV4kPaB2CqW9HdGtK31HIYnkgwbr
         BRIYlarhRdIyZe003D1GXdSDxbq/YB2KUSPYcf7vjg74lF48U5hZgYwrBQaosmao+SiJ
         PXXwZmZgsjumXFMGu3VkfrQVkvc9mdtIv/tAivOrwSj7oabWRJ3lOAqCi7l9W5ejuWxI
         WLAYPSI3p9MOTiKI1V/NIqCcvLX1JKp+iosTXk+AXzeJwMNT3fnB1Yk0oXb3V++IbkDj
         TrzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766347770; x=1766952570;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gOM/Zs08kE5JjXrr7rPcPdeZybR5dEwaO1Uiob/hfTo=;
        b=EAj5D9WFV7OX9htTUxRqaR0VQed1S4LLeuDBUEKap3ESOcClAIAqKJ0NlJf8VRHq0t
         59XHLwRe1BdH37P2Gd8OFyGZIjvSDiKc64r+2A9Q6zCg+b5ve5T26YdR91koJP1Pl/eT
         P/X5TpqmMCetGAlwhDhXtcYNmqeNwKKzHAtFLeT0ZUZd58pBeXdSYFsfJDYyYgZev1cA
         gQNzB4ji3/Y2UimsmBzAizK2JZjqUTMp6XVejQczdeUE/z9W+l9NCehJ8Qyrc9iAIMbU
         CSd/Tgz10E+c3an3iaCUyHYzqWFPBSjAuA5ErbBXnctEbQZeZ0yWV+Hf6XxZ1PevmETB
         5i7g==
X-Gm-Message-State: AOJu0YwgvdrRXb1Nzf6Jh92Zb2p3TuWNkYHLPWi4kFlUE0Zk2SaBW9ts
	zZ4MFZ16ucBPYJUuSIQODe2HiG7vPnTBj02yd3YIcqURnTS515zBR/zV4AzM8JhcJ+RYUwL5DgP
	aP/cCZ/piXJjyRwe5oUYSwlpi5BpN6r8=
X-Gm-Gg: AY/fxX6AzDHnZh1/4LSYg+QDhPzb0K7b62bVWxFEwSIZ9dVszoVKVY+q5NiEPy5wi4t
	IV42yttAagjD81r4WcQpzhokJiRDxHK9V0JxSil4YPicYi473CUVWErSLiXtUOw3iAnI9j++HfU
	Blr+M6r3vIUWq7rmkc0YVV+xl0cGYyuzKJQ9XCnUMlA7rC+zE/j1dMIPAdZt+iDE9qkTJ83lK2p
	D+C54+rbA69cv11Bv+NbcNamSKPN2vSklZuVKOW6BLtbgw6w3t1krBZ71cEvkBXw8ZIAWvLpNhG
	4frNkiiMnirb9WY=
X-Google-Smtp-Source: AGHT+IGC3ouh39IEVkkxFH4wTNKTm8RXTOpmuOheoY/ab2kSzg0FQAp42gOf7Gn6LoYakWXXx+EtdErK7z7kIFCEXSI=
X-Received: by 2002:a05:651c:2225:b0:37e:5602:4a53 with SMTP id
 38308e7fff4ca-3812162148cmr31919101fa.22.1766347769880; Sun, 21 Dec 2025
 12:09:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251221181724.19927-1-timwassink.dev@gmail.com> <1c2e0f32-8110-4bf1-9c5a-e4d6dbfecc7e@gmail.com>
In-Reply-To: <1c2e0f32-8110-4bf1-9c5a-e4d6dbfecc7e@gmail.com>
From: Tim Wassink <timwassink.dev@gmail.com>
Date: Sun, 21 Dec 2025 21:09:19 +0100
X-Gm-Features: AQt7F2qZeIO4S_S4UmY0B1XMNAaO48CYt1b4RJlF4_TI0_m0Y6QDLn-z7C9vYzk
Message-ID: <CAD4HHcW_b9DPmj0rEL8+QuvVCsfMHnTQnH2h6+w+yzVOgJpFyQ@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: asus-nb-wmi: Add keymap for display toggle
To: Denis Benato <benato.denis96@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, 
	Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones" <luke@ljones.dev>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On 12/21/25 20:45, Denis Benato wrote:

> On 12/21/25 19:17, Tim Wassink wrote:
>
>> On the Asus Zenbook 14 (UX3405MA), the Fn+F7 key combination emits
>> WMI code 0x2d, which was previously unmapped.
>
> As in "unapped scancode: 0x2d" in dmesg?

Hi Denis,

Thank you for the review!

Yes, exactly. In dmesg it was reporting:

  [ 906.273271] asus_wmi: Unknown key code 0x2d

I found out about it through evtest. It showed the following when the
key was pressed:

  Event: type 4 (EV_MSC), code 4 (MSC_SCAN), value 2d
  Event: type 1 (EV_KEY), code 240 (KEY_UNKNOWN), value 1

Best regards,
Tim
