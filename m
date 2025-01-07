Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2084.outbound.protection.outlook.com [40.107.212.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122681F9ED1;
	Tue,  7 Jan 2025 21:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736285461; cv=fail; b=VJlPlvcg4F5Bh5QUCa9fKNLD7rP5AsxhAY2ADwmFbA9hdupdkjL+2AYiaaOrRcYZhDcJ1QOM8Uf4X0Arjz8+g+U3TZyKMheNVy+mnUSSyvwArov+m8j07bRh7qRnTvKjfHB1kmKgBKMrX6jiA4ybkaIJufEZ9lc/eTDLyxBJT4s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736285461; c=relaxed/simple;
	bh=XPFFi95ygTLyVH/vyXlkY1kKr0jKWfcCBFhGJCcwGJI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=X9IBuaIDH8GCjk2AGb+fimjClu+J6xLTL2nZbVNywaKLbHxCgRom5UKvX3bOuysmUWGLnm9cNPhEN+qneS7xCP5Hu1P92GajCIiNyxNQPd67QnL06D2DzLIEXLHRP0h+G+8rOldx/AtRoGMB8lID7rEe8MD0ix5BdmD/Bclqp0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LDLiMcqT; arc=fail smtp.client-ip=40.107.212.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LDLiMcqT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l71A+Apeu9DujrwH02+XXqY41cFrDzV7XIBdFJgi16NY0fhWE4ZTiICY19MHF+9K+OCyOy7k7a61wn2toSqE+qO5Q9FmqKudkznUF0t47Je4+EK/c89y0RjnMveFbzVqftPZKpV0rQx+6gvu8VZNtXDj8UAfCtQc9chHLvQGbn6yksAgYpUNih8lhvofPJVNY1nTP75vqwLId/a2s1aWK1k8Qty31weY/KMMfUC0qH9k3epEPg9+UAfCNNwZ0o6YMu6ULCP41UzK/FunJbTtGPPNqxLT3YYkKbSbNaMTJkTcn4gJfDIPTE7Gssh+ziuc8JAq/c75qJlkAZE9h5U44Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+AdrMza2lmeukSjslio7UoTnkxQye2ui0Imcs917kYM=;
 b=qYpLmqoolqMuI/+mvvbFN4CermjVoXU06m41w0hVNd9rIVDkfUzkkl2EliQLPd5nFGLzms5uR5a/vhh0bd6b4tVZrIgTc3fqElkuWqGOhCP2rkAwxMBT/x76UxTnpqTfiY1COxICwfhafQCIC4oURflBpAOjjLk+AMVdGyirPkSrQTTDtN9q6pNqnKySTTzNCLeVfAmuZwFgZQE3w0a590aeLMInyfTt/hczjN7K7nQwzN96nDV1IMaOqualoqrHw9GLl+MDpQv1Ap3bPNS6Tmhrpf+8U918L6vrOcu8Bs23VISn8/NhiWyy/vGWGCxbImc/DnDNcULRcqeTL4HXLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+AdrMza2lmeukSjslio7UoTnkxQye2ui0Imcs917kYM=;
 b=LDLiMcqT/1s5b8IaUTMjdEQFagI5y5WxtgCag6ABkANSy9NiGSd1El86E32f2jb+emO0VG2rV5KXym4g2DLFpflIG+rQzuIEcRhU76X5JHI7t1yim/7BNYNvOVCcOGrS0aksATmiYDdfq4qtEZTFqiACMr4VbvdBMhgN2rdziUc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6108.namprd12.prod.outlook.com (2603:10b6:930:27::15)
 by CH3PR12MB8971.namprd12.prod.outlook.com (2603:10b6:610:177::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Tue, 7 Jan
 2025 21:30:56 +0000
Received: from CY5PR12MB6108.namprd12.prod.outlook.com
 ([fe80::46e5:5b51:72c3:3754]) by CY5PR12MB6108.namprd12.prod.outlook.com
 ([fe80::46e5:5b51:72c3:3754%6]) with mapi id 15.20.8293.000; Tue, 7 Jan 2025
 21:30:55 +0000
Message-ID: <467a5436-8be7-44cc-9659-e105c4833606@amd.com>
Date: Tue, 7 Jan 2025 15:30:54 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/20] platform/x86: alienware-wmi: Improve rgb-zones
 group creation
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, w_armin@gmx.de, hdegoede@redhat.com,
 Dell.Client.Kernel@dell.com, linux-kernel@vger.kernel.org
References: <20250105153019.19206-2-kuurtb@gmail.com>
 <20250105153019.19206-7-kuurtb@gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250105153019.19206-7-kuurtb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0065.namprd04.prod.outlook.com
 (2603:10b6:806:121::10) To CY5PR12MB6108.namprd12.prod.outlook.com
 (2603:10b6:930:27::15)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6108:EE_|CH3PR12MB8971:EE_
X-MS-Office365-Filtering-Correlation-Id: cfbbacf4-22d7-4024-3e53-08dd2f6291e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?clZyT0NMc3B2U0pOUDkvY0RNM2ovT0F3Zjkza1pXMXcwcWVnSVF5cllXVmVT?=
 =?utf-8?B?a0dMKys2TjFYdWhNWVhxblpoUUFFWFc5ajRMRzlkdk1ycFM2U25tNktabXBZ?=
 =?utf-8?B?UHF5QmpCb3cwbVlGa1FQUjVkcWo1YjRjMzFHWUFLZnFVZUlPd2hYcjNiVHM5?=
 =?utf-8?B?TFZJTWxMMnR5VEpTTmVUaVdDZ2Q3Zjlvdm9iZlI3amMyQWJiNElxdDNXUmpO?=
 =?utf-8?B?d0x4MUZMTzkwU1R2MVBrNHJSRlFUUkxaanlpcHNBbWpvRXNsZXVhUGQ2STZt?=
 =?utf-8?B?Q3ZuOFNNTlFFY3YvSkRQdG5kcXpOQ3gyNHdCZGpRMVErYm13Z3VqMEFZRFJw?=
 =?utf-8?B?bm84OVVteFdzazRMZHZuRXViNFZyMUUxRlRiSTRjd01HcnJtaWZwUzhTSG5x?=
 =?utf-8?B?cmdTUjh1ZmNKUDFlZXB1NklhR1pDSUxZODdWS3RzMjBuZXBxZ1NQa3lFTkR1?=
 =?utf-8?B?L1dpNEJmVll3UzVINmwyNnRUS2UvZVU4ODg5dlB1MDJnM0trRlI5SEwzK25r?=
 =?utf-8?B?OTNtNUlzNzgrNFc2RE40Qld4Vzdqa2J2WEFDbWVMQVovUHkvMWY0OEROSTFy?=
 =?utf-8?B?eUlFU00vVnVPWkRieVgyZ2FDdTRmSkIzaFJTaVRKcTB2eVFaYUVaZkZQdWtH?=
 =?utf-8?B?S2NpbXE3YkowUTVVR3hKVTduQjB3NmsxblRXMER5YVJHK1dXd1lsZGJ6NUVC?=
 =?utf-8?B?SFFnSTlpenlzekFWR0NCSUx2cTBpSk16USt2cWtRYVZiQzQ3eEdncFlzTFNH?=
 =?utf-8?B?VThwaVhaMXZ2WDVLUFNTL2xoeGZyRDFSWjA4OHhVS1lXRlhqQk51STBWd2lO?=
 =?utf-8?B?VmFpQUgwc1Z5TU56dHpJOFVQd1BFUXArcGNudXBXcldOalViY1czbDNuQVlz?=
 =?utf-8?B?MTV2eC9jMDJjTU5SZ3NDOVdabnFCcGtaMUcvcUlIODlpRW1MRHU4eXl2L1N2?=
 =?utf-8?B?MXVlNDlIWVVTbWFPZnBKMkpSNDhLOTJrMDBQQkROYnZnSGdjS0tURjZ0eTBH?=
 =?utf-8?B?WXhMK3o5TitxUDlDYkxTQWRWNTh3b2hqQUxSM0p2V3NWaEhBK2wxYkFURStu?=
 =?utf-8?B?NXdscGJ2Rk8xWVJ6L2tGQ2tiK0xxTlVadjlnNVdzM1FFM1QvbWVwYkMwVEJ0?=
 =?utf-8?B?VHNGSHI0VnorNnZZUUF0U0hUYzZGTmx6TnppN29xUVY1azR1SExtUUEzbUg0?=
 =?utf-8?B?S0RTNml6NnVYREd3V3l0T25DYkhLbDZCVWRZNjhMZVFrZncyUVNnOFVidzVV?=
 =?utf-8?B?Z0NlUkVCN1RKMi9VU3lxeHdIYU5FVmFsKzduYkh2QUw3dW56NDRJS0hmUXNn?=
 =?utf-8?B?WmN1eFBWZGY1MEh2bDZ3MERVQ0Q1UTl1UzNDZmNhZGNiQ1R6Y3RTeTlFSEVI?=
 =?utf-8?B?VGN1WHZscVhZeks3TTdXbW5QN1BKYnpYTXZZcFBNSDgrTjlCM29LMGY2b1hG?=
 =?utf-8?B?cFZJckhqakJ5cTQwZUNmaFhYNFJZdkdGTVFib3VkZnplZ0hYWENLZUF3c1Bp?=
 =?utf-8?B?akliTlEva2VEcDVqL3Q0MGJpbXVSQTN6YTNRM0tGbEwvVnMveU5XOFFZT3p3?=
 =?utf-8?B?enlzeFFJY1JKbFczQ09WbTByTzdHRjZOaXFsbXUzanFDN2IzVVl5NUFnNHd4?=
 =?utf-8?B?aW1RaWFmaTVZS0ZJT0lybEdJTUpHTlo4TWpScGdpaGpFYWIxc09jcktxNXJT?=
 =?utf-8?B?ckJUa0J2dVBnRGpseTNybHJyREVJKzEzRy9Hc0lsS2pCbmNSbVNMRytJVVN6?=
 =?utf-8?B?SFkwa3hvSmpGMG5Od1FvMWNLYlg1eHFCYmlhREJMM1M3eWNkUUdwRjBQclZ1?=
 =?utf-8?B?YjhQQTBuN0RxSGc0K1NpbzdOdWdlSlJrQlF1MVVITCtyd2RScHZIdk0wWHNH?=
 =?utf-8?Q?XpqQrXi31J0qG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6108.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGlqako0S3NuRUtLYTc0MUJTcExKaHh1NVAwNXNUUEwyV0RyWklBM1VVcmdm?=
 =?utf-8?B?Y21MY1hjYlBrOUw1RlZkNStva2t6eDk1OHc2ZHVGb1YvTlIvM2ZjZ3lERjZG?=
 =?utf-8?B?TXduRGlCdlBDWlpCOEtXbHJ3VjNZWk9KOU5iblRyZU13eUxabnZUaFkzZGRS?=
 =?utf-8?B?YTdTNG9DVEpoeVZORVVlVFRRNDI2VkhNV3JBZUdCT0FWdlNjeUx6bmhab2V3?=
 =?utf-8?B?RDNnVzdHemhSdkx0SlNJd1VXU05OTFYwOE5RM0VvL3pWMFo4RzBsMnAxUnJR?=
 =?utf-8?B?TXVWU0tFNWliTG5FcTFTR3J1MUZvaWZNOWVtWFdWcUdCYk42T3pVSmR2ZUZz?=
 =?utf-8?B?em9FWkFPK3U5VjJKdHBSYnMrbHhMVFBWZFpyd0t3R3dubDV4Y2QydzFjUm5W?=
 =?utf-8?B?UFZxOTlZUUtUeEoxTmlJUGt6UXNlVXI3Tis5cWRMWCs1UlRreDMwelJta0Y4?=
 =?utf-8?B?QUdueC9uQjZ4c2FIZXRhRnQ5MFBwZVJnWndsbVpPOE44dWRaK0JKM1J4QTdL?=
 =?utf-8?B?c1JHNWZqSTQ2U2xseXloZ2R6YXBDZmhpNC9VcnBZekNndWljSWxINFh6UkhV?=
 =?utf-8?B?STdXek1xdU1NMmsvckErQnZ5b01FcjdWRncvcUJKZnZWcWxyVEFRUk5LUVk4?=
 =?utf-8?B?ZkJFRWFVM3FKTG01RW1LUnhLcjh6VHgrZnFpQlVNUXVXdnp0YUNGUk43ZGRX?=
 =?utf-8?B?Nmo1MHRtVnpiNXQ5SVJPR3M4VEFiN3FSV1RYSE1GOXRSSDltVkprVUd3T3BF?=
 =?utf-8?B?RUs1UFN0VkZYeGVXUDVMK2J3azVJdTY5RVhlbm84MnVsUllSWGVuVUF1cGxL?=
 =?utf-8?B?SlVXN3hpZ3kxemhVWGMzUWw4bkJlazVvS1dKbDFOVHQxc1ljdVFtZGxLQlFQ?=
 =?utf-8?B?TWVYK1JGR2d2MHhBYnJqSFRHQk9oRlE5YzZPRGV5Z20xOG1oUXpiRHlPM0Mx?=
 =?utf-8?B?THZMeVRtaFdmSVA2M3kzMVVHcDB5TVBqUnFhSjBKaUpqOXdsakcyT3oxUmZ3?=
 =?utf-8?B?SEx5OG5zK0dJM0RUdUQ3VEY1MGU2Y0ZySjB4RVhNUjZ5YUVCZjZwanJiK1I0?=
 =?utf-8?B?YndMeW5aNm5VUEszejRMZEF6ODQ5WDhVRFFBZmpCSkh6Y1RReWN5enVlVXJs?=
 =?utf-8?B?QU9qY0FKYmM2Q09PMXpJbTM4czQ0K0lRbzg3R2lWaTV2VFA2OUFpL0h4TFhq?=
 =?utf-8?B?R0N1ZW53TGdyN1FpeExsSENRMWlOdFRlc2Zha2pRc2FLRWVKOHFSZWRXVUVo?=
 =?utf-8?B?Yk5UZVNucjl5STJoaEpMc2lxb0NmanNMK2pzamtQOFhPNjlEaHNVbXArNTFy?=
 =?utf-8?B?VEQ0NHFZSHkza3VmM3NpUWZiaUlwTUxxaXNxZm0wNWdYRVlmK1B0dHIxZVVx?=
 =?utf-8?B?OWxGcG1IR3BJUXhDWWdxZFNvT3NHZUVONExjcW1HY002bHhMV0p6STE1UG9r?=
 =?utf-8?B?ejdGNlpjVzUveGxKNk1SWFg5TEZmRm5hNlRyMVNXYXUvTVlvTXE0MzN4QWVa?=
 =?utf-8?B?MEFiQ3hBVHFROFJ3UkV2N0Ftd0Y4a0F6OGNVNUdKaUJlL1hERVVpZmZscTkz?=
 =?utf-8?B?bi8wZk1KVlRKUFQ1TjlxYWQyWkUweEhxUmpIS2JGRzhZeEh3bTFoK1cwckVK?=
 =?utf-8?B?VlcyUU1XZyt3b1hQUThaNFhOckNzV3huVVRYbVZ4ZU9VbjdsajRydHZPZXp3?=
 =?utf-8?B?N0hZdjR6TnlwU1VTUXJRbllJZ3V6c0cya3dMVDc5MmU3bTVuY3hZUWdjMGc2?=
 =?utf-8?B?cnY1a0JwcHZoVEpBUFJ0UkxuaytlRHdVRzR4aFJ6aUlzYmtrZjNmRklpZEFl?=
 =?utf-8?B?TmpBU1k3R1NKQnJ3bHliWGNnOEpoS21MQlkxY1FJYk9QSmo5THIyRFlnd3k5?=
 =?utf-8?B?dC9ialVqM2pkWnJ6TjNrU2ZBWHhEenhxc3Y4U0dHRjFBY3A3TzM1akE0VHhV?=
 =?utf-8?B?OVNzVXEyMXhZd3U2bTJLL1pNUXdjUXZrcHpQMGlvendCcXBGbVZhRTdqc0th?=
 =?utf-8?B?MHplV3pGd2FnVnoxK1FpSituV1ZwWWZoaHNJYzRUQmIyMU1ISlJod2lWNGVu?=
 =?utf-8?B?Z0lPNm1YMVhuVVhwZ3dJMlB5QURlVGR5YjU3bjd5T3lLQnprMkUwZEMxTDAw?=
 =?utf-8?Q?c5PX8aUjNp5Wmzcl1GmwHM4nk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfbbacf4-22d7-4024-3e53-08dd2f6291e7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6108.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 21:30:55.9477
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2voxLzNU8BbF8GeHGd/+RIbHV7hDoc2/TFTZ5pfMYrxsn8XdofMZejOluFCW6P6e6A43LqQ8h/gHokoG2mMeGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8971

On 1/5/2025 09:30, Kurt Borja wrote:
> Define zone_attrs statically and initialize zone_attribute_group with
> platform driver's .dev_groups.
> 
> Drop match_zone() and instead pass a `location` argument to previous
> show/store methods to access the correct `zone` LED state. On top of
> that rename zone_set() -> zone_store() to be more consistent with sysfs
> conventions.
> 
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/platform/x86/dell/alienware-wmi.c | 212 +++++++++++-----------
>   1 file changed, 105 insertions(+), 107 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
> index 16a131cc9f11..418abf46b593 100644
> --- a/drivers/platform/x86/dell/alienware-wmi.c
> +++ b/drivers/platform/x86/dell/alienware-wmi.c
> @@ -376,12 +376,6 @@ struct color_platform {
>   	u8 red;
>   } __packed;
>   
> -struct platform_zone {
> -	u8 location;
> -	struct device_attribute *attr;
> -	struct color_platform colors;
> -};
> -
>   struct wmax_brightness_args {
>   	u32 led_mask;
>   	u32 percentage;
> @@ -411,16 +405,10 @@ struct wmax_u32_args {
>   };
>   
>   static struct platform_device *platform_device;
> -static struct device_attribute *zone_dev_attrs;
> -static struct attribute **zone_attrs;
> -static struct platform_zone *zone_data;
> +static struct color_platform colors[4];
>   static struct platform_profile_handler pp_handler;
>   static enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROFILE_LAST];
>   
> -static struct attribute_group zone_attribute_group = {
> -	.name = "rgb_zones",
> -};
> -
>   static u8 interface;
>   static u8 lighting_control_state;
>   static u8 global_brightness;
> @@ -452,24 +440,10 @@ static int parse_rgb(const char *buf, struct color_platform *colors)
>   	return 0;
>   }
>   
> -static struct platform_zone *match_zone(struct device_attribute *attr)
> -{
> -	u8 zone;
> -
> -	for (zone = 0; zone < quirks->num_zones; zone++) {
> -		if ((struct device_attribute *)zone_data[zone].attr == attr) {
> -			pr_debug("alienware-wmi: matched zone location: %d\n",
> -				 zone_data[zone].location);
> -			return &zone_data[zone];
> -		}
> -	}
> -	return NULL;
> -}
> -
>   /*
>    * Individual RGB zone control
>    */
> -static int alienware_update_led(struct platform_zone *zone)
> +static int alienware_update_led(u8 location)
>   {
>   	int method_id;
>   	acpi_status status;
> @@ -478,8 +452,8 @@ static int alienware_update_led(struct platform_zone *zone)
>   	struct legacy_led_args legacy_args;
>   	struct wmax_led_args wmax_basic_args;
>   	if (interface == WMAX) {
> -		wmax_basic_args.led_mask = 1 << zone->location;
> -		wmax_basic_args.colors = zone->colors;
> +		wmax_basic_args.led_mask = 1 << location;
> +		wmax_basic_args.colors = colors[location];
>   		wmax_basic_args.state = lighting_control_state;
>   		guid = WMAX_CONTROL_GUID;
>   		method_id = WMAX_METHOD_ZONE_CONTROL;
> @@ -487,7 +461,7 @@ static int alienware_update_led(struct platform_zone *zone)
>   		input.length = sizeof(wmax_basic_args);
>   		input.pointer = &wmax_basic_args;
>   	} else {
> -		legacy_args.colors = zone->colors;
> +		legacy_args.colors = colors[location];
>   		legacy_args.brightness = global_brightness;
>   		legacy_args.state = 0;
>   		if (lighting_control_state == LEGACY_BOOTING ||
> @@ -496,7 +470,7 @@ static int alienware_update_led(struct platform_zone *zone)
>   			legacy_args.state = lighting_control_state;
>   		} else
>   			guid = LEGACY_CONTROL_GUID;
> -		method_id = zone->location + 1;
> +		method_id = location + 1;
>   
>   		input.length = sizeof(legacy_args);
>   		input.pointer = &legacy_args;
> @@ -510,35 +484,84 @@ static int alienware_update_led(struct platform_zone *zone)
>   }
>   
>   static ssize_t zone_show(struct device *dev, struct device_attribute *attr,
> -			 char *buf)
> +			 char *buf, u8 location)
>   {
> -	struct platform_zone *target_zone;
> -	target_zone = match_zone(attr);
> -	if (target_zone == NULL)
> -		return sprintf(buf, "red: -1, green: -1, blue: -1\n");
>   	return sprintf(buf, "red: %d, green: %d, blue: %d\n",
> -		       target_zone->colors.red,
> -		       target_zone->colors.green, target_zone->colors.blue);
> +		       colors[location].red, colors[location].green,
> +		       colors[location].blue);
>   
>   }
>   
> -static ssize_t zone_set(struct device *dev, struct device_attribute *attr,
> -			const char *buf, size_t count)
> +static ssize_t zone_store(struct device *dev, struct device_attribute *attr,
> +			  const char *buf, size_t count, u8 location)
>   {
> -	struct platform_zone *target_zone;
>   	int ret;
> -	target_zone = match_zone(attr);
> -	if (target_zone == NULL) {
> -		pr_err("alienware-wmi: invalid target zone\n");
> -		return 1;
> -	}
> -	ret = parse_rgb(buf, &target_zone->colors);
> +
> +	ret = parse_rgb(buf, &colors[location]);
>   	if (ret)
>   		return ret;
> -	ret = alienware_update_led(target_zone);
> +
> +	ret = alienware_update_led(location);
> +
>   	return ret ? ret : count;
>   }
>   
> +static ssize_t zone00_show(struct device *dev, struct device_attribute *attr,
> +			   char *buf)
> +{
> +	return zone_show(dev, attr, buf, 0);
> +}
> +
> +static ssize_t zone00_store(struct device *dev, struct device_attribute *attr,
> +			    const char *buf, size_t count)
> +{
> +	return zone_store(dev, attr, buf, count, 0);
> +}
> +
> +DEVICE_ATTR_RW(zone00);
> +
> +static ssize_t zone01_show(struct device *dev, struct device_attribute *attr,
> +			   char *buf)
> +{
> +	return zone_show(dev, attr, buf, 1);
> +}
> +
> +static ssize_t zone01_store(struct device *dev, struct device_attribute *attr,
> +			    const char *buf, size_t count)
> +{
> +	return zone_store(dev, attr, buf, count, 1);
> +}
> +
> +DEVICE_ATTR_RW(zone01);
> +
> +static ssize_t zone02_show(struct device *dev, struct device_attribute *attr,
> +			   char *buf)
> +{
> +	return zone_show(dev, attr, buf, 2);
> +}
> +
> +static ssize_t zone02_store(struct device *dev, struct device_attribute *attr,
> +			    const char *buf, size_t count)
> +{
> +	return zone_store(dev, attr, buf, count, 2);
> +}
> +
> +DEVICE_ATTR_RW(zone02);
> +
> +static ssize_t zone03_show(struct device *dev, struct device_attribute *attr,
> +			   char *buf)
> +{
> +	return zone_show(dev, attr, buf, 3);
> +}
> +
> +static ssize_t zone03_store(struct device *dev, struct device_attribute *attr,
> +			    const char *buf, size_t count)
> +{
> +	return zone_store(dev, attr, buf, count, 3);
> +}
> +
> +DEVICE_ATTR_RW(zone03);
> +
>   /*
>    * Lighting control state device attribute (Global)
>    */
> @@ -578,6 +601,36 @@ static ssize_t lighting_control_state_store(struct device *dev,
>   
>   static DEVICE_ATTR_RW(lighting_control_state);
>   
> +static umode_t zone_attr_visible(struct kobject *kobj,
> +				 struct attribute *attr, int n)
> +{
> +	if (n < quirks->num_zones + 1)
> +		return attr->mode;
> +
> +	return 0;
> +}
> +
> +static bool zone_group_visible(struct kobject *kobj)
> +{
> +	return quirks->num_zones > 0;
> +}
> +DEFINE_SYSFS_GROUP_VISIBLE(zone);
> +
> +static struct attribute *zone_attrs[] = {
> +	&dev_attr_lighting_control_state.attr,
> +	&dev_attr_zone00.attr,
> +	&dev_attr_zone01.attr,
> +	&dev_attr_zone02.attr,
> +	&dev_attr_zone03.attr,
> +	NULL
> +};
> +
> +static struct attribute_group zone_attribute_group = {
> +	.name = "rgb_zones",
> +	.is_visible = SYSFS_GROUP_VISIBLE(zone),
> +	.attrs = zone_attrs,
> +};
> +
>   /*
>    * LED Brightness (Global)
>    */
> @@ -606,7 +659,7 @@ static void global_led_set(struct led_classdev *led_cdev,
>   	if (interface == WMAX)
>   		ret = wmax_brightness(brightness);
>   	else
> -		ret = alienware_update_led(&zone_data[0]);
> +		ret = alienware_update_led(0);
>   	if (ret)
>   		pr_err("LED brightness update failed\n");
>   }
> @@ -624,9 +677,6 @@ static struct led_classdev global_led = {
>   
>   static int alienware_zone_init(struct platform_device *dev)
>   {
> -	u8 zone;
> -	char *name;
> -
>   	if (interface == WMAX) {
>   		lighting_control_state = WMAX_RUNNING;
>   	} else if (interface == LEGACY) {
> @@ -635,65 +685,12 @@ static int alienware_zone_init(struct platform_device *dev)
>   	global_led.max_brightness = 0x0F;
>   	global_brightness = global_led.max_brightness;
>   
> -	/*
> -	 *      - zone_dev_attrs num_zones + 1 is for individual zones and then
> -	 *        null terminated
> -	 *      - zone_attrs num_zones + 2 is for all attrs in zone_dev_attrs +
> -	 *        the lighting control + null terminated
> -	 *      - zone_data num_zones is for the distinct zones
> -	 */
> -	zone_dev_attrs =
> -	    kcalloc(quirks->num_zones + 1, sizeof(struct device_attribute),
> -		    GFP_KERNEL);
> -	if (!zone_dev_attrs)
> -		return -ENOMEM;
> -
> -	zone_attrs =
> -	    kcalloc(quirks->num_zones + 2, sizeof(struct attribute *),
> -		    GFP_KERNEL);
> -	if (!zone_attrs)
> -		return -ENOMEM;
> -
> -	zone_data =
> -	    kcalloc(quirks->num_zones, sizeof(struct platform_zone),
> -		    GFP_KERNEL);
> -	if (!zone_data)
> -		return -ENOMEM;
> -
> -	for (zone = 0; zone < quirks->num_zones; zone++) {
> -		name = kasprintf(GFP_KERNEL, "zone%02hhX", zone);
> -		if (name == NULL)
> -			return 1;
> -		sysfs_attr_init(&zone_dev_attrs[zone].attr);
> -		zone_dev_attrs[zone].attr.name = name;
> -		zone_dev_attrs[zone].attr.mode = 0644;
> -		zone_dev_attrs[zone].show = zone_show;
> -		zone_dev_attrs[zone].store = zone_set;
> -		zone_data[zone].location = zone;
> -		zone_attrs[zone] = &zone_dev_attrs[zone].attr;
> -		zone_data[zone].attr = &zone_dev_attrs[zone];
> -	}
> -	zone_attrs[quirks->num_zones] = &dev_attr_lighting_control_state.attr;
> -	zone_attribute_group.attrs = zone_attrs;
> -
> -	led_classdev_register(&dev->dev, &global_led);
> -
> -	return sysfs_create_group(&dev->dev.kobj, &zone_attribute_group);
> +	return led_classdev_register(&dev->dev, &global_led);
>   }
>   
>   static void alienware_zone_exit(struct platform_device *dev)
>   {
> -	u8 zone;
> -
> -	sysfs_remove_group(&dev->dev.kobj, &zone_attribute_group);
>   	led_classdev_unregister(&global_led);
> -	if (zone_dev_attrs) {
> -		for (zone = 0; zone < quirks->num_zones; zone++)
> -			kfree(zone_dev_attrs[zone].attr.name);
> -	}
> -	kfree(zone_dev_attrs);
> -	kfree(zone_data);
> -	kfree(zone_attrs);
>   }
>   
>   static acpi_status alienware_wmax_command(void *in_args, size_t in_size,
> @@ -1137,6 +1134,7 @@ static int create_thermal_profile(struct platform_device *platform_device)
>    * Platform Driver
>    */
>   static const struct attribute_group *alienfx_groups[] = {
> +	&zone_attribute_group,
>   	&hdmi_attribute_group,
>   	&amplifier_attribute_group,
>   	&deepsleep_attribute_group,

