Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2068.outbound.protection.outlook.com [40.107.220.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B5C1BF80C
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Oct 2024 15:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729697553; cv=fail; b=W17wKiJvsYOYZWEefJPT9owKKS898fIMlsFvrBzbrK7fOJMMuyfcYxCyFsOC74IZkGxIqhORrc5SYRGZpvgUl9mZeLMaBx9LfCrU0mofm0FFyx1zbN6caF61HOz7ZiHxLiTC4DiRFv/eXEwC/EJQhv8SVbx8DfUTaUABPSl4n20=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729697553; c=relaxed/simple;
	bh=GmcCy6hil9o3Ko6TFdWjTy3hGdc7tYaxpVNUf0jGNyA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Mq36i5A8oLgLuC21KxmZD4PVQsIkNzQGZ6Pb9u43LTN33kJ3yVSyhgHgrS66exblQE5sJfLefppQnDTdhZxoaSP2lfBdO9x1+6m9eGg+V2yRIhDQiN0pbP7o4iXpwsSdGARuMGDrBVzTAflvueGa82odv7faVbS2yvpawuP2zww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=O26g/nz+; arc=fail smtp.client-ip=40.107.220.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="O26g/nz+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qwree0usdOXLC8FD8zwiIeuoBaOiOzlsaTU9+F4BSkfyoQ+HKvI47iNto+1zfBl/HWdml2aPfEA9TrxwEbPXzKVrbfilvmduqb8KLgR4+4bPhn1bJ9bQsFYrjpGDusQ6OLO4WLP6H36Uk9dWWpfprdqkjkEYcajKZ8Q7AvXEzMpEjQK8Amebq7saFmp0Ps2GYTRMVBj9a0DkxDPZUIDXMZf2kMwEoQu/AXjjYqkaaKixe8Yvlx7Axcg5M9FbAUlSNAHHfKr3pP+TYbZt2VzcZIbO+ea2VtZyByNmsyx4r2Lw7V5u2R1rfg8UZQz4CvUIrEnMYAH3Mt2Cix09rsC7ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hB6THRtdQvSs1E6GF+biJkyRmn8g8zsg3FoHFKQLb4k=;
 b=ow8WeOZ+xgZl6LwGLn/91xBNDk1jgtWRF4tVSkAfCiMoZ7h7VQLUX7ZMK5IAoIUgC/ELJHihduusUUkCbmsrfnZUI5bD0WQg1LpTKgZbkdSYf/X5qkFytpeizKGQXfLMBFBKMuRA7TSCX2dcgfm8RPwGqxjWjIW2sKtST/pj8CKzPdoB91LWiSQbE/sfXJGxXxziKjm8JfUfxs0yovvlZNJKkuJqF87LIuj3wTS1Tmt0vc3cRnkUYz5CnwKEktccW62NhICYVeDgbfbZhxYbChucQOoxbs3XLWL5x7hhNUEZdTpvVS2nQPnicyyiVtc+4R+yvQqZM50RlsJazWSlBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hB6THRtdQvSs1E6GF+biJkyRmn8g8zsg3FoHFKQLb4k=;
 b=O26g/nz+LhMQoBt5B7MpqYTRae9eXjer53JaEgzDXf46PokdzRcdBEEJQdPkGuDW1UojCaUNDLG8/lJhcBl2dW3GhJBFJX/l/BNJ52VWVghjrB7cYXMvj2rf6CocMxZq/1cNCo6dNrRp5syICK0094UBAcZFomS3AjhMNM4Uzw0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by PH8PR12MB7231.namprd12.prod.outlook.com (2603:10b6:510:225::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18; Wed, 23 Oct
 2024 15:32:25 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%5]) with mapi id 15.20.8093.014; Wed, 23 Oct 2024
 15:32:25 +0000
