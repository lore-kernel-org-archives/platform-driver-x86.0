Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B969AC433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Mar 2022 17:22:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347981AbiCPRXW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Mar 2022 13:23:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232691AbiCPRXV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Mar 2022 13:23:21 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2051.outbound.protection.outlook.com [40.107.92.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E0DC5AA64
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Mar 2022 10:22:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hyjkj4z9046nfL+IjKoy5EsimdPq6xec+HmoRG6dyi5m8+3JErfzRhWRuffzDKr0FCpmH1q7bSMwNTI+EmLKRgSFzh6Ua9ocfKi1x1cfz4DJ7hf6Cl991rxcntltzbMQaq5/3oYMpEHKXJ/K9CmDEHk/uOpUDqAjfM576VYwQRz5tK4w97DmtXsozZkJL6OgZggGOnqVpYqE9ibTXkdbGaKKBlxNys6s4R6zlB5mWObrHXefbZ4r95P3M1+wU3x7bxbotLYBVULmL7Ongllxpx9OpZe5/O1QIyzhc4zKg2BtC6w4LZwCZmoGceOMz1LI703t1vc64yZg4kDOy31jFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YG6dSoNXahipohVuHFp8d35MYzqVw+xJWTAqA+mxcTw=;
 b=ErRHeL22pM5eedwjmJQTvW4DBDvidXwmSTNMNd4YY7fhGvfQ4ehNt0i+NiwJaGm2x44pgJ6GheBFn/8Oiulj3h16TOCqATlM50svlKJTNcH8S61YMk3g4UA6KBcvmwyCBpD4nOE+tz1i0/Jbhi0bHfkTthpgVDzfy5diYJ1u2g5Kq3u4W15N3R9SeFnucZW6rOeTbystENyu6018v6AsjsVxjvQR1uue5PnAIq39TLE3eFEgEn3rqQ4ajng4JtRFuJYB8u00zcD05Cga6Tja2Yjis+NHQIRrJ4odms/sziSoMLxrNwid5/kxNUMhAfHJrAT3C9acs5t9HKZRciT4+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YG6dSoNXahipohVuHFp8d35MYzqVw+xJWTAqA+mxcTw=;
 b=j6sDC2O3KaHeRlRSxKK5RQhbtDADBnnxTcE6QyvnOY5risgCAN/DZROyqhAW+Gdq+X8yqebgQCZEPoR5JUNNXJ+nFN9HdHCtyPRM8eAQEk+fkKXxMQxpDG6pKAKpZpUVSRlOQogsDYKMr4k1VsYKtv9bFEB51XLLVfMtLCeYEk7q6vmFlnBRZ7ul68HUmh8XSnHVmbGG6TTNxQaxk5yIFk7yOApJtH2MtwS9lCtKwHW0XcnR4TIcvCfFBA4a/Vzxa62oCVgALtC1Ps173lRCaoXU8lyOInb2FXVbyUZnqScrLmd9ogB/1G5oXXSPco1lDOw9VFEyaUfm3ODAAqXqbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2763.namprd12.prod.outlook.com (2603:10b6:5:48::16) by
 DM6PR12MB3580.namprd12.prod.outlook.com (2603:10b6:5:11e::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.24; Wed, 16 Mar 2022 17:22:03 +0000
Received: from DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::99a5:ac34:8767:b7f4]) by DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::99a5:ac34:8767:b7f4%6]) with mapi id 15.20.5061.026; Wed, 16 Mar 2022
 17:22:03 +0000
Subject: Re: [PATCH] nvidia-wmi-ec-backlight: Add workarounds for confused
 firmware
To:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Cc:     Alexandru Dinu <alex.dinu07@gmail.com>
References: <20220316012516.2233984-1-ddadap@nvidia.com>
 <27f17384-a59a-8649-ea71-392917d2d8f6@redhat.com>
