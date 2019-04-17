From: Rajat Jain <rajatja@google.com>
Subject: Re: [PATCH v5 2/3] platform/x86: intel_pmc_core: Allow to dump debug
 registers on S0ix failure
Date: Wed, 17 Apr 2019 16:04:56 -0700
Message-ID: <CACK8Z6G=vT_tk3W95DJVg12VsH9d0smAKpCq3_oUOzgBr3nMvQ@mail.gmail.com>
References: <20190313222124.229371-1-rajatja@google.com> <20190411003738.55073-1-rajatja@google.com>
 <20190411003738.55073-2-rajatja@google.com> <CAHp75Vd9xTB90GMra10VxQkR-fVY7NxxY_w6gGEGvD0XOF_xSA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75Vd9xTB90GMra10VxQkR-fVY7NxxY_w6gGEGvD0XOF_xSA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rafael J Wysocki <rafael.j.wysocki@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Furquan Shaikh <furquan@google.com>, Evan Green <evgreen@google.com>, Rajat Jain <rajatxjain@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Apr 11, 2019 at 6:40 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Thu, Apr 11, 2019 at 3:38 AM Rajat Jain <rajatja@google.com> wrote:
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
> > +static int pmc_core_suspend(struct device *dev)
> > +{
> > +       struct pmc_dev *pmcdev = dev_get_drvdata(dev);
> > +
> > +       pmcdev->check_counters = false;
> > +
> > +       /* No warnings on S0ix failures */
> > +       if (!warn_on_s0ix_failures)
> > +               return 0;
> > +
> > +       /* Check if the syspend will actually use S0ix */
> > +       if (pm_suspend_via_firmware())
> > +               return 0;
> > +
> > +       /* Save PC10 and S0ix residency for checking later */
>
> > +       if (!rdmsrl_safe(MSR_PKG_C10_RESIDENCY, &pmcdev->pc10_counter) &&
> > +           !pmc_core_dev_state_get(pmcdev, &pmcdev->s0ix_counter))
>
> Split it.

done

>
> > +               pmcdev->check_counters = true;
> > +
> > +       return 0;
> > +}
> > +
> > +static inline bool pmc_core_is_pc10_failed(struct pmc_dev *pmcdev)
> > +{
> > +       u64 pc10_counter;
> > +
> > +       if (!rdmsrl_safe(MSR_PKG_C10_RESIDENCY, &pc10_counter) &&
> > +           pc10_counter == pmcdev->pc10_counter)
> > +               return true;
>
> Split this as well.

done
>
> > +
> > +       return false;
> > +}
> > +
> > +static inline bool pmc_core_is_s0ix_failed(struct pmc_dev *pmcdev)
> > +{
> > +       u64 s0ix_counter;
> > +
> > +       if (!pmc_core_dev_state_get(pmcdev, &s0ix_counter) &&
> > +           s0ix_counter == pmcdev->s0ix_counter)
> > +               return true;
>
> And this.

done
>
> > +
> > +       return false;
> > +}
> > +
> > +static int pmc_core_resume(struct device *dev)
> > +{
> > +       struct pmc_dev *pmcdev = dev_get_drvdata(dev);
> > +
> > +       if (!pmcdev->check_counters)
> > +               return 0;
> > +
> > +       if (pmc_core_is_pc10_failed(pmcdev)) {
> > +               dev_info(dev, "PC10 entry had failed (PC10 cnt=0x%llx)\n",
> > +                        pmcdev->pc10_counter);
> > +       } else if (pmc_core_is_s0ix_failed(pmcdev)) {
>
> > +
>
> Redundant.

I did not quite understand the comment, but I have restructured this
and I think this concerned will be addressed.

>
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
>
> > +                               ++map;
>
> map++;

done
>
> > +                       }
> > +                       ++maps;
>
> maps++;

done
>
> > +               }
>
> This is quite noisy. You need to print only what is important. I don't
> think polluting dmesg with piles of these kind of messages is a good
> idea.
> Also, it is more likely should be done on debug level (except may be
> one or two messages with really important information).

Changed it to dev_dbg in my latest patch. I do not know if a subset of
this information will be helpful to Intel to debug S0ix failures. This
is something I'd like to defer to Rajneesh. I'd be happy to cut it
short if it can still get the info Intel needs to debug S0ix failures.




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