Message-ID: <41d66544-6b49-4f22-8c1c-38f14ca47fbd@amd.com>
Date: Wed, 23 Oct 2024 21:02:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] platform/x86/amd/pmf: Add PMF driver changes to
 make compatible with PMF-TA
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20241023063245.1404420-1-Shyam-sundar.S-k@amd.com>
 <20241023063245.1404420-6-Shyam-sundar.S-k@amd.com>
 <733dbf68-a1a7-43d8-acc2-7f1b8d222427@amd.com>
 <84fe3b9b-cf98-4f49-ae2b-ec1a8759af4f@amd.com>
 <02bf47e4-f39e-4799-bda4-5a65e7f948f2@amd.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <02bf47e4-f39e-4799-bda4-5a65e7f948f2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PNYP287CA0030.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:23d::35) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|PH8PR12MB7231:EE_
X-MS-Office365-Filtering-Correlation-Id: aa82cc07-07f5-41a1-2fd6-08dcf377e568
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cFk2ZmVnV3oyZGlJc2kwYVdMYzdBeG9UUFYzYkpMaVJnSXNFbjlBUFhtWUhY?=
 =?utf-8?B?dldMNUxjYy92SnFaZHZPM3o5VFhOdmJzaHBuY2FRK3BoaHVWVzBvcWR5NEtG?=
 =?utf-8?B?VU1ONGpSU1pSd1ZYSFI3Ujg1UzRLV29DRlF3QUdYOGJ4azNRczRCWHJEcEN0?=
 =?utf-8?B?Uzl0NENubFdSVWQxd3BncU93Z0s4cGZUeGhObSswYUg2aVAxazRZK2pRMmVF?=
 =?utf-8?B?aG1ueVhya25zMkFvemlMd21DdStsTjZaTXJwVVM0ejNaMW81bDJRSDQ5MjJq?=
 =?utf-8?B?b0NCanNXRDRUUXBpUmZsMnp1Um1iSGloOTc2L1VkQjVCTXBzR2ZsMk1OUFV2?=
 =?utf-8?B?azIvVnI3Y1h6ais1VG15Ylh5M3V3T3NyYVN4WmFNWWVvOU5SQkxTbFp4VnhP?=
 =?utf-8?B?Y2p0a29haTJWU1lycHZEa21Vbk9PUGJCenh1RFU0RGlOallnY2FYajVWWXY3?=
 =?utf-8?B?NXcwZUgyY1RpK0orZVdCUy8zcFFrSlQxcnFrL0ZjVEpVeEtMcG8wclJyOFhN?=
 =?utf-8?B?cmJDOGorRU5FSkdVV04zNGViZ1lMbXlUT3R6MFB2VjREemZ5cE9zMTlQWDY0?=
 =?utf-8?B?cDFyYnJIQ3ZJUjdiM25keERnODZyRUNkdmY0THpQWTJ1VGVRSWszOHJGV2tv?=
 =?utf-8?B?c2wrK2QwY3FVK0lZYzJGOFVjZ2NySllpY3hiTGVYV0d1MDc4OVYvQm9BOFJ3?=
 =?utf-8?B?ODd1RW9DMkNwVDUrTkxrV045c0QwT1RmdXA1S0ExR1NWSU1tRjhyZGFNU3hV?=
 =?utf-8?B?ZXVGMFVtU2E0ZWNRZjFFTUZqZSt2dTViVEtuNlFGQ1RZZitLMklOMmxXMFNs?=
 =?utf-8?B?NnBuTkhjdU4zVGNuUHFXWFBHU3pCQzkxR2dXQ1NHMVpSR2lpbG9nek52SDJx?=
 =?utf-8?B?b0ZMd1RIU3pac1NzekJZYmlZTk53K2kzS2MvOHZOai8veUs4WXVydzZtclg2?=
 =?utf-8?B?ZWdzM2dwVVVlVGp4Y0JHMTE5REg4MXdZYjhhTytmMlIxSzAwQWpMekx3UUpX?=
 =?utf-8?B?enZMNFZ2Z3V2RWhlNzNEVU83akhOL3JqaXNidUNjTHdLUW5SY2laUDBScmpu?=
 =?utf-8?B?eThvTTcvcVgyaDYvLytJN0NWMmdPdmN3czNva21KNkl6aFhQWkI5akFmVVRG?=
 =?utf-8?B?M296TGZiN0paN2pFajNyRkdzcHNZeiswUkdqRVVlNGtsYWR5RnNDODZ3R3ZQ?=
 =?utf-8?B?NVl4S3hxaEYwaU9zbFpYTUZ5VkdPZklTRzh3MXhwcHF0MzBEV2srWWNWS0FH?=
 =?utf-8?B?b3UxdmxuWG1TMTVrSXlWVmg0MTFmZG9JVmwrYk4rWVp4SGt2RVFKUnMyWEpp?=
 =?utf-8?B?b0ZQNzk1NFNidHlTdDFhQkNiSXNUYnZzMm44SmZSbmxmaHFYRHdNUWFJY3Fz?=
 =?utf-8?B?bnpodHUwVEJYZTI0T0lvZmhkTEswb0Q1cHlxcWtBY2czdFU3NUpqQUI4QTB6?=
 =?utf-8?B?MUJzeDNzUVJzRStvZFlLc1RxTWFaWW9RSk1WMWI3UzIra00zWEVtMGVOMDJI?=
 =?utf-8?B?Y0NoS2V5bW0zQmZnTUFxelhEMkZxM0VWbHREQlVQaFI1SHFNUGFXdDArdWhs?=
 =?utf-8?B?dW8rSi9QanQ3bFcxbGN0UjBLM0tNeXNyTXRpUzhJNVlGWElpN3Y0UGlscHgr?=
 =?utf-8?B?eXNPcEV6RkJvL0JuUlZsWG93dmp3eWN6VEVXYXJMTS9zQTRuVk8wejY1Z2xD?=
 =?utf-8?B?Z0RiTGdUdk1YYWFySG1RK1BwUXo3UjFZNVFpWVM3MHBXMnM1dWpKeE9VdzJ6?=
 =?utf-8?Q?n3TEasRCHD92ykxjKDMk7K7bCO0ZAHU8dPCMDSw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sk1IOUpxUXUrOXpZWkQrWDNtWmxIbXhwOStGcG83dDh2eWZhUnQyQmtQcTBW?=
 =?utf-8?B?b3V4Sm1ONW5wM3IvSDVLczZ0Yi9NVzVNblh2UTQzeW9PWTlTVTN2VFU5S3ZK?=
 =?utf-8?B?UW40dW9FUW1obUlybGdTZWFzQnZOQTRtWDhSRmdSWTRJaTNmR1NMYm4vaTY5?=
 =?utf-8?B?UU1xT2ZDSjZiMUJ6SVF5cUIvM2Q0SHlUeVJnZ1N2bEhrdjJ1bmlUdjBMZWxQ?=
 =?utf-8?B?RU9ISk4vMlhSa09LSG5DckJhU0U5aDdZdUJOekowT1pLYk5QUUJBSDBCUFFa?=
 =?utf-8?B?VUR4cEFwdHZrclNMbWZTSHB3QitEV0pRV3hXaThKbjRlSkhQNi9qWVNPQUFS?=
 =?utf-8?B?cXlob09SOXhyTmg3QkdRRTkyNCtlbE9HMFVuSHRxb25Qbk85MVYrYm9TMVBl?=
 =?utf-8?B?S0xuNGQ5LzNuTU04QVlmUWhhSFRXazNVNmxkQks0RUpBOGJ2QkJCSmNWZWY3?=
 =?utf-8?B?VklUaU1CNTBFaUxDOXVFN0M2cVVBTkJZT1pKYm1nVGtoRWpDYkQ0S05Rd2RV?=
 =?utf-8?B?Y0FqK0NqZDNOUmtRY1VoVVI2TU5sbTJJYlR3TFFwVEdVeUQ3aGRZUkYrdVVv?=
 =?utf-8?B?eUpyeldURFM2U1k5cWJkTE1JanJJSXJ4ZTBDYzdHWW9lNURCOUN5QVhSNDlW?=
 =?utf-8?B?SWF3cXB3QjdLRGgxMHZaYnNiV0ZJTEJqcDBxZnl1MFJ0UHlCSzZQc3ExNnBp?=
 =?utf-8?B?TlFlYi9ySFJvMHpFSndyWlk4dHZpVjgzUlJJT1ZmWmJHNDdWTmtwSHltV240?=
 =?utf-8?B?RWJGaTRaWFlsclQxQjBVbHdnOGFDMUc3a2VjdmdNaE53dDZ3NEpzRUd4REZC?=
 =?utf-8?B?eDNoVGJ1TTEzdWRQUitERzU3NnJiUmN2TXl1NEV6dmVyQ1hQSWFKeTlmZFpF?=
 =?utf-8?B?U3ZsOUFvdUZqcHVpcTFIWTBYMUY3QkV3S0FjaWtnUkdIT2tkMUxvbTJSSG9V?=
 =?utf-8?B?amtnczZuT1ViT3FORUpqWGhkMmtTRGNadWFMSVBmeVJrQ0d2amJkanhndC8z?=
 =?utf-8?B?QVdweGU4R044L1RmVjFLYVJqd2lKRERpWjVZMWZuclNPbHBVMjVWQURmRlVr?=
 =?utf-8?B?UEtHcHZvczErVXkvRy9KY2tmQzhqbzFObjM5QnBUa1VObW4yNTdMVk1RSXIw?=
 =?utf-8?B?V2JTNStGR3VsTVFPWWRhL0hsc1lTMnc5aEMvejRQZzVXTm1ncm8rQlY4cUc4?=
 =?utf-8?B?OTI2UjVNWmlaVVRtbFhBZGJJU2xGYVBMTUJKZzVBcEcraEx6RldqSnh0LzRO?=
 =?utf-8?B?eWY1MXdXMUs2Z05UYS9YRk5HVVhkdXhlWGxpQTlNUGVrZVEzTWhzTi9Tb1BT?=
 =?utf-8?B?UUZGWjF3d05BMTRNSFZKT1lMRW00YjRlNTdqVmpmUjVvUHBTZ0Z6cDF6Sy83?=
 =?utf-8?B?djF2dWdUZGFkTGVPeW9OZTk3dHlCaHBENXhpaFRkQWpuNVJFdWtQSHZHN2Vi?=
 =?utf-8?B?eDNnWXJJYkdkMUZqNTZZVDkySE12TWxkT2RhdXM4blgwd3lJK3k0alFQSlQ2?=
 =?utf-8?B?ZnNsSk1zOGp2K0FoVENVdERYRVY1aEZxYVltVjVwbUxjY2ViYzQ4TjFIMFhM?=
 =?utf-8?B?S3hpWVJDS0xodEFNc0pwYmZlSUwxZnlKbWlhNmZPeGo1UnVrSG5qNHp1TG5n?=
 =?utf-8?B?Z01QU012ZnpaRWZwcjEvY1djV0N6WFd4d2dpdXVJYTdQQUp2WW5Zc1A3OEJ3?=
 =?utf-8?B?QTk3KzRDSGt3RG9yVThkVVUwbmRVTWpwOHo5WElrNVB2Q2dPVmwvS1g0RXdB?=
 =?utf-8?B?NzVYTldxRGoweDBac0ZaaDN6WllqeXViQlJlNEdIR3FqWUoxa1BicVhIQ0hn?=
 =?utf-8?B?R3VROFZiL2liZktvRS96cU5Ednp2TVlEVGU4dnFzeEI2R1I0WHhRREJmZVpn?=
 =?utf-8?B?VUZrT2NUQ1FVNWlaOXNMSG5Zc2d3SFV5Z2kvU3d6UUhJS0x1TVQ5WGR4THJC?=
 =?utf-8?B?WVhDSitnajlyTlBDZlU4clpOUUhtb0t3dVJLcWp6eHQzTzZ2SE16NzdPeWRE?=
 =?utf-8?B?cjZSRkxFRkJXMW5rQ2NZcXZuMnVVTk0wekQvZmIxbGE3aXlXcWZidFk0T28x?=
 =?utf-8?B?bWVnd0RiL3Z4NGRveTFwVHdwOTJCK0hMWFRvZit4T3ZLanJhN1Y2RjlxZHlT?=
 =?utf-8?Q?+YytOnNl4wPvZQPHfLRZntynW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa82cc07-07f5-41a1-2fd6-08dcf377e568
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 15:32:25.8108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mkp2mktua4Kyw3pTzX39Hymb9feBy9o7nw8zygq1/U0OYVQWcuBTr043//5i6OmnilLB/w0hEeo3/zSydiKpyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7231



