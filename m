Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA9A1C9DDB
	for <platform-driver-x86@vger.kernel.org>; Thu, 22 Aug 2024 13:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724331614; cv=fail; b=DbFhomoNNiauUAIQmGbWc0pxaTn6UrWdYHy2y686fI5zkul6geGT53LbQfXiMxf8ajshscPB8f55KL8kNxbW+1kZow+8aEz2r2YPk3GfXfKi3B0NjxK48vOGJnSN6PsBqb/3vT7gZxfuRRwlTzhP+b0Rb94BXCQdKEw7k3L/Q6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724331614; c=relaxed/simple;
	bh=CGASyaNcretjLbfMcWUwx1V2MmhVdbSwPa9cBFP2OYA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kyZxxC9DchwxwdPjVsCf3irZo9j9Otw5MgBBWcy92TswDzmQUeRVV0ma1NKCDwQfaCOzT0syjhJKF83StJ5D4AFJM9VZDY/sWnQFTtD7mrl4YFmRzYWUFksiwY8WsnNdQOqIcvb3s+OaGD/PNUM+ZyujpBlyLQaHc3CLoqaASIw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=40ANV0Ih; arc=fail smtp.client-ip=40.107.93.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="40ANV0Ih"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bzz8SwZ0Of1GssXLxbOcyztqQCRKGkJ/hldOdxuBgmVIl3BPoleS2b8G08bwpO6N8rlIbe6NqJWgTLzdbUymbA00jAjqEzeAcmEKruVl7TkV7MVqKxi4gVgSBNdg1CREEWHeUo9NFQ46GMGf32wiZh/3jQG9pITlmahII4bne5UCIpMrcluWLw0Vbu++FUmZwHWixlj8NB06aJcOHpGtqtQmLSHmZBV/icswDoF93+KPyqZ7ZUxlj3OhJ7jxsgQe+2tDkgU4HK/u+4+oT6wqV6xmT+Rt6ObtgRIP+dkSgKH4Jg2k+Hb9yVP2tJeRYMNrO3VaUREaBUvxHSdsVsKgCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v4ENJN8jYJPUub4inp+ybu3X15j3HnjAu6hg9O709jw=;
 b=a4SJ2lpRedJrkRi5oixWqkEa0SXJApdk7BS2037fbYuceLHtS0WrwW+kTWezLV3Yl7ZqTne8c9+tRr68wfqOU5IqS1w5GYJKyJuDfBJwY6rLq6gaJRHXsxIipFBx4gh6dwX5QmnKPG9Dase5n4vbXxQBFQtQTWs/+003t42g9wxJkITcj0CZ+JH2HHdtRTDpkX6bZagCBySuRFu+UN4C35TKZssVpnwV24vu7r+n/DzgTBcS0Nrskm+hin0Oc43iXGsq6myJDK68XAPqc5A0/haN4WmZbc+w4dhRaJ7/DSRRPkV867bXqkvXd3LExQdIcQSjnFUSrBP6CeXNyoHeCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v4ENJN8jYJPUub4inp+ybu3X15j3HnjAu6hg9O709jw=;
 b=40ANV0IhojzQJC2kDhrEpvQUpKMq5fnDZAxLijv2wU2vrZ5g+DV0ajbBg5QXT97I/aXS4MW/Qabeu5Fee8WUxju1V4H6sot686oLRkCSWf1yGAsUwXBVnpP8dsYJFMWBdZLAtYBLggJ15DBwUmFoyQQolv718y2Bebuc+7+JcGo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH3PR12MB8901.namprd12.prod.outlook.com (2603:10b6:610:180::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Thu, 22 Aug
 2024 13:00:10 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.7875.016; Thu, 22 Aug 2024
 13:00:09 +0000
Message-ID: <7ea67bf6-87a3-425b-b81d-2e32ff29b457@amd.com>
Date: Thu, 22 Aug 2024 08:00:19 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] platform/x86/amd/pmc: Fix SMU command submission
 path on new AMD platform
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
References: <20240822095357.395808-1-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240822095357.395808-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR10CA0027.namprd10.prod.outlook.com
 (2603:10b6:806:a7::32) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH3PR12MB8901:EE_
