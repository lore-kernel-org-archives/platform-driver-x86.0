From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v1 1/1] surface pro 3: add a warning when switching to
 tablet mode
Date: Wed, 11 May 2016 12:56:46 -0700
Message-ID: <20160511195646.GB4225@f23x64.localdomain>
References: <1462880995-66192-1-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:40437 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932109AbcEKT4t (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 11 May 2016 15:56:49 -0400
Content-Disposition: inline
In-Reply-To: <1462880995-66192-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Chen Yu <yu.c.chen@intel.com>

On Tue, May 10, 2016 at 02:49:55PM +0300, Andy Shevchenko wrote:
> Microsoft Surface Book has a tablet mode button. Print another message once on
> this even instead of a bit annoying repetition of "Unknown event...".
> 
> Unfortunately we can't right now to implement the proper support of this since
> _DSM method is very likely owned by Microsoft and it's not too easy to just run
> it. Thus print a warning for now.
> 
> One may consider to evaluate GGIV method which seems responsible to return
> current mode in use.
> 

I cleaned up the language of this commit a bit to make it flow a bit better.
Please do keep the line length under 75 (checkpatch will complain) as this
avoids truncation with "git log".

I dropped the last bit about GGIV entirely as I try to leave speculative stuff
out of the commit logs where possible.

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I've pushed this to for-next, thanks Andy. Please have a look and let me know if
you disagree with any of the commit message changes, the code changes I left
intact.

-- 
Darren Hart
Intel Open Source Technology Center
