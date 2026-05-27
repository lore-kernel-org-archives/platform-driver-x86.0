Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010051.outbound.protection.outlook.com [52.101.201.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89D53EDE77
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 May 2026 10:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779876960; cv=fail; b=Nlrs2Gvot8ht080cx0F+oN/jaOzgfVvxAu+ggpIg7LmwCon33yzlRypeB4782ALP57z/p1/ZdpDJ7+Px3tRYCGQp3C7VepOwEttP8W31wQWejPOEi5cb/pKxh/XkMfOyxA38HfjkSUdcswWMR2M6JldCiE1eKQdQ3IplwZChF/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779876960; c=relaxed/simple;
	bh=94BHMFOIYG+NxxX+RRfxq4A8jhF/Eo/U1SdncXKvDtg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=K2bpWDbs4GbLMu+P23w9CkF0ONs7DZ//fcBRcmD4qWnYyeQronucStQQQRkK1nB3tdMe9WKjSVsWRHJqEPxVLNLDiWFwwRJ0Hg/PP5cDxwol5r6CzuQzauYdLXLSXopQ04nIYfyvne/3x/7HnmVqL/iwsIl5g9vloYyKVmwqVPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XtVAzVhi; arc=fail smtp.client-ip=52.101.201.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XtVAzVhi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qMtuuzabSVz08x5yeouDw83w/mQIVlgttT1pP+A/bzC67oONatldv3cL93CmEapyRlUtaMf8fj8KvPGeT6fo4HvjwKL6EwkOqW8AXywkkBoDQIGwA7kHzDXYv8JjQ4in5+kf8ilUsnSVe6aNtSub+72C7qIdKIsF3LQa+iDCy07NO7nyGcAeNvGyzx3DsS2opTynJQvQ/QyQ+m3EAWB8NhUJlR5FhtSoHutRprgdyViZplfdKo2blRDaxK9+W0vnBKcXI5M8JHvqDfNule5eAGNdCjIht4298XT4ejfQm2eDQBk8cOlsi8c1dQF5/V8wy4HHdYbxvAZO3fHyMVIq6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ydw1LFRav+E5Yw8fqdmWdGlh8EQNK4r2I96bdTIFZ0=;
 b=MeEQXe5x98Aylzc72WdvD6zohjrPLFILrT7tpzqxZ/GQjqshHOVk/2U0p7F2f/SjsvM45jlh9Ka/eghiLD2Wa6X0uMmtRtcf1ew65zuKsumND8zOznMK8pfzL/oNEuPKVQMnzUcbz6qX4Su0O1cOjNsMgwvbcRYELAE1UxoVdc0omYKMl1P0L1J8p4lzmJvUxNZTH1HPq0GhT+Fbd8Amb0ASAgyDbuQmVD2/YIfh6OHHkbk4yBcZpSJ7u+XA5r21Cjgq+i5lbsxRTuHRMloB8gcGB4CKxosJqA98SfZdojUEM2AxSvV3ixfES2yibn4d639b6dcaBofkQFCZQQ5BkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ydw1LFRav+E5Yw8fqdmWdGlh8EQNK4r2I96bdTIFZ0=;
 b=XtVAzVhibVwzC4Gl9kPW00h7vzgJJq7Hha3Ak+vTdz9jjU/0D0b7o5ABwyNgAE9vIdS6CzUhwBU5vZQrxuXAxS7vWtfr+WUp9UOvN0jxUyNIs5YsWRpnTbmZbqeDUDA5uZpN6M6asVkP/VLoJ8+XWLEDfBsjXva7KiQV/R5vMI8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by DM6PR12MB4202.namprd12.prod.outlook.com (2603:10b6:5:219::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Wed, 27 May
 2026 10:15:46 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683%4]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 10:15:46 +0000
Message-ID: <86cfbcde-cf99-49f0-a7f7-acbf4a529ed3@amd.com>
Date: Wed, 27 May 2026 15:45:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/8] platform/x86/amd/pmf: Implement util layer ioctl
 handler
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 mario.limonciello@amd.com, Sanket.Goswami@amd.com
References: <20260520185424.770772-1-Shyam-sundar.S-k@amd.com>
 <20260520185424.770772-7-Shyam-sundar.S-k@amd.com>
 <22cddbea-3aab-cda5-7c66-9386889f1102@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <22cddbea-3aab-cda5-7c66-9386889f1102@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0137.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::14) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|DM6PR12MB4202:EE_
