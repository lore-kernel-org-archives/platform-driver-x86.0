From: "Joey Lee" <jlee@novell.com>
Subject: Re: [PATCH 1/2] eeepc-wmi: add additional hotkeys
Date: Sun, 07 Nov 2010 18:58:26 -0700
Message-ID: <4CD7F3F20200002300023745@novprvlin0050.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dmitry.torokhov@gmail.com
Cc: chris@cnpbagwell.com, corentin.chary@gmail.com, hadess@hadess.net, yong.y.wang@intel.com, acpi4asus-user@lists.sourceforge.net, Egbert Eich <eich@novell.com>, Stefan Dirsch <sndirsch@novell.com>, kay.sievers@suse.de, platform-driver-x86@vger.kernel.org

Hi Dmitry,=20

=E6=96=BC =E5=85=AD=EF=BC=8C2010-11-06 =E6=96=BC 02:39 -0700=EF=BC=8CDm=
itry Torokhov =E6=8F=90=E5=88=B0=EF=BC=9A
> On Sat, Nov 06, 2010 at 08:42:52AM +0100, Corentin Chary wrote:
> > On Sat, Nov 6, 2010 at 4:02 AM, Chris Bagwell <chris@cnpbagwell.com=
> wrote:
> > > On Mon, Oct 11, 2010 at 12:10 PM, Dmitry Torokhov
> > > <dmitry.torokhov@gmail.com> wrote:
> > >> On Sunday, October 10, 2010 11:26:22 pm Corentin Chary wrote:
> > >>> On Mon, Oct 11, 2010 at 3:48 AM,  <chris@cnpbagwell.com> wrote:
> > >>> > From: Chris Bagwell <chris@cnpbagwell.com>
> > >>> >
> > >>> > Added 4 hotkeys using same keymap values as eeepc-latop.
> > >>> > These are mousepad toggle, resolution change, screen off,
> > >>> > and task manager.  These were tested on 1005PE and are the
> > >>> > Fn-F3, F4, F7, and F9, respectively.
> > >>> >
> > >>> > Also, added a new hot key for power toggles (Fn-Space on 1005=
PE)
> > >>> > and is meant to drive cpufv interface from userspace.
> > >>> >
> > >>> > Finally, added several keys to be ignored that are being emit=
ted
> > >>> > but do not mapped to any useful or documented hotkeys.  This =
is
> > >>> > purely cosmetic to prevent uknown key reports on console/log =
files.
> > >>> > These keys are reported on 1005PE's.
> > >>>
> > >>> What are exactly these keys ? Since they are probably some obsc=
ure Fn+
> > >>> combo, and they are probably used on another model, I'm not sur=
e we should
> > >>> hide them.
> > >>>
> > >>> I'm still not happy with F13 for "disable touchpad" but I did t=
he same
> > >>> for other laptops,
> > >>> and we don't have a key for that ATM.
> > >>
> > >> The most sensible way would be to add one then. We just need to =
decide if
> > >> it should be a key or a switch.
> > >>
> > >
> > > Motivated by thread on linux-input "Touchpad toggle mess", I chan=
ged
> > > Fn-F3(toggle touchpad) from KEY_F13 to KEY_F22  With Gnome 2.32
> > > (Fedora 14), now magically my touchpad toggle works automagically=
=2E
> > >
> > > So I'd like to submit a patch to change both eeepc-laptop and
> > > eeepc-wmi to use KEY_F22 for toggle touchpad to get some immediat=
e
> > > benifit.  Any issues with this?  Is F13 doing anything useful by
> > > default?
> > >
> > > I know in this thread and in other thread Dmitry mentioned we sho=
uld
> > > make a KEY_TOUCHPAD_TOGGLE (or whatever name).  I'm probably just
> > > smart enough to do that if preferred but don't think I'd be able =
to
> > > take it to the next level and get it translated to
> > > XF86XK_TouchpadToggle.  Help appreciate in that area.
> > >
> > > Chris
> > >
> >=20
> > Hi Chris,
> > Since 2.6.38 merge window should be in a long time, I think we have
> > the time to ad new keys.
> >=20
> > Dimitry, what do you think of :
> >=20
> > KEY_TOUCHPAD_TOGGLE 248
> > KEY_TOUCHPAD_ON            249
> > KEY_TOUCHPAD_OFF           250
> >=20
> > Maybe we should keep these lower keycodes for other stuff, and use
> > some higher ones ?
> >=20
>=20
> I think we should move them up. Bastien mentioned that X already
> standardized on F21, 22 and 23 so they will need to remap anyways, th=
us
> we'll be "wasting" valuable lower scancode estate if we do it this wa=
y.
>=20

If we move them up to higher keycode.
Does X-window already support keycode more then 255?

Actually, I also got problem with our X-window not support
KEY_DOLLAR(0x1b2) and KEY_EURO(0x1b3).

I need use udev or hal to remapping those key to lower keycodes.

> The only thing that is left is to feed udev guys with keymaps till X =
is
> able to take the full scancode trange.
>=20

Sorry I am not clear understood.
Did you mean we put the key re-mapping to lower keycode in udev until X
ready for full scancode range?

Does there have any time line for X window support full scancode range?


Thank's a lot!
Joey Lee
