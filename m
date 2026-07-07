Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011021.outbound.protection.outlook.com [52.101.52.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA4D3EDAA2
	for <platform-driver-x86@vger.kernel.org>; Tue,  7 Jul 2026 12:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783426722; cv=fail; b=Fxf+6Uuj4NGg/n4f0RaucnUpyKSks4P4SXbiubse7pEDBjSAJtpHelewuhX857wb8MTtmRCShDDxVsTB1JnWRWQGEjJOXUa1XmDK+83miWgJWW/e6x/s60kdl/YyblVa/2//owe0dfpX0AI+q2rkeLNFMGSNKakOndHkdVzyv1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783426722; c=relaxed/simple;
	bh=Nv5I2vfnJqJj/G5lv3HPRYoh7mCTveepkhhNCGgW+LE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=INsXjy35QkyZX7zrHo6BKah4GGLExOf4VTQcGTlAB+anNsohuzPxWvIgZiI/FhOzojH1DLp+NBrCKWLJfks0Jyp4yDNl+tkyGTjUp4cHQB2UxMWkObp/4bK8fFycB0o1xtY9sVKa27t55vAlu7LXjarGOyw0ppQZw0KDWVcI2JM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2E6Elggn; arc=fail smtp.client-ip=52.101.52.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2E6Elggn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eVOY2vi2t1Sg8gLl8pBKISTeLdEFAoaVkKd1yW9qbzNl9DQHkiz+miyRQ1sZ3OpOZeWfAoabTUUqJzDJuR7dzY7nuLBl+nZqRzKaA/ZO/xcqzBdEGiJk9+2zJx3qFDNJqIy0lgLbM/xWGgthAIDD2MhM+tgOQC1QoXarXyxgvu6juq+bk9g60y20VWXfFBAc5NlTNPHxkTabzWWGK3jbXTJe9pPqTvEvLaPGLqhcs0rC5Eg479FRTC91bbYGZ3rWM1Oe+rTQ+BMHpFuKbpFhkETeh2lCCIUS/bWoyL3fqqRdnvkkMjrjh7Pvb6YdO2ej/7lIAjMQLr6ouw+R0GqQYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XpgiwlkOW0ap6DbRPGhFfKwG/FjUfCz5XyIWjlTM6Qo=;
 b=AM4VE1YzAYxNJ7HpWP+KogWbxFWQf1gvFsmlsIhdLg1aDdGnTUu/sUpwMblP3crp1p7TiWr90h77nIe5ddqwc1IBYAQUX9iTFS7xaWLA905yOPhdgi3IKi+fHohzjdJPnZj58tCXzkWHNTYdf/UhpWX3wtBYTz7uKSjET7YnqYFnEL+xQvi5HIDhMRDCWQV8bkrcxK6nST1pMA2y2D+1M1aYtecCqe7p1KM1KB0kcX6qhQqDSaUPxSr4oUHPlT33BgYnjXveNnhhB3k1xn2rgOWTYYupjY52iKR2t1gl+gdlVJO859Zw9LsQWyxyNhGeL5Z05cey5bOMeEObTx6b0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XpgiwlkOW0ap6DbRPGhFfKwG/FjUfCz5XyIWjlTM6Qo=;
 b=2E6Elggnc2wU1WmQRixww8FDcmonS/G5eYqkCDfg1AJkU4Q1ghF4fcu5WZBbnqk1UyXmnETrdfX6mfNig2JyI90c+G0HLdN94E7yMU0wuXOm0LDDGbmXn5fMUE19toTZSo4knCewTrFXckAq+D7dVW6Yv+JQwTMBH026vaoVb1k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by SA5PPFE91247D15.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8e8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Tue, 7 Jul
 2026 12:18:37 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683%4]) with mapi id 15.21.0181.012; Tue, 7 Jul 2026
 12:18:37 +0000
Message-ID: <98ee0b4c-83f6-4482-82a9-a71132d3936a@amd.com>
Date: Tue, 7 Jul 2026 17:48:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: amd-pmc: Add IP block table for AMD 1Ah
 M80H SoC
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, Sanket.Goswami@amd.com,
 platform-driver-x86@vger.kernel.org
