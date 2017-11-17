From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1 2/5] platform/x86: intel_telemetry: Fix suspend stats
Date: Fri, 17 Nov 2017 15:27:38 +0200
Message-ID: <CAHp75VccKdm-F5fTNp295OC_2AjYBgZFZs1P_XWnEM6WVKdwoQ@mail.gmail.com>
References: <1510827497-25188-1-git-send-email-souvik.k.chakravarty@intel.com> <1510827497-25188-3-git-send-email-souvik.k.chakravarty@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f177.google.com ([209.85.216.177]:43741 "EHLO
        mail-qt0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933859AbdKQN1j (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Nov 2017 08:27:39 -0500
In-Reply-To: <1510827497-25188-3-git-send-email-souvik.k.chakravarty@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>

On Thu, Nov 16, 2017 at 12:18 PM, Souvik Kumar Chakravarty
<souvik.k.chakravarty@intel.com> wrote:
> Suspend stats are not reported consistently due to a limitation in the PMC
> firmware. This limitation causes a delay in updating the s0ix counters and
> residencies in the telemetry log upon s0ix exit. As a consequence, reading
> these counters from the suspend-exit notifier may result in zero read.
>
> This patch fixes this issue by cross-verifying the s0ix residencies from
> the GCR TELEM registers in case the counters are not incremented in the
> telemetry log after suspend.
>
> This fixes https://bugzilla.kernel.org/show_bug.cgi?id=197833
>
> Reported-and-tested-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
> Signed-off-by: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>

> +#define TELEM_LO_HI_TO64(lo, hi)       ((u64)(lo) + ((u64)(hi)<<32))
> +

> +       /* Due to some design limitations in the firmware, sometimes the
> +        * counters do not get updated by the time we reach here. As a
> +        * workaround, we try to see if this was a genuine case of sleep
> +        * failure or not by cross-checking from PMC GCR registers directly.
> +        */

Comments style!

> +       if ((suspend_shlw_ctr_exit == suspend_shlw_ctr_temp) &&
> +           (suspend_deep_ctr_exit == suspend_deep_ctr_temp)) {

Redundant parens.

> +               ret = intel_pmc_gcr_read(PMC_GCR_TELEM_SHLW_S0IX_LO_REG,
> +                                        &shlw_lo);

Okay, from here is now obvious what you did the first patch. I think
you need to fold the changes here.

> +               if (ret < 0)
> +                       goto out;
> +
> +               ret = intel_pmc_gcr_read(PMC_GCR_TELEM_SHLW_S0IX_HI_REG,
> +                                        &shlw_hi);
> +               if (ret < 0)
> +                       goto out;

...and now we have a problem. Each of your call takes a spin lock.
What happened in between?
If I understand this correctly you need to introduce

intel_pmc_gcr_readl() and intel_pmc_gcr_readq().

> +
> +               ret = intel_pmc_gcr_read(PMC_GCR_TELEM_DEEP_S0IX_LO_REG,
> +                                        &deep_lo);
> +               if (ret < 0)
> +                       goto out;
> +
> +               ret = intel_pmc_gcr_read(PMC_GCR_TELEM_DEEP_S0IX_HI_REG,
> +                                        &deep_hi);
> +               if (ret < 0)
> +                       goto out;

Same story.

-- 
With Best Regards,
Andy Shevchenko
