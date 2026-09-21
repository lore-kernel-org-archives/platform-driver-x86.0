Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013025.outbound.protection.outlook.com [40.107.201.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DF84AEBC5;
	Mon, 21 Sep 2026 17:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790011664; cv=fail; b=TFLbV7XQnPLYtTCpFPThj+Swf5obp95Hc33zEsarDiLKZWoOnHnR0kveZZkxpAr0Ky6x2hXTaa4lIJa2Cu/Qcp58tddFOEhZjVI7O2DJ66ASJvZc829Y2/jhWTDmSrPefcwO99MMYfIKlq8nv8TXEDGcmKQn/jieqIg+iB/nMCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790011664; c=relaxed/simple;
	bh=mMruqVBlu4vqoKRJFjV45jyv7AAJM+uCT9jwfbhEFp8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nbwYZ4u3HDqu7h+tuw3dJJtpBjfZQa1AX57e1aXr2jxP+97z1V1OfTAjNKzpFIZ5KOvNyLOWLJpcXGnTnS5/0vpjFoPZH5R6Pz589UN9pOjA06Y97E+sQWbxbdofcqCX9bjrg7Zj5dwwMUrMNUujHhQNhr49+P2iuu44/3DLifc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=b/mLYZNT; arc=fail smtp.client-ip=40.107.201.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="b/mLYZNT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DMqNgCsQDQxQkD18eXV+OXTHT+d5SxOQWWFWzWReMD35BC8t1e2AXCHv/+3a5HE6Dv/kIby/NY7eR8Xk+2N2EZnYfgvVRgmAzSLFjvDA17RQhsQra2aRf/40tOR8mxdDOPc0OazZqpxhH+sTJmt533McBKnn2cMZH2obsMozY7yeaOwILo4i0qbsyoobR+FdND7reUUwZ8JmATC55OmTwmONpVq+kkvS4IAHSgyhjQVLFrtfsmmXgfkrBaxiQ0d49NwkYAf8jgFXnqNVUeC4H3MBjTHIGA0Wv4JJ4BBMNbf87lvwEZ+tNiImmHOcCCaD/UMqdIzR4Vkn3Sv4LSeZ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FPGjR93wA5KteZfx/6OpByIwiRF4PerRV/DH16vq5iA=;
 b=vTifb3UVOJjqeaw64263R7PI8GRcATlVZplzcShgssav6/AwU8pjRVtsxf8xhgWqw0feGLgzRI3OVE5D2lh4CRSFq0PMmcE6SaMRK9//ozKakR8q736fl6eAw3+hKjziuc+V+3LNquVMe1wI3Aad3C8IsnycSevjZCIcnaBZmZ7cD3EtooRMXAjzXM1gtnJCPAGEJrsCiNqTHf+U7NwolmKrkL1m3htjdXTJ3ycza6HSQJ7p1yVl0ktaZzZyOSAzIE0JrP+iJIykgMj404lOBMBSMv9wspBANQxoQqu97WHw5p92cXX6qrwSXx4QTvsrJIrEO0PegxtCYqsZbVpviQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FPGjR93wA5KteZfx/6OpByIwiRF4PerRV/DH16vq5iA=;
 b=b/mLYZNT/D27+wCcmex9rpiLEnQaAGhOhF5lyNBS5Y38j/0Yu6rPsM4mph78qMwmuUQIiQZygqZ1wJwqDv7ow+fmxKG3dL5HQJDH0pXL9MAriv8/neIXACnxFm3LZrH64wYjaJCsNU9F7twB7nATvh9b1i6zJkiWCUr5AEYFC7A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by SA6PR12MB999202.namprd12.prod.outlook.com (2603:10b6:806:450::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 17:27:39 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%7]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 17:27:39 +0000
Message-ID: <669e9561-987a-45c6-9d5e-b551fbfd0cb7@amd.com>
Date: Mon, 21 Sep 2026 12:27:37 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] platform/x86/amd: hfi: Rely on ACPI enumeration
 instead of a dummy device
