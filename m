Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010052.outbound.protection.outlook.com [52.101.46.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20813D6CAB;
	Tue, 26 May 2026 09:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779788188; cv=fail; b=pX73eYaHKCeLipNczRscEi5a0iRpvBqMWakM3QcQ5cbHI1GpP78fI/VnvpP0U/k4Yx0T2xVM11mxAwhJfP4Bwf8h2/5faKJWKrhCgYhcSHLYqZFncKD24Wpai/2McTS5TlDrRIzZ96eASlYb94oZ8THso1GJ2Vi75SGMCuoO++k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779788188; c=relaxed/simple;
	bh=XauufQ91fI9kCQnjvL8h2VoLHH1eqTFEcL1fNEFGILE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=T48lSdys+p5vZLAucmai1zBUIpzZCgabWiIPpVXvp4A/AXA/eB+N2WNgtt1kC0BAHBfXq6LAByndIWZClldA9CimkVtnPtugS9x6eoI0A1UkbMN+EMs3QWqssw4WT74wSpGyk6p9CNk0YINSZYsbVCLzUdOc6ExLUg3W6OYgbv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2NzXE9qH; arc=fail smtp.client-ip=52.101.46.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2NzXE9qH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UtMqJoHY+HU/CP04FvQOLgAbSGyowuoPKgc8rUOQUTspuxIfUh3IqVQ/CP+gaQWNUrNDoBJ6pV9epVqJqEpvn9cqbxianWCpYvuUN2KhUyp2juSH32npQS6i6meU7Lo1ILpb1yHzywv6KPFCrk5oJon2lFG1dlTalRuSp6MVWgMrn847YzydFkc/BMYvr2n+SRJh7dJFd7aeWFMoQAgRxj+NW/EKuskND60meP+sjuujc60JBTEt9nzP4dljMJ4gy80A5TkbygtijvIq53h4+VLzWJ6JPJk09FofL8XeoeouMO1OPo4cm+V4DqnpHru6BBtkA1CF94Ei6YlIQCw9cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+aC+Vn5rO0OfhDeEq0YXqm3DJ31MxXwJZUWlaJot5I=;
 b=LueMSjR+OAmIvlcFje7a4phAMdxQomxmGsCnTrzeFHewwY1Fb/Dxlsmy0bL0h4M38vI6yEcOBlW3PohBftc8jiIy136hbx7IDGmfXFftpMa2SOjYLthKCR5f0ZPV4Z7zRL3gach0rSBBPGorNjL0I29neWme6Ycdf4f9yCJbwqwZ3ZNUSRtli5tpSV8Bw+PJKWvpRLqomvpqZaYDKLnvQXPrQ4jUyQG3C7oIsF1WI0/WplBOiw7bUf5YJQ40bFH2rnCW+DUQCb/2wKJod8IK+uciJCZDjAd+7nJybKmjn9bSo3ulQkTj+jOlRjxRj7q63YIgKVrATGytXj+M7snr5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+aC+Vn5rO0OfhDeEq0YXqm3DJ31MxXwJZUWlaJot5I=;
 b=2NzXE9qHxDg1uLTCrRj4iCVsgTU06O4Wmei9pSk/Q7PoEjdnKI3VMjn+7kq/uo5HB0R/9SxQqtqza3mN/OpDB8TJ9hqpyjUX5K4htjUIttp8VbiCRHJ8BgmMlGnZBe4ebVyjQEBLY3XnlLNBt2krpYvJoQgZL2VIAt6RI3Z/AsU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7325.namprd12.prod.outlook.com (2603:10b6:510:217::19)
 by IA1PR12MB6212.namprd12.prod.outlook.com (2603:10b6:208:3e4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Tue, 26 May
 2026 09:36:23 +0000
Received: from PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc]) by PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc%6]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 09:36:22 +0000
Message-ID: <187a0b44-9e43-4174-81a0-1dad14ae63e9@amd.com>
Date: Tue, 26 May 2026 15:06:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] platform/x86/amd/hsmp: Add UAPI structures for
 Family 1Ah Model 50h-5Fh metrics table
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Muralidhara M K <muralidhara.mk@amd.com>
Cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Suma Hegde <suma.hegde@amd.com>,
 Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
