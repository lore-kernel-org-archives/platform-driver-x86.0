Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012001.outbound.protection.outlook.com [40.93.195.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40C8282F34
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2026 18:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783707697; cv=fail; b=lcEYRo0FDqpAb3w5FJBJm9Ri0QEifOwhqlrrpxDHfYbK2oSFcihVreaJnn0V+vCyA7Mkz8xRutKg+qhadkvxrjxitOlNbp669V+yR4IGynaGx78njR6aDKwdU6jPuBPUh2UeML7Qun+Vt9eSMiVczseNV7+gGO46D7uWG2k+WqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783707697; c=relaxed/simple;
	bh=mX9qnOS1SFMxlz6RLq/irDOOrqNVmXsWq1FekCTndPc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TjC5Xb7dqAqz8+JrGRxLk1rOzDDQKY8fkR5yWTOfR3yPLotAR3dbjokbjClPnkfVTa9mGZEmYz324GZ7lG89jFNlucXABAYBbp/FADkt6dhsGaQNMNFkt/8USEFaF+6N4ewk24sOsceel9VBCCfObRG0RnZaeiIcSR6yOM8NXFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4jpjgLKB; arc=fail smtp.client-ip=40.93.195.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4jpjgLKB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nrWkRMI6LwdZMoXeUN7oxZls8PVTUmAPY4SeG2gnNVxG5NAuXLs+LzVkqB2G5oE7JknaabyiaHnHbuLzxcSzqwVUUOebsyYaSllh5fEv1W7C5IwOT8DSKllK+6OWpfbdarceU+AObF+vuyUbcB8duJV4DgY8f5sTkbNvBjk9G6HZuwHY2idirU0DMqTvIFQAbe213y4xI9rzGKi1dOc3h7uheb9nMPrUi5dNT0ChpV+7dMkkm3cbDi/3rpFdDk53Xj60nhjDEYX3LMg2oBg4mgFouejuUR5/EoD4aXNX3adYzhFEKqZ1uXIYsk9AoZLNHg+c3qRT4bGvPd3pXYkGfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ihe6qFBAS529h2bJ+0Ormrt3TQN4FTmpH+0wsJkxnQA=;
 b=AnG2vxd9eSCKRq3qvs0zGpHnZWK4ZrdeHibiOo9f9j+H7APTOcMlzXNlTOT65lJCMa2hQMRb/zZWLpdzKzACsKO2BnXk9KRgQz16wQzZH8ql9yJYcLdWOPj1VKSFSJfhX7lrOzxVkkPKPdA1iZL5UIiM1EjMn61Ldb3Sokza+YBfJDw3zZ4jYsEDqbknM6BykmDr22JTz5dQIKdLmDf7Yf/HqOzEUgMyo2bmIBj+quCqYyKTnDtnGGesoz515kG1O2jLVEPS93iWS3eR5/SAqJ5NkBU/X5Vc7PYFyJcDW4QHtNA24hKXpY7V1fhv1+1GFU/UCjsRYsKpRTQqyqeGuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ihe6qFBAS529h2bJ+0Ormrt3TQN4FTmpH+0wsJkxnQA=;
 b=4jpjgLKB01CelFGESNrirGjfDDYq/o+j7q+8f3lY+il7gvR9uolu9vbEPm9t5sZb9zj762pdSMcoc5mOSDSeXpUvG5dZKwpwmTOm4Gk0jTEAdRA5+emu8w58sZggtA8Z+Jf99gjmRux/C8yBF9kjTPTGT7exERrq7bJjsTfyraU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by DM6PR12MB4060.namprd12.prod.outlook.com (2603:10b6:5:216::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 18:21:32 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%6]) with mapi id 15.21.0181.016; Fri, 10 Jul 2026
 18:21:31 +0000
Message-ID: <2dd129eb-e7e3-435f-8566-c9171f426bf1@amd.com>
Date: Fri, 10 Jul 2026 13:21:28 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] platform/x86/amd/pmf: Add 1AH_M80H metrics table and
 NPU metrics support
Content-Language: en-US
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20260710174219.2522269-1-Shyam-sundar.S-k@amd.com>
 <20260710174219.2522269-6-Shyam-sundar.S-k@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260710174219.2522269-6-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0756.namprd03.prod.outlook.com
 (2603:10b6:408:13a::11) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|DM6PR12MB4060:EE_
