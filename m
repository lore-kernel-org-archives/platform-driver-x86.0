Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012062.outbound.protection.outlook.com [52.101.43.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CD42EA75C
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Sep 2025 16:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758557259; cv=fail; b=X3oXgOPyvh8ff2wBh5zxY3f/i1zNpiCpWzohe5iuwzei5RlUucVBrBp+X3f1rznXlBsYwuB/0H5aM+fPr4sEib6ZTFgtLgNpjIpLXUhqZc3MUtH9MqbuznRFXIFwgtSc1IR07KwNYKWfdPZEUaRBB1Ur3K2z0sAvgUaWnfDWXZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758557259; c=relaxed/simple;
	bh=l5H0kGpSEzdSMCu9dhStT9KBElrUDdTv4UKQtm0CD9w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tJeB1qtbIkONHhbnZvAmjH+cDSojPekpoa0UmAmDfpWfJHCgt5SyUp+FIqbU+VHP5lgS+Kvg7dagCubeLr3t5z1c+/+5IsrEd9k32WUJeOJO84y6FzpUOxkAEhC8vWhE1OI2+1SeBhjLQY/m3X+2q9bZtFO/oG5gzw7KFCktoZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=p3w7jT4Q; arc=fail smtp.client-ip=52.101.43.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="p3w7jT4Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MsEwUn1VR8lX9gDcIJgL+NUX+xQlIwE0UVy+BZS+muftQeSrwUJQVr2N1mAsEIzpDEMb8JfP6J6xBtZZIklNZ6k5cKF7+dA/RZyObYhX1tJqBRhJRpI5jhmPJkaDh4CPizWDPkmH1FBeOQBRhts8tXB0E4lk2dwDpZQXujIQWtmOnZqdvTTBQn/49xD4bKxVlnQTczuTkstaj/c1rR3OLF318wI7iSzliWFZE4CaK+vknLsWAqMEFLT6dvMH7Bw8Fj+Lh0Rw1IbEz948aCQ9Vz9YfGsLo8BT1MwDP4eRDPCMbe8KD3Or3Zu8Ze8qxMsnleyYj0Xf/yoGxiO7nNeYHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pr9MwYONzzcbHHwa8EI7tE6fxLOZhAYgEmjYXMfQQ04=;
 b=xCp46A7iHe7Ax76hP7R2qbDj0FX2EQbJU6LwfEhrIJNoBKKsOeFwKz00h4GKBReIZDxt6Druhjubg6m1UoVmXx4JlDYvnmWTA0L9iS7hUDA/K06K8bWQ57/Go/3ysYWmpAv9cYPtWTe7faIvZ76MhcrYE6l5BZguji5y+9V+HX76+onDAqPbCNRXZwGAiQx6fwTl3EL3bTkR7pICdW5GdpT4UQlQHb57hAbtTbcKku7wGPifRpOXLt8/vI9nBaTN77hOjltS39hOsivnqOjqYrVl9q5x3dPxgc59HIQrrOOKRqdWwZc4+pugGakP9KBCaRgTPfIUjaXYXWgVwm8AXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pr9MwYONzzcbHHwa8EI7tE6fxLOZhAYgEmjYXMfQQ04=;
 b=p3w7jT4QAknuoz6aA4HSxgm5GXjgdKq4YX5lFLq/W2gzeegQwq5BoBM5VqFXm8QoTgVA8o04F5jjbwuDtfTsPLYCbYvudNa+938LfxnWGJvLqEnmcR20r8TpqUUwDF4vrr2eHrhAa+bgRiPIf+S8zF4nndmbRw6+zvpQiG0ZU/Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by DS0PR12MB6583.namprd12.prod.outlook.com (2603:10b6:8:d1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Mon, 22 Sep
 2025 16:07:35 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%6]) with mapi id 15.20.9137.012; Mon, 22 Sep 2025
 16:07:35 +0000
Message-ID: <3adcc07c-d87c-4f69-a045-d923269fc029@amd.com>
Date: Mon, 22 Sep 2025 21:37:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86/amd/pmf: Introduce new interface to
 export NPU metrics
