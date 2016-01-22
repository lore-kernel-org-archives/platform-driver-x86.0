From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 1/3] dell_wmi: Support new hotkeys on the XPS 13 Skylake
Date: Fri, 22 Jan 2016 09:26:02 +0100
Message-ID: <20160122082602.GK7192@pali>
References: <cover.1447479930.git.luto@kernel.org>
 <db83b63cc163ecc640d5d1c5554f8aa87beaadfc.1447479930.git.luto@kernel.org>
 <20151121000636.GG7413@malice.jf.intel.com>
 <CALCETrVz+4CX=rjY5OZfCSGQDcgW1oQe6t8d9940ubQKDv-Eqg@mail.gmail.com>
 <20151122020414.GR16374@dell.com>
 <20151123145351.GG24147@pali>
 <20160121101711.GY7192@pali>
 <56A17306.3010503@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:35704 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751378AbcAVI0G (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 22 Jan 2016 03:26:06 -0500
Received: by mail-wm0-f65.google.com with SMTP id 123so15787246wmz.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 22 Jan 2016 00:26:04 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <56A17306.3010503@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario_limonciello@dell.com>
Cc: "Dominguez, Jared" <Jared_Dominguez@DELL.com>, Andy Lutomirski <luto@amacapital.net>, Darren Hart <dvhart@infradead.org>, Andy Lutomirski <luto@kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>

On Thursday 21 January 2016 18:08:38 Mario Limonciello wrote:
>=20
>=20
> On 01/21/2016 04:17 AM, Pali Roh=C3=A1r wrote:
> > On Monday 23 November 2015 15:53:51 Pali Roh=C3=A1r wrote:
> >> On Saturday 21 November 2015 20:04:15 D. Jared Dominguez wrote:
> >>> On Fri, Nov 20, 2015 at 06:12:58PM -0600, Andy Lutomirski wrote:
> >>>> Jared, want to give us some guidance as to whether this code is
> >>>> correct at all and, if so, whether we should actually send a
> >>>> KEY_RFKILL event from dell-wmi when the key is pressed?
> >>>>
> >>>> IOW, should we allow dell-wmi to handle rfkill or should we wait=
 for
> >>>> the other mechanism?
> >>>>
> >>>> --Andy
> >>> I'm adding Mario since he's worked on our client systems much lon=
ger and
> >>> knows more about the correct behavior for our hotkeys. I've not y=
et read
> >>> through any of our documentation about our hotkey behavior so wou=
ldn't be as
> >>> qualified to answer that. Note that both Mario and I are on vacat=
ion until
> >>> the 30th, so he may not reply until then.
> >>>
> >>> --Jared
> >>>
> >> Jared, thanks for your input! When you or Mario are back from vaca=
tion,
> >> can you look at it? Or if you do not have much time, can you provi=
de
> >> documentation (or some snippets), so somebody else can update driv=
er to
> >> work correctly?
> > Hi Jared & Mario, I believe you are back from vacation, can you loo=
k at it?
> >
> Pali,
>=20
> I understand that intel-hid will be making it in at this point.  If I=
'm
> not mistaken, it should be handling this portion.

Hi Mario! Thats truth, but we still needs to know all codes which
dell-wmi should ignore (because they will be handled by intel-hid).

Currently Andy's patch adds three codes which are not specified in
vendor-specific DMI table.

Do you such table of key events which can ACPI/BIOS/WMI send to OS?

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
