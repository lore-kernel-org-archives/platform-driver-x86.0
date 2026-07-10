Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012021.outbound.protection.outlook.com [40.107.200.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5292D382370
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2026 19:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783710611; cv=fail; b=eps2evMfrH2N1Tr64tTuCDQQ8pvpPQOWhI4UIYPiQug2tljB1kI2iaN2rJzinDXMEl6WjbISt52YYDqAj03Wsf9Nquh7ZLfreqrZbb8RLtO59nDgj+7izGvBNZ0psGKW5gHlNGLsEg0AUkNzqHnSPE2FnlFGT5WLWi4BB33hDIo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783710611; c=relaxed/simple;
	bh=lKi13o3cNqTKDeawyOR9MDeXD1cqU/eBvKFoV+eOFiA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=B3fIwqqWalun9ea0Tk5XAn47tolqMjrAfu9UGDVcu5v2KSdeU4mZ8OdpGDkjd3E/EU2VJmjlj/Lcx5VARIePzjwKr+VUXDtcE7t172YPHqmFgEyVGfQx201qgPrQDZ+FwWJJYm3bu71IFEcw7RoZRRrXLkdFI7Z1IulherTXsJY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=F5eqjScr; arc=fail smtp.client-ip=40.107.200.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="F5eqjScr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aBydESZuW2s0WFIClL+zQYtz6n8lr1hyfGiBzzZiYaRupczYsrVwoqIpM2UOa0y+logNYGBGtCkwW1mYRbvcPcOi5fC81iKNtGLK3+LViDcZjKURfXn9cIX9inBqnFMZVzL1WM3H1gwpFM+aCEj5sl7GpxV1pRJPO2R4A25iTisxwipfLI/uKT+sPU5tEQt3T0QWhzlt6xZKDLj8eQbpDnp2xqpPrQQXp7c+NHWVoqo9sMDw0rOr5g6SFv7Dk5kzYMFPAcwagK7xF6BGiT8FoJvOF5J6x3oiinvooKfCcGhuQyAOjf8YLT1De5mCoUvwiAon2cqak188pt8IESjcyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SE24XTxmMCZ9aiR2qS3s4enA3fcOPODxxzG9W93BRGI=;
 b=myutuKe+Wtgvv3Yyzupj45AHDpfWCM0tQ3Uhq9a3SHD+10D/oSQgWIULaX4hvRr1POObqoJ/O99QX/o6VeDrs3VgAAnOJJk8SMYh1XpeXnGfmnnctFeB5TIBiEeVzt8XTzMAyNH5D2/cV/x3s7nHeSur35MbkFF/diMYK8Ea7G1yoDLv0lKXTLts1u2xtUXns/asffnB31+k003QZlsxRpwJWTKwBc76V4WqKXAIIh6AtsKArmDfkttgI6prXlbXD13sfi1neokRzJEz/6UiUyHIiFcH3ZprzB01/ut+rloUIRHE18DLDFfHsoVRtJ+pEttQsR7KL5rcW9G9spwI0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SE24XTxmMCZ9aiR2qS3s4enA3fcOPODxxzG9W93BRGI=;
 b=F5eqjScrJmZrmRBI0ExFVIv/kkhVt8qB4WXNmX0e+/FvOnS5Sdpawh8qQHa8FDlIqcOI6DZ4bKGpxJicCKGDGnloz1heA8YkvllE1bVE/vaODX0L50UzL0VHuWE1b6hiuRu/YQ1FjVUQz31ZpqwUWrbyGlqU7TBngpXNZ25+KNc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by DS7PR12MB5861.namprd12.prod.outlook.com (2603:10b6:8:78::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 10 Jul
 2026 19:10:04 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%6]) with mapi id 15.21.0181.016; Fri, 10 Jul 2026
 19:10:03 +0000
Message-ID: <52b7b438-8b09-4845-82ca-064da4027da8@amd.com>
Date: Fri, 10 Jul 2026 14:10:01 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] platform/x86/amd/pmf: Add 1AH_M80H device IDs and
 extended SMU mailbox registers
Content-Language: en-US
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20260710174219.2522269-1-Shyam-sundar.S-k@amd.com>
 <20260710174219.2522269-3-Shyam-sundar.S-k@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260710174219.2522269-3-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7P220CA0005.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::10) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|DS7PR12MB5861:EE_
