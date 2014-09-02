From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCHv2] ideapad-laptop: Constify DMI table for real!
Date: Tue, 2 Sep 2014 15:20:17 -0700
Message-ID: <20140902222017.GA11195@vmdeb7>
References: <1409223769-8660-1-git-send-email-minipli@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:39403 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755759AbaIBWUM (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 2 Sep 2014 18:20:12 -0400
Content-Disposition: inline
In-Reply-To: <1409223769-8660-1-git-send-email-minipli@googlemail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mathias Krause <minipli@googlemail.com>
Cc: Darren Hart <dvhart@linux.intel.com>, Dan Carpenter <dan.carpenter@oracle.com>, platform-driver-x86@vger.kernel.org, Matthew Garrett <matthew.garrett@nebula.com>, Ike Panhc <ike.pan@canonical.com>

On Thu, Aug 28, 2014 at 01:02:49PM +0200, Mathias Krause wrote:
> This is a follow-up patch to commit 49458e83082d ("ideapad-laptop:
> Constify DMI table and other r/o variables") to do what its commit
> message says. The actual commit differs from the patch posted at
> https://www.mail-archive.com/platform-driver-x86@vger.kernel.org/msg05340.html
> significantly, probably due to a bad merge conflict resolution. Fix up
> the mess and constify the DMI table for real and fix the bogus
> double-const of ideapad_rfk_data[].
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Mathias Krause <minipli@googlemail.com>
> Cc: Matthew Garrett <matthew.garrett@nebula.com>
> Cc: Ike Panhc <ike.pan@canonical.com>
> ---
> Initial patch was posted here but somehow has fallen through the cracks:
> https://www.mail-archive.com/platform-driver-x86@vger.kernel.org/msg05398.html
> 
> v2:
> - rebased to linux-platform-drivers-x86.git/for-linus
> - removed the second DMI table constification as that code was reverted
>   by commit 3b264d279e72 ("Revert "ideapad-laptop: Disable touchpad...")

Queued, thanks.

--
Darren Hart
Intel Open Source Technology Center
