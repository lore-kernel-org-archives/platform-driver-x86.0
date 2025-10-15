Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B416301712
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 Oct 2025 15:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760542709; cv=none; b=anTrkiPShRq/CJ7S/T2ATp25/o3SUIsG5M9w+Qf6p9Qf9Cdp1VIs/OvMzJcbDq1rL69iTR6EDz8AWBU7oQ1OgIxKuKh8jA4eKZUtZtC0ffcu2IA3J7qxQ3buJn1b57hzYLLS2pbcfpf02dCfPKKo96RQ1xL3xUB0J6/WJLFvxlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760542709; c=relaxed/simple;
	bh=gIezYiTegFyBcP/3Fb+EbVWbtQuVMFl/3rnZU/geUsk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KRpMynPdvmBbMI0ctiIzJ1lt51sFSjEbxKvvb6n2wc/z5LyEl/zjqSCEDfSL38LijYu8RggRJD85dlSVpW64YcQZBHzjxLXIyhuoSrmbqrutKvqj4YQyXpiC0h58MHzg3OpqMeqrR+Rm/R3iA9JkXsPiZepr1eGVms/sZKUxj1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=ajQoasmR; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="ajQoasmR"
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id 49970BD8AD
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 Oct 2025 18:38:24 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id B8F6DBDBC6
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 Oct 2025 18:38:23 +0300 (EEST)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 51C6A1FED1C
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 Oct 2025 18:38:22 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1760542703;
	bh=mQ7/WGOdGYf6mG7n10jnlLe+eDnokaXF7eAESwWnDQA=;
	h=Received:From:Subject:To;
	b=ajQoasmREzS8ubu1QXzsN2KF5CyzI2MgdM0JQUsZbEwpuDqNoe2wOg29OzdJrG3h9
	 ezXdEoysUjICiD6lE3GDvoatVXstLNe7FdNvc4mt8trJHqMh31zSxk5grNQTR3K5kd
	 0y+RFYDMH3JgCpfOvaR3RpXQbDqlo0qFrOFEOQL7Ngx92ivP28w/A6Anoze4W9MpFO
	 jlA9QsR8rLINGYENxHxpm5WuQpNAiFSRPlS3/9spmZlDmK8zxsfboCzP8DuqYMj3gA
	 c1kvojtFh1gZQcXlVMi07ev1QbCTKKc8O6QcijuGm9tdslgmCG0/ClZidhKvnV75GN
	 8zY4/KfBHZ0xA==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.181) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f181.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-36a448c8aa2so57799531fa.0
        for <platform-driver-x86@vger.kernel.org>;
 Wed, 15 Oct 2025 08:38:22 -0700 (PDT)
X-Gm-Message-State: AOJu0YyM9hSaaFr7+oB0eNismjY0Vwx4lmQrrnHPEYCgL4U22G5EK96J
	xW+/4gNDIkOYMyHV15qXi1tmqqlhTCbN8RJo7P0WLYMskW37CBjo/hqkea4BjHH9BjHA5cJvss3
	OW27asHb2TMgxWB76u816+YuEH9IV7zw=
X-Google-Smtp-Source: 
 AGHT+IFjqcKyYvGe7pHZIYE2H4S3rda8I4BB4biO+WOCIaCVKhqZUt8ACTiws2IWJ8pMURwHRVEKmxtrfAqtqNdZfcQ=
X-Received: by 2002:a05:651c:199e:b0:333:b6b1:a151 with SMTP id
 38308e7fff4ca-37609ce579cmr80632981fa.7.1760542701798; Wed, 15 Oct 2025
 08:38:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013201535.6737-1-lkml@antheas.dev>
 <20251013201535.6737-7-lkml@antheas.dev>
 <4e4af3e9-26d3-ad03-7868-7fd7dbd541f3@linux.intel.com>
In-Reply-To: <4e4af3e9-26d3-ad03-7868-7fd7dbd541f3@linux.intel.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Wed, 15 Oct 2025 17:38:10 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwFb9HsT4DCDvASdyxBjO6rJoODbBchXt1GXmRD7gqZ1nA@mail.gmail.com>
X-Gm-Features: AS18NWDUdsfcgcvuMLIdgA9AW5hQrdjU8rtiJSwIpWPukhUnQInxKfrQt1LW6ig
Message-ID: 
 <CAGwozwFb9HsT4DCDvASdyxBjO6rJoODbBchXt1GXmRD7gqZ1nA@mail.gmail.com>
Subject: Re: [PATCH v6 6/7] platform/x86: asus-wmi: add keyboard brightness
 event handler
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>,
	Denis Benato <benato.denis96@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <176054270306.2565078.8888189683775446151@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Wed, 15 Oct 2025 at 14:19, Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Mon, 13 Oct 2025, Antheas Kapenekakis wrote:
