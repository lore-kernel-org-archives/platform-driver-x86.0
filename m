Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28A9EC32789
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 Aug 2022 17:22:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231795AbiHWRWY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 23 Aug 2022 13:22:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241353AbiHWRVO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 Aug 2022 13:21:14 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2084.outbound.protection.outlook.com [40.107.94.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0490BAD992
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Aug 2022 07:56:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n0mnfMnOj0IiZIgE6iXpR0lcTGWMtf52AGWnfKDFgy7xRzNO+XA4jt6xH3BTqfYs0+Jd7aVYz3Upxq/S97TD7jzOes6+Rxq4AUEOhQ/AP/GHQkfQ2OUwQ+noNZAD9aW+cacZeMUzHFTzwxtogI1ksKjSsgZMUJaBOOsDnFvYinz7OEV/ZL7hNNsg5ZARLBHMJyvNKoxW7tpEKl0QLdLAAQHOW4SQyg0OvnReF/KC5tiSPjozf9bj6f1RFhbeWIbnLobqgbXOAbR5LzXMUJej/Fjs3vMjiwnFzQA2otwALQxRXkNUgrNY44fGNqB9/p5CLNR1ZTPRm6Ralvt1rv0Jlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FEGu/YhtCkP2LIo/74+3ZEXpzt1VPB+eAPJDUzucq2I=;
 b=CFWgIB34REg/od9SVze+8lcTG9mTmVhY5EwAlOBO5QqEPPksuwgniKe4Whj8omgIOqH3lxRdj0wfgxlPV7pJ0/f+I3WR0UjKbjxbsjcIudX2DvexXB3xLIg7UiADVb/CJbURgAEv+toL3EqxG9TJeii5Utp+1WMUT5vy+rziYvLegy4euLkciA+3P5faswe7AqoYIvuurQUEx8zFBsyZDpFyMx8mjnB4/taWdf5JUBlzjDOscwIx1t+sxUuj72QtuUpX7c5xk9b6/uij0jz4Q7jFcZsLba1IZS6VMnNNoHe4GaEmo1iod96G+uIfB+i+uJEytD6QNkt+56lp6R0btg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FEGu/YhtCkP2LIo/74+3ZEXpzt1VPB+eAPJDUzucq2I=;
 b=t36Tej3uHutPLa8A/e7Rr3fJ+EqtiNUIoozcEwXVuGZAcBfpiWIa5PQCB79jqJ4OheXwkXNv0j4gnRj2krtjpIAooMd2+7MAQPH/pJXdrKeDW7WU+jlPtTgJlF9D19MNpGzY6jj6ij+LLMFIM1k4bnICsV/VOGJ+fDVZ1v5MPmo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by BYAPR12MB2888.namprd12.prod.outlook.com (2603:10b6:a03:137::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Tue, 23 Aug
 2022 14:56:25 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::e00a:1f8c:dcd1:afc3]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::e00a:1f8c:dcd1:afc3%5]) with mapi id 15.20.5546.022; Tue, 23 Aug 2022
 14:56:25 +0000
Message-ID: <2bbd2992-8635-f301-7e2f-67b814b38cc8@amd.com>
Date:   Tue, 23 Aug 2022 09:56:23 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/4] platform/x86/amd/pmf: Add support for CnQF
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
        markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20220823102913.4181217-1-Shyam-sundar.S-k@amd.com>
 <20220823102913.4181217-2-Shyam-sundar.S-k@amd.com>
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <20220823102913.4181217-2-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR13CA0092.namprd13.prod.outlook.com
 (2603:10b6:806:24::7) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4260a397-7813-4b0a-2bc3-08da8517a6c4
