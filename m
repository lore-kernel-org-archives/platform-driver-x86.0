Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794208243;
	b=KUdbJ73X7ItMPIiCPp1VZY0tNIWhgH4bT+JLZvdTR1UuTGXqA1Dg/hruBXKJYJGgVYT2
	 KxR2BizMx5gaZBXkX3oxPEz8+hpQ4OaAcLeeJtVy02r1irl9VC8SX73/3XWgPcr6ThoWn
	 hIRVy6do3T7OiGzecGrNJueomAtL+5Sp41hZOPLC8cFHmE1u8/MoRAa/gxFBj1+TUFNc3
	 n434L9qYYrc61Lj9Z1a2Fcz1oCzY2R4gnraaetOHlOlyxDMDP1KiLBJEQIN1Qj11e97O+
	 oWc7jwFThAdvTEIK9ZtrHHOc/IS03xhp5gMebHqHz48cdiR+bAwWopWMdcWpz1w9Zpg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794208243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sZhN6iC/Sq69bChd4hl8Q8m5Mn1G9mu38NRvMfBDUtc=;
	b=0dGumQavEevQMO7bqf/UN4aKJo3b7BCDCNhZ85QgiuizCSZV1AWLLC80AkNMkAm0Y39i
	 WDbvGLKXaL0l2Li2fmb6WEnmRqYPpUy91dTXdLKAN/3pXmqHH3+prHYTVVztMNqi25sJX
	 DnqBoEsJCoa1K7oaVIImMg8HDPxuMeuu1UJY2lXHsnU8g/cyuF+58zP1XeXe0jfANnUQ2
	 VMkFqBzRy9F4yy9zBB0274qzLS9telKquKBjH20kZuL1wMUOJLpvai8hbqsqzpl+juWLo
	 ff3YHaJzgvx1SbGRi7ea3VjzlqtvP2bpBH0d+fbV/HD1uUq35aoRvt2UI4M0G05cw3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qoK31i3p;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADB1606A336
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Nov 2026 07:10:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EADB1606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qoK31i3p
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b33a08df33so3789717b3.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 08 Nov 2026 23:10:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794208242; cv=none;
        d=google.com; s=arc-20260327;
        b=auZtc9g4fe/QU3GZo0K4K1003CpHIVQM5wAiPZ/Ne/gOu2RzH4qSEcMDrRbjm8sbuM
         PMbKio9JUYPWxHDWOA1kah3aWtsrrneGlyfQRUP4SJg1Caqw89dBS3ek+cVHxY9ohIrW
         8h7ynOXWu3ds3zvmZHDcJf3c0Id8VlgEZRAqlN9Zbj36hQUWyse7b4KY0sraEn3l5YmP
         aTYIxYD3h1IxhcAf/z969DYdkP8xIdMk3dVNt7Qr0Hcj2z7e46lVixl4r5jCYkS0hJP2
         9blQxB+6GXdiFDStMc+bkW9IcopEg3bR/Zz0yKi0KM7kH9lVdhyXYsoSVh0hXAX8DRvS
         zukw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sZhN6iC/Sq69bChd4hl8Q8m5Mn1G9mu38NRvMfBDUtc=;
        fh=qBm1/KFE4aeQgxK2Ojiu0NqP9LP/i/3C/WSYwUaDMB4=;
        b=KMNSqbO+V0gzeLq3c7WLDn3I/TTOY939pbWi6OPnFepPlyNag1LcAvsXpeMCb464vD
         jWk48T8t+dPbVC9eci5pSYFvukhMLh7EtTvfCI1sdYwCu/RxL6PoglVOlMrgrHY2Ev1j
         hVXl37acsYktpUM4Ne+0tK5nKmLbG+cvFeWgvrDcOon+GM+6sRQy7EMRZUohbR593MjC
         wK9nqqfpmCMSGLHTgBDY3XDQFYgu3KIpYcp/LT+dcAMx8cgvHY1mCycDp3VEeNWzOHfQ
         okQEgUuJPmi8Qegnw5j6ybjaaGW984hm9HYjoryKjl0Bzao3ufE/Faj1lqIzn58srWVc
         ysbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794208242; x=1794813042; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sZhN6iC/Sq69bChd4hl8Q8m5Mn1G9mu38NRvMfBDUtc=;
        b=qoK31i3pV63aikaG2dHW3gw0V/bLxJgV0EQGKPdaCgbTdWoQAzcJC4ysHmJqxeXeQK
         9+FvOk5a8y7fVOX5soRaEWtz8ChW1XT27z0JEYxdmNX6r7G9906B+52XOoEONJugQwIp
         tXQ4GwV5SzU6agWZyZp7wr+2m7fo4Xjq64AMmF3wrnZbdag+yf3/b6AzEtjzT1L8BUJp
         ahvAmln9ikWXqUlTfrKGT2Pd1baNNMNsahWoYeqJO1cQk6bdfnyEaBy/n9OjKD2b5SQ0
         GpkrmIsYSF6ljDK6D6rYeAcAGPnJMHL5WmvE7quZq210Cp2DYaD3UdPD/NU0Z4Wwna1k
         vdyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794208242; x=1794813042;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sZhN6iC/Sq69bChd4hl8Q8m5Mn1G9mu38NRvMfBDUtc=;
        b=fAw/bMasQX4ae0C1Y1VTNxwIQI492OnH1Dn4d4Szhw5IJ5ACZVUHq60VdbXiPPnPHw
         5BtEakR8ueEy01TxM18uJ+3v0rA1fzBSuNRwCHXeSuVEbxT+CqH8VeF3wY3IgVBRNqZL
         D2kqtEoBReJwOcqdCWeR1zuQKe87JOngwX+XeJ+aekPQKbmx2KeW2azyiXTUqpXFfRcb
         cCHMuTQ0AVDtOttL2o7K8vzZQwg9dfFEskWz9vpahhZy4sjw4D1ITrbw3DN5ONBBqS4d
         tjm8r2kHsmNQ5fbtwVVcuoGNXjH/ZnqIzUXe1zKaS1IHA41POtj0rHIyG5u+kouUrFE/
         0pMw==
