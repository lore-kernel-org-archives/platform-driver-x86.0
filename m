Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012002.outbound.protection.outlook.com [40.107.209.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F852DFA40;
	Tue, 18 Nov 2025 21:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763499993; cv=fail; b=O0m6+pEVxdSkZ0Epv8YSenLoRcmEykQyFxi+j+DdRypxJg66haD50vO/+h01fKq3cXHByjQhmdUq+Z2t0qoNbROUeJILo3ndjah8RKHs62B28vakvKssWdLOQ4SgpSx8jAB7glbl4RncXA0z1qrirOExVQEgdUwu7HSbC3cICWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763499993; c=relaxed/simple;
	bh=Pc3A9Zf4PsI32DmARIZeVDHdLScH23gvOzeQNjLsyno=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NSYJByfRjAU2CvJAidpKxFfBR7R7JepR1QUlbQY61ARjgyJ7oaRt5VsnU+ndFcBz4sO48iUdtn2fMDv1pqFTmAsN3QkKbsdm0eT3aCkotPZUaDcJqrF6Lslnudlt4ByRUC8aNhlsHLFwCumCjMNmoYzoeOrHEASXWBVrqRNYin4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Y1m2jKot; arc=fail smtp.client-ip=40.107.209.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Y1m2jKot"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g7cMxlqORNq/igsgG/ckzCqswV6YSHfdYbnQoRM+qOm37NISU2rHUekqF1xnROdUwJbqnSAHbIfSYC/ADshMqDXedtI3VjbILPePCx46mDVv91fCVqDLA5/hvsbkUTJobsRVjA9+ydVKnyq0qx64KrCu0vCIIeQ+yLgFPCygHbPVaIglolGXNjsmPIBfdmu+eSEyDgM6KSAtEwoleHZCx4CLM2q8k4/XAJcuouEt9bT77f+wnd9YT9MSWEx66//AdiTmimjJyWJXqfmiam+Az6LM04Sv7xvJwrVZ3IultWrk0XcrCh7dw2qoW7DRxUNX3A/V5VI5f5OGTFzRSzu3wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OAt87NxWhLbS+9S6nIIA3O00sCsTVMuqkvwuJWasGEg=;
 b=Un32xQhMWajwRprzAr42GSg4LH4iLfLER/4YDu4dRaJFILtdeMh41+6R08lftFZv6D8inmAifBBS5NwhZHDoxYDyHRvVGtmAWGywmS+3FNdN9KwZUlPKoZH7QQk0zypl3fP961nMIrNewayyr2QCaCTCwnuDIfgGCGIlFAtUUYuAfO7Jo3hUdkL1XOeKCT3sazlkcuy/5FbHYdw9hpleykpiqQ9zBsfeCnT8NhZGmtutnFI2A8KEkjgQoP6CAL+0m0EKJj3eiD4Ccpe+gpcxFWmctt/MEfEi0gCKVhLtO/B/3ECk5SWkp2tqT5+oT0CIu/a8On+E7qrRiCTsvRXJ5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OAt87NxWhLbS+9S6nIIA3O00sCsTVMuqkvwuJWasGEg=;
 b=Y1m2jKot0rpAckX/Gg335F3aPIy+YOatfULKb3e1zY+18w1YFXrDQS9KrSE4RHMtqteQqvoed51F8MA6oY1NKYO4SrT3bJeQTUfb6RP/PY9bdtGL5ZCFNtIWuMWz65CMrGQNwp4MGKhMFn5BqY8Ms5amjDlPq9Wnevk4T7QBsUc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA1PR12MB8334.namprd12.prod.outlook.com (2603:10b6:208:3ff::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 21:06:28 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 21:06:28 +0000
Message-ID: <dd5d79c5-0300-4e33-9918-6199fad0b9aa@amd.com>
Date: Tue, 18 Nov 2025 15:06:25 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: asus-armoury: make CPU cores interface
 readonly
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Denis Benato <benato.denis96@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Denis Benato <denis.benato@linux.dev>, LKML
 <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org,
 Hans de Goede <hansg@kernel.org>, "Luke D . Jones" <luke@ljones.dev>,
 Alok Tiwari <alok.a.tiwari@oracle.com>, Mateusz Schyboll <dragonn@op.pl>,
 porfet828@gmail.com
References: <20251118005748.538726-1-denis.benato@linux.dev>
 <6cc986bc-2f0d-43e5-99d7-0cbfd9150005@gmail.com>
 <e1ce4d86-d741-e5fa-9ff3-ddbe3abc4f48@linux.intel.com>
 <6c9d04da-cd46-4f50-8f99-ae169bb9a877@gmail.com>
 <2a478609-f59d-4b8a-8e74-db0b30b94dfd@amd.com>
 <24CA03AA-8C8F-47DA-B03D-5ACDCA8C648D@gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <24CA03AA-8C8F-47DA-B03D-5ACDCA8C648D@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN6PR05CA0026.namprd05.prod.outlook.com
 (2603:10b6:805:de::39) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA1PR12MB8334:EE_
X-MS-Office365-Filtering-Correlation-Id: 00bc9e11-976b-45f5-1b62-08de26e6571d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eDhBUHRHT3IzWXpxUWtBUVdyaWdpVGdVWDV4d092emlSR0NYNVFwYzc0QTEw?=
 =?utf-8?B?a09oNW10YlpMRzdmT0dHNUdDL0NZanpjdWExVlBleFJSeDc1TUt5dFpiZlVK?=
 =?utf-8?B?MVNEeFpKTEtCa3Z1U3BZV21nOGdJekdtd0EzZUU1UldqbjdVeWUvWVdnMGdF?=
 =?utf-8?B?WGwwbncxclBvb1BYYXR3NlA1SHd0V3pQdXZrOURKcDk3NjNpcGlHSzF2aktx?=
 =?utf-8?B?TWpMR2pnMnVac3VBTUZRcWxuWGlMNEprM05GOWZ5WXU1djdNOS81ZzlyUXBU?=
 =?utf-8?B?bnFSOUZtRGRwNDdPQklpcDh1UUkyV0hHTVhUSHp1ZGFzQ01VcnBTdjVnWHM0?=
 =?utf-8?B?UjhRM2JYQjVtbXlrT281b1JpYzRGZkpwb3RqZ1kwV2J1ZXhNTzlORmFBUHVn?=
 =?utf-8?B?Uk1Ocmg1MDlBYjhZMEFyMTlZdzRGSnlqVVZXTmNmQU90Nm5xMFFaUGFZSlpR?=
 =?utf-8?B?R2JCOW1peHY1VlB3a0ZmZXZlZmdwMCt1WTgxM2VOcG82dTZnT01rZW5zRitm?=
 =?utf-8?B?TnlEa1hkOU13MEJDVFpPdGIyRXlnaGtEMnhvem54eE9PZjFxcklWdENaWmVD?=
 =?utf-8?B?U3JIdG56MWRKTzBhSEtvbmYyWEp3RGRnTGExdXFEb04wL2IwN1VMamFkUkEx?=
 =?utf-8?B?MG04Q3VXYXRKSUxmVUY1bFFuM1IyZUNQT2JtWHBFMk1OWjN1YmZMU2J0eWto?=
 =?utf-8?B?VWZvY2ExenVPR3V0QnN6RjJLcSswNUJweUNDYklCenhJaDhUcHhKT0FkL2ky?=
 =?utf-8?B?a1lqSlBVbzNmMjkxeUp4TjFTTy81MDA4YzZERWNEUTZjcmdITW1uTzg0QjFy?=
 =?utf-8?B?OEZuc0VHMGl3dENTTk5TV1QrQUREc0FxSWxtOVVkb21sRzQwVVFDM3M5Q3Bu?=
 =?utf-8?B?Z3F0NDNmS3pZeDM3cHB1cVFmRngxSWdSMkVJeG5wR0o3Z1Nkb1JhelNRd0l5?=
 =?utf-8?B?Ui9MdTRpNTEyWDBBNmRXeGFRN1VvdE5QYjBiV3BjK2Q2VmIwNEEraEFzVXVp?=
 =?utf-8?B?WkJrRHBPSW1xVDJabE5mUENnTk52M0picnU4Q0Z1ZW5WTFVpdVZFU05ReFpa?=
 =?utf-8?B?MGZxVDF6NkdWQThTS3MvaXcrdmgwem81WEs4TVpVb3BWUmp2TWxybzlQenpX?=
 =?utf-8?B?cENkUXptVzZDZVE5RDc0NGt0dXplVGZKeEFKYm0zQ2EvL1ZSdEp5WnkvZytV?=
 =?utf-8?B?V203KytkVStETmpLZWpjK2FONGdTaXBrcnNvNGkwdHQ5a3ZWSGEyeFZzcTRu?=
 =?utf-8?B?emlXN2NWRCtndm4va1hYR2VlYXJwOGJmc2p5WGE2VDVOeDJLQjJzZkluL2NN?=
 =?utf-8?B?ZWdIWk5sa1R6T1FIb2lDa0JLVllPMjBxSVBWc3J0ZURIQmh5bnBWSmZoVGVP?=
 =?utf-8?B?SUlqSFI5VVFMeTBtWW10U0pScGE0eDhmTnlJcE5kdUY0Zi91aXp1RlRUdWtJ?=
 =?utf-8?B?Y0tVZ05LSUZlOTRsWXMwdk9xVGtqdWU4RzZweDl3SExBcmE1Tm0yc1dxMWVV?=
 =?utf-8?B?VzIvQTlrdkI3eDFEWWRxdTE4RzlLRnlDYU5vMkQvWlBwdDZhbCtHRy9YaUU5?=
 =?utf-8?B?SVR5dUlDZ001VUkvc1EzVFc0bW1SaHRBeWY5OHkySysrOXdERFYvOWdVMk8y?=
 =?utf-8?B?T25XSlpxalk4cGhVMStUM0VNVnZkYXd5NnNiN3ZKUFFKUkN2WmtWMTBFdG9B?=
 =?utf-8?B?UE5WTTFpOHdOdVNUMTBqN3RReGtjQkpPMUpqQVRNNS9kVHltYjV6dEVJZjIz?=
 =?utf-8?B?SUNIN2srbVVTZG1CQjgwR1NpeUlMdnVuaFJmeVlBcDJzZis5ZzNqSjZpZVlk?=
 =?utf-8?B?N0l2MzF2M2xCS052bHFoSHl2blRHMmdBZ0dpVFRlbzhNdEtycllaaUI5RUJa?=
 =?utf-8?B?ZHMrVDhHSDU4MVN4QmJwbDRNMDNydzNSUkZTSzR2Q1lnK2E2U2JRUDNWSktq?=
 =?utf-8?B?MkpScTN0WTI2QmpNUStvT2lDL2FHS1UwNHVrZHR5WXVFZmM3QzBHSWRIUmYy?=
 =?utf-8?B?MnczQmRjOGpRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajlBMW1UYTA4am5EcHRweGdrRUMrSDh1OUhLclVqdmtmZUNxMHBHR0s4NVpz?=
 =?utf-8?B?TGR3eGgrN2tobUFwbEJkQlB1Q1NpK21IckxYVDZydEJKbi9MTy9UeW44QlJC?=
 =?utf-8?B?b3JpSzZiK3RpSERXenpWTGZvOXkzMHo3UE9QT0VPQmx2YjNMZlVvOWdlOHQ1?=
 =?utf-8?B?bzM2TGhGK2dRbzluTWh6MnRCY0hmNFdPdXAyL3pKdUFpU2RCdTZxNE5EVFpt?=
 =?utf-8?B?K2FaWlJ0SWNxdmxPRG5nOXI3NGRHTExOL0RSUVpjNGhQdjVLcmlRWGVTT3Yz?=
 =?utf-8?B?V3FaSjFjazFpd3B1UDV6YmNuV0RqTE0wYlJWQXJoYUdESEQyMU82Zk5WeW5M?=
 =?utf-8?B?N3VnYksyZW14eXJhL3hxMHhuTWFOMktNTWNIMEpDa2lzQWRJSVJhSnVKc0hz?=
 =?utf-8?B?RmpNUWtoL2xucW0zcEtHei90UG83eTdsUko1bXd6ZXlpbE5jVktpRkwxazJh?=
 =?utf-8?B?VEhIUXBacGk5ZHFLQzZMRHcwaUVWSWg1Z1p0UUNzaWNZZ0xBbDcwT3RFdldF?=
 =?utf-8?B?UjFrYi90cm8rZktmK1o5YTN1VTlucDFsVXpTUVdXbHJtTGVXamwzTmhtRmMy?=
 =?utf-8?B?cG54cHBMUVdWYWFzaXBiZmkvb1dpUld6UGRndVVmcnR0dGluR3Rydm52VFFN?=
 =?utf-8?B?OTljQlEvK21oWndhMkF0aHdQZVRaakNya3NlUnZSMStyQkoyVTFSNW53Y1lt?=
 =?utf-8?B?K2V3a21lK2pEV2l5YXRSeERNQVFPNi9ReFoxdDVIU2RUMHZNR1FORUh5emlZ?=
 =?utf-8?B?NkovZEJrdWVaSWVTZmFmaitQaEQrR05yZ0FQbXkxbmtkaGU5RkVaYnR3a0Np?=
 =?utf-8?B?NXdUNEowdStpamkyR2FXRnB3NEJJMnJMdnlwVFU0aXJVR2VCSjZMUWptRlNx?=
 =?utf-8?B?NEpHSWZuUlE5WVdGTzhGdzZwWTUwL2c1Y000Wk1VUCtURVl3dzQyK25tN1Fl?=
 =?utf-8?B?U3VRQ3J1cG9mNHNWWHhBYVFjUzdIdmxRVnN3UTkrL1lta21wbWJ6dkxIdXBR?=
 =?utf-8?B?MGZ5T1hxWFBJVDV2djBJR1pOR3B1cDFrd0lQdW5jTnhRS09DaFpJRmNRK3hl?=
 =?utf-8?B?V1JqRzRnbjlHWHo0QjZubFNYSUp5Vi9mVjNGMnRERUtyMWVZMk45dUFGZnc0?=
 =?utf-8?B?UDhIK20rZzR4VCsxV0VvY2lhaWpVWnNGUVZvVjR3bERDWngwOGdCMFVQd3ZO?=
 =?utf-8?B?UjVkWEFRNSsycitXS0N1V0lnbmROQVBSZVR4TkpGNFpuV1VpTThDWXJKWkhQ?=
 =?utf-8?B?WW52NTl1UjVQRTUxUk9QWmJoclEwR0I5MzRJSVRnWXpuUW1HczFZbkFKUTRH?=
 =?utf-8?B?MzB2dWtabmNDT21IREpyL3ZqNy9NRXRHMFl3RFEwQlBLU3NsblBRMWw2Ykg3?=
 =?utf-8?B?OWFENE51ZXA4SkVJbFlQWDhxMUF3c3NISThUZmdldzhxM0dEOE53dDIwOUdJ?=
 =?utf-8?B?WkxDeWhPUFpqRzUwcDNhVGEvNDM0cXZzcllucW1yVWlXSFlUMjYvdG5meWEx?=
 =?utf-8?B?NTFDTU9UdEZvaFlkR2VKNVhyZ1dvOFppOUw0eDdyK1ByQVBmOFpKK2JrOTJH?=
 =?utf-8?B?c3dNeVR2b3BJalVCNGpSdmZYL1J1cVloT3hHVUc3L0t3ZzJCK21UNlFRVEJS?=
 =?utf-8?B?QTVQdTJPSE5DNzNnMHhVNzduV0JybW95QVowQ0Jrbkx6UjYxZ2VvTUhCVXhJ?=
 =?utf-8?B?RFpYT1krU2VBZTJVamRMZ09GRlYvV0cyT01jUmw2UWk4c09WcWtFbDdOR1Np?=
 =?utf-8?B?QkZWK1liRlJmSGRjMXZVcFp3Z2tOZlFqK0UxeHZmeU1GNldHV29ZQStvWGJw?=
 =?utf-8?B?Tzk5cDVhNHNJVHpETW1DSU5FbGpVU09FUVhZSlc0a01GV0k2R1FzVkdqZmtV?=
 =?utf-8?B?emkycEh4YXA0SXFCdGlsTUhYZjlYTFkrTW92d1d4c3JIRTZtaTNaeTR6YXd1?=
 =?utf-8?B?TGRpTGMxT29GSzBaVkgvU1Jja201YVJ5VXh1am5mbzJuU3MwajlDZWRWa1pE?=
 =?utf-8?B?dmMzMW1Rc3VmdjJOVlUxdEZpN0pESVJkOTlqZFRvdVltZlJ0NEkwU1pnTFo0?=
 =?utf-8?B?a1dkUTdEM0xxbCtSYVBWTFl0VHZ2Z2g0dURGakhVa0l2NzJXWW01VHNoMU5t?=
 =?utf-8?Q?EZsNWdrGLVH0v+6frR2M8dLor?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00bc9e11-976b-45f5-1b62-08de26e6571d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 21:06:28.0769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +gg6wpF1a3awHdhDEa/eAVWKU0rjUnWivFsfl5BwVWoXpfvvCG3LCq4UquTPLh8A8c+ZbXtGJm7rkL/yVFcQKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8334



On 11/18/2025 2:59 PM, Derek J. Clark wrote:
> On November 18, 2025 12:52:40 PM PST, Mario Limonciello <mario.limonciello@amd.com> wrote:
>>
>>
>> On 11/18/2025 12:51 PM, Denis Benato wrote:
>>>
>>> On 11/18/25 10:16, Ilpo Järvinen wrote:
>>>> On Tue, 18 Nov 2025, Denis Benato wrote:
>>>>
>>>>> On 11/18/25 01:57, Denis Benato wrote:
>>>>>> The CPU cores interface is inconsistent between AMD and Intel systems,
>>>>>> leading to probe failure: solve the problem taking following steps:
>>>>>> - make the interface read-only (avoid the possibility of bricks)
>>>>>> - do not fail if the interface returns unexpected data
>>>>>> - show interface errors at either info or debug level
>>>>> I felt like compile-time disabling the write endpoint after reading the comment
>>>>> from Mario while still keeping the core of everything that was said in an attempt
>>>>> to make everyone happy and preparing for the future.
>>>>>
>>>>> I can also evaluate the option to introduce a table for allowed models
>>>>> where the min number of cores is hardcoded for model as it is for TDP
>>>>> tunings: that way allowed values will be tested by someone...
>>>>> Material for another day.
>>>>>
>>>>> On a side note checkpatch says:
>>>>> ```
>>>>> WARNING: Argument '_fsname' is not used in function-like macro
>>>>> #293: FILE: drivers/platform/x86/asus-armoury.h:210:
>>>>> +#define ASUS_ATTR_GROUP_CORES(_attrname, _fsname, _dispname)           \
>>>>>           __ATTR_SHOW_FMT(scalar_increment, _attrname, "%d\n", 1);        \
>>>>>           __ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);    \
>>>>>           static struct kobj_attribute attr_##_attrname##_current_value = \
>>>>> +               __ASUS_ATTR_CPU_CORES(_attrname, current_value);        \
>>>>>           static struct kobj_attribute attr_##_attrname##_default_value = \
>>>>>                   __ASUS_ATTR_RO(_attrname, default_value);               \
>>>>>           static struct kobj_attribute attr_##_attrname##_min_value =     \
>>>>> ```
>>>>>
>>>>> but _fsname name is used just below in the same macro:
>>>>> checkpatch.pl bug?
>>>>>> Links:
>>>>>> https://lore.kernel.org/all/20251114185337.578959-1-denis.benato@linux.dev/
>>>>>> https://lore.kernel.org/all/20251115145158.1172210-1-denis.benato@linux.dev/
>>>>>>
>>>>>> Suggested-by: Luke D. Jones <luke@ljones.dev>
>>>>>> Signed-off-by: Denis Benato <denis.benato@linux.dev>
>>>>>> ---
>>>>>>    drivers/platform/x86/asus-armoury.c | 104 ++++++++++++++++++++++++----
>>>>>>    drivers/platform/x86/asus-armoury.h |  12 +++-
>>>>>>    2 files changed, 99 insertions(+), 17 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
>>>>>> index 9f67218ecd14..abbbcd62d0eb 100644
>>>>>> --- a/drivers/platform/x86/asus-armoury.c
>>>>>> +++ b/drivers/platform/x86/asus-armoury.c
>>>>>> @@ -118,11 +118,14 @@ struct asus_armoury_priv {
>>>>>>    	 */
>>>>>>    	struct mutex egpu_mutex;
>>>>>>    +#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
>>>>>>    	/*
>>>>>>    	 * Mutex to prevent big/little core count changes writing to same
>>>>>>    	 * endpoint at the same time. Must lock during attr store.
>>>>>>    	 */
>>>>>>    	struct mutex cpu_core_mutex;
>>>>>> +#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
>>>>>> +
>>>>>>    	struct cpu_cores *cpu_cores;
>>>>>>    	bool cpu_cores_changeable;
>>>>>>    @@ -136,7 +139,9 @@ struct asus_armoury_priv {
>>>>>>    static struct asus_armoury_priv asus_armoury = {
>>>>>>    	.egpu_mutex = __MUTEX_INITIALIZER(asus_armoury.egpu_mutex),
>>>>>>    +#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
>>>>>>    	.cpu_core_mutex = __MUTEX_INITIALIZER(asus_armoury.cpu_core_mutex),
>>>>>> +#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
>>>>>>    };
>>>>>>      struct fw_attrs_group {
>>>>>> @@ -285,6 +290,12 @@ static int armoury_set_devstate(struct kobj_attribute *attr,
>>>>>>    			return -EINVAL;
>>>>>>    		}
>>>>>>    		break;
>>>>>> +	case ASUS_WMI_DEVID_CORES_MAX:
>>>>>> +		/*
>>>>>> +		 * CPU cores max is a read-only property on supported devices.
>>>>>> +		 */
>>>>>> +		pr_err("Refusing to write to readonly devstate of CPU cores interface\n");
>>>>>> +		return -EINVAL;
>>>>>>    	default:
>>>>>>    		/* No known problems are known for this dev_id */
>>>>>>    		break;
>>>>>> @@ -803,6 +814,7 @@ static struct cpu_cores *init_cpu_cores_ctrl(void)
>>>>>>    		return ERR_PTR(-ENODEV);
>>>>>>    	}
>>>>>>    +	pr_debug("CPU cores control interface max cores read 0%x.\n", cores);
>>>>>>    	cores_p->max_power_cores = FIELD_GET(ASUS_POWER_CORE_MASK, cores);
>>>>>>    	cores_p->max_perf_cores = FIELD_GET(ASUS_PERF_CORE_MASK, cores);
>>>>>>    @@ -812,16 +824,30 @@ static struct cpu_cores *init_cpu_cores_ctrl(void)
>>>>>>    		return ERR_PTR(-EIO);
>>>>>>    	}
>>>>>>    +	pr_debug("CPU cores control interface active cores read 0%x.\n", cores);
>>>>>>    	cores_p->cur_power_cores = FIELD_GET(ASUS_POWER_CORE_MASK, cores);
>>>>>>    	cores_p->cur_perf_cores = FIELD_GET(ASUS_PERF_CORE_MASK, cores);
>>>>>>      	cores_p->min_power_cores = CPU_POWR_CORE_COUNT_MIN;
>>>>>>    	cores_p->min_perf_cores = CPU_PERF_CORE_COUNT_MIN;
>>>>>>    +	if (cores_p->min_perf_cores > cores_p->max_perf_cores) {
>>>>>> +		pr_info("Invalid CPU performance cores count detected: min: %u, max: %u, current: %u\n",
>>>>>> +		       cores_p->min_perf_cores,
>>>>>> +		       cores_p->max_perf_cores,
>>>>>> +		       cores_p->cur_perf_cores
>>>>>> +		);
>>>>>> +		return ERR_PTR(-EINVAL);
>>>>>> +	}
>>>>>> +
>>>>>>    	if ((cores_p->min_perf_cores > cores_p->max_perf_cores) ||
>>>>>>    	    (cores_p->min_power_cores > cores_p->max_power_cores)
>>>>>>    	) {
>>>>>> -		pr_err("Invalid CPU cores count detected: interface is not safe to be used.\n");
>>>>>> +		pr_info("Invalid CPU efficiency cores count detected: min: %u, max: %u, current: %u\n",
>>>>>> +		       cores_p->min_power_cores,
>>>>>> +		       cores_p->max_power_cores,
>>>>>> +		       cores_p->cur_power_cores
>>>>>> +		);
>>>>>>    		return ERR_PTR(-EINVAL);
>>>>>>    	}
>>>>>>    @@ -836,6 +862,24 @@ static struct cpu_cores *init_cpu_cores_ctrl(void)
>>>>>>    	return no_free_ptr(cores_p);
>>>>>>    }
>>>>>>    +/**
>>>>>> + * cores_value_show() - Get the core count for the specified core type.
>>>>>> + * @kobj: The kobject associated to caller.
>>>>>> + * @attr: The kobj_attribute associated to caller.
>>>>>> + * @buf: The buffer that will be used to sysfs_emit.
>>>>>> + * @core_type: The core type (performance or efficiency).
>>>>>> + * @core_value: min, max or current count for the specified cores type.
>>>>>> + *
>>>>>> + * Intended usage is from sysfs attribute reading a CPU core count.
>>>>>> + *
>>>>>> + * This function assumes asus_armoury.cpu_cores is already initialized,
>>>>>> + * therefore the compatibility of the interface has already been checked.
>>>>>> + *
>>>>>> + * Returns:
>>>>>> + * * %-EINVAL	- invalid core value type.
>>>>>> + * * %0		- successful and buf is filled by sysfs_emit.
>>>>>> + * * %other	- error from sysfs_emit.
>>>>>> + */
>>>>>>    static ssize_t cores_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf,
>>>>>>    				enum cpu_core_type core_type, enum cpu_core_value core_value)
>>>>>>    {
>>>>>> @@ -865,6 +909,7 @@ static ssize_t cores_value_show(struct kobject *kobj, struct kobj_attribute *att
>>>>>>    	return sysfs_emit(buf, "%u\n", cpu_core_value);
>>>>>>    }
>>>>>>    +#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
>>>>>>    static ssize_t cores_current_value_store(struct kobject *kobj, struct kobj_attribute *attr,
>>>>>>    					 const char *buf, enum cpu_core_type core_type)
>>>>>>    {
>>>>>> @@ -919,6 +964,7 @@ static ssize_t cores_current_value_store(struct kobject *kobj, struct kobj_attri
>>>>>>      	return 0;
>>>>>>    }
>>>>>> +#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
>>>>>>      static ssize_t cores_performance_min_value_show(struct kobject *kobj,
>>>>>>    						struct kobj_attribute *attr, char *buf)
>>>>>> @@ -944,6 +990,7 @@ static ssize_t cores_performance_current_value_show(struct kobject *kobj,
>>>>>>    	return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, CPU_CORE_CURRENT);
>>>>>>    }
>>>>>>    +#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
>>>>>>    static ssize_t cores_performance_current_value_store(struct kobject *kobj,
>>>>>>    						     struct kobj_attribute *attr,
>>>>>>    						     const char *buf, size_t count)
>>>>>> @@ -956,8 +1003,9 @@ static ssize_t cores_performance_current_value_store(struct kobject *kobj,
>>>>>>      	return count;
>>>>>>    }
>>>>>> -ASUS_ATTR_GROUP_CORES_RW(cores_performance, "cores_performance",
>>>>>> -			 "Set the max available performance cores");
>>>>>> +#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
>>>>>> +ASUS_ATTR_GROUP_CORES(cores_performance, "cores_performance",
>>>>>> +			 "Get available performance cores");
>>>>>>      /* Define helper to access the current power mode tunable values */
>>>>>>    static inline struct rog_tunables *get_current_tunables(void)
>>>>>> @@ -992,6 +1040,7 @@ static ssize_t cores_efficiency_current_value_show(struct kobject *kobj,
>>>>>>    	return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, CPU_CORE_CURRENT);
>>>>>>    }
>>>>>>    +#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
>>>>>>    static ssize_t cores_efficiency_current_value_store(struct kobject *kobj,
>>>>>>    						    struct kobj_attribute *attr, const char *buf,
>>>>>>    						    size_t count)
>>>>>> @@ -1004,8 +1053,9 @@ static ssize_t cores_efficiency_current_value_store(struct kobject *kobj,
>>>>>>      	return count;
>>>>>>    }
>>>>>> -ASUS_ATTR_GROUP_CORES_RW(cores_efficiency, "cores_efficiency",
>>>>>> -		    "Set the max available efficiency cores");
>>>>>> +#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
>>>>>> +ASUS_ATTR_GROUP_CORES(cores_efficiency, "cores_efficiency",
>>>>>> +		    "Get available efficiency cores");
>>>>>>      /* Simple attribute creation */
>>>>>>    ASUS_ATTR_GROUP_ENUM_INT_RO(charge_mode, "charge_mode", ASUS_WMI_DEVID_CHARGE_MODE, "0;1;2\n",
>>>>>> @@ -1048,8 +1098,6 @@ static const struct asus_attr_group armoury_attr_groups[] = {
>>>>>>    	{ &egpu_enable_attr_group, ASUS_WMI_DEVID_EGPU },
>>>>>>    	{ &dgpu_disable_attr_group, ASUS_WMI_DEVID_DGPU },
>>>>>>    	{ &apu_mem_attr_group, ASUS_WMI_DEVID_APU_MEM },
>>>>>> -	{ &cores_efficiency_attr_group, ASUS_WMI_DEVID_CORES_MAX },
>>>>>> -	{ &cores_performance_attr_group, ASUS_WMI_DEVID_CORES_MAX },
>>>>>>      	{ &ppt_pl1_spl_attr_group, ASUS_WMI_DEVID_PPT_PL1_SPL },
>>>>>>    	{ &ppt_pl2_sppt_attr_group, ASUS_WMI_DEVID_PPT_PL2_SPPT },
>>>>>> @@ -1191,6 +1239,22 @@ static int asus_fw_attr_add(void)
>>>>>>    		}
>>>>>>    	}
>>>>>>    +	if (asus_armoury.cpu_cores != NULL) {
>>>>>> +		err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
>>>>>> +					&cores_efficiency_attr_group);
>>>>>> +		if (err) {
>>>>>> +			pr_err("Failed to create sysfs-group for cpu efficiency cores: %d\n", err);
>>>>>> +			goto err_remove_cores_efficiency_group;
>>>>>> +		}
>>>>>> +
>>>>>> +		err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
>>>>>> +					&cores_performance_attr_group);
>>>>>> +		if (err) {
>>>>>> +			pr_err("Failed to create sysfs-group for cpu performance cores: %d\n", err);
>>>>>> +			goto err_remove_cores_performance_group;
>>>>>> +		}
>>>>>> +	}
>>>>>> +
>>>>>>    	for (i = 0; i < ARRAY_SIZE(armoury_attr_groups); i++) {
>>>>>>    		if (!armoury_has_devstate(armoury_attr_groups[i].wmi_devid))
>>>>>>    			continue;
>>>>>> @@ -1230,6 +1294,12 @@ static int asus_fw_attr_add(void)
>>>>>>    	}
>>>>>>    	if (asus_armoury.gpu_mux_dev_id)
>>>>>>    		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &gpu_mux_mode_attr_group);
>>>>>> +err_remove_cores_performance_group:
>>>>>> +	if (asus_armoury.cpu_cores != NULL)
>>>>>> +		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &cores_performance_attr_group);
>>>>>> +err_remove_cores_efficiency_group:
>>>>>> +	if (asus_armoury.cpu_cores != NULL)
>>>>>> +		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &cores_efficiency_attr_group);
>>>>>>    err_remove_mini_led_group:
>>>>>>    	if (asus_armoury.mini_led_dev_id)
>>>>>>    		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &mini_led_mode_attr_group);
>>>>>> @@ -1375,7 +1445,6 @@ static int __init asus_fw_init(void)
>>>>>>    {
>>>>>>    	char *wmi_uid;
>>>>>>    	struct cpu_cores *cpu_cores_ctrl;
>>>>>> -	int err;
>>>>>>      	wmi_uid = wmi_get_acpi_device_uid(ASUS_WMI_MGMT_GUID);
>>>>>>    	if (!wmi_uid)
>>>>>> @@ -1389,16 +1458,14 @@ static int __init asus_fw_init(void)
>>>>>>    		return -ENODEV;
>>>>>>      	asus_armoury.cpu_cores_changeable = false;
>>>>>> +	asus_armoury.cpu_cores = NULL;
>>>>>>    	if (armoury_has_devstate(ASUS_WMI_DEVID_CORES_MAX)) {
>>>>>>    		cpu_cores_ctrl = init_cpu_cores_ctrl();
>>>>>> -		if (IS_ERR(cpu_cores_ctrl)) {
>>>>>> -			err = PTR_ERR(cpu_cores_ctrl);
>>>>>> -			pr_err("Could not initialise CPU core control: %d\n", err);
>>>>>> -			return err;
>>>>>> +		if (!IS_ERR(cpu_cores_ctrl)) {
>>>>>> +			pr_debug("CPU cores control available.\n");
>>>>>> +			asus_armoury.cpu_cores = cpu_cores_ctrl;
>>>>>> +			asus_armoury.cpu_cores_changeable = true;
>>>>>>    		}
>>>>>> -
>>>>>> -		asus_armoury.cpu_cores = cpu_cores_ctrl;
>>>>>> -		asus_armoury.cpu_cores_changeable = true;
>>>>>>    	}
>>>>>>      	init_rog_tunables();
>>>>>> @@ -1417,6 +1484,13 @@ static void __exit asus_fw_exit(void)
>>>>>>    					   armoury_attr_groups[i].attr_group);
>>>>>>    	}
>>>>>>    +	if (asus_armoury.cpu_cores != NULL) {
>>>>>> +		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj,
>>>>>> +				   &cores_performance_attr_group);
>>>>>> +		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj,
>>>>>> +				   &cores_efficiency_attr_group);
>>>>>> +	}
>>>>>> +
>>>>>>    	if (asus_armoury.gpu_mux_dev_id)
>>>>>>    		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &gpu_mux_mode_attr_group);
>>>>>>    diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
>>>>>> index 2f05a2e0cab3..6b2bfe763d23 100644
>>>>>> --- a/drivers/platform/x86/asus-armoury.h
>>>>>> +++ b/drivers/platform/x86/asus-armoury.h
>>>>>> @@ -198,12 +198,20 @@ ssize_t armoury_attr_uint_show(struct kobject *kobj, struct kobj_attribute *attr
>>>>>>    		.name = _fsname, .attrs = _attrname##_attrs			\
>>>>>>    	}
>>>>>>    +#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
>>>>>> +	#define __ASUS_ATTR_CPU_CORES(_attrname, __attrval) \
>>>>>> +		__ASUS_ATTR_RW(_attrname, __attrval)
>>>>>> +#else
>>>>>> +	#define __ASUS_ATTR_CPU_CORES(_attrname, __attrval) \
>>>>>> +		__ASUS_ATTR_RO(_attrname, __attrval)
>>>>>> +#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
>>>>>> +
>>>>>>    /* CPU core attributes need a little different in setup */
>>>>>> -#define ASUS_ATTR_GROUP_CORES_RW(_attrname, _fsname, _dispname)		\
>>>>>> +#define ASUS_ATTR_GROUP_CORES(_attrname, _fsname, _dispname)		\
>>>>>>    	__ATTR_SHOW_FMT(scalar_increment, _attrname, "%d\n", 1);	\
>>>>>>    	__ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);	\
>>>>>>    	static struct kobj_attribute attr_##_attrname##_current_value =	\
>>>>>> -		__ASUS_ATTR_RW(_attrname, current_value);		\
>>>>>> +		__ASUS_ATTR_CPU_CORES(_attrname, current_value);	\
>>>>>>    	static struct kobj_attribute attr_##_attrname##_default_value = \
>>>>>>    		__ASUS_ATTR_RO(_attrname, default_value);		\
>>>>>>    	static struct kobj_attribute attr_##_attrname##_min_value =	\
>>>> Hi Denis,
>>> Hi!
>>>> This cores thing has unfortunately turned into too much of a mess, a fixup
>>>> after fixup, disagreement of even what should be included and what not.
>>> I'm sorry for the trouble.
>>>> I'm really sorry for all the extra trouble these people are putting you
>>>> through as apparently even 17 versions of the main patch series weren't
>>>> enough to get them to stretch their fingers over the keyboard :-/.
>>> I was aware of what I was running into when I accepted
>>> Luke's request to maintain asus-related things :)
>>>
>>> The interface is being evolving since it's what asus keeps
>>> integrating and changing on new hardware,
>>> so unexpected things are to be expected... hah!
>>>> I've now dropped the cores patch from the review-ilpo-next branch but
>>>> tried to keep the rest. Please check I didn't make any stupid mistakes
>>>> while resolving the resulting conflicts with the ppt/nv change, at least
>>>> the diff against the removal patch looked promising. If there's an issue,
>>>> please just provide a clean v18 of the main series without the cores patch
>>>> so I can replace.
>>> Thanks! Looks good to me too, I have asked asus-linux kernel-man
>>> to distribute this patchset taken from pdx86 repo: if you don't hear for
>>> me in 2-3 hours the world isn't burning :D
>>>> If you want to send a clean version of the cores patch (separately), I can
>>>> consider it after giving enough time for people to comment.
>>>>
>>> Going forward I think the best approach is to make the interface
>>> compatible with new hardware and useful for who needs it:
>>> - RO by default and disregarded by the driver in case of funny business
>>> - RW for hardware that was requested and tested, similar to the TDP
>>>     so that I can also be confident on what minimum cores count are per-model
>>>     instead of relying on a macro and hoping for the best
>>> - Integrating your suggestions
>>>
>>> And that should satisfy everybody and make the interface safe.
>>>
>>> Please everybody, let me know if this is an acceptable solution
>>> that would make everyone involved happy: from developers
>>> to final users (especially those who use this feature in Windows).
>>>
>>> Thank you all,
>>> Denis
>>
>>
>> It's up to you at the end of the day if you want some machines to be opt in to RW, but I don't think this fair to treat this the same as TDP.
>>
>> We only have one way to change TDP on these machines - the BIOS interface.
>>
>> For parking of cores there is the BIOS method or Linux native support for offlining cores.
> 
> There is one caveat which I think is relevant, if a core was disabled in windows, BIOS, or a previous version of this patch set using this interface, you would need to use BIOS or windows to re-enable it.
> 
> I'm on the fence if that justifies having an optional table of verified working hardware though, considering the risk I think would just recommend folks use the BIOS interface for it.
> 
> - Derek

I feel that someone that was technical enough to set up a dual boot in 
the first place and change this option is PROBABLY also technical enough 
to go into the BIOS and poke around to turn it off if they no longer 
have Windows on the system.

