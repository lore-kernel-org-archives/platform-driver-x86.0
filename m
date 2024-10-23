Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2069.outbound.protection.outlook.com [40.107.236.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5722EAEA
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Oct 2024 15:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729698056; cv=fail; b=ctlFi298vijVniBuHLLdktEp4fc0yVxn5FXXGg7P/mLLTdV1YQrjB9eyp3PofVf3HyaW6OKZ5ley1P4K+hukeWJ29hUFBKLb8oeXK+JrkjdnuqLhUOMM5yCoordMWnVgCnlAlUUWjImYaqz7sfi5PaEhh3+MEPR/ZCiblpnDrHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729698056; c=relaxed/simple;
	bh=CvuAhhcA9NVdTX0Avlm2ARzldQq6iDAnTx7fYtCillY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=THFVVnNmisYrU/aSL1y1EM+HE0cF/uuGCOwJXvrDnwTK0G9ZUqxE1jwHtJCuOcRVDiOkvcVGXUI3vEr8NuNq85hAmf4q9ueL5x3ApPKLvEvYgK4j3HKim5/YxBjqHNaNSUI3/QWbai1wWClBwt6v2e7m1hvNnYO3g0BEwZ2iw+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=MJJQ6XGe; arc=fail smtp.client-ip=40.107.236.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="MJJQ6XGe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mr6c6hjcRy/4zxmvsgTwXUNAFY69HBKiHRsAy0edirYmlk2UqnSI795YIveAup/7GCmfcEf2dVvBacscGp4sqphnvnf4mJnGEAQ3BBe2VLIG3tP/CO40QLxMqmsDR0hNVRweMGqAFmf7IFgWmLdSZOHcyPT3r56K1QlietttH/IBGyNi6sw2mLzRDdbOrA9KNM5XWSfrJRd/Q9GHkfW+M9NniFuwh9DUiv0edpAjSNFgs4kLENhGO0Ao57eea5sj9BOhWDhcu7ysE4PM02muhaRd/UhMRexsW8aMbYQcwSoU1FY8BbFynGGzXBCA/etQSSK8CsYF/hQXDXalopbCGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=06EjOfyxu5K8X3uSguReE2g6FPHG19+F9qlhHtujKkA=;
 b=VjstGkEnzUNged6q8+QgjeqIhEylYJyP0vBxOpC2qhbxapZPfGwTXiM7kROsrW3+mZP8Eh+U8s0KXRlYGRFXcFDhKiqfxGXhwsKMnSKgxn7cP8pYgIbtOKVTXbL58iEZdJDknU+Gz1+K/1bODo/BmDGB86Faw1330CYGjrmYItqoH/HHBNLEeTY7YQqylNHiojZ/rDVXO3cxPXnGwrah08OOW0OxYWV+J6wf7nyrE2MZnf3g0Q+FSz6QbPfrPqX441OHUpLmeVDWsjr8N9rDEm2VB7CbwuPVqUrM4PYtX0pwyf2j8td9aPphiS8qsPB5CnIE16fU/A/jjsNBp6Pf5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=06EjOfyxu5K8X3uSguReE2g6FPHG19+F9qlhHtujKkA=;
 b=MJJQ6XGeUdXQ+Vsf0a3OC3DLioWMbFFS/qZ7hUnUpLFB3PxCSdeA/AODWJpQa1MHqp1wHWZdbSlvwd93G3oS8BzR4elwOMD9ueKfhisdzxwTDfL8AgvMs3IdqPc33NrczCJhp6XTnpMyKsxF1ma3iSHzCP+jetSNi4bHqWo2u+Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MN2PR12MB4317.namprd12.prod.outlook.com (2603:10b6:208:1d0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Wed, 23 Oct
 2024 15:40:49 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.8093.018; Wed, 23 Oct 2024
 15:40:49 +0000
Message-ID: <9260af45-4c7a-4e8e-8ab4-16b83ed51ee9@amd.com>
Date: Wed, 23 Oct 2024 10:40:47 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] platform/x86/amd/pmf: Add PMF driver changes to
 make compatible with PMF-TA
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20241023063245.1404420-1-Shyam-sundar.S-k@amd.com>
 <20241023063245.1404420-6-Shyam-sundar.S-k@amd.com>
 <733dbf68-a1a7-43d8-acc2-7f1b8d222427@amd.com>
 <84fe3b9b-cf98-4f49-ae2b-ec1a8759af4f@amd.com>
 <02bf47e4-f39e-4799-bda4-5a65e7f948f2@amd.com>
 <41d66544-6b49-4f22-8c1c-38f14ca47fbd@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <41d66544-6b49-4f22-8c1c-38f14ca47fbd@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0112.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c5::25) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MN2PR12MB4317:EE_
