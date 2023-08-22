Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B725EE4996
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Aug 2023 16:28:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236668AbjHVQ2i (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Aug 2023 12:28:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233468AbjHVQ2i (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Aug 2023 12:28:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A86310C2
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Aug 2023 09:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692721653;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CxEaWTGf8O6ki14XHTsxWkSEsoP143LuZSrg7rT+OgQ=;
        b=gQO/NvldrLqT+jNn9YBUXPySCHwLoR0m8bu9dmX0TeuXrZr1MhCQiuZU/m9Q99xLuBcgxn
        Sk518YJ+7x5RO9pApnSM9J3BJXJCx3szooHqw2hCOX/w4OatgNkGYkBu2S24FCvOu3xBFH
        Uqow/FYSaBqDUeEsCAMlI1z22ok5Va8=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-448-wGZ-_H_sN5eoTwV7s77dlg-1; Tue, 22 Aug 2023 12:27:32 -0400
X-MC-Unique: wGZ-_H_sN5eoTwV7s77dlg-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-50081b0dba6so2603104e87.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Aug 2023 09:27:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692721650; x=1693326450;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CxEaWTGf8O6ki14XHTsxWkSEsoP143LuZSrg7rT+OgQ=;
        b=AB+h46Rbg8Tru0UcKVIYifHaUPqMgNeGS2/knnZ1ZzftIbftbU3cTCV8WxxfHgEIAD
         za+qcIDPpG5trseuySPvG281ck4rZxV7weVSk/wJ2UjHLjr9Cd3AuiFe2Wl1dTHWnpJx
         twd2kaYw0P/t8zDQdDlFftl0nmj1H/nBNr/KYhxCReKjfASIWOJ85j5+xC4jL0XEAo9y
         STHpS/ZYsuAmS7X/x1WFEcaBtAnp8NAsv9CTO/oCGqxLx/rFwibn9pAi8qZQ+MPm0Cet
         qUSk3U8FFTLOlKEK3YMLAO1IGPUbFn6GzRnzcM0Wn/2AyMEtzTrEdXeOA76cXCKQTtsY
         q/pA==
X-Gm-Message-State: AOJu0YzrFiKXBhn6zFGoBQCwyIBSKUZD+AboR6t8Spsjtb5Y0LhzgsUD
        rnfKTr1eBjMefH13ilk1CeAQTipFO3MOkcgInd9uE3F6O9PGqafC+JaAUBd+89ZkT2U/vstx1hX
        remWhSQERsH0DspGZxkKleJ+uVzA9l1afCm9VmnArDQ==
X-Received: by 2002:a05:6512:3b98:b0:500:807a:f1b2 with SMTP id g24-20020a0565123b9800b00500807af1b2mr6579865lfv.28.1692721650253;
        Tue, 22 Aug 2023 09:27:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAg3donbN65DfggwekoJY7ZNpUCKw6JJMaNjyY0ZvU6BG72+5HjghsZd6AVqoMJEdDuF268A==
X-Received: by 2002:a05:6512:3b98:b0:500:807a:f1b2 with SMTP id g24-20020a0565123b9800b00500807af1b2mr6579848lfv.28.1692721649779;
        Tue, 22 Aug 2023 09:27:29 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id p5-20020a17090635c500b00988be3c1d87sm8339840ejb.116.2023.08.22.09.27.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Aug 2023 09:27:29 -0700 (PDT)
Message-ID: <653e30a8-6170-d6c0-ebec-dba329c93f92@redhat.com>
Date:   Tue, 22 Aug 2023 18:27:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH platform-next v4 16/16] Documentation/ABI: Add new
 attribute for mlxreg-io sysfs interfaces
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Vadim Pasternak <vadimp@nvidia.com>
Cc:     platform-driver-x86@vger.kernel.org
References: <20230822113451.13785-1-vadimp@nvidia.com>
 <20230822113451.13785-17-vadimp@nvidia.com>
 <7e70744f-70dc-43d6-54d0-fcc6c23d912a@linux.intel.com>
 <95c7a3be-5710-acbc-59d2-f5d4fc07c8d2@redhat.com>
Content-Language: en-US
In-Reply-To: <95c7a3be-5710-acbc-59d2-f5d4fc07c8d2@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/22/23 17:51, Hans de Goede wrote:
> Hi,
> 
> On 8/22/23 13:43, Ilpo Järvinen wrote:
>> On Tue, 22 Aug 2023, Vadim Pasternak wrote:
>>
>>> Add documentation for the new attributes:
>>> - CPLD versioning: "cpld5_pn", "cpld5_version", "cpld5_version_min".
>>> - JTAG capability: "jtag_cap", indicating the available method of
>>>   CPLD/FPGA devices field update.
>>> - System lid status: "lid_open".
>>> - Reset caused by long press of power button: "reset_long_pwr_pb".
>>> - Reset caused by switch board DC-DC converter device failure:
>>>   "reset_swb_dc_dc_pwr_fail".
>>>
>>> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
>>> Reviewed-by: Michael Shych <michaelsh@nvidia.com>
>>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>>> ---
>>> v3->v4:
>>>  Comments provided by Ilpo:
>>>  - Modify desription for "reset_swb_dc_dc_pwr_fail".
> 
> Thank you for your patch-series, I've applied the series to my
> review-hans branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
> 
> Note it will show up in my review-hans branch once I've pushed my
> local branch there, which might take a while.
> 
> Once I've run some tests on this branch the patches there will be
> added to the platform-drivers-x86/for-next branch and eventually
> will be included in the pdx86 pull-request to Linus for the next
> merge-window.

Quick follow up I've squashed in a few whitespace changes
into this (16/16) patch to fix a new "make htmldocs" warning:

/home/hans/projects/platform-drivers-x86/Documentation/ABI/stable/sysfs-driver-mlxreg-io:679:  ERROR: Unexpected indentation.

Regards,

Hans



> 
> Regards,
> 
> Hans
> 
> 
>>> v2->v3:
>>>  Comments provided by Hans:
>>>  - Document new attribute "reset_swb_dc_dc_pwr_fail".
>>> ---
>>>  .../ABI/stable/sysfs-driver-mlxreg-io         | 52 +++++++++++++++++++
>>>  1 file changed, 52 insertions(+)
>>>
>>> diff --git a/Documentation/ABI/stable/sysfs-driver-mlxreg-io b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
>>> index 60953903d007..115302236627 100644
>>> --- a/Documentation/ABI/stable/sysfs-driver-mlxreg-io
>>> +++ b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
>>> @@ -662,3 +662,55 @@ Description:	This file shows the system reset cause due to AC power failure.
>>>  		Value 1 in file means this is reset cause, 0 - otherwise.
>>>  
>>>  		The file is read only.
>>> +
>>> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld5_pn
>>> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld5_version
>>> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld5_version_min
>>> +Date:		August 2023
>>> +KernelVersion:	6.6
>>> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
>>> +Description:	These files show with which CPLD part numbers, version and minor
>>> +		versions have been burned the 5-th CPLD device equipped on a
>>> +		system.
>>> +
>>> +		The files are read only.
>>> +
>>> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/jtag_cap
>>> +Date:		August 2023
>>> +KernelVersion:	6.6
>>> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
>>> +Description:    This file indicates the available method of CPLD/FPGA devices
>>> +		field update through the JTAG chain:
>>> +		 b00 - field update through LPC bus register memory space.
>>> +		 b01 - Reserved.
>>> +		 b10 - Reserved.
>>> +		 b11 - field update through CPU GPIOs bit-banging.
>>> +
>>> +		The file is read only.
>>> +
>>> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lid_open
>>> +Date:		August 2023
>>> +KernelVersion:	6.6
>>> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
>>> +Description:	1 - indicates that system lid is opened, otherwise 0.
>>> +
>>> +		The file is read only.
>>> +
>>> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_long_pwr_pb
>>> +Date:		August 2023
>>> +KernelVersion:	6.6
>>> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
>>> +Description:	This file if set 1 indicates that system has been reset by
>>> +		long press of power button.
>>> +
>>> +		The file is read only.
>>> +
>>> +What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_swb_dc_dc_pwr_fail
>>> +Date:		August 2023
>>> +KernelVersion:	6.6
>>> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
>>> +Description:	This file shows 1 in case the system reset happened due to the
>>> +		failure of any DC-DC power converter devices equipped on the
>>> +		switch board.
>>> +
>>> +		The file is read only.
>>
>> Thanks a lot, much clearer wording now.
>>
>> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
>>

