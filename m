From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 1/2] eeepc-wmi: add additional hotkeys
Date: Sat, 6 Nov 2010 02:39:25 -0700
Message-ID: <20101106093922.GA16595@core.coreip.homeip.net>
References: <1286761702-4304-1-git-send-email-chris@cnpbagwell.com>
 <AANLkTin3J3oOaYD8G=YSrBr0AKzw7mY7v0BQssw5z2Z6@mail.gmail.com>
 <201010111010.06057.dmitry.torokhov@gmail.com>
 <AANLkTikveAxYe-=hg61XRB3sWUpaKBzbqEGX9eACFpiD@mail.gmail.com>
 <AANLkTikptRG4oTiS71Pe0LbAYxUTbisDq3XrzeDRO2=a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:35885 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753947Ab0KFJjn (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 6 Nov 2010 05:39:43 -0400
Received: by iwn41 with SMTP id 41so1843351iwn.19
        for <platform-driver-x86@vger.kernel.org>; Sat, 06 Nov 2010 02:39:42 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <AANLkTikptRG4oTiS71Pe0LbAYxUTbisDq3XrzeDRO2=a@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: Chris Bagwell <chris@cnpbagwell.com>, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, yong.y.wang@intel.com, Bastien Nocera <hadess@hadess.net>

On Sat, Nov 06, 2010 at 08:42:52AM +0100, Corentin Chary wrote:
> On Sat, Nov 6, 2010 at 4:02 AM, Chris Bagwell <chris@cnpbagwell.com> =
wrote:
> > On Mon, Oct 11, 2010 at 12:10 PM, Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> >> On Sunday, October 10, 2010 11:26:22 pm Corentin Chary wrote:
> >>> On Mon, Oct 11, 2010 at 3:48 AM, =A0<chris@cnpbagwell.com> wrote:
> >>> > From: Chris Bagwell <chris@cnpbagwell.com>
> >>> >
> >>> > Added 4 hotkeys using same keymap values as eeepc-latop.
> >>> > These are mousepad toggle, resolution change, screen off,
> >>> > and task manager. =A0These were tested on 1005PE and are the
> >>> > Fn-F3, F4, F7, and F9, respectively.
> >>> >
> >>> > Also, added a new hot key for power toggles (Fn-Space on 1005PE=
)
> >>> > and is meant to drive cpufv interface from userspace.
> >>> >
> >>> > Finally, added several keys to be ignored that are being emitte=
d
> >>> > but do not mapped to any useful or documented hotkeys. =A0This =
is
> >>> > purely cosmetic to prevent uknown key reports on console/log fi=
les.
> >>> > These keys are reported on 1005PE's.
> >>>
> >>> What are exactly these keys ? Since they are probably some obscur=
e Fn+
> >>> combo, and they are probably used on another model, I'm not sure =
we should
> >>> hide them.
> >>>
> >>> I'm still not happy with F13 for "disable touchpad" but I did the=
 same
> >>> for other laptops,
> >>> and we don't have a key for that ATM.
> >>
> >> The most sensible way would be to add one then. We just need to de=
cide if
> >> it should be a key or a switch.
> >>
> >
> > Motivated by thread on linux-input "Touchpad toggle mess", I change=
d
> > Fn-F3(toggle touchpad) from KEY_F13 to KEY_F22 =A0With Gnome 2.32
> > (Fedora 14), now magically my touchpad toggle works automagically.
> >
> > So I'd like to submit a patch to change both eeepc-laptop and
> > eeepc-wmi to use KEY_F22 for toggle touchpad to get some immediate
> > benifit. =A0Any issues with this? =A0Is F13 doing anything useful b=
y
> > default?
> >
> > I know in this thread and in other thread Dmitry mentioned we shoul=
d
> > make a KEY_TOUCHPAD_TOGGLE (or whatever name). =A0I'm probably just
> > smart enough to do that if preferred but don't think I'd be able to
> > take it to the next level and get it translated to
> > XF86XK_TouchpadToggle. =A0Help appreciate in that area.
> >
> > Chris
> >
>=20
> Hi Chris,
> Since 2.6.38 merge window should be in a long time, I think we have
> the time to ad new keys.
>=20
> Dimitry, what do you think of :
>=20
> KEY_TOUCHPAD_TOGGLE 248
> KEY_TOUCHPAD_ON            249
> KEY_TOUCHPAD_OFF           250
>=20
> Maybe we should keep these lower keycodes for other stuff, and use
> some higher ones ?
>=20

I think we should move them up. Bastien mentioned that X already
standardized on F21, 22 and 23 so they will need to remap anyways, thus
we'll be "wasting" valuable lower scancode estate if we do it this way.

The only thing that is left is to feed udev guys with keymaps till X is
able to take the full scancode trange.

Thanks.

--=20
Dmitry
