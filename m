From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: Accelerometer and orientation sensor on Lenovo Ideapad S10-3t
Date: Fri, 27 May 2011 17:33:46 +0100
Message-ID: <20110527163346.GD16769@srcf.ucam.org>
References: <4DDE9B92.3090504@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:40037 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750774Ab1E0Qdw (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 27 May 2011 12:33:52 -0400
Content-Disposition: inline
In-Reply-To: <4DDE9B92.3090504@users.sourceforge.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alberto Mardegan <mardy@users.sourceforge.net>
Cc: platform-driver-x86@vger.kernel.org, "Javier S. Pedro" <maemo@javispedro.com>, Ike Panhc <ike.pan@canonical.com>

On Thu, May 26, 2011 at 09:27:30PM +0300, Alberto Mardegan wrote:

> I would use this code as a starting point (kudos to Javier):
> http://gitorious.org/iaps/lsrot/blobs/master/lsrot.c
> The code uses the WMI interfaces to get notified of coarse orientation
> changes.
> But how should these changes be reported to userspace? Should they go
> through the input subsystem (I didn't find any suitable key codes to
> report these events), or via the /sys filesystem? In the latter case, is
> there a convention on naming and reporting data from devices of this kind?

If we're not interested in providing continual fine-grained data then 
the easiest approach may be to present as an input device and then just 
send updated values whenever you receive the coarse udpate signal. But 
you probably want to bring this up on LKML so we can make sure 
everyone's exposing this in the same way.

> Secondly, I'd like to add support for reading the accelerometer values,
> as it's done here (again, kudos to Javier):
> http://gitorious.org/iaps/iaps/blobs/master/iaps.c
> I know that no one is happy of directly accessing the raw I/O ports, but
> all my attempts of reading these values through the ACPI interfaces or
> the EC fields have failed: the fields are always set to 0.

Does the accelerometer appear as an ACPI device?

> And finally: should the changes above be made to the existing
> ideapad-laptop.c file, or should they go to a separate file/module?

ideapad-laptop seems appropriate, unless the accelerometer is its own 
ACPI device that appears in other hardware as well.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