References: <20260517151211.415627-1-muralidhara.mk@amd.com>
 <20260517151211.415627-3-muralidhara.mk@amd.com>
 <81f5f74f-a11b-1231-f521-58d4648842f8@linux.intel.com>
Content-Language: en-US
From: "M K, Muralidhara" <muralimk@amd.com>
In-Reply-To: <81f5f74f-a11b-1231-f521-58d4648842f8@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0211.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::17) To PH8PR12MB7325.namprd12.prod.outlook.com
 (2603:10b6:510:217::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7325:EE_|IA1PR12MB6212:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ddcba1a-c02f-4b8c-51e8-08debb0a3f90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003|6133799003|11063799006|3023799007|4143699003;
X-Microsoft-Antispam-Message-Info:
	NbFsC9FLXIszJcstGtH2nHIiFFMxhtVbCtVZuNXgeNqFSqZ7JpRFgjKHJW/Tdzdcc/WQdJYnhdDfCzLAWyU5o6yguPItZuoIfwx+LK4pe+PCM2NOqANX+H6QFKFk++MYy3AIIiNj1MjOUKP0KmAouJKSexFTN26I5pyA49z/x37vtD/6MLADdlJdKkCPjEQLzzlfYisnGcFEOJj8n2TGgUDPHfH85y710JaUJPIsmJ+DbMWAn1eST1c1M77G0t9G0pAiK4/wz3O7ADlEuPcT7gbnLRWKlMmOyKsibUO+IPeFuZgfsSsD0qsa9/xfr+T53OncZL670thf3T1iXZDRlp1tNlDHBTdMIpoYfrJF3WBCDR7aeJ0OSkwG/8qB9q87DAtib6yazwjUN+y3/52BNvtk+bprKfNDiiN23ufgGr6oa0dr4ZQYQRfErXA81iE4w4HHFk4tDAfI/PB9Az/CrnMOK/IYNKVLUyqv7gCOYOnvu5RLFY8MZIXqvFBKPxxYywasI76ZG8KW5O7kG1sQFuYYlwCl4b07HNG5xTd7tSNVFZCJPwkkfwMOu52AbHxSN9hwDr9Ul0U8j43FPMoqgW+WUExbMsEQFtyxyOHbONTJutbQktDuhUz0iPYxDOy7vogsy8jqqkiNXlyt/yaY8iBnx7M6JDkm3yTFK8CaZX4PQjNDfigbO/qyeJuElm3x
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7325.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003)(6133799003)(11063799006)(3023799007)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2Z2QWkreG1NSTIzM1Mwd0hRdDdwaG5OUFdyUExySjNpMTJHTU1keDQ0Q0VL?=
 =?utf-8?B?SlRraFNFTjhDOU1FdVNsbTltSnZrVy9MdS9TYnNZaE5CcnVoUEk0d3hhUzZJ?=
 =?utf-8?B?VFNMWUZ1UzdkdHZ3R2lPMVY1MFBoTGpQcWVXcVlXL01tTXhHM2tBcG9CM0pm?=
 =?utf-8?B?N1JYVElKQmpycjcvYWlNUmQrV3VTc2ZKUmFubzQ0aWtIMmVVZVVwdFBwWkJi?=
 =?utf-8?B?NUN0cW12b1AwOFVrQ1FjcGZvck5zNEtYOUwvaUt3N3MxcDMrdU8zYXh6OGJV?=
 =?utf-8?B?U29LckFvY1JOQzJsOVdDNkRGbmo3bnBTc2xnTmd3dUdGM3Fub1dUa0pxMUx4?=
 =?utf-8?B?czltV1lEZm5UanNLNlJxYitYTWN4WDhLL3RZdzBITlVWemRZWmF0d3BMT3p4?=
 =?utf-8?B?RExTK0dWK2Q3M1hSbi9DQk0xbEZVZU13OUpaMzJiY3lHS2ptdElqYUw3Qmls?=
 =?utf-8?B?Z0xDNDZoL3pSUGRJbjd5QUVRaWhKSktvNXpMME96czNDRXM5OVdTZzVldVM2?=
 =?utf-8?B?b3BtR0d2TEpBQkZjU08xeTh6UkNNeTRnSmZYYXVtUDBoNFB4N09UdmtzSExj?=
 =?utf-8?B?anRhamR0MEMxUHVEbWhjZTNYdzcyUU10RWpadWphZjN1M0FWMEhQVVJ3U1hh?=
 =?utf-8?B?Ykx3NmZYUkRybGJNb1ZPRFUrQzdrWXk0NlVIdDhDVVZBQVZBWjVTVGE1SzFV?=
 =?utf-8?B?NHZzVG43SlJ2MVE2Nm1sa0p2S3pUWTBSRUducUJPZmRTV3hVWEZPd1N0ZjZ3?=
 =?utf-8?B?b2lYbnhCZ2hZZ0VyeFNLWG1SVmRVek5HWHhHNllQYzRaSktiZmJZek0yNXd5?=
 =?utf-8?B?RG5jd25WWUJtWm5WYkxJWndUK1lEa0ZtQSt3bFoxNW0vTTJSd1l3djVtUThm?=
 =?utf-8?B?WTk3U2tJMU00d2ljbkdZeVNGSVoyRnB2STZnK2c0R1ZTRDZXdzlXWEFmQi9n?=
 =?utf-8?B?bU5HNmlLRXJrMDlLdFpHQjdJc2tsa1FibmFWWFo3WmVua0Juc0szNk02WDRj?=
 =?utf-8?B?NVc0TE1ucGVFcUtuSzdpNTV1Rkllam94MTVuaHdKa09RcUEvT08wOUl2SW5H?=
 =?utf-8?B?SGNVSDVWbCtpK1BhcW0rY3pZb0tnTnF4S0RyM01FM0pyb1ZUdGt6ekNQSkNx?=
 =?utf-8?B?WEZKVXh0KzRGeHd5S1lxN2ZFUmMwazY3c3FnT2xaZmlxZzIwcXI0VGM3dGVK?=
 =?utf-8?B?SjdDb0trU2E1bzJOdDhSL0s4d0lTeFhHMWJiaXRkOTVZREJnUGg3L2R2bEht?=
 =?utf-8?B?em1WQXRKWG1oMDJ5M2NnZFJkc09EUCtiYXpRNVN4YjJLblEvMEE4cUtHRjJD?=
 =?utf-8?B?TVNodmdScHB6TEs1QXZ4N0k4NkcrT2laRmwxMzF5U0QxOWp3OXZUSzcxSjk3?=
 =?utf-8?B?a2g4ZVJGTzRKUWtjRWZXbEQ3ZXM2bURyNHFFL2xqMU5Rem4wRUlwckRvRU5r?=
 =?utf-8?B?elhVZjN2clFjZHFkVm9FeGNBWjhFVmNZV29WbmhFdW1JcmJMNDVFdkJCN2Ni?=
 =?utf-8?B?b0RvdWtMNktWNDhlRnludkdnb0lqUDNmR1dSM0VqajdnZkJ6QzZDSmhRRnR3?=
 =?utf-8?B?M2ZRbHJ4ejRzWXhpcmtBdkwweHQvTitqVEJPK1pIaDc3VGpnKzQ0d2xEcE8w?=
 =?utf-8?B?UjBJNU1tdm9Cb2dUNUVLczVTSjJHZUd4SlVXZGtHdVVxWkIycTRONUVaOTVo?=
 =?utf-8?B?enZBSjdsaGlLWWJnU2hDMlFRNGFPUHA0SFNseEd1cXJvbmUvQUpYK2pCZUth?=
 =?utf-8?B?czhOWmtoQUtTOUp0bFk3T3JuQk1DaTBhQjBpK3hLSzA4ZUEwMTNoV2Fhd0w3?=
 =?utf-8?B?Q1MxL1B6VCtyeVczTG9TODFrbisySTBIcE9Bakx2OGZ4d00xSDVhdTlWZW9Z?=
 =?utf-8?B?ZS82MHpCWUhKTVFlODRLZ0hpOFh3K0duRURXckc5Rk8xSW8zQXRDVnRXV2k2?=
 =?utf-8?B?L0lVMmhVN2ZyUDg1R2NsQmhUbkJ0R0pqamRsMDQ1VStvWnJGcHM2SXpRWWE0?=
 =?utf-8?B?OHRXTGJ2aUIrOFdwQk1UNzNLbFdQRGlMNCtIRFBTUVphYjEvMU5NMHNBcGNS?=
 =?utf-8?B?NnFOdXZjNUh5V0JQUW85eHl2T0paUkN5UEY3ME50b3E0OHI2RExSQW1yNU9W?=
 =?utf-8?B?VDUxM2JIOWZ5NEExYlBOUmFYWTZ1RHF0Z0Y5TzRGb3JEYndvTWY5VUpQNGR0?=
 =?utf-8?B?MEovOGpHajRVeWxhQzNpU3lGVnpGUkYzNVlaTXQvd0hPMDIwSytkQjg0dWtJ?=
 =?utf-8?B?NVp5TXdxekgvTkJJTkFBTnZaRVpNcU9VM01YcE85d0FqVjl5V0tXNnZ5V1hB?=
 =?utf-8?B?ZmRKMGl5M3U0bmM3ekpTbUxoZmxPeEFxUkszaTJVRDMxWWhqQjhGQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ddcba1a-c02f-4b8c-51e8-08debb0a3f90
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7325.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 09:36:22.6243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nn89kJJhAYQzZFaBDp09PsN4F2Zf4hgu54nYamUcukzPcHl4RSK9QkrwWiZt9XjhEupjKdFXokfPVfXsRwJnsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6212



