From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [patch 02/22] x86/cpu: Add conistent CPU match macros
Date: Fri, 20 Mar 2020 16:39:16 +0200
Message-ID: <CAHp75VdKavBD=yTR6Mz4iaGKQVP__xCsf-fWdy1MMJJywhDd-Q@mail.gmail.com>
References: <20200320131345.635023594@linutronix.de> <20200320131508.826011988@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-crypto-owner@vger.kernel.org>
In-Reply-To: <20200320131508.826011988@linutronix.de>
Sender: linux-crypto-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Gross <mgross@linux.intel.com>, Tony Luck <tony.luck@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Linux PM <linux-pm@vger.kernel.org>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, linux-edac@vger.kernel.org, Platform Driver <platform-driver-x86@vger.kernel.org>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>linux
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Mar 20, 2020 at 3:18 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> Finding all places which build x86_cpu_id match tables is tedious and the
> logic is hidden in lots of differently named macro wrappers.
>
> Most of these initializer macros use plain C89 initializers which rely on
> the ordering of the struct members. So new members could only be added at
> the end of the struct, but that's ugly as hell and C99 initializers are
> really the right thing to use.
>
> Provide a set of macros which:
>
>   - Have a proper naming scheme, starting with X86_MATCH_
>
>   - Use C99 initializers
>
> The set of provided macros are all subsets of the base macro
>
>     X86_MATCH_VENDOR_FAM_MODEL_FEATURE()
>
> which allows to supply all possible selection criteria:
>
>       vendor, family, model, feature
>
> The other macros shorten this to avoid typing all arguments when they are
> not needed and would require one of the _ANY constants. They have been
> created due to the requirements of the existing usage sites.
>

> Also a add a few model constants for Centaur CPUs and QUARK.

I would perhaps made this as a separate change(s).

...

> +#define X86_MATCH_VENDOR_FAM_MODEL_FEATURE(_vendor, _family, _model,   \
> +                                          _feature, _data) {           \

I would leave it on one line despite the length, but it's up to you.

> +       .vendor         = X86_VENDOR_##_vendor,                         \
> +       .family         = _family,                                      \
> +       .model          = _model,                                       \
> +       .feature        = _feature,                                     \

> +       .driver_data    = (unsigned long) _data                         \

For sake of consistency shouldn't be this kernel_ulong_t ?
Or we are going to get rid of that type?

>  }

...

> +#define X86_MATCH_VENDOR_FAM_FEATURE(vendor, family, feature, data)    \

> +       X86_MATCH_VENDOR_FAM_MODEL_FEATURE(vendor, family,              \
> +                                          X86_MODEL_ANY, feature, data)

I would leave it on one line despite the length, but it's up to you.

...

> +#define X86_MATCH_VENDOR_FAM_MODEL(vendor, family, model, data)                \
> +       X86_MATCH_VENDOR_FAM_MODEL_FEATURE(vendor, family, model,       \
> +                                          X86_FEATURE_ANY, data)

Ditto.

...

> + * X86_MATCH_VENDOR_FAM_MODEL_FEATURE(INTEL, 6, INTEL_FAM6_BROADWELL,
> + *                                   X86_FEATURE_ANY, NULL);

Perhaps one line?

-- 
With Best Regards,
Andy Shevchenko
