Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2055.outbound.protection.outlook.com [40.107.102.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B61A78F2F;
	Mon,  6 Jan 2025 03:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736133090; cv=fail; b=LuhzEKQ9ouFixDEiS0yN3ZuMKDC2EwXd1fzILTVefx6c40wKf5Isc96KZutAxsBg9E6UVAAl3arrnPBNg0s9jp45QpHiytQVVKGwnyJ9c1acOwZZdHi6mLt8t+2ezgcdjmEpOHgkukPmtPVLJ8I2DlgfTVUWYNxylLLxbeePH50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736133090; c=relaxed/simple;
	bh=e3dzu6lfJcH0TQN2h2HHBLL8+y0jj48Vim71qUUWCbo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UtBZH/q5/qMTDAL4Roogc2zoRhr/weryUeE/JFF8Qw1RLeJDfGBfjw/K1HoUtXmuOHz5wDeiCC1ss34/+JDmw4tQs+9tFuZVBWYygQsnIDHTTfdMmnb6Ywl0haie9Z8fdap8ZuwudbCp/mY70NDh1v68zpF+c0DtRjdnRcbnCsY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=dW+x0ygD; arc=fail smtp.client-ip=40.107.102.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dW+x0ygD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RqCgcfEJH4KHusvZolyQJEBgZ+MhCwG3Zh6UMfYtmBRjYUTJEWGYBaS+N2sTQ2u/vAt8jbFq9bbDSSoFyT2ORgIOx64DfUnfEYiOwE5bVsBELA3I2pFi/RfTtN5z/czm9tsXArjabcqccCcFpVW9ayarBu+3yi9G8tXBcyuRB/5C4pNG28I1+nVqUG32htctlC14kPnX8SH+fCEgwsDuoipnxPYZMjQ4zPCZBTtTmnzvtERas1hGOoAaTl3xIGtzzZ9CIIjpQr+z2nsr6q5X3C+A6Tm3Z7+KlcfhuArMqVWJe/Ws8n88RaLUvZg9meo/dm00XRWJPc4LI9gQcsKGMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5JfxzHkFIJbpy2fc5ZZJjajMHd+FRgVlJ4qeGC/N3Qc=;
 b=aVIXXztkpAy7oFNbKlwvbsc76ql5ELchQsX2q2xXP2RP6ZEHs3PFn1yHSF4ntgTRd2NMft6pZkctuGyYE7FDSNJMZJPjZri7NwSq1+iFd8UFZZuUp0AkDGhI0a+JDF6dXUd2YPKu5z9M+rDZO5NSiKmlD1V8o/2kBl/A26SV+1dn1c61b5XpgDL4N0HtrjomkqnLsbdd4pmGJTfjZUyz6rLT+znlTSfohJWwSTXLRCN+1m91mQaTn4DdmTIxurIT5O2SARThh8FC3pT/NKxSaBtssukuv/cyq3xG4z1+HcGAlyMWIVMwNFjm6ECz3OXak1YQOgQFIqtwUS54IlrjJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5JfxzHkFIJbpy2fc5ZZJjajMHd+FRgVlJ4qeGC/N3Qc=;
 b=dW+x0ygDb4YlGCh6Q22xihbqL3H0yndvYmho98tb3C1aSL3IcMysztv5dwaUETPVFXKgdDEVKxkuzfWhSgKQ4yCWCcMkKjN1s6/SE0DmNejmnDjCAcL7ADWfvIdg16SIILZKuJei8HqIlAjDM4j92oFGmjMjZD2at0/PZq2lhPI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB6095.namprd12.prod.outlook.com (2603:10b6:8:9c::19) by
 IA1PR12MB6652.namprd12.prod.outlook.com (2603:10b6:208:38a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.16; Mon, 6 Jan
 2025 03:11:22 +0000
Received: from DS7PR12MB6095.namprd12.prod.outlook.com
 ([fe80::c48a:6eaf:96b0:8405]) by DS7PR12MB6095.namprd12.prod.outlook.com
 ([fe80::c48a:6eaf:96b0:8405%5]) with mapi id 15.20.8293.000; Mon, 6 Jan 2025
 03:11:22 +0000
Message-ID: <ca9d385e-3c1f-435a-9ebd-85f7d3e72aa0@amd.com>
Date: Sun, 5 Jan 2025 21:11:20 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/pmc: Only disable IRQ1 wakeup where
 i8042 actually enabled it
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <d5ed5ffc88fed17e1b1eb988c942e44fb540a68b.1735490591.git.mail@maciej.szmigiero.name>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <d5ed5ffc88fed17e1b1eb988c942e44fb540a68b.1735490591.git.mail@maciej.szmigiero.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR18CA0029.namprd18.prod.outlook.com
 (2603:10b6:806:f3::28) To DS7PR12MB6095.namprd12.prod.outlook.com
 (2603:10b6:8:9c::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6095:EE_|IA1PR12MB6652:EE_
X-MS-Office365-Filtering-Correlation-Id: a10196fe-06b9-474c-f5d1-08dd2dffcc1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dUJyZllYcnZ4ZW5ONDllbDFGSE9lanRFRVdBZFFZUnluOE5PK1diUm9TajBw?=
 =?utf-8?B?QnRveURHaG5vMWNpTUNPcVR6N3FSb0wza3c4SGg3WUZ6d2Q0MVIzRDBhRmwy?=
 =?utf-8?B?TGpoallMY1ZtQ3JnRnZMRTdZUjNrVnhlVlFtSUlaNS9ienFlajY4ODEzRWRv?=
 =?utf-8?B?REJUdWJ4VzZhRjJLbWhrM1RPZ3NOUDNpUGtjUnQrZDY5a05qN2N0aDdZR2NX?=
 =?utf-8?B?QUlXK3RtZmxGUDc0S0Nyd2FxMWpaNGRsNWNJaEx1ZUtLNjVIeGpVMGd2MzRh?=
 =?utf-8?B?dDJrcG12Mlg0QXZicGJza2JDdzhNQWlINGlicUttMUVXeVVwWGM0QUZsNEFM?=
 =?utf-8?B?QUNBY3g2djZrUkVXV2VCQlBvY2RrUnlaaHlVRG1LMjhlV2NwTHRtc3RzSU1E?=
 =?utf-8?B?RU5iMFRZR0JDUU0xSVZiUHN2QXVCajQwQkdwK1Zib0ZqL2QzYk1iVUp6bS9I?=
 =?utf-8?B?VzF2dll4YzE1R0kwTGZsMmoyQzBTNXJQcGovaGV2aEI2UGt1UHJiYlJsNDFz?=
 =?utf-8?B?cnI1TzIxbytGWTVTOTVZNE5kQmxHV1JXSlVHT3A5VDRUcWZQaE9TUjUzN0dB?=
 =?utf-8?B?NVZ1d0lFNjZwZGV2RDZLeXlGMFRpc1pNaHJ2T3BZUUxEZUV3WHVTU0ZiOWVK?=
 =?utf-8?B?eTk2UWFBZjQxT09TTTNJczRoOVNIZnRsSGR0Vy9FOEZIYXJ2WFlXVGIxU283?=
 =?utf-8?B?ZG4yeWpsK2NTMlc5YWwzN3dLMU9mS0c4STM1T1dKVWVWVk9la1pMUTRDbkhP?=
 =?utf-8?B?TGZuS3NUSlNEODdqZkIrYVNaenFvbDBFczRuRDQ0UUZ4NUZzcmtqQWgvWFBu?=
 =?utf-8?B?bDQrd1AxYkZreWtyejlxUXdBc3NtL1A4eUdIWmZWeFpXK0dTR1BWN0F2cE5J?=
 =?utf-8?B?bVhvYUxnWVM0bElKWVUvNTFzZU5pQVJiU3cxOUVRNHhxODlvMGxjVXIxMU51?=
 =?utf-8?B?VUJSVzZSMVFzdGNrQUtZL2ZuK0RNb0ZrVDJ6dXVyOE51Y3lxSXY4NkMwRVY4?=
 =?utf-8?B?azdXMXlHSFhoMmg1WmwrTTQvaGpzaUE4QVA4OTJheXQveStjYk5OQVROVWhO?=
 =?utf-8?B?ZSs0ZjUrdWE3SjRROWxHSnEyWklNQWFDR2szVnZCVVNCTVpaYUU5eEJYQWxr?=
 =?utf-8?B?SXR3TSttVG5YdTVLVXFRTjVHNWVEczY1WVU2ZGZsSUVzZW9HT3FyMW9IaUVE?=
 =?utf-8?B?Z1Z5N09EVG1XTWkrRWpncGw3SGZ5bmxqaGwyMTNNS01uNHZZR1VFQ1ZONjFS?=
 =?utf-8?B?cnVaYnR6U09qdFY1VTNhbGdQOUFYWURHYktaYXE1UmV6ZW5mM3hldnBDVFBN?=
 =?utf-8?B?M3Y3WHQrM2xLSjV3RUVIeHIwYmNIdCtYZTNUOGJFbWRwTE5NNFhVQlhpK3g1?=
 =?utf-8?B?eDRheTVpM3JZR2lIRWFVYXBTeEdWVlAvbXc2bVc4Zk5Kbmd6NWp2bWdGL01M?=
 =?utf-8?B?bzVYeDA1VFBzd1NkaWgyR3ZhVllhT0xGSVBIS1VGcnRhNFpoZlk4N1NpcTJX?=
 =?utf-8?B?cUVHQjBKeVJXUS8wdGw1ZFRIODJrbVBzVUJQeGFObXRFWFc2eU1ZRjhwM2Ux?=
 =?utf-8?B?ZEJTUWg3cE81UGpuOXk2cUxFQXpYYjhLOXc3TzJ2Wmg1akNGT1A4cStINjdx?=
 =?utf-8?B?WnJFS2UrdXdHdUxiemtPSCtWYmNsS3hvT3Z3eS9nbG9rNUdvQnl4NGU3ci9V?=
 =?utf-8?B?SWZoa3dVNmZ5bHlseUpMdEx0RlNSU3RXZWZ2SS9zTklyNVF2cjdicGlNMFYz?=
 =?utf-8?B?S2FCczIxZW0zSGR5M0lCcFFwSGhMdzhCYS9xM0VLZzI2aG9uL00zZC9Ja0RG?=
 =?utf-8?B?dm1vTEdQWmZySURldWNTVmpMZndUNEY5MVdBZ3B4UVMwSXowVW5FNFZacE5Y?=
 =?utf-8?Q?ut2c3kKoBPD/P?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB6095.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Unl6a3dWZmo5a0RaTzNEd2dHaVpTeXFlVTFGVVYwSERQSmFQbVRsN2loU1du?=
 =?utf-8?B?Q2l2TERsOUpxVWNBa3RQUCtHdHlhU1J6YjJZTW1vQ0FLUTZ0ZFV1OEVGdnlr?=
 =?utf-8?B?MnhVaVlzVHRnQ0V0SHdJZHNXZ1NXZGVKWXV3c2FvMXNyT05RNG9IQmFpNGJZ?=
 =?utf-8?B?Tk5zeUQ0OE1pdS85MWNvOVlMV3FKaGwvUzFEeXNwU01ES3Z4TzNTMlZwb0tk?=
 =?utf-8?B?QlY0a2ljNDBDWjlESlpFNGM2ekpla3NRK0lFVjljR0lKcUg3Qi9IaGV1VHVJ?=
 =?utf-8?B?aEd3ZEdMMTBSSHZTMkZQSzNOWGhVd3JLdm50eFdhYjYwZ3p0aDdodzlPV2ZS?=
 =?utf-8?B?WElaWUJBRXBYR0ptcGlXMmJLZTdDSjZEWFJOZWFOOHlDcVpFNS9BTWw1T2Zj?=
 =?utf-8?B?U3FwaHdOUGtyMWlwWGRFZ01RK2EyTUhETHVGMy9OSWtkbHZYN2xkcy9QbjY3?=
 =?utf-8?B?K29DTmZPOGNSYVJZMzZybW43SGREb0lWS0J3M3NCMjhreWFNS3dOY1h4T3g5?=
 =?utf-8?B?cEFTZEJjbmJ4cWpIRVNPN29xdXR2UjZYdkR0U3JDMStuR2xVaGJLWTc2UTR5?=
 =?utf-8?B?cE5zcHY1b1Q2WjFXeWQ0MmlzSzQ2VHZZQzVBcklwL3lZTlBkNExxaHJaWUcy?=
 =?utf-8?B?UVNiU1gwNlBxdWdYeTNOeWVKdkRZdjRGYnBVU2RoaWZhbnBsNndUL05mRzFi?=
 =?utf-8?B?WE56QVhjM1pQclZ5RkhEWE5NS3c1YmZKc3diWlV4Skx2RWtBT2hSWUt4bGRl?=
 =?utf-8?B?UE5TQ2E1S1BiK2tncGtnSzVldW15b1FiUTMvd2UvWExQRHdpZHZza0dqbGVt?=
 =?utf-8?B?VExKUHc2VEpEKzlHS1JlbzcyNXRLV2thRHMvUzM3b2NFUk44WURuWldESWRO?=
 =?utf-8?B?NUc2WkRDR3g1bXZvVFlLaDl4KzU5ak9ERkgrekpQcm5yaUJSMmFMb0ducWtZ?=
 =?utf-8?B?NVo1RjlqRENtWGNZSUhzakYrVVh4cFFOUStla0pPdldHZ1JZMGtJWGFxeTRW?=
 =?utf-8?B?ZC9PMnpWeVRsZVh5RmhKRC9CVHpRcXhkdEFMQllTMzV6dkk3blM0U0pmRlUr?=
 =?utf-8?B?R3dzUnBQZm5yL0xmQ2VNZlpJMEY3SkI1TEg4ajNXTTdPKzQwMVV1RjNpdVV5?=
 =?utf-8?B?ZEhMdlA2R3NrVzRDYUQxaGF3Zy9YZE40b0p3ZUFWMGlUbDV1T001Q3Q1YWRB?=
 =?utf-8?B?aUtWamVmOGg0Z1RJOUlRUDVIMndMOEJNMWRzOExTVUlBQ0w5SUszZlEyM2ZC?=
 =?utf-8?B?c0ZFOTdFU1UvNmxNMmpDZ3JTQ0xaQlJlcGZwRFJ4cC9KQloxUEw1QVhhcUhs?=
 =?utf-8?B?b1F6VU9mcEkvd1pkRGdyK3BLY1VxaGtZVzM0UjZnb2FVVGpHL01ScFJnNlli?=
 =?utf-8?B?Y2ZEb1Q2QVl1MGNLVit6U3RGand3SXNLbnBSMjdrSHRuS3RXekdRR2o0RXk4?=
 =?utf-8?B?UGYxdURqY252TWt6blIyajE4NjduRVRhSnA1eFZ3LzhnMGcvcmhDN0lBYnVJ?=
 =?utf-8?B?aXlydGZsWDZRakhCYjY4Umhmd21tR1hReTk3RTFxRDBmUUVINjJuRUI4VHQx?=
 =?utf-8?B?aC85K2VrQXpRc1NZWTJqUVBNK2pJZzE5cVV3T3pGN1dlMElrNnNqZFdVZXFz?=
 =?utf-8?B?bGhaenozZWJqeVlzRmJaWWhwWXcyZ2dkUkp4RzlUdlJFSlJtVUZSY3hicjR6?=
 =?utf-8?B?MEZ1L3J0Y1UweGovTGRkRS9TdWZwd1pnT3dnUkF5Y0RGTi9xSkVRckxDOWpv?=
 =?utf-8?B?SGRYNW54NThxUW5TZDg5dXpmQnc0Z3k0V2RuQzVHMXoyMnJNbUhBdmZEQkN3?=
 =?utf-8?B?Q0doVUoxV29KazVKSUZ3cnlDN0dlQWF2MFQvNXBmMy93R3N3QmhCeHg3LzVT?=
 =?utf-8?B?QUNYVUNOaUM1aVkwelkxL3RYZ2Y1VTdrd3FoK1NpRTl3UXZrVFI1Y1ptN29k?=
 =?utf-8?B?WFRDZkx6SWJydGNyYURmeThYaHZReEp3SmcwQjY3Q1BlRWlQeUZYc0RZdThN?=
 =?utf-8?B?TzVwOVMzWURIN1RsbkR1RG9oMWZ2NFVTbWxDYUJMenBNZ0l6RXVmaU4rNHg3?=
 =?utf-8?B?Zm9jWFN0eU9sbnFqQ01CMGxFNmwxbjgxS2VQc0xpamprSzZEdTJ0OEJ2SWpN?=
 =?utf-8?Q?VByo9LsmAI9OdOB3Oyqf1wV5k?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a10196fe-06b9-474c-f5d1-08dd2dffcc1b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6095.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 03:11:22.2045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hIOJXFR82r0jy0HbPARSbn+qb8LJBwH1llrJfOp9pMx5u3relUONEK+3j9uV15bEmnxfbjIFiryS2xLLdmsZRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6652

On 12/29/2024 10:43, Maciej S. Szmigiero wrote:
> Wakeup for IRQ1 should be disabled only in cases where i8042 had actually
> enabled it, otherwise "wake_depth" for this IRQ will try do drop below zero
> and there will be an unpleasant WARN() logged:
> kernel: atkbd serio0: Disabling IRQ1 wakeup source to avoid platform firmware bug
> kernel: ------------[ cut here ]------------
> kernel: Unbalanced IRQ 1 wake disable
> kernel: WARNING: CPU: 10 PID: 6431 at kernel/irq/manage.c:920 irq_set_irq_wake+0x147/0x1a0
> 
> To fix this call the PMC suspend handler only from the same set of
> dev_pm_ops handlers as i8042_pm_suspend() is called, which currently means
> just the ".suspend" handler.
> Previously, the code would use DEFINE_SIMPLE_DEV_PM_OPS() to define its
> dev_pm_ops, which also called this handler on ".freeze" and ".poweroff".
> 
> To reproduce this issue try hibernating (S4) the machine after a fresh boot
> without putting it into s2idle first.
> 
> Fixes: 8e60615e8932 ("platform/x86/amd: pmc: Disable IRQ1 wakeup for RN/CZN")
> Signed-off-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>

The code change makes sense to me.  You can add this when you resubmit 
v2 for the commit message changes requested by Ilpo.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

> ---
>   drivers/platform/x86/amd/pmc/pmc.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index 26b878ee5191..a254debb9256 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -947,6 +947,10 @@ static int amd_pmc_suspend_handler(struct device *dev)
>   {
>   	struct amd_pmc_dev *pdev = dev_get_drvdata(dev);
>   
> +	/*
> +	 * Must be called only from the same set of dev_pm_ops handlers
> +	 * as i8042_pm_suspend() is called: currently just from .suspend.
> +	 */
>   	if (pdev->disable_8042_wakeup && !disable_workarounds) {
>   		int rc = amd_pmc_wa_irq1(pdev);
>   
> @@ -959,7 +963,9 @@ static int amd_pmc_suspend_handler(struct device *dev)
>   	return 0;
>   }
>   
> -static DEFINE_SIMPLE_DEV_PM_OPS(amd_pmc_pm, amd_pmc_suspend_handler, NULL);
> +static const struct dev_pm_ops amd_pmc_pm = {
> +	.suspend = amd_pmc_suspend_handler,
> +};
>   
>   static const struct pci_device_id pmc_pci_ids[] = {
>   	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_PS) },