X-MS-Office365-Filtering-Correlation-Id: ac32a3c4-5944-414b-106b-08dcc2aa5a28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WWcwU3JhaFJtckZJdXd1UlpxamtNVHZ5VEoxTnJuMm1Tam5Kc0l1QndSdGJ6?=
 =?utf-8?B?L285ZW1aZUN1a0ZpQm96WDVCMUZJb01DTDNVeFZSZ0R3ak9sU2VoNTRUeTNt?=
 =?utf-8?B?cTY0NXozZDc4TDhZdm4weERWajRjQmIwOVRDQnR0WXhpaVYrdE5YSFljRThX?=
 =?utf-8?B?TzlXY0UwV0pCemxaOHgxMTV1Z2gzNlRsanlsOVJWK1lKRnBMV2dWU0l5dkcr?=
 =?utf-8?B?aWVlTjg3WUM1RDVHMFRMd29XeUsyME9Eemt3dmZ3dDVaRGxnRktRY3RWeDdx?=
 =?utf-8?B?VmNpczNpWGxsSEs1N1hUVmV1Yi9Rcmp6aWtmUkZEZkpVdjlEL2gyYUhQSCt3?=
 =?utf-8?B?MWNicXNWeXozVVZiMkJZVWdYM0Flb0djTVQ0RDVZTVM5eFlBSDJRbWJxQURT?=
 =?utf-8?B?QWhBS3drVzNpNndUMjlUYXNZZFhpeUN2cVlaNExvb0g5elJwMHhleUJIc1R0?=
 =?utf-8?B?Z1M1TzNoOVRCYi9XN1lOcFBVS0pWeVdkUVVqa1FsbzlWckhBMi9ZZ1ZaSUt5?=
 =?utf-8?B?akxUeEpyYVNscDFsRnBPMDA2M1hXRWxMM0l5eUdoSVQ5UFplbXM2eDZicm1T?=
 =?utf-8?B?VzJBNWt3TG5kMldZRWk1ZmM2SW02dGVoMnR3aW9rWi9WNEUyRXh4c2ZxUzdl?=
 =?utf-8?B?UEl1RGxoOC9ya3RaSHI0UHBaL0pMQzN5cXFvL1pCYlZPZG11MWU2Q0pPYjVK?=
 =?utf-8?B?SGExbnlWZ2E1K2Q4QkJRd0N0TWRmRUpZMWxSVWRKV0FNaUM2cVF3SVJkcE0y?=
 =?utf-8?B?ZkFUQXo3b2ppdHVtNU1VbnVCa0RGd0hMMi9UZGZqZk8rUGMzaGE4UmZNcE9w?=
 =?utf-8?B?WHUvYzBaTDl4Y3FrSE9FRS80cnA3aUx5Q2ZEOHdJSHFBc2dVTDlsUXh3MVFI?=
 =?utf-8?B?OHJ1ZmliQWdoa1RmVFRzd0JZMEpOcDJuejJTMDRuUU15UEVORkwxdXVucVNx?=
 =?utf-8?B?RmlDeWRLREtOTHQ3cEQrMXA2U2lJakVlRXdmZ1FpbUZPTHdpODZKTVZna2dF?=
 =?utf-8?B?TnpmRFZKdnExWFhjaWxkQnRZQVd4OFRTVzZoTXVnUkNFTHp1b2tPckdHbWxv?=
 =?utf-8?B?MjRKSDl5NDVtLzhMOXZYdDlhSm4vR1RFTld4bSt5bWc4YUx3YjJaMUJsaVZJ?=
 =?utf-8?B?eXROeDlMcVlLQmJiZTF3L0FPLzdrVS9kVUxFWGF3bGJpUDY2MFg4NDZJdzZB?=
 =?utf-8?B?TG8wZUErUWp2anlmRTFjeTVvT2lMKzZiY245OEVuc3o1UjlzZXJncnUvTUh0?=
 =?utf-8?B?VFNjYUJOM1Jqa3lzdFNBcUU5c29nRHNHOXNVMTFPVHoxdGpza1Q4WHhoS3N0?=
 =?utf-8?B?SjRza2dOT2xiUXJVMENmRUU0YjVSN3ZodWVvbU9kN3lneTVodUNRTGZiV3lY?=
 =?utf-8?B?R21LczJnVGNhV2ttMkZvdDMzWkVSQ253ZHY4NU5TS1NGOUN0QmhpQkhaK1Mx?=
 =?utf-8?B?WWx0R01xK1kxS0twWUVsVFc5WVF0TmhUWXBrN3dGTEE2K3FuN29sclVCZTZs?=
 =?utf-8?B?MVVMRnpFN3c5VjNpU1k2YnZlQWZuKzQ5VUE3QklTVUI2TU1oMjhzVndnWWxU?=
 =?utf-8?B?c0NNb1NXdXR4STVQUTJic3J1cDBYNnc3NEV6UVFiSjYvWXdoSStLaDdqVm9N?=
 =?utf-8?B?Z29EeGdya0xjZWNGRUwyYmJzdklpbnNWdjh3NDYrZVR1QkhlNEhBM2p0QXdz?=
 =?utf-8?B?cHNOYjBvU0FFRDBUSDROcy9FMG82dmg5NWRaeFJieGZaQ3htSzF5eHErSGlI?=
 =?utf-8?B?eVJ6UHpmY0FmeDdremQ0WnlwUk5JY1VaWTNVdUFKb2hRbWRSSHRXdkIrejBV?=
 =?utf-8?B?dUc3NDBjb3M5NHlGNXB1QT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGJ2OEN0aGxkVjM4a3VxR1hoTm1raFV0R3Y5TWNxblgvYWtHTDlxZU9ya1RI?=
 =?utf-8?B?bHBoUnJqZmxOOXROdXFiUXAvcmtTWVAvcFJzUEFmck45QnRTOWN6SkZtSG5J?=
 =?utf-8?B?enI0ek9qWE5RZVVKN2NsMTZrejZCaU9Od05zQTRodTRCVGtSSmpXb1BIUzEr?=
 =?utf-8?B?QzlkbFFBS01NMDEzRnNDbE0yTDhsaGVUUWc0ZGlpRmNydEQwZDQ4dDQwa1pH?=
 =?utf-8?B?Nm5NMnNXSnBSY3Q0eVk2cDAvRHZwL0dhRU84aEpsZnloZVhSamNkMWw4UEdY?=
 =?utf-8?B?QzFOUWNaV0o1aXVmT290cWVFQnZlQ3hvcllSMFN3UTNaN3owUzIvNTRBeXpC?=
 =?utf-8?B?SEVaQjZGUmlZUjVqRGJaNGtxd0FENGNlVmRTeDRQYTNTV3hmckkyN3VrbHpr?=
 =?utf-8?B?M29scFlRbzJPZCtGMFlUbzhuOHRMQUdxYit4MUIwdHNQN1VoeFpSNk8rdG4w?=
 =?utf-8?B?eWVLWG5iL2k2ZUtyVTVuSXRwSHZCNUtDdmE1eGF1YVAvVHBYVnRRT0w1ZWR3?=
 =?utf-8?B?TUtrYUhMTXYvdDRXVDBORytYY0xHbTdFL1FvNHhXRXZLNVJmVkg1Y2JDNjJF?=
 =?utf-8?B?eEZPYU5wdW92RGxmb3NzYkFZWSs2UGl4cDhHVkp6bndyNjhsMFVtTEhIVGdK?=
 =?utf-8?B?NDZhNkkraXNlV01oWk1Od0hhUWpJQyt0V21iMnBlMmNXUUpDMEV4SkZXejNm?=
 =?utf-8?B?MFZkOFUyZzU3N0kwejVOSmE3ZUpNN25JYTJwMEdJV3VjTkZpWmw2ZDlWY3A0?=
 =?utf-8?B?a1Y2SWZzUG1QVjd1bnhCdHNzelhVdkVSQWsyckhrMlRIbWllUFZFTU1pcmth?=
 =?utf-8?B?bG1wWDd1eUpHV2Njc09QVkFsNEZhc0VMTnZId1h4Z2tpdFZ3NTFBUm9RQnZz?=
 =?utf-8?B?aWV3ei9YdmJ5VjViU2lJalZZTlRydXNISFg3aTFIYjFNRGN1c0hHeWxpK2hW?=
 =?utf-8?B?RUc5b0w2MmZuNDFaSEZ6Z0VLMmhRV2NoMVJ3VitPZjFueXlOUVhXeS95ZG5u?=
 =?utf-8?B?RmtMT2s4ODRDVGZLcDJJZnBObTh2WjhRQXN0Q25sVzl5em9qcnNjbHFEL0JE?=
 =?utf-8?B?STM4VGM0YjJDOFZuVEZZcTdBWENQcDh6MUFXbEFwS3FkNGZmUm5MbllIMjB0?=
 =?utf-8?B?aHFMUHUzNTQySnpVaDlCbVZKb3NVS01NYVdtcWlhLzNWeTh6cXZ1N0plSy8v?=
 =?utf-8?B?VlR2b0g3Nkh3Mk1jYzB5QUZCNFExRUplQ0d2ZklTcVhVbzA0dDBXZEg3YmNN?=
 =?utf-8?B?N0huTUtRaldzdTU5Q1FpdDdkcmM1ekc3U3lPQTRwYUpOMHNJcXFWTGU2RmYv?=
 =?utf-8?B?bm5qNWNaUEN6N2k5bGp0SWV2YzZBck5CRUp1SXRVYVh1WFBKNDhmNldNWVds?=
 =?utf-8?B?OEx4V3J1RlVRcVFSSVVhT3dxSE9Tb0xqVjlnUlNZVWd1eU0zYnd2aG0zVndZ?=
 =?utf-8?B?cVN4WEw1VjFPRVNCaTFPdkp3UytIQWtocXBTaUkvM0YrQ1dRSTNTRFpVaG4v?=
 =?utf-8?B?Sk5lU3NtRElmMzZTT1IzTGlCUkJVajkrQ3Nwc0FpM2F0VG1GRUIwaGgxRVBP?=
 =?utf-8?B?dGhPTk5rZTNKNUxwU1lzMGZYZDgxV3ZhRk9TVm8wTVNvWlVkSEtUTVU5a0RH?=
 =?utf-8?B?czBtRTk2b1FGWmtuSlh1NWdaTWl1dWZRRnhhdVdCOTB3YkQwWEUzUC9JN2NX?=
 =?utf-8?B?SFh5aFlGRkx2RDFUdnJmNWgxdXBudFFzK0trdXhRTGpiTDV6dDBNRVpNR1BU?=
 =?utf-8?B?WTY5RTc5V2FOUTZ4YXZDSU5NbG94cWdRbHVDYVhOL2dGUkM3amYxcG5Bekhw?=
 =?utf-8?B?S1gwamlDMm83MkdxdGFSM09HeHZwTWNMSm1nb20zeVhUajBydC95WlBOZUVU?=
 =?utf-8?B?OGlKNmdDL1dlQ2sra0M2Q3FRcHhRSkxEdzltcjJNZkhjMHVFVFVZZFFkZ2Vz?=
 =?utf-8?B?VVM5K3JZVEthRWlEeTFFY2ZuWTBvMmV6OThmS1JzWmN2M2Z6dGowMklYRXd0?=
 =?utf-8?B?SGc1bDBGUk5Mclo1LytmZVNUUGI2aG9vWlF4b2lncGpQejdWcXorMjBSNm93?=
 =?utf-8?B?N2w0Nk02WmkxMk9WOGNmR3pMSTJkUTgwV1ZMTmdqWG1WZHZmcHRvNlFIV3o1?=
 =?utf-8?Q?W+0cJDL1uCfc5Ujd1DBQw09A9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac32a3c4-5944-414b-106b-08dcc2aa5a28
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 13:00:09.4211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ppMBNFj5muib4FxRDfxeS99MCLudKq6WzDUmnQMRAcYi0FzLLkcqJ999WfDGvFI2o9NuMHgdNqKZTkXnLS/AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8901

On 8/22/2024 04:53, Shyam Sundar S K wrote:
> The commit 426463d94d45 ("platform/x86/amd/pmc: Send OS_HINT command for
> new AMD platform") was introduced to enable sending mailbox commands to
> PMFW on newer platforms. However, it was later discovered that the commit
> did not configure the correct message port ID (i.e., S2D or PMC). Without
> this configuration, all command submissions to PMFW are treated as
> invalid, leading to command failures.
> 
> To address this issue, the CPU ID association for the new platform needs
> to be added in amd_pmc_get_ip_info(). This ensures that the correct SMU
> port IDs are selected.
> 
> Fixes: 426463d94d45 ("platform/x86/amd/pmc: Send OS_HINT command for new AMD platform")
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v2:
>   - Split v1 into two patches to address a fix and addition of CPU ID
>     support
> 
>   drivers/platform/x86/amd/pmc/pmc.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index c3e51f0a5c33..f0d389cf1ecb 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -359,6 +359,7 @@ static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
>   		dev->smu_msg = 0x538;
>   		break;
>   	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> +	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
>   		dev->num_ips = 22;
>   		dev->s2d_msg_id = 0xDE;
>   		dev->smu_msg = 0x938;

