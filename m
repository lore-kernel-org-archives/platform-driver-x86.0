Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011024.outbound.protection.outlook.com [52.101.57.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC6728312D
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Sep 2025 16:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758557340; cv=fail; b=WyZZLmzO1OYN8uwFMRfI1UidN7b/XOT7NREWKhXdQiXtsTpoAz2AytQ1y9sKxWxMLqMUyhRrl21bcXABFWF68o3WIIiIkIPz2l9I4bX9z+84gaAwo4nqRxQQwYqGRkKWbcXCBogPVuEQOAVg3xs9pCjA0b3xLWJqlLJIVSq5DGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758557340; c=relaxed/simple;
	bh=wzce3vOgTZycMmErnnycHnOOdGubDbfChMdE5VyifoU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=svHNKZc1QN5tKf110JiFltHNoTU3NZLMmEyrW7t4v6gRGLWE1hOgV8FnjqRrr+Op3AgcjTTv53v5KEuciS3EhoCv9h7L8dqcCryZsd5KhVSQgRHJLAtn/EPyGWv6avrVFFhM7AwJ00BFQksMiTNLfb3Vo8eHddHfUzvK7KE76hQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=dyI6LxTZ; arc=fail smtp.client-ip=52.101.57.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dyI6LxTZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NQJYJ5tK0e6QgEVkRXyllSZv0YFSLu6KRo0vm9wEeH/2uG52waWETMmG0sqa9x8/wobSzgGmudunihOie6WuTyMk8mFAtvJfSWHls6kJX+4RAb0zcsXmqp4PbWPoVoWJegm5UkQd/HVJ7vFKfStA8vCrAD/6CNnLHj/d3tuV2pDmXbfl/YLWqC4qmaOA9gzNnV/JBtR3qARhWkN0oe+OFUHh6tbDZeOWisHxSovA9VGT3g1DatZurDMyzWB7hCReVlr8BQwO9hPMG9Ll4yzgnmrxs/mToq3m29TeAN+UGwQrnJzWRXHOarX8zKJUT0z70QPv8jYJrTbOTRtPgqKm2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xTFAsvH9Aco+GtO4cbiKSZQFMfRnlKAgfRFl5G5quok=;
 b=ASLs6uE43OvMxAtE+WNtgfJci3CKCj+tHQnSdQ6EUN3A5/9myXXZjnkkInS85jEWCQc+pNfPHYShnas2HdG5KGbtcp/YZyG+MB+H7V4tHFfElJjo+4l04LhHm2ZQQDz9MreLFPhJpz6nSIPVK2kYvt5+nPFG38GFDNnTSvsBqdZx/JHfGfADXSXkrdd5vhp2AWPXB0onE2vkYmGt+WTQqK41hKAFAH17a7tEppOwcldH7JpvNQwwNXhGhnNzd39zfEKll16pay7f8ulUwB1K2tfMb+DQbTd8Dzc9N6C8/NbkOkqcrpN9N5YLqz0v4WjuY+p6aBFcacPbsTnNAQy1ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xTFAsvH9Aco+GtO4cbiKSZQFMfRnlKAgfRFl5G5quok=;
 b=dyI6LxTZURf+gGOkV84UidUwwCgxa4p9EtDeuBUoaPxuE/sMQ9wF2/7TxBqIfBmdYcTYGCkthdhrJqzrlW9XMaYayNhc0uv4/0qKNhQlHFxl/Q24cdUERLuPwcS8M9L5fM1ctk3m0bCcCpBPmcA6JKaa6qsBAC7g0Pifjz3sybs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by PH7PR12MB7379.namprd12.prod.outlook.com (2603:10b6:510:20e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 16:08:44 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%6]) with mapi id 15.20.9137.012; Mon, 22 Sep 2025
 16:08:44 +0000
Message-ID: <a03fbb97-7862-4566-a1a5-405925d30e2e@amd.com>
Date: Mon, 22 Sep 2025 21:38:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86/amd/pmf: Introduce new interface to
 export NPU metrics
To: Lizhi Hou <lizhi.hou@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20250919055425.3055817-1-Shyam-sundar.S-k@amd.com>
 <20250919055425.3055817-2-Shyam-sundar.S-k@amd.com>
 <4747fe10-3064-5466-2f78-47cb93f294c8@amd.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <4747fe10-3064-5466-2f78-47cb93f294c8@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1PR01CA0166.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::36) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|PH7PR12MB7379:EE_
