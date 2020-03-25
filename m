From: Rong Chen <rong.a.chen@intel.com>
Subject: Re: [cpufreq] 06c4d00466: will-it-scale.per_process_ops -53.4%
 regression
Date: Wed, 25 Mar 2020 15:50:44 +0800
Message-ID: <43a4189a-7153-18e8-4657-4a4400002c05@intel.com>
References: <20200320131509.564059710@linutronix.de>
 <20200324060124.GC11705@shao2-debian>
 <CAHp75VeeKZLeZ8E3Py7LECN54SPFHaRgkxrMzBYQWXM8x+4JhA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <CAHp75VeeKZLeZ8E3Py7LECN54SPFHaRgkxrMzBYQWXM8x+4JhA@mail.gmail.com>
Content-Language: en-US
Sender: linux-acpi-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Gross <mgross@linux.intel.com>, Tony Luck <tony.luck@intel.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Linux PM <linux-pm@vger.kernel.org>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Len Brown <lenb@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, linux-edac@vger.kernel.org, Platform Driver <platform-driver-x86@vger.kernel.org>, Jean Delvare <jdelvare@suse.com>, Gue
List-Id: platform-driver-x86.vger.kernel.org



On 3/24/20 6:24 PM, Andy Shevchenko wrote:
> On Tue, Mar 24, 2020 at 8:02 AM kernel test robot <rong.a.chen@intel.com> wrote:
>> Greeting,
>>
>> FYI, we noticed a -53.4% regression of will-it-scale.per_process_ops due to commit:
>> commit: 06c4d00466eb374841bc84c39af19b3161ff6917 ("[patch 09/22] cpufreq: Convert to new X86 CPU match macros")
>> url: https://github.com/0day-ci/linux/commits/Thomas-Gleixner/x86-devicetable-Move-x86-specific-macro-out-of-generic-code/20200321-031729
>> base: https://git.kernel.org/cgit/linux/kernel/git/rafael/linux-pm.git linux-next
>>
>> in testcase: will-it-scale
>> on test machine: 4 threads Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz with 8G memory
>> with following parameters:
>
> drivers/cpufreq/speedstep-centrino.c change missed the terminator,
> perhaps it's a culprit, because I don't believe removing dups and
> reordering lines may affect this.
> Can you restore terminator there and re-test?
>

I have retested with the change, but it has no effect on the performance.

Best Regards,
Rong Chen
