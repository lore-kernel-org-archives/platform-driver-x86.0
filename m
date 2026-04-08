Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011001.outbound.protection.outlook.com [40.93.194.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CBC1DF27F;
	Wed,  8 Apr 2026 17:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775669971; cv=fail; b=FHNyIlur8M47xPi6L08vLBKJmcbw9DY1OMO2w7eBHNgIhbdiiHtBHcpn6V3nGjAwl04sDE8vK8jYhP/9j4oexGzxkSJ280N/ir9tA0/074GJ2QP8O6sJD5t5yPDUqEI+pQagelsp4Y1gpTUR1Z/5L5io94jYOFiD17eKuONLvv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775669971; c=relaxed/simple;
	bh=6gV/+/9xF8GxvXcWg//bcNurpxyioOmuUkWnd6X4t98=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cHqOdUZUjlfbeWO3GzVB16pML8rpUlttEUsngnkSgRafOhcmCrwUH1NnLhPKBxkZ6UdYhRpCJN7i5dfV1N3Kyls/9/AOdPP3LsYLFcTnGHuzwGa8Oc760RgsQYWysYr+uAzte9HCgH1YZhdEw2Bgi2onn/A9xo785+n4988ueM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JlxUcxj2; arc=fail smtp.client-ip=40.93.194.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JlxUcxj2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GvGwlmXreCU4tqydsdqzVGD5/C/29WfO8H04FibmB4SnwklubdD/GbUBK3rKOMucEngcl99GofUW7Y5jFVTWjIZk3cjkrExa7LlHzi9yk0XxnG8EIQxhHFngeb9kzxxyNmw4+WIR5dC8UvYmxqB3bVKMWDcjoWzapzRSUX2lhVuP7Vth0Z4FdHSA7b30+VgiznSIHMyVbVhL7ASn+VC74EU/Ab12s3r/zbpKK8k71GnBS2V4Aef7Xp5cbTIad7Pf5vWJ8z7ytAYvPpPhIljjDthi3eFFdIWiUq2phWDA8CHurtmmzSVhoJHHR4ZQMwPCDk+jHS3yeqxftqyTN+sikA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MvcjNpe9zKAb6CXH8jUoiDux5OWlmNZ2F8gnM78A/n8=;
 b=TUP0onEkTuRgV7rA+OcVGFzKibLX7/mvy4D75qtK/8z3t27EG4AE4IHWo9AFhBNTbzsf2TbgE8s/43sPR6tqDSSmiqtryEfkOCqeFdFkyKBGYIn7DDl+JplVhOyxlUQE9C6bWlYL620AO3tFEHpD1bQW/nwthAoEsDFMF4GofYYunkmfFvbPQ8lMlBjnkHhtge89FRnh3IIs4eZ15Z17E9mQrjmi1bvJWQzTvB/YK0FSHTnXoo+aohaonxlZR3kHqV9mHi6j0KSGxly8OKkrQ5wAEtomnw2t90yZJmslt4G/ceQTdYpNey809bexClwC6DR9lhDZT8VS5qnwN/vcCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MvcjNpe9zKAb6CXH8jUoiDux5OWlmNZ2F8gnM78A/n8=;
 b=JlxUcxj21R8v3rxi0D2MjA+qwlrhAkv6v3X7eDW0c2J9FKnZgESYKx6e8bdafNVGnfVBrIPj3HjL7PpUHCSRp1PcyGxwJotzifvUNyzEwropBHINiDo2VnBR1ZCOXr+gdnnc1iidAfHLm2AGTs0s7udyZwf6SZL0Jf3MbU59hCE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by CY5PR12MB6154.namprd12.prod.outlook.com (2603:10b6:930:26::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 17:39:24 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287%5]) with mapi id 15.20.9769.018; Wed, 8 Apr 2026
 17:39:24 +0000
