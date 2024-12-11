Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2058.outbound.protection.outlook.com [40.107.237.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB268F9E6
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Dec 2024 03:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733887279; cv=fail; b=BEswuDo+LeV/x1BZyYvV+rJHBYO95NwQe3TJ18YdETeRcr6o8+Couxl2haMs+uDoB0UOxxKCDMR+ON6eJebyCJ0TGWv2GKWOQ4hpxx6GsJXaFPC7Is+gI4v2GYKflRMK5gst/AuFuws2ekEMX3GrmzxoYrINzi5VDbQ4CPvGAvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733887279; c=relaxed/simple;
	bh=TbNHH+kP/50BpSmK5pj3XxQDco4c17uRXL8n3v33t9Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=o72KpSp8D1mOZTrDvlWNJJ+upazq/V9yU4Wu4m+y/TghpsFGk5Wm8NNufwDNOd3ZmVXJwo1z0fdt+F146iz4XF/f/cApfEID0TJ16LnbcHNHV2v/Gfij8uwySzDqgHwr1NhcI9m38/SQvZzn+q3YLQKGUbRqlvoucCyAN2r7Pk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TlEVg6NG; arc=fail smtp.client-ip=40.107.237.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TlEVg6NG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ACcyX2Pq2JIWe9TEnDiK5aaiM2LqNfK/cA184G3qJ3vKQYQngHi6zQ1nclH0gcw6NVVj7pzRk7TE04bHlUNy6i81LcwarRR0XpJvpQI582uEhvbgx57f0jbCcb77MlTgXzf4yRF9SSwFxRTiVZf2irVjUNpXznfvpjTYIq45MKcyAvALhwi6hX8FuaqrCo7RKhpRyhZ9fQpCO4k8V8oieG3a01CcHn0G18qunEqiq9l8yH9F+JRxxJ7+/X3KYnd4e3vqevGHE/z2y8PMxR+I/j4OrBj75hDSJdx3dI54l0WWw+QeE/y8mzVuE5iVwyGiXhfWfSAAaPv69Lm0gdnh7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTZUVN46bqHPN5UdriTl0ofrw4QjswT7ZYHAfhg+j3o=;
 b=lQskE+xiImGYdMrcPNMKxPEqKnHEFc/ozzNR0JWMvBCyYqFkgqvVuV71MMAC4uAwfjGdwanPw6ALNMJ8i1YqjWy1g5XPSpU+xprACnbUwjYbojpRq1boE2kSXBcjAxBbghPq/0SM6RcPCIHjYhXS5NusILOSul+E7k4au/iJvBvS9PKV2FDfOVs1P3lpNT9/uaWnGgl+Zii0EcQ5ww2xeVEl3MlNFxTZoVfvCj3LbfqHlDV3CCwCcu29KRtJweU+rs7UtbefhdIuFG5rm5LMFBkP1KJJEKKXb8wCBvO2eQmk815lunGnip9fpKW3KarXVKfodFITTHPFxOEEG8knhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NTZUVN46bqHPN5UdriTl0ofrw4QjswT7ZYHAfhg+j3o=;
 b=TlEVg6NGHBe5V4G3TxSRF8PXgZ8Ux+Y7SLPeRNuTuu7zwUuvgCqM9VCaHZMVHYlCU5ZZ0VSTMPVuVPLtvFeEs5WDOSJSl+j7tRFE/YnjCzaPfyHC0F+1dH/cZRD1Lpc/9rfAbGhdyqSUrqhZagYslq4rZU1l/Zs50OIXlpWI0ww=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by MN2PR12MB4221.namprd12.prod.outlook.com (2603:10b6:208:1d2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.15; Wed, 11 Dec
 2024 03:21:15 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%4]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 03:21:15 +0000
Message-ID: <56832277-120d-4e65-a181-c42f36b55fc9@amd.com>
Date: Wed, 11 Dec 2024 08:51:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/pmf: Enable Custom BIOS Inputs for
 PMF-TA
To: Mario Limonciello <mario.limonciello@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20241205101937.2547351-1-Shyam-sundar.S-k@amd.com>
 <060725b0-2dcb-400a-beea-fa574705125a@amd.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <060725b0-2dcb-400a-beea-fa574705125a@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0248.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:21a::19) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|MN2PR12MB4221:EE_
