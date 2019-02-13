From: "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@linux.intel.com>
Subject: Re: [PATCH v2 00/10] ICL support and other enhancements for PMC Core
Date: Wed, 13 Feb 2019 23:32:33 +0530
Message-ID: <6db89a43-8c69-fc33-a777-61250433fcaa@linux.intel.com>
References: <20190213150810.32750-1-rajneesh.bhardwaj@linux.intel.com>
 <CAHp75VeTwjbdjAXPZfB5B7oataarjG0epV1SzokdYnCj8xcPhA@mail.gmail.com>
 <63bb8cc7-4feb-f69c-33be-ba5308c441d1@linux.intel.com>
 <CAHp75VdH8G+FfvznZePEG1F5A1Eyh8XF=a-MqpNooLWnBbP+gA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VdH8G+FfvznZePEG1F5A1Eyh8XF=a-MqpNooLWnBbP+gA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org


On 13-Feb-19 10:58 PM, Andy Shevchenko wrote:
> On Wed, Feb 13, 2019 at 5:50 PM Bhardwaj, Rajneesh
> <rajneesh.bhardwaj@linux.intel.com> wrote:
>> On 13-Feb-19 9:03 PM, Andy Shevchenko wrote:
>>> On Wed, Feb 13, 2019 at 5:08 PM Rajneesh Bhardwaj
>>> <rajneesh.bhardwaj@linux.intel.com> wrote:
>>>> This patch series provides Icelake support for PMC Core driver and while
>>>> doing so it introduces the Icelake Mobile to intel-family.h as per the
>>>> CPUID from below Coreboot link
>>>> https://github.com/coreboot/coreboot/blob/5ebcea3aaaa3cd358bc5bccaa156b13a6ef25df6/src/soc/intel/common/block/include/intelblocks/mp_init.h
>>>> and provides some fixes and enhancements to the driver.
>>> It's not applicable to my tree.
>> Hi Andy,  I could apply and test in on latest upstream so i think its
>> probably because you have applied 5 patches from v1 on your tree.
>> https://github.com/dvhart/linux-pdx86/commits/for-next
> You need to use latest tip of the subsystem tree always.

Ok.

>
>> I sent the whole series again since
>> https://patchwork.kernel.org/patch/10791893 referred to a wrong commit
>> for Fixes:. If you want to address that by rebasing then can you please
>> just consider patches 6-10.
> We don't do rebasing for published changes. Only in rear cases when
> otherwise would be worse.
> Darren didn't respond to my question what he thinks about this case,
> but at least it's not related to the code itself which, in my opinion,
> decreases a severity.

Thanks Andy. So if i understand correctly, you are suggesting that i 
should ignore those patches that made to "for-next" branch already?

So should i just send a v3 comprising of remaining 5 patches and of 
course,  addressing recent review comments?

>> Please let me know if there is any other issue?
>