Message-ID: <2fe57ce7-a581-417c-9662-b2618b4c0acf@amd.com>
Date: Wed, 8 Apr 2026 12:39:23 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: dell-dw5826e: Add reset driver for DW5826e
Content-Language: en-US
To: Jack Wu <wojackbb@gmail.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260408111738.232040-1-jackbb_wu@compal.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260408111738.232040-1-jackbb_wu@compal.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0138.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c2::27) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|CY5PR12MB6154:EE_
X-MS-Office365-Filtering-Correlation-Id: e15f8505-f1cb-4a28-f39a-08de9595c65a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	dFg5pSmPgd+5iwCt6fCcnGk0/L/i4YKBPLJRj9DQAFtn7la6tVRf6dIN2Mr/0iCObN4RiP9Ss2C/mGnzoXK0O3v2dgocfWh2TNKuNa4RQ5JFEYr7iiQgsdGk6TIFjSLKkDVFR3pNH5XxzfSauDCysT7mBGuqplMgmsJfK5e2FRuLzanCefayi5yq567q1kHo6JAAINS+e1wR5uf7CrVzTDCH2JOgmvMpb4056re+LLw1rBufyJUzNOsMbjjoIK+8SsramMshqXODs+lbZNfi0mH1QYQuh5Zz5XmCWe30gg2YehvbQpr+kmh+rPUGWDEIjMNh5N8g0b/0D7XKMedGZmgProaWmRB3P2V2GFqtouR4yXLcFCjGcZz3QAN6lx12bC7SURACRmVsZMe2fOZ5bazuRjYzmbmFdhJ7B6fbEwYNm2cRoBxl0+NAox80pWlqRAiU76CagVlsQvUVbXwsnNJWelaYgqgKGs/QqUvhmAVQPgF/nC/PNiJteLopcGS/fnJftOflTxwn54sbRPw7MNxIaXyRMkm/hSqW1RjKOQY/c+MbxiZ1Mcyv14YpGgm2jcal3wD2F34AI3g5LEwIhSQG5QNT4UBzpkq1dSRhlnNFyEG2qBzYMwCA98V4cMCPGv697R3hPfySq1nTgcSUEUojKEZ+dOkmHVvJ9hb+qx1FOZGrKB4HdaRkgOVE7ILwXE6END3XF3K3cuPKU5cCObs8wTAufniGJmuvTlfxEfo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2RoZGFDUDVkaXhxcHI4VERkaEdTNmZpYW1iNEJIbU4vcEtBbjJYWXE2MDRh?=
 =?utf-8?B?YU1qczgxSmdSbG02alB3MUliZ29ubjltcXFFQ1M4dVhxZVZ0WjkzdDdVV1JS?=
 =?utf-8?B?YVRxR3RKKzNOcWdVSG1DRzFSaVh3OGxLZmNBQWZzZ0lVWW5Zd0dWWW9UYjZs?=
 =?utf-8?B?TmZIM1E2QjVubUJTdUJOUUdGSVlWcThLRHFJTzAyQ2VsNFRFU0NmREFTVFVK?=
 =?utf-8?B?SytmcGhuRGE2WkxqeFlrc3pBdC9Rd3NjVjZObVhKVmk2UGdXK2lWc1Vpc29K?=
 =?utf-8?B?cUJoQ2thQkdrY2lDSjlJbDR1WExjV2VBM1o3OEFwZEtPbGI2QnZrL0NyWjQx?=
 =?utf-8?B?dUR4RnBza1ZDZ25DODI1UVJTd3NwYlZLU2RGaXFmVFAyL1M3bzBFTGhpUkt0?=
 =?utf-8?B?L085WnMvOTNFbmh4L1R3Nk1RQlErcG5jWm9ISXA1bVdQd2lzRnBvVHpQSUdm?=
 =?utf-8?B?TVduNjRCYjJEMEc1cGFwOUZrNW1jVnE0WnNBcDdkaEdra25wUEJpVVg2V2lk?=
 =?utf-8?B?ZnJ3Z045dFRYUGswZUhxUmtaVnQvc2lwTFdTOHQrZVRWRGJjV29kS0o3NURG?=
 =?utf-8?B?cllqa2dlaE9TYy95RHFCK2VJYlBNYnV3ek9LQys2MFlpUHk0cEJRTHk3MnFl?=
 =?utf-8?B?czM0aUZka3RpNHdOSUUxdG1TRVR0NnVtR0FabTN0RVp4dFIvTmpIUW9qTGRz?=
 =?utf-8?B?czI1QzVKbzZIdlhjSW5PY3FBanJOTmw4SmtkWlppNWZqcm5idGRqRXR1UGk5?=
 =?utf-8?B?UjBBWmNMOTg5RDBVbnVSUEFZeVpOUnY3MlVqUlBYVDhrbXNmS3R6ZXlrRFVJ?=
 =?utf-8?B?UnRPQXp5VURQMzhYMWZMTVFHUGlibE55cWNzcmNISzUwUkxlbThsYkcvUnNm?=
 =?utf-8?B?SG1hRDVZMHkrMXRIS1NQSWRzSkV3VDYxVVpSSHVTcjNSQ3o1RE44QklQN0hF?=
 =?utf-8?B?RFRjcGhwaUNOcTdGK2xVWGo0dTRuU0hDQ0h0SjdxWkl3dEJ1cDBiTzFKajhZ?=
 =?utf-8?B?VnIwY1BnQ0VHYXMxVG1FNkh4OW13U1pqY0t5NEFTVmp3SllzcVNSQ1hueXVs?=
 =?utf-8?B?N3VvY1FJV2txSGtpbjlKYmxrVEJkKzJnOGVrMnZlZjNvUkxaaTNMSjcrQ3hj?=
 =?utf-8?B?ZmZHRFlMME1XTkllUHF3cGljaUI4N095VldOWk1zekNZZ2RJcUxMQ2swYnYx?=
 =?utf-8?B?amtmMkV3MW1Mb3hEam81dVRkM0tpd0JWUlo0YTBFKzRBaVQ0SDRQNkM4SFVQ?=
 =?utf-8?B?REFwWE9Wb3AwYlJ4VmZmcG4wLzFiL3VQd0xTSHVHNEtXajU2ai9qQXpNK1Vq?=
 =?utf-8?B?UG5mWFhXbTJFZWQ5RlJtTGwvTUF1Rjh5bHg3aFlWbjhoUXlCMGZTYkJua2o2?=
 =?utf-8?B?U3BoMEk2bUFoMWt3dStkanVHSUxCaTcxTGxYbXI4d1ZmQkJ4ejR1ODZJNUMz?=
 =?utf-8?B?c3UvVjh4L0ptbDRPemxGdkdSRzFuTWpVK0I1eDhWdDNlWDhGbWdSZU1YMjMr?=
 =?utf-8?B?bnpSRE1HZzBjVnVYVUg2NVVKWlA1NkhmdGNDY0RnMXhyNU5ONDlRdjBmQldl?=
 =?utf-8?B?VnZFd2lDVlkxN0JZbm81WUxIbHUwRXhpYlA4a010b1dBc0V1dlY4Nis0bFpW?=
 =?utf-8?B?dW8wSGdpMjFPcDlSUk1PVjRiTDJMUndjMVNXRW5oUXQvdVZrM1ZFU3V0TGVq?=
 =?utf-8?B?YTRSc1RBd1dLTFRNbnQySWxoOUFtdHVKMEdEeWpMUXl6WWthcnpRcmxVZnJF?=
 =?utf-8?B?Sk43dVloaFBteWFRTXc3QTh3blZuSUlJVFRBS3c0MC9zQUgrTG9wTDFlWGZn?=
 =?utf-8?B?aWJ5QmtUa0lLSTJna2kxazZhaUkzVENUUmE2MFNFSlB2WFIxcXgwN3JpaWcz?=
 =?utf-8?B?dEM2WlBhNVF1dUoxeDhSL0lCbDZvbGIvQWRhNjhVc3BHZVVCeHIzdXFIWjF3?=
 =?utf-8?B?SUtRZEpPR00yd21uZkdCbFhyOHhsbjBVdzdMZGhSZkY5VWt1b2YrR1VvaVJF?=
 =?utf-8?B?elNHbldxMkhJMWkvV0p4QmtIWmlTS25iMHJMc3JzRmQ3TTVhZEdtWEZEd1Ir?=
 =?utf-8?B?VStwMWhZUS8zc3V4Y2FGUDJkcFBUajM3MklQTmdsWlZ0bkovY0s0NG5EeGRu?=
 =?utf-8?B?aDdWOW9kbGFoWDhYd3h3THoxQ1hBVUM0NlRWUURBLy9qWllSQ2FVa0xyMzda?=
 =?utf-8?B?QmpVRXRjSWZ1YTNuRE5kWXRtaFh2bFUxMGJsYnp3NXlEUEFwd2kyVTVKeXVR?=
 =?utf-8?B?b2U5bTZnWFZrdFBFaWpUS25PTUY5eHZsbERxYlNSZURsSWliUHJpbjlEdy9o?=
 =?utf-8?B?WGI1RE1CWEcrYk5YeVgvMWtpdURwZ1c0UU1tejIrc0xxdnVFcElVZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e15f8505-f1cb-4a28-f39a-08de9595c65a
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 17:39:24.4603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3q67D2Ac+C1tBD7P+0UpN3s0uvcog02N+BS7wacQ9Jj4zlHD+TutWKlpy58aw/iKvRfg93Ikjk+ItAwE3aEsqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6154



