Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCC6FC433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 22 Jun 2022 10:05:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241637AbiFVKFB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 22 Jun 2022 06:05:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235868AbiFVKFA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Jun 2022 06:05:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0C8725FCA
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jun 2022 03:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655892299;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=84gpKsNB7JYxXffvBLkYUbuDV6nb1Wny/jKAjIkBDIY=;
        b=cQoCh77nLOC37ke1y3EWfQijVDLoQS9Oc2zmlNB9w3ddxxib8N0qy+AwmUlNW2sMaXgTbH
        sTeh4JYwBXi8s6SilQhG21/wyQZjMfv4YcpjWnQL3tPr4IbDUOpkCKpygfsGk/jz5EXNCx
        saBJ5isxhSDZmkKAsp0jww0zeRgdiRo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-102-cxVccGkKMVuIT9avCmxpoQ-1; Wed, 22 Jun 2022 06:04:58 -0400
X-MC-Unique: cxVccGkKMVuIT9avCmxpoQ-1
Received: by mail-ed1-f72.google.com with SMTP id t14-20020a056402524e00b0043595a18b91so3580091edd.13
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jun 2022 03:04:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=84gpKsNB7JYxXffvBLkYUbuDV6nb1Wny/jKAjIkBDIY=;
        b=vfE5EIYVlswiIvsPTu7THrjqSe0ilONuMIGigAuVphINc/qREdwJWmS8sd9+WvaEit
         pCVlPmQcOOT/MFZQlxyH6hS9zFN/mlbqwo2ckO036ISPdUOdLSALaAJysWs9025PcCTk
         nSlDKEvFeMKRgYazPfAmXP/UiRSmPqCDratxO5xOqO5SRTOK1xAhRtefexqVa+7/Fllf
         di8MOuS44q0egIxFprzNb2cxrI/wdqSenTOgVgujF+74XaFqNIFdfUCasls5q5Fa3r84
         cJ8X+THqFWbtuT+rtE/m/Mmd1Dh/qMzwWUCXtg0RUtJKx9Ers8QCzpNxfVu+CzLEyZS7
         HldA==
X-Gm-Message-State: AJIora89+ngp934JvdGqBnnsdpHHd8+ajXSvI+oQEF4Es4eCW+nhOYJV
        RTZp909bxQJ/RD4UGxz5o8wuysWJ3cK84RB00w7MVAmo0BXJ5ZqMyEPrNkinla3S1tdkrumMzwB
        V16bBfxHj9zdB0xuAmm9fJtba7rEDn02twg==
X-Received: by 2002:a17:906:99c1:b0:6fe:b01d:134 with SMTP id s1-20020a17090699c100b006feb01d0134mr2396138ejn.598.1655892296674;
        Wed, 22 Jun 2022 03:04:56 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uGdDYV7P6XolRuwBWHh/O1nSCaxf5vGvZb1sMP9FbeBXgwTaTJQKkwjVzaVRdcYFQLdDncGA==
X-Received: by 2002:a17:906:99c1:b0:6fe:b01d:134 with SMTP id s1-20020a17090699c100b006feb01d0134mr2396122ejn.598.1655892296416;
        Wed, 22 Jun 2022 03:04:56 -0700 (PDT)
Received: from [192.168.43.127] ([109.37.135.195])
        by smtp.gmail.com with ESMTPSA id h16-20020a17090791d000b006fe98c7c7a9sm8888794ejz.85.2022.06.22.03.04.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 03:04:55 -0700 (PDT)
Message-ID: <b419b60a-8419-841a-51d0-1ee5fb8d77fc@redhat.com>
Date:   Wed, 22 Jun 2022 12:04:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] platform/surface: avoid flush_scheduled_work() usage
Content-Language: en-US
To:     Maximilian Luz <luzmaximilian@gmail.com>,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <63ec2d45-c67c-1134-f6d3-490c8ba67a01@I-love.SAKURA.ne.jp>
 <df69c497-0ec1-0ffa-b434-dede30a36c36@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <df69c497-0ec1-0ffa-b434-dede30a36c36@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/10/22 13:29, Maximilian Luz wrote:
> On 6/10/22 07:41, Tetsuo Handa wrote:
>> Use local wq in order to avoid flush_scheduled_work() usage.
>>
>> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
>> ---
>> Please see commit c4f135d643823a86 ("workqueue: Wrap flush_workqueue()
>> using a macro") for background.
>>
>> This is a blind conversion, and is only compile tested.
> 
> Looks good to me, thanks!
> 
> Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com>
> Tested-by: Maximilian Luz <luzmaximilian@gmail.com>

Thanks.

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


> 
>>   .../platform/surface/surface_acpi_notify.c    | 27 ++++++++++++++++---
>>   1 file changed, 24 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/platform/surface/surface_acpi_notify.c b/drivers/platform/surface/surface_acpi_notify.c
>> index 7b758f8cc137..c0e12f0b9b79 100644
>> --- a/drivers/platform/surface/surface_acpi_notify.c
>> +++ b/drivers/platform/surface/surface_acpi_notify.c
>> @@ -37,6 +37,7 @@ struct san_data {
>>   #define to_san_data(ptr, member) \
>>       container_of(ptr, struct san_data, member)
>>   +static struct workqueue_struct *san_wq;
>>     /* -- dGPU notifier interface. ---------------------------------------------- */
>>   @@ -356,7 +357,7 @@ static u32 san_evt_bat_nf(struct ssam_event_notifier *nf,
>>         memcpy(&work->event, event, sizeof(struct ssam_event) + event->length);
>>   -    schedule_delayed_work(&work->work, delay);
>> +    queue_delayed_work(san_wq, &work->work, delay);
>>       return SSAM_NOTIF_HANDLED;
>>   }
>>   @@ -861,7 +862,7 @@ static int san_remove(struct platform_device *pdev)
>>        * We have unregistered our event sources. Now we need to ensure that
>>        * all delayed works they may have spawned are run to completion.
>>        */
>> -    flush_scheduled_work();
>> +    flush_workqueue(san_wq);
>>         return 0;
>>   }
>> @@ -881,7 +882,27 @@ static struct platform_driver surface_acpi_notify = {
>>           .probe_type = PROBE_PREFER_ASYNCHRONOUS,
>>       },
>>   };
>> -module_platform_driver(surface_acpi_notify);
>> +
>> +static int __init san_init(void)
>> +{
>> +    int ret;
>> +
>> +    san_wq = alloc_workqueue("san_wq", 0, 0);
>> +    if (!san_wq)
>> +        return -ENOMEM;
>> +    ret = platform_driver_register(&surface_acpi_notify);
>> +    if (ret)
>> +        destroy_workqueue(san_wq);
>> +    return ret;
>> +}
>> +module_init(san_init);
>> +
>> +static void __exit san_exit(void)
>> +{
>> +    platform_driver_unregister(&surface_acpi_notify);
>> +    destroy_workqueue(san_wq);
>> +}
>> +module_exit(san_exit);
>>     MODULE_AUTHOR("Maximilian Luz <luzmaximilian@gmail.com>");
>>   MODULE_DESCRIPTION("Surface ACPI Notify driver for Surface System Aggregator Module");
> 

