Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012013.outbound.protection.outlook.com [52.101.53.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E175945D5FC
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Oct 2026 14:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791816845; cv=fail; b=eBiyHduPDTNGnRAw4xHat9b1ygOi9T5snqv3JY09eeR4CXnVqKITZu4F1FD/mRmzNgRxU1xo/+enmBSCSnhN0820dt0UctseJuyjlNHmj/A1P8l5JC4PSCfeZwDfAJJka2Dvc8Vfgo704lOqu2K7eFpkcaT3gp+hbR6GQyOTECA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791816845; c=relaxed/simple;
	bh=2g3F1tGGGUuBr89k0Gem0eq3qJx3+tdd8zplCBD7EDU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QP6wUJHma7Obfxwf3weyM7EpeHLQfTUzPhW/OTxX0J5Aapsx8jhRsNa+1KbB2P30P9QgD13B2PzovrzGn7X2ccqWDRT1ssEhaQdv6kCqOV+J6OMR7Dw71g1Q0Ikm3pTLXhvrVuf9+ZmRRpKd8jBsqh77WAVlc4GlfKspjDbkT4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=nNn7Y06D; arc=fail smtp.client-ip=52.101.53.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="nNn7Y06D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nbr0bju5r7qQ3GKR6Cm07gzNAMGGxWKi5vkcT1bQPx5njdyHOTCmhP4CVa7wXvUXN368UAa8vxf2G+/OW7Qn1AOKAXNzE7VMJEcm2Zr7V5bvqbUNW7OcA4LvlNI4Oq7fCZUJ/e/qRNwb1Q8QCk5RgiYD430Guh8kft2aIKYvnWreqK/iWWhIgX6yYWActDKW66qkO773smXWpASr72CY5hW7bKmC7MpXyIwme3PDRvA5tXCT/xT1jgmFk1vu8PxGjd6uEf3hDiD0b6lqa8XdWRwM6F1YvN0uApgd7jUnNwbnpIEcSfrsKYbaYYPJzZyzw3w5oMvEmbNysx13IOcsOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GApoSdrYkIMII3AViOJB1ajIk0rfjg93mMGnhGgG++o=;
 b=vcnwVOtTgVKLKmdV9sYjCL0ItYCjmnEtO8blxGaamHw/fP6cV9jfIKuI1jSI5Dy97HjzLkNoaKh53adfF1YhGAV8U/Sq3S1TJ0hRMPDoOEM2pewE/iLmBjqPsA+DZsfa8VRmbuV5l1fRitwIPUS/m8NHQ92harH+6d4/7t43EIFSBNhuppW3ox3ytMC8jVNkI/3FLVQFjsihMK5PFUD87foi4l9xvcIS6usHzZuqMsC2IUTa4eeaA0JSiJ9ro4o8qkzjg++Fz7E7rZuYMXN3s8iDQot3/AVR2iVuuPU0Hp/hCS1djACUSEMu+W5kzSPRXf+k53Nr9A92uB/F8uDhRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GApoSdrYkIMII3AViOJB1ajIk0rfjg93mMGnhGgG++o=;
 b=nNn7Y06Dsz3ZDleT+4534HBnhojY7Av3nDdlkOQ5Q6itZr7u1a0ADKshvUF7INx8DuLr/+NkUFA5+cBggwFEvghFh6AH6EbwcJnd7/elpy53ANqceDpF5S3faLGbYM4ISnRllua3200k2c1Z0gVDfcHuttdmngmhOQfbUXu9dQE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by PH9PR12MB011960.namprd12.prod.outlook.com (2603:10b6:510:418::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Mon, 12 Oct
 2026 14:54:01 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%7]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 14:54:01 +0000
Message-ID: <fd02e914-3517-42cc-8804-51c560b5e3a6@amd.com>
Date: Mon, 12 Oct 2026 09:53:58 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] platform/x86/amd/wmi: aod: Add debugfs interface for
 raw WMI access
Content-Language: en-US
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com, W_Armin@gmx.de
Cc: platform-driver-x86@vger.kernel.org
References: <20261010190543.563161-1-Shyam-sundar.S-k@amd.com>
 <20261010190543.563161-3-Shyam-sundar.S-k@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20261010190543.563161-3-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0177.namprd03.prod.outlook.com
 (2603:10b6:408:f4::32) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|PH9PR12MB011960:EE_
