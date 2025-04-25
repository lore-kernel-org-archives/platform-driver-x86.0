Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2086.outbound.protection.outlook.com [40.107.93.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164FE2356A0
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Apr 2025 09:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745573004; cv=fail; b=B7gjnRw23ut0pMFYqDFQKRe48kAI/PV6rnM444Pnwwy7GHOJRNNDqSSn0WodKhEiAgubU6xAXnNxbNAZokiGUX6PVXD5xHH62uS3V58BOBcVyCslIGPYoRJSL4uQuYbrPjtJGc1YO7b8cwbUApSHYLNk12dUGug8EP3M8Oa0LVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745573004; c=relaxed/simple;
	bh=pwNYTg6V01VLjqVjrK6EmLDk4N6+a5e7ISH7e4N5wrU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GO569nYAIEUNZQRqBH6uHDuHZTz9pGq1+xTC2XhOK8Q+UYfCUz4eM9Tv4DBBCJEyD8ozAJixYyoYuLgPtL8IeMLr5lpnd9jBVL02RjHAVbJvzWc3J77pAH/H4dX6w+GbEvu/uACfoZYPcr117VxO7CxgzNgJgbPyppWz8qZoss4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FrbcNuLP; arc=fail smtp.client-ip=40.107.93.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FrbcNuLP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GBjjmfZpvk8AyyRSRfMBCaKsNLdh47CILB9k0vC44qXKozzuFFJeY8spIFpiQ/hfxVwjDeujJ+xr4xl4DoVfxCu+cOOhRSWIugM6Xkmqo4WBQn9RZDOkDgJi1XfnLFBPfMmYe9zYqYBxCFghfY4pLiRc1LIwCBrqkxidCBInUT4NMSI3P6bgtGflO8rVgwtLnpHddZ9khXah++LzaZx1U6sOyfNXZV0hNxac9Gt4HUI2a2Ae0z5AZYyyzH/lIcRlwuMkDg8CT7LWH95r4YzaxPJsMWuPnWz5dEXTK7nZMpEAy83MBO5GE072sibz88AST8QnorYE1/TG/87jT4fI3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jwcFcjQWzEs7DL0sPGwQueFIfvmuEV1J//Wm5kIQRAM=;
 b=mWxNcskg79XQcOEbAL3LEtwF5LwJMMwLrV+MgodYeSlmQtVTAcmSLrmMwAgi0qrF+x+oPbCNoj6Wp8D0xAMYWbt2E4P1qCYOI6ZcQtQcRxPsulvwEnUhAPBqkI/jC1AWE+ItAn91kB1KK88LH7kG0Yfg+LCWkct4/VWuqesint+urtpZxQWUsV88bwIE6Q+rxVP0zlMVc5LLCFg5QbmNfb3eOMrd1Bhm+niL4IZ4Kf1J/SUtFeeaq1YGte5MjAdXKbUw4+xNdDfaf8Ex6SRdIestrP46/us0SaGfupDbNMPOKnCSxlJS7T+jHgRVCCBbxvT8ww99uPsUAUVcerXEpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jwcFcjQWzEs7DL0sPGwQueFIfvmuEV1J//Wm5kIQRAM=;
 b=FrbcNuLPXFUixRhv76KNSdGhKJsJ9GhQiqnmqqnSAfU/UAXsv+i9VwN3fOixcGrZdosY13+ofhQxIDPDjk3eZCUKbEPi4/m3DlzxE3rU7gv6WqzcgExsey1qzaj2ryEJN+nxsPbIgeeWyZsGBGrIXLc9oC2rPwBpUsJ7BpvbQLg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV2PR12MB5966.namprd12.prod.outlook.com (2603:10b6:408:171::21)
 by CY8PR12MB7611.namprd12.prod.outlook.com (2603:10b6:930:9b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.26; Fri, 25 Apr
 2025 09:23:19 +0000
Received: from LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::7c1b:5fa1:7929:fd81]) by LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::7c1b:5fa1:7929:fd81%6]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 09:23:19 +0000
Message-ID: <c6972a3f-8715-4a87-96a6-7fb346852c4b@amd.com>
Date: Fri, 25 Apr 2025 14:53:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/hsmp: Check for hsmp ACPI device
To: Gregory Price <gourry@gourry.net>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
References: <20250424062544.4122901-1-suma.hegde@amd.com>
 <aAp6Z2DLJdqcLoYE@gourry-fedora-PF4VCD3F>
