Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011035.outbound.protection.outlook.com [40.107.208.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D88A37EFE6
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2026 19:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783710695; cv=fail; b=FSEyb+qvbTA1wCtnRhcKuaFcDb46aIsw3GF+6znluN3IlmpFXtYPG5G/EmnMABN099e4RFLfKvgQeMEzbGAU9DnWwR3qJ7Uwqu33XeVDWQ+P4kSN6Aau4zpZpJW1S0UrweWLouSwMA5C9YzRIzJnAg91BGQvn2u73vQ6wjkJCdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783710695; c=relaxed/simple;
	bh=Y875RzxFC5xhBjiFuDk/puDr3FKR8OYe92s5siDujwc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ml1IwbpT9mT2X++fyO+orm/LZr/YM+kBqBV6Q4oaQ2m8lDjTV1+sW3UR5ZRJ1hlBmXEgllULaaAzLnuOVXDAcnngA0KBtm5s/QvKBnvOAX6leENfzvc+Pxkxid/uBxVIVYBM3v5M6vHifdtb6vUzwv+uqvnd56BjIA8GmSKSK8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jdEq1Mcm; arc=fail smtp.client-ip=40.107.208.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jdEq1Mcm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DEQqrgBB1agW6+p0udFpiW2WJ6tNPda7t1nAk7tTg7RgKlYJS2o0eyAmJLu9pwfOMWQM31Lh/8pRpy4maodzakJc48U11a4iSzy5ljxK+nArw7NxB8PUFQjezqed2NK06mv/dVUXVQ015gYDZ8o1zdIRMkAcAlknfJgE5owfCAiZCmCpflK4PJqkhGDsjTDOiQ0BO80OLiD4WWVuIrwLXxxzupVUP4tUHzJ8M9mOjjW2/KwNE4FsDK3pr64jRvkCTJte3HAmT5oOpgsm+QX0v5zxpzLCsBOb29E4xYUN7HSitgPIvPtClrQZlc0QmaV8MnngH8sXWa1nM3YxQkW2mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hxqb7lbMBHfc7KFYnw5BcoYuIsNjzivxdG+e4lZZtt8=;
 b=FNF7n7DH2FuiGb1xCLUX5EbBEBjh17CAGbalJ0Wt+Hjd7Q9htFy8IOYvt2UDEeziFbq6epp47ZCYrtvbG4etYiOSYVloZNCJwW7aH7Y08kOL/2Ye3r2RPvyhgJ3BxRr1uV056TMsspmjUiMe1UB6JsUdD+YUxVcYv6zoR6L3c8Mi6W1j25GxBdpMMtrajqxZCLdGV9qqB2rMPuk05Uw35bAZgObyQI0O+gzFO3EKpoSKlBwrPO6lQeZoKLrdeUCGUjrXTCrbbXQEaahJ8MNlRFt/HpPEFU7CKPy+wHVz/0vtyiNtk8WeTLFpAK7w2PhzeFvt56fv4ssLnF57cPI5aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hxqb7lbMBHfc7KFYnw5BcoYuIsNjzivxdG+e4lZZtt8=;
 b=jdEq1McmaY/+g9crxHKp2Z2RnEhMfLwhGfqhbecLDyPMHrh7Vsu5aXybs1GZQ8yd7rTpNDWxMDk5Zu3htVgVvC5kSGIrFB5Snar3ie+70HOLHuExpUDwNCyplH9AVbpvpKXhZgnWZD70a+Ue6CO49dMgnsfdT9XwW+JFbvGVQLk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by CY1PR12MB9627.namprd12.prod.outlook.com (2603:10b6:930:104::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 10 Jul
 2026 19:11:30 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%6]) with mapi id 15.21.0181.016; Fri, 10 Jul 2026
 19:11:30 +0000
Message-ID: <54e8969b-df1a-482e-8635-b6b8635a06b0@amd.com>
Date: Fri, 10 Jul 2026 14:11:28 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] platform/x86/amd/pmf: Refactor NPU metrics for
 platform extensibility
Content-Language: en-US
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20260710174219.2522269-1-Shyam-sundar.S-k@amd.com>
 <20260710174219.2522269-5-Shyam-sundar.S-k@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260710174219.2522269-5-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::15) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|CY1PR12MB9627:EE_
