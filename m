Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7593955FC
	for <platform-driver-x86@vger.kernel.org>; Fri, 12 Jun 2026 18:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781288739; cv=pass; b=nlmxIzhUO5cnODN3y739JUgkBMu7lNVJHwAjA1u8gr0yxjOLSw4YkGgXvLf5wTz2W5zFNeKcAzv00o7tn2r2kUdYlgyHatdWHt9Yf3MxqCi2gD2aiYnqv0igLRzl3URQeahEz3AC9mOpc74BpS1k5R05fzxnxsAmPA9HhsO4tg4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781288739; c=relaxed/simple;
	bh=EsRQoTmHCigYB4F0PS9UyNTkNJMOio8t1d67Yi93leg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T1p/EeEf2OuCtwj5nEtWq7Gcs21XxHuNr3K+8fjkPTvqBUOxHV9HurThX3Tf8nK8KvBaSEdhohY79Sepiu/cmaqyfcy7iFBtE44I8+Gwa+dZwkpysn0F5jbZ2aMUQ0kz+iJcOAHfbDQl0OvlIsfgtDXCrNoV2XgH6T5sqoH/170=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mmUej1IM; arc=pass smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mmUej1IM"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8ced8f44da0so14515286d6.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 12 Jun 2026 11:25:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781288735; cv=none;
        d=google.com; s=arc-20240605;
        b=fIyN8ZRY81VwWVFg2yIKv0oEnf7Ob5rq66/tVVnMDL+P7HobUZmIZPSXpyK8YewoBm
         CBgXnfhwunYPQkH2cPaRV8Fuan1YqDkX+UQiig5EpYX1ZVVDU+5/AkpsVu6wb5ChKJAL
         xz+gXi3FBCw09TKfYQr75yYPag36GsDtBWYtmPB1E3dgLgTY6tEKYYO9kGhBRN7oevx7
         1nnyuPxYH8IOL8YHVWmsPnv/sK6LYipHjZqk4bv4nqCjjeTbZlsxheQNTKrw23kBGdJJ
         sv/CA8ZaC9wIxH9KQAMR2aHlEbsEb5PTVG1tCgwlm1wZGC7n8K55iyLaAXBw67U2DHhh
         /RMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v93Qa+uHwYiDUKSK1s0S+0WhESHEs4dhjsB7vlU0rcE=;
        fh=mr9r6LNUt+UrtaGZsiydEPRJlCfqIq0XSuttrUHtRzA=;
        b=V2js+HHTxIyIkQTXy16PoD+CVpmUrJxeVfY7vj2VMT24dGzEheK9EWPM4WqnmeFO9Q
         ucSem5EsTG0wP6Yk8cyoYWx7MeH2bdEc8vuJvdqwM6dDGWtYJYb9+t8taD3JLQYhKNV5
         avCZM3H3cV8KgcJYqtZHo4xr5F4e6FToNba3DOJeZFZzS9Ncfz4Mzl/RO1pqymJO85P4
         FDof1DJwQVyVPDVmGrRLWIF/qRU4apY/bmp29sn/Xk84riKBg2bcVmoShgj0E/xKIYyS
         fzO12HMDv1165SLll+G2mIMDIwqP9gGyPNRxZZB14QrfaIQTDWYh/5BDB3WCANYw9fEP
         CHzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781288735; x=1781893535; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v93Qa+uHwYiDUKSK1s0S+0WhESHEs4dhjsB7vlU0rcE=;
        b=mmUej1IMZ/mwQ25SiR98s+9kMeLN8n5QMJkFwz+aROmzRu3k1Pb03D1/+JAMr+L/BZ
         ZP8lVMqNh3xS7kJauVXpTzvkw18WAx5m0zpKuRLDgeLx7p4Ccy5F8maUR+HI8QfOiyGt
         a7evs/Uzyu6G0FUvggQOMrxocjOkv52XUvRceKcDeWvnz+L+SxAhVV5qF6OSlGSTwuSg
         X3/JPxlw2QNn2kqXN55yMFFf+BI/bAfGvFp09V+hFgfdZY0tBGVBBDQne4VEQC4Wb6kO
         Zvh6eraDi/XYVGwCqw+3wGERNHVMVUClj+0kfewxTkQh23w65nmROYUIq7oCtRiht9w7
         oArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781288735; x=1781893535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v93Qa+uHwYiDUKSK1s0S+0WhESHEs4dhjsB7vlU0rcE=;
        b=TcPV3vv+/YJEdWqfiptGm2MR9nbeepI/2HDc8AiXnd8T0fFerGHZY9AiIMR9jOERfg
         crnGV8m/f/c3+ZYpmwOfUHBls5c8WQw7SackvP7y56nCoTWtyjGQ64r2PMkacQTB/aNN
         HLPeUG3X25nKTucv+CbtFST91Ph5UTzBpnv/ibPSelW6Yl79glIhXCPuLaS5fZ2iXQCr
         xpLtqZ6D7Ocq/QGxsATrf7IAj4Lgg53aj6rhDszWV2ZNE1lCGuLtNZFds5kaH910v0E3
         0XyiN4XqtuhH2M94R1qAKK8sPpPUO8MHusFHzdreqtoefI8pj11at0w+WF+L8hMbeY48
         9eNw==
