From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] thinkpad-acpi: Enable microphone mute LED
Date: Fri, 27 May 2011 17:48:55 +0100
Message-ID: <20110527164855.GA17443@srcf.ucam.org>
References: <8dc2b2140c2794291811cd38f51f9dc7596f482c.1306266017.git.luto@mit.edu>
 <20110527162844.GA16769@srcf.ucam.org>
 <BANLkTint5_Vcm5rWKHL_j5XsVmcAu8X7pw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:56045 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754433Ab1E0QtG (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 27 May 2011 12:49:06 -0400
Content-Disposition: inline
In-Reply-To: <BANLkTint5_Vcm5rWKHL_j5XsVmcAu8X7pw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andrew Lutomirski <luto@mit.edu>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

On Fri, May 27, 2011 at 12:39:10PM -0400, Andrew Lutomirski wrote:

> I don't have docs so I don't really know.  But the mute LED does not
> appear to be controllable from the LED interface and when mute is lit
> there's no sound regardless of what ALSA thinks.  When I light the
> micmute light, I can still record sound just fine.
> 
> The mic mute button does nothing on Windows unless the special driver
> is installed, and that driver seems to mute the Windows mixer, so I
> think there's nothing special other than a little userspace helper
> going on.

Hm. That makes things kind of tricky. While it's easy to just expose the 
LED, really we want to do it in such a way that userspace knows which 
LEDs it should be toggling while setting the microphone mute.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
