Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794241436;
	b=RsIJIm/pwXo/4gVd0CMUG+ZqyezbmtiHbL+qUn3Hobt2xxWJRu8elEVfdxQDDGx537JO
	 58up2SP91FGfU1cSMK2wfJJX3kwidZhukoeWVm5q7PtpPpU9cDikr9esrgZhCm4A+n/Ue
	 FHGPF7DoZVSUIXthfS4bZwgK/z10qOjVuCJViSwkaKqp5YgV64Il2frDmCULU0QB4XkQD
	 gdl0H4Bsoe24piNFWByQUy9cgRqWl3kldtBXzkaBnbo40NkCDqIhyMbt3xV8B8pXGG12l
	 9TonrO4fr6shFwXNLqkb+TfhadK6lN5OdjLpj0BYjKWAmzRw6Hc0NelGEVPyywpIXRg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794241436;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vLZwk4AFIJeTe2+OOXpWks9pg7PEHXnH7iojJi3jmvc=;
	b=fHAM0XDMwUFXia6bIO6XY9oRE871r7J0EiGQgIlHc96YxO11cbRL2e9f0OMhhXwiNpcL
	 wUClSI3KIGY/T56St52Wih3S+lCnuGwFQ/sDu/i4LiZGy+wU8oiRNf8rLzT46AZKdP40A
	 4F1xizG5EFcAH/EeiXt/sd0IvtLHTuMZ2m8mAlGLp3NNwO/Ekallv/4Pu60N+eYQPfDw4
	 hk28U2lp25Kvf9UY+lYpvmTACT/x1TxgWRE+1lJMrDmQHg07e5DhV9MfpC2NAUkJke+gO
	 TuARaYdQ6VWs4M4rDqwB57TDZABj+/qmbNWsOi8yYZ8/UNMByU9HgnlrK0Oo0V4EeGA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cu8nCAFJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.45
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F90606EE80
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Nov 2026 16:23:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68F90606EE80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Cu8nCAFJ
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7d2ccd3c7a2so359831137.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Nov 2026 08:23:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794241434; cv=none;
        d=google.com; s=arc-20260327;
        b=XWNDh6GmP5V2afov2HcLd1zJjYnqqP1eV7IV4boIfLiEOVVYQOOxyXvjYlonAKfnk1
         aldR8WH1fhFItotnY81vK8MuhZDNcsxMm3rmrphtUZ0hDj6dEUxkGwPS12ltZP4K6Hze
         jto1vBoP0OXtA1uY9mZRsLaynmWf4ZiJ00RebOy8/31d5MGEWXxNfGqjK8h7ZgMK0oql
         Zv0CFz0PLb9KgeySwyBaHFmPgGQKTnwKYQJJ7RYh5OLHYC7wsobClO5OIm7XXgb6+L9D
         rNKCoQQsD9bFlN4Oy8gvC3iqqYhxMgYutQw2kWSH2w/fJG9rt1taMY2ZJk98GtSTMg8U
         cHVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vLZwk4AFIJeTe2+OOXpWks9pg7PEHXnH7iojJi3jmvc=;
        fh=rVpOr2VMWWN5O6kBwXC/puK9bpFWPn5CH2b5pq8ezdE=;
        b=m9kbrF0JDpgi5xIajrr+hY3qPp03aAqWmD8sTUNb4H73C3t/OZZxxLyKQeZK6V+xdB
         U+KcH9enF8cDG8q/88lkPnzoiB1AQ4hrk0q8FMUbj5OJ1CIeoK0R67Gyw2uFtDg3lcuS
         meIK2a1Z5fCSzL7CjTpS50hiCY2MZaQY59aFsfbATatWr/1NGToxrJM79z4kE2MUI4U2
         9fqcaF8V0Tt+rKVOM/ZjcRejcZsV8DY1SbWMljIA/OC0EkAj7DfGLO+PieZKGhyQbEeU
         FgyaSAAPlPCoArCliziKmUzqqBv6q6vSTNSaN8S7dcXNgO/qSr/foDparePm1eKZ9Omv
         DZTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794241434; x=1794846234; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vLZwk4AFIJeTe2+OOXpWks9pg7PEHXnH7iojJi3jmvc=;
        b=Cu8nCAFJSXX1YDSVio7oqyzvXPl9HWlcRR9i2jzOoHw4PRb6CH5HncmiohpoxKLpzX
         N/dGyR9P45dGot7ZOuleBMWx+7yxVu3EFzgz1oTFkBj19ZVZYLrJhxQqMJn2/W0pW2sj
         pfJ/aE+YoVM+n5e/13dOmSyvzPDskcDa4ZksAzmMLm+Bge9emGrPg6hc91K+wmMKjwpm
         T50SfGtlMgieqSeuREMuL8GevutwdTz575y1No5Pn0KpLsl0HOKx1/Rr6gDtUKjmDmXo
         3iPvdRDchZyejywYz3AxhKbYa5jBHp4dT/WxxKb7vfLZAi0KSOnkVlKWCldWStWhFGR0
         xCWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794241434; x=1794846234;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vLZwk4AFIJeTe2+OOXpWks9pg7PEHXnH7iojJi3jmvc=;
        b=EO3Y9pfTtu/QmTuVqkZIg3vxgOOrY8ualZ+sFXAVLqr1m5ZJt4ApYmGp5ixdWr0bkf
         aib+ock1xHTxMlRpHCn1OTsW99BzwHMSh+PsrW5P/NJJwr/Uk/G5fZ0KvI5gi5Zk7yrv
         SKyU4D0INKjGZYAPcgxyLKh3HPN1jPSgWhOGrzg03jmr4e7pOQoMPnI2jpW2uh4Fpf9e
         fytpPEPnrrgMjwWVPdzRTnrHKokCP3Nufpo0zATl8mqTfNW4gVwmIsn/npjeb6yJ9LAW
         RFsE/geqz2dALVTBJlDVldEyOXLLjigNndDH4WUgHWlmdrY+pM+15TrlNOtwp7VsbGF/
         W0nQ==
