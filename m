Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010027.outbound.protection.outlook.com [52.101.193.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349533E63B9
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 May 2026 10:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779877796; cv=fail; b=BJXhAXMHsXcp72Szm4QffGH+++DALsaAAcLX/esQzgNCv3aZ4oBmj4J43yWVJgGynLkBZ3Soi+BFPQYHW3dk+ngQUqVRGAU4Rb2Witq7z8oEEPh1Y00SZIbxIE2/G5gW9716/zXMHzLtDbabcUoymLkLsJZguTlfuh7CVjzm3m0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779877796; c=relaxed/simple;
	bh=rxnjPAGXu//qZ//fLQ2UXwpOSz6HloDYo7tIxaDKf+Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WRWAbxU35T2WJ2CgIgF3dbaMWQgEpUx5uLtivs9jgZPRytqRo5112z8mrhelx73QJcWClcvqAt/oNQd+dZxO6hHf9km5ZtTIK2R7SM5SkAAyYtL+jD9NZRPpYZnoD50YE1vPCex/iow94ICk5CFXSvT8TrEpj5UCo2a1Pt8BMBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=lodDCDlD; arc=fail smtp.client-ip=52.101.193.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="lodDCDlD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j4fHEx6Rxa6U97c6lkxrnCjT91clqerKQNDfHPit6OKLYafWKCzTieS3ROiLc7B0jvEPjbvAuC0uJsEPDeO0N4teTEGp6S1BLXkQlMFmH4imJsxkpslHpzx5RFc4eDI0ruVjueVHVgTiQ2DKtpKfyVMzlIAGx313gqLq1Vn6YaqSXDkygumkWGHw1A9+FSDRzub4epl3x6gxdhzdzPevczX0ETLkaaecMphXNiYXuNUFaY4udZl8bGIDK5A+umViZaVMAprxxwVWjBkjijm0NO1eEXCIk1itQ9J0WCQdzju5xF23YOXzAvs1c6k/CFcZkAD2X0Rhuij1WUkXS3ljjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cmsAEudSKrLvsQQ/HpbGbnKUBfyV8B9Q/Weq+oh3KdY=;
 b=jB4tV6bhb4YqgWAfNyUGtM1l/0zGpYdJTO56zm2WhnEIETEgXq/q/CsRqNXQSSv/30unmsvPrUN4B7HQGAZjQ+i6pt5q9ctOfZCNcyMY5Ef+qqv2/l7Z0uZwjhrskPH5KpNc2ss20KOsOLjLsr36aT80eqU3og42r+4zP8V4Yrt8xcNk3RHBNjoa8ApktR55u4JEtK44vMzG4Q5rILkeAEDJIKNejFOTH/XFt0eGUzZn5ODPqRaY5wFD3OQqE6+uRlCE6EslPHbiwVJ27qQPOmmnePkQbk1UedTKONX99XqMgkejLOcB8rNb7cmLQmuA0G75C6Vh5yIpSdZNcz31fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cmsAEudSKrLvsQQ/HpbGbnKUBfyV8B9Q/Weq+oh3KdY=;
 b=lodDCDlDT6ZHYNGnBwL5etn7Kpmind4+vMwSsee8o75hZVJBlJVi6kxOpTeaspJtao7jE+5Oki7QlMh79RaVsUDPFHNQm4tkGgE+GMfMMjhZjQfBcfufCu0qa9r+3c61lyUVtM3Yy+ZvhWkpmHIAutIpAq2t3LPZCdrYkITwo88=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CY8PR12MB7731.namprd12.prod.outlook.com (2603:10b6:930:86::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 10:29:51 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683%4]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 10:29:50 +0000
Message-ID: <76572ee3-a7f5-4b11-8cd3-bc4cf59c520a@amd.com>
Date: Wed, 27 May 2026 15:59:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] platform/x86/amd/pmc: Add SMU mailbox offset
 retrieval for different CPU families
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 mario.limonciello@amd.com, Sanket.Goswami@amd.com
References: <20260520191149.773196-1-Shyam-sundar.S-k@amd.com>
 <20260520191149.773196-3-Shyam-sundar.S-k@amd.com>
 <ec3c0d30-f852-7329-c53b-e999776adf6b@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <ec3c0d30-f852-7329-c53b-e999776adf6b@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0144.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::11) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CY8PR12MB7731:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c6e73dd-7b4f-4b60-a736-08debbdae1a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	MitoACpKCxkMK435xroEU2/xZwOo6Ip53Jpi2ZvHXhBQmairbmoTxMP+71AsbJVvYGEavyS4Ek2vlMR7EQewgFVVIGMUOJaTlnFKaeFWNy9ebhOBLtNaJg+nYFCXzn+woT0s4GAKUvw3LGycELJeBaElVE2Yu8feyYQMXfajBaZzXrhmqWAzElqSA6w/xk3iPLe3Ie1ns4MYpwStRCIJue3s3PcRsKQ2KpDPRyxGSAhOSnKMqUsrhWYw0T4g7FGhNQSmE8t/rjNa/psqjkqwc8hRv086yaag81qIzZThXaVfAJLoqqaphYGEqIYtOC6b7to+oteZ+7jssmx6jNmiVWl9s8tqtqPZjSCY9aL0aTar5tdLoVinjNrPYP254U8CRr9hUF8Pkxfa0RoCuoHKbV2gXNLuG2eDx9Ss4bxF2MLrGxZ+T9h4OItTU5m3DYuCBBiaFkPDdeEbjOv+qEphh5PyTyVqnuozO8x8orIypLxI+FUrKrvEuEeS7nHuNKPaoEtjXt44AEfS2mPN0heEOXHjz17ASb5X/Q+s1gEjAO8s8LFoUtL4ZY7nhJ51f36bfu+GMDHOTEXg6y7YcO6L4MdyFaKi3tEQm6X94dqMcVQjzBmmyqqtL6b8t+tj4LeIE38BMlzx5pnyCBgr9JqHl06M8eMTK3hv9yRJWaZdHw94YmBnnotXygjg4tJ3RNh+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVkyZWczVlUvZGRUc1A4UTFPUGQ5RW8rRVlDSkZvLzN2ZE5tc05xSVAyYlR4?=
 =?utf-8?B?RDQ2NlhMOEpvUmVMWnViOHFZNFd6cXlwMmxFTWFhRUVxOVR5bkk2UFFyd0c1?=
 =?utf-8?B?VGt2RjdMZ21CaXJtczYrRHdMMDlkMnNxb1oxMnNqYnJIczhpMmY5R21SbGlZ?=
 =?utf-8?B?bmRFeGRvUnRsTEtYSE1lWEpVeWg2S2xSTk44alpoZHFSZE5ac1lacmlTc2kv?=
 =?utf-8?B?Z0NFWnRWN0UzaTFxc2M0WEtBazhqS3Q5OGsyUUlVWm5oOXYvckdFUzlYU1ph?=
 =?utf-8?B?c21qMmVuUVM1NFlXcGM4OWRyeThwaTRMaXVmWEZ5amZNS0wvemV5M3duUUJF?=
 =?utf-8?B?Z0d5bUExVUFzeHI0RU5obnNMb3dIaVVHV0pqbEF5bXNjSkRXRkNhdXRDeFY0?=
 =?utf-8?B?dDAxMmN6cDh3Um9mVFRDTlpHU2c4aTFXdno1a3I1NE93TElZZkRaOHpxNjBB?=
 =?utf-8?B?ZEs4OGZQd0hLd2RSZCt2WWV1NVVvM3ppZ1c0MFFxSnlZdk5HVVJCQk8wZjMr?=
 =?utf-8?B?YlNBbnlmZm5tbjBRQlJRS0ZCQmx2WFhqZHFVUGxhcWFadXJqc2QxTloxMXFY?=
 =?utf-8?B?MDZvTzJKUlU4d1Q0VFZ0cEVscW9xZmhCRVFPdnFWRFRQcWVaK0FET204MVNH?=
 =?utf-8?B?VUpESjd4TXJXSWY2d25FVDkrUFdlQXFCaFhpdVQvN0NsUnVjQjY4RXdrb2Rh?=
 =?utf-8?B?aTRNWDhrNnlxYzA0K282bFQzL3BTZWxaQ2N1cVVOYjFNUFlQcXBDM09JazNl?=
 =?utf-8?B?N08remFEa3dza24yNklsSTNDa01IUjQ3R1lxTlB6blpsM1JVc2lUY2lFby9v?=
 =?utf-8?B?S0ZNQ0ZxazA3bUNrd2FlR3ZoaVVTNndSYk1IN0VVY1dhQklNTEpTSm9xT1U0?=
 =?utf-8?B?c0hGMFFEZldPOCtqbkR1cmJRcGVwSmJhMm5Oa09zUm1uNkpQbGpLd1I4elo2?=
 =?utf-8?B?L3hrU2VteFY0eGhsc2djZ3RrQkdUUlNkVzJkMkdnMjBmNDBXOEVmSVF5NWtw?=
 =?utf-8?B?aEN0WGpKOGFON3hPaUZMaUlMSi9JcjgvUnZXZG1BUUhiMXlJL2lOM0JpNGY5?=
 =?utf-8?B?aXE2RnY2aktseVF0cEpRUkZDZC9Jd0ZwNHd1NjBMNVlETS8xb0FxclZmS1Vy?=
 =?utf-8?B?ZnNCRjUxM05FbkZTMmQ4VXlPbkxoS0RZQjZMRTlSRmdWR3BnaFc3ckJNWjA2?=
 =?utf-8?B?b3FWNjZwTGk1YlRpVFN3U1pENDREUmJFRjhYbDN3Y25MaUh3LzUrcUFWV2NR?=
 =?utf-8?B?bDFaYmU1aUlmUVYySldJNndHV0VLdjJibjJ3MEJzL2swRG1jVm9RZGI4c0w1?=
 =?utf-8?B?bFVZZ1FGaW56aEtmVDU4SDBFR3lWNVU0bmduM3IzdWJJQVIwcnBqT1FqYmJQ?=
 =?utf-8?B?TE5JWHhyTUtvOG45VnhRcnROZUJIQWlWcXErbXZWNnNBTjh1RzFVZ000aWtM?=
 =?utf-8?B?aVppbytYQ09BNmY0WUxQVmlEcDByNlB2bE52dGdNODhOMVZDTXRvMHg1bmlH?=
 =?utf-8?B?ZVIyWEorL2xDTk5ENFVGd2FrWjdvYndtaTV1WGFWVnJoamFrT2NwMHhObnVo?=
 =?utf-8?B?OG1ZeUN0aU5JM0l5MElETWxWSkZJblFpd2U4RjNNLzB1S0NPQzlHSHRudFNl?=
 =?utf-8?B?SjBuSjRJcis1bFFUaldmdFZoM25CSk5TY3hjT04wRGQ2RnZuK3I1aFp2U1JD?=
 =?utf-8?B?WExDa3VFUXhzU2c1UEVLUUFCcE9LSU15NGdpc0d5QjJ0WDFia042cStrT29Q?=
 =?utf-8?B?dk04YWNwVkVTRkRqZ1JRL0doQjgzOEhGczdmTnJyd1E5SnFqQ3dSTU5UYm1X?=
 =?utf-8?B?SXdHQ3BGWTh4VUVJbjdKajJKVkN2VE0zOE4xYllEQlVKMFdGZlQ5S2IxZWUr?=
 =?utf-8?B?b0NDWW9JZldjSy9tWVI5L1djcDFuY1dMdnhyS25WeHo4amNWem10dWpseFVn?=
 =?utf-8?B?YVNDODdVaDliSTRqRHMyeUh4SitoMnV1MlBGdjNGOHkvb2craURHcUNOZVhP?=
 =?utf-8?B?Q2Fzb0VxdWxtUEFkKzZ4azYwTVZUd2VMa1c2amw0QmpFMy9rc0tseDd6REZo?=
 =?utf-8?B?SENBZUFRc0NzNDNDdHFsNjR2eFpvMU9oS0IrS1VOSlhaUmJOYUF2ZElDSlp3?=
 =?utf-8?B?OVlVYWkxYjFmVEpKV3hpbkFycUxqZE9ZV0MwVGduSS94ZFpVOVIzTWIyenQz?=
 =?utf-8?B?VFFSa3BqSkRXUnFobmg5NnNGT0FVTExCYUZQbEczSW9SUlJpcEdyUWJtRHE1?=
 =?utf-8?B?OXFOWmpremZFUHdydTNhbzBUUkNVSllBZzFvblVaeHNDckRPeHBKU0piZzhG?=
 =?utf-8?B?YlFjWTIxNkVFemxTMmVMMzNDZHRYMEpEdkdCTFpwd3hCKytZYy9RZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c6e73dd-7b4f-4b60-a736-08debbdae1a0
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 10:29:50.2891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s26+sa+efwJhb4uNTJl1bB+sbGnKc5tAqCeVZyY1E7Cj+/LmDTqdiBFrwraGtMp68ozzKisRtMaRxqq1j9c4GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7731