X-MS-Office365-Filtering-Correlation-Id: 674875ed-4882-4f1f-69ba-08dedeb70c0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|11063799006|18002099003|4143699003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	MkzZJsUlQVlo7veaFbr9GUzXtLEzRzSePzG6mGihfTZfjLblpoZwHqiCb9zz1YNFOwdt7I2bozwXY5YM8T8W3xZM6fZOmgeY78UDsHHDedspZgc0RURJh9ugrErFOHFdGQSfeCqtQPA4E3XQppQjBRhSnBbqLfRthH68M5jm1V3T3g1oObt4Aa3E/GxQy6tt/7C4NkflkJFbJmxJjgLxWMDmDw1Acl7EZdOhoIxw+IbpkJsVYbM1dT3Ldn56T/u8DzRq4grGSoyUxJqPVnELpfIpslmbNBy6YbibzVuvmJ8imG4V2S82To6QP7fcDd8xyBzbJlZDbiF8sNCgwUTeQB4RFd1Dwctdd4haokCv+Rut54JzdjMwiP30oREITe1X3H+tSi4b2dmF1tJPMsQS4Pe4/mnZmmHj1SBq8Gdf0fDEPBQoF3rvp1SE9diohB40+3DjvFFdNPv6zglriy7NF4zmZSq0EwDO0V0Fh1MHYXVDBYhZ+kFDXepGvHXShQNY5xUHGx33nlCuYV5cUUD1pkAoZJf2ikjDdwazCkU01apl5YB/WVswKDvPIL81p+eCRGy1JW5Rro9HzuAfufxdX04XgZLWQuv+pUb3H25FZEHd+1hPd3e52uM5gl5qYotiw//ReDzQEJZ5KgzkuKTkT1HL344dxx3V7d4FX8MWVu4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(11063799006)(18002099003)(4143699003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cytBTkduSWd1cWRHWnB2ZEVHdmVRc1RJRGY1ZE55TnJsdVVQYTVqWXFtWVJB?=
 =?utf-8?B?dmExT2N6VE8wS3d1cGJjTzgrcFFWMStVRWliNGM2MTl6NmhBSldDbERzQ3ZM?=
 =?utf-8?B?V09vRVBwYzJabzVKcEd0WDU1ZjZHVEFkaXdkUXJraS9La1NDR2RVUnBPQ3BG?=
 =?utf-8?B?UHUrcDRLbDg3QnhESjNveHpHNFRDWjNBbXBIbExrVzlyUTJXODVpVVFsR2I0?=
 =?utf-8?B?TkoxZ3l5azZnV0ZVeUlGbTJTbXE2WEtidFpieklEOEUydG1kODNDRC9rT0VK?=
 =?utf-8?B?MVJLMVY2SjFreFRXRVVTWnJYdUp5Q3hnbFk1empDQjhadkdHVyt1L2N2Sld1?=
 =?utf-8?B?VWNiaFZLSUthT2FHdkpWeFFoejFSaWtrVGhHU1Evc25kTlpkanh1cTlaVUIx?=
 =?utf-8?B?YzNtWitlUU5jalpzQXlibUtFNnd0TjlNdUlJdk8zRWErQjM4S0tsZGtIZ2pY?=
 =?utf-8?B?NmhqbldjMU5oalJ2WnZsclVQQ0Q4N1NoaHlRVzFVVE04TDdhN3BIRTFXYlJa?=
 =?utf-8?B?TGRONWNpZmFLc0pyU0N2UjRPK05DYit1UXFiamZsOXpCVVJCV0lIckRNVitn?=
 =?utf-8?B?WlYzaVhXUGFaWXFBemhqaVJITW95azExYUtEN0ZZS2JybExXTGthSnlHU291?=
 =?utf-8?B?cjN1RTM1WHIvNGR5NUhqZG5WeEJJTHNGcXFsTEVMQmhKNkNWdmYyNjdlTElq?=
 =?utf-8?B?VHZrWGI5cTErNjFhaXlyWEV4ZlU0eDRXUUtBYUJWYzUzWUhQVjB3bkxYTEJy?=
 =?utf-8?B?TGVtS3hXcTh5akp3OVdxbEFLNFJLRFZTb0NnWEFGTVpXZzNoZHNlRDJxK2Y1?=
 =?utf-8?B?MGEvb0hVQUlPUGY4UnNVWWl2cTFteCsxUWtWT0NiUlA5cjVTbDRHdTBQTGc0?=
 =?utf-8?B?OUFLQUhRVkFvN3BITngrUnd4RFVVMGlBTWRuMnFnS1B4WVRJV3lQR3ZwK1hO?=
 =?utf-8?B?cmh1MWNHcStRclg3WlJERkVyZDBqb0RxcDh2aWlLWkEyQTM0ZjRFMjhNc0ls?=
 =?utf-8?B?QmlpN3FuQmhQcERLUnpaWTlaQVVEajl1RHZ0VGJKNGhpV3RjVGhRVCtWcVV5?=
 =?utf-8?B?aEVNcElKekhTOG1DOGhLQlFQVVFja2pBMDZPWFVYN0pCK0lRQVJ1MGVGV1ZS?=
 =?utf-8?B?SEl0RmZPazg1RGRBR2Z0SE5tdEZUVk83czVJQytkMUluaC82d1hHN0hzSlNn?=
 =?utf-8?B?dngyTUU5Q0NVU1BzcWZsNDhoOHd5a1BkUFUzb0sxZCtyS1gvSlRYeGpnenNn?=
 =?utf-8?B?MWRISHRsL2xLUi9ZeDV2ZzhYNEZ5ZWdVSWxMMGZBYk1HNGMrUUdQdnp5aG1R?=
 =?utf-8?B?RHVXYzdvVHplT3JoZWxCd2dSbkFwWjlzd0JMZGlkNFFvZ3M1SXltVHdyUFhS?=
 =?utf-8?B?R0M3eHdsS0Q1RGVKM1YweGVJV1loa000ZC8vTnpmTS95K2dYMTJYMXdmbm9v?=
 =?utf-8?B?NzNZeHVPcWZDakltcGJGWkdMMTB3dWRScm1TLzdGbUM1NzdjNmJ6c3RuWU11?=
 =?utf-8?B?RWdsMkhrcWppVGcvYW56Wkgya1RRUGU2OVBwYjl3SzI3U2xHbUJwVzBsSTBl?=
 =?utf-8?B?MmVCVDlhWmowS1YzcUlSeXVMMTBNS3JDNUpZTFdUY0xoazJMQzUyNVZralhv?=
 =?utf-8?B?NFBXWkFtVGR2dW1aYVJTMElEb1dFTEdIM2VjTnVDNStFdUZwYzRONUNvUUdW?=
 =?utf-8?B?bm94d3FDemlBWHdhRzlYVW5scFluaWxVUzByNmZSUTZUTW45R1Y0YzE1SCsx?=
 =?utf-8?B?U1dBTzBNSkVMUzR5SGF2bk5NR3huNHllbU8yTVJlYXhvcmdkcjk5ZjZabU9J?=
 =?utf-8?B?MllSbVdJRE44THVLWEpiL0YrSEFoSmk3VERqVWN1aUx1RGlVVHRpbGc1Y2hP?=
 =?utf-8?B?YmhwY0Z4MjJBQ0VkVWtLT0RtOUZBUUxGdHFXZWhMc1JzeC82MUdxTDh5enEw?=
 =?utf-8?B?TUZSZU9pYkd6ajVCZldFUzIrSUVVYjlmL3NHMGo4dS9WWkRQRFJCMHo2Vnph?=
 =?utf-8?B?VytGTDAwVU1MUkxhL29Wc2VaUisrYUN3L1NuZ3lCQVN0ODVSdDg1Umd5OHAr?=
 =?utf-8?B?RGhnRGtTY0hsUUcrY0puV1dHUm1wNU8rV0N1SzZ6bm5TRnhKLzlhUUhwNXA4?=
 =?utf-8?B?YUJCS0hBVVlaQ1JjZDhxZTlLY3RGNEozb2dPQSsxb0E2TFVPREx4bXcyM2ZO?=
 =?utf-8?B?SjVKc3E5VkkxaDdNWi9GOUtuYUw2bUloclFQMXZ4S21GWXNJaE40bE1DY2tK?=
 =?utf-8?B?UFlBemN1Q2F2YS9JcXpEbUhJTkdNalN3TFZoVzJ0YStveGt6YzJsQnZ3ZnZ6?=
 =?utf-8?Q?1aGY0o8QURAnisz33J?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 674875ed-4882-4f1f-69ba-08dedeb70c0e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 19:11:29.9381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +EakWBJ72Zlgv2XSPmXFrkAC/tYIao8EnVSJpEnh/+f+ZVYt77MnBONz4HCCqy5WlfRiD3wD3RI3SqwjRR2vLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9627