X-MS-Office365-Filtering-Correlation-Id: 04524326-19b4-4aa8-9615-08dedeb6d87c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|6133799003|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	8kmcMXByprehLu6crdT/9En3Bt8hNeRltESP8MLZ/pyyBE+2rWGrlQQrw1K0zeHsGzPkXhMUAYx2WzFiRGjkVIQeehIHTKllBUqSW8E6RH5nkVcT3u6+C47kuLhxLs7csH+H+y6oYR2escTLEK2UKtDHtvmMXeYcUgg5LRFhHL7NePYY4i0K8YXVAlH7e9N2eDh68W7f9r7Yx2iD5OuUVLpJ1IBQFrdk/DiQopr7o30BR0Ca0Kw+iBZeR8xiyImTRrYIpOQFcu8k5e5CDhYuCcWp2M9O7+6iIZUcz2a0vtbzI3jE+Hp7dCe1CBbIiLzXL6c0/fMTKjvNKbIx9Tm4LTpiTKPvr7NGlw8SmS0+zEqZy89BL0XlovOkn+MkwPHbSeGZBrV2R2eGQWzYcq83I4T24XDT2U+PVkzmlAlM6L8rNZqwEbiM6UHPYjpe8mXI+Gqc/qlFzch1RdHOfaQzyDL+LZPHJgsWFuzFelk89POhcCP00Acf7QC1mwfcb6IpS62R1yZ8ZL9b/zki98zTfCW0RnuPNu5l3mJFXi/LlzG/XRqEX0FXi8P4WOB6S+NPlyRCRObeHtVOslVGcf+DpCYKRsDIlTJTFkWkY3Yk3tUrfojpYc1cpJK7ASjTBkc+/iKoRnbHwCrIAc8/qbhwwQ7b9j6m0e1rlRvKutaXIQQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bG1QN21WQlp0dkVPSGZwbDhveUZ5eENJajhzUjFzenZwYjc3TW1Cb2MwQWpR?=
 =?utf-8?B?dTl0R2NCSStsSjlERUUyQmQ3c0V4ZW5kRkVOVndlbGJJWU8zV20yVWt0YlhG?=
 =?utf-8?B?SkZHV1g3SEFkRHFJMG9KRFYrYXNHd1Y1OVBMRmdtNmNHZTBaMnFmZ0RLT3Fq?=
 =?utf-8?B?cmRVM0dvUVVITGZIY1g5Q212Y29WdGd4WjJ5bit6SGpiL3JLVmkrVGhIZDJ2?=
 =?utf-8?B?ODFUWDFCYmQ1NHRUKzdCU3lpaU5DZkQ2aldPZ0xVYlJ6bzRTb0VkNXdSd3lI?=
 =?utf-8?B?OVhTRjNmcjh6ZWR5UWYzME0zWS9aemFET0hGc05SVXRmVHc2RlkyS0VaU2tE?=
 =?utf-8?B?MHZIZ1RENjI2cGlaQUhBaW1lNXBvL3drVURNcnl1NTVub2dESGZIMnprOU5j?=
 =?utf-8?B?Z0ZhOE5XdzIxQnVrOURlT0VLdmFaUWZTbWxCU21wNTk5OTFpVjVPSTRWN1Ny?=
 =?utf-8?B?eENJQThUMS9ZbjYwSDdXZ2sxV2pZT0dadzVpcmxiaU03b3J3akZpd1B4aXA2?=
 =?utf-8?B?ZktoNkRiazFyUk5YUW1pL0RlQ0o2MHY3NkFQL2VaUlQ0aldvZWJJZzBhTXcx?=
 =?utf-8?B?U0tJZDZCQms2MW9lcjBiUEhIbDVKVGdFTVVHaVlXVmtwVzAyeTN1eTV5aXhG?=
 =?utf-8?B?UzhGMGJkZDE4OWU0eWlpaVQ1M1JtQXp6dVlzNzRFbGZxek1vVE5uZEE4ZDZL?=
 =?utf-8?B?NzBGUkpYV1Z2cURCWitIWTgreDQxZ2FSc3F5QnArU2xsMURSOTFNaXV2UW85?=
 =?utf-8?B?TktLWlhOVzVNU1lMSllmSE9HYkEyMENUdXl2cGprWmRKUGpOeUxCRkROOU1O?=
 =?utf-8?B?bGoxSmZUaG1vRDQwQXViUDBnTWJzU1AxSkdacitOREVJUm9reEIrcmlpRG4v?=
 =?utf-8?B?OUNFWTFEUDVZM1ozT2tXMXdQclgxb1hLOGVsR01BU2FwRWdiZ25pTG4rcDE5?=
 =?utf-8?B?Uk53ejk5cC9KY1l2OFRsNU9GeGtxYjArdlNUZTNDUnRwbEY5VzI0U2JsNEZC?=
 =?utf-8?B?eXZNVUlXMDVDaW1mVzY4UGkxSmppaWZFMjI1TmdVcGVrT1JiWnlRWGdEdHJX?=
 =?utf-8?B?cHUvNlR6dzErMHFnNU1BaGUram1SOEQ2YXgydXVRb0kvMUFhMWpoWGFSR3N6?=
 =?utf-8?B?VkNwZGJrbmZVNzZRcm9Qc2Jab0V5Z0wzTUZHZzQ3MERteTVZVG1maVpMMmlN?=
 =?utf-8?B?OGNoTHZVNnhsa05Jbm9lVmhLdnRMRVNFcWF1M2p6R1lTVVNmb2RIVnIyRytF?=
 =?utf-8?B?WFBvdVpJbFlvMDlpVzdlRmtJS0FoRFJrUDFYbzVZMDF6aFQ4eHVGYXNzNnpX?=
 =?utf-8?B?U1pwQUVnVUwwYnQvdkdOWXZyajRKL3Y4VndDeExYVHRTdDBKUStLSzdDSHZG?=
 =?utf-8?B?YktOelNKbENpdUtxbHQyWHNGUTQ4ckVNWk0rb3B0elh5S0Z5K0ZMajJDLzZq?=
 =?utf-8?B?L3lpN3EzRkN5STNzVVZvYkF4d29QMGk4dVgyVlVra0FGQ2NjN3k0YnRCaE5a?=
 =?utf-8?B?dVpxemIxeDg4VlI4U0V5MWdHVDRvVDVrRi8yK3JSTWtUSjM5NFZNZnBMU2h6?=
 =?utf-8?B?M3J2V0VpNytrQkZRQnFUMnpMdU1nSzRTazJOYjZnZm5lSzdGRWlXLzYyWllY?=
 =?utf-8?B?c2Y3S2phdElGaG9Yc0RaUjdWRlYyK3FqN2F0enZPa010VFluc2lHRGVJT0o0?=
 =?utf-8?B?aUJBV0g0SHlaQmk4cDJ1R1drTVh0d3lZeEtTN2FSaCtERTNlTzRvUVE1a3g5?=
 =?utf-8?B?WktJWDZLaXpQL200TXFWM1IwdmMxMVg2N0t6VDVqZjRVUFZoREpLU055NitG?=
 =?utf-8?B?d25LdWx4TmlrYTFSbFdYOGE2cGtZeFZUSGRzUFJzZWF0L21YS25wQ0d3dmNp?=
 =?utf-8?B?bmkxanZPRzFldld5cDVzRmtIYzFlNWVLQVdET2hyQy9HYkk2QTJSOUVMUVhJ?=
 =?utf-8?B?YytvZUtkNkZNNE8zVnNhaHRRdGpPZWxBZEg3dUdKMEdWQVROSzlxTnZFU25z?=
 =?utf-8?B?YmNxTitTTmdhTzF5dllZUGdibGJ0dk9zdzV6TjBWYjlOUC9iNTNOWjJodXd5?=
 =?utf-8?B?bEthWDhpRVNxUnhaUGFORWRXN3o1RStKeU1UUjhVb3U2K0l6M01LWkNaTk5q?=
 =?utf-8?B?QWdjeStlaGdwTnhhU3RFNFpYQmVqRnVwRE05ZHI2ajlsNy9Mcm9TSHAwc3Fh?=
 =?utf-8?B?Ui9hMExxY1dLQVlCWkZjaDh6ZThlNk5paHlwMzErNjZyTXJlcUZWRGxwZnhV?=
 =?utf-8?B?aUdWeHR3Y2pnbWlId08wM1JZSGlBdnFYcUU5UzREZzR6VkpTUkdUemVtQjdW?=
 =?utf-8?Q?937BFJ1ARCQeNwmCxQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04524326-19b4-4aa8-9615-08dedeb6d87c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 19:10:03.2229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MmXNqjIa+B99/fEIROWIwYWi29wikdfrGn7Nwwf8z2+1PyZhhZbGHgPE8JXNqJSX11h5Qc856Opax9wrDuqxyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5861



