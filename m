Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010051.outbound.protection.outlook.com [52.101.201.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124B232E12B
	for <platform-driver-x86@vger.kernel.org>; Fri, 17 Oct 2025 15:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760714291; cv=fail; b=WVTril3+prHUrpjRcKn7EPhV569emte7vC+9Ac5j+hZOiXbQQ6CHZAHXT1ECOrNjEKtvgdYdAuI0Ggoi8WSkwVCFG+7TDGD4Wc3mH+YKU3fIbkJXz2NYJF4awjs7B2X1ccRnpZzTIHk5yIRNXFohCkcXsMuNXHsRr1RMD3ah2TE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760714291; c=relaxed/simple;
	bh=S1M2uHNThFMcdouFXFeyq2xFnkLY3GSxafWDAiCahEI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XfR8y/oTNxQJ4aWXm7l5LffJhqJOcAjykJVt8jKmgcxoMHUhac/OvKWFakBJJNan1lLpJSno+P5hYF0PrltO7qqys3NxmD6GvElGo+sVs6UDsVlPFLAr1VQCtdtn5pNRYG/drDkaJ/Xdb9Im/VthZ0Lh5+pMFpgzOEWHG+dSYoI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=u7ZJm1XL; arc=fail smtp.client-ip=52.101.201.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="u7ZJm1XL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PXm4zGr3h4RLu8+nqL3uSt0zi86qOBlnYQXGEHGFEWD4HbdsxKBo+izYdQd9pqfesLuZGryHsuJujaSA1IORzMAH4L3C+P7mHpoELINoc3hQsp/TjkKcGxqvq3iFXzc5Eq9yIQP70XNJgRqLFrp8IsMCOeMjkbVGDAWTE+U6o9XGBccQ2WbhgkVDFI8C3Fp1ekLhlIsVAkfJMOehc9gtAA1E0h6aXw8HGCZ9434G4LTpzH3FyYrLww4H/NuERcmWO2aLMq3Od/suy8i5IwEjG11oP0uyEJ+70msUBwVhZiEqoyvymEl5h+rysgXeOzpAYSWu+8+rwrvpzHpJnR7PoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TNwkUwwuj8zO3XEYyVbqTjMwPvJwzVGPQkBeeboNsLw=;
 b=lVWYRMckJuIE2E9xkgRjZuK2gGKJ1/t6Aa8FTpsk4J6GmTzF0VbVMKXJIwZ3rrg8rlkKZZ8hyro8tmhR9dCO/cBwYaxy9mUoodNi+bkWEyqsHoxIzlbjIj8Pkyz7AjpZs0eK7iFxyS5EipSC85yAluTuatPX4/NftDk6CfTVEAFJMrw7Apsfp3XMJqj4nvSouqXK31Wqp7KKame+VWfInpLRSXFTDMekwFmj2dvj1hcM+pd1MO5pes24uxBgeLaKcABFzw4zHe4PbilADKZDSgjJSLAZm8VjPOXIG7c8ynlcmNAei8+UKL3l2J/VawCCGm68iE3geScoOpXBXlJtaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TNwkUwwuj8zO3XEYyVbqTjMwPvJwzVGPQkBeeboNsLw=;
 b=u7ZJm1XLFYfPZ5wjhmxgDp5zqIhSqghfNWkDzaibUuxLzsRd+yV2olqMNOKhdlnzofW1Dq+L20j4EFzSDP+v4sE9L0ttiuB6H8LlA6R5/uiIWVOI5Zv+qlCe1hlGQXxjHk0w/J8wRoQvxa6JO+8ERaPLXwfd/qm6Cf6twuhXyok=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SA5PPF6407DD448.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8ce) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Fri, 17 Oct
 2025 15:17:54 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9228.011; Fri, 17 Oct 2025
 15:17:54 +0000
Message-ID: <feaa45b2-bc39-48eb-81a5-e408d8159f99@amd.com>
Date: Fri, 17 Oct 2025 10:17:51 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] platform/x86/amd/pmf: cache BIOS output values for
 user-space telemetry via util IOCTL
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
 Yijun.Shen@Dell.com, Sanket.Goswami@amd.com
References: <20251017102544.1470934-1-Shyam-sundar.S-k@amd.com>
 <20251017102544.1470934-3-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20251017102544.1470934-3-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0102.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:35e::10) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SA5PPF6407DD448:EE_