From:   Daniel Dadap <ddadap@nvidia.com>
Message-ID: <452e400d-38ec-35ca-61b4-e2c18de2b672@nvidia.com>
Date:   Wed, 16 Mar 2022 12:22:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <27f17384-a59a-8649-ea71-392917d2d8f6@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: DM5PR10CA0022.namprd10.prod.outlook.com (2603:10b6:4:2::32)
 To DM6PR12MB2763.namprd12.prod.outlook.com (2603:10b6:5:48::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea51c55e-35cb-42da-9bbb-08da07717cbc
X-MS-TrafficTypeDiagnostic: DM6PR12MB3580:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB35808A390A4B1A0EDC03D926BC119@DM6PR12MB3580.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eVxBx4Z5HI2D9KrMHd47VYLOx0lkB0tAay45Dr8nwPXdti97C1yEA0blMlg75DllqDk3mEMyM1Yates3XEzLQKi7T+ID6vhhd/EaDg6UaDajTYjMneH8j30sy2paORNfHoihvYfdl2pHMP3pkQfPqJxvGvs1jBYxYFWXqxrieDZtM7o3WCaQl3wvQat+/s8whd82CMYtehkmW/dbhWYmUAOJ1WA6ygJVtiUcdzezzbb0OVcD/KzhtIriCPc11Cqb9aOwpV3tWA494URXn4tTM4Dxo4S5MrA1joLgCKJw30qgws59K2iweQmkyZuPOpAV5Xt7RuKfW+UH/Ke6r3rlgZPGghW+2iHjbTEKuWfTpI0jXvE2GlE9WMO1yGLcROzmYUh7ImTbSpzAYCgfYgPTNshIqk5UT3i7wWpQ6YLb8ArRn6gtEYl3FeBD2XZdFIf0OunmxG4GzG0cnzjkKKzYw0S1JCH0mFJLTMP4CI1ghkKTKb5U0OaLPzCHiR8MOVCo4zV4q4SmNuMzjB5+W5rjAnAKCT8FTt5Z86pkSuqovyf1mow+DjFj5kLL+SL2qF4VISOLQQLT31PA7rbHtQgmRv8Dw6G6NSNre/gocJN5XGzQfP5GyWXufdr2Vhi8h3a6dqcchXqd1OINF5GfKVtjm+hjiD1bc+XNSmyTsD0d7d+KGmCTUe3oAgEczLI7tXiQvhilP2kZo65PCjO9XaREFfwC2QVlmEMPij1mjWikUIQLLCUFbcYq14BsHYwyDrtFgJDCosg0S8EewiWbGiuduXN1bSHLLmqQGTyVJvUnEQY27/7keBvcl6J8x1kT15WL
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2763.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(316002)(36756003)(66946007)(508600001)(966005)(6486002)(30864003)(66476007)(5660300002)(8936002)(38100700002)(4326008)(8676002)(31696002)(66556008)(86362001)(31686004)(6512007)(2616005)(6506007)(53546011)(83380400001)(186003)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eU5ra1lxKzczZjBwVXptUmJUL0NEeHdWVE5IeTUvREhVNGt1UkIzNVhrblRF?=
 =?utf-8?B?WXltY2hhRDlZU2pFVFgxaDE5TytkTUpZRFRvcUVxeFNDSXcrRTJ5NDNqTyt4?=
 =?utf-8?B?M3NaNVA2RnEwZU16dkhKanZ1bDhhSjhwa2VlMzl2SXB3RXNyRmhQQ1VDQnJp?=
 =?utf-8?B?K3Q5RjhQcGJ1ellkOGxkdjFaMGIvTExYcElaTDIrdlRFWVlxOEZINTE4aGFC?=
 =?utf-8?B?aEZoMG50bFd3MlUvT1ZYdDRGWGRVMUlRSWNFM3BZandVK2l0TWVhNGtlRUNP?=
 =?utf-8?B?dGtmWFRpSDhTMmNpRmk1NjV2aDM1dkkyYVJBOE9ydElteWVJZkVWbTZQRVQ2?=
 =?utf-8?B?ODlZeER0aEVIczlBK3JaTFlPS2tOSTdPQnJrbk84cElIRXhhakVBWGdBRHdU?=
 =?utf-8?B?YmRFcTRENnlOVFN0eERnRUZOYnU0ZyttT2Fab3dxbGhJanRScXVlK08yeVZY?=
 =?utf-8?B?TEVBUGZORHFONWRwTjAxYVJCcUNGRk04YjVRc0dNTWpNMWNqTnhxNVRHY1hL?=
 =?utf-8?B?NWRnc0RzOVJzWW1rbk51NzlXclJYVE1aNjAvRERDN0J5UngxeVJxQTBvZXBs?=
 =?utf-8?B?MjdIdHkrSWtKcW5aUGlXczUxRjQvbjlzMnErK0hCQTBDYkJOSXhta3A5aWJ3?=
 =?utf-8?B?YlpqakI3OFkrbkR2V2NHMTV0MjJFaEV0dDJpSzl0NERMK1RXdWtPdFprTHRN?=
 =?utf-8?B?VDBIUk1OaDloQ3JFQ3M1dTkzdkRYNHdXNStZc2g2ZnozRFd0eklkTEFrY2J2?=
 =?utf-8?B?T2xQcDNkcU0yVDFDVEdFdTJ1NXZnQTlMNEFNOFhRNHlZRmwxam1Pa0VFM2dG?=
 =?utf-8?B?cWkzWVRVQjhuaHFMWnR0NHF2NWpNZS9rczFGZmdta2Z3TWJKcjdsQi9oMzl2?=
 =?utf-8?B?MnYyNml1Y2Ztc3VPWTk5djdvRUZGeTc2YmJEOFg5U3ljUWt0RTRnTHpmM2ll?=
 =?utf-8?B?bW4vWlBJRzNGM3huRXF3S2tLRmMyQldFOU0wbWVmKzRTNFlocEt1ZVNVbjhw?=
 =?utf-8?B?THVXVG10eDBzL0VqRUFEQ29vTDVtU3hoL29vR0txYWlVK1ZvMVY3cS8xVDNR?=
 =?utf-8?B?ZE1sVkNxYUhUNVZDMXJoZmZ4RVV1OEdXMkJsa2VRdFBLSWlhTERHK1duNDZx?=
 =?utf-8?B?STEweU9qdVJRQ2l5RGZmSllIWDY0bFQxNjd6b0ZUYVdYaWtwVlNsZjA0bUM4?=
 =?utf-8?B?TFgvS0JLcGIvMXN0Qkd6UjdEUllvUlZiT3BPNm5hVWxFSTh6Y2FDdXluZHJM?=
 =?utf-8?B?cnhPUzZJNGZiS3lYRVYzS2ZwKzhRNnIwRFlIQXNWT1RPSkR5YXJ1WHh1MGFH?=
 =?utf-8?B?d0N3ekxWRHVtSE5FY284MkxrTUhkSWdIbWh4M2hKR2Z4bktVMXdGMFhDZlFV?=
 =?utf-8?B?OEYwUnpSYXp3RUw4VDhRTTlwdVRMa0xLQ2hSd3JZTG52a2hkYkpRaFdnbzdi?=
 =?utf-8?B?bHMrUzd1Q241UnZuNlJseXZUSG93V0duRUg3MVdlcUk3UHo5WTRMMDYxWVE0?=
 =?utf-8?B?aVNLRUFmVklRMmpRcHI5RGEwSzdSZ1B0bzdkZlRmVWF5Y3kyMkxIYmxXQ3M0?=
 =?utf-8?B?TmYwMUs5bDdQeDB0cGkrbzJrNGVRaUljdVE4ejdRbEd4ZVB2OFZOTUJhcnE4?=
 =?utf-8?B?QWRDUVVsaFBiTXhHeWx1R0wxdnc3ZHFsQngzQUNacXNVVElZYjkrcUM5U1V0?=
 =?utf-8?B?R2xUd1l5Smo4bG9YbHViOUZYL05CWEhsZXRrS0IzSW9HODJLVkdjeVo5MXRQ?=
 =?utf-8?B?eDFOcncrSHo4K3lobUtIM0Z5RUhQZVMxVUp2czZQSis4aXliZE40NmtYTnlM?=
 =?utf-8?B?cnlublROU3I0a29PZmdGNFViZVZSaVIvV1VKUTZneDJHZVFnVlZrM0lNRXQ2?=
 =?utf-8?B?NVdEeEtFd1lFVlBRMTIrSmpPSmMyZEJPQXBKOGtpTjlTVXArWEZCMWVMSkM2?=
 =?utf-8?Q?8Uj/Bf6qInkvdKIAaiwhfPWDYeUmEmPD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea51c55e-35cb-42da-9bbb-08da07717cbc
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2763.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2022 17:22:03.5218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UQk3QMqYq/LDd9MrGFHf/JaMsLCoK+W8JEHZ6vswxFnqqJQBjTuX9645vWZAUfVU9f6la2pVCnusneln3Q0SJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3580
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


On 3/16/22 11:09 AM, Hans de Goede wrote:
> Hi,
>
> On 3/16/22 02:25, Daniel Dadap wrote:
>> Some notebook systems with EC-driven backlight control appear to have a
>> firmware bug which causes the system to use GPU-driven backlight control
>> upon a fresh boot, but then switches to EC-driven backlight control
>> after completing a suspend/resume cycle. All the while, the firmware
>> reports that the backlight is under EC control, regardless of what is
>> actually controlling the backlight brightness.
>>
>> This leads to the following behavior:
>>
>> * nvidia-wmi-ec-backlight gets probed on a fresh boot, due to the
>>    WMI-wrapped ACPI method erroneously reporting EC control.
>> * nvidia-wmi-ec-backlight does not work until after a suspend/resume
>>    cycle, due to the backlight control actually being GPU-driven.
>> * GPU drivers also register their own backlight handlers: in the case
>>    of the notebook system where this behavior has been observed, both
>>    amdgpu and the NVIDIA proprietary driver register backlight handlers.
>> * The GPU which has backlight control upon a fresh boot (amdgpu in the
>>    case observed so far) can successfully control the backlight through
>>    its backlight driver's sysfs interface, but stops working after the
>>    first suspend/resume cycle.
>> * nvidia-wmi-ec-backlight is unable to control the backlight upon a
>>    fresh boot, but begins to work after the first suspend/resume cycle.
>> * The GPU which does not have backlight control (NVIDIA in this case)
>>    is not able to control the backlight at any point while the system
>>    is in operation. On similar hybrid systems with an EC-controlled
>>    backlight, and AMD/NVIDIA iGPU/dGPU, the NVIDIA proprietary driver
>>    does not register its backlight handler. It has not been determined
>>    whether the non-functional handler registered by the NVIDIA driver
>>    is due to another firmware bug, or a bug in the NVIDIA driver.
>>
>> Since nvidia-wmi-ec-backlight registers as a BACKLIGHT_FIRMWARE type
>> device, it takes precedence over the BACKLIGHT_RAW devices registered
>> by the GPU drivers. This in turn leads to backlight control appearing
>> to be non-functional until after completing a suspend/resume cycle.
>> However, it is still possible to control the backlight through direct
>> interaction with the working GPU driver's backlight sysfs interface.
>>
>> These systems also appear to have a second firmware bug which resets
>> the EC's brightness level to 100% on resume, but leaves the state in
>> the kernel at the pre-suspend level. This causes attempts to save
>> and restore the backlight level across the suspend/resume cycle to
>> fail, due to the level appearing not to change even though it did.
>>
>> In order to work around these issue, add quirk tables to detect
>> systems that are known to show these behaviors. So far, there is
>> only one known system that requires these workarounds, and both
>> issues are present on that system, but the quirks are tracked in
>> separate tables to make it easier to add them to other systems which
>> may exhibit one of the bugs, but not the other. The original systems
>> that this driver was tested on during development do not exhibit
>> either of these quirks.
>>
>> If a system with the "GPU driver has backlight control" quirk is
>> detected, nvidia-wmi-ec-backlight will grab a reference to the working
>> (when freshly booted) GPU backlight handler and relays any backlight
>> brightness level change requests directed at the EC to also be applied
>> to the GPU backlight interface. This leads to redundant updates
>> directed at the GPU backlight driver after a suspend/resume cycle, but
>> it does allow the EC backlight control to work when the system is
>> freshly booted.
>>
>> If a system with the "backlight level reset to full on resume" quirk
>> is detected, nvidia-wmi-ec-backlight will register a PM notifier to
>> reset the backlight to the previous level upon resume.
>>
>> These workarounds are also plumbed through to kernel module parameters,
>> to make it easier for users who suspect they may be affected by one or
>> both of these bugs to test whether these workarounds are effective on
>> their systems as well.
>>
>> Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
>> Tested-by: Alexandru Dinu <alex.dinu07@gmail.com>
>> ---
>>   .../platform/x86/nvidia-wmi-ec-backlight.c    | 181 +++++++++++++++++-
>>   1 file changed, 179 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/platform/x86/nvidia-wmi-ec-backlight.c b/drivers/platform/x86/nvidia-wmi-ec-backlight.c
>> index 61e37194df70..ccb3b506c12c 100644
>> --- a/drivers/platform/x86/nvidia-wmi-ec-backlight.c
>> +++ b/drivers/platform/x86/nvidia-wmi-ec-backlight.c
>> @@ -3,8 +3,11 @@
>>    * Copyright (c) 2020, NVIDIA CORPORATION.  All rights reserved.
>>    */
>>   
>> +#define pr_fmt(f) "%s: " f "\n", KBUILD_MODNAME
>> +
>>   #include <linux/acpi.h>
>>   #include <linux/backlight.h>
>> +#include <linux/dmi.h>
>>   #include <linux/mod_devicetable.h>
>>   #include <linux/module.h>
>>   #include <linux/types.h>
>> @@ -75,6 +78,69 @@ struct wmi_brightness_args {
>>   	u32 ignored[3];
>>   };
>>   
>> +/**
>> + * struct nvidia_wmi_ec_backlight_priv - driver private data
>> + * @bl_dev:       the associated backlight device
>> + * @proxy_target: backlight device which receives relayed brightness changes
>> + * @notifier:     notifier block for resume callback
>> + */
>> +struct nvidia_wmi_ec_backlight_priv {
>> +	struct backlight_device *bl_dev;
>> +	struct backlight_device *proxy_target;
>> +	struct notifier_block nb;
>> +};
>> +
>> +static char *backlight_proxy_target;
>> +module_param(backlight_proxy_target, charp, 0);
>> +MODULE_PARM_DESC(backlight_proxy_target, "Relay brightness change requests to the named backlight driver, on systems which erroneously report EC backlight control.");
>> +
>> +static int max_reprobe_attempts = 128;
>> +module_param(max_reprobe_attempts, int, 0);
>> +MODULE_PARM_DESC(max_reprobe_attempts, "Limit of reprobe attempts when relaying brightness change requests.");
>> +
>> +static bool restore_level_on_resume;
>> +module_param(restore_level_on_resume, bool, 0);
>> +MODULE_PARM_DESC(restore_level_on_resume, "Restore the backlight level when resuming from suspend, on systems which reset the EC's backlight level on resume.");
>> +
>> +static int assign_relay_quirk(const struct dmi_system_id *id)
>> +{
>> +	backlight_proxy_target = id->driver_data;
>> +	return true;
>> +}
>> +
>> +#define PROXY_QUIRK_ENTRY(vendor, product, quirk_data) { \
>> +	.callback = assign_relay_quirk,                  \
>> +	.matches = {                                     \
>> +		DMI_MATCH(DMI_SYS_VENDOR, vendor),       \
>> +		DMI_MATCH(DMI_PRODUCT_VERSION, product)  \
>> +	},                                               \
>> +	.driver_data = quirk_data                        \
>> +}
>> +
>> +static const struct dmi_system_id proxy_quirk_table[] = {
>> +	PROXY_QUIRK_ENTRY("LENOVO", "Legion S7 15ACH6", "amdgpu_bl1"),
>> +	{ }
>> +};
>> +
>> +static int assign_restore_quirk(const struct dmi_system_id *id)
>> +{
>> +	restore_level_on_resume = true;
>> +	return true;
>> +}
>> +
>> +#define RESTORE_QUIRK_ENTRY(vendor, product) {           \
>> +	.callback = assign_restore_quirk,                \
>> +	.matches = {                                     \
>> +		DMI_MATCH(DMI_SYS_VENDOR, vendor),       \
>> +		DMI_MATCH(DMI_PRODUCT_VERSION, product), \
>> +	}                                                \
>> +}
>> +
>> +static const struct dmi_system_id restore_quirk_table[] = {
>> +	RESTORE_QUIRK_ENTRY("LENOVO", "Legion S7 15ACH6"),
>> +	{ }
>> +};
>> +
>>   /**
>>    * wmi_brightness_notify() - helper function for calling WMI-wrapped ACPI method
>>    * @w:    Pointer to the struct wmi_device identified by %WMI_BRIGHTNESS_GUID
> Note not a full review, just something which I noticed on a quick scan,
> please use only 1 dmi_system_id table and make driver_data a bit field.
>
> Here is some example code for that copied from another recent review:
>
> So you would get something like this:
>
> #define SERIO_QUIRK_RESET		BIT(0)
> #define SERIO_QUIRK_NOMUX		BIT(1)
> #define SERIO_QUIRK_NOPNP		BIT(2)
> #define SERIO_QUIRK_NOLOOP		BIT(3)
> #define SERIO_QUIRK_NOSELFTEST		BIT(4)
> // etc.
>
> static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
>          {
>                  /* Entroware Proteus */
>                  .matches = {
>                          DMI_MATCH(DMI_SYS_VENDOR, "Entroware"),
>                          DMI_MATCH(DMI_PRODUCT_NAME, "Proteus"),
>                          DMI_MATCH(DMI_PRODUCT_VERSION, "EL07R4"),
>                  },
> 		.driver_data = (void *)(SERIO_QUIRK_RESET | SERIO_QUIRK_NOMUX)
>          },
> 	{}
> };


