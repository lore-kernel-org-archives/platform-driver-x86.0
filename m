Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2121.outbound.protection.outlook.com [40.107.96.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7467EC3
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 16:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712766904; cv=fail; b=g74lU7AoVgDiQHytq/VP9tX4mv0Vk8weaopk2KUu9tSwNa2Jd1rwO66rvGbvO6vt+GrJYHb00kXaYff+CbZeuqIVOnDjVKf6oMDWuPAx4ayJRMbjkGK9xbepawMUCqff3xD7cVyWfM96t+D7Bc6rAngkLTQByRmLQs4SqsHcvjU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712766904; c=relaxed/simple;
	bh=VuqWSHYvmFxKTosWj8w9zw57xdM/Jv4ahorDYwNq9hE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OxvIIVQT8Qkufk6ertJ7Pl9JMXWeY7b4DXaKjJ473jODyWxN95dzPSjq/R/ov2GvpynWc2BQqWQ9c1B2WApvOIPWMxxvWuB8pHegusSUVMYHNGHN5Trm0UrdSfAJR73HY2X2eRh9lDXCOF2Q4fk7HwMdQBCNuERibVsmxRcwIs4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ro3iBlpz; arc=fail smtp.client-ip=40.107.96.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ro3iBlpz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mfY1/Vy3eEWXhhG2cxo7cMtNa0jkaJlVlu/pkz3Vt2oU4sNbH5vYUmM8JIc6M5Jh3XfcdQYYVRgiZXWopgjYhLdyuBI57Lxv0EwpIP3/h7NWdxxpTmFQrfirwwu/dMvtEMnF8TqynVrmwDxnaOLqjti3xOaiYwuB3Udm3nJGDcjPDO5sXVmM0iU/X4Odwb+GJ5iE5N7UWv16lEEbHaSHncSz9RBrsdrnUlIA+/bEOxRdbvQBJZWhkpXJIKM4cUAxcoptlJwWR/xFEH2G9fm/wbrT5KL1zYUZBxBJ86Fi/sCBkfwjrR3I04jYSO+YH+Myg/t2O620kW8kiGR1CjblNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+1WpqXOht1WNt4Eh0taLBjpLOx8rFTCex/gOkZ970QA=;
 b=nFbgj83ojdKtPJsjcSlCUxoQ5KT6m8MWmEfcXpK+NiN9FynTy/trDtmY10V81UGx6fPfEdZrE7NlTvc9Urkpru18NIR7UaJdnGY9r9enC0H2l2VFvsnZ+CznhajlB52mMxYLlJvOEF7V6XSUG4iaafXlnEx7ZgGMk/7x1Xs0hcNhbpS51U+/HZEmAKNhM2AD910adIQ45BE82uW5hC0HF4/jOVFQ8LRbObgI2RFNICa3PRz/pI6t0gkg/bbJj2CqJFVDxdgKUhonTo5gpuuDtOxBlaHxtojxbjJsARj1qSgfMJnoJdUfIKWHZWLTsdX/8PG4DeMFTlnRqqA+LnzNYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+1WpqXOht1WNt4Eh0taLBjpLOx8rFTCex/gOkZ970QA=;
 b=ro3iBlpz4qycm1j11F5JwRJC4aY+eFezuUbyJoomkb+a7Uiyf/LKAYM/CrMtjXzgHZ5JiLQxLcjC3qUygds5V7SoR35lY10xUxWH2bBWDB0hbWxd3VDjpAJajHNnRjsjmrP0o4sOShhLND3VGds5NUdlcgzco3qYcM7PrYvaI4M=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA0PR12MB8256.namprd12.prod.outlook.com (2603:10b6:208:407::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 10 Apr
 2024 16:35:00 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dcf1:946c:3879:5765]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dcf1:946c:3879:5765%4]) with mapi id 15.20.7409.042; Wed, 10 Apr 2024
 16:35:00 +0000
Message-ID: <e66ee525-1f54-4c4d-af73-28dbce5910ba@amd.com>
Date: Wed, 10 Apr 2024 11:34:57 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd: Extend Framework 13 quirk to more
 BIOSes
