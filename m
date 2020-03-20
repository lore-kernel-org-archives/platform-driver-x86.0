From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [patch 19/22] ASoC: Intel: Convert to new X86 CPU match macros
Date: Fri, 20 Mar 2020 16:58:38 +0200
Message-ID: <CAHp75VdCTCk8OKBWKAapZz27zSvsDm_L6TChhSNpS0U0nS=wCQ@mail.gmail.com>
References: <20200320131345.635023594@linutronix.de> <20200320131510.594671507@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <20200320131510.594671507@linutronix.de>
Sender: linux-acpi-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Gross <mgross@linux.intel.com>, Tony Luck <tony.luck@intel.com>, Takashi Iwai <tiwai@suse.com>, ALSA Development Mailing List <alsa-devel@alsa-project.org>, Paolo Bonzini <pbonzini@redhat.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Linux PM <linux-pm@vger.kernel.org>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, linux-edac@vger.kernel.org, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Mar 20, 2020 at 3:18 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> The new macro set has a consistent namespace and uses C99 initializers
> instead of the grufty C89 ones.
>
> Get rid the of the local macro wrappers for consistency.

> -#define ICPU(model)    { X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, }
> -
>  #define SOC_INTEL_IS_CPU(soc, type)                            \
>  static inline bool soc_intel_is_##soc(void)                    \
>  {                                                              \
>         static const struct x86_cpu_id soc##_cpu_ids[] = {      \
> -               ICPU(type),                                     \
> +               X86_MATCH_INTEL_FAM6_MODEL(type, NULL),         \
>                 {}                                              \
>         };                                                      \
>         const struct x86_cpu_id *id;                            \
> @@ -32,11 +30,11 @@ static inline bool soc_intel_is_##soc(vo
>         return false;                                           \
>  }
>

> +SOC_INTEL_IS_CPU(byt, ATOM_SILVERMONT);
> +SOC_INTEL_IS_CPU(cht, ATOM_AIRMONT);
> +SOC_INTEL_IS_CPU(apl, ATOM_GOLDMONT);
> +SOC_INTEL_IS_CPU(glk, ATOM_GOLDMONT_PLUS);
> +SOC_INTEL_IS_CPU(cml, KABYLAKE_L);

I'm wondering if driver data can be used in one macro to distinguish
which CPU we are run on.
Takashi, what do you think?

-- 
With Best Regards,
Andy Shevchenko
