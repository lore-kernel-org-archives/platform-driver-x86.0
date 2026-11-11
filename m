Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794417186;
	b=3kczcVf6FJwaW69tivpLgzu0pcN2xFHzj/q6jMLu/U1+X/dAbTzZhCKFa41RugQZxQz1
	 6g5NM/l3F9/QtYHZi6MJEFJ3qnaTjRSmuVqkPXGAvmxUm0hr2OJCahEUwFVB+s/bA1TrR
	 OsJTLsoPfkBCkehk+xuTlTChRy+H7TK6UkswJLULanDdHqF6+jQb1ao3x2dXoNsiWvfuc
	 4w/uZ0SPmck96AIrt+RxFy02qsdXTqGdVv4vly+cYN/s0Pt1sw8YvzCtqsj3MdWIzwsRB
	 FvwODZbQpt1wc6sVgIaJoqAhrrd+cUxUQKiFLGVrekbUZdLHqrEdrKHXmEGMDVgZg9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794417186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=yQBRHBIhMCpK1GaG4ls2kPSsfswknz2sHPrFZyTAPUc=;
	b=undnNnh7kGmYcca24BxwGt11xIHhUi/exipjfKgbsMMQBM9gcHHa346V8b3ABzccc44X
	 LJrlOZjbjI7Le2ynBfcJPShon2N6ZRmjPvAhGhsOJ7qxaFskiODV0h5a6B2uQbAbgi1ja
	 RVyhUtzgBEtfD/XEXzb313mfVdzRyMJFM4CjS61vgjekNQNt8rVOk1ELn78yFCF+/SsNY
	 3SmUllWOth5Ie8BRhKlBkOK000qAKkz9rsvjPq6idccsmJWLes+5vIxGbowGtnHPVlze5
	 dP5tYgGRgPSMwAPoRYMp9tySRJXNbr9KzHf0BPq8/kuvbMniS8Z96uw9ZrojJ71vp4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=awi2vbah;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34AE606A31C
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 17:13:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E34AE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=awi2vbah
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b3b4944abeso1375750c88.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 09:13:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794417185; cv=none;
        d=google.com; s=arc-20260327;
        b=GJ9rOwaNktsdWqKYKe/ziMEfgdxAmN1D6j1QxZM/vlHh7Oo2hVcfZHCWet97eibSb9
         roHeZBR+eYsN5+BfQtmnrxwTTF//GpahrZ1mMb/0Z2xY9piTbZLxd80i8A7MNzWunt8+
         ZNX6uV/Ufh3mTbyolrtmvao+HKy/pcMoyzyRoMStIDmrXOGbp+qHTpSFIbg+Laqz+t04
         GpSOPVha0kmR309oKYKktApPLv+uyVQQ6BOG1s1bM+eDfmDRdgpxBjCYTV+UQOfZqKtG
         6eYaSv1k6PdEMIOz2Yhf/opO3EbblM/abh9dYNdvK1z1aNResnlpigEe0MeTjc2luIJ2
         dwpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yQBRHBIhMCpK1GaG4ls2kPSsfswknz2sHPrFZyTAPUc=;
        fh=wiupsOV3rHNF7WJ5ROGdWfKUYwuuXwWnWUcgkUQyDT4=;
        b=IrTrEGyMr1GTLKjM7l2C8wLYN6bycKPHNcwa6l6FGcIO5JwNY3je4Ge5YIVrWRjmgR
         ElaM3YwHqzVPS7995OS72MUVqRqHzvCVvkGeR/nGy02hv7QmymoBgH24zsnnpHpqNEfU
         OZBbwUWZbcss6YX4e0Fg0keQQtbLCvfgPGvOLw1a38N2v1sX/5n+hP+l5mlb4zTt6UJk
         ODQg7mQis/5JeVQyxa1bPpAEWriRMTzJ1EoosBMtMFg0t2+RHid0GtnzZlMNLNmWB1vv
         u6bOfGqEmOaBj8EKsCKKgu2uSZN+bBwHF7Dg/49TDrruF6UFKHMMWEXslbreG6Ew+qGk
         K3Iw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794417185; x=1795021985; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yQBRHBIhMCpK1GaG4ls2kPSsfswknz2sHPrFZyTAPUc=;
        b=awi2vbah/fEYbEew3ocu4Kr0L919KYfWpbxLouCV/e615bMYCzISXGeOWYz7B6gePb
         yQrWkaqFkHFbbuHi627ZaEqgYAFDuBHkx6et7OAGvQgJle0ZWS9wBgndAowm1XcpEduh
         EwfqcAQGmKXb7jGpzl5h4bazn3z5sTLo8xBGct7Q2R0uHNZZgYJ0zJ0EA718ymD6aNpz
         JqD2cmqADltIvyO1vM76YMDJ+SLDV8clFlKYzWvTfm/QbwHABYl23F5bifqc5Yf3bzdO
         AYJ6Ykaa7hj3WHDIukHU3xxBiWHtVWOYCk8qzrGt+iLjDVj8wl5+ca6iFdF7jmTkcGUE
         dC3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794417185; x=1795021985;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yQBRHBIhMCpK1GaG4ls2kPSsfswknz2sHPrFZyTAPUc=;
        b=wuKjI+B86okODQvoctIgrCj4xJqh0tbwXBOZdaCAJW9EY3RgdZGG/oQGEDRgBVXkwq
         XDQseTfgGsPsCbsBRpQ1z9V0G63YBlLb/sNIRqbjpd1HvxdsFBuPnYTZdy6mD3yB+EEY
         xRvWso0B0gePG+6m0OI7dl18lVOSoSVAXOidNMlj8fPquUWdW7UnJqwUbx7nzDDGHtr9
         CV/1c0aCUAgifLkw/d9ruXpqQoaW6ITRZtH/zDTJ7QNjplVpiKjml7YJjdlfdagCZ/MQ
         Jk6vKqAdnEcB41Ubm/tSeTlUneuToSxP5FKhbYRQlf94p1m8oXGa0YWQl5io9SYGFm+S
         AySA==
