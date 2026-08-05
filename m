Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B9138E8A7
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Aug 2026 03:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785902155; cv=pass; b=WTJLl0+HjAsXxOhpM62VqvGKLk3lT+s0sec1OSmG3zym8S+Oly9qNmOoa3YX9Esl1uwbmpCkRxVrjg5b6FejMUW1YjaGZAUed0ENG/1fv1u9PKbc/brUvnayyyhAK4eZe8jCIj5EIyvp8ptwxpLkstPJnjum19V7dGkegDwwZ8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785902155; c=relaxed/simple;
	bh=g9DkL4G5jEm0CENSAEA9+LTn3YlpbpFBZGclKNlof4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jgJ6lX5H2RrAc3MlfVc96nvxFirBFUKUkNKQmJg3Jsyh9UIbhHw3fXM54FpZ7xcRFbkYsLu12IBRnJCNubzTI5gPT4qrtvioGybxiOE/Tvq2nBnyM4Z8Jhb6iYSf2ICUde7uY7Lt6a2+UxMYCFqCjrPy+5ByoIXytLfVn9jDeSI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U+5fLl2X; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U+5fLl2X"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b29599b81cso697551e87.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 04 Aug 2026 20:55:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785902152; cv=none;
        d=google.com; s=arc-20260327;
        b=emiL9nVnsrXnYfe5m8RXByOJIB3H59hEOlxYsff1bUCOSMlus8D8IX1IQ+SRC4gNoQ
         FiQT5uahEfzL2obJwcgbAYWUR5HAzEvGrWO8UbBR7kCbfqfHpHfc98dEa7dan6gt+FAH
         jnB8/F53fbANGkJq+8Tp9RBnofFFt8+8ui/i4a4NeIvQYCSTq91P4X3TiB3vfnHxervq
         T6cptG8Ccc4bmUMwLUixRz7oBi7ZQenk/N25R49OgkZFZppuDtFr8D92Io3W11z5H1gV
         vU+iP+wL1a/uvgVAWqVD6YgWzj6RZql5WZxxSbZGDotnNboYUCiN1LtEcnpx9LMpK50s
         0DHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=g9DkL4G5jEm0CENSAEA9+LTn3YlpbpFBZGclKNlof4k=;
        fh=CBIT7PQNbxqH8wnFPfZymRAUpiNsJTnAOFNfcT1D4S0=;
        b=PiBfHP3ypE8+78kOLjB/FuFKcqpwD1CXPx09ljFsIk/GPgDzAwv9s1RQK+jGfbEG8O
         5mbxOtRQwjaxq42EJMbkTUVosoxwXvFT+kW5nGZ9Q4/PqjkeMeIUs9TT6bguuYB9t164
         m37YjB3qg1faD/AfCvyzj2Eu3InUMFSONkltYZbdc+MNSVMe7zjJbNqaDSofV74N4//K
         rkmcvFxOsWUQreZdCOmVjEvQqfYAsh+nkchAgpdOfCsxon37c++gvKwBlL8ZFYkvit2I
         XJ1FRMw92p0a/zwhBG8UUZ1o66rH6uOy/uNDMIgVXJSUQFyjvz3a0yoaCgndj8f/NDEW
         jyxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785902152; x=1786506952; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g9DkL4G5jEm0CENSAEA9+LTn3YlpbpFBZGclKNlof4k=;
        b=U+5fLl2Xo2eERDfrzZEctSwj4Jfck6uCNtv7vBx0ygH6PtoGIK3qp7gHe+NR/V8gSe
         GeaBjuet1CroWCoq/GTS0d6kX5cGg+W6OgYszTE25RXAPNTgdvqAXZYg8EyxtqtDnaKa
         U9NiIPSATccdQCryA/HQdSmWO8ujqhDBEDVXyDtrPBTnNo45WIL8BZBwDehdEIF0H1ST
         TooluQrrg0I0Nq4p/IsHerb2287CO0Ekjo1G6ToyX5F8LdgUKgGlOsk3iY92cb27bEeF
         bCpKpK3MGWuFX5LEZl1f6DFzjraXj1l8sFTDCHu2hASgP4UXOYDtcD7/rEJqqG/wwmeM
         Z57A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785902152; x=1786506952;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g9DkL4G5jEm0CENSAEA9+LTn3YlpbpFBZGclKNlof4k=;
        b=D3ecyFM39ofYh8gnMRN3oRGakd0Bj54UX4kJInpoo3zxVVohpd5sil3lR0G9U/Iyh1
         jbqWmer6uycfotci6WYitnXAYbY3vQlKZLL3gpuFqlxm62GuU0hNzXF7OGI2tqVOhHBu
         LNFu9FA40GxM6NbH6NyQ9Ej6T9x8fZXAFkNVAkxqmcc/o1CsD/p27vpMyfUHkHqcHW3u
         brf5BWM60OjV3Cct/9CPn1vgA4fsWmCDdF0aZXGBPanJyDNhBzUI6rhePLIIu3gNaV0B
         nzK0OPdXdLD/8NhltpWv4VhisKnpJaW9zF9LDwsUez51Oz9ZySztqUOmk866aUr6vh+Z
         4FVg==
