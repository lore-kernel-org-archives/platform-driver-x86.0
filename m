Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821492119
	for <platform-driver-x86@vger.kernel.org>; Wed,  1 Jan 2025 19:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735761227; cv=none; b=lRLC3PQduTO2pz/le9++2GtnWoX29wWcmQMAb6GaJX4ttsTo6hI4gXr9nUBkBwddQkR1xzyk3kpp+pLhGjmzi0YUweYgV/Yebv/aCrID6WfJ4oT8PE9ZqH+otyjOeSFg9whX4EKF5sSrySQIWq42945KZ9w7ungco1ONj5uuVGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735761227; c=relaxed/simple;
	bh=oeEcf19e8PZAQQcleT85cjP4gMxLATzzpToP+lYf0Sg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YN1xP+T3p8GtbEK1MPMrWi5fepz459bHr6SaHZrCgEyx+tsPxMnyhmziAldPzCSi92QdqLFjGtRP00A0wQ4M1z2r5GH8gFrHqhMF3ikEP2BwfCi0AHc2Bp6P8ATsiMz4slL6oG8NQ3mvlyLZACZ61rBFwa+V29LgeyylSRVFl3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kj5VQzDA; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kj5VQzDA"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2165cb60719so147101785ad.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Jan 2025 11:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735761226; x=1736366026; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVTWLJ4fwzl05aXyEUO3bhJxhCPB8MHShdQMfTL6o7Q=;
        b=Kj5VQzDAykvYZNPbk9Mh93YBasA547sCDsBwB/5dhep4vCzUPtP4gvjfGgwEe/KB5V
         NN8tVq9cpLTM2Rgd2l8K0NKi5FmUrqgnlJpaUoy+YQzeysTI5FXcjYRHXOeAkoFEdn7z
         4ROvztY2LA5SoKHd+Y4AtFpiaRqd22DWiYnGV+Q7TLvXEMlCvgIdw/kJZgI6x5IayyZh
         e8RM5IS9WmRGyEUOR7KmHLvf95PTyM/UUnEFuINc71ldLO61tSev1Ic/B3OiCcVc8Sma
         XPCXw7nnZmc0rCxnluBQKtBX7XQXYQB8CvT+rrR6ogHoTlALRGjrCu9OcQmCp4qy3PD7
         wuxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735761226; x=1736366026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VVTWLJ4fwzl05aXyEUO3bhJxhCPB8MHShdQMfTL6o7Q=;
        b=c2dVtme0qQu0TEWLqqXnfnJ6knFeK1gK5tdJtPc411u4HZwEsvm1U54xAYuzljh/Hf
         BL0uXFLKPa5TGyY5UxkLdj5WQEaZTAX7cGonhSLWkoNeEGbQP7wWmERBsnvKMmA/g+u3
         aJvX+qSFO3ul5VZSvuxtONRcQheU9YM3th2dnRou+hbN6Es0lGBqtUoZUNWd6lNxQR+z
         rytX1NQJksYi6XDtZk+9OnVXxKG8+y4LKSzWJz2yG0xhxoVCZ+/som+2vS/9L0Oeq+nQ
         c+EXgGeLAhTvwMj+++NO7DhoPSjg9iD4moyzXRwgJOKqMuDYCNeWwuhiJ9Bax1DrlbYd
         c+QQ==
X-Gm-Message-State: AOJu0Yz/fQTw5VCuk4L+fBTlQ/ZyNiZALEGSaxhs1QTVqpePo02RhYaC
	pBiwP+HoEk5xaFzZn5PkRcifthaV4ENcl7swiEpvee8+IO9JxC3Gd8fAoMcHypadzwnkzZhwZzt
	Hf9+tLSCSz5dvlBqAq0+pHZZBpNQj/SSRx4k=
X-Gm-Gg: ASbGnctxXUqPoiss8/HYopt/R/WDK3GRrElBnGxKRqvT/2UPkmeycAyuqX6MK4kR7rx
	ElWfNBGF7Wedti2wqVgVppNu+iSLGJ61LgrgBcCA=
X-Google-Smtp-Source: AGHT+IE4HhVdMSgF43KR+ak43NmuzFHBff6sZ9ZTuUAqzKYoXxWya53BZYbTDwvsCrnfTRbbzee5+9nMcGOkGPh6yDA=
X-Received: by 2002:a17:90b:274b:b0:2ee:e961:303d with SMTP id
 98e67ed59e1d1-2f452ee4d17mr67762044a91.35.1735761225594; Wed, 01 Jan 2025
 11:53:45 -0800 (PST)
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
 <31c28ea2-881c-42e3-b754-8b52ca7f63fd@gmx.de>
In-Reply-To: <31c28ea2-881c-42e3-b754-8b52ca7f63fd@gmx.de>
From: Hridesh MG <hridesh699@gmail.com>
Date: Thu, 2 Jan 2025 01:23:08 +0530
Message-ID: <CALiyAo=_vGu50RoAPwFMv9J=mkaQWojAQxmB2qmwcEZ5Y8kfSg@mail.gmail.com>
Subject: Re: acer-wmi: Nitro button doesn't produce a WMI event
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> This ACPI method should trigger the turbo mode button (found inside the D=
SDT table):
>
>         Method (_Q58, 0, NotSerialized)  // _Qxx: EC Query, xx=3D0x00-0xF=
F
>          {
>                 Debug =3D "=3D=3D=3D=3D=3DPROJECT_QUERY_58=3D=3D=3D=3D=3D=
"
>                  ^^^WMID.FEBC [Zero] =3D 0x07
>                  ^^^WMID.FEBC [One] =3D 0x04
>                  ^^^WMID.FEBC [0x02] =3D One
>                  Notify (WMID, 0xBC) // Device-Specific
>         }
>
I feel like an idiot right now but I just realized something: So far
I've been assuming that the button I've been calling the "Turbo
Button" worked the same way on both Nitro and Predator laptops, but
that's not the case.

On Predator laptops, the button directly enables Turbo mode but on the
Nitro it only opens the Nitro Sense app. I had assumed that both
buttons simply opened the app and that directly enabling Turbo mode
was a feature provided by the Linux driver.

Given this, the ACPI code that you linked earlier is probably for the
Predator's "Turbo Button". Could it be that the button on my laptop
doesn=E2=80=99t use that ACPI code at all, considering its functionality is
completely different? (Though i doubt Acer would leave it in if it
wasn't being used)
