Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DD1BE7D0A2
	for <platform-driver-x86@archiver.kernel.org>; Thu, 21 Sep 2023 20:19:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229764AbjIUUTX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 21 Sep 2023 16:19:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231173AbjIUUS5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 21 Sep 2023 16:18:57 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B8965A000
        for <platform-driver-x86@vger.kernel.org>; Thu, 21 Sep 2023 10:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695317280;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yfd94IItATugf89ezij5PQU82wnObR4wy1T+gcsS64M=;
        b=V3ueQHNu10pdSZNvfFA9fV4d49lMd4U81ERHaj0X8YMF1cDP1caO5W9fYF+HljxSKPwfv5
        iWS92fFrixsUUCeAPYzb6Gm0o8tQFFSB4eKspMjzBNq0W70/fIY0Lk9B4iqWB0IgW4pqZ8
        NTBOeb8AJssDOWQ8bvnmNbGA5hPl8DA=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-146-0CV4jucgMRaBLxtU0iGJaQ-1; Thu, 21 Sep 2023 11:14:23 -0400
X-MC-Unique: 0CV4jucgMRaBLxtU0iGJaQ-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2c131ddfcfaso7858911fa.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 21 Sep 2023 08:14:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695309261; x=1695914061;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yfd94IItATugf89ezij5PQU82wnObR4wy1T+gcsS64M=;
        b=dnTN/PSLSkHZ1P1yPwxOriQLyKIpu6Abthv7oamuZWnrUmrVlCF5IgDGZCl1rPugqx
         IzBjnqxycJ8pmto9hgC1QYSuNNxTzQFGMvuv/B1mXOt+wUFyqKaz/N60g5N6nKpBUocZ
         viRIVHjGESLN2PO2+Cb05WpOsEFNTVKkOw2tIxofuBfMNAsXmJIngLtaksh2ZSpg1ZwI
         Fkbww11JIgoGeGMxlaRQh/e7zPNwZbq124O/xvWm9tv9HPmg1A4iIuhJtuMcoJ9N8NtQ
         L9H/ca9Ryt0xdteMTJr1cWxhUiPtaWcIicLY8bnS9imq88NhlrL82VIHeUk7P/P0AWk8
         PHtQ==
X-Gm-Message-State: AOJu0Yy9V+yxGjY8WUYQhQJbrUi6nP8vzVqZOhEFpPpknTybnKnhHMRN
        pI74Iuk4RIyFwc+ekoi4RsfToTanyQ2M7O8nCz5Js2N4IdoWUVPrbKo3wEz3WFPzvMtKNZJo3kL
        ZeKa1xSELpx3qvJL16VckFdmRMwoaQKoSBwbmIjCxww==
X-Received: by 2002:a2e:7807:0:b0:2bc:e470:1412 with SMTP id t7-20020a2e7807000000b002bce4701412mr5342914ljc.43.1695309261745;
        Thu, 21 Sep 2023 08:14:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzIEXcH+PC2EsSd/2ZGPeFWzJl6zIK25EvLw3Z9JHgwhKFV/9WG8RiaYMTmSc+0RZ1l+/eHA==
X-Received: by 2002:a2e:7807:0:b0:2bc:e470:1412 with SMTP id t7-20020a2e7807000000b002bce4701412mr5342898ljc.43.1695309261395;
        Thu, 21 Sep 2023 08:14:21 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id oq19-20020a170906cc9300b0098f99048053sm1193873ejb.148.2023.09.21.08.14.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Sep 2023 08:14:20 -0700 (PDT)
Message-ID: <39a60d46-a916-9921-4c6a-5c95bcdbb82e@redhat.com>
Date:   Thu, 21 Sep 2023 17:14:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 2/3] platform/x86/amd/hsmp: add support for metrics tbl
Content-Language: en-US, nl
To:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Suma Hegde <suma.hegde@amd.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
References: <20230919092057.2235437-1-suma.hegde@amd.com>
 <20230919092057.2235437-2-suma.hegde@amd.com>
 <38442217-9629-5fa8-8d36-4eebc6fda4f4@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <38442217-9629-5fa8-8d36-4eebc6fda4f4@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Ilpo, Suma,

