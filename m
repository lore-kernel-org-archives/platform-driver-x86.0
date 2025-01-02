Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8D815C0
	for <platform-driver-x86@vger.kernel.org>; Thu,  2 Jan 2025 06:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735798722; cv=none; b=VWvyLfvbez8mxfv4XM3ZXukOfs7MYMnnvfQui1GHuKyg9Yv8I3GZubDjKbfA2cOKiIxzW6jCY0fNsi3OMKvaO/wEG5ZEnnbZXznXaLk2+6HRtIJoEK+f7Nr8Z0WnxPlXFLdk3YaXOKxecaxbd22CztO5i5lMPdGTIGYFL0RbxjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735798722; c=relaxed/simple;
	bh=9ba2u98M5LF7so66rciPTvVXDoYL5AizlB3oJ1H1FIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ALPMB4okHkR3CUo8uFOxBxA+YQIlfp71dWbFd/BFmZ9lbwQimhm1RtiIAISXcUQfaaQLSN1Np9QrDABfE+z/lOCW6Hom/bXvtp7D541WR2eNZBSrPnEsLPZ+MuqdfvC6zuuODWtT5en61rW/pnZUW+5xd3V9kCV4nPL3sJb5Ax8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mvLASUL2; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mvLASUL2"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2f4448bf96fso11680597a91.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Jan 2025 22:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735798720; x=1736403520; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q8oTL07LpqdN4g9mX4lTN0Ks3cUBjTJmMBJL1DF+3NA=;
        b=mvLASUL2eOjbSZQ6Tic72q+tQ3ds+uaTfsCz5NG3QYUs7CcF9z1J7gbw7oi+6PnQlV
         JNbNC01AlM1CI5ex/JCqg3i/Q2pzMC+HlPPX99+ev/9M8yql7tTUENKbxanw69u7KTH6
         iUAL/aoX2J6OQUeZ98TzHW0yWk/hJd4HpCWQz0NRN/gr57gt2baQZJIx32XQrvzuxthm
         P6PS9WtJN24FfZ8ksUKHiHy90wt5i5JsC6QT1uFKDQd4OnUlXUPZxIFrRxOQPjm5QgfK
         flQQVqcGHehIiXw92qX0boY4yg3aKxwAA7cyxSFch+aLOem0nfaNER6fvXXfOVIfX24f
         i5fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735798720; x=1736403520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q8oTL07LpqdN4g9mX4lTN0Ks3cUBjTJmMBJL1DF+3NA=;
        b=VqpMaNkINZPbVUsgHrjVaTCpRGqabJPG7hoGOit098pQmgwcYHLFp5Nddnc/VBRjDs
         AxZA6AzEaAvSaj7GYk8WB6MJFpQ1ye17xfsPKwdVf7LGhAQ2tsVxnuRWsnt5ZJgHAeyE
         MQ2naqhE884T/m9ue30oU9nG8hYgC6EBPNiisdOdj0kHVi2++IfWsV3K63PnkJK61bjd
         fHVyQFgGHsLiR1Tm7z27awet2x0uIpajoUqN72Fi47vVAdFpN6XxWWNRgunuO1Au/1Yw
         32Wxx1TTdMXNhHgw2H9cDm0IBznzGi1G7e9QsEooqsNsNy5rA6khUbBOZD6dZMvWPII/
         nbzA==
X-Gm-Message-State: AOJu0Yz2VoYu0KEigLNuSh1Z8sWCNr1g+UScCkMAqdozZP81FxiMP5wH
	0yBh7HVViXfJoZnOyIjMwuxGlJWPQbrYaEe0/PPuoI9tdvt3RYZg7fFQEad/t08tjqgiJCIm704
	yzJskPohPYNrGXnFHjC8R2TnTtgnJbiLl
X-Gm-Gg: ASbGncs9WQ3580B9b/aLbJ//NKGTcLoKw8YMz3qqA+RZ7rxQEZUzeoOxbM1GI83+vHi
	J/Zcol2+Ow+gPmPi2mOtWbHERNB6NxJ5YYw==
