Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2070.outbound.protection.outlook.com [40.107.244.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054DE433D5
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Oct 2024 16:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730304529; cv=fail; b=OtScnwn+r1Xpz4iLjp7Vq72DuT2Baq6yWNWLTK3kslvWH5q8xmflE1kuKPihR95gifij6w521P8gxABUEedtWwu8pjXZTDOXDtTNN7o44Q8yJUJVZJx1siPKaHXS8kjFi4i/ivfVgb2xo7bJx0WpQo4bI6safkPmpmUbPGd8xBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730304529; c=relaxed/simple;
	bh=UquJkfKKVFSdRgli6gV07WxWoNpDf2GHrZX3NaHkckc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=u8Bac2Zhoro4+74YodA9xS4qbuBzm8I4Xj5OMk14tIqrl3onzahy4yiHDNfo7kQRfyVAj89l9izd+F2Qv3yMeYLo7W96hTgba0hMiyZk3FjsUEN08MyhedGjX56nwQ32YnVyJGqtICNtKGJ9cdZHpfcxxB00eiwySOUg0Ogiy/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NXPJIiWf; arc=fail smtp.client-ip=40.107.244.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NXPJIiWf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qu/0wgGp1XwW1yPjVv6QutoQBXM8Aa4JK/1XXZb+u8wWyTVD2kpsLcPL1sRTGRoWgUCABQPxBTalP33pCeOpXo+d3CZyhMtaq5/6yOLu5Jc3H5S87R1K/dT8xypBZHVc3vuGbE1IxbhgbThzhjBQ1CfFx7MySDLWmwhrwwN15rRGUtimw5cxjef85TjaRQfg2ezUu3QXAojfi68qNoJ9lHO+X945wU0GUYCJiQsmd18PFdmq/o0VVWVh4ApOzUG4+0HJ8798hojy9hBA8DrJxqh3wCxrLXH18rDBDPIN7H3kRywjpr0/c/RmlQZrK84aJmgJrO+RW/7UDVHWRu2bjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pe7/2+SpaAVAfmvQvq+iLUXFcH3h/zl+ua7xdhkRQLQ=;
 b=ZN7ktJ9No87iVcppZxjnwdbsxNtoXuphYRxNHNI2MTg8pekM9AgBqtTd+RIWixGwpxNwz20oH50NKgzKttDwoq7ubArTc7/kkAcZm3qYZ8ycZLUzL4qryjl0ZvwIX1p/BHb0bVVNjA4iCDNYAxIrC5cHRZG23a91ZLxNi2ssLkM1daitFO17CxZyzltCvUGjApDTAiiFE+qlZWWL7oayT58Xb+FeSuHyouG0yg1nECeYdBveBhJl8CKOgeAd4s2YnCKGLpQcgQWBg1sS4zUgG6/gFQixVMrhYgXANcEfbYu5RxE+8u/BQAJPAU34eJKKgx3cwKmX0i/bUdjJ/ClycA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pe7/2+SpaAVAfmvQvq+iLUXFcH3h/zl+ua7xdhkRQLQ=;
 b=NXPJIiWfKfKcnLW57C/l0geDwm02JVwTcmAaSdpxo05CMPVLaVbvHqoNyWD0dUF8AZA9595LW2t7hquXpffYb/b5nJ4FSxAVocOuX9HVq7sv0Nfiq53ZOvjUXXtcvHZzJtwnDg4UCkIFCQsNH5R0UcNCcZ5iQtVqlA/QXhSpKKs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MN0PR12MB6104.namprd12.prod.outlook.com (2603:10b6:208:3c8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 16:08:44 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8114.015; Wed, 30 Oct 2024
 16:08:44 +0000
Message-ID: <0b1094af-fcf3-4df6-a8b7-9c05c3e20fd5@amd.com>
Date: Wed, 30 Oct 2024 11:08:42 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] platform/x86/amd/pmf: Add PMF driver changes to
 make compatible with PMF-TA
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20241023063245.1404420-1-Shyam-sundar.S-k@amd.com>
 <20241023063245.1404420-6-Shyam-sundar.S-k@amd.com>
 <733dbf68-a1a7-43d8-acc2-7f1b8d222427@amd.com>
 <84fe3b9b-cf98-4f49-ae2b-ec1a8759af4f@amd.com>
 <02bf47e4-f39e-4799-bda4-5a65e7f948f2@amd.com>
 <41d66544-6b49-4f22-8c1c-38f14ca47fbd@amd.com>
 <9260af45-4c7a-4e8e-8ab4-16b83ed51ee9@amd.com>
 <02a2c321-33f9-4bcd-9507-3b0788acc287@amd.com>
 <e1502166-88db-4900-8f2d-ef9adfab42d1@amd.com>
 <d7b8d58b-be23-179e-0618-9bcfc54b8d0b@linux.intel.com>
 <63ac59dd-a33b-4bc8-b35c-7bf9329351b7@redhat.com>
 <26109281-38a2-4166-b65d-b52dddceb542@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <26109281-38a2-4166-b65d-b52dddceb542@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0108.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c5::29) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MN0PR12MB6104:EE_
