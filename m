Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2069.outbound.protection.outlook.com [40.107.96.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D0E1537D7
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Oct 2024 16:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730134097; cv=fail; b=FHGnq14X9VOsb4lzNgQQ603wAK6SY7unRQNAsPCaTMvi38ACJKlw3axtjgezXwYop4DRsvD3UxVJPugW3WuEjN5AfoaTC7m3jLdvGH8PO2Zpn/a8IkYYD0UaJUAUlXIAXNABHGfdz8mo1KO9PAgMN6RyVGwqGL/cKHlNmg4GgD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730134097; c=relaxed/simple;
	bh=PGi9/YW5N+pkXNYhIMgJqgZ40qxsFlH9xeiVK/U88Zw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=U87YBbryCwfnM0xfmKDpaKzwAt960qZWhu42ha9fiMr3d4+VqLhfL3vArvzDLKtQDkxsAe6tCQM3qntOgBZgfi++M+7O+ClCHFYf01q8/g+vb73SLKagGmPWa65a74tkw9IAkQuw2B4equZJbGBH7FEXjLalYFO68q3BhbQPF7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RDnvD0gn; arc=fail smtp.client-ip=40.107.96.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RDnvD0gn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uwhOQnaagG3PEoezd2GroMJ0qU34laKH0L2KtlFXseENbBDH9HavnGh62tMSJWmvSdCzNCDQrR4Y9KmHMpHXDjskSUJb2puRvCrsFhd8Km5uHxdAxZQyyKTB/ORtJDzYTCB1E0GOnZtTsTdYcjq/6pkfhQQtopI08LOG6FUWStRQSYxiqTqZn6xOWu1MlIlhO5nW8v2kl9P0DIgF4hnyOHa4rwny9gkqDec3xljALwmJ/liNLdDBqLdGjbTBd9E19xlcIrF+XArdI7aUw8byDrenbs005dt/3zjzKxZi9ajoLAn2jMUuQl51+0zWvWaQ9Ls1FuWOUp2OOuRP5Z4Y6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gnV7sH5+q9GDbmoejSWSkuTUGzpYw8uycrlZRcgwvrE=;
 b=BCIUkKXD2kHijIHoFdC/mnqWqiJrunCQ0M3ylkNwz2O+RVby0gPcrgBSGJfaQQ5eF9kr1tOqOQX03E1c0j3bb32lleGWF6hrsoLqhEuuiS52gVGGA1xt2fBDJ3oAm6DgX5pr8hd2XFs88xK8WULx6bylI/CNl6m5Y9a28b0o4AX+f2YThWFnErScTkYzogyRWMpgNdiLmrdvTEUL8J13XBAteFZdcUHftG0iOgdfvU2j4d1cqyW57NQCR2LHLhfLzRit1qNhnJIBJM9Nn+9E7P/A8yvGXq++pentHRIG/7QnIT2gfqy1R4nqlSpaNMx67Zb0R5Q7OPg0UZvBEUMw7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gnV7sH5+q9GDbmoejSWSkuTUGzpYw8uycrlZRcgwvrE=;
 b=RDnvD0gnbLwe31HDckaL0m0J5GcnAqqdQlQ+plJbEM5ETFtsi3OinL0d9yLPHxc0DOcsc9o0NfmzxRyNfiPzRcOV5VhIO5ldkoQtxrWbgtRuB/kK/aRpMhsi23h0dtNA3wFJ1x//bIWPscZidIFm0nrpsIstVh9nQwkJR/rZdJk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH3PR12MB8660.namprd12.prod.outlook.com (2603:10b6:610:177::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Mon, 28 Oct
 2024 16:48:12 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8093.021; Mon, 28 Oct 2024
 16:48:12 +0000
Message-ID: <b1a97ede-3201-4b04-96b0-9a5df92254f8@amd.com>
Date: Mon, 28 Oct 2024 11:48:10 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] platform/x86/amd/pmc: Add STB support for AMD Desktop
 variants
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
References: <20241028070438.1548737-1-Shyam-sundar.S-k@amd.com>
 <20241028070438.1548737-8-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241028070438.1548737-8-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1PR04CA0023.namprd04.prod.outlook.com
 (2603:10b6:806:2ce::27) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH3PR12MB8660:EE_
