Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89883C0085
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Jan 2026 21:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768943734; cv=none; b=MOp55QTwucIYxqWiygFBmBL4OWp6fI44WNLExRbfcwqiO6iAkDXHbyEY9Uw6DaSZ++C+mIYs990ye0lTlguKtYqJxqqbki856zso04wyFVGo+jdRO6krpegfaathYxOovRXXwyXaUWC7uKa2pUrkEgKBRiybMyQs3/Fj6xQdfRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768943734; c=relaxed/simple;
	bh=PFpWonKToCz5nccKG0P2Za2EO7PaSC6dBEzQSSOn0KI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K50N7bANUw59fKA0kBQdoWiRX3Y9E9j/1ya3sD1ihLF4oz1xBOdakhrX9tHTF+SzsyCgY0HdPZIRpFrIKdOm/UFnX2kmJVMCCUCw7LS0PfRQYScsGNl5EzDs63fQzObXyez9bYcAcT3BNljlf7sPyQK/8EIrO8ald5xYQFYbtO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=C9vjnAKH; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="C9vjnAKH"
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id A8C5D5E6A4
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Jan 2026 23:15:27 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id 234685E5A1
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Jan 2026 23:15:26 +0200 (EET)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 1739E202478
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Jan 2026 23:15:25 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1768943725;
	bh=AbJL0wn5GxjWk8//VqQgtO+vFPMNqMekCCYs4sAQVyc=;
	h=Received:From:Subject:To;
	b=C9vjnAKHL5gqUfPIAJQ3aRfhB0GpZk1qFIp76i+/cNXIcJn39P+BzS/bDpBiLGFsr
	 GTMsHooNqqzDKDrNzk4rvNxHz8kI+nhRinUAKF8IOxHoC6NY/rwi50tpfMEaHArqDG
	 4E+5pvdwjIs//NoEGl//4B6O3ln+awlJMLaS0MoqrpVPYjIz8uwtenQU5RMQImm94X
	 eR3dRiPxnhBwE2TtymvMVCQXCxwx+MrdFiXmBE96o1LHc/FHhrtFB4SvAtzcTZm+Lk
	 PEj9dOem8xN4X9786BSzXXNEJJKMpQLHAgmbcDKzaq4UI+xmHny85BWy1o2icGK2Gw
	 Z19abtmmwrBwQ==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.175) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f175.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-38305f05717so52944881fa.1
        for <platform-driver-x86@vger.kernel.org>;
 Tue, 20 Jan 2026 13:15:25 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXofxhCIWuBQDD2Mf/MDlWr5ywsATyF7La6OrbwsXu3yMTZvyQzQ5OPkp3cJlEd2oBdhOpgPN8JW53cxQ43iVAQqhcJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxY/H32P2oXeGY8xo5/c1TryYj5d4cYHuk3LqWy5nnHaY+MkJ5g
	rcWfXQ0zwuAu+2Emu0nUawSqs7Fm5SAkni+vViLY1qPaRmTZRYoXvjTsMgCRdNmjKEf9tbl7zIA
	2DTW2Z9k4hWzZTCXFPT2VJcD0kLOpFpU=
X-Received: by 2002:a2e:bea6:0:b0:37f:b6a4:f5df with SMTP id
 38308e7fff4ca-38383fce68amr53808551fa.0.1768943724443; Tue, 20 Jan 2026
 13:15:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260116133150.5606-1-lkml@antheas.dev>
 <20260116133150.5606-3-lkml@antheas.dev>
 <14407ba9-34f1-4114-bfb3-043b53ea7769@linux.dev>
 <CAGwozwGyUpBq4GGvyDHj089a9-vxNOnqgSBys3-CC_+tKDywaA@mail.gmail.com>
 <fe66c416-161c-489e-a38f-9dc7729c6ed7@linux.dev>
 <CAGwozwESNrQZ240_qDMf1pdpCRXooxstGcqP10cGp=q-F_SrAQ@mail.gmail.com>
 <8102eb26-5206-49e6-a994-a9d3ea480255@linux.dev>
 <CAGwozwH71LDiBFM-Ro9UpZNy29C6HHwCNZjwCS3F1hMfuUXZ4g@mail.gmail.com>
 <be8ba636-ae07-4d42-88ca-57ecf10b7dae@linux.dev>
 <CAGwozwGdhu_chetK6uQ=FXctC1D8LABj5QxVff1B486EKYSLug@mail.gmail.com>
 <e4349b27-86e1-41d6-864f-5ad6d353dc46@linux.dev>
 <CAGwozwF--y3vsqhdqYFV_x1ff7jfSkYaQHeV1OV70yue7Huk=A@mail.gmail.com>
 <89a67ace-6fef-72e0-4ef3-be828dd85e3d@linux.intel.com>
 <CAGwozwGdDe+M36RE_CMjXePBX-CVRORjHZbOroS+e_Dc_Am2vg@mail.gmail.com>
 <36479176-9583-478b-b16a-03ba725b3f81@linux.dev>
