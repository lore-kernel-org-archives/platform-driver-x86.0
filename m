From: Seth Forshee <seth.forshee@canonical.com>
Subject: Re: [PATCH] eeepc-wmi: Add support for T101MT "Express Gate" key
Date: Thu, 24 Mar 2011 14:57:20 -0500
Message-ID: <20110324195720.GB31713@thinkpad-t410>
References: <1300909189-4135-1-git-send-email-seth.forshee@canonical.com>
 <AANLkTinZpt8qmHzhe4WyteMt-C-nkVNwEGQVvq3Nk9Lx@mail.gmail.com>
 <20110324131414.GA20612@thinkpad-t410>
 <AANLkTikrX_wypmrd-PbST603jsHqkuwtA6t5X65Lg1+O@mail.gmail.com>
 <AANLkTi=2OKxvHN75PO4RGb9rtpnA0iGHNb9JPZwb0z9J@mail.gmail.com>
 <AANLkTik7D0j=JOhzPk6Y2NrTA89-vS28wPDSS=j0VW4_@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from adelie.canonical.com ([91.189.90.139]:50222 "EHLO
	adelie.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933832Ab1CXT50 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 24 Mar 2011 15:57:26 -0400
Content-Disposition: inline
In-Reply-To: <AANLkTik7D0j=JOhzPk6Y2NrTA89-vS28wPDSS=j0VW4_@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Chris Bagwell <chris@cnpbagwell.com>, Corentin Chary <corentin.chary@gmail.com>
Cc: Matthew Garrett <mjg@redhat.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Mar 24, 2011 at 09:00:14AM -0500, Chris Bagwell wrote:
> On Thu, Mar 24, 2011 at 8:40 AM, Corentin Chary
> <corentin.chary@gmail.com> wrote:
> >> I would suggest sending BTN_HOME upon button release 0xe5 (not pre=
ss
> >> 0xe4 and do the autorelease because of it) and BTN_PROG2 on
> >> press-and-hold 0xea.
> >>
> >> If you press-and-hold, does it still send the 0xe5 upon release? =C2=
=A0That
> >> could complicate things so that both button events do not get sent=
=2E
> >>
> >> I'm not sure what BTN_HOME is commonly used for. =C2=A0This button=
 does
> >> sound like a HOME button in iPad sense but not in web browser sens=
e.
> >
> > Except the fact that I don't find BTN_HOME in inpout.h, that's seem=
s a
> > better idea, forget what I've said earlier.
>=20
> Ha... Sorry, I had buttons on my brain.  I meant KEY_HOME as you sugg=
ested.

Really? Isn't KEY_HOME the home key on a standard keyboard?

> > 0xe4 -> KEY_IGNORE
> > 0xe5 -> KEY_HOME
> > 0xea -> KEY_PROG2, (or BTN_TASK to copy android/iOS ?)
>=20
> From a quick google, I couldn't finding any specific meaning of
> BTN_TASK but it looks like xf86-input-evdev turns it into a button
> press so we may not want that one.
>=20
> I've no idea of best values but those are pretty close.

I'm still not sure what key codes are best either. I've implemented thi=
s
approach, and I went with BTN_TASK and KEY_PROG2, but I'm getting the
idea that BTN_TASK was intended for a mouse button so I'm not really
sure if it's a good choice or not. I'll follow up with the patches.

Thanks for the feedback so far.

Seth