Content-Language: en-US
To: Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "open list:AMD HETERO CORE HARDWARE FEEDBACK DRIVER"
 <platform-driver-x86@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260921170411.1149960-1-mario.limonciello@amd.com>
 <20260921170411.1149960-4-mario.limonciello@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260921170411.1149960-4-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9P223CA0004.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::9) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|SA6PR12MB999202:EE_
X-MS-Office365-Filtering-Correlation-Id: 2de3ef11-c245-487d-2b65-08df1805a296
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|18002099003|22082099003|56012099006|11063799006|4143699003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	A0cYlrtOWSlqlWo1P1r9w8nXBHINq2AQwUd0wvJiwsIUrNRfvoDp1AG2JYyM+7RXaCt+Uzo5WTe/luHV+RGHSQY7xwAIUTSZDfX4bh9QJoROFX/A1XUdg2ogJFIrCWbdnAZWI7fzGZ1uLmdMlkZml+kGOGd0iWsWQky33FdO1RnJvgfn9Q+B5jWx7PznLEmdZ7+5syBqZh6LSMH9IObXiYcBUPMohrXt1iJJv8Nxp1Jc12A3wGqweWjVutYMtAtGjd2yLhA/8U1JokKMeg9aE+vpkze+CtfLKC2rr1IpBPQJuKgh96qgkcC7f8z4ux2oPAW+RZW8bq0Ye0GC45ToH8aV/b91FQIarWLKaJqzIXGh0oEb1djqr9JWOvYNi5nZYZO9qAW3zvhNakwzHWmMPrqzBSRFjzvvmNBxaruMEOJTg1Gxz0eZlc6Z15bg8oNDK4YyyrIxXKpM5WTG8hXnQd8VNX6noMTiOvXJx6V18KXLzVAVLWuKJXoSqXrQmQndTdJV7gRuhE8i3KIrO+4Mq0TEFWQ1X19fOJ8GPP3nB5ClDWc9vmss9IjEEGajFLOlqLKsyDwf+7WHmJitV50wyY058J0r5EKhL5uI2hR4L+M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czhBQW9sR2syY0hBL2hSMFVhcFAyNWhPZEdabVQ1OW1OdTRyb0hWQklsK1hY?=
 =?utf-8?B?YzhHeU5iYmI1OWVMTFYwU1plbzRWdXIwMVJmZnhQUHpjbU5TS0YrdHY1b3R4?=
 =?utf-8?B?MGxEdFdqRGVkYjdnNTZYWGN6eWNCSXl2eCt5RnpkUUdrMExJSVR2VWhLNVdn?=
 =?utf-8?B?eEVVQTBadUd4R3Q0YzBnbWVOSXZvczE2ZWtmTW44b0ZSbjJ6QjZBUXprMTVm?=
 =?utf-8?B?enVNM3BSREZzRXFiZzRHdWlLRTNEZE9pYjRlNFl0aFBXNHo5SnJnUlhjWFhp?=
 =?utf-8?B?ZDhtOURtVGYyZVAyVTZpQTF4KzZWVTR0VTB0VTFWM000SnFyU3dZTGY1VjJx?=
 =?utf-8?B?SjdXblU3V2lnc0VGNGJGdjJ5WWhkdXJ3djl4VmRhcnhiazRwbTM3cHVjaG5G?=
 =?utf-8?B?Sjg1c3JGYjlaU01XOWJoclBwWU9vbENaRWd6RFVzMGZzYnB1MjdnNTUrekFl?=
 =?utf-8?B?cXlFNzRBcUVLY1dsdERrZmkxRVR0TldSOWRZeDhHN3dmbjR3VU0xeGdhQjdV?=
 =?utf-8?B?ZUZvS21od2szWXFOVi9FbnVWdzNDdGduVmR2bldnSCtUUEpkMjBycTc2RE1T?=
 =?utf-8?B?RWZWQVdLMFpOU3FmWE9kanRpR0t2c2g1aEQybUtGcThBUkFKY0Y3eFpTbFlr?=
 =?utf-8?B?eERGOVVSbXM0TytIbk5MaDVrZGNjMVR0dzNjUXMrK2VWZ2hnUE9IZmZYY1BD?=
 =?utf-8?B?NmlqOG1ZRGdQNnpJU3lOWjRkS05MVTlnRm16bHNaYytOTExnUDNqckcxVURp?=
 =?utf-8?B?bGdrUk9ZMWIzMWh2VkVpVFBWcUZEZUVVNFV1dGpLbmEwVGx3a3MwcGwrQXk0?=
 =?utf-8?B?dkJxWVBmQytpQ1RxTlRnZlhveU9HNjZRYzFTOW56QmpzeGZzcWQwZFlIWkY0?=
 =?utf-8?B?alRNSm15SnFWT0RpanA5ZGZtR25lUHBDaDRGNGpRcUp2RnlidGhPSHRGc2sw?=
 =?utf-8?B?V3NVR1NaWVQ5WGpUY0hBNUVHb0lDekpWWVAzckJ3WTZTVkhtTThSbUZJbUs0?=
 =?utf-8?B?NCtnV2VLNDh0QS9iL3M3R1hnOUN6R21ab0dzRFBPT1YyN0czMk1EU21KMjlU?=
 =?utf-8?B?U3RORURjaE1OMHRPZll0OWw4T2FGdVZrTS9FOHRyVkxjYjRvRVFSdklySG5Q?=
 =?utf-8?B?blkrbkUwcThQTzdTYXF5UWt3MG9hdmFDcEV6aGdYa2NPSUovdmRqaUp0SFQz?=
 =?utf-8?B?cnZlU29UZEVTUjdpbCtNUGw2WHZJZ0N4Tm4xQmV1TWlySWNuM29MMjd3Rit5?=
 =?utf-8?B?elFNdXR0ajBYTjQ5VGtOWVV6U3lOdmpSMHkxQkhGZ3A2NzJlZzB6VTc4emUy?=
 =?utf-8?B?QjFwM0hKelgrQ2ZQZFRFNGZhS3NWRStCeUVIU3NaUEdYamYwMmZGMk9VR01F?=
 =?utf-8?B?WkR0NjZURVg3b3d5WWl5RU5vRm1mOWFEUWcrQS9Pd2EwYTIvWkxldGorVFZ6?=
 =?utf-8?B?MDFDZHBRT1V0Y3h3SEZmaGtIdU9HK0hvN2M2OVpTMGZnM2VQREhGMkxQRVlN?=
 =?utf-8?B?TXQwMXBCOVRFZ0ljUThCRXc0cVlMRW5nVXhkMU1zT1BYbmVEV0JxMFFQTjgw?=
 =?utf-8?B?QURIMVAzakg5c1R5VEphNXIxOUZqL1g3RjI3L3djMDBsSVBOajNiekFSR0xP?=
 =?utf-8?B?ZDNFRmhqUDR0YUtRYjE1L2Q0V1plUmdCR1FGY25vYXlReWViVjFpeklqRzFw?=
 =?utf-8?B?YU4xb0V2VHllUGtuVEVieUxFaVFRQUFFWXVUcm8rWlZXdy80SWExamszcERy?=
 =?utf-8?B?OWdUcVFadUVmbjU3TitORExpb0tqQ0M5eXIvWXhLY0pKNmtwSGxiVzdNS2tJ?=
 =?utf-8?B?TSt2QWZzUUZ3azZhb1J2L0M0SVY0WXB2czVoTWw0QVgyMjZRVXlKQUZzMnVS?=
 =?utf-8?B?Uy9Qd0p3a0dGaGx5UjNvVzdDVGFINE9PUU95U1Z0bUVXREdQRGdqd2pUQzZk?=
 =?utf-8?B?OUJMQTYycE11ZG0wcmIyWmozWE0wLzljRGNYaFlMOWhZM2dLS3NZYXY4UGJQ?=
 =?utf-8?B?SFZqYzlWK08rWFZQUjFiZFlkVFNzekpwTjBmTGtnK0ZSNWZPNExEWVMwYXVp?=
 =?utf-8?B?ZU1ISm1yM1psbHdMZWdUN0h4WmhqM1Z2U1B6WFR0eUxVWnM1dndnK3M1L2RL?=
 =?utf-8?B?UWQwbnlKZmZXZGpxRlB2N2JFVjY1TlFqbFY5dHppWlkwTFR4Yi9CYzV0RnFK?=
 =?utf-8?B?YWR1TW5ZR2NSSUxabDFBckw1TkZCTjlTbjV5LzFjd2JSZGlPelRuWm84cERm?=
 =?utf-8?B?WExnd2FpN1RTblpTODVHYlFBNXNBbDc0QWYxejdyRUl4cmVMcUYzY2o3TWFn?=
 =?utf-8?B?WnZQeVB0cGlPWGlNOGZwWHZkVEs0b3dZTzhmZHA0cEVlSnZPa0h4dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de3ef11-c245-487d-2b65-08df1805a296
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 17:27:39.3329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kP0N0RiVSGMwz9dUfzh0pvlp2+BYxj8COLOJTWjjbvaA6q40kzie7sfvDl3AFwSookyUbyNisNvZCm+4TaD7Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR12MB999202



