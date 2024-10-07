Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2079.outbound.protection.outlook.com [40.107.237.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2774C6D
	for <platform-driver-x86@vger.kernel.org>; Mon,  7 Oct 2024 05:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728279970; cv=fail; b=FX5KuDFeMO0hn+TpVq3CySXQjhqE9wixjGEkK7FFNAlecfUsY5wy3zLGE1veR74q1TqECF5CQYL6LP4ZASqXL6Rn9JEo32/l21rdI8K4+DaaOFCdO/h681/InTf5kbUp5c3rkCSZ9CCUwU3lfm/3GYui+xScdLbRTzB/closcrw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728279970; c=relaxed/simple;
	bh=k5arSPIKGN2BNmZ6VqBxILmxouVbL49SAKklx2bBhEc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=u806X+NdR+pNGnm5fYseSD/34kpjCND/KkHQ3MoiAG5jc0VtR92GgsopOgdnMPcGPk1E2xQRFlpt4PtcmDuLX9yFg19jgtedhC3I65uRMOqz4mvpKEoUCEErFPR1FHdnX1e7wR48MI48lVp2hLuAdxs7TghSEyqlGbWqB6gMZwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NYAhBMgX; arc=fail smtp.client-ip=40.107.237.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NYAhBMgX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qc8ove4wAh2Zkd4PjiCReVNjXSaCiRk8wND+tyq2QxfHMP5ewVurkXkIsLiAx6YBBs5HXCk4btc+SExo4rIs85eQoSY41cm2080ni6Qhr/j4BN5IYGX01yrevcPpqVC7/9+qVz3g5xPPsTVKq0c1zHqkEmGB3BG2ejLtlRr5RCM9USb2nldbXIn53TiSbr17fNQFdB024tx7v1xEuBG5tzNJbqdtVRQLFEC4d96D6lKmDPaAuOIhwKRIxIYKTUMzDNKRqRB1M1w9cUHlW5C6XwmsjwnsIZFlvGkK8dbN/rgmuh5gMHyx6Q12UegK46H0QIHjlM7t9EHPeQe2YH2Y4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/6/oiBEfVCWgDd214mgonRdvXzjLmmv+Q5jhOPTSdlI=;
 b=kXOcoFpBtqhWF0P6tUBLt/Lt9rmbQHzCYzy4RE2iuoFz3cylxdCLsy3Q2C53yJwcUvjUSMW048/otNVZT1uvkhIdpU4IAAdl5d8RAnx15BwNHTMsmUO9oHQr2tC1g2wVhCaDMToz48ygg6qusw+40rBs52DclxrFApfsNLhLYnZqxnQCZlUNPIqjLZlGP79lNhCZ89iB9TeJ37GfTs3yuxjz2rieY30qJS12QIPOZkeekk5JrPkGrRqXoiOcDzkUpFnwCwLDUtUyTaVPCLWchhguY7zXut1FW0759OV2/XZ1Eblwsd5pFzcam0YiVFoNXtLO7rurkg17Nvx0RyoO5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/6/oiBEfVCWgDd214mgonRdvXzjLmmv+Q5jhOPTSdlI=;
 b=NYAhBMgXCxlSV8VUJPG9aCh+51ce+uOEVjfZbsnUnzrY2evZUFuijJ+c6yiVqONccCQQQDNLQ/xq9/DJQDZQySfLVkLPCxY37cTmtMztuVkGai7d1UyJef1ZY9kM8oUU41UBopBTDw9UZ7LMCofLlwOcr3IZHNUuwE4dCIwRcf8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV2PR12MB5966.namprd12.prod.outlook.com (2603:10b6:408:171::21)
 by SN7PR12MB8148.namprd12.prod.outlook.com (2603:10b6:806:351::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.20; Mon, 7 Oct
 2024 05:46:02 +0000
Received: from LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::7c1b:5fa1:7929:fd81]) by LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::7c1b:5fa1:7929:fd81%3]) with mapi id 15.20.8026.019; Mon, 7 Oct 2024
 05:46:02 +0000
Message-ID: <b7d7af18-1100-4373-9f54-76276d6da0c1@amd.com>
Date: Mon, 7 Oct 2024 11:15:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v9 08/11] platform/x86/amd/hsmp: Create separate ACPI, plat and
 common drivers
To: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
References: <20241003111515.2955700-1-suma.hegde@amd.com>
 <20241003111515.2955700-8-suma.hegde@amd.com>
 <dedcc48b-73a5-419d-b8b7-7d71453f2b2a@redhat.com>