Content-Language: en-US
From: Suma Hegde <Suma.Hegde@amd.com>
In-Reply-To: <aAp6Z2DLJdqcLoYE@gourry-fedora-PF4VCD3F>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0058.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::17) To LV2PR12MB5966.namprd12.prod.outlook.com
 (2603:10b6:408:171::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5966:EE_|CY8PR12MB7611:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c884058-08ac-4d0f-c37a-08dd83dad11c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QXdLUjl3UjlWMkYyakpMWU5vdVAxSGtZd052YW5hcjNDTXBIKzF3dE1iekd5?=
 =?utf-8?B?Z1MvcFBGUWU1K3RjQzN4dFgwdmEvUWNhbWk5TnFDTjlyU3FESmQxS1V0clZQ?=
 =?utf-8?B?V2RlZXhGSmtsbVdHem9yQlRZZHJJa085T0VDRVZtamZadEVhK2JJOFgzUHBa?=
 =?utf-8?B?VXFJTGxIU0RtWVE3NVpUM3IyS1BFR2hIU1IxTythS3c4L2dhTDk0NUQycVpq?=
 =?utf-8?B?WWV6QWJHaHQ0NWViRDZPeEpmZzByWUlubklwWDliQTlQb1hBdHRvVjRxbXFX?=
 =?utf-8?B?eHNiOUFKRnY0aEVqVkUzVEdRQTZPT0FOMFV1eWNTZVFYRlJoakJRTGZhdXJj?=
 =?utf-8?B?eDVOaXdud3ZtZVU4MHZHcENycDR2MEFvOVE5cXdrTWhwOUxPWTJ3TVFpT1Fk?=
 =?utf-8?B?ZGRKbE83L01ONllVTVQ1VS9jdVdGQjhNbHpEbEpPQ3ROYlBPQ28vMEdyaDRZ?=
 =?utf-8?B?NEZoeVowb0szVmIzSldZNkZCa2t0ZFRsNENMejFXaHJnWEUzY2ZSWUkzUlRP?=
 =?utf-8?B?b2dINmdVL1lFVHBjY3RmYlZFSHRzSk9tbWFtbnBERE5TTDJ6MVpzN1BQYTlx?=
 =?utf-8?B?R1p5V1NLQVhseVpURDU1TnF2Y3lnRjJjdEJXaGV0SDJhSExlZ0YrWnZNTCs0?=
 =?utf-8?B?bWVTZ1RITTczSDBYU2UrYVRKVVEwcWpJejNhMDU1K1hUd2g3TXdXTW05c2lh?=
 =?utf-8?B?bys5L3dTQ3NES2VWMFl3UEU0SUMvZ203RUQ2dFp1OVFONWZhYlNDd1FYazBK?=
 =?utf-8?B?YWgwanpvQUtHTmUvTEtyaWU4eWZtRS9pSjRlcS95bWZtSW1qTHNPbE82WCtt?=
 =?utf-8?B?bmtxbkZ5a2NJcE5RcUtzTHdGUTFwaFRwT3M2UCtnVGMvYUVkSzdNNVVFMGpr?=
 =?utf-8?B?bjFEaGFtQXNqOHNvWDFBZkl4M3VOWDdtbnBCS0psdVJjdVdrbUxKMmwvNG8x?=
 =?utf-8?B?TjhjbDh1NUNwV0lSM3NDTmRjQUZVL3BzM1lLZ2l5eExOdE94RFVOTXQvQ3pQ?=
 =?utf-8?B?RXlvSTc2Z21oUGd3VHdTN1lla3hTUFlOSjk1LzlqQ0V4Mk1TaEQvM2dYVlVQ?=
 =?utf-8?B?bTk5SUM2MmZVeU1Fc29TcmQ4WlpGVHlEN0tnL0w2Q1dYa2NxM0EyVENVWVpK?=
 =?utf-8?B?cG1yYno3eWliaHl3YmdFMGNDUWJORCtHcHJQRDdqNmhWK3RkTmlUOHVmSWlp?=
 =?utf-8?B?Rm50M1YrY1EvN0k4eDNGS2tJZFI5cGpPd28yL0dnRUQ5dDRPaURJbTVLbG9R?=
 =?utf-8?B?OEdOTDBjWWVzdXVNQ1ZwUktIV3ZVRzhjYWZhVXdQYW8wbnhDUldianhGWVBy?=
 =?utf-8?B?dFQ2djRYMm13eEVBZWovRHRSK0ZobXZGUjViQ0ZRWE54dnZOTGorby9vWC9z?=
 =?utf-8?B?TzZXVXVjeG9nc3FJZ2hIazIyNkNpSWdrRXNxUHRzU0hkenNXeHVLN2toMHVB?=
 =?utf-8?B?NE1Ta3NpMmFkTFdndEltVUZkdlJMRlZ4Y0MrUGxsNmRnejQ3b2EwUTg5RHpx?=
 =?utf-8?B?d1FDRE1rUkI0MFV4cWRlZWhVMUdha1ZZdHVxWWNIZGYzOUI2U0RVMS9kbE1v?=
 =?utf-8?B?WEp0cnNYb2pGaDNGTmVEdStibVE4WEZxUkVCVXBVMFdqSlRoUVp1OUdzT2xy?=
 =?utf-8?B?NUpDZEZzODZkbnNhZzByYnlESlJtWkxsZjEwUmRGV2dzbEtxM3BRNDAvbHFV?=
 =?utf-8?B?RmdUTC9xeVhDVHZBTFZnQmJPRVQzMklRMXVUcGJ3WGJTZ3U1Mk1CL05nRGp5?=
 =?utf-8?B?MkJZRGRBbHU0TW1ObjkvdVBQYVJ0azhTVGhWbnFlUzd3R0NkUm94ajl0bzM5?=
 =?utf-8?B?UVJKcUxwK29vcEtwbTF3UjZMOHFjYjBYZVJxVEZ1blBXOEsxUXdTQ3ppR3hy?=
 =?utf-8?B?Z2tES3pGekNKS3kxU2FQakhXeHR6V3JlbFdacG8wV1RwMDd6MjRycTNDS1g0?=
 =?utf-8?Q?7Q/Ia5uC8IA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5966.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2g4MUZSd1A3TWZ2ZGUycEJBcmJhM2llUG1iaDdweTU2dkpmQUZOR2gxcU0x?=
 =?utf-8?B?YktTLzRBNWpMeDdkVjlkdUFyOG5DMS9MT2ZUT3lraGprTVhnaS9WVzhZaHJw?=
 =?utf-8?B?OVg0YXA3YWt1Q0dZV0p2U3VVTGR1amdSbzkzRk5iTCtjVktwUlNxNjB0MzQ4?=
 =?utf-8?B?RGFuOHB4LzdzWEltTmdVRExnbVhVM2ttd3dUQTBMSlk2Tm5TZjAxYzdreW1v?=
 =?utf-8?B?SkJTN2pDUVJ1bXJnemZ4MDFkNTdONHZjeWtUUzVJSS9HZGhoUjVydUhhWExL?=
 =?utf-8?B?Q21OSlhwOWR2QkRjSUFMVVNLeU5wbnpPQ09obHcxYkd5NmlrL1VEQjlUWkxh?=
 =?utf-8?B?K1hidlg5bWt4T3RLTmlTUVZYcGQzVWYwdVlQR1JOeFoyaGZiWUFlbHpwVEpa?=
 =?utf-8?B?UDNGcG5laGJJL2p3ekE4aHMyS25vdDd3YzJQSnZsbGZmVVhHN2IzbS9pOENQ?=
 =?utf-8?B?WStUOVZ5ZUtSY2ZLVUVib0hHMFF3bWFGa1VIQUFHdmhuU0VzTG5md3FvcHNY?=
 =?utf-8?B?YktoT2pvb3BlUGRiamhiR0twZ3ljTCtHUGZpRjI0bFNLMndJR1MxRDc4Tm5B?=
 =?utf-8?B?Z2NzQTRhQi9DdjVYUWtpZmpJTHU3YUpoYm1kTVdpVEVxZnlLRU9JRGp1WnZI?=
 =?utf-8?B?ZlY1TlQxVU5GaHhVYzRlYzdwdFQ1MVJwYmFVQzZqeHlDaDFkUWpEblJKKzBu?=
 =?utf-8?B?Mk5tMXhmbTNjUzFZaUhkZXlNK2xYUHlYTWt0VkdzU2tVQ01tczFxV3hJQWYr?=
 =?utf-8?B?Tzc4VlAzQVp1WWpuQVI5bGhsUGNHNXlES2JOSUJtVDdQRHZQQzQvZCt6b3JB?=
 =?utf-8?B?UkMyck40bm04YUpkQVZZMW1FNzYvcnZINGZEcm1zR1JOV3owc1lkekRyQkQ0?=
 =?utf-8?B?NkRXYzJIcVJQSElSZldXOGNCOFl1eHFJLzYwQ2tMRlh1ck56MThHOHB4NFJl?=
 =?utf-8?B?NGxybWVWV0ZFSThSODJkVHFRZE5OYUJjaHNZY05mdkZhOVA2Wm96QzNlYVZo?=
 =?utf-8?B?VjVMRXAwbFpWMWoyVk9mekExVVJwWGlKODE5OEFOQUc3TGRTdDNsN1ovNlpH?=
 =?utf-8?B?ZGZBL01meDRlbVRSN2dvQXg0SlhMNXJUM09EMTlNZUxOQWUwaUtSaEQ3c0Fv?=
 =?utf-8?B?S0dPa3pEK1hHRllEeG5vbDY0Z0k5NmtqNm96aUpGSHFMSjF3Yy8vdG1LZ2d0?=
 =?utf-8?B?czRuK3JpYk5Qd1h0UkdDMk1ZOTQwR3AxS25Nd1J5VTlIdDBtSHNqa1Z3MEpD?=
 =?utf-8?B?Y2pqQ09Dampkdi9JZU1NMFcvaU4yT2JvL3E0end1MGp3a1pmR3RxTW9jQmlI?=
 =?utf-8?B?a3dFdFpJVVNHZDU4SnJ0aXhZSUdmK2J6VFYva3RBaDAwamJHcjMyTU5GT2NS?=
 =?utf-8?B?VVNhb003dndkbUIycEtDNGUvczN4M2MwdHUwMjBUdkE2UHNxTFYyMHFDbGdX?=
 =?utf-8?B?ZGFZb21lTENCY3lkWjhENFhKZG5FQ0l6Mjl0aWV1c3NpYUt1Q2pvUmRkSzdB?=
 =?utf-8?B?MElmSzZSbUZQVExTN0dXdytXODE3WFRZN0JQeUdWTWswWjdnS25GS2R6NmRo?=
 =?utf-8?B?UHkzUEllVDVwNXl0K2JBcGRURWMvaVFFNXU5dVd5WnVPbC8zUm9YajluNEpz?=
 =?utf-8?B?WUZ6eTBGaUczT2VrV1JHb0ZuZ1hrZ3ZWRnpydE9jV3BtRm55U2NaV0hBQWZH?=
 =?utf-8?B?ZXZpNitIMXdBSGt2NGxWazBVdE5HbnNSLy9aekRweHREV2phcC9xTThaL0s2?=
 =?utf-8?B?UkZleWRlSHZmZHd2djV0WFU4aldFbnNRNTRxV2dZam1VU3I1R3RBZ1QwQm1B?=
 =?utf-8?B?YndrcTNWdzNQZWdCOEZnSXJvYjEyNVJSS1lYMm82RTFENE84Q2dPVm03bkxH?=
 =?utf-8?B?TUpkSTMvcTg0dlk5QnZzRDRjaUhIMHhuaHVKaTVyUlpSMHZOT2EvVHVGYXgy?=
 =?utf-8?B?a0pTcUdaYVBLNEtRWVRjcU5Uc0x6Qlc3aDl1eDgweDJZclpHUm9IazJJZ3FB?=
 =?utf-8?B?bW9qV29PZGhsb29MK3AvaG15Qk1nWkRaWVVNdlpFTkEzd2JkcTdhbnkwcXps?=
 =?utf-8?B?YWdYYkhzcGZVaUtDQlNDT1ExaWgraEx1MlAxS3JWM0FuODl1c2IwNjZGYWdm?=
 =?utf-8?Q?X2QdPMjZ1dBvnd3/kOUZHdBDI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c884058-08ac-4d0f-c37a-08dd83dad11c
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5966.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 09:23:19.3724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1+pisosA8O2wAFbxSIcRdeCXeklTmFbmL2dbkHiMAzNAZRZw6P53+QaU2/lFUZqKXaJMmTh0CLtViywt/ugLQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7611

Hi Gregory,


On 4/24/2025 11:22 PM, Gregory Price wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> On Thu, Apr 24, 2025 at 06:25:44AM +0000, Suma Hegde wrote:
>> If the hsmp ACPI device entry exists, allow the hsmp_acpi driver to manage
>> the hsmp and return error from plat.c.
>>
>> amd_hsmp and hsmp_acpi are intended to be mutually exclusive drivers and
>> this check for availability of hsmp ACPI device is necessary to ensure
>> this.
>>
>> Also, support both platform device-based and ACPI-based probing for
>> family 0x1A models 0x00 to 0x0F, implement only ACPI-based probing
>> for family 0x1A, models 0x10 to 0x1F. Return false from
>> legacy_hsmp_support() for this platform.
>> This aligns with the condition check in is_f1a_m0h().
>>
>> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
>> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
>> ---
>> This patch should be rebased on below patch by Gregory Price.
>> https://lore.kernel.org/platform-driver-x86/60715d85-48b4-4066-8a9a-c8d2b62ebb45@redhat.com/T/#t
> Just roll my patch into this and add
Ok, I will merge your changes into this,  add below lines and send v2.
>
> Link: https://lore.kernel.org/platform-driver-x86/aALZxvHWmphNL1wa@gourry-fedora-PF4VCD3F/
> Fixes: 7d3135d163 ("platform/x86/amd/hsmp: Create separate ACPI, plat and common drivers")
> Co-developed-by: Gregory Price <gourry@gourry.net>
> Signed-off-by: Gregory Price <gourry@gourry.net>
>
> should make the pick up easier, and they both deal with the same patch.
>
>
>
>>   drivers/platform/x86/amd/hsmp/acpi.c | 1 -
>>   drivers/platform/x86/amd/hsmp/hsmp.h | 1 +
>>   drivers/platform/x86/amd/hsmp/plat.c | 6 +++++-
>>   3 files changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
>> index 088cb2416d7e..eaae044e4f82 100644
>> --- a/drivers/platform/x86/amd/hsmp/acpi.c
>> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
>> @@ -29,7 +29,6 @@
>>
>>   #define DRIVER_NAME          "hsmp_acpi"
>>   #define DRIVER_VERSION               "2.3"
>> -#define ACPI_HSMP_DEVICE_HID "AMDI0097"
>>
>>   /* These are the strings specified in ACPI table */
>>   #define MSG_IDOFF_STR                "MsgIdOffset"
>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
>> index af8b21f821d6..d58d4f0c20d5 100644
>> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
>> @@ -23,6 +23,7 @@
>>
>>   #define HSMP_CDEV_NAME               "hsmp_cdev"
>>   #define HSMP_DEVNODE_NAME    "hsmp"
>> +#define ACPI_HSMP_DEVICE_HID    "AMDI0097"
>>
>>   struct hsmp_mbaddr_info {
>>        u32 base_addr;
>> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
>> index b9782a078dbd..81931e808bbc 100644
>> --- a/drivers/platform/x86/amd/hsmp/plat.c
>> +++ b/drivers/platform/x86/amd/hsmp/plat.c
>> @@ -11,6 +11,7 @@
>>
>>   #include <asm/amd_hsmp.h>
>>
>> +#include <linux/acpi.h>
>>   #include <linux/build_bug.h>
>>   #include <linux/device.h>
>>   #include <linux/module.h>
>> @@ -266,7 +267,7 @@ static bool legacy_hsmp_support(void)
>>                }
>>        case 0x1A:
>>                switch (boot_cpu_data.x86_model) {
>> -             case 0x00 ... 0x1F:
>> +             case 0x00 ... 0x0F:
>>                        return true;
>>                default:
>>                        return false;
>> @@ -288,6 +289,9 @@ static int __init hsmp_plt_init(void)
>>                return ret;
>>        }
>>
>> +     if (acpi_dev_present(ACPI_HSMP_DEVICE_HID, NULL, -1))
>> +             return -ENODEV;
>> +
>>        hsmp_pdev = get_hsmp_pdev();
>>        if (!hsmp_pdev)
>>                return -ENOMEM;
>> --
>> 2.25.1

Thanks and Regards,

Suma

