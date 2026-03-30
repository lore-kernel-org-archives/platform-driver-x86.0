Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011045.outbound.protection.outlook.com [52.101.52.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BC13C73E2
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2026 11:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774870893; cv=fail; b=WEC9ibE8r32iXrZ3M1+IV/vXIZcS4MTscqhrz9NuoHIvC+1iQeznsLnWPvnsIOSamhjPW/YK/eK5MSoCkpLbNXlreV6WTU0xG2LLq6xVomkup951E7yVNA5BOcXprkmF7BTZ03sn6sZMdJHwSfRa2AaeA+BayJSTuxqs9e5bSFI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774870893; c=relaxed/simple;
	bh=DQvgpfEZ0spsWfrsO9pxJXyTy3yNw1/oRdpaAfHCmx0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IBL5SlvRJAN11IR7wqDxldLGIoYDHxD0wIIFrfSeoLkNVtSm0b28rFa4tP2wrvuGyjKLkfz+HnuMoqHBFyvgqxa/Ja919zoo2M64gEsdzLkUtN0zzsjtspgLnqM+Q6xndwZ2BREDk0pjQGNSCqIQcMFvY7s2gV/vYPZ43meU8kw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=iA5tWWAa; arc=fail smtp.client-ip=52.101.52.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="iA5tWWAa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E8783G2s5GL1Omdk7ZS6D4HM/ahivHFmBFMOZuP5UC/q4hbLlI/kAb8ewPyDRdtD9I4x8L/GP1PVxWZcPikqKbpTj0J9aSjbNZHKMjGKUnI8AecFuvBxyabU3NTP/49GUj+CH+QWRZP0ol2weYa2zAB5jHA9TrIsPLZTQBpslY5GRxc7OQcuAEzQR+WZhUt3wGLl6b0DtbZBVW70UZ/uKjzu4eZB6CzQity2qIa7UfDNhUbO+Pl+kRTaTjUxq/fqcGQIEhuSpRzNQUnGyfFc+x9I6dOCUUan3f8YiaGPNygPizNRs5ttgJ9O/hnz5uXMX6J64RDZHO7t2/dTzt4nlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EhOVAXkQ0AuONfsAZjjpSlDDO8S4vNC9jBYgIM1qbfY=;
 b=dM0B2K0KzyaiS2V0tXyNo8PFzqvIRASxLNw2lQ2y2ViEAK8C+qGnvwshKXYNaCGB9AHXknI4dFjx82S+KLBFsUIu1wtozPQVmc/umWsEoI+BLqMThKDRZGvEwfCDtyv47zlcf7X+L6K1zajqZqb/WTfl3JdH2YHXkS4lZyhdkUb7a083vikjqe9733NOoiEWLs3hJlgNzKoJCoqbJn0yuLeDGc/59pyGeOVs2o7bS46kJb9Q2lBtbm7y+z/PFdY26J+MH2nXOq7CpjD9bc0nhnQ9KL5nPa1dXvuPTj/A1S1FuLi57EpITshZDbiSqlDYItNTAh6bHmUQ+jpH+DusaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EhOVAXkQ0AuONfsAZjjpSlDDO8S4vNC9jBYgIM1qbfY=;
 b=iA5tWWAabRy9sAM6ZVYSi9B/sAePAtP+VihD2yyWGq79lVryaYBFZOtHcsvXJrbQXcgVXv6d0VAaTeA6wLHkaOwuWcB5HKeF9SR4U6iCKSEjoY4THyJfDI2ta7IT2kcccvT73z79s+IovkT0WZNASWxcUeewt7MuZJZsACpsHmc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by SJ5PPF01781787B.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::986) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.14; Mon, 30 Mar
 2026 11:41:29 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683%3]) with mapi id 15.20.9769.014; Mon, 30 Mar 2026
 11:41:28 +0000
Message-ID: <11ed899d-738b-4997-afbb-31f70453d156@amd.com>
Date: Mon, 30 Mar 2026 17:11:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] platform/x86/amd/pmf: Add feature discovery
 support to util interface
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Yijun.Shen@Dell.com,
 Sanket.Goswami@amd.com
