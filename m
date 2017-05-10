From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 2/3] platform/x86: thinkpad_acpi: Join string
 literals back
Date: Wed, 10 May 2017 13:51:48 +0300
Message-ID: <1494413508.30052.100.camel@linux.intel.com>
References: <20170509141721.15841-1-andriy.shevchenko@linux.intel.com>
         <20170509141721.15841-2-andriy.shevchenko@linux.intel.com>
         <20170509171040.GD19242@khazad-dum.debian.net>
         <1494351185.30052.94.camel@linux.intel.com>
         <1494375875.1064702.971453736.29BB0B11@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:64683 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751423AbdEJKwC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 10 May 2017 06:52:02 -0400
In-Reply-To: <1494375875.1064702.971453736.29BB0B11@webmail.messagingengine.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 2017-05-09 at 21:24 -0300, Henrique de Moraes Holschuh wrote:
> On Tue, May 9, 2017, at 14:33, Andy Shevchenko wrote:
> > On Tue, 2017-05-09 at 14:10 -0300, Henrique de Moraes Holschuh
> > wrote:
> > > > While here, print negative error without changing a sign as it
> > > > is a
> > > > common pattern in the kernel.
> > > 
> > > A separate patch for this would be better: it would be easier to
> > > actually check that no functional changes crept in by mistake.
> > 
> > It doesn't make sense to me. It would touch same lines of code I do
> > already here and it's only one place, see below.
> 
> I had to go line-by-line looking for the darn thing, instead of just
> compiling before-and-after and checking for an unchanged  object file.
> 
> > > >  	rc = fan_set_enable();
> > > >  	if (rc < 0) {
> > > > -		pr_err("fan watchdog: error %d while enabling
> > > > fan,
> > > > "
> > > > -		       "will try again later...\n", -rc);
> > > > +		pr_err("fan watchdog: error %d while enabling
> > > > fan,
> > > > will try again later...\n",
> > > > +		       rc);
> 
> Yeah. This one.  I don't have a problem with this change at all (I
> acked
> it), but it took some effort to find the nail in the hailstack.

Okay, what I'm going to do is:
1) drop patch 1 for now;
2) split patch 2 into two patches (and append your Ack on both);
3) push to our testing branch (I can send v2 if we need one more round
of review).

Tell me if there is any objection.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
