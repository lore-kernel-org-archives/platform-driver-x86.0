From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 01/22] x86/devicetable: Move x86 specific macro out of generic code
Date: Fri, 20 Mar 2020 21:24:41 +0100
Message-ID: <87k13epyeu.fsf@nanos.tec.linutronix.de>
References: <20200320131345.635023594@linutronix.de> <20200320131508.736205164@linutronix.de> <CAHp75Vca0j0=EB2qdvGgFOq2s_ohHUEzY4OeNrv-oynLBVYh1w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <CAHp75Vca0j0=EB2qdvGgFOq2s_ohHUEzY4OeNrv-oynLBVYh1w@mail.gmail.com>
Sender: linux-acpi-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Gross <mgross@linux.intel.com>, Tony Luck <tony.luck@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Linux PM <linux-pm@vger.kernel.org>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, linux-edac@vger.kernel.org, Platform Driver <platform-driver-x86@vger.kernel.org>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>li
List-Id: platform-driver-x86.vger.kernel.org

Andy Shevchenko <andy.shevchenko@gmail.com> writes:
> On Fri, Mar 20, 2020 at 3:17 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>> --- a/arch/x86/include/asm/cpu_device_id.h
>> +++ b/arch/x86/include/asm/cpu_device_id.h
>> @@ -6,10 +6,21 @@
>>   * Declare drivers belonging to specific x86 CPUs
>>   * Similar in spirit to pci_device_id and related PCI functions
>>   */
>
>> -
>
> Seems you are going to remove below anyway in the next patches, so,
> why not to do this also there?
>
>>  #include <linux/mod_devicetable.h>

No it stays, but yes I could do that comment change right here.

Thanks,

        tglx
