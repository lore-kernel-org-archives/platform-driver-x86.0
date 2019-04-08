From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3 2/3] platform/x86: intel_pmc_core: Allow to dump debug
 registers on S0ix failure
Date: Mon, 8 Apr 2019 22:33:54 +0300
Message-ID: <CAHp75VcU9VvV3M5jVxE6ezii7d4JtFXPG7D-0zRF_amW+bEGdQ@mail.gmail.com>
References: <20190313222124.229371-1-rajatja@google.com> <20190405203558.19160-1-rajatja@google.com>
 <20190405203558.19160-2-rajatja@google.com> <CAHp75VehpYPm1ApFozisSsNi1g0EtbKBm3C97jxXC2u04tpt0A@mail.gmail.com>
 <CACK8Z6FGFiS_jN_5ctWmjKbrcUyjGkV0MsVs7_2TsaS7UAoydA@mail.gmail.com>
 <CAHp75Ve9zq2MWbiHhNV6RSV8xgmWQdqaMi=UdE7RFiZ9QgmH5Q@mail.gmail.com> <CACK8Z6Fb603NV-CreX6mxgj=JF0VmfP0kORHZg5T8L5vOeTsQA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACK8Z6Fb603NV-CreX6mxgj=JF0VmfP0kORHZg5T8L5vOeTsQA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajat Jain <rajatja@google.com>
Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tomasz Wysocki <Wysocki@google.com>, Rafael J <rafael.j.wysocki@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Furquan Shaikh <furquan@google.com>, Evan Green <evgreen@google.com>, Rajat Jain <rajatxjain@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Apr 8, 2019 at 9:58 PM Rajat Jain <rajatja@google.com> wrote:
> On Mon, Apr 8, 2019 at 11:41 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Mon, Apr 8, 2019 at 9:36 PM Rajat Jain <rajatja@google.com> wrote:

> > Instead of adding module parameter and doing these prints, perhaps
> > introduce another debugfs node.
>
> Uh, I actually did wanted to print them at the resume time in kernel
> logs, because I think this is something kernel developers would be
> responsible for debugging and thus would be great to have this
> included within the kernel logs. User space tools may differ on
> different distros and may or may not be looking for S0ix failures, and
> particularly may not dump this new debugfs attribute.
>
> The other thing is that seemingly this could also help in situations
> where debugfs is not configured?

The keywords above "developers", "debugging",  so, the concept of this
driver is almost all about debugging, debugfs is not for users or esp.
user space tools.
So, I don't see any issue here with creating another node and use it
for *debugging* whenever it's needed.

-- 
With Best Regards,
Andy Shevchenko