To: Mario Limonciello <mario.limonciello@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, Lizhi Hou <lizhi.hou@amd.com>
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20250919055425.3055817-1-Shyam-sundar.S-k@amd.com>
 <20250919055425.3055817-2-Shyam-sundar.S-k@amd.com>
 <be724b4b-516c-4f1c-9994-d0aba505284d@amd.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <be724b4b-516c-4f1c-9994-d0aba505284d@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1PR01CA0159.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::29) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|DS0PR12MB6583:EE_
X-MS-Office365-Filtering-Correlation-Id: 837c2ca4-4fc7-45dc-c758-08ddf9f22469
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aDc0TS82OWhtN3I1Rmx1UFo1UW1RMTlGWUFIYzFoRTJ3RGg0V25ndlNrMElJ?=
 =?utf-8?B?Z2tac0NhaFM2SW93UGdEVnF1TXhCVmNRMjJlOGVha2o1ZWxFZWplQjZrY21v?=
 =?utf-8?B?VUdWZUhINlpQeUJxQzdVRFNBclJKL2JnUnc3MG5MQ3A5SisxZ2p5MzJOamNw?=
 =?utf-8?B?Z1k1NWNXbjlWMHZrU0tIbjVKRkxwVUNqbU0vTlEyQjU1QWc3TnBaVE1mZlIv?=
 =?utf-8?B?U2M5MGQycmVHazRvV2gwNHdIT05TOTdKdXdrV0RrQzFVKzFVRWQ2UjdZTTdt?=
 =?utf-8?B?d0NPcGdNaWJnVXZPQXI3L21OYkdaTmVUY3Yzd1JSd1hjeUJiTlZkWnFaRUFM?=
 =?utf-8?B?aDNwOEpJK2kxTkk5UzB5K2Z3RkUzOVhKNUNtUm90dGtjakRzQ0N1YWhMWUNH?=
 =?utf-8?B?S1V2U3NLTElNSFZ0YUpxK1NMQmpmNzJxaVBZdjJTK2JHN3lPZ1diN3pWLy9P?=
 =?utf-8?B?eEZaZHNqMitWUThyMkhzZGdPOVZxQUlpVVhPR04yM0JGVFJkZFVJcU9VQVVL?=
 =?utf-8?B?ekVmMEo2enJna25yT0htOFAwNXczY0FvRVJrWGlsWTVmV0FDMlZUUU9YOXZL?=
 =?utf-8?B?aVQwVFdoLzNEN1JZYU5rUVNMYTgwVHB5R01hZnlvY0lqbm5UL29HTjN6U09i?=
 =?utf-8?B?SFpLWVlRMExacXJ1R0Z5ZXVrQ2tob3VyTnQ2ZjJJU3l4elFWN1V3YWFPcmRE?=
 =?utf-8?B?a01iY1FLRDduTktQVXFiamo2NE40a0tHQVdMT3UrQTI0M1B6T1lYMmdmWVNY?=
 =?utf-8?B?RkxaMXFqRWhNaDRXY2Nub3R6YUJYc2g3aE9TZllKS1pkbUI0bHFreXVjMXR4?=
 =?utf-8?B?L3RDeldLWGN3K3ppYXcxMHplek01UG5FeHJld0FJTWpWMWFyRHBVajgrWXJL?=
 =?utf-8?B?UmlQamVNNVdKaFJYWmpMelh3QWVrS2F6b1dMRDNGQndrdnZVYlYyVFZVWkpm?=
 =?utf-8?B?UHdXMndRMlU2TDhiSXpOV2ZSaHdjbW94TS9YMzI4MnZ0M0ZkU1RPaVFSYnpj?=
 =?utf-8?B?U3VkSUlvMStvS04xOVh3eFRqNFFxQzJMdnFzMkxnaVg3L0xPbk9mTXVCRjd5?=
 =?utf-8?B?VU03YXVVZGJJMEdnQ1dtVHc4dmxNRjhUM0xRY2hGRy9KVDZyVVMvZXRrN2o4?=
 =?utf-8?B?UHdxTUVOWDRnOTJITURXTzFDTzFLWWcyanc5OHd2aGFoZXg4UTA0VlJIK2ZX?=
 =?utf-8?B?TEpZT1RLMm5Bdm9iNGNrSXI5c1UrdFNiL2oxNmRuZTh6aCtWK0dGRWR4OSs3?=
 =?utf-8?B?U1d2cms0K3YyVXdtVmZkNGRlVEd5VmUwSSs0T0Q0azJEWTJZbUtQbHVIN0d0?=
 =?utf-8?B?TUwxa3F1QWx5Zk9FR3Z1QTJueUgyY3E5clRBaVlCSFNhd1ljRXMvdmgxVlN2?=
 =?utf-8?B?dERIQTR6NWNoSmNraHZGaGZENkxOdHNSek9Rdmc0RENWNkJZTVJXSyt0SW14?=
 =?utf-8?B?c0NRRGsvUm9RU1NqZDdwV2p6UnpjQkVoVnVyZjNwVHlPTEdhWlRvWFNuWjYx?=
 =?utf-8?B?QjVSZlVOaFNhRFFnMWlaZEtyS2ZkMHEzcEN5YkI2R0J5cy82RUtObjZVNWIw?=
 =?utf-8?B?UmFaUjdPK0dGMVRROFNqZ1BZTEk1NkNPZi83ZE1qR0taeWdiNGh1emd1NGF4?=
 =?utf-8?B?VFlqbUNHNlJQbEdKR0ZlYVdkaHZXQWdXRnNQdTUrQmprMnZBZGIwaUJjeEZR?=
 =?utf-8?B?OXJQSHI5QkpxNEc2Ymp6QTQrbnA5bUZnSitFY3RGUng2Q0xSNzRTcjBFRzBv?=
 =?utf-8?B?OGdsZkhGWW9SeHFlbGJXdWU4cGZsMm1naUcwYXVOU2FCVVBSR3B3amJZVzNa?=
 =?utf-8?B?N3YvUzJEU2QwRTdxTnJaK3VObFBkVTRsTzBYMlZaZnZ6L3BJMHBKTVpFT3Bs?=
 =?utf-8?B?dmJ1bTdMM1c2Q1ZoeS9nY1JsUkpoREswN1pwVlhKSWdVUWVNYlYzM3BqMW9Q?=
 =?utf-8?Q?TPbQy8Cmkjc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3h5UnU5c01hT0JTdm9ydW11c2I0ZWltRWdJTGIvdmlzbDhsZ3RrUi9DOHI4?=
 =?utf-8?B?VENVeGg5enQzcThaRHcxeWxyT2YzbFppQ2gvU044NFNjdUovQzJVUElWTmk2?=
 =?utf-8?B?V09hTFp4bnlRaDlpMWZjdnQrK1YvV1V4ZjZFcUdqTlArRmRubXBIN3pjSjBV?=
 =?utf-8?B?WVdvcEkxQXljRHNwYkxUZU1HSUdFR2FTWU9QUVN4Y2YvamJTOVE0eXZsV0V0?=
 =?utf-8?B?enZiS0pjdVRrZlFPOUlkUTJLR0hFSnJnR1RmMi85RCtrSlZ4Y25ISEdFYUFX?=
 =?utf-8?B?SEJhby80MzZXaGx4SzRQV3hxbmR3MStuZzF1bVFyQWErcFIvUlpZQVdzMnBG?=
 =?utf-8?B?dXFNUDNNNUxGRU1XRndvNGZlQUdBb0ZJOG1pUTloWUJiWk95ZVVNYlUyWld2?=
 =?utf-8?B?dWJMTzBGVGxrMG1HNUdpVHRraGRUSFBzNm5LeU0vYm0rSHJqUmVyb0VWYzJw?=
 =?utf-8?B?K1BmQmFlaGJnbTEyYmFVT3pPeEJ2NzRNdUp4R2lNNjl0S0Q2Y2JYYkJlamdq?=
 =?utf-8?B?SytLbk1xelNIQUZkQ2l4V2xoOFJ2VFJnTDBFVDQxc3pzRzdmQzE5bU1VazBU?=
 =?utf-8?B?bjZHY1o4V1R5WG4zdnBLdSt1ZS9TSEMrelZtU0RMN2piWjcrTVB4OFRNZVZ3?=
 =?utf-8?B?UTVjVEJ3a2pLR3Rqb05zbnMvTVNLVDNicEdPR2NnOVZ4TzRPS25iZWN4L0Vj?=
 =?utf-8?B?Y0JNWE54MENzdGk1cHBOYkM5U3o0YzJxVUd1VWtzZGZqVXNkcytCekdpT0NH?=
 =?utf-8?B?MjhlYXdxcTczTExLelBPQlBCS3pYK21YNVkxRS9tSDU2YlhmaHhSRjJveXNw?=
 =?utf-8?B?RVZGSjc5NzdoOWNLREFyc3Y5aUxEZ3VqWFM2ZzJHTG9Xcm1qQnUrSlJuS0hL?=
 =?utf-8?B?bmVKTVNLMGpvbllNY1ZTRXZCQnZyQ2FFQk0zcHZGVWl0UHdLUnBtWkZxeG9H?=
 =?utf-8?B?bm5IOGhpR2ZWY3VXckQreWJoeVR3MDJiL1ByT1U2MUdlTUNQK1JYUFQ3bE5i?=
 =?utf-8?B?RktkTS9vZTIxY3lFNW9tNVpuQlFHSW10VkpxRjdGRzUrTFZUNWZhYzQ1eGVx?=
 =?utf-8?B?MXVpZk5oL2YwTXpMOFRyWlFMa1FKNmxSQ08zYjBvOWltMVhKV1B5MDVSejIw?=
 =?utf-8?B?RWZzWDlFckt4eURjRWdqU0orNG44b0hCcmF0YmJDamxrWkZnY00wcXFLamhx?=
 =?utf-8?B?MlR2YmFKQVpjMEFRY0VhZDg0ejVBU3NoVldwV0tqbFQ2S1pTckFlNSt1YUli?=
 =?utf-8?B?cityYkZFOGxJelBxenN0TWY4c1UyN2VUVnZvMHI5RWxpakpHRnV4Nmh0OWVG?=
 =?utf-8?B?YXN2RGhrQnpsWEpFWTJpYjlyUWNWSmhzWkdDZlBsczY3RGFmaCtoV3R2VzVs?=
 =?utf-8?B?aGJvVWFOOUNVaTVYRXNLdGhHdnFIY1Rqd3Z0SWdtcXBXNVhhU05tMjlXNEhK?=
 =?utf-8?B?ZGhSaTNmWXFkRVJVZUt4L1VzSTJWZXI2alZaZDZGcFBFYVhHVS9QTFRKRDBG?=
 =?utf-8?B?b0FjbDI3SG1nUGJiVjdqUXU0Sks5MkJMNmFlT2tDNUx2MG1hODlzYWJwMWtV?=
 =?utf-8?B?dE5CeENhZDF5YS9RdkZCenZvcHJHa2MwZDgzRWFOTHhRR3d2K1h0NUFVMjZD?=
 =?utf-8?B?aWZoYUNOVnRHRk5sYmRGcjdNQmtRTVExZ2RyMmJEUW1IVkZpQnI3Q01PQVVV?=
 =?utf-8?B?b0RYbDRucVZxcitXdHo0UjFTQzk0WkpQbDdpZW00U3lPUGNFZGJNbkNKdUdu?=
 =?utf-8?B?Mm15WE5Hb1h2UjBjTm50ZXF6TTBkWUs3WG5zZ0JrWXZCMzBOanNoY1g2eUpX?=
 =?utf-8?B?aUdTbEZNZzhrTEdncTJlbkZlanZXRlZ2NjN5UkhKMElZRWxmYWkzYUUvT2Vq?=
 =?utf-8?B?Z1FVMHRYMUxaMUJsMy9IbWpTbEQ4OElGZFk5K0JnSWVpWklhbjUrQS9Eb1M3?=
 =?utf-8?B?Yy9oaUxvdFRLa2JJM3M0TEp0TGlIQlJKS0RuYkRwNkxtRGdLUmpmdU5Eelgz?=
 =?utf-8?B?K3hXUzlYaUc2WnNwUjU1eGlzTExUT2htSzFqc0hLOHRvcFVGa05YWFFETmc4?=
 =?utf-8?B?SUw4MEh0YkpXSkw3cnl5ZlF2eGdJViticWVkdjhEQzl5VlhyR0g3OGZNZEJr?=
 =?utf-8?Q?CNsrWrad/77cja/T9oa41UhFN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 837c2ca4-4fc7-45dc-c758-08ddf9f22469
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 16:07:35.1011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YGnL/vDyeFfTXZIcJ6lbu4GuDYBhQYULUGqtEt7XdUG0WFSK5vJIWBO8cKkAJjXgyQ8aBUKcziHSktUQ7cY0nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6583



