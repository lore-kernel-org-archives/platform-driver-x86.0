Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9998C433B4
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 12:31:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 96C8160FEE
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 12:31:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352169AbhDGMbO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Apr 2021 08:31:14 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:15945 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235368AbhDGMbO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Apr 2021 08:31:14 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FFkGC5DzTzyNf6;
        Wed,  7 Apr 2021 20:28:51 +0800 (CST)
Received: from [127.0.0.1] (10.40.188.144) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.498.0; Wed, 7 Apr 2021
 20:30:55 +0800
Subject: Re: [PATCH] platform/surface: aggregator: move to use request_irq by
 IRQF_NO_AUTOEN flag
To:     Hans de Goede <hdegoede@redhat.com>,
        Tian Tao <tiantao6@hisilicon.com>, <luzmaximilian@gmail.com>,
        <mgross@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>
CC:     <platform-driver-x86@vger.kernel.org>
References: <1617778852-26492-1-git-send-email-tiantao6@hisilicon.com>
 <ddaed29b-f788-fed9-2522-8b2b3d1f46ec@redhat.com>
From:   "tiantao (H)" <tiantao6@huawei.com>
Message-ID: <6e1db99e-8d12-dcd0-536d-7d205117f6b4@huawei.com>
Date:   Wed, 7 Apr 2021 20:30:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ddaed29b-f788-fed9-2522-8b2b3d1f46ec@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.40.188.144]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


在 2021/4/7 17:51, Hans de Goede 写道:
> Hi,
>
> On 4/7/21 9:00 AM, Tian Tao wrote:
>> disable_irq() after request_irq() still has a time gap in which
>> interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
>> disable IRQ auto-enable because of requesting.
> Thank you for your patch, it is good to see the issue of there not
> being a simply way to request IRQs in a way where they are initially
> disabled being solved.
>
>> this patch is made base on "add IRQF_NO_AUTOEN for request_irq" which
>> is being merged: https://lore.kernel.org/patchwork/patch/1388765/
> So this is not yet in Linus' tree. When you write "which is being merged",
> I assume that means that this is going upstream in the 5.13 window.
this is already in linux-next.git.

cbe16f3 genirq: Add IRQF_NO_AUTOEN for request_irq/nmi()
>
> So what is the plan to merge follow-up patches using the new API which
> the "add IRQF_NO_AUTOEN for request_irq" patch introduces?
>
> Will there be an immutable branch provided with that patch which other
> subsystem maintainers can merge ?
>
> Regards,
>
> Hans
>
>
>
>
>> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
>> ---
>>   drivers/platform/surface/aggregator/controller.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/platform/surface/aggregator/controller.c b/drivers/platform/surface/aggregator/controller.c
>> index aa6f37b..00e3828 100644
>> --- a/drivers/platform/surface/aggregator/controller.c
>> +++ b/drivers/platform/surface/aggregator/controller.c
>> @@ -2483,7 +2483,8 @@ int ssam_irq_setup(struct ssam_controller *ctrl)
>>   	 * interrupt, and let the SAM resume callback during the controller
>>   	 * resume process clear it.
>>   	 */
>> -	const int irqf = IRQF_SHARED | IRQF_ONESHOT | IRQF_TRIGGER_RISING;
>> +	const int irqf = IRQF_SHARED | IRQF_ONESHOT |
>> +			 IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN;
>>   
>>   	gpiod = gpiod_get(dev, "ssam_wakeup-int", GPIOD_ASIS);
>>   	if (IS_ERR(gpiod))
>> @@ -2501,7 +2502,6 @@ int ssam_irq_setup(struct ssam_controller *ctrl)
>>   		return status;
>>   
>>   	ctrl->irq.num = irq;
>> -	disable_irq(ctrl->irq.num);
>>   	return 0;
>>   }
>>   
>>
> .
>

