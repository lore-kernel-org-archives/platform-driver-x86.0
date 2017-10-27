From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: intel_turbo_max_3: Add Skylake platform
Date: Fri, 27 Oct 2017 19:32:26 +0300
Message-ID: <CAHp75VcXMMcQOKRmL9sgVnWPRcPDm59C=_JjPDrcHkTMABcQwg@mail.gmail.com>
References: <1508604720-7261-1-git-send-email-srinivas.pandruvada@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f193.google.com ([209.85.220.193]:54384 "EHLO
        mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751145AbdJ0Qc1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 27 Oct 2017 12:32:27 -0400
In-Reply-To: <1508604720-7261-1-git-send-email-srinivas.pandruvada@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Len Brown <lenb@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>

On Sat, Oct 21, 2017 at 7:52 PM, Srinivas Pandruvada
<srinivas.pandruvada@linux.intel.com> wrote:
> Ev Kontsevoy reported that he can't see the presence of
> "/proc/sys/kernel/sched_itmt_enabled" on i9-7900x with Asrock x299
> Taichi system even if he enabled "Turbo 3.0" in the BIOS.
>
> The problem is that even if one core max is 200MHz more than others, the
> current implementation couldn't enumerate that with the way the system
> is configured.
>
> The system by default configured for legacy mode (no HWP or speed shift
> technology), in this mode only way we can enumerate via the mail box
> interface as implemented in this driver. We were planing to only use
> this driver for Broadwell, but we need to extend this because some
> Skylake system has same issue as Braodwell systems.
>
> On this system BIOS allows to change to HWP mode, where we expect that
> we can enumerate favored core with ACPI-CPPC. But on this system the
> core priority is 0xff for all cores in CPPC object. So this is not an
> option.
>
> Hence this change allows Skylake systems to be enumerate favored core
> similar to Broadwell in legacy mode.

Pushed to my review and testing queue, thanks!

>
> Reported-and-tested-by: Ev Kontsevoy <ev@kontsevoy.com>
> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> ---
>  drivers/platform/x86/intel_turbo_max_3.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/platform/x86/intel_turbo_max_3.c b/drivers/platform/x86/intel_turbo_max_3.c
> index 4f60d8e..d4ea018 100644
> --- a/drivers/platform/x86/intel_turbo_max_3.c
> +++ b/drivers/platform/x86/intel_turbo_max_3.c
> @@ -125,6 +125,7 @@ static int itmt_legacy_cpu_online(unsigned int cpu)
>
>  static const struct x86_cpu_id itmt_legacy_cpu_ids[] = {
>         ICPU(INTEL_FAM6_BROADWELL_X),
> +       ICPU(INTEL_FAM6_SKYLAKE_X),
>         {}
>  };
>
> --
> 2.5.5
>



-- 
With Best Regards,
Andy Shevchenko
