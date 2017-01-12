From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH v2 1/1] platform/x86: Remove PMIC GPIO block support
Date: Thu, 12 Jan 2017 08:47:24 +0100
Message-ID: <20170112074724.GC30151@gmail.com>
References: <20170111172446.64258-1-andriy.shevchenko@linux.intel.com>
 <1484156366.2133.73.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1484156366.2133.73.camel@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org


* Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Wed, 2017-01-11 at 19:24 +0200, Andy Shevchenko wrote:
> > The Moorestown support was removed by commit 1a8359e411eb ("x86/mid:
> > Remove
> > Intel Moorestown").
> > 
> > Remove this leftover.
> > 
> 
> +Cc: Ingo
> 
> Ingo, this is the driver we would like to remove as well. All users of
> it has been removed by previous patches sent and applied to tip tree.
> 
> Can you review and push this one as well?
> 
> P.S. If resend is needed I would be glad to do tomorrow.

Yeah, please resend it against the latestest -tip, I wasn't on the original Cc:.

Thanks,

	Ingo
