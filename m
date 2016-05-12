From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] surface pro 3: add a warning when switching to
 tablet mode
Date: Thu, 12 May 2016 15:32:31 +0300
Message-ID: <1463056351.17131.315.camel@linux.intel.com>
References: <1462880995-66192-1-git-send-email-andriy.shevchenko@linux.intel.com>
	 <20160511195646.GB4225@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:60471 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751713AbcELMbX (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 12 May 2016 08:31:23 -0400
In-Reply-To: <20160511195646.GB4225@f23x64.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, Chen Yu <yu.c.chen@intel.com>

On Wed, 2016-05-11 at 12:56 -0700, Darren Hart wrote:
> On Tue, May 10, 2016 at 02:49:55PM +0300, Andy Shevchenko wrote:
> > 
> > Microsoft Surface Book has a tablet mode button. Print another
> > message once on
> > this even instead of a bit annoying repetition of "Unknown
> > event...".
> > 
> > Unfortunately we can't right now to implement the proper support of
> > this since
> > _DSM method is very likely owned by Microsoft and it's not too easy
> > to just run
> > it. Thus print a warning for now.
> > 
> > One may consider to evaluate GGIV method which seems responsible to
> > return
> > current mode in use.
> > 
> I cleaned up the language of this commit a bit to make it flow a bit
> better.
> Please do keep the line length under 75 (checkpatch will complain) as
> this
> avoids truncation with "git log".

Noted.

> 
> I dropped the last bit about GGIV entirely as I try to leave
> speculative stuff
> out of the commit logs where possible.
> 
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> I've pushed this to for-next, thanks Andy. Please have a look and let
> me know if
> you disagree with any of the commit message changes, the code changes
> I left
> intact.

I checked and found it nice and clean. Thanks, Darren!

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
