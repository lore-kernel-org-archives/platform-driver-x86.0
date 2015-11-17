From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH 1/3] dell_wmi: Support new hotkeys on the XPS 13 Skylake
Date: Tue, 17 Nov 2015 11:03:28 -0800
Message-ID: <CALCETrVar=Uf1ptjcHNeq7Hb2ytvQunAURUwQ2e7mo9Nj5VsJQ@mail.gmail.com>
References: <cover.1447479930.git.luto@kernel.org> <201511141713.48766@pali>
 <CALCETrWss=zCWhNkR2S_oi_m3W1xNO+UL_-uOnOVeLh5WHsDgQ@mail.gmail.com> <201511170936.08646@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:36758 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754291AbbKQTDs convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 17 Nov 2015 14:03:48 -0500
Received: by oiww189 with SMTP id w189so10877390oiw.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2015 11:03:48 -0800 (PST)
In-Reply-To: <201511170936.08646@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Alex Hung <alex.hung@canonical.com>, Mario Limonciello <mario_limonciello@dell.com>, Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, libsmbios-devel@lists.us.dell.com

On Nov 17, 2015 12:36 AM, "Pali Roh=C3=A1r" <pali.rohar@gmail.com> wrot=
e:
>
> On Saturday 14 November 2015 18:07:57 Andy Lutomirski wrote:
> > [lots of people added]
> >
> > On Sat, Nov 14, 2015 at 8:13 AM, Pali Roh=C3=A1r <pali.rohar@gmail.=
com>
> > wrote:
> > > On Saturday 14 November 2015 16:48:25 Andy Lutomirski wrote:
> > >> On Nov 14, 2015 1:27 AM, "Pali Roh=C3=A1r" <pali.rohar@gmail.com=
> wrote:
> > >> > On Friday 13 November 2015 21:49:30 Andy Lutomirski wrote:
> > >> > > The XPS 13 Skylake has an rfkill button and a switchvideomod=
e
> > >> > > button that aren't enumerated in the DMI table AFAICT.  Add =
a
> > >> > > table listing extra un-enumerated hotkeys.  To avoid breakin=
g
> > >> > > things that worked before, these un-enumerated hotkeys won't
> > >> > > be used if the DMI table maps them to something else.
> > >> >
> > >> > Do you have any (Dell) documentation which specify list of the=
se
> > >> > wmi codes send to dell-wmi driver?
> > >>
> > >> No.  Do you know where to get that documentation?
> > >
> > > Time to time Dell release some documentation or example code. You
> > > could ask Dell people on LKML (e.g. Mario Limonciello is active)
> > > or on smbios mailing list libsmbios-devel@lists.us.dell.com.
> > >
> > > But currently there there are open questions about WMI hotkeys on
> > > Dell Vostro V131 which we cannot fix yet :-(
> >
> > On the Dell XPS 13 Skylake (XPS 13 9350), upstream Linux doesn't
> > support the rfkill button.
> >
> > There seem to be three WMI events that aren't reflected in the OEM
> > type 178 DMI table:
> >
> > 0x151: Fn-lock (no action needed by OS)
> > 0x152: Switch video mode (should send KEY_SWITCHVIDEOMODE, but
> > currently just warns)
> > 0x153: rfkill -- currently warns, and see below.
> >
> > On several Dell models, there's the dell_rbtn (DELRBTN / DELLABCE)
> > device.  It's here in the DSDT, too, but it seems to be disabled if
> > _OSI reports "Windows 2012" or "Windows 2013", so _STA returns zero=
=2E
> > (It also shows up as DELLRBC6, but I haven't tried all the _OSI
> > hackery that seems to be needed in order to test the driver.)
> >
>
> Hi!
>
> In your ASL code is:
>
>             Method (_STA, 0, NotSerialized)  // _STA: Status
>             {
>                 If ((OIDE () < One))
>                 {
>                     Return (0x0F)
>                 }
>
>                 Return (Zero)
>             }
>
> OIDE() returns 1 for Windows 8.
>
> This is quite interesting, on my Latitude E6440 is this ASL code:
>
>             Method (_STA, 0, NotSerialized)
>             {
>                 If (LLess (OIDE (), One))
>                 {
>                     Return (Zero)
>                 }
>
>                 Return (0x0F)
>             }
>
> And again OIDE() returns 1 for Windows 8. So behaviour is negated.
>
> Can you check if you have latest version of BIOS? Maybe Dell written
> that condition incorrectly?
>

I'll check later on.  There's one newer version.

> Can you try to add "DELLRBC6" into dell-rbtn.c acpi table and boot
> kernel with acpi_osi=3D"!Windows 2012" acpi_osi=3D"!Windows 2013" wha=
t
> happens?
>

I did exactly that.  The dell_rbtn driver partially worked, but, when
I pushed the rfkill button to turn off wireless and then turned it
back on using NetworkManager's menu, NM thought it was back on but it
didn't seem to work until I pushed the rfkill button again.  dell-rbtn
does very strange things with device creation and deletion, and maybe
that's related.

> > My proposal is to modify dell_wmi to handle 0x151 (ignore), 0x152
> > (send KEY_SWITCHVIDEOMODE), and 0x153 (send KEY_RFKILL), but only i=
f
> > there isn't something else mapped to them in the DMI table.
> >
> > I've attached dmidecode output and the DSDT.
> >
>
> Can you please provide debug output from dell-wmi module when you pre=
ss
> those hotkeys? Specially I want to see wmi buffer for each pressed
> hotkey. In debug dmesg it starts with "Received WMI event" and "Proce=
ss
> buffer". Look into dell-wmi.c source code.

It looks like this:

[ 7822.601910] dell_wmi: Received WMI event (02 00 10 00 53 01 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00)
[ 7822.601913] dell_wmi: Process buffer (02 00 10 00 53 01)
[ 7822.601915] dell_wmi: Key 153 pressed

--Andy
