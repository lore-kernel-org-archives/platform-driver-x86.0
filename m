From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1 0/5] Add Tiger Lake/Elkhart Lake support to pmc_core driver
Date: Fri, 27 Sep 2019 09:06:04 +0300
Message-ID: <CAHp75VfwpYLVn2qWBMK11eR3D5VwnGf7VeYE=cQfq_y78ct75A@mail.gmail.com>
References: <20190926192603.18647-1-gayatri.kammela@intel.com> <CAHp75Vcrp2ffDCE=tm2dwSEhwfPCPWGhb-Nw0v-7ga2y=_dL8w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75Vcrp2ffDCE=tm2dwSEhwfPCPWGhb-Nw0v-7ga2y=_dL8w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gayatri Kammela <gayatri.kammela@intel.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Darren Hart <dvhart@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, charles.d.prestopine@intel.com, Peter Zijlstra <peterz@infradead.org>, Srinivas Pandruvada <srinivas.pandruvada@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Kan Liang <kan.liang@intel.com>, "David E . Box" <david.e.box@intel.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Tony Luck <tony.luck@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Sep 27, 2019 at 9:01 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Thu, Sep 26, 2019 at 9:43 PM Gayatri Kammela
> <gayatri.kammela@intel.com> wrote:
>
> Thank you for the series, I'll comment them later.
>
> For now, check how to properly setup prefix for all patches. The Title
> all broken.
>

On top of that the fully inconsistent SoC naming through the existing
code / new additions.

I'm pretty sure you need to spell platforms as Tiger Lake, Elkhart
Lake and so on everywhere.

Fix this, but do not send new version till I look at the code here.

> > Patch 1: Cleans up termination lines
> > Patch 2: Refactor driver for ease of adding new SoCs
> > Patch 3: Refactor debugfs entry for PCH IPs power gating status
> > Patch 4: Add Tiger Lake legacy support to pmc_core
> > Patch 5: Add Elkhart Lake legacy support to pmc_core
> >
> > All the information regarding the PCH IPs and names of IPs will be available
> > in *future* Intel's Platform Controller Hub (PCH) External Design Specification
> > (EDS) document.
>
> When?

-- 
With Best Regards,
Andy Shevchenko
