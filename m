Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011062.outbound.protection.outlook.com [40.107.208.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B93217722
	for <platform-driver-x86@vger.kernel.org>; Fri, 17 Oct 2025 15:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760714660; cv=fail; b=RuFOa0Dr1ZjihXZIpaYww+8bGj8Grv+SlXtuWbjglJlL3Ww29uG+Iog3TgOaUiS8msu09ORtGK30D1Y/w0P9baF94MzSRV4/gbszgZYnCOS9F8uFjKkElKxOzBS18Ypj9iietExbedsCTsmSYSwPjwaMmqkORwWrYPnCm58DToo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760714660; c=relaxed/simple;
	bh=ynFGU2UsEaMq8tOumtE4OamC2GPeFeSmRtaRVUnD8c4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ki7VkZcSfPbrwIvyrMsh54ciixC/9GmWLQWcKk01MBtY155wkehwxI2UC5nEtHUYinzP2podKnMBfX+MQMW12bxrVhgcxnhTwUcxpGeYijhAmCV5i9vYhJk6EY6/p/E6oXq7xplGNhzNYvorK4LPbPrgL6CjFPkCG60SDYPcaqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FaGF9Liq; arc=fail smtp.client-ip=40.107.208.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FaGF9Liq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EOvRNJ8ei3+6e6HNXWyMoGh3I5/TiJpRYt6nwtmTD4Hu33XznDNIGDMZxsQoMw844hd6rGOXu72LL39U0ExjQtI8kS+llRT/COTbQyV1ZEawiyukRM8UrgFLiGql/f84LePhVanvL+8JqPd17k/YXCH/9jgMhhrRrVOiVgYf4h+ZoL4PxAZI7r5KD3GVuODIR3bCOecrRgUCaFi65isGHi+cuECEdrc+zjglT5KbFi221TAJnhTVkNlI4NhcJZARTIt2QIq3gvmWOErrWV20ceUMQw8eKUqooaQdHcM0fVVG0VitRlpJghc6Art+QXCzWeZzZbHs0gb2khPTVa0MpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rZYCAOPaDI7fh8i3nnL/DkxC2Vn5Jo5RIZCOsFHFhxs=;
 b=JOPhg2zOPzuloK4OZDW6n3DR1DqYV2OSk20P5K6+06k4m5pRz9zLYGuoLU/XroHySEY+WeqrK7ZPgbpNLA3q1nliR88zZbrUe9UIg0pKiiMTT3udBk6tpx8JbXO5ZS+nwKZjY1q4lV+E0LQMZnSJKUG89lwXkdBJJhnPCwhLPgaCMfIOmOhDwNqCS5m9UNtqJsxdi7eumhBXvq960OZONeX6alBQBa8vONlaLtV3CGsmlOZGi1y6B6IwyZuXaeZAuDv9Jfqeu0WMs6a0mKdO5GcM5aHBf7o+93mtbTaLBUXtDHebRgIFsF6lUCBMRoOd9/IEmBxMTBgBdpi0IZBqFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rZYCAOPaDI7fh8i3nnL/DkxC2Vn5Jo5RIZCOsFHFhxs=;
 b=FaGF9LiqN+qZAdFrXHRkZ6Ej4sB4J5io9TC/84I9q/eihpYD7tG76MlZw4yHCsi9rzwWhq3K2KNZESLCCok/uOcxYm3wDBAmDFkMx4zObVEPYE5fRGPOIl08ud0Wh/fy4vrjYOFkfrnwjbT4Si/h+/gs1q07qN4azzC3mhqO7HM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA0PR12MB8086.namprd12.prod.outlook.com (2603:10b6:208:403::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Fri, 17 Oct
 2025 15:24:15 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9228.011; Fri, 17 Oct 2025
 15:24:15 +0000
Message-ID: <8f4dc968-a6ac-4575-919b-e36058e41f3f@amd.com>
Date: Fri, 17 Oct 2025 10:24:13 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] Documentation/ABI: add testing entry for AMD PMF misc
 device interface
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
 Yijun.Shen@Dell.com, Sanket.Goswami@amd.com
References: <20251017102544.1470934-1-Shyam-sundar.S-k@amd.com>
 <20251017102544.1470934-4-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20251017102544.1470934-4-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1PR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::26) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA0PR12MB8086:EE_