On 5/22/2026 18:06, Ilpo Järvinen wrote:
> On Thu, 21 May 2026, Shyam Sundar S K wrote:
> 
>> Different AMD CPU families have different SMU mailbox register offsets.
>> Add a helper function amd_pmc_get_smu_mb() to populate the appropriate
>> SMU message offset based on the CPU ID during probe.
>>
>> This infrastructure will help support future features that require
>> communication with the SMU through the correct mailbox address.
>>
>> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/platform/x86/amd/pmc/pmc.c | 24 +++++++++++++++++++++---
>>  1 file changed, 21 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
>> index 7200f19088fe..7c80fb445138 100644
>> --- a/drivers/platform/x86/amd/pmc/pmc.c
>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
>> @@ -101,6 +101,24 @@ static inline void amd_pmc_reg_write(struct amd_pmc_dev *dev, int reg_offset, u3
>>  	iowrite32(val, dev->regbase + reg_offset);
>>  }
>>  
>> +static void amd_pmc_get_smu_mb(struct amd_pmc_dev *dev)
>> +{
>> +	switch (dev->cpu_id) {
>> +	case AMD_CPU_ID_PCO:
>> +	case AMD_CPU_ID_RN:
>> +	case AMD_CPU_ID_VG:
>> +	case AMD_CPU_ID_YC:
>> +	case AMD_CPU_ID_CB:
>> +	case AMD_CPU_ID_PS:
>> +		dev->smu_msg = 0x538;
>> +		break;
>> +	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>> +	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
>> +		dev->smu_msg = 0x938;
>> +		break;
>> +	}
>> +}
>> +
>>  static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
>>  {
>>  	switch (dev->cpu_id) {
>> @@ -111,12 +129,10 @@ static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
>>  	case AMD_CPU_ID_CB:
>>  		dev->num_ips = 12;
>>  		dev->ips_ptr = soc15_ip_blk;
>> -		dev->smu_msg = 0x538;
>>  		break;
>>  	case AMD_CPU_ID_PS:
>>  		dev->num_ips = 21;
>>  		dev->ips_ptr = soc15_ip_blk;
>> -		dev->smu_msg = 0x538;
>>  		break;
>>  	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>>  	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
>> @@ -127,7 +143,6 @@ static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
>>  			dev->num_ips = ARRAY_SIZE(soc15_ip_blk);
>>  			dev->ips_ptr = soc15_ip_blk;
>>  		}
>> -		dev->smu_msg = 0x938;
>>  		break;
>>  	}
>>  }
>> @@ -782,6 +797,9 @@ static int amd_pmc_probe(struct platform_device *pdev)
>>  	/* Get num of IP blocks within the SoC */
>>  	amd_pmc_get_ip_info(dev);
>>  
>> +	/* Populate SMU msg offset */
>> +	amd_pmc_get_smu_mb(dev);
>> +
>>  	platform_set_drvdata(pdev, dev);
>>  	if (IS_ENABLED(CONFIG_SUSPEND)) {
>>  		err = acpi_register_lps0_dev(&amd_pmc_s2idle_dev_ops);
> 
> Could these difference should be recorded into an info struct so we don't 
> need to make a function for each difference?
> 

I could not understand your comment here, can you please elaborate
what do you mean by info struct?

Is it something like this?

+static const struct amd_pmc_cpu_info amd_1ah_cpu_info = {
+	.smu_msg	= 0x938,
+	.num_ips	= ARRAY_SIZE(soc15_ip_blk),
+	.ips_ptr	= soc15_ip_blk,
+};

+

+static const struct amd_pmc_cpu_info amd_1ah_m70_cpu_info = {
+	.smu_msg	= 0x938,
+	.num_ips	= ARRAY_SIZE(soc15_ip_blk_v2),
+	.ips_ptr	= soc15_ip_blk_v2,
+};


+static void amd_pmc_get_cpu_info(struct amd_pmc_dev *dev)
{
...

+	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
+	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
+		if (boot_cpu_data.x86_model == 0x70)
+			info = &amd_1ah_m70_cpu_info;
+		else
+			info = &amd_1ah_cpu_info;
+		break;
+	default:
+		return;
+	}
+
+	dev->smu_msg = info->smu_msg;
+	dev->num_ips = info->num_ips;
+	dev->ips_ptr = info->ips_ptr;

...
}

static int amd_pmc_probe(struct platform_device *pdev)
{

...

-	amd_pmc_get_ip_info(dev);

+	amd_pmc_get_cpu_info(dev);


...
}


Thanks,
Shyam
