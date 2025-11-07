Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011028.outbound.protection.outlook.com [40.107.208.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FB8304BB8
	for <platform-driver-x86@vger.kernel.org>; Fri,  7 Nov 2025 06:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762498731; cv=fail; b=RQDY9aGNjZ8jMp00rJU2PAizb8pH9AvlE3jtJqPdn13/GZ3C3vjiwscyHDID8mK3e7ADi5HW/5chuiYvmS2mK2470JqjJqm/K7p8T77fEM95FYDaYfo1JNAjk7hYBnJj0uQYupCpiL8fa2vO0enMv6pIlAACUlf3N7BvzDrUHz4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762498731; c=relaxed/simple;
	bh=/CXSlPcoGweW/pi89Lac5RRuVlKk31lMF/3o+uLHR7Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MJNYkPwXfmnGphJGImLd5LaA1tL2fqN/ukOkqiFJXJkWfV/0skm2uPOWlzYEQHT2dwbsufVxO0HcYmwJN+/l6G3YpNCJnoObjE7z3p3NBm17BerqF6gd5MuKZonRZkU8FTudpO1uv5ZDkDXqZk4PfoPJqBlWda+Q+lkGZc8G/AQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2MR55Inz; arc=fail smtp.client-ip=40.107.208.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2MR55Inz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZW09ko+3aOefQNkaAmUEYwhPiH4NA4G34KTiRBZ/B2Tz/i8ZPUswA0vqZXkzLC+Y8grbfgpNcKQS8uhOzrc9igGgpZ2KD9WVLXn0pSpLV/69xP6RkwLRsr4dwc1PhhonF8Py057eYwfnjoEA4/QYBfVxJHsbYMltBouHL9J+5Z1ySXwz/y1NZUzIzhj5ispaI2TfrRYGl7AXq0GRqdUPcM8jx+vqMdtOHCGvUpIVKXKYMZiNyfdLxu9H+P3iyWo3vO+PZ5/3uzUXBmYhvdX1vr/BwnBjyvd66lRSlTMt2u/OSr2jZtKxkL/71JTceW+Z9QZ84wiABjY4tASCZUkIng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ShDbwDCEWns+aoJzy1Ub1A50xDBHw8BbTAMcoqwWo74=;
 b=BrRO8BgRCzmGDVD6JW7IxniJczY0WbYGUU4hTfC+gSgG7TpJgcwJRRxUwxp1svPdXLvnv8ArE2aYgTwzdXrNw5egKouT4Hc1yVMmIR+MSVQpgreY4OrQMfYQ6OQBNDlUopkv68CwP5VuefkPTRAH8H0sxTt4/vtJe0dnERDBConfu4WUOPVDJAP1to52pP48HG7AIAVSAueyuIoTD30DkgeYWsg7Y+75njOs8peRCdrW9l4cTtqk61jl2+bVu4q1MgtFZ2Iua7bsorD5cXUyMNmmDRnKpnLTUIk9eYTWh57euhUQd2JAaHmmMn0nckFAD+EuDpgeGkJb1JAVPj24fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ShDbwDCEWns+aoJzy1Ub1A50xDBHw8BbTAMcoqwWo74=;
 b=2MR55InzXvN3+mLPV3GX4h9emsJQ/cXDJg6j9QXVJApanRxuFHhNITpDdmwIskgRrF+9ZQFqP7fewlS0Q03IgPc8PK4wTwvE9xY5I5o1k8NAIGBlzFlZAtJ731xzyXM/MLL5X5TFPCGBJTJKrp0EOhkyXqEnPm1atFyVxpfoTms=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by BN7PPFD6BF22047.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6e4) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 06:58:46 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%6]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 06:58:45 +0000
Message-ID: <e805d898-31ae-4433-8302-8b3758213039@amd.com>
Date: Fri, 7 Nov 2025 12:28:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] platform/x86/amd/pmf: Use ring buffer to store
 custom BIOS input values
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: hdegoede@redhat.com, platform-driver-x86@vger.kernel.org,
 Patil.Reddy@amd.com, mario.limonciello@amd.com, Yijun.Shen@Dell.com
