From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [patch 09/22] cpufreq: Convert to new X86 CPU match macros
Date: Fri, 20 Mar 2020 16:50:15 +0200
Message-ID: <CAHp75VdkvyqOaAsLmz8K2j4bdd0sboPoUpRr6U-zvtkSaQfPRQ@mail.gmail.com>
References: <20200320131345.635023594@linutronix.de> <20200320131509.564059710@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <20200320131509.564059710@linutronix.de>
Sender: linux-acpi-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Gross <mgross@linux.intel.com>, Tony Luck <tony.luck@intel.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Linux PM <linux-pm@vger.kernel.org>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Len Brown <lenb@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, linux-edac@vger.kernel.org, Platform Driver <platform-driver-x86@vger.kernel.org>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>linux
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Mar 20, 2020 at 3:18 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> The new macro set has a consistent namespace and uses C99 initializers
> instead of the grufty C89 ones.
>
> Get rid the of most local macro wrappers for consistency. The ones which
> make sense for readability are renamed to X86_MATCH*.
>
> In the centrino driver this also removes the two extra duplicates of family
> 6 model 13 which have no value at all.

> +       X86_MATCH_VENDOR_FAM_MODEL_FEATURE(INTEL,  6,  9, X86_FEATURE_EST, NULL),
> +       X86_MATCH_VENDOR_FAM_MODEL_FEATURE(INTEL,  6, 13, X86_FEATURE_EST, NULL),
> +       X86_MATCH_VENDOR_FAM_MODEL_FEATURE(INTEL, 15,  3, X86_FEATURE_EST, NULL),
> +       X86_MATCH_VENDOR_FAM_MODEL_FEATURE(INTEL, 15,  4, X86_FEATURE_EST, NULL),

> +       X86_MATCH_VENDOR_FAM_MODEL(INTEL,  6, 0x8, 0),
> +       X86_MATCH_VENDOR_FAM_MODEL(INTEL,  6, 0xb, 0),
> +       X86_MATCH_VENDOR_FAM_MODEL(INTEL, 15, 0x2, 0),

> +       X86_MATCH_VENDOR_FAM_MODEL(INTEL,  6, 0x8, 0),
> +       X86_MATCH_VENDOR_FAM_MODEL(INTEL,  6, 0xb, 0),
> +       X86_MATCH_VENDOR_FAM_MODEL(INTEL, 15, 0x2, 0),

Perhaps use names instead of 6 and 15?
Also, NULL vs. 0?

-- 
With Best Regards,
Andy Shevchenko
