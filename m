Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010017.outbound.protection.outlook.com [52.101.193.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC08F328242
	for <platform-driver-x86@vger.kernel.org>; Fri, 14 Nov 2025 16:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763139424; cv=fail; b=G1B5itaEPMSCebcXSqfBTfRWuQT10bdg54tIniDOgynFuFKvcFJHG9hiYWynM6bxszVtxpQNpcX2MYm1sEPoc3RZCw52JWXzJmChbbxc8BCUwKlagaHDvpizwJN5cx2xj+pt1F1FbaVdBZYNU24lEX1Fo0/975ZZWY2m9e/L6V4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763139424; c=relaxed/simple;
	bh=/B9nAiAAXJebCLbNIXNAyI1FPoroefkgF85QbzVFpJE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ueFCNqt3uPs2FwtigGjl+0HilxaeLr95pA730IaH1FTB1XwG0fDtugjZ973XCw6tqtWKW5lUrQwVsJZnOnnigyOkQypbIKvdTqtdMhroWm9210NyGtvlZI7KuSm6KKyuSDlXruBw00BBejOUzidTeCz9UCZTeAydDtNXwkqKWPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=k3dyx15A; arc=fail smtp.client-ip=52.101.193.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="k3dyx15A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DCZaW1O+6+tzjHwqCgY1qb9n53Z0hWIXHCwYV5o0dK15k2TooXJZhN9U3FCXNYwJ0aS9hFMpk9nHCGf+TGjOGOtxEawI+vcnxoQx5spdAiHzMb8Ntq9sgTc5jK+3Tk/dqesxR/Mj3iUWHoIXE5VT8N7Jgjy4Ee77m1SJafM8M9xgYwJ1BxgJuYueTkzHcQL1c6vuiJ7OyXJeXcmz7fIwnnV3GCNUCxfB6x5my8kRYj0TrrQO5CB2YipjvMZks1b2kuPr65kazwZbqOg3TpQ4Zop+6d78oUrUdSWuMWya2tJTAhi5S5QsIvDhJ8IeFzhUwS3/pqRU86XMReGGMhrr+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mXGzb6HpthVIXOlKp4X15h015cU/Euz+RA+Ql+dAFQg=;
 b=Rj8kl9tWkXZ0mYewyoG9Lkx0QLJUGUQzQnvTOP/Tq5CLrIDZuG9Qij8wJGsLNRCvyA4hbg991+3K/p1j8e1vxEmiPnqWdkM6yy2cVHyqDuWikyWGdjWU2jIeKC+AWDxwr50AT/Mxvpxkk9XmYidJ18ouAhRcXLOnPKnFubMiVV8MXmapyP5mExSiaji+OWme4i9GsoHuwtGz3h91HBj0YcUEeKRFbVGlX1S0rtBoPIhZUbq2GsNmpZvMy/6Ff5c8Qj1jU2r3q5YwnQ+U6wcfEg8oWbAgruQcZcKh+jeDI4EXK6wEo6I70enJ0M55xhn42QtyGUkh5UHcBeYxY4ll5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mXGzb6HpthVIXOlKp4X15h015cU/Euz+RA+Ql+dAFQg=;
 b=k3dyx15ASdDBMR/MYtKGfKZ24R39EECIiIv2H2TLXE/ocOwOlevhpIORWafk8wwgVmPIR9o4WgmulCma4FbvV+JE8786vK0UDJeonF+tDOvCJQ79tQX0bp4xmc395lZVx2utaYjiJlpCo/eskV73v2gNnyX7xqKMaBUdwi6Keu4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CYXPR12MB9320.namprd12.prod.outlook.com (2603:10b6:930:e6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 16:57:00 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 16:57:00 +0000
Message-ID: <e6551b53-cb89-46e6-9c3c-545d14d79642@amd.com>
Date: Fri, 14 Nov 2025 10:56:57 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] accel/amdxdna: Provide real-time NPU power
 estimate via AMD PMF
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
 lizhi.hou@amd.com, VinitKumar Shukla <VinitKumar.Shukla@amd.com>
References: <20251111063737.4156385-1-Shyam-sundar.S-k@amd.com>
 <20251111063737.4156385-6-Shyam-sundar.S-k@amd.com>
 <7034fae1-4096-4cdb-a46f-5e23e7accfa0@amd.com>
 <b8f2d8a0-3131-45cc-8c55-8fbf4ca06cfc@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <b8f2d8a0-3131-45cc-8c55-8fbf4ca06cfc@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR10CA0030.namprd10.prod.outlook.com
 (2603:10b6:806:a7::35) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CYXPR12MB9320:EE_
X-MS-Office365-Filtering-Correlation-Id: 9493ff36-8630-4a1b-a4ec-08de239ed3da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dGM3QWluVmtVSTlFTE9jZGRFRHI5S3g5YnRQZ3RqRUc0b1NuaGtmSnJTUGdo?=
 =?utf-8?B?aGRvYlQreFhIVk5ZYUM2VVlXaExGS21laUlLUzZuVnptV0pvTThCTXVtRjBL?=
 =?utf-8?B?VkthTnBQQXMvL1lwZ2w3WVZjdUt0WVhkWEZkcWdEdk9pd2RvLzgxc0FmR3c3?=
 =?utf-8?B?K3R3Q0F1VnR0Z0t5VFEwTE1iVkZFTmI4YVJPdG9MaU9mK1lKNVIzdmZBTm4w?=
 =?utf-8?B?cm5Db0dVVjQ1UW9odm9yOUhuNXVtcUdhUVM4VzFxOEc0VGtkSk84MlNVck1a?=
 =?utf-8?B?bTdNMEtpZ2FqWExMV1J2STlib1ZTYzFSMXRsS2NHaFcySXJEK3BxTmlkMm9w?=
 =?utf-8?B?UDlRNFNydmJQOTJRRmJMSTQxNGpZSDJTUlRRRlRSblRaanA2RjhqYlVBalhW?=
 =?utf-8?B?VWIybmliYUt2dlUrZ053dWZFaFJkWW5oRE05QXhDcXVUVWl6NVBTN1hJWWhh?=
 =?utf-8?B?Z0JpRXVzU1pJRFBEVmVMSmM0N1lrVUdkN09TOFpaV1Rwd0dFNlc3Smk0QlB3?=
 =?utf-8?B?WVZZZkR3VTFqcUpsSFB1MTlwc2FPQ2JjSWFXWXY3bjFlS1Fsd0RWdFB0TVVm?=
 =?utf-8?B?TjBXSE1rbi9sOGFqTkRXZFB3MXowbENsbjlWQkZ3R1ptM1g3L3NNakFicWgr?=
 =?utf-8?B?aG5TOUpYcUdUNHhkOEJvbUhTOFA1QktOOHZHQzVSeCswS1Y1VzZtamFzOXk4?=
 =?utf-8?B?UkQ5L01kZ2xMeE1PSkNyVmYva05nMVNKVzNobzFQNVJjbHFoSUxZQlJ6cDI3?=
 =?utf-8?B?TWpsY0QwYkhGUWV5Wi9NakhwanNaaFRVWG9RaWNYYXdlMXJ2dUFvRzRlcmJ2?=
 =?utf-8?B?Y21ULzZxZkk1UlBtcXhvcy9BNm43ck1FYXJDRlN6eHBsOGhoN1FBYTBjRjFR?=
 =?utf-8?B?YXB0dFdYaGU5bzJpUm9wUTZKd0o0VXl1MS92TEJ1SGZrZlhHOE1MRnJmUEha?=
 =?utf-8?B?MzRjNmR2Z1V0YkFxTHFlTHBrekk3Vm1XbzFRM3N5T21XYVVxUEg2UExyRkJM?=
 =?utf-8?B?bjBKcjlFN25mWWZGMVVVT1NoR2djOFFrR2M2SkM3UlVJWFVaeHhBTCtCZDY0?=
 =?utf-8?B?QTdRaUdmOWhPT0dNRmQ5cE9KSm9MSkVGSnZLUU1IR1EzY2gwRmQ4NC9sMHdz?=
 =?utf-8?B?dXpmelM0VkZ3dzlKdEhlc2g3Vk55M3JEWkZKZGYxRWpNY1FoRVBYWVNEWk9B?=
 =?utf-8?B?a09tWUdzUHR6enhpN0R0b094NDcxNm96dkhZVEJMSkZZbktwMy9MLzdiaDRk?=
 =?utf-8?B?N25ZMWFvY2todlBCc0c3TnFRZGNJOEQvcmpWYmgyaUVuY1BXaFlMSHlHa3Ew?=
 =?utf-8?B?WUNxaG5EbHJNKytzSys4aUU1V1R6SDV1S1c3ekltRnNjZ0pKV1cycFhrMXNm?=
 =?utf-8?B?ZHk3ZE44bW1GRldWRzErK0lCNVlCb3BoVmc3VHJ5WFYwTzk5OHJ0eXNjMm1h?=
 =?utf-8?B?bmpWdGZIdnJIOHBtY1lwaWhIVTFZM0J0c2srTlZQZnUzZG03V1dVQ0ZKakdF?=
 =?utf-8?B?a1ZlTTdGcG1rUEJOSC94OFVVWnRoanpVR2djRlJ2clhNdDljR2Q2YlUyd2hC?=
 =?utf-8?B?Z0FKT3crcGxkT0EzdmorU2d6T1IyQ3M0b1QydUExS1oxVzFaK0dkS2lYSzJN?=
 =?utf-8?B?dVNnZVg5NE94NlFXL1R1NEdhWHdMVnZKeFNNOWJmNHZRU2dSMjlKUG1wTlM0?=
 =?utf-8?B?Y0laNzJjem80ZkFVTFZWTVNXUzkzSkhqcUE5ckJTZDJYYWRMYi9LeHZ3N2hs?=
 =?utf-8?B?TzFnMnhEb2FTejFyeC92ZDk4aCtZdk9LSVBpdm9HZGFLMEpWcWluNjdGZFBo?=
 =?utf-8?B?aklLVTg0bnlSWUJQTmVOcngxQW5PcDhTZUlxTFAvOHZ1TkFPRjkzeVNVTWVC?=
 =?utf-8?B?TkI2N2s2MnQvN0lISzFSRlpzZ0lzKzJUSTkyRDVSRlNXcU41MElOMWwvWHZO?=
 =?utf-8?Q?UauV/fDv68naq7NG79kOcJFKGXIdKpSP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDFEaW8yOHBiS3hvclFQUXhNWUwwS2xEYVVVdXBlaEVGM2R2WCtqUFZEUFZQ?=
 =?utf-8?B?aDhnNlhOZXFmeFJzVTdsZkU5anZNQ1UzZVRkK3dYQ1AvU0N5RklXVCtyVHZK?=
 =?utf-8?B?YkJnbVJ4ZFVtcVZmSWcyVjJDR2F2RHlydUFNMUhCazk2R3NFOWpmQVhtMzdL?=
 =?utf-8?B?UXVLNlgyemFmVmYrM2poNENHS1d6M2NtQzBxLzFXaVFwNndhbGxTTEtseWdj?=
 =?utf-8?B?QnJaMGxTWDJuTUhqZmRiaWh0Tm5kYWV1QjFVWHNxRVNqL0VUS1dZVzk4VnBo?=
 =?utf-8?B?enh5WFIzVGxuZklDY1AyV3hybVkwS3dHekYrMTFXaGNGZ3VpR0hnVDMzeFBt?=
 =?utf-8?B?blBraTZoN0lCSnRyUm92TmRZRmNzenJoMmhLZHM1cE9SQ3VHUUJJNS8zT0x4?=
 =?utf-8?B?QUFERDRGREpSM1ZBeXRhanVSZEJJZnViRHY0RHNOS2JTd1NpSkQ2RjdEbWoz?=
 =?utf-8?B?Y2YrQnRacThQeFg0cHRzV09TZTczVDhzR2crRWVFZnNtVWFoUk8wTDlKUGZH?=
 =?utf-8?B?V0lEbmNuVGRoV016RVFySjZwZHhBMGt0b2swWWFGQy93Q3lVWTcwM3Z5Ty81?=
 =?utf-8?B?VG91OGI0LytvSW4zR3BETEI5eTBOMEVIaFJMd0VkVll1bEs0cG42VU9KUWR1?=
 =?utf-8?B?TlFYS3ZaYmhQV3JzcUxhbXpTOVdDQlpTWkVrV2IyRENwVDE5cDdlUlAvWWRR?=
 =?utf-8?B?RmdVK0Z3TWNmV3FrTjN3bnJXZzBxTW5kSlVUNEFpUTl5WVhJa2tkVFZGbllk?=
 =?utf-8?B?NXhPbkNwNXdnVkFHTmJ0aW1RWG0vemt2cTZRaUlBL1VUS0ZYRHZWS0F5SmE5?=
 =?utf-8?B?U0E3RmN0eE1IR2VqTHlac3kvTC82MUN5LzNIWnUvOENzam04SHp3cnFVVGZO?=
 =?utf-8?B?Rkl6a2ZhN2lMTDRiWEtZdDBsaEFxZ1FzOWNIenYxRU5rM1ZkaVNHaUp2ZE5k?=
 =?utf-8?B?dTdmNEo2RHNuV1B3U0ZpcG8vRzg4R0F4bzJiOWkzeUo4enFCUXd0amxEQlFD?=
 =?utf-8?B?ZEtMZVFhNTcyU3RXRkErME1CLzJaeWtWS2xjWUtqdlBCTXlXUktra09Handu?=
 =?utf-8?B?SndWMFlRU2xYRHNINENWVVB6b1ZXdXV2OUtvR0JRSDFyVndhNnpBeFEvaVZh?=
 =?utf-8?B?SEhxUjRXV1MzZDd2Tk91b1NYUjFXNlJ5dGp2UEplOEdSdy9keUtYVTMyZDha?=
 =?utf-8?B?ZXd1V1dGUlBIYjlvUVk2a2l2SUhZeXdaMDlqZXFFWUdWOVVPSERUWWU2dTFL?=
 =?utf-8?B?amdVckhQaE1JUmM5Vk5wVDdPYm1jTnNqdkMwVW5oNVRRL0VCcnBJOUZ0T1R4?=
 =?utf-8?B?cXBuTXpBVWNpNVl1RlVYVVN4ZmpWRHhDOWxsQUszL0VMZVdISm1GWmlGR3hB?=
 =?utf-8?B?TElHQ0w2RG8xdC9kWkxGRFVQbWdmWHMrVW0zVjh4ZlNHbUpqdmlkTURSSm5R?=
 =?utf-8?B?enFHdkhiYUcxdWNMckQ3MXVWK0N6a1YvSWxqTDA2b1d5eFdMc1l5SGIxdG1i?=
 =?utf-8?B?bmcrdDV3YkVjWHgvTzlXTmNrYW5vMzF2V3QzajJiQVpVS0pNT0s4c3pjWTdB?=
 =?utf-8?B?ZThJVGZxemltQ0M1L2NDQkZJQmtnV0M5TFNkYTBBdWlFUy9WN2dwY0RzVDJn?=
 =?utf-8?B?REloM0FtdFdtZThpVnpuRFNzM2NLWjB4cDRzaHM3d3hLclRXTnhud1JuR1ZM?=
 =?utf-8?B?RWJCQXBzczluTTBvcFRPMmJaQ1ZQWTgyS0lQbHh5cUpSR1F5YmQ1YTFhRGRu?=
 =?utf-8?B?VUIyb1JmaDJqOFYxa3RrTUI1Njk0R01ySmo5NTRsTm9HM3M2MkdoYWRsWWhq?=
 =?utf-8?B?SllpYU80SDFwdW1NeU4yZ2FBODZwS2t4SThjNUthOUk1ZVNUa0RmREs2Y3Av?=
 =?utf-8?B?UmRpa0J4NGw1SXZaOVNtNjlLN2U1SVJSc25PTnRRR0k3L2Zrb0wya3hZUXhp?=
 =?utf-8?B?SkRsdG43b1BPWEg5MXZYS3VjcXJTK0x2ZDdPRjV3aFp4MGlLdXpJSlNDdTFF?=
 =?utf-8?B?THNXTUpCNlNKckk1Y0tjUTBhR3VzRGFjMnJVaUk2SEN1NnlDUG92dmtKRkpx?=
 =?utf-8?B?RXRMV2wxbWlLelZ5T0pyUVFhbzcyT1dObHNRU1Q0YXlDZnFkeUwwcjc4eTkw?=
 =?utf-8?Q?Gq3S4eu/+QEbkOorOdBu/j801?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9493ff36-8630-4a1b-a4ec-08de239ed3da
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:57:00.1408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zqO/0LU5ch2hseuv06opKQopm72LVGKQSkIRz8kfPLwH24eOeyT/rg/R427m6kvZ62tSpzFB73nK0W5qCFy2kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9320



On 11/13/2025 1:33 AM, Shyam Sundar S K wrote:
> 
> 
> On 11/12/2025 23:33, Mario Limonciello wrote:
>> On 11/11/25 12:37 AM, Shyam Sundar S K wrote:
>>> From: VinitKumar Shukla <VinitKumar.Shukla@amd.com>
>>>
>>> Add aie2_smu_get_power_estimate() to obtain NPU power readings from the
>>> AMD PMF driver. This xdna interface enables user space to reflect
>>> current
>>> workload power consumption in real time.
>>
>> But.. it doesn't.  It just adds a new function that could potentially
>> do this job.  The actual gluing it to userspace in some way to use
>> this function will be another patch.
> 
> For now, yes.. that's right. XDNA team will add more support on it
> that goes via the accel tree. But this patch is meant to have a
> minimal change on the xdna side so that there is a  consumer of the
> pmf symbol that is getting exported to the kernel.
> 
> So, there is more support coming on the way. If you think, its worth
> to rephrase the commit?

Yes; that other support isn't happening this kernel cycle.  So the 
commit message should be accurate to what it's actually doing (laying 
ground work).

