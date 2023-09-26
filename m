Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12395E7D250
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Sep 2023 08:21:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233947AbjIZIVo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Sep 2023 04:21:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233941AbjIZIVh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Sep 2023 04:21:37 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02AA4FC
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 Sep 2023 01:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695716440;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BIeS3eaIVe+ZmTHjwZ9bXjpRypZumdV8aBJvz7wVFvQ=;
        b=BlaSPoSG1wHA8/b95u55cG+qT2Z/DfX5mki4FkebeQd/FCPte6SRrAGc05o65fk6DuGXYf
        c0ZAPK7UbTxWZLjBlrUU7Naa1z7vW6qjxGWnqu3PO2OAhrNxF7drK0cDUwKmnr1IsUB4zW
        T9I6zKSUBiBggw93rMLvg3rceV8hoco=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-261-IIeAzk44NCGjmfUwKPf6AQ-1; Tue, 26 Sep 2023 04:20:38 -0400
X-MC-Unique: IIeAzk44NCGjmfUwKPf6AQ-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2c136b9d66aso104292031fa.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 Sep 2023 01:20:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695716437; x=1696321237;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BIeS3eaIVe+ZmTHjwZ9bXjpRypZumdV8aBJvz7wVFvQ=;
        b=WTb5FtzeKyWupZ574KrzKTSHBd7QKIfLBxGYEXRcW6xqxssmG1voJeMYesTTSkOxnD
         XWn3Tmv81ErvJxqQTXRnvPm0KQoW8bNdMEnDed2mioJLW4qi5NqgTvRNVg++3Z3U/w0w
         idecXNFVbgKTH+kG5TVDlg/NZ1KVNv8zGkj+bUR74XCYGwHNAJS0A1exEZ7Ra8h/ldRa
         tCIffVnweTniY0bk1YUy8BWM50jJrsHu7Wl0Qpqe/qccebWedrrYt1mHBtugB0LQulob
         k6WceXDe9TP4D5pSb0R22jvenr7eWslMXfDT61IeEcOJOveAjS5xjuAYh+YQNMwFnKeJ
         AI7w==
X-Gm-Message-State: AOJu0Yy5X+m+HIaxM/cp2cNgfDFYYzJbFrQSmqMrgcYiZFS+AAFplPUs
        paaDIyeMKZfdWJrGb5BvZhjDb+dA9QYLZ0CHfhzmE4xFtCMfPBPE/R8s+L13ayRojoDfp9F5R5A
        YjpbEM7BAcEcWyfUu1+hjRUVcWQuDI3KEyw==
X-Received: by 2002:a05:6512:12c5:b0:4fb:8948:2b28 with SMTP id p5-20020a05651212c500b004fb89482b28mr8525823lfg.63.1695716437508;
        Tue, 26 Sep 2023 01:20:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHR6F9UNWfqAWLPQCc5fSknSGYZ+XSLGtn6uYJbIBwKSV741uGZ7IVZu68BMGYv27/RZmea+w==
X-Received: by 2002:a05:6512:12c5:b0:4fb:8948:2b28 with SMTP id p5-20020a05651212c500b004fb89482b28mr8525804lfg.63.1695716437100;
        Tue, 26 Sep 2023 01:20:37 -0700 (PDT)
Received: from [192.168.1.217] ([109.37.154.108])
        by smtp.gmail.com with ESMTPSA id c19-20020a056402121300b0052e9b50dafdsm6419779edw.33.2023.09.26.01.20.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Sep 2023 01:20:36 -0700 (PDT)
Message-ID: <f3c06c51-5dc2-4c99-c8f4-21de737df255@redhat.com>
Date:   Tue, 26 Sep 2023 10:20:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 2/3] platform/x86/amd/hsmp: add support for metrics tbl
To:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc:     Suma Hegde <suma.hegde@amd.com>,
        platform-driver-x86@vger.kernel.org,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
References: <20230919092057.2235437-1-suma.hegde@amd.com>
 <20230919092057.2235437-2-suma.hegde@amd.com>
 <38442217-9629-5fa8-8d36-4eebc6fda4f4@linux.intel.com>
 <39a60d46-a916-9921-4c6a-5c95bcdbb82e@redhat.com>
 <166b4e9d-71e7-a95d-e11a-895f2c5dd2f8@linux.intel.com>
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <166b4e9d-71e7-a95d-e11a-895f2c5dd2f8@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

HI,