X-Forwarded-Encrypted: i=1; AL+hErE+avRY9Ye87aKtRPDY/DxInDgFTF2NU3gTh42Mk85pYengBOlG2pRQKFKa+MbcT3M3RuIQK+mTpjQ/xJK5WYCxHehU@vger.kernel.org
X-Gm-Message-State: APuU4Z80mfaJ0b87ztbbDEZ9VCi5Nm5HBI4ENnaEkZsatDEzu21tIpLj
	2XChbu2pmwGSHS8g9AVueVtxvgwTo+HjgT6nQNeTL5V2imbS1v2s2hK8jImg9wp31lMBe0XR0Dt
	ixb6rn6x63Up5f9KH5Q7Gung8dEYt2l0=
X-Gm-Gg: AYBFou3D4t0KKMEtHqQwwa5ag8vHltkf0sIMX6ueSS/WtXM4F6lkXMCue9WRGf2TFYa
	tqh8Y6dWUtPujhj1uDJZW1jPmuySLuQuGSdFNKj4/5rhofNivo9+8+8EVoqMHKoolrjdLE7Kdty
	FB0WOVV1hraY2+teTTOBZJC8+tUrW9bVdzg48HWbwBKrGDW0Ck1fvkHjBLdBtjw330Xry7YGGBB
	eIhrzFZ9XkIVsFsZOexNNRgpOfhsJ8Jv6xipuDRv9o1sOtdub5yQotXs5Vfl+zMiqYCegTOhehF
	eGExrwdi1HIhQxVzY1DskHE3HsOecRgNMulcckTFtxJmZsLHsD2szTi6/XmWraS+KBWjZNdwLLh
	Fi/sJsLEWavV9XZpJA8Z3QvOHpDw0lFBbjbws
X-Received: by 2002:a05:7022:3a86:b0:1b3:a22e:b74d with SMTP id
 a92af1059eb24-1b3c035d23cmr2829705c88.34.1794417184690; Wed, 11 Nov 2026
 09:13:04 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-legion-lighting-rfc-v2-0-845726afb71c@gmail.com>
 <20261110-legion-lighting-rfc-v2-2-845726afb71c@gmail.com> <9002537db845b7a0a900612fe3a4a3638f06cd37.camel@rong.moe>
In-Reply-To: <9002537db845b7a0a900612fe3a4a3638f06cd37.camel@rong.moe>
From: Ciro Pedrini <ciro.pedrini@gmail.com>
Date: Wed, 11 Nov 2026 14:12:53 -0300
X-Gm-Features: AclHuK_9AFdIKIxS-VE0HiqvOtlNnIyPwpjp_Fu-O7VtOD5InbSvkib5r35zrYc
Message-ID: <CAPKD0HfHuv4vKWeff_uhGxXosuU279qB+kkmXNPXJYL2kxFR2w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] HID: lenovo-legion: Add keyboard backlight driver
 for Legion Gen 10
To: Rong Zhang <i@rong.moe>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Ike Panhc <ikepanhc@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Werner Sembach <wse@tuxedocomputers.com>, Aaron Erhardt <aer@tuxedocomputers.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Rong,

Thanks for the review. I'll fix the rest in v3, but before I go on with
it I would like to hear from you on these.

On Wed, 2026-11-11 at 20:09 +0800, Rong Zhang wrote:
> On Tue, 2026-11-10 at 20:29 +0000, Ciro Pedrini via B4 Relay wrote:
> > Its hardware brightness, 0..9, is stored in the controller and applies to
> > every LED of the machine (keys, front strip, rear vents, lid logo).
>
> I don't know if it's appropriate to represent so many things with the
> name "legion::kbd_backlight".

I gave splitting it some thought, and looked (with the help of an LLM)
at how other drivers handle this. We could register one LED per zone,
but that seems to be usually rejected, because they would not be
independent: the controller has a single brightness for all zones, so
writing any of them would change all of them.

Per-zone control is only possible through the LampArray (c193). It has
319 lamps, each with its own colour, and they are grouped by zone (keys,
front strip, rear vents, lid logo), so a LampArray driver could light
or dim each zone on its own. That needs c197 to hand the LEDs over
first, as discussed in the other thread.

Also, going with kbd_backlight seems like a good idea so that UPower
and the desktops pick it up automatically.

Thoughts? I'd like a confirmation from someone who knows how this is
usually handled in Linux, as I don't have much experience with it.

> Just curious, can the software select which effect to use, or listen to
> an event when Fn+Space is pressed?

Yes. 0xCA reads the current effect and 0xC8 sets it. On Fn+Space the
controller sends report 5 as 05 01 P (P = the new effect), then
05 02 B (B = the brightness).

> I wonder, what if we set the report with a short report size, say,
> struct_size(msg, params, len)? Could the device handle it properly in
> this case? If so, there is a chance that we don't need to sleep for 100ms
> later (I guess the device is processing too much data, causing the
> massive delay).

You were right. I tried it on the laptop: it takes the short request,
and it only ever answers 5 bytes anyway, even when asked for 960. The
answer is there right away, I read it with delays from 100 ms down to 0
and it was always correct. So a brightness read goes from ~115 ms to
~2 ms.

Setting the brightness with a short request works too, and reading it
right after returns the new value.

In v3 I'll send and read short reports and drop the msleep().

> Ditto, what if we get the report with struct_size(msg, params, 1)?

Same, that works.

Thanks,
Ciro