X-MS-Office365-Filtering-Correlation-Id: c1299f18-3729-4128-47cf-08df2870a6cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|56012099006|11063799006|4143699003|261009223027099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	mtpWjFwW1BA/Zkx8F/cqoGZZmTF4c/7uAw28ft8BOp9tuJtWIiWJkftJ3YJFZg1M0P76OYujr9a7aVztUqU+gzQSQ3Visyyc6yC1yTG9l/XYLTZMBm8dnyEqjzdCU/Du28sHGmqwvIESjKpNthhtMj7pSzgEpPTmpYCQhqM/1zpMOedv9sqI+ed4vtnUVFxFdVZsdsHYN5WZDK7JtUSSrwfPUklBs9B+FnJc1f39xPcVmA+UnPbV46WoUcvs4Oiw86q2BCUTLh6f56lnMF7LNdVhr4YmBLk5Ra0+/N1UTQfSYL6aLko1flhghIGmKkbV+MgNTeXlFR+k9RfXImEaC13vEirNb+4GhLQxh5kPXkNbpExAuf1OAldsRhzOYKeStXHQuZiCvP/Ol36LZKQ7QF613g1RGNN7A9hkm/KjverO74QWe4JftbkSa/idaBQ02oPH7zUVhMErTlteoZxVPpqFf6yVILh+ecNHHRMZrzMiFAasfrBtPbwKhUqsF/qMQRxvRzRmn46g2yd2kXe+8ML2qNA8qXo4l78fzzY+FSMb1QDSU6skwIAug6ed83lLIaY3C2dH9jomgFlVdt++bnf/fazk5I/1tjSKbNWAwZV4b4m2YXbAjq5A2Nuuoo9t3/zwxWrqZ+M8CdK/gN8ac3UFz2lczN9iIlC5AlaLhyA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(11063799006)(4143699003)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkplaGRuNE1BdENJM0NRbFQ0NU9DRzJnTlVzZjZnMUQwN0pJQ1ZaeUtmOEZx?=
 =?utf-8?B?cGF0UzBVQjNpL2EyS3Uwa1h5MXhHUkRZODc3Sjl3WGdnWllhL2dWcWVwamx5?=
 =?utf-8?B?UkZpZnVGMkFrekJUbDRhMVkwZjBPcG9XRXJ4TXNzRTA1UGoyOFRnRWNDSXht?=
 =?utf-8?B?ZFYxOXdrWWtTQzFrU3dEb1pYVGV5aGg0aDRNQllISEVMME9KMnI0NUlZTWVV?=
 =?utf-8?B?SnBHTm5mZGJSc0pzM2dXbFc2NUVkV3dPYjlRQXR6VFp4clpKL3ptalZoOFl1?=
 =?utf-8?B?SHBYQlI0NmF0UDFHQW5DRFZ0M1U3a2M2WnRRNDVwWmJabnhhSjJ6TkVJSDZ3?=
 =?utf-8?B?Wng3RUZzb3NCRThJREwrKzBaendjWnNrWUkyWXFiKzRQcTI3YUV6V1lmWDRI?=
 =?utf-8?B?T3d2UXNzamprUURWYmtuYk0rMGo0Qi9NZFF0ZnMyZ1lOQ2FmRnVCTGFLekhN?=
 =?utf-8?B?S1hpTld1Y3RhNUlsYVhaU0tFeFhmdjFxcXB1U3ZBSTRFaGZ5Y3o0ZVIzd0p6?=
 =?utf-8?B?djFGUXd6UTArMmtLa1VOS1ByUVdXT3F4Nzk0VUZGVmtLY2FWVkFaaWJYYnRV?=
 =?utf-8?B?MldraGdVbG9qU2lhcFVTM01TMWtsM0EvUUdoWUhoQVFvWXpHazhhNmwySjg0?=
 =?utf-8?B?SEVUUG1td29MWnBPbHVzL3ZBaHgwV3FDUlVXOE1ITW9TdFpSUEZFMHQrOGlk?=
 =?utf-8?B?TkFQV00vM0VEZmhiYlNBamM3RE1nUW5TZnpvTi83OTRWTmc0dXNyU3RRU3Rl?=
 =?utf-8?B?bEZQcGZuWGtCVllVY1ZHNUwrb3Y5dEc4Sm04WHA2M1l2RzhUTVZqdGZmYTk3?=
 =?utf-8?B?U09Id1NLcGExSW1DcituMFJYVTAwOFdIcGxXTElrV2RaQkVCZkxoQklvd0Zk?=
 =?utf-8?B?bWxncVJTUzRod28yREUxODJ5b25Fckkyd04wZG93dEVMeUZPK2h4Q0FwTER2?=
 =?utf-8?B?U1BNUTFwK2ZMeUJSR2dyeTk2cjVRcjBEOEllQVdGZXM2eFhtZEVTUnhIVGJE?=
 =?utf-8?B?RnZsRDl3aWlQYkcyY2ZUbi9MSWtVaU1TbXJUcGJDN1VUOWdoaEhrZE5Jd0hs?=
 =?utf-8?B?bE5TTXZBSmJpWEcrRXVuRkY4MVVvNjZVQ2xlYWxmdVl0WFlYdFdYeXYwY25Q?=
 =?utf-8?B?THp5dTZYQkFKd0J1d2tPTXU1V2xCUzF6ZXlldUJXOFpST2xPaTZnYjBiUGU0?=
 =?utf-8?B?OU9RSUcwUmZ5eDI3VUxhbGtjcU8zVEpvcjdLQ24zNW5jd3JDZW9WKzE1TnJF?=
 =?utf-8?B?cGpSS0RqT3BYL3YyWVFIWmUyV216aU1yeC9GblFzYm9QZlBiTnJ0UmU1MDlU?=
 =?utf-8?B?dmtwTzF2TTJKN3VWRmMvU0N6dXFsK0VxU1g2bldJNTVoREdMYjFRYUZmdmlS?=
 =?utf-8?B?aWJPaEpjeVFrdzJJZElobHFJNHQxN2xZVHFnQzdjMnhKWVRJYnQ2K3BEWCt5?=
 =?utf-8?B?WkNNeVdMQjh2QnBBK0oxRHV2K1hTZEpQYXdvN0FzOHpqQWVtRnIxZi9JejdP?=
 =?utf-8?B?SXFoMldsdVhUdXdjRHBjZmFSZzllWTBiSkExMmhYSUtHdUxaUkwvb0IrRkla?=
 =?utf-8?B?MktYUmVHRGgrZ0NyYWdlaWxJSkp6Vk51aGFNdDdRK1p0bTRkRGpjZC8vcjRk?=
 =?utf-8?B?eVpCN1FrK0xObDNyeEpkc1IzaDBxQVpOVk9qZzAzOXJvVlIyU3c5U0pZLzZ5?=
 =?utf-8?B?Vjg1Q1FjSWxtcEVxeDZMbXp2SFZvZi9vdWlkVTRqdEQ3c2FmTzNGbHRGZkpk?=
 =?utf-8?B?V0tiMjVFYlpPbGwvaXNLTjV5MkhkdWJEU2pqRTNxUHhtdnlwdHd2a3RWalIw?=
 =?utf-8?B?TUxGbWN6Mk1rZmw0Y2xGSytmMGJLR01wUXlNeDE1NXlaRHBmeUpHdjRBL08r?=
 =?utf-8?B?aHVqRFhqWmpqQ25yRUpNV2tmMnFBd0xNVGRwaDl2ZlNOeEdIZ1BiYkhEVkcv?=
 =?utf-8?B?bTV4QVJTV1NOaGI2OFRlSTFpN3h2S1NFL1Q5dnFMWnhBdVZWWE4zMDVNSFlr?=
 =?utf-8?B?akk0TStYcERsUW0wajdOV096ZHpJZDFUZm96dXl4S0dlbXB2bDNXcFMrM3hT?=
 =?utf-8?B?TEpxcFowcG9oY3ZrUFl0cjl2RmlhbDgranIvbEpUeFNZTDJXb1ZBd3BUdnRk?=
 =?utf-8?B?UVl4dUh0bWVCSW9lTTJ4dW5HOXJKeUtIR1dweVBGR2hRUTZjNDJMcWVmNGdQ?=
 =?utf-8?B?dFF1ZWdkdFA3ak8vbDZkd2N6RDV6OWUxMXpFdFJDOEVxQUpSblRNNnF3aS91?=
 =?utf-8?B?dm1NWVR3dWs5Uk9FcEV0Z2o0WkwrZTI5VEFkbUNVYWJaek5IUHRPNm5saTlK?=
 =?utf-8?Q?6Pa0R3ue0MYZOFVmuT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1299f18-3729-4128-47cf-08df2870a6cf
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 14:54:01.1543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dvAdU4OlBz0TSfV0KfxvVtqGAH9+6Ehs+C9TmD2UVdfAsYPxUKSu8UEOg2A/Vsdu3VwVvKvnuT8qbWfV5m+I+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR12MB011960