On 9/22/23 10:56, Ilpo Järvinen wrote:
> On Thu, 21 Sep 2023, Hans de Goede wrote:
>> On 9/19/23 15:07, Ilpo Järvinen wrote:
>>> On Tue, 19 Sep 2023, Suma Hegde wrote:
>>>
>>>> AMD MI300 MCM provides GET_METRICS_TABLE message to retrieve
>>>> all the system management information from SMU.
>>>>
>>>> The metrics table is made available as hexadecimal sysfs binary file
>>>> under per socket sysfs directory created at
>>>> /sys/devices/platform/amd_hsmp/socket%d/metrics_bin
>>>>
>>>> Metrics table definitions will be documented as part of Public PPR.
>>>> The same is defined in the amd_hsmp.h header.
>>>>
>>>> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
>>>> Reviewed-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
>>>> ---
>>>> Changes since v1:
>>>> 1. Remove HSMP_DEVNODE_NAME and HSMP_CDEV_NAME macro definitions in
>>>> this patch
>>>> 2. Remove extra space in comments for HSMP_GET_METRIC_TABLE_VER,
>>>>    HSMP_GET_METRIC_TABLE and HSMP_GET_METRIC_TABLE_DRAM_ADDR enum
>>>>    definition in amd_hsmp.h files
>>>> 3. Change check, count == 0 to !count in hsmp_metric_tbl_read() function
>>>> 4. Add hsmp_metric_table_visible() function 
>>>> 5. hsmp_create_metric_tbl_sysfs_file() is renamed as hsmp_init_metric_tbl_bin_attr()
>>>>    and code is also modified slightly
>>>> 6. Modify hsmp_create_sysfs_file() to use devm_device_add_groups()
>>>> 7. Change from cleanup label to deregister label
>>>> 8. Add dev_err print in hsmp_get_tbl_dram_base()
>>>> 9. Reword "Unable to Failed" in hsmp_get_tbl_dram_base()
>>>> 10. Add HSMP_GRP_NAME_SIZE and NUM_ATTRS macros
>>>> 11. Remove sysfs cleanup code in hsmp_pltdrv_remove()
>>>> 12. Correct ATRR typo error
>>>> 13. Change sprintf to snprintf
>>>> 14. Check metrics table support only against HSMP_PROTO_VER6
>>>> Changes since v2:
>>>> 1. squash documentation patch into this patch
>>>> 2. change from num_sockets to plat_dev.num_sockets
>>>>
>>>>  Documentation/arch/x86/amd_hsmp.rst  |  16 +++
>>>>  arch/x86/include/uapi/asm/amd_hsmp.h | 109 ++++++++++++++++
>>>>  drivers/platform/x86/amd/hsmp.c      | 180 ++++++++++++++++++++++++++-
>>>>  3 files changed, 302 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
>>>> index 440e4b645a1c..a4c308784818 100644
>>>> --- a/Documentation/arch/x86/amd_hsmp.rst
>>>> +++ b/Documentation/arch/x86/amd_hsmp.rst
>>>> @@ -41,6 +41,22 @@ In-kernel integration:
>>>>   * Locking across callers is taken care by the driver.
>>>>  
>>>>  
>>>> +HSMP sysfs interface
>>>> +====================
>>>> +
>>>> +1. Metrics table binary sysfs
>>>> +
>>>> +AMD MI300A MCM provides GET_METRICS_TABLE message to retrieve
>>>> +all the system management information from SMU.
>>>> +
>>>> +The metrics table is made available as hexadecimal sysfs binary file
>>>> +under per socket sysfs directory created at
>>>> +/sys/devices/platform/amd_hsmp/socket%d/metrics_bin
>>>> +
>>>> +Metrics table definitions will be documented as part of Public PPR.
>>>> +The same is defined in the amd_hsmp.h header.
>>>> +
>>>> +
>>>>  An example
>>>>  ==========
>>>>  
>>>
>>> I'd have expected to have the sysfs documentation appear under 
>>> Documentation/ABI/testing/sysfs-...
>>
>> Actually it is somewhat normal for sysfs files to be paired
>> together with other documentation when there is more extensive
>> documentation then just the sysfs files, see e.g. :
>>
>> Documentation/admin-guide/laptops/thinkpad-acpi.rst
> 
> Okay but that seems to result in attempting to handle deprecation 
> within that file too which feels wrong beyond just hacing documentation in 
> an unusual location.
> 
>> So there is precedent for this and I think it make sense
>> to keep all the documentation in one place, rather then to add
>> a Documentation/ABI/testing/sysfs-platform-amd-hsmp file
>> just for the sysfs attributes .
>>
>> OTOH people are used to look for sysfs attribute documentation
>> in a place like Documentation/ABI/testing/sysfs-platform-amd-hsmp,
>> but I think that keeping all the docs together is more important.
>>
>> So I have a slight preference for keeping this as is and
>> just merging v3 of this series as is.
>>
>> Ilpo, what do you think ?
> 
> I don't have strong preference myself if you think the current location 
> is fine. So feel free to merge it as is.

I'm traveling this week.

Ilpo, if you're fine with this series as is, can you merge it please ?

Regards,

Hans