X-MS-Office365-Filtering-Correlation-Id: 409c37a5-c38e-4438-ba61-08ddf9f24dcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N1JWVW4xb3pIaXU3aExTbm1MVVpiNWZYRW5pTTl0aWFqUGx0Rk8xdnZNc0Rx?=
 =?utf-8?B?Vi9YSDhqbUxhVllDVU9qOEZtRDFMalM2OFB2T0ZHeFFLUkI1TXplczVvWVpX?=
 =?utf-8?B?Sk1Sc29Ecy8yN2haVlBmUzFUV2FESEZRMkRVOFgwZmY1cm9sMG9PZzBiTExw?=
 =?utf-8?B?KzlLeDY4a2dDRnU2SFJMcStzTk04TksyYUR4dFdwRHJuamF4bno5T2dFam5j?=
 =?utf-8?B?UTNZT0Nrejh6S1M3bkhGVnR1QW41TU1CV3dHbExoT2NXcE54dU9LVms5bTRU?=
 =?utf-8?B?dldrZDRXRjAwazk3ZmJkMW1ZQjYyN1NnVHJSZGQ0MzJBL290Y091U2lBaXpY?=
 =?utf-8?B?bEpsUXJmK2hqZXhybDk3bXFaTG1OTEdUVXU0Q2FNMWdUeE5DZFdhaDlHalJn?=
 =?utf-8?B?dGZBaXRuaTBQMTA2N3ZEbXQrOUFNUWYwT3ZCM1dwQ3lFOERVZDBXRTZLTzFS?=
 =?utf-8?B?THJYeWVUSldDcmo2YjF1a0xxLzkrc2huOEIvMjBnZjd0SFdaVU95R1VYYWJt?=
 =?utf-8?B?MzB4TkRHN2MwblpLL2hYbVlCQUlPWXBha0RmQ1pMRllyQVU4SS80bnk1QlhV?=
 =?utf-8?B?MXlXb0o2TVhLU25kL1VRT0xHclI0ZUVXS3lWVkRSRTVna3BnSEpyaUlvRmNk?=
 =?utf-8?B?TGtSc09sMUplTkRGV3dIb0FZUll3M1JiSFpFM1VnbWVuL3pMYUc5aUYvbzNX?=
 =?utf-8?B?TzhhK0FlYzlVTXdWOFRDQ0VaZjVhTkFocldrWE9XbkpHRzBKeU92U1RRV3E2?=
 =?utf-8?B?cUNQd1hxWE0yTE9CMWxJY2ZNSkhocUFiS1BYdmFZbHBKNkRWWXZZcVVTYkwy?=
 =?utf-8?B?KzIwK00zSGdkT2RSYXkzSFZady9CSDJCM2p1alNrbmZkUm9BTE1hRmxaL3Vj?=
 =?utf-8?B?b3B3Y1ZiQ3cwT1pxY1hRd1Q3NzZ0dFVoejB6V3JwQ3pKWkl1a2NZWUVyZ3h2?=
 =?utf-8?B?Q1Q1bEhIb0hOU2s3U1IzNUxJKzNJL0tlTkNEQXk2aUF1OHFocjRwK3JmbkYx?=
 =?utf-8?B?TGQ5ci9oRlRUUmJLd3UrN2Y2UE5aVVA4aE1HS0tXTjkxYnkvZnM2Wno1cjcz?=
 =?utf-8?B?V3h5aWZxcWtWREVqSFh6MGxuN281OTJpYkpBMTFDcXRjWGJYVVJiQnZLblVF?=
 =?utf-8?B?b1hIR3dvbHI2cTNGNWFGaUY1YWx3dmwyRVpWcXNNMFNMZ1FFZ3I1dCt0V01W?=
 =?utf-8?B?V1F6bmdNYW0rM3dTNDRGUnViMmNvQU92aVREZ2VoWWVrN2FYWGpiK3VrRUto?=
 =?utf-8?B?ZjVpbFpxckxEZHdEQkZPd0x3dVBJZjlFOHNPTytySkpXZ2V5WGQyQ1RRWUhR?=
 =?utf-8?B?cHYzWU5mN2hyOE1jTDhqMGg5NGt1ZVNKaE44MVl1U0ZnclFFb3RjRStGVTR4?=
 =?utf-8?B?Zlg5VkJzRFlUOXZ2NFZtaHhLTTV2bGRRM01SOGhUVjhVTUtBMll1cXM2RWd0?=
 =?utf-8?B?QTRFcFlLUjBJdWJQOXZJMktlbEMxTENRUXg3YXEzZjYxREdwbnlRZ254Q2NK?=
 =?utf-8?B?MDhEdzNzRE4vQlhTSnJnYXhsZExYMCtMemxia09VbU5UaDBWVEdiMFJOaCtk?=
 =?utf-8?B?RTdvUTdBWkNpSjE4UlJRdW9ud3V2ZlZsaHBXWXBFcDdKS3hnQUoxd3lxZnBm?=
 =?utf-8?B?cFR1eWhMMGYxQ0cydmxzR0dQUnNCVlNsTy92aHZqMTdBTWNIWEhHc3NQelZ6?=
 =?utf-8?B?QTB3bE8zYTVNYTRXNVdXVGZaeklGOHo2bUd1b3dma2hHa1ZGeDJmME5ZaDVR?=
 =?utf-8?B?RDFPbUVRRExZM0hsUUpIR0JNMm9saUYvam5iMEpnQjBjYjd0N0syOTRIMHRV?=
 =?utf-8?B?QWlVdml5NGQrVXR4UEJ5M0Q5OHgwbE9tL0xKYUpLbFdoeFRNeTFMUklLa2Uw?=
 =?utf-8?B?eDFWZHBKd2lqdU1GY2dzZDJxTnFWNTVhQVV6eHVPL2swUG5LMFAyR0c2TTRs?=
 =?utf-8?Q?+5AvdkeCY9s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDY0T1Fhb2NQK2ExemhIa0ZGY2duR3NwOWhxV3ZvTzU1LzdnYXlnbW1sSzJH?=
 =?utf-8?B?RXk5NFQrWVMxS1NOSWNMS3RZdkQ3UVNIdjRxN3lSNHhGN05qLzFza2FqWSt5?=
 =?utf-8?B?djJNYVBsaGU3YzVXYi9jZ1pEYUE5R0dvQkxtSHpqV1pkcDFHUFh3c2NtWXhH?=
 =?utf-8?B?Vk41NUVtSVowdWtTU2U0SS8wdlZQT3pGa1VKUURaQWxzU00vKzk4dldERi9C?=
 =?utf-8?B?aFIwS290TDZjZ3IzUU5ZWWV5Z0dYbHUwMDA1T3FtL3dlQ1lSbEhWMHJQTXpn?=
 =?utf-8?B?aXBZZDViVkI1c2VCOTRvRGZhdFFsM2JmWk5EVVIxRHV2a0Z6ZmIwRFJWUVcx?=
 =?utf-8?B?akVtMHd5dXlOWEY0b0Z6OEplcWhhUDVmdlFURlVlUFFIOVI2V015bjh5L1Nr?=
 =?utf-8?B?MmlJaUxERGVmT2p5VytlTDl4dmc5NFcyUzhUVVVFWUxiTWtocUtjemhqZXhY?=
 =?utf-8?B?T2M3WkRkSC9pVUd1NTdRbnVjeTdBTTlaaGRUMFlTODFvbkJhbmwxdmMyN1Jv?=
 =?utf-8?B?SVRZSTZwNytjYkd5c2lwNysweUQwVFpISjNYaDcveHFhSzNGYkFnOUh3bkU5?=
 =?utf-8?B?dzBTRk9KcDNRMDNmWE80QzhudG9PYm5LWU9pSkNpOVZ2K0I3VVdadUFRSXZD?=
 =?utf-8?B?a3R2S3dZdCtkeTNFTk5hRTBXZGVlTDR6OUJWMXE5RkNCYUdsY3dhRnhBaU5o?=
 =?utf-8?B?aVpRMjk0emkyY2pOQkE1VWpvdGxLVlV3OXFWLzVYakxOTFVwTjJUWG5MZ3lD?=
 =?utf-8?B?R0VCNytQSEk3VjNoT0RRRk5qejBGM3hsMjdNcW5ibGw5Zm1FdnZWNWRtLys5?=
 =?utf-8?B?eDA1ZHlGVnpnaE94MFdJa3N0RGhubHNlSnpnYTBuemtmRjVndXdUTWRrTzR6?=
 =?utf-8?B?MjFHcnNOSGJMdUJ6eGoyalNRRFdNVkV4akZqMUV4RTF6VlV6TUs4SHB5OXN1?=
 =?utf-8?B?ZFVVSjEwUHZCekFtVzBWUHBpK3R6NTFLd0N6R2tMYmg2eWw0Q3lNY1hncEJu?=
 =?utf-8?B?UW5rRStnV09DUjRBUWNnUTNmcFR4cU0vRGU1cm1Sam9sRHJXUElBaEpaTGYw?=
 =?utf-8?B?R0tUOHhRNVJFZ3ZUZFUzSjNNenhvTFVESFRXdXUyNnhaU1JrZG90akl4S0Fx?=
 =?utf-8?B?TmdxZVpLTFNOeEs2UGlkaVRNUlE4Y2wrVy9jVStzMll0dUdKYVdFYkFubndV?=
 =?utf-8?B?RksyemtQSFh4d0JPelFqNnNYeUY2VkFxTDJidEVDUkRUZk9ZcFRVMHVjdlFT?=
 =?utf-8?B?bnFtU0JHbWdvWU9SYlFLN0xoSlowZHlESUd3TEp5blNiNDIvUDd0bkhzYVI1?=
 =?utf-8?B?Y1ZWekdMRUhpZDljVlNvS0c3OHJvTGw2VmlOZmdEQ1Fza08yalBpWlNyeUYy?=
 =?utf-8?B?Z0tzdTgvYjdVUXpGaVV1UTVYanFmd1BpTkw1QzF1a2Q1blIyVkM2UTdTaTNu?=
 =?utf-8?B?MUtJUEpyU3VKRU1MRnc2Ny9kekJRcEZUZUkyU2FYWXlsY01OQjd2VFVjRGI4?=
 =?utf-8?B?M2dCaTd6YUpsRDAzMWlHdjFyUUk4SWpQR1d2dmR2akhNRHhJdmwrRW02b3ND?=
 =?utf-8?B?eVFrcHBKRzVuYncyYnhXTmdhWnRDME8zZEd0Z3N4ZlJGV1lvZjNYS3VnQ0lB?=
 =?utf-8?B?L09ENUJ3a3ZyUWpzTE81ZUJpMW91cnlKNkhHVGRuSWp4UUt3YnRteXMvN2sx?=
 =?utf-8?B?c2EzUXdHbitsb2lTMFE4NEtxZDdZRUVGdHE2NFlrTXhXa0tpRXlEbEZTUVVt?=
 =?utf-8?B?eWh3YTZYWTFsbzJwUDZ3S01kYWZCdU5UOFlYb2lyQXdwdGZ3UTJFZWcrM0F6?=
 =?utf-8?B?TVNMem5sdEx5QVF5VER2SzZHcVB1SnB2alNVVUFWNllqd1JnNU5XNmpFN0RJ?=
 =?utf-8?B?SXBYaWd6R3hGV1JuK01DOGhUdm5hcjROSGxHVFBmNVl0K3E1enl5elVsN05q?=
 =?utf-8?B?Z1RndS9yTDY0QXlpbUpnZEd0Q2Fjcm1hTkw5c2xUNUFNeXlnUU9iMnJlRU85?=
 =?utf-8?B?VGdzek1QOXo1bTd0SHpBMHBjSGNsdzd6b1NPalZxT1NEV2h5UVlhcUduVFFB?=
 =?utf-8?B?ejRDOHpBbVo2aGQ0N3hwZWFxNEszOFZmZzlwaGFwVkZQamFZVzBzbW1xS0Qy?=
 =?utf-8?Q?4xF0dW76iJS6aWiYKNTwRgK+f?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 409c37a5-c38e-4438-ba61-08ddf9f24dcc
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 16:08:44.2900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l2xbmOtJ1cJ95UFGYN3r812SsbtwXblonbTTeV7a2HWOIP2P2V1Cs2FtXEbLJ2fOZzkc7evLO9a2rYVVnkk4fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7379



