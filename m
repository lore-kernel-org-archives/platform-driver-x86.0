From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
Subject: Re: [PATCH 1/2] x86/quark: Add Quark embedded SRAM support
Date: Tue, 05 May 2015 06:03:05 -0700
Message-ID: <5548BF89.3060705@nexus-software.ie>
References: <1430705875-6990-1-git-send-email-pure.logic@nexus-software.ie>	 <1430705875-6990-2-git-send-email-pure.logic@nexus-software.ie> <1430815487.3843.24.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430815487.3843.24.camel@x220>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, dvhart@infradead.org, andy.schevchenko@gmail.com, boon.leong.ong@intel.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, derek.browne@intel.com, josef.ahmad@intel.com, erik.nyquist@intel.com
List-Id: platform-driver-x86.vger.kernel.org

On 05/05/15 01:44, Paul Bolle wrote:
> On Mon, 2015-05-04 at 03:17 +0100, Bryan O'Donoghue wrote:
>> --- a/arch/x86/platform/intel-quark/Makefile
>> +++ b/arch/x86/platform/intel-quark/Makefile
>
>>   obj-$(CONFIG_INTEL_IMR) += imr.o
>
> (Your change to drivers/platform/x86/Kconfig now makes it possible that
> imr.o will be part of a module. More on that below.)
>
>> +obj-$(CONFIG_INTEL_ESRAM) += esram.o
>
> INTEL_ESRAM is a bool Kconfig symbol, so esram.o will never be part of a
> module, right?


Nope - this is kak that is hanging around in my git repo for no good 
reason. No intention to make IMRs modules (and in fact everything would 
break if they were).

Thanks - no idea how that crept in :)
> Was your intention perhaps to make this a tristate symbol?

No I think I was making esram tristate for test purposes - edited the 
wrong line - and then didn't scrub it before the patchseries :(

Cheers !
