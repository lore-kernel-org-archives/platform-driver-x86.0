From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 1/3] ACPI: fix: Update Tiger Lake ACPI device IDs
Date: Mon, 30 Mar 2020 20:24:39 +0300
Message-ID: <20200330172439.GB1922688@smile.fi.intel.com>
References: <cover.1585343507.git.gayatri.kammela@intel.com>
 <9359b8e261d69983b1eed2b8e53ef9eabfdfdd51.1585343507.git.gayatri.kammela@intel.com>
 <CAJZ5v0j8OaqM6k52Ar9sYn0Ea_u9+MBB0rcMWv6vGBt5jXCQBQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAJZ5v0j8OaqM6k52Ar9sYn0Ea_u9+MBB0rcMWv6vGBt5jXCQBQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Gayatri Kammela <gayatri.kammela@intel.com>, "Zhang, Rui" <rui.zhang@intel.com>, Linux PM <linux-pm@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Len Brown <lenb@kernel.org>, Darren Hart <dvhart@infradead.org>, Alex Hung <alex.hung@canonical.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amit.kucheria@verdurent.com>, Mika Westerberg <mika.westerberg@intel.com>, Peter Zijlstra <peterz@infradead.org>, "Prestopine, Charles D" <charles.d.prestopine@intel.com>, "5 . 6+" <stable@vger.kernel.org>, Srinivas Pandruvada <srinivas.pandruvada@intel.com>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Mar 30, 2020 at 06:43:35PM +0200, Rafael J. Wysocki wrote:
> On Fri, Mar 27, 2020 at 10:34 PM Gayatri Kammela
> <gayatri.kammela@intel.com> wrote:

> > -       {"INT1044"},
> > -       {"INT1047"},
> > +       {"INTC1040"},
> > +       {"INTC1043"},
> > +       {"INTC1044"},
> > +       {"INTC1047"},
> >         {"INT3400"},
> >         {"INT3401", INT3401_DEVICE},
> >         {"INT3402"},
> > --
> 
> I can take this along with the other two patches in the series if that
> is fine by Andy and Rui.

One nit is to fix the ordering to be alphanumeric or close enough
(I admit in some cases it might require unneeded churn) to that.

Otherwise,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko
