Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2049.outbound.protection.outlook.com [40.107.92.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CD129345A
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 May 2025 17:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747070781; cv=fail; b=YuXNwI74OslXw5DQvVAJvGa4wU++GJFKJXj6w9GvarJ5pKFoGJr3dJQ0cqz/lgVOpg7VahPEHiwT1/hRVB8fGoN3L+SgKDvvk989pSMacMoQWLhxy0au3SBlapss5Ne/UmKHEKlQRPZBELN6v4Kg6Hq7CHCnhnrfMma58B8KAh0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747070781; c=relaxed/simple;
	bh=8J4HB+02xoVSncCgTUv3ob7x7o4vwrCvbjMAdo4uABw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FYpN7IQRAU8DzfEsiayhNZpgnaY2Wjb5ovlQX7j+Os3/nAE7gpQMxn/t/ZPQX1gRaNL2z1ZNeK2hT/vVu6LlNWcbdxHzIFNES51VYMGCmlCbDL8QhEjZngC1vK3Q8r/ZQPcv/X4rgAK6+gfAxzOg8IE2T7H5+mZ4Hei7ViLhrmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=M9VJENVN; arc=fail smtp.client-ip=40.107.92.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="M9VJENVN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zCHS0bO5FFyEWYkkyf9uPLbGaLURu4u45xMOCiCa0PuLqsFtGEMCj6I7RRbBoE0uFBkKqsBTlAlVILEFWFyi8DmsRHe0Cknqj7wX336K97lhpgRLCqyeQ02MiVRvpe0JpV9p1HHOn6uTLlwRVX7R1gdcOIrQjCzjZTVSlyG8VYIFWx70V0+CsJpNi5G8t8Hw0cxntoeHM1Jcp9HU54ceNxW3Qofg6HixMaJrRTtQBqrGRCOPmDcqw5vLWQmxEH/qHacD32tkekEWdoIzM5Z++XqBodO2tylkRcdqvIEA5eiksCpaKCKs5ER3DieTeEoSruzjPhtOomeFTnKEKjKpAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N5Bn43nHgbrYisoAklSK+QpVdJKBTt7seJLfCsZS8hs=;
 b=ZanJIhWTYlioH5WS0DDTjgChq09BZnQi6AHJF4Wgu3FpwP8nqjRScGdcEnPpMMZ4YrtZbDIRl6v4rR7J0llvvPeW2nKQWNL1JNMgTI9TU3hUcR2xTChI5LfHJHJLb0F9oibX7D4zyDI5uAfkLlknBSKDcBwl3tK/2phEE0natGt629HiBFdMv9k66Xj4Fuwl+F/2CPCFMhtgwl8WiLHrurilIaTB6/Pc2+QG9YN1eQe4pnPxtcXClAKPAjQfJy2/7NwijnXUww/03+aDJVjNYrsYSaz0JBT0Y3GC0YKqvGLKr2G9BlykfxAlN2zSO8OaVLrDwFUcfJr5c2b8dO384w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N5Bn43nHgbrYisoAklSK+QpVdJKBTt7seJLfCsZS8hs=;
 b=M9VJENVNOY5tZkclm34DB7wmJLkgEDFI0YTYXpCGxhnjysN7fpUlcm8I7+J4DcRRnlexg2RkKxXETJjQB5nhlZJE2f5+PLm03ABksv6XwiybXRJgfEEzos0O9MYb6eSt3Lzys8EJ2letIvPgZXHaDHKw5X5Rf2WgVqwAy3uGfyY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH3PR12MB8329.namprd12.prod.outlook.com (2603:10b6:610:12e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 17:26:13 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.8722.020; Mon, 12 May 2025
 17:26:12 +0000
Message-ID: <78abfbd5-5424-4a5e-8a4e-f93e9aef7948@amd.com>
Date: Mon, 12 May 2025 12:26:11 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] Enhancements to PMF Driver for Improved Custom BIOS
 Input Handling
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
 Yijun.Shen@dell.com
References: <20250509072654.713629-1-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250509072654.713629-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS0PR17CA0016.namprd17.prod.outlook.com
 (2603:10b6:8:191::7) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH3PR12MB8329:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fa63325-73cb-4c35-d761-08dd917a17b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WjQ1d1lWTit2ZllrTW53SXRjTU1yVnpVVVJ0c0lHVmUxdlNSV0xGNC92YXhY?=
 =?utf-8?B?bHNIK1d4ZHdTWjNmRmhoMFpEQ1J5RHdHeTdDQ1lzQmdGSVo2UW1BNUZ6ZmVo?=
 =?utf-8?B?ZUwxc1pRdWZ3OFlEYXA4cVVRekRSNE1yWHRQM1VRNEI3WXkxNW45RlNQMWVV?=
 =?utf-8?B?LzV1dFppc3dKM0lzaGY3ditmcmVGOFkzV3pJTDM1ZzdOY2FudW1NRE1Rd1hS?=
 =?utf-8?B?dGcydi9RckhFczNZdWg2WkZGWVRQNXhFZ3B3RkhmNFpSc3FFWEtEM2VZRE5I?=
 =?utf-8?B?RVJHUU5wQTdqOUZzeFptNTg1V2VoMjZwWVVzc0NzTEtXWk8xK3FpYWIzcUdx?=
 =?utf-8?B?djc2SzJ6anRJU09RYXZYRnNYUy9QWW55SERTTUV2bkR1RmRzZjdjaktZNjl2?=
 =?utf-8?B?bHROL2pna2hQWFBuM1M2MjhtRW9PNUtRUnh3eTBubHpMYUJCN3VYdUpqVTNC?=
 =?utf-8?B?V1p6TFlXbTgvSllEVVNyMFppWVMwS09sWW5GWXdTRHBFU0dGWWV3bEJFRXVG?=
 =?utf-8?B?WnVZa1J0dTJldDM0eGdwMWhTQ0xkTU15c0R0N29qTVBMMGJ3TU9KQmpiV1hu?=
 =?utf-8?B?UUFmZERwVlVYc2NPclNTdVNwUE94SmxIRzhxTlVDalluTlVYMjFoSnRxQnRR?=
 =?utf-8?B?QUdzcEJvYjBPaXUwOGN2bTFPOTBQZ3hsWXJqa2Q2RjlBTXE3TW9KcmtOZEgw?=
 =?utf-8?B?R1lINS9VbDhtQUdEYnB6RDdtOGE5QWZpZmlhRllsaG54TEVVZWszWjMrbHhW?=
 =?utf-8?B?MjVqL2Y4VzZ6TXhGeHFNcEJocHlDK1FQcDl0eEwxYWJQbVYyVFhwTG13aEpL?=
 =?utf-8?B?aGRzRUs5RjZjREE0ZFB3N1NlemIxcmRDSC9NbXk4eXFNUmtQd3lNWFQ3ekd6?=
 =?utf-8?B?ZklaU1M3dTY2QVRFbDVUc3RhT2NkKzAwcFhOM0JDNzV1TnMyTWpWYlFraVZz?=
 =?utf-8?B?S0FWZ0JiLzZJaHZIcEN2Q2gzRkpQK3hWcEtwbHFXS2Jsbmd5bXN6cGVUV1Bt?=
 =?utf-8?B?a2dIWFpEUG9MN0o1ZUhZbkVOZzlpTVYrK01pamV1UTA4MWg4UlRTbE9OVG5s?=
 =?utf-8?B?ek1TRkZ0L1ByMVdwMGY3S2xtVnZwWnpCMXE4R0VUcG9LallpbkMreVB4MDlO?=
 =?utf-8?B?OU01bDNRRzZ4cC8yNlFla2RoSzFlQWdMQ2J4SFY3Z3lNc0VQL2d6c2FZQlNG?=
 =?utf-8?B?VVlobGlBRFVQdHdtQzNGV2oxc2draXJoVXZmYjA4SGVmcEdIWFBBOXg0MUlq?=
 =?utf-8?B?Y1lmVkUvYmdjc2t5NDV3ZmUxZE9XdnJGRkxhVTJsblFmYWpPcndyS2c4Ri8w?=
 =?utf-8?B?Y0x0dzVYajBLbWcwOEp0NEFtRnB4amMxb0x5MDNxWWhIN1RLVk91V1NEa3ov?=
 =?utf-8?B?dFAyRklNalJDdUFrMGx1aGlaS3FoTWNSNUZ0NEtHcTI3YU1kUmFRaEczZlY1?=
 =?utf-8?B?aDBYQjZuMU0ySEx0dWtkdmszaWErWkRmYjc3NFpzaHg4eU1QTlpmS2ljUjhl?=
 =?utf-8?B?TERZdTRUMzdNZXNPNURWS0pRc0NTR1QwcS9aZzVkSkllaVM3eGR5aU0rTWQ1?=
 =?utf-8?B?bVBTdnUwb3VDYnVqbUlaMGtIcW1iMUMzUzNnUW1hbGtEZFRUTWF6VDlnSnVE?=
 =?utf-8?B?bXZEWnNvbWhReXJ2TUFrS2IxNDJ6b2g5NVBDTCtEWU9CV2ltMmZKd1phdmJ6?=
 =?utf-8?B?VGVOWmcvNFNLTDlGcFlYTUQrVkdJUzlENm9JRDBzakxhMm9GdzVwWmVXaDNu?=
 =?utf-8?B?NmltZVgrOGZwaTZSRkhvUFFkbGR6RTROTHBKVTZmTVNPc21rVHQvSlNjVXBa?=
 =?utf-8?B?RzNKd0ppUGhzQWxOZmkyU2NMMkFncWF3YU9Rc0k2TjdZOG1uNnJTSUJpREp1?=
 =?utf-8?B?c1NxbUxwUFlZQWsvcThRa1ZDeFpiSXFUYnpDdTNLR2ZBZHc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3dlSjdZcXNtTUF4emx0eUNvaDNCdjVaVHpIdFNDMXdxajM1bm9COTMrc21W?=
 =?utf-8?B?V1ZxeTlrSDc1VTdhUWN2Ny91WU91dm4zM1RSQVhFdlp4bHVoWVBrTWVDcjhB?=
 =?utf-8?B?ekRKTGJCU21ETUNSbHcyVVNhQTExa2xHMk9MeGJUelJiVGp0S0lTRlFzc0RS?=
 =?utf-8?B?a3hNU1V5TUErSUxZZWNjaFFaai9RVFROeDQ1c0V2L3IyMDM2dUJoZkhFMlFP?=
 =?utf-8?B?UjNYeDJMdWtLbW5EVzhKWmZVc2tkc0FRNzYvUDZQQWp5SGtlZ1hZVjBSZHVx?=
 =?utf-8?B?ZU9rMmdLamczMzlzZXBMRnExc2lpcW82byszeVMwRjkxNC85dlIxWlhpSjl2?=
 =?utf-8?B?Z0wvZTQ4cWFUSU92TVBSc2w1OU1Ebk02VHBGL215aUl4UFlhenQ0bzVOVzBR?=
 =?utf-8?B?azhkZEZZbGRjYjBtdnJrd29SNEEwQ1pSdkx3RkZ6dXMzOXJram03M3RDN2F1?=
 =?utf-8?B?WWFXcjVpUGJ2OWFETTN5Sno4L1orYWFmRjJKeGhJQlhTeVVhSnIybXhSai9S?=
 =?utf-8?B?WUprSU1wQ3RKUnlzQVRuY3grbWs5djhVeG1wWDNob09SZEliTzAvWmhrL0Y4?=
 =?utf-8?B?RnZON243K2ovd0ZEa1lTQlh1QW9HSFFnM0VoZnd3clcrSE91Uk9wVWVKaDFR?=
 =?utf-8?B?REVPWlJIKzU1aVdFdTVDV2tFb1pzYW9KRko1bVhtV2FIN3liSEozY1ZrNDAz?=
 =?utf-8?B?Ukd1amI3YnlqRW9jalNiS2xsdFhMekZ4N3YvTGdFeWFqQUhCOE51YllvZ28y?=
 =?utf-8?B?eVArd0J0ZVY3b2orNmpNczdzWGxsVkpzd2xTUzR6UXF2SUg3R28xSDJ3d010?=
 =?utf-8?B?UndRd1FHU2JYYjRhM0JmK05aN3ZFczd5TE5OUnBBVFhobWZIY3JCS3JmK2pV?=
 =?utf-8?B?VTFLa1FHSm4vNk1rWW5UUFJHMVR4OGg3cnphTTE3TjlqOWM0NFF2SnJjS3Fu?=
 =?utf-8?B?UzUySWovYTRTZElqcmtLa2ZwZ3NjcEhjSUFTdzBEQmdERENhN3k5OHFmaTJT?=
 =?utf-8?B?MURwWlFad0lGK2YwUUp5Q2hSZUNBMWI2eVJWbnF3T2NCTU5DcW1jU1JUVXlC?=
 =?utf-8?B?dGZNOTRFRmN2bW9KN1NJZkdHUXpEb09PYlM3WmtTZGdRTW5MZHZlZXE4cS95?=
 =?utf-8?B?N3lVckMxMmdXa1p3UGxCdEt1ZW5jQ2s2VjVpVExoTUdXM3Ayd3J2UlJJaE1V?=
 =?utf-8?B?Mk9wZWFiVFVwQ2tNbDdhUTZ3QzJ6dHJWSXB2Vk1yc0Zha0FsVWxxZjlZTkFC?=
 =?utf-8?B?TldaS0xmVmxaUThDcGFzR0dLdmJzL2hDQTdZQ21qalNKUDVodXAvRGNlUnJW?=
 =?utf-8?B?MUZlVkRkbHZKWlBzaG9QNFE5RlhnbjNxVGFBaXIwRmpadFVMWlRzbHIwQVd2?=
 =?utf-8?B?NWx6a0x5TFRQN2JqQzJrTHJUY0dNakZYWHZNTjhlc3g4RUM0MWplNmdWdlJK?=
 =?utf-8?B?ZFR5TmdMNUR5SUVCVnZsRVFtTjc2dDl4a2tSSjFINXRsYkhBT2pXS3ZUTHBp?=
 =?utf-8?B?S0JLZHdBc0xDNmhxdHZPMityc0JySzRoU1QzWmViZmVhdkM4b0RsY0VlSnZR?=
 =?utf-8?B?cndiRHU0b2wxblJHWnFkQkVIK2JEdDZuU201a21lQittaWIzQStub1RuVXlk?=
 =?utf-8?B?WXV3TndJclc5Nk9HaCtiS2laSkZLN1NNVVB3RTFialhsaGRJNHBsVFE4M24y?=
 =?utf-8?B?R2VRUFNvNEtUd1dZa0NTMDNsNitQdTljVmF1YVZVZmRySEhCSlR0UXpHUzdS?=
 =?utf-8?B?VVlmMThBd3N2MEFWUDk2WlRReEdueDYrUDhhQjJNZnZEZnBIcmZhbWRhMTg3?=
 =?utf-8?B?MUtHcXpqTERyNGwrTTY4U3MySjUyYnpaUHdEMzc4d0RncVFuWVhZOVhVMU5Q?=
 =?utf-8?B?WTVzSWY0djBSUkNLZHdJclV6dGwvYWFJc05SZ0R4RXFqNDBjYk1xR2x5MlVw?=
 =?utf-8?B?UkZRMmVsdU1qaUxKcXZZR1dHV21KZ3hWYWsrTmRnR0tuOU1NeGJHMFNDRUtS?=
 =?utf-8?B?ZlZJNUJBb2xUM1g0VWQ4WXY0OWU1R2tJcjcrdlJiTmZRYXYrZ2h1SE91MndX?=
 =?utf-8?B?YTBXKzZFMEJiYXJwa2wwUDEzWkpLc0ZBYmlvUnRnN2REcVJkdVZFU2ZuODhz?=
 =?utf-8?Q?PsMpds3x04P6yCgOE4k7w2VE6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fa63325-73cb-4c35-d761-08dd917a17b3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 17:26:12.8276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BzNc1qVO7loE7ghkOOzNNJUcl7PI65fSD+l/y5IuMooAxiHs7Z1gaZD+H3mspzWG0/mdKusx42uCasKyidzn0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8329

On 5/9/2025 2:26 AM, Shyam Sundar S K wrote:
> This patch series includes the following changes to the PMF driver:
> 
> - Implement support for modifying PMF PPT and PPT APU thresholds
> - Enable custom BIOS input support for AMD_CPU_ID_PS
> - Add the is_apmf_bios_input_notifications_supported() helper function
> - Correct the handling mechanism for custom BIOS inputs
> - Maintain a record of past custom BIOS inputs
> - Process early custom BIOS inputs
> - Initiate enact() earlier to address the initial custom BIOS input
> 
> 
> Changes based on review-ilpo-next with tip
> 'commit d430124bac58 ("platform/x86/tuxedo: Add virtual LampArray for TUXEDO NB04 devices")'
> 
> Shyam Sundar S K (10):
>    platform/x86/amd/pmf: Add support for adjusting PMF PPT and PPT APU
>      thresholds
>    platform/x86/amd/pmf: Fix the custom bios input handling mechanism
>    platform/x86/amd/pmf: Extend custom BIOS inputs for more policies
>    platform/x86/amd/pmf: Update ta_pmf_action structure member
>    platform/x86/amd/pmf: Add helper to verify BIOS input notifications
>      are enable/disable
>    platform/x86/amd/pmf: Add custom BIOS input support for AMD_CPU_ID_PS
>    platform/x86/amd/pmf: Use amd_pmf_update_bios_inputs() helper
>    platform/x86/amd/pmf: Preserve custom BIOS inputs for evaluating the
>      policies
>    platform/x86/amd/pmf: Call enact function sooner to process early
>      pending requests
>    platform/x86/amd/pmf: Add debug logs for pending requests and custom
>      BIOS inputs
> 
>   drivers/platform/x86/amd/pmf/acpi.c   | 60 +++++++++++++++++++-
>   drivers/platform/x86/amd/pmf/pmf.h    | 80 ++++++++++++++++++++++++---
>   drivers/platform/x86/amd/pmf/spc.c    | 51 +++++++++++++----
>   drivers/platform/x86/amd/pmf/tee-if.c | 19 ++++++-
>   4 files changed, 191 insertions(+), 19 deletions(-)
> 

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
