Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2065.outbound.protection.outlook.com [40.107.96.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E22F22D4D9
	for <platform-driver-x86@vger.kernel.org>; Thu,  5 Dec 2024 19:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733426110; cv=fail; b=ffK83Q7OHKXnziogpTgjMRhPtE9kid8+yLTw7RUDypk2AwYiCiLjKciaJy8YhWtOouDVFwUMfK2AQ1BdNay030iJ1TZr9aR9NAvEJbAulG70Mm55WHet6TP7MgFj/8IRQyaC1wZW+jXW9XiLdY70cjUs4YlPY3BbFclpYj732uY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733426110; c=relaxed/simple;
	bh=BEq7UxE2OwtroE6ADMv2Rz5OuWbAKndxE5KwISPjen0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kFymF6MmNWpV/WreAI4a5r9vnFh/Kud7p9LJJ3qncs3mCGmF0oXGpX1a4a2gUll2SmmVYjpXk/hAUN6XcZ2y0Ze/2KRe2WD/GnfBYk69cpFwue/LLrW9ems0TUancAaQudIhuX78YVzZGNHVTpKX91sVTm7LTxk6K1q1i4EM5Fk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=y59PD6UJ; arc=fail smtp.client-ip=40.107.96.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="y59PD6UJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yPbwhEpVDK9zAunS9Jvu8pcYZ4upevQpmn8sCv0Z/ygqkjNUp3yqNiokVziFhPQsftnx/NiP937KLgOubuYbqBW8Jd6yWjeLCPXIXbmEHAbSZHxZ8zomxfiHN7YUNiT6/s3i/3u60Dcfwg+HjnnS8dZZorfiA+S2O3Iu+p/PRMhCWlu9uQdLjudo9WW+5SG9fmn1B4F58XblrCrv/CsNqodynvJws+Z8uR8CkPzzCu7ELGpNb1IddamwakMDsbbcyW1YHsI6rdGr2P3Ha6hG4HnUPSehLdqIQBUOsey9tSXdqubCAC79LWRsrpWQxNoCvviDyNPgNDw8wH8IoB3fSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=icUyovpt5tL0FfR+j0Jm/LEDuU8AguA4U6UjP+BnKB8=;
 b=mg7aYAyELAkC1t0nsWg7dPq3fM33iPZTo/nxGk0LPfpkknR1pQUT+ky+rvej/PX+PWik9wPL6YGCTJxesSgVh/koNZaYSCIkeo3wFemYuFosuIOloEfygPqPxHnc3TyADAz5Kiz2aRrr1Bj/RdBYbijt/Ztxaf12zFqZPIDWS8ljoZwPU5LKpAVLljNW+9pi6/LZjVtfLdaLFFBOyisrKgp4OoptPZv/4VXoypx8sPfnCUL2ya+bM9SAs1XZSkBoqDSvN5nmsysjodao+FctXHULjWfOO5B3Aqkg1Jj2qqXLnsm5MaRI2CPcSX7pJhEq1LA4S5ly6omiP60NKykX9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=icUyovpt5tL0FfR+j0Jm/LEDuU8AguA4U6UjP+BnKB8=;
 b=y59PD6UJm7v2jy2r1nr59jo8W2ZM/NrI5pNj7HQOiFY7gUp4Hww40FnAghGDk7qFhHyDUFJPnyMBAElroQjTlwxRE76ebDD5ESsxPhQCHtGbbJNtvYJO/HaMkUc5Y+aXH8Q36mQV+3u+3iC8aOVGUR07cw2n8efvXlSA+AV4bl0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MW3PR12MB4378.namprd12.prod.outlook.com (2603:10b6:303:52::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Thu, 5 Dec
 2024 19:15:04 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8207.017; Thu, 5 Dec 2024
 19:15:04 +0000
Message-ID: <060725b0-2dcb-400a-beea-fa574705125a@amd.com>
Date: Thu, 5 Dec 2024 13:15:02 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/pmf: Enable Custom BIOS Inputs for
 PMF-TA
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20241205101937.2547351-1-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241205101937.2547351-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0098.namprd04.prod.outlook.com
 (2603:10b6:806:122::13) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MW3PR12MB4378:EE_
X-MS-Office365-Filtering-Correlation-Id: d9cdaff2-4208-4f83-4f21-08dd15611f7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eVZ3TUR2TjN6VVAvdXdTakZTZ1BlU0tEaHdrM1hJaFhaeHMvZVM5YWZwVzZ6?=
 =?utf-8?B?dm5hRUsrYS9NRjVKeFpHMWZuQnVzcStUN0tuNElsMTF2bDdyQUtTMnhUck1L?=
 =?utf-8?B?SG5BRzVrQlljVUZGUVBpb0VRN1dhbnNsZEZxcjY5QUszeGtqNkgvVmFXYlZX?=
 =?utf-8?B?QzJ3ZkVpaWltSmNkOElzQWxyZkd6WEVkblo4ZCtReU11enhZYWNXTnlMNnFC?=
 =?utf-8?B?cUNyOGtQUkRjTkR2MzkrdzNlUERQT0RueDg5ZHdqczBpeFh1d3k4QjRJMlRS?=
 =?utf-8?B?T0tNdDlJM09BVENGT0ZkdXpqR3FoQzczOEZCZzJwU3FVblJ4cHpkN0JwK3E0?=
 =?utf-8?B?NkZFUXdJZDdYMHMwdDQ5eFlXVlduZlo0VytaelhoYU9uR0oxUUw2bU1yK2k0?=
 =?utf-8?B?NkFVVkJXZnhMUy9reDUvUFg0ZGxuNFBsd1lWYXJ5VDVrR3VvcElqY1o0U0R3?=
 =?utf-8?B?anFTUVVqdkxGMnBXUWNNQUNBZFlOTDJkdXhXVklUMGdXVXpFWTg2N0VhRU1Z?=
 =?utf-8?B?K20xdHhkQzRuZkxGQnhjUE1zdWtlVFdQWkpDcndjZjlhNW9qMmg3UklLUnls?=
 =?utf-8?B?YWY1RGxKQ2lwbHBPY1F2NUdKV2NHM3FWT05qdExrTGVMdEtZNkhqRE9pSzdH?=
 =?utf-8?B?SFhZbURKZW1RN2wvdFVDbjlFakM5ZVI4bThrM0EyUENMQno1ZldKNTdqN0gy?=
 =?utf-8?B?NVJLUE5QUzF3Y1dsQ0Rwc2lTd3VIaEdKc2RlNXFKbnlDbkFKclYyOHI4S2Nx?=
 =?utf-8?B?SWxoZ09GcHJ6SGJCZWVzaVppbXZ5WmJCVU5IY2dxOGZnNG8xa3VybC9zRWhF?=
 =?utf-8?B?NExBbExQNXBKd1R0WkZqTzV6SVEreGJ5Qm9HOHk1MGU2OG5WV0VydjRVd1I0?=
 =?utf-8?B?K3M4TmNTV2tzbTZFMWE0Y2JqcXJYRjRXL0dwRXZsOGxtVDQ3WUppKzdNeVlC?=
 =?utf-8?B?Z3NzNlV3ZDlqdkx4cmtjSVA2bXZ5Uld4NFNMZ1M2emNMRC9pTzFKTDMrUVBY?=
 =?utf-8?B?R3VFWGJFRHE2NVZaQnVkVVFnN25GR0hqVTQ0WFo2VEZzUmFtRU50ZzhlS0FT?=
 =?utf-8?B?amFNckE0dXBSSXg3R3lCSEUxNmo1SHJwaFZJZkRKVnpUMkNabkZuWGtQazlO?=
 =?utf-8?B?TlFST3FBMVNlbkZkd04rV3VhY2FHWGp3N04xa0NEc2pwQ3JNWlVQQkdUSWJ4?=
 =?utf-8?B?eE1rck9XeXdvWmZublBtKzNCNlh0bnd5SHhLVDlwVFNJU2ZiWkpONGwrOTVn?=
 =?utf-8?B?dTBvK1BUVm90OEJVUE9vclRaZ0phbHpaT0pXdmdtY1FPa3dBRzJNOWI3RDBL?=
 =?utf-8?B?Vk9LTFN1OWcweDU5dVQzMjZ0RzZNVm1TVGlEd2hRSVV2Z3JmMW52azd3bVpZ?=
 =?utf-8?B?OHFnbWZXellIVHRldW16MzllcC9rVHZxaUxSYjZydVUzUTZKZ3k0cFl2QTVN?=
 =?utf-8?B?ZDd1aks2ZTB0WlZQWEdCakJJSDRVMmJyN3ZORzVkbnBVR05lak5lQnFweWdR?=
 =?utf-8?B?eVNvM29jKzgzTVBhbWJtV0NRSXRvWmU2OU5PS1gwWE84NzgvZG8ydDh0aVda?=
 =?utf-8?B?clUxeHArbTdMNFhpS0lEOUVoMk5mMG16OHVRZHZPTG1mU3hwWk55NUlVak5M?=
 =?utf-8?B?NTd4ZG9ZOHM4alVjSjRkMWFSc09NNTFleDYzQ213Wmxxb092K0tWN0c1VVlT?=
 =?utf-8?B?bUhuUzkxMVBrTFdkVmN5V21McDdqVGFkZXhud09hNTY0SlNyZ0NuWWRibk9V?=
 =?utf-8?B?RFpKY0dwQXZvcEFDVWQ0enJQL2J4S291cllWSDlZL1MybGQ3UG1VNHFoWFNU?=
 =?utf-8?B?elBRamNCNXZhREtOZmtkZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d3UvdTZ0VkZ3Mm55N3J0eGptSzRjbDZkbWlNejhsKzFwaHpmcDdPNHdrTXJM?=
 =?utf-8?B?ZGVYenRWWTFLZEdvMVlDOWp5ek9UR1dZRzhEREM2azVKMDVGc3FJRlZmUXor?=
 =?utf-8?B?QW1EZ3ord3p4dlZSYSsyR3VGY0xhODlMTlN5SDQrRWNIbVJVMlBzUkNLdHFW?=
 =?utf-8?B?bGtUdEFZcjhCSTBlcjJlQWVBbUc5b0pzVlhvYnNVNU5EZTdTVk9Da0NvREpH?=
 =?utf-8?B?Z01PTmhVMG5iS1ZIU1ZRaWRhV0VHajFjc1UvTjVhdUZlVGluaVRBckQ1UXlM?=
 =?utf-8?B?aEdpZjc4cHRMdnpnOUdpK29EVlYwUjl6N2xXdytPK25pL21lQzRlOXFGYVg5?=
 =?utf-8?B?YmJBY2Y4S29jUUZtWU03eGxqaTRqQ2o2dTFCUkVsdGtaOHBaZjk0SmRFL2xQ?=
 =?utf-8?B?OFNuelRnVys0cXhJUWZYNGdmdGNEbm5IcEd0M2xRWjV1eVhPdnRJKzNlZVkr?=
 =?utf-8?B?TlNJdHpLOG5janVuaE9ySFo5S0RwaW11cUtSbDBCUnR0dDFwcjN1cFhaZThC?=
 =?utf-8?B?MFlBcnp5S1dRUDhqWGgvTE8zdlh2N2ZBc2Q0em5MbzFxUjJLMVhHODhrUFZn?=
 =?utf-8?B?UmNaY0RJY2hLNE9HV2psbFYrSWJHbmdGZEgxa2JrNm9wNXptTmpuNlJqYjlr?=
 =?utf-8?B?QjFkaFFxcWdyZnl5N2tNbTg4eFB4MGoya3JWTlpUb0xpSmxKRHErdXZHem1j?=
 =?utf-8?B?cXlIS2dLL21RN2RFcGx1SU9PNUlEZktVdDJYM2xLbXNoa3FJUWlIWnNzR1RP?=
 =?utf-8?B?Y01oTTFOMnV5S1hyNVdrYmV5aDVwbmVXclpmK1hJVjlibWtoQi9rVXAxMGNK?=
 =?utf-8?B?SDVkQWhlc0h6aENwb3lZSTdYWVRmUzR5ekhrVFduUTAzVElTUC9nNWtGWDVR?=
 =?utf-8?B?Y0hsNWlEblVlaFV1NHJwSEVvYU0vSDdlMDU5bVpWNitrc1FVSFUrWGU1VEov?=
 =?utf-8?B?cDl3UmhjbXhHb3laaWZ5YkJXTWRRRzNzdXNzRVpQbVJSdFM5cVhnZVc4SFl1?=
 =?utf-8?B?cUY0RURCZUY0WVRPMUdGY2VJZDAyM0YzRDhZVEdWRWFybmhtRWthNmRwbis4?=
 =?utf-8?B?WXQyVERZSks0djZudTZBc1dFckF5dlNSUGdydSt2RDNOcmNKTFptSGRZSE5F?=
 =?utf-8?B?WVhJZFk5dTdpV3J1R0JRKzRxR3M5NklSNVNPNEF0WW44b09wM1FaU005RFhj?=
 =?utf-8?B?SG5tQlNGaWZiWVRsYjdBMXNjOTBKOWRaaFJXYVArekY1TjU3UU4wbWFQZGlp?=
 =?utf-8?B?ZS9aSkkzVjQ3c2RTWGF5aHFuK2Q3eE1vMEVlbEswcjdFaDhBam15WEV0eGY1?=
 =?utf-8?B?RmV1UERPM1dpbTNJM2FlUERtYjhmcnpBb0JiWHZOdzAvQ0dOUzEvZlFSSWdq?=
 =?utf-8?B?MzViZzBOdExyRGFvRXc0bm1sNlFLSlR4SVdRdkh4MXU1c1RXQlZzd3QyYU1M?=
 =?utf-8?B?a2RvbnNvQ2h5ZjMrN1EyT3U4Y1UvMkUrRlk5b0lWK3hzbGVueHhHeFNlUjBn?=
 =?utf-8?B?ZVpLUU83OE1DWERhUE8vZmZwWGV6UjU4ZGhFUTJhTVBwQnFEam9iT1lzWlQv?=
 =?utf-8?B?ejhkNnhPbUpRRHRmdHlOU01ZQ1FndEh1QTJDRUxlVm9yc0s1RXlFMlk3cGcv?=
 =?utf-8?B?a0RFYmdkbUdPMko4ODAvVzZZaFNCcUFKWEtJNi9URGRnOWJKMTFuSUlRcUNG?=
 =?utf-8?B?cklTazcrNkpYNU1XdG9uYUhHOUdaTEYyT0h4TzRBK1YyTlFQVlFZM0huUVlY?=
 =?utf-8?B?ZHY1WC9SODhnaVRxaFhSQkppMWh3dFdNZzh0bSsvanFDT0V2cGUxdXRFTmVk?=
 =?utf-8?B?dURvMmU4YkdDK0h4N0M0anhmN0NpRUtCRHJ1R0JFMWpKZHlyT2Y3cjJVd1hY?=
 =?utf-8?B?NE9XVGxic3RoaVUwU2hxN0txVGlZd1RnSktrblg4dDVvdG93b3ZoYkczeTRW?=
 =?utf-8?B?Ym1BejA2bVJ0cGo0aWVLaTc0YUZWbHEyS0JYM05TTGNXN2tSN2w5R1hlelRF?=
 =?utf-8?B?VVBOaG5qVHdUTjdUWkV2c0liSDhTSzhDMUxlMzBCRmtsUkMvaXNJN2xCL0VI?=
 =?utf-8?B?bmpzSkVrN2F5ZW5yRWNGcE1ybjN0TnZpS3BhS3cwS3pNc0d5WUwrWGFOakww?=
 =?utf-8?Q?m6xokKpG+OzG0x8f0ZPnbslO8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9cdaff2-4208-4f83-4f21-08dd15611f7e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 19:15:04.2317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K4QXLLBVMW1WTUenq+FmihqNzW88Jm4HocD8TNQ6LzskeFG7SBZylcQBStkKOGYJGqJQUoOmq5+Rqluae0jnrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4378

On 12/5/2024 04:19, Shyam Sundar S K wrote:
> Introduce support for passing custom BIOS inputs to the PMF-TA to assess
> BIOS input policy conditions. The PMF driver will adjust system settings
> based on these BIOS input conditions and their corresponding output
> actions.
> 
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

I do have one suggestion for a follow up to consider.

> ---
>   drivers/platform/x86/amd/pmf/acpi.c | 24 ++++++++++++++++++++++++
>   drivers/platform/x86/amd/pmf/pmf.h  | 15 ++++++++++++++-
>   drivers/platform/x86/amd/pmf/spc.c  | 24 ++++++++++++++++++++++++
>   3 files changed, 62 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index 1b9c7acf0ddf..21ccd677ffa4 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -321,6 +321,18 @@ int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req
>   									 req, sizeof(*req));
>   }
>   
> +static void apmf_event_handler_v2(acpi_handle handle, u32 event, void *data)
> +{
> +	struct amd_pmf_dev *pmf_dev = data;
> +	int ret;
> +
> +	guard(mutex)(&pmf_dev->cb_mutex);
> +
> +	ret = apmf_get_sbios_requests_v2(pmf_dev, &pmf_dev->req);
> +	if (ret)
> +		dev_err(pmf_dev->dev, "Failed to get v2 SBIOS requests: %d\n", ret);
> +}
> +
>   static void apmf_event_handler(acpi_handle handle, u32 event, void *data)
>   {
>   	struct amd_pmf_dev *pmf_dev = data;
> @@ -430,6 +442,15 @@ int apmf_install_handler(struct amd_pmf_dev *pmf_dev)
>   		apmf_event_handler(ahandle, 0, pmf_dev);
>   	}
>   
> +	if (pmf_dev->smart_pc_enabled && pmf_dev->pmf_if_version == PMF_IF_V2) {
> +		status = acpi_install_notify_handler(ahandle, ACPI_ALL_NOTIFY,
> +						     apmf_event_handler_v2, pmf_dev);
> +		if (ACPI_FAILURE(status)) {
> +			dev_err(pmf_dev->dev, "failed to install notify handler for custom BIOS inputs\n");
> +			return -ENODEV;
> +		}
> +	}
> +
>   	return 0;
>   }
>   
> @@ -480,6 +501,9 @@ void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev)
>   	if (is_apmf_func_supported(pmf_dev, APMF_FUNC_AUTO_MODE) &&
>   	    is_apmf_func_supported(pmf_dev, APMF_FUNC_SBIOS_REQUESTS))
>   		acpi_remove_notify_handler(ahandle, ACPI_ALL_NOTIFY, apmf_event_handler);
> +
> +	if (pmf_dev->smart_pc_enabled && pmf_dev->pmf_if_version == PMF_IF_V2)
> +		acpi_remove_notify_handler(ahandle, ACPI_ALL_NOTIFY, apmf_event_handler_v2);
>   }
>   
>   int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index a79808fda1d8..255c5ad2300e 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -370,6 +370,8 @@ struct amd_pmf_dev {
>   	struct input_dev *pmf_idev;
>   	size_t mtable_size;
>   	struct resource *res;
> +	struct apmf_sbios_req_v2 req; /* To get custom bios pending request */
> +	struct mutex cb_mutex;
>   };
>   
>   struct apmf_sps_prop_granular_v2 {
> @@ -616,6 +618,16 @@ enum ta_slider {
>   	TA_MAX,
>   };
>   
> +enum apmf_smartpc_custom_bios_inputs {
> +	APMF_SMARTPC_CUSTOM_BIOS_INPUT1,
> +	APMF_SMARTPC_CUSTOM_BIOS_INPUT2,
> +};
> +
> +enum apmf_preq_smartpc {
> +	NOTIFY_CUSTOM_BIOS_INPUT1 = 5,
> +	NOTIFY_CUSTOM_BIOS_INPUT2,
> +};

Maybe as a follow up you should combine these all together in a common 
header:

APMF_AMT_NOTIFICATION
APMF_CQL_NOTIFICATION

> +
>   /* Command ids for TA communication */
>   enum ta_pmf_command {
>   	TA_PMF_COMMAND_POLICY_BUILDER_INITIALIZE,
> @@ -657,7 +669,8 @@ struct ta_pmf_condition_info {
>   	u32 power_slider;
>   	u32 lid_state;
>   	bool user_present;
> -	u32 rsvd1[2];
> +	u32 bios_input1;
> +	u32 bios_input2;
>   	u32 monitor_count;
>   	u32 rsvd2[2];
>   	u32 bat_design;
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> index 06226eb0eab3..05bed8206365 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -47,12 +47,35 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
>   	dev_dbg(dev->dev, "LID State: %s\n", in->ev_info.lid_state ? "close" : "open");
>   	dev_dbg(dev->dev, "User Presence: %s\n", in->ev_info.user_present ? "Present" : "Away");
>   	dev_dbg(dev->dev, "Ambient Light: %d\n", in->ev_info.ambient_light);
> +	dev_dbg(dev->dev, "Custom BIOS input1: %u\n", in->ev_info.bios_input1);
> +	dev_dbg(dev->dev, "Custom BIOS input2: %u\n", in->ev_info.bios_input2);
>   	dev_dbg(dev->dev, "==== TA inputs END ====\n");
>   }
>   #else
>   void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in) {}
>   #endif
>   
> +static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
> +					   struct ta_pmf_enact_table *in)
> +{
> +	if (!pdev->req.pending_req)
> +		return;
> +
> +	switch (pdev->req.pending_req) {
> +	case BIT(NOTIFY_CUSTOM_BIOS_INPUT1):
> +		in->ev_info.bios_input1 = pdev->req.custom_policy[APMF_SMARTPC_CUSTOM_BIOS_INPUT1];
> +		break;
> +	case BIT(NOTIFY_CUSTOM_BIOS_INPUT2):
> +		in->ev_info.bios_input2 = pdev->req.custom_policy[APMF_SMARTPC_CUSTOM_BIOS_INPUT2];
> +		break;
> +	default:
> +		dev_dbg(pdev->dev, "Invalid preq for BIOS input: 0x%x\n", pdev->req.pending_req);
> +	}
> +
> +	/* Clear pending requests after handling */
> +	memset(&pdev->req, 0, sizeof(pdev->req));
> +}
> +
>   static void amd_pmf_get_c0_residency(u16 *core_res, size_t size, struct ta_pmf_enact_table *in)
>   {
>   	u16 max, avg = 0;
> @@ -201,4 +224,5 @@ void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_tab
>   	amd_pmf_get_battery_info(dev, in);
>   	amd_pmf_get_slider_info(dev, in);
>   	amd_pmf_get_sensor_info(dev, in);
> +	amd_pmf_get_custom_bios_inputs(dev, in);
>   }

