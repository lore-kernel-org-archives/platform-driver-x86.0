From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: Dell Vostro V131 hotkeys revisited
Date: Tue, 7 Jul 2015 23:01:48 +0200
Message-ID: <20150707210141.GA20901@pali>
References: <20150623112621.GA3071@eudyptula.hq.kempniu.pl>
 <20150701105544.GD17577@pali>
 <20150702204122.GA2610@eudyptula.hq.kempniu.pl>
 <201507022258.32104@pali>
 <20150703065244.GA2401@eudyptula.hq.kempniu.pl>
 <20150703074813.GD1841@pali>
 <559C1C17.3060009@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f46.google.com ([74.125.82.46]:33287 "EHLO
	mail-wg0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932987AbbGGVB4 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 7 Jul 2015 17:01:56 -0400
Received: by wgck11 with SMTP id k11so178749293wgc.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Jul 2015 14:01:54 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <559C1C17.3060009@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario_limonciello@dell.com>
Cc: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, "Gowda, Srinivas G" <Srinivas_G_Gowda@dell.com>, "Brown, Michael E" <Michael_E_Brown@dell.com>, "Warzecha, Douglas" <Douglas_Warzecha@dell.com>, Matthew Garrett <mjg@redhat.com>, "Kabir, Rezwanul" <Rezwanul_Kabir@dell.com>, Alex Hung <alex.hung@canonical.com>, Darren Hart <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

On Tuesday 07 July 2015 13:36:07 Mario Limonciello wrote:
>=20
>=20
> On 07/03/2015 02:48 AM, Pali Roh=C3=A1r wrote:
> > On Friday 03 July 2015 08:52:44 Micha=C5=82 K=C4=99pie=C5=84 wrote:
> >>> Can you write which WMI call needs to be called?
> >> Technically, one needs to call method DoBFn (method ID =3D 1) usin=
g GUID
> >> A80593CE-A997-11DA-B012-B622A1EF5492. Though if you look at the AC=
PI
> >> method this GUID maps to (WMBA), you'll notice that the first two
> >> arguments passed to it (instance number and method ID) are simply
> >> ignored and the only one that matters is the buffer passed (third
> >> argument).
> >>
> >>> Last time when I looked into dell-led.c code it called some WMI
> >>> functions which are just re-implementation of SMI based SMBIOS
> >>> functions. From information which I have that is just WMI interfa=
ce for
> >>> dell SMBIOS one.
> >>>
> >>> I already asked Alex and other people for official ACPI/WMI Dell
> >>> documentation, so we would be able to solve these hotkey problems=
 once
> >>> and for all, but I did not get anything yet.
> >>>
> >>> What I found on internet is just this one out-of-dated documentat=
ion:
> >>> http://vpsservice1.sampo.com.tw/sampo_update/document/jimmy/ACPI-=
WMI%20.pdf
> >>>
> >>> I would suggest you to read it (it is not long) to see Dell WMI m=
ethods
> >>> are just ACPI "wrapper" around Dell SMBIOS (dcdbas.ko driver) use=
d by
> >>> dell-laptop.ko.
> >> Great, thanks. I'll look into it.
> >> =20
> >>>>  2) Pressing hotkey #3 on a Dell Vostro V131 generates WMI event
> >>>> 0xe025, but no keycode. Apparently, Dell XPS L502X generates the
> >>>> same WMI event for a hotkey which also generates a keycode [1].
> >>>> What's the best way to solve this conflict?
> >>>>
> >>>> [1] commit f1566f0: "dell-wmi: Add keys for Dell XPS L502X"
> >>> Look at dell-wmi.c source code. Which event format is that? New o=
ne
> >>> (partially described in above PDF document) when dell_new_hk_type=
 is
> >>> true? Or old one?
> >> Vostro V131 is using the legacy keymap.
> >>
> >>> Can you please enable pr_debug() in dell-wmi.c and send dmesg out=
put
> >>> from dell-wmi.ko (specially dell_wmi_notify)?
> >> Here's what appears in dmesg after pressing hotkey #3:
> >>
> >> ------------------------------------------------------------------=
------
> >> dell_wmi: Received WMI event (02 00 00 00 25 e0 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00=
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00)
> >> dell_wmi: Key e025 pressed
> >> wmi: DEBUG Event GUID: 9DBB5994-A997-11DA-B012-B622A1EF5492
> >> ------------------------------------------------------------------=
------
> >>
> > It looks like above buffer has format of *new* event (0002 - length=
 of
> > event, 0000 - type of event, e025 - data). But when using legacy ke=
ymap
> > then dell-wmi.c parse events with old format (which means type=3D00=
00 is
> > dropped and data=3De025 is translated to some key).
> >
> > This is even harder as I thought. Looks like big mess and now I wou=
ld
> > say, without documentation for Dell WMI events we are not able to f=
ix
> > this correctly without breaking other laptops...
> >
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> >
> > CCing kernel Dell developers, can you provide Dell WMI documentatio=
n for
> > events and hotkeys? We have problems with enabling events for addit=
ional
> > buttons/keys on Dell laptops and also parsing WMI events which BIOS=
/ACPI
> > generates and send to kernel. Please, I really do not know how to h=
ow we
> > can fix these "hotkey/events" problems.
> >
> > Something like this document, but updated for new laptops:
> > http://vpsservice1.sampo.com.tw/sampo_update/document/jimmy/ACPI-WM=
I%20.pdf
> >
> > Thanks!
> >
> I'm unsure how that document ended up on the web, it shouldn't have b=
een
> released in verbose form like that, but aside from that the BIOS
> ACPI-WMI interface has not changed since that document was created.=20
> There are some other BIOS specs that do refer to a few other things I
> should mention though.
>=20