X-Google-Smtp-Source: AGHT+IHpzGCDD5sl31OtSrMSzjHnvH99aH6KJKtwKabDbNGc99jsQQJA13n3+sONX3JVXT27J1kTl5LRPdlQ2Xn11qU=
X-Received: by 2002:a17:90b:2f0e:b0:2ee:7c65:ae8e with SMTP id
 98e67ed59e1d1-2f452e1498dmr63499321a91.11.1735798719969; Wed, 01 Jan 2025
 22:18:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALiyAom1xDH6A0Q2WNHCMUcpMJfM3pXO2DaW=bgHGUi8ZOpBbQ@mail.gmail.com>
 <8b8749c1-59c8-4f95-a43e-055cf94f9597@gmx.de> <CALiyAo=R1kcvwRpw22s=YU0YHUxR8T_WHLwSvDr=8Ahsenn-jA@mail.gmail.com>
 <9c625119-e46e-464b-933d-9c836577f454@gmx.de> <CALiyAo=7kVi4ipA5-xDfRYQ-gqyza0woYHUzwGuW5BccLOVHgg@mail.gmail.com>
 <209f39ab-a312-45b5-981c-8324d9b8cd90@gmx.de> <CALiyAon+5H_g1V-iNbjdLmjgYDJng+ePH0XeoYxijYurHj+uTg@mail.gmail.com>
 <31c28ea2-881c-42e3-b754-8b52ca7f63fd@gmx.de> <CALiyAo=_vGu50RoAPwFMv9J=mkaQWojAQxmB2qmwcEZ5Y8kfSg@mail.gmail.com>
 <583bbdfe-5c5a-4541-b30a-97eb89f2e4c3@gmx.de>
In-Reply-To: <583bbdfe-5c5a-4541-b30a-97eb89f2e4c3@gmx.de>
From: Hridesh MG <hridesh699@gmail.com>
Date: Thu, 2 Jan 2025 11:48:03 +0530
Message-ID: <CALiyAo=Y1rh=OpTete0N=q2DrFh8CL449xAfSxfJuju+5tc_mQ@mail.gmail.com>
Subject: Re: acer-wmi: Nitro button doesn't produce a WMI event
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 2, 2025 at 1:51=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wrote:
>
> Am 01.01.25 um 20:53 schrieb Hridesh MG:
>
> >> This ACPI method should trigger the turbo mode button (found inside th=
e DSDT table):
> >>
> >>          Method (_Q58, 0, NotSerialized)  // _Qxx: EC Query, xx=3D0x00=
-0xFF
> >>           {
> >>                  Debug =3D "=3D=3D=3D=3D=3DPROJECT_QUERY_58=3D=3D=3D=
=3D=3D"
> >>                   ^^^WMID.FEBC [Zero] =3D 0x07
> >>                   ^^^WMID.FEBC [One] =3D 0x04
> >>                   ^^^WMID.FEBC [0x02] =3D One
> >>                   Notify (WMID, 0xBC) // Device-Specific
> >>          }
> >>
> > I feel like an idiot right now but I just realized something: So far
> > I've been assuming that the button I've been calling the "Turbo
> > Button" worked the same way on both Nitro and Predator laptops, but
> > that's not the case.
> >
> > On Predator laptops, the button directly enables Turbo mode but on the
> > Nitro it only opens the Nitro Sense app. I had assumed that both
> > buttons simply opened the app and that directly enabling Turbo mode
> > was a feature provided by the Linux driver.
> >
> > Given this, the ACPI code that you linked earlier is probably for the
> > Predator's "Turbo Button". Could it be that the button on my laptop
> > doesn=E2=80=99t use that ACPI code at all, considering its functionalit=
y is
> > completely different? (Though i doubt Acer would leave it in if it
> > wasn't being used)
>
> It is quite common for manufactures to just copy and paste ACPI code snip=
pets, so it is not
> unusual to have some unused code inside the ACPI tables.
>
> Did you receive any input events or dmesg messages when pressing that but=
ton?
>
> If no then it could also be that this button depends on the Intel THC tou=
ch controller to work,
> take a look at https://lore.kernel.org/all/20241216014127.3722172-1-even.=
xu@intel.com for details
> about the Intel THC controller.
>
> Thanks,
> Armin Wolf
>

I do receive input events, it shows up with the keycode 433 and symbol
XF86Presentation. I think you mentioned something regarding an i8042
filter, can we use that to call the function to cycle between the
profiles?

--
Thanks,
Hridesh MG