References: <20251015145457.3231583-1-Shyam-sundar.S-k@amd.com>
 <20251015145457.3231583-2-Shyam-sundar.S-k@amd.com>
 <b0a559b4-c7fe-90c1-27a2-7dcd5d29e146@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <b0a559b4-c7fe-90c1-27a2-7dcd5d29e146@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BMXPR01CA0089.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::29) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|BN7PPFD6BF22047:EE_
X-MS-Office365-Filtering-Correlation-Id: d8087ef9-0ab7-4fec-7b2c-08de1dcb17b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WkFzSnpxa0xDdkpNSktTZTg5MzBJekk2UkUrOG9UNkFsSkhTOTNBZFRoeHd4?=
 =?utf-8?B?c3VnTmdVSTlkVWhBOVhML2FkYUxlY21XRllyRGhHcnFjTVlUU0J4aWladU51?=
 =?utf-8?B?VExTdkp4cjhUMEVKRzU0RjZjSHp4VEI5R2xybVlZZklTOW9vdGNqeXkxMXN0?=
 =?utf-8?B?cmV4dnVUaFViV1RyVTBPRmc0L1dyd2p3UU8xLy85SnAzZkxOTkgzdFFvcHRT?=
 =?utf-8?B?RXRaZlpYWlVreFp3Sk9sV3JGVXBOMVlzZ0ZtQUFvUzE5VkUzNzJrSCtZMUdS?=
 =?utf-8?B?VWFDQ09iWVYwS2JQVUZWMVIwZHg5aEswM0VVVnRjTy8yelFMa2ZXN29IZUF0?=
 =?utf-8?B?ZExVMzFJdnRUY0tQZDcreExjNDd4dDZUb1RFUVVSYWR5ZHJ5U2prMDVTUndu?=
 =?utf-8?B?QkkzNEVDVEV2aFNpdWxVeVhINUIwdVlqcldzVHphS09zdG9WUFJuSG1lWnF5?=
 =?utf-8?B?SDNoOVhFQnhXOGlDWm5Kb1YrTWlIL0g1S1ZzYlZWT3dMWDZQTnQ5YWFwRTh6?=
 =?utf-8?B?TERUZEwyV0szOEFkWi9SRXFmZmpSN1IrdDVGZ0IwQlpYamtCTUtZdGkxa2d6?=
 =?utf-8?B?eHRweE9OSy84RnF4OTJ6VjRIZmlCTTN5Y1h2RnFNcXczeEppZ0JER2xmQ1o1?=
 =?utf-8?B?bnozNnJ2emg2M2NrRkVGYzlWVmVpeWx4R0R0WURIbTJpVjdiS0tXNkF6QWZi?=
 =?utf-8?B?b0x0Vjh6eUxwL21PYWdXUHhmSm9GLzVTUUlWeWYzZ3BwdTUxT0RvTCtsUGp4?=
 =?utf-8?B?UDRsSks0M3BsQlRLeFE3OE5iSi9HRkNDVEwxbFZjY1ZKdi92Wk9ERmpaY3dr?=
 =?utf-8?B?MENuWE56eVB5bE9hb1FLZUhRZlA3NGZRVFR6OUhQWGxjVVYvMks2MG91QVVK?=
 =?utf-8?B?UVk0R2U3cnc0L0h1c1c0SmZveHhKb0FLREVWZUtna1dEMVRVdjIwR3pQakNo?=
 =?utf-8?B?OTZ3VUN6dVMxMGFzc0ZwWitiV3VKUFpnczZnOFBVbXk4K1BhM040WVdVQ3hi?=
 =?utf-8?B?RDJoRWxWazlxK2E1L0o1aTA4bVhFd3d4NWFaL2dhbkpkdmQxSFlacEppUjA3?=
 =?utf-8?B?YTNrK1BvMURvVi9PeFBXb05uU2U3RHZkMU9rOFNVUTRqQTZTQmtZMXo0MVRa?=
 =?utf-8?B?ME4zZGJNOEhQaUNDeHM2alVVbWNTVzNKUkVCK1BTM0NpVzZUZ3c0cGw1eHpo?=
 =?utf-8?B?eFZ2MzRsay9XU3c2cmFpaGNOZUZNeitKV1owRFNFY2t3a2lQb3FmNDFqeDFr?=
 =?utf-8?B?aEc1VXBuU2JnbC9YMWJzcjlVR0E3aU0vZVBtSHRVYXdhRjE5Wm9vUkVHdWpW?=
 =?utf-8?B?QmxObDhSeGxJa0pKcmpHT2FRQlBBTXhIbmoyK214Nnh6elJwQ3pUbkJaTEhD?=
 =?utf-8?B?MzgzaVVWajlVcllPdGxjaEFaQjhSc2g1Y3VEL1Q2UEkzQlI3VmszdFdJRngw?=
 =?utf-8?B?NE00ZjNCVmNXbE9GY3gzVzUvQTVvUXpjd25aNkloL2lrL3U0OThlM1NzT0gr?=
 =?utf-8?B?cUdyTm9wcmcrQ1M3N0FyaHJjM21RbkY5Z0VHYWhoVVJlK0Y0cGJnMUh6SS9N?=
 =?utf-8?B?TU5uTXUvS1E2WUk1eEVseFVoQ1llMGc0d3IzUW1EQ0xtMVpObElnQXk1Snht?=
 =?utf-8?B?MVo0RUxSMVo0Wkk2cWREb1lLWVBVUk4wZ0Z1bXczSEM2NnliSlg0SURxTXY4?=
 =?utf-8?B?QWpLZ0l3UzNHZ3RGU3hrN0NEenk2ZVd0THVGTklxcHA2d0c2SDM1aHZwUFVm?=
 =?utf-8?B?RGF5UFArYVhaQy8rcjBMT2RtSE40VStSNllxb0E5czlZQStlV3IwSk55SHgr?=
 =?utf-8?B?cUdXQVBURkJla3lNRGxVS21vMHI2VWgwYTFKU2QzUjhVVUxkRDFaVDhYd2p2?=
 =?utf-8?B?MVVVMUt0MDhwRFVpL1QvcE9xOG9iQ3VWUmlibDQrQXZ4VVVnekN5RUlIWVhh?=
 =?utf-8?Q?74InXgLf954xXlFosAJJCYNATN6RYuth?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGdzNk9Ocld2ajR6czFFOTBkRUJZTGRVZmx2MFVwajlxOGFXaEQxQ1JiOEJR?=
 =?utf-8?B?VVFaUG13U2RVNmp4Rm1XbTZCS1cvZGlVUWtLUWZTVUtKUWRwRzlaZ21HbVlH?=
 =?utf-8?B?QUwwYkYza2FLMThhQUNsUFJrOS9Kdmh0c0NpSmtsQWgrZUIvM0w4WDV6VE9y?=
 =?utf-8?B?cm1kRy9qWkI5dTFHNWlxdE9RaHpZcDRHWElSNUN3bE9BK1Zvb3ZPYS93bXVB?=
 =?utf-8?B?d2dYSzdPbnpSNkcwTHh2YUlYbXU0VDJUN2txRkw4LzUxNElqMlZqNU1uZitH?=
 =?utf-8?B?TjNxM3VTb0xXRS9vejZrREljY1lNZm1ldk5Kc3h5S3FnNVp1b0RDU1lwd3dl?=
 =?utf-8?B?bkpUR3E5bkh4UDBmY0d5Nit1YjE2V1Nicm0vdHZoQU9VMStRMlBkV0hxbUN4?=
 =?utf-8?B?c0swQzYzOVloL3lCMlhCM2ZUaFg2am5ERHZDUTBGQ0RHWVVwbmcwenUydWE0?=
 =?utf-8?B?emFDLzd3ZFdQbHJ3Z0lwU09Oa2J0WHBoRldWUEdXTVFBVEM4UGYvYVhVZ3dF?=
 =?utf-8?B?bUdqOTNjN09ndnRxWHBZNTZPWkljQUQ2RmxBNkQwNnVwVUdIeWJrWDRUaGVT?=
 =?utf-8?B?UXRyNktiemN1eEpkcTBVMHA2RzViYTFYb0hYbE5GN0xnMVlOdmpMRHRYZFR0?=
 =?utf-8?B?RE9qMDZJRWxwUTcydDErNC9Wc3ZJejFuUGVBUGRucDVqQThRcDBET0hacFFk?=
 =?utf-8?B?MlRxWUptQ2VLcGpOOHVLaVkvcCt0T0piM0loaDAzMTlPOVlUL0o1c2NjTzlY?=
 =?utf-8?B?N3RjaGh3YllLZjNZTFBNQWhXb08vWm1RZFJiSjBZbUZ6MHlXV1QrUytHRzRP?=
 =?utf-8?B?L2w3UVJlNmovakdQT094Rk5RVlFIWVdxenovdlJVODh0a1hVc3pkRERYUU9E?=
 =?utf-8?B?aGNnVUJweG4vaHJ5WlZtc2FMRCs5UHpNWk1MUkNkUVpsczhQNFQyYjZMSFAw?=
 =?utf-8?B?eHV1NXVpMTJIVCtpaDFJeUNhbnY4UUdBWkRqZ3ArOTdFc25SRlFTSXlKenlM?=
 =?utf-8?B?aHl1dzdyWGZLMVdnTlo0OVI0T3B2Qm8yclFDd096ZkZSajlqRWUzNDV2MXg2?=
 =?utf-8?B?T0JoR0FlV0ZDVFM3dVNpUjlPUHlMdmlWR1hvck4ra1VRMUdTcW5RQjkyaEVr?=
 =?utf-8?B?dVFYS3BnTGUwYU5WOWQrd0FEZzRzVFpCM3llNmdrZ09Uc01Vakl0R1lIWDgy?=
 =?utf-8?B?LzBCTGpDVjVtTHhPVmR1b2gwQzZKMUN5UzloRGUrR0hxYmx2KzByQWE1dG9h?=
 =?utf-8?B?ckVyRDR1TEdEMjhOcUlzRHpkSnAvOTQ0aGt4bG9xd3diNnhlQUwwbStKNGVC?=
 =?utf-8?B?aEtRV1ZWNjdSTWVwTTMrR0RibXErdENkd1ZsODF1VkYwclBZMSswcEorVzIv?=
 =?utf-8?B?UjJHYzQzU09GeTZkeExmZDdsaUx0MlFVUzdWd2xrQktKbFZMRndEUmk4Wno4?=
 =?utf-8?B?YzcvdDNrQ1hGd0trSldXdEhZRUc0K2VHYWUxa3dRSzdpZzRocHZ1Z1JMYkxN?=
 =?utf-8?B?T05GOHdMLzIvYWJUSTZJK0NaMnplMUJsWEVYQlBwdktOYkwxOXR5YVJjYjZ5?=
 =?utf-8?B?aitrQnhhRHRHUVBYM1NtTGdBZjJEYUlqdnhrS0FJNG1PRStiUURKc1kwbTNQ?=
 =?utf-8?B?SlIwNlZDdXFoTTV4NjZDcHV1eE5EcWlkMkV6YUIwaEpUdHNqWU5KTWdhbmdr?=
 =?utf-8?B?bVIvUGRoRlV1dlpBVDdEOVhGcHFhdHR3eGdXcWQvKzB0MGpnRXAwVXdOeFAw?=
 =?utf-8?B?b2xxbVdBa1N6UnljeHJTYmdScHJyTllucDE4SEdWbnlMaXZMcnk3aUdYRklt?=
 =?utf-8?B?aElzOENJMHZOdFczZzZiaDltaWxrQ2dEdzVjRE5NY0dPYk5GbmcvWGhPT3lV?=
 =?utf-8?B?SHhmNmgvU3graHhtU0dPRFpZRmE2a0twOVFFbHdneDloY1lsdnFtd0FEVVNm?=
 =?utf-8?B?SENoa0gwajBtQmdheUVkeUhXT3JVbnc4RExZdjNOQm5uQ0l6M3N1eGR0UlBs?=
 =?utf-8?B?T2hMek1YcGZpNHZpd2RDYzNtOGpZRGhzaHY0SXZXR1lsYURya25EQktackFq?=
 =?utf-8?B?WkFRUDA3Rkw1anVrTVFFVU9TYWtCQUMvU1lIQndFTWYvN3NkNHFwT0FxdzdO?=
 =?utf-8?Q?WvfXtdUCTG8WXUy2vISZhY1wL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8087ef9-0ab7-4fec-7b2c-08de1dcb17b2
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 06:58:45.8316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xsyzM94Kfr0fjlnhmdZ1bJsrTJgUXFgvffdaUJpxNZlCImQ5EwIzsz17daz1AvPBDN9DBOM9+N04nUJX2B6TTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFD6BF22047