Thanks, yes: merging the tables would be pretty straightforward. I 
actually thought I might do a unified quirks table when we noticed the 
second quirk, but then thought it was kind of gross to cast a bit field 
to a pointer and then then back. I didn't think to check for prior art 
to see that in fact, this is exactly what other drivers do. I also was 
slightly worried about running out of bits if there are enough unique 
GPU backlight device names among other affected systems, but the 
likelihood of that happening seems remote enough that it isn't really 
worth considering.


> I picked the Entroware EL07R4 as example here because it needs both the reset and nomux quirks.
>
> And then when checking the quirks do:
>
> #ifdef CONFIG_X86
> 	const struct dmi_system_id *dmi_id;
> 	long quirks = 0;
>
> 	dmi_id = dmi_first_match(i8042_dmi_quirk_table);
> 	if (dmi_id)
> 		quirks = (long)dmi_id->driver_data;
>
> 	if (i8042_reset == I8042_RESET_DEFAULT) {
> 		if (quirks & SERIO_QUIRK_RESET)
> 			i8042_reset = I8042_RESET_ALWAYS;
> 		if (quirks & SERIO_QUIRK_NOSELFTEST)
> 			i8042_reset = I8042_RESET_NEVER;
> 	}
>
>
> This will already shrink the driver a bit by not having 2 dmi_system_id structs
> for the single laptop model and this will also help to avoid getting even
> more dmi_system_id tables if further quirks are necessary in the future,
> basically I want to avoid ending up with something like the somewhat messy
> code which is being cleaned-up here:
>
> https://lore.kernel.org/linux-input/20220308170523.783284-2-wse@tuxedocomputers.com/
>
> Regards,
>
> Hans
>
>
>
>
>
>
>
>> @@ -119,9 +185,30 @@ static int wmi_brightness_notify(struct wmi_device *w, enum wmi_brightness_metho
>>   	return 0;
>>   }
>>   
>> +static int scale_backlight_level(struct backlight_device *a,
>> +				 struct backlight_device *b)
>> +{
>> +	/* because floating point math in the kernel is annoying */
>> +	const int scaling_factor = 65536;
>> +	int level = a->props.brightness;
>> +	int relative_level = level * scaling_factor / a->props.max_brightness;
>> +
>> +	return relative_level * b->props.max_brightness / scaling_factor;
>> +}
>> +
>>   static int nvidia_wmi_ec_backlight_update_status(struct backlight_device *bd)
>>   {
>>   	struct wmi_device *wdev = bl_get_data(bd);
>> +	struct nvidia_wmi_ec_backlight_priv *priv = dev_get_drvdata(&wdev->dev);
>> +	struct backlight_device *proxy_target = priv->proxy_target;
>> +
>> +	if (proxy_target) {
>> +		int level = scale_backlight_level(bd, proxy_target);
>> +
>> +		if (backlight_device_set_brightness(proxy_target, level))
>> +			pr_warn("Failed to relay backlight update to \"%s\"",
>> +				backlight_proxy_target);
>> +	}
>>   
>>   	return wmi_brightness_notify(wdev, WMI_BRIGHTNESS_METHOD_LEVEL,
>>   	                             WMI_BRIGHTNESS_MODE_SET,
>> @@ -147,13 +234,65 @@ static const struct backlight_ops nvidia_wmi_ec_backlight_ops = {
>>   	.get_brightness = nvidia_wmi_ec_backlight_get_brightness,
>>   };
>>   
>> +static int nvidia_wmi_ec_backlight_pm_notifier(struct notifier_block *nb, unsigned long event, void *d)
>> +{
>> +
>> +	/*
>> +	 * On some systems, the EC backlight level gets reset to 100% when
>> +	 * resuming from suspend, but the backlight device state still reflects
>> +	 * the pre-suspend value. Refresh the existing state to sync the EC's
>> +	 * state back up with the kernel's.
>> +	 */
>> +	if (event == PM_POST_SUSPEND) {
>> +		struct nvidia_wmi_ec_backlight_priv *p;
>> +
>> +		p = container_of(nb, struct nvidia_wmi_ec_backlight_priv, nb);
>> +		return backlight_update_status(p->bl_dev);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   static int nvidia_wmi_ec_backlight_probe(struct wmi_device *wdev, const void *ctx)
>>   {
>> +	struct backlight_device *bdev, *target = NULL;
>> +	struct nvidia_wmi_ec_backlight_priv *priv;
>>   	struct backlight_properties props = {};
>> -	struct backlight_device *bdev;
>>   	u32 source;
>>   	int ret;
>>   
>> +	/*
>> +	 * Check quirks tables to see if this system needs any of the firmware
>> +	 * bug workarounds.
>> +	 */
>> +
>> +	/* User-set quirks from the module parameters take precedence */
>> +	if (!backlight_proxy_target)
>> +		dmi_check_system(proxy_quirk_table);
>> +
>> +	dmi_check_system(restore_quirk_table);
>> +
>> +	if (backlight_proxy_target && backlight_proxy_target[0]) {
>> +		static int num_reprobe_attempts;
>> +
>> +		target = backlight_device_get_by_name(backlight_proxy_target);
>> +
>> +		if (!target) {
>> +			/*
>> +			 * The target backlight device might not be ready;
>> +			 * try again and disable backlight proxying if it
>> +			 * fails too many times.
>> +			 */
>> +			if (num_reprobe_attempts < max_reprobe_attempts) {
>> +				num_reprobe_attempts++;
>> +				return -EPROBE_DEFER;
>> +			}
>> +
>> +			pr_warn("Unable to acquire %s after %d attempts. Disabling backlight proxy.",
>> +				backlight_proxy_target, max_reprobe_attempts);
>> +		}
>> +	}
>> +
>>   	ret = wmi_brightness_notify(wdev, WMI_BRIGHTNESS_METHOD_SOURCE,
>>   	                           WMI_BRIGHTNESS_MODE_GET, &source);
>>   	if (ret)
>> @@ -188,7 +327,44 @@ static int nvidia_wmi_ec_backlight_probe(struct wmi_device *wdev, const void *ct
>>   					      &wdev->dev, wdev,
>>   					      &nvidia_wmi_ec_backlight_ops,
>>   					      &props);
>> -	return PTR_ERR_OR_ZERO(bdev);
>> +
>> +	if (IS_ERR(bdev))
>> +		return PTR_ERR(bdev);
>> +
>> +	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
>> +	priv->bl_dev = bdev;
>> +
>> +	dev_set_drvdata(&wdev->dev, priv);
>> +
>> +	if (target) {
>> +		int level = scale_backlight_level(target, bdev);
>> +
>> +		if (backlight_device_set_brightness(bdev, level))
>> +			pr_warn("Unable to import initial brightness level from %s.",
>> +				backlight_proxy_target);
>> +		priv->proxy_target = target;
>> +	}
>> +
>> +	if (restore_level_on_resume) {
>> +		priv->nb.notifier_call = nvidia_wmi_ec_backlight_pm_notifier;
>> +		register_pm_notifier(&priv->nb);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void nvidia_wmi_ec_backlight_remove(struct wmi_device *wdev)
>> +{
>> +	struct nvidia_wmi_ec_backlight_priv *priv = dev_get_drvdata(&wdev->dev);
>> +	struct backlight_device *proxy_target = priv->proxy_target;
>> +
>> +	if (proxy_target)
>> +		put_device(&proxy_target->dev);
>> +
>> +	if (priv->nb.notifier_call)
>> +		unregister_pm_notifier(&priv->nb);
>> +
>> +	kfree(priv);
>>   }
>>   
>>   #define WMI_BRIGHTNESS_GUID "603E9613-EF25-4338-A3D0-C46177516DB7"
>> @@ -204,6 +380,7 @@ static struct wmi_driver nvidia_wmi_ec_backlight_driver = {
>>   		.name = "nvidia-wmi-ec-backlight",
>>   	},
>>   	.probe = nvidia_wmi_ec_backlight_probe,
>> +	.remove = nvidia_wmi_ec_backlight_remove,
>>   	.id_table = nvidia_wmi_ec_backlight_id_table,
>>   };
>>   module_wmi_driver(nvidia_wmi_ec_backlight_driver);
