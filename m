Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2070.outbound.protection.outlook.com [40.107.223.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76ECB1CEAB9
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Oct 2024 14:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729695054; cv=fail; b=M339h7kn6gAQFBv8VHKpc3TfaA/iQAY/WX6OmFnkL9D3Hb4QcaUKVupHU0BU25JNOcOzRe2f3CkUxou0klT5ANOU7jX0FMK/St0Q/l70Vec5Bd5azWV2I31bLYcPhxfx7fTcI8L09bDhfkQAbNcLWZcLtZsaj4ehuZz8hAuTD08=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729695054; c=relaxed/simple;
	bh=F8ntI4nT2gEbr6+i/dwijuP1A8ouI1oisAnPgvM+ksQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=d6iUX1G8ruMQNvsKJeGJHQBaRb2tjQJd5gkHWlUkKwV6Co2I/b/cBki5ZuCkLr9qNjPl6yxkGzcyPmabE0qZ4pn0uJ8w4eMoUvEnb2tlhbhL/CYrVOcKvqFGxpsv1Jato2QOPe+ikpO3/Co7YzMCPUVEh8q7knU76mNzYEi3VeM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=G+SQTmmP; arc=fail smtp.client-ip=40.107.223.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="G+SQTmmP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VmIr/2jfo7tQUQLPcb+P/iXcAJhdPMFJeBdKEudPG50LHNj+og94VBDAqZD4pt9sqcdhBHzioXpZBsCcnp1FBx7yc1Oby2L4wuCY6leVPRlVnB4N0PyMhVX8M4p9AA0tu9ENGSz2GpVItz30FYFVo+btEbMVbMe7yPheRexM3mDoAQuQ8vNmRcWu73U0JZnXzSTERTds9JGOePGjFYpnkFB/SKdt6BllThPquLDMEk5ywWvtQn+MLd62TzKOonhvQvROFyH6c+NA4w+uowv5kRyKrBZblwlbrPBImwnDTzEkM78pUEGFxtxwTCOpWzwHfMEWYTGcrzcED55V/nK+Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tpDBGWEARrMd7/D+5dac8Sp7H4e+JJ3fwRu/ThVKc4Y=;
 b=GNE3RVutOoGafuzA0MfU54kMbiVeVfxL0/Fu7zLlR+Tuuq9dulDfrPlKUKar81x8Z7pjYafQsnzVxXNrw1FjdrPARx4G42s2cAGRXIq0360/cX01uwjdS1CiDXREOLoMMN3AI6DtFMmSqSBK5rE7wpzDvVR8ahwdogz4D8uZgEdGIQrEx2+2J/Cp4aX2C92WcdA1fNAKnxgfB5jeEyGjKa6So6AvJdyRv/ktp4ndZFj+fo6cYf4l9+V9m4fd7fXwu6sQj55qjcG+6GqzbOj7vlbts9TYSgwrleJfq1HrIfs8zwKVfuEv4nqP5188KdMtdbby90nLfzMpzRco3U2JwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpDBGWEARrMd7/D+5dac8Sp7H4e+JJ3fwRu/ThVKc4Y=;
 b=G+SQTmmPNnNQP1mauYJVv0ptLgnOJa1oR+u1CJljuziA19AK/Ly6ROTIv0qGvBQYkfwdnL/eYFsAhG9NLti9I9Sdf9Y2KrCyWSN6PROSoFn2KQdvEv7HKpcaIWVpajpfcYoIf3jteqSBmHGfYWLrITJd5khrLRyJvw90LNksHWc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CY5PR12MB6369.namprd12.prod.outlook.com (2603:10b6:930:21::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29; Wed, 23 Oct
 2024 14:50:47 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.8093.018; Wed, 23 Oct 2024
 14:50:47 +0000
Message-ID: <a039c086-b733-4af7-b031-8c19cafdccb1@amd.com>
Date: Wed, 23 Oct 2024 09:50:45 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] platform/x86/amd/pmf: Switch to
 platform_get_resource() and devm_ioremap_resource()
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20241023063245.1404420-1-Shyam-sundar.S-k@amd.com>
 <20241023063245.1404420-5-Shyam-sundar.S-k@amd.com>
 <e4163be3-1b42-4d28-b025-91734e9bff5c@amd.com>
 <b58cf10b-e3de-489f-b5b9-fa0daa407d7b@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <b58cf10b-e3de-489f-b5b9-fa0daa407d7b@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0106.namprd11.prod.outlook.com
 (2603:10b6:806:d1::21) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CY5PR12MB6369:EE_
X-MS-Office365-Filtering-Correlation-Id: d98222ce-1392-4c2b-2a9e-08dcf372141b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YzA0YVZqTEFXVVFVbkpURUpmZzkvZ0FURStUZy9nbHlMV3lGOGxzNnlzaEhU?=
 =?utf-8?B?SHg2S0xSU1RLQXNjVFhwdU5remxkMjVCdVJPTXI4NmNJbzBVVXh5aStTNis0?=
 =?utf-8?B?MTRpQm5taDc0SlpqbWRFMjZZNml0dy9ORGg3aDBSc0FHRk95Y0VuUVVFY29B?=
 =?utf-8?B?M1lvQnV1ZlIrMG1hZkovUHdMVnhTN2RDMlhJRkVoNjVZdHRlRVFoRkU3NmM4?=
 =?utf-8?B?d2VyQU9Kc0VBTkFORDdjbXF1MHRTaEhkYlg5QnBkWGhoblYyb0Nza0RFc2ds?=
 =?utf-8?B?UHlaaEVMK3FyQ21jazFVT3ZLUEQ0Zm9QcXhJRkpvdUJXSFF2SGFETVIwb29F?=
 =?utf-8?B?OEl2bksvYVE1aTdIVmE4VWNMUHhxWm01QzhPMkhDK3ZGY05IUG9XQUFlbFZV?=
 =?utf-8?B?L056bXdKVVB3ZlhSSDUwZGUycjBzNDVYNVA2Y3UyM0luemFSK05PUXZuazlw?=
 =?utf-8?B?UGIrRk1HUUxDbTFlcnJOVzFEMFJaMHFDY1kxcGx1TDE5cGNaSTVTbytxM0t0?=
 =?utf-8?B?enl6TE10M3hDeWZUUE83UTlZc2dYMjlzcUVsb2gzU3dRcEhubEoycW0wQWR6?=
 =?utf-8?B?R2lqbmdhbDB3UFp3M0RpTHMveEZuMWZkRE5YU3ZITWIxQUkzMlJodEN0Q25m?=
 =?utf-8?B?VUk2Z0kyNWNWSGh1WXhHUHhGT0NvblRoditKditWWkpDWTZkVDhIUFdHRmFm?=
 =?utf-8?B?eDVJMzRNRjdrZWpOcTFZeEtOa3p3V2FxdUE4RkkxeVRJa1RaTS93ZG5lQ3VB?=
 =?utf-8?B?eVFDQXk1bkZONnZpTEJCNDZJbEorY1pPL0JVUG9URE54YjZGcDZZaHl3M0V6?=
 =?utf-8?B?MlpSN0lwTmFWUEwzdG1uLzFEbzZvbndxcUN6UTYzK2RBaVVCNEtzbUhVaHhr?=
 =?utf-8?B?NGlKejVmMXNTMTlVd04vejY3RUdrRXVMbUVvOGhCVkdxaU9HZVJNRGpBOUxU?=
 =?utf-8?B?dUloeUZWaUFJOTQrejVldEE0VEZVaDIyMEpubGNtSVdZMGJlM3BuNWQybEhs?=
 =?utf-8?B?eDN6WGd2NnlvL0d6ZlVXSFZnTVJmUEIxTWRqU0NBNU9EYWYzNytEZGZPUGwz?=
 =?utf-8?B?eWRqYnNET0xXN21xWmlpQS90TXBjamhVMkFZdnREeW5yWjRRSVlMUGduYUMr?=
 =?utf-8?B?RVZ6SFRCcjE4dUxZbjZjV000a09Udm9WNXAza1V3SnVONm51NG1BOXVtaCt6?=
 =?utf-8?B?amo5dTcvcXhYRXRhU2hFMEhWSU9HalpaYmdEeExoZFBJZm5BTVJ1dEF5dW54?=
 =?utf-8?B?SkV2QjJkYjFrcmV1alFzN0RkRjNnSTdQajlOZnVjWXlpZUcvdWR6YVRkTUUy?=
 =?utf-8?B?alRZQk5hRy9MYlkwSGx3cXBGTFlYeVBER2h6MDNWbFJjUGFnQk95NkVEaU9T?=
 =?utf-8?B?dDhGaE5zSklDZG50blVlNngzODByZ1lYdjE1bFZ1NHIvZDJHZzNPclc5RXJj?=
 =?utf-8?B?aEJPU25COGpRbmI5aytxbmdoVjlQVWQ0OTB1ajErTGxlM1FTRDAvTXNVNFpI?=
 =?utf-8?B?Mkl5MHlvWnE5amNOTFYxekl5NDE0WmJldXp1cVBiQ1haaEJkRWswNmxDTDdP?=
 =?utf-8?B?Ujh1dDJab0NINWxYdHdlZmNiYkJ2VjhLTHlyckNkS1hTLzBkNnd5SzJUYjJ1?=
 =?utf-8?B?MTRLVCttOGVBMmMvUkRQdDZNNEdpUW40OEgrMXArYUxLblRmUWM1NHgvSVNu?=
 =?utf-8?B?WjFmbWhhaEVjNW1sY002TFVRcmNabnJ0My9SdER1UE9KazlZMzhoUEJKS0FE?=
 =?utf-8?Q?GlyujJvrwdLqitL16o99BeLbTCpDIMZpaKuCdS9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFJjZ3g1bGdOUXZqTGkzcHo3Q1VUZzVnOHJUYU1QMHJEa0Rua3B4Y0pJR0RY?=
 =?utf-8?B?RkFoZURUbUFoYzJ6S1dEbjcvM3RMbVN5YjBqb3Y1QnlYQ2NZc2Q2V0M4K0xJ?=
 =?utf-8?B?dkdFbVI4OGZ4TnRUUlQweTNVc3JYMUVUTmdqSlMzbkVpSmppUURjR2pDQjhJ?=
 =?utf-8?B?T2FlaGlqSEh0WlVaR28zNm00ZHo0RUpJR3dVUnZYN2hYMjJQSGxlL3E2aktI?=
 =?utf-8?B?T0lMMXB4azNRaXIyUldyN0x3QmM3Vzc1MUNyRWtGdUFKZ0RUM01JTUIxWTl5?=
 =?utf-8?B?L0Q5c1Z5aWtWT0lyM1FRRHpxV2NoR0ovZHg0cWxEVW1Vak9aY1RrSUR1Mmg0?=
 =?utf-8?B?eHAzbm5Nank1K1BycG1aZXBmT0t1WG9hQjlvVFArNis4RGkvMXRzTGpzUThC?=
 =?utf-8?B?WVczK1U3Uy9nSFZkTmh3Z0VVaFl6MjRqQlFhWVgvS09xTHIzeVpQOGYxcVdV?=
 =?utf-8?B?SlUvZEdtMnZ3dmZZRjVCZ3cxZWVHMkhYaTA0MUN0UnpKV0daMTE5cHlEdkxh?=
 =?utf-8?B?R2g4VlJzK3JXR2tYaFkraWEyV29sRGN2K1FwOHhpNUU4cjV4UXRvdFdXTUw2?=
 =?utf-8?B?UVZoWCtxdkM1b1A0MVl3WjlTeE9yZE5zMFVEaUcrVUdZUGkrUldSR1BoV0Ev?=
 =?utf-8?B?bGMxTFF4TVVkSXQyaUZDSGZCRkcrRFBhL2FhbnQ0dENtdC82WVovR3RzbEJk?=
 =?utf-8?B?R0tQc0RoNitsQmlyNU5vcndLQnVLeFY2c3lFd1U5TGFUNENEb1ZWQjdtRlly?=
 =?utf-8?B?QWl6VTZvVXlHU2V1L29kWm9iSXJiMXFkb0xXUm9YMjVsWGZ5V2d0azVRRFcy?=
 =?utf-8?B?UzVmaHBLRzZYREVVcTlmL24veG9SbGVuRGc0OERJOXJweWVXcEs0b04rZk5u?=
 =?utf-8?B?M0VoVEFGbWxSUzl5S00rOHBOSkYrblZpd2pLak5uK1M0MkxNTHpQUW9ia0Nu?=
 =?utf-8?B?MTVneWppMkJ2dVNiaWNTemExUjBaR05uczlseGJwODJyS2tKbGplRC9Xd2Nx?=
 =?utf-8?B?OGZ3Sm14M25aR240RHdBZzkzUTBKSVdpSEFoMUhkNjRyaFdxc1Z2RFdnYXpl?=
 =?utf-8?B?ZUY1c2kxZ2VTSVpRTHBUY0dTV2tmdzY3Y2hxY29wdC8wdlREek9SZ3JRU1lQ?=
 =?utf-8?B?Q3FxMWFkazM0Vll3elEzZmM4b0pKQTJLUlUzMnZzTGtuamRIRVhtSXVFSFBD?=
 =?utf-8?B?SzBzV1Radjg1bStPTkJObDEzbnM5VkRQSmtBM3MzMFVEN01hN3FEbkR1TDcx?=
 =?utf-8?B?aTBjQzZXRlVBcXFxSi9RdEswQ1BGY0k0WEthWHJkcUtSd2NJdno0MnpSWjIx?=
 =?utf-8?B?UTJFQjE2d1FEMlB5aVBEUnloUVA5Rlo2TGs4ck1nZVdCUHRnTEJzZy9zaTh3?=
 =?utf-8?B?UnNKcVIzQXpQWkhEVlNkVTJzK3ZTVDFsRzBKT01FTWlUTW1UTEUybWc3djVt?=
 =?utf-8?B?RHlFNElJcW0yRWtBMjJIRDEyU3AzdU1hN3Z5dm9abThSVC8vcjRUZGpIZEk2?=
 =?utf-8?B?cWlNU0wxTUhkbXdraFRqaXZ0bmxqZEFlTGd6R0UrYWVEQUtUMEw2M2RGUXVE?=
 =?utf-8?B?Ti9oamZaR2VqbGdEbkR5cTFLSGRqOUovOEVGcmRkcDI4aitzYkNEU1FtSEl0?=
 =?utf-8?B?ZFdBTkZLalQvYlI3L2ptSUFHenhtQXVNWG1hTk0zYmtka1V6NlRPYmpkK0xE?=
 =?utf-8?B?L1gzU2NjeHlTa01nbWFhZ1pPcFdtcWo3bTJiclRlcWM4UmJZS2hiREdMZFF5?=
 =?utf-8?B?ZjI2TlpQemtmSFpYWmZvcldTL3lxeHUwR3pET2psTGdrOTRQd2tWaGZkbGJL?=
 =?utf-8?B?RVd3VXJOM3U2K25aWDZoK3l2dkY2cGFaeldub0w5bDdDS0YxaS9Pc21OeWMz?=
 =?utf-8?B?QmJFK0ZyNDI3SXNJbGRwVERieUpqakRyeGp5dmo4ZkFaQlE3ZUQ0QnVyMXEy?=
 =?utf-8?B?RmhLK084OTJId0pxNXhON3JiQlJpd1dUZ1BFQjFOMnoxOFozOUlmWkxDbnRs?=
 =?utf-8?B?RnpGSitxMStvRk40VkF6M0xINExFMkdWK2ovUURiMWdaZlBGY1YwNEFWRzRL?=
 =?utf-8?B?ZXF1VGZIUTBBYnUvQUlYblk0cERMNFJTZkUxUzFxZGhBMjFOczZiVVo5U0xB?=
 =?utf-8?Q?/Kny7Xzq1cYTZuiCAcsKXpU4O?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d98222ce-1392-4c2b-2a9e-08dcf372141b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 14:50:47.0279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p8U0fJaWaYkrv21aQE/aA27rBBGdG14tPdCD3o3WFcGRRZjtqZIUSOhPn0/NOv+LzbZrnS1Vu1u2rB3FcO52bA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6369

On 10/23/2024 09:37, Shyam Sundar S K wrote:
> 
> 
> On 10/23/2024 19:35, Mario Limonciello wrote:
>> On 10/23/2024 01:32, Shyam Sundar S K wrote:
>>> Use platform_get_resource() to fetch the memory resource instead of
>>> acpi_walk_resources() and devm_ioremap_resource() for mapping the
>>> resources.
>>>
>>> PS: We cannot use resource_size() here because it adds an extra byte
>>> to round
>>> off the size. In the case of PMF ResourceTemplate(), this rounding is
>>> already handled within the _CRS. Using resource_size() would
>>> increase the
>>> resource size by 1, causing a mismatch with the length field and
>>> leading
>>> to issues. Therefore, simply use end-start of the ACPI resource to
>>> obtain
>>> the actual length.
>>>
>>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>> ---
>>>    drivers/platform/x86/amd/pmf/Kconfig  |  1 +
>>>    drivers/platform/x86/amd/pmf/acpi.c   | 46
>>> +++++++++++----------------
>>>    drivers/platform/x86/amd/pmf/pmf.h    |  6 ++--
>>>    drivers/platform/x86/amd/pmf/tee-if.c |  8 ++---
>>>    4 files changed, 28 insertions(+), 33 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/amd/pmf/Kconfig
>>> b/drivers/platform/x86/amd/pmf/Kconfig
>>> index f4fa8bd8bda8..99d67cdbd91e 100644
>>> --- a/drivers/platform/x86/amd/pmf/Kconfig
>>> +++ b/drivers/platform/x86/amd/pmf/Kconfig
>>> @@ -11,6 +11,7 @@ config AMD_PMF
>>>        select ACPI_PLATFORM_PROFILE
>>>        depends on TEE && AMDTEE
>>>        depends on AMD_SFH_HID
>>> +    depends on HAS_IOMEM
>>>        help
>>>          This driver provides support for the AMD Platform Management
>>> Framework.
>>>          The goal is to enhance end user experience by making AMD PCs
>>> smarter,
>>> diff --git a/drivers/platform/x86/amd/pmf/acpi.c
>>> b/drivers/platform/x86/amd/pmf/acpi.c
>>> index d5b496433d69..62f984fe40c6 100644
>>> --- a/drivers/platform/x86/amd/pmf/acpi.c
>>> +++ b/drivers/platform/x86/amd/pmf/acpi.c
>>> @@ -433,37 +433,29 @@ int apmf_install_handler(struct amd_pmf_dev
>>> *pmf_dev)
>>>        return 0;
>>>    }
>>>    -static acpi_status apmf_walk_resources(struct acpi_resource *res,
>>> void *data)
>>> +int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev)
>>>    {
>>> -    struct amd_pmf_dev *dev = data;
>>> +    struct platform_device *pdev = to_platform_device(pmf_dev->dev);
>>>    -    switch (res->type) {
>>> -    case ACPI_RESOURCE_TYPE_ADDRESS64:
>>> -        dev->policy_addr = res->data.address64.address.minimum;
>>> -        dev->policy_sz = res->data.address64.address.address_length;
>>> -        break;
>>> -    case ACPI_RESOURCE_TYPE_FIXED_MEMORY32:
>>> -        dev->policy_addr = res->data.fixed_memory32.address;
>>> -        dev->policy_sz = res->data.fixed_memory32.address_length;
>>> -        break;
>>> -    }
>>> -
>>> -    if (!dev->policy_addr || dev->policy_sz > POLICY_BUF_MAX_SZ ||
>>> dev->policy_sz == 0) {
>>> -        pr_err("Incorrect Policy params, possibly a SBIOS bug\n");
>>> -        return AE_ERROR;
>>> +    pmf_dev->res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>> +    if (!pmf_dev->res) {
>>> +        dev_err(pmf_dev->dev, "Failed to get I/O memory resource\n");
> 
> here        ^^^^^^^
> 
>>> +        return -EINVAL;
>>>        }
>>>    -    return AE_OK;
>>> -}
>>> -
>>> -int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev)
>>> -{
>>> -    acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
>>> -    acpi_status status;
>>> -
>>> -    status = acpi_walk_resources(ahandle, METHOD_NAME__CRS,
>>> apmf_walk_resources, pmf_dev);
>>> -    if (ACPI_FAILURE(status)) {
>>> -        dev_dbg(pmf_dev->dev, "acpi_walk_resources failed :%d\n",
>>> status);
>>> +    pmf_dev->policy_addr = pmf_dev->res->start;
>>> +    /*
>>> +     * We cannot use resource_size() here because it adds an extra
>>> byte to round off the size.
>>> +     * In the case of PMF ResourceTemplate(), this rounding is
>>> already handled within the _CRS.
>>> +     * Using resource_size() would increase the resource size by 1,
>>> causing a mismatch with the
>>> +     * length field and leading to issues. Therefore, simply use
>>> end-start of the ACPI resource
>>> +     * to obtain the actual length.
>>> +     */
>>> +    pmf_dev->policy_sz = pmf_dev->res->end - pmf_dev->res->start;
>>> +
>>> +    if (!pmf_dev->policy_addr || pmf_dev->policy_sz >
>>> POLICY_BUF_MAX_SZ ||
>>> +        pmf_dev->policy_sz == 0) {
>>> +        dev_err(pmf_dev->dev, "Incorrect policy params, possibly a
>>> SBIOS bug\n");
>>
>> This upgrades the previous message from debug to error.
> 
> It is dev_err() even before this change.
> 
>>
>> TL;DR I feel this error should stay as dev_dbg() if no function checks
>> are present for Smart PC.
>>
>> I don't think it's necessarily an error though.
>> Smart PC checks are a bit different than the other checks.  There
>> isn't a check for a bit being set to indicate the function is supported.
>>
>> So if the BIOS has the declaration for the region but it's not
>> populated it might not have a Smart PC policy and this shouldn't be
>> reported as a BIOS bug.
> 
> This should be included in the CPM package, and the BIOS team is
> responsible for packaging a policy binary.
> 
>  From a driver design standpoint, the absence of the policy binary
> should be treated as an error, as there's no reason for the BIOS to
> advertise the Smart PC bits without providing the policy binary.
> 
> Therefore, this should trigger a `dev_err()` and be considered a BIOS bug.
> 

OK I agree with this specific error, but I took a closer look at the bug 
associated with
03cea821b82cb ("platform/x86/amd: pmf: Decrease error message to debug")

As _CRS is patched out by BIOS I suspect that system will now start showing:

dev_err(pmf_dev->dev, "Failed to get I/O memory resource\n");

So how exactly is a platform designer supposed to not advertise smart PC 
bits?  It seems the only check is the presence of that resource.

> Thanks,
> Shyam
> 
>>
>>>            return -EINVAL;
>>>        }
>>>    diff --git a/drivers/platform/x86/amd/pmf/pmf.h
>>> b/drivers/platform/x86/amd/pmf/pmf.h
>>> index 8ce8816da9c1..a79808fda1d8 100644
>>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>>> @@ -13,6 +13,7 @@
>>>      #include <linux/acpi.h>
>>>    #include <linux/input.h>
>>> +#include <linux/platform_device.h>
>>>    #include <linux/platform_profile.h>
>>>      #define POLICY_BUF_MAX_SZ        0x4b000
>>> @@ -355,19 +356,20 @@ struct amd_pmf_dev {
>>>        /* Smart PC solution builder */
>>>        struct dentry *esbin;
>>>        unsigned char *policy_buf;
>>> -    u32 policy_sz;
>>> +    resource_size_t policy_sz;
>>>        struct tee_context *tee_ctx;
>>>        struct tee_shm *fw_shm_pool;
>>>        u32 session_id;
>>>        void *shbuf;
>>>        struct delayed_work pb_work;
>>>        struct pmf_action_table *prev_data;
>>> -    u64 policy_addr;
>>> +    resource_size_t policy_addr;
>>>        void __iomem *policy_base;
>>>        bool smart_pc_enabled;
>>>        u16 pmf_if_version;
>>>        struct input_dev *pmf_idev;
>>>        size_t mtable_size;
>>> +    struct resource *res;
>>>    };
>>>      struct apmf_sps_prop_granular_v2 {
>>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c
>>> b/drivers/platform/x86/amd/pmf/tee-if.c
>>> index 19c27b6e4666..555b8d6314e0 100644
>>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>>> @@ -257,7 +257,7 @@ static int amd_pmf_invoke_cmd_init(struct
>>> amd_pmf_dev *dev)
>>>            return -ENODEV;
>>>        }
>>>    -    dev_dbg(dev->dev, "Policy Binary size: %u bytes\n",
>>> dev->policy_sz);
>>> +    dev_dbg(dev->dev, "Policy Binary size: %llu bytes\n",
>>> dev->policy_sz);
>>>        memset(dev->shbuf, 0, dev->policy_sz);
>>>        ta_sm = dev->shbuf;
>>>        in = &ta_sm->pmf_input.init_table;
>>> @@ -512,9 +512,9 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>>>        if (ret)
>>>            goto error;
>>>    -    dev->policy_base = devm_ioremap(dev->dev, dev->policy_addr,
>>> dev->policy_sz);
>>> -    if (!dev->policy_base) {
>>> -        ret = -ENOMEM;
>>> +    dev->policy_base = devm_ioremap_resource(dev->dev, dev->res);
>>> +    if (IS_ERR(dev->policy_base)) {
>>> +        ret = PTR_ERR(dev->policy_base);
>>>            goto error;
>>>        }
>>>    
>>