On 9/20/2025 01:56, Lizhi Hou wrote:
> 
> On 9/18/25 22:54, Shyam Sundar S K wrote:
>> The PMF driver retrieves NPU metrics data from the PMFW. This commit
>> introduces a new interface to make NPU metrics accessible to other
>> drivers like AMDXDNA driver, which can access and utilize this
>> information as needed.
>>
>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>> Hi Ilpo, this can be applied on origin/review-ilpo-next with git tip
>> commit
>> "8236b4667aca"
>>
>>   drivers/platform/x86/amd/pmf/core.c | 60 +++++++++++++++++++++++++
>> ++++
>>   drivers/platform/x86/amd/pmf/pmf.h  |  1 +
>>   include/linux/amd-pmf-io.h          | 21 ++++++++++
>>   3 files changed, 82 insertions(+)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/
>> x86/amd/pmf/core.c
>> index ef988605c4da..75529047377c 100644
>> --- a/drivers/platform/x86/amd/pmf/core.c
>> +++ b/drivers/platform/x86/amd/pmf/core.c
>> @@ -8,6 +8,7 @@
>>    * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>    */
>>   +#include <linux/amd-pmf-io.h>
>>   #include <linux/debugfs.h>
>>   #include <linux/iopoll.h>
>>   #include <linux/module.h>
>> @@ -53,6 +54,8 @@ static bool force_load;
>>   module_param(force_load, bool, 0444);
>>   MODULE_PARM_DESC(force_load, "Force load this driver on supported
>> older platforms (experimental)");
>>   +static struct device *pmf;
> So there will never be more than one pmf device in the future?
>> +
>>   static int amd_pmf_pwr_src_notify_call(struct notifier_block *nb,
>> unsigned long event, void *data)
>>   {
>>       struct amd_pmf_dev *pmf = container_of(nb, struct amd_pmf_dev,
>> pwr_src_notifier);
>> @@ -314,6 +317,61 @@ int amd_pmf_init_metrics_table(struct
>> amd_pmf_dev *dev)
>>       return 0;
>>   }
>>   +static int is_npu_metrics_supported(struct amd_pmf_dev *pdev)
>> +{
>> +    switch (pdev->cpu_id) {
>> +    case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>> +    case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
>> +        return 0;
>> +    default:
>> +        return -EOPNOTSUPP;
>> +    }
>> +}
>> +
>> +static int amd_pmf_get_smu_metrics(struct amd_pmf_dev *dev, struct
>> amd_pmf_npu_metrics *data)
>> +{
>> +    int ret, i;
>> +
>> +    if (is_npu_metrics_supported(dev))
>> +        return -EINVAL;
>> +
>> +    ret = amd_pmf_set_dram_addr(dev, true);
>> +    if (ret)
>> +        return ret;
>> +
>> +    memset(dev->buf, 0, dev->mtable_size);
>> +
>> +    /* Send SMU command to get NPU metrics */
>> +    ret = amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, 0, 7, NULL);
> s/0/false/ ?
> 
> What does the 7 mean? Is defining a macro better?
> 
>> +    if (ret) {
>> +        dev_err(dev->dev, "SMU command failed to get NPU metrics:
>> %d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    memcpy(&dev->m_table_v2, dev->buf, dev->mtable_size);
>> +
>> +    data->npuclk_freq = dev->m_table_v2.npuclk_freq;
>> +    for (i = 0; i < ARRAY_SIZE(data->npu_busy); i++)
>> +        data->npu_busy[i] = dev->m_table_v2.npu_busy[i];
>> +    data->npu_power = dev->m_table_v2.npu_power;
>> +    data->mpnpuclk_freq = dev->m_table_v2.mpnpuclk_freq;
>> +    data->npu_reads = dev->m_table_v2.npu_reads;
>> +    data->npu_writes = dev->m_table_v2.npu_writes;
>> +
>> +    return 0;
>> +}
>> +
>> +int amd_pmf_get_npu_data(struct amd_pmf_npu_metrics *info)
>> +{
>> +    struct amd_pmf_dev *pdev = dev_get_drvdata(pmf);
> Could 'pmf' be invalid pointer if the driver is unbound from the device?
>> +
>> +    if (!pdev || !info)
>> +        return -EINVAL;
>> +
>> +    return amd_pmf_get_smu_metrics(pdev, info);
>> +}
>> +EXPORT_SYMBOL_GPL(amd_pmf_get_npu_data);
> Should the interface be thread safe? I do not see any lock to protect
> dev->m_table_v2 or dev->buf.
>> +
>>   static int amd_pmf_suspend_handler(struct device *dev)
>>   {
>>       struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
>> @@ -431,6 +489,8 @@ static int amd_pmf_probe(struct platform_device
>> *pdev)
>>         dev->dev = &pdev->dev;
>>   +    pmf = dev->dev;
> 
> Maybe set pmf after probe is success? And clear it in remove?
> 
> Because driver could be bound/unbound, simply using global pointer
> might be unreliable.
> 

Ack for all your comments. I will address them in v2.

Thanks,
Shyam
