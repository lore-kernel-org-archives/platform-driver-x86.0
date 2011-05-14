From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH v3] thinkpad-acpi: Improve hardware volume controls
Date: Sat, 14 May 2011 16:47:44 +0100
Message-ID: <20110514154744.GB15681@srcf.ucam.org>
References: <20110512204213.GA8776@core.coreip.homeip.net>
 <75329ac2644b3832911882e23e9308c3dc88518c.1305386829.git.luto@mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:57588 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757560Ab1ENPr6 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 14 May 2011 11:47:58 -0400
Content-Disposition: inline
In-Reply-To: <75329ac2644b3832911882e23e9308c3dc88518c.1305386829.git.luto@mit.edu>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Lutomirski <luto@MIT.EDU>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Bruce Hill <bruce@slackwarebox.com>

On Sat, May 14, 2011 at 11:34:25AM -0400, Andy Lutomirski wrote:

> It turns out that we can ask ACPI for one of three behaviors
> directly.  They are "latch" (the default), "none" (no automatic
> control), and "toggle" (mute unmutes when muted).  So we let the
> user control the mode through sysfs, and we don't generate KEY_MUTE
> in any mode other than "none".
> 
> As an added bonus, we fix an old bug: the hardware mute control
> doesn't generate an ALSA change notification on newer ThinkPads.

Which of these modes make sense for userspace? "none" sounds like it'd 
be fine, except that the LED wouldn't work on new machines. So should we 
just be setting "toggle" in all cases? The optimal situation would be 
that we delete the OSI blacklist at the same time as we add this code.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
