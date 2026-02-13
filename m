Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55494318BAE
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Feb 2026 23:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771026731; cv=none; b=siQiebFNoraWsO0aEWhSMm/0Gc4LdRln+2tzGxe7hAPU68Q4/xaRgWxhPKRPICWnmjxgiAM/XOFwsts1wLkDNj03ftewQDfzgi61w0JPNGindIGYLS/HGHeij1OObcvY+JpVjHrnZGmf2YVQvCoFCLpayU7WX6dbFB/vsboU2ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771026731; c=relaxed/simple;
	bh=VRrwEjVVTs/e01py2DnwftnxNvY0/1gwbkNqDvvoXIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gFemKgMZbqzGcWYqwULW1MQFgB/bBI5GigUp5oQeCp7ZC1H+hQcF8fKKdjIoAVeBsQHRPvlvi2+PrtevsqU9mDKYmIGF11eD3FvhgTfxPwmhus2QPXtrqkeBW5dPQq83V+CVZGFM/2J5ta12oydF9YkZxB6Wos6ik3wxKexxTKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=EevuPem1; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="EevuPem1"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b8860d6251bso179246266b.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Feb 2026 15:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1771026728; x=1771631528; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8VB8Xd1Nujtnfq04kvV4MS1Lu3pO9hRDtFRkXKGPyL4=;
        b=EevuPem1xd23G5bAvZSazZ1/ZiMSHLycEMMgRw1uPRAmPdAY7Toz618qvWfpCa0U37
         1c/AhW1DVmrRZtGDBd12r3gnwSFbou/4U49uF7R0yXkRjLn1bgcfsv8+u/bcRgAubT3F
         kW+TXp/eHpgz+SXDDvd/IhRb9fAKChAlF16Ks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771026728; x=1771631528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8VB8Xd1Nujtnfq04kvV4MS1Lu3pO9hRDtFRkXKGPyL4=;
        b=r8WhuUl8rl5FePpjiRF6U95hYNod5m9Qzd93TrE7q4i8AD7napVTKNs5fj4qfA3EgN
         e9ceNRGfIKh4E/4IP0UIHi/K8oOUtVv0JS7Syj+c4aWoKguwNoshfCGEZMteB+SA9vrp
         4J9+vZnQbz/eroyOqjvN2/5gRdMBZ5wy9nszQfMdfzI9EJtz4+oNBLrLWUKrDsk40+O9
         o0JQOoU49z8HPTyF//sXIbVKlL0qWA4DoxWZqLPqIVG1vctzMKFj99+Nk2I0Zr6Geo24
         HPO2at0cmh7FmTsMTE+X3EPvezuZ0D83JIlWYbYXF7YDFHXBK2lyckVfzaRIw/0cE/ku
         h8TA==
X-Forwarded-Encrypted: i=1; AJvYcCVc9XHBDQJ0uu+7GHvvVQmqor+Cq5+VTsv+F4IR67MdGEqVgy4XNUtmL1zrwkGxbopW5jTKaOmwZyMBgJHfhbYxQ1yI@vger.kernel.org
X-Gm-Message-State: AOJu0YyMhagGp5xz8eO+J+ICjZVOMCcxaFXg5B3QzTijoyx+zuuhEwRu
	L+ywAbaXI9nF2NSljND/21fNK7mNIN0Sy+UXbKVtVOe0QcCQ8lK5YLnFWzO8XqVgQtrjixrR6Lw
	sQvemP/I=
