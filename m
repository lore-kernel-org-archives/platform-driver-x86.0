Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010011.outbound.protection.outlook.com [52.101.61.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E236231832
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Jun 2026 07:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780989833; cv=fail; b=KcATP94DJXw1wi7YwyenJ2onsq7RvduJZsYJyLHB0FWA3sxMLboDaUAiltiVw6GU/FIeXBuD+MRlU6lJZgOyryHz6NfnbtPhiqRFsLDv8cu7HGOSSGXAEYqCNgOt+zDGwFNmv9GE+u5THVn2QIic9O14VJy+aq3Bf8z3IrXh9ic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780989833; c=relaxed/simple;
	bh=niNRz5sy2Cc+nD/rzCrS4dTN/ZQD1olPoKW06UTzcMU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GeRqQnILwuqJDxtFr00ypOJk+P4qtfKba7bNhxx2PBKw72lEjWFtX8PPEKM13p93eQViu/NK2gbDA1VeCoLYx7FrYsFBEZeNmz/375NdAu69JWzTcSNgjP+fxe8Eot/w5fwgXNY2mw+q0dEVvtuP2mHY5tGaJw+GN3C5rGte7rY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pvUPbi5G; arc=fail smtp.client-ip=52.101.61.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pvUPbi5G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M5upmcGTuKqgnDCBC5r0kVQVCMycdhCVCfgFXsvznOP8h84JZPkekqTCiwIbRjakJFPhfaboqtmoKeck4dxW/bSvGjPUZ1wkMvnwrAEkKCqYoNZx1qImIUDnmHS/7PAjYCNs7vUE/FhgGLdR6B4a38H4DPRXzA5taEERK9OWFPpK7E+7c+Tf082+LEb7vZtqDnG+DxZsu1eg85tIOx9iFAIc19/Xbi/pbcPSqg89014GDMIHTlNApACOWVR2THn2S8l66vEDYC2TAkcONzFFy85vUqxsy651BoIYcQ0bbiNuUEt0jUvPWmKtXPR4KaaG/iYc/IinJ9HQ/va0dfN3+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ms4OOk2uGOwb5kXJ5i/8yX6Jm3bWjAMb5UNTCySWF3w=;
 b=jVPuTEF8Vtd/9/4G37nkjgkm2erF/DUR7AJeqUHNg6Inp4PsN3Msxvzot7Qxiciv/72JQp/rY2KRvOhGN6eGHJ5fOZdEHeYLzD1xopS8BQlHltp8zhk3Qg+JkFoNCo8/tz/VBhvT4+jHgqDsh+QwzUoUl/qAzjtqvH3+kFiU1HVQaynaa36xBbPgWv2wKNlHVHa/ozpG0YFn8oF6wq9zXoJiBcYoupHUNFSfaOlap+7Xxn/eYb8zepbLvborrXSt1+JQyQ1dhTAP6EPeZVyowMOAjPMAQHyDfw0ClTjLQgMgACUnGmWezQP+u1bMmrKYdShNyT7hgoSIXcLgR/GqRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ms4OOk2uGOwb5kXJ5i/8yX6Jm3bWjAMb5UNTCySWF3w=;
 b=pvUPbi5GBkDvXRU2B0NmF5PL3P43KNpCXs0YXL2zVT18NQvp3f3HXleLFxaSvTzd46u8pNbYJib4UNdKXsmJgXUaEIH7Jd+tQEc2/a7uCo9u2YOX4GuhVGQEEBXm4nhYrqLR9TBlfQX5ySoeX7ZhanEJF3iF9UM1Tm0+kQDwVJk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by SJ2PR12MB8737.namprd12.prod.outlook.com (2603:10b6:a03:545::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 07:23:49 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683%4]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 07:23:49 +0000
Message-ID: <51a1ec2f-f7ae-49b2-9377-d4e57a34cde1@amd.com>
Date: Tue, 9 Jun 2026 12:53:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] platform/x86/amd/pmc: Add PMC driver support for
 AMD 1Ah M80H SoC
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 mario.limonciello@amd.com, Sanket.Goswami@amd.com
References: <20260601112103.1690951-1-Shyam-sundar.S-k@amd.com>
 <20260601112103.1690951-3-Shyam-sundar.S-k@amd.com>
 <13db00fa-ec6b-4de7-d5ec-c9d9895af7d4@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <13db00fa-ec6b-4de7-d5ec-c9d9895af7d4@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0283.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21d::14) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|SJ2PR12MB8737:EE_
