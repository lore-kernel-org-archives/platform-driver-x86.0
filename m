From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 2/3] platform/x86: thinkpad_acpi: Join string
 literals back
Date: Tue, 09 May 2017 20:33:05 +0300
Message-ID: <1494351185.30052.94.camel@linux.intel.com>
References: <20170509141721.15841-1-andriy.shevchenko@linux.intel.com>
         <20170509141721.15841-2-andriy.shevchenko@linux.intel.com>
         <20170509171040.GD19242@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:36424 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752049AbdEIRej (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 9 May 2017 13:34:39 -0400
In-Reply-To: <20170509171040.GD19242@khazad-dum.debian.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 2017-05-09 at 14:10 -0300, Henrique de Moraes Holschuh wrote:

Thanks for review, my comments below.

> On Tue, 09 May 2017, Andy Shevchenko wrote:
> > There is no point to keep string literal split. It even makes
> > slightly
> > harder to maintain and debug.
> 
> Ooold code, from a time when random people would annoy others over
> 80-column instead of doing useful reviews...

Yes, I know, nowadays checkpatch doesn't complain on them.

> > While here, print negative error without changing a sign as it is a
> > common pattern in the kernel.
> 
> A separate patch for this would be better: it would be easier to
> actually check that no functional changes crept in by mistake.

It doesn't make sense to me. It would touch same lines of code I do
already here and it's only one place, see below.

> >  	rc = fan_set_enable();
> >  	if (rc < 0) {
> > -		pr_err("fan watchdog: error %d while enabling fan,
> > "
> > -		       "will try again later...\n", -rc);
> > +		pr_err("fan watchdog: error %d while enabling fan,
> > will try again later...\n",
> > +		       rc);


-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