References: <20260707054048.69152-1-Shyam-sundar.S-k@amd.com>
 <c07417fd-ddd9-e171-de9b-75bdfc66c5b3@linux.intel.com>
 <0d48eac8-fda9-4bb8-91d1-801cf6a2797d@amd.com>
 <2b2d468e-ada8-c1c4-5919-f75af55614b7@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <2b2d468e-ada8-c1c4-5919-f75af55614b7@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0049.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::10) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|SA5PPFE91247D15:EE_
X-MS-Office365-Filtering-Correlation-Id: 14f4b478-382c-48af-aed3-08dedc21df1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|4143699003|11063799006|56012099006|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Hy4byabMavR0Y7kdqQPhejLalkJ8JSz9Y+5OxeBApZfJpzaiOVseBvICvhUxxlwfKFqzeBVPNhfyM9SdaMD9xeeQcTCNiJCAbjve4Jqg8VMCUsk0J3xE5AEdTlgqpAcQaq5mSpjq7baJh597evkAXAHhjK2zQxtS8ApiabY4CP6YNfGB0TpnPgof39tSsD3R42OnZICAIG9ImUkNNYzU2aoZCotFpRVs9rKBhELZ9YXHsSeorkba2cBYRBmh23CT+QThmK1blKFZ1xnqi46ShyDyABcxmBjFg7IOo1beg2yHmT5aOpEJg72k7zbu4fpLvN1F1WEM1FmhXnp+ylaJNnKa4OU5t7j706UAenkCgRB3n8vSjpdnf6bcNDNakH0aC02Oh+3RQJ/MD4iol2oj+W/W0QPVN1F5P+OjBzQpsMyBDqU8g2jSdNvRn2AzwD+HN8NeD3YPlg9BLOhpOsBdX+Su03XhkQAomF5kWaNmETUC3Vbzmns+er2xH2jeuwIl00nxeWbfHBswBo9eQptxHy+nTMNYZE98XFWEmXWbcHjpNwBDW4P/W4PJmL6X49I/aEbDkJwjcIElmbkcNS6u4MoAA9fn3bQick83lyqKgpHlvNDByRZGX+u/2gBTzLUfru9lEiuZEx48QKdrFeLvB+cEk3ig3JRtk41LkrmJCMU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVMvbW0vOU5iOWlrSHRjcGZmUDhmb1VkbFpkTkZrSDN5ZGhzeWliNVBhcTBv?=
 =?utf-8?B?TnhVU25vaUZvNEllVlE3WjdWODFUbjQxeFQ3VmZTR2JHd2pNYTlBRk9ka1FV?=
 =?utf-8?B?TDJ2WHNmbkEvbVZRRm56MXBJdmQ1MkltR0RnbXhDLzlSOG5hTkRMSFpmVW5L?=
 =?utf-8?B?SVlDcGFhanhib0tteDV5bnJFM3JGTGtDeFpXSS9zNFJOYWczbDRJbjRZbkRG?=
 =?utf-8?B?YmhyeDZ4WXd2ZFZsY3pibTNYaGc5ODZoVzJ6UGNzZFdZQndydWxoVnlVZGl3?=
 =?utf-8?B?VHBkYklQNTQ4dis5bmFaWE9PV3VNWENnY0w3aWQ0eHZKZFM0eEd6RkFHUGQz?=
 =?utf-8?B?eFV1d09aaWZxSXQwWitRUlgxeUU3cWpiUlhjSGhxa0VKSCtycjZmb21UNTdr?=
 =?utf-8?B?NVR5RzJObisxeGZNVG5ITFlCRXROZm44NlRBNStKb3ZKMDl5bmRQUXh2VWdj?=
 =?utf-8?B?S0d4eFpsYkN5RHp2Y0psL3dyemg5NEg1T2FsQjFIeXBoSjZ2cWRRZ3VtSFpK?=
 =?utf-8?B?U3FvZzIyUGN0WTI1ek9DTzNyeU9sNnlaTTM3aCtWZVFSUTVqajFTcmNhQlB6?=
 =?utf-8?B?TzRxR2phVGlBMitnb0JOR01oVDA2TXJyQWtsS0h0UGZEc2R5M1ZMZDE1VmNl?=
 =?utf-8?B?Yk03enFKZng5NU9aM01mU0o1dkFWRHFqTnZPZEtzWkYwV2ZtMXBtdHpVS0R6?=
 =?utf-8?B?Mm1RTU5IOWlSa3hsMkQySXJ4em5rdDN6VzJrU3EvV2V5T1hXUms2YmVEQ0hO?=
 =?utf-8?B?SHczQjgrSXduUjRQVmJ6Wk80YlRsdFk0THBjY3prajBkNzJCYkVETkc0M05t?=
 =?utf-8?B?d2pFbmdSN05UZEVqeVB6SUJpVlVZQzNzdlQ4QWd0YlQ2dTBHVkJMRHEwVG5P?=
 =?utf-8?B?WUJyZEtITmloZit1RHFnSTllSG9uMUxBeG00TkdndnJYWnhLaWM4SmozUnkv?=
 =?utf-8?B?WFJER201NDJPem1PY0haQ29RQ2NtVEtxbURQU0h3Q0hia21CT1Zobm1ZY2ZE?=
 =?utf-8?B?MTlWTG5qT0ZyTVNjTXZOdWRXZ0d2MkdFT0NVQnZuZklwSHRPdEJPVDF0NmFv?=
 =?utf-8?B?bmRwby90TDhaUVl0RDVhKytNN2tGcjVuY3EvVXhKbVdKMmpCUjY0QWpPTHhC?=
 =?utf-8?B?YXVmVkhtemJ1OSs5YUl2TlFWVy9HdXJsTGlLaHFIaExmRU9QTjl1WnBhWkdL?=
 =?utf-8?B?QVNzWFpSWEN2aEI2V292Qk1oQURPRWpiTk9sMTh0YWJlTHQwWW5XQUUzQnoz?=
 =?utf-8?B?S2ZyelBOa3c5dmlpUUtzVmhnNnZDd0c5YzBmYjRvVGhFMkYwZ1VxYUExVUhx?=
 =?utf-8?B?aExjMEFkRFRYcUpSR2R6ZGw3NG44Smw1dzI1VFdvV2V4dVdQeFRUYkhHeGtx?=
 =?utf-8?B?U2J3YU1oTURzNkJoSXIxRm9OcURhMXZHSUVpejh0NFE0ZDUvMlBNR1NEVGtH?=
 =?utf-8?B?dld4VXUrWUdOUFhNYlltK01wcW1reThZSG9tc3VjU0lvMU9iblQzelMrcnhu?=
 =?utf-8?B?QmtPMjk3b2RkZ0dSZXFuakNYK1pFajFlRnpUa0lEQm40aTFob2U0bDZJMlA1?=
 =?utf-8?B?aU5raDF3dmE0ODA2RVE2QkNwWTQyanJnckU3S2t6dUZGakxBWnJJaUlxUU0x?=
 =?utf-8?B?SW1ORGlPOEZ1cXVsaXZBaEJJdjg2ZC8rZEdYZUFXSGRPWGtvQXhJVHplOU1u?=
 =?utf-8?B?RGVCNG9GYXRHekRqVmVWR3BncVgwd0F4TXdxRXg3UFhVeFd6NitPMTJKeWMy?=
 =?utf-8?B?a0tDczRuQzAxR2d4dTdvcGkzUmlSa0taVU02OEpBaWlEZnFXRy83NythcjU1?=
 =?utf-8?B?UjU3K0FueFU3Tm9TOGs0UGJPZ0JpeVRqVURxZGtwb3lrWGFMOW1vKzlXcWk4?=
 =?utf-8?B?T0cwMC9Vd0Z1UDE0TjlGNll2QWJDWDUzMUI5bkhtVkx5M05IbURWMFFFbkJW?=
 =?utf-8?B?QXd6eEg0ZUlGZE9CYVJrYmkzS1Q5dUpub09MZ3E0TmV4WVNaMmpyODZiRWFY?=
 =?utf-8?B?TEhSb2E4ZFBMRWxDY3dwYTNjRlkybmhTVEhiOTZtUXlPRE9sU2hZYURybEJE?=
 =?utf-8?B?QkxNalhWUFRrMlFwQmcyUTJ4QlA2cTFHQ3hvdkRXY1hlWTdiODRoUkdNa3FT?=
 =?utf-8?B?T0xvQmVJOGJva2dGbXZTa3FLc3NsSTFLNzVTSURlNWZpeXEzcWw4SFdQMVhZ?=
 =?utf-8?B?N21OL0ZIZlZaL3hoVzNtWnBIK25va3Z4RHVzV2tWMC9NUUUzNlF6WG1PUFdp?=
 =?utf-8?B?aUxkNXM1aUZlOWhDQ040U1M2UUpubE9mdmNtaHFBSmgzemd1aUNpQnc5VDJB?=
 =?utf-8?B?aXI3K0d4N1lHanQva1VodU1kbG5aVmxwZ1dwS2psUnIzcFVzN1pqQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14f4b478-382c-48af-aed3-08dedc21df1d
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 12:18:37.2119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j+4R7TKEd1+g3wfbpudFI9HwlSaJiGCwMKfVUC/pUSkjaXFCLUr6uYQYdDyO2hRsBtMuIpaG9AuiMkRW1hzAyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFE91247D15



