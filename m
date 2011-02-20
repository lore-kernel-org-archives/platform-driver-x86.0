From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH 3/8] sony-laptop: ignore hard switch rfkill events
 (SPIC)
Date: Sun, 20 Feb 2011 12:13:14 +0900
Message-ID: <20110220031314.GC1726@kamineko.org>
References: <1298083952-22493-1-git-send-email-malattia@linux.it>
 <1298083952-22493-4-git-send-email-malattia@linux.it>
 <20110219030618.GA28870@srcf.ucam.org>
 <20110219124654.GA1726@kamineko.org>
 <20110219160038.GA5751@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from static-220-247-10-204.b-man.svips.gol.ne.jp ([220.247.10.204]:55047
	"EHLO smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752238Ab1BTDNQ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 19 Feb 2011 22:13:16 -0500
Content-Disposition: inline
In-Reply-To: <20110219160038.GA5751@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, thomas.klose@hiperscan.com

On Sat, Feb 19, 2011 at 04:00:38PM +0000, Matthew Garrett wrote:
> On Sat, Feb 19, 2011 at 09:46:54PM +0900, Mattia Dongili wrote:
> > On Sat, Feb 19, 2011 at 03:06:18AM +0000, Matthew Garrett wrote:
> > > Do you possibly want to catch these and make sure the kernel rfkill 
> > > state matches the hardware?
> > 
> > hmmmm, to be honest I'm not entirely sure what the actual problem is.
> > Maybe it's just a timing issue that is made better by avoiding the
> > input/acpi event generation. For now drop this patch (there is a
> > different workaround using the mask parameter).
> 
> Delivering it to userspace can be racy - rfkill-input will try to toggle 
> the state as well. So I think this is the right thing to do, but you 
> might also want to use it to check the current hardware state and update 
> the state of the rfkill device.

Ah, alright. This makes a lot of sense with what was seen on Thomas'
laptop.
Then if you are ok to keep this patch as is, I'll work on
matching/flipping the rfkill device state separately.

Thanks
-- 
mattia
:wq!
