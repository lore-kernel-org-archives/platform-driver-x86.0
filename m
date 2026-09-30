Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010065.outbound.protection.outlook.com [52.101.201.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECEF3644C1;
	Wed, 30 Sep 2026 17:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790789312; cv=fail; b=ZU7p5QL7qTACaW2+LbYkU7d8nhCVCCabUX3VBGwiVQeZU/c2DWDd/kqHNN8Ohr07VGB06sTGQ6Qk8UnkM+zpo7XVghi1gf5uwINo3rzbh4oNfozXwDHiYKJJ5sITsgMe/ujjCo1kciO/Vti8CWdAN14fXmwJRvUDrTqx3VuSv4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790789312; c=relaxed/simple;
	bh=UpAgQYZd9yC6xY0WTrfU86OuMS/0yfrGHjR8kYIN4oY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Dfdqm0suvJKdMIFghbNYseKRw+i9TTYYzMsQo8vbpOqn0RS4O8JL7Fv3bDKeZd13iHRt/2/hvnosDZbWHun6VWHNuID+QG5jcJtZUuIzOChl1GsvDG6ir4wYFjtuPgNnuBixMkNfj28ngR9YW1fD0s4AcdxJ9s67Xvt4qS3FkM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TzSgYh3b; arc=fail smtp.client-ip=52.101.201.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TzSgYh3b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jubn/JyVx95d4jEKorebyWFKz1cnxmM7yvLuelX38wgy0TNTfWFoufZYme2l5bIeFT6cAIHFk/SuMxhzbC7SI6jr6YcmA33KtRpR+nroIAC2x3mhYUi+ixJT/aCY/a/P7/qO+6wy1L9qokH/yW0534yCzx9NNxBOm2/hNkf4aOFlkfK1qwWFntRSSGgL9SOe2PxyUvmNbsMXxzUr4jGUVdrY0UU/7EG8ywZIOBcTx/CLHWrT8ZDItxWZw9LZO8bJytYqEn2Q8B+r9tf2c0bvdKDgr2oE2phv0bLOZ+xHd0KmXH1peI0GvboXiduFK/AIQnp6hfBepOqOuVPmp3+XsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0tBX372vpEzX0dHzkH/Dvi5IILxzi6UZ9gwyXFjqtqQ=;
 b=A3Isrlin3fINwilvkEYZamFEZJ4HT4GlG7a+CUdd/SLkCxoIzULc3HZ5HaTxrkmmw2YcYy1LR2xUiOh2ujY5glXanc9gQjkO7GrczfNSLPrTILS4lEZjzVulIlqRENS7hNFzudOy9e7n7mrvHtGGjTh5MAQfb7qGJzOHs6c7P0/T80oAReVoFEbwAvRrH6pdp8zNMJPe0/QACOdAPMlBiCW1WJ7lApJ+OODqphnNmNqJ10tZZ2Rh1KBOKGTqk7YFLbL1qQYnIeG5JSojtRmYdhHVOY/+bAJEiM0+Iqbcvpw1A/wrwBXdUsCb5PycFL5bFkIex9K9kapUIwXkOrPXog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0tBX372vpEzX0dHzkH/Dvi5IILxzi6UZ9gwyXFjqtqQ=;
 b=TzSgYh3bOP/nJ2CtHivNgPQVekk7NEAnBIW/VJlRTmHIG31xmAiBTSJaocYC8g1uPx5WQXuv7m/h2zabJ6EkCGTvQ7SwQAqI0J/AuWyWhqJqzwj0OCWjVY5hRxS8hCHNrcZQpxJhJKFqAbv4kd7Y2SO2XL1E0NPv7LSiXOKoMto=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6717.namprd12.prod.outlook.com (2603:10b6:510:1b0::20)
 by CY1PR12MB9673.namprd12.prod.outlook.com (2603:10b6:930:104::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 17:28:24 +0000
Received: from PH7PR12MB6717.namprd12.prod.outlook.com
 ([fe80::3b23:bb4a:e507:c6ff]) by PH7PR12MB6717.namprd12.prod.outlook.com
 ([fe80::3b23:bb4a:e507:c6ff%7]) with mapi id 15.21.0451.024; Wed, 30 Sep 2026
 17:28:23 +0000
Message-ID: <7c8cb2b9-b44a-4f91-93eb-daa55a498384@amd.com>
Date: Wed, 30 Sep 2026 22:58:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] platform/x86/amd/pmf: Clean up undesirable function
 outlining
To: Rong Zhang <i@rong.moe>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Sanket Goswami <Sanket.Goswami@amd.com>,
 "Mario Limonciello (AMD)" <superm1@kernel.org>, patil.reddy@amd.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260901-amd-pmf-fix-outlining-v1-0-b54ff94d3d45@rong.moe>
 <d3ed3f2ac2e8ed960e0bc9b86d4732a75f1464e7.camel@rong.moe>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <d3ed3f2ac2e8ed960e0bc9b86d4732a75f1464e7.camel@rong.moe>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0101.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::6) To PH7PR12MB6717.namprd12.prod.outlook.com
 (2603:10b6:510:1b0::20)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6717:EE_|CY1PR12MB9673:EE_
