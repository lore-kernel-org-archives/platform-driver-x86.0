Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2043.outbound.protection.outlook.com [40.107.94.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CB029CF4
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 Nov 2024 15:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730993571; cv=fail; b=fRJszciogmp5Vke/vX4P8cXe8bTuQGfSoFDTXpdU9V/vLEXtrcUVeRU773wb6WxLvFmjsFEDhx1aPTe8q+W6E4ccK1sR+otISoJVFdOe7fsUtmmdewv328/3mS9R0aEv96lqetguN3+hd08mQeK2risEinJiJL4FGtWu70wZPsU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730993571; c=relaxed/simple;
	bh=5VFtU9UtCK0QXYVa9epnuCufrYDKIcO+tUtyhqqzu3M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Z0vsvt6jZhmcuhGN8UVQR6gnxVsQjN9OVz99lta8WfpHuazM0NDyaJvN4OV0unUBeUlqmVXOmXKVSSCCi5vWYnzuzpaP/dfkixT0QanHn2immCVSx+YlV85pRW3mPxC/Yf2Sd7nkYKeIX+PvOkAkQB7PlFwHkJrK3qqrxgIeLUc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=S9tfWv6/; arc=fail smtp.client-ip=40.107.94.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="S9tfWv6/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FuWxbioljmNHk5GNMDwTW+5MtbuqjqXm9pzu71sIZ/sZjVA3ZwsI+fk4Y23W7dHvH0PjE48teDFm18F3sSWI+eqEQTqmpFZ+vf4mYOiktcaMTaf0wjyNmrc81VmeOmQhHX8cKtl0PZhXRZKOvmaPyKic1Z5UuZaHyng1T5EekJzPwGSEBv7t6MLE8dIMKUvWuZJqz+0xL5i0aBTruwKRgHND81jQ4/1asWC79IVybeEVndzJa/nNBDOEiGkoCb1GoPPhyJ29R7tAThX6UJnVocmV2/w74Gofm+jC7ZV1dX+q0UOVCO9U/RE8rWxd2t4/pZhd3yKCLNbPuqbcfJyUPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1jQZYCeK52KAM0as5s2/VBRxMC6ws/vH5SWA6UOU9vI=;
 b=JnJFN/f14f8YtHmH8hiM9p3qGOO3SCKRXEzt3ybYpfCM+I9Os3NsGFlIsFYp80ZJTLMvH2tj0Lltza5lkDsZ2/2EG0qufT0Kjy39aiI8pfAuLpEwu+4Xo+AZh59hW6XROVZXhM1z2aCMcAyF8zju401PevRZZvxAuUAtMGclCMKw9WymcmsgiVdJglfGiPSwxLwxBv2gzcngERnTlxK72XsqqpZUJM0k9FfvgSyxAkCVuUxCQN1HoEo5EWPrFnz5wo8qyYQaQme2QiyUnQPXa3rvJSSI5cvZcThYkuKEbnzG64in9lz9DEleykhupXpaIaYDt8C/6sscfErgjyLsvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1jQZYCeK52KAM0as5s2/VBRxMC6ws/vH5SWA6UOU9vI=;
 b=S9tfWv6/bMLuyWSXGiQSFnhs9IgsvLomDdzPy3b0vpmpAIVGBDScNFllagxd1dwWPGgh+RIjY4otAg68sa0CK57VCulVLVVaj51z3qv4+V7WJu4D73MAaFI5VHMIJGbl9dTqB21k9LOtU7n+8D4D1BsHT8nyaAy11F1eLTtlDFs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CY8PR12MB7194.namprd12.prod.outlook.com (2603:10b6:930:5a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Thu, 7 Nov
 2024 15:32:44 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%5]) with mapi id 15.20.8137.019; Thu, 7 Nov 2024
 15:32:44 +0000
