From: Andrew Lutomirski <luto@mit.edu>
Subject: Re: [PATCH v3] thinkpad-acpi: Improve hardware volume controls
Date: Sat, 14 May 2011 11:55:49 -0400
Message-ID: <BANLkTinb2dOLsmbZ7HwK_gQTkX_+eo5jpQ@mail.gmail.com>
References: <20110512204213.GA8776@core.coreip.homeip.net> <75329ac2644b3832911882e23e9308c3dc88518c.1305386829.git.luto@mit.edu>
 <20110514154744.GB15681@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:34494 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758271Ab1ENP4J convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 14 May 2011 11:56:09 -0400
Received: by pvg12 with SMTP id 12so1540278pvg.19
        for <platform-driver-x86@vger.kernel.org>; Sat, 14 May 2011 08:56:09 -0700 (PDT)
In-Reply-To: <20110514154744.GB15681@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Bruce Hill <bruce@slackwarebox.com>

On Sat, May 14, 2011 at 11:47 AM, Matthew Garrett <mjg59@srcf.ucam.org>=
 wrote:
> On Sat, May 14, 2011 at 11:34:25AM -0400, Andy Lutomirski wrote:
>
>> It turns out that we can ask ACPI for one of three behaviors
>> directly. =A0They are "latch" (the default), "none" (no automatic
>> control), and "toggle" (mute unmutes when muted). =A0So we let the
>> user control the mode through sysfs, and we don't generate KEY_MUTE
>> in any mode other than "none".
>>
>> As an added bonus, we fix an old bug: the hardware mute control
>> doesn't generate an ALSA change notification on newer ThinkPads.
>
> Which of these modes make sense for userspace? "none" sounds like it'=
d
> be fine, except that the LED wouldn't work on new machines. So should=
 we
> just be setting "toggle" in all cases? The optimal situation would be
> that we delete the OSI blacklist at the same time as we add this code=
=2E

It's somewhat of a matter of preference.

I think that on Windows on everything older than X220, pressing mute
unconditionally mutes the sound, so it's a nice way to tell the system
"don't make noise, regardless of what current settings are."

On the X220, there's a dedicated mute indicator and the button toggles
it.  So if set "none" then we lose the use of the indicator and the
ability to reliably mute the system without thought.

The behavior I implemented reads the default from BIOS so that we do
the right thing (or at least the thing that Lenovo intended) on all of
these models unless the user writes something different to
volume_autocontrol.  (Disclaimer: I haven't actually tested the code
on anything other than X220.)

Later on, maybe we could convince PulseAudio to notice the mixer we
expose and do something even nicer (like show a hardware mute OSD).

--Andy
