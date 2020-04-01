From: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v2 1/3] ACPI: fix: Update Tiger Lake ACPI device IDs
Date: Wed, 1 Apr 2020 13:29:33 +0200
Message-ID: <CAJZ5v0gYaZW8ycWQkcymz9W8svtNVnLGxsPZXEf4tP8Tpsmyew@mail.gmail.com>
References: <cover.1585343507.git.gayatri.kammela@intel.com>
 <9359b8e261d69983b1eed2b8e53ef9eabfdfdd51.1585343507.git.gayatri.kammela@intel.com>
 <CAJZ5v0j8OaqM6k52Ar9sYn0Ea_u9+MBB0rcMWv6vGBt5jXCQBQ@mail.gmail.com>
 <20200330172439.GB1922688@smile.fi.intel.com> <BYAPR11MB362459660B914BEF1526AD8DF2CB0@BYAPR11MB3624.namprd11.prod.outlook.com>
 <CAJZ5v0inmWu6_ZYLCKart6F873SqK5AyvVXOCS83Yr=KQAQV_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJZ5v0inmWu6_ZYLCKart6F873SqK5AyvVXOCS83Yr=KQAQV_Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Kammela, Gayatri" <gayatri.kammela@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, "Zhang, Rui" <rui.zhang@intel.com>, Linux PM <linux-pm@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Len Brown <lenb@kernel.org>, Darren Hart <dvhart@infradead.org>, Alex Hung <alex.hung@canonical.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amit.kucheria@verdurent.com>, "Westerberg, Mika" <mika.westerberg@intel.com>, Peter Zijlstra <peterz@infradead.org>, "Prestopine, Charles D" <charles.d.prestopine@intel.com>, "5 . 6+" <stable@vger.kernel.org>, "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>, "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Mar 31, 2020 at 8:19 AM Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Tue, Mar 31, 2020 at 1:22 AM Kammela, Gayatri
> <gayatri.kammela@intel.com> wrote:
> >
> > > -----Original Message-----
> > > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > Sent: Monday, March 30, 2020 10:25 AM
> > > To: Rafael J. Wysocki <rafael@kernel.org>
> > > Cc: Kammela, Gayatri <gayatri.kammela@intel.com>; Zhang, Rui
> > > <rui.zhang@intel.com>; Linux PM <linux-pm@vger.kernel.org>; Platform
> > > Driver <platform-driver-x86@vger.kernel.org>; Linux Kernel Mailing List
> > > <linux-kernel@vger.kernel.org>; Len Brown <lenb@kernel.org>; Darren Hart
> > > <dvhart@infradead.org>; Alex Hung <alex.hung@canonical.com>; Daniel
> > > Lezcano <daniel.lezcano@linaro.org>; Amit Kucheria
> > > <amit.kucheria@verdurent.com>; Westerberg, Mika
> > > <mika.westerberg@intel.com>; Peter Zijlstra <peterz@infradead.org>;
> > > Prestopine, Charles D <charles.d.prestopine@intel.com>; 5 . 6+
> > > <stable@vger.kernel.org>; Pandruvada, Srinivas
> > > <srinivas.pandruvada@intel.com>; Wysocki, Rafael J
> > > <rafael.j.wysocki@intel.com>
> > > Subject: Re: [PATCH v2 1/3] ACPI: fix: Update Tiger Lake ACPI device IDs
> > >
> > > On Mon, Mar 30, 2020 at 06:43:35PM +0200, Rafael J. Wysocki wrote:
> > > > On Fri, Mar 27, 2020 at 10:34 PM Gayatri Kammela
> > > > <gayatri.kammela@intel.com> wrote:
> > >
> > > > > -       {"INT1044"},
> > > > > -       {"INT1047"},
> > > > > +       {"INTC1040"},
> > > > > +       {"INTC1043"},
> > > > > +       {"INTC1044"},
> > > > > +       {"INTC1047"},
> > > > >         {"INT3400"},
> > > > >         {"INT3401", INT3401_DEVICE},
> > > > >         {"INT3402"},
> > > > > --
> > > >
> > > > I can take this along with the other two patches in the series if that
> > > > is fine by Andy and Rui.
> > >
> > > One nit is to fix the ordering to be alphanumeric or close enough (I admit in
> > > some cases it might require unneeded churn) to that.
> > Thanks Andy and Rafael! Should I send v3 for this series with right ordering this time?
>
> No need, I can fix up the ordering just fine.
>
> > > Otherwise,
> > > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> Thanks!

Now applied as 5.7 material with the changes mentioned above.

Please check the bleeding-edge branch in my tree.
