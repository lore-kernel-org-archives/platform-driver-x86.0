Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C4D3C466
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 Nov 2024 05:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730783711; cv=fail; b=JRTStxWJsK0qOj4WDz6JewQk3NpImi7kS7OlGxudokUSHE3KFQwgDKZ8QWEAW/t8yxQs+/98fjXmgvnz7IeqDfgMwovL4YvZQFvGGLtOUVwIGpUTA+Ff0ky/Y7SGCahTuXj5OIpW1e/mhW7gNH0e3bM7k0lRMnN2t/tdvngxBRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730783711; c=relaxed/simple;
	bh=1KpMa5Ezo0t+IhF1e/oHNRKWHZqjofzxTRe2mHwo2Nk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=D47UwTqOlSeXxu8/h1+NWfGXNXZw20OBtxwWLqpVagkHjkWClW1tuMCf0x788Qyg8sMc9jgADevlAhdBxzEAUtcYKL4hhGrHgECEKQg3+b9GKXnv8yJg8jaGPX/SC6MPSGYr2ji3wqIqff2HYkLik0nauh2/SC5u2K4cke+NL2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=brCNpNHw; arc=fail smtp.client-ip=40.107.93.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="brCNpNHw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sgt9ytzN4xAVmGmLSy4S7JiGUjJFD0BCgA63qoOLYfR5Q/Ath6P13OE1KRRo+OmHxiASznioHhOBQ/BH289fbl8zpepaoRC/unl0MPD4azSNES5IsH+jal0kkAR+iemqtlK67XkVjWgm3lKxNj58eMyMvpu1H7WMxo/ugRLJrh2dPwU46E4VSTm6d01UFg5kwsfM1SAc6W/NK/BJL3UpyhYNcP2WR65q5/tMQ8GVPxvbHESbx421T+CZDseCr7yoBAvXUotGxrKJCb85patsbB71ZVQgKQtifreyuiFKr9iRItPJf0DM/XeM/a5xR/14fWZZM1pcYT+sTsljkh7ONw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mMXOjVayf0uMa14YJ40N4Nboh2NSJwOBkd0Q7ovgVJ4=;
 b=g3tAuItMP8litPFgwSLlxhNbY3N4VSyOXiUD228RWf68zcBKcLqM9zIxGf8HQXbCnUJrOZdBK/elh+jEap5tqPfvuEVmhZAdZvkK+oPjljG+uxXgLlCHmQIIufApBFL8jyAGWTIzXFJ5GOMfFuCScPJB+wdkd5WjzXigFC0CZ+zIPlx8HdDiG7/KCRnht93+mmvHVjPAmfnsIOq9rOQEqOjl4fX1+SzAbuNaDSfQkjWzJTMMSh2AcSbxIkaXmVZGXo+NFLVLZY+4MC/tqcbTDan51seI6P0Qp6UWjo8z0/WiITrrWcftVzlRBqkNMk3dYYSm18p0zvtEMqIQmclyhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mMXOjVayf0uMa14YJ40N4Nboh2NSJwOBkd0Q7ovgVJ4=;
 b=brCNpNHwHSsjkq3wLq5m/W0UcWqr/GoyjtNfQFzQo5k4J86QtHSB9lNY372MLy30zA5egwUPuQAQ6qV9tCTeo8HQ/JpZRjsRdHUIqs8kBoD+Lur07fnxda29I/cwCoQnnSfiVCM0SKDlVatsXC1sIEWHxanTDMGXhtMjslNbSnk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by LV3PR12MB9437.namprd12.prod.outlook.com (2603:10b6:408:21d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 05:15:06 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%5]) with mapi id 15.20.8114.031; Tue, 5 Nov 2024
 05:15:06 +0000
Message-ID: <0bae20f4-7e20-4924-af16-df0906624294@amd.com>
Date: Tue, 5 Nov 2024 10:45:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] platform/x86/amd/pmc: Update IP information
 structure for newer SoCs
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Sanket.Goswami@amd.com,
 platform-driver-x86@vger.kernel.org
References: <20241029155440.3499273-1-Shyam-sundar.S-k@amd.com>
 <20241029155440.3499273-6-Shyam-sundar.S-k@amd.com>
 <c31b8002-75bc-2d24-7a07-1bb7d8638e85@linux.intel.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <c31b8002-75bc-2d24-7a07-1bb7d8638e85@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0148.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::10) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|LV3PR12MB9437:EE_