X-MS-Office365-Filtering-Correlation-Id: 60554fbe-c9cd-4d57-0d49-08de0d905837
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZDNLL2xXd1dJTUFQeU5sL2I3QXN5VE9GaUd1aE4zZ1lJNWoyMTZQYlhEaDNT?=
 =?utf-8?B?amRWZHlnQWdvWStFVTc4ZjdCVFE4b3FhdG9Fd0Q5a280UkJkR2lUZGI3eklr?=
 =?utf-8?B?QnN0U3ZISkw2UjN4YUhVNVE5T0VUOVFKTHI3dUNzcmwyZUVXODlYWmFBUHVK?=
 =?utf-8?B?N1lTaW5pSFJ4cDFuUFZtRU5ERkpHS3FnSnlvZ0p0RkFReTN5VUlZZnFnK3N4?=
 =?utf-8?B?U2tOek8wWndSNy94MmRBUDRidW9jalJJeWVEMmkzdEhod09UQ0hISlo4M01C?=
 =?utf-8?B?dVVLOU1odk1hVTU1UVJlcFRrU2J5S0NzRjVoS1RFM0VMQXVueUY0dWVSck52?=
 =?utf-8?B?aGZGZHEyMjdPMXNNQ3p1Njc1NU1CWXlaWnRMRG05WStLL3l5TWF5Y0dtRkll?=
 =?utf-8?B?STJzZkVRdFd2V0JEOFl3RVR3L2hkNDcvb3Qwa2ZNcjN2M0Y1K3VvaW5iSzNr?=
 =?utf-8?B?NE5qbmRkT2dWYmRDb0FzRDZxY0M1RmtFZVZpS25SakQ4NW5zUjFRdERSN3dw?=
 =?utf-8?B?QTFWem1yWXd6Mk9QZVFvOFBHeDRmWWR0blA2VUphb2hHWm5pcEIycFJ4dHph?=
 =?utf-8?B?ZUNZWnZhL2pYRUlkTis1cUpqZ2NEMXlVZDl5TWxTcHgyTlI0UWxodW03Y3Vj?=
 =?utf-8?B?ZG1PeGVJVDlLZ3dZaEdhVzgrZE5uQjVEWFlWN0luTzVrYm9wQk1hTnh4S0tJ?=
 =?utf-8?B?SDliTlRCNmcxY2ZNMGppZTdXMVl2Y2xrcEhaM2EycVFHQnR5TzZFdUV3Mlov?=
 =?utf-8?B?dEZZTWxsTDdPSkdjUkpOblBUZXc3TzMrRGwvRXdlM1NjRXkyVXk3bm4zR3R6?=
 =?utf-8?B?aUp2bVVTWFpzRERoZHc4dDhCN3ZjSi9VWlAvdGYzRVJHdmFGQWh2T0V1T2sw?=
 =?utf-8?B?Y2Ewc3BJekVwWHdiRVl6V2kwQkluZnEvbTkvbEhEUTRQVlNaQU1TU1QzU3ow?=
 =?utf-8?B?V2ZwQUZIekNMT2ovVUR2T2UwaHg1NGVDRGU2WlFjTWl1VDkvWnVxajREY1RE?=
 =?utf-8?B?SThla3Y5TGl5SmZ6NW9oUkYraGgxcE5BdUtYMCtjYnFpNmtwZVdaaWZ1a2gw?=
 =?utf-8?B?ek1WckJjZDdxZ1p0UW5hM2FoZmJkQzI0ZTdINFEya2NDL2pHOTlqS3NXMHhj?=
 =?utf-8?B?bWt3QmM4UXg0WGxwSm5TSFNMNUcxa1VlV2NraE8wUDBrZWZhQ05hRWVhZWJj?=
 =?utf-8?B?bllqOTlEQjIyR0h0SWJGZU9OK1MvVi81RVBuc3VUSGJJZHNhZThHaW9aSVBC?=
 =?utf-8?B?WU4vQ0tSM3RYVDJjVVNvTlNUVTVpTmoveG8xcnRxdWhEWklYM3VVSTBqb1Q0?=
 =?utf-8?B?UWM4aW1HS1psK2RlSEtsb1J2ZWh2QWo4Z0JpUkdha2VMYUtHclNLT050N0R3?=
 =?utf-8?B?ZGVUQmRIc2IxVmJQejlpbThkN0pReFUvWmVESERCOE9zS1p1eDFicGUxRHdp?=
 =?utf-8?B?VnI5bXd0cytScXlJVEwrQ3MyV0UwLzYwQWYvbFptelR3cGRTMVB1L3FtMHg3?=
 =?utf-8?B?QzNFazl0T2MxU2NyYXJFKy9lVmRSNFB1NFRSVm5TL3ZLemZNM1lLYXdyRENY?=
 =?utf-8?B?bDdFa1V4Y1h1bnEwczRXSU1waXkrVklReDB5U0IyYzQwc2dPYWY3WUp6anhs?=
 =?utf-8?B?R3o5NVZZMHhVTTFSd3RiMzM1c1NZcTN6bjh5VlJpanRTZ29DalNxa3BnazBU?=
 =?utf-8?B?d2dUVGFUdER6OXpJc1NwK3gyWGlCbW13MWtDVUhNM0lZdkx1WkFPVU1ySnlS?=
 =?utf-8?B?NitRaTFqR0wzY1k1aWsrTEpxUGlsek14V2ZHYmpuNFBCZmZxd3pETjcrVzho?=
 =?utf-8?B?VEY5NmhsYVI4SDZRYkl6eEhOSWZ1T2g5ejQwM3lvUE41T1BLSFZ0Vi9vUmJr?=
 =?utf-8?B?clVUK2JCWG9vVmpmcS9ZbUI2YXJTMUNZYjZ6RWZKQm82OEJsV0RocDdTb2Yz?=
 =?utf-8?Q?VVYxUFaqMn6jhGoMDpxsycdIinKnOkis?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bG1uZ2tObDZDWVV0dDAxNDc3RTVzTFhUcnVkVFYvSjZ3ekdQVmtGSEl2M2h1?=
 =?utf-8?B?QndyaDc1aTFnV21wOVJuNTk1VkFPcU93eXc1aHF6cnJOb1JZNWN4bmEzMmI3?=
 =?utf-8?B?S3ZCTWxXTjAvcmpyTVo5bHR1M0o1dHNTNUhlU1lYZytpYi9yM3hLNVhFTXJx?=
 =?utf-8?B?VzNpUTV6Q1VVRW5XUUkrQnRLRlRBKzMrb0JtU0NITWNaRElkUW1vSEJkemdx?=
 =?utf-8?B?RmFwL0lvUjhORzlWdWs0RzhsdktoZmErYU56TWh1VzlKd1NFZUY0dlVablpw?=
 =?utf-8?B?OWF6RGJSanVScVpmejRnNC9uLzJWVU9qOEpwbUVXWmtoNVRkNkhiL1lyY3Yz?=
 =?utf-8?B?enU1RGRUY09VTVFObzNZeDVLbGt1QmtZRlBGVzBELythZFFFQ1dFRWpjZXNa?=
 =?utf-8?B?QlllNXNQdTVJZm1Wbyt5b1lZcmphQXZPZ2ZhQzRsaE1LTjcyM2RGUjROYUs1?=
 =?utf-8?B?S3EzVGp4TWZtci9TVzdCbk1qQm5WMHFRblJUdkZOcmJJOEFhalQ1ZjNsaHg2?=
 =?utf-8?B?TktNbXIwa3JENzB4VGgvbysxTXNNL2w5enEzVGw4Z0twZVlIcjE5WnVMWjBu?=
 =?utf-8?B?d1Zvb3U3NGdvWGp5WXpKNU5PeWhoNlpabGEyZGt2WHdhaHBGR0RNYjNNY2Rq?=
 =?utf-8?B?WmM1ZmVaSUxCM2hzVXhIOEZjRWFWUXIxOS9ZMjRKNmoyTHdhTW96eXJOYytR?=
 =?utf-8?B?ZXVEZTBQcjREaG5EeG10K0VWKzFXbzdLcmFNYlNLcTZUY0pXKzlUd3VyaCtm?=
 =?utf-8?B?clF0cEo5U01FUGQzVmEvUWNteXJzM213VURra1ZhRWNJdWRsOXpPeitIZG53?=
 =?utf-8?B?clNtdHdmTTNOdXc2SE00aDJHNlNrT3BDaTlzN0ZxbzZ5c3owYVlsSHNHbVlt?=
 =?utf-8?B?TDVSOVR2NmFISm1VNVh2ckF5Ri9mRTdjaGZmeG9teUZISzM0dmFDU1Y2ODBR?=
 =?utf-8?B?SWcxayt1N1l0NC95SVN1R2ErcFZTbkR3ejdCclFtei84NWN1T1YzanVxUW9k?=
 =?utf-8?B?WmdpdVhMcFRyY2dEd3Z6TTJJajB2ektycWtxRjlKdG5KcU1hTWp6MVN2TzJ0?=
 =?utf-8?B?NzBQd3V0dmlCNDcwOTUvOVZaWmZkN3Z1SThyRm1uZHhINGpBZVN3a0g4WHh1?=
 =?utf-8?B?UmRDR1d6ZzdKLzQ0TWF6V0RNbnEzWDU0a1N1YW5xS1F4M1lCWWNLNTBnSCtL?=
 =?utf-8?B?NnhzR2FZa3QzT1V2VmNCbWZNODlmWXZwQk90eWJnUlpFZmQwTDNMaTMwRFFp?=
 =?utf-8?B?akdRNWV2VWFNUTJFS1BKZFM3SHhnQUxNMkZkOGNpUkhpVDdmd3RmcTNJOHQx?=
 =?utf-8?B?UHBkZ3pQRjZwRmEwSHIzcUNocFNXN3prRSsyKzhzVjIyYlArbFM1Y2ZRNUJS?=
 =?utf-8?B?RHRnVEtTY3B6bE16dGRHUGdUSys2aW1mY25xTVVLT0RxMExhOEZhYXVFV3hO?=
 =?utf-8?B?UzBRNFo2QlpaUkNUbmUzdk9tZ3BFd0VqM0VyNHFIMGMyMjh3UVRtYVMzbFly?=
 =?utf-8?B?TTc2T21hWmdlYzg0aW5kelZ3MXplRXdyNHdldHI1Q2IvejFHZENxeXYyYnNv?=
 =?utf-8?B?NGdXWklVOHJ6OXJXMW1XUThzRG12SUk2YTFDdVRmMHVxZXNkR3BLcFFYci90?=
 =?utf-8?B?djZNVjhhd2kvVVQwVloySkZ0dFlPQm95ME8zbTRkQVRra2lQczdiMldjTjZm?=
 =?utf-8?B?ZzJ6bzRuTlAyY1RIaDNFOU40Rk9ZSEZkOHVHTFEzUkQ2clVOeCtMTlgxb0wy?=
 =?utf-8?B?TUo5Z1IvY1lQWlRCQVJCbVBNaTB3aFpKcnZBdFUyZVY5ZmVsbFl2Wmdjellu?=
 =?utf-8?B?aGRvWUlUSnhQTTNoY0xGYk5yRlBKWW9jUUhGUG11b09sOHJRd2dzT2xsYk0z?=
 =?utf-8?B?cUxrM0RJbzJieHVHNzNLM2RtdVVTOVlqZGEyRmpLR2kxYVczcnc4WWZES2pu?=
 =?utf-8?B?U3dDNXZtdkJ2TmN4YVcyN0FXVlM2dHp1MkI3bFhSSFBUcjd5bGRxTW5XdWF2?=
 =?utf-8?B?S1QrZzhkTWJpZlFqSjF1cUFjVlZaU2g3UW5TamdkbkpvRW1mMVNvTVFtRE9N?=
 =?utf-8?B?VUI2dEhNQzlVM3N6RDk1dTBOa2NCbEpLckdGbWtDOUwwZ3d6dkxNVTZrRHFD?=
 =?utf-8?Q?fG+bwOmB/vcO6fc2ks7oOL2mv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60554fbe-c9cd-4d57-0d49-08de0d905837
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 15:17:54.2660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rk2FvUfX2R14xRJvzMOqcmZzcljmRCLh6TJ9tRUidwINqa/NYNGcUXhCdlnXjZKpp/Jc1nEN8g8ryno/09HZ3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF6407DD448



