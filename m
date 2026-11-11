Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794418059;
	b=t2S5migomJwGEvYgWC7ifiLnYPmlqOdgVt4kJX09CYjSAU+1lmYvmLIjVvH/pK8rUJ8C
	 9DgaxCAab/iV7ZQP+p9czTeuYIArUoWMRpr6PW/Fz1Y4gT0vbvMVpBcWxmyMykutH9AAU
	 8GWoyHGSWoeikg7F9pEnMU4bnugXh12yBnwJjuoNUrOFy3N/ZIELe9loH6Vqsk1kO1uP8
	 HTm9k8hHbaJApF9GphRwP5h6CFYzUzHSekhyoWHlXDvsZF18B3tk/uCBj+yY+AZlL4vzX
	 5NhmfJ7xMwdZucI8cYnFkMRUQMZjCuUiRFeiqok1BESbOH0UHYS+lqB72sZkqkNuGrQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=dSXiAG+3ZY/F8hDcAaOCi5cr+p+IP1IyyF8LUmknS0o=;
	b=pwtjsO0szLm+ZKYkZmIP5ezKZQ44BrbjEQlvsdUEEvG+lfGLR7/R5r2RKfU3Z9TJrXEU
	 WoK8w1fXIy2uGLK2YdcTRHvn+jigsNkeVHsvu3wt6v+meYGyMbGK7bQzWrGNlVd0xUYiL
	 fMQcNG5oiD0OJYa75ei+VknzcUHTGaJWPsEviLNnKHsVPk9rh/IfQs4kUvK8GGdEgSMo3
	 JEVOXlMNeOKxL+b74TkWqfFeivHkuc+/5V75uBuKUBZ3lq3UFxx/dQckrJn3lAj5p2toT
	 WbcZjGrxz4JCcAqkwptOnwo96RKukh3swWsCdpKwz0hxSV1HTvljlE4BDmvABNfDwwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tyg6ByNt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B05A606A321
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 17:27:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B05A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tyg6ByNt
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1a3c08d6928so5712925c88.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 09:27:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794418058; cv=none;
        d=google.com; s=arc-20260327;
        b=RNwEo+inGpMqzVU9sympX6FqpK3v2Snj7yWBcSI9rDSVFso2BteOH6OrmTDvqC0qDT
         8JLEFBmO4rumIcVxh3m9ut1OVV+PGamfa0LdXw8OQSfhSRl+yO4TCRiJRT6s0qSG9gXV
         d/JJwRzyn+ppvkYL8x0Pl/88SMHyzYVYc1vyyUgldlGxItvkksuW+nU1MUnwoWtP16aP
         NzE7Y8dD/curW6b8YNsu1g6zujwpQ2awRmiLJmfury0HbamU9kISJmBLCA5OMnrGVWSF
         SHwxwP4fgLpIGt6OsLk6yza69w0j7eLgk8wapdqUVqfDWrjC91W/NIfLB83cV5Xt09JN
         odFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dSXiAG+3ZY/F8hDcAaOCi5cr+p+IP1IyyF8LUmknS0o=;
        fh=REAyO+9ddGICP1ABY0MQX7rUvCP97vIxerep3uhOclk=;
        b=kU6O8PN6HpA3Rbj2SQ9jwgrnFgR3R9tYpWx9UUZUfT7lBVbtWL23EA9xoUJgYziJbA
         pPlIotESIrab3CHMZYBhhRCWy3UYgpgBMoY7qOWtyaKFqhvI7qy3tdVAWRFgADVNKfyQ
         w2uwOuznEY6X8Vo9/P0cfKZeyDJrlW/88CoCjNSyGDeynB/FETlgQpu2eQ8nRmz24161
         5Wjv5JjhYgXKKlpmPl7YeAnkydoyVidK2llO4UTrh206nJadBr/5vM7AyxT7xlNtSZco
         mGC5sH5cDj7I/IPVDiueo0iAqu40h5+q5ZggLCrR+7MNJnHq85aRB2/gmuSJOQ22xYNl
         /QVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794418058; x=1795022858; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dSXiAG+3ZY/F8hDcAaOCi5cr+p+IP1IyyF8LUmknS0o=;
        b=tyg6ByNtCOXd3UYgLHVPAI1+s7aXekSUxLSTJbM32FAWHq0F0hWB9djyJgasJd1l42
         DlZT03LRvimmYFbcXJ8OpaFRa3cx9q7UJbKhuAk/Jm0SAYEDJjv06ajoRLw+qQhw8HQn
         aSSpBhMTEtSVeGhM/EzuCVcS1Lm7G3woe7vAqtu+G27MtEGOkFLxNCajtXnJ653o51PW
         fzjCMY73D9UmZgsWxWWoQRSCKRhEmuBciPAGjPkJzhJrqxS/TmBsBBGf1WcU1zqkDRdQ
         WsWzelklgQGD824LA+SPXKwXpOlwzYv0i/NYwkLd4KbbE5axg3lQ7t+Q0S26/Ho8kO/H
         uDKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794418058; x=1795022858;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dSXiAG+3ZY/F8hDcAaOCi5cr+p+IP1IyyF8LUmknS0o=;
        b=ERw1EvRm2QFhieDd/ra3kcg3dg0oMdKF9Z4/6SZVWuLsuP0BHjnlVtRQ0gBIOsQCXu
         1ChUhgQ4h2A2QS4C2CjG56RRYjJGFiUSezI/PHqZbrlJNnHhmEJ+J3+CDtMgshKvZl30
         XDBMIWGS4/JRxXT5y536xAqUq3E8PHVPF3AqmyXSN7s1/bZt52vwim1tDus7zrYftrNg
         EZj1Lu5HaEzgMqNaoKygKvLXjTG2/xFdbgIJ8o3Q+SwxocC/VuikdIi491ZDuk/ayTU9
         NT+iJBgOql/BAQ5R+o3aL4PgjNZ88hSuMzPd8zwPgQ/1lgenDHo8SmWjEVPAG2HU/tRX
         sE9A==
