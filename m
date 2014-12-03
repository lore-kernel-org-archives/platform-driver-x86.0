From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2] platform: x86: dell-laptop: Add support for keyboard
 backlight
Date: Wed, 3 Dec 2014 04:49:17 -0800
Message-ID: <20141203124916.GA75099@vmdeb7>
References: <1415967813-7223-1-git-send-email-pali.rohar@gmail.com>
 <1416754245-15550-1-git-send-email-pali.rohar@gmail.com>
 <20141203084319.GA52608@vmdeb7>
 <201412050303.49206@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:33690 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933517AbaLECmu (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 4 Dec 2014 21:42:50 -0500
Content-Disposition: inline
In-Reply-To: <201412050303.49206@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, libsmbios-devel@lists.us.dell.com, Srinivas_G_Gowda@dell.com, Michael_E_Brown@dell.com, Gabriele Mazzotta <gabriele.mzt@gmail.com>

On Fri, Dec 05, 2014 at 03:03:49AM +0100, Pali Roh=E1r wrote:
> On Wednesday 03 December 2014 09:43:21 Darren Hart wrote:
> > On Sun, Nov 23, 2014 at 03:50:45PM +0100, Pali Roh=E1r wrote:
> > > This patch adds support for configuring keyboard backlight
> > > settings on supported Dell laptops. It exports kernel leds
> > > interface and uses Dell SMBIOS tokens or keyboard class
> > > interface.
> > >=20
> > > With this patch it is possible to set:
> > > * keyboard backlight level
> > > * timeout after which will be backlight automatically turned
> > > off * input activity triggers (keyboard, touchpad, mouse)
> > > which enable backlight * ambient light settings
> > >=20
> > > Settings are exported via sysfs:
> > > /sys/class/leds/dell::kbd_backlight/
> > >=20
> > > Code is based on newly released documentation by Dell in
> > > libsmbios project.
> >=20
> > Hi Pali,
> >=20
> > I would really like to see this broken up. Possibly adding
> > levels and timeouts as separate patches for example. It is
> > quite difficult to review this all at once in a reasonable
> > amount of time.
> >=20
>=20
> It is really hard to split this patch into more parts which every=20
> one will compile and ideally also work. In my opinion every=20
> single git commit should be possible to compile and should also=20
> work (it helps also other developers to use git bisect).

Of course, that's a given.

>=20
> And because we need to pass all (previous unchanged) values in=20
> smbios call we need to parse all of them.
>=20
> I understand that it could be hard to review long patch, but=20
> there are more parts which interacts and do not work without=20
> other. Also some of settings (e.g keyboard backlight level) could=20
> be changed via different ways (and on some machines only one is=20
> working) and also that smbios keyboard interface has complicated=20
> logic...

I was thinking about how to break it up, and I don't have an obvious an=
swer. I
considered adding a levels interface first and then the mode_levels, bu=
t that's
a lot of work for not much savings. I don't like adding over 1000 lines=
 to a 900
line driver in a single go to add one feature, but I didn't see obvious=
 ways to
a) make it smaller or b) break it up.

So, please incorporate the remaining requested changes, and I'll pull i=
t in.

Patches should really be in next for two weeks before going to Linus fo=
r a
merge. As we're already at rc7, that makes 3.19 a stretch. Get it to me=
 by
tomorrow and I'll queue it up.... but it might not make 3.19.

=46or future patches, please add some additional comments to code that =
is
non-obvious and if there is any way to break the patches up. This will =
expedite
the review process (as this subsystem gets fairly little external revie=
w, you
end up blocked on me).

>=20
> > During this review I caught a few more CodingStyle violations,
> > and raised some questions about the timeout and levels
> > mechanisms.
> >=20
>=20
> I will fix style problems in next v3 patch.
> =20
> What to do with Dan Carpenter patch which fixing kbd_timeout=20
> handling? Should I integrate it into v3? It does not apply on top=20
> of next v3 patch, because there will be new comment about quirk=20
> plus style fixes...

Please include Dan's fix and credit him with it in the commit message. =
Add him
to the Cc list.

Thanks Pali,

--=20
Darren Hart
Intel Open Source Technology Center
