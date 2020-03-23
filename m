From: mark gross <mgross@linux.intel.com>
Subject: Re: [patch 08/22] ACPI: Convert to new X86 CPU match macros
Date: Mon, 23 Mar 2020 09:38:44 -0700
Message-ID: <20200323163844.GB123290@mtg-dev.jf.intel.com>
References: <20200320131345.635023594@linutronix.de>
 <20200320131509.467730627@linutronix.de>
 <CAHp75VcK3tL0YayjF=CSkSkHiOpg2zOV3rdkXQWJmLZ9fmevpg@mail.gmail.com>
 <87bloqpy1x.fsf@nanos.tec.linutronix.de>
Reply-To: mgross@linux.intel.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-crypto-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87bloqpy1x.fsf@nanos.tec.linutronix.de>
Sender: linux-crypto-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tony Luck <tony.luck@intel.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Viresh Kumar <viresh.kumar@linaro.org>, Linux PM <linux-pm@vger.kernel.org>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, linux-edac@vger.kernel.org, Platform Driver <platform-driver-x86@vger.kernel.org>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Mar 20, 2020 at 09:32:26PM +0100, Thomas Gleixner wrote:
> Andy Shevchenko <andy.shevchenko@gmail.com> writes:
> 
> > On Fri, Mar 20, 2020 at 3:19 PM Thomas Gleixner <tglx@linutronix.de> wrote:
> >>
> >> The new macro set has a consistent namespace and uses C99 initializers
> >> instead of the grufty C89 ones.
> >>
> >> Rename the local macro wrapper to X86_MATCH for consistency. It stays for
> >> readability sake.
> >
> >> +       X86_MATCH_INTEL_FAM6_MODEL(ATOM_SILVERMONT,     NULL),
> >> +       X86_MATCH_INTEL_FAM6_MODEL(ATOM_AIRMONT,        NULL),
> >
> >> -#define ICPU(model)    { X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, }
> >> +#define X86_MATCH(model)       X86_MATCH_INTEL_FAM6_MODEL(model, NULL)
> >
> > Maybe we can do a generic macro to avoid all these ', NULL' repetitions?
> 
> I opted for having the data argument everywhere to keep the macro maze
> small. And we have enough places where data is actually used.
+1

--mark

> Thanks,
> 
>         tglx