On 7/10/26 12:42, Shyam Sundar S K wrote:
> Add PCI device ID (0x115b) and ACPI ID (AMDI0109) to enable PMF driver
> support for the AMD 1AH_M80H (Family 1AH Model 80H).
> 
> The 1AH_M80H platform introduces an extended SMU mailbox interface that
> uses three argument registers instead of the single register used by
> earlier platforms. Define five new register offsets for the 1AH_M80H
> mailbox: message, response and three argument registers. The extended
> argument registers are required because 1AH_M80H exposes metrics through
> a firmware managed DRAM region. The GET_METRICS_TABLE_DRAM_ADDR command
> returns a 64-bit physical address split across arg_reg[0] (low 32-bit)
> and arg_reg[1] (high 32-bit), with the metrics table size in arg_reg[2].
> 
> Define amd_pmf_1ah_m80h_smu_regs to capture this extended register layout
> and register it in pmf_pci_ids[] via PCI_DEVICE_DATA(), keeping the
> existing amd_pmf_legacy_smu_regs shared instance for all prior platforms
> unchanged.
> 
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>   drivers/platform/x86/amd/pmf/core.c | 29 +++++++++++++++++++++++++----
>   drivers/platform/x86/amd/pmf/pmf.h  |  3 ++-
>   2 files changed, 27 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index 1826fc64bf56..7c5a1ec3d7fc 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -26,6 +26,13 @@
>   #define AMD_PMF_REGISTER_RESPONSE	0xA78
>   #define AMD_PMF_REGISTER_ARGUMENT	0xA58
>   
> +/* PMF-SMU communication registers for 1AH_M80H */
> +#define AMD_PMF_REG_MESSAGE_1AH_M80H	0xA04
> +#define AMD_PMF_REG_RESPONSE_1AH_M80H	0xA08
> +#define AMD_PMF_REG_ARGUMENT0_1AH_M80H	0xA0C
> +#define AMD_PMF_REG_ARGUMENT1_1AH_M80H	0xAAC
> +#define AMD_PMF_REG_ARGUMENT2_1AH_M80H	0xAB0
> +
>   /* Base address of SMU for mapping physical address to virtual address */
>   #define AMD_PMF_MAPPING_SIZE		0x01000
>   #define AMD_PMF_BASE_ADDR_OFFSET	0x10000
> @@ -179,7 +186,7 @@ static void __maybe_unused amd_pmf_dump_registers(struct amd_pmf_dev *dev)
>   	value = amd_pmf_reg_read(dev, dev->smu_regs->resp_reg);
>   	dev_dbg(dev->dev, "AMD_PMF_REGISTER_RESPONSE:%x\n", value);
>   
> -	value = amd_pmf_reg_read(dev, dev->smu_regs->arg_reg);
> +	value = amd_pmf_reg_read(dev, dev->smu_regs->arg_reg[0]);
>   	dev_dbg(dev->dev, "AMD_PMF_REGISTER_ARGUMENT:%d\n", value);
>   
>   	value = amd_pmf_reg_read(dev, dev->smu_regs->msg_reg);
> @@ -220,7 +227,7 @@ int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32
>   	amd_pmf_reg_write(dev, dev->smu_regs->resp_reg, 0);
>   
>   	/* Write argument into argument register */
> -	amd_pmf_reg_write(dev, dev->smu_regs->arg_reg, arg);
> +	amd_pmf_reg_write(dev, dev->smu_regs->arg_reg[0], arg);
>   
>   	/* Write message ID to message ID register */
>   	amd_pmf_reg_write(dev, dev->smu_regs->msg_reg, message);
> @@ -239,7 +246,7 @@ int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32
>   		if (get) {
>   			/* PMFW may take longer time to return back the data */
>   			usleep_range(DELAY_MIN_US, 10 * DELAY_MAX_US);
> -			*data = amd_pmf_reg_read(dev, dev->smu_regs->arg_reg);
> +			*data = amd_pmf_reg_read(dev, dev->smu_regs->arg_reg[0]);
>   		}
>   		break;
>   	case AMD_PMF_RESULT_CMD_REJECT_BUSY:
> @@ -266,7 +273,19 @@ int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32
>   static const struct amd_pmf_smu_regs amd_pmf_legacy_smu_regs = {
>   	.msg_reg	= AMD_PMF_REGISTER_MESSAGE,
>   	.resp_reg	= AMD_PMF_REGISTER_RESPONSE,
> -	.arg_reg	= AMD_PMF_REGISTER_ARGUMENT,
> +	.arg_reg	= { AMD_PMF_REGISTER_ARGUMENT, 0, 0 },
> +};
> +
> +/* 1AH_M80H uses an extended mailbox with three argument registers */
> +static const struct amd_pmf_smu_regs amd_pmf_1ah_m80h_smu_regs = {
> +	.msg_reg	= AMD_PMF_REG_MESSAGE_1AH_M80H,
> +	.resp_reg	= AMD_PMF_REG_RESPONSE_1AH_M80H,
> +	/* arg_reg[0], arg_reg[1] and arg_reg[2] carry low, hi address and size for DRAM metrics */
> +	.arg_reg	= {

Rather than overloading arg_reg how about if you just have a define in 
"struct amd_pmf_smu_regs" for low, hi, size?

So f1ahm80h wouldn't have arg_reg defined, it would have low_reg, 
high_reg, size_reg.

> +		AMD_PMF_REG_ARGUMENT0_1AH_M80H,
> +		AMD_PMF_REG_ARGUMENT1_1AH_M80H,
> +		AMD_PMF_REG_ARGUMENT2_1AH_M80H,
> +	},
>   };
>   
>   static const struct pci_device_id pmf_pci_ids[] = {
> @@ -274,6 +293,7 @@ static const struct pci_device_id pmf_pci_ids[] = {
>   	{ PCI_DEVICE_DATA(AMD, CPU_ID_PS,     &amd_pmf_legacy_smu_regs) },
>   	{ PCI_DEVICE_DATA(AMD, 1AH_M20H_ROOT, &amd_pmf_legacy_smu_regs) },
>   	{ PCI_DEVICE_DATA(AMD, 1AH_M60H_ROOT, &amd_pmf_legacy_smu_regs) },
> +	{ PCI_DEVICE_DATA(AMD, 1AH_M80H_ROOT, &amd_pmf_1ah_m80h_smu_regs) },
>   	{ }
>   };
>   
> @@ -563,6 +583,7 @@ static const struct acpi_device_id amd_pmf_acpi_ids[] = {
>   	{"AMDI0105", 0},
>   	{"AMDI0107", 0},
>   	{"AMDI0108", 0},
> +	{"AMDI0109", 0},
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(acpi, amd_pmf_acpi_ids);
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 7a8fd9d399de..088edfab08f0 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -28,6 +28,7 @@
>   #define AMD_CPU_ID_PS                   0x14e8
>   #define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT 0x1507
>   #define PCI_DEVICE_ID_AMD_1AH_M60H_ROOT 0x1122
> +#define PCI_DEVICE_ID_AMD_1AH_M80H_ROOT	0x115b
>   
>   /* Aliases required by PCI_DEVICE_DATA() macro naming convention */
>   #define PCI_DEVICE_ID_AMD_CPU_ID_RMB	AMD_CPU_ID_RMB
> @@ -400,7 +401,7 @@ struct pmf_cbi_ring_buffer {
>   struct amd_pmf_smu_regs {
>   	u32 msg_reg;
>   	u32 resp_reg;
> -	u32 arg_reg;
> +	u32 arg_reg[3];

See above comment.

>   };
>   
>   struct amd_pmf_dev {

