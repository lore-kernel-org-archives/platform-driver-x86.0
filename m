Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794342880;
	b=4DfJ+CxvsghySK9fMq3v+Zi3Lv3HEbsW0P2QMbTFwRU7oNhHV/Av5w+0rPiENjjH7pR4
	 1W8bC60fz3r2V33vjBK0xLlUBE/5Oq9wHWW9mVXxTiTzIXpCEoigoRBs1TXPf9YWwrkwn
	 W1it3Cea+BV3NtOfjFKlwwpcFaeYn7VaQM5+OUh5ycNWgio7m5b8d1uz9gd+jSr92qRMV
	 Mk8b5FlLXnb6pQh4jlk2WSRkh9lhXkiLRQj6Pb1gz8CQVmS9ybbcRaAkop8t7UuKtrski
	 niqzwDbtaW/sKqrcsZaVCftdaIW9jwTVwU4iVskECFlo7HcRTHu3iO6wqu19ZI+vTkg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794342880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=XhB/wmAO2gEI5agOW6oIrhyDza+W+waWoRcKr91K/YI=;
	b=uLEiV1TO/2U6Fed494qKNBTBWhH9T2sH7/AGP6/K9CnZjZ69yr5T7/eICMxQ5MUAAllc
	 GuhCB0PcBJ2/aQRSB+zlZaidm3YK0BMckT/HWknJKTa5e1wqeky2oYqEc5v8QChjYjwj4
	 zzxGdMjKAD8PACiVqtc1PddHg3TJ4lQxx1lMbbftAL39gXmt9FajZogXQB5U8+akEvVOg
	 6v6UnmAxOIrLCAN0tPnlfarDxyGeHcbVYbReIUkrTmDiyKF0nT0ka3D0vBKaeJ6MzHtkZ
	 JOIWwHX3itzQT71eWUSxkUs8QNxyAcu3v8z0aHWaL6bQUNwtENL2S59mkPg90mYoW/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JJHWSdqs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C2C606A321
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Nov 2026 20:34:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02C2C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JJHWSdqs
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1a8cc11ac42so2445343c88.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Nov 2026 12:34:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794342879; cv=none;
        d=google.com; s=arc-20260327;
        b=KYsJc8LtuoB2zCygiLY1SWVPMXgIsxN/CLjoUnj0slq6oE0WE26tDdp1CU2hOkfM/O
         HxveO2/pM07DShqUn1ZCzllOHhaZYEbE3ObbLJQ1cN9/5D2Ery5rp2BrWBePxuyiAaJT
         S6Gko5fRyvEpcZlXgA3CQaHzwMdCrCCW4+Q5kXmxFEvg38wBgfQ+q9oiyOE9kixjTaaX
         xPMkK4Ch67WvSQuJ0yBXrE5pybHTtmr2HSh/eaJ1ORFZKP+I0VjvtaQnk4I9k2Efd9fT
         UTDr18mj2IDzt0iuNJRKxOIi4UMqI+BelebFouaj4QyenpyxxSlRem2ffi8Sl5CYGVNe
         0Pfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XhB/wmAO2gEI5agOW6oIrhyDza+W+waWoRcKr91K/YI=;
        fh=UQ55/URIWQY8Up3UL54MtAB87QSNnDWtI8ukQRSBEWI=;
        b=EWGxDuvYUpS1aPJ95nwDfsrplYheuj8PDf+Gaz0O6Ng+x5OE9Xyqthkig4rv/tAbrh
         s+KR1xGDlqXQUrYUFRd+qcarHdIDig5kLzm2kI4LDySvFCeBRGNM7ge37sTOHsBOpyjC
         T4bakGvWSXhvByiZLXCs6Fn5KxBVXsLb+2h9s7qImKwuZuWm2Mc0Kdip6Mf0e5yMq8QJ
         aB14gwSYpHffVDr9i2tbpheftJoIa1jhP5BE2GtvQtA6CBbA70iJx1NsftEvTEi+DqVr
         g9+AplZ9ffZdkO5uyBbUtBfio6TYD0iIVBBq3lyyDG7dOfI6y65kWxxVX3DJ4xb+m/d1
         ilNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794342879; x=1794947679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XhB/wmAO2gEI5agOW6oIrhyDza+W+waWoRcKr91K/YI=;
        b=JJHWSdqsEtM4bBU+5grCo2bl0FUiJb1cGjtLviO+HJ316nr8t93eAwbQrKRMSTg54v
         S1eD3X6ENXcfeP1135+eyE78fqh6YlByhVfnIxLyFG7Fnme7gn9oHVld+Wq+x8XHcCgU
         ruru19j4apZJUaalygL0J9pPog4yG/vMVTq376YY4QDiEFFSF48V4166IoB/ePVwxqgu
         /D+dc8LeBN8iMMdGC15ltgljl1n3cr/733lqr6mNBbguaeSVcedgduo2I4tL96AGpr4Y
         F5Cjwk7kDEsYWWPiIqIdzSPMbFSV4xONseh6BU8GmO+jDJSOZkGOTcyfvOQoysJ/zb2v
         QPmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794342879; x=1794947679;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XhB/wmAO2gEI5agOW6oIrhyDza+W+waWoRcKr91K/YI=;
        b=lVgn0x1s0yhj2YE7UJsI1ie/WpX0wscKSG0Qo9+6IDieZJ2DC2oKzTOSf9LxVMtSai
         dQgv8C3j5qraahLaS+Jshtf74UWT6/Peg3G18bitUCokpSpCgD9AutXmvcSSt7vi6+jX
         bOy4ugHFopJzyL18qGHXTdJetasQhFHfo7B6V89uOU8KISRpfnJ4Dln4m7mIrbudznlr
         byjyLn2OQVumbYCAMNnOIiHqNa3tGBfpiKavhDFpITbhzyXgdxcrViV1Dc3K62EK7K9u
         1LP88Llc87dxMuaVOamFM1sNt1RUwCWIAyaq0DBLQjR1FalIVedrVH5rsK7rUGtr5Zju
         zbkw==
