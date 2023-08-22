Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4641DEE4993
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Aug 2023 15:52:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234360AbjHVPwq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Aug 2023 11:52:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233844AbjHVPwq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Aug 2023 11:52:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F51811F
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Aug 2023 08:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692719513;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=twD8kmUltLGUFum/hOlOgrbgBYtjIbC1SiHGkInZo34=;
        b=RVpc4VW94DeT5gRuSKF8MfrFy7erpiJ5U5ciT30FYtFDxPPPrQv6SwkVHJ68pb/4LTVYzA
        3DULuDKa+cfD2ZJ8YCjaukD/8zwGT+TgtAtDQpBjpmuwj/PhV69ZASXQs9ZMYotQaS0Eym
        jm9sCVfQqrpFwWtO6FhZ7sHADNhtuew=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-325-YPQHQqVbN8iedrEgGE-ijQ-1; Tue, 22 Aug 2023 11:51:49 -0400
X-MC-Unique: YPQHQqVbN8iedrEgGE-ijQ-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2bb8ab25c51so49165851fa.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Aug 2023 08:51:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692719505; x=1693324305;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=twD8kmUltLGUFum/hOlOgrbgBYtjIbC1SiHGkInZo34=;
        b=Y9vxvadrfHJWKZhsOdMCj1fXVUWRgLaHJZuqBCyNqtoZBXTR1jYcqkkbQBJGgW7S5G
         ZPOcEWX//BK4Pq5o1QRjYbKD1EYhOjkqaise/7tkKzvCnEyzMeMYWU0z93vYpdEDPHgH
         7Mn+/o5CidbzLjg6A1+VgMSDSWWP4E6ndOsO4APhBHvEBFrPjWfTFkTbxK8uvAD6kojC
         lfH0Xm0wP+2l2jLPQIyVm1II/Gu4l/Wjycig6TzZT0t9bKwZ7eiT7o/eUeA9hWaw+ABp
         sVW8zS2aUpY4F36uIRuG3TpzTmGna7EFKx1ecxlZRDyB8Esq9SVXQ+XuYaBL4hieee2S
         jMrA==
X-Gm-Message-State: AOJu0Yz2uvdcaF0G2LWiYKRSQbDRKTrCU8gcFRV22bGq6VFhGcehYv8N
        02X0IRQkT8WwsgHQNqf111Go20gSr4ym9Uodqadh6fJNRSd+80+pC+1A5pBBhto/5VRFaXGwhkt
        VhV+G7kk/edGypSozkwwp8clsIi9rVQzaqQ/hwM8TXA==
X-Received: by 2002:a2e:8957:0:b0:2b6:e2c1:6cdb with SMTP id b23-20020a2e8957000000b002b6e2c16cdbmr8182296ljk.51.1692719505277;
        Tue, 22 Aug 2023 08:51:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFM5wpE/b8CUkAfNDRNzM7Q9CGiRH1YuK5Y/77W2W0un1n+mRN0rhgJdyGo9PDS1FtF8FvPQw==
X-Received: by 2002:a2e:8957:0:b0:2b6:e2c1:6cdb with SMTP id b23-20020a2e8957000000b002b6e2c16cdbmr8182279ljk.51.1692719504920;
        Tue, 22 Aug 2023 08:51:44 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id b16-20020a170906151000b0099df2ddfc37sm8353654ejd.165.2023.08.22.08.51.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Aug 2023 08:51:44 -0700 (PDT)
Message-ID: <95c7a3be-5710-acbc-59d2-f5d4fc07c8d2@redhat.com>
Date:   Tue, 22 Aug 2023 17:51:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH platform-next v4 16/16] Documentation/ABI: Add new
 attribute for mlxreg-io sysfs interfaces
Content-Language: en-US
To:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Vadim Pasternak <vadimp@nvidia.com>
Cc:     platform-driver-x86@vger.kernel.org
References: <20230822113451.13785-1-vadimp@nvidia.com>
 <20230822113451.13785-17-vadimp@nvidia.com>
 <7e70744f-70dc-43d6-54d0-fcc6c23d912a@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <7e70744f-70dc-43d6-54d0-fcc6c23d912a@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/22/23 13:43, Ilpo Järvinen wrote:
> On Tue, 22 Aug 2023, Vadim Pasternak wrote:
> 
>> Add documentation for the new attributes:
>> - CPLD versioning: "cpld5_pn", "cpld5_version", "cpld5_version_min".
>> - JTAG capability: "jtag_cap", indicating the available method of
>>   CPLD/FPGA devices field update.
>> - System lid status: "lid_open".
>> - Reset caused by long press of power button: "reset_long_pwr_pb".
>> - Reset caused by switch board DC-DC converter device failure:
>>   "reset_swb_dc_dc_pwr_fail".
>>
>> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
>> Reviewed-by: Michael Shych <michaelsh@nvidia.com>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> v3->v4:
>>  Comments provided by Ilpo:
>>  - Modify desription for "reset_swb_dc_dc_pwr_fail".

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


>> v2->v3:
>>  Comments provided by Hans:
>>  - Document new attribute "reset_swb_dc_dc_pwr_fail".
>> ---
>>  .../ABI/stable/sysfs-driver-mlxreg-io         | 52 +++++++++++++++++++
>>  1 file changed, 52 insertions(+)
>>
>> diff --git a/Documentation/ABI/stable/sysfs-driver-mlxreg-io b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
>> index 60953903d007..115302236627 100644
>> --- a/Documentation/ABI/stable/sysfs-driver-mlxreg-io
>> +++ b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
>> @@ -662,3 +662,55 @@ Description:	This file shows the system reset cause due to AC power failure.
>>  		Value 1 in file means this is reset cause, 0 - otherwise.
>>  
>>  		The file is read only.
>> +
>> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld5_pn
>> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld5_version
>> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld5_version_min
>> +Date:		August 2023
>> +KernelVersion:	6.6
>> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
>> +Description:	These files show with which CPLD part numbers, version and minor
>> +		versions have been burned the 5-th CPLD device equipped on a
>> +		system.
>> +
>> +		The files are read only.
>> +
>> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/jtag_cap
>> +Date:		August 2023
>> +KernelVersion:	6.6
>> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
>> +Description:    This file indicates the available method of CPLD/FPGA devices
>> +		field update through the JTAG chain:
>> +		 b00 - field update through LPC bus register memory space.
>> +		 b01 - Reserved.
>> +		 b10 - Reserved.
>> +		 b11 - field update through CPU GPIOs bit-banging.
>> +
>> +		The file is read only.
>> +
>> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lid_open
>> +Date:		August 2023
>> +KernelVersion:	6.6
>> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
>> +Description:	1 - indicates that system lid is opened, otherwise 0.
>> +
>> +		The file is read only.
>> +
>> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_long_pwr_pb
>> +Date:		August 2023
>> +KernelVersion:	6.6
>> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
>> +Description:	This file if set 1 indicates that system has been reset by
>> +		long press of power button.
>> +
>> +		The file is read only.
>> +
>> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_swb_dc_dc_pwr_fail
>> +Date:		August 2023
>> +KernelVersion:	6.6
>> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
>> +Description:	This file shows 1 in case the system reset happened due to the
>> +		failure of any DC-DC power converter devices equipped on the
>> +		switch board.
>> +
>> +		The file is read only.
> 
> Thanks a lot, much clearer wording now.
> 
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> 

