Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AADB5C4361B
	for <platform-driver-x86@archiver.kernel.org>; Tue, 15 Dec 2020 20:24:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6FF3A224BE
	for <platform-driver-x86@archiver.kernel.org>; Tue, 15 Dec 2020 20:24:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727582AbgLOUYf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Dec 2020 15:24:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727785AbgLOUYY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Dec 2020 15:24:24 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 991F4C0617A6;
        Tue, 15 Dec 2020 12:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=N/1okadLW/1bioiLHBq8zQD0b+zBkavJlAW3LSyJkNk=; b=nppOdxK8/vMIEzYqVMVjlrVXrl
        Lqp2DCPyIrJJnPtoZl1wCv0zPT/wQRlLYjrZaKhLvTvXGEmf0tqQAgMBiHQCKIspOx5UL99CVR1k2
        pa/Kh+BKFxCkHW1z0jC9brjgyBIgvgtD+zbPMv0P2jARbf2SQJJi1RNkBYkIp3L89MvuAOy27/s4v
        LWTT95yWaxd2NlVwoQ7mqeO3pketVmcT/N1FpYn0mBsBVszgUNTwQ3hE2ICHDn2dX70PeAn/L940S
        qB+m3uxTzEwC+/dWzVE4RiFNFgdoYUcpN5uTepv96km/phH/r5s2jQUT0u02I9MOG/3M2tGIx//Il
        wNli57sg==;
Received: from [2601:1c0:6280:3f0::64ea]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kpGi3-0002z8-Kg; Tue, 15 Dec 2020 20:14:12 +0000
Subject: Re: [PATCH v2 -next] platform: surface: fix non-PM_SLEEP build
 warnings
To:     Maximilian Luz <luzmaximilian@gmail.com>,
        linux-kernel@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
References: <20201214233336.19782-1-rdunlap@infradead.org>
 <5fd70f29-2795-5b46-4bc9-e60a26efee88@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <266d2103-ae66-e216-1940-a16c4199aefb@infradead.org>
Date:   Tue, 15 Dec 2020 12:14:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <5fd70f29-2795-5b46-4bc9-e60a26efee88@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 12/15/20 11:55 AM, Maximilian Luz wrote:
> On 12/15/20 12:33 AM, Randy Dunlap wrote:
>> Fix build warnings when CONFIG_PM_SLEEP is not enabled and these
>> functions are not used:
>>
>> ../drivers/platform/surface/surface_gpe.c:189:12: warning: ‘surface_gpe_resume’ defined but not used [-Wunused-function]
>>   static int surface_gpe_resume(struct device *dev)
>>              ^~~~~~~~~~~~~~~~~~
>> ../drivers/platform/surface/surface_gpe.c:184:12: warning: ‘surface_gpe_suspend’ defined but not used [-Wunused-function]
>>   static int surface_gpe_suspend(struct device *dev)
>>              ^~~~~~~~~~~~~~~~~~~
>>
>> Fixes: 274335f1c557 ("platform/surface: Add Driver to set up lid GPEs on MS Surface device")
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Maximilian Luz <luzmaximilian@gmail.com>
>> Cc: Hans de Goede <hdegoede@redhat.com>
>> Cc: platform-driver-x86@vger.kernel.org
>> ---
>> v2: dropped Maximilian's RVB tag since the patch changed
>>      use preferred __maybe_unused instead of ifdeffery:
>>        https://lore.kernel.org/patchwork/patch/732981/
>>
>>   drivers/platform/surface/surface_gpe.c |    4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> --- linux-next-20201214.orig/drivers/platform/surface/surface_gpe.c
>> +++ linux-next-20201214/drivers/platform/surface/surface_gpe.c
>> @@ -181,12 +181,12 @@ static int surface_lid_enable_wakeup(str
>>       return 0;
>>   }
>>   -static int surface_gpe_suspend(struct device *dev)
>> +static int __maybe_unused surface_gpe_suspend(struct device *dev)
>>   {
>>       return surface_lid_enable_wakeup(dev, true);
>>   }
>>   -static int surface_gpe_resume(struct device *dev)
>> +static int __maybe_unused surface_gpe_resume(struct device *dev)
>>   {
>>       return surface_lid_enable_wakeup(dev, false);
>>   }
>>
> 
> Code looks good to me.
> 
> Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com>
> 
> As already mentioned before, I'd prefer the subject line to be
> "platform/surface: gpe: ...", or at least "platform/surface: ..." for
> consistency with other commits. May just be a personal preference
> though, so nothing that should prevent it from being applied.
> 

Ugh, sorry about that. I've changed that in the patch so if I ever
resend it, it will be fixed.


-- 
~Randy

