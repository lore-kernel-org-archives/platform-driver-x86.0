From: "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@linux.intel.com>
Subject: Re: [PATCH v2 00/10] ICL support and other enhancements for PMC Core
Date: Wed, 13 Feb 2019 21:19:58 +0530
Message-ID: <63bb8cc7-4feb-f69c-33be-ba5308c441d1@linux.intel.com>
References: <20190213150810.32750-1-rajneesh.bhardwaj@linux.intel.com>
 <CAHp75VeTwjbdjAXPZfB5B7oataarjG0epV1SzokdYnCj8xcPhA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VeTwjbdjAXPZfB5B7oataarjG0epV1SzokdYnCj8xcPhA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org


On 13-Feb-19 9:03 PM, Andy Shevchenko wrote:
> On Wed, Feb 13, 2019 at 5:08 PM Rajneesh Bhardwaj
> <rajneesh.bhardwaj@linux.intel.com> wrote:
>> This patch series provides Icelake support for PMC Core driver and while
>> doing so it introduces the Icelake Mobile to intel-family.h as per the
>> CPUID from below Coreboot link
>> https://github.com/coreboot/coreboot/blob/5ebcea3aaaa3cd358bc5bccaa156b13a6ef25df6/src/soc/intel/common/block/include/intelblocks/mp_init.h
>> and provides some fixes and enhancements to the driver.
> It's not applicable to my tree.

Hi Andy,  I could apply and test in on latest upstream so i think its 
probably because you have applied 5 patches from v1 on your tree. 
https://github.com/dvhart/linux-pdx86/commits/for-next

I sent the whole series again since 
https://patchwork.kernel.org/patch/10791893 referred to a wrong commit 
for Fixes:. If you want to address that by rebasing then can you please 
just consider patches 6-10.

Please let me know if there is any other issue?

>> Changes in v2:
>>   * Addressed review comments from Thomas
>>   * Added tags revieved
>>   * Folded in SHA1 suggestions from Stephen Rothwell, though Andy might want to
>>     fix it via rebasing
>>   * Rebased and tested with Linux v5.0.0-rc6
>>
>> This series:
>>   - Adds ICL U/Y CPUID to intel-family.h
>>   - Enables PMC driver for ICL
>>   - Introduces a new "package cstate show" feature
>>   - Fixes a customer issue related to S0ix on latest HP laptops
>>   - Fixes some minor bugs
>>
>> Rajneesh Bhardwaj (10):
>>    platform/x86: intel_pmc_core: Handle CFL regmap properly
>>    platform/x86: intel_pmc_core: Fix PCH IP sts reading
>>    platform/x86: intel_pmc_core: Fix PCH IP name
>>    platform/x86: intel_pmc_core: Fix file permissions for ltr_show
>>    platform/x86: intel_pmc_core: Include Reserved IP for LTR
>>    x86/cpu: Add Icelake to Intel family
>>    platform/x86: intel_pmc_core: Convert to INTEL_CPU_FAM6 macro
>>    platform/x86: intel_pmc_core: Add ICL platform support
>>    platform/x86: intel_pmc_core: Add Package cstates residency info
>>    platform/x86: intel_pmc_core: Quirk to ignore XTAL shutdown
>>
>>   arch/x86/include/asm/intel-family.h   |   2 +
>>   drivers/platform/x86/intel_pmc_core.c | 155 +++++++++++++++++++++-----
>>   drivers/platform/x86/intel_pmc_core.h |  14 ++-
>>   3 files changed, 145 insertions(+), 26 deletions(-)
>>
>> --
>> 2.17.1
>>
>