X-MS-Office365-Filtering-Correlation-Id: 2666c5a1-0a9f-4c64-35e5-08dec5f80cc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	UI/Akl07UeDd72KI8oj6gudrI/WN1godrVTDVXfYIdk4pisF1cFGqZZLjrAanTX/66sjwbWIdKoin2X3c1fxsA4f8py7gRqfCL+LyG/OBwpmTFve6veoLIDPHgXk1UxRzsVAgLZWtRpl9K+Sc3xiMkPHysbBiWAKa9RTRVPlsyXO2MUjhWa+vdapxVOe5bfrJYUMb1RROgXVZwXZEw8L12MECFRGXYqecK+wstnDgPKCFuLXksY9TOzms07D6hfB89sjfE2GqAr3frivWL4QcNfMJjwkn8MJ87emJ1vdEqQkJWN846s0jyMIGQuEHPKSe7/iJt9gsdEnvNPmIPTl0EPhgHGOXBmfQ/hh1/6RSnNbtGcEBFz5uKC+pzHGkm2Nx5e62ERc5ZbreRTq/A82ye92hQVa/N8KTZF501hnPDUHiZoxvhrcZxWiOTli5CigFxHSqoWhJcXpr8f5s5b+2VjY03kbiYdNQybAOohy9im5tcAXPAgg7K1k30YlLbTLdP+qJhICuJXrqWrP3Fn3d4Kn5UPvp+eaBwA7gYUKkmqgomkKeeU1lEt8SEBkGtfOVmiokFPjnQLURx3VTxrgo45uciab92g9cTevo32EEP1d5RyUu5rmz/J+CEThphVh6NWnF5kI5T8YEUyOdexB36ZawIq/0ZQ2wIbJO2KCRBh8X/1czK9nvGw8+TVHBOFU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bE1jZnJNM2FlbUY5bGpGR1B2ZkJwL2c0ZEIrQlowL1o4a2gxN1NrUGl5aDQ4?=
 =?utf-8?B?VzJwWW5YVXN5WTl3NkdUc1RESWJXN1o1M21YSkZ6RFFjeVVQKzdoTWJsV0gr?=
 =?utf-8?B?T3ZxQnRCOVZWRFBqMkFtSm9CZytsNG0vTHBWNUx6M25mdDdpWEJtTmRsUENE?=
 =?utf-8?B?eVhVV0RTY3FwSXNCNW5GUXNnOW9XSldBUHp0SE9meFVZSkphUEthSEJ6aDlB?=
 =?utf-8?B?V3lyTllVTS9LcHVlMVVHajdWbXY3SnF3MHQ4M3AwbDF3QVIxOFViVkFTUzFs?=
 =?utf-8?B?SGNkeldtWlBSa0E1bU8rK0l1L3dXbnZCYTJsZzZGU0dZcnlCTGxaQ1kxb1Ji?=
 =?utf-8?B?eU5kVHNhdUM0ZXBpQ1o3ZXlvelpIbFZpTUhJYy9qdkp3L3MrVWNmN0JWZGJE?=
 =?utf-8?B?ell1bnhyQXZYRHVYU1VGRzREcDgxcWEvUzdGVHhacVFWZDZHYkY1bmlpZFJ2?=
 =?utf-8?B?MFFtTERHT0dac2RFcnRZTUpIME5nQ2tIOFRjRk5wcG96aHpkL3lGVXl1QmVq?=
 =?utf-8?B?R3U0L2R3SXFQc3Baa21WVXhtUVdPUEk3Ukl0ak1xMXd2WU91cWNnZi82cm9y?=
 =?utf-8?B?RjNwZnFFbnFBODl0YmdpckFvSjZEV3VETWJTVTZYazJ5UWYvTHErcXkxMTNp?=
 =?utf-8?B?aFBnWmU3ZFRRYU1DclBjT3VscUZSTGtSSHdUNDJEQlUweVV5WUVDd0J2U0Ew?=
 =?utf-8?B?UjNFSTdKanVhekUvNld2RXBNNnV5eTd3SlFWbHN2ZmpBdStwQnd6cGxocDBx?=
 =?utf-8?B?VC9oNGhOaytYSHlJMjFnTnh1dmtITmtFamhkZXg3MDFDWTBsSGswVStwb3Nj?=
 =?utf-8?B?RllLc0ptYWtuQjd3NVpKcVV2bjhTeFJNK1Z2a212bDljQ2pGTGZ6ZDJ6VzZL?=
 =?utf-8?B?dlVsZVNUSlk5ZEJzbGhVb2pubGhDaHpnL1g3ZHJxcDlnR25IdjVlRnBBTkIy?=
 =?utf-8?B?SUdyZDkzaERPaHAzZFBYVzBjd1hrTXkzT09iZ2V6K0JKOTZoK1RQZUhvdFZG?=
 =?utf-8?B?REhoMHd6MlRxMFdzaXV2VTFFbmprZHEzNFk4S3B5d0c3L2tEK2dxWXpYQXk5?=
 =?utf-8?B?UFM0NTVvS3JOOEc3V3hSZ1A2OThoZCtyMW1zRlloNTUwbGpRUmdsMkJvRWhP?=
 =?utf-8?B?ZGh1ejJwNDM5VllpdktBdEtJRjZ2VlhHRjVhSDZUQVJkbzhOeXB5UnBIdW1G?=
 =?utf-8?B?SUtzM29QTHR4NzdyWUprQUJwMGdzMUNLR0ZkTEQvcDJyM0hiNmZSSGRXeEp6?=
 =?utf-8?B?eEJCMjBYU0g0ZHRPTlFUVU9PaDZ3QWJhcWlVZ1paeTJLU0NVb2xQUndGZ2Fx?=
 =?utf-8?B?NjAwc0hKMFhhcFplMkpFcDBvV1FrbE05eW05U3BXK3AwOXdIQjh3b0liSEcr?=
 =?utf-8?B?NUtVRU10MzFzN1JUdWU1RkJmSkVLNmo0OWpvd295bXoyUnpYdk1CZEYvVzlS?=
 =?utf-8?B?cWRrd2NGTU50RmQxa1dmT3kyRlZRSlU5ZUFpNWg4Nno4emk2YjBxZXFieW5U?=
 =?utf-8?B?ZDd2SG9BeDJXSkI0eU9EN0pLakhPZVVOSlVFbUYzZ2ZzZW1LR2RZWStZS0ps?=
 =?utf-8?B?L0tHZ0hPR0F4NnRvUHZaaGQra3c3OEpWNlJ4Z1pSUzZNYTBUVUFPMHhIVEtD?=
 =?utf-8?B?Vnp3ZFh1bmhYV0xsWUxWWVFHelVGM3BlWEdFaHp0dzVZY1U3c3h3WGlaZnhq?=
 =?utf-8?B?dEMza2RtUGFaL3B2TG5UaVRCRnA2eFNpWVFwYmFVSTlJNjQ2YUJjdm04OUdp?=
 =?utf-8?B?WU9aRXpibWIrVWF0YlYxQkY4L01Od2ZpMEVKdTdlVnJhWFB3Ukxaam1ldU13?=
 =?utf-8?B?aHZ6cjQvajhVN3crM1ZyZ0R6QmRja2hodTMvbnBsSTNrc0NydDY5RUQzTnZ6?=
 =?utf-8?B?Y0paRTIvZXJ1dnF6clBzMVh5YitwendBZksvVzZqK0ErQ1BKTHBmSllkTEZR?=
 =?utf-8?B?UlFEdWR3SXF1dG13bVhrMWVsOXptcHFxbFROUGtVeHUwbUNUVGVwdS9FNjhE?=
 =?utf-8?B?VE9uRkpSL0pZd0VKc1YxaTBSU0ozQXZQdDNyZUl5ZDFiTGZucjBVNGFkcWNx?=
 =?utf-8?B?dHFJejV6SmprcDZtTWdmYXZlUE1FTEpyeUJNcVNpZkZnU3M3ZzNpRmYwSUg5?=
 =?utf-8?B?Q3AvVHlUeTl3d2ZxZVMxem1Td2VndjlscnloY1Nxc1ZHbEFYU21kNnUwbk5W?=
 =?utf-8?B?Ukw4VitBcXQxc0o1ekwyRFdKOFhKSmp3ejIzNlhhOFRSa0ZiNmt0SUZ6UWNF?=
 =?utf-8?B?Q043R01zWitMcXlxYlFuR051SkNYYmQ1QjJraGJjdHltVnI3aVFXcnBWVTg2?=
 =?utf-8?B?UWJFNUVIemxlTlBqb0FWZjQySzlTWHVsYXJRUXZZcm5uUDk2MFBHdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2666c5a1-0a9f-4c64-35e5-08dec5f80cc8
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 07:23:49.5079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /10k6z8dQsyJWby9jsfPVaTRFVJPH+APpDY86SngOCp/QOwwz7EvNcSImieM9dv6vIp3DKPtp1vcdfPLg628tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8737



