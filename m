From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2] thinkpad_acpi: Add support for keyboard backlight
Date: Mon, 4 Jan 2016 13:42:00 -0800
Message-ID: <20160104214200.GE4219@malice.jf.intel.com>
References: <1450982818-11694-1-git-send-email-pali.rohar@gmail.com>
 <201601042126.19417@pali>
 <20160104204020.GC4219@malice.jf.intel.com>
 <201601042151.23995@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201601042151.23995@pali>
Sender: linux-kernel-owner@vger.kernel.org
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Fabio D'Urso <fabiodurso@hotmail.it>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Jan 04, 2016 at 09:51:23PM +0100, Pali Roh=E1r wrote:
> On Monday 04 January 2016 21:40:20 Darren Hart wrote:
> > On Mon, Jan 04, 2016 at 09:26:19PM +0100, Pali Roh=E1r wrote:
> > > On Monday 04 January 2016 21:04:25 Darren Hart wrote:
> > > > On Wed, Dec 30, 2015 at 11:27:41PM +0100, Pali Roh=E1r wrote:
> > > > > This patch adds support for controlling keyboard backlight vi=
a
> > > > > standard linux led class interface (::kbd_backlight). It uses
> > > > > ACPI HKEY device with MLCG and MLCS methods.
> > > >=20
> > > > Which laptops is this intended to support?
> > >=20
> > > Thinkpad ??30 series and new which have backlight keyboard.
> >=20
> > Thanks, we should include that in the commit message as well as the
> > comments surrounding the driver section.
>=20
> ??30 is probably not good characteristic, but I mean all those Thinkp=
ad=20
> laptops like T430, x230, E430, X1 (1st) and their successors (T440,=20
> T450, X1 3rd, ...) All those which are from Ivy Bridge processor=20
> generation (and new).
>=20
> But basically it cover all Thinkpad laptops which have backlight=20
> keyboard. Older Thinkpad laptops had only light in bezel.
>=20
> So if you have better idea for commit message, feel free to change it=
=2E

Ah, I see. New feature that didn't exist previously. OK, no need for ch=
anges on
that score then.



--=20
Darren Hart
Intel Open Source Technology Center
