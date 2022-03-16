Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11E2FC433FE
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Mar 2022 15:13:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243796AbiCPPOh (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Mar 2022 11:14:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357837AbiCPPN5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Mar 2022 11:13:57 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2084.outbound.protection.outlook.com [40.107.92.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7FFE6E285
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Mar 2022 08:11:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HzoSM2RVRVq3tKGvvT2kOrTE21upscoXn4m2V0jsldXV4B+Rv11uqGnyrzYwJVhhnW2xkCQoj8EnjLEso/9QDarx/FFTPf4H1oL86eRMBrZSBWr2jbdLq4/KTIcR1U3hcqua9mwo7ETzAPNumZq+OrM2ce+6evj0yUeeNJ+9ZOVYUniZXNXn35LIyCpWX2limGQ8s3elGtJt8IjQ6Ru+c2eeeltvrFPUBtlQuPFapEFjXWpPcCvhiPT6uS5zieR62FIWizqB0o+4r7oFI4twahH5LTKJWMVF8b88pJKfHnZANitOSLEndp6doVE/s8NKjvaFXDzZRoVm7EVAtDcYfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TZOUFurnJLYeL2CRnvYRB0geaY2qyzOxYT9kMOw5eGQ=;
 b=DXe+NngCyngKXqVXW6wrD6p7NHsBrdsw3LSbp/g5f50yaz5oLWuV13bIDdBBpi6caJdJrUFy/EZjcJa2yv0pFRNpO0jstLiVSGdLGYed/bsj6rFdzhSilPTLGsdRqw3jYnNwjyhXtqSf6i+mNg9ANuO4RDYEd5y5pqBY36x9E7y3jMhx86gF5k3TqbIiW7xJIAoZBMY3ikD1MZZnMGjDLz8Iluqyb3nhPmu+YzftUNpLQUEiF/57z0kfwSZrzo0YGdLlBqiVQIq5gs7isRp0SYWDXtQ+bGHh75ACErmsN70k68t5OCO5GNTe4ZddoQlJDVQtU4whFK9ItFlYc6NEJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TZOUFurnJLYeL2CRnvYRB0geaY2qyzOxYT9kMOw5eGQ=;
 b=rfGXc6I8s49TXgNs853qSA3AFnE8Bmgv17IxNFgBY4AcyGdQ0fuTNBTmqfhJsSM3FDo1Qhl/SP6WfeW88fdk7YH8rc/WFaLpoWJgnphkybg7BN1+80+HqGHNDnF0sUzimp4UbJtyMdeypEtptPSI9Xu7YM2B6KdZPL9xA7KESuk9IYlLsO5SpQsb4c248NuqLVSMaTtcC98+DzAMrHF1ZooHz1LT+nJSXXTtKXHlVIUJH6YFA44FWP94oEUroDjCIeGQ3YLdu7X2fJVMDFr466JsSLYtBSWWwfvVV511mMWkYlCK4Ta0x9+RhaTvXjNXCe8jVUMx+fVyekn0757MAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2763.namprd12.prod.outlook.com (2603:10b6:5:48::16) by
 CY4PR1201MB2535.namprd12.prod.outlook.com (2603:10b6:903:db::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26; Wed, 16 Mar
 2022 15:11:14 +0000
Received: from DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::99a5:ac34:8767:b7f4]) by DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::99a5:ac34:8767:b7f4%6]) with mapi id 15.20.5061.026; Wed, 16 Mar 2022
 15:11:14 +0000
Subject: Re: [PATCH] nvidia-wmi-ec-backlight: Add workarounds for confused
 firmware
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Alexandru Dinu <alex.dinu07@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org
References: <20220316012516.2233984-1-ddadap@nvidia.com>
 <v_ODhOndx3g1l-BhfKGCB6_nLY83LTc5vz1YDrVEVVF5CmgKUs1x9bmROyWXhmYkeQRVVnvfBnyrFyHaEKqtoZE5P7lKJJ1j_vE0J1Piq2Y=@protonmail.com>