In-Reply-To: <36479176-9583-478b-b16a-03ba725b3f81@linux.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Tue, 20 Jan 2026 22:15:11 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwEkAfCERTsxcPZpDe=4L8Pr=ovete61Uoj1RGfBC+BtQg@mail.gmail.com>
X-Gm-Features: AZwV_Qh4mRW4jaemBRgaebxl38yFrt2sDiBcKnyOcbCAe88L-QcQRrtFFMInEgQ
Message-ID: 
 <CAGwozwEkAfCERTsxcPZpDe=4L8Pr=ovete61Uoj1RGfBC+BtQg@mail.gmail.com>
Subject: Re: [PATCH v11 02/11] HID: asus: initialize additional endpoints only
 for legacy devices
To: Denis Benato <denis.benato@linux.dev>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <176894372529.638956.11225071016308859429@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Tue, 20 Jan 2026 at 22:03, Denis Benato <denis.benato@linux.dev> wrote:
>
>
> On 1/20/26 18:41, Antheas Kapenekakis wrote:
> > On Tue, 20 Jan 2026 at 14:56, Ilpo J=C3=A4rvinen
> > <ilpo.jarvinen@linux.intel.com> wrote:
> >> On Sat, 17 Jan 2026, Antheas Kapenekakis wrote:
> >>> On Sat, 17 Jan 2026 at 18:05, Denis Benato <denis.benato@linux.dev> w=
rote:
> >>>> On 1/17/26 17:16, Antheas Kapenekakis wrote:
> >>>>> On Sat, 17 Jan 2026 at 17:12, Denis Benato <denis.benato@linux.dev>=
 wrote:
> >>>>>> On 1/17/26 17:10, Antheas Kapenekakis wrote:
> >>>>>>> On Sat, 17 Jan 2026 at 16:13, Denis Benato <denis.benato@linux.de=
v> wrote:
> >>>>>>>> On 1/17/26 16:07, Antheas Kapenekakis wrote:
> >>>>>>>>> On Sat, 17 Jan 2026 at 14:51, Denis Benato <denis.benato@linux.=
dev> wrote:
> >>>>>>>>>> On 1/17/26 00:10, Antheas Kapenekakis wrote:
> >>>>>>>>>>> On Fri, 16 Jan 2026 at 21:44, Denis Benato <denis.benato@linu=
x.dev> wrote:
> >>>>>>>>>>>> On 1/16/26 14:31, Antheas Kapenekakis wrote:
> >>>>>>>>>>>>
> >>>>>>>>>>>>> Currently, ID1/ID2 initializations are performed for all NK=
EY devices.
> >>>>>>>>>>>>> However, ID1 initializations are only required for RGB cont=
rol and are
> >>>>>>>>>>>>> only supported for RGB capable devices. ID2 initializations=
 are only
