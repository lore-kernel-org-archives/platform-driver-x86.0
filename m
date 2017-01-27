From: Andrey Ryabinin <aryabinin@virtuozzo.com>
Subject: Re: [PATCH] platform/x86: intel_pmc_core: fix out-of-bounds accesses
 on stack
Date: Fri, 27 Jan 2017 19:31:47 +0300
Message-ID: <0f7da819-9353-9b11-cd78-99489c5d39f5@virtuozzo.com>
References: <20170126142723.23886-1-aryabinin@virtuozzo.com>
 <CAHp75VfV3T546uZbctMBtdd55R06KHsynRP=fP06fBLLEs3Sgw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-db5eur01on0117.outbound.protection.outlook.com ([104.47.2.117]:44096
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1755167AbdA0QdU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 27 Jan 2017 11:33:20 -0500
In-Reply-To: <CAHp75VfV3T546uZbctMBtdd55R06KHsynRP=fP06fBLLEs3Sgw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>



On 01/27/2017 06:42 PM, Andy Shevchenko wrote:
> On Thu, Jan 26, 2017 at 4:27 PM, Andrey Ryabinin
> <aryabinin@virtuozzo.com> wrote:


>>  #if IS_ENABLED(CONFIG_DEBUG_FS)
>> @@ -234,12 +230,8 @@ static const struct file_operations pmc_core_ppfear_ops = {
>>  /* This function should return link status, 0 means ready */
>>  static int pmc_core_mtpmc_link_status(void)
>>  {
>> -       struct pmc_dev *pmcdev = &pmc;
>> -       u32 value;
>> -
>> -       value = pmc_core_reg_read(pmcdev, SPT_PMC_PM_STS_OFFSET);
>> -       return test_bit(SPT_PMC_MSG_FULL_STS_BIT,
>> -                       (unsigned long *)&value);
>> +       u32 value = pmc_core_reg_read(&pmc, SPT_PMC_PM_STS_OFFSET);
>> +       return value & (1U << SPT_PMC_MSG_FULL_STS_BIT);
>>  }
> 
> Thanks for the patch. IIRC I told (or may be forgot to tell) them
> during internal review about the nasty casting.
> 
> Btw, have you checked this will work in the same way, since test_bit()
> is atomic?

'value' is a local variable, atomicity is pointless here.

> And if it's okay, why not to use BIT() macro?
> 

It just a matter of taste. I find open-coded variant easier to read.
