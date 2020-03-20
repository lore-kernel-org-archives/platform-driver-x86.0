From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 02/22] x86/cpu: Add conistent CPU match macros
Date: Fri, 20 Mar 2020 21:27:58 +0100
Message-ID: <87h7yipy9d.fsf@nanos.tec.linutronix.de>
References: <20200320131345.635023594@linutronix.de> <20200320131508.826011988@linutronix.de> <CAHp75VdKavBD=yTR6Mz4iaGKQVP__xCsf-fWdy1MMJJywhDd-Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <CAHp75VdKavBD=yTR6Mz4iaGKQVP__xCsf-fWdy1MMJJywhDd-Q@mail.gmail.com>
Sender: linux-acpi-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Gross <mgross@linux.intel.com>, Tony Luck <tony.luck@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Linux PM <linux-pm@vger.kernel.org>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, linux-edac@vger.kernel.org, Platform Driver <platform-driver-x86@vger.kernel.org>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>li
List-Id: platform-driver-x86.vger.kernel.org

Andy Shevchenko <andy.shevchenko@gmail.com> writes:
>
>> Also a add a few model constants for Centaur CPUs and QUARK.
>
> I would perhaps made this as a separate change(s).

Can do.

>> +#define X86_MATCH_VENDOR_FAM_MODEL_FEATURE(_vendor, _family, _model,   \
>> +                                          _feature, _data) {           \
>
> I would leave it on one line despite the length, but it's up to you.
>
>> +       .vendor         = X86_VENDOR_##_vendor,                         \
>> +       .family         = _family,                                      \
>> +       .model          = _model,                                       \
>> +       .feature        = _feature,                                     \
>
>> +       .driver_data    = (unsigned long) _data                         \
>
> For sake of consistency shouldn't be this kernel_ulong_t ?

I can change that though in kernel space this does not matter.

> Or we are going to get rid of that type?

No.

Thanks,

        tglx
