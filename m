From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] platform/x86: intel_pmc_ipc: read s0ix residency API
Date: Wed, 08 Feb 2017 14:52:16 +0200
Message-ID: <1486558336.2133.390.camel@linux.intel.com>
References: <1486386591-5739-1-git-send-email-shanth.murthy@intel.com>
         <201702062146.dHHXqmBG%fengguang.wu@intel.com>
         <20170206183122.GA14651@rajaneesh-OptiPlex-9010>
         <CAHp75VdHArjvkkx2CiLQZ2fvhwNhChNwvoCKrU7g7RMj=-nG=w@mail.gmail.com>
         <20170208120232.GA2363@rajaneesh-OptiPlex-9010>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170208120232.GA2363@rajaneesh-OptiPlex-9010>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: kbuild test robot <lkp@intel.com>, Shanth Murthy <shanth.murthy@intel.com>, kbuild-all@01.org, Platform Driver <platform-driver-x86@vger.kernel.org>, "dvhart@infradead.org" <dvhart@infradead.org>, Zha Qipeng <qipeng.zha@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, 2017-02-08 at 17:32 +0530, Rajneesh Bhardwaj wrote:
> On Tue, Feb 07, 2017 at 12:19:10PM +0200, Andy Shevchenko wrote:
> > On Mon, Feb 6, 2017 at 8:31 PM, Rajneesh Bhardwaj
> > <rajneesh.bhardwaj@intel.com> wrote:
> > > On Mon, Feb 06, 2017 at 10:01:43PM +0800, kbuild test robot wrote:

> Andy, thanks for the fix. We had a look at the patch that was pushed
> to
> testing and think that still one issue exist when we compile with
> CONFIG_64BIT not set. Config attached.
> (linux-platform-drivers-
> x86.git/commit/c0baf79f459dbbdfe272dda58d5bcc9a2e585d7e) 
> 
> Error:
> drivers/built-in.o: In function `intel_pmc_s0ix_counter_read':
> (.text+0x7352b4): undefined reference to `__udivdi3'
> make[2]: *** [vmlinux] Error 1

Thanks for report, Darren already reported this yesterday.

> In addition to this, please share your thoughts on the below change
> for IPC
> driver.

Thanks, but that's wrong.
I know what is the issue and how to fix it. Will do it soon.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
