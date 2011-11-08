From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: Linux 3.2-rc1
Date: Tue, 8 Nov 2011 20:15:07 +0000
Message-ID: <20111108201507.GA16883@srcf.ucam.org>
References: <CA+55aFzytqbGcOzWvYAo-EnJCeK5mFqdCF5OjMTeM5UBfeyCXw@mail.gmail.com>
 <CAKWSe6Dr7G3TgeMiff=hrT1bMc+StnXdtW0MEmQcuA5yFOWJYw@mail.gmail.com>
 <CA+55aFyojS9n=jP07X2BcxZ5z8YkBaZnNnthTs8xBkdtBdK1XA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:50577 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750769Ab1KHUPK (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 8 Nov 2011 15:15:10 -0500
Content-Disposition: inline
In-Reply-To: <CA+55aFyojS9n=jP07X2BcxZ5z8YkBaZnNnthTs8xBkdtBdK1XA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Alessandro Suardi <alessandro.suardi@gmail.com>, platform-driver-x86@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Nov 08, 2011 at 12:13:16PM -0800, Linus Torvalds wrote:
> On Tue, Nov 8, 2011 at 6:53 AM, Alessandro Suardi
> <alessandro.suardi@gmail.com> wrote:
> >
> > Dell laptop support (and I'd suspect other drivers using LED suppor=
t)
> > =A0doesn't build with undefined LED-related functions, as in:
> >
> > ERROR: "led_classdev_unregister" [drivers/platform/x86/dell-laptop.=
ko]
> > undefined!
> > ERROR: "led_classdev_register" [drivers/platform/x86/dell-laptop.ko=
] undefined!
> > make[1]: *** [__modpost] Error 1
> > make: *** [modules] Error 2
> >
> > It's enough to configure NEW_LEDS (unneeded in 3.1.0) to allow the =
build to go
> > =A0through; maybe NEW_LEDS should be auto-selected in Kconfig by dr=
ivers that
> > =A0make use of led_classdev_* functions ?
>=20
> Yeah, that sounds like the right fix. There are a lot of "select
> NEW_LEDS" around already, but apparently not the Dell driver.

Sorry, missed that change. Yes, that sounds completely reasonable.

--=20
Matthew Garrett | mjg59@srcf.ucam.org