References: <20260301131124.1370565-1-Shyam-sundar.S-k@amd.com>
 <20260301131124.1370565-4-Shyam-sundar.S-k@amd.com>
 <f0235752-f949-a0a3-36bd-124a42169b58@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <f0235752-f949-a0a3-36bd-124a42169b58@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0110.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::10) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|SJ5PPF01781787B:EE_
X-MS-Office365-Filtering-Correlation-Id: 592b5fa2-0a42-4ce8-129a-08de8e5147da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	5eVeorv9BFtI7q1WN+ym5x9UTDhIcl5WFa935lv/eFIoTjBt75K5ikXVD3BEvIksvI2nI5MVpXw0OPLwvQBIfydgWwaXr8Mi3lStA7YB2u8VF0oCBPJajxklgxD1rMcmVgaOA+Kgeh/+EVYMZ8eprb5/gTN4riHhavH6kvA7FVik0gZZ4ZcJWnA7Ath0HTBMA0h0+0w6XqQZCfcIbWE+4IZPMCtO2SVB/BKxooF25xT51YRcNcBJIQfE3jQErV2rzzRTuMwMmFCTWu3bjB1QpvrdfkZxukAKwsXjz9mW51By4m52TY8fNzVkQv1SsfjYsYBw1JPlIcK2AvJ1D2atiuIDtJwu7d+WKU+dJmLILm29xOSyvGRntd/GVjX7dzLaLBPBL8E998qxuAa6gSo+Or2rY20DCZCyW939mlMpst9KCu+dg3n4CZWeeKxRZ61KgiSSEopUeEVbULp8+xQMpG/pEs7hR7Lbsz8y1JfJzqsdzd2loh+69eeJdSk8PzDRiFYTzqyhwxHO0C4tnDYTMk12J6ZII9O2KDIG5zp7lI8NlU1ODPt0QtSbnajGCo+l1kagZk76Du4tmEX143fcxQJa9WUXBU1PGusavygSy1+0yymjplc8ghusGf7FbSAsna7upYLTd/0iE6LIUUnwiqtgN9JPcJYKjWeHGFheYl0sZiddL7YG1WPu3zTw8dmmUou8QxkvUgpHR8Ltf9XnFIVT/A3kLAZKoZXQyqGA3lQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TnBudm9kVm1uMkZBMjNqYm01djlMNHU3Q3FNNG5xN1FINkZXc0JRR3Y4S3Jo?=
 =?utf-8?B?Qk84NnMyelBkN0tJRE5jWG1DQkJ4TEo3ZlFEMjZBR3Y1QkxzT2ppcjdDbkdD?=
 =?utf-8?B?U1pEUFU2bzliUk5MTll3Um1aN1lMZFJML3RqbWQ3Y3ovdnBLajlJRVhueWhG?=
 =?utf-8?B?c0JTUVNaaEd3MDdDTUFEL3dsbEQvQWk3WDI5SFd4OUt2N1NkMTllOUNGTjdz?=
 =?utf-8?B?eXk4YWt3TWlDL2EwL2NVRU0wMyt4Rjh4SnRLaXRYWERsMFFKVEZFOVlrWnVI?=
 =?utf-8?B?NDIzMy8rOWlMWEdaVy9DRHJad0FkRUpjZm9pMXFLVDRqNWs2Z25LamZUZ2Fk?=
 =?utf-8?B?TE1DQ0tXaGR5aFJHM3VDNmtXb0RicEUraEg2NkFRMXUvWUhmd2lpQjNCbU5s?=
 =?utf-8?B?NWlXdHV6YXFGK2dQWEVITEk4YzY1aitSU1VlNjhIZFd1bC9jbXQrTmlsSGtB?=
 =?utf-8?B?eEpDTTFvbVBEUXZ6Vm5yaU43azYxVjFURzN5MGFQWGRXbDNwenFmZ2JJRHhH?=
 =?utf-8?B?VDRPSFNueWVxSWM0RlQzVWpEYktqZnpTQUd2VUl2Z21EZGNib1IzRnpIT29x?=
 =?utf-8?B?SkJ1VFNjOHVCUzJQVHBvemNmT0dRSmRDMlh4d1NMMnVRc0ZkZVRBaTIrcTkz?=
 =?utf-8?B?TUhrUlpDdjgwYVgzTTN0UVNlMG1ZL2pkQnRta1V4ZEFtUUlEUVlKdGtuZzI4?=
 =?utf-8?B?TnRZa2dTdXl6TVZ4U0lkUW50eTQ5cS80bVFXZjRzcENTUUsvTjV2eUUxdjhH?=
 =?utf-8?B?a0YxTVY3ZTROemx1WWN2MnBZNHNEdnJUR2NqRUlMVEdSQTBlZ0sxZUVEUGJE?=
 =?utf-8?B?Tis3Y2J5d3BONjRNbXcxTGtOaUZDZG82Q2hLcjVLZ1JaK0hIQXZ1dXMxbC9E?=
 =?utf-8?B?UWJKczMxYk5CNVZwdEhxbHdmS0VsQTNabkpDUENpRXRuS3dZMCtHTkRSSEhK?=
 =?utf-8?B?aXpRQmx5YzJMZGpSZ29yc2RUZVJJd0wrUHJ5bTljYlM2eGtidnVwWlBQcG0x?=
 =?utf-8?B?K1kvdGFEeUFiSEdtbVFuak5INnFmQ2xoaEREdUlSYnpSdURrYVp6ckhXYWxG?=
 =?utf-8?B?clBqbUUzS0xLZW5WWEFkTTF2QnRJOW0yY3QzcWpTeUV5L3YreGVEZXZCcGg4?=
 =?utf-8?B?Q0hYK3ZyNWZ0Q0VDWnViTVE2cllPOGpEeWtaNE5NaHFGclY5NXZlUkVOanVV?=
 =?utf-8?B?ZklJM01RYmp3cmVzK0tjMnMrc0VvWXNmdnY0SkhsUUFpYnpFQW51cGZzTXRm?=
 =?utf-8?B?aFE2ek5TOXFkMlFOQVFpaEZoOWszeC9LZ05GL1RxcTBEME1FakpHNkR5MnFa?=
 =?utf-8?B?R2tJZ2pOVGVlY3RLbnpnUUxIUDJSaGlrQjNpL2xvQU14ZWVNb21sTkgvaHYr?=
 =?utf-8?B?YUhYZmNYSHFESHZUbS9mY0ludVg4U0tSK01TTEcxc2orUDk4N0pmd3BaRHJm?=
 =?utf-8?B?MXFac1AxSnNBYVZtd3RxcXFhejhURFZyTGx4by9oY2RKODFHS20xS2kzMkpt?=
 =?utf-8?B?VmNWVzNWMldoYi9CeU8zNS9uZGlwU2wvZFdQZkpub2g1UThlM0dmcFJZbzY5?=
 =?utf-8?B?dUVMZWQxYUpiQytoTkhHSFU4NFpCN1I0SERBVmZGeWU5SjExZDNIQU50QzN6?=
 =?utf-8?B?S1pLRkJoeFNrdFNnbzZtR243cWgyeFVFZEtHOGp5b2VvMUx4YWNHUFhjMlg5?=
 =?utf-8?B?MlNrUlpCRzhsTHFURW1ET3B1ZlFFUGhjcGVxaS9NN09Wd0ZpY1RORkNjYytP?=
 =?utf-8?B?RVF5RjJlMFlnSktPZWpPNTlUeFB4aFhIZzRMdUlzdFZieFZxaUtrZUZYZDkr?=
 =?utf-8?B?b3g1UTF2SXNtT0FXdFVWOG5QUjlNV0lNZitxVzdvN0hMbjViYW5BWExtNzF6?=
 =?utf-8?B?VVUzcDlNWFpsOEFsQVN3Y1pFK0pMMFdvc0M1VTRsK09EMnZvZW96M2JHaUtw?=
 =?utf-8?B?UHRhV09qZnd5UStQK1lHWXRnUjlIcDdGRTZRZkRNS0IwYVUzRDdwMWNLR3Zu?=
 =?utf-8?B?N2N5SkRGdWhQYVl4YTRNYjJGbDFPcmZPWGpkMGR2Q2tEanhmRDFIRnJZS3pP?=
 =?utf-8?B?V2d1ekdmWXBCMEZJN0xlZW1oaGpZeHZqWWd1YXJmWThzQmUwUmN4c1VqbWdt?=
 =?utf-8?B?a2tNbDlaVC83VHdmc2JTOUZneTFxTGd2NFVyeU1YbnFLRTdwLzJ1SER3blph?=
 =?utf-8?B?dnhkMG5oOExwcS9hc1hoVGk3M1dOclphRDMxY2xwSEI4czkwalV6Tmd1WjYr?=
 =?utf-8?B?SHdTVDhsZmY2UFFLRVEvajJPbGp6Y3YwSW13a0QyWGx3ZFZyc0t6TFJGTkJj?=
 =?utf-8?B?YXVxMXAza2ZTUVJJMnNHTDRKd1YyeVBNSXVYb2UzbG9hR0k3bHNOUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 592b5fa2-0a42-4ce8-129a-08de8e5147da
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 11:41:28.7876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DJCQ9tueB53fwJpzbiWMtzgvMQcDp6f1gLJYYDNCKVclMutFEhA0LnKoteNT7mb5+lX3XhpNCqQj/Kf0DNJT3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF01781787B