X-MS-Office365-Filtering-Correlation-Id: cb62dd48-15b9-4aea-7fb6-08dcf37911c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SUJ5d0xHQ1lXUE1TNUx1RDMvU3VENGtRVjJma3pJOS83MHJyUjRWcWN3M1ZH?=
 =?utf-8?B?UEdZQkxQTnFJM1l5OGxzdDdsOWVDRTlidXVsTGZjM3FzVThrNTQ5NHM5djYy?=
 =?utf-8?B?aHZFY1RFWlAwV1h5ZmxlRlROemdvc0NiRUdWaDdBS01RLytteG81SlhjMHo0?=
 =?utf-8?B?Nk1jSnd2YWNzMTJ0MVAwM2kyR0w2bEFqZys1VG9QaHdkbkcxQUdVSlZzVWZk?=
 =?utf-8?B?dDBiNCt1K3BYNWdBL1AzV0hXNWNrQ3d4NFJZL0g4ZENUMDZOMWhWQ3BCZUtU?=
 =?utf-8?B?VVRPdW9xcnB2cnZPc2dUSGVaRmlYRFJZQjdFWTRWMW4xeWNxQkFBUE54OXc3?=
 =?utf-8?B?QmFsSmdXZkZ1OW5YdVRKeXREeGNVTjhnVEErd0E3a2pwa0g4VitpQmVvNVdG?=
 =?utf-8?B?VUlJdURPajF4QjN6cEwzaG0rTlpiWXROYUE5b3IvR29tVmNLQXArYURWWWRT?=
 =?utf-8?B?ZW9PaGxNMjJFK0ZyeGNXMSszY1B4UmVqOTdiNEh6NlV0d1lISG1PK2JrR3ZT?=
 =?utf-8?B?WW1kVkl1aVVXZ1pJdjk3dzlBMitRVTVwVDMxRVN5VjI5ZS8xSmxwdm1LSmR4?=
 =?utf-8?B?TXpXZ0l0Rk81SENzcXBuUW9sKy9UMmdaczhmQWw1Mi9sWXc2bGYwV2JTSC82?=
 =?utf-8?B?bUx2bWdsQnJNT0dmVC9GZzNiakJiWU9NY0ZYeXlKRWNBK245bDhWeWtDMStL?=
 =?utf-8?B?MXpUYUZEVlc1OHlaeFpHbjV2cmNkcEdGWHhXMmlLR25TR01MY2loeU5HSTcx?=
 =?utf-8?B?NklDbzEzeHkvcldKOVA3ZTFEYVVNUzM3QTJQa2NwMUZVdGZIc1JpMWk3b1lD?=
 =?utf-8?B?SjFjZVV4VTFjeXQ0enNTSmlTTmg1b3BjVHdmbEZIaTREZHJkQnd2TlNIdDg5?=
 =?utf-8?B?RkJiRXBjdWtIMUJMTHIvOTVmc0V3N1JWaVVHTHVzblAzeFpBRVgxSUU2Wk9J?=
 =?utf-8?B?alZnYzUxcmU2K2FNaURLVGdtM1dZUzlSOEdpZTJIUzFpaVIxdGFMZXNxcUZZ?=
 =?utf-8?B?aDZpZEZuMUpFUzF3a1pnWnJ3WEVtb01vaGJ5RHE2RUV6NmpDTmpUb2pWYjBV?=
 =?utf-8?B?bWFGTHBRT2ZEY0xsZExOWEgzSXhkTVVDZDNPWHJxczRTckk0bjE5clA0QlQy?=
 =?utf-8?B?UFE1Vng0UC9YVU9OYXZPZHM0ZytiT0FrNmx3WUdsTzMzMzNISllqK1BYUFNa?=
 =?utf-8?B?ZTJGSmJmVkUyeGxjWk5PR3JhcWc0dlQ4anFZcmJwTGlVeWlHWTZYazJ1YkQ2?=
 =?utf-8?B?VWhZZGNqNUtleHRObUhHZks4RFhoKzJUaWNwSWRrZ3FzOEtDN211a3BqdGh1?=
 =?utf-8?B?ajFlOG93SGJCTUNRa241WW1QOXoxSDhuWmJoYlJvQzFic05vSk9BN3Nla2lv?=
 =?utf-8?B?a1JNbWpSQzRhNTBjTnlQY1FsL0UrK0tXZHU5UE1MdUR1dEFaWDdjVW8yZUtR?=
 =?utf-8?B?MWJFdU9reTdOdWUvd2FKVi9aMzB4SEtlUWEyZnIwOFNPYm5UVkNRMEJpd2I1?=
 =?utf-8?B?UHd4QUpad2lmU2IrdDE3K3RxSXZpcWtIMXNIMmcvd2RjcWQwS0szTnR0Qmpm?=
 =?utf-8?B?cURtK0ZaTnIrZTIvM1ZodytYMjNmRW90QndiY1JxdmMrMzgvYjVyWGtkNkto?=
 =?utf-8?B?N0tFQTRjZ0NjVHRkRXVtbGNXUEh5Q25KYm1vRXNBMVJKS0JiWjdNdWRxR0Nn?=
 =?utf-8?B?ZVJGUGZMWWY3Z3FnbWw5YUEwYzBXcnh0U2R3dDFaVUUvTWVkT3B1WEI3OFpU?=
 =?utf-8?Q?D/h0ilIpPbFQanleUQ7wn2zUkIDpvFzrEwiMVOX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHZzeWpZQ0R5VElLc1I3OFl2Yi8wN3JLTm14MW1FYUE4K0hBTFN0QURoT0JL?=
 =?utf-8?B?T3ZMcUUyLzdIYnJ4NGR4UVhvMXFwMHFPRUtaZnRCT1BOdzlQNXdCS2t1azdU?=
 =?utf-8?B?Vi9WK0pPRWsrTkJiUHN2Tmpma3M5aXg3NCtCNVZEWHRYR1VHdEhBV214M1Vy?=
 =?utf-8?B?eXRXZW9DNDRyWFRPUm8ycC9xK2dBQkFVWVY1TmxWaWZndVNQeDhiQ2RYTXBB?=
 =?utf-8?B?d1k0OW1mbFduMUpvNmwyb2hydkZhMXJyUjNPaDdobzRCcXNBRHptMFBhT3FO?=
 =?utf-8?B?UGNSWThYSUFCQTJ3TVFxc2tRY3NGa0VPTjh0VlliYUVOb1dkL0ROaTB3ZGJR?=
 =?utf-8?B?a0RKSGJBd3UzVDBES3NDQ3B1YlVVUDloYnQrTHlMVWNjNWxhZmEwSjBEdllz?=
 =?utf-8?B?bkFiQmlkdGludWRidlpUR01aWmp6RXlVelNIQTNKU28xbTdoaGl3NVMyRzBZ?=
 =?utf-8?B?TFc5V0FGVlNycHVqTWl1d0ZnaHd1N3p2Nk0xZlYzSWphMkI4anpKR0F3b0V6?=
 =?utf-8?B?NXM3cTdCZDc5QlJ1Y3NpZDU5UUJ1UHBOVFI1UUVhYUZPOHVWRWZIeFNmYjY1?=
 =?utf-8?B?ekhVNmdEUENLUkIxaDFTKzA5c2lkUmJ0Mnh6SmcwZnpCbndnRDhTaTMzTys5?=
 =?utf-8?B?TUlDVzNmM0lOU244Q1dBdStBbjc0Ni9hbTFRRXZvNHFlUzhmNXl3SEJSeisw?=
 =?utf-8?B?TGtpK1hLRFJScnJ1VDB2Tmc0dndmaWtlREVJNGtETWlzdHVTaVE3aEJBT3hs?=
 =?utf-8?B?TDhnVExtNFZqRGp5ajlkdXljSWhQNGJXazNzMkxhZ3VpcjNtM21SQWl2TGsy?=
 =?utf-8?B?ZzFiT1VnU1dNdlNWZk0zVEhCZ1JHSTN2bEdBNjFYS3VEckt2Qm5lNmtaa2s4?=
 =?utf-8?B?QTJTejlNV0VaalBKSm13VWFjTW15K2ZuaS9PSm4wdWZGTmt3SFQ4ZVRUVVUx?=
 =?utf-8?B?SURaMjJzNHdmeVZDbGNpUlNybkNNV3prZm5vTW5RM01OTlF1NlF6RlgvTjhx?=
 =?utf-8?B?K0pva1lOU2tXVXpUa3JPaTJ5R05oMU13YlZYT25KbmVUSXVLT2kwWFRya1VT?=
 =?utf-8?B?TGtuL1F6ZzUwWjIwTmRPcUdYYllSZTBIc3BkSU5PRmxBVXBtZXIzS2d6U0hB?=
 =?utf-8?B?azJXNWp2S3hQcmZtRWw3U0c5eGNEQ09mYlpKTlZGQ2JzdjRGZjA3dTBMT1FR?=
 =?utf-8?B?dzlnbGVRNWg1M2YxSUZBYlFrR3NYcmx6R01iVzJrSTQ3MUhVcTQ2SmhKN1pu?=
 =?utf-8?B?UkVsQ2dpKzZnNndlUXNwYk1YeTFtNE1ac212dUFIT3I4bVBSczVNc1R6amtN?=
 =?utf-8?B?cUxqZzcvYnVFOTVXakJ0OGd4Y0NNV05ZcGZ5eFZPeFUybHhYSXZzbUZ5djBR?=
 =?utf-8?B?NlQ0bTdEZ3g4N2JHTWNYSnU5Z0R3bUJJdmNMYW5PbW5mRVYzREprbmZtcTJz?=
 =?utf-8?B?UFJmNW5vOUtGY1d2SUM1YkgrWDlhdHRHS2FqZFVmZnZBMXJvVGNITGlhOEpP?=
 =?utf-8?B?dWk5TFRkUDJ2OTdlZG13RWdsb2NNWHNzQjcveHZIMHUwdThQTXE4bFVJcTJI?=
 =?utf-8?B?d2N2NFZjRWp1VSsrVHhsakVWZ1BxNTA4ekVhSlpTMHhUUDQ1WUowMlFUWU9K?=
 =?utf-8?B?OC9zM1R0bVpkQUlXeXppT21wVm9YaUk2ZWJ2bm1IdmRNM1dpOHNLNWNlRnJz?=
 =?utf-8?B?TUV3SThCeVY1endDYVZaa3RqeEV6ejJrWUlrSnJmVDlobzFpSGR2K1ZiZGFu?=
 =?utf-8?B?Y3VXdXRoQkd2Q1Q0dzA3YUV5b1Z6Z1J6SG1CUUFxSWFwRGNiWURBZjdJeGtG?=
 =?utf-8?B?MU1wRW5GN0pORjhpK202akx1TUxCOWp0SU5Jc2lwWVQrN3hqbmdkVlk1NnV5?=
 =?utf-8?B?b3V3WDc2TTl2eUlkRU05TFcvZUo1Rm1oZHBHUHYvaWFYQ0RTY3ZJQytwNE1t?=
 =?utf-8?B?WUF5b3A0UVNRaGVSeUwwcU5WSDF5SzZzK2xsSXRUcGRIZnR2V2R1ZVVabEFL?=
 =?utf-8?B?LzA0M3hIR2RvbFM4RzVmNWJGbWZUMjlDbnY1ajV2VGxycm5mRTZDRnl3L2FF?=
 =?utf-8?B?ZHpqQ3hkSHhmT3lZTkY1QTFPeStiVlJIZk91aUxRaElRVjZ3L0dHR1NRV29s?=
 =?utf-8?Q?oVOLad7OhhWEUfebp/O2krlXc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb62dd48-15b9-4aea-7fb6-08dcf37911c7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 15:40:49.6345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cs8ErItTmuKCODuLxJ1OFAZT6onFWYMrr7lCvwzfDPuKT4vv2fZwS0epwBTZbylXnPBeTTkCJYucUIKYdYp8kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4317

