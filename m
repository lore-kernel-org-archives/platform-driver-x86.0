From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] fujitsu-laptop: Support radio LED
Date: Thu, 14 Apr 2016 14:39:38 +0200
Message-ID: <20160414123938.GA13049@amd>
References: <1458127687-25366-1-git-send-email-kernel@kempniu.pl>
 <20160322112738.GA26924@xo-6d-61-c0.localdomain>
 <20160412122615.GB2583@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160412122615.GB2583@eudyptula.hq.kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi!
>=20
> Either your clock is really off or it took you 3 weeks to get this
> message out ;)  Just letting you know.

Clock is off.

> > > +
> > > +static enum led_brightness radio_led_get(struct led_classdev *cd=
ev);
> > > +static void radio_led_set(struct led_classdev *cdev,
> > > +			       enum led_brightness brightness);
> > > +
> > > +static struct led_classdev radio_led =3D {
> > > + .name =3D "fujitsu::radio_led",
> > > + .brightness_get =3D radio_led_get,
> > > + .brightness_set =3D radio_led_set
> > > +};
> >=20
> > Is the naming consistent with other drivers?
>=20
> I am not entirely clear what you are referring to.  If it is the doub=
le
> colon, that seems to be the convention used throughout the
> platform-driver-x86 tree.  If it is the LED's name ("radio_led"), I
> failed to find a similarly purposed LED in the platform-driver-x86 tr=
ee
> with a name I could reuse.  I decided to use the _led suffix to
> differentiate this LED from the "lamps" already implemented by
> fujitsu-laptop.

I'd expected the led to be called "fujitsu::rfkill" but it looks that y=
ou
are first one in tree with something similar, so I guess you get to
pick the name.

It would be nice to have easily-available list of all the suffixes. We
have keyboard backlights, keyboard frontlights, LED flashes, ...

> > Should there be default trigger so that it works out of the box?
>=20
> I have covered this issue in the lengthy comment attached to this pat=
ch:
>=20
> > One last remark is that I think this LED would best be driven by an
> > inverted airplane mode LED trigger (as proposed by Jo=E3o Paulo Rec=
hi
> > Vita).  As the code for that trigger is not yet merged, I refrained=
 from
> > setting the default_trigger field in struct led_classdev radio_led.
> > Perhaps it's a candidate for a follow-up patch in the future.
>=20
> I haven't found a way to make this work the intended way out of the b=
ox,
> not with the currently available set of LED triggers.  That being sai=
d,
> I would be happy if someone proved me wrong.

Aha, ok.

Thanks,
								Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses=
/blog.html
