Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792992124;
	b=kMjbxl6flDqjRyjItlvj5lwNtivprsmwVMxjUV5rQ6b27m7l12v3eh+TEUn918TyIRR2
	 5XrQqhRGw7KcewDBaBqOco9hiU9knUyoa++p7apyBtstUtpeRjV1c6ZteR7F8YZQBRako
	 x4wxG0Q2bT7mGpmVeFSDlvSqVahz1azce4jDhHV16kN48k3oyviJ5ypisfesbSOWzo7Nd
	 ykxmrM0htWsbDd1dG4fo+32qUiv4J8kdd3WNKk4esFvaer8tDL9SSCOtLYg9h0n8y7Nho
	 QMA/VtpFu0T41l1zM6lcp+yjGQZ9S3z+vRKZHNryzkBY0aPF9t9TxRshU6xUO1hcQww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792992124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=l+o7YHaaQtyvRVJCVlFIVIOOyJjpcMnJTZEtbdzMaE4=;
	b=2orarUwOm3b0F1j9DqmMY9ONPTf86c3AZY7U7PbNKJxsG/d7kL4HQzSc9cT7dePHIM5c
	 rYNCYlMiUM5mDJYaFgl2xiREB+qWuAmSU7ZWEVBG6UzGXvLkt/5tF2BtlBK539XxsrRqi
	 vynZCQCikaz694pkqK0Mxcs2VZwYAu59SkkiJajpPuyxIymqi4fzW+LqV6+LD87PP8Jvd
	 XADvE5jTunyf8w+ycPRiKxW4c3w7kQi1FRXLuCc5aN8ZX7JQLJ/sQtjFCp8JCur5d3LzU
	 8V5OjTJGPHoPOSAw4WErykMv5RxTK1JNDkxndZIqtgjca0kUFhl1sWywf0J/GpYzJVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bc5WQdyH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.42
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBE9606A31D
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 05:22:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADBE9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bc5WQdyH
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-99071945aa7so1506386241.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 22:22:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792992122; cv=none;
        d=google.com; s=arc-20260327;
        b=hf2t9XfbP+dv5xlje/3VHTOZOxRWNykTFC3jzE8MjKTJZ0Woo69naBQ8dc3ngIQSHz
         nfXivcPllaKALAh8CLrzCnpuHfNo2qo6liidDkMCbZe8f/5iBP3y3utlHXhKpucEkejc
         GwvDl08MxiCv8diMM0QS97vjO+am69MwBZ9AxwNUDQfLddqEyn6fbzWwoXA6H4Z5r1re
         +0zjtl09uyKizymuaLCevj2J4zi+uUaNlahsFRXCzvmifKiyjnDaoif7ZazEk1EUsFxO
         VqEWWceFFgQCDfhZwVZ8TZYBqX83AQB7kQdzBUnDAv+vP3cdiKtJya6hB8Bl/O7im8Xl
         Nc0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l+o7YHaaQtyvRVJCVlFIVIOOyJjpcMnJTZEtbdzMaE4=;
        fh=Xj8OgX/hCq3a6Fx9ukZDaL5lmMQvJidot4letMzhQS0=;
        b=aK58e+WtBwzL6nl1HtC49LfkJYN482CqzyOXCHuH7sJaRtqkFGID1HtaJrBf/FrCJz
         0BwSZcjtAir7twE2d4QAxkTnk1idhGv+31iARQjN4FnpaDojf3ILZKp3B7bhe8yoDJbu
         j4Iip0G4bl2gmwC6sUiGAA9OT3SE7PPeozEx1uFnv5oocIaRJccNGWScKQSGlac9pF5s
         uuQ0R48L0LMI6PdB/p0FQfoUY70mfNrr7+IfF04MRo4PtSq6vwHMySfhLERwKPj/5/qr
         hgJZHH3mdrmhh2vU0eG8Lq8jeB7gja3QZIcIbND+sv4aRhIQFDld5erk2KRX52u/9uCY
         T4KQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792992122; x=1793596922; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l+o7YHaaQtyvRVJCVlFIVIOOyJjpcMnJTZEtbdzMaE4=;
        b=bc5WQdyHexz4RjeU1UmexokrezFYsyEkH7XDhWDE5Rekp300eoYEGKUzutj/Abz+Ap
         130hK1mybqk7/RYOiVz8rO4pjETDiCOdb1mbjh1EfkFp/J2uG+nvzN1twhPzvtAuMlvm
         7oTO8r2Yw+xnDVtYkOTPf9WAdlWQgsZNl8Z3RXEZxlptLx2xtZP1CyHAXl4QyWqWs7Q6
         RYLfGTPLvRxdQC7LIXe9lJ2FkLXVRl/JGannVzJDRVhjHwRi1LVrZKSKwijcxPjxGOHj
         HretMb9Z/JRAoCuvsqLwPKDsAbjl6ySjY+pMjkmqbiySJ/Y5AQVN0Z7b5Zgh+6sLS1td
         NkuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792992122; x=1793596922;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l+o7YHaaQtyvRVJCVlFIVIOOyJjpcMnJTZEtbdzMaE4=;
        b=Mj0Eq+cz+OQqyvNpjY3xYAE+3pmwRjQdLxv8aBs7UC9Jqlacr1mawXU+tadltf3wve
         9xuEW6Lp4Wt5C3tsm+WO9VGHDwhQUa6iOB7ryRe9JPZ7GPXxGG3N47+fP6/bXZiT/oOD
         zitXrRfb9RfcbrTN8CVy/rphd6oWb/B5nhHQ/arhUME09AvHX1qMPy5QbkdpBKSL/CJs
         YE7MVgxKVx5iZc2z4ij3r9WGoFOF30E9k5oEN1RkCOvtJLdcVynyDcWSOv2VibcB79VX
         tRElOTUxkJaJvLcqL5MHy1sG9m7RBttU835qk8z+cdHIUJrHkkqZFl70Kl0UiRqhnwyt
         UDYw==