X-MS-Office365-Filtering-Correlation-Id: a40f9fbf-1cc3-4334-1c4b-08dcf8fd20f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OWl1czNDMTBKUFNpOHo3UGVpVFVoWFdtTE91aTAxWThFY2JsaVhBWWkzWHNi?=
 =?utf-8?B?dUJnZjFHS2FyUSsyOXVNMmgrbXJ4T1NsS1F0NHV0YUF1cFpvSDQvbWk4d1M3?=
 =?utf-8?B?dkhLZTNhdm43VEtXYlpacm9NZ3g0dXJLckw0R0R5MkxOS1YxSzVKbWxoVk9o?=
 =?utf-8?B?dVVwOU1uVUhIRmxYS2xHRERTVC9yaGcxS0FIb2l2Tm5VUUwvcTdoZmJuNko1?=
 =?utf-8?B?c2ZEYXh3V2ZId3hPT2tpNzVEdFZ6dlBPbVFyN2xyTzdhL1lTVkhqV1JtVUJN?=
 =?utf-8?B?cUlxRWNqd2FaWDhVWnJKYXlFTzBYcjBKbGNZQVQxTWtTRSsrZTlKR0xGTEFr?=
 =?utf-8?B?Umwxa01EbnJrN3J0bjZOM1JJVGpZOVkvb3B3NmlOQnVybHJJR3RjQUwwNDBE?=
 =?utf-8?B?MTZxd09mSmhUQU5ESjQ5c1NYNHlYSkJ0SC9WNVFwR3N4NTJRaXk4VUNNdkFk?=
 =?utf-8?B?VlpTUHkwQ3o5UGs1Y01TUkpLV3FwbzR2YzZQL3lHMi9tL01vVXlMM2Y3UTBJ?=
 =?utf-8?B?bjRhZUpINU13WjhERWEzMTZqWiszdE5PVjVCM2drQnVXbE9DN1N6OTVZb1FD?=
 =?utf-8?B?TlJ3a2NHY3FDeGY4Z3l3MWFXNGNvWmM3bVBad01rNVhBOVV3aUpiMVA5RUN5?=
 =?utf-8?B?clpWY1A4NVlHN3J4N0txVlpEb1hFcVZQL1hlSzZMbDhLMGdVT2JrWCs5U0cz?=
 =?utf-8?B?alowWFZMZFZPT0xtVzBZQlRvT0NaSitRSlloLyt4OVdILzEzLzYwR1VDaWRw?=
 =?utf-8?B?NFh1cDFIRW9JY0hPWm9WZERjT09TeHVnL1Z4cGR6TWU5ZnRyUHB6U0FobFhV?=
 =?utf-8?B?dmpTL1B1QXZSeWs4LzJQWHNBNlJ5cytRd2p0RkJoVStjN0E5ZmlRM3pVcmNW?=
 =?utf-8?B?M1VhU0IzR20xTnNuRHppQmw2aXhlanl2UDY3dnlXaHd6N2tYYUoxMDkzTGtp?=
 =?utf-8?B?YWMzMFUxTHYvNncybmNtdmI1MU5ZUTNoOWQrWFZvb0JnamhSQjI1TFNUSUhJ?=
 =?utf-8?B?MnEyL09lb2hmWkpFL3ZOaFJadlVENmEvaFJheG9HVWQzQUN4czFVNXJjZ3U2?=
 =?utf-8?B?L00wQzZNVmxGS05xNG1EYXZTMjdGbk5xSW90VWd5elp1dVNUbnBsYXBOMlpz?=
 =?utf-8?B?WjdHdWhMY3lEMWQyMkczNVpyRVhkNjBSNVBwYWtHNWRXdzhMbFIwZks2OWRH?=
 =?utf-8?B?UDcxMkFiNm5jWnB6K1pLRGZ6NkRuSlRSMFZYOTJBQWErWHhIT1ZWR1htNTNV?=
 =?utf-8?B?MDE0eHhRNFBSeVlJT1hHblp3c04rWmRPdkNxSzZWMmFDUzhLN0xXN09CU2hQ?=
 =?utf-8?B?ZE84Q1BPaUF1T2RBSU5Keml6SGVJZERlM2NrQTREU09IYTl0MWZvMjYzYkZL?=
 =?utf-8?B?UGM2L29tNW1IWm5rc0RDZ09DeVFkV21UQ0phMTBPTitiZmFPa2p4VldveERz?=
 =?utf-8?B?encvZkx3L29xeDhGRjh6MDZOSVNEVkh4aFFxSnRzUEJ2QWRSOVAvUXFLTzdF?=
 =?utf-8?B?VUJFMEdMeE52bkVjSnZYd05VUUR0ZUJtWm1Rc1BNYlBpaGtoVnVnZEh4Z3Jr?=
 =?utf-8?B?aXhUN3B6ZTYwWWtEaC94eHBkUUJmUk10aHh1TGQremNFODBiZTdObFBJb2g5?=
 =?utf-8?B?RVJhVU5RVm5uM3RwZGkvN2YzK0pNVjQwb09SSCsxRFN0ZWI0MitRZU1STDZy?=
 =?utf-8?B?M3p2THY5MXdqRkw2NWNnWHl0aUVreThoV2l0V3ZSQ0R0UkNneVAxdngyQ2kv?=
 =?utf-8?Q?SbxVc/et8lf2M5Je7RKFRLKGgpd+1/X3d0wBGvu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VlJpT2RudVNRcHJ2Q0VDeVNYcW9nTE1vU2RBTEFZWDAvSUxrVmFoc0dYcWdO?=
 =?utf-8?B?LzRkL1lCdGYydTdlaTA3bCtpS2F2a3daVzBPMzdSWFprSmt1djR2VmtZeDds?=
 =?utf-8?B?d3djbFMvQVJCVURYUHZPOEdmbjJDdzVxUmg3NTZmSk01UE4yOEpDRU9sdFJZ?=
 =?utf-8?B?SjNnQW5nbWhPWTUzQXdUSTVaQWEyYkFoQ25HdFYrVXFjek9ORlB5RW94RE0y?=
 =?utf-8?B?ZXU2TTNJRlVuTXV5K2ovREM4S1hkcXhvckJINU1KNTd0OGs2cFZTdHZVUm5T?=
 =?utf-8?B?RnhBTEE4UXppYTZyODVobHROLzRWM21zL1dnMEVZcnhlS3RUM21sdzFhYlVn?=
 =?utf-8?B?OWExZ080NzBycVBKQ01kemZTQUtlei91NGtFVkV0dC9uWDJrcnYvYWo4Y2Za?=
 =?utf-8?B?Ky9ONVpKTEFaQXZrV2taQ1pHZ3QrV0dKRTBhT2toM0lWRk44U2d4ckZGU0RC?=
 =?utf-8?B?aTIyVHB3S3RKdkJPOEZUYVcrYkltY0JNWU1sZEZHUzMydXdjRHR5S3F3bjQ2?=
 =?utf-8?B?YmErMlVRQXM3aHA1N3pzSVFrRHBaYXBGd0kyN0grK0dIVkJ2M01SUHlSQzF1?=
 =?utf-8?B?ZmRsWVM5b3ZnUFFSNDZoSjF5Z1h3SlhNVXBWM3l0STNBUzBWUG1sNm52Mm1r?=
 =?utf-8?B?TUhhVk13VWx4OGtNcWFVQkR2eXdSVHNOdHZxY2kzV2dPajUxQVFlYXg4eGs1?=
 =?utf-8?B?VFNsWjlPUHJuQkc2enY2SmlaV1VYUlRIRk8zVFFPa3c3c3A4ZGNlamVtZGdB?=
 =?utf-8?B?TzhIeE03T2daelltc0pEeFZSY0FnY0ZHUUwvYWoyczhBTEtNQ2FZbGJqUDNi?=
 =?utf-8?B?clBMMjRrazhjTkxVSHRuMkJpN1d4UmN3L2lPbk1QdExIaFJVUDZOY0c3ZlhN?=
 =?utf-8?B?ekpZekNDdEI1b0dkU1BpZzFnRXhIam5YR1ZZNzM2UWIyNjdiOFZCQWxDQUxm?=
 =?utf-8?B?ZFh6N1ZyVVhtOWpaZFBzcDUxcWV6UVdpMjl2RzVKVHo2Qk9LQm5aeWY1WDlS?=
 =?utf-8?B?WEgvSm8vZ0hQWDFybmwxdnBvYzViM1gyWHZvcm85SWpJZjNvV2tRNG1QcHlr?=
 =?utf-8?B?SUtoOW9LVEVqMHNTUEZ4blJSSHp0bW9zdWlxd0V5Qmp3ZG9zSDFmWFBNYlkw?=
 =?utf-8?B?Zk80Y1lVMlMxSHpqRjZYazAzcjVSazRPeFZnMm9mWWpUM0M3Y1FvWkx4SHBw?=
 =?utf-8?B?KzFtZEhDL2x4ay9uWUNYb0xhRE1ZV3MrTmNEalhYVGw1SUkxY0MzVVl3Uld1?=
 =?utf-8?B?bllveThwczE3bzB2bDdJK2xVYk45OVJyRTJzbXBiOGxsWlFNL21PdTJOWW4r?=
 =?utf-8?B?TmM2NFBNQlRDN2U5cG5rTjJTRm93S25YTkE3ZkJ0OFRHeFFoTG5KQk5mQWl3?=
 =?utf-8?B?bTZ2cFNXUkdtaGJrUGRuaHZtWnErWnh2T1B5UXlRY1lYL2tFL3hCd01weW5D?=
 =?utf-8?B?R2p1L25TdU5ZdE0vSGJiLy9JWG1VQWQyd2UrMGdDVHRPN2Z6dzhIbXF6ZEVG?=
 =?utf-8?B?ME0wbzVxT3dwSWtqTmJiTzI4eVNuL0NjY2U5VjBtS3dWTEx4ckFXN2wwM056?=
 =?utf-8?B?VHo3UzgvQisrbUJaeHhaQ2FDNnk4dlZxVnBOK0RmcG8ySFdiNkZIaTBXME1h?=
 =?utf-8?B?ZDFlZUFRMEtjT00zOTVWUTlrZmJVUldOYWl2RjVDeHNCSU4vclNqakdFRGhB?=
 =?utf-8?B?d2szckxBYTNTRjFHSUdVYzN6ZmVjZUQ0L1R0M3hkcmtwSk1aaXczc1EzTDg1?=
 =?utf-8?B?K0ZHL2pYelJvMDA1Q3d2SFdFWmxPdGhPT3JnSk12bXFhNnphSTFhTW1KZ3F6?=
 =?utf-8?B?UkR5VHlBQnMvYmdSdTc4VzF3U09aZHdFMy9jSkVtNFZMbG9nU25ndytzNmdU?=
 =?utf-8?B?bXk4Q3FBYnZ2dHNHam1hVVRsMjVWRkpwcDBla3ZoeitxK1ZYeVgvMlNRTnJm?=
 =?utf-8?B?eFR2aTdCNGNhaW1QUFl2cFZscWxBOEtXSGppNE1PK09KS0gxbEhKUnFVeEJD?=
 =?utf-8?B?amp4cTgzQTJiOTZORTVQSGZWZ1JpZGFnZXhLV2hRTjgrY0NFNnpPdXNzT2tQ?=
 =?utf-8?B?MUV3SkdJV3gwL2syMDN1eW5OMDRrOVVnN0pqUXFIMmNyMS9DWG9ZcCtrU2ty?=
 =?utf-8?Q?3ClLLQa73xG30TvEkLEnI/bz3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a40f9fbf-1cc3-4334-1c4b-08dcf8fd20f0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 16:08:44.4134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QacLmqNXY7VokQKcbfB91rS3z65q+qSelQdJDtQxxqSn8xeS7kVkuW7DOA0e0VZ+LFSaU2DHHNkI1sP+MjS+ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6104

