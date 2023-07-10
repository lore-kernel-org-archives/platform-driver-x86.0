Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD88AEB64D9
	for <platform-driver-x86@archiver.kernel.org>; Mon, 10 Jul 2023 13:34:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232383AbjGJNez (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 10 Jul 2023 09:34:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232483AbjGJNew (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 10 Jul 2023 09:34:52 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2B6D1716
        for <platform-driver-x86@vger.kernel.org>; Mon, 10 Jul 2023 06:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688996030;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ak9fRbxuixcIYTWvlnH4cZYdZvxzAVmoXYAJWfQ6iRg=;
        b=EM2PaCA8eSNbq6upjjyYUWNwdGaRQe7J32aE5G6Oh+SHkXguYX+j9YCBf3OttIqzxHGlAl
        BopvCP7GoPsDan65WBbfJcszW/EjjheogsDVkbIsLma2lT37UJ4NNNunJqacrhPVfhu2VS
        m1MNeokq/QziuqwUEvteMEjCVv7yBcY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-396-lZehKqkOOoWyaREvElR6vA-1; Mon, 10 Jul 2023 09:33:48 -0400
X-MC-Unique: lZehKqkOOoWyaREvElR6vA-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-51e166a4087so2679205a12.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 10 Jul 2023 06:33:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688996027; x=1691588027;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ak9fRbxuixcIYTWvlnH4cZYdZvxzAVmoXYAJWfQ6iRg=;
        b=DQFRukd5y5N3HZZy8SJWdkIVLykSeQuLkvb17Y0A2vZAchhyFE4uzbl4SmS2Ckvbxs
         OtPSbh66Ty6SEx039voUpE3e08B+xvWUz4atRZPpFtugjnyw/kPDwXt6yfMRTyqgXkr/
         KgjEkdrYFVoqyymgCfx+ZYn8VRAUhlDPRTd7CET2kb2zZ0ByXnRp4pm3HVj5pXFoFd7r
         cx0xDmuE+BZKnLJsWtZOl0qTTG3httjB2j02zoqkI4HBc4V1wu+vSu7wHFXOGmV0We1H
         7DOiSiC7+knTzFJFvuU+eLrV1UQ1CfDt79jsGOEfIAbmCcOVe4oWtyXT99cwRz3agjkZ
         BSkw==
X-Gm-Message-State: ABy/qLZPCMFe9khqN2a1SqNGboAH2NQero37/wo1qSURSKQX0l/oYUxz
        0A9rPY9AqzxFNB9J8o9b21mNmz0mv7PQW8nktvZbMn/9y49mhRw2jryVF1weTg22/zZ5f9WL1Ba
        lXn5G69IPrOV6+vw2AMZTHCGHEHJ83+XDSA==
X-Received: by 2002:a05:6402:1391:b0:51d:d48b:9978 with SMTP id b17-20020a056402139100b0051dd48b9978mr10787673edv.8.1688996027420;
        Mon, 10 Jul 2023 06:33:47 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGwnIs3wUYSW3/n22GQIxO2F9IABGWqGeuoH+p/ffkYlO8rC66v0dSUKr9zH82kM+1IYioUig==
X-Received: by 2002:a05:6402:1391:b0:51d:d48b:9978 with SMTP id b17-20020a056402139100b0051dd48b9978mr10787639edv.8.1688996027023;
        Mon, 10 Jul 2023 06:33:47 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id e16-20020a50ec90000000b0051e2a5d9290sm5781645edr.77.2023.07.10.06.33.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 06:33:46 -0700 (PDT)
Message-ID: <4a11393d-69bb-8e9d-3bfe-21aa7a7fb1e3@redhat.com>
Date:   Mon, 10 Jul 2023 15:33:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/2] watchdog: simatic-ipc-wdt: make IO region access of
 one model muxed
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>,
        Henning Schild <henning.schild@siemens.com>,
        Mark Gross <markgross@kernel.org>,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Jean Delvare <jdelvare@suse.com>,
        linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Tobias Schaffner <tobias.schaffner@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>
References: <20230706154831.19100-1-henning.schild@siemens.com>
 <20230706154831.19100-2-henning.schild@siemens.com>
 <876f6a08-1850-21cd-83d1-b309e7e1e912@roeck-us.net>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <876f6a08-1850-21cd-83d1-b309e7e1e912@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Guenter,

On 7/6/23 18:03, Guenter Roeck wrote:
> On 7/6/23 08:48, Henning Schild wrote:
>> The IO region used for the watchdog also hold CMOS battery monitoring
>> information. Make the access muxed so that a hwmon driver can use the
>> region as well.
>>
>> Signed-off-by: Henning Schild <henning.schild@siemens.com>
> 
> Acked-by: Guenter Roeck <linux@roeck-us.net>

Thank you. Is it ok if I pick up his patch and merge it together with 2/2
through the pdx86 tree ?

Regards,

Hans


> 
>> ---
>>   drivers/watchdog/simatic-ipc-wdt.c | 9 ++++++---
>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/watchdog/simatic-ipc-wdt.c b/drivers/watchdog/simatic-ipc-wdt.c
>> index 6599695dc672..cdc1a2e15180 100644
>> --- a/drivers/watchdog/simatic-ipc-wdt.c
>> +++ b/drivers/watchdog/simatic-ipc-wdt.c
>> @@ -155,9 +155,8 @@ static int simatic_ipc_wdt_probe(struct platform_device *pdev)
>>         switch (plat->devmode) {
>>       case SIMATIC_IPC_DEVICE_227E:
>> -        if (!devm_request_region(dev, gp_status_reg_227e_res.start,
>> -                     resource_size(&gp_status_reg_227e_res),
>> -                     KBUILD_MODNAME)) {
>> +        res = &gp_status_reg_227e_res;
>> +        if (!request_muxed_region(res->start, resource_size(res), res->name)) {
>>               dev_err(dev,
>>                   "Unable to register IO resource at %pR\n",
>>                   &gp_status_reg_227e_res);
>> @@ -210,6 +209,10 @@ static int simatic_ipc_wdt_probe(struct platform_device *pdev)
>>       if (wdd_data.bootstatus)
>>           dev_warn(dev, "last reboot caused by watchdog reset\n");
>>   +    if (plat->devmode == SIMATIC_IPC_DEVICE_227E)
>> +        release_region(gp_status_reg_227e_res.start,
>> +                   resource_size(&gp_status_reg_227e_res));
>> +
>>       watchdog_set_nowayout(&wdd_data, nowayout);
>>       watchdog_stop_on_reboot(&wdd_data);
>>       return devm_watchdog_register_device(dev, &wdd_data);
> 

