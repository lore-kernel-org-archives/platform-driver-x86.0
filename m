From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: WMI and Kernel:User interface
Date: Mon, 19 Jun 2017 22:24:01 +0100
Message-ID: <20170619212401.GA11774@srcf.ucam.org>
References: <20170509231639.GB11404@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:54472 "EHLO
        cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751022AbdFSW2R (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 19 Jun 2017 18:28:17 -0400
Content-Disposition: inline
In-Reply-To: <20170509231639.GB11404@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mario Limonciello <mario_limonciello@dell.com>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rafael Wysocki <rjw@rjwysocki.net>, Andy Lutomirski <luto@amacapital.net>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org

On Tue, May 09, 2017 at 04:16:39PM -0700, Darren Hart wrote:

> To address this, I have proposed [3] that exporting WMI be opt-in, only done at
> the request of and in collaboration with a vendor, with the kernel platform
> driver given the opportunity to filter requests. This filtering would need to be
> at the method and argument inspection level, such as checking for specific bits
> in the input buffer, and rejecting the request if they conflict with an in
> kernel usage (that's worst case, in some cases just GUID or method ID could be
> sufficient).

WMI calls generally end up triggering system management mode, and SMM is 
a mess of insecure code. People have been putting extensive effort into 
avoiding mechanisms that allow root to escalate to higher privilege 
levels - this is almost certainly the opposite of that. If the filtering 
is sufficient to guarantee that no invalid input will ever hit the 
firmware then that's not a problem, but that doesn't seem meaningfully 
less complicated than just writing a proper driver in the first place.

As things stand, I think this is functionality that would have to be 
disabled by the lockdown patchset, which means that it's functionality 
that wouldn't exist for the majority of non-server platforms (and an 
increasing number of server platforms).
-- 
Matthew Garrett | mjg59@srcf.ucam.org