On 4/8/26 06:17, Jack Wu wrote:
> [You don't often get email from wojackbb@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> If the DW5826e is in a frozen state and unable to receive USB commands,
> this driver provides a method for the user to reset the DW5826e via ACPI.
> 
> Signed-off-by: Jack Wu <jackbb_wu@compal.com>
> ---
>   drivers/platform/x86/dell/Kconfig             |   6 +
>   drivers/platform/x86/dell/Makefile            |   2 +
>   .../platform/x86/dell/dell-dw5826e-reset.c    | 120 ++++++++++++++++++
>   3 files changed, 128 insertions(+)
>   create mode 100644 drivers/platform/x86/dell/dell-dw5826e-reset.c
> 
> diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/dell/Kconfig
> index 738c108c2163..c4540c837a88 100644
> --- a/drivers/platform/x86/dell/Kconfig
> +++ b/drivers/platform/x86/dell/Kconfig
> @@ -276,4 +276,10 @@ config DELL_WMI_SYSMAN
>            To compile this driver as a module, choose M here: the module will
>            be called dell-wmi-sysman.
> 
> +config DELL_DW5826E_RESET
> +       tristate "Dell DW5826e PLDR reset support"
> +       default m
> +       depends on ACPI
> +       help
> +         This adds support for the Dell DW5826e PLDR reset via ACPI
>   endif # X86_PLATFORM_DRIVERS_DELL
> diff --git a/drivers/platform/x86/dell/Makefile b/drivers/platform/x86/dell/Makefile
> index c7501c25e627..8150283cfd1d 100644
> --- a/drivers/platform/x86/dell/Makefile
> +++ b/drivers/platform/x86/dell/Makefile
> @@ -28,3 +28,5 @@ obj-$(CONFIG_DELL_WMI_DESCRIPTOR)             += dell-wmi-descriptor.o
>   obj-$(CONFIG_DELL_WMI_DDV)                     += dell-wmi-ddv.o
>   obj-$(CONFIG_DELL_WMI_LED)                     += dell-wmi-led.o
>   obj-$(CONFIG_DELL_WMI_SYSMAN)                  += dell-wmi-sysman/
> +obj-$(CONFIG_DELL_DW5826E_RESET)               += dell-dw5826e-reset.o
> +
> diff --git a/drivers/platform/x86/dell/dell-dw5826e-reset.c b/drivers/platform/x86/dell/dell-dw5826e-reset.c
> new file mode 100644
> index 000000000000..28865a123c63
> --- /dev/null
> +++ b/drivers/platform/x86/dell/dell-dw5826e-reset.c
> @@ -0,0 +1,120 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + *  dell-dw5826e-reset.c - Dell DW5826e reset driver
> + *
> + *  Copyright (C) 2026 Jackbb Wu <jackbb.wu@compal.com>
> + *
> + */
> +
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/acpi.h>
> +#include <linux/miscdevice.h>
> +#include <linux/fs.h>
> +#include <linux/uaccess.h>
> +
> +static guid_t palc_dsm_guid =
> +       GUID_INIT(0x5a1a4bba, 0x8006, 0x487e, 0xbe, 0x0a, 0xac, 0xf5, 0xd8, 0xfd, 0xfe, 0x59);
> +
> +struct palc_dev {
> +       struct device *dev;
> +       acpi_handle handle;
> +       struct miscdevice miscdev;
> +};
> +
> +static int trigger_palc_pldr(struct palc_dev *palc)
> +{
> +       union acpi_object *obj;
> +
> +       dev_info(palc->dev, "Triggering PLDR via ACPI _DSM Function 1...\n");

Besides Ilpo's comments - this is pretty noisy.  Do you really need to 
output to the logs every time it's triggered?

> +
> +       obj = acpi_evaluate_dsm(palc->handle, &palc_dsm_guid, 1, 1, NULL);
> +
> +       if (!obj) {
> +               dev_err(palc->dev, "Failed to evaluate _DSM\n");
> +               return -EIO;
> +       }
> +
> +       if (obj->type == ACPI_TYPE_BUFFER)
> +               dev_info(palc->dev, "PLDR _DSM executed successfully\n");

Doesn't this mean it be a failure of obj->type != ACPI_TYPE_BUFFER? 
Presumably you need to set a different return code in this case so the 
caller knows.

> +
> +       ACPI_FREE(obj);
> +       return 0;
> +}
> +
> +static ssize_t palc_write(struct file *filp, const char __user *buf, size_t count, loff_t *ppos)
> +{
> +       struct palc_dev *palc = filp->private_data;
> +
> +       trigger_palc_pldr(palc);

You're ignoring the return code.

> +
> +       return count;
> +}
> +
> +static int palc_open(struct inode *inode, struct file *filp)
> +{
> +       struct palc_dev *palc = container_of(filp->private_data, struct palc_dev, miscdev);
> +
> +       filp->private_data = palc;
> +       return 0;
> +}
> +
> +static const struct file_operations palc_fops = {
> +       .owner  = THIS_MODULE,
> +       .open   = palc_open,
> +       .write  = palc_write,
> +};

Given this is really just triggering an ACPI method and totally ignoring 
user data, maybe a more trivial sysfs file using the various macros is 
useful here instead of all this boilerplate.

> +
> +static int palc_acpi_probe(struct acpi_device *adev)
> +{
> +       struct palc_dev *palc;
> +
> +       palc = devm_kzalloc(&adev->dev, sizeof(*palc), GFP_KERNEL);
> +       if (!palc)
> +               return -ENOMEM;
> +
> +       palc->dev    = &adev->dev;
> +       palc->handle = adev->handle;
> +
> +       palc->miscdev.minor  = MISC_DYNAMIC_MINOR;
> +       palc->miscdev.name   = "reset_palc";
> +       palc->miscdev.fops   = &palc_fops;
> +       palc->miscdev.parent = &adev->dev;
> +
> +       if (misc_register(&palc->miscdev))
> +               return -EINVAL;
> +
> +       dev_set_drvdata(&adev->dev, palc);
> +
> +       dev_info(&adev->dev, "DW5826e Reset Device (PALC0001) Driver Loaded\n");
> +       return 0;
> +}
> +
> +static void palc_acpi_remove(struct acpi_device *adev)
> +{
> +       struct palc_dev *palc = dev_get_drvdata(&adev->dev);
> +
> +       if (palc)
> +               misc_deregister(&palc->miscdev);
> +}
> +
> +static const struct acpi_device_id palc_acpi_ids[] = {
> +       { "PALC0001", 0 },
> +       { "", 0 }
> +};
> +
> +static struct acpi_driver palc_acpi_driver = {
> +       .name  = "palc_reset",
> +       .ids   = palc_acpi_ids,
> +       .ops = {
> +               .add    = palc_acpi_probe,
> +               .remove = palc_acpi_remove,
> +       },
> +};
> +
> +MODULE_DEVICE_TABLE(acpi, palc_acpi_ids);
> +module_acpi_driver(palc_acpi_driver);
> +
> +MODULE_DESCRIPTION("Dell DW5826e reset driver");
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("JackBB Wu");
> --
> 2.34.1
> 
> 