X-Forwarded-Encrypted: i=1; AHgh+RppjFBZ+meF8a1R51+sa0O4HbaKB5BY8Phah8C8FF8B6i7Hpi7tcExkxuJkgvBTdXl94KFtUMpSKyXh7XUbz3V2ZLF+@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf63qUCuvBzwXzOYiuC078qiOgSv7zLt4CUeXDzKIkUbDc2lMm
	L7/kIF/9vUJRrx1S60JNVZJb18mBMBqiq4DzRf5GXFq/VbqFR3O/cHO+k3wkMwLKUB5Q/h6ukfX
	NFw5QK42vdchMeXKfhTMivQBP0KLL0AoN2tP5IpeLXg==
X-Gm-Gg: AR+sD13R/n0AjJciSfUCRdnOPbJ3vlHul5ReSn2zl33q7fDH9HzCsKwhR2K5/CT3DI2
	kKPHRKmk0GGyXi6o46/OtfAIShscRoJV/p/0ZtZxxWlI5rCtoW3aP5/MesDSDWw30jrhD6LJdto
	/72pE/5h4+p7Wv5sr4LUobEQ73ShW7/9Y/kjmusVKkDVUuWa4E00P5kDVvppZnTdQ+1UXlQUQDk
	7BmokIJLjwNs8LURA2VZnchL0hHfosEsAusxRNeF7dHP7g6COkMlEWzUstwS5+svez0qLX9unvS
	Mw0XYKnAUz4COTG55RDZO7FyJNcHpe78m7QjyEN2Yb31cx1aaoD8uGFsfXc6JjJrte36a0VEv1B
	vYBk=
X-Received: by 2002:a05:6512:228d:b0:5ae:c542:33ef with SMTP id
 2adb3069b0e04-5b2f4b84a63mr380583e87.8.1785902151444; Tue, 04 Aug 2026
 20:55:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0ca263c3-7885-4a5c-bfe5-0e8e4d189666@linux.dev> <e0882d84-f5ea-44a8-881f-4095129e4d2d@gmx.de>
In-Reply-To: <e0882d84-f5ea-44a8-881f-4095129e4d2d@gmx.de>
From: NB Group <nbg2974@gmail.com>
Date: Wed, 5 Aug 2026 11:55:38 +0800
X-Gm-Features: AUfX_mwcEmX-NK33F_1ISR--ZbzTbyrLXkjrSs3vbOBdB1j1MxDetundG6itLL0
Message-ID: <CAKSmRq3cW0j_TwA5Gp4ESFK3MMi-TBAsoG5wDZwjHfK3Z9HEyw@mail.gmail.com>
Subject: Re: Placement of ASUS Aura and platform/x86 ASUS files relocation
To: Armin Wolf <W_Armin@gmx.de>
Cc: Denis Benato <denis.benato@linux.dev>, LKML <linux-kernel@vger.kernel.org>, 
	platform-driver-x86@vger.kernel.org, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Hans de Goede <hansg@kernel.org>, "Derek J. Clark" <derekjohn.clark@gmail.com>
Content-Type: text/plain; charset="UTF-8"

> If the SCSI commands are used to issue i2c/smbus requests, then you should
> also place the i2c controller driver under /drivers/i2c/busses.


Hi Armin, Denis,

Armin, agreed on drivers/leds/ for the LED side. The enclosure isn't a platform
device and the interface is the multicolor LED sysfs, so that's the right home
for it. SCSI transport stays in drivers/scsi/.

On whether the SCSI commands wrap i2c/smbus: they don't, at least not on the
ROG STRIX Arion I reversed. The ENE controller speaks a flat register protocol
over the vendor CDB (0xec 'A' 'S' <reg_hi> <reg_lo> ... <arg_count>), with
registers for mode (0x8021), per-LED colours (0x8160), apply (0x80a0) and so on.
No i2c slave addressing shows up in the vendor CDBs, no sign of tunneling, so
there's nothing for an i2c-bus driver to model. A SCSI transport helper
in drivers/scsi/ feeding an Aura LED driver in drivers/leds/ is the shape
that matches the hardware.

I've got a working prototype that picks the enclosure up via a SCSI bus notifier
and exposes the multicolor LED; haven't posted it yet. I'll split it the way
above and send it for review.

One thing worth flagging on the transport, because it dictates how the helper
gets written. scsi_execute_cmd() sizes the CDB via COMMAND_SIZE(opcode), i.e.
scsi_command_size_tbl[(opcode >> 5) & 7], which is 10 for 0xec (group 7). The
ENE CDB is 16 bytes with arg_count in cdb[13], and the execute path does
memcpy(cmnd, cmd, cmd_len), so cdb[13] is never copied and the device just
ignores the write. I end up building the block request by hand and forcing
cmd_len=16. Anyone writing a driver that sends a vendor CDB whose real length
doesn't match COMMAND_SIZE(opcode) is going to hit the same thing.

Liang Haowen
