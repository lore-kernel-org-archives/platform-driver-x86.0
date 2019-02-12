From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 09/10] platform/x86: intel_pmc_core: Add Package cstates
 residency info
Date: Tue, 12 Feb 2019 12:25:08 +0200
Message-ID: <CAHp75VeZwgM9KPNahmpsLzzkmOKDN2JeBKQWO9hBK_O=Gk8oFw@mail.gmail.com>
References: <20190201073234.13280-1-rajneesh.bhardwaj@linux.intel.com>
 <20190201073234.13280-10-rajneesh.bhardwaj@linux.intel.com>
 <20190211164118.GA23796@genxfsim-desktop> <78e5e6b3-5712-6ef5-283c-83b0f6d3dcc7@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <78e5e6b3-5712-6ef5-283c-83b0f6d3dcc7@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@linux.intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arjan van de Ven <arjan@linux.intel.com>, "David E. Box" <david.e.box@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Len Brown <len.brown@intel.com>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Feb 11, 2019 at 8:32 PM Bhardwaj, Rajneesh
<rajneesh.bhardwaj@linux.intel.com> wrote:
> On 11-Feb-19 10:11 PM, Anshuman Gupta wrote:
> > On Fri, Feb 01, 2019 at 01:02:33PM +0530, Rajneesh Bhardwaj wrote:
> >> This patch introduces a new debugfs entry to read current Package
> >> cstate residency counters. A similar variant of this patch was discussed
> >> earlier "https://patchwork.kernel.org/patch/9908563/" but didn't make it
> >> into mainline for various reasons. Current version only adds debugfs
> >> entry which is quite useful for S0ix debug but excludes the exported API
> >> that was there in initial version. Though there are tools like turbostat
> >> and socwatch which can also show this info but sometimes its more
> >> practical to have it here as it's hard to switch between various tools for
> >> S0ix debug when pmc_core driver is the primary debug tool. Internal and
> >> external customers have requested for this patch to be included in the
> >> PMC driver on many occasions and Google Chrome OS team has already included
> >> it in their builds. This becomes handy when requesting logs from external
> >> customers who may not always have above mentioned tools in their integrated
> >> kernel builds.

> >    Tested-by: Anshuman Gupta <anshuman.gupta@intel.com>
> >    Acked-by: Anshuman Gupta <anshuman.gupta@intel.com>

> Hi Andy, Darren - Can i used Acked-and-tested-by instead of these two?

Better to split. I didn't see in common practice acked-and-tested.
Rather reviewed-and-tested, or reported-and-tested.

-- 
With Best Regards,
Andy Shevchenko