>
> > Currenlty, the keyboard brightness control of Asus WMI keyboards is
>
> There's a typo here but preferrably avoid "currently" altogether where
> possible.
>
> > handled in the kernel, which leads to the shortcut going from
> > brightness 0, to 1, to 2, and 3.
> >
> > However, for HID keyboards it is exposed as a key and handled by the
> > user's desktop environment. For the toggle button, this means that
> > brightness control becomes on/off. In addition, in the absence of a
> > DE, the keyboard brightness does not work.
> >
> > Therefore, expose an event handler for the keyboard brightness control
> > which can then be used by hid-asus.
> >
> > Reviewed-by: Luke D. Jones <luke@ljones.dev>
> > Tested-by: Luke D. Jones <luke@ljones.dev>
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > ---
> >  drivers/platform/x86/asus-wmi.c            | 41 +++++++++++++++++++++-
> >  include/linux/platform_data/x86/asus-wmi.h | 13 +++++++
> >  2 files changed, 53 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asu=
s-wmi.c
> > index a2a7cd61fd59..58407a3b6d41 100644
> > --- a/drivers/platform/x86/asus-wmi.c
> > +++ b/drivers/platform/x86/asus-wmi.c
> > @@ -1579,6 +1579,45 @@ void asus_hid_unregister_listener(struct asus_hi=
d_listener *bdev)
> >  }
> >  EXPORT_SYMBOL_GPL(asus_hid_unregister_listener);
> >
> > +static void do_kbd_led_set(struct led_classdev *led_cdev, int value);
> > +
> > +int asus_hid_event(enum asus_hid_event event)
> > +{
> > +     unsigned long flags;
> > +     int brightness;
> > +
> > +     spin_lock_irqsave(&asus_ref.lock, flags);
> > +     if (!asus_ref.asus || !asus_ref.asus->kbd_led_registered) {
>
> Please add a local variable for asus_ref.asus. Check other
> patches/functions too if its use is repeated in some function many times,
> the local var seems to be in order.
>
> > +             spin_unlock_irqrestore(&asus_ref.lock, flags);
>
> Use guard() instead.
>
> > +             return -EBUSY;
> > +     }
> > +     brightness =3D asus_ref.asus->kbd_led_wk;
> > +
> > +     switch (event) {
> > +     case ASUS_EV_BRTUP:
> > +             brightness +=3D 1;
> > +             break;
> > +     case ASUS_EV_BRTDOWN:
> > +             brightness -=3D 1;
> > +             break;
> > +     case ASUS_EV_BRTTOGGLE:
> > +             if (brightness >=3D ASUS_EV_MAX_BRIGHTNESS)
> > +                     brightness =3D 0;
> > +             else
> > +                     brightness +=3D 1;
> > +             break;
> > +     }
> > +
> > +     do_kbd_led_set(&asus_ref.asus->kbd_led, brightness);
> > +     led_classdev_notify_brightness_hw_changed(&asus_ref.asus->kbd_led=
,
> > +                                               asus_ref.asus->kbd_led_=
wk);
> > +
> > +     spin_unlock_irqrestore(&asus_ref.lock, flags);
> > +
> > +     return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(asus_hid_event);
> > +
> >  /*
> >   * These functions actually update the LED's, and are called from a
> >   * workqueue. By doing this as separate work rather than when the LED
> > @@ -1878,7 +1917,7 @@ static int asus_wmi_led_init(struct asus_wmi *asu=
s)
> >       asus->kbd_led.flags =3D LED_BRIGHT_HW_CHANGED;
> >       asus->kbd_led.brightness_set =3D kbd_led_set;
> >       asus->kbd_led.brightness_get =3D kbd_led_get;
> > -     asus->kbd_led.max_brightness =3D 3;
> > +     asus->kbd_led.max_brightness =3D ASUS_EV_MAX_BRIGHTNESS;
> >       asus->kbd_led_avail =3D !kbd_led_read(asus, &led_val, NULL);
> >
> >       if (asus->kbd_led_avail)
> > diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux=
/platform_data/x86/asus-wmi.h
> > index 1f85d76387a8..e78e0fbccede 100644
> > --- a/include/linux/platform_data/x86/asus-wmi.h
> > +++ b/include/linux/platform_data/x86/asus-wmi.h
> > @@ -168,6 +168,14 @@ struct asus_hid_listener {
> >       void (*brightness_set)(struct asus_hid_listener *listener, int br=
ightness);
> >  };
> >
> > +enum asus_hid_event {
> > +     ASUS_EV_BRTUP,
> > +     ASUS_EV_BRTDOWN,
> > +     ASUS_EV_BRTTOGGLE,
>
> Where does "BRT" come from. To me it doesn't associate with brightness
> (might be due to me being non-native). If there's a good reason why it's
> that way, fine but otherwise I suggest changing it so that it becomes
> easier to understand.
>
> It's not a big problem as is because the context in the code above allows
> decrypting the meaning but without the other names, I'd have been totally
> lost what it means.

Comes from e9809c0b9670 ("asus-wmi: add keyboard backlight support")

I matched it to the driver, other alternative is KBDILLUM. I will keep
it as BRT for now to match the current driver.

> > +};
> > +
> > +#define ASUS_EV_MAX_BRIGHTNESS 3
> > +
> >  #if IS_REACHABLE(CONFIG_ASUS_WMI)
> >  void set_ally_mcu_hack(enum asus_ally_mcu_hack status);
> >  void set_ally_mcu_powersave(bool enabled);
> > @@ -176,6 +184,7 @@ int asus_wmi_evaluate_method(u32 method_id, u32 arg=
0, u32 arg1, u32 *retval);
> >
> >  int asus_hid_register_listener(struct asus_hid_listener *cdev);
> >  void asus_hid_unregister_listener(struct asus_hid_listener *cdev);
> > +int asus_hid_event(enum asus_hid_event event);
> >  #else
> >  static inline void set_ally_mcu_hack(enum asus_ally_mcu_hack status)
> >  {
> > @@ -200,6 +209,10 @@ static inline int asus_hid_register_listener(struc=
t asus_hid_listener *bdev)
> >  static inline void asus_hid_unregister_listener(struct asus_hid_listen=
er *bdev)
> >  {
> >  }
> > +static inline int asus_hid_event(enum asus_hid_event event)
> > +{
> > +     return -ENODEV;
> > +}
> >  #endif
> >
> >  #endif       /* __PLATFORM_DATA_X86_ASUS_WMI_H */
> >
>
> --
>  i.
>
>