On 7/7/2026 17:06, Ilpo Järvinen wrote:
> On Tue, 7 Jul 2026, Shyam Sundar S K wrote:
>> On 7/7/2026 13:16, Ilpo Järvinen wrote:
>>> On Tue, 7 Jul 2026, Shyam Sundar S K wrote:
>>>
>>>> AMD Family 1Ah, Model 80h has different IP subsystem layout compared to
>>>> previous AMD SoCs. The existing soc15_ip_blk[] does not match the latest
>>>> firmware's DRAM export structure for S0i3 subsystem accounting.
>>>
>>> You say "the latest firmware" so what about the cases that have older FW?
>>
>> Good catch — "latest firmware" was misleading..
>>
>> This isn't a FW-version thing, it's tied to the CPU/SoC, and in fact
>> the original M80H commit(043af31c8d30) had this wrong.
> 
> Okay, I was actually expecting it might be the case.
> 
> One of our platform recently needed similar correction (and IIRC was 
> first submitted with similar explanation as your here :-)). After I 
> inquired about it that was because the FW got updated after the kernel 
> support for it was added but before the launch (which was the other 
> possible explanation I was expecting).
> 
> It's important to have this kind of details correct in changelog because 
> normal kernel devs don't have the same internal knowledge.

We're in the same boat then :-) — thanks for making this an explicit
call. I'll make sure the changelog spells out the SoC-specific
rationale so it's clear to readers without the internal context.

