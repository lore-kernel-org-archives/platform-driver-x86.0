From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: intel_pmc_core: fix out-of-bounds accesses
 on stack
Date: Sat, 28 Jan 2017 16:12:46 +0200
Message-ID: <CAHp75VcZ1zVag78zujsuA1mZNMMSsxsTb9Efs3WO0D0c+K9Hcw@mail.gmail.com>
References: <20170126142723.23886-1-aryabinin@virtuozzo.com>
 <CAHp75VfV3T546uZbctMBtdd55R06KHsynRP=fP06fBLLEs3Sgw@mail.gmail.com> <0f7da819-9353-9b11-cd78-99489c5d39f5@virtuozzo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f193.google.com ([209.85.220.193]:35033 "EHLO
        mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751232AbdA1OMs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 28 Jan 2017 09:12:48 -0500
In-Reply-To: <0f7da819-9353-9b11-cd78-99489c5d39f5@virtuozzo.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Jan 27, 2017 at 6:31 PM, Andrey Ryabinin
<aryabinin@virtuozzo.com> wrote:
> On 01/27/2017 06:42 PM, Andy Shevchenko wrote:
>> On Thu, Jan 26, 2017 at 4:27 PM, Andrey Ryabinin
>> <aryabinin@virtuozzo.com> wrote:
>>>  #if IS_ENABLED(CONFIG_DEBUG_FS)
>>> @@ -234,12 +230,8 @@ static const struct file_operations pmc_core_ppfear_ops = {
>>>  /* This function should return link status, 0 means ready */
>>>  static int pmc_core_mtpmc_link_status(void)
>>>  {
>>> -       struct pmc_dev *pmcdev = &pmc;
>>> -       u32 value;
>>> -
>>> -       value = pmc_core_reg_read(pmcdev, SPT_PMC_PM_STS_OFFSET);
>>> -       return test_bit(SPT_PMC_MSG_FULL_STS_BIT,
>>> -                       (unsigned long *)&value);
>>> +       u32 value = pmc_core_reg_read(&pmc, SPT_PMC_PM_STS_OFFSET);
>>> +       return value & (1U << SPT_PMC_MSG_FULL_STS_BIT);
>>>  }
>>
>> Thanks for the patch. IIRC I told (or may be forgot to tell) them
>> during internal review about the nasty casting.
>>
>> Btw, have you checked this will work in the same way, since test_bit()
>> is atomic?
>
> 'value' is a local variable, atomicity is pointless here.

Ah, indeed.

>> And if it's okay, why not to use BIT() macro?

> It just a matter of taste. I find open-coded variant easier to read.

Okay, what I'm about to do:

- switch to BIT() macro (it's already used by the driver)
- revert unrelated changes (piece of code where we get value)

and push it to testing.

Tell me if you have any objections.

-- 
With Best Regards,
Andy Shevchenko
