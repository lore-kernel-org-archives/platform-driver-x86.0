Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D51415B8B
	for <platform-driver-x86@vger.kernel.org>; Sun, 18 Oct 2026 19:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792351563; cv=pass; b=rbfPJcwdHBHiNWAuFvQZcsW4/H6YqA79C0BJk3Vw1F+d3cvIms257Gh5yVpv0oaKVwmGgK6U34vJQNHPLROFeSfIR1SnWSAQEScjx4kvlQ817EA8/CZEGdVN1wr/U3v+7dRr1HeA1UIkK64rz/hiVWQQ1egMkUMsZdLxkGx8b/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792351563; c=relaxed/simple;
	bh=g1sNKS6Y2D8MgzS3phRmfLPaJwlUJ8H+dXZDqf+DD7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J4yT9DlOjgn+wJrS7a0nEDnUUFMbFpg/3oWziwkzkmPaLBup98HJqX33CmxCB7Cs6K4Y7t8tP2eBkTq4QcRJvwzPtmUqBjDKRawF6XxAzzUsQqHuuyAIa5FAlxtJZtFcfyyUyX3c9pm7geI/8BeParkz8b0dAUl4fdy+IcQbzPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nMnPt26C; arc=pass smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nMnPt26C"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93e64d52949so148107485a.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 18 Oct 2026 12:26:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792351560; cv=none;
        d=google.com; s=arc-20260327;
        b=kJVJo0O3qZtXXxGRTXRy3QYEkODjbONyE1/vOIU0zCcoIFf+EL+McGbHQPtmNsMMvX
         t3lT/tfn2tRATsKesgoQAa49aLubbr4zB/tEouV1uI29pb4Nh8Bqe39Klh6dmi172OiG
         JH3BQ9RCUuWAjTEfN98E93wVpKQTIUyicNizkA+2P4wD9iCKTY9GsKv2ROuo1DCUNMvD
         QIL8PhIoIzhSSj6rFrhgOLbwkKqggJHUvhAyosmZ8meUnZcaUBe7D93D2nlWJ5ii22/i
         7ZSBffw399fOh9EJk7hlGK48vHvUlGOp0+CrzO/t3SDOzMbsd83YhNGD3JaPR5oyUmcb
         I1xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f7bcklpKlwFfTmIsv/K4nQ97GKPuHRN3wR8aU9Whm6Q=;
        fh=F2oBU3Q+7zYU5R3c+M9hfxYPf02CD9+b1dxn5vYHdyI=;
        b=XgPyySWHp4ybH5vdT/FfrPEp9jwzMdsNSTqtRFX4ud5fnG4bUkoJbZw1jk2cFEi6/p
         +6rWBD7sr/OnJPowgcqSc37/+YjDGlMYS1/uXYIcstUeLgZW5yMro79Tm0989tF9p1un
         nTPEagVXpPcJqtbOneq5rmmhWyifqF0UN7MRNm8LFdZNQHqpWe70LX6TJL0GGfayV95x
         AREUJz0r1LAXTh3Nm+aE8IQCbu1XzQlAEnKQNsgD7njwXlAglj60DI5G8CoONdOKaixx
         anaSf0AoG9WxEFlebBr6b0EIa2CpttrQoDEkdOS5wBbHFMYbfCQFLJFlY2lMGkYgtjyC
         mkSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792351560; x=1792956360; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f7bcklpKlwFfTmIsv/K4nQ97GKPuHRN3wR8aU9Whm6Q=;
        b=nMnPt26CnIac7n2jE/Y8Et5SbElar+fak714AgkoMqNT9ZQxSUAmNXm2VbZaEqlmRY
         OCMTDEs76RpYVy8nqzslC8qNCRj5NnBq783/UgIFdP93cD+hpVR2MBmOh4IfWNM8WF7a
         BQxFz7vsEjnVHVPaoCbMX5DX0nYxLGZNpAJF3GGIaXMQiQjnXz8x8ue3rS2a6xEEmahr
         fzF/fPdTzLalQ0mSNXHVioTSjNHFvGGilWe+IF5PZ5LOAmwGm/e3GSglBsHNOjFoMrgV
         v8OOzRSwv0ZqGhFVkhrZh27pJidGlar8h6crRUmXT9pE7bUkPXTjN4yqQ+QZlB7YmRzD
         mXeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792351560; x=1792956360;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f7bcklpKlwFfTmIsv/K4nQ97GKPuHRN3wR8aU9Whm6Q=;
        b=AuyVfSl59p7tXu48stQqQpbqaw4IMXzRpFGGpf/ts1Yas2hrj1aM8u4uls8+KtS8Pw
         ElDgptSw2+YhDphCQJZaMguq6Ql3X7Mqu19shVnbH73uirNJleGKWoHLvs8on2Rl/qco
         rfq+uZxmoZK0HLmJBg5bv48gvZ3gEgEsOPIqPPlh+m8KYAhQCl1ig2CiIrNUwlFvkafE
         3Yun/AGUHsIXGljocHf/UuIKCPYRtTgJuoLj85W8p8zgcXE9AFc7DozZ4pdp0ZHECyHY
         9dXx+pW4rxfPAEMPm3WVd5WegKHKAW3EShtlrwkzfKn4oB5ugzYLMOdPO5j4tecx/W4u
         CYwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbsnkYpwmPCLfduJRuNav5Hv2SN2AKUTVrgHbQkdjdz86wTzrD/bc3R5Fix+dj9rkf/40B5ulGw2xvMquU7ABm8wY1@vger.kernel.org