> 
> Thanks,
> Shyam
>>
>>>
>>> Signed-off-by: VinitKumar Shukla <VinitKumar.Shukla@amd.com>
>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>> ---
>>>    drivers/accel/amdxdna/aie2_pci.h |  2 ++
>>>    drivers/accel/amdxdna/aie2_smu.c | 12 ++++++++++++
>>>    2 files changed, 14 insertions(+)
>>>
>>> diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/
>>> amdxdna/aie2_pci.h
>>> index 91a8e948f82a..5601de841b5b 100644
>>> --- a/drivers/accel/amdxdna/aie2_pci.h
>>> +++ b/drivers/accel/amdxdna/aie2_pci.h
>>> @@ -8,6 +8,7 @@
>>>      #include <drm/amdxdna_accel.h>
>>>    #include <linux/semaphore.h>
>>> +#include <linux/amd-pmf-io.h>
>>>      #include "amdxdna_mailbox.h"
>>>    @@ -240,6 +241,7 @@ int aie2_smu_init(struct amdxdna_dev_hdl *ndev);
>>>    void aie2_smu_fini(struct amdxdna_dev_hdl *ndev);
>>>    int npu1_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level);
>>>    int npu4_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level);
>>> +int aie2_smu_get_power_estimate(void);
>>>      /* aie2_pm.c */
>>>    int aie2_pm_init(struct amdxdna_dev_hdl *ndev);
>>> diff --git a/drivers/accel/amdxdna/aie2_smu.c b/drivers/accel/
>>> amdxdna/aie2_smu.c
>>> index d303701b0ded..7b5e2c383dd3 100644
>>> --- a/drivers/accel/amdxdna/aie2_smu.c
>>> +++ b/drivers/accel/amdxdna/aie2_smu.c
>>> @@ -54,6 +54,18 @@ static int aie2_smu_exec(struct amdxdna_dev_hdl
>>> *ndev, u32 reg_cmd,
>>>        return 0;
>>>    }
>>>    +int aie2_smu_get_power_estimate(void)
>>> +{
>>> +    struct amd_pmf_npu_metrics npu_metrics;
>>> +    int ret;
>>> +
>>> +    ret = amd_pmf_get_npu_data(&npu_metrics);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    return npu_metrics.npu_power;
>>> +}
>>> +
>>>    int npu1_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
>>>    {
>>>        u32 freq;
>>
> 

