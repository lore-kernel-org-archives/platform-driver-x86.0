Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012033.outbound.protection.outlook.com [52.101.43.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2EB3702F8;
	Tue, 18 Nov 2025 20:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763499172; cv=fail; b=RqKQ55zSQtJ5bn292RxFZEAYtQSdgO2Mak9M4laWmheMjBV75dVjU7B3+rgokFw437Ml5O2JNnueOdBJDaACGBBQ0RSsvdooViFtnXXKlCDMCbo5nTzzHRgUec401zt6lFu0f3MEG7lDwQb++YDbcTEKMWJ3k2n3Oo9IMH/ymtg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763499172; c=relaxed/simple;
	bh=xhAM/YqeoAeVVer02ag7eZLepH3pwtI2xRzwUMlaLcI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XppD7ARyotRuVlI+kCoe+1PsZi/B83G/1rMWHYd2RSZbqjFV3uyYsFBNw/YJIivJibz4TS3aioSZlx4klj3n/5dweRHZZ+JdrlRLQYhYO5/NIHDBDAMKsJxqvauMp22XAVkwsmHSr9p3gv1ANRvmF1tXbfcsnYY+1sxmeOnYY+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=yKafnnWl; arc=fail smtp.client-ip=52.101.43.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="yKafnnWl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vAAIHhfjXNmg4Zdz86cNLlbOOJO1CmD7RBCl9oQigj8mm7MQE76d8KA1MrLl3BGTWonzHzj9/DuXXxrzjy2ZMsfJv7/FHacLT+crb1LR6NH37o/R+2QeAuWja2w7OWxdam3u6BQyla77BQwpmXqoYFN6/JlE5gjiUQcRSAvGpqPSQwNGE/1X7t/ofs9imethFuHqVCr3ixcyUhQxoXI56U0WwZMoGp9VvAavLy79ThoUiQ3JXy6lY2VZ7IG6w1hdMMlg8aRgywSRLNb+cLsN14wGBZfB7mHX3P1QGN1jBJn8P11uhqJZsCBmoL+hGkCR4MkqAeYrszB5+npQP6nRUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rdqOUhkjX4kWAA4yk79lygsEaQkMAzMnSoXES1yG90M=;
 b=uSz9mYbdlCqdjEzp8s7lff1zw/4mmvqo5+MuuV2naWbQgiV/f8UQ1MywLB2sgm4iC5Q5ikOagVzMtjf9djMIHD1QpOASL3XdY7BFQeeWYzwc0G27AoGNJ0JMZeRWgGijdoMyeG7mHn6GuiO5gfTBf8816BCtYYm/+xl0v8N5Y4mRdhmeh2RoqzCNJkYu8tw9EKuCby5Bz5q+Rot3dVCXGYJiDjrJJcMbCWShWuuXvWD285gwHTxKxXDtlUkNwjnvv9WhdlN12kq4V6L5B47LiW8jJt+b+eGeLQxL988BEhzA0b0SrJy1WiLRyAKbztgkblVr8a481gmkGimoPTd6qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rdqOUhkjX4kWAA4yk79lygsEaQkMAzMnSoXES1yG90M=;
 b=yKafnnWl2Sk1ABBe/8SOKoaaBqtABHIe8mWsh4FX1tTHxRHx1FBjCQBr2b6MR5ScaoCdWEPezCSevZikA+yCOseKLRzXvzhPhCZtq8AVZID592bcTV9V/QcEWP1B86oiWLhtVL5UqiYbfYaZDHb16k+eLvDZQr9zmYGBmyVYjAM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SN7PR12MB8146.namprd12.prod.outlook.com (2603:10b6:806:323::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 20:52:44 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 20:52:44 +0000
Message-ID: <2a478609-f59d-4b8a-8e74-db0b30b94dfd@amd.com>
Date: Tue, 18 Nov 2025 14:52:40 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: asus-armoury: make CPU cores interface
 readonly
To: Denis Benato <benato.denis96@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Denis Benato <denis.benato@linux.dev>, LKML
 <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org,
 Hans de Goede <hansg@kernel.org>, "Luke D . Jones" <luke@ljones.dev>,
 Alok Tiwari <alok.a.tiwari@oracle.com>,
 Derek John Clark <derekjohn.clark@gmail.com>,
 Mateusz Schyboll <dragonn@op.pl>, porfet828@gmail.com
References: <20251118005748.538726-1-denis.benato@linux.dev>
 <6cc986bc-2f0d-43e5-99d7-0cbfd9150005@gmail.com>
 <e1ce4d86-d741-e5fa-9ff3-ddbe3abc4f48@linux.intel.com>
 <6c9d04da-cd46-4f50-8f99-ae169bb9a877@gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <6c9d04da-cd46-4f50-8f99-ae169bb9a877@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS7PR03CA0157.namprd03.prod.outlook.com
 (2603:10b6:5:3b2::12) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SN7PR12MB8146:EE_
X-MS-Office365-Filtering-Correlation-Id: 683683f1-1df0-4bde-ac6c-08de26e46bf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Um1uRCtlbXpKblhlcy9FWSszR3lSY094YThza2JrVENYVVY4QnA4UzNOcDNJ?=
 =?utf-8?B?czVxNkFnWWVZZHBsT011b3JFMWxnK0RCeVpEU3VyWXU3S3hYKzdvS0hQM2Qw?=
 =?utf-8?B?V2N2MnZmQXNVU2VOVC91QUc3b1ZwMHVDWUZZelg1bE1lK2pqOWpheVZQZ3Y5?=
 =?utf-8?B?czBtK1hGZHMrMFFMRkNqWlFlYURxbnZ3d1BjZHR4ZHZmMEY1SmJQYndOZk5F?=
 =?utf-8?B?eGhCUGtvNW9SeFVBZVZwMUxscEgwenExMGVPYm5CSURaNytKN3QremNvVk4x?=
 =?utf-8?B?ZmZwcUVENmQ4bUdiRnN4U2R3OXc5aXZhSHFrYSszcEVzWUxNZXpyZ0Zsd0ts?=
 =?utf-8?B?NWIvWEpEbndrSmtzQW9tNDRkYU9zMmpXWm1wekMxQXdhcGZSclkvZjZDYmhv?=
 =?utf-8?B?Z3BqMUpIR0xvTFRhVGs3RzhpbFlKVkxxVmVid0xITm5DUFBiUE12MXNxOGY4?=
 =?utf-8?B?N0d3dHRBUWZLcU5NU0VLaVBEODZPUFAwR1k2REZCbmhaNTRrOVhqRjZIbUFZ?=
 =?utf-8?B?bVJxUGlVMUIvUEY1clJzR1JEUGl5K0tGdXlmaUpuMkwzUUJvd3I3RlQ2ODJ2?=
 =?utf-8?B?YnZHeU5uZ1hZQmVaVXJ6N0lqTU5XeSt6UndFUXJmMU9IZXN5WXByQVl0SXA4?=
 =?utf-8?B?VlZ5WkhVYkcxN2xQTGNreGpmWU9XbUt2aU1tRkZzWmhqNmx5aHp3cG1wcGx4?=
 =?utf-8?B?bzBJbHRmY1RyV0cvMUwvbEV0LzhlelJiRHdKN3lzS2xQc044UzJGcFFuMmww?=
 =?utf-8?B?ckp1UnpPcGIxUHNickliZmY0SmtXNG45NjgwdXFGZDhMai9MYWxKRXdObUFU?=
 =?utf-8?B?T1J0LzY2K0l3MFg3dVhvMGZIRm14Mm9WN3VXMkh6bmVuTGNhZ0VUUTlZK0p0?=
 =?utf-8?B?OEtkOFloQU5TVFRKbm9MVTNSU1BzVzhFVzJ6VDl6Z29RZUZnd1dtVm9Db0g3?=
 =?utf-8?B?WEJsQW5VbUVqZ0szd0NQTldDcEg2M1NxdGl3Mk5NNFNBQ3ZnWlRzQ1hvUU41?=
 =?utf-8?B?YkFINHprRkRhOUt0bElYSktrcjJPaU53b1hRMkhVd2JnMFNidWsrc1dySHBa?=
 =?utf-8?B?dytlcnBTVjNmMWtwM3FsYmhBK2JwQXVYNGprcWh5R3FUM1NoK251SjBicWgy?=
 =?utf-8?B?aEJwV1FhZVp6cnFpWnNmNGUrZDFodFBlQWNCaC9iQVVEbHFiK2ZxK1pUbEpT?=
 =?utf-8?B?akhROXlJcnpESlY5dmZpL3VRZm9Ra2FkbnVhOHRPekVhd2JWWUhhcWZFbW5x?=
 =?utf-8?B?UHpzNUwybFdveW1lSFZGV29OUHhBODBKQ0dvM3NUdGNXQjZSS3UvQ2NhQUdL?=
 =?utf-8?B?Z3U1L1J3bmJIVVpCZ2FRNzR1TnFWR0dLM3Rpc3NpQ1RGdGJDWFdFN3BEa3ZE?=
 =?utf-8?B?VGVISzJqM0V5Z1poR3dmeGo2ei9vWUVpcUZrYkpwL0o2bStPMEdaMzJia09Q?=
 =?utf-8?B?M1UxZGFNTHRNRnpPV1dqSmVLRjN4eVVwZ3R6c2wyRndIQUdtaGdTQTQremtJ?=
 =?utf-8?B?Y1dZR3RxWjF0c3k3aVJrWEJQa24xOVIwTFdzelJNT29YaFlEWUhSNVIrV2tS?=
 =?utf-8?B?WUZyM2NKOS9EVUpGa1IxcjVDYlRnU01TNlNFRVFBeVY0SEJhdDZ0NjNzMVZQ?=
 =?utf-8?B?b3k1YVVBYXplYXpvSmtOckU5bDBtWEEvQThTVFNrYy81K3A5aEtNUGlCT0xk?=
 =?utf-8?B?dVU0TExweXdtb2RvNm11NlR3b0xqNmFreVowUlhXWThDMFd0TjI0UXVFRjNs?=
 =?utf-8?B?VWdoNHpua0s2ZURkYy9aVHRvbFdFcEZ2cmdVVG1UcjA0V1UxUFdsVmNqMEpI?=
 =?utf-8?B?N3JKbHVaVi9wUlk2TXJZQ2FmeHRvcE1EWFhUQkVVWkQ1UmVHbENyeGRpOVhM?=
 =?utf-8?B?Y1BneTVMUjlkc3RBNEFSaFQwS1JwdENsdklGRXNRelFrY3p0NFpHUFBhK0Nj?=
 =?utf-8?B?SUp1VnF4RUN6RjhWMjRRU3VFNnM5RzExR1BxbENTcTI5b09La3RiYi8rMHpM?=
 =?utf-8?B?S2Z6R3NieXJRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHRSUDZsSy9TRy9maGloWTN4MUQwWUJicll1SmthaHdCTTdOaVNPRCtSZHBK?=
 =?utf-8?B?SzJKMkZxTTlwRldZYzFEMDBHa0t0Ri91MGQ0T0h5MVJEWkd6THF1bHhLUUZC?=
 =?utf-8?B?V2x1L2xQQmsrU3laRjB6OTk1dU1wcllSZGNyYVJEVzIrSExrOC83L0psUW1N?=
 =?utf-8?B?NDEra01BMlhMNWhabHZNcDZib2p5elVlVzNTaDMzL29NM3NoV1dkUVZ2ZERn?=
 =?utf-8?B?U0QzRmZTaUk1QzNmbFJQMWFHaW9wamtuTHJDV01HN2M3SUQ2a3lhcnpnQjlK?=
 =?utf-8?B?c0Y1ZkNLdGF5a3FJem0xRENyTnZZdHpVSG8xcXhFektaQUdtYVhqcWprT2FQ?=
 =?utf-8?B?dDh0NlFnMGlwM0Q4VkpFakltSFlqSEFGclg2VVVJWlpYamVkSnJHdHZKb3hk?=
 =?utf-8?B?SVJuV0hVZXQ2czcvTmJOdEM3WFpKYVhIVXRPbEM3d09uaERsSnlvT1RieVNj?=
 =?utf-8?B?RjJjaEVFVkZGczdQUGtBV3pPR2N4RFFLUEk4bjVUQXBYLzVjWUd3QXRoTU9V?=
 =?utf-8?B?RzZWVjRhdUtIemFQUjBoTXdWamIwcnQ1bW5CeUlxSG9EVUZrbHN0NGpjcFMz?=
 =?utf-8?B?WExDQ3dqWHdCUDFvMUdwK3I1K1RYT3lYbkgxVFhmcmhiSDZsQkpRVzZrNVlS?=
 =?utf-8?B?enVBS3Zpc0ljbVZLTjg1aVVjOE5Cd0JmcTRxVVNWVnVYbVhrNWc3aC9Ja2VQ?=
 =?utf-8?B?R3BDaXM1M3Z2d1drVHc1cC91VjMxL0g4RkJkV2hRd0tVUmgwdEJla2Q3NllR?=
 =?utf-8?B?Q0IxR29RU1JWbTMyRjA0ajREQmxGYzRjV3orVkpBMGZSZFJUbVpUMU1rZjFt?=
 =?utf-8?B?cFZGa3FIbW9NdXY0QnFVV2t5MS9kZDU1WnhjaXQzZHF4T09WeWVFR044Yy9h?=
 =?utf-8?B?bW9uMTBZeEV0L2lwNUlmNjNSS3VucWh0dk9DaWJzSTJsUEU1aXJ5S2M0U1JG?=
 =?utf-8?B?dmxGc0lJTlNuaHl0NGptUU1VeUp4em8rQ0xRNDQ5c09VRkZQS2NLc0V2ZDdx?=
 =?utf-8?B?d2xobkl1M1FWRngwL3NlN2ZGdDdyYzNvS2V1L2hWYmt6aHdUQjJaaE5DQmNw?=
 =?utf-8?B?WkdLRG93Nkk4YVBGV2RFRzhFRmlPVFkxREhnZ25RbU43ZThYUWZsV3FMTjNV?=
 =?utf-8?B?QUNqWVJlb1N5T0VuWTIxMUpDREtXZGxialczOXRIcEc2c3B0bytPd1gza0V2?=
 =?utf-8?B?QitPTW5uSUZDTWg1akdNYU5tdisxNXdjTzM2WTlTd1FVOCtqRTZhY1hkUkF4?=
 =?utf-8?B?bVUycmt4Z3EwVkRma3RzclFiQVV6S3l6T1lPNFU1OGMyVitzRWdYSGVIam9K?=
 =?utf-8?B?aWpCdTZKUTNvM2c2eXFFTDVKd3BVUDRGUlR1MzFIZ05xQjNnaGVuS05qdnZp?=
 =?utf-8?B?dHg4ek9BV2pNWkU0NWt2N1JVS0tsTzR5Um5Vc3lNSmZMakFyNnVZYmk2T0tC?=
 =?utf-8?B?cXN6UXhhWTRKaS9hdENralZvZ3JsNHVKUDNwa3Z2ZkM1U1gxWUJPNzlsb1M3?=
 =?utf-8?B?czZxYVpuejZTNXVWZXpDYkVWMjRwQkw0dXVJQlMrd0VxcEtZU0NlRVVkSWZk?=
 =?utf-8?B?enlnYnJwa24zTlRGWG9CQ25RNlNRK0Q3RTNJU2t3ZHcvKysvaDU4QUYwRmFr?=
 =?utf-8?B?ZnhKRlF6aXJIWnlvdHh3NmJvQUUybkdEQlh6RXJKeHBHVS9ZUTZISTdqQWdl?=
 =?utf-8?B?bVNld3Z6ZzdLL1BtbGJmeHhGaldJOWErcFBEZ0FOV3BISlBIQmxKMTJ5L1BH?=
 =?utf-8?B?K2wvYmxrWlpVSWVhdFdqc0pGQlhFVkovOVhhU2E3V0RTMmZOMmlxc1J6TnFJ?=
 =?utf-8?B?ZHMzSUEwZUdueEo1Q0xEcUlscUkxM0IwSlltNEhvZDJIK2ZCNlRNQm5CcTRm?=
 =?utf-8?B?cXJ3QzVrREhseVZJN0ZQdWtWTEl0OXF3aWRQV1dncUl2NzFIWlpOU2tmamNq?=
 =?utf-8?B?RUlBZFAyMzZTQmVjMjFhb3ZRcG0xbG91NUNsQnhJeWdweklkVGIzeUNTRFpF?=
 =?utf-8?B?OHc2aS9mUEd1Y0g4WnVNRmZuRldZNnJGaXZua3JrQUxKQVAyWTFpZm5XSjBF?=
 =?utf-8?B?MHpyV2s2TE1wTk1FdlNGUXh0bFRhdjdFOGRwY0dnQ2F0QWZaaU5nbmNBNFpq?=
 =?utf-8?Q?Kag7v4zdCcN1U/nT8v4W98FLG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 683683f1-1df0-4bde-ac6c-08de26e46bf9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 20:52:44.1915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dta7ALgKxdd8QIgpAS1Fp5rpi/AMNo2caHM6hkOO77diPqEDK9ySJnwdvz2QAjVLrTRlgnQ9wbd7iv7AjLxWLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8146



On 11/18/2025 12:51 PM, Denis Benato wrote:
> 
> On 11/18/25 10:16, Ilpo Järvinen wrote:
>> On Tue, 18 Nov 2025, Denis Benato wrote:
>>
>>> On 11/18/25 01:57, Denis Benato wrote:
>>>> The CPU cores interface is inconsistent between AMD and Intel systems,
>>>> leading to probe failure: solve the problem taking following steps:
>>>> - make the interface read-only (avoid the possibility of bricks)
>>>> - do not fail if the interface returns unexpected data
>>>> - show interface errors at either info or debug level
>>> I felt like compile-time disabling the write endpoint after reading the comment
>>> from Mario while still keeping the core of everything that was said in an attempt
>>> to make everyone happy and preparing for the future.
>>>
>>> I can also evaluate the option to introduce a table for allowed models
>>> where the min number of cores is hardcoded for model as it is for TDP
>>> tunings: that way allowed values will be tested by someone...
>>> Material for another day.
>>>
>>> On a side note checkpatch says:
>>> ```
>>> WARNING: Argument '_fsname' is not used in function-like macro
>>> #293: FILE: drivers/platform/x86/asus-armoury.h:210:
>>> +#define ASUS_ATTR_GROUP_CORES(_attrname, _fsname, _dispname)           \
>>>          __ATTR_SHOW_FMT(scalar_increment, _attrname, "%d\n", 1);        \
>>>          __ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);    \
>>>          static struct kobj_attribute attr_##_attrname##_current_value = \
>>> +               __ASUS_ATTR_CPU_CORES(_attrname, current_value);        \
>>>          static struct kobj_attribute attr_##_attrname##_default_value = \
>>>                  __ASUS_ATTR_RO(_attrname, default_value);               \
>>>          static struct kobj_attribute attr_##_attrname##_min_value =     \
>>> ```
>>>
>>> but _fsname name is used just below in the same macro:
>>> checkpatch.pl bug?
>>>> Links:
>>>> https://lore.kernel.org/all/20251114185337.578959-1-denis.benato@linux.dev/
>>>> https://lore.kernel.org/all/20251115145158.1172210-1-denis.benato@linux.dev/
>>>>
>>>> Suggested-by: Luke D. Jones <luke@ljones.dev>
>>>> Signed-off-by: Denis Benato <denis.benato@linux.dev>
>>>> ---
>>>>   drivers/platform/x86/asus-armoury.c | 104 ++++++++++++++++++++++++----
>>>>   drivers/platform/x86/asus-armoury.h |  12 +++-
>>>>   2 files changed, 99 insertions(+), 17 deletions(-)
>>>>
>>>> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
>>>> index 9f67218ecd14..abbbcd62d0eb 100644
>>>> --- a/drivers/platform/x86/asus-armoury.c
>>>> +++ b/drivers/platform/x86/asus-armoury.c
>>>> @@ -118,11 +118,14 @@ struct asus_armoury_priv {
>>>>   	 */
>>>>   	struct mutex egpu_mutex;
>>>>   
>>>> +#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
>>>>   	/*
>>>>   	 * Mutex to prevent big/little core count changes writing to same
>>>>   	 * endpoint at the same time. Must lock during attr store.
>>>>   	 */
>>>>   	struct mutex cpu_core_mutex;
>>>> +#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
>>>> +
>>>>   	struct cpu_cores *cpu_cores;
>>>>   	bool cpu_cores_changeable;
>>>>   
>>>> @@ -136,7 +139,9 @@ struct asus_armoury_priv {
>>>>   static struct asus_armoury_priv asus_armoury = {
>>>>   	.egpu_mutex = __MUTEX_INITIALIZER(asus_armoury.egpu_mutex),
>>>>   
>>>> +#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
>>>>   	.cpu_core_mutex = __MUTEX_INITIALIZER(asus_armoury.cpu_core_mutex),
>>>> +#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
>>>>   };
>>>>   
>>>>   struct fw_attrs_group {
>>>> @@ -285,6 +290,12 @@ static int armoury_set_devstate(struct kobj_attribute *attr,
>>>>   			return -EINVAL;
>>>>   		}
>>>>   		break;
>>>> +	case ASUS_WMI_DEVID_CORES_MAX:
>>>> +		/*
>>>> +		 * CPU cores max is a read-only property on supported devices.
>>>> +		 */
>>>> +		pr_err("Refusing to write to readonly devstate of CPU cores interface\n");
>>>> +		return -EINVAL;
>>>>   	default:
>>>>   		/* No known problems are known for this dev_id */
>>>>   		break;
>>>> @@ -803,6 +814,7 @@ static struct cpu_cores *init_cpu_cores_ctrl(void)
>>>>   		return ERR_PTR(-ENODEV);
>>>>   	}
>>>>   
>>>> +	pr_debug("CPU cores control interface max cores read 0%x.\n", cores);
>>>>   	cores_p->max_power_cores = FIELD_GET(ASUS_POWER_CORE_MASK, cores);
>>>>   	cores_p->max_perf_cores = FIELD_GET(ASUS_PERF_CORE_MASK, cores);
>>>>   
>>>> @@ -812,16 +824,30 @@ static struct cpu_cores *init_cpu_cores_ctrl(void)
>>>>   		return ERR_PTR(-EIO);
>>>>   	}
>>>>   
>>>> +	pr_debug("CPU cores control interface active cores read 0%x.\n", cores);
>>>>   	cores_p->cur_power_cores = FIELD_GET(ASUS_POWER_CORE_MASK, cores);
>>>>   	cores_p->cur_perf_cores = FIELD_GET(ASUS_PERF_CORE_MASK, cores);
>>>>   
>>>>   	cores_p->min_power_cores = CPU_POWR_CORE_COUNT_MIN;
>>>>   	cores_p->min_perf_cores = CPU_PERF_CORE_COUNT_MIN;
>>>>   
>>>> +	if (cores_p->min_perf_cores > cores_p->max_perf_cores) {
>>>> +		pr_info("Invalid CPU performance cores count detected: min: %u, max: %u, current: %u\n",
>>>> +		       cores_p->min_perf_cores,
>>>> +		       cores_p->max_perf_cores,
>>>> +		       cores_p->cur_perf_cores
>>>> +		);
>>>> +		return ERR_PTR(-EINVAL);
>>>> +	}
>>>> +
>>>>   	if ((cores_p->min_perf_cores > cores_p->max_perf_cores) ||
>>>>   	    (cores_p->min_power_cores > cores_p->max_power_cores)
>>>>   	) {
>>>> -		pr_err("Invalid CPU cores count detected: interface is not safe to be used.\n");
>>>> +		pr_info("Invalid CPU efficiency cores count detected: min: %u, max: %u, current: %u\n",
>>>> +		       cores_p->min_power_cores,
>>>> +		       cores_p->max_power_cores,
>>>> +		       cores_p->cur_power_cores
>>>> +		);
>>>>   		return ERR_PTR(-EINVAL);
>>>>   	}
>>>>   
>>>> @@ -836,6 +862,24 @@ static struct cpu_cores *init_cpu_cores_ctrl(void)
>>>>   	return no_free_ptr(cores_p);
>>>>   }
>>>>   
>>>> +/**
>>>> + * cores_value_show() - Get the core count for the specified core type.
>>>> + * @kobj: The kobject associated to caller.
>>>> + * @attr: The kobj_attribute associated to caller.
>>>> + * @buf: The buffer that will be used to sysfs_emit.
>>>> + * @core_type: The core type (performance or efficiency).
>>>> + * @core_value: min, max or current count for the specified cores type.
>>>> + *
>>>> + * Intended usage is from sysfs attribute reading a CPU core count.
>>>> + *
>>>> + * This function assumes asus_armoury.cpu_cores is already initialized,
>>>> + * therefore the compatibility of the interface has already been checked.
>>>> + *
>>>> + * Returns:
>>>> + * * %-EINVAL	- invalid core value type.
>>>> + * * %0		- successful and buf is filled by sysfs_emit.
>>>> + * * %other	- error from sysfs_emit.
>>>> + */
>>>>   static ssize_t cores_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf,
>>>>   				enum cpu_core_type core_type, enum cpu_core_value core_value)
>>>>   {
>>>> @@ -865,6 +909,7 @@ static ssize_t cores_value_show(struct kobject *kobj, struct kobj_attribute *att
>>>>   	return sysfs_emit(buf, "%u\n", cpu_core_value);
>>>>   }
>>>>   
>>>> +#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
>>>>   static ssize_t cores_current_value_store(struct kobject *kobj, struct kobj_attribute *attr,
>>>>   					 const char *buf, enum cpu_core_type core_type)
>>>>   {
>>>> @@ -919,6 +964,7 @@ static ssize_t cores_current_value_store(struct kobject *kobj, struct kobj_attri
>>>>   
>>>>   	return 0;
>>>>   }
>>>> +#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
>>>>   
>>>>   static ssize_t cores_performance_min_value_show(struct kobject *kobj,
>>>>   						struct kobj_attribute *attr, char *buf)
>>>> @@ -944,6 +990,7 @@ static ssize_t cores_performance_current_value_show(struct kobject *kobj,
>>>>   	return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, CPU_CORE_CURRENT);
>>>>   }
>>>>   
>>>> +#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
>>>>   static ssize_t cores_performance_current_value_store(struct kobject *kobj,
>>>>   						     struct kobj_attribute *attr,
>>>>   						     const char *buf, size_t count)
>>>> @@ -956,8 +1003,9 @@ static ssize_t cores_performance_current_value_store(struct kobject *kobj,
>>>>   
>>>>   	return count;
>>>>   }
>>>> -ASUS_ATTR_GROUP_CORES_RW(cores_performance, "cores_performance",
>>>> -			 "Set the max available performance cores");
>>>> +#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
>>>> +ASUS_ATTR_GROUP_CORES(cores_performance, "cores_performance",
>>>> +			 "Get available performance cores");
>>>>   
>>>>   /* Define helper to access the current power mode tunable values */
>>>>   static inline struct rog_tunables *get_current_tunables(void)
>>>> @@ -992,6 +1040,7 @@ static ssize_t cores_efficiency_current_value_show(struct kobject *kobj,
>>>>   	return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, CPU_CORE_CURRENT);
>>>>   }
>>>>   
>>>> +#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
>>>>   static ssize_t cores_efficiency_current_value_store(struct kobject *kobj,
>>>>   						    struct kobj_attribute *attr, const char *buf,
>>>>   						    size_t count)
>>>> @@ -1004,8 +1053,9 @@ static ssize_t cores_efficiency_current_value_store(struct kobject *kobj,
>>>>   
>>>>   	return count;
>>>>   }
>>>> -ASUS_ATTR_GROUP_CORES_RW(cores_efficiency, "cores_efficiency",
>>>> -		    "Set the max available efficiency cores");
>>>> +#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
>>>> +ASUS_ATTR_GROUP_CORES(cores_efficiency, "cores_efficiency",
>>>> +		    "Get available efficiency cores");
>>>>   
>>>>   /* Simple attribute creation */
>>>>   ASUS_ATTR_GROUP_ENUM_INT_RO(charge_mode, "charge_mode", ASUS_WMI_DEVID_CHARGE_MODE, "0;1;2\n",
>>>> @@ -1048,8 +1098,6 @@ static const struct asus_attr_group armoury_attr_groups[] = {
>>>>   	{ &egpu_enable_attr_group, ASUS_WMI_DEVID_EGPU },
>>>>   	{ &dgpu_disable_attr_group, ASUS_WMI_DEVID_DGPU },
>>>>   	{ &apu_mem_attr_group, ASUS_WMI_DEVID_APU_MEM },
>>>> -	{ &cores_efficiency_attr_group, ASUS_WMI_DEVID_CORES_MAX },
>>>> -	{ &cores_performance_attr_group, ASUS_WMI_DEVID_CORES_MAX },
>>>>   
>>>>   	{ &ppt_pl1_spl_attr_group, ASUS_WMI_DEVID_PPT_PL1_SPL },
>>>>   	{ &ppt_pl2_sppt_attr_group, ASUS_WMI_DEVID_PPT_PL2_SPPT },
>>>> @@ -1191,6 +1239,22 @@ static int asus_fw_attr_add(void)
>>>>   		}
>>>>   	}
>>>>   
>>>> +	if (asus_armoury.cpu_cores != NULL) {
>>>> +		err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
>>>> +					&cores_efficiency_attr_group);
>>>> +		if (err) {
>>>> +			pr_err("Failed to create sysfs-group for cpu efficiency cores: %d\n", err);
>>>> +			goto err_remove_cores_efficiency_group;
>>>> +		}
>>>> +
>>>> +		err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
>>>> +					&cores_performance_attr_group);
>>>> +		if (err) {
>>>> +			pr_err("Failed to create sysfs-group for cpu performance cores: %d\n", err);
>>>> +			goto err_remove_cores_performance_group;
>>>> +		}
>>>> +	}
>>>> +
>>>>   	for (i = 0; i < ARRAY_SIZE(armoury_attr_groups); i++) {
>>>>   		if (!armoury_has_devstate(armoury_attr_groups[i].wmi_devid))
>>>>   			continue;
>>>> @@ -1230,6 +1294,12 @@ static int asus_fw_attr_add(void)
>>>>   	}
>>>>   	if (asus_armoury.gpu_mux_dev_id)
>>>>   		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &gpu_mux_mode_attr_group);
>>>> +err_remove_cores_performance_group:
>>>> +	if (asus_armoury.cpu_cores != NULL)
>>>> +		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &cores_performance_attr_group);
>>>> +err_remove_cores_efficiency_group:
>>>> +	if (asus_armoury.cpu_cores != NULL)
>>>> +		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &cores_efficiency_attr_group);
>>>>   err_remove_mini_led_group:
>>>>   	if (asus_armoury.mini_led_dev_id)
>>>>   		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &mini_led_mode_attr_group);
>>>> @@ -1375,7 +1445,6 @@ static int __init asus_fw_init(void)
>>>>   {
>>>>   	char *wmi_uid;
>>>>   	struct cpu_cores *cpu_cores_ctrl;
>>>> -	int err;
>>>>   
>>>>   	wmi_uid = wmi_get_acpi_device_uid(ASUS_WMI_MGMT_GUID);
>>>>   	if (!wmi_uid)
>>>> @@ -1389,16 +1458,14 @@ static int __init asus_fw_init(void)
>>>>   		return -ENODEV;
>>>>   
>>>>   	asus_armoury.cpu_cores_changeable = false;
>>>> +	asus_armoury.cpu_cores = NULL;
>>>>   	if (armoury_has_devstate(ASUS_WMI_DEVID_CORES_MAX)) {
>>>>   		cpu_cores_ctrl = init_cpu_cores_ctrl();
>>>> -		if (IS_ERR(cpu_cores_ctrl)) {
>>>> -			err = PTR_ERR(cpu_cores_ctrl);
>>>> -			pr_err("Could not initialise CPU core control: %d\n", err);
>>>> -			return err;
>>>> +		if (!IS_ERR(cpu_cores_ctrl)) {
>>>> +			pr_debug("CPU cores control available.\n");
>>>> +			asus_armoury.cpu_cores = cpu_cores_ctrl;
>>>> +			asus_armoury.cpu_cores_changeable = true;
>>>>   		}
>>>> -
>>>> -		asus_armoury.cpu_cores = cpu_cores_ctrl;
>>>> -		asus_armoury.cpu_cores_changeable = true;
>>>>   	}
>>>>   
>>>>   	init_rog_tunables();
>>>> @@ -1417,6 +1484,13 @@ static void __exit asus_fw_exit(void)
>>>>   					   armoury_attr_groups[i].attr_group);
>>>>   	}
>>>>   
>>>> +	if (asus_armoury.cpu_cores != NULL) {
>>>> +		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj,
>>>> +				   &cores_performance_attr_group);
>>>> +		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj,
>>>> +				   &cores_efficiency_attr_group);
>>>> +	}
>>>> +
>>>>   	if (asus_armoury.gpu_mux_dev_id)
>>>>   		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &gpu_mux_mode_attr_group);
>>>>   
>>>> diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
>>>> index 2f05a2e0cab3..6b2bfe763d23 100644
>>>> --- a/drivers/platform/x86/asus-armoury.h
>>>> +++ b/drivers/platform/x86/asus-armoury.h
>>>> @@ -198,12 +198,20 @@ ssize_t armoury_attr_uint_show(struct kobject *kobj, struct kobj_attribute *attr
>>>>   		.name = _fsname, .attrs = _attrname##_attrs			\
>>>>   	}
>>>>   
>>>> +#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
>>>> +	#define __ASUS_ATTR_CPU_CORES(_attrname, __attrval) \
>>>> +		__ASUS_ATTR_RW(_attrname, __attrval)
>>>> +#else
>>>> +	#define __ASUS_ATTR_CPU_CORES(_attrname, __attrval) \
>>>> +		__ASUS_ATTR_RO(_attrname, __attrval)
>>>> +#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
>>>> +
>>>>   /* CPU core attributes need a little different in setup */
>>>> -#define ASUS_ATTR_GROUP_CORES_RW(_attrname, _fsname, _dispname)		\
>>>> +#define ASUS_ATTR_GROUP_CORES(_attrname, _fsname, _dispname)		\
>>>>   	__ATTR_SHOW_FMT(scalar_increment, _attrname, "%d\n", 1);	\
>>>>   	__ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);	\
>>>>   	static struct kobj_attribute attr_##_attrname##_current_value =	\
>>>> -		__ASUS_ATTR_RW(_attrname, current_value);		\
>>>> +		__ASUS_ATTR_CPU_CORES(_attrname, current_value);	\
>>>>   	static struct kobj_attribute attr_##_attrname##_default_value = \
>>>>   		__ASUS_ATTR_RO(_attrname, default_value);		\
>>>>   	static struct kobj_attribute attr_##_attrname##_min_value =	\
>> Hi Denis,
> Hi!
>> This cores thing has unfortunately turned into too much of a mess, a fixup
>> after fixup, disagreement of even what should be included and what not.
> I'm sorry for the trouble.
>> I'm really sorry for all the extra trouble these people are putting you
>> through as apparently even 17 versions of the main patch series weren't
>> enough to get them to stretch their fingers over the keyboard :-/.
> I was aware of what I was running into when I accepted
> Luke's request to maintain asus-related things :)
> 
> The interface is being evolving since it's what asus keeps
> integrating and changing on new hardware,
> so unexpected things are to be expected... hah!
>> I've now dropped the cores patch from the review-ilpo-next branch but
>> tried to keep the rest. Please check I didn't make any stupid mistakes
>> while resolving the resulting conflicts with the ppt/nv change, at least
>> the diff against the removal patch looked promising. If there's an issue,
>> please just provide a clean v18 of the main series without the cores patch
>> so I can replace.
> Thanks! Looks good to me too, I have asked asus-linux kernel-man
> to distribute this patchset taken from pdx86 repo: if you don't hear for
> me in 2-3 hours the world isn't burning :D
>> If you want to send a clean version of the cores patch (separately), I can
>> consider it after giving enough time for people to comment.
>>
> Going forward I think the best approach is to make the interface
> compatible with new hardware and useful for who needs it:
> - RO by default and disregarded by the driver in case of funny business
> - RW for hardware that was requested and tested, similar to the TDP
>    so that I can also be confident on what minimum cores count are per-model
>    instead of relying on a macro and hoping for the best
> - Integrating your suggestions
> 
> And that should satisfy everybody and make the interface safe.
> 
> Please everybody, let me know if this is an acceptable solution
> that would make everyone involved happy: from developers
> to final users (especially those who use this feature in Windows).
> 
> Thank you all,
> Denis


It's up to you at the end of the day if you want some machines to be opt 
in to RW, but I don't think this fair to treat this the same as TDP.

We only have one way to change TDP on these machines - the BIOS interface.

For parking of cores there is the BIOS method or Linux native support 
for offlining cores.
