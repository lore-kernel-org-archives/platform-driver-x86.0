From: Rajat Jain <rajatxjain@gmail.com>
Subject: Re: [PATCH 2/2] platform/x86: intel_pmc_core: Allow to dump debug
 registers on S0ix failure
Date: Mon, 18 Mar 2019 08:18:56 -0700
Message-ID: <CAA93t1o=Yd8_kUQ=AjXPBF-vFXEPN_E6ij7EjbC7jAXUrQ+xNw@mail.gmail.com>
References: <20190313222124.229371-1-rajatja@google.com> <20190313222124.229371-2-rajatja@google.com>
 <219AAEFC072D3A42B064BBBC1181F9BF65C25C8E@BGSMSX102.gar.corp.intel.com>
Reply-To: rajatxjain@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <219AAEFC072D3A42B064BBBC1181F9BF65C25C8E@BGSMSX102.gar.corp.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Somayaji, Vishwanath" <vishwanath.somayaji@intel.com>
Cc: Rajat Jain <rajatja@google.com>, "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "furquan@google.com" <furquan@google.com>, "evgreen@google.com" <evgreen@google.com>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Mar 18, 2019 at 2:31 AM Somayaji, Vishwanath
<vishwanath.somayaji@intel.com> wrote:
>
>
>
> >-----Original Message-----
> >From: Rajat Jain <rajatja@google.com>
> >Sent: Thursday, March 14, 2019 3:51 AM
> >To: Bhardwaj, Rajneesh <rajneesh.bhardwaj@intel.com>; Somayaji, Vishwanath
> ><vishwanath.somayaji@intel.com>; Darren Hart <dvhart@infradead.org>; Andy
> >Shevchenko <andy@infradead.org>; platform-driver-x86@vger.kernel.org; linux-
> >kernel@vger.kernel.org
> >Cc: Rajat Jain <rajatja@google.com>; furquan@google.com;
> >evgreen@google.com; rajatxjain@gmail.com
> >Subject: [PATCH 2/2] platform/x86: intel_pmc_core: Allow to dump debug
> >registers on S0ix failure
> >
> >Add a module parameter which when enabled, will check on resume, if the
> >last S0ix attempt was successful. If not, the driver would provide
> >helpful debug information (which gets latched during the failed suspend
> >attempt) to debug the S0ix failure.
> >
> >This information is very useful to debug S0ix failures. Specially since
> >the latched debug information will be lost (over-written) if the system
> >attempts to go into runtime (or imminent) S0ix again after that failed
> >suspend attempt.
> >
> >Signed-off-by: Rajat Jain <rajatja@google.com>
> >---
> > drivers/platform/x86/intel_pmc_core.c | 86 +++++++++++++++++++++++++++
> > drivers/platform/x86/intel_pmc_core.h |  7 +++
> > 2 files changed, 93 insertions(+)
> >
> >diff --git a/drivers/platform/x86/intel_pmc_core.c
> >b/drivers/platform/x86/intel_pmc_core.c
> >index 55578d07610c..b1f4405a27ce 100644
> >--- a/drivers/platform/x86/intel_pmc_core.c
> >+++ b/drivers/platform/x86/intel_pmc_core.c
> >@@ -20,6 +20,7 @@
> > #include <linux/module.h>
> > #include <linux/pci.h>
> > #include <linux/platform_device.h>
> >+#include <linux/suspend.h>
> > #include <linux/uaccess.h>
> >
> > #include <asm/cpu_device_id.h>
> >@@ -890,9 +891,94 @@ static int pmc_core_remove(struct platform_device
> >*pdev)
> >       return 0;
> > }
> >
> >+#ifdef CONFIG_PM_SLEEP
> >+
> >+static bool warn_on_s0ix_failures;
> >+module_param(warn_on_s0ix_failures, bool, 0644);
> >+MODULE_PARM_DESC(warn_on_s0ix_failures, "Check and warn for S0ix
> >failures");
> >+
> >+static int pmc_core_suspend(struct device *dev)
> >+{
> >+      struct pmc_dev *pmcdev = dev_get_drvdata(dev);
> >+
> >+      /* Save PC10 and S0ix residency for checking later */
> >+      if (warn_on_s0ix_failures &&
> >+          !rdmsrl_safe(MSR_PKG_C10_RESIDENCY, &pmcdev->pc10_counter)
> >&&
> >+          !pmc_core_dev_state_get(pmcdev, &pmcdev->s0ix_counter))
> >+              pmcdev->check_counters = true;
> >+      else
> >+              pmcdev->check_counters = false;
> >+
> >+      return 0;
> >+}
> >+
> >+static inline bool pc10_failed(struct pmc_dev *pmcdev)
> >+{
> >+      u64 pc10_counter;
> >+
> >+      if (!rdmsrl_safe(MSR_PKG_C10_RESIDENCY, &pc10_counter) &&
> >+          pc10_counter == pmcdev->pc10_counter)
> >+              return true;
> >+      else
> >+              return false;
> >+}
> >+
> >+static inline bool s0ix_failed(struct pmc_dev *pmcdev)
> >+{
> >+      u64 s0ix_counter;
> >+
> >+      if (!pmc_core_dev_state_get(pmcdev, &s0ix_counter) &&
> >+          s0ix_counter == pmcdev->s0ix_counter)
> >+              return true;
> >+      else
> >+              return false;
> >+}
> >+
> >+static int pmc_core_resume(struct device *dev)
> >+{
> >+      struct pmc_dev *pmcdev = dev_get_drvdata(dev);
> >+
> >+      if (!pmcdev->check_counters)
> >+              return 0;
> >+
> >+      if (pc10_failed(pmcdev)) {
> >+              dev_info(dev, "PC10 entry had failed (PC10 cnt=0x%llx)\n",
> >+                       pmcdev->pc10_counter);
> >+      } else if (s0ix_failed(pmcdev)) {
> >+
> >+              const struct pmc_bit_map **maps = pmcdev->map-
> >>slps0_dbg_maps;
> >+              const struct pmc_bit_map *map;
> >+              int offset = pmcdev->map->slps0_dbg_offset;
> >+              u32 data;
> >+
> >+              dev_warn(dev, "S0ix entry had failed (S0ix cnt=%llu)\n",
> >+                       pmcdev->s0ix_counter);
> >+              while (*maps) {
> >+                      map = *maps;
> >+                      data = pmc_core_reg_read(pmcdev, offset);
> >+                      offset += 4;
> >+                      while (map->name) {
> >+                              dev_warn(dev, "SLP_S0_DBG: %-32s\tState:
> >%s\n",
> >+                                       map->name,
> >+                                       data & map->bit_mask ? "Yes" : "No");
> >+                              ++map;
> >+                      }
> >+                      ++maps;
> >+              }
> >+      }
> >+      return 0;
> >+}
> >+
> >+#endif
> >+
> >+const struct dev_pm_ops pmc_core_pm_ops = {
> >+      SET_LATE_SYSTEM_SLEEP_PM_OPS(pmc_core_suspend,
> >pmc_core_resume)
> These PM Ops routines will be called not just in s2idle scenario, but also in other suspend scenarios like s2ram, s2disk. However actual functionalities served by these routines are relevant only for s2idle.
> That means we will end up having false errors in s2ram/s2disk scenarios as PC10/s0ix counters wont increment in those scenarios.

Yes, you are right. Currently there is no API for a driver to know
whether the *current suspend* attempt is targeting S0ix or S3. I was
hoping that the pm_suspend_via_s2idle() might tell us that but that is
not true. Note that this issue is mitigated by the expectation that
this parameter (warn_on_s0ix_failures) will only be enabled only on
platforms that use S0ix.

However, if this is a concern and there is a string sentiment around
it, I am happy to throw in a patch that adds such an API in the pm
core and uses it (I have a patch ready).

Thanks,

Rajat

>
> Vishwa
> >+};
> >+
> > static struct platform_driver pmc_core_driver = {
> >       .driver = {
> >               .name = "pmc_core",
> >+              .pm = &pmc_core_pm_ops
> >       },
> >       .probe = pmc_core_probe,
> >       .remove = pmc_core_remove,
> >diff --git a/drivers/platform/x86/intel_pmc_core.h
> >b/drivers/platform/x86/intel_pmc_core.h
> >index 88d9c0653a5f..fdee5772e532 100644
> >--- a/drivers/platform/x86/intel_pmc_core.h
> >+++ b/drivers/platform/x86/intel_pmc_core.h
> >@@ -241,6 +241,9 @@ struct pmc_reg_map {
> >  * @pmc_xram_read_bit:        flag to indicate whether PMC XRAM shadow
> >registers
> >  *                    used to read MPHY PG and PLL status are available
> >  * @mutex_lock:               mutex to complete one transcation
> >+ * @check_counters:   On resume, check if counters are getting incremented
> >+ * @pc10_counter:     PC10 residency counter
> >+ * @s0ix_counter:     S0ix residency (step adjusted)
> >  *
> >  * pmc_dev contains info about power management controller device.
> >  */
> >@@ -253,6 +256,10 @@ struct pmc_dev {
> > #endif /* CONFIG_DEBUG_FS */
> >       int pmc_xram_read_bit;
> >       struct mutex lock; /* generic mutex lock for PMC Core */
> >+
> >+      bool check_counters; /* Check for counter increments on resume */
> >+      u64 pc10_counter;
> >+      u64 s0ix_counter;
> > };
> >
> > #endif /* PMC_CORE_H */
> >--
> >2.21.0.360.g471c308f928-goog
>
