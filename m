From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH v3] thinkpad-acpi: Improve hardware volume controls
Date: Sat, 14 May 2011 15:41:51 -0300
Message-ID: <20110514184151.GD7171@khazad-dum.debian.net>
References: <20110512204213.GA8776@core.coreip.homeip.net>
 <75329ac2644b3832911882e23e9308c3dc88518c.1305386829.git.luto@mit.edu>
 <20110514154744.GB15681@srcf.ucam.org>
 <BANLkTinb2dOLsmbZ7HwK_gQTkX_+eo5jpQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out2.smtp.messagingengine.com ([66.111.4.26]:60669 "EHLO
	out2.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753142Ab1ENSly (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 14 May 2011 14:41:54 -0400
Content-Disposition: inline
In-Reply-To: <BANLkTinb2dOLsmbZ7HwK_gQTkX_+eo5jpQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andrew Lutomirski <luto@mit.edu>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Bruce Hill <bruce@slackwarebox.com>

On Sat, 14 May 2011, Andrew Lutomirski wrote:
> I think that on Windows on everything older than X220, pressing mute
> unconditionally mutes the sound, so it's a nice way to tell the system
> "don't make noise, regardless of what current settings are."

Yay, so the thinkpads have been un-dumbeddown.  I love uplifting!

> The behavior I implemented reads the default from BIOS so that we do
> the right thing (or at least the thing that Lenovo intended) on all of

Does the BIOS have a setup "control" for the user to chose MUTE behaviour?

> Later on, maybe we could convince PulseAudio to notice the mixer we
> expose and do something even nicer (like show a hardware mute OSD).

*PLEASE* do.  I once talked with the ALSA guys about actually doing a
piggyback mixer control and attaching it to the HDA/AC97 mixer of the
internal soundcard, but it was not exactly easy or kosher to do that at that
level.

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
