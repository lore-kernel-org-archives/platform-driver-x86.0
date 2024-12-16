Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D220D126C08
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Dec 2024 19:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734378149; cv=none; b=Macdj78cxPoEhQvIsYzVu4KjvdiAIBraype1WjeWW4YPUJE5htmaRme4x5aRSahAcCgc5ykOVVs4RO4TxEXpV7UPNegtvO1nVDeDm46CH+KKQp5CR4myEU2xS8zl/t7dVwh+A3rNV2hW6P89fTJaNuc2epyluyjBtPmzxRzAEdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734378149; c=relaxed/simple;
	bh=EB8Boyf64CKwhPqnT2u9eESmwchR0NFAiAy0+WmBzfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FuhFt8MPNv3H4kwBZGK4yKRtMxxc4qpzgccm25AP75QLrJz+Vf0ArKaUwabkFhllKjx0VWhqIW63RAI7lczLdNqwsmIjhYnAPxVTy4b3LkO598QKd4Qa8dLTyzzN/3kuXx7DHp0hmoE7CniJjINfCKabsrWSUGYiAeo2KuVca9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3a9cb8460f7so34863785ab.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Dec 2024 11:42:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734378147; x=1734982947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gixBascRzKhyuaeh8o1JWv+0PZmjWu64ijKwVWQz3Yo=;
        b=Qac3jemy4MdULjbhKhINKXzhubW+9eTRDBnqf4Dan5eErpV6ivZqb+OHVlXODWGm0A
         y4OX6NAUUmMcWvZ0SAtaGR1ij5IWJ89yUMyysv6Sfks0+6GoLiA0m2ceXw7YMWdik+LG
         yoYtfjzO9HBcgkTa1NxijZ9xsiX63EMaEVtY4f9mpv5fZLRreDDPMXib6AaAL7PVLAUN
         DZqpUiw3k5ltx3QCtSD9bFn5j7IFaGtvRhN+dQVVApBMggAYz7Y3NTnYDsDterWXyXHr
         D4TFJzNfs8q0/qPErkRPXlUDY122Oky8ql4ONCXP2M5rwAtWAWUe+gsc3rpGjoW2Ylr0
         QOeg==
X-Forwarded-Encrypted: i=1; AJvYcCXfdBpKfw7FZCB9CMasbvyrhdL216uGMfOcbGWSYOu01USyMq6umLv22dC4IYxs5M4eUW5+VpdGQ0ivilSj+YTdXAkL@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/chXknpq+yK7+f8p8pcYTE7EnkrKx6f0179N8jONCGO2thMBD
	yEu3WWee2IbyrtVo1yNrTYMwaYGl7r95xW0PN4xfbtSz4aKpYDaq7c5Rh7xCITc=
X-Gm-Gg: ASbGnct03C+h47HItoNe1tUboYu9fbXjBD6JBdMqHvnreNbNd04FMHHrqcew6vQE4xn
	7Muv2e3HqAtkVSj4ffYLrcESnVZ2+5UZ2aX7ZrnXjYLIwEFYJebj++w7l6o2P0+FaS4+/gadQor
	nq9qDoHAMHvLWWdGSNQkMNM7/hzOBN4TgqnzTj+30OiZhMiaqnElMMaRPmetfqMxf4LS847tXun
	vz7sJHXVPnFxDz2QFjImyk4qPtc9aQTtB+BxGZj3bSYmmV7DkNArlgMjdy8UdyLGgEChm2GLzEr
	OoZKn+6YqhJjx7lT72QzFDXZnw==
X-Google-Smtp-Source: AGHT+IGBJgB79Thxqk6NHxPmrQHMBXr8+dWzNGs+0zM07fO5ktUc0+mNFczBiHoaxtTzLQbAkfDdwA==
X-Received: by 2002:a05:6e02:3882:b0:3a7:81d6:c177 with SMTP id e9e14a558f8ab-3aff6db6e07mr127982065ab.14.1734378145463;
        Mon, 16 Dec 2024 11:42:25 -0800 (PST)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com. [209.85.166.174])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3b24cf3a9fbsm16855075ab.58.2024.12.16.11.42.24
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 11:42:24 -0800 (PST)
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3a9cdcec53fso40860615ab.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Dec 2024 11:42:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX3P21krRwcrDSQmpQRWyl4fa4XKxuaQHl4uaeZY0cSCwGzmc9AQgpQ3TGAD43Nzw62kEHVDHzdIu7p9eOA7CeP+sfg@vger.kernel.org
X-Received: by 2002:a05:6e02:180d:b0:3a7:7ee3:108d with SMTP id
 e9e14a558f8ab-3aff9821369mr167746915ab.23.1734378144415; Mon, 16 Dec 2024
 11:42:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241209163720.17597-1-josh@joshuagrisham.com>
 <9b1630fe-70af-634b-b8ba-7b065d9ce5ae@linux.intel.com> <CAMF+KeYHWrfEGF5mUashzE9cmC+fU-X825bRRNJc3FS2me6eMQ@mail.gmail.com>