X-Forwarded-Encrypted: i=1; AL+hErHkCRMcdUVzIpD6kf4HR4OarAr3d+l0I3i2AShqtBEfqF7in0sPeQPGBjler0GkRWrxhXj+hke+4rRTLxHXweOXIN0K@vger.kernel.org
X-Gm-Message-State: APuU4Z+INV8gZUxN/bt/OV3tmfiGGQGoJgaWe3mTyNy3KcgOuFfrZOeq
	+ZMzgTz1bF4puhUiGWemTD/A0z84bG8m5xSJuCMSpb3clNXu36V4RdWkn2FU4ZPvYdxkXVbtJca
	2hZyfKSAO3/nBIDUOj6osWnYBwG3Kpg0=
X-Gm-Gg: AYBFou2HtsYmxAfxs2a/KKa5eXLw7TsnwAsj5X++uM/jOFDNwRzdJtbfVRON5r3PwgO
	JdZ5JxH+7OWLv149TVbiICQGBeqJuLwh2k3kWaCPasu7sHstOuO9+C+MmpRnLj+TAEhb2C7+Un+
	+hXEVlBHyvgPuRh1sLP7DFS5riPkCghzJqtil+MV9IpSW4KMqiy6hfhu+IfeuYgCcJVjz9xdr72
	xj6pMQinuxcKgC3wnMdQcBlzBHTClf7yNvdsyQk7z/eEloYP0S1QnG99j6sHjmahVoE+HykXcfU
	jzdI5LmVpvHzFIP9tC9w582ctYVcm5tGVLz/NG+aRqfiWEMK8vW1pC/EhzQpfOkJPQuy3jrx6lN
	7Ekj/3Txg3QPGxr82dla5zIn3mtxsic36ObmV
X-Received: by 2002:a05:701b:4558:10b0:1ac:f84d:4036 with SMTP id
 a92af1059eb24-1b3c02f34fdmr2668936c88.9.1794418058188; Wed, 11 Nov 2026
 09:27:38 -0800 (PST)
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
 <71ecff766a91670d509b1286efd995b71efc21f4.camel@rong.moe> <CAPKD0HduW_atYsz47Nv-9A_88K1B33xENUnZgQAKcH4VHqV9PA@mail.gmail.com>
 <db41708e7676697fda99573a31d7747dee112403.camel@rong.moe>
In-Reply-To: <db41708e7676697fda99573a31d7747dee112403.camel@rong.moe>
From: Ciro Pedrini <ciro.pedrini@gmail.com>
Date: Wed, 11 Nov 2026 14:27:26 -0300
X-Gm-Features: AclHuK-k_YZiigppKf1NhmY5lI_KumHaoapWssTv6Uvn4FXhXg28fO9lUyYHPbk
Message-ID: <CAPKD0Hdt7WNC5n47Bpug=DMsJ8m63UnGprm+-cLaUh3tb=4vCg@mail.gmail.com>
Subject: Re: [PATCH RFC 0/2] Keyboard lighting for the Lenovo Legion Pro 7 Gen 10
To: Rong Zhang <i@rong.moe>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Ike Panhc <ikepanhc@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Werner Sembach <wse@tuxedocomputers.com>, Aaron Erhardt <aer@tuxedocomputers.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hey Rong,

On Wed, 2026-11-11 at 20:10 +0800, Rong Zhang wrote:
> What if (four permutations):
>
> - c197 sends 07 AA 02 00 00/01 00
> - c193 sends autonomous_mode=on/off
>
> And what if the sequence is reversed (another four permutations)?

I tried all eight. Before each one the LEDs were back to the
controller's effect (AA 01, autonomous on). "host" below means
autonomous off plus all lamps set to green.

  c197 first:   AA 00, host  -> green
                AA 00, auto  -> controller's effect
                AA 01, host  -> controller's effect
                AA 01, auto  -> controller's effect

  c193 first:   host, AA 00  -> green
                auto, AA 00  -> controller's effect
                host, AA 01  -> controller's effect
                auto, AA 01  -> controller's effect

So the order doesn't matter. The LampArray only shows with AA 00 and
autonomous off. c193 keeps the colours it gets while AA is 01, and they
show up as soon as AA 00 is sent, without sending them again. AA 01
takes the LEDs back even when c193 is not in autonomous mode.

> My implementation connects the LampArray application to hid-input, so any
> HID driver with hid_hw_start(HID_CONNECT_DEFAULT) or
> hid_hw_start(HID_CONNECT_HIDINPUT | ...) will initialize the LampArray
> application. Therefore, I suppose the only thing we need is a simple glue
> driver[1] for c193.

[...]

> Does that make sense to you?

Yes, it makes sense to me.

> I will CC you when I submit it. For now let's focus on the driver for
> c197 first.

Thanks, I'll test it here when it's out.

Ciro
