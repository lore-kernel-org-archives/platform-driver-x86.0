Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011046.outbound.protection.outlook.com [52.101.57.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FC5304BD7
	for <platform-driver-x86@vger.kernel.org>; Fri, 19 Sep 2025 14:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758291670; cv=fail; b=BbyhH6SpNCBCWuNAHEN42N9PL6ooxDvWB9QDXwGMKrj4hhNN/pOQJiFQ3PxWOC7DkP6WUD5vU6UmlAkteAIpZ8zuZBCz0gggVtXlr1T3cowam/3TkIhv8c4OJKzepgYPnm7/pAun7Fg88C15Pd16NZLUFrfLNduCA8LeXcwRKGE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758291670; c=relaxed/simple;
	bh=o2L5YeIu5J5b/ozvDiT/9WUgC+3ILX4D8W8VcKp0grU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=r7jifPSMK3jE2CRXY6YCyKdRbPpEKfPE11jMsNBAX3qT4TocdFrf4o8Dcfxisz8dNjXH3LHXiQ5PBLXRjPzFztMYDp/+cm7WBLMEIC5Zq8nCEC0t2E19+ZDBjcZAS20Dp4s+HjUMsVeEqauoHMTdQpbRoT2r2decugZ0tHimLdU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=d7Nsdk6f; arc=fail smtp.client-ip=52.101.57.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="d7Nsdk6f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LEA1+bw5wfMXr6ix6GUccruyUGA0+Ke43J2B1XofFQ6idNPsiIPYziTSpHvPUwH+ZiRmdyAwV84YiXWdDPWBBO3TDCfkOmcNCMeObm22V9EClPAkdZ/szdduWDI5yxfx2t4G3r/I/3jDhRpuKetHnrIIUjNZrlDDa1JyulNUznLPo8+QBTXpzvTTxPpNZGwrj2s7zlOzmg9iSJB11whpdq02Bj48EsycGBCCRAXAD15qrqrV4juUMdn0NLHG+LPF9VRieWG0mNqfFVpHA3EI+IbxmVmb2F7duK4PobISGBp/DhSNmKliipmnKlItaIcrP1wzZmytLp04P9OJ/Jwj3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2CwQ55Rr6YQLbXCGw49E7S2KubGGl+8g5Ro68GUL7t4=;
 b=jga3qVWV4U4hdXcFGcOCtTqo7EfAlhRkAokq7Sg+i5ZLBYisLDQ/Y5N+fAN1zRUSOeHNZNpA5sXKiNKTLIGeEqj2J93Xg0SMc73G6Nqot293ib3yNAAsWN9AlTx5fEeQyYdjs+XSBMsAvJqtElbrNe3PaLnusYJcVN/nFP1wIqzs2Y4nuTwAldb9ejU0PI1qLwFsNBBP/1v26HvOlveJGdx7JbJEFzcD4P4gvYvpD63Oj33saNNx/H7jnD6U70rhcIdigNMfRF9lA/PnMMGAPdC/TkKt7x6q07w31m/db5ULstPmdEwGX1i7U+AC14eBnkVd1dsdWN6XTHmKNCb2Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CwQ55Rr6YQLbXCGw49E7S2KubGGl+8g5Ro68GUL7t4=;
 b=d7Nsdk6f0RaXyj5oTBYuNvpkIQRPjgYCnUfugYe7Lyvzyl5NmOlQxNpjSF4g3ksUT/aDghIH4NiPQXnxqeO6+SYOWeToHUSHQFwd7Dy+DC0rtDbqxnTEE5sb7AVC/YFuwkSWkpBMPVLgts7U56ZHwLxfTr6W+LIpZpsIksphaLU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH8PR12MB9791.namprd12.prod.outlook.com (2603:10b6:610:254::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Fri, 19 Sep
 2025 14:21:05 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9115.020; Fri, 19 Sep 2025
 14:21:05 +0000
Message-ID: <be724b4b-516c-4f1c-9994-d0aba505284d@amd.com>
Date: Fri, 19 Sep 2025 09:21:03 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86/amd/pmf: Introduce new interface to
 export NPU metrics
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, Lizhi Hou <lizhi.hou@amd.com>
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20250919055425.3055817-1-Shyam-sundar.S-k@amd.com>
 <20250919055425.3055817-2-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250919055425.3055817-2-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0140.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c2::23) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH8PR12MB9791:EE_
X-MS-Office365-Filtering-Correlation-Id: 02376194-1617-4582-0775-08ddf787c523
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SXJpZTQyTjM3c212ZzZmRDlpVStaOTlvMWt2UXVBOWpGM0FDMk9pSjhxcVhO?=
 =?utf-8?B?Sy9MWkZrRXJkdG85LzBKcVk1aVg1cFRiK2pIY0JTRWxKc3d6OVhHZGxhOVhK?=
 =?utf-8?B?KzVLekQzbVJDMm16MGhtZW53TS9vSU1RNzFKNmV4Wnc2c3lZSW1LbTZNWU4z?=
 =?utf-8?B?bVVVWU5pZngyVUx1S0VuaVd4ZjhaOURsQXBtNU54UkQxU01YbmdXcXo5ZUVY?=
 =?utf-8?B?dFlTMi8wcjZVZGlSWlFLUC9oVTZVb3NWQ1UzV2ZtaWsyTFpzRlZFK05DMFpn?=
 =?utf-8?B?eVFXTThpNitCSm53RjUyVmpHbVJwSXNkTklNdkV2a3BhUEQ0cXJ3NE1rNVo0?=
 =?utf-8?B?eElkeEJ1Rm52aTJHN2xTWVFxWVlSQmpmOW9oNEoxOGg3d0tCNEZCVVlyTkpt?=
 =?utf-8?B?SEhIdVVzblU4UTFKNWNIUnUzNGJOZy83emsxay9sa2MxbTZPRGZLK0JvREhB?=
 =?utf-8?B?Y0t3MnJXdDNmemFUYTYvaEN4NmNKTDh4VkhkUmo5SStlcWI3bHIwY2ZEdis3?=
 =?utf-8?B?Q2tMelhJQ3NLKzRvaUdOZEcya0ljUDd6NVFjdWU1WmVsbFBObDhFZXdFS1RH?=
 =?utf-8?B?RndUU0E1RTczWHRNMERFRkNHWVRJTSs5UnpSbkMrbm5MNU9DWnQyMEJtSU55?=
 =?utf-8?B?allKb3dDWlIzRlM3Y1NRS215SWUrRmRNbjlwVHpFbVBlYm1jcnl1Z0p6eGFT?=
 =?utf-8?B?c1l3VnJnay9QOE9UQkk5QkJNUFRUMnVLUmpyR2s3U2pJRjJJU3kzQTJIRVNM?=
 =?utf-8?B?eTYxL00wdVQrR215eWp3WTFKQUU2dFdQZkE1UEJ5Z2l1VVJMajlNZkNlS0l2?=
 =?utf-8?B?dXAxd0NMT1o5NW1CNEFmb2dCMWI4ZXROdy9xdWxSeTIrUm96MzRDTlNQZk5Y?=
 =?utf-8?B?Y3EvVzdFM1VXcWZMeVFQbU1LSmlnQ29EeWo0SnFyUXZkWDFESWFnSVc2bndh?=
 =?utf-8?B?cTdLemFZMDd0dTk1N29KdzV2RTdNcVNpUHdQYVc5cFlWNWhRNklndGg3Vkd1?=
 =?utf-8?B?dkJTbnk5a3c3UVdCRWJ3RFU3ZlM5U1ZVRUxrRldGaEFjUnZjTDh4YjByNkND?=
 =?utf-8?B?eEp4cVhnSkZlRjd5Nzc3bEhwWE1MYUJleGI2Y040NXpRcFZ1dU1ZUCtBc1o5?=
 =?utf-8?B?WU91ZGpsbSswVnRESnYxY2Z1MVNEK1V3TVYvcGlmRjlqdEh5NEE1NDhUQlpK?=
 =?utf-8?B?RVU2bk52cXRlRE1pN2hrNXFjR3Q4c09BTjBMazhFS1hteEdqT1R1eW1IRmNI?=
 =?utf-8?B?bWcrUkVJK1FlVnlIYWJia0JpREZPNmtmaEZidGtGUVRkMnpCY3BJZDVIcEVq?=
 =?utf-8?B?OW9oWW5PM0NTSVIzZHk1OURPOGNnNlhtVEx5NWNqNyt3M3QrbUR0cWxIM0V6?=
 =?utf-8?B?MDVobHJaWGlPdVdvNC9SQ2ZqZW9RNERKN1Y3c1lCaGk3UEpDdWtma1Z2dGwr?=
 =?utf-8?B?Z2sxeEU0emNIanltVDJwTDdlVmJVbEc2TkhzK3E2VDZPcmdEOTBjS3ZkUDgw?=
 =?utf-8?B?cmh6ZmNaWjdodmMrMElKTG5SbUVQcWRITmg4d3V6TEFKUHB3WEg4MDdxUDlo?=
 =?utf-8?B?WFJraStXWkNOeC9kci8rMEJmcTBndTl1d3ZOMHFsL2Y2czM0M29sWGYwVGhq?=
 =?utf-8?B?cE9XUDVvS0xJUjlBbk1lSTU2Q2gySjFPRHh2RmFUNmRDamo0QXEzVktSbG5J?=
 =?utf-8?B?SnRJakZOamo5WUlzTDA3V1hoNDVibU9yd2RXdkhtZmdESWwrNmw2UC9aNnNM?=
 =?utf-8?B?ZXh5SVB0UkppNTNKNnpvekluV1ZCSjhDNFRmbWVHdFlhbjVDYTRtMUVydHl5?=
 =?utf-8?B?bUFBQUUxRHRUY1ljQ25vdVdBYi8ySmNkSGJldEt5VFdIdHVWNC9hK3dIUXRh?=
 =?utf-8?B?VmFmMFJlTkw1aWRWMFpFYXlKcExRVWc1c0FtaTNsaU1kdmJhU2wrSnk1b3ZI?=
 =?utf-8?Q?fA54baj+llM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTRXbzF4Ky9mTG00ajdYYkZlVHNlRGFLQnZtcDcvSHB2RkY1ZDFsUmJadlFU?=
 =?utf-8?B?UUpPNFRMV0Z0VXRGK29QakdpYklnUEJUb2FJZ09oL3dzWUs0Mk04ZHJoMG4y?=
 =?utf-8?B?N1EvOE05MFcwaFhTZFRzUU02TXdYSzc0VjJkRTk2MGd2V1dtNnhCM1kvZTB4?=
 =?utf-8?B?YnhQaWltbFI5RUlUcTdITExTaHJwNGI2ZUlZMCtvOTVKUmJaejUwTEJGamY0?=
 =?utf-8?B?QnpJWUpoTFRLK3ZDNHRCM295WHVHSHZrckJ2MDgwcHVmMmpqWVlDckNicDB5?=
 =?utf-8?B?c0pabFIvSm5wbXpXSGQxTnpIZUZsaWgyU3B3OFBTQTQ2a3VHNWlGOFBoNVYz?=
 =?utf-8?B?ZTBDK3pTaG1HdFBnaHo1cjNZNzVtdFJvNzhwYi9zdXlmVUlUY1FMbEtVV2lu?=
 =?utf-8?B?TW51akVwV3ArM1JoZkd5OHRQVXhyblVNZUxZWE5zOG05Qyt1elpMcnd0VnB3?=
 =?utf-8?B?Yjd6Wm1KRlM3OHJkODNPWlh6Q1FHSFFqVUlVSktRdlJ6K0h3bTNnQ1J6R01Z?=
 =?utf-8?B?R3hoWHkzeXYzSXVXcG5sblRxZ2NIWmZibzVkNCs1NndHNElNVDE0MTNwTXda?=
 =?utf-8?B?ejRJYzFIamNPc0dkWmJGQXpCOTVQakplTGxIUXBOdXRoUGFaQVc5Zk9IRE9D?=
 =?utf-8?B?dmlTbXlDaVpYSzFhcURhVExROXhQbStILzJiZ25mRXJEaUFkU1BuL1IxL0Jp?=
 =?utf-8?B?WHRodlRVM2h6QUpIVmpTOU5KWng0ZTNpMndobVBLMzlIMVhPZFhMd2h6ajYy?=
 =?utf-8?B?M0ZzQlcxekNIZlB6N3FWTjZNUlNTaDVJRitlZU80WTgxTGZpQnN6cHZTLzR3?=
 =?utf-8?B?eWFWekorREw4aXRHcWlOZlpSS0pUNmlLNDZ1VXUzZ25lL2h1Q2FLSDRTajJv?=
 =?utf-8?B?ZzJWRlhWbGFqaVJxbjh1cGZ6bzBRSUJYVVZSWFYrbVl6djMrZHA3bksyTzdZ?=
 =?utf-8?B?M3dIYzdEaUhXYmd1QTNyNmRkdWFlTHJTbWtvUnZRQ3ZSYTNNdWxQU0s1WjU3?=
 =?utf-8?B?eCtuN28xSkhBZWtDSGEyZ3BTYjBBV2hZUmd1bGYxeXQ5WHpYbGhVMkFoNDdJ?=
 =?utf-8?B?eUpRZklUQ2haaHZ5ZkZTcFFrVzg3RU5KK2FWd0IxTXJGTTE1ZnRrSUtocm45?=
 =?utf-8?B?dWtXdTNwSE5KZ1RDN0R3NUdCaEJzOUpPcDJjNEcrVG04THUzQ0Jjb3oxTkcv?=
 =?utf-8?B?TVA3dmhGQWtSWk5Sa0FsSURYeEZOQjVUZW9HSkNZRGRIT3dBZDhuditWbWJV?=
 =?utf-8?B?aTJEbXhFT2Fxa04yU2lLNjZqd2pNK3I5akQxTS8vN1h0ZzkzT29zdE93SlhH?=
 =?utf-8?B?QmlWWWZ5NnNodVNLWHZOWVEyVGVtNUExL2dBM1NQYVBPWmZxM0xJcU5zNllD?=
 =?utf-8?B?VXBwSVhUZUc0em44MEJ2Y2w4Qm4rNlhXbDRGZEhoSGR5RlpndjBIY2tMbE9I?=
 =?utf-8?B?QjlLUHF6NkFyeVpUdVVnU0pXK3UvQ2ZYYlJ0RVowNmxOL041NktqcHMwTTBl?=
 =?utf-8?B?eVBFNzZNTmtXMDNPelExZzVoOTlFRVh4c2pjSlIxODh0YlR5azA1UVlkWUZC?=
 =?utf-8?B?NGd3ZXUzSWFJTURvRGFwVXJHRUl6bUttc3MzenN1Y0g1ejJnMXFLZ0s0OXdF?=
 =?utf-8?B?N2hWZWltemRuUXFzZjNPZlB5V0hPODJLdEFaaFVVdlFuVzNTeGd3YUYyRnk1?=
 =?utf-8?B?QmRaTmJEZy9lS2pIZTlTbEw5Q1B3TSs4QkpRalBiVWg5UGpQeDM0aEY0R2ZO?=
 =?utf-8?B?YUNCVFZIUnprTHJKMWZnMWt0Q1Avc2lBbXUyNjJyZXJjdFMwamk2ckxLUlc0?=
 =?utf-8?B?OEtDbGl4SGZNcTdQVzVCV2tVOGZseHROWGx0TXdUNUlyTzJCVlBnelZXbWZQ?=
 =?utf-8?B?bzNiSnJvVkhRVmZ1ekNFNW5RM3RBSFNhViszQ3pzeDZnbTErS3Rjd2kyMHgy?=
 =?utf-8?B?VjEyczgrelRUQ1pGTDljMDAyRGRBSDhLNkpWV2FkaVBFNGora2pMd0FxbXdO?=
 =?utf-8?B?d0tqanZrTFBFQ0JUU3JWN3IvbjNuV0F4bmhVZlV3bXNYV0ZpNG9aZE9QcndD?=
 =?utf-8?B?QkhzVkFlZFJ2S0JiU3NQRzlzclVCeHBJdCtPN3VBdDlMUUlIRmRQeXZkbGpC?=
 =?utf-8?Q?ijl4osAwmCJtTXlszSzbBOiia?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02376194-1617-4582-0775-08ddf787c523
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 14:21:05.7803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pZ1jfDbgu1LrlsZTZMc2U68eEz3vjuUx79h5tDA0hUfkT+yZgY2THcD4gxPGmXcW2NEcKSP2wK7SJkJSCrdUdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9791

On 9/19/2025 12:54 AM, Shyam Sundar S K wrote:
> The PMF driver retrieves NPU metrics data from the PMFW. This commit
> introduces a new interface to make NPU metrics accessible to other
> drivers like AMDXDNA driver, which can access and utilize this
> information as needed.
> 
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

+Lizhi for comments.

As this interface will be something amdxdna uses I think we should make 
sure there is a R-b from Lizhi.

I have a few comments below as well.

> ---
> Hi Ilpo, this can be applied on origin/review-ilpo-next with git tip commit
> "8236b4667aca"
> 
>   drivers/platform/x86/amd/pmf/core.c | 60 +++++++++++++++++++++++++++++
>   drivers/platform/x86/amd/pmf/pmf.h  |  1 +
>   include/linux/amd-pmf-io.h          | 21 ++++++++++
>   3 files changed, 82 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index ef988605c4da..75529047377c 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -8,6 +8,7 @@
>    * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>    */
>   
> +#include <linux/amd-pmf-io.h>
>   #include <linux/debugfs.h>
>   #include <linux/iopoll.h>
>   #include <linux/module.h>
> @@ -53,6 +54,8 @@ static bool force_load;
>   module_param(force_load, bool, 0444);
>   MODULE_PARM_DESC(force_load, "Force load this driver on supported older platforms (experimental)");
>   
> +static struct device *pmf;
> +
>   static int amd_pmf_pwr_src_notify_call(struct notifier_block *nb, unsigned long event, void *data)
>   {
>   	struct amd_pmf_dev *pmf = container_of(nb, struct amd_pmf_dev, pwr_src_notifier);
> @@ -314,6 +317,61 @@ int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev)
>   	return 0;
>   }
>   
> +static int is_npu_metrics_supported(struct amd_pmf_dev *pdev)
> +{
> +	switch (pdev->cpu_id) {
> +	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> +	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:

I'm a bit surprised AMD_CPU_ID_PS isn't in this list.  Does it not have 
the same interface?

> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int amd_pmf_get_smu_metrics(struct amd_pmf_dev *dev, struct amd_pmf_npu_metrics *data)
> +{
> +	int ret, i;
> +
> +	if (is_npu_metrics_supported(dev))
> +		return -EINVAL;
> +
> +	ret = amd_pmf_set_dram_addr(dev, true);
> +	if (ret)
> +		return ret;
> +
> +	memset(dev->buf, 0, dev->mtable_size);
> +
> +	/* Send SMU command to get NPU metrics */
> +	ret = amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, 0, 7, NULL);
> +	if (ret) {
> +		dev_err(dev->dev, "SMU command failed to get NPU metrics: %d\n", ret);
> +		return ret;
> +	}
> +
> +	memcpy(&dev->m_table_v2, dev->buf, dev->mtable_size);
> +
> +	data->npuclk_freq = dev->m_table_v2.npuclk_freq;
> +	for (i = 0; i < ARRAY_SIZE(data->npu_busy); i++)
> +		data->npu_busy[i] = dev->m_table_v2.npu_busy[i];
> +	data->npu_power = dev->m_table_v2.npu_power;
> +	data->mpnpuclk_freq = dev->m_table_v2.mpnpuclk_freq;
> +	data->npu_reads = dev->m_table_v2.npu_reads;
> +	data->npu_writes = dev->m_table_v2.npu_writes;
> +
> +	return 0;
> +}
> +
> +int amd_pmf_get_npu_data(struct amd_pmf_npu_metrics *info)
> +{
> +	struct amd_pmf_dev *pdev = dev_get_drvdata(pmf);
> +
> +	if (!pdev || !info)
> +		return -EINVAL;
> +
> +	return amd_pmf_get_smu_metrics(pdev, info);
> +}
> +EXPORT_SYMBOL_GPL(amd_pmf_get_npu_data);
> +
>   static int amd_pmf_suspend_handler(struct device *dev)
>   {
>   	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
> @@ -431,6 +489,8 @@ static int amd_pmf_probe(struct platform_device *pdev)
>   
>   	dev->dev = &pdev->dev;
>   
> +	pmf = dev->dev;
> +
>   	rdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
>   	if (!rdev || !pci_match_id(pmf_pci_ids, rdev)) {
>   		pci_dev_put(rdev);
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 6ea5380f3b23..622404e71136 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -12,6 +12,7 @@
>   #define PMF_H
>   
>   #include <linux/acpi.h>
> +#include <linux/amd-pmf-io.h>
>   #include <linux/input.h>
>   #include <linux/platform_device.h>
>   #include <linux/platform_profile.h>
> diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
> index 6fa510f419c0..55198d2875cc 100644
> --- a/include/linux/amd-pmf-io.h
> +++ b/include/linux/amd-pmf-io.h
> @@ -61,5 +61,26 @@ enum laptop_placement {
>   	LP_UNDEFINED,
>   };
>   
> +/**
> + * struct amd_pmf_npu_metrics: Get NPU metrics data from PMF driver
> + * @npuclk_freq: NPU clock frequency [MHz]
> + * @npu_busy: NPU busy % [0-100]
> + * @npu_power: NPU power [mW]
> + * @mpnpuclk_freq: MPNPU [MHz]
> + * @npu_reads: NPU read bandwidth [MB/sec]
> + * @npu_writes: NPU write bandwidth [MB/sec]
> + */
> +struct amd_pmf_npu_metrics {
> +	u16 npuclk_freq;
> +	u16 npu_busy[8];

This 8 comes from there being 8 columns, right?  What happens when we 
have a product with more?  It seems like this doesn't scale well outside 
of that design.

I know it is a simple memcpy() right now and the structure resembles the 
firmware structure, but would it make sense for inter-kernel 
commnication to define a different structure that would remain stable no 
matter how many columns?

Something like this:

struct amd_pmf_npu_metrics {
	u16 npuclk_freq;
	u16 npu_power;
	u16 mpnpuclk_freq;
	u16 npu_reads;
	u16 npu_writes;
	u8 npu_columns;
	u16 *npu_busy;
};

The size of npu_busy could be allocated dynamically, but this would also 
mean putting the responsibility of freeing it on the caller.

The alternative is of course a amd_pmf_npu_metrics_v2 if/when that 
happens.

I just thought it was worth considering right now.
> +	u16 npu_power;
> +	u16 mpnpuclk_freq;
> +	u16 npu_reads;
> +	u16 npu_writes;
> +};
> +
>   int amd_get_sfh_info(struct amd_sfh_info *sfh_info, enum sfh_message_type op);
> +
> +/* AMD PMF and NPU interface */
> +int amd_pmf_get_npu_data(struct amd_pmf_npu_metrics *info);
>   #endif

