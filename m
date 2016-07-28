From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] dell-wmi: Add events created by Dell Rugged 2-in-1s
Date: Thu, 28 Jul 2016 11:49:30 -0700
Message-ID: <20160728184930.GF16852@dtor-ws>
References: <1469217684-6643-1-git-send-email-mario_limonciello@dell.com>
 <201607271805.57123@pali>
 <13ec06e37e284263b6bf4fe4a6a04a78@ausx13mpc120.AMER.DELL.COM>
 <201607272215.12385@pali>
 <20160727224338.GA36353@f23x64.localdomain>
 <CAKdAkRRG8DwofYxcGe8dQmFAg86b8gcWM3pMAp0pv=VwBO-ZQg@mail.gmail.com>
 <be8bbf443c804fde8ebf5e9c237ce83f@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <be8bbf443c804fde8ebf5e9c237ce83f@ausx13mpc120.AMER.DELL.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario_Limonciello@Dell.com
Cc: dvhart@infradead.org, pali.rohar@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Jul 28, 2016 at 03:52:11PM +0000, Mario_Limonciello@Dell.com wr=
ote:
> > -----Original Message-----
> > From: Dmitry Torokhov [mailto:dmitry.torokhov@gmail.com]
> > Sent: Wednesday, July 27, 2016 6:08 PM
> > To: Darren Hart <dvhart@infradead.org>
> > Cc: Pali Roh=E1r <pali.rohar@gmail.com>; Limonciello, Mario
> > <Mario_Limonciello@Dell.com>; lkml <linux-kernel@vger.kernel.org>;
> > platform-driver-x86@vger.kernel.org
> > Subject: Re: [PATCH] dell-wmi: Add events created by Dell Rugged 2-=
in-1s
> >=20
> > Hi Darren,
> >=20
> > On Wed, Jul 27, 2016 at 3:43 PM, Darren Hart <dvhart@infradead.org>=
 wrote:
> > > Dmitry, we'd appreciate your thoughts as the input maintainer on =
a
> > question
> > > below (left the thread in tact so you have all the context).
> > >
> > > On Wed, Jul 27, 2016 at 10:15:12PM +0200, Pali Roh=E1r wrote:
> > >> On Wednesday 27 July 2016 21:03:57 Mario_Limonciello@dell.com wr=
ote:
> > >> > > -----Original Message-----
> > >> > > From: Pali Roh=E1r [mailto:pali.rohar@gmail.com]
> > >> > > Sent: Wednesday, July 27, 2016 11:06 AM
> > >> > > To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> > >> > > Cc: dvhart@infradead.org; linux-kernel@vger.kernel.org;
> > >> > > platform-driver- x86@vger.kernel.org
> > >> > > Subject: Re: [PATCH] dell-wmi: Add events created by Dell Ru=
gged
> > >> > > 2-in-1s
> > >> > >
> > >> > > On Wednesday 27 July 2016 17:55:09 Mario_Limonciello@dell.co=
m
> > wrote:
> > >> > > > > Hi! I'm not sure if KEY_PROG1/2/3 are good names here as=
 we
> > >> > > > > already use
> > >> > > > >
> > >> > > > >those for other actions (see bios_to_linux_keycode). Also=
 there
> > >> > > > >is:
> > >> > > > I had missed this, do you have some recommendations on wha=
t
> > would
> > >> > > > be better codes to map this to?
> > >> > >
> > >> > > Problem is that I do not know when those KEY_PROG keys from
> > >> > > bios_to_linux_keycode table are emitted. There are missing
> > comments
> > >> > > or description.
> > >> > >
> > >> > > Are you able to find out description for all those keys in t=
hat
> > >> > > table? Maybe now (when linux key constants are extended), th=
ere
> > >> > > could be better candidates...
> > >> >
> > >> > I'll ask around.  It's not immediately obvious to me though, m=
aybe
> > >> > from old specs?
> > >>
> > >> Do not know if it is old. At least some codes from it are used o=
n my
> > >> E6440 machine. Table itself was added by Rezwanul Kabir in this =
commit:
> > >>
> > >>
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/com=
mit/?id=3D5e
> > a2559726b786283236835dc2905c23b36ac91c
> > >>
> > >> Maybe commit message could help you to indentify what it is...
> > >>
> > >> > > > I'll double check what the things that "were" mapping to
> > >> > > > KEY_PROG1 etc actually were.  This might be a case of an
> > >> > > > expected clash if the functions aren't in current generati=
ons.
> > >> > > >
> > >> > > > >/* Wifi Catcher */
> > >> > > > >
> > >> > > > > { KE_KEY,    0xe011, { KEY_PROG2 } },
> > >> > > >
> > >> > > > It's worth mentioning that Wifi Catcher hasn't been used f=
or any
> > >> > > > Dell laptops for a handful generations.  The rugged 2in1's=
 are