On 10/10/26 14:05, Shyam Sundar S K wrote:
> The AOD firmware supports many more commands than the ones exposed
> through sysfs, and the set of commands differs between platforms. For
> debugging and platform bring-up it is useful to have direct access to
> the WMI methods.
> 
> Add debugfs files to list the supported commands, query the range of a
> command and execute a command. This interface is not a stable ABI and is
> only accessible by root.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>   drivers/platform/x86/amd/wmi/aod.c | 320 ++++++++++++++++++++++++++++-
>   1 file changed, 316 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/wmi/aod.c b/drivers/platform/x86/amd/wmi/aod.c
> index c64a02b5d379..b7331930f4c3 100644
> --- a/drivers/platform/x86/amd/wmi/aod.c
> +++ b/drivers/platform/x86/amd/wmi/aod.c
> @@ -8,20 +8,27 @@
>    * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>    */
>   
> +#include <linux/align.h>
>   #include <linux/cleanup.h>
>   #include <linux/compiler_attributes.h>
>   #include <linux/container_of.h>
> +#include <linux/debugfs.h>
>   #include <linux/dev_printk.h>
>   #include <linux/device.h>
>   #include <linux/device/devres.h>
> +#include <linux/err.h>
>   #include <linux/errno.h>
> +#include <linux/fs.h>
>   #include <linux/gfp_types.h>
>   #include <linux/kobject.h>
>   #include <linux/kstrtox.h>
>   #include <linux/minmax.h>
>   #include <linux/module.h>
>   #include <linux/mutex.h>
> +#include <linux/seq_file.h>
> +#include <linux/sizes.h>
>   #include <linux/slab.h>
> +#include <linux/sprintf.h>
>   #include <linux/string.h>
>   #include <linux/sysfs.h>
>   #include <linux/types.h>
> @@ -49,11 +56,15 @@
>   #define AOD_CMD_EDC_LIMIT		0x00050003
>   
>   #define AOD_MAX_OID_COUNT		64
> +#define AOD_OID_STRING_LEN		64
>   #define AOD_DVALUES_COUNT		100
>   
>   /* Property flag of a command: discrete values or a linear range */
>   #define AOD_PROPERTY_LINEAR		1
>   
> +/* WMI strings are aligned on a 2-byte boundary inside WMI buffers */
> +#define AOD_WMI_STRING_ALIGN		2
> +
>   #define to_amd_aod_attr(_attr)	container_of(_attr, struct amd_aod_attr, dev_attr)
>   
>   #define AMD_AOD_ATTR(_name, _mode, _show, _store, _setting, _field, _scale)	\
> @@ -103,6 +114,7 @@ struct amd_aod_oid_package {
>   	u32 length;
>   	u32 id[AOD_MAX_OID_COUNT];
>   	u32 property[AOD_MAX_OID_COUNT];
> +	char id_string[AOD_MAX_OID_COUNT][AOD_OID_STRING_LEN];
>   } __packed;
>   
>   enum amd_aod_setting {
> @@ -126,6 +138,10 @@ struct amd_aod_data {
>   	struct mutex lock;	/* Serializes WMI calls and protects the fields below */
>   	bool supported[AOD_SETTING_MAX];
>   	bool linear[AOD_SETTING_MAX];
> +	u32 dvalues_cmd_id;
> +	u32 stepping_cmd_id;
> +	u32 run_command_status;
> +	bool run_command_status_valid;
>   };
>   
>   struct amd_aod_attr {
> @@ -199,8 +215,35 @@ static void amd_aod_parse_object_id(const struct wmi_buffer *out,
>   	}
>   }
>   
> +static int amd_aod_parse_names(const struct wmi_buffer *out, struct amd_aod_oid_package *pkg)
> +{
> +	const struct wmi_string *str;
> +	size_t offset;
> +	int ret, i;
> +
> +	offset = sizeof(struct amd_aod_oid_result);
> +	for (i = 0; i < pkg->length; i++) {
> +		offset = ALIGN(offset, AOD_WMI_STRING_ALIGN);
> +		if (out->length < offset + sizeof(*str))
> +			return -EPROTO;
> +
> +		str = out->data + offset;
> +		offset += sizeof(*str) + le16_to_cpu(str->length);
> +		if (out->length < offset)
> +			return -EPROTO;
> +
> +		ret = wmi_string_to_utf8s(str, (u8 *)pkg->id_string[i],
> +					  sizeof(pkg->id_string[i]));
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +/* The command names are only decoded when requested, the driver itself does not use them */
>   static int amd_aod_get_object_id(struct amd_aod_data *data, u32 method_id,
> -				 struct amd_aod_oid_package *pkg)
> +				 struct amd_aod_oid_package *pkg, bool names)
>   {
>   	struct wmi_buffer out;
>   	int ret;
> @@ -210,9 +253,12 @@ static int amd_aod_get_object_id(struct amd_aod_data *data, u32 method_id,
>   		return ret;
>   
>   	amd_aod_parse_object_id(&out, pkg);
> +	if (names)
> +		ret = amd_aod_parse_names(&out, pkg);
> +
>   	kfree(out.data);
>   
> -	return 0;
> +	return ret;
>   }
>   
>   static int amd_aod_get_dvalues(struct amd_aod_data *data, u32 cmd_id,
> @@ -508,6 +554,270 @@ static const struct attribute_group amd_aod_group = {
>   };
>   __ATTRIBUTE_GROUPS(amd_aod);
>   
> +static int amd_aod_version_show(struct seq_file *s, void *unused)
> +{
> +	struct amd_aod_data *data = s->private;
> +	u32 version;
> +	int ret;
> +
> +	guard(mutex)(&data->lock);
> +
> +	ret = amd_aod_query_version(data, &version);
> +	if (ret)
> +		return ret;
> +
> +	seq_printf(s, "%u\n", version);
> +
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(amd_aod_version);
> +
> +static void amd_aod_oid_print(struct seq_file *s, const struct amd_aod_oid_package *pkg,
> +			      bool raw)
> +{
> +	u32 i;
> +
> +	if (raw) {
> +		seq_write(s, pkg, sizeof(*pkg));
> +		return;
> +	}
> +
> +	seq_printf(s, "Length: %u\n\n", pkg->length);
> +	for (i = 0; i < pkg->length; i++)
> +		seq_printf(s, "[%2u] ID=%-8u property=%u  \"%s\"\n",
> +			   i, pkg->id[i], pkg->property[i], pkg->id_string[i]);
> +}
> +
> +static int amd_aod_oid_show(struct seq_file *s, u32 method_id, bool raw)
> +{
> +	struct amd_aod_data *data = s->private;
> +	struct amd_aod_oid_package *pkg;
> +	int ret;
> +
> +	guard(mutex)(&data->lock);
> +
> +	pkg = kzalloc_obj(*pkg);
> +	if (!pkg)
> +		return -ENOMEM;
> +
> +	ret = amd_aod_get_object_id(data, method_id, pkg, true);
> +	if (!ret)
> +		amd_aod_oid_print(s, pkg, raw);
> +
> +	kfree(pkg);
> +
> +	return ret;
> +}
> +
> +/*
> + * The command lists do not fit into the default seq_file buffer, use a
> + * larger one so that the firmware is only called once per read.
> + */
> +#define AOD_OID_SHOW_SIZE	SZ_8K
> +
> +#define AMD_AOD_OID_ATTRIBUTE(__name)						\
> +static int __name##_open(struct inode *inode, struct file *file)		\
> +{										\
> +	return single_open_size(file, __name##_show, inode->i_private,		\
> +				AOD_OID_SHOW_SIZE);				\
> +}										\
> +										\
> +static const struct file_operations __name##_fops = {				\
> +	.owner		= THIS_MODULE,						\
> +	.open		= __name##_open,					\
> +	.read		= seq_read,						\
> +	.llseek		= seq_lseek,						\
> +	.release	= single_release,					\
> +}
> +
> +static int amd_aod_object_id_show(struct seq_file *s, void *unused)
> +{
> +	return amd_aod_oid_show(s, AOD_GET_OBJECT_ID, false);
> +}
> +AMD_AOD_OID_ATTRIBUTE(amd_aod_object_id);
> +
> +static int amd_aod_object_id2_show(struct seq_file *s, void *unused)
> +{
> +	return amd_aod_oid_show(s, AOD_GET_OBJECT_ID2, false);
> +}
> +AMD_AOD_OID_ATTRIBUTE(amd_aod_object_id2);
> +
> +static int amd_aod_object_id_raw_show(struct seq_file *s, void *unused)
> +{
> +	return amd_aod_oid_show(s, AOD_GET_OBJECT_ID, true);
> +}
> +AMD_AOD_OID_ATTRIBUTE(amd_aod_object_id_raw);
> +
> +static int amd_aod_object_id2_raw_show(struct seq_file *s, void *unused)
> +{
> +	return amd_aod_oid_show(s, AOD_GET_OBJECT_ID2, true);
> +}
> +AMD_AOD_OID_ATTRIBUTE(amd_aod_object_id2_raw);
> +
> +static int amd_aod_dvalues_show(struct seq_file *s, void *unused)
> +{
> +	struct amd_aod_data *data = s->private;
> +	struct amd_aod_dvalues_result res;
> +	u32 i, count;
> +	int ret;
> +
> +	guard(mutex)(&data->lock);
> +
> +	ret = amd_aod_get_dvalues(data, data->dvalues_cmd_id, &res);
> +	if (ret)
> +		return ret;
> +
> +	count = le32_to_cpu(res.length);
> +	seq_printf(s, "id: %u\n", le32_to_cpu(res.id));
> +	seq_printf(s, "current_value: %u\n", le32_to_cpu(res.current_value));
> +	seq_printf(s, "length: %u\n", count);
> +	seq_puts(s, "dvalues:");
> +	for (i = 0; i < min(count, AOD_DVALUES_COUNT); i++)
> +		seq_printf(s, " %u", le32_to_cpu(res.dvalues[i]));
> +	seq_putc(s, '\n');
> +
> +	return 0;
> +}
> +
> +static ssize_t amd_aod_dvalues_write(struct file *file, const char __user *buf, size_t count,
> +				     loff_t *ppos)
> +{
> +	struct seq_file *s = file->private_data;
> +	struct amd_aod_data *data = s->private;
> +	u32 cmd_id;
> +	int ret;
> +
> +	ret = kstrtou32_from_user(buf, count, 0, &cmd_id);
> +	if (ret)
> +		return ret;
> +
> +	guard(mutex)(&data->lock);
> +	data->dvalues_cmd_id = cmd_id;
> +
> +	return count;
> +}
> +DEFINE_SHOW_STORE_ATTRIBUTE(amd_aod_dvalues);
> +
> +static int amd_aod_minmax_show(struct seq_file *s, void *unused)
> +{
> +	struct amd_aod_data *data = s->private;
> +	struct amd_aod_minmax_result res;
> +	int ret;
> +
> +	guard(mutex)(&data->lock);
> +
> +	ret = amd_aod_get_minmax_stepping(data, data->stepping_cmd_id, &res);
> +	if (ret)
> +		return ret;
> +
> +	seq_printf(s, "value: %u\ncurrent_value: %u\nmin: %u\nmax: %u\nstepping: %u\n",
> +		   le32_to_cpu(res.id), le32_to_cpu(res.current_value),
> +		   le32_to_cpu(res.min), le32_to_cpu(res.max), le32_to_cpu(res.stepping));
> +
> +	return 0;
> +}
> +
> +static ssize_t amd_aod_minmax_write(struct file *file, const char __user *buf, size_t count,
> +				    loff_t *ppos)
> +{
> +	struct seq_file *s = file->private_data;
> +	struct amd_aod_data *data = s->private;
> +	u32 cmd_id;
> +	int ret;
> +
> +	ret = kstrtou32_from_user(buf, count, 0, &cmd_id);
> +	if (ret)
> +		return ret;
> +
> +	guard(mutex)(&data->lock);
> +	data->stepping_cmd_id = cmd_id;
> +
> +	return count;
> +}
> +DEFINE_SHOW_STORE_ATTRIBUTE(amd_aod_minmax);
> +
> +static ssize_t amd_aod_run_command_write(struct file *file, const char __user *ubuf,
> +					 size_t count, loff_t *ppos)
> +{
> +	struct amd_aod_data *data = file->private_data;
> +	int cmd_id, value, ret;
> +	u32 status;
> +	char *buf;
> +
> +	buf = memdup_user_nul(ubuf, count);
> +	if (IS_ERR(buf))
> +		return PTR_ERR(buf);
> +
> +	/* Both values may be given in decimal or hexadecimal notation */
> +	ret = sscanf(buf, "%i %i", &cmd_id, &value);
> +	kfree(buf);
> +	if (ret != 2)
> +		return -EINVAL;
> +
> +	guard(mutex)(&data->lock);
> +
> +	data->run_command_status_valid = false;
> +
> +	ret = amd_aod_run_command(data, cmd_id, value, &status);
> +	if (ret)
> +		return ret;
> +
> +	data->run_command_status = status;
> +	data->run_command_status_valid = true;
> +
> +	return count;
> +}
> +
> +static const struct file_operations amd_aod_run_command_fops = {
> +	.owner = THIS_MODULE,
> +	.open = simple_open,
> +	.write = amd_aod_run_command_write,
> +	.llseek = noop_llseek,
> +};
> +
> +static int amd_aod_run_command_status_show(struct seq_file *s, void *unused)
> +{
> +	struct amd_aod_data *data = s->private;
> +
> +	guard(mutex)(&data->lock);
> +
> +	if (!data->run_command_status_valid)
> +		return -ENODATA;
> +
> +	seq_printf(s, "0x%08x\n", data->run_command_status);
> +
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(amd_aod_run_command_status);
> +
> +static void amd_aod_debugfs_remove(void *dir)
> +{
> +	debugfs_remove(dir);
> +}
> +
> +static void amd_aod_debugfs_init(struct amd_aod_data *data)
> +{
> +	struct device *dev = &data->wdev->dev;
> +	struct dentry *dir;
> +	char name[64];
> +
> +	scnprintf(name, sizeof(name), "%s-%s", DRIVER_NAME, dev_name(dev));
> +	dir = debugfs_create_dir(name, NULL);
> +
> +	debugfs_create_file("query_version", 0400, dir, data, &amd_aod_version_fops);
> +	debugfs_create_file("get_object_id", 0400, dir, data, &amd_aod_object_id_fops);
> +	debugfs_create_file("get_object_id2", 0400, dir, data, &amd_aod_object_id2_fops);
> +	debugfs_create_file("get_object_id_raw", 0400, dir, data, &amd_aod_object_id_raw_fops);
> +	debugfs_create_file("get_object_id2_raw", 0400, dir, data, &amd_aod_object_id2_raw_fops);
> +	debugfs_create_file("get_dvalues", 0600, dir, data, &amd_aod_dvalues_fops);
> +	debugfs_create_file("get_minmax_stepping", 0600, dir, data, &amd_aod_minmax_fops);
> +	debugfs_create_file("run_command", 0200, dir, data, &amd_aod_run_command_fops);

Similar to what we do with enabling overclocking in amdgpu, would it be 
worth tainting when someone has used the run_command debugfs file?

> +	debugfs_create_file("run_command_status", 0400, dir, data,
> +			    &amd_aod_run_command_status_fops);
> +
> +	devm_add_action_or_reset(dev, amd_aod_debugfs_remove, dir);
> +}
> +
>   static void amd_aod_scan_settings(struct amd_aod_data *data,
>   				  const struct amd_aod_oid_package *pkg)
>   {
> @@ -533,14 +843,14 @@ static int amd_aod_detect_settings(struct amd_aod_data *data)
>   	if (!pkg)
>   		return -ENOMEM;
>   
> -	ret = amd_aod_get_object_id(data, AOD_GET_OBJECT_ID, pkg);
> +	ret = amd_aod_get_object_id(data, AOD_GET_OBJECT_ID, pkg, false);
>   	if (ret)
>   		goto out;
>   
>   	amd_aod_scan_settings(data, pkg);
>   
>   	/* GetObjectID2 might not be implemented by all firmware versions */
> -	if (amd_aod_get_object_id(data, AOD_GET_OBJECT_ID2, pkg))
> +	if (amd_aod_get_object_id(data, AOD_GET_OBJECT_ID2, pkg, false))
>   		dev_dbg(&data->wdev->dev, "GetObjectID2 not available\n");
>   	else
>   		amd_aod_scan_settings(data, pkg);
> @@ -579,6 +889,8 @@ static int amd_aod_probe(struct wmi_device *wdev, const void *context)
>   	if (ret)
>   		return dev_err_probe(dev, ret, "Failed to get the list of supported commands\n");
>   
> +	amd_aod_debugfs_init(data);
> +
>   	return 0;
>   }
>   

