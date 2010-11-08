From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 1/2] eeepc-wmi: add additional hotkeys
Date: Sun, 7 Nov 2010 23:18:00 -0800
Message-ID: <20101108071800.GA6977@core.coreip.homeip.net>
References: <4CD7F3F20200002300023745@novprvlin0050.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:52456 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752035Ab0KHHSK (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 8 Nov 2010 02:18:10 -0500
Received: by gxk23 with SMTP id 23so3137228gxk.19
        for <platform-driver-x86@vger.kernel.org>; Sun, 07 Nov 2010 23:18:09 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <4CD7F3F20200002300023745@novprvlin0050.provo.novell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joey Lee <jlee@novell.com>
Cc: chris@cnpbagwell.com, corentin.chary@gmail.com, hadess@hadess.net, yong.y.wang@intel.com, acpi4asus-user@lists.sourceforge.net, Egbert Eich <eich@novell.com>, Stefan Dirsch <sndirsch@novell.com>, kay.sievers@suse.de, platform-driver-x86@vger.kernel.org

On Sun, Nov 07, 2010 at 06:58:26PM -0700, Joey Lee wrote:
> Hi Dmitry,=20
>=20
> =E6=96=BC =E5=85=AD=EF=BC=8C2010-11-06 =E6=96=BC 02:39 -0700=EF=BC=8C=
Dmitry Torokhov =E6=8F=90=E5=88=B0=EF=BC=9A
> > On Sat, Nov 06, 2010 at 08:42:52AM +0100, Corentin Chary wrote:
> > > On Sat, Nov 6, 2010 at 4:02 AM, Chris Bagwell <chris@cnpbagwell.c=
om> wrote:
> > > > On Mon, Oct 11, 2010 at 12:10 PM, Dmitry Torokhov
> > > > <dmitry.torokhov@gmail.com> wrote:
> > > >> On Sunday, October 10, 2010 11:26:22 pm Corentin Chary wrote:
> > > >>> On Mon, Oct 11, 2010 at 3:48 AM,  <chris@cnpbagwell.com> wrot=
e:
> > > >>> > From: Chris Bagwell <chris@cnpbagwell.com>
> > > >>> >
> > > >>> > Added 4 hotkeys using same keymap values as eeepc-latop.
> > > >>> > These are mousepad toggle, resolution change, screen off,
> > > >>> > and task manager.  These were tested on 1005PE and are the
> > > >>> > Fn-F3, F4, F7, and F9, respectively.
> > > >>> >
> > > >>> > Also, added a new hot key for power toggles (Fn-Space on 10=
05PE)
> > > >>> > and is meant to drive cpufv interface from userspace.
> > > >>> >
> > > >>> > Finally, added several keys to be ignored that are being em=
itted
> > > >>> > but do not mapped to any useful or documented hotkeys.  Thi=
s is
> > > >>> > purely cosmetic to prevent uknown key reports on console/lo=
g files.
> > > >>> > These keys are reported on 1005PE's.
> > > >>>
> > > >>> What are exactly these keys ? Since they are probably some ob=
scure Fn+
> > > >>> combo, and they are probably used on another model, I'm not s=
ure we should
> > > >>> hide them.
> > > >>>
> > > >>> I'm still not happy with F13 for "disable touchpad" but I did=
 the same
> > > >>> for other laptops,
> > > >>> and we don't have a key for that ATM.
> > > >>
> > > >> The most sensible way would be to add one then. We just need t=
o decide if
> > > >> it should be a key or a switch.
> > > >>
> > > >
> > > > Motivated by thread on linux-input "Touchpad toggle mess", I ch=
anged
> > > > Fn-F3(toggle touchpad) from KEY_F13 to KEY_F22  With Gnome 2.32
> > > > (Fedora 14), now magically my touchpad toggle works automagical=
ly.
> > > >
> > > > So I'd like to submit a patch to change both eeepc-laptop and
> > > > eeepc-wmi to use KEY_F22 for toggle touchpad to get some immedi=
ate
> > > > benifit.  Any issues with this?  Is F13 doing anything useful b=
y
> > > > default?
> > > >
> > > > I know in this thread and in other thread Dmitry mentioned we s=
hould
> > > > make a KEY_TOUCHPAD_TOGGLE (or whatever name).  I'm probably ju=
st
> > > > smart enough to do that if preferred but don't think I'd be abl=
e to
> > > > take it to the next level and get it translated to
> > > > XF86XK_TouchpadToggle.  Help appreciate in that area.
> > > >
> > > > Chris
> > > >
> > >=20
> > > Hi Chris,
> > > Since 2.6.38 merge window should be in a long time, I think we ha=
ve
> > > the time to ad new keys.
> > >=20
> > > Dimitry, what do you think of :
> > >=20
> > > KEY_TOUCHPAD_TOGGLE 248
> > > KEY_TOUCHPAD_ON            249
> > > KEY_TOUCHPAD_OFF           250
> > >=20
> > > Maybe we should keep these lower keycodes for other stuff, and us=
e
> > > some higher ones ?
> > >=20
> >=20
> > I think we should move them up. Bastien mentioned that X already
> > standardized on F21, 22 and 23 so they will need to remap anyways, =
thus
> > we'll be "wasting" valuable lower scancode estate if we do it this =
way.
> >=20
>=20
> If we move them up to higher keycode.
> Does X-window already support keycode more then 255?
>=20

Not at the moment.

> Actually, I also got problem with our X-window not support
> KEY_DOLLAR(0x1b2) and KEY_EURO(0x1b3).
>=20
> I need use udev or hal to remapping those key to lower keycodes.
>=20
> > The only thing that is left is to feed udev guys with keymaps till =
X is
> > able to take the full scancode trange.
> >=20
>=20
> Sorry I am not clear understood.
> Did you mean we put the key re-mapping to lower keycode in udev until=
 X
> ready for full scancode range?

Yes.

>=20
> Does there have any time line for X window support full scancode rang=
e?

Not that I know of, but this question is better asked on Xorg mailing
lists.

Thanks.

--=20
Dmitry