X-MS-Office365-Filtering-Correlation-Id: a3c11c45-92ff-45c5-9863-08dcfd58cf94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b3ljcyt3MUZXc1BQRWkvVjBTUFR6a2ZQdndubkNMSS9TTXZ2R04zTWdGb0pz?=
 =?utf-8?B?dkVKM2ZrSHAxV2dmcjNBR2o5dEw0WGhsQVVNdWJPU2o0RURudHVsV0VYK3BT?=
 =?utf-8?B?NjBEdXdQaENTNW93aFQ5dXFiMCtaNWhsN1BpTkJyclpSbHVSU3h2TUdyYXBi?=
 =?utf-8?B?cVFrYUh1MXl2UEdkajlxR25sWkQwVVF1MldzeTMyRTdMbmdnYnVoT3RpNjRo?=
 =?utf-8?B?eEJGWmd1Z1B1Vkw3a1IzVUlhckhFVTdrVGxpQVk5VDN1VUIxYzduQTRoTmRv?=
 =?utf-8?B?RVhVdS9uYzZaeDc4bVhRbUZyUjBMYmdUZWtQSDZlZ0RMNkJaVE9yZnJ1VFQ4?=
 =?utf-8?B?cEZXR3g4MHBjOVBXelB6b01KcjZ4WStmSGxOUHRwT1VWbER5MjJoVk8vRzFx?=
 =?utf-8?B?MGdiUzRUSnBhR0w0R1pHd0l1TlZMamtxZEhXTytkVnpHUjZ2Z1pwdmkvejBR?=
 =?utf-8?B?WE1JSG1XV2QzUkV4eEZyNUp6YXgwR3VPM3NnT1hqUDFrOTg5SGo0cTJ0NVhN?=
 =?utf-8?B?ZmhRVlhtU1pTMDlWT1IzWE50U0JzNzZGSGpFUzdNZ1hjYTRrZWZYNWZNT05Z?=
 =?utf-8?B?UVVhZ1VGcVd2OFFLbE9hd0RYaUcwT1Fzb2pkaGpPYmJyZGdWS1E1RDVSZjVm?=
 =?utf-8?B?V2E4WVNaS0dFMFN4eUU1Yk1aZzhRZWhYZXEwNHV0STRPRWZ6MmIzSXdFTTI1?=
 =?utf-8?B?MHpReGVBUnIxblZ6UnlqMjUzQlJYdW9ybnFKdnMveEhiUkVIWC92SWZpamc3?=
 =?utf-8?B?Z0pJc0JHQ0pySHpjUzJkN0dJTXhGeFA5ZUhpQUJTK1RhQW85eTJnak5ML3BQ?=
 =?utf-8?B?TzNraDIxRngyYmRQMnRZVHF1Z3pZRHlxM1pUUlRsT3ZFbTJPbmE3b2I5SEp2?=
 =?utf-8?B?RW5MWWJ3NEdMMG4yZGxLU3V6M0YrVjgxakkzbkJnK0IweElOQW9SMzRLR3Rx?=
 =?utf-8?B?WkgwZDZZQUt1SWVRVTE2a0htRVBldWt0ZjlTTzBkcU9lRStMeFp6ekFzaUxp?=
 =?utf-8?B?Mk1HU1ZmdWlzTFlWVG8xYWF6NHJYd3VLY1NNekNsQU01MGs2bG1IQmp5TmpF?=
 =?utf-8?B?TkttSi9vUmlUVng5VUF3QTJzM2FRekRVdDNJTHJrYkNvU0MzOUpiVFdJeFBp?=
 =?utf-8?B?cVpjUHNrWHJ3ZG15UUVaam1YTHMvcngycVhqYk5QZkRpejE4ZEZMSWd2NU03?=
 =?utf-8?B?TUs2eklKeVpaM1N4Y3lKNlFPc2R2SnlLbDVSNTRsMGk5WEZldUhoai9pVW42?=
 =?utf-8?B?cU5xNHhNbmVtWVhtYjVHUCtzYTlBb0U5M3dZaTcvTlJsakpuck1VNW8zbjVu?=
 =?utf-8?B?OUY4eGwzM0REaW96QWxwaEJmY1U3R3ZaSi9jbW55cDc0RllaWjRaRC9VUHR4?=
 =?utf-8?B?K1NER01FaDJSWTd4dGp5bjFZNy9TcXVjaU9oNWhrN2hCVVA1SGRhRzVkVExU?=
 =?utf-8?B?ZTBxL1NqUk5jcGhmbFl6RW5KWDJoSzhXNmIxTDFDemNuUVZJWmxsYWl2VXhp?=
 =?utf-8?B?SDNYaUFFbkY2WWg2bUNSdUlBN3dkZjFmZjhrUmg5Y0pjQUFnQjRnUzlMb0Nh?=
 =?utf-8?B?QXZnS2x1VGFHK0p5b1RWd2F5WmF6dy92OUs1ZE5majh5TVNxUzRnYm8wZ2ZP?=
 =?utf-8?B?bW5vOU1sYTh0WURQS0VBaXNYSERvcGdGb1BGOFBaRko4QzZpaFN3TERaRTRN?=
 =?utf-8?B?ZC94alJRWWxaUnJnVUdjdE9KTlFRMVh1SFQ2ZG9TeW0rMGFYd2thY0h4WU5u?=
 =?utf-8?Q?1CRD31ziQY4Ojf82ngzCQ/9pjgk77qBk6KkMT2B?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2lCYy85MWRXZ1JDcDNqYzVrMTRSNHhtOVJIVUJGUDhjYXZCTnU4ODJ4cEtq?=
 =?utf-8?B?a1hMbXVza2dPZnFwVmRiby9ja0grU05ja0FPT0F1OWFXRnNTeHBrRE9WY0M0?=
 =?utf-8?B?TjZNTU45NGNTc28zdnptQlRDQVc3Y2NBRE9XM2tncFZWSHhuQkhiVDR5OFN4?=
 =?utf-8?B?VjBjZmFBejNIWFQxMEorWHpSU1dNNjM5eThVK0RtdVhIalJiNWg5eWhINmRy?=
 =?utf-8?B?ZXhmWE0zSlNmNmxSUWFuakR0MjdHWDZTaFJoOXdKdk8yWTBvajZERGxVdnNW?=
 =?utf-8?B?enQ4Z01QOEErdXhIRVBweU90SWtQeTlSZy94L0F3UTZNZzY4VjBUUnhjTm5D?=
 =?utf-8?B?SFdTZmdFbnAwM1VwTXpOQmtpZDloQkxGM0ZLMHZuMzYwdE9mT2V6VlUvdFdM?=
 =?utf-8?B?UjE2clk5Nk5vUHFBdCtHclNvQVRubDE1b3M3SlZ3UFFTUXRGMXo2aDByd0Iy?=
 =?utf-8?B?L0xicjZ2OGVNa0RGYXlIbUlyUkJnaXB0eC9GWWNLREdYTUI4ZXZEVlBTZ0g5?=
 =?utf-8?B?YU1ha2ZUL2ExYkxTcFFrOWM3SmsxNHBEb2I4TTFQaXFsV2g2WDdTbGdtUlR1?=
 =?utf-8?B?cXVvNUJNVlhRYmgvVjRLTHp6L0ZsN280NTIrUDM2cFdsTTI2Z1ZCUjBNbE1N?=
 =?utf-8?B?UUJ0OFd5Y1VDbDhkekhVUjNVK0NNVG5VZkFtRGJtRlBwK0pBMDlJOXBFK2FG?=
 =?utf-8?B?TFFxSTBBUjZGUENkZndiTlI3SGIrRXJSRzdHWjBrTEVpOFFWR244V0VoQnpq?=
 =?utf-8?B?UmY1Qk1nUy9RNXFUK0taMHVHWG4rYmoxeEMzMFRjVW92NHB0SDA1V29zQlQx?=
 =?utf-8?B?UU4vM3c2QnlaZzhSQzd1Qlo2OE1QM003ZWJqbDNjbGdKNmNLVThvdFJMU250?=
 =?utf-8?B?MFJmTVNvemhYNTJQbEJGdmdHYXRpUkVFVnRzNVVHcXJ4WTZKQnRzMDFWNVFz?=
 =?utf-8?B?MTZXYTUwYTdJMlZUdHUyczFDb2xmSkxXZVBRS2tKTmp3V1ZmSy9LN1lrQ2tw?=
 =?utf-8?B?bDJ0MkhVOUZ6OGxhaFVpZldqOS8yc2hNTjhlMzgzNDJ2c3lZRVdPMWswUnpH?=
 =?utf-8?B?YWZJNE1EeWFXYkxtdXVXKzAyTlVualF5UVptcFhKZFVFTjVVV0I3YjdiWU5W?=
 =?utf-8?B?aGRucHpqKzNmNGducUhIVTBqd20wQ0dMWkk4bUJxUFk0dDhBUUZsbzV0cGhC?=
 =?utf-8?B?QU1DbENUNnF0U1lsdUVSRFhrakVGYkVQL29jVUhHZ2VjYmEwdllMZHd2Wkxk?=
 =?utf-8?B?bm5HNXBoN0NRWThvM2ZEQmFaOWMwOVdSUGo2ZEd5NU5SU0tsRWQ3MGpIeXJn?=
 =?utf-8?B?VWVsaTljaUtLZVFlenVuMFFNTVY0MkV3UFFrc1FpcHJJcVJ0YnJrdEFtUzZv?=
 =?utf-8?B?SU1LQVpxcTBTOEZ3eEJvM2JIeDJxRS9raUFZWmoxYzRLVkpxNW1XeWhQeldM?=
 =?utf-8?B?a3lOcmxlQzZnemh1L2RCWTBEbjB0dk9YOXJadUlvbGZrOHZQR1JmbTRaM3hs?=
 =?utf-8?B?dWJzS0RvSXFGRkhPOHJ1TVhLQ0k5eHp6Q2tBL1NxaTMvZmlmUElYWjBNai91?=
 =?utf-8?B?SEJUd2RnUUsrM2tVUnlRb2p4ampyR3RuMHYvWW9NTTRoVmZ2VDdKSmtxNDli?=
 =?utf-8?B?SFdwbUxvTXhsUXVIcXFENnl1ZnY3cVYzVElWS2Z0cUtpcDZLZFhBT3pxQmor?=
 =?utf-8?B?OWRaQkZ6dHh0d1ZkMnFsM2xYS1ZPU1lqRjNmR2UyZmlPWUFueEN2cG5zVWlQ?=
 =?utf-8?B?V3o3RGNIZ1lsamJzVGFLSTQzVTVzNTd1ZkliUEpXRWUrZm5XOVZsMjB5ME5a?=
 =?utf-8?B?Z3Nxb3Boa1pQOWpDeE9kS1VlT1UyK3BEK3cwU3dGbStoTGtmZmx1Q1p2Tm1p?=
 =?utf-8?B?VklMNVlPVHhjVytkMCs1ZzF0S3JBWGZHN1A2eVdsNk1VcnNaeGZ1a3pubDg0?=
 =?utf-8?B?Si92VDZHTzBSVXdBWVNpZ0ptZVFkcUNkM3lIL3duYTJvTkZZaVR0UG1aVVRF?=
 =?utf-8?B?VEVlNC9HbEQxMlpRYVpOYnZtd1Z3S01kMTNzbDk3dHZkMWpjUDkyMEs1d2ZW?=
 =?utf-8?B?VU04UmZiYndmNGl0TVEwem1XdHRMUVppMm5ZR0JWTTFCWkJvOTBSRi9ycnRZ?=
 =?utf-8?Q?Q6FKQxhMKiySXjl4HgeQhgg90?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3c11c45-92ff-45c5-9863-08dcfd58cf94
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 05:15:06.4707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mjmxcswaOgx+ujZvzUVwJd8X5yhPij8Ae3fJDULN3oKr4RUarduDVNwHB1paWKSwdy+N2ubkSEwghZqknmrJjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9437