X-Forwarded-Encrypted: i=1; AFNElJ+OmzRKk81R43RTmDjT/iHU54ZoSSY2ZhlGN2i5CYORfHyzXLtbqfixTYkM2TqLqKeHRQL8coPYaCTGN5ntjCTTFCPx@vger.kernel.org
X-Gm-Message-State: AOJu0YxVUx28ib/igcr6wfqIo7I4Q15bx69KFEZ12XL1UEEYvIiMspwM
	gPCGjhHhes5wF6DLkVZZl0W31nMcWJRkesMT1A1TdniJhh/7LyxDTA6zZ56Ni1SSl8eMDHGGhP5
	MX09LPUAXQ6WXjDXw4kxPBnymK6phhF4=
X-Gm-Gg: Acq92OE55217Pi/5lqfFoWARyhGqo75VUq1VMadoEFhGiI59+Hq91eMhUfmN+2ogFtK
	Tkpsmy08OP3dyIOo8BqFVMx+/YybCl3amVGjpJCcbMnk71HM5JnzaFzdkwAyZ+6oH5f5vRBA1xJ
	DFThkKnFGPzKu5NvxzHsBFVQc12d7ICngnxkrwxach8cFJ+OmD0r8hRZ3MFQDa0VZ7LXCUdI0bN
	B7h9Ggl0jPVta6tXurXJZqwt7uBzFrqJjXz4k3NysNVfiyBOGJoDVHIu3K1Gp3rZux4R6kkiIRv
	df6d529f
X-Received: by 2002:a05:6214:19ec:b0:8ac:a6bd:503b with SMTP id
 6a1803df08f44-8d32c4e9ccemr71899436d6.15.1781288735177; Fri, 12 Jun 2026
 11:25:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611223920.1679438-1-derekjohn.clark@gmail.com>
 <20260611223920.1679438-3-derekjohn.clark@gmail.com> <30e344d9-014f-4bac-895e-52576d2a73f9@gmx.de>