> >>>>>>>>>>>>> required for initializing the Anime display endpoint which =
is only
> >>>>>>>>>>>>> supported on devices with an Anime display. Both of these
> >>>>>>>>>>>>> initializations are out of scope for this driver (this is a=
 brightness
> >>>>>>>>>>>>> control and keyboard shortcut driver) and they should not b=
e performed
> >>>>>>>>>>>>> for devices that do not support them in any case.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> At the same time, there are older NKEY devices that have on=
ly been
> >>>>>>>>>>>>> tested with these initializations in the kernel and it is n=
ot possible
> >>>>>>>>>>>>> to recheck them. There is a possibility that especially wit=
h the ID1
> >>>>>>>>>>>>> initialization, certain laptop models might have their shor=
tcuts stop
> >>>>>>>>>>>>> working (currently unproven).
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> For an abundance of caution, only initialize ID1/ID2 for th=
ose older
> >>>>>>>>>>>>> NKEY devices by introducing a quirk for them and replacing =
the NKEY
> >>>>>>>>>>>>> quirk in the block that performs the inits with that.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> In addition, as these initializations might not be supporte=
d by the
> >>>>>>>>>>>>> affected devices, change the function to not bail if they f=
ail.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Acked-by: Benjamin Tissoires <bentiss@kernel.org>
> >>>>>>>>>>>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> >>>>>>>>>>>>> ---
> >>>>>>>>>>>>>  drivers/hid/hid-asus.c | 16 ++++++----------
> >>>>>>>>>>>>>  1 file changed, 6 insertions(+), 10 deletions(-)
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.=
c
> >>>>>>>>>>>>> index 323e6302bac5..dc7af12cf31a 100644
> >>>>>>>>>>>>> --- a/drivers/hid/hid-asus.c
> >>>>>>>>>>>>> +++ b/drivers/hid/hid-asus.c
> >>>>>>>>>>>>> @@ -90,6 +90,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and=
 TouchPad");
> >>>>>>>>>>>>>  #define QUIRK_ROG_NKEY_KEYBOARD              BIT(11)
> >>>>>>>>>>>>>  #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
> >>>>>>>>>>>>>  #define QUIRK_ROG_ALLY_XPAD          BIT(13)
> >>>>>>>>>>>>> +#define QUIRK_ROG_NKEY_LEGACY                BIT(14)
> >>>>>>>>>>>> These past days I have taken a look at new 2025 models and t=
hey do make use of ID2,
> >>>>>>>>>>>> and won't do harm sending ID1 either. I think you can safely=
 remove the if and send regardless.
> >>>>>>>>>>> Hi Denis,
> >>>>>>>>>>> it is not the responsibility of this driver. ID2 is used by A=
nime
> >>>>>>>>>>> models. It is a concession to make sure that we do not cause =
a
> >>>>>>>>>>> regression that will cause warnings for a lot of users.
> >>>>>>>>>> Who decided it is a concession?
> >>>>>>>>> I would rather remove the extra calls unless they are shown to =
be
> >>>>>>>>> needed, which they might be for these PIDs.
> >>>>>>>> They are needed on older laptop and to not regress userspace.
> >>>>>>>>
> >>>>>>>> You just named _LEGACY an usb pid that is not legacy.
> >>>>>>>>> The quirk is named legacy because we can't retest these devices=
. If we
> >>>>>>>>> can, then we could remove the quirk and the inits if not needed=
.
> >>>>>>>> We can't retest every device, and that pid is used in pre-2021 m=
odels,
> >>>>>>>> and these are the unknown, I am criticizing the name of the quir=
k here,
> >>>>>>>> not what it does.
> >>>>>>> If you can test whether your device needs them that would be grea=
t.
> >>>>>> That is pointless.
> >>>>>>>> I am also questioning if the quirk is even needed since sending
> >>>>>>>> those commands to (at least) recent hardware that doesn't use
> >>>>>>>> those endpoints carries no downsides, while removing them
> >>>>>>>> surely does.
> >>>>>>> We have not found a device yet that needs them. I do not want to =
keep
> >>>>>>> sending unneeded commands. It could cause obscure bugs or interfe=
re
> >>>>>>> with userspace software such as the one you maintain. So at least=
 for
> >>>>>>> new hardware that is possible to test we should remove them.
> >>>>>> There is new hardware that needs them, as I said, including 2025 m=
odels.
> >>>>> I was not aware of that. As far as I know they are not needed. Do y=
ou
> >>>>> have a bug report with a specific laptop model I can look at?
> >>>> There is current effort to integrate commands that requires those
> >>>> initializations on 2025 laptop, why would I strip out a command
> >>>> that I already know is required anyway?
> >>> Hi,
> >>> yes ID1 is required for RGB, I have a draft patch for it that would
> >>> lazily do it if RGB is supported.
> Generally speaking yeah a positive answer (ASUSTEK ...) means
> the feature is supported. A negative answer (generally 0xFF 0xFF 0x00 ...=
.)
> means the feature is not supported.

