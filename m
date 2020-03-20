From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 09/22] cpufreq: Convert to new X86 CPU match macros
Date: Fri, 20 Mar 2020 23:18:38 +0100
Message-ID: <877dzept4x.fsf@nanos.tec.linutronix.de>
References: <20200320131345.635023594@linutronix.de> <20200320131509.564059710@linutronix.de> <CAHp75VdkvyqOaAsLmz8K2j4bdd0sboPoUpRr6U-zvtkSaQfPRQ@mail.gmail.com> <87eetmpy56.fsf@nanos.tec.linutronix.de> <CAHp75VfuU98gEriS+GDJqZX4BV-cZT9hPbrDX-roeo63O8UvYQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <CAHp75VfuU98gEriS+GDJqZX4BV-cZT9hPbrDX-roeo63O8UvYQ@mail.gmail.com>
Sender: linux-pci-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Gross <mgross@linux.intel.com>, Tony Luck <tony.luck@intel.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Linux PM <linux-pm@vger.kernel.org>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Len Brown <lenb@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, linux-edac@vger.kernel.org, Platform Driver <platform-driver-x86@vger.kernel.org>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>li
List-Id: platform-driver-x86.vger.kernel.org

Andy Shevchenko <andy.shevchenko@gmail.com> writes:

> On Fri, Mar 20, 2020 at 10:30 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>>
>> Andy Shevchenko <andy.shevchenko@gmail.com> writes:
>> > On Fri, Mar 20, 2020 at 3:18 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>> >
>> >> +       X86_MATCH_VENDOR_FAM_MODEL_FEATURE(INTEL,  6,  9, X86_FEATURE_EST, NULL),
>> >> +       X86_MATCH_VENDOR_FAM_MODEL_FEATURE(INTEL,  6, 13, X86_FEATURE_EST, NULL),
>> >> +       X86_MATCH_VENDOR_FAM_MODEL_FEATURE(INTEL, 15,  3, X86_FEATURE_EST, NULL),
>> >> +       X86_MATCH_VENDOR_FAM_MODEL_FEATURE(INTEL, 15,  4, X86_FEATURE_EST, NULL),
>> >
>> >> +       X86_MATCH_VENDOR_FAM_MODEL(INTEL,  6, 0x8, 0),
>> >> +       X86_MATCH_VENDOR_FAM_MODEL(INTEL,  6, 0xb, 0),
>> >> +       X86_MATCH_VENDOR_FAM_MODEL(INTEL, 15, 0x2, 0),
>> >
>> >> +       X86_MATCH_VENDOR_FAM_MODEL(INTEL,  6, 0x8, 0),
>> >> +       X86_MATCH_VENDOR_FAM_MODEL(INTEL,  6, 0xb, 0),
>> >> +       X86_MATCH_VENDOR_FAM_MODEL(INTEL, 15, 0x2, 0),
>> >
>> > Perhaps use names instead of 6 and 15?
>>
>> Thought about that and did not come up with anyting useful. FAM6 vs. 6
>> is not really any better
>
> Hmm... Do we have family 15 for Intel? Perhaps I missed something...
> Or is it for any family?

Pentium 4