On 11/1/2024 17:34, Ilpo Järvinen wrote:
> On Tue, 29 Oct 2024, Shyam Sundar S K wrote:
> 
>> The latest AMD processors include additional IP blocks that must be turned
>> off before transitioning to low power. PMFW provides an interface to
>> retrieve debug information from each IP block, which is useful for
>> diagnosing issues if the system fails to enter or exit low power states,
>> or for profiling which IP block takes more time. Add support for using
>> this information within the driver.
>>
>> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/platform/x86/amd/pmc/pmc.c | 42 ++++++++++++++++++++++++++++--
>>  1 file changed, 40 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
>> index f9900a03391a..0bf4065153da 100644
>> --- a/drivers/platform/x86/amd/pmc/pmc.c
>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
>> @@ -95,6 +95,35 @@ struct amd_pmc_bit_map {
>>  	u32 bit_mask;
>>  };
>>  
>> +static const struct amd_pmc_bit_map soc15_ip_blk_v2[] = {
>> +	{"DISPLAY",     BIT(0)},
>> +	{"CPU",         BIT(1)},
>> +	{"GFX",         BIT(2)},
>> +	{"VDD",         BIT(3)},
>> +	{"VDD_CCX",     BIT(4)},
>> +	{"ACP",         BIT(5)},
>> +	{"VCN_0",       BIT(6)},
>> +	{"VCN_1",       BIT(7)},
>> +	{"ISP",         BIT(8)},
>> +	{"NBIO",        BIT(9)},
>> +	{"DF",          BIT(10)},
>> +	{"USB3_0",      BIT(11)},
>> +	{"USB3_1",      BIT(12)},
>> +	{"LAPIC",       BIT(13)},
>> +	{"USB3_2",      BIT(14)},
>> +	{"USB4_RT0",	BIT(15)},
>> +	{"USB4_RT1",	BIT(16)},
>> +	{"USB4_0",      BIT(17)},
>> +	{"USB4_1",      BIT(18)},
>> +	{"MPM",         BIT(19)},
>> +	{"JPEG_0",      BIT(20)},
>> +	{"JPEG_1",      BIT(21)},
>> +	{"IPU",         BIT(22)},
>> +	{"UMSCH",       BIT(23)},
>> +	{"VPE",         BIT(24)},
>> +	{}
>> +};
>> +
>>  static const struct amd_pmc_bit_map soc15_ip_blk[] = {
>>  	{"DISPLAY",	BIT(0)},
>>  	{"CPU",		BIT(1)},
>> @@ -170,7 +199,10 @@ static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
>>  		break;
>>  	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>>  	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
>> -		dev->num_ips = 22;
>> +		if (boot_cpu_data.x86_model == 0x70)
>> +			dev->num_ips = 25;
>> +		else
>> +			dev->num_ips = 22;
> 
> Could these use ARRAY_SIZE()? They're related to that array, aren't they?

Yes, they are. ARRAY_SIZE() does return the number of elements in the
array but there is a catch,

both soc15_ip_blk[] and soc15_ip_blk_v2[] have a last empty element,
so when ARRAY_SIZE() is used we end up getting n+1 element (i.e along
with the last empty element). So, what would you advise?

1) remove the last empty element in the array? i.e. something like this?

