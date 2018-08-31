From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1 2/2] platform/x86: intel_pmc_core: Get rid of custom
 ICPU() macro
Date: Fri, 31 Aug 2018 11:52:01 +0300
Message-ID: <CAHp75VcwdDA8OW5f2qsgCBXUJePuE-wULLfS-076eXfUBTb0zg@mail.gmail.com>
References: <20180831083432.15872-1-andriy.shevchenko@linux.intel.com> <20180831083432.15872-2-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180831083432.15872-2-andriy.shevchenko@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Aug 31, 2018 at 11:50 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Replace custom grown macro with generic INTEL_CPU_FAM6() one.
>
> No functional change intended.

Actually there is one, that's why please drop this patch.

-- 
With Best Regards,
Andy Shevchenko