X-MS-Office365-Filtering-Correlation-Id: 29c25ab6-1cbf-4ac7-e196-08df1f183a7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|4143699003|11063799006|10067099003|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	2hOIylV3qz4pLG8UE2PRj65cMpo19bgtdTU82f2GMtrRo4qkwZ1osfkjRhq1KEpVrRRE2RrlpKonOtvocgIU0O+yP0QkAHUMgdfDrfYQ00l6trVc/w4VBc5H88I2C4McS+1FUhJxEZZHjgGaUiiFCj7SiZQLYRrzvHNObH/WOQi3BB2G29pgpkT6wcw0Lf32RsWeYQmL/xLTTGfYb0Ci7ngqo6GDLnUaBVXmk2zuFuFLhQzcf9XfAbwpoMut8EwuzevjM/4hUtkWAo07BthjfIXXV0RLtb37VFneVsd0Dpnia4rhmWPNNBqCzeWze+wwdjJUaV68AGu+WEFWsx0pjRvDY68ZHNCX5kMrDXUZ/Ft07J37RxiPLoMceJfBwz7VmVc3e/8Pf5O8VpyE0C/vuWPWsB45Kejxi8uaxMBcsarA85zUwErS4hoK7QDBRelXAV1pMomXu8H/BuuKBJwlgNQizGWH8zKEYvLit45zlOndM4SL9xj8AaV60lqmigygKlWgvQX53yaOMcbJQQLpslkUOktNrJYw9f8q/0H/iCFNlSL/RXIfT6ZxH1J6wRXvt3RJUwqGogi4yeLqBV1uWXX4VNbZW/d/Oo0cStOxYgs7S4UKvWEDAOtkgvjN7SggPZMZ8rYdD9BcgQR7/M/5mklKqoiUi8XLY7KgR2AQwYo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6717.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(4143699003)(11063799006)(10067099003)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUltcEwwN3JHeUt5eHNsU3VrdFZ5OEl6UWtyenhsZDhyb0xsZ3BucnErMUE2?=
 =?utf-8?B?bE9Bc1Q2Q2w1eGdVQnV6QndLNFc4U0RVaC9tVTkrTXFpZDlVNVArYWNTMFpq?=
 =?utf-8?B?NENJbENQd3RUazd2bCsxUnVGeG9wazd6WTFRTEJiMUs4L2xzeGN3YjRvOFVF?=
 =?utf-8?B?OSsvVEE2NG5PNDY5akNHSXRXS2NGSlkrMEVPaG54bWtlWlJLRjU5ZmtOSnVN?=
 =?utf-8?B?UWxOdDZTV2U5ZGh5MnF1SFdsaWg3Tno2cjh0WjFrdWVpTUozWGw4M01vSkty?=
 =?utf-8?B?U3pHWlUzL2lsZTBXQzhYUDV6cExxVERia2lJRFRzclRNSVRvRVdmS0VDYjZU?=
 =?utf-8?B?NUZEL3ZCanpDOUo3dFhpc3FweCtHQVU1dWZ6OWNia2s4cWRydk0rNkJGNDBk?=
 =?utf-8?B?cWRrMWlhUUp5cmN5MmVDckdKUUhick44emZtWTlONUU4czNWdVdrT2pMcVYr?=
 =?utf-8?B?RW4yOHprVUt1cy9zeXY3V2s1VG5PeFdTMDViZysxbVNmcWxvdHBSVDZocXp5?=
 =?utf-8?B?YWF4NEsxTzlTcFN6SDJZUk94TFkxeDRKb215RDlZMWFibHF4Tzl2THJGcklz?=
 =?utf-8?B?T3hYOWxUMk9DK0MvNFNIQXlQSTZlNHVHd2xuUkZJdG9xZUY3WnlPYXkwZEox?=
 =?utf-8?B?ejBZZGk4c1Ixa2VHd1UwK1dvSU14aGRoZCtmMzM5UlNCZHAwUmJOcEY2WVJz?=
 =?utf-8?B?OEw0aWs0b0lvZlNNMHFTRmhuRlZyQ254U2wrOWg0SnNCZjFEQWdQbGVERUZu?=
 =?utf-8?B?UGtXMDgrV3FtZFBmRHBDV3lYLzE0N0wwcGRuVnp1U0szVlFNOWs5dngzRmlZ?=
 =?utf-8?B?cHpHNTVRRFNHcVRoRXdRQjcxL0Fhdm53ZWtwUVoycWNPV2JKYWJKdnREWXdW?=
 =?utf-8?B?REduV0dBZ0pFUFdkSm9UTUNBdWFQWmgvMkdZU2h1aExVZ2RReEtGUHRXQS81?=
 =?utf-8?B?c1NPb1M0QWowRkJOSURTREpESzhYamVQbXk4R1lxOEIwRkNoRmN3dk9DQnFR?=
 =?utf-8?B?ZEV6alFyN0FCVStIWFprUUhWUVFVRk1WS2ZycnNsVFFic2pyZU5yVGkyTzVW?=
 =?utf-8?B?S3VWRjVhaDN6bGlMQ3YwNlFyNHZYT0pZYXFXTUhLSDRtSENwbzNYN281THFJ?=
 =?utf-8?B?czhoaGVVTnZxN05GTEFsTDZETGJpVytGUjRScHkwVVdneE5GQkZZbnYzeGU1?=
 =?utf-8?B?bi92SVpta3Joa281eGd1aWh6QWZzQVIzRmFCVVJ2dExJM0R6bjJ3ZlNVY0d6?=
 =?utf-8?B?MUp3ZW9MUTRaaGdzalNwK1lPcy9vVFgvNEZOc2YxcUdLM2h6MDVGU2xXbXpu?=
 =?utf-8?B?K2I3b3BwVkRYc1Fhd2NBd2dOaGNxOEkybFlkQVQ3SFc3V1YvRFF5TnhQbVlP?=
 =?utf-8?B?WThQTzQ0Zy9UOUZnUEJyYVlPdjF0T0Z4VUVmQ1FMTWZ1ZXI4MndLRCtlbjU0?=
 =?utf-8?B?RFhkS0Z3Z1BwYStiKy94NG5IeHFlUmh2b2pCTUZ5Zk1ndDNTanJEZVpERGRo?=
 =?utf-8?B?RGFoTlRhdUhsMXdsdjEzMjRrU0xXcXh6eWlOU2d2RVIydlJyRDM4RHJXU2sz?=
 =?utf-8?B?UzhtUjRibDhCdW52aTArMjlOeXhkMmlqT2pxWE9rVFF3RjFoNWtwRlQxT3l1?=
 =?utf-8?B?dWtEYzZ6MG1lUHBHbVZmOEtER3l5a3QxdUUzWFZySFBYRXNFNWpNMnM4dC9u?=
 =?utf-8?B?Y0tQTTBCeDlKWFhUTXU3T0oyeDE5U0hoVEtiYlVXOFZwM2Y2dWp3a3lRWmpn?=
 =?utf-8?B?MHR1bUJYRkc3YlR4Qm95RTFUY3RrRHRtMXRiaVRCK2U4QnFXbnkzdi9wVGo5?=
 =?utf-8?B?aHYyaEdtdFhDd1NHRC94T3VPSnJsbzNHK3gvcGR1cCs3a0JiL2cySk5SaDEx?=
 =?utf-8?B?MzE3ajhUSHo2UVB4TkZMQk95MitxOGY1V2dwK0JDY0l2c2F5dC9iQXdhOVVh?=
 =?utf-8?B?NTJMeXhHc1l0UHpoZndsYkJPMFR2eDJGRHE5TWtOWDY4NE1uZ2pESytwRG1x?=
 =?utf-8?B?SU5ZUGpNZm84MUpvQTJxZ1lBaURudGpMUnF0N3BURFNZTVExV2lwS2kyYi96?=
 =?utf-8?B?dEQvZWJFNDRCSmFZWklBSDBWMGZXc2NNYXJ5WU9oWXZSejU0c2lSdndHVFVE?=
 =?utf-8?B?SXg2WFVrTDhIUXo3R05kTWdTd01pdnZFOERrWnR3dkYrQ2JtblVXdXkzTWpT?=
 =?utf-8?B?bERra3BGQm1JVmtZMVVoZGlncmNPQWVTREl4em9JRnlCbFM0bDMrZEhNN2Yz?=
 =?utf-8?B?c1AvUVBPZXR5T3B4ZjJXaGRjSlJxV21ObjB4Wmk2cFcrYWg0NnVrNFJJVVZv?=
 =?utf-8?Q?c4t/ecwloHGiAe/fM0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29c25ab6-1cbf-4ac7-e196-08df1f183a7c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6717.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 17:28:23.6953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T8S9eYfaaHWUBkeHlGYbQdoLb7+ZQgKxbHZDyNJr4c4Uh2St8iONA3d1TnPw8Kw6zo8NBAKX0GtaqOyBvgR1Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9673



