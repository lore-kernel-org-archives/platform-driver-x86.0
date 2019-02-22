From: "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@linux.intel.com>
Subject: Re: [PATCH v3 0/5] ICL support and other enhancements for PMC Core
Date: Fri, 22 Feb 2019 09:13:35 +0530
Message-ID: <35e994a3-cb87-5af0-5b44-0ce3512640f6@linux.intel.com>
References: <20190214115712.19642-1-rajneesh.bhardwaj@linux.intel.com>
 <CAHp75VcdBMVgDxuJKyiw5n9UZr7w0u+zz73GAUnRM6Y9C-=r0w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VcdBMVgDxuJKyiw5n9UZr7w0u+zz73GAUnRM6Y9C-=r0w@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org


On 21-Feb-19 7:55 PM, Andy Shevchenko wrote:
> On Thu, Feb 14, 2019 at 1:56 PM Rajneesh Bhardwaj
> <rajneesh.bhardwaj@linux.intel.com> wrote:
>> Changes in v3:
>>   * Dropped reference to coreboot project as suggested by Thomas and Boris.
>>   * Rebased onto "for-next" branch of pdx86 tree and dropped previously
>>     accepted five patches from v2 of this series since they are already
>>     present there.
>>   * Fixed checkpatch complains about 75 char limit for commit messages.
>>
>> Changes in v2:
>>   * Addressed review comments from Thomas
>>   * Added tags revieved
>>   * Folded in SHA1 suggestions from Stephen Rothwell, though Andy might
>>     want to fix it via rebasing
>>   * Rebased and tested with Linux v5.0.0-rc6
>>
>> This series:
>>   - Adds ICL U/Y CPUID to intel-family.h
>>   - Enables PMC driver for ICL
>>   - Introduces a new "package cstate show" feature
>>   - Fixes a customer issue related to S0ix on latest HP laptops
>>   - Fixes some minor bugs
>>
>>
> Pushed to my review and testing queue, thanks!

Thank you!

>
>
>> Rajneesh Bhardwaj (5):
>>    x86/cpu: Add Icelake to Intel family
>>    platform/x86: intel_pmc_core: Convert to INTEL_CPU_FAM6 macro
>>    platform/x86: intel_pmc_core: Add ICL platform support
>>    platform/x86: intel_pmc_core: Add Package cstates residency info
>>    platform/x86: intel_pmc_core: Quirk to ignore XTAL shutdown
>>
>>   arch/x86/include/asm/intel-family.h   |   2 +
>>   drivers/platform/x86/intel_pmc_core.c | 144 ++++++++++++++++++++++----
>>   drivers/platform/x86/intel_pmc_core.h |  10 ++
>>   3 files changed, 135 insertions(+), 21 deletions(-)
>>
>> --
>> 2.17.1
>>
>