For some devices, the kernel reports an error, such as in the parallel
bug report.

It is not so much a feature, but an endpoint. You are initializing the
5a endpoint to communicate with it, which is what this driver is
doing. You would initialize 5d for the userspace endpoint which also
supports RGB. 5a is only for brightness and for communicating
shortcuts. Yes, it might also init the device.

> Those messages are also an init for models that supports the feature,
> and generally asus has hooked functions not directly connected
> to the main function of the endpoint to those handshakes
> (the only example on my mind is 5a [] making some fn keys behaving
> different than booting/pre-os, basically for UEFI settings I guess).
>
> The disassembled AsusKeyboardFilter.sys seems to call those regardless,
> but a list of devices is nowhere to be found, probably because the .inf
> already lists the vid and pid for the driver to load.
> >>> I recall now a previous discussion about it being required for some
> >>> laptop shortcuts but we never found a laptop that needs it so I forgo=
t
> Perhaps, I can't find it on my notes. In general keyboard configuration
> has been scattered on a lot of "devices": certain laptops have an additio=
nal
> i2c device, that is separate from the keyboard device, that  does things
> like locking certain keys... don't be surprised if one command
> does more than what you are used to.
>
> On the ally 5a also changes gamepad configuration, not just leds
> as usual.
>
> Before the bootloader if you press the vol+ a boot menu will appear
> and the device will enter keyboard mode (ASUS implemented this to
> allow easier UEFI usage), but as soon as you init the device [5a handshak=
e]
> it re-enters its default state (xbox360), exiting the keyboard state.

This discussion is for 5d and 5e. Do you know of any device that needs
the 5d/5e inits specifically to enable keyboard shortcuts or control
brightness?

Specifically for the Ally, 5a is used for ROG Ally, Ally X but they
also support 5d for all commands. Xbox Allies are more complicated.

> >>>> No, this is not the way to go to knowingly and willingly cause
> >>>> troubles (both known and unknown) to others just because
> >>>> you think it's better this way.
> >>>>
> >>>> Change the name of _LEGACY to something else, have this accepted
> >>>> and then if I see it's appropriate  to remove the if and send those
> >>>> regardless I will.
> >>> Sure, up to you if you want to change the name. What would you like i=
t
> >>> be? I would like this series to merge
> >> Can you name it e.g. something that should be neutral such as:
> >>
> >> QUIRK_ROG_NKEY_ID1_ID2_INIT
> >>
> >> I'm not sure if ROG NKEY should still be included into the name based =
on
> >> what Denis mentioned about recent models but at least it gets rid of t=
he
> >> "legacy" connotation. If wider scope is necessary you could use just
> >> QUIRK_ID1_ID2_INIT.
> > It's NKEY only so QUIRK_ROG_NKEY_ID1ID2_INIT would be more appropriate
> > (all recent models are NKEY)
> Given that those devices are the main way to control the hardware
> (for things that are out of scope of wmi) you could also call those
> _SYSTEM or something that denotate the importance of those devices
> in controlling what the firmware does.
>
> I am fine even with what Ilpo suggested, I simply don't want
> to associate those vid:pid with something that is necessarily
> "old" as they have been in use for a long time and at least on ROG
> virtually all of them have those vid:pid...
>
> The overwhelming majority: so much so that the easiest way to
> tell models apart is to check for DMI since software cannot easily
> distinguish them from USB alone.

It is not meant to describe your device as legacy, if your device does
not need the quirk then running those inits is a byproduct of PID
reuse. If it does need them, some analysis from your side would be
appreciated

I will just do a rename

Antheas

> > Sounds like a plan, I will resend tomorrow. If anyone wants to leave
> > any more comments now is the time.
> >
> > Antheas
> >
> >> --
> >>  i.
> >>
>