On 10/30/2024 11:03, Shyam Sundar S K wrote:
> Hi,
> 
> On 10/30/2024 19:30, Hans de Goede wrote:
>> Hi,
>>
>> On 29-Oct-24 3:07 PM, Ilpo Järvinen wrote:
>>> Hi Hens,
>>>
>>> There a question / item needing your input below.
>>>
>>> On Wed, 23 Oct 2024, Mario Limonciello wrote:
>>>> On 10/23/2024 10:52, Shyam Sundar S K wrote:
>>>>> On 10/23/2024 21:10, Mario Limonciello wrote:
>>>>>> On 10/23/2024 10:32, Shyam Sundar S K wrote:
>>>>>>> On 10/23/2024 20:04, Mario Limonciello wrote:
>>>>>>>> On 10/23/2024 09:29, Shyam Sundar S K wrote:
>>>>>>>>> On 10/23/2024 19:41, Mario Limonciello wrote:
>>>>>>>>>> On 10/23/2024 01:32, Shyam Sundar S K wrote:
>>>>>>>>>>> The PMF driver will allocate shared buffer memory using the
>>>>>>>>>>> tee_shm_alloc_kernel_buf(). This allocated memory is located in
>>>>>>>>>>> the
>>>>>>>>>>> secure world and is used for communication with the PMF-TA.
>>>>>>>>>>>
>>>>>>>>>>> The latest PMF-TA version introduces new structures with OEM
>>>>>>>>>>> debug
>>>>>>>>>>> information and additional policy input conditions for
>>>>>>>>>>> evaluating the
>>>>>>>>>>> policy binary. Consequently, the shared memory size must be
>>>>>>>>>>> increased to
>>>>>>>>>>> ensure compatibility between the PMF driver and the updated
>>>>>>>>>>> PMF-TA.
>>>>>>>>>>>
>>>>>>>>>>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>>>>>>>>>>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>>>>>>>>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>>>>>>>>
>>>>>>>>>> How does this present to a user?  From what you describe it seems
>>>>>>>>>> to
>>>>>>>>>> me like this means a new TA will fail on older kernel in some way.
>>>>>>>>>
>>>>>>>>> Newer TA will not fail on older systems. This change is just about
>>>>>>>>> the
>>>>>>>>> increase in TA reserved memory that is presented as "shared memory",
>>>>>>>>> as TA needs the additional memory for its own debug data structures.
>>>>>>>>
>>>>>>>> Thx for comments. But so if you use new TA with older kernel driver,
>>>>>>>> what will happen?  Can TA do a buffer overrun because the presented
>>>>>>>> shared memory was too small?
>>>>>>>>
>>>>>>>
>>>>>>> New TA will fail on older kernel and hence this change will be
>>>>>>> required for new TA to work.
>>>>>>
>>>>>> OK, that's what I was worried about.
>>>>>>
>>>>>>>
>>>>>>>>>
>>>>>>>>>     From user standpoint, always be on latest FW, irrespective of the
>>>>>>>>> platform. At this point in time, I don't see a need for FW
>>>>>>>>> versioning
>>>>>>>>> name (in the future, if there is a need for having a limited support
>>>>>>>>> to older platforms, we can carve out a logic to do versioning
>>>>>>>>> stuff).
>>>>>>>>
>>>>>>>> I wish we could enforce this, but In the Linux world there is an
>>>>>>>> expectation that these two trains don't need to arrive at station at
>>>>>>>> the same time.
>>>>>>>>
>>>>>>>>>
>>>>>>>>>> Some ideas:
>>>>>>>>>>
>>>>>>>>>> 1) Should there be header version check on the TA and dynamically
>>>>>>>>>> allocate the structure size based on the version of the F/W?
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> This can be done, when the TA versioning upgrade happens, like from
>>>>>>>>> 1.3 to 1.4, apart from that there is no header stuff association.
>>>>>>>>>
>>>>>>>>>> 2) Or is there a command to the TA that can query the expected
>>>>>>>>>> output
>>>>>>>>>> size?
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> No, this is just the initial shared memory that the driver allocates
>>>>>>>>> to pass the inputs and the commands to TA.
>>>>>>>>>
>>>>>>>>>> 3) Or should the new TA filename be versioned, and the driver has
>>>>>>>>>> a
>>>>>>>>>> fallback policy?
>>>>>>>>>>
>>>>>>>>>> Whatever the outcome is; I think it's best that if possible this
>>>>>>>>>> change goes back to stable to try to minimize regressions to
>>>>>>>>>> users as
>>>>>>>>>> distros update linux-firmware.  For example Fedora updates this
>>>>>>>>>> monthly, but also tracks stable kernels.
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Advisory to distros should be to pick the latest PMF TA (note that,
>>>>>>>>> I
>>>>>>>>> have not still submitted to new TA FW).
>>>>>>>>
>>>>>>>> Yeah we can advise distros to pick it up when upstreamed as long as
>>>>>>>> there isn't tight dependency on this patch being present.
>>>>>>>>
>>>>>>>
>>>>>>> That is the reason I am waiting for this change to land. Once that is
>>>>>>> done, I will submit the new TA, you can send out a advisory to upgrade
>>>>>>> the kernel or this change has to be back-ported to stable/oem kernels
>>>>>>> for their enablement.
>>>>>>>
>>>>>>> Makes sense?
>>>>>>>
>>>>>>
>>>>>> I think we need Hans' and Ilpo's comments here to decide what to do.
>>>>>>
>>>>>
>>>>> Sure.
>>>>>
>>>>>> I will say that when we had this happen in amdgpu for a breaking
>>>>>> reason there was a new firmware binary filename created/upstreamed for
>>>>>> the breaking version (IIRC foo.bin -> foo_1.bin) and amdgpu had to
>>>>>> have fallback code so it could be compatible with either binary.
>>>>>>
>>>>>
>>>>> True. In case of amdgpu, the FW loading is part of the amdgpu driver.
>>>>> But in case of PMF, the PMF TA gets picked from the AMD TEE driver
>>>>> through the TEE commands.
>>>>>
>>>>> So, there is no need for FW versioning logic in PMF driver.
>>>>>
>>>>
>>>> That's a very good point, and this is a lot of complexity then.
>>>>
>>>>>
>>>>>> * If user on older kernel took newer linux-firmware package they used
>>>>>> older binary.
>>>>>> * If user on newer kernel took older linux-firmware package they used
>>>>>> older binary.
>>>>>> * If user on newer kernel took newer linux-firmware package they used
>>>>>> newer binary.
>>>>>>
>>>>>> If the decision is this goes in "as is" it definitely needs to go back
>>>>>> to stable kernels.
>>>>>>
>>>>>
>>>>> IMHO, let's not put too many fallback mechanisms. The philosophy
>>>>> should be use latest driver and latest FW that avoids a lot of
>>>>> confusion and yeah for that to happen this change has to go to stable.
>>>>>
>>>>> Thanks,
>>>>> Shyam
>>>>
>>>> Of course Hans and Ilpo make the final call, but I think from our discussions
>>>> here it would be ideal that patch 1 and patch 5 from this series go into 6.12
>>>> and have stable tags, the rest would be 6.13 material.
>>>
>>> Distros and SW component management challenges are more in the domain of
>>> Hans' expertise so I'd prefer to hear his opinion on this.
>>>
>>> Personally I feel though that the commit message is not entirely honest
>>> on all the impact as is. The wordings are sounding quite innocent while if
>>> I infer the above right, an incorrect combination will cause a
>>> non-gracious failure.
>>
>> There are basically 4 possible scenarios and to me it
>> is only clear from this thread what will happen in 3 of
>> the 4 scenarios :
>>
>> 1. Old TA fw, Old kernel (TA_OUTPUT_RESERVED_MEM=906) -> works
>> 2. New TA fw, Old kernel (TA_OUTPUT_RESERVED_MEM=906) -> broken
>> 3. Old TA fw, new kernel (TA_OUTPUT_RESERVED_MEM=922) -> ???
>> 4. New TA fw, new kernel (TA_OUTPUT_RESERVED_MEM=922) -> works
>>
>> If the answer to 3 is: "works" then I agree that this patch
>> should be submitted to Linus as a fix with Cc: stable ASAP
>> and then once that has hit most stable series it should be
>> ok to upgrade the fw in linux-firmware
>>
> 
> Short answer, "yes" it does not work for "3." and you can consider it
> a broken.
> 
>> Note this is still not ideal but IMHO it would be ok.
>>
>> But if the answer is "broken" then we will really need to
>> find some way to unbreak this, which could be as simple
>> as querying the fw-version and basing the size on this,
>> but having a kernel change which will regress things for
>> users who do not have the old firmware yet is simply
>> not acceptable.
>>
> 
> I am not sure if there is a firmware versioning interface that the ASP
> (AMD Security Processor) returns back the kernel/driver.
  > The code path in this case is:
> 
> AMD PMF driver -> AMD TEE driver -> AMD CCP driver -> ASP TEE -> ASP
> TA -> ASP HW.
> 
> So, I uncertain which module has this information and where exactly
> the code of fw versioning has to reside. It will take a while for me
> to dig this in.

As a solution to this, can amd-pmf explicitly do it's own 
request_firmware() call to load the firmware binary and determine the 
size to use in the array and then discard the loaded binary?

This would let the TEE module still do it's own load later like normal 
without having to plumb this information across subsystems.

> 
> Meanwhile, shall I drop this patch and resend the series (by
> addressing the dev_dbg change Mario commented) so that this atleast
> becomes a 6.13 material?
 > >
> Thanks,
> Shyam
> 
>> Regards,
>>
>> Hans
>>
>>
>>
>>