X-MS-Office365-Filtering-Correlation-Id: d4dc224a-eff7-4a2a-a8e8-08debbd8eae0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|3023799007|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	TfLtRhPYuk0HQAcImJ83taKPLlIyzCwo5Rv7pX849andIkui8d8tkcknEqR9fUTkQyYBddweTlP2xbGJRzNESr9EiIJRTSU1vyjaxKOPiX60Z5cAEM74jr//xFIRFbqQTth13HGiJmVbmVp92dMmyjGE/WNjCk74vO6R5xztnO00s12yNlVr7TXNJhUBFk688oki/bH4b/qVYfRXm4Fj//8kD+4aNheUc9bTJHmhGE9vm2UZxLXlyFi7CUI6+rOfhENNJ703tp0mbX6Nc0SXxaoFzklD9EPqNbFythrZUSLr62gK9jRD4fBjVqtoqHFAYTeghOunZGvZ+2HF2iD9oMxQQxwPxmfeja+WhS591xjGBibAWD3ekXvSn9bLJLLbbx0sJpICQl5uZmqPxMorcgFUQHszO9gltSv0WYWSbZ3ZlSLl1X5amekVXc1lzWB6GlgGrgDjV4x/23x06qCml0tv75akrYDrYyrEFAFKZcfltCo0dy6L2pENO/v9wSqps3YF6/ETmfUbB6+Hb9+vYf4fT45sdCV+2mzXiIceMKwSk4Y1fHQrQj0/elvZKeJ+UGHhdV5zSN3RCHE/WyZ43+5jTcRuuBLrA7lloPnW2LSy7+WfGV5DrFrFMHkYJNFK3g77PL7OZB0hDQ0ltCcZc9aKuAzQ6tR6yeC1dJ9feEQ5nkvOYLWMM1D5drXPdgqU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(3023799007)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RklKTFFxZld3RjR5MWM3V3l0ajFKYU5vMy9NcHI5ZEFGZlREM1dsOGpYWG9Y?=
 =?utf-8?B?Q2ZuZEJiNUhTeVN1eWZtM3RleXZheGpIbmlRYmRrRUR1emYzMGlnbFRUY2JJ?=
 =?utf-8?B?Z2JUN3hBUXFmeHhjMzBFeDkzMzRZY3g2K21NMnhiT2Q2SnQxeDBrNFpQZ3hv?=
 =?utf-8?B?SDV0UUNFQ0RXc0lmSytBNDFkcVExOFBYWElldUx5aUtWOFFBTjhuN09RNEpU?=
 =?utf-8?B?eTkyTUhtKzlvblBUZk9VTllxS2F3MGZpWWNrTk5mS3VFbGg4QUZKL1ZRQjVo?=
 =?utf-8?B?ai8rSVNUTWF0dE1KNllOTVBEaHh3b2xrUlRTYWViSVcveWdlQVJBeVZyVTdF?=
 =?utf-8?B?ajg0OGF6SjVoNVUrL0d2MnNSeUVJblphcmhNSGxEN2pKajRaMkYvK2J4Rndz?=
 =?utf-8?B?SFM5N1RlQUNuMU9XTTNiRkZCVWtONHlKRVd5TWlrTWhoRTEyUHdqQmxQMFF4?=
 =?utf-8?B?cW82RjViYWVzTE1TbS9mY1hoY3BQMDNQU0U4UkRydGlZZ0tFbHlkWnNPV0pl?=
 =?utf-8?B?SEF0NXZkL05NYU9IcEVnZkZWaXE3R3E4L1RWL096MUZuYUVXTlRHYjJJNzFj?=
 =?utf-8?B?Z2xyY283UC82dzhzUy9pdXl6WlhvTVNRenNrNEVrcWJGVnY2TFN1bGlFM2hq?=
 =?utf-8?B?U252N2hBay9SZDRsSXAzNDZCOHJPN1ByRWtKYUgydnNodkNNVitCcDVFaUY5?=
 =?utf-8?B?aGRpazNkQ29MYi9xcEZZcTcxRzBMRGVIZ09ENFpHN0todUxnNWU0RDhvVjJv?=
 =?utf-8?B?di9WVzJiRTZBaWRpS1NneUpPVHAvRnpHYi9lY2x2K2xPekowNkNjTE5uSEd1?=
 =?utf-8?B?a042NUN0RUhOaWx1R2cwd21JeStHVWY2SXA3UUxuampQVUl5cjhVWTNPVHNB?=
 =?utf-8?B?V3hPc1VjUGVGWFpsd1BwU1pycUtzYjh4U245QTU1RWNJaFRpUTNIRjZJa09D?=
 =?utf-8?B?Zit1a3VGKzB1dDhqczFyenZqMXEwbDg1aTV3azhZNHF3UDBwZ1hxWFMrSzV2?=
 =?utf-8?B?T2VMei9wR2dvUWZlK1Y4WjFWL0FVUkh0Qm9QNUpGbDZ4RVBoN1U1K05OcHBr?=
 =?utf-8?B?emhka1RubDNtN3hjd2pycVZJcmlaaUdodEFadFNyNWJST2M3ZnYwbEwwN3ZD?=
 =?utf-8?B?TkpCTjlCWFBiTk1rWisvNW5Ia2NOL0VNYnJ4UWQwY3Ezb1JKRHdjTGsrdzV5?=
 =?utf-8?B?dlJiL1E5ejNWQUREa0FERHVFemF6OHNEVlBVQUVsNUIxSUVwRFJNTFhyR3pD?=
 =?utf-8?B?Q0wzelA5ZmlJSDhFVEg1aXFXODNYRjhZUnRHQndDQzJFTjIvTGhGUFFJZnNX?=
 =?utf-8?B?UXZVZUpTVGpJN2lLM0RZZDMvOURVZHJhTjl0Z29aTXV5RnlHNmROcUZSTG5E?=
 =?utf-8?B?emtmMkxSbDNJdEtDZUJGN3ZrMmMrU2ZXSTBlQmJNeEMyVjZveFFYWFgyRndC?=
 =?utf-8?B?K3V2UzZVU1M1WGRhaWV5dzR4N05QYnRibjVIK0NxcWRpRGlFWU5iL0tVQzhT?=
 =?utf-8?B?ZkdvWm1oRGZUSlZzNlVqVC9BZENrMDA2L0YzSmdaYnQzRWVac0RSWUdmQUow?=
 =?utf-8?B?MTFMeTdiNERsM0ovb1QxVUJWTnNpNWhSTXVoTzVMeWFrN0tCZGFnV29ScGZv?=
 =?utf-8?B?SDJya0tGTkQwOE43TUwyeWUxa2hQbmRDS2t3Z3VWRGptcm92aHl5b2RjNG9T?=
 =?utf-8?B?TE9XTnBBc2pudHNLMXhkaUkzUWJhNG5kV3VpeStEUVY3SlJFd012ci8rakNk?=
 =?utf-8?B?U3hvTGpWL29EOVkyUlJlZnlFNjI2NnMxcFJ4Q2lXWitSMzFra25FT1o1dXR2?=
 =?utf-8?B?QlNyQTh6OHZCcW5ibjB3RkVBb3NqZ0ErN0grSTFTcGZjV1lEYmVickhXMDRY?=
 =?utf-8?B?RCtlT1lpZHdNZ0Q3YWpFVy9WWTk5alVlNW5ndHhMUnZyd2hWeU5xWjJySWRr?=
 =?utf-8?B?SEpEMVlmNlJRYkhuSlYybnJrbmpHMnlYbjhWMC9wVGk3YXZickFTSkZnNDRY?=
 =?utf-8?B?eXh5bEFzOXdDZmZXdVBxbnIwL2V0eGpNR2p6eFFMWVptOFYvQnowNUt3RUJ1?=
 =?utf-8?B?VW5YZnFSU3psbjhWZTRpZUp5cVRqMGxmaXBHeHdmSngwOVhqSDhDMWFyVFls?=
 =?utf-8?B?d0NYa2JQUFRtZHo2cnh5N3pDNmt4eitIcGtWRTRCK0xnODBiYVYra05OY2U0?=
 =?utf-8?B?cFN1M3ZnUWwzR2lYbUNucUJyN0ZNTkh6M2xGV2pZWWhOVndUbFR0anY2bUJL?=
 =?utf-8?B?cjJZMUwzNzFBR0h0THoweC9qVTU5TmRqNHo3S21CckJTbURUYWIyMkRsWm52?=
 =?utf-8?B?Tm9aOWZkV0NUOGt4SXVhekZoejBUS3Y0S0NISGZYQU5VcW82VUlHZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4dc224a-eff7-4a2a-a8e8-08debbd8eae0
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 10:15:46.7053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3cllBonqtA39QQMvVIW1X7EcLkwd1MwKbhiX2d7xxvyx000+NEdKrMbFKSEc82fORjm+s2ls6mj5joPwcRp1Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4202