X-MS-Office365-Filtering-Correlation-Id: f2e7b972-a90b-4e08-12d9-08dedeb010e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|6133799003|56012099006|4143699003|11063799006|5023799004|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	ym2bnF1eA44pAQcyc8o6CK6oSaK9b9aspheipSv4MFSNW1xkVsbLkD622ChemxaI7DZSlvHJkgk5GjYBh3mmlNUorx0JWKmTpsEePqKC7JDsqGWUA0Ur/ZLlKqhIcq1HtF8oCCzbWjD/jqY66PU9TGpjbmo/0QY9q7SyAldahF8s/qghxcexO6FjpQvfhkmSPfGwC1qHIoLuFIjHycXOzn3I4F9nJz2lR4oels7LrGv4qZHVQZngfpF/OZaq+zp/jUwuvthcwmp16zvBt7dTEKZTvTVFp40VRRkBiuhg7KCF1IQE2DUxUsdwb2VMU+MLj65332EYbF4h99uctHBjFH031Kvfuib1KyG2+/AN4rXuuTFwngAIfHavJHDfQHsG2v3Uw6l88PoQdTPCpLWsdiCSBIKMQF2sPR843d64V8IaeD+qIA2eVwICPNHEx5by6dEX7rBOGZaPwccEn/anclP0nRMlowDeJN98JnaRkofvbqtFqMJpQkNt0mo4WoJFUz/iVu9iuYRcnSd6yk9NZumq24l7/GVGr0023babVhav4t+GhXq9pbn++IWa58fk68UIHBrLaweegvj1wSJbc0Nm8jYpUwo0IQSQ+dWmi4XrjuONIa/v86qLYtXdRKdghv4bVYPqXmRTTGXQhwcJOgE9zjpUZ+l1y0V4K/f6gF0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(6133799003)(56012099006)(4143699003)(11063799006)(5023799004)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXR5elYzVW02NnNHYTcyVWhnRmZtaEt4M0VHNGZadVpmbHMxSHFWZzI0bUY5?=
 =?utf-8?B?dG1Mb2IxeXo0WkQ4KzNkcjJDMXFqZ2t1Umk2MVVsaGJWS21JYVowQ1JVTEFT?=
 =?utf-8?B?RE11bFpJcXI2UlZ6c1RId3NpaDlnaG45cTFVZU9DQXlGMWx4SVgrQ1dJS2sx?=
 =?utf-8?B?TU1rZkpTWXVtVXVuSmt3TytXTEtRc1FiNVhwVGppZjk1SzBuNi9kSWJoYXNP?=
 =?utf-8?B?Q05PeGVTZ05BS1hFcGlDVlVQYkJhdDhWbTF3ZFB0TDZQVzM1V1Zud2pwVTg0?=
 =?utf-8?B?Zk9Sd0RRMEUzdHFrTU82SFBiNWpkZUVVdmZTVnZwYjdValpsZytycXdLS0NG?=
 =?utf-8?B?alp5L3ZWNVVTd0U4U1NUZnBmaUU0OXVVbklQaWIxUmtuUmZQZ29ldHlMKzBS?=
 =?utf-8?B?YzFLcXJSZm1ZK0tlMUZ4WDBaSjNudnVBMklIMUUxSkJudmtRZjZ5QkorQmxt?=
 =?utf-8?B?ejlna1N0ZG9MTGZhOGxtNkkzbThIT3phRWJ0aXplUUVsWFVkMkFQZE5vdE9u?=
 =?utf-8?B?UXd4WXRpdkNKaUFMMzgxNDJhcFQ5ZTM5alhyN1grbTVGenllYkd1S0RHQVJO?=
 =?utf-8?B?UzRGK092ZEVoRmVkemxld2Nab2FKbUlXZ0tGeXB0UitmWFBSeWJ3dGIxOC9P?=
 =?utf-8?B?S3Zod05XVUk5Q0xFb3p4V24zeXE3T0RMQjZCTTh1ZmUvc2NnU3FkQTQ0UFF4?=
 =?utf-8?B?TFZaWVg3MWIxeEhWUjh6cG9PTEY3VkxsSm1hQlJldDd2SXA5R1Q5UXdHTXVV?=
 =?utf-8?B?WE10Q0RaTlc3aXl0cnRXUTVUbURNVEVEUXczeXdmYm5HazdFTTB2UmZtOUpG?=
 =?utf-8?B?QU9LNGE0UEtjcWRxb0ZyVFRCdHdhVUhFa0k2U2dKRFlXVXlFMlBaYmlwVG1y?=
 =?utf-8?B?dzdaZ2s2emNQRkc1M1pEZE5rSWFHNktXcS9FTU1TV2NWRWwrWDFvUTVONjNz?=
 =?utf-8?B?STlCR3JvUXZIQnJNaUt0OVRKUThObjFGQis2UUtrNXQxcE9aeUVuZEU4WTNF?=
 =?utf-8?B?bG5wMDIrTHpGT1RYUE9odEl2QjVOUkl0dFpyZSs0RWhnLzRJT1NhdEFZeHl4?=
 =?utf-8?B?eEdZMW00cEEydTFjVXR0VVRPYjBwV1l4R3djQkFsQ2hCTlRTNXlYYTlxUU00?=
 =?utf-8?B?djcvR1h6cnJSbzF4dm9mSFl6U294VnVNU0QvNEdNekUzKytVTDVMNHpnK2hH?=
 =?utf-8?B?SWZ3aVQ1ZHZVZSt4VzJKSlFEa3NNSnB3SjJZaWJtL2g3UmhVT2ZBckZDNkU5?=
 =?utf-8?B?ajRQTHJEN0NBS1p5dkYxWlpzeSt3WngvVWxiaytyMk54eVlYQmFNRGdNd1F2?=
 =?utf-8?B?N2JCQ2tmQTBCdE13bGtPYTNzS1ZxdzVEV2Z0QURjbDJEK1FGMUNTYzhpNWJG?=
 =?utf-8?B?cVJQZUNvcnpUcTBvZlg0Z0xZWStQbGhPZ1c4RUlNRmhzZCtHOG9KSXI2V3RZ?=
 =?utf-8?B?TjFDZm1ubUFER1ZaV3grVXRady9kd05wTUxIM3dFR1owQWpxNnB1RHlaTkxG?=
 =?utf-8?B?K051RzdEaXVsa0ZwNW1kSEJFV3pUc0xSVVpUM3RhTDAyU1dpdmwzd2R4OXhF?=
 =?utf-8?B?MmE2dng4aGxPS3BQYmM0elRLWC9aMHNGVWtQdm9LSjlSWkE3MU1tQWRPWEpF?=
 =?utf-8?B?blBVSGI1OWdmaEdmVHdSa2JnbVFxUXhaZkptdXV1UGlJbUpwNlZBc0RObzFX?=
 =?utf-8?B?L1Y4OEVDaW02U0hwTmphWTh3YktLZnhRNEFSVEZDYmVxTWRHRkxtNWdORVYx?=
 =?utf-8?B?YVVIZlVTRzNJTTNsR2xvTSt2aTRMSlRicmgwai9wWnExRkNBTFhsOU9iZTdn?=
 =?utf-8?B?bERqVFFTMXBMdEx6M1M3RnBNRFFDd1IzVzNJYXZQQncySFVlajh3Qm9Yd29F?=
 =?utf-8?B?S2VhNnExVVdCNVUwQk4zYU5nMUVLMndZN2o4SE44ZGp5WTRVRDNzN0tLMFpu?=
 =?utf-8?B?blRlV1dPZE11dkMrZ3VveHRvK0ZzUmttNEROUlZCazhUR3M1QVNIeS9QcW1t?=
 =?utf-8?B?VlRjUFFFNEtKRVo1VXFMN1dZWnd3ZExGc2VBME9wcXNucWk5M3lDVk9YcjNF?=
 =?utf-8?B?dVhtcG90NVZvdVc2aDhYTUUvckN6YmVMMVN6R2hNQlREc094U3o2MXJGQ0hp?=
 =?utf-8?B?anYwb1BpYXhlOHpqWGk2TTNTMWlEYWVwb2xYUWIyRzc4L0hCK3FmWVIyVmZj?=
 =?utf-8?B?aUoyZDZMc05waCtEaU4rbEo0SXkvVSs1YldzdW5hOWQyUmxsREo4VnJXUVFq?=
 =?utf-8?B?WnM4ZlM3YzRsOVFoclVtWGwxWCsycFg1d0tsYUhBV1hTTmF4cHlaZkQzM005?=
 =?utf-8?B?UCs0amx0dnUwTGpjNHNQVm9PckY3bnpJd3M5Z2hSSVRyZEprWFJmUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2e7b972-a90b-4e08-12d9-08dedeb010e0
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 18:21:31.4577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /TXOJtCeKDLOA05QqFTyKCYpYWGsOrMWpvcXEX79ZDelbGP2KnuEiN86ky69c4yI3R6IWA/TpP/leOsUXmOGTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4060