X-Gm-Gg: AZuq6aI/jnPn6GU74eaBKdd3JkwTWOFxhnLdaw3AHodQ/n5l55ntOkHamT2NqQn+Jf8
	R0lBhACx2FYrXkk+QkJbNl6J67/Rbnn0slziTzUpif60QBEvVhQfdm0gEhWVmj9tZfDXQ/UEG9L
	5vwM4NWLx8z8Yk40VyF7LgVjz9L2HwYBZk2PqH171N46+wGU0q2mXs9b5uPDm3zinP13HK9635H
	QMZgwyqACMltt71O7zFNWiWiZuQWaJYTzzCXNNDi9ILmEtKPqeYLHkv5tEwImC9f0fWVZk4EBSH
	bUnYvVu91CaTN6JjqNnESN7LWp3SNhcfGuLnXraig5nHDMzF1T4HVV+hYQvrgveNFEsZDbG0ZgY
	qH2Ed+v6w/Y1d+imO6kQZwxs8ESHkjzoCAb9FfxDN/uRZBru1uXkbzDPFMjzVmircxerr7dHFEj
	ZzcSJzV5qD4vC2bd7GqL5bjbCtg/1AjjGhZpsnIWpg09nWEbIq2nHy7fpXvnW9erjfSAF84SKyU
	pv4VUx9CrU=
X-Received: by 2002:a17:906:6a1a:b0:b8f:87a9:27ae with SMTP id a640c23a62f3a-b8fb424f5b5mr205758866b.27.1771026727611;
        Fri, 13 Feb 2026 15:52:07 -0800 (PST)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc766519fsm11323066b.48.2026.02.13.15.52.06
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 15:52:07 -0800 (PST)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so202028266b.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Feb 2026 15:52:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX39EhOF6yiqZkh/meSDpC5YE8gkBFFQ/LTW+5bhr5jSCqw98B/auZjTg752wjZxNIlSql2UxR+LToG8cDdCwKn9we9@vger.kernel.org
X-Received: by 2002:a17:907:3da2:b0:b88:73ea:a1d5 with SMTP id
 a640c23a62f3a-b8fb44fb338mr180252266b.51.1771026726644; Fri, 13 Feb 2026
 15:52:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pdx86-pr-20260213202427-653022255@linux.intel.com>
In-Reply-To: <pdx86-pr-20260213202427-653022255@linux.intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 13 Feb 2026 15:51:50 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh4hNNVW1o7NEeNiN-Kf=JdTsGuS09y9G1E2JiO08NGDQ@mail.gmail.com>
X-Gm-Features: AZwV_QjsIQBkmKHb0Jb3iA7FDpt2LWid-OedjlNrZB52FHsO15X4uPT4b6RiuJI
Message-ID: <CAHk-=wh4hNNVW1o7NEeNiN-Kf=JdTsGuS09y9G1E2JiO08NGDQ@mail.gmail.com>
Subject: Re: [GIT PULL] platform-drivers-x86 for v7.0-1
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jiri Kosina <jkosina@suse.com>, Antheas Kapenekakis <lkml@antheas.dev>, 
	Connor Belli <connorbelli2003@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 13 Feb 2026 at 11:00, Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> There's a known conflict with HID/asus changes that came through
> the hid tree:

Bah. I looked at that conflict, and I just couldn't stand doing the
straightforward but stupid resolution.

> Antheas Kapenekakis (11):
>       HID: asus: add support for the asus-wmi brightness handler

This was basically doing very similar things right next to commit
f631011e36b8 ("HID: hid-asus: Implement fn lock for Asus ProArt P16")
that came in through the HID tree

So since that asus-wmi brightness handler added a switch statement for
KEY_xyz event, I moved that KEY_FN_ESC from the QUIRK_HID_FN_LOCK
logic into the same case statement.

Maybe I screwed something up, but I just couldn't deal with having
that if-statement next to the switch statement.

So my merge isn't the trivial obvious one, and somebody should check me.

Same goes for the added HID_USAGE_PAGE_VENDOR. The driver had alredy
been changed to use HID_UP_ASUSVENDOR which is that same value in
<linux/hid.h>.

So I removed the duplicate HID_USAGE_PAGE_VENDOR entirely in favor of
just consistently using that HID_UP_ASUSVENDOR thing.

Connor / Antheas - please check your respective changes still work
after I went nuts on it all.

           Linus