On 5/21/2026 16:28, Ilpo Järvinen wrote:
> On Thu, 21 May 2026, Shyam Sundar S K wrote:
> 
>> Implement the ioctl handler for the util layer character device. This
>> support adds the actual functionality to populate PMF metrics from the
>> TA shared memory buffer and return them to userspace.
>>
>> The implementation includes:
>> - amd_pmf_populate_data() to extract metrics from TA shared memory
>> - amd_pmf_set_ioctl() to handle userspace ioctl requests
>> - Size negotiation for forward/backward compatibility
>> - Feature-based population of struct fields
>>
>> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/platform/x86/amd/pmf/util.c | 90 ++++++++++++++++++++++++++++-
>>  1 file changed, 89 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/util.c b/drivers/platform/x86/amd/pmf/util.c
>> index 0052f0b6a7a5..eb9a02e135a9 100644
>> --- a/drivers/platform/x86/amd/pmf/util.c
>> +++ b/drivers/platform/x86/amd/pmf/util.c
>> @@ -19,9 +19,97 @@
>>  static struct amd_pmf_dev *pmf_dev_handle;
>>  static DEFINE_MUTEX(pmf_util_lock);
>>  
>> +static int amd_pmf_populate_data(struct amd_pmf_dev *pdev, struct amd_pmf_info *info)
>> +{
>> +	struct ta_pmf_shared_memory *ta_sm = NULL;
>> +	struct ta_pmf_enact_table *in = NULL;
>> +	int idx;
>> +
>> +	if (!pdev || !info)
>> +		return -EINVAL;
>> +
>> +	ta_sm = pdev->shbuf;
>> +	in = &ta_sm->pmf_input.enact_table;
>> +
>> +	/* Set size and version */
>> +	info->size = sizeof(struct amd_pmf_info);
> 
> sizeof(*info)
> 
> version ???
> 
>> +
>> +	/* PMF Feature support flags */
>> +	if (is_apmf_func_supported(pdev, APMF_FUNC_AUTO_MODE))
>> +		info->features_supported |= AMD_PMF_FEAT_AUTO_MODE;
>> +	if (is_apmf_func_supported(pdev, APMF_FUNC_STATIC_SLIDER_GRANULAR))
>> +		info->features_supported |= AMD_PMF_FEAT_STATIC_POWER_SLIDER;
>> +	if (pdev->smart_pc_enabled)
>> +		info->features_supported |= AMD_PMF_FEAT_POLICY_BUILDER;
>> +	if (is_apmf_func_supported(pdev, APMF_FUNC_DYN_SLIDER_AC))
>> +		info->features_supported |= AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_AC;
>> +	if (is_apmf_func_supported(pdev, APMF_FUNC_DYN_SLIDER_DC))
>> +		info->features_supported |= AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_DC;
>> +
>> +	/* Device States */
>> +	info->platform_type = in->ev_info.platform_type;
>> +	info->laptop_placement = in->ev_info.device_state;
>> +	info->lid_state = in->ev_info.lid_state;
>> +	info->user_presence = in->ev_info.user_present;
>> +	info->slider_position = in->ev_info.power_slider;
>> +
>> +	/* Thermal and Power Metrics */
>> +	info->power_source = in->ev_info.power_source;
>> +	info->skin_temp = in->ev_info.skin_temperature;
>> +	info->gfx_busy = in->ev_info.gfx_busy;
>> +	info->ambient_light = in->ev_info.ambient_light;
>> +	info->avg_c0_residency = in->ev_info.avg_c0residency;
>> +	info->max_c0_residency = in->ev_info.max_c0residency;
>> +	info->socket_power = in->ev_info.socket_power;
> 
> I've no big problem with this, though I seem to now recall Hans also was 
> suggesting the in-kernel data would be layouted such that this copy would 
> be easier (but please check).
> 
> In any case, my plan is to ask Hans to check the next version of this 
> series now that it will be hopefully ready/almost ready.

Sure. We can gather feedback from Hans once you are comfortable with
the changes in v6.

> 
>> +	/* Custom BIOS input parameters */
>> +	for (idx = 0; idx < AMD_PMF_BIOS_PARAMS_MAX; idx++) {
>> +		if (idx < 2)
>> +			info->bios_input[idx] = in->ev_info.bios_input_1[idx];
>> +		else
>> +			info->bios_input[idx] = in->ev_info.bios_input_2[idx - 2];
> 
> This seems to duplicate amd_pmf_get_ta_custom_bios_inputs().

Not sure how they are duplicates..

amd_pmf_get_ta_custom_bios_inputs() -> just returns the index of the
bios input

But, here in this code snippet, we store the values of the bios inputs
to propagate back to the userland.

> 
>> +	}
>> +
>> +	/* BIOS output parameters */
>> +	for (idx = 0; idx < AMD_PMF_BIOS_PARAMS_MAX; idx++)
>> +		info->bios_output[idx] = pdev->bios_output[idx];
>> +
>> +	return 0;
>> +}
>> +
>>  static long amd_pmf_set_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>>  {
>> -	return -ENOTTY;
>> +	struct amd_pmf_dev *pdev = filp->private_data;
>> +	void __user *argp = (void __user *)arg;
>> +	struct amd_pmf_info info = {};
>> +	size_t copy_size;
>> +	__u64 user_size;
>> +	int ret;
>> +
>> +	if (cmd != IOCTL_AMD_PMF_POPULATE_DATA)
>> +		return -ENOTTY;
>> +
>> +	/* First read just the size field from userspace */
>> +	if (copy_from_user(&user_size, argp, sizeof(user_size)))
>> +		return -EFAULT;
> 
> Just an interface though, if features are ever needed as userspace -> 
> kernel comminucation channel, it should be handled properly right from 
> the start, with -EINVAL being returned for invalid (unknown) values.
> 
> This is not meant to say, you must act on this, you have better idea how 
> this interface may evolve over the years than I do. But if an ability to 
> query a set of features only would be useful at some point, it would be 
> beneficial to take account now as we cannot change it later to not break
> ABI rules (if userspace passes struct that has only user_size initalized 
> and pseudogarbage in ->features, we cannot start to return -EINVAL because 
> of that later).

The thought process was to have an interface where the userspace can
query what features are/were supported and as unidirectional
communication channel.

But, we never know what might actually come up in future. So, would
like to address your comment now.

Can you please check if this is what you are expecting?

if (user_size > sizeof(__u64)) {
    __u32 features_from_user = 0;

    if (copy_from_user(&features_from_user, argp + offsetof(struct
amd_pmf_info, features_supported),
sizeof(features_from_user)))
        return -EFAULT;

    // Reject non-zero values NOW
    if (features_from_user != 0)
        return -EINVAL;  // ← Forces userspace to zero-initialize!
}

Kindly let me know if you think otherwise.

> 
>> +	if (user_size & (sizeof(__u64) - 1))
> 
> Please use IS_ALIGNED() + check you have the include for it.

Ack.

> 
> I wonder if user_size > sizeof(*info) is a bit dangerous condition and 
> should also result in -EFAULT. It result in leaving the rest of the struct 
> uninitialized (from userspace's PoV) when userspace and this kernel 
> version disagree what's the size of the struct.
> 

So,

+	if (!IS_ALIGNED(user_size, sizeof(__u64)))
+		return -EINVAL;

Should help address your comment right?

If no, I think I am missing your feedback. Can you elaborate?

>> +		return -EINVAL;
>> +
>> +	guard(mutex)(&pmf_util_lock);
>> +	ret = amd_pmf_populate_data(pdev, &info);
>> +	if (ret)
>> +		return ret;
>> +
>> +	copy_size = min_t(size_t, user_size, sizeof(struct amd_pmf_info));
> 
> sizeof(*info)

Ack.

Thanks,
Shyam

> 
>> +
>> +	/* Set actual size being copied */
>> +	info.size = copy_size;
>> +
>> +	if (copy_to_user(argp, &info, copy_size))
>> +		return -EFAULT;
>> +
>> +	return 0;
>>  }
>>  
>>  static int amd_pmf_open(struct inode *inode, struct file *filp)
>>
> 

