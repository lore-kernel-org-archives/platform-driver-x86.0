From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1] platform/x86: intel_pmc_ipc: fix division in 32-bit case
Date: Fri, 10 Feb 2017 13:52:33 +0200
Message-ID: <CAHp75Vda=ku6fm4kai=D3Vbu=uzEmKSN5o46gYhb9d5AUBELhQ@mail.gmail.com>
References: <20170208160028.13308-1-andriy.shevchenko@linux.intel.com> <20170210042400.GA27435@rajaneesh-OptiPlex-9010>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f193.google.com ([209.85.220.193]:35029 "EHLO
        mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752129AbdBJMCS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Feb 2017 07:02:18 -0500
In-Reply-To: <20170210042400.GA27435@rajaneesh-OptiPlex-9010>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Shanth Murthy <shanth.murthy@intel.com>, Zha Qipeng <qipeng.zha@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>

On Fri, Feb 10, 2017 at 6:24 AM, Rajneesh Bhardwaj
<rajneesh.bhardwaj@intel.com> wrote:
> On Wed, Feb 08, 2017 at 06:00:28PM +0200, Andy Shevchenko wrote:
>> On 32-bit x86 platforms we can't do 64-bit divisions:
>>
>>       ERROR: "__udivdi3" [drivers/platform/x86/intel_pmc_ipc.ko] undefined!
>>
>> Replace plain division by do_div() macro call.
>>
>> Reported-by: Darren Hart <dvhart@infradead.org>
>> Cc: Shanth Murthy <shanth.murthy@intel.com>
>> Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> ---
>>  drivers/platform/x86/intel_pmc_ipc.c | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
>> index 46202b6e7c87..8ad4d7b43423 100644
>> --- a/drivers/platform/x86/intel_pmc_ipc.c
>> +++ b/drivers/platform/x86/intel_pmc_ipc.c
>> @@ -62,7 +62,12 @@
>>  #define GCR_TELEM_SHLW_S0IX_OFFSET   0x1080
>>
>>  /* Residency with clock rate at 19.2MHz to usecs */
>> -#define S0IX_RESIDENCY_IN_USECS(d, s)                (((d) + (s)) * 10 / 192)
>> +#define S0IX_RESIDENCY_IN_USECS(d, s)                \
>> +({                                           \
>> +     u64 result = 10ull * ((d) + (s));       \
>> +     do_div(result, 192);                    \
>> +     result;                                 \
>> +})
>>
>
> Looks good, we verified it. We are planning to squash this one and send V2.
> Hope thats fine?

Please, do!

-- 
With Best Regards,
Andy Shevchenko
