From: Seth Forshee <seth.forshee@canonical.com>
Subject: Re: [PATCH 2/2] eeepc-wmi: Add support for T101MT Home/Express Gate
 key
Date: Fri, 25 Mar 2011 10:13:10 -0500
Message-ID: <20110325151310.GB14328@thinkpad-t410>
References: <20110324195720.GB31713@thinkpad-t410>
 <1300997035-14104-2-git-send-email-seth.forshee@canonical.com>
 <AANLkTimF2UR8BVQW-3YJaGFEz39q8ydESAiMOjmdM1X7@mail.gmail.com>
 <20110325135311.GA14328@thinkpad-t410>
 <AANLkTin3MDYdL6x1Qs8Q9oMMgDMfsoO2GjWMJO_65GAR@mail.gmail.com>
 <AANLkTi=iWeKVww_XPm0PQa09NLtPCo4wvz7ZYkk1ajhQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from adelie.canonical.com ([91.189.90.139]:51728 "EHLO
	adelie.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750922Ab1CYPNW (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 25 Mar 2011 11:13:22 -0400
Content-Disposition: inline
In-Reply-To: <AANLkTi=iWeKVww_XPm0PQa09NLtPCo4wvz7ZYkk1ajhQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Chris Bagwell <chris@cnpbagwell.com>, Corentin Chary <corentin.chary@gmail.com>
Cc: Matthew Garrett <mjg@redhat.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>

On Fri, Mar 25, 2011 at 09:53:20AM -0500, Chris Bagwell wrote:
> On Fri, Mar 25, 2011 at 9:05 AM, Corentin Chary
> <corentin.chary@gmail.com> wrote:
> > On Fri, Mar 25, 2011 at 1:53 PM, Seth Forshee
> > <seth.forshee@canonical.com> wrote:
> >> On Fri, Mar 25, 2011 at 01:28:30PM +0000, Corentin Chary wrote:
> >>> > +static void eeepc_wmi_key_filter(struct asus_wmi_driver *asus_=
wmi, int *code,
> >>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int *value, int *autor=
elease)
> >>> > +{
> >>> > + =C2=A0 =C2=A0 =C2=A0 struct eeepc_wmi_driver *eeepc =3D to_ee=
epc_wmi_driver(asus_wmi);
> >>> > + =C2=A0 =C2=A0 =C2=A0 int is_press;
> >>> > +
> >>> > + =C2=A0 =C2=A0 =C2=A0 /*
> >>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0* The following behavior is used f=
or T101MT "Home" key:
> >>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0*
> >>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0* =C2=A0 On press: =C2=A0 No event=
 set
> >>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0* =C2=A0 On hold: =C2=A0 =C2=A0KEY=
_PROG2 press sent once w/o autorelease
> >>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0* =C2=A0 On release: If key was he=
ld, KEY_PROG2 release sent.
> >>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0* =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 Otherwise KEY_HOME press sent w/ autorelease.
> >>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0*
> >>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0* The simple state machine below i=
mplements this behavior.
> >>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
> >>> > + =C2=A0 =C2=A0 =C2=A0 switch (*code) {
> >>> > + =C2=A0 =C2=A0 =C2=A0 case HOME_PRESS:
> >>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 eeepc->home_=
key_state =3D HOME_PRESS;
> >>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *code =3D AS=
US_WMI_KEY_IGNORE;
> >>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> >>> > + =C2=A0 =C2=A0 =C2=A0 case HOME_HOLD:
> >>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (eeepc->h=
ome_key_state =3D=3D HOME_HOLD) {
> >>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 *code =3D ASUS_WMI_KEY_IGNORE;
> >>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {
> >>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 eeepc->home_key_state =3D HOME_HOLD;
> >>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 *value =3D 1;
> >>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 *autorelease =3D 0;
> >>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> >>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> >>> > + =C2=A0 =C2=A0 =C2=A0 case HOME_RELEASE:
> >>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (eeepc->h=
ome_key_state =3D=3D HOME_RELEASE) {
> >>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 dev_warn(&asus_wmi->platform_device->dev,
> >>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"Unexpected home key r=
elease event\n");
> >>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 *code =3D ASUS_WMI_KEY_IGNORE;
> >>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {
> >>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 *code =3D eeepc->home_key_state;
> >>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 eeepc->home_key_state =3D HOME_RELEASE;
> >>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 is_press =3D (*code =3D=3D HOME_PRESS);
> >>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 *value =3D is_press;
> >>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 *autorelease =3D is_press;
> >>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> >>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> >>> > + =C2=A0 =C2=A0 =C2=A0 }
> >>> > +}
> >>> > +
> >>>
> >>> Why not something simpler like this ?
> >>>
> >>> static void eeepc_wmi_key_filter(struct asus_wmi_driver *asus_wmi=
, int code,
> >>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int *value, int *autorelease)
> >>> {
> >>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (code =3D=3D 0xe4) {
> >>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *value =3D=
 1;
> >>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *autorele=
ase =3D 0;
> >>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (code =3D=3D 0xe5) {
> >>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *value =3D=
 0;
> >>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *autorele=
ase =3D 0;
> >>> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> >>> }
> >>>
> >>> with this keymap :
> >>>
> >>> =C2=A0 =C2=A0 =C2=A0 =C2=A0{ KE_KEY, 0xe4, { KEY_HOME } }, /* Hom=
e Key Down */
> >>> =C2=A0 =C2=A0 =C2=A0 =C2=A0{ KE_KEY, 0xe5, { KEY_HOME } }, /* Hom=
e Key Up */
> >>> =C2=A0 =C2=A0 =C2=A0 =C2=A0{ KE_KEY, 0xea, { KEY_PROG2 } }, /* Ho=
me Key hold more than one second */
> >>>
> >>>
> >>> This sounds simpler and we don't loose information (key down and =
key
> >>> up both event reported at the right time).
> >>> 0xe5 is *always* sent after 0xe4 right ?
> >>
> >> I guess it depends on what key events we want on a press-and-hold.
> >> Remember that you're going to get a scan code sequence like "0xe4 =
0xea
> >> 0xea ... 0xea 0xe5", so with my implementation you get
> >>
> >> =C2=A0KEY_PROG2 press
> >> =C2=A0KEY_PROG2 release
> >>
> >> With yours
> >>
> >> =C2=A0KEY_HOME press
> >> =C2=A0KEY_PROG2 press
> >> =C2=A0KEY_PROG2 release
> >> =C2=A0// KEY_PROG2 press/release repeats every 0.5 secs while butt=
on held
> >> =C2=A0KEY_HOME release
> >>
> >> At minimum I'd think we'd want to only send a single PROG2 press/r=
elease
> >> for button hold. My thought was that you'd only want to get the co=
de for
> >> 0xe4 or 0xea, not both, but I suppose that's debatable.
> >
> > If you keep a keyboard key pressed, you want multiple events, not o=
ne right ?
> > I think it's important not to loose informations. If someone keep t=
his
> > key pressed more than 1.5 second, I think it's good idea to send
> > multiple KEY_PROG2.
> >
> > About KEY_HOME press / release, and filtering KEY_HOME after
> > KEY_PROG2, I'm not sure. So if you really want it, and nobody
> > complains, I'll be happy to accept your patch.
>=20
> Here is how I envision using these keys.  I wanted to map quick press
> to GNOME3/KDE4/Unity's Activities menu and map press-and-hold to
> script that rotates screen.  I like the repeating of rotates but I
> didn't really want a rotate to also force a pop up of the activities
> menu.

I've been experimenting with different keyboards a bit, and I basically
see two different behaviours.

  1. Standard keys and some hotkeys - These tend to send a press event
     followed by a short delay, followed by rapidly-repeating press
     events. I.e. what you normally see when you are typing. For hotkey=
s
     userspace seems to only act upon the release event.

  2. Some hotkeys only seem to send a single scan code when the key is
     released (this seems to be the case with most of the T101MT
     hotkeys). In these cases the drivers send a press followed
     immediately by a release.

So I'm starting to think that the most natural way to handle this is to
treat it as a single key with a couple of special flags (bit 3 =3D repe=
at
event and bit 0 =3D release event). I.e. we only send on keycode and th=
e
filter code just clears the flag bits, clears autorelease, and decides
whether to send a press or release, if (code & ~0x09) =3D=3D 0xe4. Then
userspace could map seperate events on press and hold if desired.

In any case I don't think multiple repeat events while the button is
held is the right thing to do.

> >> And back to the question of KEY_HOME -- that's not really what you=
 want,
> >> is it? As in "move cursor to start of line"?
> >
> > Ho .. right, that's what mean KEY_HOME :/. So no, I don't want that=
=2E..
> > What about:
> > - KEY_CYCLEWINDOWS
> > - KEY_COMPUTER
> > - KEY_HOMEPAGE
> > - KEY_DASHBOARD
> >
> > I think KEY_HOMEPAGE is the best choice.
>=20
> I've only had limited time to look more.  So far, I found under udev =
a
> toshiba tablet that maps what is probably a rotate button to
> KEY_DIRECTION so thats one option for it instead of KEY_PROG2.  I
> couldn't find anybody using that though.
>=20
> I see in /usr/share/X11/symbols/inet:
>=20
>     key <I162>   {      [ XF86RotateWindows     ]       };
>=20
> and in /usr/share/X11/xkb/symbols/evdev:
>=20
> xkb/keycodes/evdev:     <I162> =3D 162;   // #define KEY_CYCLEWINDOWS=
        154
>=20
> Looks like KEY_CYCLEWINDOWS is already hooked up to
> gnome-settings-daemon to auto-rotate screen?
>=20
> I ran into total dead end for finding a pre-existing example of home
> button usage.  I'm really surprised we do not yet have a KEY_LAUNCHER
> or similar because so many tablet PCs/smartphones/pads do have a
> button with this specific concept of "bring up your icon based
> application launcher".

That seems to map well onto the idea of the Windows button, which iirc
maps to KEY_LEFTMETA or KEY_RIGHMETA.

>=20
> To add to your list, I'll also throw out:
>=20
> - KEY_MENU
> - KEY_EXIT (smartphones sometime mean this)
> - KEY_PROG3 (basically all that Windows is doing)
> - KEY_LAUNCHER (why not be the first to finally create it!)
>=20
> I vote for either KEY_PROG3 or KEY_HOMEPAGE for at least short term.
>=20
> Chris
>=20
