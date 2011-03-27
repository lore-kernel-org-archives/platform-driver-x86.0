From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 2/2] eeepc-wmi: Add support for T101MT Home/Express Gate
 key
Date: Sun, 27 Mar 2011 12:11:16 -0700
Message-ID: <20110327191116.GB31692@core.coreip.homeip.net>
References: <1300997035-14104-2-git-send-email-seth.forshee@canonical.com>
 <AANLkTimF2UR8BVQW-3YJaGFEz39q8ydESAiMOjmdM1X7@mail.gmail.com>
 <20110325135311.GA14328@thinkpad-t410>
 <AANLkTin3MDYdL6x1Qs8Q9oMMgDMfsoO2GjWMJO_65GAR@mail.gmail.com>
 <20110325161405.GC5099@core.coreip.homeip.net>
 <20110325162850.GD14328@thinkpad-t410>
 <20110325170333.GD5099@core.coreip.homeip.net>
 <20110325185824.GE14328@thinkpad-t410>
 <20110327171304.GD30244@core.coreip.homeip.net>
 <AANLkTikBnAdXHR4iqzq9Zd6D-OYe4yp-zELPh6iLr6sj@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:37164 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754143Ab1C0TLV (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 27 Mar 2011 15:11:21 -0400
Content-Disposition: inline
In-Reply-To: <AANLkTikBnAdXHR4iqzq9Zd6D-OYe4yp-zELPh6iLr6sj@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Chris Bagwell <chris@cnpbagwell.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Matthew Garrett <mjg@redhat.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, vojtech@suze.cz

On Sun, Mar 27, 2011 at 01:32:45PM -0500, Chris Bagwell wrote:
> On Sun, Mar 27, 2011 at 12:13 PM, Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> > On Fri, Mar 25, 2011 at 01:58:24PM -0500, Seth Forshee wrote:
> >> On Fri, Mar 25, 2011 at 10:03:33AM -0700, Dmitry Torokhov wrote:
> >> > > So, would the following make sense (KEY_TBD is may abbreviatio=
n for "key
> >> > > to be determinded"):
> >> > >
> >> > > =A0- On press (0xe4), send KEY_TBD, value =3D 1
> >> > > =A0- On hold (0xea), send KEY_TBD, value =3D 2
> >> > > =A0- On release (0xe5), send KEY_TBD, value =3D 0
> >> >
> >> > Yes.
> >>
> >> There's a little problem with this. The driver uses sparse-keymap,=
 which
> >> calls input_report_key(), which is doing this:
> >>
> >> =A0 =A0 =A0 input_event(dev, EV_KEY, code, !!value);
> >
> > Ah, right, it really did not have in mind passing on auto-repeating=
 keys
> > as is when it was written.
> >
> >>
> >> I don't see the hold events in userspace, so they must be getting
> >> dropped as duplicates as you suggested.
> >>
> >> I'm not sure who is at fault here. Should input_report_key() not b=
e
> >> forcing value to 0 or 1? Or should sparse-keymap be calling
> >> input_event() directly? Or is sparse-keymap the wrong tool for han=
dling
> >> keys this way?
> >
> > I do not thik we shoudl burden sparse-keymap with handling repeats.=
 Just
> > mark the device as auto-repeating (by setting EV_REP bit) and let i=
nput
> > core autorepeat logic do it for you.
>=20
> It would be nice to have this key sent roughly every 2 seconds to
> re-execute a rotate script using generic key-to-script support in mos=
t
> X environments.  So to use kernel auto-repeat we'd need to bump up
> REP_DELAY quite a bit or do filtering in userspace.  If userspace is
> filtering then its not much more work to do their own auto-repeat as
> well.

That is true as well.

>=20
> If we do set up auto-repeat and increase REP_DELAY, I'm guessing this
> would enable auto-repeat for all other keys defined in driver?  That
> needs to have some thought on if could have negative impact (any othe=
r
> keys not using auto-release?).

Right. Right now there are 4 autoreprat options (in general):

- hardware autorepeat (if hardware supports it);
- input core software autorepeat (one delay and rate per input device);
- driver-implemented software autorepeat - in cases when different
  repeat rate is needed;
- userspace autorepeat (like X does nowadays);

Well, 4th option is not mutually exclusive with the other 3...

--=20
Dmitry