X-Forwarded-Encrypted: i=1; AL+hErGjxFy6IWRxEa1jOm8I2GG5XC/IU6jjozQvRB2TK8nJ+Z3RgbtdYYDi9Qkg57vk8D1EvpSB8jCbDxaWoj5+HaWo9YXT@vger.kernel.org
X-Gm-Message-State: APuU4Z8Fk5Hfx8FpZ6er1YV2yhDYoJuOdrBPUxnPShTeVZUVwaxpeen3
	TRsAILYJUmrmxXjbCa7jPVUSl3Mo3+U5bGgPOJCcuv0FaxRbdGob2a+befFbLkYNN8b/IMJDcny
	XDZ/lP3rvPs6198VRVdcl1mwJGj4uq/Y=
X-Gm-Gg: AYBFou1VPRIJMLdEiHL/ovyqv1gawzZwHVgc7kuLIITRUcd/XhALH20Z6r64j202XIW
	MtLJwCoe15BRViTWKW4t5PZB/IaPfsznOZBs693Blk1jYBgh2zQb2Mzsy0usQJpKffBNL8+U4B6
	8kTrW3jsFXOM6NvPSWYkt0HZfM4patOLiJDrl79gN3dk2ejP+4Ciyoik+zfOO7mD2dD4RjDaxhy
	jV4rKuxpJWiIhCgCqXw8jDMIB2H0MOnufc+uVT0osYJ+i/YBk7+BHGPA9vKPPxo9h7qcRnsPWEz
	gTiZG21xUlutExB/yoh2OnH3Jw5kwiAIGZ/7ZhzcPybdiTVUztqnkY9Wy0VeJf+ik/YNGNXWzGd
	6mdRRl5WMHAjOE1FREzrKORwsY3mmB/bH0cHr0AX8KcPiV+T+kLLwQdoY3YCRreuvaDchkeRxHS
	MHwXLO0rPOQY3ny9sLnYCTJVUZBJrLtJis75eFKoFTJqFRjyQTKsWyR9asBe/Nlj230tv/y73Zw
	e7sTTZUYMV0ccfLba0n51KJ+urwrPIQeTLGLmFpRp8la0WGEiKMdizOphvMxw==
X-Received: by 2002:a05:690c:9213:b0:8b0:dadd:e578 with SMTP id
 00721157ae682-8b36cab7460mr16553447b3.30.1794208241914; Sun, 08 Nov 2026
 23:10:41 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108213656.13031-1-antoniovazquezblanco@gmail.com>
In-Reply-To: <20261108213656.13031-1-antoniovazquezblanco@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 9 Nov 2026 09:10:05 +0200
X-Gm-Features: AclHuK-FhW3Y6XmNHzP6haZP4G5X-CZNURWWPI-z5sCpXmwCxD-yiO7h25l1YMQ
Message-ID: <CAHp75VcP6AD8-vSG-QzxTCWm8RWJG2CQJ=9mrn=3nFGJd2YJXw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Fix MSHW0040 button driver selection on AMD
 Surface devices
To: =?UTF-8?Q?Antonio_V=C3=A1zquez_Blanco?= <antoniovazquezblanco@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>, Maximilian Luz <luzmaximilian@gmail.com>, 
	Chen Yu <yu.c.chen@intel.com>, Sachi King <nakato@nakato.io>, linux-input@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 11:37=E2=80=AFPM Antonio V=C3=A1zquez Blanco