X-MS-Office365-Filtering-Correlation-Id: a7b09b17-7c45-4da4-3893-08dd1992de90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UXNwNzBDaTYxMXJFVm02RG5qcXhiYjNkQ1IvY0RnVXJRYll1Q3EwRjJxL3N6?=
 =?utf-8?B?bXZXNkNuL2orWFFlbElmQjJTZUF3bng1VGQ3RVJFcVZPeTM1OWVWdjFGOVR0?=
 =?utf-8?B?SWFBd1l5akdWU0RNYTdIVUVEVjBhcEU4MFhPUStjaGw3N0pZbE5oeG9jL1R2?=
 =?utf-8?B?UTdSRkQweHExSzhGMVh1MkVBTjJYNGpUTHg2cjQzNjZGbEpnbitKVXpNNERI?=
 =?utf-8?B?V1VjcUtsOE5BUkJoOHlMc0RDckJHUUZxZlViU1pPT2JEM1lFdEdqWUxFWjhI?=
 =?utf-8?B?K1FVako2aHF5YUl6bm4rQ2EvekdSQVdWQkV0UFRxbGNpNmRuN3NXZ0trTTg4?=
 =?utf-8?B?TittbWxxTU5Remp5RnR5OHRiQVRkNHdqaXgzZGVYUjg5VDhhYk0rb056YVpQ?=
 =?utf-8?B?cU5mUlBSYmVST09SN1pqWnpFOUdpak1nbGRZUW9sZW5iUExidXlzc0pZbFNx?=
 =?utf-8?B?UTVhaXFtOW5velgyNFVNWWN1eVJjbytQT3dKYmF0a1hhb1R4ZGExNFc0Z3Ix?=
 =?utf-8?B?MGxpeWdvNFFkK2VQUDRvb3Q2a0wwajJEVmRFUml3WjV5aXJua0NDOVdZL2hq?=
 =?utf-8?B?NllNdnA0TWF0VUdNVWpqRzRtOWo2cXJwZ09xaE51Q2tBWHkzRDlGOUdsVDNp?=
 =?utf-8?B?UjJmYU45ejl6OEx5ZGIwMjhTRUQraDRwaHcrNFNJVDRPSWpueXc0bkJGVHdP?=
 =?utf-8?B?K1JCUGpvQTFSamV1WjRjNnZnZXNPQUE5RXB0dG5LZmVtaXdrYzF2YWVsVEtC?=
 =?utf-8?B?N3RVVFVibmFqUlNSWHg5RUZXSnhZeUUrZ1c2Rms3QklWN2JsNkppWkxCQW5C?=
 =?utf-8?B?cStjOU5BTUxXTTA1dzNJSnhsSnZkYjk0SUpweHNkVkJvd21tU2hNQ2VrbXNR?=
 =?utf-8?B?ZFBhblJ3aG9PWmlOa1UyYUZsSnZvcm5SNXJwRHd2Vmk1WlN0bVRrTzYrcXZM?=
 =?utf-8?B?QmJoSGFLdWc5dG5kZzVucGpOZUpJY1RZSzlBOXdMS2FMK2FNZXQ3aXFmVGdY?=
 =?utf-8?B?dXhOejNPMk9lSlNNcDQvMm53Q0Q2U3FabSttekdFZ0lVeGFVNjUxMVhlS3Zt?=
 =?utf-8?B?NXRicE5UUEc5RlZHMExCeFdpZXdxd2ZvaHE3eitjNWRVeFpuUW03V3BEbjVY?=
 =?utf-8?B?VTU1K2p1UXc1aXh0QTJreTJkajdmKytMcWtyQTdRWThNTmpyUGhWRVgzeHJl?=
 =?utf-8?B?Z1VQajBld3F1NFFSMmlnY2VDOHJURFpjNXR4TStCZktmNUs5TzVHNzNONVY2?=
 =?utf-8?B?dUVJdVBPMTVmZ2hEb1JvbnAxYno4cytTcXhkVVlwekY5YWNQdGR1VWZob2lJ?=
 =?utf-8?B?ZFVPUkZDWHNDaU5ZM3hIWFJabTh3MHpmSWZHM0J5d0MwWHVrUGFydXRtd1FI?=
 =?utf-8?B?Sm00azNHZ01qRGRjV0RWaDQveUNNUklWdUFneTJyclJNdlJXR1pzK2xwayt4?=
 =?utf-8?B?S1lzRGxoMmFZWkhuZklMTVpJbURLRXZmQURZUDluS21MUVNSRUcwT0dSa1E4?=
 =?utf-8?B?YXRocWZQRXQ3UzJWUEFCK3AwQmhOTzBiblJ2c1B1dEZ0WGZrV3FEV0NGdG5L?=
 =?utf-8?B?UHMrVnpWb1l4aWdSSzhFMW5LNjFTd3lNNjRwTFNzVzdBZk9paWtLS1dMQmlC?=
 =?utf-8?B?RjQzYlE3R3lhOVJGZm1iTnptWjAvOFU4alEzc0VtblVNbVBvL05sOFQ5cHg3?=
 =?utf-8?B?YXhabFRsVHh0Q3RlTGxKU3I1eTFrTUJaZkN3MzZQV0FFWkNVUCtKNjdjblRj?=
 =?utf-8?B?MVJHdGRKWlFUck9VUmM5UW9tRWIrY2M5Y0g5NnY5Zy9KT0lpa1l2aUlHZ0Fr?=
 =?utf-8?B?eXIxbFhPK0tCeldNdyswZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2IrQ3RjWWdsVURiWTV4OGIzclArak5CekhOd2JwS1FqNW1IWXBwVnhZYmJ2?=
 =?utf-8?B?YmN3d0lLUjZ1R08ySld6UDcxY2tNbVptUmNrc0RGKyt6RmVISXRMcHcwemZN?=
 =?utf-8?B?YmwxSEMzT1ovOVVuVDRQczZlOEJ1WVZBOE5lTjUxNVRJc1A0YWFkN0c4STNF?=
 =?utf-8?B?YWY4SytRN3BYMDE2Q0EyRkRYb1BJRnVGWmpuaXk0RkNvYVBNSlRDb3p5aTN4?=
 =?utf-8?B?UHB6WUF1WHJiTzQwcThLcTE1SDdvVDdvbFZIL0sxM05GVFFKbElHZnF2VGpB?=
 =?utf-8?B?bnNXQlpMUEZmaThocDJVZ2hLVnloVk16Um5GZjBEa1hYbDVRZ3VtNnBGOGpB?=
 =?utf-8?B?dHF3OHBNSC9LT3lnZ0hDN0ZTMWRYaVVmaEN2UmVrSGVQeHk3MmYxamc0enZB?=
 =?utf-8?B?bEVDcGxUTjhrb2pUbjRKSGhzRnZydU1ndjFLT0ZlbEFha3ROV2kyc3Izb3FJ?=
 =?utf-8?B?cjVuNHlqNXBVNkhtM01ZN1BEeEJQaGRlc1JyeEVjTlNXSU9hcG5KSVovc1NI?=
 =?utf-8?B?di9iZmx5VlNBaXhFWmF0VDVTUUxWR0VScTRVMjlkZFVTNXVCRHovOXhKNFFa?=
 =?utf-8?B?bGJYKzdEeGVPeDlqNnJKUjFRMTBkN25rNWd1ZEFTY3ZqK3g2Qll2M205cHpV?=
 =?utf-8?B?czJYUytKajNsSmdkYVpmemRmYjJFa0dzaUZrNXN1SUxSV2pmUHBoWXQ4eldQ?=
 =?utf-8?B?RHU1aHZQZjAzOFFCeERYMVl1RlhTakswQzBSVkFPaFdQRVVyeW1aQlh0Ujh1?=
 =?utf-8?B?Rm9WL042TVQ5TlJEc3NkbGdZTzhXTUpHU1VHbmlaSlBRdDYvQ2kwTmN4WC9Y?=
 =?utf-8?B?Nk91aWpPMVdwZjFUaTJZZi92NnlXdUxDU3NWd2pBMlE2L3Y1a1ArNjBQODhQ?=
 =?utf-8?B?Wmw0bTJjTzVCVStDVHlTUjlnMXRiSXVzM3R0ZVAzd3BCT3dtbmZTSlIxeE5t?=
 =?utf-8?B?aFhzT01CTlVJa3cxTjUrTzYzaUNSSWxxUHVFZk9jK0NxZ3JUN1Y2LytkT2JC?=
 =?utf-8?B?anQrRGVFelYrMFI3ejRMWlNaUE5YbkZ0NXJVU3UyRzRqVElmd1VBKzJ3dnd6?=
 =?utf-8?B?UXVRdVpJeENlTUtId1dMeTNmcStkZ1RpTjA2T1NYRWZld0dyWlB6T3NXdTJK?=
 =?utf-8?B?ZzQ0WUlONkREZkxRK0drZjB0TVZ5VThyd3paTWtScGdlcFA5eDZEQUc3K0Z1?=
 =?utf-8?B?RC8xQVpPdERGUFI3TG9zbEthL0svNHJDbFIyWERDaTZtNUhkKzVBeW81U2JI?=
 =?utf-8?B?eTROTUlzNUNsbG5EelhwMzdLWjhMVkRETUExQzNSTmJ6elgwMDlwMm1IdWJk?=
 =?utf-8?B?THZJNTBnWUpZZ3JHbUgrM01DOEYwclNGd21iUTB3cVpHRkQrV1VmTUIvcm5r?=
 =?utf-8?B?dmZEZEVHNGZWREhqa2hiSTVWVitMVklVbGs2RW82L1pOSG1wTCtnVlloemNF?=
 =?utf-8?B?dUJjbEIwbXRJRlZQcWZlS3RlSjNmL1NuK2FvK3RmRGovL242L2pDcmxCZDhR?=
 =?utf-8?B?Y1ZKVHdobEphSjFjcEtFYnllOFRtS3Vlb2VFdDYzK3lsVUtGeFFiNk5uWWdq?=
 =?utf-8?B?bXhTeHpJZUFXYW90ZGo1cTBQODVTNzZ4RDVyOGJEekdmblRoL0xlODhSVjZn?=
 =?utf-8?B?cHc0a0Yra0ZlMGhUMVdab2ppMzRQK3IvUlkydHV1K0l6bDJOdFlpSmUzbUtG?=
 =?utf-8?B?dWYvdWJLa3BQZk4rREZqWlB5dG1tcGMxSWYyODAvK0c0YTJjQ0g5QUNHZ050?=
 =?utf-8?B?dkRZbDJZM2ZPTXkzWnkydGxyT0xheUs1ZnN6bktsN0c3dU1QUWhjVXYzbHhl?=
 =?utf-8?B?QXRLb1ZCVkRzWlVyYnhoTnVuRGYwK1VjR0FaZVN5anovUEtaREkzOGRab0d3?=
 =?utf-8?B?bnJSb2RCc2pNZnFTMzRpMThidU1YdkpiU0MwaURtbzZRaVBieU9DNTBua3Vl?=
 =?utf-8?B?bUJwTkhPMzdPYld2TmNCQTZ3NXRnNGdMSUlYZWlwV2d5SGxmY2x1MlVsSGxm?=
 =?utf-8?B?WlpOMGJhWUFISnRXMS83Z2tRK1FNMGJNU2tSS2JWQUJjZWRxUG42MDlzdURj?=
 =?utf-8?B?UjUxVXB0RExrS1ZNaXhhMWd6TlpWeTJGUWgwQjcyT1lMZDJuT2FyVTZFQXJ4?=
 =?utf-8?Q?I5iKI85T/Ii8n8mkLRu+UfSbw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7b09b17-7c45-4da4-3893-08dd1992de90
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 03:21:14.9915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1SKEIOaO2ym9NmC5PAoO+C/AJmfyPYlFfyu6vDFZTX+aLU41W8kx0V0+v8ZQugeM2PcN9rDyeAoTkm5agbQv9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4221



