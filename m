From: <Mario_Limonciello@Dell.com>
Subject: RE: [PATCH v3 0/4] dell-wmi: Changes in WMI event code handling
Date: Tue, 21 Jun 2016 18:16:09 +0000
Message-ID: <e3fabd2ab50d46389400cfb8900bad4d@ausx13mpc120.AMER.DELL.COM>
References: <1466020153-10877-1-git-send-email-pali.rohar@gmail.com>
 <20160616031958.GA54214@f23x64.localdomain> <20160616073302.GT29844@pali>
 <20160621180617.GD3685@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ausxipps301.us.dell.com ([143.166.148.223]:23460 "EHLO
	ausxipps301.us.dell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751606AbcFUSS5 convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 21 Jun 2016 14:18:57 -0400
In-Reply-To: <20160621180617.GD3685@f23x64.localdomain>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, pali.rohar@gmail.com
Cc: gabriele.mzt@gmail.com, luto@kernel.org, alex.hung@canonical.com, mjg59@srcf.ucam.org, kernel@kempniu.pl, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Tuesday, June 21, 2016 1:06 PM
> To: Pali Roh=E1r <pali.rohar@gmail.com>
> Cc: Gabriele Mazzotta <gabriele.mzt@gmail.com>; Andy Lutomirski
> <luto@kernel.org>; Alex Hung <alex.hung@canonical.com>; Matthew
> Garrett <mjg59@srcf.ucam.org>; Micha=B3 K=EApie=F1 <kernel@kempniu.pl=
>;
> Limonciello, Mario <Mario_Limonciello@Dell.com>; platform-driver-
> x86@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH v3 0/4] dell-wmi: Changes in WMI event code handl=
ing
>=20
> On Thu, Jun 16, 2016 at 09:33:02AM +0200, Pali Roh=E1r wrote:
> > On Wednesday 15 June 2016 20:19:58 Darren Hart wrote:
> > > On Wed, Jun 15, 2016 at 09:49:09PM +0200, Pali Roh=E1r wrote:
> > > > First patch describe problem about 0xe045 code. Second and thir=
d are
> just
> > > > cosmetic and last rework code which processing WMI events. It s=
hould
> be
> > > > properly tested on more Dell machines, to check that everything=
 is still
> > > > working correctly.
> > >
> > > Is this "should be properly tested on more Dell machines" still t=
he case?
> Are
> > > you ready for this to go into linux-next?
> >
> > Series should be OK, but I would like to see if someone else test t=
his
> > series... Gabriele, Alex or Andy? Do you have time?
>=20
> Tested on a Dell XPS 13 2016 (9350). All hotkeys appear to work witho=
ut
> warning
> messages. I didn't get anything out of Fn-F8 which has a picture of a=
 laptop
> and
> white screen behind it. Not sure what that is supposed to do - if it =
was meant
> to blank the screen, it did not, perhaps it is meant to toggle screen=
 outputs...
> will test that when I have access to an external display.

That key is meant to toggle screen outputs.  I believe it's still done =
by the EC
emitting <super> + p.  If your WM doesn't recognize that, it won't do m=
uch,
but you can see in xev the key combinations.
