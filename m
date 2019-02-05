From: "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@linux.intel.com>
Subject: Re: [PATCH 00/10] ICL support and other enhancements for PMC Core
Date: Tue, 5 Feb 2019 23:43:53 +0530
Message-ID: <d603593e-cba6-0df4-5f8d-8465be5c9456@linux.intel.com>
References: <20190201073234.13280-1-rajneesh.bhardwaj@linux.intel.com>
 <CAHp75VeFBnQzv4dacZ0GPUwPYUmzFJvLC1qwVy8DqkST=b=hgw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VeFBnQzv4dacZ0GPUwPYUmzFJvLC1qwVy8DqkST=b=hgw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org


On 05-Feb-19 11:36 PM, Andy Shevchenko wrote:
> On Fri, Feb 1, 2019 at 9:32 AM Rajneesh Bhardwaj
> <rajneesh.bhardwaj@linux.intel.com> wrote:
>> This patch series provides Icelake support for PMC Core driver and while
>> doing so it introduces the Icelake Mobile to intel-family.h as per the
>> CPUID from below Coreboot link
>> https://github.com/coreboot/coreboot/blob/5ebcea3aaaa3cd358bc5bccaa156b13a6ef25df6/src/soc/intel/common/block/include/intelblocks/mp_init.h
>> and provides some fixes and enhancements to the driver.
>>
> I have applied first 5 patches (fixes) to my review and testing queue, thanks!
Thank you Andy :)
>
> I'll wait for the next version next week, based on what would be
> promoted to our for-next branch and addressed comments from reviewers.
Fine, I'll look forward to submit remaining patches after addressing all 
received feedback thus far, next week.
>
>> This series:
>>   -adds ICL U/Y CPUID to intel-family.h
>>   -enable PMC driver for ICL.
>>   -introduce a new "package cstate show" feature
>>   -fixes a customer issue related to S0ix on latest HP laptops.
>>   -fixes some minor bugs
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