Hi Mario! I'm happy that you provided some response to us!

I just used search tools and I tried to find some information about
DELL, ACPI and WMI. And I come across that PDF document on internet
which provided me some information useful how events can be received.

> You added a patch to look at multiple events in one buffer in Novembe=
r.=20
> I didn't see anything checking for the type

In my patch from Nov 2014 (83fc44c32) there are checks for types. You
can look into dell-wmi.c at line "switch (buffer_entry[1])".

> so here's the detail you missed:
> Word 0 is the length (as you mentioned)
> Word 1 is the type.  It can be either :
> * 0x0000 meaning one hot key is pressed or an event occured.=20
> * 0x000F meaning a sequence of hotkeys are pressed.
>=20

And what are types 0x0010 and 0x0011? As you can see in source code and
sent logs to LKML key presses and events are sent also with these two
types.

Is there somewhere list of all events and key presses which can BIOS/WM=
I
send to running system?

And in that PDF document is specified to query for BIOS WMI Descriptor
at first (UUID 8D9DDCBC-A997-11DA-B012-B622A1EF5492). And it returns
also "WMI Interface Version". From ACPI DSDT dumps we already see that
version is either 0 or 1.

Is there some difference between these two versions (0 and 1)? Was
something changed for receiving events or something else?

And should Linux dell-wmi.c driver check that "BIOS WMI Descriptor"
before doing something?

> e025 is supposed to be translated into "Dell Instant Launch".  This k=
ey
> is a bit special because the EC can be configured to send programmed
> scan codes.  Some other documentation that isn't part of the WMI
> documentation does describe more clearly how you can query what is
> supported.=20
> Query key press simulation capability:
> class 4, selector 11.
> Arg1=3D0x40.
> Res1 value of 0, means success
> Res1 value of -1, error
> Res1 value of -2, not supported
> Res2 bit0 if set means that the EC can send scan codes when Instant
> Launch is pressed.
>=20

Hmm... class=3D4 and selector=3D11? Is not this id for keyboard
illuminations settings? It is used in smbios-keyboard-ctl tool on:
http://linux.dell.com/cgi-bin/cgit.cgi/libsmbios.git/tree/src/bin/smbio=
s-keyboard-ctl#n667

I tried to send smbios request with:

class=3D4
selector=3D11
arg1=3D64

(0x40 hex =3D 64 dec)

And it disabled keyboard backlight on my E6440 machine, then it set
keyboard backlight inactivity timeout to 5 seconds and call returned:

Res1=3D-2

So this smbios query is not safe :-( as it set some keyboard backlight
default values and return "error not supported".

So are you sure that 4, 11, 64 is call correct? Or is above side-effect
of setting keyboard backlight values expected?

> What's probably happening is that  the earlier system doesn't yet
> support key press simulation.  You can add a check for it with the ab=
ove.
>=20
> Now as for actually simulating a keypress, it can be programmed using
> the following calling interface (on receiving the e025 WMI notificati=
on).
> To actually simulate the keypress:
> Arg1=3D0x41
> Arg2 Byte [1:0]: Scan code to simulate
> Byte [3:2]
> * Bit0 - L Alt
> * Bit1 - R Alt
> * Bit2 - L Ctrl
> * Bit3 - R Ctrl
> * Bit4 - L Shift
> * Bit5 - R shift
> * Bit6 - L Win
> * Bit7 - R Win
> * Bit8 - Fn key
>=20
>=20

Hm... what does it means if some bit in Byte [3:2] is set together with
some scan code in Byte [1:0]?


Anyway Micha=C5=82 K=C4=99pie=C5=84 already decoded from ACPI DSDT code=
 that SBIOS WMI
call 17, 3 needs to be send to enable receiving events for e025 key. Se=
e
email: http://www.spinics.net/lists/platform-driver-x86/msg07195.htmls

After that on libsmbios-devel@lists.us.dell.com ML we got answer from
Srinivas_G_Gowda what SMBIOS call 17, 3 is doing, see email:
http://lists.us.dell.com/pipermail/libsmbios-devel/2015-July/000612.htm=
l

So I believe code like this:

    get_buffer();
    buffer->input[0] =3D 0x10000;
    buffer->input[1] =3D 0x51534554;
    buffer->input[3] =3D 0x1;
    dell_send_request(buffer, 17, 3);
    ret =3D buffer->output[0];
    release_buffer();

Could be OK for enabling e025 event. Or not? And if yes, how to detect
if we need to call this SMBIOS 17, 3 function?

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
