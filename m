Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2058.outbound.protection.outlook.com [40.107.220.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3459213A3F2
	for <platform-driver-x86@vger.kernel.org>; Thu, 22 Aug 2024 09:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724320534; cv=fail; b=NM5e5Gs5VEZuCRzip8a8gQu4eJLhnowOhTG2IGkNugrZrqFgdBo/Dj2Qubgw9tRztaetC3ix78HDCY/6605k8gktpLU1QStiwJXZKCe0SG5U+7BWaaJKASEURniFC4hiOjMXlrjpIR2tyAH8Q5c5c2+c4IL6e2g+WmhJ7edyn9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724320534; c=relaxed/simple;
	bh=rHL7ASuGSyN9bxRhuiRBowmUXmwb9NGYuBW6E9wlpPY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=a8gOvWhljYr2n3gVSUWPqMos8LTu/WtAeDaglx8v4W5KNDvA1L8KW65mdttoUKVPzGyPRWv7trGTz6h8OvVavGsmQiKIqyuFB8gkhDwF4tN/NtOjl+/4UxglVOHFnqf3VOp8nP5DvbkWE3K+qQkd51eytSrLDdZFdqDJ6dLmR+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=nCuk2V1p; arc=fail smtp.client-ip=40.107.220.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="nCuk2V1p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aUfiO5atBkA2SEzvRb00g/OBSg94DtFpTihdxrXXUWtd3kk2tTjnP6xj7ctTDBt92f4uX1AXWWjYI1rhGFso/95R8Zfm8GObUpBFQU543gcBd1kW+5xtYGDuHOGEL4JS7c4OZd+eKueKG33f+RJzDzZA9GFRwBJDvtSg95o9srFZjxV6R0So4yrHXi4no7c2bX8or1ZkW+jeKcKnpSsjdoE7+srF3PBQ9c0qtp2BkxZKcSaz+am3I/BVzaTPfzPqUxBOmnL9FlgNJ4JgQfmBL/xBGvoTTPD4s4YUdUCRnqdV7/RDXWhl7LBdGN5hZQUU69vpWRbT8VMX6A9bi+hqcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DKaWNO6TkyA/zoqGUxvSBLdvJ+68mNWn1NZPiurzgRg=;
 b=dN1U1rzmBgTxnnM+Z8nNYgDOJqIccpWj0QkD/n/gzZEhAHprhud40FD/Fn8GPJQq2NXHiNSdhbOVh7vt5OEmFAmyhkUNe2WVsEYIflSjxs4zHfJHOTWzA5506nwRAuUQ3Y0IMfQyAClsPu59KC3Llx5KU2CJRvJxB0tbGbEMYTZFPN/oybon70gw+UV3ovDvfj6XAufrzIR3Zgd4HlU1/x2YmcMxlzkh3UsCqyccNo4zLJTBPCjwtH2PVMdRgVyTOm5CrPHf+eBo1cN8zDikiG6I16/JLUW+9AXI0NKTtm1jhpZeQhsn8h5VGrg6IzfqFhD7spSUd7t/rALfS1MUfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DKaWNO6TkyA/zoqGUxvSBLdvJ+68mNWn1NZPiurzgRg=;
 b=nCuk2V1pyWx/1Az2mtQKnzwuYQuDj6kNQEs5J0uGAAGIv3f/Dz5uXoHWOhHgX1NUXrKaWoAUYwB6f/3kX4Ha+rR8ZoftZNMunI1TexYzim67ay/vZQDM8YQz+2jUQOvwHc1m9xx+G/JkOuxEUor6YVhtBl+SsXOweo9il8p4F5E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Thu, 22 Aug
 2024 09:55:31 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%4]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 09:55:31 +0000
Message-ID: <f8e88958-68cf-4eea-8ebe-f48cfe3495f3@amd.com>
Date: Thu, 22 Aug 2024 15:25:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] platform/x86/amd/pmc: Fix SMU command submission
 path on new AMD platform
Content-Language: en-US
To: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com
Cc: Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org,
 Mario Limonciello <mario.limonciello@amd.com>
References: <20240822095357.395808-1-Shyam-sundar.S-k@amd.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <20240822095357.395808-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0118.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::19) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|MN0PR12MB6101:EE_
X-MS-Office365-Filtering-Correlation-Id: 94e5f3a3-2ed1-45a5-4835-08dcc2908ecf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b3N6N1FOVTZub0F0OTMzWVNGYS8xSWMvb0MveXZiVUkwTUllZ09CZm05QnlQ?=
 =?utf-8?B?S053TFJua251QlI0RE50Ym1NU2xUVTMzeVZKTXMrM3NNbVJYMjJNTDg4SjZM?=
 =?utf-8?B?N3Roa1A2ZkVwYmFyV0gwdVo4WXJjWXZtQm9wZ3V2Tm9GTksyZVp4SWJNT2w2?=
 =?utf-8?B?WkVlc3NHbHRTZlA4Q1dtN2xhd0M5UjBmM2dQL0tYWjM2SllRUW5VTFR5dWxo?=
 =?utf-8?B?R0wwNDZ3UjdKSDdnWElFMVdJcGp5bXphS2tEK2tEQUZBMG5Wd3lVYWVQbkhn?=
 =?utf-8?B?blVWV3AxRWZFd0xsVGFuN3pWVXIyMnQ5eEZCMWJwK2tKNmRGQWtNRTIybVNZ?=
 =?utf-8?B?bmVVYVgvc2pmQjhJVmthdjAyMk9QTVRGTk1QcVJyeVE4M1piL1pjTis4UFA2?=
 =?utf-8?B?WkJOcWMyUE5PUWlSZ1Q2YmZvVnpqZGhvNVgvMGJLMjZGNTA4aTk2ZVdmV3BI?=
 =?utf-8?B?WHhXQzFsVUd5NXQ3VDBaTy92RXhZTGltTWNxSjBTWkxhNU9acWthWndKRnlC?=
 =?utf-8?B?M2FHUXFiMHdISEx4RmI3clp1VXNUM1FueEdBUDN4NGNwbTh2V3EzTmFrL25V?=
 =?utf-8?B?M25iM0hyZzhuRVg4V2hYQW5pSW5QN1VuSUFXUGpXVC91MkdMcllOSTlnTVpU?=
 =?utf-8?B?eWhIY2lzV3c0SUVQMXBXdmw5N2xUYmpvUWlIdDdGV1dZUkZQTjUreTBpME9B?=
 =?utf-8?B?ZkhYNHlMT2ZjaEY5YlJzSkVXdjQreEUyQzBnSTBuakdnMXZQRmhNdXdZZ0Ur?=
 =?utf-8?B?YllYNUg3NE43QzdGZzBPSDVCS1Fza1BRdFFZZWRuTXlKYS9oOU50L29GOHJI?=
 =?utf-8?B?azBuSy9zUDhKOU10SFBlM29vOForWGdDMUtKNGozU1NKM3h5UDY1U1R0cVM1?=
 =?utf-8?B?YnhrTVQxL0NSQ21tRWJ6M3ZIUitxajZXU3MwekZQTVZOS3RQMmV3UUlsUUNo?=
 =?utf-8?B?SURrbEswUHF6ODg0bmZkY0VIcXF2b25zbGEyc2pWR1JoMC9rNUFaaHg2cTB5?=
 =?utf-8?B?emdYTnZhM3pSMWFoT0Zab0NWMjI1MnFwS2lCOStwa2FUTXZLMW0zemtrQTB4?=
 =?utf-8?B?RnNZSEVoZFppcXVtVUEzVGdNdC9tQmh5bjk0bUpJamdxcWxheTBRZFZTaVZ1?=
 =?utf-8?B?WS9mSlJxMUtLMVNac2d1Ymx4K2FpOGRySjBKUnN5RXVDVThhNllwRGJqMklP?=
 =?utf-8?B?KzdFL3dLQkFXc2tJY2xuTUNyU1pXMFdXRkNyVlVPUk9QOFBNQk1DVlQ2Y0ov?=
 =?utf-8?B?R0RyTUFVcGh2bUcxZGo2RTZoVCtQdlZ2amNSaHVGUm92TmxYaVhoZ1BZTnFo?=
 =?utf-8?B?aUxBMElic2FiRFNqNGpCRlljL3dRUmJlWk4yS3QzNVhrdDJkZE8zclg5TU5q?=
 =?utf-8?B?WkZNODFnb1dSKzYzeUhnRW1OSWdvNFhCR2EzRkhlc3ZSMTd5S3FsTjlUdGds?=
 =?utf-8?B?SnZTTVdNNUlZd3ZPOVYxdFladXFOUllGMER2cTREeHVnU05LaDEvUVRzUVpa?=
 =?utf-8?B?TlBMWkN6eVVrRTBQbXgyeEZUL3J1MFJEMVZLaFdiajZsN1NaK01ZMlBod0tk?=
 =?utf-8?B?cU9WSXhpaW1MNkVrcENIR29LY2ZVS2tVUVhFeldZNkRYTkhaOFllZUhqVkZx?=
 =?utf-8?B?R3RpNnU3Z1VsQUV4SHdrNGhSVlBvd0g2NlM3aFp3MkM2enZSTVVYY0RJMDM2?=
 =?utf-8?B?eGMvTmc5ei9HbjJLNHZOQlh2VHhoaC96NUllaWppemJSakc1cTA4NkhLbElM?=
 =?utf-8?B?TklDeHJ3RXlMTjQrTGNFZUI4OHB3aWhVb2c1R1cyUVdQVytOTzRXV2Q4cVcv?=
 =?utf-8?B?WjBzcUxBVXRadVU5M050dz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmhSbmZxZVQ3a1ROR2lYQm1PRkp5SjRnT3ZUakcxUEp0dzBUL3I3blJlOWJo?=
 =?utf-8?B?OWNEc01meFZtKzRqQStjdnM2Wis3WFd0UDBZU29yRklObkdlZXlzQjdnYk1R?=
 =?utf-8?B?UExpU0ZhV1NOOTRyTkovU3JMZGxUcWtIM3g2VHRJcHYvVmFCMmRQSEsyU09P?=
 =?utf-8?B?WmlqdmdpN0NpUWQxYytEbHVmblcySVpMR29YYytua25rT3hXc2NuRHhOQlRI?=
 =?utf-8?B?aWx0SExwWXFvUmZGcU9HemVxT3U4SkpoaGJvWFdqcHNmdjVoTjkyRTQyUFQr?=
 =?utf-8?B?NXJ6N2d2MTZxRDFOVkxQUFl6am1rbWN3ZkdOV1JsWkxwY2ZyR3l5LzVmVTE2?=
 =?utf-8?B?cEorak16RFlqb3Z2bUpORDFENUZYRFdTUS9kYU9YbGs1TmYraTQ3UlVyVkpt?=
 =?utf-8?B?czQzVWxCTjNPQk9LVUhtbmx4Z0k3UFpDcUpkN0hGa0lFRHZFWHA0ZDBQMVM3?=
 =?utf-8?B?S0dIS01xcFV4VlRnNDF5L1lrL0haeGp4dXJIbVY4V3ZIeEVsYzc4NkV4WnJT?=
 =?utf-8?B?U0lYeDZ6RnBNRjBXSXdhVlJ0T0tHVWRJMnFvZ20vWGtiTXlwaWxOdVpEMmlC?=
 =?utf-8?B?eGFOeUI4OTN6cGNwQitQSFB5Q3I3TkVYS3ZOc0tGUnRDNU9pU3hCSVprdHBI?=
 =?utf-8?B?N2xXNy9VUHBST2xnalk5RDZUcUV2dnRHUkdOUDdRbW9FYW1EVVcvY0h0WGJN?=
 =?utf-8?B?TXhWZDM3L1NZb2ZUQllINUJsRnhwa2tLMU1ub1JKV3VqK290bG1ST0NEVmVu?=
 =?utf-8?B?Si9xMExVOHJzQndmTkRwRTJ6d0szNEJNbEFhSnNWYk90dFFVazdVblVFa1NW?=
 =?utf-8?B?SFVsMEV0ak1NWTAzWmdaWHJiT3Z6N2lhaUxaaDQzTEZoLzZJZXpWTWxzem81?=
 =?utf-8?B?cnkxNkx3R1hIc0JGN2NSV1hnbWI4S1RXcHU0UEVpRkV1ODV5NTF5ald1RWZP?=
 =?utf-8?B?cEZnYjNDWGFkYUpLN1dKK083RFpiejVGUnREeThMZUN4VzhTVWhYOWhaN1Fj?=
 =?utf-8?B?dGo1cFlSQmlDekFNbXZCdXJvdFA4TW1VcEZJWnE5WGFmaE9pTVRsUk1HdmQ0?=
 =?utf-8?B?clFFZVRFWnRIVWFNWGdJYmp3ZjNBcFhyUTBtTVg1T1BYTWRLVmRxdmdzRnhu?=
 =?utf-8?B?eVoybWxzZFVBUjRWTlE4bnh0bitSRjlNbjhxdEFWa3h6UHFua0NERk5YMENh?=
 =?utf-8?B?ZUpXb3ZVVjFjM3BZTDVMV2hYcG1zUGVXbTFGZFk0TXp0QnNYaU5ZdC9QMWFR?=
 =?utf-8?B?bWpSVUVpak5BT3A0b09mbXpueENJU2ZGREZXNFllRGpaZUgrbi8xQzlmK0Vs?=
 =?utf-8?B?VDcrandtSUlTTDdnVHNRdktxWE9sN0RPazdybTBmMmlmSFRGZDlvZkN5UFk2?=
 =?utf-8?B?QzdnNjIwL3hLSWt0S1NTMVdpTU91aUFDZVlSUGNnMnpOMVZOL0hLc21PNFND?=
 =?utf-8?B?bElZak1ZTVRUYTFUQkZUSVF1Q3BiQy81ek9hbTgvODVOSGxjSHI0ZXU0SlFC?=
 =?utf-8?B?ZDMyRVliL0x6UHZITHVoV0ZlKzdCZHhmR25LSm81N2VhckF4VFBUd3Eyczc2?=
 =?utf-8?B?a0k3c2toT2kwWml4d3E4R1pTemxVKzFjRXQ1UEgxRzBDKy9idnl6UnpIdkxR?=
 =?utf-8?B?WkhsckZUbDM4VGNoR05wcGh0UnlJK1FReUtvamRZSG92cXMybjNPVXk4K1Qx?=
 =?utf-8?B?RnI5bFBySkpWSjEzdXUxVGtHWGRhbzRqa2N4OEFEVzQ4bUtIUy9INmhZTFhS?=
 =?utf-8?B?Qjk0dlU5TTlXTWl4d2MwOUYwSm5jZlY1bjBCOFo1MSt1TmpRNkw3bGxRT0tE?=
 =?utf-8?B?cmJBWkJqSU4zb090cUYxbFB0dnYybkQyT3lIU2pCUzJ0d1MrakVlOFBDUWY1?=
 =?utf-8?B?QytxZ0xVQ2dLcW9aNzZuT2RpcmR6RmkybVFZamRaUVJwOVpjam1FUnVjQlI5?=
 =?utf-8?B?dkcvRlYwbklMdUFMVllrYWh1czRtMEhGaG1GWm5UU0ZweGo5eDlkb2wrU00x?=
 =?utf-8?B?MFdJdUJ3MmMxT016S1dNUjhFT3pyWk5iSytsUVowczdLYWh4YmJ0STRVVWRC?=
 =?utf-8?B?QUFENTY0TFUzUXVzdDRlNWhDZGVuSXdtM2ZISnhFaTJVOUZZd3U3c2ZubkJi?=
 =?utf-8?Q?X2D3eJt8Oq0dHHYQO8kk39tq2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94e5f3a3-2ed1-45a5-4835-08dcc2908ecf
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 09:55:30.9814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: efvC0lQCLTIUlaNhlVeWgAMh74lid/Qn7QTocKLE9txn71AJCiwNJJdlGMxL4M5o2TKavMAV6XauyggwWE3Ysg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6101

+ Mario

On 8/22/2024 15:23, Shyam Sundar S K wrote:
> The commit 426463d94d45 ("platform/x86/amd/pmc: Send OS_HINT command for
> new AMD platform") was introduced to enable sending mailbox commands to
> PMFW on newer platforms. However, it was later discovered that the commit
> did not configure the correct message port ID (i.e., S2D or PMC). Without
> this configuration, all command submissions to PMFW are treated as
> invalid, leading to command failures.
> 
> To address this issue, the CPU ID association for the new platform needs
> to be added in amd_pmc_get_ip_info(). This ensures that the correct SMU
> port IDs are selected.
> 
> Fixes: 426463d94d45 ("platform/x86/amd/pmc: Send OS_HINT command for new AMD platform")
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
> v2:
>  - Split v1 into two patches to address a fix and addition of CPU ID
>    support
> 
>  drivers/platform/x86/amd/pmc/pmc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index c3e51f0a5c33..f0d389cf1ecb 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -359,6 +359,7 @@ static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
>  		dev->smu_msg = 0x538;
>  		break;
>  	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> +	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
>  		dev->num_ips = 22;
>  		dev->s2d_msg_id = 0xDE;
>  		dev->smu_msg = 0x938;