On 3/25/2026 19:37, Ilpo Järvinen wrote:
> On Sun, 1 Mar 2026, Shyam Sundar S K wrote:
> 
>> Add feature discovery capability to the util layer interface, allowing
>> userspace tools to query which PMF features are supported and enabled
>> on the current platform.
>>
>> The following features can now be queried through the
>> /dev/amdpmf_interface ioctl:
>> *Auto Mode: Automatic power profile switching based on system activity
>> *Static Power Slider: User-selectable power profiles
>> *Policy Builder (Smart PC): Action based policy management
>> *Dynamic Power Slider AC: Adaptive power profiles when on AC power
>> *Dynamic Power Slider DC: Adaptive power profiles when on battery
> 
> Same comments to the list as to the other patch.
> 
>> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/platform/x86/amd/pmf/util.c | 33 +++++++++++++++++++++++++++++
>>  include/uapi/linux/amd-pmf.h        | 12 ++++++++++-
>>  2 files changed, 44 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/util.c b/drivers/platform/x86/amd/pmf/util.c
>> index 59a125deb6b6..9a14467f412c 100644
>> --- a/drivers/platform/x86/amd/pmf/util.c
>> +++ b/drivers/platform/x86/amd/pmf/util.c
>> @@ -16,6 +16,8 @@
>>  
>>  #include "pmf.h"
>>  
>> +#define AMD_PMF_IOCTL_VERSION		0x02
>> +
>>  /* Convert BIOS input control code to array index (0-9) */
>>  static int amd_pmf_get_bios_idx(u32 control_code)
>>  {
>> @@ -46,6 +48,33 @@ static long long amd_pmf_populate_bios_output(struct amd_pmf_dev *pdev, u32 cont
>>  	return pdev->bios_output[idx];
>>  }
>>  
>> +static bool amd_pmf_is_feature_supported(struct amd_pmf_dev *pdev, u32 control_code)
>> +{
>> +	bool feat;
>> +
>> +	switch (control_code) {
>> +	case IOCTL_FEATURE_AUTO_MODE:
>> +		feat = is_apmf_func_supported(pdev, APMF_FUNC_AUTO_MODE);
>> +		break;
>> +	case IOCTL_FEATURE_STATIC_POWER_SLIDER:
>> +		feat = is_apmf_func_supported(pdev, APMF_FUNC_STATIC_SLIDER_GRANULAR);
>> +		break;
>> +	case IOCTL_FEATURE_POLICY_BUILDER:
>> +		feat = pdev->smart_pc_enabled;
>> +		break;
>> +	case IOCTL_FEATURE_DYNAMIC_POWER_SLIDER_AC:
>> +		feat = is_apmf_func_supported(pdev, APMF_FUNC_DYN_SLIDER_AC);
>> +		break;
>> +	case IOCTL_FEATURE_DYNAMIC_POWER_SLIDER_DC:
>> +		feat = is_apmf_func_supported(pdev, APMF_FUNC_DYN_SLIDER_DC);
>> +		break;
>> +	default:
>> +		return false;
>> +	}
>> +
>> +	return feat;
>> +}
>> +
>>  static long long amd_pmf_device_state(struct ta_pmf_enact_table *in, u32 control_code)
>>  {
>>  	switch (control_code) {
>> @@ -116,6 +145,10 @@ static int amd_pmf_populate_data(struct device *dev, void __user *argp)
>>  	case IOCTL_BIOS_OUTPUT_1 ... IOCTL_BIOS_OUTPUT_10:
>>  		output.val = amd_pmf_populate_bios_output(pdev, output.control_code);
>>  		break;
>> +	case IOCTL_FEATURE_AUTO_MODE ... IOCTL_FEATURE_DYNAMIC_POWER_SLIDER_DC:
>> +		output.feature_supported = amd_pmf_is_feature_supported(pdev, output.control_code);
>> +		output.feature_version = AMD_PMF_IOCTL_VERSION;
>> +		break;
>>  	default:
>>  		return -EINVAL;
>>  	}
>> diff --git a/include/uapi/linux/amd-pmf.h b/include/uapi/linux/amd-pmf.h
>> index f93767248169..f34c5d744039 100644
>> --- a/include/uapi/linux/amd-pmf.h
>> +++ b/include/uapi/linux/amd-pmf.h
>> @@ -70,6 +70,11 @@
>>   * @IOCTL_BIOS_OUTPUT_8: Query BIOS output parameter 8
>>   * @IOCTL_BIOS_OUTPUT_9: Query BIOS output parameter 9
>>   * @IOCTL_BIOS_OUTPUT_10: Query BIOS output parameter 10
>> + * @IOCTL_FEATURE_AUTO_MODE: Query if Auto Mode feature is supported
>> + * @IOCTL_FEATURE_STATIC_POWER_SLIDER: Query if Static Power Slider is supported
>> + * @IOCTL_FEATURE_POLICY_BUILDER: Query if Policy Builder feature is supported
>> + * @IOCTL_FEATURE_DYNAMIC_POWER_SLIDER_AC: Query if Dynamic Power Slider (AC) is supported
>> + * @IOCTL_FEATURE_DYNAMIC_POWER_SLIDER_DC: Query if Dynamic Power Slider (DC) is supported
>>   *
>>   * These control codes are used with the IOCTL_PMF_POPULATE_DATA ioctl
>>   * to specify which metrics data to retrieve from the AMD PMF driver.
>> @@ -110,7 +115,12 @@ enum pmf_ioctl_id {
>>  	IOCTL_BIOS_OUTPUT_7,
>>  	IOCTL_BIOS_OUTPUT_8,
>>  	IOCTL_BIOS_OUTPUT_9,
>> -	IOCTL_BIOS_OUTPUT_10
>> +	IOCTL_BIOS_OUTPUT_10,
>> +	IOCTL_FEATURE_AUTO_MODE,
>> +	IOCTL_FEATURE_STATIC_POWER_SLIDER,
>> +	IOCTL_FEATURE_POLICY_BUILDER,
>> +	IOCTL_FEATURE_DYNAMIC_POWER_SLIDER_AC,
>> +	IOCTL_FEATURE_DYNAMIC_POWER_SLIDER_DC
> 
> I'm trying to confirm whether there are some special requirements when 
> it comes to trailing commas for uapi headers. If somebody knows for sure 
> if trailing commas are safe or not for userspace builds, please chime in.
> 

I randomly checked few files, and see a comma at the end.

include/uapi/linux/nexthop.h
include/uapi/linux/netdev.h
include/uapi/linux/xfrm.h

So, its upto you - your preference.

Thanks,
Shyam
