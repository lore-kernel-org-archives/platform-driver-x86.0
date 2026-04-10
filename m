Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012045.outbound.protection.outlook.com [40.107.209.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69561347FC8;
	Fri, 10 Apr 2026 13:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775827950; cv=fail; b=b/0pDEM9z4636GJn7FIzjw/6JVAsSrMZqlReZCJYlE5WHcTzzxiR67dG2/ffAj5p3gGThBebghgnlm06sIrjmGmyUORQ7KIVic4B0DHeeuwyd9445FaA7xTuh+zumURgkI6baoERVHT210fh5W1gTBqu52DIRkQSJDu4KWBcoJ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775827950; c=relaxed/simple;
	bh=Pw0NwjOIOCkd+mu9TOnOo6zxwmSgEglsPjRz8KricJI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gvEqfbvHKzVav6YusvuLeisVbue2poPKfUSueeCJgt4USYqRVFb/gc5UHw/gK291R0RbEw2Vy+2qUQiF0Pgjb73P6nIytk9evJOtBWyAGM66SfdNxbED8EUNxEga6U0xzscRPWTme7cO7NN/eyDlYunUiBucX09VSPaNnLwcbvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UyHxcqOX; arc=fail smtp.client-ip=40.107.209.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UyHxcqOX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rTeQBB8fkUQM7gSWfEoPtddcI/JYXeUHCE+XAyJv3J4Y6nfs7XF5R5tMZk6BKKBIeeXvvGpBXhPKV9h/gIS0Q3dUO8sM+6hYSN3vu8lkow+fNpp6mx+xeKKs5ividdvIMQFr19gQrsCARmzTPjNgClWWoLNsT+dzVrB6ai6wKTZcwKkIi2Dt9laVN5Bg1fJ/NIl3tpdGQQ//korItr/39+x9l6pIFTgIn66O+XnSa2z5bMt3rVwIv8EGRDHubf7Wo2i+uxye7J7leW+qkW3qmD+7Wc0LhaqCIr9arfQ1H+e0d+BJQOd32LY99yfX7gwcG9UhaI+t3q3o4QGaUxFXRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0YjSyy3pARy9FBHxC0gbdesxi15IoB7gv3utpeva+Y8=;
 b=kU00PWL5VOK0yvI0g4kpQcxQ/Z3wwZ6jD6r8mBEv56pCIv0AcwzxFVkMJFX+/sGXIOKbgCBPVNesso/abEKKTaGzWv5lyAmUc91MtqpIRNfTkqUDNiIFxYTqmlRGZ24dwSLa4fuXJdSGITlQ9EQkZQWj40pLT0yFwWBM3Z+tFI67QIDYwouCgN3zBs3Zl4l0Brwzbzp+cNGJHh6aV34VY9WRibCnBgFseBQynkSyx+9sDSZHvw8IRO64yB1ofhIr+4XoGD2U4D5JjIz6272HQRPg3W5BlREH6IA9ClacqmNAQY6gucfeYAlOy2IguoO/e4Q04HZrm5SDclwNlxFcdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0YjSyy3pARy9FBHxC0gbdesxi15IoB7gv3utpeva+Y8=;
 b=UyHxcqOXDz6ei3h8BRfncJMXdRLzMfgXN3+Xo0DeOp+mNhXBTxJ4ixiMSDufmBqzwaizDQ9JgU6TCvRiw7leLvsVebz3STR5a+M4eRohHqodlr/mC43H3JGDw/cizsSbWyuI2ugZVRZ9Xf6wrZ+EDvv1J2bWdNcxOpPVXP3uwNM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by PH8PR12MB6769.namprd12.prod.outlook.com (2603:10b6:510:1c4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Fri, 10 Apr
 2026 13:32:26 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287%5]) with mapi id 15.20.9769.041; Fri, 10 Apr 2026
 13:32:26 +0000
Message-ID: <2e8281d7-ce55-4466-9605-a84fc79007f3@amd.com>
Date: Fri, 10 Apr 2026 08:32:25 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: dell-dw5826e: Add reset driver for
 DW5826e
