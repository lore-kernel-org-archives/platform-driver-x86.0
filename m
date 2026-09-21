Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013002.outbound.protection.outlook.com [40.93.201.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3764E4C4C;
	Mon, 21 Sep 2026 17:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790010851; cv=fail; b=hGP7mPrxJAgIyDg9n3NaFfcSzRJMyTMsZF6uCMN3Jh0zoLwA2Rycg6L+ztGE4/k/FvKYz9NVxtt9bJFXUbwTNpzYY9kxIjCq8gpS+zeyCc2SnyP9FICmV+X5FKxwPQi64xmVuOXeGXXi8QlM4baaAU2+EpUiDtYglHFRUwPqs+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790010851; c=relaxed/simple;
	bh=R1F8IhPE3TCyF2R+X6nLR5A07M2ZGtT/5qBYjYydjAM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lhzUgeiZ94fgTsfzyGw1HvPuXQ285uNVl5H6u+yIy7rC7uvxtjZ0/vuaj6Ejuj0Fo99xxfcyhq+wNqgn/9aZJ4LvymcWfLN4C3IwtJIBxWHJeEXs8Xnb/U2/6uGitI3CFW4WMvk1nwgx9OG/5RrYVhLWss0zLDBA444mZodiiE8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4KAP445f; arc=fail smtp.client-ip=40.93.201.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4KAP445f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eVpa330uu12On/Ibc3dxJeoY6ehUCaqKV7b0alT0JAd2nfSNTOWoXGTmKMloP3Z2gxljaR0l9C2Hek8m/ZRruu8x1Qsnl1gihHwghrGIO21N6KWdIsVc2xd4uNjtJVM9ZgYQblDA0HteoOiFzw5k/DznbHbvRy0X5kYtGxZHIWa4puQhxCTCKLkHpAnzDJ+Y5bvzdF9j8CHIYplrdk5ixNcfnWqmmB/KCvrp5j7q3Zd9BmfRbmJmWdGRdmkXu9QUz9OhcavAhky4rVtld+nPhPXRW0QRLj8a8JB7yYdGMyDKhrrLZLGYZyDyxaKOjOCIClhKGnbVC9nayrOfEn2Kxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bHaCdVG+2/bZF3CfrUnNeFV/y4alCiif+m27bPjdNCI=;
 b=TEVS0WPxdIs7qHrblKBzU3Q0mnJ6Qdy+0Lvn5IVK2vfd2QdU+9mHz3/eW26M5J49wGmrQ3NcPsxFmsQCPz7453sn+n3LvBv/WMbdRAzeREWAaITv4oNzUsYWqnlEF98d3XfEiL7HcMJS9nHDf2mvd/0L2tAQpYTZPZrQI/mRAV4WkgT/bRbBDDLbQQdwC0iGdIHZ0Vdc4N4YMG7Ux6bBQ9CPktVip5zji04UIP793ibvWUVPHRK75Ny7PPqhsQuflfMfNNJ/t7i8HPdVTjsM1LWMrxTVL2mwTx/Y+52o5oT6Ft1JtPn8p1mmrDmqDbKMluamiKDnb0Q2dQLdCSi1Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHaCdVG+2/bZF3CfrUnNeFV/y4alCiif+m27bPjdNCI=;
 b=4KAP445f1BhK2Cwvq1SKoR0UC+JwshSqUMEMGru8mAkRPTajuLzK/zu1tmYztmBH8qP6jcY2NiML90R9DGO1LIV2/0KFfS3Fzc5LKJ2mH2IqGQ/8VtFSUbC2CWwADPBIJquJ6trezkmtPeg5xccL1q4Kd9cWTLbETDqrgFN6FsQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by CH3PR12MB7690.namprd12.prod.outlook.com (2603:10b6:610:14e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 17:14:02 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%7]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 17:14:02 +0000
Message-ID: <92a0c8c3-3db1-4252-9c84-9a91ca8681c7@amd.com>
Date: Mon, 21 Sep 2026 12:13:59 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Fix a few Sashiko flagged issues on AMD_HFI
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
 "open list:AMD HETERO CORE HARDWARE FEEDBACK DRIVER"
 <platform-driver-x86@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260921170411.1149960-1-mario.limonciello@amd.com>
 <d70bc046-49bd-79b2-7df7-57d79046c507@linux.intel.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <d70bc046-49bd-79b2-7df7-57d79046c507@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0188.namprd03.prod.outlook.com
 (2603:10b6:408:f9::13) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|CH3PR12MB7690:EE_
X-MS-Office365-Filtering-Correlation-Id: 073fca67-6aea-4171-1e7b-08df1803bb69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|11063799006|6133799003|10067099003|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	EYIk3j/291xUNrWC4k4Y74j2HCWsY3aOvKtiBBZWFdKHimnpVn2NVBLRw207Pc7C+96oG1yK7JFbj2wLb6cqaeJyOrRy2bKq7w8hziGvWuTodI9O/Bs+qt1raskLhkjdH3u85EiaqsKeQfzUQKMRZgOtJ2N/kynwo3YEQBFvilWH8W3eCx6vf3fHibTkV3gBosma5iIsuprktw+VqC1/77i7asaujPzJj2HvGmlzfcor9TOG5zV5ZvzsA8Fo1Ql26M/1yMaZbezbuoXXXHfSekSfkf6Mks+XzcC+1TZX0VQOzQImH13DP5yChIlmPN+nnQ4o8BVYtTrPC7J+7emFCVB0UFFlhNR7YJemFWr27EtL8e17v9pATKzv7hdJF6S8FRNpzWcxOYe09POn/SFtpAVFk1Ay/BTUpYo8laOLz26n7dqOBhT8osEILymuqMolAgvVmEQKJeSucP9+MTZiPA2rAuFJdax7hI1zz5rlmpGThqUncYPveLKcO1znNepzxCPOIuwX6BV+Rr90IUvBx6ufffWPcmpowWclI6zbmq177C6WVchVSfRcVmDflqoYAgrKvnjtGm1eu6tYyKZQzZnALp1fUxCGxMUVTFlLsQ2cKNfbGaEVQw665fm5bz7MXNb0g1XUzRg9Wx5l42VWAM8JglvYmIVgH4AWasMDvC8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(11063799006)(6133799003)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dU10NVV5V1Q0NnkrQVY3dEdIK253T1RtcUx5Z1FsY2xxRTBpakxJelAzMjlQ?=
 =?utf-8?B?L2Q2RFhqTHh3UkxibkRBWlVucFFlSDNxQlYwNENZWVN6UUNuTUs4RFMrRU9u?=
 =?utf-8?B?a2xMbDQ2ZXBRTmlGS3hubjdjS3pEOTB2TnVJTGtBYVIvMVo5RzYxYUhDUFVt?=
 =?utf-8?B?a3gxSkFnVFdGMWpJNXg0Z2RWYUFXMFNEVzZmSjZjdE0yS1MzUWNTN3dvZWRi?=
 =?utf-8?B?VTJvTTI2Sm9HNzZRcCthdHRjYitHOFo5NXpmVVd4ZmdIcUtJcDB3ZWdUY1Zj?=
 =?utf-8?B?OUY0N3prTGRqZENrUy85cjZzZVhFSVR6ZDBGek1qRXFEeWQrTUFrc1MxbTZn?=
 =?utf-8?B?ZElNOEQvUDlpQVBLZnk3T3I3RjR6ajdWVUFxNDRsN2gvTm94UmRrRnRRaTlq?=
 =?utf-8?B?ZGpwclYxYmZRaGduenJPN2M4UTdhSjVIY1paNnZta01CaERsbnhQZGVxZU1P?=
 =?utf-8?B?dWVmTmlPMUdkcmZPR0grK014NnNpbVNqejl0eGF4eXQyY3ZnSGZFVFZJZmJx?=
 =?utf-8?B?MVljUENDYnpVZENFb2VsVnhEMXo1S3hzNTJkYnJ5OWlIZ3RIWUs5ZXVvcER3?=
 =?utf-8?B?Mk5CZmZWNEZLM2wza3hOTEdtd2Z1Wkh6TXJIYThyU0R0aDdpVnphTm1oRzRZ?=
 =?utf-8?B?ODJmMGRFNzNUeGk1Nk9wK2c3VUVsL2RRc2lKTHowSHpwMndzZDNibUQ2RTRv?=
 =?utf-8?B?bEZhS2ZBNElIejM3VFRDTEt5Y3BmdFJyckxFd2thb0FnYjYvcnduSy9mOXZC?=
 =?utf-8?B?a3VPWnhZdSt0YVVVOVRsY0hGYVMxRVdLVlVPR3NpMkNGdkZWQXora3piU3NP?=
 =?utf-8?B?VS9vbXdkM2VlMTIveEsxZmVDQzMvM2x4TzQ1MFBJRzhMdksvY2EzUzhPNG5M?=
 =?utf-8?B?cG1Ua3FWdisxK0UxNHYrNGxmd2FnSFhabXhwSVA1QWxkdXp2VWs1ckV5K2R6?=
 =?utf-8?B?djg4S1BZSDgxYWhTU0N3cXJ4MVBEMXhyRlRTVW1rcTJlZ0VjYjJieWxiRU1w?=
 =?utf-8?B?WnN3TEcyVFk5TTdsYmt1Q2FlaTMzTTVYNlMwT2R0Y2E1NklFVHU4QVpBbUZp?=
 =?utf-8?B?WGl2eEd0MDdzV0ZxN3pyLyswRW4wLzZFQjBHRkdUeFJqVmxRRFFLTGx3SDQ0?=
 =?utf-8?B?b1JscGZTcHpad1JFYktqMEthVWNET0puMkJPbzRkTHdqVHFoaTN0NVc0bU5O?=
 =?utf-8?B?eTFtbzhGMHIwNFlTTGYzeHBiUzlOSlpzVTNBdzZjQXhLbkZOb2pOWDVYa1c4?=
 =?utf-8?B?Vk9uM211eVAwU01nclN6TGFMaWlEWXJ3UzdoZE1GVnU4YWdKUElQa0tSTG4z?=
 =?utf-8?B?YTVRWngwWUFxNndjZ2Q0WVRUM3ZrSXVLalFxbDFERDArSVRSK3lxMExkWnRK?=
 =?utf-8?B?djBKNEFXUDhxV1Jycnp1MTJNZ2kvU0pnTEFTWHBna2NGTWhCSEdxNFp3U3BH?=
 =?utf-8?B?NWdjUTJaY2JXQTVORFp4NC9ZZ2NOaENQOEV2T2FSZm9jcjQ4MUVzazB6T2dV?=
 =?utf-8?B?dVlqNXFobjhNMEwwT3VidkY0M1h2Y1pISVAyWlY2M3k2K013L0RqSVBsbUdw?=
 =?utf-8?B?eHpXYzVna0gzR09TUzkyUGZFOHk0d2t0Z3JQY0xVQTBUb3BHWlFqU1Nkb2JF?=
 =?utf-8?B?U21PbkNTbGVhYmJkUzVMeHRHbDZXY1oxZGNzdWEyYkM1bTJqVmF4Sk5CdHFK?=
 =?utf-8?B?ejUvNERKTUpGUFVNb2QvZHM1Nm9wZmh1NXNkb2E5UE1KRkhCNi84T2lsVGFD?=
 =?utf-8?B?WDE5SFdkT1FCS3oycDlycjB1TFBmL1MyQVRyRTN5K1VRbzJZazlhUmZ6TzU4?=
 =?utf-8?B?RS94ZTZsQTFHUlQwL3M3NXdzNGxxLzgwWWlTM29lSytjTks2aUV5U09BUmNC?=
 =?utf-8?B?MUI3VHhxUG9GVE5hYVNlNk1lek81Y2dZTE95OWU1SGEzcS9Db2hVd0htVzJ2?=
 =?utf-8?B?L2xlN0NsUllKMWY1NVArR3Vra203VXRvdHZlYkJPZUVkQ29tY21oWHlmRzBF?=
 =?utf-8?B?RXYycU1Xb01GQ1RtSmJrODQ1WFdiM2FWV3MrdkRncEZSL2hhU3B1M0tETVFu?=
 =?utf-8?B?VVovRnNBL0RLNkkrbk5JdFRzbFpNdyt4MTFwc25yZGw3a3JMKzBac015MTVx?=
 =?utf-8?B?QStCQVFSQlRPR3RmQ1J5dTJQTlpaK2xsMGVmc2xnUHlNN2ZFOTl0SHhGVlhm?=
 =?utf-8?B?cFJMbGF0T1U0MUZ6QUlYd05hUnR3WmI4U0xvVU1qb3dLSDN0RW9jWWYzK1Q4?=
 =?utf-8?B?djJuSk9EMzNIWlBZQjVXazZUVGxsa25rV2o1dU9PeWcxOTYwRnF1ZnFia0Mx?=
 =?utf-8?B?cS8ramNlL0FIbkVvbnl0bWlGVVE4VVVodktmWlpFV0RpWWhJWVNXUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 073fca67-6aea-4171-1e7b-08df1803bb69
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 17:14:02.1589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gfrycz1TyjBkKgNiwnqXChwDwPOunCSl2sQViFvZiqJ2LNR77SEl9qLJEwwc8C+tPEUJL6epvq6jWmeESXi7Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7690



On 9/21/26 12:10, Ilpo Järvinen wrote:
> On Mon, 21 Sep 2026, Mario Limonciello wrote:
> 
>> Sashiko flagged a few instances that could trigger out of bounds or
>> use-after-free.  This series fixes them.
> 
> Hi,
> 
> I suppose it would be fair to credit sashiko with tags.
> 
>> Mario Limonciello (3):
>>    platform/x86/amd: hfi: Fix a use-after-free when unloading the driver
>>    platform/x86/amd: hfi: Fix out-of-bounds reads when parsing ranking
>>      data
>>    platform/x86/amd: hfi: Rely on ACPI enumeration instead of a dummy
>>      device
>>
>>   drivers/platform/x86/amd/hfi/hfi.c | 34 ++++++++++++++++++------------
>>   1 file changed, 21 insertions(+), 13 deletions(-)
>>
>>
> 

What tag would I use?  The Sashiko URLs appear to be private (or at 
least I need to be logged in).

Something like:

Reported-by: Sashiko

or

Reported-by: Sashiko
Closes: <private-sashiko-url>