On 5/22/2026 4:39 PM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Sun, 17 May 2026, Muralidhara M K wrote:
> 
>> Define the UAPI structures hsmp_metric_table_zen6_iod,
>> hsmp_metric_table_zen6_ccd and the top-level hsmp_metric_table_zen6
>> to describe the per-IOD and per-CCD metrics layout for AMD Family 1Ah
>> Model 50h-5Fh processors (HSMP protocol version 7).  These structures
>> allow userspace tools to interpret the raw metric table binary exposed
>> through the HSMP character device.
>>
>> Driver enablement for protocol version 7 is added in a follow-up patch.
>>
>> Reviewed-by: Suma Hegde <suma.hegde@amd.com>
>> Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
>> Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
>> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
>> ---
>> Changes:
>> v1->v2: Split the change
>> v2->v3: Move proto version check to seperate patch
>>
>>   arch/x86/include/uapi/asm/amd_hsmp.h | 88 ++++++++++++++++++++++++++++
>>   1 file changed, 88 insertions(+)
>>
>> diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
>> index 603d62f8d4da..da3e3bbfa33e 100644
>> --- a/arch/x86/include/uapi/asm/amd_hsmp.h
>> +++ b/arch/x86/include/uapi/asm/amd_hsmp.h
>> @@ -575,6 +575,94 @@ struct hsmp_metric_table {
>>        __u32 gfxclk_frequency[8];
>>   };
>>
>> +#define F1A_M50_M5F_MAX_CORES_PER_CCD_32     32
>> +#define F1A_M50_M5F_MAX_FREQ_TABLE_SIZE              4
>> +#define F1A_M50_M5F_MAX_XGMI                 8
>> +#define F1A_M50_M5F_MAX_PCIE                 8
>> +#define F1A_M50_M5F_MAX_CCD                  8
> 
> Should have a prefix.
Sure will add HSMP prefix.
> 
>> +
>> +/* Metrics table (supported only with proto version 7) */
>> +struct hsmp_metric_table_zen6_iod {
>> +     __u32 num_active_ccds;
>> +     __u32 accumulation_counter;
>> +
>> +     /* TEMPERATURE */
>> +     __u64 max_socket_temperature_acc;
>> +
>> +     /* POWER */
>> +     __u32 socket_power_limit;
>> +     __u32 max_socket_power_limit;
>> +     __u64 socket_power_acc;
>> +     __u64 core_power_acc;
>> +     __u64 uncore_power_acc;
>> +
>> +     /* ENERGY */
>> +     __u64 timestamp;
>> +     __u64 socket_energy_acc;
>> +     __u64 core_energy_acc;
>> +     __u64 uncore_energy_acc;
>> +
>> +     /* FREQUENCY */
>> +     __u64 fclk_frequency_acc;
>> +     __u64 uclk_frequency_acc;
>> +     __u64 ddr_rate_acc;
>> +     __u64 lclk_frequency_acc[F1A_M50_M5F_MAX_FREQ_TABLE_SIZE];
>> +
>> +     /* FREQUENCY RANGE */
>> +     __u32 fclk_frequency_table[F1A_M50_M5F_MAX_FREQ_TABLE_SIZE];
>> +     __u32 uclk_frequency_table[F1A_M50_M5F_MAX_FREQ_TABLE_SIZE];
>> +     __u32 ddr_rate_table[F1A_M50_M5F_MAX_FREQ_TABLE_SIZE];
>> +     __u32 max_df_pstate_range;
>> +     __u32 min_df_pstate_range;
>> +     __u32 lclk_frequency_table[F1A_M50_M5F_MAX_FREQ_TABLE_SIZE];
>> +     __u32 max_lclk_dpm_range;
>> +     __u32 min_lclk_dpm_range;
>> +
>> +     /* XGMI */
>> +     __u64 xgmi_bit_rate[F1A_M50_M5F_MAX_XGMI];
>> +     __u64 xgmi_read_bandwidth[F1A_M50_M5F_MAX_XGMI];
>> +     __u64 xgmi_write_bandwidth[F1A_M50_M5F_MAX_XGMI];
>> +
>> +     /* ACTIVITY */
>> +     __u64 socket_c0_residency_acc;
>> +     __u64 socket_df_cstate_residency_acc;
>> +     __u64 dram_read_bandwidth_acc;
>> +     __u64 dram_write_bandwidth_acc;
>> +     __u32 max_dram_bandwidth;
>> +     __u64 pcie_bandwidth_acc[F1A_M50_M5F_MAX_PCIE];
>> +
>> +     /* THROTTLERS */
>> +     __u32 prochot_residency_acc;
>> +     __u32 ppt_residency_acc;
>> +     __u32 thm_residency_acc;
>> +     __u32 vrhot_residency_acc;
>> +     __u32 cpu_tdc_residency_acc;
>> +     __u32 soc_tdc_residency_acc;
>> +     __u32 io_mem_tdc_residency_acc;
>> +     __u32 fit_residency_acc;
>> +};
>> +
>> +struct hsmp_metric_table_zen6_ccd {
>> +     __u32 core_apicid_of_thread0[F1A_M50_M5F_MAX_CORES_PER_CCD_32];
>> +     __u64 core_c0[F1A_M50_M5F_MAX_CORES_PER_CCD_32];
>> +     __u64 core_cc1[F1A_M50_M5F_MAX_CORES_PER_CCD_32];
>> +     __u64 core_cc6[F1A_M50_M5F_MAX_CORES_PER_CCD_32];
>> +     __u64 core_frequency[F1A_M50_M5F_MAX_CORES_PER_CCD_32];
>> +     __u64 core_frequency_effective[F1A_M50_M5F_MAX_CORES_PER_CCD_32];
>> +     __u64 core_power[F1A_M50_M5F_MAX_CORES_PER_CCD_32];
>> +};
>> +
>> +/*
>> + * Metrics table for Family 0x1A, Models 0x50 to 0x5F, table version 0x00700000
>> + *
>> + * Future processors within the same family and model may support a
>> + * variable number of CCDs and cores
> 
> How is the correct number of CCDs then known?
> 
> If it's through num_active_ccds, I question if hsmp_metric_table_zen6
> struct hierarchy is correct as then something under iod seems to
> determine how to interpret the ccd[] array.
> 
For metrics table version 0x00700000, the maximum number of supported 
CCDs is 8.
In scenarios where CCDs are disabled or unavailable, the 
"num_active_ccds" variable within the IOD array indicates the number of 
valid CCDs in the ccd[] array.

>> + */
>> +struct hsmp_metric_table_zen6 {
>> +     struct hsmp_metric_table_zen6_iod iod;
>> +     struct hsmp_metric_table_zen6_ccd ccd[F1A_M50_M5F_MAX_CCD];
>> +};
>> +
>>   /* Reset to default packing */
>>   #pragma pack()
>>
>>
> 
> --
>   i.
> 