X-MS-Office365-Filtering-Correlation-Id: 77a96695-d0cb-4abc-c4d9-08de0d913b6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YTkzdTNZaVZQb04zVlNyeElHZ0hNazFSU0VVdVVYcjJiODEzWjdkaEYzUTlJ?=
 =?utf-8?B?NTRCQjdWYUJSN2tmcnQrTURjdEFDYmNpajN0ZnZOMEIyRXhmcXp5RVBRLzhN?=
 =?utf-8?B?Z0x1eW0wcmJQNVVrUWcxdjBYTFp6Yit3ZWFFN0swOVR2b09ybzZ3amplM2ts?=
 =?utf-8?B?UFJFUXo4bWRObklWY2tQTllkbGJxR2FmVTNCYVZUWWd0L1ZaVWJtU3dzR21R?=
 =?utf-8?B?QlRySW1hYlRUcVpCTGo0ZkxCOWJnNjRlQkhacE1XVlFTTHlSZ2FWOHUvbDNP?=
 =?utf-8?B?b2NPeGZzUVp2aUlsTGNoRkU3TnZLeiswZzhBWVFLd0tjb3pMNzZzd2Ivd2ZX?=
 =?utf-8?B?bjBuQm1wV21ORnFMb1QyVFQ4NDFVOThTaGYzSExvZ1A2ZDVLZVpXZmJKaThW?=
 =?utf-8?B?L290Y0o1UWw2eUVmREJJUGdSYVI0eG95NU9FN0gxOVNTWERTMXoxUzJCL1pu?=
 =?utf-8?B?bk9hUmlndCttQzhUSEZYWXkzVlIwMHVVZFpzVjdVU1dYTDBkSG4xakxvRHhV?=
 =?utf-8?B?MkRpUWtGN29LOU5RUXVYb1RJckNuVHVVdzhDK1BBbG1MNVN0R1U5dWVnUEdM?=
 =?utf-8?B?NVU1YnErNHFlb2dmZXdKNVdDcCtwL3lQN2JCQ0hZbDdOdCszYUthWVZpQ2p2?=
 =?utf-8?B?Nm9nUjA3WDBGd2UxNWxsZTR0aTR0cmpROE9nK3dRbUE2bitQemZJclJUekNo?=
 =?utf-8?B?aDlMUGJjOE1wWmxEL201eTJ0V3FrdWViOGhpME1LQUZEaTR5ZTZxOXRLYUg1?=
 =?utf-8?B?NzVmWlhtdGdsWFBUb3I1SXJQazBhc1dmYTFwWkxBektyemZjbFRqemh0LzRM?=
 =?utf-8?B?Y0ZtL3ptdVc5WENSWU14N0hhWGhBZGtERy9JVjladzZqbWNScGJqNTdYZTFV?=
 =?utf-8?B?ZHBRT0VCYW5Da1pucTU3TFVFODlvWHNBN0dkRDgvaDU2Zk1vc2lzdGlRKzBM?=
 =?utf-8?B?WFFxcEVRdjBVUmpCQktMRm10MDNpQU5vZENTOSsrNmFDWlJPck9aMC8wMDVo?=
 =?utf-8?B?YytnMzZXWEtTWnBSMkV0UlVmaU1GanZkSy9ZeTNjcTV4czVleG1kRUN6R3VT?=
 =?utf-8?B?elhLcVhuM1hmd3BaR2tvUTBoTWVjSGtwaXo2UFlER0tsUUsyWWVHTmlkT0JB?=
 =?utf-8?B?UjA1VlIzZVFyRU55d2k2ancwSXZaV2R0VGswbG5QZlE0ZHJ0TklpZmJQZ2Rz?=
 =?utf-8?B?VE9wNVdnRWtDOHI4K3k5b01wTVk4OXJJY01mZHAwaHZzcVUwWHdJQ0JndHo5?=
 =?utf-8?B?WkJoK1JxVkd6RkEwU3YwWE1SSTZ3alRpaTV3OE43NXN2MWtmK2JuVHlFZkty?=
 =?utf-8?B?dUt3WHJiM0I4MG55VnROWC9icjRaVW5PaE5oR1lYODNGeTBvWXI0OUhpZ1VN?=
 =?utf-8?B?T2NkbUlhNzVTQXl0TlE5WmNMcnJGSlJkTTdpMWMxWUNUUTZLdlhGdFBHTUJ5?=
 =?utf-8?B?WGdtZGZpUGZMdVNMMUxuKzh4R2RvZkhZZE1Lb2lhZ0JxbUt1ZXJsZmd1Q3Fa?=
 =?utf-8?B?S1hEL1VERWd2Ymx2bWpMMmJhZUwyclkzY2ZXUU9GTk03ME9KS1Z3eng3OVRm?=
 =?utf-8?B?MnR2STM1WDBOMEpYaHQxN0FYRWF6emY4OXlMeDhmaVJDRGlqYVVkTlZLUGJZ?=
 =?utf-8?B?Rk80QlR4cjVtSWk3T1Rid29zT3JyTUFuR25TRGxTNVRmSS9zblFFVGNwbWla?=
 =?utf-8?B?NnpZdnJ5WWlPcUFUd2pFNnFuTmw4NUd0MFFnYVdySUY4RjF5ZG5jWlhiRnFF?=
 =?utf-8?B?NVY0alVEemthTFk5RnZTdHovUGZVQWVkWkxXMENRaFprNW02d0ZDVWRVZUIw?=
 =?utf-8?B?aXA4aTJpQUJrMjRjeVBrL3E1VUYzRTAyQjdBWExKRnY4RjBkS1BRQk51d2k2?=
 =?utf-8?B?aEZKaThDTnlJYitsUjk0SmhpWVBmckVFUVJUSmtHaXpkRzZNNUpCMWp1Vnps?=
 =?utf-8?Q?4kWOPDh4xWOjTh6iIf6L5i6Zn9/57ce/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Uk1WOXg5U2FYM2pjVVUydDN3eFNlWDhST2o5NVczeTVxaG90L1NDVFZrWFpk?=
 =?utf-8?B?YmJ0SG5YNzVpNjdYUG5hTVNzZVduUTRld1ZmV0RhWmlueTQ3SXd4amlOczRs?=
 =?utf-8?B?bk9YTTNzOGtiOFhwQlZwSWNNSlVjQkNJalVlRjMzSXFZczFsMEJLa1plTnM3?=
 =?utf-8?B?NnMwb3JBQWdwM0lkVEl5N2tuZlBzOU91TURnZmYrZWZkZi9EbXNqeGZVWThh?=
 =?utf-8?B?aDRjZUZ0OVgvallDTlRoY09pa2hzSDBIQlpOcWwwbGpTSUo4WUc5c1dzTDIr?=
 =?utf-8?B?bXZIRzRrZlRCR2NFRVJSNVg1Z01OWHdCL1FsbUtVSFJhaEhjaGtLMmtFTEt2?=
 =?utf-8?B?OWdyTzd0ZVp4MEhsdncwM0FJUjc5T29GclpMQTVoRU9mK09yWnhuSnRBYlNO?=
 =?utf-8?B?NE9JZTZ2ZlJhUzI2UDRYTEVUYXZqMGhjcTh4LzJmV0FDZmxXenNKOVdVMnpn?=
 =?utf-8?B?Nkd6N3E1SjdpU2FyTDFNZmhENWVGMFFKV3ozQVUxbFp3UkFoT3lmZGRjWHdR?=
 =?utf-8?B?MmNtQ08ycnhZL0p2T01yQ0NaYVdkdjhya2duQVNUVHRIRlhPWG4xZzV4NlNT?=
 =?utf-8?B?azV3MTlDZVZCNlhtUFNrWmI3Vk9XOTU0eVkybU5Oa1llcG1YWWxveGtCM3VB?=
 =?utf-8?B?bVZWRWJ5L0xQZ1JYNlJibm9uYnBDYlU2NC8yaFprNStaTlNCQTZ5MUlDWldo?=
 =?utf-8?B?cENuNno4K0dNWXFvM0ViYXJTbG9rMGpseHRmN3lXYzVpVUxKb1JQb3Vlbm9x?=
 =?utf-8?B?a3lVTmh4V1cwYmlYME01bUhSRnpHTWprZXM4VVlQS0dpaTB2aGdjd0srWklI?=
 =?utf-8?B?WWVzRmFRMEZidzVXSFJ4Ry80eUFrSUpGRnhxNk10MStXbmtvMFd3bnU0NzVP?=
 =?utf-8?B?S3liZEFOWDF5ZVJ0VThPTWhMdGhVU25ZR1hxeEJVZG1HK1VTZHlMVFA5Ymh0?=
 =?utf-8?B?Qy9UUHlWMStpK3FkZk1ZdTF4Mk1MYlVXdnFtdUhHYlQ1WmNmVjRwWXM3ZUdK?=
 =?utf-8?B?KzF6QWQ2THJORjVGMjhjYzJtUmRJK1hMK2tHZml2UkhoSEtaQ1J6UGhQSTFC?=
 =?utf-8?B?cEp2a1dCTWs3L0hJbm15R20yNjZBWjhraDlkZlp2L2d2eTNNSmR3cU9DZ2pj?=
 =?utf-8?B?TG9JU0JqWlhNejFuQkxVcmJQSUo3b3U0NUxhVHYycEQ3ckFrV2Q5RTF6YnVz?=
 =?utf-8?B?MWI0YmExaFdOYmpwdkpaM0h5RjNtYlZURUY2TEN1Rlh6bnBtS0VvV3pTSlFO?=
 =?utf-8?B?a0lpR0hYYjVkN054cDV1aGoyT0RUL1hkTEFGZmVXYXpzWGh2YXl5R0tjNWQ2?=
 =?utf-8?B?MmlsSm9yT0twS3VzUTRCb2dWcEZhN1crejNBN0xGdzMrdy9GSDRYTThXcnhI?=
 =?utf-8?B?allLeTM2allGRXNrUnNGSFFHeWlpeFMyeFZjcFc4d3RtRlo1U0MrRitPQlZy?=
 =?utf-8?B?eE1DWUZWd2tJOFRjaU5RZGtDQzJwK1o4UlJ0Q2g2U3pGUElOQTJNMHA2NU1u?=
 =?utf-8?B?TC9wOXFDK3NpRjA1VTBia1BUdDBZM25FN1Y3T3Z4YWc3cStPMERMdHpHbDBN?=
 =?utf-8?B?RklCaDhXMTBtS2V6cFd0SkZrQzkyYmFvd29mUVNyMi90RWc2SmxxcC8vQUJk?=
 =?utf-8?B?emVmcW1wWHRhYis4Ni9BaGFWc0JYbmlvcStBT1JydDBtOVJtUVJmWTE1OUt5?=
 =?utf-8?B?VGczeVNkV2w3cWpjbGFsSEM5QXRheW1rb0dFRWsrYjRUSmVSaDhQTm9hcnRM?=
 =?utf-8?B?SDVKQkVTaHoyWlRoaGwvK0gxWVg2czRPT3Zkbm9zTVB6ZDJVL2hnejFuSUpr?=
 =?utf-8?B?STUybXhKNVRYM2F2TzkyaEtWTmtlMldTL3UzbDExdnJzWlB3cFhSbzFEVHJT?=
 =?utf-8?B?aHV0K2p4RHlXb1dYYmRzK1BBSTdHZjhRU0p6SXllQWdqMjZua2xhNDQ5eTh2?=
 =?utf-8?B?Z3hoeEg4cVByTWw0Q2hJSmxlQlFpbTNkYUVMMUtDN281ZWJManM1Q1ZRRFhr?=
 =?utf-8?B?cEhWRFd4RlhkMHhKVVk0dnpPTWxnM0oyeFV4NGdZbkZFM2YvaXNkSDUzMGZs?=
 =?utf-8?B?eDh1KzA2eVVsaEhxOFgwTkFvZTQzNUFXS01HYzRjazkrMzRPajdOOXpqcWNv?=
 =?utf-8?Q?RrcbHP9UMoTsloTureMEC5/mI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77a96695-d0cb-4abc-c4d9-08de0d913b6b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 15:24:15.3576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mNEac5vjoUA+0/ve3LunAi/1rye4RDKmm7STF8cHnXCwr0dPo9QIRHn+tX5KnqB4Ozkxi+zw4txh4NfTPx9WyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8086



