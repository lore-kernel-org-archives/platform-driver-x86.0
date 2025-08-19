Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2041.outbound.protection.outlook.com [40.107.101.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626D222A4D5
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 Aug 2025 11:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755603674; cv=fail; b=nBJfN1kea7q0Zmqeq43dSCNhXtet82ZeACpZT6W+gGNctWe5HWEEHDEuDXkOXPkJWK0690ZhMmAPGP1hhJ8pdezZXRBvCa5kVVk+h8wkc/14N+HahroDy2Xjww/q2D+O6Gev3h2nOF3rNaEbI0bJWHh8LSOsu+cododl0WIhffo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755603674; c=relaxed/simple;
	bh=5D72Ew64QovyLn5hXpOgmzpRygxcHNA/jCJrGwwZX7Q=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OZrq8+hntSSq7g8H0QS4Whk/IigmSAfrgIxM3R21G5V3ghtKGuMdklWdH5BYbat3vJJ5iFFstj1DgZt7FIRiYruMkXQQv67fuynP2QMbJ5VvY45b8SbK3cBxAR1FCQZb2QavKfYAU1ZYo47ja0C02OPlBpWoRRKpyxAASS6l5Ts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rpP2j9wm; arc=fail smtp.client-ip=40.107.101.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rpP2j9wm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mpFmmCJmGLnSXtcuIWnMkmqrBvJ0UZcIUeTiyppHmQTXY9d/rCRkH5eXFQxMIUGPplLJqbNslV10MdfJSYaoy7PCGHudapVKFqJok7DDxN83hOA3WFEL1wAKxFpZgJQXDTb5BiqboJVZNQ6bcV8MaxZdidAD/Firqd+5UO05nN7tQzleb5adzXtj5RLVGc0xyYE3Gi0FI64xxD3S3tv3PvF9zpch8n/6cT3QG3N6UFNh43eMtSlUj0ouKpwnEOiB5QajE+IK1HixqgRSgxyCTJJZunlNIfiFdgjvVTV9LCcpue3lvX5We4AxLAHyC6P+u9cv3xn5kxkxwTafwJ4++g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZOk+sKWYM1JPimK+m6qL/N28pYDVE3BjjWeMNdelSMg=;
 b=DrTmV1DlbqvjaAYtV4J5dnb5T72QwYmvw6SzIlrAji/SavMyHDi5Ne7mBFRiw1p96mDg7VEv9NJTStc3k048ZbCaAQoBx9gtGg+weMTnPTHaIdjG1X9rdwsaYJwhi4FGM9Ik+9Eq3pK5ci9Kf0dMb7PwV+xsvhdEWjQuUCOVwRTyvKVLBDrf4+IMeNSGdx9WbQ8QeMFbuuZVRQFXuTrqSh/FqDLLKr8Fp2eYq6SfqgXMagonNsdmfTYAsLTtqj4PeIljBWStb1owIL+yDtPUiaBjlTCYBuCIVgRr3sOjz3khQ37cY8NNM/eKIt6DFJqI2nqkd2J38PcM6nindLD3vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZOk+sKWYM1JPimK+m6qL/N28pYDVE3BjjWeMNdelSMg=;
 b=rpP2j9wmqn3NUYHVPIvxaW+jBQLyNOWR95fSMIbtVXcShRYXMLqtlVialJFlRAduA6WaEjd6F0AczujK9zrkd0EYPwrqPjbyMh8IZNto4NCcpc0i9/l3xt1IA4vDriAHrA2xoyz5wtYAFpBl+ID+oJxwaDJR4496x5ml+zXR9TM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CH2PR12MB9518.namprd12.prod.outlook.com (2603:10b6:610:27e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 11:41:11 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%5]) with mapi id 15.20.9031.014; Tue, 19 Aug 2025
 11:41:11 +0000
Message-ID: <47604edb-01a9-493b-ba30-bc2bc679edfb@amd.com>
Date: Tue, 19 Aug 2025 17:11:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/9] platform/x86/amd/pmf: Call enact function sooner
 to process early pending requests
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org,
 Patil.Reddy@amd.com, mario.limonciello@amd.com, Yijun.Shen@dell.com
