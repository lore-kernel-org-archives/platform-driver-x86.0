From: Rajat Jain <rajatja@google.com>
Subject: Re: [PATCH v3 2/3] platform/x86: intel_pmc_core: Allow to dump debug
 registers on S0ix failure
Date: Mon, 8 Apr 2019 11:36:15 -0700
Message-ID: <CACK8Z6FGFiS_jN_5ctWmjKbrcUyjGkV0MsVs7_2TsaS7UAoydA@mail.gmail.com>
References: <20190313222124.229371-1-rajatja@google.com> <20190405203558.19160-1-rajatja@google.com>
 <20190405203558.19160-2-rajatja@google.com> <CAHp75VehpYPm1ApFozisSsNi1g0EtbKBm3C97jxXC2u04tpt0A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VehpYPm1ApFozisSsNi1g0EtbKBm3C97jxXC2u04tpt0A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Wysocki@google.com, Rafael J <rafael.j.wysocki@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Furquan Shaikh <furquan@google.com>, Evan Green <evgreen@google.com>, Rajat Jain <rajatxjain@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Apr 8, 2019 at 10:02 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Fri, Apr 5, 2019 at 11:36 PM Rajat Jain <rajatja@google.com> wrote:
> >
> > Add a module parameter which when enabled, will check on resume, if the
> > last S0ix attempt was successful. If not, the driver would warn and provide
> > helpful debug information (which gets latched during the failed suspend
> > attempt) to debug the S0ix failure.
> >
> > This information is very useful to debug S0ix failures. Specially since
> > the latched debug information will be lost (over-written) if the system
> > attempts to go into runtime (or imminent) S0ix again after that failed
> > suspend attempt.
>
> > +#ifdef CONFIG_PM_SLEEP
> > +
> > +static bool warn_on_s0ix_failures;
> > +module_param(warn_on_s0ix_failures, bool, 0644);
> > +MODULE_PARM_DESC(warn_on_s0ix_failures, "Check and warn for S0ix failures");
> > +
> > +static int pmc_core_suspend(struct device *dev)
> > +{
> > +       struct pmc_dev *pmcdev = dev_get_drvdata(dev);
> > +
> > +       /* Save PC10 and S0ix residency for checking later */
>
> > +       if (warn_on_s0ix_failures && !pm_suspend_via_firmware() &&
> > +           !rdmsrl_safe(MSR_PKG_C10_RESIDENCY, &pmcdev->pc10_counter) &&
> > +           !pmc_core_dev_state_get(pmcdev, &pmcdev->s0ix_counter))
> > +               pmcdev->check_counters = true;
>
> Perhaps something like
>
> pmcdev->check_counters = false;
> /* User doesn't want to be warned */
> if (!warn_on...)
>  return 0;
> /* We do suspend via firmware */
> if (...)
>  return 0;
> ...
>
> ?

I guess what you mean is one conditional per line. Sure, I will do that.

>
> > +       else
> > +               pmcdev->check_counters = false;
> > +
> > +       return 0;
> > +}
> > +
> > +static inline bool pc10_failed(struct pmc_dev *pmcdev)
>
> To be or not to be? :-)
> Perhaps names of the functions should be
>
> pmc_code_is_pc10_failed()
>
> and so on

I think the suggestion is to use pmc_core_* as the function names. OK,
I will rename the functions to:

pmc_core_pc10_failed()
and
pmc_core_s0ix_failed()


>
> > +{
> > +       u64 pc10_counter;
> > +
> > +       if (!rdmsrl_safe(MSR_PKG_C10_RESIDENCY, &pc10_counter) &&
> > +           pc10_counter == pmcdev->pc10_counter)
> > +               return true;
>
> > +       else
>
> Redundant.

OK, I'll remove the "else" part here.

>
> > +               return false;
> > +}
> > +
> > +static inline bool s0ix_failed(struct pmc_dev *pmcdev)
> > +{
> > +       u64 s0ix_counter;
> > +
> > +       if (!pmc_core_dev_state_get(pmcdev, &s0ix_counter) &&
> > +           s0ix_counter == pmcdev->s0ix_counter)
> > +               return true;
>
> > +       else
>
> Ditto.

OK, I'll remove the "else" part here.

>
> > +               return false;
> > +}
> > +
> > +static int pmc_core_resume(struct device *dev)
> > +{
> > +       struct pmc_dev *pmcdev = dev_get_drvdata(dev);
> > +
> > +       if (!pmcdev->check_counters)
> > +               return 0;
> > +
> > +       if (pc10_failed(pmcdev)) {
> > +               dev_info(dev, "PC10 entry had failed (PC10 cnt=0x%llx)\n",
> > +                        pmcdev->pc10_counter);
> > +       } else if (s0ix_failed(pmcdev)) {
> > +
> > +               const struct pmc_bit_map **maps = pmcdev->map->slps0_dbg_maps;
> > +               const struct pmc_bit_map *map;
> > +               int offset = pmcdev->map->slps0_dbg_offset;
> > +               u32 data;
> > +
> > +               dev_warn(dev, "S0ix entry had failed (S0ix cnt=%llu)\n",
> > +                        pmcdev->s0ix_counter);
> > +               while (*maps) {
> > +                       map = *maps;
> > +                       data = pmc_core_reg_read(pmcdev, offset);
> > +                       offset += 4;
> > +                       while (map->name) {
> > +                               dev_warn(dev, "SLP_S0_DBG: %-32s\tState: %s\n",
> > +                                        map->name,
> > +                                        data & map->bit_mask ? "Yes" : "No");
> > +                               ++map;
> > +                       }
> > +                       ++maps;
> > +               }
>
> Can't we utilize existing print helpers?

I didn't quite see any existing print helpers in this file. I took
this code from pmc_core_slps0_dbg_show(), and I think although I can
abstract out this code into a static function, the calling code need
to use seq_printf(s,...) and dev_warn(dev,...) respectively. - so
might be overkill (did not feel that the benefits were worth it).
Please let me know if you have any suggestions and will be happy to
use them.

Thanks,

Rajat


>
> > +       }
> > +       return 0;
> > +}
> > +
> > +#endif
>
> --
> With Best Regards,
> Andy Shevchenko