On 7/10/26 12:42, Shyam Sundar S K wrote:
> The 1AH_M80H platform introduces a new firmware managed DRAM based
> metrics table (amd_pmf_metrics_v3) covering the full platform telemetry
> including power, voltages, frequencies, throttlers and activity monitors.
> 
> As a first consumer of this table, add NPU metrics retrieval. Unlike
> earlier platforms that use a transfer table command, 1AH_M80H metrics
> are accumulator based and require delta calculation between consecutive
> samples.
> 
> Extend amd_pmf_npu_metrics with npu_temp, populated from the
> npu_temp_acc accumulator field available on 1AH_M80H.
> 
> Key changes include:
>   - Add DRAM based metrics table support for the 1AH_M80H platform
>   - Introduce amd_pmf_get_tbl_dram_addr() to obtain the DRAM address
>   - Add amd_pmf_get_metrics_table_log_sample() to trigger metrics updates
>   - Add struct amd_pmf_metrics_v3 for the 1AH_M80H metrics format
>   - Implement accumulator based delta calculation for metrics
>   - Introduce amd_pmf_calculate_acc_npu_metrics() to get NPU metrics
> 
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>   drivers/platform/x86/amd/pmf/core.c    |  25 +++
>   drivers/platform/x86/amd/pmf/metrics.c | 142 ++++++++++++++++
>   drivers/platform/x86/amd/pmf/pmf.h     | 218 +++++++++++++++++++++++++
>   include/linux/amd-pmf-io.h             |   2 +
>   4 files changed, 387 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index c0a21808b867..5d744eb71418 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -68,6 +68,12 @@ static bool smart_pc_support = true;
>   module_param(smart_pc_support, bool, 0444);
>   MODULE_PARM_DESC(smart_pc_support, "Smart PC Support (default = true)");
>   
> +/* Helper to check if platform is 1AH_M80H */
> +bool is_amd_pmf_1ah_m80h(struct amd_pmf_dev *pdev)
> +{
> +	return pdev->cpu_id == PCI_DEVICE_ID_AMD_1AH_M80H_ROOT;
> +}
> +

The main difference is that metrics come from an accumulator format.
Althought 1ah M80h works this way, it's not intended to be a straggler. 
I'd think this helper would be better structured like this:

bool amd_pmf_supports_accumulator_metrics(struct amd_pmf_dev *pdev)
{
	switch(pdev->cpu_id) {
	case PCI_DEVICE_ID_AMD_1AH_M80H_ROOT:
		return true;
	default:
		return false;
	}
}

>   static int amd_pmf_pwr_src_notify_call(struct notifier_block *nb, unsigned long event, void *data)
>   {
>   	struct amd_pmf_dev *pmf = container_of(nb, struct amd_pmf_dev, pwr_src_notifier);
> @@ -155,6 +161,12 @@ static void __maybe_unused amd_pmf_dump_registers(struct amd_pmf_dev *dev)
>   
>   	value = amd_pmf_reg_read(dev, dev->smu_regs->arg_reg[0]);
>   	dev_dbg(dev->dev, "AMD_PMF_REGISTER_ARGUMENT:%d\n", value);
> +	if (is_amd_pmf_1ah_m80h(dev)) {
> +		value = amd_pmf_reg_read(dev, dev->smu_regs->arg_reg[1]);
> +		dev_dbg(dev->dev, "AMD_PMF_REGISTER_ARGUMENT1:%d\n", value);
> +		value = amd_pmf_reg_read(dev, dev->smu_regs->arg_reg[2]);
> +		dev_dbg(dev->dev, "AMD_PMF_REGISTER_ARGUMENT2:%d\n", value);
> +	}
>   
>   	value = amd_pmf_reg_read(dev, dev->smu_regs->msg_reg);
>   	dev_dbg(dev->dev, "AMD_PMF_REGISTER_MESSAGE:%x\n", value);
> @@ -214,6 +226,13 @@ int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32
>   			/* PMFW may take longer time to return back the data */
>   			usleep_range(DELAY_MIN_US, 10 * DELAY_MAX_US);
>   			*data = amd_pmf_reg_read(dev, dev->smu_regs->arg_reg[0]);
> +			if (is_amd_pmf_1ah_m80h(dev) &&
> +			    message == GET_1AH_M80H_METRICS_TABLE_DRAM_ADDR) {
> +				dev->dram_addr.hi = amd_pmf_reg_read(dev,
> +								     dev->smu_regs->arg_reg[1]);
> +				dev->dram_addr.size = amd_pmf_reg_read(dev,
> +								       dev->smu_regs->arg_reg[2]);
> +			}
>   		}
>   		break;
>   	case AMD_PMF_RESULT_CMD_REJECT_BUSY:
> @@ -518,6 +537,12 @@ static int amd_pmf_probe(struct platform_device *pdev)
>   	if (err)
>   		return err;
>   
> +	if (is_amd_pmf_1ah_m80h(dev)) {
> +		err = amd_pmf_get_tbl_dram_addr(dev);
> +		if (err)
> +			return err;
> +	}
> +
>   	apmf_acpi_init(dev);
>   	platform_set_drvdata(pdev, dev);
>   	amd_pmf_dbgfs_register(dev);
> diff --git a/drivers/platform/x86/amd/pmf/metrics.c b/drivers/platform/x86/amd/pmf/metrics.c
> index 5a8ebacbc3b3..4cb45a8bbdb4 100644
> --- a/drivers/platform/x86/amd/pmf/metrics.c
> +++ b/drivers/platform/x86/amd/pmf/metrics.c
> @@ -17,6 +17,8 @@
>   #include <linux/device/devres.h>
>   #include <linux/io.h>
>   #include <linux/ktime.h>
> +#include <linux/math.h>
> +#include <linux/minmax.h>
>   #include <linux/string.h>
>   #include <linux/workqueue.h>
>   
> @@ -24,6 +26,89 @@
>   
>   static struct device *pmf_device;
>   
> +static u16 amd_pmf_q10_acc_to_mW(u64 avg_acc)
> +{
> +	u64 val = DIV_ROUND_CLOSEST_ULL(avg_acc, 1024) * 1000;
> +
> +	return min_t(u16, val, U16_MAX);
> +}
> +
> +static u16 amd_pmf_q10_acc_to_int(u64 avg_acc)
> +{
> +	u64 val = DIV_ROUND_CLOSEST_ULL(avg_acc, 1024);
> +
> +	return min_t(u16, val, U16_MAX);
> +}
> +
> +static u64 amd_pmf_avg_acc_metric(u32 curr_counter, u32 prev_counter,
> +				  u64 curr_value, u64 prev_value)
> +{
> +	u32 counter_diff;
> +	u64 val_diff;
> +
> +	/* Check for counter reset */
> +	if (curr_counter <= prev_counter)
> +		return 0;
> +
> +	counter_diff = curr_counter - prev_counter;
> +
> +	if (curr_value < prev_value)
> +		return 0;
> +
> +	val_diff = curr_value - prev_value;
> +
> +	return DIV_ROUND_CLOSEST_ULL(val_diff, counter_diff);
> +}
> +
> +int amd_pmf_get_tbl_dram_addr(struct amd_pmf_dev *dev)
> +{
> +	int ret;
> +
> +	ret = amd_pmf_send_cmd(dev, GET_1AH_M80H_METRICS_TABLE_DRAM_ADDR, GET_CMD,
> +			       ARG_NONE, &dev->dram_addr.lo);
> +	if (ret) {
> +		dev_err(dev->dev, "Failed to get DRAM address: %d\n", ret);
> +		return ret;
> +	}
> +
> +	dev->metrics_table_phys = ((u64)dev->dram_addr.hi << 32) | dev->dram_addr.lo;
> +	dev->mtable_size = dev->dram_addr.size;
> +
> +	if (dev->mtable_size != sizeof(dev->mtable_v3)) {
> +		dev_err(dev->dev, "Metrics table size mismatch: got %u, expected %zu\n",
> +			dev->dram_addr.size, sizeof(dev->mtable_v3));
> +		return -EINVAL;
> +	}
> +
> +	dev->metrics_table_virt = devm_ioremap(dev->dev, dev->metrics_table_phys, dev->mtable_size);
> +	if (!dev->metrics_table_virt) {
> +		dev_err(dev->dev, "Failed to map DRAM address for PMF metrics table\n");
> +		dev->metrics_table_phys = 0;
> +		return -ENOMEM;
> +	}
> +
> +	return 0;
> +}
> +
> +static int amd_pmf_get_metrics_table_log_sample(struct amd_pmf_dev *dev)
> +{
> +	int ret;
> +
> +	if (!dev->metrics_table_virt) {
> +		dev_err(dev->dev, "Metrics DRAM not mapped\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Send command to PMFW to update metrics table log sample */
> +	ret = amd_pmf_send_cmd(dev, GET_1AH_M80H_METRICS_TABLE_LOG_SAMPLE, SET_CMD, ARG_NONE, NULL);
> +	if (ret) {
> +		dev_err(dev->dev, "Failed to request metrics log sample: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>   static void amd_pmf_get_metrics(struct work_struct *work)
>   {
>   	struct amd_pmf_dev *dev = container_of(work, struct amd_pmf_dev, work_buffer.work);
> @@ -119,12 +204,46 @@ static int is_npu_metrics_supported(struct amd_pmf_dev *pdev)
>   	switch (pdev->cpu_id) {
>   	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>   	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> +	case PCI_DEVICE_ID_AMD_1AH_M80H_ROOT:
>   		return 0;
>   	default:
>   		return -EOPNOTSUPP;
>   	}
>   }
>   
> +static void amd_pmf_calculate_acc_npu_metrics(struct amd_pmf_dev *dev,
> +					      struct amd_pmf_npu_metrics *data)
> +{
> +	struct amd_pmf_metrics_iod *curr, *prev;
> +	u64 val;
> +	int i;
> +
> +	curr = &dev->mtable_v3.iod;
> +	prev = &dev->prev_metrics.iod;
> +
> +	val = amd_pmf_avg_acc_metric(curr->counter_acc, prev->counter_acc,
> +				     curr->npu_temp_acc, prev->npu_temp_acc);
> +	data->npu_temp = amd_pmf_q10_acc_to_int(val);
> +	val = amd_pmf_avg_acc_metric(curr->counter_acc, prev->counter_acc,
> +				     curr->npu_power_acc, prev->npu_power_acc);
> +	data->npu_power = amd_pmf_q10_acc_to_mW(val);
> +	val = amd_pmf_avg_acc_metric(curr->counter_acc, prev->counter_acc,
> +				     curr->npuhclk_freq_eff_acc,
> +				     prev->npuhclk_freq_eff_acc);
> +	data->mpnpuclk_freq = amd_pmf_q10_acc_to_int(val);
> +	val = amd_pmf_avg_acc_metric(curr->counter_acc, prev->counter_acc,
> +				     curr->aieclk_freq_eff_acc,
> +				     prev->aieclk_freq_eff_acc);
> +	data->npuclk_freq = amd_pmf_q10_acc_to_int(val);
> +
> +	for (i = 0; i < ARRAY_SIZE(curr->npu_busy_acc); i++) {
> +		val = amd_pmf_avg_acc_metric(curr->counter_acc, prev->counter_acc,
> +					     curr->npu_busy_acc[i],
> +					     prev->npu_busy_acc[i]);
> +		data->npu_busy[i] = amd_pmf_q10_acc_to_int(val);
> +	}
> +}
> +
>   static int amd_pmf_get_smu_metrics(struct amd_pmf_dev *dev, struct amd_pmf_npu_metrics *data)
>   {
>   	int ret, i;
> @@ -135,6 +254,8 @@ static int amd_pmf_get_smu_metrics(struct amd_pmf_dev *dev, struct amd_pmf_npu_m
>   	if (ret)
>   		return ret;
>   
> +	memset(data, 0, sizeof(*data));
> +
>   	switch (dev->cpu_id) {
>   	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>   	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> @@ -161,6 +282,27 @@ static int amd_pmf_get_smu_metrics(struct amd_pmf_dev *dev, struct amd_pmf_npu_m
>   		data->npu_reads = dev->m_table_v2.npu_reads;
>   		data->npu_writes = dev->m_table_v2.npu_writes;
>   		break;
> +	case PCI_DEVICE_ID_AMD_1AH_M80H_ROOT:
> +		ret = amd_pmf_get_metrics_table_log_sample(dev);
> +		if (ret)
> +			return ret;
> +
> +		memcpy_fromio(&dev->mtable_v3, dev->metrics_table_virt, sizeof(dev->mtable_v3));
> +
> +		/*Ignore the first sample, as previous metrics is uninitialized (zero)
> +		 * Metrics are calculated as:
> +		 *	metrics = current_metrics - previous_metrics
> +		 * Skipping the initial sample ensures accurate delta calculations.
> +		 */
> +		if (!dev->npu_metrics_have_prev) {
> +			memcpy(&dev->prev_metrics, &dev->mtable_v3, sizeof(dev->mtable_v3));
> +			dev->npu_metrics_have_prev = true;
> +			return 0;
> +		}
> +
> +		amd_pmf_calculate_acc_npu_metrics(dev, data);
> +		memcpy(&dev->prev_metrics, &dev->mtable_v3, sizeof(dev->mtable_v3));
> +		break;
>   	}
>   
>   	return 0;
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 4873685c84ad..76cfeb2b963c 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -75,6 +75,10 @@ struct cookie_header {
>   #define SET_PMF_PPT            0x25
>   #define SET_PMF_PPT_APU_ONLY   0x26
>   
> +/* Message IDs for 1AH_M80H platform */
> +#define GET_1AH_M80H_METRICS_TABLE_LOG_SAMPLE	0x0E
> +#define GET_1AH_M80H_METRICS_TABLE_DRAM_ADDR	0x0F
> +
>   /* OS slider update notification */
>   #define DC_BEST_PERF		0
>   #define DC_BETTER_PERF		1
> @@ -139,6 +143,11 @@ struct cookie_header {
>   
>   extern int metrics_table_loop_ms;
>   
> +#define AMD_PMF_METRIC_CORE_TYPE_MAX	4
> +#define AMD_PMF_METRIC_CCX_MAX		4
> +#define AMD_PMF_NUM_CLK_DPM_LEVELS	8
> +#define AMD_PMF_NUM_MAX_CORES		12
> +
>   typedef void (*apmf_event_handler_t)(acpi_handle handle, u32 event, void *data);
>   
>   static const uuid_t amd_pmf_ta_uuid[] __used = { UUID_INIT(0xd9b39bf2, 0x66bd, 0x4154, 0xaf, 0xb8,
> @@ -250,6 +259,199 @@ struct apmf_fan_idx {
>   	u32 fan_ctl_idx;
>   } __packed;
>   
> +struct amd_pmf_metrics_iod {
> +	u32 counter_acc;
> +	/* Set Voltage */
> +	u64 vddcr_set_voltage;
> +	u64 vddcr_soc_set_voltage;
> +	u64 vddcr_npu_set_voltage;
> +	u64 vddcr_lp_set_voltage;
> +	u64 vddcr_gfx_set_voltage;
> +	u64 vdd_misc_set_voltage;
> +	/* Telemetry Voltages */
> +	u64 vddcr_telemetry_voltage;
> +	u64 vddcr_soc_telemetry_voltage;
> +	u64 vddcr_npu_telemetry_voltage;
> +	u64 vddcr_lp_telemetry_voltage;
> +	u64 vddcr_gfx_telemetry_voltage;
> +	u64 vdd_misc_telemetry_voltage;
> +	/* Telemetry Powers */
> +	u64 vddcr_telemetry_power;
> +	u64 vddcr_soc_telemetry_power;
> +	u64 vddcr_npu_telemetry_power;
> +	u64 vddcr_lp_telemetry_power;
> +	u64 vddcr_gfx_telemetry_power;
> +	u64 vdd_misc_telemetry_power;
> +	/* Throttlers - Fast PPT */
> +	u32 fppt_fused_limit;
> +	u32 fppt_max_irm_limit;
> +	u32 fppt_max_pbo_limit;
> +	u32 fppt_limit;
> +	u64 fppt_value_acc;
> +	u32 fppt_residency_acc;
> +	/* Throttlers - Slow PPT */
> +	u32 sppt_fused_limit;
> +	u32 sppt_max_irm_limit;
> +	u32 sppt_max_pbo_limit;
> +	u32 sppt_limit;
> +	u64 sppt_value_acc;
> +	u32 sppt_residency_acc;
> +	/* Throttlers - STAPM */
> +	u32 spl_fused_limit;
> +	u32 spl_max_irm_limit;
> +	u32 spl_max_pbo_limit;
> +	u32 spl_limit;
> +	u64 spl_value_acc;
> +	u32 spl_residency_acc;
> +	/* Throttlers - TDC VDDCR */
> +	u32 tdc_vddcr_fused_limit;
> +	u32 tdc_vddcr_max_irm_limit;
> +	u32 tdc_vddcr_max_pbo_limit;
> +	u32 tdc_vddcr_limit;
> +	u64 tdc_vddcr_value_acc;
> +	u32 tdc_vddcr_residency_acc;
> +	/* Throttlers - TDC VDDCR_SOC */
> +	u32 tdc_vddcr_soc_fused_limit;
> +	u32 tdc_vddcr_soc_max_irm_limit;
> +	u32 tdc_vddcr_soc_max_pbo_limit;
> +	u32 tdc_vddcr_soc_limit;
> +	u64 tdc_vddcr_soc_value_acc;
> +	u32 tdc_vddcr_soc_residency_acc;
> +	/* Throttlers - TDC VDDCR_NPU */
> +	u32 tdc_vddcr_npu_fused_limit;
> +	u32 tdc_vddcr_npu_max_irm_limit;
> +	u32 tdc_vddcr_npu_max_pbo_limit;
> +	u32 tdc_vddcr_npu_limit;
> +	u64 tdc_vddcr_npu_value_acc;
> +	u32 tdc_vddcr_npu_residency_acc;
> +	/* Throttlers - TDC VDDCR_LP */
> +	u32 tdc_vddcr_lp_fused_limit;
> +	u32 tdc_vddcr_lp_max_irm_limit;
> +	u32 tdc_vddcr_lp_max_pbo_limit;
> +	u32 tdc_vddcr_lp_limit;
> +	u64 tdc_vddcr_lp_value_acc;
> +	u32 tdc_vddcr_lp_residency_acc;
> +	/* Throttlers - TDC VDDCR_GFX */
> +	u32 tdc_vddcr_gfx_fused_limit;
> +	u32 tdc_vddcr_gfx_max_irm_limit;
> +	u32 tdc_vddcr_gfx_max_pbo_limit;
> +	u32 tdc_vddcr_gfx_limit;
> +	u64 tdc_vddcr_gfx_value_acc;
> +	u32 tdc_vddcr_gfx_residency_acc;
> +	/* Throttlers - EDC VDDCR */
> +	u32 edc_vddcr_fused_limit;
> +	u32 edc_vddcr_max_irm_limit;
> +	u32 edc_vddcr_max_pbo_limit;
> +	u32 edc_vddcr_limit;
> +	/* Throttlers - Thermal */
> +	u32 thm_fused_limit;
> +	u32 thm_limit;
> +	u64 thm_value_acc;
> +	u32 thm_residency_acc;
> +	u32 prochot_residency_acc;
> +	u64 gfx_temp_acc;
> +	u64 soc_temp_acc;
> +	u32 p3t_fused_limit;
> +	u64 p3t_value_acc;
> +	/* Power */
> +	u64 system_power_acc;
> +	u64 apu_power_acc;
> +	u64 dgpu_power_acc;
> +	u64 npu_power_acc;
> +	/* Frequencies */
> +	u64 fclk_freq_eff_acc;
> +	u64 memclk_freq_eff_acc;
> +	u64 lclk_freq_eff_acc;
> +	u64 gfxclk_freq_eff_acc;
> +	u64 socclk_freq_eff_acc;
> +	u64 vclk_freq_eff_acc;
> +	u64 vpeclk_freq_eff_acc;
> +	u64 aieclk_freq_eff_acc;
> +	u64 npuhclk_freq_eff_acc;
> +	/* Bandwidth */
> +	u64 dram_read_bandwidth;
> +	u64 dram_write_bandwidth;
> +	/* Activity Monitors */
> +	u64 gfx_busy_acc;
> +	u64 vcn_busy_acc;
> +	u64 npu_busy_acc[3];
> +	/* STT Limits */
> +	u32 stt_min_limit;
> +	u64 stt_apu_hotspot_temp_acc;
> +	u64 stt_hs2_hotspot_temp_acc;
> +	u32 stt_apu_temp_limit;
> +	u64 stt_apu_skin_temp_acc;
> +	/* Residencies */
> +	u64 cpuoff_residency_ccx0;
> +	u64 cpuoff_residency_ccx1;
> +	u64 cpuoff_residency_ccx2;
> +	u64 cpuoff_residency_ccx3;
> +	/* DF-pstates */
> +	u32 fclk_freq_table[AMD_PMF_NUM_CLK_DPM_LEVELS];
> +	u32 uclk_freq_table[AMD_PMF_NUM_CLK_DPM_LEVELS];
> +	u32 ddr_rate_table[AMD_PMF_NUM_CLK_DPM_LEVELS];
> +	u8 dfpstate_source[AMD_PMF_NUM_CLK_DPM_LEVELS];
> +	/* System */
> +	u8 gfx_disabled;
> +	u8 spare2[3];
> +	u32 gfxclk_fmax;
> +	u8 cclk_core_fuse_enable[AMD_PMF_METRIC_CORE_TYPE_MAX][AMD_PMF_NUM_MAX_CORES];
> +	u8 cclk_core_enabled[AMD_PMF_METRIC_CORE_TYPE_MAX][AMD_PMF_NUM_MAX_CORES];
> +	u32 cclk_fmax[AMD_PMF_METRIC_CORE_TYPE_MAX][AMD_PMF_NUM_MAX_CORES];
> +	/* Overclock Capable */
> +	u8 cpu_precise_and_direct_oc_capable;
> +	u8 gfx_precise_and_direct_oc_capable;
> +	u8 pbo_basic_oc_capable;
> +	u8 pbo_advanced_oc_capable;
> +	u8 pbo_nitro_oc_capable;
> +	u8 memory_and_fabric_oc_capable;
> +	u8 misc_oc_capable;
> +	u8 extreme_cold_oc_capable;
> +	u8 down_config_control_capable;
> +	u8 spare0[3];
> +	/* Overclock Status */
> +	u32 fit_limit_scalar;
> +	u8 ln2_enabled;
> +	u8 cpu_precise_and_direct_oc_enabled;
> +	u8 gfx_precise_and_direct_oc_enabled;
> +	u8 spare1[2];
> +	/* Voltage Guardband in PSM count */
> +	s8 psm_guardband[5][5][3];
> +	s32 core_power_limit_offset;
> +	u32 max_freq_offset[5];
> +	u64 npu_temp_acc;
> +	u64 dfpstate_residency_acc[AMD_PMF_NUM_CLK_DPM_LEVELS];
> +	u32 cclk_fboost;
> +	/* PMF */
> +	u32 pmf_fast_apu_ppt_limit;
> +	u64 pmf_fast_apu_ppt_value_acc;
> +	u32 pmf_fast_apu_ppt_residency_acc;
> +	u32 pmf_slow_apu_ppt_limit;
> +	u64 pmf_slow_apu_ppt_value_acc;
> +	u32 pmf_slow_apu_ppt_residency_acc;
> +	u32 pmf_fast_spm_limit;
> +	u64 pmf_fast_spm_value_acc;
> +	u32 pmf_fast_spm_residency_acc;
> +	u32 pmf_slow_spm_limit;
> +	u64 pmf_slow_spm_value_acc;
> +	u32 pmf_slow_spm_residency_acc;
> +	u32 spare3[5];
> +} __packed __aligned(4);
> +
> +struct amd_pmf_metrics_ccx {
> +	u64 core_c0[AMD_PMF_NUM_MAX_CORES];
> +	u64 core_cc6[AMD_PMF_NUM_MAX_CORES];
> +	u64 core_freq[AMD_PMF_NUM_MAX_CORES];
> +	u64 core_freqeff[AMD_PMF_NUM_MAX_CORES];
> +	u64 core_temp[AMD_PMF_NUM_MAX_CORES];
> +	u64 core_power[AMD_PMF_NUM_MAX_CORES];
> +} __packed __aligned(4);
> +
> +struct amd_pmf_metrics_v3 {
> +	struct amd_pmf_metrics_iod iod;
> +	struct amd_pmf_metrics_ccx ccx[AMD_PMF_METRIC_CCX_MAX];
> +} __packed __aligned(4);
> +
>   struct smu_pmf_metrics_v2 {
>   	u16 core_frequency[16];		/* MHz */
>   	u16 core_power[16];		/* mW */
> @@ -406,6 +608,12 @@ struct amd_pmf_smu_regs {
>   	u32 arg_reg[3];
>   };
>   
> +struct amd_pmf_1ah_m80h_arg_data {
> +	u32 lo;
> +	u32 hi;
> +	u32 size;
> +};
> +
>   struct amd_pmf_dev {
>   	void __iomem *regbase;
>   	void __iomem *smu_virt_addr;
> @@ -459,6 +667,12 @@ struct amd_pmf_dev {
>   	struct mutex metrics_mutex;
>   	u32 bios_output[BIOS_OUTPUT_MAX];
>   	const struct amd_pmf_smu_regs *smu_regs;
> +	void __iomem *metrics_table_virt;	/* Mapped DRAM virtual address for metrics table */
> +	phys_addr_t metrics_table_phys;		/* DRAM physical address for metrics table */
> +	struct amd_pmf_metrics_v3 mtable_v3;	/* IOD and CCX */
> +	struct amd_pmf_1ah_m80h_arg_data dram_addr;
> +	struct amd_pmf_metrics_v3 prev_metrics;	/* Previous metrics for delta calculation */
> +	bool npu_metrics_have_prev;
>   };
>   
>   struct apmf_sps_prop_granular_v2 {
> @@ -867,6 +1081,10 @@ int amd_pmf_notify_sbios_heartbeat_event_v2(struct amd_pmf_dev *dev, u8 flag);
>   u32 fixp_q88_fromint(u32 val);
>   int is_apmf_bios_input_notifications_supported(struct amd_pmf_dev *pdev);
>   void amd_pmf_set_device(struct device *p_device);
> +bool is_amd_pmf_1ah_m80h(struct amd_pmf_dev *pdev);
> +
> +/* Metrics layer */
> +int amd_pmf_get_tbl_dram_addr(struct amd_pmf_dev *dev);
>   
>   /* SPS Layer */
>   int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);
> diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
> index e014d4ce5a20..b84c200b0f8e 100644
> --- a/include/linux/amd-pmf-io.h
> +++ b/include/linux/amd-pmf-io.h
> @@ -60,6 +60,7 @@ struct amd_sfh_info {
>    * @mpnpuclk_freq: MPNPU [MHz]
>    * @npu_reads: NPU read bandwidth [MB/sec]
>    * @npu_writes: NPU write bandwidth [MB/sec]
> + * @npu_temp: NPU temperature [C]
>    */
>   struct amd_pmf_npu_metrics {
>   	u16 npuclk_freq;
> @@ -68,6 +69,7 @@ struct amd_pmf_npu_metrics {
>   	u16 mpnpuclk_freq;
>   	u16 npu_reads;
>   	u16 npu_writes;
> +	u16 npu_temp;
>   };
>   
>   int amd_get_sfh_info(struct amd_sfh_info *sfh_info, enum sfh_message_type op);

