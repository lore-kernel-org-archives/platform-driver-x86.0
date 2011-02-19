From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH 3/8] sony-laptop: ignore hard switch rfkill events
	(SPIC)
Date: Sat, 19 Feb 2011 16:00:38 +0000
Message-ID: <20110219160038.GA5751@srcf.ucam.org>
References: <1298083952-22493-1-git-send-email-malattia@linux.it> <1298083952-22493-4-git-send-email-malattia@linux.it> <20110219030618.GA28870@srcf.ucam.org> <20110219124654.GA1726@kamineko.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:56480 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750952Ab1BSQAo (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 19 Feb 2011 11:00:44 -0500
Content-Disposition: inline
In-Reply-To: <20110219124654.GA1726@kamineko.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>
Cc: platform-driver-x86@vger.kernel.org, thomas.klose@hiperscan.com

On Sat, Feb 19, 2011 at 09:46:54PM +0900, Mattia Dongili wrote:
> On Sat, Feb 19, 2011 at 03:06:18AM +0000, Matthew Garrett wrote:
> > Do you possibly want to catch these and make sure the kernel rfkill 
> > state matches the hardware?
> 
> hmmmm, to be honest I'm not entirely sure what the actual problem is.
> Maybe it's just a timing issue that is made better by avoiding the
> input/acpi event generation. For now drop this patch (there is a
> different workaround using the mask parameter).

Delivering it to userspace can be racy - rfkill-input will try to toggle 
the state as well. So I think this is the right thing to do, but you 
might also want to use it to check the current hardware state and update 
the state of the rfkill device.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
