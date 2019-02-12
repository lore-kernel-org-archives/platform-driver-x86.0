From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 09/10] platform/x86: intel_pmc_core: Add Package cstates
 residency info
Date: Tue, 12 Feb 2019 12:38:50 +0200
Message-ID: <CAHp75VdDDe1xM7dOAQ==fpSFW6qMiSqRD_9vXF83XGb3YGbBFw@mail.gmail.com>
References: <20190201073234.13280-1-rajneesh.bhardwaj@linux.intel.com>
 <20190201073234.13280-10-rajneesh.bhardwaj@linux.intel.com>
 <20190211164118.GA23796@genxfsim-desktop> <78e5e6b3-5712-6ef5-283c-83b0f6d3dcc7@linux.intel.com>
 <CAHp75VeZwgM9KPNahmpsLzzkmOKDN2JeBKQWO9hBK_O=Gk8oFw@mail.gmail.com> <38444053-cbab-ae6d-9504-18ca3cd84d15@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <38444053-cbab-ae6d-9504-18ca3cd84d15@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@linux.intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arjan van de Ven <arjan@linux.intel.com>, "David E. Box" <david.e.box@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Len Brown <len.brown@intel.com>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Feb 12, 2019 at 12:34 PM Bhardwaj, Rajneesh
<rajneesh.bhardwaj@linux.intel.com> wrote:
> On 12-Feb-19 3:55 PM, Andy Shevchenko wrote:
> > On Mon, Feb 11, 2019 at 8:32 PM Bhardwaj, Rajneesh
> > <rajneesh.bhardwaj@linux.intel.com> wrote:
> >> On 11-Feb-19 10:11 PM, Anshuman Gupta wrote:
> >>> On Fri, Feb 01, 2019 at 01:02:33PM +0530, Rajneesh Bhardwaj wrote:

> Sure Andy, I can do as you suggest but i am confused now because on
> another patch i've got "Acked-and-tested-by" only i.e. just one single
> tag. So for consistency, what should i do? I also noticed that this tag
> is used about 59 times in Linux kernel and i even found one
> "Reported-Acked-and-Tested-by" too :) though i understand these may not
> be acceptable by all Maintainers. So, please guide.

The rule of thumb is to be closer to what you got from a person and at
the same time don't push custom (non- or rarely used) tags.
So, 59 uses seems okay to me to use that tag as is.

-- 
With Best Regards,
Andy Shevchenko
