Received: from relay15.grserver.gr (relay15.grserver.gr [46.62.234.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8F917D2
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Nov 2025 01:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.62.234.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763514735; cv=none; b=my87DYpbCyC/BKE948pqo/9f/badl4xwYY5JNpoaGe9a5tpDErFU3FNsvXoPC5JOMsD6DihP//NtE+OR8ZwEybSzwr8cW8syusImuhJ3Fez31qFyTtfM+v/YKWfiFlHRGbqzyDWcVblIA0wq4qf7CRNmWulaVcxatTuN8du/JC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763514735; c=relaxed/simple;
	bh=NVP8tQmMfKXXvY6jFIlb37jrcM+HWc/rkqqyuU14WEM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G1i/yvXDgr5fqCkXmdgdE67NHG6E6OoN7uwS0kGplrtjRA2qvS9KLj1wiwiYnKB78BSlVL6mH2Oc9Xo2310YCcj0fTdtDccTl2j7+U5eM5hbvEjvUmUImGx5tgj6lLMXvBrF3c73uCBKIvadDarMcap+7X2eaMSLqjMH4KjMRX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=QCie0ha8; arc=none smtp.client-ip=46.62.234.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="QCie0ha8"
Received: from relay15 (localhost [127.0.0.1])
	by relay15.grserver.gr (Proxmox) with ESMTP id 50BAA43DDC
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Nov 2025 01:12:08 +0000 (UTC)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay15.grserver.gr (Proxmox) with ESMTPS id 8E2A743E7F
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Nov 2025 01:12:07 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id C6775201E7E
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Nov 2025 03:12:06 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1763514727;
	bh=tgnvRLL7c+cxSNLhApXWaNPqaLEzjvcoAiQnfpM97Kk=;
	h=Received:From:Subject:To;
	b=QCie0ha829D5nlZ/NVMJ+E2VZacqlL4GJz2Qaw2jGct5cFZROBBFnROI/NmiUyhXU
	 H+FloNmr25UtC0LHvyS2koOuNED3ygqeaPOEWqWMPnGM1lK2yo5w1lctsqp5p+6ZOV
	 IRnrhUrTXeRQqAE1O7oVsTiJjjWVKMJUQWahrBJ0pJaLJJeG2wADWpSGHUK/U5aF+u
	 BvUOtpA6wCzFBcX215U8h1+NXIK/JHv77d7fEC2luR2z9Fi3gVyzKUUEjUjrmcTDwK
	 7rajAZ+9QQw0SGmxrWaXgMR3433KPwgH7LmjEuZb+oIl3eHtzZZFWtgg4n7mpSGVkh
	 dWtdnnXgPDvnA==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.180) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f180.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-37a3a4d3d53so52067681fa.3
        for <platform-driver-x86@vger.kernel.org>;
 Tue, 18 Nov 2025 17:12:06 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX2KVSUMEVEQ2iswS9AEedwW3kTSEXGQMRn/RLujDpCzCKfJGekYEdVyH2jxoORkccJ2G9wrlIVQ/7xX3jhU+A2aNvu@vger.kernel.org
X-Gm-Message-State: AOJu0YyVQ4LubOXDspSvCDYTI1BpR+yXHAPPGasf7s4fNJoT/5ZF0rf5
	xL+KdNJMUpBmZcIawMCEaUTUNr4XgxayFwFJy3OTaz8wZ5mNBcjKW1GRXiSvmTB/s6ACbu6jsPR
	gClPtb9Z1oMzb6Aveu3OqK6hMElyYvAg=
X-Google-Smtp-Source: 
 AGHT+IF6aWVaBDkHYcJaltCmtyAu3QpufBTnLc92AwUTT25p1yq807jvFv5RbxmVsXG+eQBQWRxOaixnVd5yj5jFe0s=
X-Received: by 2002:a05:651c:2450:10b0:37b:9110:21c4 with SMTP id
 38308e7fff4ca-37babd5cbb8mr41179211fa.31.1763514726279; Tue, 18 Nov 2025
 17:12:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251101104712.8011-1-lkml@antheas.dev>
 <20251101104712.8011-6-lkml@antheas.dev>
 <2fc1e683-0234-20b6-7448-bd0213c9bb37@linux.intel.com>
 <b505ffca-63a1-4c52-b940-cdfc507813fc@gmail.com>
In-Reply-To: <b505ffca-63a1-4c52-b940-cdfc507813fc@gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Wed, 19 Nov 2025 02:11:55 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwEF8bhbhgYe9cyg0JgcKsXstNZubPV9HCapwxMvw_2OhQ@mail.gmail.com>
X-Gm-Features: AWmQ_blWb6Z5qMEQsNm7Qyr_Yx00ZupCjj716sIVdbrn45609Zi8GMcdAwuu52k
Message-ID: 
 <CAGwozwEF8bhbhgYe9cyg0JgcKsXstNZubPV9HCapwxMvw_2OhQ@mail.gmail.com>
Subject: Re: [PATCH v8 05/10] HID: asus: initialize LED endpoint early for old
 NKEY keyboards
To: Denis Benato <benato.denis96@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <176351472703.1842826.14114358398465927247@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Wed, 19 Nov 2025 at 01:54, Denis Benato <benato.denis96@gmail.com> wrote=
:
>
>
> On 11/18/25 13:10, Ilpo J=C3=A4rvinen wrote:
> > On Sat, 1 Nov 2025, Antheas Kapenekakis wrote:
> >
> >> These keyboards have always had initialization in the kernel for 0x5d.
> >> At this point, it is hard to verify again and we risk regressions by
> >> removing this. Therefore, initialize with 0x5d as well.
> See patch 1: unless I missed something you can retain the two
> FEATURE_KBD_LED_REPORT_IDx behind the same exact quirk:
> why are we adding a quirk to replace a quirk that was removed
> in patch 1?
>
> You are basically doing the pretty-much-but-not-quite
> equivalent of what the driver was doing before.
> >> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> >> ---
> >>  drivers/hid/hid-asus.c | 15 +++++++++++++--
> >>  1 file changed, 13 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> >> index 726f5d8e22d1..221c7195e885 100644
> >> --- a/drivers/hid/hid-asus.c
> >> +++ b/drivers/hid/hid-asus.c
> >> @@ -91,6 +91,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad")=
;
> >>  #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
> >>  #define QUIRK_ROG_ALLY_XPAD         BIT(13)
> >>  #define QUIRK_SKIP_REPORT_FIXUP             BIT(14)
> >> +#define QUIRK_ROG_NKEY_LEGACY               BIT(15)
> >>
> >>  #define I2C_KEYBOARD_QUIRKS                 (QUIRK_FIX_NOTEBOOK_REPOR=
T | \
> >>                                               QUIRK_NO_INIT_REPORTS | =
\
> >> @@ -669,6 +670,16 @@ static int asus_kbd_register_leds(struct hid_devi=
ce *hdev)
> >>      if (ret < 0)
> >>              return ret;
> >>
> >> +    if (drvdata->quirks & QUIRK_ROG_NKEY_LEGACY) {
> >> +            /*
> >> +             * These keyboards might need 0x5d for shortcuts to work.
> >> +             * As it has been more than 5 years, it is hard to verify=
.
> >> +             */
> >> +            ret =3D asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
> >> +            if (ret < 0)
> >> +                    return ret;
> >> +    }
> >> +
> >>      /* Get keyboard functions */
> >>      ret =3D asus_kbd_get_functions(hdev, &kbd_func, FEATURE_KBD_REPOR=
T_ID);
> >>      if (ret < 0)
> >> @@ -1409,10 +1420,10 @@ static const struct hid_device_id asus_devices=
[] =3D {
> >>        QUIRK_USE_KBD_BACKLIGHT },
> >>      { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> >>          USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD),
> >> -      QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> >> +      QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_N=
KEY_LEGACY },
> >>      { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> >>          USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD2),
> >> -      QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> >> +      QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_N=
KEY_LEGACY },
> >>      { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> >>          USB_DEVICE_ID_ASUSTEK_ROG_Z13_LIGHTBAR),
> >>        QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> > You should do FEATURE_KBD_LED_REPORT_ID1 refactoring together, not remo=
ve
> > + add back in different patches.
> Granted I still have no idea why that was removed in the first place?
> Then re-added but losing FEATURE_KBD_LED_REPORT_ID1 ?
>
> What's the problem with FEATURE_KBD_LED_REPORT_ID1?
>
> > I suppose the cleanest would be to add a new patch as first which moves
> > asus_kbd_init() outside of if/else so you can make this refactoring of
> > FEATURE_KBD_LED_REPORT_ID1 in the 2nd patch.
> Again I am missing the point in moving these...
> > I note there's still contention with this series overall.
> >
> There are a few things that have pretty much the potential of making
> some laptops act funny due to tinkering with initializations commands.
>
> The rename will break some tools, but other than that, granted I have yet
> to check the rest of the patchset, looks reasonable to me.
>
> Perhaps I am not entirely happy with how things are worded in
> a few instances, but it's a minor issue.

Hi Denis,
please refrain from repeating yourself, in the same email and across
emails, and repeating comments that are already addressed by Ilpo. As
that makes it hard to track and respond to your comments.

As noted in this chain, the plan for the next version is to include
ID2 in this quirk and instead of removing it in the simplify patch,
use a gate by the ROG quirk that is then replaced by a gate from this
quirk.

This completely addresses your comment. The legacy quirk only applies
to a subset of devices, so it is not the same with this series
applied.

Antheas