On 10/23/2024 10:32, Shyam Sundar S K wrote:
> 
> 
> On 10/23/2024 20:04, Mario Limonciello wrote:
>> On 10/23/2024 09:29, Shyam Sundar S K wrote:
>>>
>>>
>>> On 10/23/2024 19:41, Mario Limonciello wrote:
>>>> On 10/23/2024 01:32, Shyam Sundar S K wrote:
>>>>> The PMF driver will allocate shared buffer memory using the
>>>>> tee_shm_alloc_kernel_buf(). This allocated memory is located in the
>>>>> secure world and is used for communication with the PMF-TA.
>>>>>
>>>>> The latest PMF-TA version introduces new structures with OEM debug
>>>>> information and additional policy input conditions for evaluating the
>>>>> policy binary. Consequently, the shared memory size must be
>>>>> increased to
>>>>> ensure compatibility between the PMF driver and the updated PMF-TA.
>>>>>
>>>>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>>>>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>>
>>>> How does this present to a user?  From what you describe it seems to
>>>> me like this means a new TA will fail on older kernel in some way.
>>>
>>> Newer TA will not fail on older systems. This change is just about the
>>> increase in TA reserved memory that is presented as "shared memory",
>>> as TA needs the additional memory for its own debug data structures.
>>
>> Thx for comments. But so if you use new TA with older kernel driver,
>> what will happen?  Can TA do a buffer overrun because the presented
>> shared memory was too small?
>>
> 
> New TA will fail on older kernel and hence this change will be
> required for new TA to work.