X-MS-Office365-Filtering-Correlation-Id: 51226dc4-edda-4a2d-97b2-08dcf7704f8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VXRRcCs2R2tLRmZjWXhpV243MGVJaUpjckRvY1NKZUpGZDI2V3U1aEFQL3gy?=
 =?utf-8?B?UFdIUlE0MnJLZXd3a1MvVDFMa3MzVXR3R0s0bFd5ZnlxTDVIalpMd3hhdlcz?=
 =?utf-8?B?OTVYdHVoSjJhSHhFV1k1WkwrTVVKQ1E0UHd1dGlQc2ZDQjVoMTI3RVl4c2JQ?=
 =?utf-8?B?ZStLS1FyTkJjNXpRdFhyQ3dXNzRKZ1BsU255enBBSkdVajhqNUxIUkJaWHpi?=
 =?utf-8?B?SkdHamRvSVkxTXQ1Mm5wVWJKVkxmVHphd0xFM3c4T05kMFcyejJtMHlZSERx?=
 =?utf-8?B?bGhoRTI4bklKZDJCMmg0TU5YYStDdHN6SDk5aXJtamgyUlBEbDNrNDJraXdT?=
 =?utf-8?B?dmtxOGt2YlQ1NzFCdEQyTXI5QVpuZ0E0UmRwaWxGaWJGVTg1UWF1T2E5RVln?=
 =?utf-8?B?UWJEVU9pTmFSK1pEb3l1b2s2SFRqbmRpV1BNTSs4MmNHalk5ZDJ5RjRoazdM?=
 =?utf-8?B?Mi9ROE9ieXFOdTQ2TkUxb01BKzZvYzZ2RXZ2WCt6Rjg0cExUYVUzMndualJp?=
 =?utf-8?B?bXVoMkVsaU11QUttRFVjSXR6cUZyV0JFank4dU9BTWhrN1dxM0tHNGFGZjBL?=
 =?utf-8?B?VmUvNlMzRmZ6amRYWGtFY2VjZ2NISU1kL2NmSWdvZGdsTHJDMkJlWjhKOHZx?=
 =?utf-8?B?c1I5SzZnZld1SWt1eEQ3NjI2Q0dkSS9jN3ozc3paLzhMVkZQQ2pNN041eTly?=
 =?utf-8?B?YjBIVjN4cDR2REJwRnRncURaMmR5Y3dLV1FyS1lOaHFSUGhjZGFnby91UWwr?=
 =?utf-8?B?Q0I2c0gramVESmYzL1JqVWtDRFpyaDdBOUdNbWxKbjNpSDlGWEJiRVh3elNn?=
 =?utf-8?B?dnlRMTRXTHphcXRrdFdSMGdyemJWd1R6Z0UxMWkyWW4ya2MzcVQ0cFZNbFhE?=
 =?utf-8?B?cllRWlBpWmhtSjdGSy9wSkJoVGM3MDZ1d0NDb1hIMnVNaVlKTXU2eWE1dUxt?=
 =?utf-8?B?aFRMTUx3N3dSRjgvZFFzY3I2RXpadTIyQ3hsMTVzb054VlhrVWNQenYvcXow?=
 =?utf-8?B?WlpxY3FLWVVwYy9rRUFvNEZUTGRrdVB1b2VBSEFCc01oeW15M1BEYm5DZllX?=
 =?utf-8?B?a2NpdGl6Vm1FN0FBQ0VuQjVxelk4M3dwdWkzR2dyK0Q1aS9odGp4NTFKMGtx?=
 =?utf-8?B?VGNSNCtEeVNFS2o2eWxPNUtEeEJxY2pBc3BHN25WNitLWllHcTFPL244MXBT?=
 =?utf-8?B?L3Mzd2JaSENjYVFTT3RaTktWcnVOZWg2SGxqWkhVZHFyYXB4YTBRcU1IMHdT?=
 =?utf-8?B?VTFoUkJUVWREQThTNlRvSFgyQldKbUg5dGw2NWdGL2QvZlpvdkVhQ21vNjNx?=
 =?utf-8?B?d2t5eDJRTjlYU0dxRlBZUmVrNnFlSExmTEFEdGg1dThrMnU3LzdvZHRQT1pR?=
 =?utf-8?B?YmRselZzdWdaVjMwM3l3ck1kWXZoYnF4b2lTV2owZ0pzdDRrY05sYVVvR1pE?=
 =?utf-8?B?YVJ2TjVtbnoxb1NsT3NIdnNMTm00N3MrRmtYSHZqTS8wN294cU05SW02SUR6?=
 =?utf-8?B?N3EycEdNQzRDQk9KTE1jMDdYYS8zWFlxYnFYZmY2ZHFyai9LVWJGTW5NL3Bu?=
 =?utf-8?B?UjF0cHV3M1l2NFNsNzBuaVdIbyt0WGRNMk9FOU01dnhiVTN1Rm5VT1Q0RVpM?=
 =?utf-8?B?MHgzNGhYemxHMmxNdjlnZmlqU3JGUVl1V1ZYRVJmNG9KeW80bm5qZE5OMlQw?=
 =?utf-8?B?eE1mSGVzK1R0S09Tb3VkKzE4ZWVhZ0tJQjZ4RWJDdFJoL25nSDFOSGdSWUUy?=
 =?utf-8?Q?F/IleNLpnmsa27EkRG5f6pYF3rQOXrfnmIoiYNJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjNWajBkR1ZnM3FxWmp2VkRKUU9ZanFQSEMwK3VvK0RWakhxaGIrMjRWbmkx?=
 =?utf-8?B?WHExZFFKWWlSUmVwVFB0MGRWSkhwK3BaWVlBUG1MTUt1M0hrV3drbzNMRG94?=
 =?utf-8?B?Uk9xblpJOXJpMFJjOUNMMnJHU2hORGYybldnZmZuWjFFaE1WTHFwaU1BL0hk?=
 =?utf-8?B?WW9WMlh5aVdpZlN5OU5FOTFrdS93ZU9mUlh2czc5NGFHY3psUjRDeHJCQlFa?=
 =?utf-8?B?SjM1U1puN2ZONHp0M0dzeTlucW5uWHpRQkdjTG1JL0hBWFlwZ1JLck5XQ21q?=
 =?utf-8?B?a1dtTzFBNWMvbU9PdHd1dWt3M21hdVZXNTg1ME03TGN5djdKVmdOMWZuUW9x?=
 =?utf-8?B?VEFLTzFrdVZoQjBmYUI5QnZhTkZINlVITHQxRUdYV2lLSDFVMTMxYUFPcnRv?=
 =?utf-8?B?T2MzU1lVK2FiRVlWVUxkejJvR0czclZPZWRjRG9NcXBubnM1czdmaytpTWlu?=
 =?utf-8?B?QlRjajZMdURDM3FPWGZ6T0lwUzFZb1JEYlNRVE9KamRmQTUxY2hKci94TFh4?=
 =?utf-8?B?NlNNR0RoQWtSSDlqY01ROGxZdjlGV3lkdi9lRWNiY1dWNm5ZMWtYLytnQ2JJ?=
 =?utf-8?B?dmFraUNwNUpyckFRR2lNOUJXdUo2RTc2Y1F2SG5jLzUxRlA3N2wrZWZYS0tO?=
 =?utf-8?B?S2JMVndSTmZwRkNiTXNLSVZUWlZvQTF1SnQ3ZCtzUFRCcWVMTSs0RGtiaGtB?=
 =?utf-8?B?T3cvME9ueTUwQTlETE1keFQzdWp6cDFnbGRDV2xEUGhuQTI5VlNhN1A3eTRE?=
 =?utf-8?B?d2Q2NlR2YTBxZVNyd2xyVmlCNGF0YUdsNkl3QVJlMWh1UllyQ2pRRmFVWUNU?=
 =?utf-8?B?NkxrNW5nZEFRRytPSDVIbllWNmQwVFRWVW9mTUhmK2xhQUI0RThTNjVXZlQ3?=
 =?utf-8?B?S2ZZRmthanVhYnNJOGhDOEUxeEt3L3RlSDdmbWJYakl6TGt5cjkzZlBrekZy?=
 =?utf-8?B?R3I1VlZNdzZ4dUJGMWYvMktVL3ZtVlVHU2tJY2ZhZlVaS2VhK3JKZ3duanJn?=
 =?utf-8?B?QXF5SXlhRHo2SXV6RFFjZTJUK21wZkhJbWNHclVZMkRhcEMwblkxd0hqSXph?=
 =?utf-8?B?UUFRQ1hWOVdvUmJEUnBNRDhlQWt5QmNZZnJxT09sTERuMHdpUWw5bEp0dHhM?=
 =?utf-8?B?VDE3cGJoQzl5cnFiQnlJN3h5SjczWWM2NVk0aWpOa2hvQ0h6R0h1aVg2Z21Z?=
 =?utf-8?B?YTl6QXErQlZKNnQ2NWhIZDVvV1hkalFETmp1cnh0RUl5dWZzbEhsVERjZCs5?=
 =?utf-8?B?ckhveFB3VCtPQlhlell4anJ3alQ3ZkdHYXkwMEJUQ1h6VHoyOGpKUHlxV09w?=
 =?utf-8?B?RlBZWHJLOHhseTlTN21hTWh5UXY4d3pWdnFzN1drTFU3VFBrWlZUUXp4Vk5R?=
 =?utf-8?B?Mk9KUVFoWHRWSHFwLytlQmFRbnQ4RHhnT2FGek4vY1NCZnpVOFdMaTRyQmx6?=
 =?utf-8?B?aWYxZVdMZU5nbUlSbDJib3BuMzlvYnNHNVB1ZFJtOXc2ZXNxczhvSUhNTFl4?=
 =?utf-8?B?aDIrdmhobm85SXRoZHFXRVFObWxDL203ZGhHTXQzREtoY3hjL0twNGNDUmVm?=
 =?utf-8?B?eU5ZZlU5bW9KOEUxZDNNWXVFWHJwOXg5d3FTZVVQbFBoakwxdDM1NENUQTMr?=
 =?utf-8?B?Sy9oUkxrNGVENEMrcFNpWXJxNFdlcGR3ZjlqUG1YeHhCNmZMc2tmcC9McGNv?=
 =?utf-8?B?c2tLeUJvSVQ1ZitZS3huVDIvNWNwUGxTZlBLQnJvb29hTkJSbHB4aDRsaW9M?=
 =?utf-8?B?N283QWlhTitqSW1DRzVVZWVoZDBrZElSdkthR1BudUxNNFk3TjVyN3FXUVA4?=
 =?utf-8?B?WVJGemNUb2J0Zlg3NFh3Wlpuc3hjMytsRTVGcVBtTTIvS0dRUjdFRDE4RFZP?=
 =?utf-8?B?Rk5XNU1PNUZZbnc3ZWE3UDBaWEFtZ2wrT1QxUVBsVC9NeEpuNzB2Q1R0R3dS?=
 =?utf-8?B?REloR1Y1RExRN3NRRFcyYTlMdmNEQmRhbGFyaTgrV1M1VDFHa1FtckVXaXhy?=
 =?utf-8?B?ZHhaWnovUWpOcVBNR3RuN2hGam1tVU9uaTFQZ1JHNDlFNkxPc0IybDdkTGlD?=
 =?utf-8?B?eThkN1h5azZndDJHSzQvbmVrWkY1N0dZRFJSbzdSNXFoRGVrbXZjOG85NmdI?=
 =?utf-8?Q?b3obhhqmpy2OHLEQsUL79FSZR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51226dc4-edda-4a2d-97b2-08dcf7704f8e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 16:48:12.4350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vPNnb6z69ktzRQz3VA/YgFSktJFuSukeXPjjr5n2D8RmaP00Z8aYYidO49Fdw3yjNKDmqNjNEIKKWwQMtnE1vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8660