In-Reply-To: <30e344d9-014f-4bac-895e-52576d2a73f9@gmx.de>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Fri, 12 Jun 2026 11:25:24 -0700
X-Gm-Features: AVVi8Cfp0QY7sxvlBrgMoy4h_n_XpXLqc_3ytxRr_2BzGbcPpYf3_wOcS9Z-LvM
Message-ID: <CAFqHKTn37uDm6ah-7XLtv-w6UCZKYxk5Tv7tbss-YmgsAYOqLA@mail.gmail.com>
Subject: Re: [PATCH 2/2] platform/x86: msi-wmi: Add MSI Claw M-Center keys
To: Armin Wolf <W_Armin@gmx.de>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Hans de Goede <hansg@kernel.org>, "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2026 at 10:54=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wrote:
>
> Am 12.06.26 um 00:39 schrieb Derek J. Clark:
>
> > MSI Claw devices produce WMI events through the MSI WMI hotkeys GUID fo=
r
> > some of their buttons. When pressed, these cause spam in the kernel. Fo=
r
> > the majority of devices these events can be safely ignored as they are
> > duplicated by the AT Translated Set 2 Keyboard device exposed as an
> > evdev. For the MSI Claw A8 BZ2EM model's M-Center Menu button (left of
> > the screen) there is no associated keyboard event, so this event must b=
e
> > exposed. Map this button to the same scancode produced by the AT
> > Keyboard device on other models. This does cause double F15 events on
> > the A1M, 7 AI+ A2VM, and 8 AI+ A2VM, but it appears to be harmless in m=
y
> > testing.
> >
> > Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > ---
> >   drivers/platform/x86/msi-wmi.c | 22 ++++++++++++++++++++++
> >   1 file changed, 22 insertions(+)
> >
> > diff --git a/drivers/platform/x86/msi-wmi.c b/drivers/platform/x86/msi-=
wmi.c
> > index d00ced756581..73a4f0d2dc04 100644
> > --- a/drivers/platform/x86/msi-wmi.c
> > +++ b/drivers/platform/x86/msi-wmi.c
> > @@ -46,6 +46,12 @@ enum msi_scancodes {
> >       WIND_KEY_WLAN           =3D 0x5f, /* Fn+F11 Wi-Fi toggle */
> >       WIND_KEY_TURBO,                 /* Fn+F10 turbo mode toggle */
> >       WIND_KEY_ECO            =3D 0x69, /* Fn+F10 ECO mode toggle */
> > +     /* MSI Claw keys */
> > +     CLAW_KEY_VOLUMEDOWN     =3D 0x21,
> > +     CLAW_KEY_CENTER         =3D 0x29, /* MSI M-Center main menu */
> > +     CLAW_KEY_QUICK_LONG     =3D 0x2a, /* MSI M-Center quick access lo=
ng hold */
> > +     CLAW_KEY_VOLUMEUP       =3D 0x32,
> > +     CLAW_KEY_QUICK_SHORT    =3D 0x58, /* MSI M-Center quick access sh=
ort press */
> >   };
> >   static struct key_entry msi_wmi_keymap[] =3D {
> >       { KE_KEY, MSI_KEY_BRIGHTNESSUP,         {KEY_BRIGHTNESSUP} },
> > @@ -69,6 +75,15 @@ static struct key_entry msi_wmi_keymap[] =3D {
> >       { KE_KEY, WIND_KEY_TURBO,               {KEY_PROG1} },
> >       { KE_KEY, WIND_KEY_ECO,                 {KEY_PROG2} },
> >
> > +     /* These are MSI Claw keys, used for MSI M-Center in Windows */
> > +     { KE_KEY, CLAW_KEY_CENTER,              {KEY_F15} },
> > +
> > +     /* These MSI Claw keys work without WMI. Ignore them to avoid dou=
ble keycodes */
> > +     { KE_IGNORE, CLAW_KEY_QUICK_SHORT },
> > +     { KE_IGNORE, CLAW_KEY_QUICK_LONG },
> > +     { KE_IGNORE, CLAW_KEY_VOLUMEUP },
> > +     { KE_IGNORE, CLAW_KEY_VOLUMEDOWN },
> > +
> >       { KE_END, 0 }
> >   };
> >
> > @@ -183,6 +198,13 @@ static void msi_wmi_notify(union acpi_object *obj,=
 void *context)
> >               eventcode =3D obj->integer.value;
> >               pr_debug("Eventcode: 0x%x\n", eventcode);
> >               break;
> > +     case ACPI_TYPE_BUFFER:
> > +             if (!obj->buffer.length)
> > +                     return;
> > +
> > +             eventcode =3D obj->buffer.pointer[0];
> > +             pr_debug("Eventcode: 0x%x\n", eventcode);
>
> Can you share the BMOF associated with this event? I suspect that the buf=
fer should
> contain a u32.

The GUID's don't appear to contain any bmof data:

$ lsmod | grep bmof
wmi_bmof               12288  0
wmi                    32768  4 video,wmi_bmof,msi_wmi,msi_wmi_platform

$ tree -l -L 2
.
=E2=94=9C=E2=94=80=E2=94=80 1E2A0DA0-2B9E-424F-9C87-B1DAC3F4E9DA-3 ->
../../../devices/pci0000:00/0000:00:02.3/0000:c3:00.0/PNP0C14:01/wmi_bus/wm=
i_bus-PNP0C14:01/1E2A0DA0-2B9E-424F-9C87-B1DAC3F4E9DA-3
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 driver_override
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 expensive
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 guid
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 instance_count
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 modalias
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 notify_id
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 power
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 subsystem -> ../../../../../../../.=
./bus/wmi
=E2=94=82   =E2=94=94=E2=94=80=E2=94=80 uevent
=E2=94=9C=E2=94=80=E2=94=80 5B3CC38A-40D9-7245-8AE6-1145B751BE3F-1 ->
../../../devices/pci0000:00/0000:00:14.3/PNP0C09:00/PNP0C14:00/wmi_bus/wmi_=
bus-PNP0C14:00/5B3CC38A-40D9-7245-8AE6-1145B751BE3F-1
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 driver_override
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 expensive
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 guid
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 instance_count
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 modalias
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 notify_id
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 power
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 subsystem -> ../../../../../../../.=
./bus/wmi
=E2=94=82   =E2=94=94=E2=94=80=E2=94=80 uevent
=E2=94=9C=E2=94=80=E2=94=80 ABBC0F6E-8EA1-11D1-00A0-C90629100000-0 ->
../../../devices/pci0000:00/0000:00:14.3/PNP0C09:00/PNP0C14:00/wmi_bus/wmi_=
bus-PNP0C14:00/ABBC0F6E-8EA1-11D1-00A0-C90629100000-0
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 driver -> ../../../../../../../../b=
us/wmi/drivers/msi-wmi-platform
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 driver_override
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 expensive
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 guid
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 hwmon
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 instance_count
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 modalias
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 object_id
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 platform-profile
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 power
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 subsystem -> ../../../../../../../.=
./bus/wmi
=E2=94=82   =E2=94=94=E2=94=80=E2=94=80 uevent
=E2=94=94=E2=94=80=E2=94=80 B2526ED4-CB45-49FA-9230-8D2FE8AFB8EC-2 ->
../../../devices/pci0000:00/0000:00:02.3/0000:c3:00.0/PNP0C14:01/wmi_bus/wm=
i_bus-PNP0C14:01/B2526ED4-CB45-49FA-9230-8D2FE8AFB8EC-2
    =E2=94=9C=E2=94=80=E2=94=80 driver_override
    =E2=94=9C=E2=94=80=E2=94=80 expensive
    =E2=94=9C=E2=94=80=E2=94=80 guid
    =E2=94=9C=E2=94=80=E2=94=80 instance_count
    =E2=94=9C=E2=94=80=E2=94=80 modalias
    =E2=94=9C=E2=94=80=E2=94=80 object_id
    =E2=94=9C=E2=94=80=E2=94=80 power
    =E2=94=9C=E2=94=80=E2=94=80 subsystem -> ../../../../../../../../bus/wm=
i
    =E2=94=94=E2=94=80=E2=94=80 uevent

16 directories, 28 files


I extracted the _WED event method from the DSDT. I don't have a lot of
experience with interpreting ACPI, but my understanding is that it
returns u8[2] with index 0 being the keycode and index 1 being the
state. Since we don't get events on release, that is essentially
unused. I can do a .length !=3D 2 in the validation step before I
extract the keycode if desired.

Method (_WED, 1, NotSerialized)  // _Wxx: Wake Event, xx=3D0x00-0xFF
            {
                If ((Arg0 =3D=3D 0xC0))
                {
                    Name (EVRT, Buffer (0x02)
                    {
                         0x00, 0x00                                       /=
/ ..
                    })
                    Name (TMPB, Zero)
                    TMPB =3D WMRD (0xD8)
                    EVRT [Zero] =3D TMPB /* \_SB_.PCI0.SBRG.EC__.SCM0._WED.=
TMPB */
                    If ((TMPB =3D=3D 0x08))
                    {
                        EVRT [One] =3D ((WMRD (0xE4) >> 0x03) & 0x1F
                            )
                    }

                    If ((TMPB =3D=3D 0x56))
                    {
                        EVRT [One] =3D WMRD (0x2E)
                    }

                    If ((TMPB =3D=3D 0x57))
                    {
                        EVRT [One] =3D WMRD (0x2E)
                    }

                    If ((TMPB =3D=3D 0x5F))
                    {
                        EVRT [One] =3D WMRD (0x2E)
                    }

                    If ((TMPB =3D=3D 0x60))
                    {
                        EVRT [One] =3D (WMRD (0xE4) & 0x07)
                    }

                    If ((TMPB =3D=3D 0x62))
                    {
                        EVRT [One] =3D WMRD (0xD1)
                    }

                    If ((TMPB =3D=3D 0x63))
                    {
                        EVRT [One] =3D WMRD (0xD1)
                    }

                    If ((TMPB =3D=3D 0x73))
                    {
                        EVRT [One] =3D ((WMRD (0xE4) >> 0x03) & 0x1F
                            )
                    }

                    If ((TMPB =3D=3D 0x79))
                    {
                        EVRT [One] =3D ((WMRD (0xE4) >> 0x03) & 0x1F
                            )
                    }

                    If ((TMPB =3D=3D 0x7B))
                    {
                        EVRT [One] =3D WMRD (0x2E)
                    }

                    If ((TMPB =3D=3D 0x84))
                    {
                        EVRT [One] =3D WMRD (0x2E)
                    }

                    If ((TMPB =3D=3D 0x02))
                    {
                        EVRT [One] =3D ((WMRD (0xE4) >> 0x03) & 0x1F
                            )
                    }

                    WMWT (0xD8, Zero)
                    Return (EVRT) /* \_SB_.PCI0.SBRG.EC__.SCM0._WED.EVRT */
                }

                Return (Zero)
            }


Also  the _WDG that points the Wind GUID to arg 0xC0:

Name (_WDG, Buffer (0x64)
            {
                /* 0000 */  0x6A, 0x0F, 0xBC, 0xAB, 0xA1, 0x8E, 0xD1,
0x11,  // j.......
                /* 0008 */  0x00, 0xA0, 0xC9, 0x06, 0x29, 0x10, 0x00,
0x00,  // ....)...
                /* 0010 */  0x41, 0x4B, 0x01, 0x01, 0x6B, 0x0F, 0xBC,
0xAB,  // AK..k...
                /* 0018 */  0xA1, 0x8E, 0xD1, 0x11, 0x00, 0xA0, 0xC9,
0x06,  // ........
                /* 0020 */  0x29, 0x10, 0x00, 0x00, 0x41, 0x4C, 0x01,
0x01,  // )...AL..
                /* 0028 */  0x6D, 0x0F, 0xBC, 0xAB, 0xA1, 0x8E, 0xD1,
0x11,  // m.......
                /* 0030 */  0x00, 0xA0, 0xC9, 0x06, 0x29, 0x10, 0x00,
0x00,  // ....)...
                /* 0038 */  0x41, 0x4A, 0x01, 0x02, 0x6E, 0x0F, 0xBC,
0xAB,  // AJ..n...
                /* 0040 */  0xA1, 0x8E, 0xD1, 0x11, 0x00, 0xA0, 0xC9,
0x06,  // ........
                /* 0048 */  0x29, 0x10, 0x00, 0x00, 0x41, 0x4D, 0x01,
0x02,  // )...AM..
                /* 0050 */  0x8A, 0xC3, 0x3C, 0x5B, 0xD9, 0x40, 0x45,
0x72,  // ..<[.@Er
                /* 0058 */  0x8A, 0xE6, 0x11, 0x45, 0xB7, 0x51, 0xBE,
0x3F,  // ...E.Q.?
                /* 0060 */  0xC0, 0x00, 0x01, 0x09
      // ....
          })
...

Thanks,
Derek

> Thanks,
> Armin Wolf
>
> > +             break;
> >       default:
> >               pr_info("Unknown event received\n");
> >               return;