On 10/17/2025 5:25 AM, Shyam Sundar S K wrote:
> Add a Documentation/ABI/testing entry describing the AMD PMF util layer
> misc device (/dev/amdpmf_interface) and the initial ioctls used to query
> feature support and metrics data information. This interface is available
> when CONFIG_AMD_PMF_UTIL_SUPPORT=y.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>   .../ABI/testing/misc-amdpmf_interface         | 55 +++++++++++++++++++
>   MAINTAINERS                                   |  1 +
>   2 files changed, 56 insertions(+)
>   create mode 100644 Documentation/ABI/testing/misc-amdpmf_interface
> 
> diff --git a/Documentation/ABI/testing/misc-amdpmf_interface b/Documentation/ABI/testing/misc-amdpmf_interface
> new file mode 100644
> index 000000000000..c4c7ea68c008
> --- /dev/null
> +++ b/Documentation/ABI/testing/misc-amdpmf_interface
> @@ -0,0 +1,55 @@
> +What:           /dev/amdpmf_interface
> +Date:           October 2025

This should be 6.19+ material now, so should push out later.

> +KernelVersion:  6.x
> +Contact:        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> +Description:
> +                The AMD Platform Management Framework (PMF) util layer exposes a
> +                minimal user-space interface via a misc character device for
> +                feature discovery and metrics monitoring.
> +
> +                When CONFIG_AMD_PMF_UTIL_SUPPORT is enabled, the driver creates
> +                a misc device:
> +
> +		======================
> +                /dev/amdpmf_interface
> +		======================
> +
> +                The interface currently supports following ioctls:
> +
> +		========================================== =========================================
> +		IOCTL						Usage
> +                IOCTL_PMF_QUERY_FEATURE_SUPPORT (value: 0)	User passes a struct amd_pmf_feature_support with feature_id set.
> +								The driver returns whether the feature is supported and a version.
> +
> +		IOCTL_PMF_GET_METRICS_DATA (value: 38)		User passes a struct amd_pmf_feature_support with feature_id set.
> +								The driver returns the requested metrics data.
> +		========================================== =========================================
> +
> +		Following are the IOCTL codes supported currently:
> +
> +		============ =========================================
> +		Feature ID	IOCTL Support
> +		0		PMF_FEATURE_AUTO_MODE
> +		2		PMF_FEATURE_STATIC_POWER_SLIDER
> +		4		PMF_FEATURE_POLICY_BUILDER (Smart PC)
> +		5		PMF_FEATURE_DYNAMIC_POWER_SLIDER_AC
> +		6		PMF_FEATURE_DYNAMIC_POWER_SLIDER_DC
> +		============ =========================================
> +
> +		Following are the return codes:
> +
> +		============= =========================================
> +		Return code	Description
> +		0		success
> +		EINVAL		feature_id is not recognized, or handle is not available
> +		EFAULT		copy_to_user/copy_from_user failures
> +		ENOTTY		unsupported ioctl commands
> +		============= =========================================
> +
> +                User-space tools integrating with AMD PMF to discover capabilities
> +                and monitor metrics data.
> +
> +Notes:
> +                - The ABI is currently considered "testing" and subject to change.
> +                - Feature version in the response is currently 0x02.
> +                - This interface is only present when CONFIG_AMD_PMF_UTIL_SUPPORT=y.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 46126ce2f968..590766bbb10e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1201,6 +1201,7 @@ AMD PMF DRIVER
>   M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>   L:	platform-driver-x86@vger.kernel.org
>   S:	Supported
> +F:	Documentation/ABI/testing/misc-amdpmf_interface
>   F:	Documentation/ABI/testing/sysfs-amd-pmf
>   F:	drivers/platform/x86/amd/pmf/
>   