On 9/19/2025 19:51, Mario Limonciello wrote:
> On 9/19/2025 12:54 AM, Shyam Sundar S K wrote:
>> The PMF driver retrieves NPU metrics data from the PMFW. This commit
>> introduces a new interface to make NPU metrics accessible to other
>> drivers like AMDXDNA driver, which can access and utilize this
>> information as needed.
>>
>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> 
> +Lizhi for comments.
> 
> As this interface will be something amdxdna uses I think we should
> make sure there is a R-b from Lizhi.

Sure.

> 
> I have a few comments below as well.
> 
>> ---
>> Hi Ilpo, this can be applied on origin/review-ilpo-next with git tip
>> commit
>> "8236b4667aca"
>>
>>   drivers/platform/x86/amd/pmf/core.c | 60 +++++++++++++++++++++++++
>> ++++
>>   drivers/platform/x86/amd/pmf/pmf.h  |  1 +
>>   include/linux/amd-pmf-io.h          | 21 ++++++++++
>>   3 files changed, 82 insertions(+)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/
>> x86/amd/pmf/core.c
>> index ef988605c4da..75529047377c 100644
>> --- a/drivers/platform/x86/amd/pmf/core.c
>> +++ b/drivers/platform/x86/amd/pmf/core.c
>> @@ -8,6 +8,7 @@
>>    * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>    */
>>   +#include <linux/amd-pmf-io.h>
>>   #include <linux/debugfs.h>
>>   #include <linux/iopoll.h>
>>   #include <linux/module.h>
>> @@ -53,6 +54,8 @@ static bool force_load;
>>   module_param(force_load, bool, 0444);
>>   MODULE_PARM_DESC(force_load, "Force load this driver on supported
>> older platforms (experimental)");
>>   +static struct device *pmf;
>> +
>>   static int amd_pmf_pwr_src_notify_call(struct notifier_block *nb,
>> unsigned long event, void *data)
>>   {
>>       struct amd_pmf_dev *pmf = container_of(nb, struct amd_pmf_dev,
>> pwr_src_notifier);
>> @@ -314,6 +317,61 @@ int amd_pmf_init_metrics_table(struct
>> amd_pmf_dev *dev)
>>       return 0;
>>   }
>>   +static int is_npu_metrics_supported(struct amd_pmf_dev *pdev)
>> +{
>> +    switch (pdev->cpu_id) {
>> +    case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>> +    case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> 
> I'm a bit surprised AMD_CPU_ID_PS isn't in this list.  Does it not
> have the same interface?

Intial thoughts is to have support starting from 1Ah. Based on futher
tests we can extend this to older platforms as well, albeit I am not
sure if PMFW provides this information for older ones. So it would be
on the wishlist.


> 
>> +        return 0;
>> +    default:
>> +        return -EOPNOTSUPP;
>> +    }
>> +}
>> +
>> +static int amd_pmf_get_smu_metrics(struct amd_pmf_dev *dev, struct
>> amd_pmf_npu_metrics *data)
>> +{
>> +    int ret, i;
>> +
>> +    if (is_npu_metrics_supported(dev))
>> +        return -EINVAL;
>> +
>> +    ret = amd_pmf_set_dram_addr(dev, true);
>> +    if (ret)
>> +        return ret;
>> +
>> +    memset(dev->buf, 0, dev->mtable_size);
>> +
>> +    /* Send SMU command to get NPU metrics */
>> +    ret = amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, 0, 7, NULL);
>> +    if (ret) {
>> +        dev_err(dev->dev, "SMU command failed to get NPU metrics:
>> %d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    memcpy(&dev->m_table_v2, dev->buf, dev->mtable_size);
>> +
>> +    data->npuclk_freq = dev->m_table_v2.npuclk_freq;
>> +    for (i = 0; i < ARRAY_SIZE(data->npu_busy); i++)
>> +        data->npu_busy[i] = dev->m_table_v2.npu_busy[i];
>> +    data->npu_power = dev->m_table_v2.npu_power;
>> +    data->mpnpuclk_freq = dev->m_table_v2.mpnpuclk_freq;
>> +    data->npu_reads = dev->m_table_v2.npu_reads;
>> +    data->npu_writes = dev->m_table_v2.npu_writes;
>> +
>> +    return 0;
>> +}
>> +
>> +int amd_pmf_get_npu_data(struct amd_pmf_npu_metrics *info)
>> +{
>> +    struct amd_pmf_dev *pdev = dev_get_drvdata(pmf);
>> +
>> +    if (!pdev || !info)
>> +        return -EINVAL;
>> +
>> +    return amd_pmf_get_smu_metrics(pdev, info);
>> +}
>> +EXPORT_SYMBOL_GPL(amd_pmf_get_npu_data);
>> +
>>   static int amd_pmf_suspend_handler(struct device *dev)
>>   {
>>       struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
>> @@ -431,6 +489,8 @@ static int amd_pmf_probe(struct platform_device
>> *pdev)
>>         dev->dev = &pdev->dev;
>>   +    pmf = dev->dev;
>> +
>>       rdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
>>       if (!rdev || !pci_match_id(pmf_pci_ids, rdev)) {
>>           pci_dev_put(rdev);
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/
>> x86/amd/pmf/pmf.h
>> index 6ea5380f3b23..622404e71136 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -12,6 +12,7 @@
>>   #define PMF_H
>>     #include <linux/acpi.h>
>> +#include <linux/amd-pmf-io.h>
>>   #include <linux/input.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/platform_profile.h>
>> diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
>> index 6fa510f419c0..55198d2875cc 100644
>> --- a/include/linux/amd-pmf-io.h
>> +++ b/include/linux/amd-pmf-io.h
>> @@ -61,5 +61,26 @@ enum laptop_placement {
>>       LP_UNDEFINED,
>>   };
>>   +/**
>> + * struct amd_pmf_npu_metrics: Get NPU metrics data from PMF driver
>> + * @npuclk_freq: NPU clock frequency [MHz]
>> + * @npu_busy: NPU busy % [0-100]
>> + * @npu_power: NPU power [mW]
>> + * @mpnpuclk_freq: MPNPU [MHz]
>> + * @npu_reads: NPU read bandwidth [MB/sec]
>> + * @npu_writes: NPU write bandwidth [MB/sec]
>> + */
>> +struct amd_pmf_npu_metrics {
>> +    u16 npuclk_freq;
>> +    u16 npu_busy[8];
> 
> This 8 comes from there being 8 columns, right?  What happens when we
> have a product with more?  It seems like this doesn't scale well
> outside of that design.
> 
> I know it is a simple memcpy() right now and the structure resembles
> the firmware structure, but would it make sense for inter-kernel
> commnication to define a different structure that would remain stable
> no matter how many columns?
> 
> Something like this:
> 
> struct amd_pmf_npu_metrics {
>     u16 npuclk_freq;
>     u16 npu_power;
>     u16 mpnpuclk_freq;
>     u16 npu_reads;
>     u16 npu_writes;
>     u8 npu_columns;
>     u16 *npu_busy;
> };
> 
> The size of npu_busy could be allocated dynamically, but this would
> also mean putting the responsibility of freeing it on the caller.
> 
> The alternative is of course a amd_pmf_npu_metrics_v2 if/when that
> happens.
> 

I can give it a shot. But I presume structure changes would not be
more frequent. So, I would still lean to having a _v2/_v3 whenever
that happens in the future.

Thanks,
Shyam


> I just thought it was worth considering right now.
>> +    u16 npu_power;
>> +    u16 mpnpuclk_freq;
>> +    u16 npu_reads;
>> +    u16 npu_writes;
>> +};
>> +
>>   int amd_get_sfh_info(struct amd_sfh_info *sfh_info, enum
>> sfh_message_type op);
>> +
>> +/* AMD PMF and NPU interface */
>> +int amd_pmf_get_npu_data(struct amd_pmf_npu_metrics *info);
>>   #endif
> 

