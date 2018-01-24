From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v1 1/4] seq_file: Introduce DEFINE_SHOW_ATTRIBUTE()
 helper macro
Date: Wed, 24 Jan 2018 15:12:26 +0000
Message-ID: <20180124151226.thcagxj2p4hbr7m3@dell>
References: <20180122160546.51611-1-andriy.shevchenko@linux.intel.com>
 <20180123091508.6vpygg6ahrnynpks@dell>
 <20180124000529.GH16464@fury>
 <1516777898.7000.1210.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:34907 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934102AbeAXPMa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 24 Jan 2018 10:12:30 -0500
Received: by mail-wm0-f66.google.com with SMTP id r78so9300115wme.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Jan 2018 07:12:30 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1516777898.7000.1210.camel@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Marcel Holtmann <marcel@holtmann.org>, linux-kernel@vger.kernel.org

On Wed, 24 Jan 2018, Andy Shevchenko wrote:

> On Tue, 2018-01-23 at 16:05 -0800, Darren Hart wrote:
> > On Tue, Jan 23, 2018 at 09:15:08AM +0000, Lee Jones wrote:
> > > On Mon, 22 Jan 2018, Andy Shevchenko wrote:
> > > 
> > > > The DEFINE_SHOW_ATTRIBUTE() helper macro would be useful for
> > > > current
> > > > users, which are many of them, and for new comers to decrease code
> > > > duplication.
> > > > 
> > > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > > ---
> > > >  drivers/mfd/ab8500-debugfs.c    | 14 --------------
> > > 
> > > Acked-by: Lee Jones <lee.jones@linaro.org>
> > 
> > Thanks Andy,
> > 
> > Acked-by: Darren Hart (VMware) <dvhart@infradead.org>
> 
> Just to clarify a bit.
> 
> Since the patch series is based on linux-next, the idea is to push it
> and send as second PR to Linus, after others will be ready in mainline.
> 
> The rationale is to allow many other current users and perhaps new
> comers, e.g. [1], to utilize it already in the next cycle.

You already have my Ack.  Knock yourself out.

> [1]: https://patchwork.kernel.org/patch/10172393/

-- 
Lee Jones
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