X-Forwarded-Encrypted: i=1; AKwUvBxiaA37o0RFpJuw6K8ozgoz6awNbV9iP/dHyMzLz0Mtsbyet5nZajjzxEVkhXe1scCWcSrLRiuyBXbACb+zZXaGlWZ8@vger.kernel.org
X-Gm-Message-State: AFq9FYI6JtRqLBnjwvwTAtJwrNXmu3DNksoA9m3CnDpaOdA2446bSfH5
	633j7CQ1murt20bT5Yyq2yomRo7WSCP+JrALMqBTysbi1TX3v5Ktow2ivW5dU66olQYABZ2jm3c
	x/C2Wd1hsZfgsX0jT0tKaKSt5z9Qg97SP7XXUU7FV6Q==
X-Gm-Gg: AYBFou0o0DiOySInSJOrXprTxzBqlHj+ULqhkrtYYXdIRQWHrYYV7aNF8ovO+mqlnuk
	BzJ2JwhEm3X5mOoP+EzHv6/KTPmb0605cZ+Djv3HUK8prnR7kCdBMxD4v4ucFY+OyNH9EqoSXwa
	zamrAikUIGAovt1ONSSYn7czsTn4VynO63Q99DRTe8YucH3GiQmp3SBhoyViO9Kh8PxWOx3k7JC
	nVKGJR4k0NA3h10M9gKmP/KcfPk3IWZcl1s+xQEYIa0LNqjuiP32jleihrKO2VwcSEWwAAGO3Y0
	cdXNLFlz52ZaWKPkVLSoStOvYyupiOOc1kjPACaHkCHlN0lBq7/P0hMx/Uzw62SQ3OBCNORVwpa
	bL90an5pUR+z6pDkGUd3j5luoUN3f/Dg+6GTLAA2qF79Wfnk2uwcsQXCBHG8Fix9h4meSN8xOwZ
	1lOZPm1pAPF/02EAvdkb7cMg==
X-Received: by 2002:a05:6102:2c85:b0:7c1:9f20:36ad with SMTP id
 ada2fe7eead31-7ce5ca07ad7mr2086245137.2.1792992122575; Sun, 25 Oct 2026
 22:22:02 -0700 (PDT)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024172641.19424-1-meatuni001@gmail.com> <at5d__q_RzGad7zt@ashevche-desk.local>
 <CADqcGBmOxJ1ns87pNmaSNVfCc-LNsTsf6YgnnZ5i+x4+dH+AMA@mail.gmail.com>
In-Reply-To: <CADqcGBmOxJ1ns87pNmaSNVfCc-LNsTsf6YgnnZ5i+x4+dH+AMA@mail.gmail.com>
From: Muhammad Bilal <meatuni001@gmail.com>
Date: Mon, 26 Oct 2026 10:21:48 +0500
X-Gm-Features: AclHuK8vkB7NkckOpl2d0PlrXPWMHOQGPhx797u89umaHfztF2B1Jpqb3Rkh5mc
Message-ID: <CADqcGB=ok=Mr=EkhqjEspqMGOrE_ZSj4v8PkoKosR_=8wfUxjw@mail.gmail.com>
Subject: Re: [PATCH v7] platform/x86: hp-bioscfg: fix heap OOB in hp_enforce_single_line_input()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: jorge.lopez2@hp.com, hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	linux@weissschuh.net, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for the review.

Link v8: https://lore.kernel.org/all/20261026051740.88791-1-meatuni001@gmai=
l.com/

Thanks
Muhammad

On Mon, Oct 26, 2026 at 10:16=E2=80=AFAM Muhammad Bilal <meatuni001@gmail.c=
om> wrote:
>
> Hi Andy,
>
> No particular reason. I removed them while trimming the diff, but
> you're right that both comments are still useful. I'll restore them in
> the next revision.
>
> Thanks,
> Muhammad
>
> On Mon, Oct 26, 2026 at 12:52=E2=80=AFAM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Sat, Oct 24, 2026 at 10:26:41PM +0500, Muhammad Bilal wrote:
> > > The input is copied with kstrdup(), which stops at the first NUL, but
> > > the full write size is passed to hp_enforce_single_line_input(). With
> > > an embedded NUL the helper reads, and can write one byte, past the
> > > copy. Use strnchrnul() so the scan stops at the first NUL, and return
> > > -EINVAL for a NUL or newline before the last byte.
> > >
> > > Tested on HP EliteBook 840 G2 (Fedora 44, Linux 7.2.8): writing "A\0"
> > > followed by 4093 bytes of "B" to current_password 100 times returns
> > > -EINVAL every time, without reading into the heap.
> >
> > ...
> >
> > >  - Drop the trailing comments
> >
> > Why? At least The first one has the same meaning as before, what's wron=
g with
> > the second one?
> >
> > --
> > With Best Regards,
> > Andy Shevchenko
> >
> >
