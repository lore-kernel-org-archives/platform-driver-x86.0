Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C3B1DC988
	for <platform-driver-x86@vger.kernel.org>; Sun, 29 Jun 2025 17:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751219114; cv=none; b=utiLhSC8qnYHl70wqSNCpDAJsbLIolxcIZBu5VB2q8QDK9g0mYJxThVxPswiYdHpv6V/L8C0C0gFW4+StJqMjtnCmZBENzZII5Aanjrv+TVnlwWZlPtvIbnky7M2wQ1kt8Cxq98ZqcjNRBwTZk7xJKdJJmVrisDyDwOuQSPz8Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751219114; c=relaxed/simple;
	bh=EhuAUbvdEAUTY/vz8BMxyDgHQ8sf8rbd5/XRjNbDgQc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=PmErDekAuo8JtAwK1rj3BFLcC70jx7oavZGhBp3MqcgtMQ3Xr9dSg5STnB9eYYqp1RxSGrted0uv8Ns4uXiNH9eIXtZg67IqzN1melZKDNYIW8hr3zDusSgKNCQrLh0137+2uP0MXs8o+RmVUiftGn0lE1Smkws+2wrr4bs3Kl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QR62Aihs; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QR62Aihs"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-234bfe37cccso41350115ad.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 29 Jun 2025 10:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751219112; x=1751823912; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nbnmAU1KDBjiBbh87poQQKvXstWLR8ZEwV4uaG1PdvU=;
        b=QR62AihsaJoHRlwqeuKlIOo/FBtakZE8L9KW8lRjLpIbOu23OeoaAtSFGiAt+UER1a
         6CVuItx5Gp4vC7EFaRyirMP6SAlA2FFo+VD6+XsrvSEZOgUSDOfUCREHRDfys/9donRY
         EDdl18uFE4AbqUQp1e2cMhHcPXCfEFNnPKrnGqlOeGFNGgDpcs5yuLq6qU5nPbD7X+l8
         D8WdWdQrruOd+TbtVHUcTRofPd+2JdVlBYbzJNMrQqDSySOE6H4Mz0n6C1wQTrfWosr5
         wB8rxP6IUJQaYUjCjEt4giTAll4kxHBWSB8BcOtUmeNuaHBmNjjjbU30LpyGRIl7TJv9
         JsXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751219112; x=1751823912;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nbnmAU1KDBjiBbh87poQQKvXstWLR8ZEwV4uaG1PdvU=;
        b=a2evoNrr1yLxxwHOPLHaKBiIWGywTFnC1zXlPn0+r6IwPIFxPSC/qlOz+MNrio7yCk
         n3RbiufaQVWTaOG2iKH6IedtJWY7zRqVfUlkDlW5CM/yIigAmMCEi7+39RlWN2t/5QTz
         LHN3sjzaES0jHHQuIbuoiDXYn18HZ80TLj7G4GvAegotLhN5IcHzEXPw7aSw2t99nzak
         fNp2TipBGHMIERo2Z7FlhJdSPGjwrYmwNxe3HViYIKPJBi0cgSmT6ELe42d7OgyoHor7
         fGRDLt84JpWW1YP8+2eytQLyitgq+RJNEcbiuVarIrI8FOoJp+1YK0iWCFqSv1lN4EOW
         Aj1g==
X-Forwarded-Encrypted: i=1; AJvYcCWxgD3zm0FNFrvPYNK7Opmtw9ESY2bmGv0SSLc9CuBQr7NGHnlwp786NLyYnRpgoPRxeFa+pobjcO4dKeaGTDuSZdB3@vger.kernel.org
X-Gm-Message-State: AOJu0YzSCwmECfLz4K2Eb/wJq50CIEYeTi894lF4/O6MulvKFhPnl4Dd
	gALK9m5sWJHMW325S2ABNLFTagFFwb2HdaKMCqIrOjzqxPLblOmRE3+G
X-Gm-Gg: ASbGncvGv8f9cdLg4nllodWfQG2qjA6A8X/P4FDkq15+UPtUlQpme0A05c/RyW9K9YO
	XqJkUHgo2MwMD2kbsL2m61Oh8BQ3kSh/0ak8oea4X/OCVyItz+uaTyR636cYUWHcPfKu0GbtMW9
	85MC8u1Ty92f56cvhj98EvpRcX4VeTYRqDbYdD011b+inH69nQyc6FYPCGVCJMiBC1WDZtwnOrS
	CwYJIv0ZHKrf1uusEsBlp/fAIek4s701svX26mofJVsbTTjitraor6sC0McF13n6+sOWnR4TckY
	jYJMTd+ODivis3JVT78eTPZ1Ce8NsSHA4DDxJHE9LMDrHgcnK7O9L/4=
X-Google-Smtp-Source: AGHT+IHqpPr2WCnrgy3f248mild19Sj34j1kDfrNUiupxKcg/arWOs08WH7iMRYdmcN1Ieiqi29ZVQ==
X-Received: by 2002:a17:902:d2c4:b0:234:c22:c612 with SMTP id d9443c01a7336-23ac48b49acmr174387695ad.43.1751219112296;
        Sun, 29 Jun 2025 10:45:12 -0700 (PDT)