On 6/8/2026 14:48, Ilpo Järvinen wrote:
> On Mon, 1 Jun 2026, Shyam Sundar S K wrote:
> 
>> The 1Ah M80H SoC uses a different set of SMU mailbox register offsets
>> compared to the existing 1Ah variants: message at 0xA10, argument at
>> 0xA18, and response at 0xA14.
>>
>> Add amd_1ah_m80_cpu_info with these offsets, wire it into the PCI ID
>> table via PCI_DEVICE_DATA(), handle it in amd_pmc_set_cpu_info() and
>> amd_pmc_idlemask_read(), and add the corresponding ACPI ID AMDI000C.
>>
>> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/platform/x86/amd/pmc/pmc.c | 15 +++++++++++++++
>>  drivers/platform/x86/amd/pmc/pmc.h |  6 ++++++
>>  2 files changed, 21 insertions(+)
>>
>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
>> index 6c7fa80c7f09..8da988016661 100644
>> --- a/drivers/platform/x86/amd/pmc/pmc.c
>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
>> @@ -131,6 +131,15 @@ static const struct amd_pmc_cpu_info amd_1ah_m70_cpu_info = {
>>  	.os_hint	= MSG_OS_HINT_RN,
>>  };
>>  
>> +static const struct amd_pmc_cpu_info amd_1ah_m80_cpu_info = {
>> +	.smu_msg	= AMD_PMC_REGISTER_MSG_1AH_80H,
>> +	.smu_arg	= AMD_PMC_REGISTER_ARG_1AH_80H,
>> +	.smu_rsp	= AMD_PMC_REGISTER_RSP_1AH_80H,
>> +	.num_ips	= ARRAY_SIZE(soc15_ip_blk),
>> +	.ips_ptr	= soc15_ip_blk,
>> +	.os_hint	= MSG_OS_HINT_RN,
>> +};
>> +
>>  static bool disable_workarounds;
>>  module_param(disable_workarounds, bool, 0644);
>>  MODULE_PARM_DESC(disable_workarounds, "Disable workarounds for platform bugs");
>> @@ -172,6 +181,9 @@ static void amd_pmc_set_cpu_info(struct amd_pmc_dev *dev)
>>  		else
>>  			info = &amd_1ah_cpu_info;
>>  		break;
>> +	case PCI_DEVICE_ID_AMD_1AH_M80H_ROOT:
>> +		info = &amd_1ah_m80_cpu_info;
> 
> This shouldn't be necessary if you get it directly from the match.
> 
>> +		break;
>>  	default:
>>  		dev_err(dev->dev, "Unknown CPU ID: 0x%x\n", dev->cpu_id);
>>  		return;
>> @@ -415,6 +427,7 @@ static int amd_pmc_idlemask_read(struct amd_pmc_dev *pdev, struct device *dev,
>>  		break;
>>  	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>>  	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
>> +	case PCI_DEVICE_ID_AMD_1AH_M80H_ROOT:
>>  		val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_1AH);
> 
> I guess the scratch register too could come from the info, you just 
> need to handle the AMD_CPU_ID_CZN version check prior to that.