On 19-09-2026 20:48, Rong Zhang wrote:
> Hi all,
> 
> On Tue, 2026-09-01 at 23:02 +0800, Rong Zhang wrote:
>> The amd-pmf driver is notably bloated due to undesirable function
>> outlining and linkage. Simple and dump helper functions as well as
>> wrappers should really be static inline functions instead of global ones
>> from the very beginning, or else they are prone to the overhead of
>> function outlining and linkage, which bloats themselves and their
>> callers.
>>
>> The series converts all these helper functions and wrappers into static
>> inline functions, and shrink the module (!CONFIG_AMD_PMF_DEBUG &&
>> CONFIG_AMD_PMF_UTIL_SUPPORT) size by 1472 Bytes (GCC 16 -O2):
>>
>>       text       data        bss      total filename	(before)
>>      26810      31672       2768      61250 amd-pmf.ko
>>
>>       text       data        bss      total filename	(after)
>>      26046      30964       2768      59778 amd-pmf.ko
>>
>> As for CONFIG_AMD_PMF_DEBUG && CONFIG_AMD_PMF_UTIL_SUPPORT builds, the
>> module size is shrunk by 1187 Bytes:
>>
>>       text       data        bss      total filename	(before)
>>      34593      45500       2784      82877 amd-pmf.ko
>>
>>       text       data        bss      total filename	(after)
>>      33988      44918       2784      81690 amd-pmf.ko
>>
>> This should also optimize the performance a little bit theoretically,
>> though it's probably not very important on modern hardware anyway.
>>
>> Signed-off-by: Rong Zhang <i@rong.moe>
> 
> Gentle ping.

