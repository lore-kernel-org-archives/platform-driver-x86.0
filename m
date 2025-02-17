Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2065.outbound.protection.outlook.com [40.107.92.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D05224AFB
	for <platform-driver-x86@vger.kernel.org>; Mon, 17 Feb 2025 15:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739806829; cv=fail; b=JgJi9q9ruquDQ5YfB+HRNGsjIAx351T71WmibslyRLYvrqbRmaKK7LC+yxktQbV0KTLJUBbXU/9L70smDwgZEJVK/5QPgQr2QkhgVxsDGa0q6IxQXYwsYy8O8lVLH43xa8VOupX/gzdbKqBtRRA03ygEYy92Ed2Bc7uCVHZ0dN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739806829; c=relaxed/simple;
	bh=jQ0ylmwzZ+zYuND9GJkFpa9kmz3ORjPzKEGIrCNRo5M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IwXIoGYH0GW43jGcqlNeI8cVgO9PHHhvePWhciEDqPhzmH2BxcEqbO8a4AovLoUPk3sqKnPDhSnRc1RcwXpx+BwTTK4UxPku35Tamm4kTwZb8lNhUclP71j8Ah7+QLZeUGIVaEH+xq3VT4qNCaP1BtgftbrEL/se2CqVXWUwIPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=cMQPSc+t; arc=fail smtp.client-ip=40.107.92.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="cMQPSc+t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yDZwYKGZUTYvbhRGwApsaerQfa8zTYyQ7AryBj2Xiwtb9uzrTVJLPYbKhkCVQ+gsFc3612AH90/JAdVQkaZIcAtLp7m7nqbc8YbOGFAsnRvSSM7Uv4qDxs0as2JfxTSdI55dwLORAigsyqQvRLEvFegq91euS5E+MPVon6qkXuZ3PsnMcpzuW5jokJSJASlDptALjwiJX3kzv7el9/tTo4lbU6NxaSYcg/TBuGdLaExHmXtRDn+sD3cXEH+V5wM2fsu6ZWpvQUiyHUF9n1IMJEPvBV80TiKYqzk/Bpc3mqo4aijiAXJGssToYxk6PYYEoYOS+0VQlp9Q4ySR0C6m1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hOB7DXFtUbWcspqxRt/YFkHhmtAeJcFqNxpyzoqBp5M=;
 b=aVOxLbz6w0dZBi599ST5R6b6ZsmFWGLKDvSZsVwY9sttf+gopKZxFcAHcDUGuqw8aDROiTjJS9z7jFsW51o8hXR4Cin01HBhtA+sMiOPg7f+xhO8HVD3eVfFyWkWVHz3BrMqZN0l7/oHAMktKgIUlExtrA5U1drV4h6cpJe2BX6idYZ3C6xgQoltlxEzgvqB9Em3xvqDcEFUk6uxnHzo6jNmRieStopsqOBkq8+5j/JOM1SpgXcpeT2APeMxaAjOL/3U9obbKVWitcjlAv5476gemA/Cj1fuWMfgOZNsDit/zMoWpYzvUl2eSaXXoI7aHLnAQTliV39RPMKE5PsUbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hOB7DXFtUbWcspqxRt/YFkHhmtAeJcFqNxpyzoqBp5M=;
 b=cMQPSc+tg4f0kaY6hFd5anLQ5CXG6myvfq6hCSdL/rV8ynHqSTO1nyw9t1u3H7CCgrQtKVJUE5nWqlLklhBe+lLl0AUiDJGUGguLMvDgODzlVGsui5scCZNz0SDZDKfOjJx1U0x8Wh2nWUQPi6+5v+tKbTxdnOoITO87+MvB3ek=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ5PPF0AEDE5C3D.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::989) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.21; Mon, 17 Feb
 2025 15:40:25 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 15:40:25 +0000
