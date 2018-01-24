From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/4] seq_file: Introduce DEFINE_SHOW_ATTRIBUTE()
 helper macro
Date: Wed, 24 Jan 2018 09:11:38 +0200
Message-ID: <1516777898.7000.1210.camel@linux.intel.com>
References: <20180122160546.51611-1-andriy.shevchenko@linux.intel.com>
         <20180123091508.6vpygg6ahrnynpks@dell> <20180124000529.GH16464@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:29967 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752355AbeAXHLl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 24 Jan 2018 02:11:41 -0500
In-Reply-To: <20180124000529.GH16464@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>
Cc: platform-driver-x86@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Marcel Holtmann <marcel@holtmann.org>, linux-kernel@vger.kernel.org

On Tue, 2018-01-23 at 16:05 -0800, Darren Hart wrote:
> On Tue, Jan 23, 2018 at 09:15:08AM +0000, Lee Jones wrote:
> > On Mon, 22 Jan 2018, Andy Shevchenko wrote:
> > 
> > > The DEFINE_SHOW_ATTRIBUTE() helper macro would be useful for
> > > current
> > > users, which are many of them, and for new comers to decrease code
> > > duplication.
> > > 
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > ---
> > >  drivers/mfd/ab8500-debugfs.c    | 14 --------------
> > 
> > Acked-by: Lee Jones <lee.jones@linaro.org>
> 
> Thanks Andy,
> 
> Acked-by: Darren Hart (VMware) <dvhart@infradead.org>

Just to clarify a bit.

Since the patch series is based on linux-next, the idea is to push it
and send as second PR to Linus, after others will be ready in mainline.

The rationale is to allow many other current users and perhaps new
comers, e.g. [1], to utilize it already in the next cycle.

[1]: https://patchwork.kernel.org/patch/10172393/

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