On 10/28/2024 02:04, Shyam Sundar S K wrote:
> Previously, AMD's Ryzen Desktop SoCs did not include support for STB.
> However, to accommodate this recent change, PMFW has implemented a new
> message port pair mechanism for handling messages, arguments, and
> responses, specifically designed for distinguishing from Mobile SoCs.
> Therefore, it is necessary to update the driver to properly handle this
> incoming change.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>   drivers/platform/x86/amd/pmc/mp1_stb.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmc/mp1_stb.c b/drivers/platform/x86/amd/pmc/mp1_stb.c
> index 917c111b31c9..bafc07556283 100644
> --- a/drivers/platform/x86/amd/pmc/mp1_stb.c
> +++ b/drivers/platform/x86/amd/pmc/mp1_stb.c
> @@ -36,6 +36,11 @@
>   #define AMD_S2D_REGISTER_RESPONSE	0xA80
>   #define AMD_S2D_REGISTER_ARGUMENT	0xA88
>   
> +/* STB S2D(Spill to DRAM) message port offset for 44h model */
> +#define AMD_GNR_REGISTER_MESSAGE	0x524
> +#define AMD_GNR_REGISTER_RESPONSE	0x570
> +#define AMD_GNR_REGISTER_ARGUMENT	0xA40
> +
>   static bool enable_stb;
>   module_param(enable_stb, bool, 0644);
>   MODULE_PARM_DESC(enable_stb, "Enable the STB debug mechanism");
> @@ -244,6 +249,13 @@ static bool amd_is_stb_supported(struct amd_pmc_dev *dev)
>   	switch (dev->cpu_id) {
>   	case AMD_CPU_ID_YC:
>   	case AMD_CPU_ID_CB:
> +		if (boot_cpu_data.x86_model == 0x44) {

It's unfortunate that this information can't be discovered from the F/W, 
because this code is now turning into:

switch(dev->cpu_id)
case FOO:
	if (boot_cpu_data.x86_model == BAR)

That's pretty ugly IMO.

If you're doing to have a check like that, I think it's better to just 
ditch the cpu_id (root port PCI ID detection) and go all in on x86 
checks like this instead:

if (cpu_feature_enabled(X86_FEATURE_ZEN4)) {
	switch (boot_cpu_data.x86_model)
	case 0x60 .. 0x6f:
		//set up args
		break;
	default:
		break;
} else if (cpu_feature_enabled(X86_FEATURE_ZEN5)) {
	switch (boot_cpu_data.x86_model)
	case 0x40 .. 0x44:
		//set up args
		break;
	default:
		break;
}

if (!dev->stb_arg.s2d_msg_id) {
	pr_warn("unsupported platform");
	return false;
}

return true;

Then each time a new one is added it's a lot easier to follow what it's 
really matching.

> +			dev->stb_arg.s2d_msg_id = 0x9B;
> +			dev->stb_arg.msg = AMD_GNR_REGISTER_MESSAGE;
> +			dev->stb_arg.arg = AMD_GNR_REGISTER_ARGUMENT;
> +			dev->stb_arg.resp = AMD_GNR_REGISTER_RESPONSE;
> +			return true;
> +		}
>   		dev->stb_arg.s2d_msg_id = 0xBE;
>   		break;
>   	case AMD_CPU_ID_PS:

