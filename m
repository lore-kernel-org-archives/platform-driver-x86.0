From: joeyli <jlee@suse.com>
Subject: Re: [PATCH v3 11/12] msi-wmi: Introduced quirk_last_pressed
Date: Fri, 14 Dec 2012 18:37:00 +0800
Message-ID: <1355481420.2710.59.camel@linux-s257.site>
References: <1354888162-12109-1-git-send-email-maxtram95@gmail.com>
	 <1354888162-12109-12-git-send-email-maxtram95@gmail.com>
	 <20121211172930.0490654a@destiny.ordissimo>
	 <CAKErNvpWzBVy=K2RrkKwieZgxPMbTtFF+J5uH4y-zSy5F0jAow@mail.gmail.com>
	 <20121211183914.460ed479@destiny.ordissimo>
	 <CAKErNvqxMiKQaXmLhKt4HOMnLNic_LHayaQKrsnyKH6WZ45Siw@mail.gmail.com>
	 <20121212105829.15819617@destiny.ordissimo>
	 <20121212185856.GA10583@core.coreip.homeip.net>
	 <20121213181048.57670178@destiny.ordissimo>
	 <CAKErNvrOWk4rhcOExeq-LWEayKuUBRxtHxBO5u-5NAVH6t9xXg@mail.gmail.com>
	 <20121213181840.GA16410@core.coreip.homeip.net>
	 <CAKErNvrw3-vfzSvPjTQLL7GfoveLWgD0WCNnafw8Dp_VS4BBmw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:49026 "EHLO
	smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751282Ab2LNKiV (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 14 Dec 2012 05:38:21 -0500
In-Reply-To: <CAKErNvrw3-vfzSvPjTQLL7GfoveLWgD0WCNnafw8Dp_VS4BBmw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Maxim Mikityanskiy <maxtram95@gmail.com>, Thomas Renninger <trenn@suse.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Anisse Astier <anisse@astier.eu>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

=E6=96=BC =E5=9B=9B=EF=BC=8C2012-12-13 =E6=96=BC 20:30 +0200=EF=BC=8CMa=
xim Mikityanskiy =E6=8F=90=E5=88=B0=EF=BC=9A
> 2012/12/13 Dmitry Torokhov <dmitry.torokhov@gmail.com>:
> > On Thu, Dec 13, 2012 at 08:06:47PM +0200, Maxim Mikityanskiy wrote:
> >> 2012/12/13 Anisse Astier <anisse@astier.eu>:
> >> > On Wed, 12 Dec 2012 10:58:56 -0800, Dmitry Torokhov <dmitry.toro=
khov@gmail.com> wrote :
> >> >
> >> >> On Wed, Dec 12, 2012 at 10:58:29AM +0100, Anisse Astier wrote:
> >> >> > On Tue, 11 Dec 2012 20:27:26 +0200, Maxim Mikityanskiy <maxtr=
am95@gmail.com> wrote :
> >> >> >
> >> >> > > 2012/12/11 Anisse Astier <anisse@astier.eu>:
> >> >> > > > On Tue, 11 Dec 2012 19:07:51 +0200, Maxim Mikityanskiy <m=
axtram95@gmail.com> wrote :
> >> >> > > >
> >> >> > > >> >> @@ -169,11 +169,15 @@ static void msi_wmi_notify(u32 =
value, void *context)
> >> >> > > >> >>               pr_debug("Eventcode: 0x%x\n", eventcode=
);
> >> >> > > >> >>               key =3D sparse_keymap_entry_from_scanco=
de(msi_wmi_input_dev,
> >> >> > > >> >>                               eventcode);
> >> >> > > >> >> -             if (key) {
> >> >> > > >> >> +             if (!key) {
> >> >> > > >> >> +                     pr_info("Unknown key pressed - =
%x\n", eventcode);
> >> >> > > >> >> +                     goto msi_wmi_notify_exit;
> >> >> > > >> >> +             }
> >> >> > > >> >> +             if (quirk_last_pressed) {
> >> >> > > >> >> +                     size_t key_index =3D key - msi_=
wmi_keymap;
> >> >> > > >> > Do you mean key->code - MSI_SCANCODE_BASE ? I'm not su=
re I understand the
> >> >> > > >> > intent here otherwise.
> >> >> > > >>
> >> >> > > >> msi_wmi_keymap is array of 'struct key_entry', i.e. poin=
ter to array's
> >> >> > > >> first item. key is a pointer to some array's item. So 'k=
ey -
> >> >> > > >> msi_wmi_keymap' is a difference between pointers, i.e. i=
ndex of key in
> >> >> > > >> msi_wmi_keymap.
> >> >> > > >>
> >> >> > > >> I do pointer arithmetic here because in patch 12 I add s=
ome new
> >> >> > > >> scancodes, and holes appear in scancode sequence, so we =
can't just use
> >> >> > > >> 'key->code - MSI_SCANCODE_BASE' to get item index in arr=
ay.
> >> >> > > >
> >> >> > > > Oh, I see. This is very clever, but a bit too clever. You=
 have no
> >> >> > > > guarantee, that sparse_keymap_entry_from_scancode will gi=
ve you a pointer
> >> >> > > > to *your* key_entry. In fact, it doesn't.
> >> >> > > >
> >> >> > > > In sparse_keymap_setup (drivers/input/sparse-keymap.c), t=
he keymap
> >> >> > > > array(msi_wmi_keymap) is mempcy-ed, at line 187 (kernel ~=
3.7). So if you
> >> >> > > > want to use this method, you might need to re-compute the=
 index by
> >> >> > > > iterating over the elements and comparing key->code for e=
ach.
> >> >> > >
> >> >> > > Oops, I'm sorry, I was looking only into
> >> >> > > sparse_keymap_entry_from_scancode() and I didn't discover t=
he fact
> >> >> > > that dev->keycode is not equal to msi_wmi_keymap. I just wa=
nted to
> >> >> > > avoid iterating through the array second time. Also, can I =
use
> >> >> > > msi_wmi_input_dev->keycode instead of msi_wmi_keymap as arr=
ay base?
> >> >> > > input_dev::keycode field is documented at include/linux/inp=
ut.h:62.
> >> >> >
> >> >> > As I said, you could iterate over msi_wmi_keymap and compare =
key->code to
> >> >> > each keycode to compute key_index each time.
> >> >> >
> >> >> > >
> >> >> > > It's strange that I didn't get a crash or data corruption o=
n my system
> >> >> > > when I forced usage of last_pressed for my laptop, loaded t=
his module
> >> >> > > and tried to press keys.
> >> >> > >
> >> >> > > It's very unconvenient that struct key_entry does not have =
some field
> >> >> > > for driver-specific extra data. In such field we could stor=
e index in
> >> >> > > last_pressed or event last press time. But we haven't such =
field.
> >> >> >
> >> >> > If that's really needed, such field could be added. Cc-ing Dm=
itry
> >> >> > Torokhov to ask what he thinks about altering the sparse keym=
ap API for
> >> >> > this use case, ie having per key_entry variables to store inf=
ormation,
> >> >> > here used for debouncing.
> >> >> > Previously the keymap was contiguous, but we're adding new ke=
ys, so it'll
> >> >> > really be sparse, so we can't use the same trick substraction=
 trick.
> >> >>
> >> >> A different question - do you really need to store times for al=
l
> >> >> possible keys or you actually need to know just the last key th=
at was
> >> >> pressed?
> >> >
> >> > Not at all. This isn't a gamepad, so I think this quirk could be
> >> > simplified by just storing the last trigger time overall, not pe=
r-key
> >> > trigger time. 1 key every 50ms means you can still input 20 keys=
 per
> >> > second, which isn't bad.
> >> >
> >> > Maxim, if you make this modification it would simplify your patc=
h even
> >> > further.
> >>
> >> I agree, it would simplify things a lot. But I think it could caus=
e
> >> problems when a user presses two different keys simultaneously. We
> >> would receive lots of events from both keys in some undefined orde=
r. A
> >> variable holding last key code would change its value several time=
s so
> >> we would send more key press events than user really made (more th=
an
> >> two). I know, this case is very unlikely to happen (nobody presses=
 two
> >> special keys at a time), maybe it's even impossible due to some
> >> hardware restrictions (I don't know is it true).
> >>
> >> We could ignore this rare case at all, or we could filter out all
> >> events within 50ms, not only the same ones. What do you think on t=
his?
> >
> > I think for the kind of keys the device provides simply ignoring ev=
ents
> > coming within 50 msecs would work well enough.
>=20
> OK, thanks.
>=20
> > But you have the hardware so try experimenting and see what kind of
> > response you can get from it and what strategy is the best.
>=20
> Unfortunately, I can't do the experiment, because my laptop sends onl=
y
> one event per key press and does not need this quirk at all. The quir=
k
> is needed for older models. Maybe, Anisse has suitable hardware.
>=20
> > Thanks.
> >
> > --
> > Dmitry
>=20

As I remember this quirk is for a old MSI AIO machine that implemented
side buttons. We have no machine for testing and confirm new change,
now.

Per my understand, we didn't test the behavior that was pressed 2 side
buttons at the same time. IMHO capture the latest pressed button within
50ms is make sense.

Hi Thomas, do you have good suggestion if we filter out all events
within 50ms?


Thanks a lot!
Joey Lee