X-MS-TrafficTypeDiagnostic: BYAPR12MB2888:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A2fP40qLW7QK9eRzbPU4viY1QfzsscNxc1njnfi3UKiZu00ATlsV92AufGgS5BbSGU0bzJGblnakEWMCvh9o/SKPLiaDQ9wHnNN5GPG9PzDy1izKHcAXD1DBnBb03vYTBKxpOwXBD/w2BLJSRXVyv3s3wOkAe7l2USIqqw20oajiKGxcWKqHVTkCKrVQIPzzBH+7g9G/y6UVFUWPm4kejw0Fry+379h+eMN3ohcgivbwIA5gL7qkRaoafELFjpjzdHZ2y8QqL2doPfGJ+LklKgSL1U4F7IS21SjbS4SMrO3irL703+z1jrPtLxnU+FzwQyiGyh8g1v3DueQRZ+CRpdqodORqjh8zbzJHir+yDo5elxQeXkdjZh/mJ6Pc4Tp1s1A3/wNne/OKgl8uxU3ODcn830WJx4BrN4J+qmAaI19rqxdIUSG8g41B9nLlJKO9IHv9fjeVwE+m9LksYEbZX5MaTlkjKjJSf3vIQuPo9fMWEGQIWsYvJ4v2yYtZKoE7G6cmK04nnQCRcyHIUl78rHJ2N8Z1an5a04HFAKRQpvkcxSm/3oRBcmE8Rl7HXNTwbfcVhH9wkTiLo1E4T+IpSlWMgcR/K1W6ieVSgjp37dRycTdgAZ2gS8I78LaRgO/gXSWf70CKyz+iUYjLwzyurwNFCjzqwIU61QdN1UEFswp/GwmUF4Mh+M+owrEaed9JbPNR0Qy932cEZKEuLj8KYSOwuiI3VSGD/2u3t6oV2xsuQtb5mDoFHfaX3ojfmx9JJU5FnPmuadvdpKqJfp4lCBExGzg23MaNErv+JvaY9c8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(136003)(396003)(376002)(366004)(2906002)(31686004)(2616005)(186003)(66556008)(316002)(66476007)(66946007)(4326008)(8676002)(36756003)(8936002)(30864003)(5660300002)(31696002)(6512007)(26005)(53546011)(86362001)(6506007)(38100700002)(83380400001)(6486002)(478600001)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q25wV01xOVRhNmVoZEk5QWYwaFNCT1l6cmh2aEJOR2Zra1VZaCt3a1NCTnQw?=
 =?utf-8?B?WDNadWE1ZmJSdTVCWlQzL2ZSaC8zeFgzdW04M2lZUkFEeExFYWFrZ1oxQ0Vz?=
 =?utf-8?B?MS96N3RMK0lrckhQNUhIOFZKelB1b2F1b0FqUUFab3BhTE1jTUt0QmlsYnNQ?=
 =?utf-8?B?SFdmeTlpSWZmQTlGVlJha1p3VmEybVRXODZjdzFkYW1ja0Z5cHZLS2ZKM0gw?=
 =?utf-8?B?VkxDaUhndEFIZnRYVE5YSDE4aGNyU25oK0F5US9xY1c3T01mYitTNDl4T1o5?=
 =?utf-8?B?TmpIRXZ5WUwzNC83c2ZVWFpGZERLcVZmVnVuRE9ic1BLSmR3TzVNWDdyL1BL?=
 =?utf-8?B?YThxUDF4NzV3S0RSa3V5b3JRckcyb2VSTW50VHEvRlprQk5CNUpBSVhHQ2pK?=
 =?utf-8?B?MU1SNkRaRi80K2dsY1hYT2FtTUFnME9nSVM2S3ZIOFZmM2ptOG43ajN5dlRz?=
 =?utf-8?B?SG51SkFpVmhVcGw5bXFLK2ZaUE8vWVdTYmNhall4Y0FYVGE4aU16N1dIeVEw?=
 =?utf-8?B?SW93dUZNL1puditvc3h6Tkt3WHdWZjhiV3NWVFh6U1FvdE9kZnhEYkozZ0Nu?=
 =?utf-8?B?SnZiMVQ0YlZDTmpoQkxLc0IyQVpjSWRjN0loVHFYbFF0WFU0M2hTbms5aTh3?=
 =?utf-8?B?eG45VEIxY3JRZ1ZaUFVSN2VPaDBPWmc5NUxsVFpVT2NCa0ZCSFFYNW5KOXk2?=
 =?utf-8?B?KzZxNVd0N2tuVk5DbXgySElNSlM2WGR4YlZlSXIxNUFkMWhrYUpTWENhWDhM?=
 =?utf-8?B?cFErZ0ZmSVI2TDJqQmYzY2pkcXBJMlVEVzYzS2Fxb3NOUXFJQWZheGd6RFpp?=
 =?utf-8?B?OW9aZjkzWlF4NnpLOGlzN09sR1ROckJqUS9VK3UxYksxQUwxd0RORTlHQ2FF?=
 =?utf-8?B?d0w3bHhYV1RKQkFOREhDNVZNdEJ6Tnd1MCtJeVMwTzg0MDBYN1YvRzJWM2dM?=
 =?utf-8?B?a0xYNDJwd0t3OUNyUWduWFZkN0ovOHlsRkUvZjBORWJZdTRkdFR0b3MydzZG?=
 =?utf-8?B?VEt1aHcyTStCZmhtS3lUMWxkMytpUitJcm4yaWtpRkx6cndRUnp1SlhqeXF3?=
 =?utf-8?B?TFgwc2Q3KzRmS1NuZkFXQUxBTXh6T3BWRjN5N3ZpNS82WnFEYUNNZDJpNlVo?=
 =?utf-8?B?ZkNzc3J6TFZQYzM5dU1BZENDSlVwckF2Y3BjeHdLQWVZTmtFdHkrYkthbHdi?=
 =?utf-8?B?bnBUdlFPd3M0ejgrcWFsbXByMFRyNk0rUmErOWhWMmFTb0NoQ2FWdnp0Ny85?=
 =?utf-8?B?OWZIMThJYWJmY3Zxd09FdEcyUDF3aUhXZ1l0MmdBSnFseXhMNzF6MmxJME8x?=
 =?utf-8?B?ays4c244QUR2eXZEUnQxeEZoNXZGNVZENjhGVm9URm1Ya1RSdi9NanJjbXhm?=
 =?utf-8?B?L0EzUG5IeWFuMHhtTnBHSWFwbTZVVlZObktUaVZBV2lCZnJFWnBWbGNSNkhk?=
 =?utf-8?B?NXFxaEtJbG9Fa2JPNi84aFNWYUdnczkxS0tqdmkvTU1VTkVCYmtsVnM4QTRI?=
 =?utf-8?B?SG5IWUZqR1krUCsyMzRtZkIwbzZzcUVueHc0Nks4Snp1eHBtbEV2UnZneC9K?=
 =?utf-8?B?dHZTcE5LaGZBVVltNysxUEZzUXJ2NjhRMHJvVkVpaW9hZWpIL1pHRVhuZFdW?=
 =?utf-8?B?dkgzZ1Y4bWYxRXBMeXdsa1hPaFdjOWFoYlFXb1EwdE9aV0pkQXA2ZGVFTzFQ?=
 =?utf-8?B?UmVUN0JSUEZxeUtQeHJ3RDZhN0VkU2RuU3FiZUdTME1RZ0tOQUlWZW8zWW03?=
 =?utf-8?B?eGFiUStjaVZYektyVkJwemtzUlBtQ1NRdDJpbERkbEtoUlo0VmpKWGo2SFh4?=
 =?utf-8?B?MVBLOS8xVUNpVXlDRkZYMk9SOUF6L3V0cHg1NkJLOTBxTGhXeHpZenliYVNS?=
 =?utf-8?B?cG1rQWx2Z3JOcXVnUDdwZUo5RVVZekpPZ0I1WVZxQVF0aDkxZHQwYTE3c2dV?=
 =?utf-8?B?S2s2dkc2aXovaVc2N1NBOTd3R21YdG5SaXkwWjJoQVZYb0NTb0FqN3hBVmhp?=
 =?utf-8?B?SmV4Kyt3cVFJazQ5U3NSK1hoRTluOU9MOFJibmNRZnFDOXlHMlJxVEFqZHli?=
 =?utf-8?B?VWRmcis1TkZKUTRLQUhiejczMDZ6UjlFYzlHbEUzOUhBMGF6cHlDc2l2NytF?=
 =?utf-8?Q?OjP/4RXi5kMTneUn0Z9OdR28b?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4260a397-7813-4b0a-2bc3-08da8517a6c4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 14:56:25.6836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rik8zh7abm4oElCS307xrVU7cn+scrS+ey8z1sViQuyESg5N2nodlBjJtBIEIww8l00ZN1qgIxP4RZJX1cCgeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2888
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 8/23/2022 05:29, Shyam Sundar S K wrote:
> CnQF (a.k.a Cool and Quiet Framework) extends the static slider concept.
> PMF dynamically manages system power limits and fan policy based on system
> power trends which is representative of workload trend.
> 
> Static slider and CnQF controls are mutually exclusive for system power
> budget adjustments. CnQF supports configurable number of modes which can
> be unique for AC and DC. Every mode is representative of a system state
> characterized by unique steady state and boost behavior.
> 
> OEMs can configure the different modes/system states and how the
> transition to a mode happens. Whether to have CnQF manage system power
> budget dynamically in AC or DC or both is also configurable. Mode changes
> due to CnQF dont result in slider position change.
> 
> The default OEM values are obtained after evaluating the PMF ACPI function
> idx 11 & 12 for AC and DC respectively. Whether to turn ON/OFF by default
> is guided by a "flag" passed by the OEM BIOS.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>   drivers/platform/x86/amd/pmf/Makefile |   2 +-
>   drivers/platform/x86/amd/pmf/acpi.c   |  10 +
>   drivers/platform/x86/amd/pmf/cnqf.c   | 314 ++++++++++++++++++++++++++
>   drivers/platform/x86/amd/pmf/core.c   |  16 +-
>   drivers/platform/x86/amd/pmf/pmf.h    | 100 ++++++++
>   5 files changed, 440 insertions(+), 2 deletions(-)
>   create mode 100644 drivers/platform/x86/amd/pmf/cnqf.c
> 
> diff --git a/drivers/platform/x86/amd/pmf/Makefile b/drivers/platform/x86/amd/pmf/Makefile
> index ef2b08c9174d..fdededf54392 100644
> --- a/drivers/platform/x86/amd/pmf/Makefile
> +++ b/drivers/platform/x86/amd/pmf/Makefile
> @@ -6,4 +6,4 @@
>   
>   obj-$(CONFIG_AMD_PMF) += amd-pmf.o
>   amd-pmf-objs := core.o acpi.o sps.o \
> -		auto-mode.o
> +		auto-mode.o cnqf.o
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index cb46a7252414..05a2b8a056fc 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -233,6 +233,16 @@ static int apmf_get_system_params(struct amd_pmf_dev *dev)
>   	return 0;
>   }
>   
> +int apmf_get_dyn_slider_def_ac(struct amd_pmf_dev *pdev, struct apmf_dyn_slider_output *data)
> +{
> +	return apmf_if_call_store_buffer(pdev, APMF_FUNC_DYN_SLIDER_AC, data, sizeof(*data));
> +}
> +
> +int apmf_get_dyn_slider_def_dc(struct amd_pmf_dev *pdev, struct apmf_dyn_slider_output *data)
> +{
> +	return apmf_if_call_store_buffer(pdev, APMF_FUNC_DYN_SLIDER_DC, data, sizeof(*data));
> +}
> +
>   void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev)
>   {
>   	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
> diff --git a/drivers/platform/x86/amd/pmf/cnqf.c b/drivers/platform/x86/amd/pmf/cnqf.c
> new file mode 100644
> index 000000000000..b8abe0f4447a
> --- /dev/null
> +++ b/drivers/platform/x86/amd/pmf/cnqf.c
> @@ -0,0 +1,314 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * AMD Platform Management Framework Driver
> + *
> + * Copyright (c) 2022, Advanced Micro Devices, Inc.
> + * All Rights Reserved.
> + *
> + * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> + */
> +
> +#include <linux/workqueue.h>
> +#include "pmf.h"
> +
> +static struct cnqf_config config_store;
> +
> +static int amd_pmf_handle_cnqf(struct amd_pmf_dev *dev, int src, int idx,
> +			       struct cnqf_config *table)
> +{
> +	struct power_table_control *pc;
> +
> +	pc = &config_store.mode_set[src][idx].power_control;
> +
> +	amd_pmf_send_cmd(dev, SET_SPL, false, pc->spl, NULL);
> +	amd_pmf_send_cmd(dev, SET_FPPT, false, pc->fppt, NULL);
> +	amd_pmf_send_cmd(dev, SET_SPPT, false, pc->sppt, NULL);
> +	amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, false, pc->sppt_apu_only, NULL);
> +	amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, false, pc->stt_min, NULL);
> +	amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, false, pc->stt_skin_temp[STT_TEMP_APU],
> +			 NULL);
> +	amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, false, pc->stt_skin_temp[STT_TEMP_HS2],
> +			 NULL);
> +
> +	if (is_apmf_func_supported(dev, APMF_FUNC_SET_FAN_IDX))
> +		apmf_update_fan_idx(dev,
> +				    config_store.mode_set[src][idx].fan_control.manual,
> +				    config_store.mode_set[src][idx].fan_control.fan_id);
> +
> +	return 0;
> +}
> +
> +static void amd_pmf_update_power_threshold(void)
> +{
> +	struct cnqf_mode_settings *ts;
> +	struct cnqf_tran_params *tp;
> +	int i;
> +
> +	for (i = 0; i < POWER_SOURCE_MAX; i++) {
> +		tp = &config_store.trans_param[i][CNQF_TRANSITION_TO_QUIET];
> +		ts = &config_store.mode_set[i][CNQF_MODE_BALANCE];
> +		tp->power_threshold = ts->power_floor - tp->power_delta;
> +
> +		tp = &config_store.trans_param[i][CNQF_TRANSITION_TO_TURBO];
> +		ts = &config_store.mode_set[i][CNQF_MODE_PERFORMANCE];
> +		tp->power_threshold = ts->power_floor - tp->power_delta;
> +
> +		tp = &config_store.trans_param[i][CNQF_TRANSITION_FROM_BALANCE_TO_PERFORMANCE];
> +		ts = &config_store.mode_set[i][CNQF_MODE_BALANCE];
> +		tp->power_threshold = ts->power_floor - tp->power_delta;
> +
> +		tp = &config_store.trans_param[i][CNQF_TRANSITION_FROM_PERFORMANCE_TO_BALANCE];
> +		ts = &config_store.mode_set[i][CNQF_MODE_PERFORMANCE];
> +		tp->power_threshold = ts->power_floor - tp->power_delta;
> +
> +		tp = &config_store.trans_param[i][CNQF_TRANSITION_FROM_QUIET_TO_BALANCE];
> +		ts = &config_store.mode_set[i][CNQF_MODE_QUIET];
> +		tp->power_threshold = ts->power_floor - tp->power_delta;
> +
> +		tp = &config_store.trans_param[i][CNQF_TRANSITION_FROM_TURBO_TO_PERFORMANCE];
> +		ts = &config_store.mode_set[i][CNQF_MODE_TURBO];
> +		tp->power_threshold = ts->power_floor - tp->power_delta;
> +	}
> +}
> +
> +static const char *state_as_str(unsigned int state)
> +{
> +	switch (state) {
> +	case CNQF_MODE_QUIET:
> +		return "QUIET";
> +	case CNQF_MODE_BALANCE:
> +		return "BALANCED";
> +	case CNQF_MODE_TURBO:
> +		return "TURBO";
> +	case CNQF_MODE_PERFORMANCE:
> +		return "PERFORMANCE";
> +	default:
> +		return "Unknown CnQF mode";
> +	}
> +}
> +
> +void amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_lapsed_ms)
> +{
> +	struct cnqf_tran_params *tp;
> +	int src, i, j, index = 0;
> +	u32 avg_power = 0;
> +
> +	src = amd_pmf_get_power_source();
> +
> +	for (i = 0; i < CNQF_TRANSITION_MAX; i++) {
> +		config_store.trans_param[src][i].timer += time_lapsed_ms;
> +		config_store.trans_param[src][i].total_power += socket_power;
> +		config_store.trans_param[src][i].count++;
> +
> +		tp = &config_store.trans_param[src][i];
> +		if (tp->timer >= tp->time_constant && tp->count) {
> +			avg_power = tp->total_power / tp->count;
> +
> +			/* Reset the indices */
> +			tp->timer = 0;
> +			tp->total_power = 0;
> +			tp->count = 0;
> +
> +			if ((tp->shifting_up && avg_power >= tp->power_threshold) ||
> +			    (!tp->shifting_up && avg_power <= tp->power_threshold)) {
> +				tp->priority = true;
> +			} else {
> +				tp->priority = false;
> +			}
> +		}
> +	}
> +
> +	dev_dbg(dev->dev, "[CNQF] Avg power: %u mW socket power: %u mW mode:%s\n",
> +		avg_power, socket_power, state_as_str(config_store.current_mode));
> +
> +	for (j = 0; j < CNQF_TRANSITION_MAX; j++) {
> +		/* apply the highest priority */
> +		index = config_store.trans_prio[j];
> +		if (config_store.trans_param[src][index].priority) {
> +			if (config_store.current_mode !=
> +			    config_store.trans_param[src][index].target_mode) {
> +				config_store.current_mode =
> +						config_store.trans_param[src][index].target_mode;
> +				dev_dbg(dev->dev, "Moving to Mode :%s\n",
> +					state_as_str(config_store.current_mode));
> +				amd_pmf_handle_cnqf(dev, src,
> +						    config_store.current_mode, NULL);
> +			}
> +			break;
> +		}
> +	}
> +}
> +
> +static void amd_pmf_update_trans_data(int idx, struct apmf_dyn_slider_output out)
> +{
> +	struct cnqf_tran_params *tp;
> +
> +	tp = &config_store.trans_param[idx][CNQF_TRANSITION_TO_QUIET];
> +	tp->time_constant = out.t_balanced_to_quiet;
> +	tp->target_mode = CNQF_MODE_QUIET;
> +	tp->shifting_up = false;
> +
> +	tp = &config_store.trans_param[idx][CNQF_TRANSITION_FROM_BALANCE_TO_PERFORMANCE];
> +	tp->time_constant = out.t_balanced_to_perf;
> +	tp->target_mode = CNQF_MODE_PERFORMANCE;
> +	tp->shifting_up = true;
> +
> +	tp = &config_store.trans_param[idx][CNQF_TRANSITION_FROM_QUIET_TO_BALANCE];
> +	tp->time_constant = out.t_quiet_to_balanced;
> +	tp->target_mode = CNQF_MODE_BALANCE;
> +	tp->shifting_up = true;
> +
> +	tp = &config_store.trans_param[idx][CNQF_TRANSITION_FROM_PERFORMANCE_TO_BALANCE];
> +	tp->time_constant = out.t_perf_to_balanced;
> +	tp->target_mode = CNQF_MODE_BALANCE;
> +	tp->shifting_up = false;
> +
> +	tp = &config_store.trans_param[idx][CNQF_TRANSITION_FROM_TURBO_TO_PERFORMANCE];
> +	tp->time_constant = out.t_turbo_to_perf;
> +	tp->target_mode = CNQF_MODE_PERFORMANCE;
> +	tp->shifting_up = false;
> +
> +	tp = &config_store.trans_param[idx][CNQF_TRANSITION_TO_TURBO];
> +	tp->time_constant = out.t_perf_to_turbo;
> +	tp->target_mode = CNQF_MODE_TURBO;
> +	tp->shifting_up = true;
> +}
> +
> +static void amd_pmf_update_mode_set(int idx, struct apmf_dyn_slider_output out)
> +{
> +	struct cnqf_mode_settings *ms;
> +
> +	/* Quiet Mode */
> +	ms = &config_store.mode_set[idx][CNQF_MODE_QUIET];
> +	ms->power_floor = out.ps[APMF_CNQF_QUIET].pfloor;
> +	ms->power_control.fppt = out.ps[APMF_CNQF_QUIET].fppt;
> +	ms->power_control.sppt = out.ps[APMF_CNQF_QUIET].sppt;
> +	ms->power_control.sppt_apu_only = out.ps[APMF_CNQF_QUIET].sppt_apu_only;
> +	ms->power_control.spl = out.ps[APMF_CNQF_QUIET].spl;
> +	ms->power_control.stt_min = out.ps[APMF_CNQF_QUIET].stt_min_limit;
> +	ms->power_control.stt_skin_temp[STT_TEMP_APU] =
> +		out.ps[APMF_CNQF_QUIET].stt_skintemp[STT_TEMP_APU];
> +	ms->power_control.stt_skin_temp[STT_TEMP_HS2] =
> +		out.ps[APMF_CNQF_QUIET].stt_skintemp[STT_TEMP_HS2];
> +	ms->fan_control.fan_id = out.ps[APMF_CNQF_QUIET].fan_id;
> +
> +	/* Balance Mode */
> +	ms = &config_store.mode_set[idx][CNQF_MODE_BALANCE];
> +	ms->power_floor = out.ps[APMF_CNQF_BALANCE].pfloor;
> +	ms->power_control.fppt = out.ps[APMF_CNQF_BALANCE].fppt;
> +	ms->power_control.sppt = out.ps[APMF_CNQF_BALANCE].sppt;
> +	ms->power_control.sppt_apu_only = out.ps[APMF_CNQF_BALANCE].sppt_apu_only;
> +	ms->power_control.spl = out.ps[APMF_CNQF_BALANCE].spl;
> +	ms->power_control.stt_min = out.ps[APMF_CNQF_BALANCE].stt_min_limit;
> +	ms->power_control.stt_skin_temp[STT_TEMP_APU] =
> +		out.ps[APMF_CNQF_BALANCE].stt_skintemp[STT_TEMP_APU];
> +	ms->power_control.stt_skin_temp[STT_TEMP_HS2] =
> +		out.ps[APMF_CNQF_BALANCE].stt_skintemp[STT_TEMP_HS2];
> +	ms->fan_control.fan_id = out.ps[APMF_CNQF_BALANCE].fan_id;
> +
> +	/* Performance Mode */
> +	ms = &config_store.mode_set[idx][CNQF_MODE_PERFORMANCE];
> +	ms->power_floor = out.ps[APMF_CNQF_PERFORMANCE].pfloor;
> +	ms->power_control.fppt = out.ps[APMF_CNQF_PERFORMANCE].fppt;
> +	ms->power_control.sppt = out.ps[APMF_CNQF_PERFORMANCE].sppt;
> +	ms->power_control.sppt_apu_only = out.ps[APMF_CNQF_PERFORMANCE].sppt_apu_only;
> +	ms->power_control.spl = out.ps[APMF_CNQF_PERFORMANCE].spl;
> +	ms->power_control.stt_min = out.ps[APMF_CNQF_PERFORMANCE].stt_min_limit;
> +	ms->power_control.stt_skin_temp[STT_TEMP_APU] =
> +		out.ps[APMF_CNQF_PERFORMANCE].stt_skintemp[STT_TEMP_APU];
> +	ms->power_control.stt_skin_temp[STT_TEMP_HS2] =
> +		out.ps[APMF_CNQF_PERFORMANCE].stt_skintemp[STT_TEMP_HS2];
> +	ms->fan_control.fan_id = out.ps[APMF_CNQF_PERFORMANCE].fan_id;
> +
> +	/* Turbo Mode */
> +	ms = &config_store.mode_set[idx][CNQF_MODE_TURBO];
> +	ms->power_floor = out.ps[APMF_CNQF_TURBO].pfloor;
> +	ms->power_control.fppt = out.ps[APMF_CNQF_TURBO].fppt;
> +	ms->power_control.sppt = out.ps[APMF_CNQF_TURBO].sppt;
> +	ms->power_control.sppt_apu_only = out.ps[APMF_CNQF_TURBO].sppt_apu_only;
> +	ms->power_control.spl = out.ps[APMF_CNQF_TURBO].spl;
> +	ms->power_control.stt_min = out.ps[APMF_CNQF_TURBO].stt_min_limit;
> +	ms->power_control.stt_skin_temp[STT_TEMP_APU] =
> +		out.ps[APMF_CNQF_TURBO].stt_skintemp[STT_TEMP_APU];
> +	ms->power_control.stt_skin_temp[STT_TEMP_HS2] =
> +		out.ps[APMF_CNQF_TURBO].stt_skintemp[STT_TEMP_HS2];
> +	ms->fan_control.fan_id = out.ps[APMF_CNQF_TURBO].fan_id;
> +}
> +
> +static int amd_pmf_check_flags(struct amd_pmf_dev *dev)
> +{
> +	struct apmf_dyn_slider_output out = {};
> +
> +	if (is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_AC))
> +		apmf_get_dyn_slider_def_ac(dev, &out);
> +	else if (is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_DC))
> +		apmf_get_dyn_slider_def_dc(dev, &out);
> +
> +	return out.flags;
> +}
> +
> +void amd_pmf_load_defaults_cnqf(struct amd_pmf_dev *dev)
> +{
> +	struct apmf_dyn_slider_output out;
> +	int i, j, ret;
> +
> +	for (i = 0; i < POWER_SOURCE_MAX; i++) {
> +		if (i == POWER_SOURCE_AC && is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_AC)) {
> +			ret = apmf_get_dyn_slider_def_ac(dev, &out);
> +			if (ret)
> +				dev_err(dev->dev,
> +					"APMF apmf_get_dyn_slider_def_ac failed :%d\n", ret);
> +		} else if (i == POWER_SOURCE_DC &&
> +				is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_DC)) {
> +			ret = apmf_get_dyn_slider_def_dc(dev, &out);
> +			if (ret)
> +				dev_err(dev->dev,
> +					"APMF apmf_get_dyn_slider_def_dc failed :%d\n", ret);
> +		}
> +
> +		amd_pmf_update_mode_set(i, out);
> +		amd_pmf_update_trans_data(i, out);
> +
> +		for (j = 0; j < CNQF_MODE_MAX; j++) {
> +			if (config_store.mode_set[i][j].fan_control.fan_id == FAN_INDEX_AUTO)
> +				config_store.mode_set[i][j].fan_control.manual = false;
> +			else
> +				config_store.mode_set[i][j].fan_control.manual = true;
> +		}
> +	}
> +	amd_pmf_update_power_threshold();
> +
> +	for (i = 0; i < CNQF_TRANSITION_MAX; i++)
> +		config_store.trans_prio[i] = i;
> +}
> +
> +void amd_pmf_deinit_cnqf(struct amd_pmf_dev *dev)
> +{
> +	cancel_delayed_work_sync(&dev->work_buffer);
> +}
> +
> +void amd_pmf_init_cnqf(struct amd_pmf_dev *dev)
> +{
> +	int ret, src;
> +
> +	ret = amd_pmf_check_flags(dev);
> +	if (!ret) {
> +		dev_dbg(dev->dev, "CnQF bios default_enable flag not set\n");
> +		return;
> +	}
> +
> +	dev->cnqf_enabled = true;
> +
> +	/* Disable SPS if its advertised as supported, giving clear preference
> +	 * to user selection choices
> +	 */
> +	if (is_apmf_func_supported(dev, APMF_FUNC_STATIC_SLIDER_GRANULAR))
> +		amd_pmf_deinit_sps(dev);

I wonder if it makes more sense to explicitly init cnqf and "never" init 
sps if the case of APMF_FUNC_DYN_SLIDER_AC or APMF_FUNC_DYN_SLIDER_DC 
and APMF_FUNC_STATIC_SLIDER_GRANULAR existing.

My reasoning is that if the BIOS advertises both running init for SPS 
will cause a platform profile attribute to be created but then running 
init for CNQF will cause it to be removed.  This will then be a few 
uevents to userspace to create the files and remove them that could be 
completely avoided if CNQF init runs first.

> +
> +	amd_pmf_load_defaults_cnqf(dev);
> +	amd_pmf_init_metrics_table(dev);
> +
> +	/* update the thermal for CnQF */
> +	src = amd_pmf_get_power_source();
> +	amd_pmf_handle_cnqf(dev, src, config_store.current_mode, NULL);
> +}
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index a675ca969331..2cb7793d07cf 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -123,6 +123,11 @@ static void amd_pmf_get_metrics(struct work_struct *work)
>   		amd_pmf_trans_automode(dev, socket_power, time_elapsed_ms);
>   	}
>   
> +	if (dev->cnqf_enabled) {
> +		/* Apply the CnQF transition */
> +		amd_pmf_trans_cnqf(dev, socket_power, time_elapsed_ms);
> +	}
> +
>   	dev->start_time = ktime_to_ms(ktime_get());
>   	schedule_delayed_work(&dev->work_buffer, msecs_to_jiffies(metrics_table_loop_ms));
>   	mutex_unlock(&dev->update_mutex);
> @@ -262,6 +267,11 @@ static void amd_pmf_init_features(struct amd_pmf_dev *dev)
>   	if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
>   		amd_pmf_init_auto_mode(dev);
>   		dev_dbg(dev->dev, "Auto Mode Init done\n");
> +	} else if (is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_AC) ||
> +			  is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_DC)) {
> +		/* Enable Cool n Quiet Framework (CnQF) */
> +		amd_pmf_init_cnqf(dev);
> +		dev_dbg(dev->dev, "CnQF Init done\n");
>   	}
>   }
>   
> @@ -270,8 +280,12 @@ static void amd_pmf_deinit_features(struct amd_pmf_dev *dev)
>   	if (is_apmf_func_supported(dev, APMF_FUNC_STATIC_SLIDER_GRANULAR))
>   		amd_pmf_deinit_sps(dev);
>   
> -	if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE))
> +	if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
>   		amd_pmf_deinit_auto_mode(dev);
> +	} else if (is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_AC) ||
> +			  is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_DC)) {
> +		amd_pmf_deinit_cnqf(dev);
> +	}
>   }
>   
>   static const struct acpi_device_id amd_pmf_acpi_ids[] = {
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 0a72a395c2ef..db3c86c2e86f 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -22,6 +22,8 @@
>   #define APMF_FUNC_AUTO_MODE					5
>   #define APMF_FUNC_SET_FAN_IDX				7
>   #define APMF_FUNC_STATIC_SLIDER_GRANULAR       9
> +#define APMF_FUNC_DYN_SLIDER_AC				11
> +#define APMF_FUNC_DYN_SLIDER_DC				12
>   
>   /* Message Definitions */
>   #define SET_SPL				0x03 /* SPL: Sustained Power Limit */
> @@ -165,6 +167,7 @@ struct amd_pmf_dev {
>   	int socket_power_history_idx;
>   	bool amt_enabled;
>   	struct mutex update_mutex; /* protects race between ACPI handler and metrics thread */
> +	bool cnqf_enabled;
>   };
>   
>   struct apmf_sps_prop_granular {
> @@ -294,6 +297,94 @@ struct apmf_auto_mode {
>   	u32 fan_id_quiet;
>   } __packed;
>   
> +/* CnQF Layer */
> +enum cnqf_trans_priority {
> +	CNQF_TRANSITION_TO_TURBO, /* Any other mode to Turbo Mode */
> +	CNQF_TRANSITION_FROM_BALANCE_TO_PERFORMANCE, /* quiet/balance to Performance Mode */
> +	CNQF_TRANSITION_FROM_QUIET_TO_BALANCE, /* Quiet Mode to Balance Mode */
> +	CNQF_TRANSITION_TO_QUIET, /* Any other mode to Quiet Mode */
> +	CNQF_TRANSITION_FROM_PERFORMANCE_TO_BALANCE, /* Performance/Turbo to Balance Mode */
> +	CNQF_TRANSITION_FROM_TURBO_TO_PERFORMANCE, /* Turbo mode to Performance Mode */
> +	CNQF_TRANSITION_MAX,
> +};
> +
> +enum cnqf_mode {
> +	CNQF_MODE_QUIET,
> +	CNQF_MODE_BALANCE,
> +	CNQF_MODE_PERFORMANCE,
> +	CNQF_MODE_TURBO,
> +	CNQF_MODE_MAX,
> +};
> +
> +enum apmf_cnqf_pos {
> +	APMF_CNQF_TURBO,
> +	APMF_CNQF_PERFORMANCE,
> +	APMF_CNQF_BALANCE,
> +	APMF_CNQF_QUIET,
> +	APMF_CNQF_MAX,
> +};
> +
> +struct cnqf_mode_settings {
> +	struct power_table_control power_control;
> +	struct fan_table_control fan_control;
> +	u32 power_floor;
> +};
> +
> +struct cnqf_tran_params {
> +	u32 time_constant; /* minimum time required to switch to next mode */
> +	u32 power_delta; /* minimum power required to switch to next mode */
> +	u32 power_threshold;
> +	u32 timer; /* elapsed time. if timer > timethreshold, it will move to next mode */
> +	u32 total_power;
> +	u32 count;
> +	bool priority;
> +	bool shifting_up;
> +	enum cnqf_mode target_mode;
> +};
> +
> +struct cnqf_power_delta {
> +	u32 to_turbo;
> +	u32 balance_to_perf;
> +	u32 quiet_to_balance;
> +	u32 to_quiet;
> +	u32 perf_to_balance;
> +	u32 turbo_to_perf;
> +};
> +
> +struct cnqf_config {
> +	struct cnqf_tran_params trans_param[POWER_SOURCE_MAX][CNQF_TRANSITION_MAX];
> +	struct cnqf_mode_settings mode_set[POWER_SOURCE_MAX][CNQF_MODE_MAX];
> +	struct power_table_control defaults;
> +	enum cnqf_mode current_mode;
> +	struct cnqf_power_delta power_delta[POWER_SOURCE_MAX];
> +	u32 power_src;
> +	u32 avg_power;
> +	enum cnqf_trans_priority trans_prio[CNQF_TRANSITION_MAX];
> +};
> +
> +struct apmf_cnqf_power_set {
> +	u32 pfloor;
> +	u32 fppt;
> +	u32 sppt;
> +	u32 sppt_apu_only;
> +	u32 spl;
> +	u32 stt_min_limit;
> +	u8 stt_skintemp[STT_TEMP_COUNT];
> +	u32 fan_id;
> +} __packed;
> +
> +struct apmf_dyn_slider_output {
> +	u16 size;
> +	u16 flags;
> +	u32 t_perf_to_turbo;
> +	u32 t_balanced_to_perf;
> +	u32 t_quiet_to_balanced;
> +	u32 t_balanced_to_quiet;
> +	u32 t_perf_to_balanced;
> +	u32 t_turbo_to_perf;
> +	struct apmf_cnqf_power_set ps[APMF_CNQF_MAX];
> +} __packed;
> +
>   /* Core Layer */
>   int apmf_acpi_init(struct amd_pmf_dev *pmf_dev);
>   void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev);
> @@ -324,4 +415,13 @@ int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req
>   void amd_pmf_update_2_cql(struct amd_pmf_dev *dev, bool is_cql_event);
>   int amd_pmf_reset_amt(struct amd_pmf_dev *dev);
>   void amd_pmf_handle_amt(struct amd_pmf_dev *dev);
> +
> +/* CnQF Layer */
> +int apmf_get_dyn_slider_def_ac(struct amd_pmf_dev *pdev, struct apmf_dyn_slider_output *data);
> +int apmf_get_dyn_slider_def_dc(struct amd_pmf_dev *pdev, struct apmf_dyn_slider_output *data);
> +void amd_pmf_init_cnqf(struct amd_pmf_dev *dev);
> +void amd_pmf_deinit_cnqf(struct amd_pmf_dev *dev);
> +void amd_pmf_load_defaults_cnqf(struct amd_pmf_dev *dev);
> +void amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_lapsed_ms);
> +
>   #endif /* PMF_H */