On 10/23/2024 20:04, Mario Limonciello wrote:
> On 10/23/2024 09:29, Shyam Sundar S K wrote:
>>
>>
>> On 10/23/2024 19:41, Mario Limonciello wrote:
>>> On 10/23/2024 01:32, Shyam Sundar S K wrote:
>>>> The PMF driver will allocate shared buffer memory using the
>>>> tee_shm_alloc_kernel_buf(). This allocated memory is located in the
>>>> secure world and is used for communication with the PMF-TA.
>>>>
>>>> The latest PMF-TA version introduces new structures with OEM debug
>>>> information and additional policy input conditions for evaluating the
>>>> policy binary. Consequently, the shared memory size must be
>>>> increased to
>>>> ensure compatibility between the PMF driver and the updated PMF-TA.
>>>>
>>>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>>>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>
>>> How does this present to a user?  From what you describe it seems to
>>> me like this means a new TA will fail on older kernel in some way.
>>
>> Newer TA will not fail on older systems. This change is just about the
>> increase in TA reserved memory that is presented as "shared memory",
>> as TA needs the additional memory for its own debug data structures.
> 
> Thx for comments. But so if you use new TA with older kernel driver,
> what will happen?  Can TA do a buffer overrun because the presented
> shared memory was too small?
> 

