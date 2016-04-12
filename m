From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH] fujitsu-laptop: Support radio LED
Date: Tue, 12 Apr 2016 14:26:15 +0200
Message-ID: <20160412122615.GB2583@eudyptula.hq.kempniu.pl>
References: <1458127687-25366-1-git-send-email-kernel@kempniu.pl>
 <20160322112738.GA26924@xo-6d-61-c0.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:35406 "EHLO
	mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932727AbcDLM0T (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 12 Apr 2016 08:26:19 -0400
Received: by mail-lf0-f54.google.com with SMTP id c126so22632128lfb.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Apr 2016 05:26:19 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20160322112738.GA26924@xo-6d-61-c0.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pavel Machek <pavel@ucw.cz>
Cc: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Pavel,

Either your clock is really off or it took you 3 weeks to get this
message out ;)  Just letting you know.

> > +
> > +static enum led_brightness radio_led_get(struct led_classdev *cdev=
);
> > +static void radio_led_set(struct led_classdev *cdev,
> > +			       enum led_brightness brightness);
> > +
> > +static struct led_classdev radio_led =3D {
> > + .name =3D "fujitsu::radio_led",
> > + .brightness_get =3D radio_led_get,
> > + .brightness_set =3D radio_led_set
> > +};
>=20
> Is the naming consistent with other drivers?

I am not entirely clear what you are referring to.  If it is the double
colon, that seems to be the convention used throughout the
platform-driver-x86 tree.  If it is the LED's name ("radio_led"), I
failed to find a similarly purposed LED in the platform-driver-x86 tree
with a name I could reuse.  I decided to use the _led suffix to
differentiate this LED from the "lamps" already implemented by
fujitsu-laptop.

> Should there be default trigger so that it works out of the box?

I have covered this issue in the lengthy comment attached to this patch=
:

> One last remark is that I think this LED would best be driven by an
> inverted airplane mode LED trigger (as proposed by Jo=C3=A3o Paulo Re=
chi
> Vita).  As the code for that trigger is not yet merged, I refrained f=
rom
> setting the default_trigger field in struct led_classdev radio_led.
> Perhaps it's a candidate for a follow-up patch in the future.

I haven't found a way to make this work the intended way out of the box=
,
not with the currently available set of LED triggers.  That being said,
I would be happy if someone proved me wrong.

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