On 12/6/2024 00:45, Mario Limonciello wrote:
> On 12/5/2024 04:19, Shyam Sundar S K wrote:
>> Introduce support for passing custom BIOS inputs to the PMF-TA to
>> assess
>> BIOS input policy conditions. The PMF driver will adjust system
>> settings
>> based on these BIOS input conditions and their corresponding output
>> actions.
>>
>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> 
> I do have one suggestion for a follow up to consider.
> 
>> ---
>>   drivers/platform/x86/amd/pmf/acpi.c | 24 ++++++++++++++++++++++++
>>   drivers/platform/x86/amd/pmf/pmf.h  | 15 ++++++++++++++-
>>   drivers/platform/x86/amd/pmf/spc.c  | 24 ++++++++++++++++++++++++
>>   3 files changed, 62 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/
>> x86/amd/pmf/acpi.c
>> index 1b9c7acf0ddf..21ccd677ffa4 100644
>> --- a/drivers/platform/x86/amd/pmf/acpi.c
>> +++ b/drivers/platform/x86/amd/pmf/acpi.c
>> @@ -321,6 +321,18 @@ int apmf_get_sbios_requests(struct amd_pmf_dev
>> *pdev, struct apmf_sbios_req *req
>>                                        req, sizeof(*req));
>>   }
>>   +static void apmf_event_handler_v2(acpi_handle handle, u32 event,
>> void *data)
>> +{
>> +    struct amd_pmf_dev *pmf_dev = data;
>> +    int ret;
>> +
>> +    guard(mutex)(&pmf_dev->cb_mutex);
>> +
>> +    ret = apmf_get_sbios_requests_v2(pmf_dev, &pmf_dev->req);
>> +    if (ret)
>> +        dev_err(pmf_dev->dev, "Failed to get v2 SBIOS requests:
>> %d\n", ret);
>> +}
>> +
>>   static void apmf_event_handler(acpi_handle handle, u32 event, void
>> *data)
>>   {
>>       struct amd_pmf_dev *pmf_dev = data;
>> @@ -430,6 +442,15 @@ int apmf_install_handler(struct amd_pmf_dev
>> *pmf_dev)
>>           apmf_event_handler(ahandle, 0, pmf_dev);
>>       }
>>   +    if (pmf_dev->smart_pc_enabled && pmf_dev->pmf_if_version ==
>> PMF_IF_V2) {
>> +        status = acpi_install_notify_handler(ahandle, ACPI_ALL_NOTIFY,
>> +                             apmf_event_handler_v2, pmf_dev);
>> +        if (ACPI_FAILURE(status)) {
>> +            dev_err(pmf_dev->dev, "failed to install notify handler
>> for custom BIOS inputs\n");
>> +            return -ENODEV;
>> +        }
>> +    }
>> +
>>       return 0;
>>   }
>>   @@ -480,6 +501,9 @@ void apmf_acpi_deinit(struct amd_pmf_dev
>> *pmf_dev)
>>       if (is_apmf_func_supported(pmf_dev, APMF_FUNC_AUTO_MODE) &&
>>           is_apmf_func_supported(pmf_dev, APMF_FUNC_SBIOS_REQUESTS))
>>           acpi_remove_notify_handler(ahandle, ACPI_ALL_NOTIFY,
>> apmf_event_handler);
>> +
>> +    if (pmf_dev->smart_pc_enabled && pmf_dev->pmf_if_version ==
>> PMF_IF_V2)
>> +        acpi_remove_notify_handler(ahandle, ACPI_ALL_NOTIFY,
>> apmf_event_handler_v2);
>>   }
>>     int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/
>> x86/amd/pmf/pmf.h
>> index a79808fda1d8..255c5ad2300e 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -370,6 +370,8 @@ struct amd_pmf_dev {
>>       struct input_dev *pmf_idev;
>>       size_t mtable_size;
>>       struct resource *res;
>> +    struct apmf_sbios_req_v2 req; /* To get custom bios pending
>> request */
>> +    struct mutex cb_mutex;
>>   };
>>     struct apmf_sps_prop_granular_v2 {
>> @@ -616,6 +618,16 @@ enum ta_slider {
>>       TA_MAX,
>>   };
>>   +enum apmf_smartpc_custom_bios_inputs {
>> +    APMF_SMARTPC_CUSTOM_BIOS_INPUT1,
>> +    APMF_SMARTPC_CUSTOM_BIOS_INPUT2,
>> +};
>> +
>> +enum apmf_preq_smartpc {
>> +    NOTIFY_CUSTOM_BIOS_INPUT1 = 5,
>> +    NOTIFY_CUSTOM_BIOS_INPUT2,
>> +};
> 
> Maybe as a follow up you should combine these all together in a common
> header:
> 
> APMF_AMT_NOTIFICATION
> APMF_CQL_NOTIFICATION
> 

Mario - Sorry, I missed this remark. Will address in the larger
reordering of the PMF series.

Thanks,
Shyam

>> +
>>   /* Command ids for TA communication */
>>   enum ta_pmf_command {
>>       TA_PMF_COMMAND_POLICY_BUILDER_INITIALIZE,
>> @@ -657,7 +669,8 @@ struct ta_pmf_condition_info {
>>       u32 power_slider;
>>       u32 lid_state;
>>       bool user_present;
>> -    u32 rsvd1[2];
>> +    u32 bios_input1;
>> +    u32 bios_input2;
>>       u32 monitor_count;
>>       u32 rsvd2[2];
>>       u32 bat_design;
>> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/
>> x86/amd/pmf/spc.c
>> index 06226eb0eab3..05bed8206365 100644
>> --- a/drivers/platform/x86/amd/pmf/spc.c
>> +++ b/drivers/platform/x86/amd/pmf/spc.c
>> @@ -47,12 +47,35 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev
>> *dev, struct ta_pmf_enact_table *
>>       dev_dbg(dev->dev, "LID State: %s\n", in->ev_info.lid_state ?
>> "close" : "open");
>>       dev_dbg(dev->dev, "User Presence: %s\n", in-
>> >ev_info.user_present ? "Present" : "Away");
>>       dev_dbg(dev->dev, "Ambient Light: %d\n", in-
>> >ev_info.ambient_light);
>> +    dev_dbg(dev->dev, "Custom BIOS input1: %u\n", in-
>> >ev_info.bios_input1);
>> +    dev_dbg(dev->dev, "Custom BIOS input2: %u\n", in-
>> >ev_info.bios_input2);
>>       dev_dbg(dev->dev, "==== TA inputs END ====\n");
>>   }
>>   #else
>>   void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct
>> ta_pmf_enact_table *in) {}
>>   #endif
>>   +static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
>> +                       struct ta_pmf_enact_table *in)
>> +{
>> +    if (!pdev->req.pending_req)
>> +        return;
>> +
>> +    switch (pdev->req.pending_req) {
>> +    case BIT(NOTIFY_CUSTOM_BIOS_INPUT1):
>> +        in->ev_info.bios_input1 = pdev-
>> >req.custom_policy[APMF_SMARTPC_CUSTOM_BIOS_INPUT1];
>> +        break;
>> +    case BIT(NOTIFY_CUSTOM_BIOS_INPUT2):
>> +        in->ev_info.bios_input2 = pdev-
>> >req.custom_policy[APMF_SMARTPC_CUSTOM_BIOS_INPUT2];
>> +        break;
>> +    default:
>> +        dev_dbg(pdev->dev, "Invalid preq for BIOS input: 0x%x\n",
>> pdev->req.pending_req);
>> +    }
>> +
>> +    /* Clear pending requests after handling */
>> +    memset(&pdev->req, 0, sizeof(pdev->req));
>> +}
>> +
>>   static void amd_pmf_get_c0_residency(u16 *core_res, size_t size,
>> struct ta_pmf_enact_table *in)
>>   {
>>       u16 max, avg = 0;
>> @@ -201,4 +224,5 @@ void amd_pmf_populate_ta_inputs(struct
>> amd_pmf_dev *dev, struct ta_pmf_enact_tab
>>       amd_pmf_get_battery_info(dev, in);
>>       amd_pmf_get_slider_info(dev, in);
>>       amd_pmf_get_sensor_info(dev, in);
>> +    amd_pmf_get_custom_bios_inputs(dev, in);
>>   }
> 