On 7/10/26 12:42, Shyam Sundar S K wrote:
> Refactor the NPU metrics retrieval code to use a switch-case structure
> based on CPU ID, preparing the driver for supporting additional
> platforms with different metrics table formats.
> 
> This change restructures amd_pmf_get_smu_metrics() to handle
> platform-specific metrics retrieval paths. The existing logic for
> 1AH_M20H and 1AH_M60H platforms is preserved within the switch-case
> block.
> 
> No functional changes.
> 
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

> ---
>   drivers/platform/x86/amd/pmf/metrics.c | 42 +++++++++++++++-----------
>   1 file changed, 24 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/metrics.c b/drivers/platform/x86/amd/pmf/metrics.c
> index bb4f9127c655..5a8ebacbc3b3 100644
> --- a/drivers/platform/x86/amd/pmf/metrics.c
> +++ b/drivers/platform/x86/amd/pmf/metrics.c
> @@ -9,6 +9,7 @@
>    *	    Patil Rajesh Reddy <Patil.Reddy@amd.com>
>    */
>   
> +#include <linux/array_size.h>
>   #include <linux/bits.h>
>   #include <linux/cleanup.h>
>   #include <linux/container_of.h>
> @@ -134,28 +135,33 @@ static int amd_pmf_get_smu_metrics(struct amd_pmf_dev *dev, struct amd_pmf_npu_m
>   	if (ret)
>   		return ret;
>   
> -	ret = amd_pmf_set_dram_addr(dev, true);
> -	if (ret)
> -		return ret;
> +	switch (dev->cpu_id) {
> +	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> +	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> +		ret = amd_pmf_set_dram_addr(dev, true);
> +		if (ret)
> +			return ret;
>   
> -	memset(dev->buf, 0, dev->mtable_size);
> +		memset(dev->buf, 0, dev->mtable_size);
>   
> -	/* Send SMU command to get NPU metrics */
> -	ret = amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, SET_CMD, METRICS_TABLE_ID, NULL);
> -	if (ret) {
> -		dev_err(dev->dev, "SMU command failed to get NPU metrics: %d\n", ret);
> -		return ret;
> -	}
> +		/* Send SMU command to get NPU metrics */
> +		ret = amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, SET_CMD, METRICS_TABLE_ID, NULL);
> +		if (ret) {
> +			dev_err(dev->dev, "SMU command failed to get NPU metrics: %d\n", ret);
> +			return ret;
> +		}
>   
> -	memcpy(&dev->m_table_v2, dev->buf, dev->mtable_size);
> +		memcpy(&dev->m_table_v2, dev->buf, dev->mtable_size);
>   
> -	data->npuclk_freq = dev->m_table_v2.npuclk_freq;
> -	for (i = 0; i < ARRAY_SIZE(data->npu_busy); i++)
> -		data->npu_busy[i] = dev->m_table_v2.npu_busy[i];
> -	data->npu_power = dev->m_table_v2.npu_power;
> -	data->mpnpuclk_freq = dev->m_table_v2.mpnpuclk_freq;
> -	data->npu_reads = dev->m_table_v2.npu_reads;
> -	data->npu_writes = dev->m_table_v2.npu_writes;
> +		data->npuclk_freq = dev->m_table_v2.npuclk_freq;
> +		for (i = 0; i < ARRAY_SIZE(data->npu_busy); i++)
> +			data->npu_busy[i] = dev->m_table_v2.npu_busy[i];
> +		data->npu_power = dev->m_table_v2.npu_power;
> +		data->mpnpuclk_freq = dev->m_table_v2.mpnpuclk_freq;
> +		data->npu_reads = dev->m_table_v2.npu_reads;
> +		data->npu_writes = dev->m_table_v2.npu_writes;
> +		break;
> +	}
>   
>   	return 0;
>   }