X-Forwarded-Encrypted: i=1; AL+hErHnTAynIcNXrHlRqyt6D+R/TLgYqSuCndndOEN7ihAbFpOPlEwBSaoECdJcwH8YBobiQuLTDv5F0Dwb6C5fOZo04bYz@vger.kernel.org
X-Gm-Message-State: APuU4Z+VOjpPoosWOor7nBNQaRgNXE6Ldimlk7v+kqRpGjRA67V4Kq7/
	Y+6rcGYcCh2HFzuWmnFAMeCL3nLlzCr8jviFDVpYr8hX/eruBhtx8GcknEY6OQPzKAhGDXDUSgU
	27PNg4UIkylDn3HZwmH4TmrzeM1Wu0r4=
X-Gm-Gg: AYBFou3TwiUX2qdvkM2Jdy2bpU47gELQvencZhmvsfPFZnSJCKqSPEnibIzmlyKeFBk
	t99KxwrNOCQVUQMJVHWd4kxJicZGRQU6dR0s6JBw8Wn4hUZbe2eZezaGbn5wHle9iGVXWqtUrhK
	VEjn3eosYJT1LhVB0F6KQviNVLqphO8ccXi/EzIWTGQwglTeY4cQH5ps8CDeJb/bIzlh3yBxbHi
	ulXe/hcR6Yt5tUDvN7I/g0I+lmG2NjiS+QI/ZZNa/sQ7zLmN1X5jvp4juG2ml4KfopLIskQdUcA
	qyT9y8vebjGi/fdW7LRLbSHsbu19pkt1H8D/SsWoJwkzMTjaPcMu+PmVznwjGJbAEJeQVCaUlko
	jXai92ZokGYZiafNHjxWMls68264ug9rM7WZX
X-Received: by 2002:a05:7022:f210:b0:1a9:cad6:5b58 with SMTP id
 a92af1059eb24-1b3b619527emr6112214c88.39.1794342879053; Tue, 10 Nov 2026
 12:34:39 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-legion-lighting-rfc-v1-0-a87e1db8c5e3@gmail.com>
 <20261109-legion-lighting-rfc-v1-2-a87e1db8c5e3@gmail.com> <0ff29b9d-bfd5-4d89-0e78-05497312e390@linux.intel.com>
In-Reply-To: <0ff29b9d-bfd5-4d89-0e78-05497312e390@linux.intel.com>
From: Ciro Pedrini <ciro.pedrini@gmail.com>
Date: Tue, 10 Nov 2026 17:34:27 -0300
X-Gm-Features: AclHuK8u07v-lJ61Vl1Al48vF06fYxLioDMP6HLdGSnp9INLtz5V4nXHU_TVAE4
Message-ID: <CAPKD0HfAWsMDntCAmjKSOsc3zOeLVMUn9=uBK45OaFo2ovy-XA@mail.gmail.com>
Subject: Re: [PATCH RFC 2/2] HID: lenovo-legion: Add keyboard lighting driver
 for Legion Gen 10
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Rong Zhang <i@rong.moe>, Ike Panhc <ikepanhc@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Werner Sembach <wse@tuxedocomputers.com>, Aaron Erhardt <aer@tuxedocomputers.com>, 
	platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ilpo,

On Tue, 10 Nov 2026, Ilpo J=C3=A4rvinen wrote:
> Thanks for the patch.

Thanks a lot for the thorough review, and sorry for all the noise in v1.

I sent v2:
https://lore.kernel.org/r/20261110-legion-lighting-rfc-v2-0-845726afb71c@gm=
ail.com

Rong asked to keep only the keyboard controller, so all the LampArray
code is gone, including the pair lock and the byte arrays for those
reports. The rest of your comments are done (struct with __le16,
guard(), devm_mutex_init(), no magic numbers, includes). Some answers
below.

> Please don't include how things were prepared into changelog, but you can
> use the area below the first --- so it won't end up into the final commit
> message if you patch is applied (our tools will automatically cut the
> part below ---).

Fixed, it's below the --- now. Sorry for the rookie mistake.

> > + spinlock_t event_lock; /* protects ready */
>
> Why does bool need a spinlock? That sounds like overkill if it's all it
> protects.

[...]

> The racing reader side might have already reading ready and unlocked. So
> what does this lock actually protect for real?

You're right, nothing. I checked hid-core: it holds driver_input_lock
during probe() and takes it before remove(), and raw_event is only
called when that lock can be taken. So raw_event can't run before
probe() is done or after remove() starts, and ready was always true. I
removed both.

> Can't the work be managed with devm_ ?

I removed this too. It was only there to call
led_classdev_notify_brightness_hw_changed() outside raw_event, but
that's fine to call from raw_event (hid-lg-g15 does it).

I kept the LED itself without devm on purpose though: devm would
unregister it after remove(), so after hid_hw_stop(), and in between
someone could still write to brightness.

Thanks,
Ciro