Message-ID: <8479496e-ccc0-4017-820d-fd0080994d57@amd.com>
Date: Thu, 7 Nov 2024 21:02:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/11] platform/x86/amd/pmc: Move STB block into
 amd_pmc_s2d_init()
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Sanket.Goswami@amd.com,
 platform-driver-x86@vger.kernel.org,
 Mario Limonciello <mario.limonciello@amd.com>
References: <20241107072714.943423-1-Shyam-sundar.S-k@amd.com>
 <20241107072714.943423-2-Shyam-sundar.S-k@amd.com>
 <abb0a98b-9563-2259-efff-63c3bc555748@linux.intel.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <abb0a98b-9563-2259-efff-63c3bc555748@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN0PR01CA0037.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:49::17) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CY8PR12MB7194:EE_
X-MS-Office365-Filtering-Correlation-Id: 08fe3202-da04-4e51-6198-08dcff416c7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U25PUFplOU5LeDB3WTloaVBiWDh0MnBrSWE0VDE5TVZJSWFnUHdSWityZDI4?=
 =?utf-8?B?QWJ1Q3FpYU13Y2pSSHVIOXdqbUVaS0RZcG80MGNaT3VBUzhyMU1jNmdkbzE4?=
 =?utf-8?B?ZVU5L3ZtT3B4WGlENVVnUE52R3hacFFMR3B1bmVVZ25IZ1Z2aDJxZlM4amF3?=
 =?utf-8?B?cHZKbDk5WVUzdURSK0dMbjl1Wi9USWdnYVNMNGQwR0llaUZ1Q1FjZGlFQks5?=
 =?utf-8?B?QjE3N2RlVTZndjVoYUpTdWI4cG56dFhDWjFrTTBJbzFQcnBkTTVMY3dUc2c2?=
 =?utf-8?B?RU1LdlQvdUk0SzNod0FaMElVY0hNTm9CY0NVZzh4cTRsRnQxUlNHNzJUWHI0?=
 =?utf-8?B?SU0yS0MrZjVON3dzQzNWcUJIRGdFRW1wRTlJNS9wKzBtYVpkSHJPNE9CU3Jr?=
 =?utf-8?B?NExPeFZDZWt5OERETFdKQUlWVnZGd3NXcENjbEdzRWRhSTZBWnVQVzIvbGly?=
 =?utf-8?B?TUozckpFMkdoVlV4R2lTT3lvLzdxcHFqekZIL25ORUNkRUsvTUdXZ2V0cDQv?=
 =?utf-8?B?clFZTzEyR01vS2VmUzJCWDFqQjJZTC9kb2FSdkJSNkRjVkowQTZnMGoxbmw4?=
 =?utf-8?B?N1A0bGMxUGNqdXJOU0laMk9UR1NMQi9pMzhtWUZRdXM1cWRlTlVZVTVjbkw3?=
 =?utf-8?B?cTRjblQyYjEreEdIQUNUczNTVzFVd3V2cG9TRTl1akxXR2ptMUNXcGJCeERB?=
 =?utf-8?B?Qnc0M29YREVYelROeUJNbXJsSW91ajNlbTVWdVNvcXpoQzNtL3lRakpqWkZG?=
 =?utf-8?B?MFl5UUtoUlZPTFROalNvV1pBWWtiNkFrU1RzRFo1ZzhVcktRcGNLdnpqR2NS?=
 =?utf-8?B?Z2ZTM0dCU2pSUExiQm5VSHBHbXcrb3pYZFIxNmJXa0RteWMvWW5Oc3UveFRG?=
 =?utf-8?B?QlNWbFZVTFdhRjNPZTlTQUNkRFZNSjd3QnR0blJXc2x3VXRFakp1NldoYS9P?=
 =?utf-8?B?ZTVpNy9tLzdLaFY4S0VXbjU5RnR0bFZpcFRUemxjSVUvMFNnMHNLL2dnZXN0?=
 =?utf-8?B?Qm9Hc2VIREVtNEw3cXRITkpmMDQzSWkzUmFUcFZuZlFzL2dMRWpianBVcFJD?=
 =?utf-8?B?YUxsYTFvdFRYeXRQYkZBaHFLT3VKMUkzSm1YNGdsOGRUYnVPa2p3M2JKNTE5?=
 =?utf-8?B?V0FjdkFrNTBNM1VDRlROV1F0WmpUMnBnRlA0S0E1N2JSWFJFYXJrWU1IWEtm?=
 =?utf-8?B?RjlDQ2UvZC93NEZOZ05jOEdabVpsUlZ2SW5iMENOeWJ6YXpoUytEUFB4ODJI?=
 =?utf-8?B?OC9XNGR0TGJKdGtkb21oVmxHTk54UGNscE9RdU4rT1hKT0xRcUhVN0hpYjA5?=
 =?utf-8?B?S1NwZ3hkRmlmQ3JUUHAyUjZRK2MwOXduNkhTMWd1TXd4WDNMMTVMcUxBdS9t?=
 =?utf-8?B?QnFnNkZNSGlsTE1iWnd1TkIwNlhvOTZCcFJ3UXN0U05rWHBDcWI2ZnN1Z3Bj?=
 =?utf-8?B?b1hIM3pLSGYxOURZUDZad2s3NUl0Wkw2emRFeVlCTGlwKzdqbXB4MTFWbUg2?=
 =?utf-8?B?UkZiTFhzZ1lLNGtDZE1kSTU0MFVINmdVVHNXcFVkcldqNlcyQzh5T2tKZjVU?=
 =?utf-8?B?em9YUWRzeVZZWHhqQ2FjL2QyekUvalJ4QnlsSkZYZ3B6SHhkRHJsbFAzKytu?=
 =?utf-8?B?T0IxbE92R2ZaV3pQLzU0dDFyMzlSa2w0TC9pWkwzNHE4bHJ0TmtXa3VBallm?=
 =?utf-8?B?WmxaQ3FqOFI2TnRjVW93TDdib0VWdms0TkRPTFFQWGV0R3RtUWJDeWVXRFNW?=
 =?utf-8?Q?5F8R8UVp77h2h5lNLdCz8bYsBtKOaHHLhBZtYAY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjlRakVuL0licE1vNTg3TkZwVnVrZWJkS2JUYmI1Rk5zR0hsZTFwME84MVRW?=
 =?utf-8?B?T0ZoTDNmZ2pIVHpqVXltWlBGaW1jMzYybHUwdlE2UThHUlgvbWhCdUxqM3or?=
 =?utf-8?B?a0hUMjlFdEdCRlEvaVJESTNsWE0rYWk3SHFidTlxcSsyMFV6NlJQZWQ2cXFy?=
 =?utf-8?B?RktHeWNuWVdHeWZDL3g4cGxzRDg3VWoxUUVmZ2NhWWV6Rzlia2VKOGI1cmN0?=
 =?utf-8?B?WFIrTnRjRkZSM2FVRko4aE5kZGpkYWw0Nmlscnp5Tzg5NnhCRU9UNGVJZnMx?=
 =?utf-8?B?WEU4UkNXclJBR2U4aWNGY1F1YjNhR0RST05MSWh0dDdzTWV5RFZuUDdLMXNN?=
 =?utf-8?B?eENYTzh6TW5BdVk1RGZrWjZOemRIWmtiYVRzVFRZUlhBUERUSHBGUGxUeVA1?=
 =?utf-8?B?Tm9BYkFTSGh2eTdWNlVIQ0lJbzVuVlVsdE1NalFOMFFDdDJ0dUxXdnU1RFJk?=
 =?utf-8?B?UUdjbzhjVkY2c3NTTk1hdk50UkQxOHhweFMwdU5ISEFoT1JtVkFwTnRhQXZD?=
 =?utf-8?B?SElidkhTMkJRN1JJdUhvMWlybTY5ODRaZGxkc3FvZzNhRWpncUI0SW1tQlY4?=
 =?utf-8?B?MFZFUnhNM2djU2R5NStrSnRLT01iQVJSVXg4ZmJxZ1pYZ2xiZ2R3L3JFc2U4?=
 =?utf-8?B?cTdraTlIcDNaSTdpaFFQMnI3dDJyWlo4cnFaWDhDaURSZ2hVRElKOUNWQzJF?=
 =?utf-8?B?RmYwUFVpTEVzS212aGovbE5CWDdzZ05JKytlUXh0ZmdLUlcyUE4vQkI3Tmxp?=
 =?utf-8?B?Yk5YM0tNOXQ3Qkw4c3laS25ORHc4bUJxVTBJTUlSSlJmRFNFSW1PWHBzSmJL?=
 =?utf-8?B?VXpOKzFaUmV6VllZUlNwS0huOTAzY2tNNVRlTUlHZE1lTk16RjFDL1BYbFpr?=
 =?utf-8?B?VGZuZ25Nak9yRkhYZUJEc3BVK29uN2VsSE9hc1l0NUlBWjVGV3g3MGlzQm1H?=
 =?utf-8?B?WlR6SEdDMVpyeXM4RWRRNHJLUzFmVWwySEVpSkF2a2k5cDlibk51bFJ6Yldu?=
 =?utf-8?B?UzNQVkVZOTVzdEE4NTg3QXZhMkFLckVsNTNNV3NRdDlQZXBmbm9HUklOc2pE?=
 =?utf-8?B?R1lUVjM3VzF5K1hwWVR0RFJELzFZVVN4V2wrN2lnNzVXSGdJRjU3cllXSnFM?=
 =?utf-8?B?Tm01SGFqQkJZUGx3Q1JYUEczUGZudndFb3YyWDU2M3Vld3gyZm1tRm9PbUlh?=
 =?utf-8?B?Yk1MU1lQSW5LMFhhazExKy9xTmVsemlaMmsrZWY1VUJsUnlkTU5La1RDUU94?=
 =?utf-8?B?Z3dHcmg0QlBudE5ab1Fzd09WVkRlUitxV29rYVdqOGFSS3JucURKUSt4Sk5N?=
 =?utf-8?B?UDFMR1BzQndHckpZazlYTjR4aHlaNVN2MDNxbFFnc1ZTLzdHR3EveTlhTHVS?=
 =?utf-8?B?eWwyR0p0cFQxYXcydjFITTdvSFdIL2VvbE9hb0FPaFJHeTNWd0lDbkF0WFc2?=
 =?utf-8?B?bzhHekNrTW00a20wU2kxeUY4ME03MS9QQm53dnBXQWlzQkxaRmQrNXRjdE56?=
 =?utf-8?B?a3I1NWo2dmpQSExyVWtjZmZZL05RMzVwZTN3RjNDZjJqbFVhL01NSXE5WUFB?=
 =?utf-8?B?cHgwYW9pWW52MDdGYStPajhzYlAxVnhFQ0FOQ0R0dEFTVVRaQ0c4RlJBV0ZG?=
 =?utf-8?B?aTB3Znhkams5cnRGM3NKOERJVFZGUEVtWnlQblZmWWE5ays2elRZZ01saHI1?=
 =?utf-8?B?NDlQdVNkNlRWbzdjdFYyY1Z3TGxPQU5UdUNwQ1FXU05NNjVSODdjRlFGblFV?=
 =?utf-8?B?aFlFRzM5OWNHQVNZdGtwc0ZjUlVRcVFTNUpHbWl5U1VISlVkWlFtYWRIV3dW?=
 =?utf-8?B?WG1NV01mTWpTRllWLzhhcWdXdXR6MUp2MkZHRmt5ak9ZRXh4SlBiMkcwRUJI?=
 =?utf-8?B?cHdkb1hwMjhWUGlaMHhIa0JhUFluOEJUWjhRbU53S2oyTm16aGFpVkFOMkFn?=
 =?utf-8?B?SThtUnJFMUxreXU2dFJaRG1OdTlveDVnbzNJNHFpOHN2QW5vamNqK1EwZ3Nj?=
 =?utf-8?B?L2QyNWtvZTNxRXhEbDdFWWJXbmJ4cXFydVdNaENNWE5WdjhCZVhqcHdXQ05w?=
 =?utf-8?B?N2N6UkpGS0VjWW5HV2hlZmRVMnYycnVDY1J5THJpOUtvTS9kd29hdGxxSXNq?=
 =?utf-8?Q?0mrS0PsvhWgiGfhxW8s7FIDPU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08fe3202-da04-4e51-6198-08dcff416c7c
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 15:32:44.1515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h4/CEyhMF1GU6DNFH8LHa0OAdTQKX8MY7iG8j2Fsno8FzOksjBUGFbp5bJGqRk9VjOgNe82fV7TSj9e2ucfVZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7194