> > >> > > > current generation that have these programmable buttons an=
d
> > >> > > > don't have wifi catcher.
> > >> > >
> > >> > > Anyway, what is "Wifi Catcher"? HW switch buttton which
> > >> > > enable/disable wifi? Or something else?
> > >> >
> > >> > Wifi catcher was a special hardware switch slider switch.  Whe=
n the
> > >> > machine was turned in S3 the sliding the switch beyond the on
> > >> > position would scan for available wifi networks and light up a=
n LED
> > >> > if some from your predefined list were found.
> > >> >
> > >> > When the machine was on, it would open up the applet that let =
you
> > >> > configure the behavior for the switch in S3.
> > >>
> > >> Hm... maybe it better fit KEY_WLAN then? Just speculation.
> > >>
> > >> > > > So there should be no "real" clash here.
> > >> > >
> > >> > > Problem can be in future. This driver is unified for all Del=
l
> > >> > > products with wmi interface and so future product could do s=
ome
> > >> > > nasty things...
> > >> >
> > >> > I agree with Darren here.
> > >> >
> > >> > At least on Dell side we're creating new codes for "new" butto=
ns and
> > >> > the limitation is really on the kernel side for how many KEY_P=
ROG#
> > >> > or similar functions they can be re-assigned to.
> > >>
> > >> Ok.
> > >>
> > >> > Maybe it's time to think of another way to get this informatio=
n to
> > >> > userspace rather that always translating them into key codes?
> > >>
> > >> If event is generated by pressing key, button or hw switch, then=
 input
> > >> key is correct way. If there is no KEY define which fit for new =
vendor
> > >> hw button, then I think we should start discussion with input su=
bsystem
> > >> how to handle such situation.
> > >>
> > >> > There's a lot that are marked as KE_IGNORE because the kernel =
can't
> > >> > do anything interesting with them as no 1-1 mapping exists to =
a
> > >> > keycode.
> > >>
> > >> Most marked as KE_IGNORE are because duplicate event is sent via
> > >> keyboard controller or via other subsystem (e.g. rfkill).
> > >>
> > >> But events which are not keys or buttons should not be sent via =
input
> > >> devices. At least I think it is against usage of input devices.
> > >>
> > >> Events like "battery was removed" or "keyboard backlight was cha=
nged"
> > or
> > >> "battery lifetime decreased under X %" can be useful for userspa=
ce
> > >> applications. I agree. But I think we do not have any subsystem =
or
> > >> interface for sending them from kernel to userspace.
> > >>
> > >> If we start talking about creating interface for it, I would rat=
her see
> > >> something more generic, not Dell-only specific or created specia=
lly for
> > >> Dell machines which will not fit for others...
> > >>
> > >> Darren, what do you think about it?
> > >
> > > It sounds like a good Kernel Summit topic... and they just happen=
 to have
> > the
> > > call for topics going on right now... first step would be to get =
the input
> > > maintainers thoughts...
> > >
> > > +Dmitry Torokhov
> > >
> > > Dmitry, what are your thoughts with respect to handing events up =
to
> > userspace
> > > which are not strictly key presses via the input system? Pali's s=
uggestion
> > makes
> > > sense to me - do you think this is something we should discuss at=
 KS... or is
> > > this already decided and can you set us straight?
> >=20
> > So here is what I believe:
> >=20
> > - Stuff that are not keys/buttons/switches/other bits of hardware
> > directly manipulated by user, but rather state change notifications
> > should not be delivered via input subsystem
>=20
> Yeah this matches existing kernel documentation too.
>=20
> >=20
> > - Even if something is a key/button/switch it does not necessarily
> > need to be sent through input subsystem or we may want to wait unti=
l
> > we add a new input event. This is because vendors love to come up w=
ith
> > "value add" features that require vendor specific driver that noone
> > ends up using. I mean, for the "WiFi catcher" do you have any kind =
of
> > numbers for the users of the feature?
>=20
> Like I said, this particular feature hasn't been in use for quite a f=
ew generations. =20
> In its time it was deemed "beneficial" in that day because of the amo=
unt of time it=20
> took for waking up the machine only to determine there was no availab=
le wifi nearby.
> It's been superseded by other technology improvements.
>=20
> There are other types of "notification" only events that could be use=
ful to userspace.
> I don't think they need to all be generally demonized with the connot=
ation as a negative=20
> vendor specific value add, there are plenty of generic things that us=
erspace could notify on

Generic things should find a specific system they are part of (i.e. wif=
i
notifications -> rflill, wifi switching -> input, etc), it is one-off
that "sounded good" but are hard to discover by user and nobody ends up
using that I am demonizing.

> that are essentially "killed" at the WMI driver today.
>=20
> Here's a few I find:
> "Keyboard illumination toggle"
> "Mic mute toggle"
> "ALS sensor toggle"
> " Rotation lock toggle"
> "Airplane mode toggle"

These all seem valid key events (unless they are not requests to execut=
e
said actions but rather notifiers of events already happened).

Are they "killed" because they are also delivered via i8042?

>=20
> >=20
> > - In the same vein, we can come up with something generic to shuffl=
e
> > the crap over to userspace ("com.vendor.crap.morecrap..." over
> > connector? I think I just threw into my mouth a little), but do we
> > have consumer for this?
> >=20
>=20
> I think it would be most equitable to shuffle all notification events=
 over
> to userspace with a generic connector and let userspace maintainers=20
> decide which ones make sense to show to the user.
>=20
> The most logical one to me will be adding patches into gnome-settings=
-daemon
> and similar UI interfaces that already display things like brightness=
 and volume
> changes.

Well, it is really easy to shove stuff up into userspace and say "let
them deal with it", but we if stuff is useful and applicable to many
devices, then I am sure there are more specific interfaces that would b=
e
better suited for such events, and one off will require writing "tray
notification apps" that we all so love.

Thanks.

--=20
Dmitry
