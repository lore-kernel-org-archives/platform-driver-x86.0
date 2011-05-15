From: Andrew Lutomirski <luto@mit.edu>
Subject: Re: [PATCH v3] thinkpad-acpi: Improve hardware volume controls
Date: Sun, 15 May 2011 15:22:38 -0400
Message-ID: <BANLkTimsr_tw8o2VmF5PdrMHm=M6SoOTBA@mail.gmail.com>
References: <20110512204213.GA8776@core.coreip.homeip.net> <75329ac2644b3832911882e23e9308c3dc88518c.1305386829.git.luto@mit.edu>
 <20110514154744.GB15681@srcf.ucam.org> <BANLkTinb2dOLsmbZ7HwK_gQTkX_+eo5jpQ@mail.gmail.com>
 <20110514184151.GD7171@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:64408 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751388Ab1EOTW6 convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 15 May 2011 15:22:58 -0400
Received: by pwi15 with SMTP id 15so1838590pwi.19
        for <platform-driver-x86@vger.kernel.org>; Sun, 15 May 2011 12:22:58 -0700 (PDT)
In-Reply-To: <20110514184151.GD7171@khazad-dum.debian.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Bruce Hill <bruce@slackwarebox.com>

On Sat, May 14, 2011 at 2:41 PM, Henrique de Moraes Holschuh
<hmh@hmh.eng.br> wrote:
> On Sat, 14 May 2011, Andrew Lutomirski wrote:
>> I think that on Windows on everything older than X220, pressing mute
>> unconditionally mutes the sound, so it's a nice way to tell the syst=
em
>> "don't make noise, regardless of what current settings are."
>
> Yay, so the thinkpads have been un-dumbeddown. =A0I love uplifting!
>
>> The behavior I implemented reads the default from BIOS so that we do
>> the right thing (or at least the thing that Lenovo intended) on all =
of
>
> Does the BIOS have a setup "control" for the user to chose MUTE behav=
iour?

Not that I can find.

Bad news, though: the SAUM control is different on the X200.  The setti=
ngs are:

0: latching mode.  (mute unconditionally mutes but does not send any ke=
ystroke)
1: same as 3?
2: software mode.  (mute sends e020, which is standard for a mute butto=
n)
3: weird. (mute sends e060 and does not seem to affect the mute state)

So, two differences from x220.  First, toggle is screwy and there
seems to be no point in using it.  Second, latching mode does not send
any keystroke.

I suspect that 0 was always the default and 2 was the value that got
programmed if OSI=3DLinux, and 1 and 3 were just some random garbage.
Then, when the X220 was designed with a light, the designers wanted
toggle mode and repurposed an unused value.  So it's probably safe to
assume that 0 and 2 will remain at least similarly-behaving in future
models.

There are a few possible things to do:

1. Read HAUM at startup.  If it's 0, assume that only latching mode
and software mute are valid.  If it's 2 (as it is on the X220), then
assume that toggle is valid as well.

2. On some or all models that have SAUM, read the initial state to
figure out what the default should be, then call SAUM(2) and just
emulate the mute button in software.

Benefits of the former:
 - It's easy
 - No regressions :)

Benefits of the latter:
 - X200 gets ALSA notifications when the volume changes.
 - Toggle is available on all recent models.
 - We can emulate toggle a little better than the EC does: holding
down the mute button really shouldn't flip it back and forth rapidly.

Downsides of the latter:  if the kernel dies in such a way that it's
making noise, the mute button won't shut it up.

In either case, I think we should write the initial value back to
hardware on module unload so we don't get confused if we get loaded
again.


I'll email the pulseaudio list and ask what they want to do about the
mixer.  Ignoring it is fine, if slightly confusing on models without a
light.  (But then we've behaved that way on everything except the
three models in the OSI=3DLinux list forever.)

--Andy