Thank you for your contribution. Series looks good to me and I did a sanity on couple of
platforms as well.

Acked-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Thanks,
Shyam

> 
> Thanks,
> Rong
> 
>> ---
>> Rong Zhang (5):
>>       platform/x86/amd/pmf: Inline !AMD_PMF_DEBUG stub
>>       platform/x86/amd/pmf: Inline simple helper functions of Core Layer
>>       platform/x86/amd/pmf: Inline simple helper function of SPS Layer
>>       platform/x86/amd/pmf: Inline simple helper function of Smart PC TA interfaces
>>       platform/x86/amd/pmf: Inline wrappers of ap{mf,ts}_if_call_store_buffer()
>>
>>  drivers/platform/x86/amd/pmf/acpi.c |  76 +-----------------
>>  drivers/platform/x86/amd/pmf/core.c |  22 ------
>>  drivers/platform/x86/amd/pmf/pmf.h  | 150 +++++++++++++++++++++++++++++++-----
>>  drivers/platform/x86/amd/pmf/spc.c  |  15 ----
>>  drivers/platform/x86/amd/pmf/sps.c  |   5 --
>>  5 files changed, 131 insertions(+), 137 deletions(-)
>> ---
>> base-commit: 9ffed84a24d60ec506d8961fe138f0baa92fdbd0
>> change-id: 6f1861db-amd-pmf-fix-outlining-204546e884cf
>>
>> Thanks,
>> Rong