Content-Language: en-US
To: Jack Wu <wojackbb@gmail.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260410093752.298067-1-jackbb_wu@compal.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260410093752.298067-1-jackbb_wu@compal.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0078.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2c1::25) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|PH8PR12MB6769:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d4aee08-ae46-416c-c118-08de97059b1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	t/akV5bFoWSJT08WbC6ZpM5BMQJ4gWIYJCSFE1qrD3JMy+X3FvCqrnbYJHm84LmUktbiegGU8oB1mpFh+ue5PGRFvB4HnXuP6Cmfl0c4ZBRkIVIU2OU/YFgHtVRKm247MCLAr57m3pxTRxzL/Vt4iGWfIpqf/2fnzULThApxrPNWYHjFSOkyqF+OlLph5TeCxvwwv61WS1Q/mmYDq4aH3JLNWaV1Sn5uFybYoivMBty5VIMgCQFeFi3KUKFuYnCGyeEZz4qcE/Ex21qFFAeKaL0zyRPs2jHgXWFCyR1W3CIKqwLtVJNNCDCGT1h3e9El8cBX5a3wKvpa0RNSP6YtAyzXReT0BuSJnXf/NCey6zBjUpLvRggaFh0tuLo+A9q0qXjWq1Zh+oHbweFmMDG8dgl5bBspy5/Y8s/o3FLOTjYIczROE0DZPPgjVHKtEYVTCFMbD3qPdFC9H99t0Oes8vtSEnArV+ItJDJ3Q2aQUbhfWeBH7rNsm9BDXyGblqiuix5gS0fMAUkupw5d/34X0Syhqptv6lpLFkyGyXR583i8I0A3aHbCmL1vHrVWUehPnjL0C1oY9EDvzPPV39whgrZAtPobqJlYbsgRQzWybsGLh8mG0yujgPuNgXC1c4MfbYjQ4KL0wRZr4ZAl5Z9rlxBMdrhQwe/IU86tVhQxhOOQfe0hLHZbpS8cW7lFF854ppVYcO2WH084pUnsjpBF1lCGBgmkyMVN4eXDg2qrznE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXpUYlRQOTdxUkJXMHJzSDEzQnhLNTFONkhQdUozbGd4L2ZxUi9zZTBqd1RO?=
 =?utf-8?B?NWNKQmtDQTZtRjU5TVk5R0VaZUhoNzIyYlJ2ZUdMZXBFVnVpeGI5blpsdXU0?=
 =?utf-8?B?YUp2bG5DampIY3AwUFVKZUFYWm5XTmZwZ3dFNG5Ic2JBazRIVnViM1lmQkdU?=
 =?utf-8?B?ckN3QkFSZGlicHdGa2F1WUVQTHZlR2VrVWFmekpWMTMyL2hxUzBudFBtNFkv?=
 =?utf-8?B?YXRnTmhXMWNsdThaNGx1ZmNMTjdJdkZTVk9iZlBxb2tOQ2VIa0ZMOW94SmZa?=
 =?utf-8?B?bmVFTWRMMEl2YTJ3OTdGQi9GOHhXeklMQWhpbUdpbjJMOTRmK1E1OVpYN3No?=
 =?utf-8?B?bmNaSzcrd1VVK25TMzhqZEpSR0E0Y2k3M3FvMXFYNldaRVZFVlBURjYraHRa?=
 =?utf-8?B?MTFYOGVJV05tTTBvYnh2ZlI5YjB4enRzY1k5VmM1c05iT2Vsc0d2aDYzU2tU?=
 =?utf-8?B?M2lPWW04VjdKVHkrNG1tOEthdVZJeFJrNkd3OWthOTBFWG1ZdjcvcDYzRmNO?=
 =?utf-8?B?WEV6blEwU2p5VkoxZWJFK1k4VWQzVHNoUWJmdExITjhDMk14dEQ5c2s0cEU3?=
 =?utf-8?B?eU9MLzhQUDVubmx1bkpIMHdlK3FZTytqTDh1aTJVQjBWWWZFWm1VTVNFc3pE?=
 =?utf-8?B?QXpOWFU4UXE1VzhVZXVIWGRHazFzL0ducWRjenlvbjgyLzFqRm9HRjd0Smtj?=
 =?utf-8?B?Z1AzSzNwMVRsdUE2MW04dXBOTnNLL0dHdVNrNEY3RVh1SG9WNEg2Q2RNcm00?=
 =?utf-8?B?clk3WXVsejltNlZGcVdVVGVaMmNZWFN2RzhheEN3M2loa3FkMnVyOFMyaDRU?=
 =?utf-8?B?QnZlQ0tMMVZSTTdxdjZncjFxcms2WTB2S0F2VFZTejl5RlBpMGxJOGR6RmR5?=
 =?utf-8?B?ZFlWMDQzZnQ3M0xMd1hmUmN4U0FZcXNabkJLS0RQNlZWSmd5STh0a2RjRk9B?=
 =?utf-8?B?YmdIREZPOCtZUklWWlJyVFlpcU1TS0kyYkxCN3NGa0VLSVBQaTJkOGlJbkZO?=
 =?utf-8?B?aTkxdmhFRjMyNHp5WlZFU2VEdWcvZFlycWI5ODN1dnYwWERUczhWTjlDcDRR?=
 =?utf-8?B?QTBxYVBOQ01vcVN2b3BLeW5ZbnB1dmkrVklEQ2RtVFUrUzIxV2FjNEExaGds?=
 =?utf-8?B?REMyb1pOMTRZWDYzbER1OFZSekRYQ012a1A5WmR2Q3hlUGRjS1I2a29oNlFk?=
 =?utf-8?B?NDhhaXVtc2lDRW83RXRLL1hSZ0t2L0krS3orQ2dZVElFNWprMFc2M3E2V1Qv?=
 =?utf-8?B?OGNsd0pIQzRsNEd2UDdtdGVMcFBaWEtPSTNnVWZYaWo3RVBFSFJOSWZXNFNq?=
 =?utf-8?B?WVprMzdGSDhaMnlpcDlDck93emJBaU55U2UzUzFJckZ4MFp1RUpubHlkSmkx?=
 =?utf-8?B?Rm92QXU1ald4dUE1Rzh3NURWOVlraVNJNFQvUWkyUUpxOHNTdVhIR2ZNK3Q1?=
 =?utf-8?B?K3F2KzB1RytCejI5SlhqR2IvVUVWSTZONW0rSTdOejZGYU50M1dWVnBwcVdH?=
 =?utf-8?B?NlpDWXBLWWVlY0ZBZCt4VjI4RGljQ1ZiTHZtTnV5cUhoZGYwODgvT2FKWTIy?=
 =?utf-8?B?WXR6ZWI0YVBvek8xV1hWQzNGSHR4SWM3REt5UUlXcE0rYll3a0hobC9ORU1W?=
 =?utf-8?B?Tlcwd2VqTjMwS2ZwSEF0ZUg3WlNVcFRzcjgyQWR6Z0Q2MWs4MWJTbXBsZmxK?=
 =?utf-8?B?UWdPdDErWnMzUXM0WmtUYzV5Z3YrNG5nenBSVWI2cTltVVVoV1FaUGZIcmdD?=
 =?utf-8?B?elFEY1ZUOERka3ZEQWFUUHhzTFRhNi9uY25qY005OHVxbHBpWXpFZ1FBOHVs?=
 =?utf-8?B?T01keUFuS29qemZHZVdWVlRLbVEvbktEU2ozbGswdW5BRDZ5YlNISjlleEpz?=
 =?utf-8?B?L2FrNnpza0VWc0QvN2NJNnAwaHJ4cmlsTlZzMklqcDdjdWNKZVFGTTd4RC9v?=
 =?utf-8?B?K21NTHhNWWFHUzE1T1ZIU3A5eXU4RlRvRjFQU2hQQXhZSDB2K3lmSHBERUJj?=
 =?utf-8?B?T21sMFZmb2NnQ3pQc01POU5iYXE3ck00eW9adVYzZ1hxVlFHUjVOQ0tWT2pl?=
 =?utf-8?B?UmVaNkxhU0tFRE8rU0dJekE5S3l0eHdmSTlmeEo1SitEZ3F5amdxK0RaRnRC?=
 =?utf-8?B?ajVNcEZSeitlOUxVdWZTTlgxTWZoalB1cTRnaGptWHhIekY2UHlSVTdQZVZs?=
 =?utf-8?B?OWdCTjlNS3Y3U0JmQ1FDWGZMcVZmVjNzeXBSa1U2d09KTG1tVEVES2NyWHov?=
 =?utf-8?B?TTNSaDMzUGhJeUVqdzIvZlRpRE42R0I1TTVhdU9haS9WWTg2VTVEdTF0MlYr?=
 =?utf-8?Q?SolaojBtBXBi7bpo8H?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d4aee08-ae46-416c-c118-08de97059b1b
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 13:32:26.7393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IFoAf5sx44GRSHulxl9IJeObcqfCohIiBHIHpxX5M1hGjcv0cComsruQHukd16QD5JriYoQGluX5vDQhCqSSmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6769