X-Forwarded-Encrypted: i=1; AL+hErGnsvV8v1Rd8cvFgekcyqYYIgvymncIwgOVz9jghXdQVchf5/yf6DQvG9xMuqzytpGDcVfEv8e/F7nxWpwaGUNq00wH@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ef6zFI6eKV2zA8J0cl9QXvvUZZ7f6qEv5haE85ba5i7Mm3FI/
	FAacJZWDGwSd3wzWJe2PaPPp3DC+VIFo7ANQdzLxLnU6nJE4QPIJJsfP0vJeTn0VwNZOZqzf/xz
	X8aXFkltwMYHFsESdt4zx76JLPCCj1Gk=
X-Gm-Gg: AYBFou1QFpwzttND27JB/qppLDRUG7Jnk6H8CaxRviBsnILKlKonhJoWVnJxjcZfR5i
	YVAeh7Qlilce4q4dgmGP7oXRKNfzURBjBX8sF+FjEsxjpapZ8IGvRqdzZm801Vdi/HI7BVs3QDv
	/rKa/3PiqTwQwPXf5uXh8m3sy8S4FaAQZ44NCbOs8UeuHT9kfH8lxAvt2v0wjOlof6eGKLIBzK8
	8vOd+xVGt8tbUKMso3LKpm3jbJfpSOBI3lQzCop8hmOztY/d2SVcsIjL25kUbc+aDqRtW6qxMh0
	z4nxU9mbaCk3mRju0PU84Y+FhxKmXq/MfQBkgkrmLppKQL9IhvDqDNv1hx2D/8ViMGlZ0zqYBMS
	e6zD/ZqRQzjxxc1RgtcsDkvwmrSFFrH6uqc+/mIU=
X-Received: by 2002:a05:6102:604a:b0:7d0:5688:f511 with SMTP id
 ada2fe7eead31-7d2db157523mr1181146137.16.1794241434153; Mon, 09 Nov 2026
 08:23:54 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108213656.13031-1-antoniovazquezblanco@gmail.com> <CAHp75VcP6AD8-vSG-QzxTCWm8RWJG2CQJ=9mrn=3nFGJd2YJXw@mail.gmail.com>
In-Reply-To: <CAHp75VcP6AD8-vSG-QzxTCWm8RWJG2CQJ=9mrn=3nFGJd2YJXw@mail.gmail.com>
From: =?UTF-8?Q?Antonio_V=C3=A1zquez_Blanco?= <antoniovazquezblanco@gmail.com>
Date: Mon, 9 Nov 2026 17:23:43 +0100
X-Gm-Features: AclHuK9_L7g6nQeJqb6GRMpf5wVh4DmYUaeFgBi1z-Yb1qLIeH2stSdKS5uAbfY
Message-ID: <CALAp9RGDV-L6icyq6nJhEA1=4DQuj-UOb-3B_NiUAi1JVTojkA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Fix MSHW0040 button driver selection on AMD
 Surface devices
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>, Maximilian Luz <luzmaximilian@gmail.com>, 
	Chen Yu <yu.c.chen@intel.com>, Sachi King <nakato@nakato.io>, linux-input@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

Thanks for the review.

On the tags, agreed. In v3 the acpidumps reference moves into the tag block
as

  Link: https://github.com/linux-surface/acpidumps [1]

and I will keep the v1 thread, marked [2] and referenced from the text,
since Dmitry's review there is where the "0 is a valid revision" design
comes from.

On the documentation: if the maintainers would rather not take it with
b4 shazam -M, I am happy to put the model table in a comment next to the
check in both drivers instead.

I will wait for Dmitry and Hans before sending v3, so it can cover anything
they raise as well.

Thanks!
Ant=C3=B3n


