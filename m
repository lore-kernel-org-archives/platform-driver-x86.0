From: joeyli <jlee@suse.com>
Subject: Re: Acer-WMI disables touchpad and other issues
Date: Fri, 14 Sep 2012 02:49:16 +0800
Message-ID: <1347562156.705.26.camel@linux-s257.site>
References: <502BD214.6090700@gnat.ca> <50516276.7010103@gnat.ca>
	 <1347530718.705.23.camel@linux-s257.site> <5051FFFA.3010506@gnat.ca>
	 <20120913160341.GA13029@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:52785 "EHLO
	smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751090Ab2IMSyp (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 13 Sep 2012 14:54:45 -0400
In-Reply-To: <20120913160341.GA13029@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: "Nathanael D. Noblet" <nathanael@gnat.ca>, jlee@novell.com, platform-driver-x86@vger.kernel.org

=E6=96=BC =E5=9B=9B=EF=BC=8C2012-09-13 =E6=96=BC 17:03 +0100=EF=BC=8CMa=
tthew Garrett =E6=8F=90=E5=88=B0=EF=BC=9A
> On Thu, Sep 13, 2012 at 09:47:06AM -0600, Nathanael D. Noblet wrote:
> > Hello Joey li,
> >=20
> > On 09/13/2012 04:05 AM, joeyli wrote:
> > >On the other hand,
> > >I checked your dmideocde on brc#848720, the 0x82 is the RIGHT acpi=
 code
> > >to you for touchpad_toggle key, that means acer-wmi should emit
> > >KEY_TOUCHPAD_TOGGLE to userland. There have another thing also lis=
ten
> > >the KEY_TOUCHPAD_TOGGLE and do the change. I checked the
> > >gnome-settings-daemon, it just show up OSD but didn't change touch=
pad
> > >status.
> >=20
> > I was discussing this with Matthew Garrett in #fedora-kernel. He's
> > telling me that if the hardware does the enabling/disabling that it
> > should not emit _TOGGLE, but that it should emit KEY_TOUCHPAD_ON or
> > KEY_TOUCHPAD_OFF instead. I'm in no place to know one way or the
> > other. I've CC'd him on this so the discussion of the issue can
> > continue to figure out what the source problem is.
>=20
> Right - TOUCHPAD_TOGGLE is a request from the hardware that the deskt=
op=20
> environment change the state. In this case hitting the key is causing=
=20
> the hardware to change its state directly, and therefore it should ju=
st=20
> be sending KEY_TOUCHPAD_ON or KEY_TOUCHPAD_OFF.
>=20

Got it!
We need check the DSDT for look at if there have any wmi used to grab
the touchpad status.


Thanks
Joey Lee=20