On 9/21/26 12:04, Mario Limonciello wrote:
> amd_hfi_init() manually registers a platform device with
> platform_device_register_simple() before registering the driver.  This
> device has no ACPI companion, so when amd_hfi_probe() runs for it the
> acpi_match_device() check fails and probe returns -ENODEV.
> 
> The driver already advertises an ACPI match table, so the ACPI subsystem
> enumerates the real AMDI0104 device and binds it to the driver.  The
> manually created device therefore serves no purpose: it never binds and
> lingers as an unbound platform device, wasting memory and cluttering the
> device tree.
> 
> Drop the manual platform_device_register_simple() and the device that
> tracked it, and rely solely on ACPI enumeration.  The CPU feature gating
> in amd_hfi_init() is retained so the driver is only registered on
> supported hardware.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: 
https://sashiko.dev/#/bug/linux-8791990d-979b-4901-81b0-a8c6fdb67c7a> ---
>   drivers/platform/x86/amd/hfi/hfi.c | 9 ---------
>   1 file changed, 9 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hfi/hfi.c b/drivers/platform/x86/amd/hfi/hfi.c
> index 6d1d3b6c28a97..a923345dd1cf6 100644
> --- a/drivers/platform/x86/amd/hfi/hfi.c
> +++ b/drivers/platform/x86/amd/hfi/hfi.c
> @@ -39,8 +39,6 @@
>   
>   #define AMD_HETERO_CPUID_27	0x80000027
>   
> -static struct platform_device *device;
> -
>   /**
>    * struct amd_shmem_info - Shared memory table for AMD HFI
>    *
> @@ -540,12 +538,6 @@ static int __init amd_hfi_init(void)
>   	    !cpu_feature_enabled(X86_FEATURE_AMD_WORKLOAD_CLASS))
>   		return -ENODEV;
>   
> -	device = platform_device_register_simple(AMD_HFI_DRIVER, -1, NULL, 0);
> -	if (IS_ERR(device)) {
> -		pr_err("unable to register HFI platform device\n");
> -		return PTR_ERR(device);
> -	}
> -
>   	ret = platform_driver_register(&amd_hfi_driver);
>   	if (ret)
>   		pr_err("failed to register HFI driver\n");
> @@ -556,7 +548,6 @@ static int __init amd_hfi_init(void)
>   static __exit void amd_hfi_exit(void)
>   {
>   	platform_driver_unregister(&amd_hfi_driver);
> -	platform_device_unregister(device);
>   }
>   module_init(amd_hfi_init);
>   module_exit(amd_hfi_exit);