Received: from localhost ([181.88.247.122])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f5383eb6sm12134564a91.10.2025.06.29.10.44.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jun 2025 10:45:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=82e4f3dc66fe19981345680cb0b6a1edb1bcb9043eb4b80d6d2be87a6909;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Sun, 29 Jun 2025 14:44:42 -0300
Message-Id: <DAZ7CSDVAD9H.31NIC2DQ4U1SJ@gmail.com>
Cc: "Armin Wolf" <W_Armin@gmx.de>
Subject: Re: Linux kernel 6.8.0-62 generic null pointer
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Linus Torvalds" <torvalds@linux-foundation.org>, "Jan Graczyk"
 <jangraczyk@yahoo.ca>, "Prasanth Ksr" <prasanth.ksr@dell.com>, "Hans de
 Goede" <hansg@kernel.org>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, <Dell.Client.Kernel@dell.com>, "PDx86"
 <platform-driver-x86@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <740368848.567654.1751195731131.ref@mail.yahoo.com>
 <740368848.567654.1751195731131@mail.yahoo.com>
 <CAHk-=wgMiSKXf7SvQrfEnxVtmT=QVQPjJdNjfm3aXS7wc=rzTw@mail.gmail.com>
 <CAHk-=wjOg3ODTiNF9T5Kifwiz2FnU5DCrUB1MLxG1mnWAo_k9w@mail.gmail.com>
In-Reply-To: <CAHk-=wjOg3ODTiNF9T5Kifwiz2FnU5DCrUB1MLxG1mnWAo_k9w@mail.gmail.com>

--82e4f3dc66fe19981345680cb0b6a1edb1bcb9043eb4b80d6d2be87a6909
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Linus,

On Sun Jun 29, 2025 at 1:55 PM -03, Linus Torvalds wrote:
> On Sun, 29 Jun 2025 at 09:19, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>>
>> The band-aid fix looks fairly obvious:
>>
>>   -       if (!obj)
>>   +       if (!obj || !obj->package.elements)
>>                   return -EIO;
>>
>> in both places, but I wonder if there's something more fundamentally
>> wrong there that the elements array doesn't exist.
>
> Bah. That band-aid may fix the oops. but I think the problem is deeper.
>
> It should probably also check that
>
>  (a) obj->type =3D=3D ACPI_TYPE_PACKAGE
>
>  (b) obj->package.count is actually large enough for the dereference

As you mentioned, the driver does check this when creating the sysfs
attributes here [1]. But I believe it should definitely check every time
to catch spurious errors.

I'll submit this fix.

>
> because maybe some broken ACPI bios ends up having a non-package
> object there and then checking "is obj->package.elements NULL"
> pointless, because that "package.elements" may be something entirely
> different than a pointer in the first place, because
> "package.elements" is only valid for a ACPI_TYPE_PACKAGE.
>
> Maybe that wmi_query_block() is always *supposed* to return a
> ACPI_TYPE_PACKAGE, but I don't see any such guarantees, and it
> obviously happily is returning an ACPI object with a NULL
> package.elements.

Not necessarily, AFAIK data blocks could be of any type.

>
> Some other drivers do seem to check this all, eg
> drivers/hwmon/hp-wmi-sensors.c has check_wobj() to verify the thing it
> uses, and it does do things like this:
>
>         if (type !=3D ACPI_TYPE_PACKAGE)
>                 return -EINVAL;
>
>         elem_count =3D wobj->package.count;
>         if (elem_count !=3D last_prop + 1)
>                 return -EINVAL;
>
> at the very top of the function. So clearly people have either hit
> this kind of issue before, or some people have just been more careful.

I think in this case this bug is not common at all, because the driver
already retrieved this data block successfully once (at init).

I also believe this has something to do with WMI method enablement.
There might be a race condition at play here. I'll Cc this to Armin Wolf
so he can take a look.

>
>                  Linus

@Jan:

What is the reproduction rate of the OOPS?=20

Your crash log suggest this was triggered by fwupd, maybe a call to
`fwupdmgr get-bios-settings`?

Also, please attach your full `dmesg` output and `acpidump`.


[1] https://elixir.bootlin.com/linux/v6.16-rc3/source/drivers/platform/x86/=
dell/dell-wmi-sysman/sysman.c#L426

--=20
 ~ Kurt


--82e4f3dc66fe19981345680cb0b6a1edb1bcb9043eb4b80d6d2be87a6909
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSHYKL24lpu7U7AVd8WYEM49J/UZgUCaGF7jgAKCRAWYEM49J/U
ZsCfAQCigeYjpI1yXONlIm7JOPVTIKIidCE44t9jn+LGEXka0AD/f+5MpM0xmjlO
yD70oQVVKy8hHqTOvboT+th03HbgIA4=
=sPOi
-----END PGP SIGNATURE-----

--82e4f3dc66fe19981345680cb0b6a1edb1bcb9043eb4b80d6d2be87a6909--