Message-ID: <b98b6e9c-65ba-413a-94cc-2d7a90d63648@amd.com>
Date: Mon, 17 Feb 2025 09:40:23 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] platform/x86/amd/pmc: Notify user when platform does
 not support s0ix transition
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
References: <20250217081720.107719-1-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250217081720.107719-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0116.namprd11.prod.outlook.com
 (2603:10b6:806:d1::31) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ5PPF0AEDE5C3D:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e94b03a-960b-4e78-7c10-08dd4f696597
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Vm5Gc01sTE9HS3hYekVIK1R5dDMrYVFYQWtqUm1sVDBPT3pUZDhHUXRpV3JL?=
 =?utf-8?B?Zmc0TVFtbDFEaXh1T0w2TUd4NzVoNzFySWV3b1VIUUNjektDTGMvTUZFdDY4?=
 =?utf-8?B?cVZ4Y2cyODVXRnlHWngxa3JIN0R6djExZ29Ec0dHN3pmTnBHS3BIaFhqNGZq?=
 =?utf-8?B?SC92NERJNEtEZ3dwMlVNZmRHV2pXazY1bGxrMXU1eWxTRTltSWFwQ290ZkhH?=
 =?utf-8?B?a1dOMk1iU2FQdmtQV0svcmRJb21vVlBraHpwSDY1dWlVY2crMkYrZUo0ZW9P?=
 =?utf-8?B?aW5FdEczTFVQSlV3R1p1YU40eUpGUDU0YjJkYkNvbFJKZEQvWHVvakhoSEgz?=
 =?utf-8?B?ejdGSGNtWGczbEk3WmhhK2IxQmU4QWw3bjJ0Mm9CYjlMWGFRd2FhRGhLMmo0?=
 =?utf-8?B?SUNlRHIzZFVBclJMekpCbm50MGdOSnF6UFJBYlprc1o4TXpPTzluQklyajNE?=
 =?utf-8?B?VWw5V2ZiWnBQL2VWcGhvbklNOEVJZGVQTTRCZ0RmOUNMTGxZL0FuaFg3UUl4?=
 =?utf-8?B?dFVETm92R05qVVFnODI5UVQ2clB1a2R3U2lZZW55bXBxSTZsRmpqL2ttVmlj?=
 =?utf-8?B?MzhVVG9jdDBVMkVISzBBMU9mSzZ1M3hDMnRCLzQwRU1aWmkrWDVwRHBLU2lu?=
 =?utf-8?B?ejAySHU2ZjFERXEyTlIwV09UMjE1QUljc3RqUktHTTNVZjlzSE9YTnllREtQ?=
 =?utf-8?B?aC9BNXRkOUJLLzY0MlNvQTFhOVhoUHZaUkd3MmhsUlp2UFROczB3TDBUNjlE?=
 =?utf-8?B?dDdLU2xrVE5sUjZhL0RUdDhaU0NWRWNXc3pTRDhveDFIdEVFaTQrUWRzc2h1?=
 =?utf-8?B?RzdMRUVPZEMyZDJRSkVYaXgyNHJzY3UwNmRtTnJHOFZTZ3I3SkRDT0Y2N0xw?=
 =?utf-8?B?eUh4UTI1ay9pdVQ4cCtFYjZ6eGR1aUczV3Q4blJ5U2JyaUtMTEFuQjA2U3Vr?=
 =?utf-8?B?YlM4dE5PT0lpK2twYUtqRHFNRWt0ejdUTVQvV3hhYXFqMUk0ejRiMmk2Zi9k?=
 =?utf-8?B?eVJpRW5KK3N5R29DVlhsVis4NU1uUDJ5TUNJTFpQcHkzcmx6aHhVQXpUNkx4?=
 =?utf-8?B?ekdQSXRJQUZmQWFPMWZCQXRCeENNZEZ4amFCNlB4RVRlYWhFRUs3eFdjSjRr?=
 =?utf-8?B?RG1oRTJhd3VWVVUreldvVlpORFlKQkwrd0NJR3lSOEdmc1JtK2d6MGMrb0VW?=
 =?utf-8?B?bnN2YllObm12QjdYRnlWbFJreEE2OXErYmIwVkhnek1JdGRzc0Y3V0VBOTJL?=
 =?utf-8?B?cXlKN3VTNVptNE1Kd3d6eG1BVnFrdGxKeFZyTHkycms1T3JEN21kSlZSRmVJ?=
 =?utf-8?B?VEVkRktoekRBUzBobXhYZURaMklVZXNGOFJ3ZUhGTzJPWkQxZ01KMWtJTlBQ?=
 =?utf-8?B?UjdWakJtRlhvaHhhTjY0Y0xNY2VDQ21HTElDQ29jVWxLTzNpNnVIYmNYdUZu?=
 =?utf-8?B?U2xhSElYWjQvd1dlNXFLM1d0RVpIdm1wdWY1NnFYYkdrR0VjeEY0cE1SOUlz?=
 =?utf-8?B?Y3A2SVJkeFBQUFJtbEFMWGRuamkzMk43MEdpV0hjQkg5NDdzbWlaaStoLzR1?=
 =?utf-8?B?V1BuVHUrYmE4ajduZWxLcHVPQ3h5bHNESUFnRDhCQTQvNlhxWldqRW90ZXNs?=
 =?utf-8?B?LzhxWGVXaW9LcmNEbFIvdFV6MW1YbW40YjVIL1JRN2xvVTluUDNtZjVCOTAv?=
 =?utf-8?B?aklrQmU0bi9JVjBpbEJWcHJMWDBKU1ViaGNNT0xtUEdrOFhUNmlBVG53ZXZ1?=
 =?utf-8?B?cHovV3lXeng4Yzhhci9RUmlsRmg2UlBuZFRCZHQ1UkJYSjk3cmZhTStyRDRw?=
 =?utf-8?B?aTloSmIwMEtTYnFNTHQ0MloxS0Q3M0dTWlhSUWNHai9Md2piZi9zc1NiQ2ky?=
 =?utf-8?Q?VuI0gTyd42QmG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVF0UDVSVXZUSTlYSVBQd1Bud0cwa0FkT1IzanVMb01RbDZPQ29pNzcxVk5E?=
 =?utf-8?B?NkZSSHBOdittbSszNU5iVmJVTVlvY25SYlo1MFdsZnZCTFkwcWp6YkZsNUhJ?=
 =?utf-8?B?SlFZNkxTcHg3R1c5YnZ6c2tnMUdxcGtDT2dlVWpIUnBOaTdIdDY4SVp4OEZh?=
 =?utf-8?B?cWpHL0VYam92dzhxbFU3MDh5MGc1S3NOWGl4L3pCU0tZcFdmK3VRU0c5YXpW?=
 =?utf-8?B?V0REYmJ3QUNDN1E4emZOU0p0OGdBc000SnJRa3I4bWMrdm43K3B1citDMVlH?=
 =?utf-8?B?RkcydXRVM0JoY0JuYTNDdEs2V215cDRrM1I3QWhrUnJEc2VhSmVxNWVNU2I3?=
 =?utf-8?B?VVRSQ2tyUTcreVk0aXhrakRVN2JDQkJEWkEvaTJSZnIzSzZXSzM5QTlRREVU?=
 =?utf-8?B?WFdzREF6L1lVdEhLMGsyQnJiU3JtNkJaYWZWc3RyVkJsOXM1U3lVS2VvTS9N?=
 =?utf-8?B?bVpLbXpldXdvcWdJTEdrdnRzcmlNYXhSQmt6bXc1bnRlUFhacXJYRlY0cUcv?=
 =?utf-8?B?Zmo3YmM3K3RiTTlvVFhoMjZnV3IyMVh5MXVDQWNtc0RrTmhoK1ArbVJjSmhu?=
 =?utf-8?B?YjllVTRFQ2c1aEo0T3IyaDUza3psZ1pBSktYbS9JSi9TMG9iLzdvVis5REI2?=
 =?utf-8?B?dDQ4dzhjRU5sbGpYMTNZV0V1bGdub1orR3hFTWFGa0JvMUQ0b3k0WjVBTzF4?=
 =?utf-8?B?OXhHSjFyMWtCMHhSaWYxYU95RHBxSWcxZFphcVhJdVBWNnVLWnZTUnM1SlRG?=
 =?utf-8?B?SXZZY1pIT0FyT2RjZnUzMkcyYmU4eDFnczFQRTh0Skk4bENlem1ieTZnNm1l?=
 =?utf-8?B?TXY0ak5naThkd1pqb0lXeWtsWW4vbHMybitFTzJIZzdUdWVtT3JUQUEweUQ3?=
 =?utf-8?B?UTE5amdxNnJTTzd4alhoRGdWdjQ3QUg1MTlrN3ZLaEtnRGhuMW10aG95WHZs?=
 =?utf-8?B?emNtVVIrMjViZWNxdklTd1lxdGhuR0FXNU1UZ3dWemc1cjdjOTdDcHdSWC9o?=
 =?utf-8?B?STdkQXRoWThvVGtqUVhWVDRwMHBMRGtUb1dYUVJkaDZRbG5ycUpmdXZ2OTE0?=
 =?utf-8?B?SSt3bVU5Q1lLenNuVlVDZGNJazJSR0s3TVgvVjZCWkNIOVdDd1ZiUlRKSTFa?=
 =?utf-8?B?Z3R0MjNSTmIvMjFSZytPYlR2NnpCdWF0NDN6bjcvVC8wSnpzOEZLWFhmUGVr?=
 =?utf-8?B?R28zK21qcTIvZC8wL0VpRjBTU0VMZzBOMk9JcGJJUU41VFJpamRPTmhsS0Ru?=
 =?utf-8?B?YVNXYW1ySy9xSjJnZVkrMEFiMTc1N3hNeVA4S1VaeVgrWnQxdjVkMmpTS0pT?=
 =?utf-8?B?QnZSdWRDZEN2ZnRUb2FOU1ZKK0RZclYyTmFiYXkwMXF3WEdyMTVBTzQxY1Z2?=
 =?utf-8?B?RERhNWxlOGtnM2FCbkIyOElxOFdtQXA0RUdhV2Y0Q3RjNnVickw1OU9saVdy?=
 =?utf-8?B?YkNLc2o2OUdMUk1ZNjNyTHYwWHYya3NlWi8vZFBiM21NVFJ3Mm40ZUFOcHNO?=
 =?utf-8?B?eVNtUWlBWERKR0FXOFNGdS9LMFc5cVBub2k3VlVDSVptZXFlTThzcVRqeFZs?=
 =?utf-8?B?VTlneXRHbU9zT3V5WjlneDQwV2tlOTRhc0tQMjlBOTBicnhVRUZhY0UzOHhD?=
 =?utf-8?B?M3NXM1VFZFdzVG91UnFFMXpJV1ZOTFdiUWozM3FaS1BmVVVQbDQyb3ppZ0RP?=
 =?utf-8?B?aGRhSkh2UWYyN0ZrRkN2anhnS3MxUzYvUnFYRWNodHVKaVVETmJVNU9xd2ts?=
 =?utf-8?B?UkMvQ0gvSDBwQ2tYb0RhWkNLVUprUnhmNXBndmFPclhtQjE3MFNmYXpaYlp2?=
 =?utf-8?B?aUpwdVZzTzlyTzJtOGZGMGJlTG43UkthcHpIdmpMVzJSSTVIa1k2bjFtd0Fn?=
 =?utf-8?B?TzZIWit1VFVzeEhUelBQbXplWVpxTWg1TnpTSmNZSEdLVFJaYXJZTUhZK2RQ?=
 =?utf-8?B?Q0FMbms0SGU2Z1pMd1hiSEpzR0E4U0ZEdVVCN0dIK3ByMHdVcDRCSi96WFh5?=
 =?utf-8?B?SkxuQmRmYnpjQWhnd0FGUlFhQ1FyaW15eVF0Q29za2JBUUVMd2ZSRnpRSk5S?=
 =?utf-8?B?TTdEOXNoMFRLWGxWU21KcTRPeEp5Vmk5MzE3VlQzNFJlUS9jTjlMaTFEV25E?=
 =?utf-8?Q?npBjNqnx6MxlfIDKW9A5WSQc5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e94b03a-960b-4e78-7c10-08dd4f696597
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 15:40:25.2557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gf/NI6+cE4qpZnA/NAy9cYOFBDZuCwZo37Ejj7O+i0dAJ1OImwrQ0Y5pToSISQiCByh6xk3jFYl1P4Lh1PaA/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0AEDE5C3D