On 11/7/2024 16:10, Ilpo Järvinen wrote:
> On Thu, 7 Nov 2024, Shyam Sundar S K wrote:
> 
>> Transfer the support for STB-related file operations to the
>> amd_pmc_s2d_init() function, thereby consolidating the STB and S2D
>> (Spill to DRAM) functionality in one location.
>>
>> For older platforms that supported S2D, exit immediately after creating
>> debugfs. These platforms may not support the PMFW messages available on
>> newer platforms. This adjustment is necessary due to the relocation of
>> debugfs creation into amd_pmc_s2d_init().
>>
>> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/platform/x86/amd/pmc/pmc.c | 18 +++++++++---------
>>  1 file changed, 9 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
>> index bbb8edb62e00..54ceb2f9bf56 100644
>> --- a/drivers/platform/x86/amd/pmc/pmc.c
>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
>> @@ -648,15 +648,6 @@ static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
>>  			    &s0ix_stats_fops);
>>  	debugfs_create_file("amd_pmc_idlemask", 0644, dev->dbgfs_dir, dev,
>>  			    &amd_pmc_idlemask_fops);
>> -	/* Enable STB only when the module_param is set */
>> -	if (enable_stb) {
>> -		if (amd_pmc_is_stb_supported(dev))
>> -			debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
>> -					    &amd_pmc_stb_debugfs_fops_v2);
>> -		else
>> -			debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
>> -					    &amd_pmc_stb_debugfs_fops);
>> -	}
>>  }
>>  
>>  static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
>> @@ -982,6 +973,15 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
>>  	u32 size = 0;
>>  	int ret;
>>  
>> +	if (amd_pmc_is_stb_supported(dev)) {
>> +		debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
>> +				    &amd_pmc_stb_debugfs_fops_v2);
>> +	} else {
>> +		debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
>> +				    &amd_pmc_stb_debugfs_fops);
>> +		return 0;
>> +	}
>> +
>>  	/* Spill to DRAM feature uses separate SMU message port */
>>  	dev->msg_port = 1;
> 
> This now runs afoul the other issue you even mentioned yourself (IIRC), 
> that is, dev->dbgfs_dir is initialized inside amd_pmc_dbgfs_register() 
> which is only called after amd_pmc_s2d_init() until it is moved in patch 
> 2.
> 
> Thus, you need to combine patches 1 & 2 so you don't get a broken kernel
> after this patch.
> 
> Please also move the enable_stb check inside amd_pmc_s2d_init() in this 
> patch since that's another thing you've now broken in between patches 1 & 
> 3.
> 
> So to reiterate, in the first patch combine: Patch 1 + 2 + the if () logic 
> move from amd_pmc_probe() into amd_pmc_s2d_init().
> 

OK. Will do it.

Thanks,
Shyam