To: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
References: <20240410141046.433-1-mario.limonciello@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240410141046.433-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0011.namprd11.prod.outlook.com
 (2603:10b6:806:d3::16) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA0PR12MB8256:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	plkzJYvPa5hzSoFkdF95JkBXEMBKcDrANQNBGqMVlckVRlx2wCwuxTCBqCtZk0JTEvTKqEfaajlJhGxJsenowY/00PLy5vdhXee94hflgZDKrYaTzZtBMTdfbrzeqUkdIFvqSvbUPLk8k9VG0Rp+yJvzOkOWXE7arXKtZ009pin1AU20LyY64LP111GN+DDKYv71ZJYtyD459LFGPhMF/sccdrXzQuAdo1zDmA5NFhoNE8mMaxiVqyb8Sc/x9pAcZvY/LDmVhJUujxRAn4D7CzU9eDgCZwa9S6btP1+h8mwWtxz30HlH/paTwmkO8qJv+Q3v+YGzSLdmwqLNczFJ7aYfaDpgguX8tUjvEUbfwPRC9ONvUvhFhtnX01sGEtxbWxIi8s8Rd4axy7ucpwkrRA/tvJwhXBnxdoUP15npBrs+cC1CLB4Z8JJ0lJU89Kg1miBNbRJNjgKqnsKuQCsNROevQouaJOKWskaz6iDuUW4gOQm6ODQCpHrZsNRAJPoR6N5voJP6glbjDtIq6voy/rRRyv9FApbnPpAIG31UzWM3J4TCXDBGJx+dRxo2Len+PyiisW8kg/6kFtg8D9pHxlhRAfzQAsoq8QsYpdAPHPw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlZOZTVPVEs1Q2QyN3hGWURjQllZbGZDaGxNTWZTTElnMVJaRk00NzIrQWZR?=
 =?utf-8?B?TVJ3Ri83OEd0NUlVb1hraFVwZjgvMUl5RXl4a1Qwb2g4S045Z3Q5L2ZRcEtq?=
 =?utf-8?B?cnRaMWxnZ0lWVjhGMXlEeHBXU1Q4K3NVamVyVDJabTBZNjBveTZRRG51RTFC?=
 =?utf-8?B?bWlYdTZpcHRwVHR1SkY4SEEySUhzUzljN2JGNWJSbGlneERxUGt5WDNLTTdB?=
 =?utf-8?B?N1ZYRjFXTHVYMmZmT21XbXFiOEJQTDgzNnozenJsd2xuUFc0dTVpU1V1YkFz?=
 =?utf-8?B?MGdFWFluZ0gwVFgvSkltOXptVnpoT3NKSVh0MWNneXZUblRqRStIWGphd2l1?=
 =?utf-8?B?ZElIY3J5NGtqRHNRM2tPVWwraVZwWVZJd3lNc1IzaTBJR1lMV2xrcWk3YjFH?=
 =?utf-8?B?d016K2RtN2Z6YWNGSytkdmJRdGdXanpmN2l2V29JN1ZqWXBDS1hRTjR5V3Ns?=
 =?utf-8?B?aW1PL2JvTWFhbFErWDB4QXdKWCtBTDE2WEY3dmpDVytZNFppMUZkaTlBSnEx?=
 =?utf-8?B?NURwS0NNUGx3c2xaQmRKVXJJbkNPdURQT3lGa1VJTWJ4YWFiSTJzaXp3V1ps?=
 =?utf-8?B?cDRWRHlSUVVlV1gyRlN2QUlVYklLR2YxRVB6aEFNbDFNYXJFMXRuSG1za2Nw?=
 =?utf-8?B?VDBjZEFzWDE3SGJ6V2lRWjZWWll4NE1URDZsZzVxREM4bnBLODlxQmVhbzJl?=
 =?utf-8?B?U3VKNUtxNmQ0QzAxdEFrRTMyS1BhdzBIZ0UvMkJYT1FhZVdqUmdzOXR4NlQ4?=
 =?utf-8?B?ZVBDU0JXVnlqWTB5by9HeEhUOEtXWXhIRUJPTjNpVUlPVnp6VEZyTTRPWHdI?=
 =?utf-8?B?a1hFMFd2Q1A2V2oyWUw3OWI0Ukplekc1VHVrV3IxSE1TVVNaYit3TmFoZkdu?=
 =?utf-8?B?V2EyMlRxU2NHTk1rTmg3YUZTOFdCZWMwSlVzTDU3NTB2cHZDZDBEdUhmZGVI?=
 =?utf-8?B?ZWw5dnU3OGEwWG5Yck1BRE9yY1NQUlQ4M1Y0WENMN1NxQUZOSlNiWlFGbERZ?=
 =?utf-8?B?RnBqeWcxc0U5eUhiZ09NeUNqWHFKWFNneThDalNCU2JoVTVuRWNqL0J6dEhH?=
 =?utf-8?B?eHNoQ00wVmJNRklFMHhqa3Q2a3RmamwxVUtUcXJPcjBNenVuYVNBOGM4UWU5?=
 =?utf-8?B?ZU4xc1o4VVBRMWdzTW9CUzdEcTdaSVBJaTYwWkI3WWhkNFhnaGxjdU1EeTZ6?=
 =?utf-8?B?WFZoRU81eE84N2FRa1lmdm92bjFPLzBiMzY3SFdYSWpJQkkzbzlnVDRBRnNL?=
 =?utf-8?B?RlRrQldsTkMvbFRpQmE4cEZXTExPZXBpK1AyZlBlcm5uWElGMk4rWlA4WUV2?=
 =?utf-8?B?NzFBQ2dHM1lObEdrbURpYkpzYXZoNXBwZCtBbm1MODlOV2FOcWJiWURZR2Mz?=
 =?utf-8?B?eE5qbm52RUtkMStzMElzQlhDRFN5d01QenNRRmk2aG1WL1pZb1lhM1VwZnc5?=
 =?utf-8?B?YysrbFExZFZXcEI5RmM3SlkvbEZHMGdIb0NNbUZJclQwY2hkRnNVMmRPeG9B?=
 =?utf-8?B?OGFGaFNGamRRemgyQisxYXpLM1BnTXcvRk5jY1VOanI0M29NenFKc3FmbVBn?=
 =?utf-8?B?WE5WV0EzdVJCbHlrTkpnc3h5YXNSUGljSDZuSTdwMFF5U3pYSlk4WU1IQk5R?=
 =?utf-8?B?SjJ3MzVseGF5c2txajJPRk1UTmsyd3FOUm1oS3pxVmw2RGtZZE0yNDM2NVZN?=
 =?utf-8?B?eTluTWgxK1ZmdjFBK21KakJjdlVsaWpBUm9NOXBhY0pERXBPNjZKTzF3R2Uy?=
 =?utf-8?B?K2RveU44UW1SVzd2V3BhWUpZT2RJZUpzSERqeFRQZUpPTFl4T1lGbFd2cW9k?=
 =?utf-8?B?UEU4L1BXQ0RQcVFmcVN0WWRXcDF1V25oaWpML0N0NjNlYkI1SFRoUUo5ZDg5?=
 =?utf-8?B?c0pmWmNYeUV4eXZBd0dTZEg0elY2S3pVRFgrcW91U2RHbzd5Rk5uLzExeHp0?=
 =?utf-8?B?cENmRHc0bzRTY0pxcnppc3VjRDBxaGJjK1l0RXVnVEVxaVBXN1hKYlJqWkk0?=
 =?utf-8?B?MUhHcFJReVU1ZFA3eWlJU0dvRk9JNDFXbk9EUXRHUW00dDNPVDJXQWdzbVZF?=
 =?utf-8?B?UEpqZ1pIb3RGa1JIWHRzY0hJWTVjNUVsVFNuL3VxZGtYaXpwZFNjck1TZDU3?=
 =?utf-8?Q?Ly8YLsqkEPvnW7geT3WV8K+Fo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7620ae9-e42a-456f-2ed6-08dc597c2a26
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 16:34:59.9544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2qI6G9np2VxccG1EbS21oUfXiuXEAfhsvLFeEMbnZMOI7uebhkGeBndhG6nCAre+sZWzgKcmDvI0LHNK2ySyHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8256

On 4/10/2024 09:10, Mario Limonciello wrote:
> BIOS 03.05 still hasn't fixed the spurious IRQ1 issue.  As it's still
> being worked on there is still a possiblitiy that it won't need to

Sorry for the typo I meant "possibility".

> apply to future BIOS releases.
> 
> Add a quirk for BIOS 03.05 as well.
> 

Here is a link to the BIOS:

Link: 
https://community.frame.work/t/framework-laptop-13-ryzen-7040-bios-3-05-release-and-driver-bundle-beta/48276

Also want to call out specifically "Known Issues" to show they are still 
working on a fix for it.

IRQ1 will always be triggered on resume from standby. This issue mostly 
impacts Linux users. We have a potential root cause that we hope to fix 
in our next release.


> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/platform/x86/amd/pmc/pmc-quirks.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/platform/x86/amd/pmc/pmc-quirks.c
> index b456370166b6..b4f49720c87f 100644
> --- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
> +++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
> @@ -208,6 +208,15 @@ static const struct dmi_system_id fwbug_list[] = {
>   			DMI_MATCH(DMI_BIOS_VERSION, "03.03"),
>   		}
>   	},
> +	{
> +		.ident = "Framework Laptop 13 (Phoenix)",
> +		.driver_data = &quirk_spurious_8042,
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Framework"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Laptop 13 (AMD Ryzen 7040Series)"),
> +			DMI_MATCH(DMI_BIOS_VERSION, "03.05"),
> +		}
> +	},
>   	{}
>   };
>   