X-Gm-Message-State: AFq9FYIf/mvxqe9wjVWAAplafxy/fFflenE4KQ3bdbzD1Qp02sGmhBbq
	SjRVR7/9GXgz8BYdl6e77eQBfHbLwvCMLWCOs0KWsUWnD7jHXS2Y0XUw95tJPAV4FnFgBj8AZDI
	cLbMQxtI2K7A34J3PlfArnf8WuxZ6wtjGDNIq
X-Gm-Gg: AYBFou3Mwesx0iU9a2ht9qtLDCsmEbJ3O412Y4Gt3Xx9zlVVLiSYnhpJbHiu1jgW2yr
	ixe06uEHcn/ncKjvtyWO0z4IGoRn/1GVE1SPewpMmDLo9cMSZ63hAHAsbCBKUId+f5YMXiSrwzo
	pZzFRI1wddTof+Iz+oklZajT3u52zr8erbXedGCF+Sy9+GFQbkChP+9oTvMStajdS79ArhbxkeA
	oBWYMR4B8u0RcN/Wk/guKjjvzBaoBWX0VjcYQqElfgwHpoqqlylMoz8SqzLWQhkBRBQXe7OqKGw
	wKYQBfhnSzCaaqP9kzPJxbQ4HGQuwfFWwGZXoMWRTQR7BxHoMfudp8c=
X-Received: by 2002:a05:620a:3715:b0:93f:1823:308f with SMTP id
 af79cd13be357-93f29dabcdemr927150985a.81.1792351560281; Sun, 18 Oct 2026
 12:26:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261017-zenbook-duo-keys-v1-1-45f72d3db5ed@gmail.com> <1a35e100-010d-4327-afe5-1d2496ad7e24@linux.dev>
In-Reply-To: <1a35e100-010d-4327-afe5-1d2496ad7e24@linux.dev>
From: Victor <victor.gillholm@gmail.com>
Date: Sun, 18 Oct 2026 21:25:49 +0200
X-Gm-Features: AclHuK8vhc7ir1MLvBSsSGSdg1S3U70fVAOXN5uE_S3fn1CjgTs2Ev7hqTK5k0Q
Message-ID: <CAKspSoNJxEcEH1AwXHyNY5cWVvCQ3LN0fcZ8d9ajAoShdBMRKg@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: asus-nb-wmi: map ScreenPad and Task Swap keys
To: denis.benato@linux.dev
Cc: corentin.chary@gmail.com, luke@ljones.dev, hansg@kernel.org, 
	ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 10/18/26 20:02, Denis Benato wrote:
> The driver is handling the screenpad so why not implementing the
> functionality in the driver instead of doing the dance driver -> evdev
> -> remap -> driver ?
>
> Unless I misunderstood what you want to do... Hopefully not!

Hi Denis,

Thanks for looking at this.

Handling it in the driver would work, but the key would then only be an
on/off switch for the ScreenPad. If I remember correctly, on Windows the
same key cycled between modes: on, off, and using the ScreenPad as a
touchpad. If the driver toggles the power on every press, userspace
cannot do that, because the panel is already switched off before it
sees the key.

Reporting the key as KEY_F13 allows both. Users who only want on/off can
bind it to the asus_screenpad backlight device, so the power control
still goes through the driver, and others can use it to switch modes.

It also matches hid-asus, which already reports the same ScreenPad code
0x6a as KEY_F13.

While testing this I also found that the ScreenPad power control looks
inverted on this model (UX482EG, stock asus-wmi on 7.2.5). Writing 0
(power on) to /sys/class/backlight/asus_screenpad/bl_power switches the
panel off, about three seconds later its DRM connector reports
disconnected, and writing 4 (power off) brings it back. The result was
the same each time I tried. While the panel is off, actual_brightness
still reads 89, so the firmware seems to report it as powered. I can
look into that separately if it is useful.