From:   Daniel Dadap <ddadap@nvidia.com>
Message-ID: <0fbfd32e-904d-1e04-8508-e863c357a2ff@nvidia.com>
Date:   Wed, 16 Mar 2022 10:11:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <v_ODhOndx3g1l-BhfKGCB6_nLY83LTc5vz1YDrVEVVF5CmgKUs1x9bmROyWXhmYkeQRVVnvfBnyrFyHaEKqtoZE5P7lKJJ1j_vE0J1Piq2Y=@protonmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: SN7PR04CA0213.namprd04.prod.outlook.com
 (2603:10b6:806:127::8) To DM6PR12MB2763.namprd12.prod.outlook.com
 (2603:10b6:5:48::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 551b61c9-e999-4d1f-ffdc-08da075f3628
X-MS-TrafficTypeDiagnostic: CY4PR1201MB2535:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1201MB2535CA6DAB072548D2D46892BC119@CY4PR1201MB2535.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IWAleXOX3irOyJQRuRAcwdKzOmHQzbooKgrDjAFr1BlwjC8sqFCYoSQ8rMSOWE/4+OGez/SVJ5pQli+8n18FqIuC/H/hAzPSK3Nh9ndvsce23WeBrIzQrCAEG90M7PmV66GHI4muZkPAfpo3Vws64RGwb8MkUecl2a1PtP6nzCs9s1n/7aUrU3wqgai4a9CabXFjYdDKq0AgCDCjUl+4faLqRrisqkKVGDhB5vbWUru5hu/SCccrAMm9VhEh0BuNGdk+UPUHXZig1DwKVcuQQyyB5fM/j5GYtQhkgHLj8Ca3vE93LH8Htzp41PFNQ7rK3sLs06uai96DzfqZJxhNYEIMAttACUzNtlIIqDMw33d8k/35ttmhFXLfOydoMxDFl6C/cn/5xJR0dbRArKsbFzvce7MzhYz8edItLnLaUB/tb36JzEKn8xsu3o4S2zUxNO8aymODMAAOZvkGWKhUowH40KtebFt61bzbJJMv66jCsB3K/EUmhwQQK2qnArC+RBH2kQumH8X53SQGuMEORn2e8UYC73m2LrlpIu5mpV2hnxGox23W54qAD/nUwotEgkbPZ95eU1Gydl7ArrR+1/WHlPZt2qA7v3xXiIVKp69M8vsIpZSaLJNn1qawbaS4VsdSI+j7oaznbwqQ0kcJF0VgbJrHJXzLB+Hxzte6qltHo6U9SD/xkPvFgAu749rqwr774Oaa+YsFB5WIZrwvE2kf1aP5SAMZIXMLX/AfUwo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2763.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(53546011)(66946007)(31686004)(31696002)(5660300002)(2906002)(30864003)(66574015)(508600001)(36756003)(8936002)(66476007)(66556008)(2616005)(38100700002)(316002)(26005)(83380400001)(186003)(8676002)(54906003)(86362001)(6486002)(6666004)(4326008)(6512007)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzdmVkkydXlMdXovcG9LVTFaOUpxTzdlUDIxaTArU1lFZ1ovMnRDVWZXWnRL?=
 =?utf-8?B?NnlHaXp1aitYblNyRUdoZVBqYkE5Q3JxWk9CZE1JcmV6amdYRzUzUTdXc0g3?=
 =?utf-8?B?TFhhZFpmREZ5VEpybXJ3UUkwMnFXNEJ2YjFTYW9LYWUwVnJzRmZUV0JIc08x?=
 =?utf-8?B?aXI5UnpoTmlpSFcwb2RrLzMxWWRpN21OaFFiSHFTVDRMWk5GNkV2VXQ1QU9n?=
 =?utf-8?B?Slp5aGdxUzRleTc4akJwNEpnOW81dGhWemZIYTNTQ3h2ZWFpSmd3U2FNWkxl?=
 =?utf-8?B?WURRUVUzZjZ1WmVTcU1HSmhNV0t5ejFjNHp5MXhpdjArMFhPVm8xQnp6bGlo?=
 =?utf-8?B?eDArbWFFb29LTHN6YjlJR3NzYWlLNFQ5UGVpdHV4TXJhMFp3Y0tPN0RnVjVO?=
 =?utf-8?B?eXpleEVtdjJaSHdIZmg5cGNQY2M0TFVCM2ZIbnloMTV2VmVsTVRLV0ErakZB?=
 =?utf-8?B?NHVyd2c0Q1FQY3duZHg1ejVGSWRmY1FBV1Y0MWU5TGFJQlVnZmRFTjB3WTJW?=
 =?utf-8?B?bjRxWS9hU2pOclhjUVZ4ZGErcENWS3VLN3RSR1AxM09QMzNQMnZjQ0VYb05U?=
 =?utf-8?B?cHhuU25TK2hNOENKbXJrZTFWZEZBMXBqaG1oTUlXS0psbkRoKzZ6NmVlT2Ny?=
 =?utf-8?B?amJnRWZkcERZblhtdzhMcXVGOXRRTHlMbDllZS8zTmpiNW1zNndwZGNicVJx?=
 =?utf-8?B?d0ppLzNIbkcxNFNmQW5oOVBCb295SG5iNlNwM2hCdENBamRrTFFxSk1ESUpj?=
 =?utf-8?B?anZTcFdBZEJrT2d3ZTJURld1am9IT0hkNTlUeXhPWUNyeGdSSTQ4elB0TXVT?=
 =?utf-8?B?Rm1LV09aeHptY244TE9zeUwzSXgrZ2svSm1FU3NUbWdQaDd1emlWbyt2a0NM?=
 =?utf-8?B?cnN2NEpEY2VCNithK3l2NTBLNXZ5MzRYSUR5N3dsQVZwU1FsWUxHTFpsbThJ?=
 =?utf-8?B?Zm4zdG5JdFUvVXdReFcyNXZwSVN2bnBieEZSeEdUM0oyVGZPUFBYQ2c1aXpi?=
 =?utf-8?B?TkRhemlVS3lyREt5ZVYvSWVHK29wbXpIcHJkWmRRaE0vVVdEMjVpK2FqSGdW?=
 =?utf-8?B?QjBhd1lUSmVCK1lRaERPUFI3UW1WQk10MExHMDNLVldUNkFKZ2RrSjJrVlhW?=
 =?utf-8?B?WG5xMGdEZGFrRkhUTFVCZ2EydXdUV1ZRMTQ2eHJXcFdXc0xyYjcwNVdneURG?=
 =?utf-8?B?WDJLNDZtNUNsSU04QUZkNDNZT1ZVVzk4RGh2eThUR0dLS2Z5K2RudW1HSkw1?=
 =?utf-8?B?ZkdoQVJobHJrenVRbFdHMjFDb0c0emRuYmJxaFFHaU82ZCt6TXRpRTByeUgz?=
 =?utf-8?B?bXJnWVg1N2MzTS82eUFQSjRxeW5CVm5hMkwzbUlkMU04RUVWOFU4QnZyQW1o?=
 =?utf-8?B?SFdKTmNmMGl3SVZzdWZtTWpaUVNPVUFJUFluTW55WDAxeXliTWxHc3lxVUMz?=
 =?utf-8?B?ajR1dUdUR0oxS0dRU2FjRUcxR2hhMWo2eUNCYUR0RFdOcjJ0MGFubENwN3B4?=
 =?utf-8?B?R2FGcWhNeEFlTkh3a0tRUGxsdUoxbzF0QnlzOHlIV29OQm9ZUmtQNVBXRjBV?=
 =?utf-8?B?YVBYZ0xucE9oVG1vclZObE5LMzE1bGpDWnVNWFI1dVF2R05WVTlZZ2dpVlRC?=
 =?utf-8?B?NjlNUm9mZ3hRV0ZvWGFWOEhCSXZvNWtxcjdYODFnZHdUMjB3RzIyenhhRmho?=
 =?utf-8?B?c3kzOExDRUUyZXcvWEozWTRZME95elpKM3Rid29YcHpoV0dTTmY5OWhTdDFZ?=
 =?utf-8?B?Ukp6cGRzdFp5UGRJNWpjR1BuYUdldmhZZnB5NlZSeTEwVEFmUzVKU2hDNkVQ?=
 =?utf-8?B?clRHWG5TaFZyZ2xremMzOWlQL0ducHZpbVRST2l6SDkxSXNRVTVKZS9RcjJE?=
 =?utf-8?B?YjBmOC96b0RiVkFuK3dUdjZsYW1SZDA3aythR3Z2RXNnWmdBbG9yZy9JN2Zj?=
 =?utf-8?Q?f4qQzKylVWYOfTdPhBTdAC5lCtebbp0O?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 551b61c9-e999-4d1f-ffdc-08da075f3628
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2763.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2022 15:11:14.1102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hisuqgnw3g6IkowTigTRYB/3LV0JHfdcnxQiAME9k5wGuHnUdXuqVuBKdRuoSZ6hz4qz0oM5YGUEIIXuUy0+pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2535
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Thanks for the feedback. I'll send out a v2 shortly: Alex, can you 
please retest when I do to make sure there aren't any regressions? None 
of these suggestions affect the core flow of how either of the 
workarounds work, so I'm not expecting any that wouldn't also reproduce 
on my EC backlight system that doesn't have either of these problems, 
but I can send you the updated version off-list first if you prefer.

Detailed replies below:

On 3/15/22 9:50 PM, Barnabás Pőcze wrote:
> Hi
>
>
> The platform-driver-x86 maintainers should've probably been
> CCd. You may or may not know, but the `scripts/get_maintainers.pl`
> script can be used to determine the appropriate recipients.


Indeed. I've copied the pdx86 maintainers on this message and will for 
future correspondence regarding this patch.


> 2022. március 16., szerda 2:25 keltezéssel, Daniel Dadap írta:
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
> `KBUILD_MODNAME` is a string literal, so you can do e.g.
>
>    #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>
>
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
> It seems these module parameters are neither readable nor writable,
> is that intentional?


It was intentional that they not be writable, because I didn't want to 
have to plumb everything through to handle changing the values after 
probe. However, you are right that it could still be useful to set up 
the sysfs entries to allow reading the values, as this could be useful 
information for someone who wants to check if either of these quirks are 
enabled.


>
>> +MODULE_PARM_DESC(backlight_proxy_target, "Relay brightness change requests to the named backlight driver, on systems which erroneously report EC backlight control.");
>> +
>> +static int max_reprobe_attempts = 128;
> Can you elaborate how this number was arrived at?
>

It's just a medium-small round number. I didn't want probe to return 
-EPROBE_DEFER forever if e.g. somebody specified a wrong device name or 
if the target device name changes and the entry in the quirks table goes 
out of date. On the system I tested this on, the amdgpu_bl1 device was 
accessible on the 14th probe attempt. If there's some better value to 
plug in here, or if it's actually considered more correct to just never 
succeed at probe if the workaround is enabled but the target device can 
be found, I'd be happy to change it.


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
> Maybe
>
>    fixp_linear_interpolate(0, 0, a->props.max_brightness, b->props.max_brightness, a->props.brightness);
>
> ? (from `linux/fixp-arith.h`)


Yes, this is exactly what I want; thank you.


>
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
> `backlight_update_status()` returns a negative errno while the notifier chain
> expects something else. It would probably be better to return `NOTIFY_DONE`
> in all cases. Currently a suitable error from `backlight_update_status()` will
> stop the notifier chain.


Thanks for catching that: I should have paid more attention to the 
notifier callback signature.


>
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
> I think `target` is not put in case of error. You probably need to add something like:
>
>    if (target) {
>      ret = devm_add_action_or_reset(&wdev->dev, put_device_wrapper, target);
>      if (ret < 0)
>        return ret;
>    }
>
>
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
> `devm_kzalloc()` would probably be better and you should check if `!priv`.
>
>
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
> If you switch to `devm_add_action_or_reset()`, this will not be needed.
>
>
>> +
>> +	if (priv->nb.notifier_call)
>> +		unregister_pm_notifier(&priv->nb);
>> +
>> +	kfree(priv);
> If you switch to `devm_kzalloc()`, this won't be needed.


Thank you, the devm_*() variants are indeed useful.


>
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
>> --
>> 2.27.0
>>
> Lastly, is it expected that these bugs will be properly fixed?


Possibly, but I wouldn't hold out hope for it for an issue at this scale 
on an already shipping system.


>
> Regards,
> Barnabás Pőcze