<antoniovazquezblanco@gmail.com> wrote:
>
> This is a rebase and rework of Sachi King's series from November 2021 [1]=
.
> It was reviewed then, the review was never acted on, and the thread went
> quiet in March 2022. Sachi has confirmed they are happy for it to be
> carried and no longer have the hardware. Both patches keep their original
> authorship and sign-offs.
>
> The problem, restated, because Hans asked for this in [1] and never got a
> clear answer:
>
> The AMD variants of the Surface Laptop 3 and 4 use the same MSHW0040 ACPI
> device ID as the Intel Surface devices from the 5th generation on. Both
> soc_button_array and surfacepro3_button match that ID and tell the groups
> apart inside probe, by evaluating function 2 of the MSHW0040 _DSM, the OE=
M
> Platform Revision, and treating a returned 0 as proof that the method is
> absent. The AMD variants implement that function and legitimately return =
0,
> so both drivers draw the wrong conclusion, and surfacepro3_button binds
> where soc_button_array should.
>
> The sound test is whether the device implements that function at all, whi=
ch
> function 0 of the same _DSM advertises and acpi_check_dsm() reports.
>
> To answer the question of which models are affected, every ACPI dump in
> linux-surface/acpidumps [2] carrying MSHW0040 was surveyed, 32 models, fo=
r
> UUID 6fd05c69-cde3-49f4-95ed-ab1665498035 revision 1:
>
>   Model                        fn 0 mask fn 2 advertised
>   Surface Book 1               0x03      no
>   Surface Book 2               0x0d      yes
>   Surface Book 3               0x0f      yes
>   Surface Laptop 1             0x05      yes
>   Surface Laptop 2             0x05      yes
>   Surface Laptop 3 AMD         0x0f      yes
>   Surface Laptop 3 Intel       0x0f      yes
>   Surface Laptop 4 AMD         0x0f      yes
>   Surface Laptop 4 Intel       0x0f      yes
>   Surface Laptop 5             0x0f      yes
>   Surface Laptop 6             0x0f      yes
>   Surface Laptop 7 Qualcomm    0x0f      yes
>   Surface Laptop Go 1          0x0f      yes
>   Surface Laptop Go 2          0x0f      yes
>   Surface Laptop Go 3          0x0f      yes
>   Surface Laptop SE            0x0d      yes
>   Surface Laptop Studio 1      0x0f      yes
>   Surface Laptop Studio 2      0x0f      yes
>   Surface Pro 10 Business      0x0f      yes
>   Surface Pro 11 Qualcomm      0x0f      yes
>   Surface Pro 4                no _DSM   no
>   Surface Pro 5                0x0f      yes
>   Surface Pro 6                0x0f      yes
>   Surface Pro 7                0x0f      yes
>   Surface Pro 7 Plus           0x0f      yes
>   Surface Pro 8                0x0f      yes
>   Surface Pro 9 5G             0x0f      yes
>   Surface Pro 9 Intel          0x0f      yes
>   Surface Pro X SQ1            0x0f      yes
>   Surface Pro X SQ2            0x0f      yes
>   Surface Studio 2             0x0d      yes
>   Windows Dev Kit 2023         0x0f      yes
> Exactly two do not advertise function 2, and they are exactly the two tha=
t
> need surfacepro3_button:
>
>   - Surface Pro 4: its MSHW0040 device carries no _DSM at all, only _HID
>     and _STA.
>   - Surface Book 1: it does carry the _DSM with this UUID, but function 0
>     returns {0x03,0,0,0}, advertising functions 0 and 1 only. Function 1
>     there is dGPU base attach and detach handling.
>
> Worth noting that v1 said the devices needing surfacepro3_button "do not
> have the _DSM". That is not true of the Surface Book 1, and the inaccurac=
y
> is probably why the problem was hard to follow. The commit messages now
> describe what is actually tested.

...

> On merging: please do not separate the two patches. Both drivers match
> MSHW0040 and discriminate only in probe, so with only one of them applied=
,
> which driver claims the device on the AMD variants depends on module load
> order. Hans asked for the same arrangement for his own two patch series i=
n
> 2022, so either tree with an ack from the other would work.

If we go with this series close to its current shape, I really ask
maintainers to use `b4 shazam -M` for it to make a cover letter
(without list of files and changelogs) be present in the Git history
(as a "merge" commit message) as it supplies nice piece of
documentation (see the part above ...). Alternatively we might want to
see this be listed somewhere in the code as a comment, or in some file
under Documentation. The rationale is that it is always hard to find
people who may test something on a variety of the HW and having a
technical background provide a valuable summary.

--=20
With Best Regards,
Andy Shevchenko