> > + { KE_KEY, 0x9C, { KEY_F14 } }, /* Task Swap key on Zenbook Duo */
>
> Fair.

Thanks.

Best regards,
Victor


Den s=C3=B6n 18 okt. 2026 kl 20:02 skrev Denis Benato <denis.benato@linux.d=
ev>:
>
>
> On 10/17/26 20:13, Victor Gillholm via B4 Relay wrote:
> > From: Victor Gillholm <victor.gillholm@gmail.com>
> >
> > The ASUS Zenbook Duo 14 UX482EG has two keys next to the power button:
> > one toggles the ScreenPad Plus, the second screen above the keyboard,
> > and one swaps windows between the two screens (Task Swap in ASUS'
> > ScreenXpert software). They emit ASUS WMI event codes 0x6a and 0x9c.
> > Neither code is in the asus-nb-wmi sparse keymap, so pressing them only
> > logs "Unknown key code 0x6a" or "Unknown key code 0x9c", and both keys
> > are reported as KEY_UNKNOWN, so ordinary desktop key bindings cannot
> > tell them apart.
> >
> > Map 0x6a to KEY_F13, the same keycode hid-asus already uses for the
> > ScreenPad toggle code 0x6a. No existing keycode describes moving window=
s
> > between screens, so map 0x9c to KEY_F14, following the existing use of
> > KEY_F13 and KEY_F14 for other ASUS-specific keys in this keymap. Both
> > keys then emit distinct, bindable events.
> >
> > Tested on an ASUS Zenbook Duo 14 UX482EG: with this change the keys
> > arrive in userspace as KEY_F13 and KEY_F14 and the "Unknown key code"
> > messages are gone.
> >
> > Assisted-by: Claude:claude-opus-5-5
> > Signed-off-by: Victor Gillholm <victor.gillholm@gmail.com>
> > ---
> > Tested by building asus-nb-wmi against 7.2.5 and loading it in place of
> > the stock module. The key mapping was checked with wev: before the chan=
ge
> > both keys arrived as keycode 248 with no keysym, after it as XF86Tools
> > (KEY_F13) and XF86Launch5 (KEY_F14).
> > ---
> >  drivers/platform/x86/asus-nb-wmi.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/=
asus-nb-wmi.c
> > index 3b0f3346d..c6eb525ec 100644
> > --- a/drivers/platform/x86/asus-nb-wmi.c
> > +++ b/drivers/platform/x86/asus-nb-wmi.c
> > @@ -641,6 +641,7 @@ static const struct key_entry asus_nb_wmi_keymap[] =
=3D {
> >       { KE_KEY, 0x65, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + TV */
> >       { KE_KEY, 0x66, { KEY_SWITCHVIDEOMODE } }, /* SDSP CRT + TV */
> >       { KE_KEY, 0x67, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + CRT + TV=
 */
> > +     { KE_KEY, 0x6A, { KEY_F13 } }, /* ScreenPad toggle on Zenbook Duo=
 */
>
> Hi Victor,
>
> The driver is handling the screenpad so why not implementing the function=
ality in
> the driver instead of doing the dance driver -> evdev -> remap -> driver =
?
>
> Unless I misunderstood what you want to do... Hopefully not!
>
> >       { KE_KEY, 0x6B, { KEY_TOUCHPAD_TOGGLE } },
> >       { KE_IGNORE, 0x6E, },  /* Low Battery notification */
> >       { KE_KEY, 0x71, { KEY_F13 } }, /* General-purpose button */
> > @@ -666,6 +667,7 @@ static const struct key_entry asus_nb_wmi_keymap[] =
=3D {
> >       { KE_KEY, 0x93, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + CRT + TV=
 + DVI */
> >       { KE_KEY, 0x95, { KEY_MEDIA } },
> >       { KE_KEY, 0x99, { KEY_PHONE } }, /* Conflicts with fan mode switc=
h */
> > +     { KE_KEY, 0x9C, { KEY_F14 } }, /* Task Swap key on Zenbook Duo */
>
> Fair.
>
> Best regards,
> Denis Benato
>
> >       { KE_KEY, 0X9D, { KEY_FN_F } },
> >       { KE_KEY, 0xA0, { KEY_SWITCHVIDEOMODE } }, /* SDSP HDMI only */
> >       { KE_KEY, 0xA1, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + HDMI */
> >
> > ---
> > base-commit: ea40f1e9f07aab937b9a217633be7a1f66260394
> > change-id: 20261017-zenbook-duo-keys-7e0b3f94354a
> >
> > Best regards,
> > --
> > Victor Gillholm <victor.gillholm@gmail.com>
> >
> >
