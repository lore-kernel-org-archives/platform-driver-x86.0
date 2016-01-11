From: Johannes Stezenbach <js@sig21.net>
Subject: Re: [PATCH] thinkpad_acpi: Add support for keyboard backlight
Date: Mon, 11 Jan 2016 22:12:28 +0100
Message-ID: <20160111211228.GA4171@sig21.net>
References: <1450982818-11694-1-git-send-email-pali.rohar@gmail.com>
 <20160111190411.GE10643@malice.jf.intel.com>
 <1452540480.2848000.489039714.26068C20@webmail.messagingengine.com>
 <201601112103.01145@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201601112103.01145@pali>
Sender: linux-kernel-owner@vger.kernel.org
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Pavel Machek <pavel@ucw.cz>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Fabio D'Urso <fabiodurso@hotmail.it>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Jan 11, 2016 at 09:03:01PM +0100, Pali Roh=E1r wrote:
> On Monday 11 January 2016 20:28:00 Henrique de Moraes Holschuh wrote
> > The two features are not the same (and are handled differently by t=
he
> > firmware, for whatever reason), although they do serve the same
> > purpose. I don't think a thinkpad will ever have both features at
> > the same time, so I have no idea why they changed the firmware
> > interface.
=2E..
> And more important, I was told that ThinkPad x230 comes in variant wi=
th=20
> both ThinkLight (that LED upper the display) and keyboard backlight=20
> (under they keyboard).

I can confirm this, my x230 has both.  FWIW, BIOS hotkey
=46n+Space cycles through off, dim backlight, full backlight
and full thinklight. /sys/class/leds/tpacpi::thinklight/brightness
can be read (showing either 0 or 255) but writes are ignored.
Dito for /proc/acpi/ibm/light.

Johannes