New TA will fail on older kernel and hence this change will be
required for new TA to work.

>>
>>  From user standpoint, always be on latest FW, irrespective of the
>> platform. At this point in time, I don't see a need for FW versioning
>> name (in the future, if there is a need for having a limited support
>> to older platforms, we can carve out a logic to do versioning stuff).
> 
> I wish we could enforce this, but In the Linux world there is an
> expectation that these two trains don't need to arrive at station at
> the same time.
> 
>>
>>> Some ideas:
>>>
>>> 1) Should there be header version check on the TA and dynamically
>>> allocate the structure size based on the version of the F/W?
>>>
>>
>> This can be done, when the TA versioning upgrade happens, like from
>> 1.3 to 1.4, apart from that there is no header stuff association.
>>
>>> 2) Or is there a command to the TA that can query the expected output
>>> size?
>>>
>>
>> No, this is just the initial shared memory that the driver allocates
>> to pass the inputs and the commands to TA.
>>
>>> 3) Or should the new TA filename be versioned, and the driver has a
>>> fallback policy?
>>>
>>> Whatever the outcome is; I think it's best that if possible this
>>> change goes back to stable to try to minimize regressions to users as
>>> distros update linux-firmware.  For example Fedora updates this
>>> monthly, but also tracks stable kernels.
>>>
>>
>> Advisory to distros should be to pick the latest PMF TA (note that, I
>> have not still submitted to new TA FW).
> 
> Yeah we can advise distros to pick it up when upstreamed as long as
> there isn't tight dependency on this patch being present.
> 

That is the reason I am waiting for this change to land. Once that is
done, I will submit the new TA, you can send out a advisory to upgrade
the kernel or this change has to be back-ported to stable/oem kernels
for their enablement.

Makes sense?

Thanks,
Shyam

>>
>> Thanks,
>> Shyam
>>
>>>> ---
>>>>    drivers/platform/x86/amd/pmf/pmf.h | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h
>>>> b/drivers/platform/x86/amd/pmf/pmf.h
>>>> index a79808fda1d8..18f12aad46a9 100644
>>>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>>>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>>>> @@ -106,7 +106,7 @@ struct cookie_header {
>>>>    #define PMF_TA_IF_VERSION_MAJOR                1
>>>>    #define TA_PMF_ACTION_MAX                    32
>>>>    #define TA_PMF_UNDO_MAX                        8
>>>> -#define TA_OUTPUT_RESERVED_MEM                906
>>>> +#define TA_OUTPUT_RESERVED_MEM                922
>>>>    #define MAX_OPERATION_PARAMS                    4
>>>>      #define PMF_IF_V1        1
>>>
> 