On 4/10/26 04:37, Jack Wu wrote:
> [You don't often get email from wojackbb@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> If the DW5826e is in a frozen state and unable to receive USB commands,
> this driver provides a method for the user to reset the DW5826e via ACPI.
> 
> E.g: echo 1 > /sys/bus/platform/devices/PALC0001\:00/pldr
> 
> Signed-off-by: Jack Wu <jackbb_wu@compal.com>
> ---
> v2:
>    - Remove extra empty line
>    - Add missing includes and Remove unnecessary includes, sort includes alphabetically
>    - Remove noisy dev_info()
>    - Handle obj->type != ACPI_TYPE_BUFFER as error with proper return code
>    - Replace miscdevice/file_operations with sysfs attribute (DEVICE_ATTR_WO) to reduce boilerplate
>    - Propagate trigger_palc_pldr() return code to userspace
>    - Convert from acpi_driver to platform_driver
> ---

Generally speaking this looks much better.  The only thing missing to me 
is documentation to go with it since it won't be obvious to a user what 
the "pldr" sysfs file represents.

Also in that sense - if the ACPI PALC0001 device will always represent 
WWAN reset, then maybe the sysfs file should also be called wwan_reset 
instead of pldr (platform device reset).

> ---
>   drivers/platform/x86/dell/Kconfig             |  6 ++
>   drivers/platform/x86/dell/Makefile            |  2 +
>   .../platform/x86/dell/dell-dw5826e-reset.c    | 83 +++++++++++++++++++
>   3 files changed, 91 insertions(+)
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
> index 000000000000..52002578ed68
> --- /dev/null
> +++ b/drivers/platform/x86/dell/dell-dw5826e-reset.c
> @@ -0,0 +1,83 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + *  dell-dw5826e-reset.c - Dell DW5826e reset driver
> + *
> + *  Copyright (C) 2026 Jackbb Wu <jackbb.wu@compal.com>
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/device.h>
> +#include <linux/uuid.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +static guid_t palc_dsm_guid =
> +       GUID_INIT(0x5a1a4bba, 0x8006, 0x487e, 0xbe, 0x0a, 0xac, 0xf5, 0xd8, 0xfd, 0xfe, 0x59);
> +
> +static int trigger_palc_pldr(struct device *dev, acpi_handle handle)
> +{
> +       union acpi_object *obj;
> +       int ret = 0;
> +
> +       obj = acpi_evaluate_dsm(handle, &palc_dsm_guid, 1, 1, NULL);
> +       if (!obj) {
> +               dev_err(dev, "Failed to evaluate _DSM\n");
> +               return -EIO;
> +       }
> +
> +       if (obj->type != ACPI_TYPE_BUFFER) {
> +               dev_err(dev, "Unexpected _DSM return type: %d\n", obj->type);
> +               ret = -EINVAL;
> +       }
> +
> +       ACPI_FREE(obj);
> +       return ret;
> +}
> +
> +static ssize_t pldr_store(struct device *dev, struct device_attribute *attr,
> +                         const char *buf, size_t count)
> +{
> +       acpi_handle handle = ACPI_HANDLE(dev);
> +       int ret;
> +
> +       ret = trigger_palc_pldr(dev, handle);
> +       if (ret)
> +               return ret;
> +
> +       return count;
> +}
> +static DEVICE_ATTR_WO(pldr);
> +
> +static struct attribute *palc_attrs[] = {
> +       &dev_attr_pldr.attr,
> +       NULL
> +};
> +ATTRIBUTE_GROUPS(palc);
> +
> +static int palc_probe(struct platform_device *pdev)
> +{
> +       if (!ACPI_HANDLE(&pdev->dev))
> +               return -ENODEV;
> +
> +       return 0;
> +}
> +
> +static const struct acpi_device_id palc_acpi_ids[] = {
> +       { "PALC0001", 0 },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(acpi, palc_acpi_ids);
> +
> +static struct platform_driver palc_driver = {
> +       .driver = {
> +               .name = "dell-dw5826e-reset",
> +               .acpi_match_table = palc_acpi_ids,
> +               .dev_groups = palc_groups,
> +       },
> +       .probe  = palc_probe,
> +};
> +module_platform_driver(palc_driver);
> +
> +MODULE_DESCRIPTION("Dell DW5826e reset driver");
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("JackBB Wu");
> --
> 2.34.1
> 
> 

