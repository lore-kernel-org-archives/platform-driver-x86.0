From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] thinkpad_acpi: Add support for keyboard backlight
Date: Wed, 13 Jan 2016 20:10:30 +0100
Message-ID: <20160113191030.GE9821@amd>
References: <1450982818-11694-1-git-send-email-pali.rohar@gmail.com>
 <20160111190411.GE10643@malice.jf.intel.com>
 <1452540480.2848000.489039714.26068C20@webmail.messagingengine.com>
 <201601112103.01145@pali>
 <20160112215804.GA12869@amd>
 <20160113085455.GD11560@pali>
 <20160113190736.GD9821@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160113190736.GD9821@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Fabio D'Urso <fabiodurso@hotmail.it>
List-Id: platform-driver-x86.vger.kernel.org

On Wed 2016-01-13 20:07:36, Pavel Machek wrote:
> On Wed 2016-01-13 09:54:55, Pali Roh=E1r wrote:
> > On Tuesday 12 January 2016 22:58:04 Pavel Machek wrote:
> > > Hi!
> > >=20

> > > Next question is.. apparently there are some keyboards that have
> > > per-key RGB backlight... but maybe we can just call that "weird
> > > enough" and ignore...
> >=20
> > First we need to defines stable kernel ABI for keyboard backlight. =
And I
> > suggest to use existing convention used by upower/console-kit and o=
ther
> > userspace apps...
>=20
> Hmm... I'm not sure that can be done. What were the masks used by
> upower again? Will upower write to all 6 leds if we present them?

Got it...

It has function up_kbd_backlight_find() which do:

        /* find a led device that is a keyboard device */
	        while ((filename =3D g_dir_read_name (dir)) !=3D NULL) {
		                if (g_strstr_len (filename, -1, "kbd_backlight") !=3D=
 NULL) {
		                        dir_path =3D g_build_filename ("/sys/class/le=
ds",
		                                                    filename,
								    	        NULL);
		                        break;
							=09
That suggests that it stops at the first matching device. Adding new
"virtual" led controlling 6 physical leds would be ugly. So... new
interface should be done.

								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses=
/blog.html