References: <20250723064121.2051232-1-Shyam-sundar.S-k@amd.com>
 <20250723064121.2051232-9-Shyam-sundar.S-k@amd.com>
 <ec6d6d81-a574-ee08-a62c-7672769bdfab@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <ec6d6d81-a574-ee08-a62c-7672769bdfab@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BMXP287CA0020.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::28) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CH2PR12MB9518:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b6e67c8-b282-46f7-3134-08dddf154b61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cXExSHVpYVlIZFMrQ2RDY1BtYXVqcCsvVDVSZlBDNEZwR2Nha3VoMm5LaGxO?=
 =?utf-8?B?YThKcFVYS0NUM2xlMkcyc3djSURjNjNjT2hPenRnSm9aeGRFencvNUllWi9I?=
 =?utf-8?B?N1AxeS9iV1M5eVRKWlMvenM4NTJxbU9kV0REdWYrTnZvbjlDWU5UWHRNQWdF?=
 =?utf-8?B?QzNPbnhrRXYwU0hFK1pwWkNQRVFudm42Y2hMa3pKdm1uY21mTjFQTGlHVDFp?=
 =?utf-8?B?UndNWTk0dmRPMEg0ZllQRFFmdjh0UU8wRkMzK0FDQkkvVmRPcUlvYkQ1emxE?=
 =?utf-8?B?YU5ZKzI3NUVGZ051dkNFS1ZhdTdsL1BwOVl3NFFzdk1TQjVNUkFHK3FuTVdl?=
 =?utf-8?B?aFErV2JmZXJCblo5NS9CT21pbC90R1dOM1RtT1VLVmZLckdCeUhWNTh0ejBR?=
 =?utf-8?B?Sk02U2xmQ1FSRUI5TDN1a2JPRi95Y1FDNitGaitnai9BbmpYV0NuT1c4RXNZ?=
 =?utf-8?B?dWhjbjJxTjlBWTZIYUNWT2hUZVEzWFVBNm45endFOUpiT1NXSUY0WmhtSTR4?=
 =?utf-8?B?Y3dUZCtoL0JXcEowcjZuU1NXak5KMzA1L3RZV0M5MjhOSlBKZ3JSYlZ3WnU2?=
 =?utf-8?B?UENVVjhOZHFjY01PT3pJS0IxVmJhM2ZmRS95bGRyRElGRyt6Nkk2Z3Bod2Np?=
 =?utf-8?B?UXAyUXJkVGNSZ2E0aFpuY2RWeDdDNDdTcHFwQUE4d05uSWlLeGYwQ09VN09n?=
 =?utf-8?B?VFBKOVhiSS9mTTNkdkgzVG1BSzZqbENyWUhZY1FmK0ZJUElxekxjS2x3d0o1?=
 =?utf-8?B?bjBkRTZSRytNY2c1YmNKa2FyNVV1akdhalRLM2Y4SnUzSkFuNXpRaFYyQlpM?=
 =?utf-8?B?bEZEc2lmN0pEOHB1Ti9vWnZiUFo3bWl6L1hTd1l1QjhCK3o0WmkvVFFqN3M4?=
 =?utf-8?B?UVlWNjI0SXlnb3NVb0JXeEU2MStORFlMcng4MFBLNHExZFFQT3I0UkQ5dkg4?=
 =?utf-8?B?QzJIY0dqVk1mZ28vYzBQa0NzVWhZVk12L2owdldaOUR0aDRKVFZyOWw0R3JP?=
 =?utf-8?B?bHpEN0NReTdXMXhOdVhGVzA4bkcwdktFTkE0VUJsQUVLbVlXNXBZakwxSGJG?=
 =?utf-8?B?K3ZOdFRMNFhsYnBQanlZWFJOaEIwaFIydytyd3FGeWZOVXNGbHI5VDVQcFhm?=
 =?utf-8?B?ZFJkM2VNQ29lSlNMQkdBNk50azUyVy9oRzN5OFo1c2toMHlzaTQ2SjdvRDAr?=
 =?utf-8?B?UGdmNTRPVUdNV3RoS1p3NFhod051NkI1czMrQkpRQWlDZ0krc3pzUzNIUjFs?=
 =?utf-8?B?OWdIbnVxMGNiU3FQc3RlTm1TbmRBWlJaYWtSU0dBbGxxVDM5M0JvUGp1ZkhZ?=
 =?utf-8?B?Vk5xOGdKK2hxbUpPNkRiOWpYdWFTaE9QSk84dkpBQkIwRGhSbnFQWlNGWmVa?=
 =?utf-8?B?Y1dNeUV5cFUrS08yV09RMTNJc0hMZ0VuMzJzT0Vib0FmVFpYdFZrMkpYQ3gr?=
 =?utf-8?B?cGpYRjVwaGk1MjJoSnArUVVFZVozWTdsVFgyVi9XOTVNMmF6T2NkQjV2RHYx?=
 =?utf-8?B?VzlVL091amU5ck8wQ1d3MjJ2UnRWMHNraG96ZkczN0dXYUl6UjMySkdrdUZJ?=
 =?utf-8?B?RzViRmVmUXRpdkV1bXNGN0dhMjhhSDZEWlBQOExoOFBuM2hGVlBkRGdtMFdt?=
 =?utf-8?B?Y2ZZbkZtQWFqTGJLWHRYbXlZa3FTZkJHMWJCK0Z4ajlBcmpxQWprUEpzSDRT?=
 =?utf-8?B?SWM4WXhpM050cndINkIvbmd5MHRCcEhKcThnR3JiMzN6ZEFubXVlVGUvYWp4?=
 =?utf-8?B?Q3Ava2NiMXk5YUtJc2dobGdhWmtlNFlOUEJTYldxVTRnelhpZGpwREs5dVpS?=
 =?utf-8?B?d1dmb25uQU84UGRmb1NXbitZVXgzZVBTZWl1ajRVS3lkdDdVZFFzRHJKVEVh?=
 =?utf-8?B?dkkxd1oxNzZGcmhLckg0a2daL3RCS1p6cVpQbzB0ZHJ2SXR3Mzh2WjQ3YlR4?=
 =?utf-8?Q?vLGpC/MmAO0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWtwYnpraGYvNlhXWDZrR282MzJOQkhPMndiVHducWdEVGZrekR6QmRlZVll?=
 =?utf-8?B?aTFYR0ZEK1IrN05kMjRYK3VxUXJSaEhjbGo1a1N4YW85cklhN1J1am5YYkFK?=
 =?utf-8?B?R1VUNjcwdFJXY0VlSGtsS2ttYjA4T092RE5jaEhDV2hPWGlRekM3L0lpaGhS?=
 =?utf-8?B?QkZpZmc5RmQzSkk2ZmJoKzV6WExtbXhTd2YxeDh3WkxnNTRXZy83aVAyVXBp?=
 =?utf-8?B?ZXRRdkFDR2NiVm8zMzMydFZpdTllOGhOaFNYSDN2NXprRGVNVWovcDFVTDQr?=
 =?utf-8?B?TVF6aE1iOHlyVHNqeEhpZkw2bjJHQ3cwODJSYmk2ZFJZd0o1cGhIdzFlaTFU?=
 =?utf-8?B?aCtkbWtFOG9lenhPYUQyYVVENlhWQXFOZ3ZJVWd2ZnVEU3Iwck8xVmVVRFVN?=
 =?utf-8?B?V1h6TlNpenFQYllDSUpxR1lMMUZINHlXN1lTbTVrbkFmeWw4NFVrajVWR0tz?=
 =?utf-8?B?NjVIRHpXcGNpbXFCL25tS2U2bGJQZXpUczJVbFZjYzlkM2hEQUphSzhyZlYy?=
 =?utf-8?B?d3piTnF6N0pBNTJ0MVpVUGhXRTh0amlSQWNQaEk3TjFHanlTS0JlQlpIRWhD?=
 =?utf-8?B?Y3p2ZHBZQU9BWExMUlE4djFBSVphME4xZ0xnOEoxWDUzYkxKdWw4WTliWmxB?=
 =?utf-8?B?L0IzdWJXTExIeDQvU3RJbzdNSytVaDU4TFdnSXRyUzdRdko5YndEN2ZWQUVu?=
 =?utf-8?B?VXlLbFEzVytmSWoxL1FrODNXUEswdlpLdmZxbU9adDg4RmdSNnVjdENJcmU3?=
 =?utf-8?B?alAvbVVjQmM0blhoeHlPZzFzQWJOUzdoYjk3Z2pkMzQ5MnBubW1JdkRJZlJM?=
 =?utf-8?B?WU9odHhFMGhuMXgwbHlmb0xZSUY4ZDYwUmRWaWl5VDk1c2ZvNk81Y0FZcnkr?=
 =?utf-8?B?VjZ2V2JFMTYxdzJwZTJMZUlTS2Z0ZnlqbTRlTjZabXp2UTg5TDJSY0V3MVl3?=
 =?utf-8?B?VGhxcTA1K1N0R0ZlYkR4U3NZNklpWVp1c2lROVdGRjNtTTd0Qzc3THVRV0l5?=
 =?utf-8?B?MlBqYzdUK1VlUzdLVUNFNEE5VFJQVWdjdEUrQjlwT09iSjVNeEFzVURjTnBq?=
 =?utf-8?B?dkFyalR4d0l0eDRRRGs5TVhkTm9NbEtXSUd2SlhPTFdVWjhUVjBDRDJrUkhQ?=
 =?utf-8?B?d1YzQ1JUWkFHdmhhOEZHTzZrTTZpOElWVVBwcVBxeEFwbHY1cUVRMUZ6ekw1?=
 =?utf-8?B?YlAxczZNK293OEpjVyt1UXJIczliKzc3bFZvTFJmM3lVdkFkNVdNRkt0cUVN?=
 =?utf-8?B?WEwxK04za3RXOHV1em92MlNyZUQzaXNoWXNGY0hTTWxRMndaelRzM2lhditi?=
 =?utf-8?B?cGkvbWMydjBDSmhzYytsclFrbzBtdTNGdHJSb0UzcTdBK1greXlmK213cEFl?=
 =?utf-8?B?TEY2a2JjTHJSb3ZEMGN5c2pUejc2cFhQNml6d3BMdUZaWnQxR3U3dHUwY2JC?=
 =?utf-8?B?aVNaU1dKSVRSWUIzZDFObjQzZ2YzcnNqM3UxNk0wOU9VZm5GZzQ3WmxKMkF5?=
 =?utf-8?B?aWQ0YW9SS2g3bytuZzM5dWFyb1cwMW9seDRwMUhtQU1vaTRsK0htTFBYOUlL?=
 =?utf-8?B?OGp0RHdENzlXYTRRVWpHV3RBYzFzcjJaVmtJdlZyS2hXaUYvUDlHM00yT3pz?=
 =?utf-8?B?Tkp1REhsNTYyYVRGNnhhelpGVGdCelJBZGlsWDRjUytBeVFHR3huR2JlM3pW?=
 =?utf-8?B?WHhPQmROcGtBVTUvNlJFNUlCSThIQW9yR0ptbHloVFBFYlpmT2F6dnZmL1RY?=
 =?utf-8?B?WTJLeVhVdE1kN0M0K25Qb0tPNWJJMzFJUkgyWjBuSUNIN2UvbzI2TllVY0ZU?=
 =?utf-8?B?QTMrZkxUUlJKSjFvUEh2MFB3ZmM0Ui9HWGlMMHc1ZU9SeEZlZGRvQmtWSHpF?=
 =?utf-8?B?cWRrWlo2dkJCRXExWFFHdTYzVlUreUlUY2pJMS93Vzl1VzFYSHJhcmlXSjJZ?=
 =?utf-8?B?dksyZEM3ZUs2T1JBUXIvZkphNW9KS3doSkQyL1VvTnZMSFNEWjBsU3Y1K1lD?=
 =?utf-8?B?S2p5bm5GYkFKVkJ3NkQ3Y05LcHJhTUpxRFRTbXljV3d1a3RPRk0yYzBWRGc0?=
 =?utf-8?B?bW43UXBLdWd5K29ZeEl6aURjRlpFMnJ4RmUyV0dadE9hYk9JblA2RmhhMkRm?=
 =?utf-8?Q?7J+EkgTQnFLhXbo9PxDxYa0pe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b6e67c8-b282-46f7-3134-08dddf154b61
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 11:41:11.2734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EfV6mbeg2BpbBGq5tLkEO0Wmo82QO2kgLeo2d+4zsUGDLT+0p23QqHgesoenfMVC5J8IHI72CJWDKV2p7Yrt8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9518



On 8/19/2025 16:50, Ilpo Järvinen wrote:
> On Wed, 23 Jul 2025, Shyam Sundar S K wrote:
> 
>> Call the amd_pmf_invoke_cmd_enact() function to manage early pending
>> requests and their associated custom BIOS inputs. Additionally, add a
>> return statement for cases of failure.
> 
> No return statements are added into amd_pmf_invoke_cmd_enact() ??

Actually I meant add `return` from the
apmf_event_handler_v1()/apmf_event_handler_v2 handler calls.

amd_pmf_invoke_cmd_enact() is meant to manage early pending requests.

Did you mean, I have to rephrase the commit?

Thanks,
Shyam