On 11/5/2025 22:16, Ilpo Järvinen wrote:
> On Wed, 15 Oct 2025, Shyam Sundar S K wrote:
> 
>> Custom BIOS input values can be updated by multiple sources, such as power
>> mode changes and sensor events, each triggering a custom BIOS input event.
>> When these events occur in rapid succession, new data may overwrite
>> previous values before they are processed, resulting in lost updates.
>>
>> To address this, introduce a fixed-size, power-of-two ring buffer to
>> capture every custom BIOS input event, storing both the pending request
>> and its associated input values. Access to the ring buffer is synchronized
>> using a mutex.
>>
>> The previous use of memset() to clear the pending request structure after
>> each event is removed, as each BIOS input value is now copied into the
>> buffer as a snapshot. Consumers now process entries directly from the ring
>> buffer, making explicit clearing of the pending request structure
>> unnecessary.
>>
>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>> v2:
>>  - Add dev_WARN_ONCE()
>>  - Change variable name rb_mutex to cbi_mutex
>>  - Move tail increment logic above pending request check
>>
>>  drivers/platform/x86/amd/pmf/acpi.c   | 41 +++++++++++++++++++++++++++
>>  drivers/platform/x86/amd/pmf/core.c   |  2 ++
>>  drivers/platform/x86/amd/pmf/pmf.h    | 20 +++++++++++++
>>  drivers/platform/x86/amd/pmf/spc.c    | 23 +++++++++------
>>  drivers/platform/x86/amd/pmf/tee-if.c |  2 ++
>>  5 files changed, 79 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
>> index 13c4fec2c7ef..870a56f1fe07 100644
>> --- a/drivers/platform/x86/amd/pmf/acpi.c
>> +++ b/drivers/platform/x86/amd/pmf/acpi.c
>> @@ -331,6 +331,43 @@ int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req
>>  									 req, sizeof(*req));
>>  }
>>  
>> +/* Store custom BIOS inputs data in ring buffer */
>> +static void amd_pmf_custom_bios_inputs_rb(struct amd_pmf_dev *pmf_dev)
>> +{
>> +	struct cbi_ring_buffer *rb = &pmf_dev->cbi_buf;
>> +	struct bios_input_entry entry = { };
> 
> Too generic struct name.
> 
>> +	int i;
>> +
>> +	guard(mutex)(&pmf_dev->cbi_mutex);
>> +
>> +	switch (pmf_dev->cpu_id) {
>> +	case AMD_CPU_ID_PS:
>> +		for (i = 0; i < ARRAY_SIZE(custom_bios_inputs_v1); i++)
>> +			entry.val[i] = pmf_dev->req1.custom_policy[i];
>> +		entry.preq = pmf_dev->req1.pending_req;
>> +		break;
>> +	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>> +	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
>> +		for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
> 
> Add include.
> 
>> +			entry.val[i] = pmf_dev->req.custom_policy[i];
>> +		entry.preq = pmf_dev->req.pending_req;
>> +		break;
>> +	default:
>> +		return;
>> +	}
>> +
>> +	if (CIRC_SPACE(rb->head, rb->tail, CUSTOM_BIOS_INPUT_RB_SZ) > 0) {
>> +		rb->data[rb->head] = entry;
>> +		rb->head = (rb->head + 1) & (CUSTOM_BIOS_INPUT_RB_SZ - 1);
>> +	} else {
>> +		/* Rare case: ensures the newest BIOS input value is kept */
>> +		dev_WARN_ONCE(pmf_dev->dev, 1, "Overwriting BIOS input value, data may be lost\n");
> 
> Is this really WARN_ONCE thing? That is, does it indicate a bug in the 
> kernel code?

If we hit this case, we might end up in a debug spew and hence put it
under WARN_ONCE (that way we are not lost in debugging the odd cases,
if we are under this scenario).

Not a bug in the kernel code..

> 
> Add include.
> 
>> +		rb->data[rb->head] = entry;
>> +		rb->head = (rb->head + 1) & (CUSTOM_BIOS_INPUT_RB_SZ - 1);
>> +		rb->tail = (rb->tail + 1) & (CUSTOM_BIOS_INPUT_RB_SZ - 1);
> 
> Since you're under lock, can you make room separately first and then add
> the entry on a common path?
> 
>> +	}
>> +}
>> +
>>  static void amd_pmf_handle_early_preq(struct amd_pmf_dev *pdev)
>>  {
>>  	if (!pdev->cb_flag)
>> @@ -356,6 +393,8 @@ static void apmf_event_handler_v2(acpi_handle handle, u32 event, void *data)
>>  	dev_dbg(pmf_dev->dev, "Pending request (preq): 0x%x\n", pmf_dev->req.pending_req);
>>  
>>  	amd_pmf_handle_early_preq(pmf_dev);
>> +
>> +	amd_pmf_custom_bios_inputs_rb(pmf_dev);
>>  }
>>  
>>  static void apmf_event_handler_v1(acpi_handle handle, u32 event, void *data)
>> @@ -374,6 +413,8 @@ static void apmf_event_handler_v1(acpi_handle handle, u32 event, void *data)
>>  	dev_dbg(pmf_dev->dev, "Pending request (preq1): 0x%x\n", pmf_dev->req1.pending_req);
>>  
>>  	amd_pmf_handle_early_preq(pmf_dev);
>> +
>> +	amd_pmf_custom_bios_inputs_rb(pmf_dev);
>>  }
>>  
>>  static void apmf_event_handler(acpi_handle handle, u32 event, void *data)
>> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
>> index bc544a4a5266..8b97eba00dd3 100644
>> --- a/drivers/platform/x86/amd/pmf/core.c
>> +++ b/drivers/platform/x86/amd/pmf/core.c
>> @@ -468,6 +468,7 @@ static int amd_pmf_probe(struct platform_device *pdev)
>>  	mutex_init(&dev->lock);
>>  	mutex_init(&dev->update_mutex);
>>  	mutex_init(&dev->cb_mutex);
>> +	mutex_init(&dev->cbi_mutex);
>>  
>>  	apmf_acpi_init(dev);
>>  	platform_set_drvdata(pdev, dev);
>> @@ -494,6 +495,7 @@ static void amd_pmf_remove(struct platform_device *pdev)
>>  	mutex_destroy(&dev->lock);
>>  	mutex_destroy(&dev->update_mutex);
>>  	mutex_destroy(&dev->cb_mutex);
>> +	mutex_destroy(&dev->cbi_mutex);
>>  }
>>  
>>  static const struct attribute_group *amd_pmf_driver_groups[] = {
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>> index 2145df4128cd..6cb1e228c48e 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -12,6 +12,7 @@
>>  #define PMF_H
>>  
>>  #include <linux/acpi.h>
>> +#include <linux/circ_buf.h>
>>  #include <linux/input.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/platform_profile.h>
>> @@ -120,6 +121,7 @@ struct cookie_header {
>>  #define APTS_MAX_STATES		16
>>  #define CUSTOM_BIOS_INPUT_BITS	GENMASK(16, 7)
>>  #define BIOS_INPUTS_MAX		10
>> +#define CUSTOM_BIOS_INPUT_RB_SZ	64	/* Must be power of two for CIRC_* macros */
> 
> This is not really size but there are n entries. The total size will be 
> something else. I'd call it NUM or ENTRIES, or something like that. 
> Perhaps CUSTOM_BIOS_INPUT_RING_ENTRIES but that is a bit to the long side 
> of things?
> 
>>  typedef void (*apmf_event_handler_t)(acpi_handle handle, u32 event, void *data);
>>  
>> @@ -359,6 +361,22 @@ struct pmf_bios_inputs_prev {
>>  	u32 custom_bios_inputs[BIOS_INPUTS_MAX];
>>  };
>>  
>> +/**
>> + * struct bios_input_entry - Snapshot of custom BIOS input event
>> + * @val: Array of custom BIOS input values
>> + * @preq: Pending request value associated with this event
>> + */
>> +struct bios_input_entry {
>> +	u32 val[BIOS_INPUTS_MAX];
>> +	u32 preq;
>> +};
>> +
>> +struct cbi_ring_buffer {
>> +	struct bios_input_entry data[CUSTOM_BIOS_INPUT_RB_SZ];
>> +	int head;
>> +	int tail;
>> +};
>> +
>>  struct amd_pmf_dev {
>>  	void __iomem *regbase;
>>  	void __iomem *smu_virt_addr;
>> @@ -407,6 +425,8 @@ struct amd_pmf_dev {
>>  	struct apmf_sbios_req_v1 req1;
>>  	struct pmf_bios_inputs_prev cb_prev; /* To preserve custom BIOS inputs */
>>  	bool cb_flag;			     /* To handle first custom BIOS input */
>> +	struct cbi_ring_buffer cbi_buf;
>> +	struct mutex cbi_mutex;		     /* Protects ring buffer access */
> 
> Include missing?

yes..

> 
>>  };
>>  
>>  struct apmf_sps_prop_granular_v2 {
>> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
>> index 85192c7536b8..669680ce580a 100644
>> --- a/drivers/platform/x86/amd/pmf/spc.c
>> +++ b/drivers/platform/x86/amd/pmf/spc.c
>> @@ -150,12 +150,23 @@ static void amd_pmf_update_bios_inputs(struct amd_pmf_dev *pdev, u32 pending_req
>>  static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
>>  					   struct ta_pmf_enact_table *in)
>>  {
>> +	struct cbi_ring_buffer *rb = &pdev->cbi_buf;
>> +	struct bios_input_entry entry = { };
>>  	unsigned int i;
>>  
>> +	guard(mutex)(&pdev->cbi_mutex);
>> +
>>  	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
>>  		amd_pmf_set_ta_custom_bios_input(in, i, pdev->cb_prev.custom_bios_inputs[i]);
>>  
>> -	if (!(pdev->req.pending_req || pdev->req1.pending_req))
>> +	if (CIRC_CNT(rb->head, rb->tail, CUSTOM_BIOS_INPUT_RB_SZ) == 0)
> 
> Include missing.

circ_buf.h is included in pmf.h since acpi.c and spc.c are using it.

> 
> As a general comment unrelated to this patch, these files to be missing 
> other headers too.

Yeah. I get your point. Let me add all the relavent missing headers
and respin a new version.

ack to other comments in the patch.

Thanks,
Shyam
> 
>> +		return;	/* return if ring buffer is empty */
>> +
>> +	entry = rb->data[rb->tail];
>> +	rb->tail = (rb->tail + 1) & (CUSTOM_BIOS_INPUT_RB_SZ - 1);
>> +
>> +	/* If no active custom BIOS input pending request, do not consume further work */
>> +	if (!entry.preq)
>>  		return;
>>  
>>  	if (!pdev->smart_pc_enabled)
>> @@ -165,20 +176,14 @@ static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
>>  	case PMF_IF_V1:
>>  		if (!is_apmf_bios_input_notifications_supported(pdev))
>>  			return;
>> -		amd_pmf_update_bios_inputs(pdev, pdev->req1.pending_req, custom_bios_inputs_v1,
>> -					   pdev->req1.custom_policy, in);
>> +		amd_pmf_update_bios_inputs(pdev, entry.preq, custom_bios_inputs_v1, entry.val, in);
>>  		break;
>>  	case PMF_IF_V2:
>> -		amd_pmf_update_bios_inputs(pdev, pdev->req.pending_req, custom_bios_inputs,
>> -					   pdev->req.custom_policy, in);
>> +		amd_pmf_update_bios_inputs(pdev, entry.preq, custom_bios_inputs, entry.val, in);
> 
> Could we pass the entry instead now?
> 
>>  		break;
>>  	default:
>>  		break;
>>  	}
>> -
>> -	/* Clear pending requests after handling */
>> -	memset(&pdev->req, 0, sizeof(pdev->req));
>> -	memset(&pdev->req1, 0, sizeof(pdev->req1));
>>  }
>>  
>>  static void amd_pmf_get_c0_residency(u16 *core_res, size_t size, struct ta_pmf_enact_table *in)
>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
>> index 6e8116bef4f6..add742e33e1e 100644
>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>> @@ -579,6 +579,8 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>>  		status = ret == TA_PMF_TYPE_SUCCESS;
>>  		if (status) {
>>  			dev->cb_flag = true;
>> +			dev->cbi_buf.head = 0;
>> +			dev->cbi_buf.tail = 0;
>>  			break;
>>  		}
>>  		amd_pmf_tee_deinit(dev);
>>
> 