On 9/19/23 15:07, Ilpo Järvinen wrote:
> On Tue, 19 Sep 2023, Suma Hegde wrote:
> 
>> AMD MI300 MCM provides GET_METRICS_TABLE message to retrieve
>> all the system management information from SMU.
>>
>> The metrics table is made available as hexadecimal sysfs binary file
>> under per socket sysfs directory created at
>> /sys/devices/platform/amd_hsmp/socket%d/metrics_bin
>>
>> Metrics table definitions will be documented as part of Public PPR.
>> The same is defined in the amd_hsmp.h header.
>>
>> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
>> Reviewed-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
>> ---
>> Changes since v1:
>> 1. Remove HSMP_DEVNODE_NAME and HSMP_CDEV_NAME macro definitions in
>> this patch
>> 2. Remove extra space in comments for HSMP_GET_METRIC_TABLE_VER,
>>    HSMP_GET_METRIC_TABLE and HSMP_GET_METRIC_TABLE_DRAM_ADDR enum
>>    definition in amd_hsmp.h files
>> 3. Change check, count == 0 to !count in hsmp_metric_tbl_read() function
>> 4. Add hsmp_metric_table_visible() function 
>> 5. hsmp_create_metric_tbl_sysfs_file() is renamed as hsmp_init_metric_tbl_bin_attr()
>>    and code is also modified slightly
>> 6. Modify hsmp_create_sysfs_file() to use devm_device_add_groups()
>> 7. Change from cleanup label to deregister label
>> 8. Add dev_err print in hsmp_get_tbl_dram_base()
>> 9. Reword "Unable to Failed" in hsmp_get_tbl_dram_base()
>> 10. Add HSMP_GRP_NAME_SIZE and NUM_ATTRS macros
>> 11. Remove sysfs cleanup code in hsmp_pltdrv_remove()
>> 12. Correct ATRR typo error
>> 13. Change sprintf to snprintf
>> 14. Check metrics table support only against HSMP_PROTO_VER6
>> Changes since v2:
>> 1. squash documentation patch into this patch
>> 2. change from num_sockets to plat_dev.num_sockets
>>
>>  Documentation/arch/x86/amd_hsmp.rst  |  16 +++
>>  arch/x86/include/uapi/asm/amd_hsmp.h | 109 ++++++++++++++++
>>  drivers/platform/x86/amd/hsmp.c      | 180 ++++++++++++++++++++++++++-
>>  3 files changed, 302 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
>> index 440e4b645a1c..a4c308784818 100644
>> --- a/Documentation/arch/x86/amd_hsmp.rst
>> +++ b/Documentation/arch/x86/amd_hsmp.rst
>> @@ -41,6 +41,22 @@ In-kernel integration:
>>   * Locking across callers is taken care by the driver.
>>  
>>  
>> +HSMP sysfs interface
>> +====================
>> +
>> +1. Metrics table binary sysfs
>> +
>> +AMD MI300A MCM provides GET_METRICS_TABLE message to retrieve
>> +all the system management information from SMU.
>> +
>> +The metrics table is made available as hexadecimal sysfs binary file
>> +under per socket sysfs directory created at
>> +/sys/devices/platform/amd_hsmp/socket%d/metrics_bin
>> +
>> +Metrics table definitions will be documented as part of Public PPR.
>> +The same is defined in the amd_hsmp.h header.
>> +
>> +
>>  An example
>>  ==========
>>  
> 
> I'd have expected to have the sysfs documentation appear under 
> Documentation/ABI/testing/sysfs-...

Actually it is somewhat normal for sysfs files to be paired
together with other documentation when there is more extensive
documentation then just the sysfs files, see e.g. :

Documentation/admin-guide/laptops/thinkpad-acpi.rst

So there is precedent for this and I think it make sense
to keep all the documentation in one place, rather then to add
a Documentation/ABI/testing/sysfs-platform-amd-hsmp file
just for the sysfs attributes .

OTOH people are used to look for sysfs attribute documentation
in a place like Documentation/ABI/testing/sysfs-platform-amd-hsmp,
but I think that keeping all the docs together is more important.

So I have a slight preference for keeping this as is and
just merging v3 of this series as is.

Ilpo, what do you think ?


Regards,

Hans