On 2/17/2025 02:17, Shyam Sundar S K wrote:
> Some of the AMD platforms do not support modern standby, so when such
> CPU ID is detected, a warning message will be displayed to the user.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

This patch specifically I think should also be

Cc: stable@vger.kernel.org

> ---
>   drivers/platform/x86/amd/pmc/pmc.c | 3 ++-
>   drivers/platform/x86/amd/pmc/pmc.h | 1 +
>   2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index e6124498b195..c7c7afb8a431 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -808,6 +808,7 @@ static const struct pci_device_id pmc_pci_ids[] = {
>   	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_PCO) },
>   	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RV) },
>   	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_SP) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_SHP) },
>   	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_1AH_M20H_ROOT) },
>   	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_1AH_M60H_ROOT) },
>   	{ }
> @@ -832,7 +833,7 @@ static int amd_pmc_probe(struct platform_device *pdev)
>   
>   	dev->cpu_id = rdev->device;
>   
> -	if (dev->cpu_id == AMD_CPU_ID_SP) {
> +	if (dev->cpu_id == AMD_CPU_ID_SP || dev->cpu_id == AMD_CPU_ID_SHP) {
>   		dev_warn_once(dev->dev, "S0i3 is not supported on this hardware\n");
>   		err = -ENODEV;
>   		goto err_pci_dev_put;
> diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
> index f43f0253b0f5..8f39988ce7a3 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.h
> +++ b/drivers/platform/x86/amd/pmc/pmc.h
> @@ -79,6 +79,7 @@ void amd_mp2_stb_deinit(struct amd_pmc_dev *dev);
>   #define AMD_CPU_ID_CB			0x14D8
>   #define AMD_CPU_ID_PS			0x14E8
>   #define AMD_CPU_ID_SP			0x14A4
> +#define AMD_CPU_ID_SHP			0x153A
>   #define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT 0x1507
>   #define PCI_DEVICE_ID_AMD_1AH_M60H_ROOT 0x1122
>   #define PCI_DEVICE_ID_AMD_MP2_STB	0x172c

