Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2085.outbound.protection.outlook.com [40.107.223.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E771719DF53
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Oct 2024 15:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729696840; cv=fail; b=NcIjX/jpz+R4k8EqjLoRarYxvsMPbwure2OLUwHtljvSt49FyQHVa2SN9lMR/PcV4PIYmF3LckzdaXaVZyYoFXnhiVjm+COwkBBt2GE8+ZUnIvm7pMkdpsaA2GTY2x9DGf1cZw20WjCXmewjnRCh+6WS/HueQuEtXyyEvoyV0Kk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729696840; c=relaxed/simple;
	bh=MBWQyIfhxb1D7pfVgIEh6NQsc4RNfF11v8daE/QTV9w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HiR16wFPYeAIG/JLgWfjDqQWUrdV7Ev+rpBduyun+N2dOSPssV4eoEII8PAHfp/SC/r6zrTByWbl2eiSVfoPIOZ9pCRDFEXx2MOaA1bPw1wcJr+Smb/35Ilx1AbrHAuPG8A1YBK15qW0JwQ/SVfLjDw2eaE8wcUVTCfZ3uYMNtg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=MjdlGJmX; arc=fail smtp.client-ip=40.107.223.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="MjdlGJmX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TBX0PyE6nsteX+Gcj4o/Dj7RofTQiNHVwRxfs1/NWHWpsI/XFqOJrViS1WltMcBesKnVVSB93+2Pj353gq6e9Nmhg3FYIDtmYdLIeeTd5vfaLPM6l856GRbesklPc7yjfgQUdRp+dQtESyRIZWWmz9H0rEr00JrOE4OuWY9DtFy6VaC/dn/xRb6Dnt5YHo2PTyphH4ocNL6rXVayyWTdGzC76wcAKlGT+d87zZrC1DkZqWWymBcVZk4xdpEj+aMwnZs2ka2Mc8NSyh5smzRRYE8hV+3xn12ibPuxJmLftioiqP5xjggnelyJpDIfCJJrBshOO1jdNLei7X+y7cwL/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yz8H0vo5tJSFO8oaafhnp4TOOX8BLDOMgAw751+kIfs=;
 b=jDEyeqtIMK8AIZTkfWiwUQ4nPe0JLuPuprXukNsCFOjfVWK+sFyk5l/ourLvJOxohVzHkHHZrCTaUdb/EgcU53tYt1c4pIstAKZ3X6+AztbCcNfgZYJ8C+/ij0H5BzeGbuDG3FMWdtmwTJQRLvifxAT5eXfhoyoCHMM7mOMD7VvrRnt/9WAKIPDHJdganjBhmrsY0NObvCA3ad/GVaFaXoBJbhwzc9zOg1pZhGonu4/+UC6YeW7kpxqdLSbrhvhfutRIicjxJGEznJL7Gq6IKqMCWcbhcF/4/MnK1RtUXdlp1SlGYGJTCOB/rVOkp3LeiKTjNDoAXpipBvZ5/P1dUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yz8H0vo5tJSFO8oaafhnp4TOOX8BLDOMgAw751+kIfs=;
 b=MjdlGJmX7of5a/D6DjsFtkn9B3MJ0aF8fwFHxPSq9NR8w8zouGiszxcIUBfJ1fRosxev1wk67mkg53zWbDGVnDV3kgN0KTbu4Uqu/YH3/uTVO5nmv0EsQyaI8p5LfxpQEzG0CLauXFsofm3EdF7utZgbXErIyKIscz58uIiTe3g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM6PR12MB4220.namprd12.prod.outlook.com (2603:10b6:5:21d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Wed, 23 Oct
 2024 15:20:36 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.8093.018; Wed, 23 Oct 2024
 15:20:36 +0000
Message-ID: <6a3a28f5-fdfa-48aa-b0c2-257be2957965@amd.com>
Date: Wed, 23 Oct 2024 10:20:34 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] platform/x86/amd/pmf: Switch to
 platform_get_resource() and devm_ioremap_resource()
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20241023063245.1404420-1-Shyam-sundar.S-k@amd.com>
 <20241023063245.1404420-5-Shyam-sundar.S-k@amd.com>
 <e4163be3-1b42-4d28-b025-91734e9bff5c@amd.com>
 <b58cf10b-e3de-489f-b5b9-fa0daa407d7b@amd.com>
 <a039c086-b733-4af7-b031-8c19cafdccb1@amd.com>
 <76c7df3c-1db2-4eb7-8156-4f13a3694168@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <76c7df3c-1db2-4eb7-8156-4f13a3694168@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0206.namprd04.prod.outlook.com
 (2603:10b6:806:126::31) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM6PR12MB4220:EE_
X-MS-Office365-Filtering-Correlation-Id: c0ee512a-b741-4d7a-e44d-08dcf3763e67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WXE5cFJvRDZ6K0VLd2xGaTRyS3hIT3lxSGxYUUkraTJyUElhV2kwaCs5OVc5?=
 =?utf-8?B?OWxPSnBjZE1FT1dNaDFqZDlDeUlwMFAySUxwMzRRblZrdml1ajFJTDlFOVQz?=
 =?utf-8?B?S05paS90c1MzTk5qRnZQaWIzWEw5NXJscDMyMTFlVU9GSmFhMURhUVlpRVBM?=
 =?utf-8?B?amRGdW9zVFFXRkh3YUNJZ09MaDVyMkZwaTd0TldEWHJPbXZpWkhTaWRMcjA2?=
 =?utf-8?B?ZjMzRGFrUGRLWXRZd1dPbkdEOTZPQWR4VmZDbzVHbFYycTJWT2V2Z3BUTjFE?=
 =?utf-8?B?RmpCM0RXbGR2RHhJOERmRlpWY3lMczAySU5la2NaS2xqa2lFenBnM1FHUGVH?=
 =?utf-8?B?c3ovdUJFb3F6aTIxWHZicGtDa2tGeVFKYmlXT0FLbS9ybGUxK2g0UHFpejRQ?=
 =?utf-8?B?dGtFdzBxYWpBc1RaUjhlZVV3aTgrZGg1dlpYYmNZMzc0Z0VQcG90bitqSmRH?=
 =?utf-8?B?SGRnUFhNckZXV1pqOEtUT1dtSkV6bHJIUWRPUXNYUG1hUktCNXpqUW5zaDFj?=
 =?utf-8?B?dW5zelEyREdEM0Y0UkJlTVBySVNSbjFLUmNSMU5XQmtuZlkvajJqdWNDQWRz?=
 =?utf-8?B?YlN3QU12OUo1V3NMNTBPWmIwQVdOVUhYK2d0NVVZU2YrU2lPcGxjaHVGU3hv?=
 =?utf-8?B?cmV0S0RvRzE1RXh3OXJHR3hQSUJyOGR1KzEvTGxTZzlSZGpBQkxaT0x5c3hL?=
 =?utf-8?B?dGR2OUsvcjFMYlVnMGFYQk9BUWFPU1J0dERTbWczTzN4K0xMYXBnMXIvbFUr?=
 =?utf-8?B?S1VjbzhBNFFQaTZQdmIvYVZqbmNUYzh5S1dLRm0xWkkwMSsxclBpbkpVZUJY?=
 =?utf-8?B?NlBqcFM1VGNBd0Uwd1lxWmJWcGVBeHUvWVY0Y1RLV1JlOFRyRFZZVnVRc0Jv?=
 =?utf-8?B?MjNPcWZIUUNjOTZac1VYUzkybE0vV0NJR2J2V3hGbGtOMGp5MmIvQzVSK3RI?=
 =?utf-8?B?MWtCa09SVmNaci9id1FCa0ZKdjdzRzZYWGlSU1VrU3B1TExabUFwWUlSRFdQ?=
 =?utf-8?B?Q1JwUWhOalV0N2JkMHRsUFJLZERnYm1nNE43aHpSYXNkZmNtck1PRkwrWU9n?=
 =?utf-8?B?VHh2Ri9MZSt1QVJOelB6ZEtScUJMOWgzVkpGcE1lU1VPYmlQT2xkdnYrN0pT?=
 =?utf-8?B?MWZzMHRNL2dRY0xFdjg1LzhlWFhaZWNpck1qcmZ0bmtiTFV3RXF6ZkJtQWRm?=
 =?utf-8?B?NFlXdS81SXBFeXZUYmUvN3czZEt3bjEvczYvRDVOekZ1YVNJamt2WDVaVGtS?=
 =?utf-8?B?czkvZy8reXhuL2NVRFFnM2pPelN6VG0rbWJzeTNYdkdlZ2MrL1NUUmUrWUw1?=
 =?utf-8?B?cGRZL0lRQmlTRmF5cWliZjNMV3VLaDJZR2xSSzhNb2J4NkdqUFFNVk5jZWxn?=
 =?utf-8?B?azd3Qk1xVlN6cnpwVlJaUE9mTEpQNWh1eGgzSkd3TXphMjUvNjdqMzhTL05B?=
 =?utf-8?B?MnBmZkc4b2s0VlRJM01RWEc2V3pha2JWZ2NOeldqMlhQS3ZhNXJmYkgyV0JT?=
 =?utf-8?B?c0xBWlpKRTZSQ2ltbmhHbUNuc0lkanU2QmdHTFpVdG1TcitLU1JyMHFtMk41?=
 =?utf-8?B?YXdzMjlmOHQ3bmlsM1J5ejM1Q3VVakhTTHRHK2lkdG5WTFQ1dFNrdmxSZFJj?=
 =?utf-8?B?cUJrTkZISzZnellDRENURk9PbklJUUM2bEE3NVZhZFRrZkhmbjhoTmUxaTNS?=
 =?utf-8?B?RGhydzJwc1YwL0phSmtSTExEcFk4eXRYZHJIaE5XT2IzcFFmS0hTSXZabGhF?=
 =?utf-8?Q?ZJjnr+79e4NSQfZFTtGR7X4fiVbnJuXGaacVWYd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZEVKNVpaWEFGSWVzWGpqd1lIU0xEaGZQRDJpSFEzeURNVXpCek1zZ1JGNzlp?=
 =?utf-8?B?UWtOQmlKR0FDWEdnYWdtcjdGUVBobEdaUzZIWFNRS1hRN2o4WTA5d0FPNTla?=
 =?utf-8?B?b216clF0OUM0d2VxUUhtZHdvcDd3RzBNNmZ4Z1ZxY2tnQkpZRkd5RDY4bEwx?=
 =?utf-8?B?bnZ2U08zd2NmNXdCS3JibkNXYmQyQ0NZa0NHVE5SMi9GZFRHQTVtdmR1ZjQ0?=
 =?utf-8?B?eWZ3T0llcFhvVERRMDVtT21qTWtHTFhvYlZvSVJ1R1VwampMQmtOMnBlUmVV?=
 =?utf-8?B?MWRzOU0xeXZpTWlsZTkrandyeTEwWUk3QVVNSkNTU0hhcmU0aXhUV0FvcWJE?=
 =?utf-8?B?TzdTV2E4R0grRkpmWWUzb2gwQjlHR2lnelNFYXJkYjF5UWhNblZRV1hINzF3?=
 =?utf-8?B?QjZTWDBpYlhYVlZiNk5rWGJTYmdtM0UxTkFXOFNHZWxHMFBCd013U0tKSFdo?=
 =?utf-8?B?YzFielJndTlIQW9rendoa2tWcVBrWTh4ZDkzWkllVVdaT3NzNzVwOXFUMzE0?=
 =?utf-8?B?cDFINFRlVzFhenFTcXhYZ29Tb3MvK2gzeHRibUJkVXlBODhwdU0xV2E5KzA3?=
 =?utf-8?B?ZDZ0MU1pTDg5ZkNEWko1SHVyRkdQRE0vUTBTWjkxQTljS25nR2RWQlVIT2VI?=
 =?utf-8?B?bHRUSUVmd0h1a2RRazdGS2R6b1J0clZ2NysxU20zZ0VrU3Fkd3ZoUEpNSWNa?=
 =?utf-8?B?SGxOQllHL09xM0tkMTViTjY5b2E3VXJ2UEsvWFJvTlFGS25NbDFKTFA5a25U?=
 =?utf-8?B?Nm1oUmc4MWRmYVlyV1FKTjUrdlJGTFM3WGNOMzE5R0hHYjFHeTdHY0FYeU1X?=
 =?utf-8?B?amNSQ3ErUVI1ZktnN1lHOGNienlEVC9YVTBQTytpU25KUFZydDRmejl2M3lK?=
 =?utf-8?B?SUQzbHVFWlVkdmZMV2dza0ZQTlpjd202N29LNmcrckkrRXVpWXJMZTBIbmkr?=
 =?utf-8?B?cUFzNnNZeVlNTkdkMTFqME03K2YvcDVrSy96NnlIOFpkL1VtdFhITkpzWmx4?=
 =?utf-8?B?Ull5VWZrR2lDWVZXY1U5a001NG1YZTJ2WndNYTMrWWRaK0E5M3VsNkNNaTNy?=
 =?utf-8?B?MnVMR3dScjFLaW40a1hMSmNjRVl1enlPMDliSDQrazVyQ2xqWnRoTFNkWGFJ?=
 =?utf-8?B?NDFUb2N4TENhZGNESW4xTjVHNC9xbUZIRDhadDhiWStxcHFZN1JRVHVybndI?=
 =?utf-8?B?MDUxQndoYWJNOVViNUFxUzlUY1AvUDVYSEJYa0x4dUVUbkdCR2VEUW8wVmV5?=
 =?utf-8?B?blAyTlIzeWNUNzRzL2xYcG9GZlVpcTgzSUk3Z2xpNGdXeThYWCsrWHdxQ2pC?=
 =?utf-8?B?d2ZkSWt5U3pTRUV1UVVxeU5Gd1NvNGc2Tnc0TFNlNkdjWGNzNTAxSE13ODU0?=
 =?utf-8?B?OW0wU2lnYi84OUw2S2FZelEvc0tvODhLUDFZclZDYmdoQ3Z6bDNnZjY2NkFh?=
 =?utf-8?B?ZVJUUUFKcm9sUTNaT0Q2MW9pbjJ5V3ZYWEtYeUVCbGRQNXIxNmliR3hJQStY?=
 =?utf-8?B?WnhXU1ZNbnJmVzBoTU4zd2tDYi9JdDBJUHNZSEN0WGJBRm1RdVRJN0x4dDlJ?=
 =?utf-8?B?aGNicFhTaUExYjM2YVdFOXJpSDVBT29ZY1dveGNIYVdSSDVBdTZSOUtpeStB?=
 =?utf-8?B?bGwxTGFLKzNJM1hUNUFDeXUzOG0yd2JTS0lPM0xRWmd3d3F2NHRKSml1Wmo5?=
 =?utf-8?B?NFJxczRZQjI0NktIekZDL0R2YUNPL21JMjY3RS91QXNVekhRMEV6V2VjWUV3?=
 =?utf-8?B?Q1A0ZElrTC9vM0NrdW5pZDl5T3ZaejlKQ0lXZ25KQ3RiNEdlSzl2d01UMURQ?=
 =?utf-8?B?c3V0K1p6YWk2OEJYQVUvN1g3WGF0eE1Id1p1UFhCYS9NQ2t5Tm1Yc3FJdXpF?=
 =?utf-8?B?ZkhyRm5mOEZIb2lKNHZpMlJmQ2hmZWlaVEtvTVNSczlrYTMxVVNXUTBzU24y?=
 =?utf-8?B?ZS9hNm9VVjJucksvbU9CZThzb2hlNmxINnFHMHhVVi9xeHZWQWE2RkdwdHB0?=
 =?utf-8?B?eE9GSWp5SG5lSklueE9RWURaZHdIQXJiMnhHaFl0TnR4UkpJN1hoamRoeThN?=
 =?utf-8?B?RU9Tbi9UM3VNOVdLVnlNU0wydVE3NDhKR081N0l1cU9xdE5KUUdBcHpqNjZK?=
 =?utf-8?Q?ORgPgTUED5gPlZYWyvpJpDHX6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0ee512a-b741-4d7a-e44d-08dcf3763e67
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 15:20:36.0490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F83aTtjpWnJlJhH5w8acSFadBjX5Zp3IDUoiUZthOl8TjoskPgMKxDrI4G0g5gof/D6rIGtegUSyW1eGtv7I6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4220

On 10/23/2024 10:14, Shyam Sundar S K wrote:
> 
> 
> On 10/23/2024 20:20, Mario Limonciello wrote:
>> On 10/23/2024 09:37, Shyam Sundar S K wrote:
>>>
>>>
>>> On 10/23/2024 19:35, Mario Limonciello wrote:
>>>> On 10/23/2024 01:32, Shyam Sundar S K wrote:
>>>>> Use platform_get_resource() to fetch the memory resource instead of
>>>>> acpi_walk_resources() and devm_ioremap_resource() for mapping the
>>>>> resources.
>>>>>
>>>>> PS: We cannot use resource_size() here because it adds an extra byte
>>>>> to round
>>>>> off the size. In the case of PMF ResourceTemplate(), this rounding is
>>>>> already handled within the _CRS. Using resource_size() would
>>>>> increase the
>>>>> resource size by 1, causing a mismatch with the length field and
>>>>> leading
>>>>> to issues. Therefore, simply use end-start of the ACPI resource to
>>>>> obtain
>>>>> the actual length.
>>>>>
>>>>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>>>>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>>> ---
>>>>>     drivers/platform/x86/amd/pmf/Kconfig  |  1 +
>>>>>     drivers/platform/x86/amd/pmf/acpi.c   | 46
>>>>> +++++++++++----------------
>>>>>     drivers/platform/x86/amd/pmf/pmf.h    |  6 ++--
>>>>>     drivers/platform/x86/amd/pmf/tee-if.c |  8 ++---
>>>>>     4 files changed, 28 insertions(+), 33 deletions(-)
>>>>>
>>>>> diff --git a/drivers/platform/x86/amd/pmf/Kconfig
>>>>> b/drivers/platform/x86/amd/pmf/Kconfig
>>>>> index f4fa8bd8bda8..99d67cdbd91e 100644
>>>>> --- a/drivers/platform/x86/amd/pmf/Kconfig
>>>>> +++ b/drivers/platform/x86/amd/pmf/Kconfig
>>>>> @@ -11,6 +11,7 @@ config AMD_PMF
>>>>>         select ACPI_PLATFORM_PROFILE
>>>>>         depends on TEE && AMDTEE
>>>>>         depends on AMD_SFH_HID
>>>>> +    depends on HAS_IOMEM
>>>>>         help
>>>>>           This driver provides support for the AMD Platform Management
>>>>> Framework.
>>>>>           The goal is to enhance end user experience by making AMD PCs
>>>>> smarter,
>>>>> diff --git a/drivers/platform/x86/amd/pmf/acpi.c
>>>>> b/drivers/platform/x86/amd/pmf/acpi.c
>>>>> index d5b496433d69..62f984fe40c6 100644
>>>>> --- a/drivers/platform/x86/amd/pmf/acpi.c
>>>>> +++ b/drivers/platform/x86/amd/pmf/acpi.c
>>>>> @@ -433,37 +433,29 @@ int apmf_install_handler(struct amd_pmf_dev
>>>>> *pmf_dev)
>>>>>         return 0;
>>>>>     }
>>>>>     -static acpi_status apmf_walk_resources(struct acpi_resource *res,
>>>>> void *data)
>>>>> +int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev)
>>>>>     {
>>>>> -    struct amd_pmf_dev *dev = data;
>>>>> +    struct platform_device *pdev = to_platform_device(pmf_dev->dev);
>>>>>     -    switch (res->type) {
>>>>> -    case ACPI_RESOURCE_TYPE_ADDRESS64:
>>>>> -        dev->policy_addr = res->data.address64.address.minimum;
>>>>> -        dev->policy_sz = res->data.address64.address.address_length;
>>>>> -        break;
>>>>> -    case ACPI_RESOURCE_TYPE_FIXED_MEMORY32:
>>>>> -        dev->policy_addr = res->data.fixed_memory32.address;
>>>>> -        dev->policy_sz = res->data.fixed_memory32.address_length;
>>>>> -        break;
>>>>> -    }
>>>>> -
>>>>> -    if (!dev->policy_addr || dev->policy_sz > POLICY_BUF_MAX_SZ ||
>>>>> dev->policy_sz == 0) {
>>>>> -        pr_err("Incorrect Policy params, possibly a SBIOS bug\n");
>>>>> -        return AE_ERROR;
>>>>> +    pmf_dev->res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>>>> +    if (!pmf_dev->res) {
>>>>> +        dev_err(pmf_dev->dev, "Failed to get I/O memory
>>>>> resource\n");
>>>
>>> here        ^^^^^^^
>>>
>>>>> +        return -EINVAL;
>>>>>         }
>>>>>     -    return AE_OK;
>>>>> -}
>>>>> -
>>>>> -int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev)
>>>>> -{
>>>>> -    acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
>>>>> -    acpi_status status;
>>>>> -
>>>>> -    status = acpi_walk_resources(ahandle, METHOD_NAME__CRS,
>>>>> apmf_walk_resources, pmf_dev);
>>>>> -    if (ACPI_FAILURE(status)) {
>>>>> -        dev_dbg(pmf_dev->dev, "acpi_walk_resources failed :%d\n",
>>>>> status);
>>>>> +    pmf_dev->policy_addr = pmf_dev->res->start;
>>>>> +    /*
>>>>> +     * We cannot use resource_size() here because it adds an extra
>>>>> byte to round off the size.
>>>>> +     * In the case of PMF ResourceTemplate(), this rounding is
>>>>> already handled within the _CRS.
>>>>> +     * Using resource_size() would increase the resource size by 1,
>>>>> causing a mismatch with the
>>>>> +     * length field and leading to issues. Therefore, simply use
>>>>> end-start of the ACPI resource
>>>>> +     * to obtain the actual length.
>>>>> +     */
>>>>> +    pmf_dev->policy_sz = pmf_dev->res->end - pmf_dev->res->start;
>>>>> +
>>>>> +    if (!pmf_dev->policy_addr || pmf_dev->policy_sz >
>>>>> POLICY_BUF_MAX_SZ ||
>>>>> +        pmf_dev->policy_sz == 0) {
>>>>> +        dev_err(pmf_dev->dev, "Incorrect policy params, possibly a
>>>>> SBIOS bug\n");
>>>>
>>>> This upgrades the previous message from debug to error.
>>>
>>> It is dev_err() even before this change.
>>>
>>>>
>>>> TL;DR I feel this error should stay as dev_dbg() if no function checks
>>>> are present for Smart PC.
>>>>
>>>> I don't think it's necessarily an error though.
>>>> Smart PC checks are a bit different than the other checks.  There
>>>> isn't a check for a bit being set to indicate the function is
>>>> supported.
>>>>
>>>> So if the BIOS has the declaration for the region but it's not
>>>> populated it might not have a Smart PC policy and this shouldn't be
>>>> reported as a BIOS bug.
>>>
>>> This should be included in the CPM package, and the BIOS team is
>>> responsible for packaging a policy binary.
>>>
>>>   From a driver design standpoint, the absence of the policy binary
>>> should be treated as an error, as there's no reason for the BIOS to
>>> advertise the Smart PC bits without providing the policy binary.
>>>
>>> Therefore, this should trigger a `dev_err()` and be considered a
>>> BIOS bug.
>>>
>>
>> OK I agree with this specific error, but I took a closer look at the
>> bug associated with
>> 03cea821b82cb ("platform/x86/amd: pmf: Decrease error message to debug")
> 
> ah! but your comment was just inline to:
> 
> dev_err(pmf_dev->dev, "Incorrect policy params, possibly a SBIOS bug\n");
> 
> So, I was thinking you are saying to downgrade this to dev_dbg() and
> hence the above clarification.
> 
> if the comment is for:
> dev_err(pmf_dev->dev, "Failed to get I/O memory resource\n");
> 
> then Yes, I agree we should have dev_dbg() and I will respin a new
> version.
> 

It was originally for that line, but you corrected me.

It looks that we reached the conclusion on the right line that should be 
fixed.

Thanks!
