Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15E5BC636D0
	for <platform-driver-x86@archiver.kernel.org>; Mon, 30 Jan 2023 15:12:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236266AbjA3PMX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 30 Jan 2023 10:12:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237981AbjA3PMR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 30 Jan 2023 10:12:17 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B651D38B69
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jan 2023 07:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675091486;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JIrJgo/c+ZFtDvr4payH+0TXcSm3O3nwdwQfk2QniEA=;
        b=OUyzqoa8VynbNyS++XZE7RkDac14Z+Z2uBeL81k0W8O9zlTBJg9ZPxzvMIXeHHZJenJ5uE
        QpW2403HnYJ59U0N/Jc1HTEtNJlsJcrcNJJ4/8OxIe9eP9Di83vJgBNUA1mUwLdlTr+nZ8
        TPLhfRjzClXUAuNjczycg4mdpjiTFGQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-244-luKQunSbNfy84AqLIWy7NA-1; Mon, 30 Jan 2023 10:11:24 -0500
X-MC-Unique: luKQunSbNfy84AqLIWy7NA-1
Received: by mail-ed1-f72.google.com with SMTP id s3-20020a50ab03000000b0049ec3a108beso8385449edc.7
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jan 2023 07:11:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JIrJgo/c+ZFtDvr4payH+0TXcSm3O3nwdwQfk2QniEA=;
        b=08RJndHGmnvhFb7YZcPw5SsXc7TnSMmebXzREOVMSd71fmhopMgFr1FzHqT6NTMpyz
         GGmuVSIo9fliHdkDHj1ICJWcf5UiR/0iuDNBrxjXc0pBBT4TM6lZjgS9iJ5LJtlY/mom
         YIA5s1RYAGWr7yfwLUNsoRM5zT2iHlI/9wICjkT2DLG6Hz5xI7no8JJNkmzSxXUZz7FN
         pmtJzF3WWRc4W96il+DHIiV4UIahgsE4lLb3K3SEPIsNG0zZ4y6AO9L64szeFTOgvZ/9
         r7WZn91sd/CsWmCvKmAgI3xrqp/JThB0nwsptnErS28uUb5xjyOMRs8ZcVBJwfWf1uK0
         +Ymw==
X-Gm-Message-State: AO0yUKX6JEbubB0hAxqHHvENEDC4Hn2BWzbbI16GH1lclzzE6ihYyXNU
        kSbQ2JPq1kxW5zVsKf+SAfvk0VrPoCsn7qUnTrWdCDK9Urr3rWK+z1bHplvjndRnTlPvES2J1at
        UNFbVdD7817/69TNE2qd52wArrKXLIz8uPg==
X-Received: by 2002:a17:906:dc3:b0:87f:d17:66db with SMTP id p3-20020a1709060dc300b0087f0d1766dbmr10309768eji.52.1675091483456;
        Mon, 30 Jan 2023 07:11:23 -0800 (PST)
X-Google-Smtp-Source: AK7set+57HYbmhDApH0Uah5nfXgOEm07VqcuWTqyKF67t+Z6K88j0EiMZ1np6hd2PV6s0wfSY5kVXA==
X-Received: by 2002:a17:906:dc3:b0:87f:d17:66db with SMTP id p3-20020a1709060dc300b0087f0d1766dbmr10309755eji.52.1675091483283;
        Mon, 30 Jan 2023 07:11:23 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id hz17-20020a1709072cf100b0087879f8c65asm6612723ejc.89.2023.01.30.07.11.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 07:11:22 -0800 (PST)
Message-ID: <ebb4a159-45d7-4d0f-b6cc-4d8ea9e8dbed@redhat.com>
Date:   Mon, 30 Jan 2023 16:11:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 4/5] platform/x86: dell-ddv: Add "force" module param
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
To:     Armin Wolf <W_Armin@gmx.de>, markgross@kernel.org
Cc:     jdelvare@suse.com, linux@roeck-us.net,
        platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230126194021.381092-1-W_Armin@gmx.de>
 <20230126194021.381092-5-W_Armin@gmx.de>
 <f163ef7e-41ee-cfa4-67c5-4325d1381110@redhat.com>
In-Reply-To: <f163ef7e-41ee-cfa4-67c5-4325d1381110@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi again...

On 1/30/23 16:09, Hans de Goede wrote:
> Hi again,
> 
> On 1/26/23 20:40, Armin Wolf wrote:
>> Until now, the dell-wmi-ddv driver needs to be manually
>> patched and compiled to test compatibility with unknown
>> DDV WMI interface versions.
>> Add a module param to allow users to force loading even
>> when a unknown interface version was detected. Since this
>> might cause various unwanted side effects, the module param
>> is marked as unsafe.
>> Also update kernel-parameters.txt.
>>
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>>  Documentation/admin-guide/kernel-parameters.txt |  3 +++
>>  drivers/platform/x86/dell/dell-wmi-ddv.c        | 13 +++++++++++--
>>  2 files changed, 14 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>> index 6cfa6e3996cf..9bbff5113427 100644
>> --- a/Documentation/admin-guide/kernel-parameters.txt
>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>> @@ -1024,6 +1024,9 @@
>>  	dell_smm_hwmon.fan_max=
>>  			[HW] Maximum configurable fan speed.
>>
>> +	dell_wmi_ddv.force=
>> +			[HW] Do not check for supported WMI interface versions.
>> +
>>  	dfltcc=		[HW,S390]
>>  			Format: { on | off | def_only | inf_only | always }
>>  			on:       s390 zlib hardware support for compression on
> 
> In my previous email I forgot to add that I have dropped this bit. I appreciate
> the effort to document this parameter, but if we add documentation for all
> existing parameters to Documentation/admin-guide/kernel-parameters.txt then
> the file will become quite unyielding / unusable.
> 
> So in general we only add new parameters which we expect to be important for
> a large group of users or necessary to debug serious problems like machines
> not booting.
> 
> I realize that a bunch of parameters in there do not match this, like
> e.g. dell_smm_hwmon.fan_max, these are just from older times when
> there were just less parameters, so listing them all was still ok.
> 
> So I have merged this patch, but with the Documentation/admin-guide/kernel-parameters.txt
> bit dropped.

I forgot to add: and these days it is really easy to find all the supported parameters
for a module by just doing "modinfo <modulename>

Regards,

Hans