static const struct amd_pmc_bit_map soc15_ip_blk_v2[] = {
	{"DISPLAY",     BIT(0)},
	...
	{"VPE",         BIT(24)},
-   {} /* remove this */
};

2) or just do, `ARRAY_SIZE() - 1` so that we don't need to touch the
existing soc15_ip_blk[] and soc15_ip_blk_v2[].


I am inline with your comments on the other patches, will address them
in v3.

Thanks,
Shyam

> 
>>  		dev->smu_msg = 0x938;
>>  		break;
>>  	}
>> @@ -338,9 +370,15 @@ static int smu_fw_info_show(struct seq_file *s, void *unused)
>>  
>>  	seq_puts(s, "\n=== Active time (in us) ===\n");
>>  	for (idx = 0 ; idx < dev->num_ips ; idx++) {
>> -		if (soc15_ip_blk[idx].bit_mask & dev->active_ips)
>> +		if (dev->cpu_id == PCI_DEVICE_ID_AMD_1AH_M20H_ROOT &&
>> +		    boot_cpu_data.x86_model == 0x70) {
>> +			if (soc15_ip_blk_v2[idx].bit_mask & dev->active_ips)
>> +				seq_printf(s, "%-8s : %lld\n", soc15_ip_blk_v2[idx].name,
>> +					   table.timecondition_notmet_lastcapture[idx]);
>> +		} else if (soc15_ip_blk[idx].bit_mask & dev->active_ips) {
>>  			seq_printf(s, "%-8s : %lld\n", soc15_ip_blk[idx].name,
>>  				   table.timecondition_notmet_lastcapture[idx]);
>> +		}
> 
> Why not have amd_pmc_get_ip_info() prepare a pointer into 'dev' to the 
> relevant soc15_ip_blk_v2/soc15_ip_blk rather than trying to pick one here?
> 

Makes sense. Ack.

>>  	}
>>  
>>  	return 0;
>>
> 