El lun, 9 nov 2026 a las 8:10, Andy Shevchenko
(<andy.shevchenko@gmail.com>) escribi=C3=B3:
>
> On Sun, Nov 8, 2026 at 11:37=E2=80=AFPM Antonio V=C3=A1zquez Blanco
> <antoniovazquezblanco@gmail.com> wrote:
> >
> > This is a rebase and rework of Sachi King's series from November 2021 [=
1].
> > It was reviewed then, the review was never acted on, and the thread wen=
t
> > quiet in March 2022. Sachi has confirmed they are happy for it to be
> > carried and no longer have the hardware. Both patches keep their origin=
al
> > authorship and sign-offs.
> >
> > The problem, restated, because Hans asked for this in [1] and never got=
 a
> > clear answer:
> >
> > The AMD variants of the Surface Laptop 3 and 4 use the same MSHW0040 AC=
PI
> > device ID as the Intel Surface devices from the 5th generation on. Both
> > soc_button_array and surfacepro3_button match that ID and tell the grou=
ps
> > apart inside probe, by evaluating function 2 of the MSHW0040 _DSM, the =
OEM
> > Platform Revision, and treating a returned 0 as proof that the method i=
s
> > absent. The AMD variants implement that function and legitimately retur=
n 0,
> > so both drivers draw the wrong conclusion, and surfacepro3_button binds
> > where soc_button_array should.
> >
> > The sound test is whether the device implements that function at all, w=
hich
> > function 0 of the same _DSM advertises and acpi_check_dsm() reports.
> >
> > To answer the question of which models are affected, every ACPI dump in
> > linux-surface/acpidumps [2] carrying MSHW0040 was surveyed, 32 models, =
for
> > UUID 6fd05c69-cde3-49f4-95ed-ab1665498035 revision 1:
> >
> >   Model                        fn 0 mask fn 2 advertised
> >   Surface Book 1               0x03      no
> >   Surface Book 2               0x0d      yes
> >   Surface Book 3               0x0f      yes
> >   Surface Laptop 1             0x05      yes
> >   Surface Laptop 2             0x05      yes
> >   Surface Laptop 3 AMD         0x0f      yes
> >   Surface Laptop 3 Intel       0x0f      yes
> >   Surface Laptop 4 AMD         0x0f      yes
> >   Surface Laptop 4 Intel       0x0f      yes
> >   Surface Laptop 5             0x0f      yes
> >   Surface Laptop 6             0x0f      yes
> >   Surface Laptop 7 Qualcomm    0x0f      yes
> >   Surface Laptop Go 1          0x0f      yes
> >   Surface Laptop Go 2          0x0f      yes
> >   Surface Laptop Go 3          0x0f      yes
> >   Surface Laptop SE            0x0d      yes
> >   Surface Laptop Studio 1      0x0f      yes
> >   Surface Laptop Studio 2      0x0f      yes
> >   Surface Pro 10 Business      0x0f      yes
> >   Surface Pro 11 Qualcomm      0x0f      yes
> >   Surface Pro 4                no _DSM   no
> >   Surface Pro 5                0x0f      yes
> >   Surface Pro 6                0x0f      yes
> >   Surface Pro 7                0x0f      yes
> >   Surface Pro 7 Plus           0x0f      yes
> >   Surface Pro 8                0x0f      yes
> >   Surface Pro 9 5G             0x0f      yes
> >   Surface Pro 9 Intel          0x0f      yes
> >   Surface Pro X SQ1            0x0f      yes
> >   Surface Pro X SQ2            0x0f      yes
> >   Surface Studio 2             0x0d      yes
> >   Windows Dev Kit 2023         0x0f      yes
> > Exactly two do not advertise function 2, and they are exactly the two t=
hat
> > need surfacepro3_button:
> >
> >   - Surface Pro 4: its MSHW0040 device carries no _DSM at all, only _HI=
D
> >     and _STA.
> >   - Surface Book 1: it does carry the _DSM with this UUID, but function=
 0
> >     returns {0x03,0,0,0}, advertising functions 0 and 1 only. Function =
1
> >     there is dGPU base attach and detach handling.
> >
> > Worth noting that v1 said the devices needing surfacepro3_button "do no=
t
> > have the _DSM". That is not true of the Surface Book 1, and the inaccur=
acy
> > is probably why the problem was hard to follow. The commit messages now
> > describe what is actually tested.
>
> ...
>
> > On merging: please do not separate the two patches. Both drivers match
> > MSHW0040 and discriminate only in probe, so with only one of them appli=
ed,
> > which driver claims the device on the AMD variants depends on module lo=
ad
> > order. Hans asked for the same arrangement for his own two patch series=
 in
> > 2022, so either tree with an ack from the other would work.
>
> If we go with this series close to its current shape, I really ask
> maintainers to use `b4 shazam -M` for it to make a cover letter
> (without list of files and changelogs) be present in the Git history
> (as a "merge" commit message) as it supplies nice piece of
> documentation (see the part above ...). Alternatively we might want to
> see this be listed somewhere in the code as a comment, or in some file
> under Documentation. The rationale is that it is always hard to find
> people who may test something on a variety of the HW and having a
> technical background provide a valuable summary.
>
> --
> With Best Regards,
> Andy Shevchenko
