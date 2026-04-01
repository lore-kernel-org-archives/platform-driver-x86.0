Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012000.outbound.protection.outlook.com [40.107.200.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DB11DF256;
	Wed,  1 Apr 2026 11:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775042434; cv=fail; b=eKDW98+uXutW5yKpP4KuqoaekhEseUYzFsNp+eh9RO/RngKAzJc93qiMMJ/TSqnBqG853S2l9Tw/ozuQmSYZ54GIn16NnQZ38YlPAcKE0Q7KuUim5Kz/hRWHnQfIyXSn7riwLEw/Ar5/btUoKtGHjZE6p8srzeuNXClw7CKqK0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775042434; c=relaxed/simple;
	bh=XmrNofxAoVb0ss873xVzlHI1jZN+nk9o0LbviyT9EaI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IfNm5qhgsB3Z7rD7ZWFqydotzRRLp4qxf2EQ3/AxY85HhTaj+Xwv9E1iMmcbAcHa6/cAEh/CrbkWY7WFNZRw0o4qgL6sjbshfewijqEuu6aBbgEubY/6p07Eohi9Uz0C4qBF8IUqlRjoAWlD6guHJ8FoAUd+htKoJ0vp42+yV8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=B4AfHoZO; arc=fail smtp.client-ip=40.107.200.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="B4AfHoZO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gigw7F5kJoKOkAUouaHWL8djQrS3sLrKj3Ob0cbx7cHi8E1Civ2BqdzZQCt1svBoy8lb0AiTHgB499vd9/iyZ5i6Fz3t9F0bSl03qBc8BO0ma0bOMYgfugeBFRclV0tnoDXx8r8ZzNR2adEWI+t6tGLyIO4QVWRgVCBT8WqwyGBhKn7AhCGdduwkXnap5u7aiztHc98R+gyNHFPF/M72JhGnSZY0cgBMXy3IPLns6HhN74EMCOjImPnq5TyUwx5SJknbQokIRWQEu5MRNjDFgpvPvcC+Ylbolsd1Uq2/5ZK3f99EX2VZLu8f/QPbGn052jXMzPO5nE2CbAEhP3/t/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aSFR/FP+PUOP1QsIp8ybY+Bvd401gbWBC8uZdoE4+k8=;
 b=XbIvA4ICp6di2uRVu0ivmHR1TeYFTSs63TlHq8CE1knVMYqyIKqTLqyyAsHlYxbv9vi9NOaERrNdUlUlljpnpG6msFVwjpziWM8+ddthDM930ibBexc9CANUT4VvHtEakA2gdwvTmqqykez6Q1l/MQKyWPa8tP1H7SS+HtzM0XJuLlOhZLUZgWF5yfrGfswMxr8uwCXI7RAww3CIuumADalis1IO33HFRrwHJ19C2Ha6TM0MqZe9HlKUh61SO67otSW6FBLWIETHJ+P45hnYk/HoCSuJ2gWkYV4DJmte26XTANzKhIqRm8LeMheuJ5QFa1abhSlHubWBsUvP91JJ0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aSFR/FP+PUOP1QsIp8ybY+Bvd401gbWBC8uZdoE4+k8=;
 b=B4AfHoZOGmlOV1RvKRTIAQhLSYfr+xl8yBs3TL43PjWBjaDqZRqid3RE+dY0M2mlXthde24SKXP9axoLxdliH5tKPRRfvtQ1GIA+dGo8XdXpVtdAhs0NXuM3qsfJJrBelJYxRFokVbR2G2RwOPmBvVB+8D3AesVljbpEzfErbVY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6482.namprd12.prod.outlook.com (2603:10b6:208:3a9::18)
 by IA0PR12MB7697.namprd12.prod.outlook.com (2603:10b6:208:433::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Wed, 1 Apr
 2026 11:20:29 +0000
Received: from IA1PR12MB6482.namprd12.prod.outlook.com
 ([fe80::fb1a:a997:de4f:da62]) by IA1PR12MB6482.namprd12.prod.outlook.com
 ([fe80::fb1a:a997:de4f:da62%4]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 11:20:28 +0000
Message-ID: <f2df9d24-6dc0-4359-b325-e5037865758a@amd.com>
Date: Wed, 1 Apr 2026 16:50:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86/amd/hsmp: Add support for variable-sized
 metrics tables
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Muralidhara M K <muralimk@amd.com>
References: <20260305105050.2940904-1-muthusamy.ramalingam@amd.com>
 <20260305105050.2940904-3-muthusamy.ramalingam@amd.com>
 <81915669-87e0-f06d-7a91-eaec41ecc0e1@linux.intel.com>
Content-Language: en-US
From: "Ramalingam, Muthusamy" <muthus@amd.com>
In-Reply-To: <81915669-87e0-f06d-7a91-eaec41ecc0e1@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0043.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::14) To IA1PR12MB6482.namprd12.prod.outlook.com
 (2603:10b6:208:3a9::18)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6482:EE_|IA0PR12MB7697:EE_
X-MS-Office365-Filtering-Correlation-Id: 21e6ba84-4c46-4dcd-adeb-08de8fe0adc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	z6rcjmFtZJRXyYI1ZvIvGgEpCs+nfxtSum4BIlrNa2brHgk7tepXoU1ysFRbsIQka+ewLwQUvwrf48lIHUmYutS0jTC+eEvLoajlMXydoEOxej9nSDwPtjlqYxlA06KY2Ge9+uV+nwMD2ATX2nP0Spw0nWX2GMIbMleM/oTwAAZxhz9rbA7t9K1EBJPiECqOBcMfpMQa9fd9fYv1GtSCQkMWijy2NebOVViKoeHlvVWdn0JQ3PXuRFjZKzM7CykyuFLc+W3IEzSY+31NaNIfBR3lqmf39vQKs8PdinMLUKqvxaCR8u14ssap19CYUPtKVYaK7TAIe3HHl4YIy2njK7LccKAwx5SBv9R/s9lxtpgLkAU6WAq2os6pMGjlKt9L8D/+imGoBvFBtIYIU+cGbpjJq4i7Sk8/UNdSOPBMlhrJUW1NU6g4zPJvc4OZbipfQl9sYqeOsvstnkdtxNxNYp8wly/Ucp6QTlVlU1dDIjpKpcyn0FTUxnrBNg+2YGeH8qqsw1GIHpaWS5t0toNZmHR7R/rHdO5tW319XDdQHis/F8ms0oJ1l+gG+1bh9+bs5RyhEcbenfNCojS5rovcFDMJhX1xqpDypu6p3ULhBdP/kgsFJbcFnxykf6Kjx0nRSB5wmNG+rcLVO1tWes3VWnNsgwM3C7cXIstfPyONEMOF0M4EOnf/VtGd/HdmamnotFGPZPrTUV6oHsdUk4iBtLqxW5wpjRP2lj22b6ZdJJk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6482.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjhPcEUzTzFDU3o5OVh5bjlNdTNsVk9uZ1oyRDZwUTczcFFTRnZNYzZyUlRt?=
 =?utf-8?B?UVl0bjQ0RFN3SGZWMzl2bWRISzFkNWZudzdrR0IxQ2FibHdsR1ptek1Dd1M4?=
 =?utf-8?B?K1JWVFJvNlZvQk5KZWEvbVhLSS92ZUIrRWwweTlKdmVTckdaMVMxd0V3YzBr?=
 =?utf-8?B?ZE1lSWxOdjZaMStqU2Fza3IyQXRVWllvdERlNjdQREloamY4T1NaV1o0UE1w?=
 =?utf-8?B?allnSDRvNGg0ZEVTUjlJb1VIamVsZGR3Y0EySS94ZUZabDhPM1I1SHBxV0xJ?=
 =?utf-8?B?MXd1TExGSGdsUnl3alNOempCbVV6aFB2RWN2MEl0eitDZzFTMHpsQUFRZVdQ?=
 =?utf-8?B?WGVrZXVaQWxLUlk4MDlDbUpPNDlieG83U0MrTjJHRU5yekJ0RVRsWkVzNGM2?=
 =?utf-8?B?dGh2a2xIaXBsSjlDV1NHOE55MkRHRlRVWXN5bm5YY01HOFcvTXh4T3g3VzJl?=
 =?utf-8?B?OUg3aVNUWFc0NTN3Q0kvbGMyMmk1VFV6TzJrRGllZU11dFhia3Z5NTFaeHRI?=
 =?utf-8?B?NjkwMHBTNHpKbFg0ckNVUllzVGVaVnpWQ2lEODFHSStjTXBleUtoWWlxdi9D?=
 =?utf-8?B?VTRUQUYxdUZPKzNCM3lIZFUxSTNYUitFODFES3k4VlJUL1Zld3kvNWxndjFi?=
 =?utf-8?B?eGQ2WFgvbDB1SittczlOOUlScjBuY1hFY3FTMUtyamlZazJheE44VmZhQkcw?=
 =?utf-8?B?eXY4K0tUUFFDaTFnUDMzZzNqL3VLVXI4dlBsWjF6TWhEeHhpRjlNSWdkb2tW?=
 =?utf-8?B?Q0ZNVTdkYnYwT2loNGt2NTB1T3JpVWpzVnUyNm52UVpMZVRGYVZlakJUeFU0?=
 =?utf-8?B?WGRlazB1dDdPVjhSVnhuTlppaWk1bmpQVXJ5b3ZaamNNZGQwM0hDbG10Vi9q?=
 =?utf-8?B?Y0ZLVjdoNFNoeHZRMVovS2tGa1IvaDMwSlZKSUdqdGcvZEFlRHlMaU5sK3Ri?=
 =?utf-8?B?cnk4aHVPckhVN0h2NS8yZUpRK2lpR3ZSWDRvck96S2R0WjdyUFRwbmNIWmIv?=
 =?utf-8?B?K053MERmR01VN3VMTTkxbmRhSG45YXVGK0syN2NzSWpIcGQwNitMR3BGWHRR?=
 =?utf-8?B?K1pQYno1ejl2Rzg4R3FXQmdCaDRjR1lQTEZqa1o4NHNUZG5VaEFRaWxqUi9Y?=
 =?utf-8?B?Uzlub1hmT0xkOHVlem81U0R0ZTNjeGZSaHZpbGlkRUtjVkZibG9ZUVVQYnpx?=
 =?utf-8?B?YzMrZ1VDZ1M3OERXT2hRbk56Y2tKTmV5YnlhQ2cwZ255UWZrTEZLUTJ6UHI2?=
 =?utf-8?B?SjRlTmRnd2x1Mi9YYmNQMzlpYUljWFZha25WS0oyYjhVbWVVN1MzaGZjM2ZF?=
 =?utf-8?B?MUptdThDNFRMb3l1ZmtyNmdVK2xSVG02QmhHMnpDVG12dkh2OFY2eXlQWWZO?=
 =?utf-8?B?Y1lJUlJrSzdsL09SWmk1Nm5rUnIrQ3BqVVdYVm5rbDhhYUgvejB1ZGtOY295?=
 =?utf-8?B?a1J0SGtWd0x1TU5UOGVKRW8vZSs5K1k4N2pHdWRCRUEvejA2MWM0VEpvZnBO?=
 =?utf-8?B?cnBxcnZPaXJJZTZDSEtpK2dqM1d6Tkh6czk0YS9ibFJyYzJSbExlZFd6emJ3?=
 =?utf-8?B?dlo0VytVcUgzcUIwNXk2MjhoQldjR3NPTE52Wk9SVGh3YUtGalgxbVR0Unpa?=
 =?utf-8?B?clc1dWlndUY2ZWFtVkxrZlZiZS9vSk1yTWpKdlVIQ3pqcjNlbTRGRWVPeUN6?=
 =?utf-8?B?WEZ2T29EK1pXbTJFcGlZVnNCV2hScy9oa3NPN1NleHRzeW9rMGJXSEFzT2s4?=
 =?utf-8?B?cy9lYTcrVHhTZkRtcDlEZGlTV0JKZ2k4L1creEdTM0tCVDNZTHdFR1BML2lL?=
 =?utf-8?B?VmhnbkRzdTNwSURYa1V1SllYS3V6N21kVldXWFdPVFRpV3pJUG8yUFZCMHpT?=
 =?utf-8?B?NnNDUzBCMjBEWElORnRCd1lwYjY0VXVZOXArSVhGN2dwdTJnTVo2TnY2bmow?=
 =?utf-8?B?Q0ljNG9WaTdRQWNiL1BQZzRlcWIrMlBhUzBvbzVrNjNYOXRRb0NTNHROSGhK?=
 =?utf-8?B?bGFqV1loM2x6RCtWN2UwZnpqaW40MnlyQW9VWk11alJzcHdIMnZ2UWVVZlYr?=
 =?utf-8?B?TE5PRkdHMkpOalE2Q000M1pkY1VBQmo2bElURHpjZU9WQmx6c1NrSWd4MWF5?=
 =?utf-8?B?bDFkZ0grQ2FrcERKdVNJSCtTUUIzVElETkJDaVhlM25WR25QbXo3RzhuZEpR?=
 =?utf-8?B?YmkyN1JtWGVZQnUwZHRtWnhsbitqeDQxNERtNm53WEVkY3pqTkVnbnd4bWh4?=
 =?utf-8?B?cXNRdWpVWExsSFlmK0d1WHJwOElrUm5RcXZZSzZ4SUJ3WWIrWGI0MmNkcnh1?=
 =?utf-8?Q?EThoW870MDUbvMS8MU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21e6ba84-4c46-4dcd-adeb-08de8fe0adc6
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6482.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 11:20:28.8663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g+QMHk+/sQPGhDQ1KEBRK0/3w6Bvnl1oK/R6L0pc60M9y87BWZUgs2wCoXdnzDwo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7697

Hi Ilpo,

Thank you for the suggestions. I will update version v2 shortly to 
address the comments listed below.

On 31-03-2026 02:13 pm, Ilpo Järvinen wrote:
> On Thu, 5 Mar 2026, Muthusamy Ramalingam wrote:
> 
>> Add support for the new metrics table format introduced in AMD Family 1Ah
>> Model 50h-5Fh processors with HSMP protocol version 7.
>>
>> Use CPU family/model and protocol versions to map respective variable-sized
>> metric table configurations.
>> The exported hsmp_metric_tbl_read() function provides offset support for
>> variable-sized tables.
> 
> This patch should be split into multiple changes.
Sure.
> 
>> Co-developed-by: Muralidhara M K <muralimk@amd.com>
>> Signed-off-by: Muralidhara M K <muralimk@amd.com>
>> Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
>> ---
>>   arch/x86/include/uapi/asm/amd_hsmp.h | 86 ++++++++++++++++++++++++++++
>>   drivers/platform/x86/amd/hsmp/acpi.c |  9 +--
>>   drivers/platform/x86/amd/hsmp/hsmp.c | 83 ++++++++++++++++++++++-----
>>   drivers/platform/x86/amd/hsmp/hsmp.h |  3 +-
>>   drivers/platform/x86/amd/hsmp/plat.c |  3 +-
>>   5 files changed, 164 insertions(+), 20 deletions(-)
>>
>> diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
>> index 603d62f8d4da..1daa7c5352f3 100644
>> --- a/arch/x86/include/uapi/asm/amd_hsmp.h
>> +++ b/arch/x86/include/uapi/asm/amd_hsmp.h
>> @@ -575,6 +575,92 @@ struct hsmp_metric_table {
>>   	__u32 gfxclk_frequency[8];
>>   };
>>   
>> +#define F1A_M50_M5F_MAX_CORES_PER_CCD_32	32
>> +#define F1A_M50_M5F_MAX_FREQ_TABLE_SIZE		4
>> +#define F1A_M50_M5F_MAX_XGMI			8
>> +#define F1A_M50_M5F_MAX_PCIE			8
>> +#define F1A_M50_M5F_MAX_CCD			8
>> +
>> +/* Metrics table (supported only with proto version 7) */
>> +struct hsmp_metric_table_f1a_m50_5f_iod {
>> +	__u32 num_active_ccds;
>> +	__u32 accumulation_counter;
>> +
>> +	/* TEMPERATURE */
>> +	__u64 max_socket_temperature_acc;
>> +
>> +	/* POWER */
>> +	__u32 socket_power_limit;
>> +	__u32 max_socket_power_limit;
>> +	__u64 socket_power_acc;
>> +	__u64 core_power_acc;
>> +	__u64 uncore_power_acc;
>> +
>> +	/* ENERGY */
>> +	__u64 timestamp;
>> +	__u64 socket_energy_acc;
>> +	__u64 core_energy_acc;
>> +	__u64 uncore_energy_acc;
>> +
>> +	/* FREQUENCY */
>> +	__u64 fclk_frequency_acc;
>> +	__u64 uclk_frequency_acc;
>> +	__u64 ddr_rate_acc;
>> +	__u64 lclk_frequency_acc[F1A_M50_M5F_MAX_FREQ_TABLE_SIZE];
>> +
>> +	/* FREQUENCY RANGE */
>> +	__u32 fclk_frequency_table[F1A_M50_M5F_MAX_FREQ_TABLE_SIZE];
>> +	__u32 uclk_frequency_table[F1A_M50_M5F_MAX_FREQ_TABLE_SIZE];
>> +	__u32 ddr_rate_table[F1A_M50_M5F_MAX_FREQ_TABLE_SIZE];
>> +	__u32 max_df_pstate_range;
>> +	__u32 min_df_pstate_range;
>> +	__u32 lclk_frequency_table[F1A_M50_M5F_MAX_FREQ_TABLE_SIZE];
>> +	__u32 max_lclk_dpm_range;
>> +	__u32 min_lclk_dpm_range;
>> +
>> +	/* XGMI */
>> +	__u64 xgmi_bit_rate[F1A_M50_M5F_MAX_XGMI];
>> +	__u64 xgmi_read_bandwidth[F1A_M50_M5F_MAX_XGMI];
>> +	__u64 xgmi_write_bandwidth[F1A_M50_M5F_MAX_XGMI];
>> +
>> +	/* ACTIVITY */
>> +	__u64 socket_c0_residency_acc;
>> +	__u64 socket_df_cstate_residency_acc;
>> +	__u64 dram_read_bandwidth_acc;
>> +	__u64 dram_write_bandwidth_acc;
>> +	__u32 max_dram_bandwidth;
>> +	__u64 pcie_bandwidth_acc[F1A_M50_M5F_MAX_PCIE];
>> +
>> +	/* THROTTLERS */
>> +	__u32 prochot_residency_acc;
>> +	__u32 ppt_residency_acc;
>> +	__u32 thm_residency_acc;
>> +	__u32 vrhot_residency_acc;
>> +	__u32 cpu_tdc_residency_acc;
>> +	__u32 soc_tdc_residency_acc;
>> +	__u32 io_mem_tdc_residency_acc;
>> +	__u32 fit_residency_acc;
>> +};
>> +
>> +struct hsmp_metric_table_f1a_m50_5f_ccd {
>> +	__u32 core_apicid_of_thread0[F1A_M50_M5F_MAX_CORES_PER_CCD_32];
>> +	__u64 core_c0[F1A_M50_M5F_MAX_CORES_PER_CCD_32];
>> +	__u64 core_cc1[F1A_M50_M5F_MAX_CORES_PER_CCD_32];
>> +	__u64 core_cc6[F1A_M50_M5F_MAX_CORES_PER_CCD_32];
>> +	__u64 core_frequency[F1A_M50_M5F_MAX_CORES_PER_CCD_32];
>> +	__u64 core_frequency_effective[F1A_M50_M5F_MAX_CORES_PER_CCD_32];
>> +	__u64 core_power[F1A_M50_M5F_MAX_CORES_PER_CCD_32];
>> +};
>> +
>> +/*
>> + * Future processors within the same family and model may support a
>> + * variable number of CCDs and cores
>> + */
>> +struct hsmp_metric_table_f1a_m50_5f {
>> +	struct hsmp_metric_table_f1a_m50_5f_iod	iod;
>> +	struct hsmp_metric_table_f1a_m50_5f_ccd	ccd[F1A_M50_M5F_MAX_CCD];
>> +};
>> +
>>   /* Reset to default packing */
>>   #pragma pack()
>>   
>> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
>> index 97ed71593bdf..c91b694bd394 100644
>> --- a/drivers/platform/x86/amd/hsmp/acpi.c
>> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
>> @@ -238,13 +238,14 @@ static ssize_t hsmp_metric_tbl_acpi_read(struct file *filp, struct kobject *kobj
>>   	struct device *dev = container_of(kobj, struct device, kobj);
>>   	struct hsmp_socket *sock = dev_get_drvdata(dev);
>>   
>> -	return hsmp_metric_tbl_read(sock, buf, count);
>> +	return hsmp_metric_tbl_read(sock, buf, count, off);
>>   }
>>   
>>   static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
>>   					 const struct bin_attribute *battr, int id)
>>   {
>> -	if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6)
>> +	if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6 ||
>> +	    hsmp_pdev->proto_ver == HSMP_PROTO_VER7)
>>   		return battr->attr.mode;
>>   
>>   	return 0;
>> @@ -491,7 +492,8 @@ static int init_acpi(struct device *dev)
>>   		return ret;
>>   	}
>>   
>> -	if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6) {
>> +	if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6 ||
>> +	    hsmp_pdev->proto_ver == HSMP_PROTO_VER7) {
>>   		ret = hsmp_get_tbl_dram_base(sock_ind);
>>   		if (ret)
>>   			dev_info(dev, "Failed to init metric table\n");
>> @@ -509,7 +511,6 @@ static int init_acpi(struct device *dev)
>>   static const struct bin_attribute  hsmp_metric_tbl_attr = {
>>   	.attr = { .name = HSMP_METRICS_TABLE_NAME, .mode = 0444},
>>   	.read = hsmp_metric_tbl_acpi_read,
>> -	.size = sizeof(struct hsmp_metric_table),
>>   };
>>   
>>   static const struct bin_attribute *hsmp_attr_list[] = {
>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
>> index 19f82c1d3090..55b941f8a819 100644
>> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
>> @@ -348,9 +348,22 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
>>   	return 0;
>>   }
>>   
>> -ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
>> +/**
>> + * hsmp_metric_tbl_read - Read metric table
>> + *
>> + * This function maintains ABI compatibility for external consumers.
>> + * It reads from offset 0, which works for all metrics table formats.
>> + * External modules using this function will continue to work without
>> + * modification.
> 
> Please don't write history descriptions like this into comments. Only
> focus on explain what it does now. The sentences like the last one belong
> more into changelog text.
> 
Thanks will replace.
>> + *
>> + * Return: number of bytes read or negative error code
>> + */
>> +
>> +ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf,
>> +			     size_t size, loff_t off)
>>   {
>>   	struct hsmp_message msg = { 0 };
>> +	size_t var_size, remaining;
>>   	int ret;
>>   
>>   	if (!sock || !buf)
>> @@ -361,29 +374,37 @@ ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
>>   		return -ENOMEM;
>>   	}
>>   
>> -	/* Do not support lseek(), also don't allow more than the size of metric table */
>> -	if (size != sizeof(struct hsmp_metric_table)) {
>> -		dev_err(sock->dev, "Wrong buffer size\n");
>> +	if (off < 0 || off > hsmp_pdev.hsmp_table_size) {
>> +		dev_err(sock->dev, "Invalid offset\n");
>>   		return -EINVAL;
>>   	}
>>   
>> -	msg.msg_id	= HSMP_GET_METRIC_TABLE;
>> -	msg.sock_ind	= sock->sock_ind;
>> +	/* Compute remaining bytes using explicit cast to avoid signed/unsigned mixing */
>> +	remaining = hsmp_pdev.hsmp_table_size - (size_t)off;
>> +	var_size = min_t(size_t, size, remaining);
> 
> Both inputs are already size_t so you should use min() instead.
I will update using min() macro.

> 
>> +	if (off == 0) {
>> +		msg.msg_id	= HSMP_GET_METRIC_TABLE;
>> +		msg.sock_ind	= sock->sock_ind;
>>   
>> -	ret = hsmp_send_message(&msg);
>> -	if (ret)
>> -		return ret;
>> -	memcpy_fromio(buf, sock->metric_tbl_addr, size);
>> +		ret = hsmp_send_message(&msg);
>> +		if (ret) {
>> +			dev_err(sock->dev, "Failed to send HSMP_GET_METRIC_TABLE, ret: %d\n", ret);
>> +			return ret;
>> +		}
>> +	}
>> +	memcpy_fromio(buf, (u8 __iomem *)sock->metric_tbl_addr + off, var_size);
> 
> This change which changes size/off handling should be made separately and
> properly explain the changes in the interface in its changelog text.
> 
Sure will split size and offset seperately and update changelog accrodingly.

> I started to wonder how is concurrency control supposed to work with
> these calls, there doesn't seem to be any locks taken?
> 
Good point. I'll review some scenarios and update if any locks are required.

>> -	return size;
>> +	return var_size;
>>   }
>>   EXPORT_SYMBOL_NS_GPL(hsmp_metric_tbl_read, "AMD_HSMP");
>>   
>>   int hsmp_get_tbl_dram_base(u16 sock_ind)
>>   {
>>   	struct hsmp_socket *sock = &hsmp_pdev.sock[sock_ind];
>> +	struct hsmp_message msg_tbl_ver = { 0 };
>>   	struct hsmp_message msg = { 0 };
>>   	phys_addr_t dram_addr;
>> +	u32 table_ver;
>>   	int ret;
>>   
>>   	msg.sock_ind	= sock_ind;
>> @@ -403,8 +424,44 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
>>   		dev_err(sock->dev, "Invalid DRAM address for metric table\n");
>>   		return -ENOMEM;
>>   	}
>> -	sock->metric_tbl_addr = devm_ioremap(sock->dev, dram_addr,
>> -					     sizeof(struct hsmp_metric_table));
>> +
>> +	/* Get metric table version */
>> +	msg_tbl_ver.sock_ind    = sock_ind;
>> +	msg_tbl_ver.response_sz = hsmp_msg_desc_table[HSMP_GET_METRIC_TABLE_VER].response_sz;
>> +	msg_tbl_ver.msg_id      = HSMP_GET_METRIC_TABLE_VER;
>> +
>> +	ret = hsmp_send_message(&msg_tbl_ver);
>> +	if (ret)
>> +		return ret;
>> +
>> +	table_ver = msg_tbl_ver.args[0];
>> +
>> +	hsmp_pdev.hsmp_table_size = 0;
> 
> Is this necessary?
Yes, We want this for unsupported family check.
> 
>> +	/* Determine metric table size based on CPU family/model and table version */
>> +	switch (boot_cpu_data.x86) {
>> +	case 0x1A:
>> +		if (boot_cpu_data.x86_model >= 0x50 &&
>> +		    boot_cpu_data.x86_model <= 0x5F &&
>> +		    table_ver == 0x00700000) {
>> +			hsmp_pdev.hsmp_table_size = sizeof(struct hsmp_metric_table_f1a_m50_5f);
>> +		}
>> +		break;
>> +	case 0x19:
>> +		if (boot_cpu_data.x86_model >= 0x90 &&
>> +		    boot_cpu_data.x86_model <= 0x9F) {
> 
> Isn't this a new check compared with the old code? It should be added in
> own patch as well.
> 
Yes, since this is older support, I will split.

>> +			hsmp_pdev.hsmp_table_size = sizeof(struct hsmp_metric_table);
>> +		}
>> +		break;
>> +	}
>> +
>> +	if (!hsmp_pdev.hsmp_table_size) {
>> +		dev_err(sock->dev,
>> +			"Metric table not supported for F%02Xh_M%02Xh (table version: 0x%08X)\n",
>> +			boot_cpu_data.x86, boot_cpu_data.x86_model, table_ver);
>> +		return -EOPNOTSUPP;
>> +	}
>> +
>> +	sock->metric_tbl_addr = devm_ioremap(sock->dev, dram_addr, hsmp_pdev.hsmp_table_size);
>>   	if (!sock->metric_tbl_addr) {
>>   		dev_err(sock->dev, "Failed to ioremap metric table addr\n");
>>   		return -ENOMEM;
>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
>> index b153527e0a0d..a887eaa061e4 100644
>> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
>> @@ -55,6 +55,7 @@ struct hsmp_plat_device {
>>   	u32 proto_ver;
>>   	u16 num_sockets;
>>   	bool is_probed;
>> +	size_t hsmp_table_size;
>>   };
>>   
>>   int hsmp_cache_proto_ver(u16 sock_ind);
>> @@ -63,7 +64,7 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg);
>>   void hsmp_misc_deregister(void);
>>   int hsmp_misc_register(struct device *dev);
>>   int hsmp_get_tbl_dram_base(u16 sock_ind);
>> -ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size);
>> +ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size, loff_t off);
>>   struct hsmp_plat_device *get_hsmp_pdev(void);
>>   #if IS_ENABLED(CONFIG_HWMON)
>>   int hsmp_create_sensor(struct device *dev, u16 sock_ind);
>> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
>> index e07f68575055..9e37502defb2 100644
>> --- a/drivers/platform/x86/amd/hsmp/plat.c
>> +++ b/drivers/platform/x86/amd/hsmp/plat.c
>> @@ -59,7 +59,7 @@ static ssize_t hsmp_metric_tbl_plat_read(struct file *filp, struct kobject *kobj
>>   
>>   	sock = &hsmp_pdev->sock[sock_ind];
>>   
>> -	return hsmp_metric_tbl_read(sock, buf, count);
>> +	return hsmp_metric_tbl_read(sock, buf, count, off);
>>   }
>>   
>>   static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
>> @@ -94,7 +94,6 @@ static const struct bin_attribute attr##index = {			\
>>   	.attr = { .name = HSMP_METRICS_TABLE_NAME, .mode = 0444},	\
>>   	.private = (void *)index,					\
>>   	.read = hsmp_metric_tbl_plat_read,				\
>> -	.size = sizeof(struct hsmp_metric_table),			\
>>   };									\
>>   static const struct bin_attribute _list[] = {				\
>>   	&attr##index,							\
>>
> 