On 10/17/2025 5:25 AM, Shyam Sundar S K wrote:
> Add a bios_output[] cache to amd_pmf_dev and store the latest values for
> BIOS output policies when applying PMF policies. This enables the AMD PMF
> util layer to expose these BIOS outputs alongside selected thermal and
> power telemetry to user space via /dev/amdpmf_interface and a new IOCTL,
> supporting real-time monitoring tools such as SystemDeck.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

One comment below though.

> ---
>   drivers/platform/x86/amd/pmf/pmf.h    |   1 +
>   drivers/platform/x86/amd/pmf/tee-if.c |  10 ++
>   drivers/platform/x86/amd/pmf/util.c   | 190 ++++++++++++++++++++++++++
>   3 files changed, 201 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 3b1aae8a60a5..5880d6fc3afb 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -406,6 +406,7 @@ struct amd_pmf_dev {
>   	struct apmf_sbios_req_v1 req1;
>   	struct pmf_bios_inputs_prev cb_prev; /* To preserve custom BIOS inputs */
>   	bool cb_flag;			     /* To handle first custom BIOS input */
> +	u32 bios_output[10];
>   };
>   
>   struct apmf_sps_prop_granular_v2 {
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 6e8116bef4f6..8ea309aade95 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -183,42 +183,52 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>   			break;
>   
>   		case PMF_POLICY_BIOS_OUTPUT_1:
> +			dev->bios_output[0] = val;
>   			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(0), 0);
>   			break;
>   
>   		case PMF_POLICY_BIOS_OUTPUT_2:
> +			dev->bios_output[1] = val;
>   			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(1), 1);
>   			break;
>   
>   		case PMF_POLICY_BIOS_OUTPUT_3:
> +			dev->bios_output[2] = val;
>   			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(2), 2);
>   			break;
>   
>   		case PMF_POLICY_BIOS_OUTPUT_4:
> +			dev->bios_output[3] = val;
>   			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(3), 3);
>   			break;
>   
>   		case PMF_POLICY_BIOS_OUTPUT_5:
> +			dev->bios_output[4] = val;
>   			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(4), 4);
>   			break;
>   
>   		case PMF_POLICY_BIOS_OUTPUT_6:
> +			dev->bios_output[5] = val;
>   			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(5), 5);
>   			break;
>   
>   		case PMF_POLICY_BIOS_OUTPUT_7:
> +			dev->bios_output[6] = val;
>   			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(6), 6);
>   			break;
>   
>   		case PMF_POLICY_BIOS_OUTPUT_8:
> +			dev->bios_output[7] = val;
>   			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(7), 7);
>   			break;
>   
>   		case PMF_POLICY_BIOS_OUTPUT_9:
> +			dev->bios_output[8] = val;
>   			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(8), 8);
>   			break;
>   
>   		case PMF_POLICY_BIOS_OUTPUT_10:
> +			dev->bios_output[9] = val;
>   			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(9), 9);
>   			break;
>   		}
> diff --git a/drivers/platform/x86/amd/pmf/util.c b/drivers/platform/x86/amd/pmf/util.c
> index 483e4531535e..307c22791a07 100644
> --- a/drivers/platform/x86/amd/pmf/util.c
> +++ b/drivers/platform/x86/amd/pmf/util.c
> @@ -15,6 +15,7 @@
>   #include "pmf.h"
>   
>   #define IOCTL_PMF_QUERY_FEATURE_SUPPORT		0
> +#define IOCTL_PMF_GET_METRICS_DATA			38
>   
>   /* AMD PMF Feature IDs */
>   #define PMF_FEATURE_AUTO_MODE		0
> @@ -25,12 +26,197 @@
>   
>   #define AMD_PMF_FEATURE_VERSION         0x02
>   
> +enum pmf_metrics_id {
> +	IOCTL_POWER_SOURCE,
> +	IOCTL_POWER_SLIDER_POSITION,
> +	IOCTL_PLATFORM_TYPE,
> +	IOCTL_LAPTOP_PLACEMENT,
> +	IOCTL_LID_STATE,
> +	IOCTL_HETERO_STATE,
> +	IOCTL_SKIN_TEMP,
> +	IOCTL_USER_PRESENCE,
> +	IOCTL_DISPLAY_NUM,
> +	IOCTL_BATTERY_PERCENTAGE,
> +	IOCTL_BIOS_INPUT_1,
> +	IOCTL_BIOS_INPUT_2,
> +	IOCTL_BIOS_INPUT_3,
> +	IOCTL_BIOS_INPUT_4,
> +	IOCTL_BIOS_INPUT_5,
> +	IOCTL_BIOS_INPUT_6,
> +	IOCTL_BIOS_INPUT_7,
> +	IOCTL_BIOS_INPUT_8,
> +	IOCTL_BIOS_INPUT_9,
> +	IOCTL_BIOS_INPUT_10,
> +	IOCTL_GFX_WORKLOAD,
> +	IOCTL_DESIGNED_BATTERY_CAPACITY = 24,
> +	IOCTL_FULLY_CHARGED_BATTERY_CAPACITY,
> +	IOCTL_BATTERY_DRAIN_RATE,
> +	IOCTL_AMBIENT_LIGHT = 29,
> +	IOCTL_AVG_C0_RES = 36,
> +	IOCTL_MAX_C0_RES,
> +	IOCTL_SOCKET_POWER = 50,
> +	IOCTL_TA_BIN_VER,
> +	IOCTL_BIOS_OUTPUT_1,
> +	IOCTL_BIOS_OUTPUT_2,
> +	IOCTL_BIOS_OUTPUT_3,
> +	IOCTL_BIOS_OUTPUT_4,
> +	IOCTL_BIOS_OUTPUT_5,
> +	IOCTL_BIOS_OUTPUT_6,
> +	IOCTL_BIOS_OUTPUT_7,
> +	IOCTL_BIOS_OUTPUT_8,
> +	IOCTL_BIOS_OUTPUT_9,
> +	IOCTL_BIOS_OUTPUT_10,
> +	IOCTL_MAX,

I don't think you need IOCTL_MAX, do you?

> +};
> +
> +struct amd_pmf_metrics_key {
> +	enum pmf_metrics_id control_code;
> +	long long val;
> +};
> +
>   struct amd_pmf_feature_support {
>   	bool feature_supported;
>   	unsigned long feature_version;
>   	unsigned long feature_id;
>   };
>   
> +static int amd_pmf_get_metrics_data(struct device *dev, void __user *argp)
> +{
> +	struct ta_pmf_shared_memory *ta_sm = NULL;
> +	struct ta_pmf_enact_table *in = NULL;
> +	struct amd_pmf_metrics_key output;
> +	struct amd_pmf_dev *pdev;
> +
> +	pdev = amd_pmf_get_handle();
> +	if (!pdev)
> +		return -EINVAL;
> +
> +	memset(pdev->shbuf, 0, pdev->policy_sz);
> +	ta_sm = pdev->shbuf;
> +	in = &ta_sm->pmf_input.enact_table;
> +
> +	if (copy_from_user(&output, argp, sizeof(output)))
> +		return -EFAULT;
> +
> +	switch (output.control_code) {
> +	case IOCTL_POWER_SOURCE:
> +		output.val = in->ev_info.power_source;
> +		break;
> +	case IOCTL_POWER_SLIDER_POSITION:
> +		output.val = in->ev_info.power_slider;
> +		break;
> +	case IOCTL_PLATFORM_TYPE:
> +		output.val = in->ev_info.platform_type;
> +		break;
> +	case IOCTL_LAPTOP_PLACEMENT:
> +		output.val = in->ev_info.device_state;
> +		break;
> +	case IOCTL_LID_STATE:
> +		output.val = in->ev_info.lid_state;
> +		break;
> +	case IOCTL_SKIN_TEMP:
> +		output.val = in->ev_info.skin_temperature / 100;
> +		break;
> +	case IOCTL_USER_PRESENCE:
> +		output.val = in->ev_info.user_present;
> +		break;
> +	case IOCTL_BATTERY_PERCENTAGE:
> +		output.val = in->ev_info.bat_percentage;
> +		break;
> +	case IOCTL_BIOS_INPUT_1:
> +		output.val = in->ev_info.bios_input_1[0];
> +		break;
> +	case IOCTL_BIOS_INPUT_2:
> +		output.val = in->ev_info.bios_input_1[1];
> +		break;
> +	case IOCTL_BIOS_INPUT_3:
> +		output.val = in->ev_info.bios_input_2[0];
> +		break;
> +	case IOCTL_BIOS_INPUT_4:
> +		output.val = in->ev_info.bios_input_2[1];
> +		break;
> +	case IOCTL_BIOS_INPUT_5:
> +		output.val = in->ev_info.bios_input_2[2];
> +		break;
> +	case IOCTL_BIOS_INPUT_6:
> +		output.val = in->ev_info.bios_input_2[3];
> +		break;
> +	case IOCTL_BIOS_INPUT_7:
> +		output.val = in->ev_info.bios_input_2[4];
> +		break;
> +	case IOCTL_BIOS_INPUT_8:
> +		output.val = in->ev_info.bios_input_2[5];
> +		break;
> +	case IOCTL_BIOS_INPUT_9:
> +		output.val = in->ev_info.bios_input_2[6];
> +		break;
> +	case IOCTL_BIOS_INPUT_10:
> +		output.val = in->ev_info.bios_input_2[7];
> +		break;
> +	case IOCTL_GFX_WORKLOAD:
> +		output.val = in->ev_info.gfx_busy;
> +		break;
> +	case IOCTL_DESIGNED_BATTERY_CAPACITY:
> +		output.val = in->ev_info.bat_design;
> +		break;
> +	case IOCTL_FULLY_CHARGED_BATTERY_CAPACITY:
> +		output.val = in->ev_info.full_charge_capacity;
> +		break;
> +	case IOCTL_BATTERY_DRAIN_RATE:
> +		output.val = in->ev_info.drain_rate;
> +		break;
> +	case IOCTL_AMBIENT_LIGHT:
> +		output.val = in->ev_info.ambient_light;
> +		break;
> +	case IOCTL_AVG_C0_RES:
> +		output.val = in->ev_info.avg_c0residency;
> +		break;
> +	case IOCTL_MAX_C0_RES:
> +		output.val = in->ev_info.max_c0residency;
> +		break;
> +	case IOCTL_SOCKET_POWER:
> +		output.val = in->ev_info.socket_power;
> +		break;
> +	case IOCTL_BIOS_OUTPUT_1:
> +		output.val = pdev->bios_output[0];
> +		break;
> +	case IOCTL_BIOS_OUTPUT_2:
> +		output.val = pdev->bios_output[1];
> +		break;
> +	case IOCTL_BIOS_OUTPUT_3:
> +		output.val = pdev->bios_output[2];
> +		break;
> +	case IOCTL_BIOS_OUTPUT_4:
> +		output.val = pdev->bios_output[3];
> +		break;
> +	case IOCTL_BIOS_OUTPUT_5:
> +		output.val = pdev->bios_output[4];
> +		break;
> +	case IOCTL_BIOS_OUTPUT_6:
> +		output.val = pdev->bios_output[5];
> +		break;
> +	case IOCTL_BIOS_OUTPUT_7:
> +		output.val = pdev->bios_output[6];
> +		break;
> +	case IOCTL_BIOS_OUTPUT_8:
> +		output.val = pdev->bios_output[7];
> +		break;
> +	case IOCTL_BIOS_OUTPUT_9:
> +		output.val = pdev->bios_output[8];
> +		break;
> +	case IOCTL_BIOS_OUTPUT_10:
> +		output.val = pdev->bios_output[9];
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (copy_to_user(argp, &output, sizeof(output)))
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
>   static int amd_pmf_get_feature_status(void __user *argp, unsigned long feat_id)
>   {
>   	struct amd_pmf_feature_support info;
> @@ -70,6 +256,7 @@ static int amd_pmf_get_feature_status(void __user *argp, unsigned long feat_id)
>   
>   static long amd_pmf_set_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>   {
> +	struct device *dev = filp->private_data;
>   	void __user *argp = (void __user *)arg;
>   	struct amd_pmf_feature_support output;
>   	int ret = -ENOTTY;
> @@ -82,6 +269,9 @@ static long amd_pmf_set_ioctl(struct file *filp, unsigned int cmd, unsigned long
>   	case IOCTL_PMF_QUERY_FEATURE_SUPPORT:
>   		ret = amd_pmf_get_feature_status(argp, output.feature_id);
>   		break;
> +	case IOCTL_PMF_GET_METRICS_DATA:
> +		ret = amd_pmf_get_metrics_data(dev, argp);
> +		break;
>   	default:
>   		return -EINVAL;
>   	}

