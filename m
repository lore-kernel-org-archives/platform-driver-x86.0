From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 1/4] platform/x86: intel_pmc_core: Show Latency Tolerance info
Date: Wed, 26 Sep 2018 20:14:15 +0300
Message-ID: <CAHp75Veeh3udVrWvdhAgPygcdWvBY6-=MBMy87=AUh4N-8ZRbQ@mail.gmail.com>
References: <20180903180415.31575-1-rajneesh.bhardwaj@linux.intel.com>
 <CAHp75Vesn4TrdF8tWLkU7nCRGp_o8fEK6gxpTkwM7E7zQo0qKg@mail.gmail.com> <04398317-a3b8-9387-e532-fcf26da9220e@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <04398317-a3b8-9387-e532-fcf26da9220e@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: rajneesh.bhardwaj@linux.intel.com
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Sep 26, 2018 at 5:15 PM Bhardwaj, Rajneesh
<rajneesh.bhardwaj@linux.intel.com> wrote:
> On 26-Sep-18 7:18 PM, Andy Shevchenko wrote:
> > On Mon, Sep 3, 2018 at 9:06 PM Rajneesh Bhardwaj
> > <rajneesh.bhardwaj@linux.intel.com> wrote:

> >> +       {"IP 16 : LTR_SCC",                     SPT_PMC_LTR_SCC},
> >> +       {"IP 17 : LTR_ISH",                     SPT_PMC_LTR_ISH},

> > Before no map has this fancy "IP xx :" prefixes. Please, remove.

>   The users of the driver often ask for IP Numbers while performing
> LTR_IGNORE operation so this is deliberately added. Please consider it.

You may enumerate during printing.

-- 
With Best Regards,
Andy Shevchenko