> 
>> Let me explain..
>>
>> PMFW (Power Management Firmware, formerly SMU) exports the power
>> status of each IP block in the SoC — the subsystem accounting. It
>> writes this into DRAM, the PMC driver reads it back, and we expose it
>> via debugfs, which is very useful for inspecting S0i3/s2idle residency
>> and debugging s2idle failures.
>>
>> Each IP block is bit-mapped, and the set of blocks is specific to a
>> SoC generation:
>> soc15_ip_blk[]    - ~22 IP blocks
>> soc15_ip_blk_v2[] - 25 IP blocks
>> soc15_ip_blk_v3[] - 19 IP blocks
>>
>> As the SoC evolves, the set of blocks that factor into low-power
>> transitions changes (some added, some dropped). For Family 1Ah / Model
>> 80h, PMFW only accounts for the 19 blocks that physically exist in
>> that SoC. So the layout is fixed per SoC — there is no older M80H FW
>> that reports a different layout; PMFW on this part always uses this
>> ordering.
>>
>> The problem is that commit 043af31c8d30 wired amd_1ah_m80_cpu_info to
>> soc15_ip_blk (the oldest table), so M80H has been reporting incorrect
>> subsystem accounting since it landed. This commit adds
>> soc15_ip_blk_v3[] with the correct ordering and points M80H at it.
>>
>> Shall I respin v2 with this rationale in the commit message?
>>
>> and add?
>>
>> Fixes: 043af31c8d30 ("platform/x86/amd/pmc: Add PMC driver support for
>> AMD 1Ah M80H SoC")
>>
>> (note that this is not in stable tree yet)
> 
> Yes, please add the Fixes tag and correct the changelog. My intention is 
> to route this through the fixes branch.

Sure — I'll add the Fixes tag, correct the changelog.

Fixes: 043af31c8d30 ("platform/x86/amd/pmc: Add PMC driver support for
AMD 1Ah M80H SoC")

> 
> You may also want think if you can somehow ensure similar problem would 
> be caught during testing of a next arch patch (but I understand it may be 
> hard for a human to pick up anomalies out of all noise).
> 

Agreed. Testing can't reliably catch it at bring-up (IPs report zero
until FW/SW is ready), so the practical safeguard on my side is to
confirm the table against the PMFW layout with the FW team before
posting. I'll make that a habit for new SoCs.

I'll send v2 shortly.

Thanks,
Shyam
