Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011048.outbound.protection.outlook.com [40.93.194.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C018D42D769;
	Wed, 29 Jul 2026 21:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785360612; cv=fail; b=Q2FZK2xeXVGT5TQHbTzof9fdxJMrwsmarplqjOInyTCid0pDSWeGu/eGcHYRSyAvqn7usCGwp4NLD0nidhhfVVUjvza9elog/2igLDB4gZYdzOCEb4s9V2DWtDSvM+WZWoiibC+h2QlR88xI1PpemWubvGj39/XQg22S9rX3XQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785360612; c=relaxed/simple;
	bh=8SMS83zGrjUpgmYX1d1YTrrqtaBjhvajZmcBc8AhApI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pW/lEPwp9oYDU2CIOl6T/SQWjtiW9Ok94rkb1m3x6F+TwTwgGSbXAO1yxSHWuQ3KqkFprLsBBRgp8u2h5ddxPV0Bd0JRGVFY7B+gwb3YsBzUFkbTirDf7T1ABVpQ5Q+IjRL1s4LdDnHMWl+xnbtM/lCQB6ckv3E1cDm9QGeB534=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=kdVKIm3/; arc=fail smtp.client-ip=40.93.194.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="kdVKIm3/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X3WxcKi5fXocWsFPMLm4ofj5iSBj0IM3cWDJJtgQJB5fcN+sf2oTmcC4Pu75ylQq4LTihx35MZxFH58VMx0OoVGfZscohfUTpO3sohOkcSaA4nZNer95aLwMChVirMIS+JISxmzaIKENb9e38n9kBhGCcXKxAs+R1WcVoSyQRPoRkVM/aoUtgo2ZNBu6/teRXXwL1yFlx1EMeQqiBfCe58S3lYOnoc6UQYzahbFvz0XsZmd41ALBTJWRIpKyqS7jJvGOKn9Tg/E8fuupssK3Sy80sxDy48SNquEj+9PqR3+UY/1jvPB11zwZtQgglIkIYLqQnUN8dy0xbuKon7MC6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zlvjd/cMksVJticrak2AnzGpjkbYxbYzlYbS+oUwjxg=;
 b=MI1ftiPYjd6hTYE2o7BTdeP1GrRWb1HQIEyH9ryiYdRbqLOnrRNw46miWeHC5arUQ2eCBsAg4hzD223u/N8ceYXkf05GpEFRHfwbZvjrNiKe7YziD7S4rz69buzxgWpp74ubvTDbVaY/vHiAURyM7AiUluvBFN5zbRH+uXNdQgdMbIGePcB3TKQLOLLPz/KgH/7K+RAHwTQ7stW7nWqg8U9yM+dYlACObbN5JoHDkRhHhtxcX5e1qn+y5jTy77nR20q3S0JKa1xzME/v1FFXbJ16MuF7eSOixoBMlLXgezntQivNfz5B5wLIu7zJfVtEhwUNEcnuhQldWxWmytyRNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zlvjd/cMksVJticrak2AnzGpjkbYxbYzlYbS+oUwjxg=;
 b=kdVKIm3/3DXev8m1wdnn34CjSsnSm9v85MVqTf2E7/YBzMJGjw/hOirrxnLe5z8+qvsmgbFtrwi43etbbBQzYyRIi7t0GVpWL9cLtDU9M7l2EX1f3TlWoBOIu6TwNyeaAB2kDj8XHrr5bqQtSYuoaGyGLCblzZd6dfKSDeUm61A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by CYXPR12MB9317.namprd12.prod.outlook.com (2603:10b6:930:e2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 21:30:02 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%6]) with mapi id 15.21.0270.012; Wed, 29 Jul 2026
 21:30:02 +0000
Message-ID: <e8a4a7e9-4e1f-4c00-80ec-84a37c74eb2d@amd.com>
Date: Wed, 29 Jul 2026 16:30:00 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] platform/x86/amd/hsmp: Add ACPI client support via
 the SMNR method