Content-Language: en-US
From: Suma Hegde <Suma.Hegde@amd.com>
In-Reply-To: <dedcc48b-73a5-419d-b8b7-7d71453f2b2a@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0183.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::9) To LV2PR12MB5966.namprd12.prod.outlook.com
 (2603:10b6:408:171::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5966:EE_|SN7PR12MB8148:EE_
X-MS-Office365-Filtering-Correlation-Id: 695a380f-b9c7-4d74-68eb-08dce69353fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dGVOMXVIOE1LTmV4aTVvdzhZVC9MVjdqR3lRYzAzdGFkelJnU0tENlBGdWhK?=
 =?utf-8?B?a0FteHl2ZDI1TFRUWG1tU01LS0xvT0EwVDBVSHJSSTljZ1hnSjlsUmpoUEMw?=
 =?utf-8?B?NktCdXJZUFZNb1FTQU5LUEZTci84QWx3bEpqMDdLZzJsaGk0VlVuUVZsR2lU?=
 =?utf-8?B?NWE1WlUyeDFpKytUcUI2d0FCWEJpVVBlMCt0YnpYTDVvUnNtOXNNc0czV0JB?=
 =?utf-8?B?Sk41MDloYmEwdmlGUFhXM3VKODE3cWNPZTI1NHkyRnFxWnpQTkh4dGt3UHVU?=
 =?utf-8?B?SGwzVlU4cFpxRDVXbU0rSkcrTmFiUUcvYVFCTW9mTWNtZjJOUjBmMlU0a1BI?=
 =?utf-8?B?WDZreTk3aXRSRk9USktTbTY0TDJhZHlNN1hRS0QzWXpoUnZzZklDczg1YzZv?=
 =?utf-8?B?QjRMa29RcTV2eU1sMUcwaHdBY01vbDZUSGdwVlUxcG13bTVZdGtyVElMdlZv?=
 =?utf-8?B?VEtRVGZzNEJFaXp1bmFYbWRaeDVnTU5UQXMremRKeGNGa2kzU3FrY1BxNmZi?=
 =?utf-8?B?cCs0M1ptNmJLWVRaRitVcC9JNDNmajZjRk5vN2I5cFRPS3BBV01iZG52QkRJ?=
 =?utf-8?B?dDlCc0RYRHZEQnQvR1NHZHZmU3YwSzN1RlZITlhqQUpnR3ZBMzRYUmNCWlIx?=
 =?utf-8?B?MzNGa0FCMHNHRlo0QUZEY1FJcEhkWThOVVprSks5ZjZFelpXU256eHBWcnlr?=
 =?utf-8?B?ZUs2QjBWdWtSbkR4Z0RaT2hydmJNdGU2UUg2Y3p5djNySnU5cXgxaWhCRmpv?=
 =?utf-8?B?endOVEtZa2U1MXdCbVkvTk5lNmZQOUtiRmVRem9rWFBlbzI0b0VvSmIrK2Zm?=
 =?utf-8?B?MGkrU1hheU9Qa21ybzlsWlhvTjdrWWI1TGxFcU1QdVl1NUJPQ0Jza3pGbHFY?=
 =?utf-8?B?d1lFeHgzRU1FRExFWGVOakVxblJEOEhrNlhRQldQdzdiRzdkb1c4U2FLSkNS?=
 =?utf-8?B?cEtha1plOW9aN2M0TGVPd0k2S2Z6dlFVMUMweHdjTklRZVVaQXV1Q2RMRTB2?=
 =?utf-8?B?dlU0VGpxQ1N6TnBod2ozb1ZBTFZoUlEzV2ZkQ3MrTlYydVNhcXVlTmpZL0Vq?=
 =?utf-8?B?WU5odFNwSXBReTgwWkM3TGtvd01GT3VCTm5HQjNVTzNGTEgzelNrM2JjSVph?=
 =?utf-8?B?MHZDUS9OWVUrVE1vU1doQXBzWmM2YWkwMkhtL0ptNjZLMWdCUjRPbzFKRzhL?=
 =?utf-8?B?QXZIZS9DNm8vMk5UeWhlS0NzNWVSRE5Cd0VSc1h4RUZtbk56SDNQMVRTazJV?=
 =?utf-8?B?M1J0L2ZXVDNCSUZmQmNVL3RyTm1mV1FNalNRM0NBVDNBOFVHMGY3UlVCZTNT?=
 =?utf-8?B?ZGpqcFpvWWNWdmw1T2hyOXlGV08zMnBqcmJuWmdPdWNKc3R2dVV1Y0lWQk9o?=
 =?utf-8?B?aW1DdWVMcEUrckNzbmJZaE9TbEJqaktFVndWeFd2OWNEMmtUR3hiRW5TTlo0?=
 =?utf-8?B?SFF3MkhUWTBRNjlXbE9RQU1MV1RLWHZEdGxsYlZ6MlJPMXVlc2JUYjZXL2k4?=
 =?utf-8?B?UWN2SU9RMWJQaVo0czdTNjVIdDNCSUpIdVRDZFh6N0dJdGJjazRKY2Z1VWRh?=
 =?utf-8?B?Z2UvOWsvS0ltRUxRZ1pBVWkyR0J2UTdheGs0QzR3d1lLc3huWE5lc2d4OGhh?=
 =?utf-8?B?RFo5ZE5HdVhBVXhiNVRzK09aaWFnblIvemNOVTREUjc0bGpGL1NVbmRJaEhX?=
 =?utf-8?B?cnBzczNNc0xRRTZHNm5rV3RBWEdsZDgxMFZPL2VWVzE0cjYrMVZVdVF3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5966.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1g5azVmeDhybFZEUy9xNUxyZEd2elhudFl6SDJUN0o1dFJsYVgxU3hNcVIx?=
 =?utf-8?B?andEa3JQT3I1dkYydUp5c3FVZ28xK2JQb2ZuYVE1Mks1UTU0NEhvUDAyR1hL?=
 =?utf-8?B?RFoyU1Fid1NMSkdSeUc2ZkY4NkxES1c0SHVSZWhDL0FUVTEzSkVJN00rQkV4?=
 =?utf-8?B?VlRwVytlR2VvZVp1R1cvb2hJV1Bta0x3cUpTRzlrZk5oRStoQlphTXJpR0l3?=
 =?utf-8?B?MWRPWm9ya28yT1VFNXFLelpmeHN0VUtTWURhcDljZnVDTnZXRnBNYUF0aXdR?=
 =?utf-8?B?UlZTZ2lTQTY0dEliVnAwZVpOZXRRajhTWkVzdW5pZ1laUnNyL3hnSi9qU1lO?=
 =?utf-8?B?Rjg3YXVTc3J0N2lvcXk5Nkp6MDZtWU9mR0ovZUM5Rm9VeXlETVVtQlpxQXkr?=
 =?utf-8?B?SDBIKzJ1VHRsdUZubm1ickNONExrL0tzYXA0M1RqSmZzQXd1L0RNbCtCc3lH?=
 =?utf-8?B?cGV6Y3BCL2hzL2pDQm01OXJNdEtzbnR1a1ZYcFE5TWt4bUdFbWVkTkR0QUds?=
 =?utf-8?B?b3BLLzhQOUcwS2ZManlWVU1NcWFuNjJXeENadUQrYk0za1lxNGJIZVVad2dx?=
 =?utf-8?B?eklSeGFVZ1YxU2xCNnRoZzdKNFZwTEpZZHVxTEJJRGZUcVRRdjNDdUc1SzUz?=
 =?utf-8?B?azg0TUdmaXZwUUVUUEVJeGROSy8xdkJUMzFVRzRhL0tJdGRuRlBDQmpmY3Jn?=
 =?utf-8?B?bFFIK0ljMXN3NnNOek9TTE9pZENFN0NJTmJhaHEybVV6VHlESUEzSXlOK3NJ?=
 =?utf-8?B?QngwYXpzaEJMOWhJT2ZNaGFNZm1EMVltc29ValNtMmxnYWFDMmxZYWJvd3Ur?=
 =?utf-8?B?Ny95ejBpdjc4QU1MMUdvSExJSWUzTHhJVUhTcEFWQjdzTks5NnNSL2t3eElW?=
 =?utf-8?B?eVpXZDYxNktNSmpPRHc0ajJYUWEzeUZWS3B6a2N1Wm44aXQvWHdZNHQ5Slpu?=
 =?utf-8?B?WFZGYXRPWlRXbWhJUUlPaDNLSHcrQlVBYlJJNnZEZ3hNd1BsblA5N2hRVGp6?=
 =?utf-8?B?aG02ZWNKUXZId28wdFZSTDBhcEJtVEJ2THFheWx4anFkb0xsZFllQktkMWg2?=
 =?utf-8?B?d2MrVEp4UmxMU2RSVWFRTnJzZFVsY2JWRXA4dkxWdmU4QTYzME9RWC8vV1Fu?=
 =?utf-8?B?dkhYd2V6VlAzQkVaQnNqWUxHVnRLcWxURHlvS1h6Vk5ZRldlVk1yY05tRVBM?=
 =?utf-8?B?UzM5Um5UUGEveXorbEZtRFU2NExGT1RpWnd1VUNJckRYTDE4ZjhKbzJXRHcr?=
 =?utf-8?B?eHpRVDNZYzUwdWc4RDk0Q2FCTm1Yb2FFMUZtVmtjYUhPMTFFT1NxMFRXZ3hL?=
 =?utf-8?B?MXZORzBDUjJPbFQ3d0JUR3FFM3dPbGZ1NkpPNnc2ZW0wT0xrSi9kanNYdXkv?=
 =?utf-8?B?Znh2R3lvbzFuRjVtdWh2MXpOSTZHQU1YNWRSR2luUklYM1BRUC9sQ0E5YlZp?=
 =?utf-8?B?UGlPTWZEaFZISGp0V3laTVphY1JqcmVOd1cyaGsxcVh1MVNLYWhDQWQ0K0dl?=
 =?utf-8?B?VWhJR2pURkNGeGlDM0k0Wjltc2c2YUlQS2FOSGJSaDJ3NGJ1NjZ5RDNKcllt?=
 =?utf-8?B?RG5JQ3V3V29kSTlFbG8wMGVEaHdCMUpzYUswNHZwLzc1WTEzS2pEeS9zaGty?=
 =?utf-8?B?Tk1Nd2t0WGhtN2poY2oyVXFHeVdVQms4L21hcTFTZFFJVE1KMllabmNnS3FX?=
 =?utf-8?B?aUIrS1RRand0UFVSNjRYanZmaTlQRmtiWG9HMjB5RlJnR0JURmRwVVFyWFpP?=
 =?utf-8?B?MG11dDdNYm1UU0w0eitBZW1YbTVwQVpOYnJJSDlMWENQcVdwY1JTdWdsUzRv?=
 =?utf-8?B?Z3dTNnRxUDB4OFFUclN3K05zbkZ1VXk0bGlGdXhWQ1RBTG5SWGIxUWI0TXBP?=
 =?utf-8?B?enM5Q213TUFUN0lkRkY3eUNVT2o4MGQ0VkNJS25uRGp6bXFUenpBTTFqdFdw?=
 =?utf-8?B?Yk52T2Y3YnVUTnpwc1NtZmJPZkk3a0owcnN2Vk5ySGZPSGxMQmMwUk8zRGlE?=
 =?utf-8?B?YUpMbEtVMnptVEZlVFY0VFVzaHFrdXp0WWcvOVNJK1VobGk4WW50bzZ6RHUz?=
 =?utf-8?B?V2kyRlBDWSs4OFAyVjVoam01R3hyL2NaaGIzeTdaQXc1STQxTSt6S1JFWCs3?=
 =?utf-8?Q?NUnMqbOVlns3zuSc6eTNuRJh2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 695a380f-b9c7-4d74-68eb-08dce69353fd
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5966.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 05:46:02.6289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gvuTjbRAW6UiqDpf9CVquhl/JNqEMrVEoqYGlvYWYGOKYBVqYsrKFO1yJ80siiwI3wZYKLy36tcFnQdJZlSYPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8148

Hi Hans,

On 10/6/2024 3:39 AM, Hans de Goede wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> Hi Suma,
>
> On 3-Oct-24 1:15 PM, Suma Hegde wrote:
>> Separate the probes for HSMP ACPI and platform device drivers.
>>
>> Provide a Kconfig option to choose between ACPI or the platform device
>> based driver. The common code which is the core part of the HSMP driver
>> maintained at hsmp.c is guarded by AMD_HSMP config and is selected by
>> these two driver configs. This will be built into separate hsmp_common.ko
>> module and acpi as hsmp_acpi and plat as amd_hsmp respectively.
>>
>> Also add "|| COMPILE_TEST" clause in Kconfig to get build coverage for
>> HSMP.
>>
>> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
>> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
>> ---
>> Changes since v8:
>> Removed unused hsmp_fops structure definition.
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202410021345.okdVjjGy-lkp@intel.com/
>>
>> Changes since v7:
>> 1. Commit description is updated.
>> 2. Makefile is updated to create 3 modules, hsmp_common, hsmp_acpi, amd_hsmp.
>> 3. hsmp.c is modified to make it as a module and functions used by acpi.c and plat.c
>>     are made as export symbols (hsmp_test(), hsmp_cache_proto_ver() etc).
>> 4. "depends on AMD_HSMP_ACPI=n" is removed from Kconfig.
>> 5. Documentation is updated to reflect new changes.
>> 6. amd_hsmp.h is modified to remove  IS_ENABLED(CONFIG_AMD_HSMP_ACPI).
> Thank you for the new version, the way the split is done now looks
> good to me.
>
> One small remark below (I have not done a full review only checked
> the Kconfig / Makefile bits) :
>
> <snip>
>
>> diff --git a/drivers/platform/x86/amd/hsmp/Kconfig b/drivers/platform/x86/amd/hsmp/Kconfig
>> index b55d4ed9bceb..dc64b5b1165c 100644
>> --- a/drivers/platform/x86/amd/hsmp/Kconfig
>> +++ b/drivers/platform/x86/amd/hsmp/Kconfig
>> @@ -4,14 +4,44 @@
>>   #
>>
>>   config AMD_HSMP
>> -     tristate "AMD HSMP Driver"
>> -     depends on AMD_NB && X86_64 && ACPI
>> +     tristate
>> +
>> +menu "AMD HSMP Driver"
>> +     depends on AMD_NB || COMPILE_TEST
>> +
>> +config AMD_HSMP_ACPI
>> +     tristate "AMD HSMP ACPI device driver"
>> +     depends on ACPI
>> +     select AMD_HSMP
>>        help
>> +       Host System Management Port (HSMP) interface is a mailbox interface
>> +       between the x86 core and the System Management Unit (SMU) firmware.
>>          The driver provides a way for user space tools to monitor and manage
>> -       system management functionality on EPYC server CPUs from AMD.
>> +       system management functionality on EPYC and MI300A server CPUs
>> +       from AMD.
>> +
>> +       This option supports ACPI based probing.
>> +       You may enable this, if your platform BIOS provides an ACPI object
>> +       as described in amd_hsmp.rst document.
>> +
>> +       If you choose to compile this driver as a module the module will be
>> +       called amd_hsmp.
> This last line should be: "called hsmp_acpi.".
Please pardon me for this error. I will address it in v10 after your 
full review.
>
>> +config AMD_HSMP_PLAT
>> +     tristate "AMD HSMP platform device driver"
>> +     select AMD_HSMP
>> +     help
>>          Host System Management Port (HSMP) interface is a mailbox interface
>>          between the x86 core and the System Management Unit (SMU) firmware.
>> +       The driver provides a way for user space tools to monitor and manage
>> +       system management functionality on EPYC and MI300A server CPUs
>> +       from AMD.
>> +
>> +       This option supports platform device based probing.
>> +       You may enable this, if your platform BIOS does not provide
>> +       HSMP ACPI object.
>>
>>          If you choose to compile this driver as a module the module will be
>>          called amd_hsmp.
>> +
>> +endmenu
>> diff --git a/drivers/platform/x86/amd/hsmp/Makefile b/drivers/platform/x86/amd/hsmp/Makefile
>> index 0cc92865c0a2..3175d8885e87 100644
>> --- a/drivers/platform/x86/amd/hsmp/Makefile
>> +++ b/drivers/platform/x86/amd/hsmp/Makefile
>> @@ -4,5 +4,9 @@
>>   # AMD HSMP Driver
>>   #
>>
>> -obj-$(CONFIG_AMD_HSMP)               += amd_hsmp.o
>> -amd_hsmp-objs                        := hsmp.o plat.o acpi.o
>> +obj-$(CONFIG_AMD_HSMP)                       += hsmp_common.o
>> +hsmp_common-objs                     := hsmp.o
>> +obj-$(CONFIG_AMD_HSMP_PLAT)          += amd_hsmp.o
>> +amd_hsmp-objs                                := plat.o
>> +obj-$(CONFIG_AMD_HSMP_ACPI)          += hsmp_acpi.o
>> +hsmp_acpi-objs                               := acpi.o
> Regards,
>
> Hans

Thanks and Regards,

Suma

>
>
