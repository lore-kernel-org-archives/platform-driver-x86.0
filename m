Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010002.outbound.protection.outlook.com [52.101.46.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E7F3DB964
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2026 17:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790703773; cv=fail; b=ajwusUwA5iI2d7+B5WJhvn8X8uciKngwcswJB4TcZrwrDFJH9SvnnMw4KyNQVB1tNEa+MGa/FQM8TA13sj91WYYkiHiuy+8Jncxh9Kb6Ox8jN297cX4e+fDLf4bLmyONdbWUwEKXrh9T+qWY606LwUdE3fg5wHq4d7u/S8Un9mk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790703773; c=relaxed/simple;
	bh=+v32D06DeBBeit6/e8G31X2M+R95gWMjmfTgyA7M/AE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=M7mH4/TLuMsh9K7eMqiIAZUYyosGmyuxIJGI1e++xqW68KoVfFxzpcgNIitVw7Ay9ir14qqsJif0rKDdRZsv11OvuljISQVX7oVJE6orUEYwpDx5y4mHhC7tCqb+JDd2Ei1wN1cVpebGNenGtP5TPehcttLQVDyLrd3Pc9XW9Ec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=X9D1O+j5; arc=fail smtp.client-ip=52.101.46.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="X9D1O+j5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ipSnLRQSAR5gFz4wwBpK/vWhQVdOHtSoblj2iJTqt6PF2DdDbXtBgNFprPyJe8zdFy9N8rRBisufByzO14NwTfScABVHaLidHcmwcdBt/LWwJA9posPecIIX1LonBaQFieD2sCGHegXniU2IYBTRZBW1ebv35BMysME+wfrXWq8AeRRAEvKvW2e0vmYUvqFwX57N0aOqT18vRQNUB7rOCHrCO8m0+gOpx6rtCkcnXAmnJtT134vQKc+KmEfhx2H8qv5jI7cjv2kLQ9+l6lshvHEY9YshoaZOAPsn8IJ4/VkOB9ITLVG1Da8CHmO7vSIwcpFrqwRVMLX6OAURZ4g0FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CgJZVc8oyRLZkgPzwR8RFKSzmgwKNj1Trqo0nJUvFec=;
 b=aDv5zOCk8IeFf6ZzIXXZm9c5WrCeEfIfL5UlC37B9VLPPySgT/+wEv5shh8JnqjWmLuhy4LIFQi09+9ALSYezK4byMgwz35fS4q6v+6OcNhMgIIUmXkt5pAdd9N9A6y2uLuwGyLKGtqVdqfvPiDFIWvV6CMWeSs+smi0Cus5pZhyqK3UmngHLFnthWzeTKOnd1LCtAaJdx/9w6I11xuSCKnytel3vwSvHyq5LetIpfph4y+WAuKa2/oMmrmiAja/ZcFdigHX+kndCO86158FItgi0vgLtVvTfBNKBwOEXxkczGXEJV9eAB3cqwcvlIXPpgwtrdGeR/FpKw8MJRrKUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CgJZVc8oyRLZkgPzwR8RFKSzmgwKNj1Trqo0nJUvFec=;
 b=X9D1O+j5F4un/mDcSQv4/PNED7QsARMrioxtMWgW+egzVqO5vZTkrSYEIsbmBVSe4zXj9K98Htkc6rdCv5sCpIIIyK0RZWTHc0/+2cQtuG44brrRkZMjzIS4RrToaXHR229Cl22odVOARFUI051qc1XYM0Ybr8PHoaNaEmEqfNw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by DS0PR12MB7630.namprd12.prod.outlook.com (2603:10b6:8:11d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 17:42:49 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%7]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 17:42:48 +0000
Message-ID: <455753cb-8b38-42e0-837f-a8b8fd33093d@amd.com>
Date: Tue, 29 Sep 2026 12:42:46 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/pmf: Fix ACPI buffer validation in APTS
 path
Content-Language: en-US
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20260929160241.1718067-1-Shyam-sundar.S-k@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260929160241.1718067-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH5P223CA0004.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:610:1f3::24) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|DS0PR12MB7630:EE_
X-MS-Office365-Filtering-Correlation-Id: 5747c1a2-8dde-48db-28d4-08df1e5113f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	mVimfxfkTUaAIWdp92FXs9wyAF9m8PjcHuOvHFCXoSneM2dQQJqSYehbBk+op+npJ3e/eqmOsRqzZQyh6/uTAr2CCIVKb2dez+lJEz7W3pdLf1apxhZ5q46ASiFR3SA8G0FnbPwAYmkc3JDvqZHF6ip4DVeM8EPZhxOO4/wpm+J9w0mmx6hdLOH/0m9F3ZLjC4OJOtYgbi/3veEbjP1Lpd+sUUZ6lV02DuseKAMPB/4EmUjUUnFrf/iO+9imLaIqiQLTwdE/lepiDCxyE8iwxrET7lz2MGmRLL/RatIOxxglRev/XhWsDp8BSATuoVkYJzwQE1am7a3Ei0JOK1AF8EGeIc9Zvu3+FMT0bpbuJslJBWMIObzqZZFZYmEnW/A5dYMTFT3Z+H3fu5omgcWxdvLaMeWsy4HwT8MiNj7Em6SDjrOBkV9LWnBhU2sWX8JStJkwaMdQPN8MGRQ+lXweYjePEiDF4/7T3SFiWqPj31uuFdsR0mKcQYZR1ZD7rHQzEZX3rdkQuV2Oc/L7ttfbEnAakLKtRQsrIgr6iifpz3+7prb3LfuY++eea9ua5wMiEMat3BrNm8g5O+sMCIqHFKpcLG8JM3C4AgeieWxi6vLdieD8ogzufFbd/D5PGSMQH0tV6bsHBX855GoUULFa4piJC0aqmcAIOzt8UgqqV0A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1RaVWhqbHZPTko1ejNmR241RFV5dEI4WFphSHN4WGFaK2l2ZkViUzVZMVJz?=
 =?utf-8?B?bUVHc0hCMkJJZnZQWWt2dUhDVnBKK0pEaGladXowMHNwTThyTlNJNTVFZ0VQ?=
 =?utf-8?B?RHY2WVpadGRoRlV5emNxM2toSEVJWnVBWFFsUmZxWHVjR3NQai9DK2U3VGd4?=
 =?utf-8?B?cTJvbVVzSnJjWENVaGVRZE4wcDJvN0RYN01scEtOU1JESlh5b21IaTJCWGVo?=
 =?utf-8?B?UzlvcVQ1UmJlbXl1YWdIMlFxYkMxaysyUWVlNEZPOUZMc2I4RUN3NlhEdW5t?=
 =?utf-8?B?RjJlcVNoREh0ZGpPM1UxQWdmRWszdEpQTW9Fc0JmZGFqNGJEOVpwVExRcUlR?=
 =?utf-8?B?RHhoYjFOdVdXTGlGV0NTcTFYRkxkZjlTeHB3QjlQd1dRL0hjTjFXZFgxZmNk?=
 =?utf-8?B?ZVRpU0UrUTRqZHQzMUw1c0xhZHhxSmNhTThFNCtFY2hhSDdqUWE3U0RveUJS?=
 =?utf-8?B?M3ExWW9Cang3Yks5UEU2UlB1OHBOVGl1bjFFei9GNlhER3FnOUdEcUF1T1Vl?=
 =?utf-8?B?S3ZTbFZKVlFPcXJ1MUpQajYxZkhwc2wyRXJ4eFNTbVZmd2JacmJKdGhFbE1I?=
 =?utf-8?B?QXc0ZVFWMHpCYTBZWFFoQVNWNkM1MUNZa2N3QkpRMmJteFVMN0Rnb1lMMStJ?=
 =?utf-8?B?dyt3QkwvQ0lYNW1tK2dUQldWeFFGcFFwRlYwdEFwaHhPcGFKRzhIYUVYWjl1?=
 =?utf-8?B?VHFkWU43dENlRjJVQU9uakh6a3RIZ3R3c3pzOC83bS9PbXFXeGI3RjRMU0JC?=
 =?utf-8?B?eUc2b3RnK0NJdTU2ckordDIwMnd6MEpRZjhjN2Vacis2aVB0SnZsK2dUTXd5?=
 =?utf-8?B?YUhMczY5VG1mSVdkL0h2RGYrZzIzQXRSZEplNFlhczNMRjlseFV3dDFMVHlY?=
 =?utf-8?B?eFM5Snd3b0NDMytubUFha3NTcngwRjFoOS8zd3JNWDR4L2Z5REt3ajN2L3N4?=
 =?utf-8?B?YVUvQ3dEZVBkM1QxUVF3bE5ZMWFXRERabGJEMWtGTlZjNG1laWVQVnk1UGFF?=
 =?utf-8?B?QW5yb1ozaG1mL2dRTWd1SmVkNGVXcWQ0L1FDMmlvNDlCYUV0L1ZXTjVBeTJF?=
 =?utf-8?B?NmdnYklkWGUxcm9qVXZpSGVxYmdSMm02c1VwbW9lSTkzUnBxQ2VjQS9MQStl?=
 =?utf-8?B?RmZZVmRIRUVyUkJkd0s3NnVhdjVjb2cwUWU0c2ZGZGc1VWpaRVByc0pPUmU1?=
 =?utf-8?B?ZGhGTFJYWDkvU3loUmVzOGJTZ3ZFZEx1Kyt1S3cyMDVIdFFFQy9tZlVJRXVa?=
 =?utf-8?B?RTIwSnoxdEYzTENMRVFmZGxsaUV2UWxFd1BmQWxPcm5VVEtIQ0piQlYwZ0l5?=
 =?utf-8?B?ayt0QXI4OGlLYUpza3k3WEZtdUFMVXRaWERIWUFzZVV5WWlvUWhKN21BbUty?=
 =?utf-8?B?T1RtUm40eVY5U1VHa3dzUU9GbkhBdyttRmtvdUJIRmdJQUx3UG0zUkxxekhS?=
 =?utf-8?B?VTFPb0tzSUpaenNVVDYraWhNdk9RSU5pK3ZkdFAwSGtlaHE5SlBsdXNFSm9U?=
 =?utf-8?B?UUpSbXhhaHNwVzcvalVaNTVUYmhhT2dlTThtQzNDclVPd2NHc0VYdDRzSSs2?=
 =?utf-8?B?NzNKTi9QQnNDYWRPM3V1YTIvSE9pdzJPZllLTXhMR0pNZ200UU9kME1VVmoz?=
 =?utf-8?B?ZklRNmtZQWpJN25VbFZBYnFUc1QyNk9Vd3RFT085MVpZeXNvTmNsVUhjRG5Z?=
 =?utf-8?B?U1ptbkIrOXAwQ05EVFkwYk5YY056WFBaWk41Z1dwRllBeTFvTGpoNXZhNnRZ?=
 =?utf-8?B?M2R6R3dHek9Ud3pOVUhyWHFndFIrY3R6MExKZVpGODRYSDh0UFcxWmcvakFW?=
 =?utf-8?B?cVpjRlkvSS9Yb3EzLzM1emthZFYrQ2c5NjdwL28rdlVpQTh3b3RMWld0VmtP?=
 =?utf-8?B?ZEVjWkJCbklGaGIzTVNpcVhlTGg0K3VZK1diNE9VL2RTVVpNNFR3WTIvSUVI?=
 =?utf-8?B?ek1LYkRXTGhKVWJDNnZ2cFZVV0ZlZXRicDdwbEpoQ0ZxR2hkTUdkK01QeTY0?=
 =?utf-8?B?c1FWWUlVK0N1cmNqUlp4cWgxNGMyc3h1WURkNEFuNlp2VURHejRCanZnenRC?=
 =?utf-8?B?QlV0ODRkSTkxNG5hcWVqTVhXeEs0TXZ0SVp0bmdiZDIxaWl4SmF2eS9pTkhu?=
 =?utf-8?B?UGk5bDE0STZ5cG9yZU1pak93TlNyQWhTMi9pcCttMXIxS1dGY1lJbHk4TjBE?=
 =?utf-8?B?NkR4MzJRSWltRTkxUmpORU9RS2NWaXpBTjVmazg0dkNyZjBNMFZKM05pYmFx?=
 =?utf-8?B?eE9ZdU5yR1VRRzZaL3VGUUlvWGVYb0wyNFVuOXd2RWVDU1FHT2dPdEkyakxC?=
 =?utf-8?B?VG1wOVl6N1BGeXNjajdVeFhRUWtQQzBtZ1hmbDNTZXhjS2d6c0w5QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5747c1a2-8dde-48db-28d4-08df1e5113f1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 17:42:48.7585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 82GeXEtl11T5F4LBhZA6gSUncsBCTscj5TCPJYdFigRKDGQ17YaKQM080uQ8HoJoOg82GyWUowFDI/8jVxtKHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7630