Content-Language: en-US
To: Muralidhara M K <muralidhara.mk@amd.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 muthusamy.ramalingam@amd.com
References: <20260729164034.1331375-1-muralidhara.mk@amd.com>
 <20260729164034.1331375-4-muralidhara.mk@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260729164034.1331375-4-muralidhara.mk@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0107.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c5::28) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|CYXPR12MB9317:EE_
X-MS-Office365-Filtering-Correlation-Id: cc765273-d5b9-40f5-c723-08deedb88cc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|6133799003|11063799006|56012099006|4143699003|10067099003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	9y3tmBT1EjjVUOQfl5VE1lgYMXloPXPCq1JpA9AA/YbUztgjQpA3WranWe7Gp4/I+eyDgeepfLX9hSGhDYz2ucVeLU0iVqqQM5hs4mehHscV3O1c7PeYNX49Em/HsrhRXkSaWOHSCaX+Tgd8T/zq5OMIv0H7tk4azvn/6b1O8HXVJPFf+NuL/fIiR7JKxOxFGFREWkSWWlNbA3MTkY1tLJvH7Zlt4r9JS3DXLftdqmS+r1fRnuIRNm/NhVyxU3uYABrqHJ18+Kl+P+qCblx01ugfqd8Lfn7NZGFVTSCBmkJsFvXUmu/O7tKHcdwWVor1E+BgiC4IXP7V6MxZXozu863ypBuN1N0p1771yTkapk0GmVxRayYD47ObmQqjJPhJ3mvvfSyx8oJ5kEKGa9QTVEKbZjGFoF7Oa2X25Y7IFOLJOjX6leUrig5YUff1rhcKoyiTeYVqz51mM2Z+oIOjP5vtTSkaoOWPvWJGA/paTXOHlqqj0/kfmtJ8eIwiusP43jQIDfIEMg866jR1K85FeLts2/lja+7i3uhblpnnmu0t+DT7xdj8Pl1AC4079YZJ9tDlFnAC9Oy62RHTiL89EyqfK0xFMqRA8BW0jBJCmzN1lJ7BBsPwRpoTqo6nqtDbwc+0IfJJWVdKeONijiN7SBjWMOCS4yyHouPoyiWlOtA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(11063799006)(56012099006)(4143699003)(10067099003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFR0a0ErbjdzYjRONDNQY0RpbXVpaEFrcEt1Y2xueU42U0RZbFczb1RZcnJG?=
 =?utf-8?B?OHVRS2RHbjgvRUhpa2lSbXRtcTByaUMrQXNmbmFvNUFoYmU4TDlDNTloR0g4?=
 =?utf-8?B?Rnk5b080bW1sdFcyTURSSkpydlVVYlNMcXJhS1d3c2J2a1cra3hQY0hnQzdm?=
 =?utf-8?B?QWNKeTg5aXNMeGdTS1RBVm1velNuZVNjVktRVUVLTjB5ZWdDUzdIR2R4NCtt?=
 =?utf-8?B?YXJIK3dpdENtRmc2S1lxSE53aXhuM2IwbExLTC94Wm5RYUxmaVY0Y1Z0Zmk0?=
 =?utf-8?B?cFlmRVM1KzJ0OWVyejhHSGFGNVhVVHhTY3dqeHlvUHF1SW9CQ2ZXVlNSLzE5?=
 =?utf-8?B?OFJJQzkyQ2ZHeWR3SGxOSEw5YXpKcXNzZDRFZVYvSzZFUkFjUkl1R0w2L3dL?=
 =?utf-8?B?Tjd5akY2QVJpeVQ1b2w1TVlseFk4N3cvRUc2S3JtQTE4V25wQjM3MS80aml2?=
 =?utf-8?B?OHA1cnQ3Y0hnUVlWcDRSRG1CZWQrS0g5cGRhTVlVVTQrbWdtVmt3MFhRalZm?=
 =?utf-8?B?dUlLekxGN0VNaU5QR3ZwSWZndTVHclExYjNVMFZ4ZElwc0V3aGF0K3ZaMmYw?=
 =?utf-8?B?N2tLdG1WejJUYjMwVFZHNEZQQVh3aFkxZ0Z6bWR1RzJLYUxONDNMZWMvUk0r?=
 =?utf-8?B?QWovSHZXSjNFelVvWlByb2dZeG94dVNxeGlTSTMweU0vOUk3Uk80ZzB3KzFr?=
 =?utf-8?B?M1ZNY1JUUDc3OERIUnJQNHI1UDh0YTdMN204cHljU0hDODVKa2JXSTBJQXdu?=
 =?utf-8?B?ZjY1Mk1rcE45UktPYnlBVHIwUHFOK201MGU5dEpGdUpSLzhRc2xHVzY3Z3pq?=
 =?utf-8?B?RWR6T05Gd1ltTnVUTVBaNm9BM0o3R3RnVHhybFgxR2szV3pIancrdC9WTU5I?=
 =?utf-8?B?bDBoeVBxWm41djN6ZXJreHpRM25RMzB2SVFsaGYzOU01UlFLU0haT3N1NSsv?=
 =?utf-8?B?VHRYdFlJTjFwT1U4MlNkeWpTTzJaMkJ5YmN0SEdzNUN4UER0YlhFakZhSUpq?=
 =?utf-8?B?SlA2U1phZ1hmTmxUQWppTjNONHRvTktFQ3ZoT1IxMnJoZjdldy9CdjcyL0x2?=
 =?utf-8?B?a25Qeld6SnpaQk5xUzlkZWVJdmFUanQ2UVpTNVVGdnhoeWE2ZzdyZVozTVZs?=
 =?utf-8?B?UWhGb0IxdTBscHMreG93VGk3d3BQcnUyb0VLb0lPa0Q1cFdIWVZaWHU3RGpD?=
 =?utf-8?B?eVVNVk8zUG8vM3lTU2pHOGNCVWRoL2NmVmNuY3VtOUIxeVF0UjdhMXBFYWNF?=
 =?utf-8?B?bDd2U2hkc0V3YVp0ZHZhRWhQY1dwSmd3TFZnRGRvRExQcUc2R0lyeVRKcGh1?=
 =?utf-8?B?SzdmUVVQdEhtQ0ZRVGc4bFN2N21uYzAySkdvMnQ4dTlFODRrdVQrZ21wY0I1?=
 =?utf-8?B?bFl3WVM1L0RkQVkwTGpmUWsyeUJlRkpUZFhpVjFmWkdiZzRLUE12M0dpcW5j?=
 =?utf-8?B?TDJ6cHloWVpJVFpyNjh3dlAweG02THhnYWRVaUVQZWhqVEREK29RT3R6dmg2?=
 =?utf-8?B?NGp3Z1llN3ZlM1VKUUJYdUZ3dmJsZ3lXUEk1Qmo0S0lkaWZZVklCZjd3NndD?=
 =?utf-8?B?czMrYnpWZEN4RnVENjBhN3dYeWRQZEw3cWN0akw2YTB6SVVzVDAyVEExQTk2?=
 =?utf-8?B?OXV5OTVSZit0MWdRaml0MUc2Vmx2Yy84TExmMVZEZDNjMmVrYVlWMjlYN2pX?=
 =?utf-8?B?c0VDWXFCV3A1ajByOFVNaU9FSUNSRmFKaFBpRDBrK2NmcFIybVoxR2x3YmhH?=
 =?utf-8?B?azFmeEdWWXA5ZVhuUEthTUYrSU9RRkt4U3ZZeEI5MnV1M2Z1TDIwWU5ZK25w?=
 =?utf-8?B?NnRFdE1INy9IL2FSVXBtWHVlL2pkQ1piOG1HVEo4cFpJMlYvWlcrM3Y0RWpa?=
 =?utf-8?B?U0oreXF3MTZSVHpJRDFvdVdJTmorS01yRmVVUWVQdktHaUs4WndhazVmNEdX?=
 =?utf-8?B?dzdxa2M0MzRVdk1rMVBOOVQwSXR3RG9tcWMxOU5tbUlaeUVzWDhyYU9xTys5?=
 =?utf-8?B?V20vY2Q1Q1M0OU5FTUFUOXEyZHBTM3IxMG4zemdxRktHU2h4U1lUV0U2b2RE?=
 =?utf-8?B?WmozWFF6Mk1qOWw2bGUrMVNXYTM4U0pKSCtTckhTWThMWWxCaDduVlRpdDht?=
 =?utf-8?B?akFSSDQzc0J1L2FRbFlTRTZlbzMzS2VtT05ibEJYNERscmViREFtR25hdi81?=
 =?utf-8?B?Z1B3Q2tYV2lPNGtldWZNaG4rTllXU2dLTFR6UDFrSE9xZnpiV0RkckhEY1Ew?=
 =?utf-8?B?LzMwR0dtaTRjZlBtTDNOM1IzYnhBcXUwcEN0TFhlWHMvd28yYVZKU05ZYzF2?=
 =?utf-8?B?dUxBOTU2ajFxVkp6ZUsyNUo3dlV1NGlGRE5WUzNkRHZNcWw2d09Idz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc765273-d5b9-40f5-c723-08deedb88cc8
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 21:30:02.6694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /hawgvys0/PsWDY16O4YiRCK80+ke5IVCc+U5u91RAQb4FVjvIygIlxsWVgDw3fF3ZjdOutlpjDyFMHsk3FGMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9317



On 7/29/26 11:40, Muralidhara M K wrote:
> On the Family 1Ah client platforms (Models 80h-8Fh and E0h-E3h) the ACPI
> HSMP device (HID AMDI0097, ACPI path \_SB_.TELD) is present but, unlike
> server platforms, exposes neither a _CRS memory window nor a _DSD
> mailbox-offset package, and names its socket differently. The probe
> therefore failed in three places:
> 
>    - hsmp_get_uid() requires the server "IDXX" _UID form and rejects
>      anything shorter than three characters. The client device carries a
>      bare socket number ("0"), so the probe aborted with -EINVAL before
>      it reached any of the code below, and without logging a reason.
>    - hsmp_read_acpi_crs()/_dsd() found no _CRS/_DSD and bailed out.
>    - hsmp_cache_proto_ver() issued HSMP_CLIENT_GET_INTERFACE_VER
>      (msg 0x3), which this client SMU rejects with "invalid message"
>      (0xFE) even though the mailbox is otherwise functional.
> 
> Handle the client explicitly:
> 
>    - hsmp_get_uid(): strip the "ID" prefix only when it is present, so
>      both the server "IDXX" form and a bare socket number are accepted.
>      A _UID that is neither still fails, as kstrtou16() rejects it.
>    - hsmp_parse_acpi_table(): for is_client_platform(), skip _CRS/_DSD
>      and take the fixed client SMN mailbox addresses from the platform
>      descriptor, accessed through firmware. Reads go via the read-only
>      SMNR ACPI method
>      (TELD.SMNR -> CpmReadSmnRegister, the same accessor used by the
>      AMDHSMP Windows driver's amdtelemetry_Acpi_SMNR / 'RNMS'); writes
>      go via the kernel SMN helper (amd_smn_hsmp_rdwr), as this device
>      has no ACPI SMN write method.
>    - init_acpi(): treat the interface-version query as non-fatal on the
>      client, and call hsmp_get_tbl_dram_base() whatever version was
>      reported so the metric table is fetched with
>      HSMP_CLIENT_GET_METRICS_TABLE_DRAM_ADDR, mirroring plat.c.
> 
> As on the server path, the client branch publishes sock->dev last with
> smp_store_release(). sock->dev is the readiness gate the data plane
> tests with smp_load_acquire(), so it must not become visible before
> the accessor and mailbox offsets that this socket's mailbox access
> depends on.
> 
> is_client_platform() covers every Family 1Ah client platform (Medusa1,
> Olympic Ridge and Medusa2), which all share the same client SMN
> mailbox, so one branch handles them. Server behaviour (pure
> _DSD/_CRS/MMIO) is unchanged: the _UID handling still strips the "ID"
> prefix those platforms use.
> 

Why even bother with the ACPI one? Couldn't amd_smn_hsmp_rdwr() handle 
both read and write?

> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
> ---
>   drivers/platform/x86/amd/hsmp/acpi.c | 125 +++++++++++++++++++++++++--
>   1 file changed, 116 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index 8257cd1da48e..bbf2b9a8a408 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -10,6 +10,7 @@
>   #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>   
>   #include <asm/amd/hsmp.h>
> +#include <asm/amd/node.h>
>   
>   #include <linux/acpi.h>
>   #include <linux/array_size.h>
> @@ -71,6 +72,68 @@ static int amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
>   	return 0;
>   }
>   
> +/*
> + * Family 1Ah client platforms (Models 80h-8Fh and E0h-E3h) expose the HSMP
> + * ACPI device (HID AMDI0097, ACPI path \_SB_.TELD) but, unlike server
> + * platforms, the device provides neither a _CRS memory window nor a _DSD
> + * mailbox-offset package.  The mailbox lives in SMN register space and is
> + * reached through firmware:
> + *
> + *   - Reads  : the read-only ACPI method SMNR(addr) returns the 32-bit
> + *              value of the SMN register at absolute SMN address 'addr'
> + *              (TELD.SMNR -> CpmReadSmnRegister).  This is the ACPI BIOS
> + *              telemetry accessor referenced by the AMDHSMP Windows driver
> + *              (amdtelemetry_Acpi_SMNR, method 'RNMS').
> + *   - Writes : there is no corresponding ACPI write method, so SMN writes
> + *              are issued through the kernel SMN helper (amd_smn_hsmp_rdwr).
> + *
> + * The SMN mailbox addresses themselves cannot be discovered from firmware
> + * on the client (no _DSD), so they are fixed; the SMN_HSMP_*_RM
> + * addresses are defined in hsmp.h and shared with the platform driver
> + * (plat.c).
> + */
> +
> +/* ACPI method on \_SB_.TELD that reads one SMN register: SMNR(addr) */
> +#define HSMP_ACPI_SMNR_METHOD		"SMNR"
> +
> +static int hsmp_acpi_smnr_read(struct hsmp_socket *sock, u32 smn_addr, u32 *value)
> +{
> +	struct acpi_object_list arg_list;
> +	union acpi_object arg;
> +	unsigned long long out;
> +	acpi_status status;
> +
> +	arg.type		= ACPI_TYPE_INTEGER;
> +	arg.integer.value	= smn_addr;
> +	arg_list.count		= 1;
> +	arg_list.pointer	= &arg;
> +
> +	status = acpi_evaluate_integer(ACPI_HANDLE(sock->dev),
> +				       HSMP_ACPI_SMNR_METHOD, &arg_list, &out);
> +	if (ACPI_FAILURE(status)) {
> +		dev_err_ratelimited(sock->dev,
> +				    "SMNR(0x%08x) ACPI method failed: %s\n",
> +				    smn_addr, acpi_format_exception(status));
> +		return -EIO;
> +	}
> +
> +	*value = (u32)out;
> +	return 0;
> +}
> +
> +static int amd_hsmp_acpi_smn_rdwr(struct hsmp_socket *sock, u32 offset,
> +				  u32 *value, bool write)
> +{
> +	u32 smn_addr = sock->mbinfo.base_addr + offset;
> +
> +	/* Read path uses the firmware SMNR ACPI BIOS method. */
> +	if (!write)
> +		return hsmp_acpi_smnr_read(sock, smn_addr, value);
> +
> +	/* No ACPI write method exists; drive SMN writes through the kernel. */
> +	return amd_smn_hsmp_rdwr(sock->sock_ind, smn_addr, value, true);
> +}
> +
>   /* This is the UUID used for HSMP */
>   static const guid_t acpi_hsmp_uuid = GUID_INIT(0xb74d619d, 0x5707, 0x48bd,
>   						0xa6, 0x9f, 0x4e, 0xa2,
> @@ -89,15 +152,19 @@ static inline int hsmp_get_uid(struct device *dev, u16 *sock_ind)
>   	char *uid;
>   
>   	/*
> -	 * UID (ID00, ID01..IDXX) is used for differentiating sockets,
> -	 * read it and strip the "ID" part of it and convert the remaining
> -	 * bytes to integer.
> +	 * Server firmware differentiates the sockets with "ID00", "ID01"..
> +	 * "IDXX", so strip the "ID" before converting the rest.  The client
> +	 * device carries a bare socket number with no prefix to strip, so
> +	 * only skip one when it is actually there.
>   	 */
>   	uid = acpi_device_uid(ACPI_COMPANION(dev));
> -	if (!uid || strlen(uid) < 3)
> +	if (!uid)
>   		return -EINVAL;
>   
> -	return kstrtou16(uid + 2, 10, sock_ind);
> +	if (!strncmp(uid, "ID", 2))
> +		uid += 2;
> +
> +	return kstrtou16(uid, 10, sock_ind);
>   }
>   
>   static acpi_status hsmp_resource(struct acpi_resource *res, void *data)
> @@ -240,12 +307,35 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
>   	int ret;
>   
>   	sock->sock_ind		= sock_ind;
> -	sock->amd_hsmp_rdwr	= amd_hsmp_acpi_rdwr;
>   
>   	sema_init(&sock->hsmp_sem, 1);
>   
>   	dev_set_drvdata(dev, sock);
>   
> +	/*
> +	 * On the Family 1Ah client platforms the bound ACPI device
> +	 * (\_SB_.TELD) has no _CRS/_DSD, so use the fixed client SMN mailbox
> +	 * addresses and access them via firmware - reads through the SMNR
> +	 * ACPI BIOS method, writes through the kernel SMN helper.
> +	 */
> +	if (is_client_platform()) {
> +		sock->amd_hsmp_rdwr		= amd_hsmp_acpi_smn_rdwr;
> +		sock->mbinfo			= *hsmp_pdev->desc->mbinfo;
> +		dev_info(dev,
> +			 "Client platform: SMN mailbox via SMNR ACPI method (reads) + kernel SMN (writes)\n");
> +		/*
> +		 * Publish sock->dev last, for the same reason as the server
> +		 * path below: it is the readiness gate for the data plane, so
> +		 * it must not become visible before the accessor and the
> +		 * mailbox offsets this socket needs.
> +		 */
> +		smp_store_release(&sock->dev, dev);
> +
> +		return 0;
> +	}
> +
> +	sock->amd_hsmp_rdwr	= amd_hsmp_acpi_rdwr;
> +
>   	/* Read MP1 base address from CRS method */
>   	ret = hsmp_read_acpi_crs(dev, sock);
>   	if (ret)
> @@ -553,11 +643,28 @@ static int init_acpi(struct device *dev)
>   
>   	ret = hsmp_cache_proto_ver(sock_ind);
>   	if (ret) {
> -		dev_err(dev, "Failed to read HSMP protocol version\n");
> -		return ret;
> +		/*
> +		 * Some client SMU builds reject the interface-version query
> +		 * with "invalid message" even though the mailbox is functional
> +		 * (the preceding test message succeeds).  The client does not
> +		 * need the version to reach its metric table, so treat this as
> +		 * non-fatal there, matching the platform driver.
> +		 */
> +		if (is_client_platform()) {
> +			dev_warn(dev,
> +				 "Interface version query unsupported on client SMU; continuing\n");
> +		} else {
> +			dev_err(dev, "Failed to read HSMP protocol version\n");
> +			return ret;
> +		}
>   	}
>   
> -	if (hsmp_pdev->proto_ver >= HSMP_PROTO_VER6) {
> +	/*
> +	 * On client parts the metric table is fetched via
> +	 * HSMP_CLIENT_GET_METRICS_TABLE_DRAM_ADDR whatever interface version
> +	 * was reported, since that query may be unsupported, mirroring plat.c.
> +	 */
> +	if (is_client_platform() || hsmp_pdev->proto_ver >= HSMP_PROTO_VER6) {
>   		ret = hsmp_get_tbl_dram_base(sock_ind);
>   		if (ret)
>   			dev_info(dev, "Failed to init metric table\n");

