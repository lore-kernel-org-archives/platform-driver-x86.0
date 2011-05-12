From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [RFC PATCH] thinkpad-acpi: Improve hardware volume controls
Date: Thu, 12 May 2011 15:39:12 +0100
Message-ID: <20110512143912.GA28141@srcf.ucam.org>
References: <bf402af225e7005f052a8ccf92962efa48cbe703.1304979290.git.luto@mit.edu>
 <20110512134827.GA26159@srcf.ucam.org>
 <BANLkTimmrM4HMATSbsYzz6kh=e9hrfAZmg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:33293 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757541Ab1ELOjV (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 12 May 2011 10:39:21 -0400
Content-Disposition: inline
In-Reply-To: <BANLkTimmrM4HMATSbsYzz6kh=e9hrfAZmg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andrew Lutomirski <luto@mit.edu>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

On Thu, May 12, 2011 at 10:24:10AM -0400, Andrew Lutomirski wrote:
> On Thu, May 12, 2011 at 9:48 AM, Matthew Garrett <mjg59@srcf.ucam.org> wrote:
> > It looks like SAUM was introduced with the *61 machines, and it's
> > identical from then on.
> 
> I wonder the machines with SAUM are the same as the machines on which
> pressing mute generates an i8042 keystroke instead of an HKEY.  If so,
> it looks like there's some code (or at least comments) in
> thinkpad_acpi that mention doing the right thing when the HKEY mute
> event in generated (e.g. the driver won't send KEY_MUTE to the input
> layer), so something like my patch along with removing the _OSI(Linux)
> hack for the newer models might make everything work right.

I think so. The machines we have in the OSI blacklist all appear to have 
the SAUM method, so I think we can take your patch and drop the 
blacklist. Good work!

> Still, someone who has an older laptop should test it, because all I
> can do is pretend I carefully inspected all the possible code paths.

I can't see any way this would cause problems, except in the case where 
the method exists but doesn't do anything. I'd be surprised if that's a 
real problem.

> (Even if it works, don't apply this patch for 2.6.40 as it stands
> because the ALSA change notification on KEY_MUTE is crap and should at
> least ignore key release events.)

Are you working with the ALSA people on that?

-- 
Matthew Garrett | mjg59@srcf.ucam.org