On 9/29/26 11:02, Shyam Sundar S K wrote:
> apts_if_call_store_buffer() reads a u16 size from info->buffer.pointer
> without checking it is non-NULL and holds at least 2 bytes, so a short
> or NULL firmware buffer causes an out-of-bounds read. Guard the access
> and return -EINVAL before the dereference.
> 
> Fixes: 3eecb434d7f2 ("platform/x86/amd/pmf: Add support to get sps default APTS index values")
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>   drivers/platform/x86/amd/pmf/acpi.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index 3d94b03cf794..c820a5da77ba 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -138,6 +138,12 @@ static int apts_if_call_store_buffer(struct amd_pmf_dev *pdev,
>   		goto out;
>   	}
>   
> +	if (!info->buffer.pointer || info->buffer.length < 2) {
> +		dev_err(pdev->dev, "buffer pointer is NULL or too small\n");
> +		err = -EINVAL;
> +		goto out;
> +	}
> +
>   	size = *(u16 *)info->buffer.pointer;
>   	if (info->buffer.length < size) {
>   		dev_err(pdev->dev, "buffer smaller than header size %u < %zu\n",

I think it would be a good idea to be consistent with 
apmf_if_call_store_buffer().

Either add the NULL check to apmf_if_call_store_buffer() or only use the 
bound check in apts_if_call_store_buffer().

Would a helper they both call make sense?
