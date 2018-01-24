From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v1 1/4] seq_file: Introduce DEFINE_SHOW_ATTRIBUTE()
 helper macro
Date: Tue, 23 Jan 2018 16:05:29 -0800
Message-ID: <20180124000529.GH16464@fury>
References: <20180122160546.51611-1-andriy.shevchenko@linux.intel.com>
 <20180123091508.6vpygg6ahrnynpks@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180123091508.6vpygg6ahrnynpks@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, platform-driver-x86@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Marcel Holtmann <marcel@holtmann.org>, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Jan 23, 2018 at 09:15:08AM +0000, Lee Jones wrote:
> On Mon, 22 Jan 2018, Andy Shevchenko wrote:
> 
> > The DEFINE_SHOW_ATTRIBUTE() helper macro would be useful for current
> > users, which are many of them, and for new comers to decrease code
> > duplication.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  drivers/mfd/ab8500-debugfs.c    | 14 --------------
> 
> Acked-by: Lee Jones <lee.jones@linaro.org>

Thanks Andy,

Acked-by: Darren Hart (VMware) <dvhart@infradead.org>


-- 
Darren Hart
VMware Open Source Technology Center
