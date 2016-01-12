From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH] thinkpad_acpi: Add support for keyboard backlight
Date: Tue, 12 Jan 2016 14:07:10 -0200
Message-ID: <1452614830.376787.489968026.5FAEDB86@webmail.messagingengine.com>
References: <1450982818-11694-1-git-send-email-pali.rohar@gmail.com>
 <20160111190411.GE10643@malice.jf.intel.com>
 <1452540480.2848000.489039714.26068C20@webmail.messagingengine.com>
 <201601112103.01145@pali> <20160111211228.GA4171@sig21.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160111211228.GA4171@sig21.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Johannes Stezenbach <js@sig21.net>, =?ISO-8859-1?Q?Pali=20Roh=E1r?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Pavel Machek <pavel@ucw.cz>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Fabio D'Urso <fabiodurso@hotmail.it>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Jan 11, 2016, at 19:12, Johannes Stezenbach wrote:
> On Mon, Jan 11, 2016 at 09:03:01PM +0100, Pali Roh=E1r wrote:
> > On Monday 11 January 2016 20:28:00 Henrique de Moraes Holschuh wrot=
e
> > > The two features are not the same (and are handled differently by=
 the
> > > firmware, for whatever reason), although they do serve the same
> > > purpose. I don't think a thinkpad will ever have both features at
> > > the same time, so I have no idea why they changed the firmware
> > > interface.
> ...
> > And more important, I was told that ThinkPad x230 comes in variant =
with=20
> > both ThinkLight (that LED upper the display) and keyboard backlight=
=20
> > (under they keyboard).
>=20
> I can confirm this, my x230 has both.  FWIW, BIOS hotkey
> Fn+Space cycles through off, dim backlight, full backlight
> and full thinklight. /sys/class/leds/tpacpi::thinklight/brightness
> can be read (showing either 0 or 255) but writes are ignored.
> Dito for /proc/acpi/ibm/light.

We likely need to integrate better (future work) the new backlight
control with the thinklight control and the firmware interface in the
x230.

Is the ACPI AML for fn+space readable enough, or is it trapping directl=
y
into SMM?  Because if it interacts with the traditional higher-level
ACPI AML we already use to talk to the thinklight (and now to the
backlight), it should be relatively easy to fix the driver to better
support the x230.

--=20
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