Ack.

> 
> 
> I really like how clean adding new platforms becomes with the info 
> infrastructure in place. Thanks.

Yes, even I liked this idea and how simple the new platform addition
would like in future.

Credit goes to you. Thank you for making the code look better.

Thanks,
Shyam

> 
>>  		break;
>>  	default:
>> @@ -763,6 +776,7 @@ static const struct pci_device_id pmc_pci_ids[] = {
>>  	{ PCI_DEVICE_DATA(AMD, CPU_ID_SHP, NULL) },
>>  	{ PCI_DEVICE_DATA(AMD, 1AH_M20H_ROOT, NULL) },
>>  	{ PCI_DEVICE_DATA(AMD, 1AH_M60H_ROOT, NULL) },
>> +	{ PCI_DEVICE_DATA(AMD, 1AH_M80H_ROOT, &amd_1ah_m80_cpu_info) },
>>  	{ }
>>  };
>>  
>> @@ -882,6 +896,7 @@ static const struct acpi_device_id amd_pmc_acpi_ids[] = {
>>  	{"AMDI0009", 0},
>>  	{"AMDI000A", 0},
>>  	{"AMDI000B", 0},
>> +	{"AMDI000C", 0},
>>  	{"AMD0004", 0},
>>  	{"AMD0005", 0},
>>  	{ }
>> diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
>> index 0fd0ced21831..0a3b81944920 100644
>> --- a/drivers/platform/x86/amd/pmc/pmc.h
>> +++ b/drivers/platform/x86/amd/pmc/pmc.h
>> @@ -22,6 +22,11 @@
>>  /* SMU communication registers for 1Ah 20h SoC */
>>  #define AMD_PMC_REGISTER_MSG_1AH_20H	0x938
>>  
>> +/* SMU communication registers for 1Ah 80h SoC */
>> +#define AMD_PMC_REGISTER_MSG_1AH_80H	0xA10
>> +#define AMD_PMC_REGISTER_ARG_1AH_80H	0xA18
>> +#define AMD_PMC_REGISTER_RSP_1AH_80H	0xA14
>> +
>>  /* PMC Scratch Registers */
>>  #define AMD_PMC_SCRATCH_REG_CZN		0x94
>>  #define AMD_PMC_SCRATCH_REG_YC		0xD14
>> @@ -189,6 +194,7 @@ void amd_mp2_stb_deinit(struct amd_pmc_dev *dev);
>>  
>>  #define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT		0x1507
>>  #define PCI_DEVICE_ID_AMD_1AH_M60H_ROOT		0x1122
>> +#define PCI_DEVICE_ID_AMD_1AH_M80H_ROOT		0x115b
>>  #define PCI_DEVICE_ID_AMD_MP2_STB		0x172c
>>  
>>  int amd_stb_s2d_init(struct amd_pmc_dev *dev);
>>
> 