OK, that's what I was worried about.

> 
>>>
>>>   From user standpoint, always be on latest FW, irrespective of the
>>> platform. At this point in time, I don't see a need for FW versioning
>>> name (in the future, if there is a need for having a limited support
>>> to older platforms, we can carve out a logic to do versioning stuff).
>>
>> I wish we could enforce this, but In the Linux world there is an
>> expectation that these two trains don't need to arrive at station at
>> the same time.
>>
>>>
>>>> Some ideas:
>>>>
>>>> 1) Should there be header version check on the TA and dynamically
>>>> allocate the structure size based on the version of the F/W?
>>>>
>>>
>>> This can be done, when the TA versioning upgrade happens, like from
>>> 1.3 to 1.4, apart from that there is no header stuff association.
>>>
>>>> 2) Or is there a command to the TA that can query the expected output
>>>> size?
>>>>
>>>
>>> No, this is just the initial shared memory that the driver allocates
>>> to pass the inputs and the commands to TA.
>>>
>>>> 3) Or should the new TA filename be versioned, and the driver has a
>>>> fallback policy?
>>>>
>>>> Whatever the outcome is; I think it's best that if possible this
>>>> change goes back to stable to try to minimize regressions to users as
>>>> distros update linux-firmware.  For example Fedora updates this
>>>> monthly, but also tracks stable kernels.
>>>>
>>>
>>> Advisory to distros should be to pick the latest PMF TA (note that, I
>>> have not still submitted to new TA FW).
>>
>> Yeah we can advise distros to pick it up when upstreamed as long as
>> there isn't tight dependency on this patch being present.
>>
> 
> That is the reason I am waiting for this change to land. Once that is
> done, I will submit the new TA, you can send out a advisory to upgrade
> the kernel or this change has to be back-ported to stable/oem kernels
> for their enablement.
> 
> Makes sense?
> 

I think we need Hans' and Ilpo's comments here to decide what to do.

I will say that when we had this happen in amdgpu for a breaking reason 
there was a new firmware binary filename created/upstreamed for the 
breaking version (IIRC foo.bin -> foo_1.bin) and amdgpu had to have 
fallback code so it could be compatible with either binary.

* If user on older kernel took newer linux-firmware package they used 
older binary.
* If user on newer kernel took older linux-firmware package they used 
older binary.
* If user on newer kernel took newer linux-firmware package they used 
newer binary.

If the decision is this goes in "as is" it definitely needs to go back 
to stable kernels.

