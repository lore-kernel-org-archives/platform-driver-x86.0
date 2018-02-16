From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v1] platform/x86: wmi: Replace kmalloc + sprintf() with
 kasprintf()
Date: Fri, 16 Feb 2018 11:54:10 -0800
Message-ID: <20180216195410.GF5786@fury>
References: <20180216154024.389-1-andriy.shevchenko@linux.intel.com>
 <829ccf8330b7418a976205665e0ab4bd@AcuMS.aculab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:37258 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750727AbeBPTyQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 16 Feb 2018 14:54:16 -0500
Content-Disposition: inline
In-Reply-To: <829ccf8330b7418a976205665e0ab4bd@AcuMS.aculab.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: David Laight <David.Laight@ACULAB.COM>
Cc: 'Andy Shevchenko' <andriy.shevchenko@linux.intel.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Feb 16, 2018 at 03:55:24PM +0000, David Laight wrote:
> From: Andy Shevchenko
> > Sent: 16 February 2018 15:40
> >
> > kasprintf() does the job of two: kmalloc() and sprintf().
> > Replace two calls with one.
> ...
> > -		buf = kmalloc(strlen(wdriver->driver.name) + 5, GFP_KERNEL);
> > +		buf = kasprintf(GFP_KERNEL, "wmi/%s", wdriver->driver.name);
> ...
> 
> Except that kasprintf() has no idea how long a buffer is needed.
> It might even do the printf twice just to get the length.

Sure, but this is one-time and non-critical path. Unfortunately there
isn't any guidance in Documentation here. Of the 520 or so instances of
kasprintf usages in the kernel, device name or similar is a very common
pattern. Eliminating manual counting of characters for buffer allocation
seems like a good plan to me.

So unless we want to argue that all those use cases are wrong, this
would appear to be at least common practice, if not best practice for
this particular pattern.

Reviewed-by: Darren Hart (VMware) <dvhart@infradead.org>

-- 
Darren Hart
VMware Open Source Technology Center