In-Reply-To: <CAMF+KeYHWrfEGF5mUashzE9cmC+fU-X825bRRNJc3FS2me6eMQ@mail.gmail.com>
From: Joshua Grisham <josh@joshuagrisham.com>
Date: Mon, 16 Dec 2024 20:42:12 +0100
X-Gmail-Original-Message-ID: <CAMF+Keb98Z9hDnb-gGacZJWnRRuMJB08Gc1kyTQ2rkJiJMRTrg@mail.gmail.com>
Message-ID: <CAMF+Keb98Z9hDnb-gGacZJWnRRuMJB08Gc1kyTQ2rkJiJMRTrg@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: samsung-galaxybook: Add samsung-galaxybook driver
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Joshua Grisham <josh@joshuagrisham.com>, Hans de Goede <hdegoede@redhat.com>, 
	Armin Wolf <w_armin@gmx.de>, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Den s=C3=B6n 15 dec. 2024 kl 18:16 skrev Joshua Grisham <josh@joshuagrisham=
.com>:
>
> > > +static int charge_control_end_threshold_acpi_set(struct samsung_gala=
xybook *galaxybook,
> > > +                                              const u8 value)
> >
> > While certainly not forbidden, using const on plain integer types is no=
t
> > extremely useful. In fact, if it wouldn't be const, you could do the 10=
0
> > -> 0 mapping for it separately and not do it twice below.
> >
> > [...]
> >
> > Put comment on line before it so it's easier to read.
> >
> > "off" -> "no threshold" ?
> >
> > [...]
>
> Good idea, now I have handled this in the v2 of the patch as follows:
>
> if (value > 100)
>         return -EINVAL;
> /* if setting to 100, should be set to 0 (no threshold) */
> if (value =3D=3D 100)
>         value =3D 0;
>
> Does this make sense now or do you see anything that should be adjusted h=
ere?
>
> >
> > Do you want to differentiate 0 from 0? Should this function actually
> > return -EINVAL if somebody attempts to set 0 threshold?
> >
>
> And regarding this, the device requires that you send 0 to represent
> that the feature is "turned off", so to speak (no threshold is enabled
> and the battery will charge all the way to 100%). So yes, in my mind,
> we want to send 0 to the device if you are attempting to set either 0
> or 100. Also I seem to recall that I tried to dig into how this is
> handled in upower and the coming features in GNOME, and have a vague
> memory that I saw somewhere in there that they were also converting
> 100 to a 0, but now I am having a bit of trouble finding this again.
> Do you know if it would be better to have this driver provide an
> interface where "100" means "no threshold" and that it should be
> translated within the driver (that samsung_galaxybook sends a 0 to the
> ACPI in case the user has requested "100" ?) or is it better if "0"
> means "no threshold/charge to 100%" (or both?)?
>
> I can also do some testing with the device to see if it accepts the
> value 100 anyway, and how it behaves, though I would be a little
> concerned with this longer term as it is not how the driver and
> settings applications work in Windows (they are hard-coded with a
> toggle and it always sets either 0 (off) or 80 (on)), and I could see
> where even if it works today, sending the value of 100 to mean "off"
> could be altered by potential BIOS updates?
>

Just wanted to follow up on one thing here -- I tested a bit more with
the device and how it handles trying to set 100 vs 0. Basically, if
you just directly call the ACPI method and set the value 100, the
device actually changes it to 0 and stores it as 0 anyway. The next
fetch of the sysfs show attribute it will return 0 (so basically the
device itself behaves exactly the same as the current logic in the
driver).

So the question is, how should this behave as regards to a "standard
interface" for battery charge_control_end_threshold ? Should it prefer
to report 100 or 0 if there is "no threshold" ?  And if it should
prefer 100, should this driver handle the translation of 0 =3D> 100 =3D> 0
? (i.e. users set the value to 100 but the driver sends 0 to the
device, and when the device reports 0, the driver reports 100)

Thank you again!

Best regards,
Joshua

> > [...]
