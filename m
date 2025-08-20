Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022109.outbound.protection.outlook.com [40.107.75.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0450C4414
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Aug 2025 11:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755687672; cv=fail; b=nvpWejPdgbSooIp2RpLP2hfRyl3x+qTuN2phIxnYjpB6+L6y1ORiDbCUCkSZ0B28ozIcLZQ8RgcGoYwBWPq/698sEavO8gD1etRgLT1OOVSsKndbDpTyO0Mr0evWH5w/NMP55T/32BLI6ACkyVNbR/peF6f8YOaGO2ClKxTDR3o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755687672; c=relaxed/simple;
	bh=vBkQPHCLlhsEHGceWAGx/h7xba4gZeOmP/0OHdLdRYQ=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=o3kU2L4huYl8bp2quFujMEeNwTchYzg3W7GV/aLw2l5YCcJntRdoEiW6XZa7i0yqERT8QrmiGh4vznGmcBuAZfdTg5zCgSte8DQt/vBsNo+OSD5EFM9puleYm45ToIpAEJEenpRhiN5nuWaBPV4HF3dHF7pxkdFdDUjCtZPLM9I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw; spf=pass smtp.mailfrom=portwell.com.tw; dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b=KcsOEnxw; arc=fail smtp.client-ip=40.107.75.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=portwell.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b="KcsOEnxw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u80Tq4cJOUkG2dVYluJQx1HLr0ZRMjIpJLgMCm5zZ+yTzUGDbKtLo4iY9GCloYLP4WiCRRv1PvpJ5exm9PkHCND7fwP1dYfflTRbk1PkZmeeGsphjLUJiTaGzspUZ0O6EK0/vWRQbdDQK7hDzSQhD3xbB2jg5aj6gCEITKExokZ+keazmMnc0KWsDRnoDdqTu5puAbHO236orm0hAydJQ7q60dejCwFRBJYDg4AU10QXDdQ7c8tcTZK2D9L8fLB8TCFh/pTD+tEg1mkKJ7WDRYSvuYOaZuPcbFyhH4FPDSm0azPD8b8fJkctUdQWsNpFIRuMEY6EWLsTHE4IdhrMAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vBkQPHCLlhsEHGceWAGx/h7xba4gZeOmP/0OHdLdRYQ=;
 b=hTSwSNieoR507rWqgPBk4jvMxIrjNe6D1oaKTPWm/oVBF39Ql/XlYa38EEbZr5svXUk+KzJ8SmTpxX2hif7KhVROpMriJGgLcaLIieyQoGCnj2KjOzlJQMfsxUTGuFKESJMXLUreNknpQodm/dDOBdDN1QCGCC52YTrVSwD4ZFiAS+Zo1Wp4EAd0gb67+jGsw7Tpr2fdpgsG/6uxm2YYequjCGH+tPC9VkEHIGfLnUJF6Qjn2qXsSypW83i2FUweo1yS1BaXOgkkTv+xcP1vpaGbNsjl3Al6hxdH7dAU7H3osDn8BUQrwkx2xVYPY/1gs7hxUSbUlT9fSraY0pGTRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=portwell.com.tw; dmarc=pass action=none
 header.from=portwell.com.tw; dkim=pass header.d=portwell.com.tw; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fetCA905017.onmicrosoft.com; s=selector1-fetCA905017-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vBkQPHCLlhsEHGceWAGx/h7xba4gZeOmP/0OHdLdRYQ=;
 b=KcsOEnxwH+6inUKlRaAOsJOeT9kUxBdyXeNYfgPo2xtB327NtvqDiWurZqpFzaDgYUVYafdBRdXck4JhDDCdf1I6rQj/4yJeoeoCEutvIF0L2Y9/h3yytVNXASCSFVamBFWNnVkG9FZ/Wkslabtm8OSsM2M32dMF6dbHvRmz+g5BEAYzuwcWJGTmvmsAaA/7UGPoLiFnx1LLFJgZI02yTmC3gFCogmbj8zJKPytWj+v+euLmTEZwNEMbhzPw3tyXbAZ96K06kdsjqNSWIQLFjuan4x4i5q93snzfsq08zJTW5oceEX9HB2NYyITLigBV3H7JTnAuOu8Q7BPd/cOtjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=portwell.com.tw;
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com (2603:1096:820:e7::10)
 by SEZPR06MB6532.apcprd06.prod.outlook.com (2603:1096:101:185::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Wed, 20 Aug
 2025 11:01:04 +0000
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224]) by KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224%4]) with mapi id 15.20.9052.012; Wed, 20 Aug 2025
 11:01:03 +0000
Message-ID: <8a7b3b7a-12a0-4771-b38a-2680e09b0064@portwell.com.tw>
Date: Wed, 20 Aug 2025 19:01:00 +0800
User-Agent: Mozilla Thunderbird
From: Yen-Chi Huang <jesse.huang@portwell.com.tw>
Subject: Re: [PATCH v2] platform/x86: portwell-ec: don't print superfluous
 errors
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>
References: <20250813191416.6860-2-wsa+renesas@sang-engineering.com>
 <ac110365-e631-4182-9936-c346d5c05f1c@portwell.com.tw>
 <85b8b88c-de22-737e-0fa1-827376116d06@linux.intel.com>
Content-Language: en-US
In-Reply-To: <85b8b88c-de22-737e-0fa1-827376116d06@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0043.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:7::11) To KL1PR06MB6395.apcprd06.prod.outlook.com
 (2603:1096:820:e7::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6395:EE_|SEZPR06MB6532:EE_
X-MS-Office365-Filtering-Correlation-Id: 02679494-c72a-4cbe-eede-08dddfd8dae8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NFY2aW8zc1RoVTVldjU2SGNGVkMwd25PanVHMUg4VktZdDdmY1NKSjdMVWRC?=
 =?utf-8?B?ZHMxZzh4ZkFuQmlYVDl0NDFXM3dWRzA3aWVRSExFZFo2OUNhYWhTWmtpT05C?=
 =?utf-8?B?US9sbG5ZTW1ZbS9mODVyM2JLZWE2d0o4UTEwMzA2TlFsV2VraElXNCtKdzE1?=
 =?utf-8?B?bHFuT3lYL2R1WjRlMDBFYmVJVFd2TUVhZnNHMG4wQWZQK0pqUG5LOGIxMDFN?=
 =?utf-8?B?dXhuWmtmdytrZllpejYybFh0dllDTE5Senl6R3dFY0EyZjVIN1NjckVmQWhm?=
 =?utf-8?B?dW9WMWtSdjRMdkd1RXhPZGE4WUttMi9CeGoyOFVjckMzUm92c3R6amYxd2Jz?=
 =?utf-8?B?Tm1rU2Z1OFR4OVVqbGZVOGF0UXF1NVlUTWI1dUdkRklWeVdNaWR4SGNlTXhM?=
 =?utf-8?B?ajkrY1pvdHR4b1JUbEhCdGtmVmxlVjl1NkliUkRvdTkwQnNmOExRNW11RDdV?=
 =?utf-8?B?ZklMaDU3VTJNTDFWbU1zN2ZtdS9Cc1NvOG00L3RTTU5qdmRrMUp1TWRkMWpS?=
 =?utf-8?B?ZE42UjlWRzFSZ0pVZHdyS2lTN0lhUkNYbVg4dHpiMGY4cUpZRmI2cXVOOUpD?=
 =?utf-8?B?ZnpUQVhiUDRtRnpVSWFFaytaOWZlTlZZdjZCV253UXJncHcyTmtvNUs2TFRk?=
 =?utf-8?B?OFM0RmQySTVrWHdCQkgzTXhLZ1A4YlJtVzYzcnBwMjE0SnNVcWxYNEVkU2F0?=
 =?utf-8?B?c0NjUENQZzdPaW10QXdhb1NFVmZQTzM5RGV4NDJNVE4vM0g0bW9DSzlzWWI1?=
 =?utf-8?B?ckZVeE5ETWlSWjZrQWFJaktycXc3eGpzRzN1TnZ2Zkh2WjEzZmttSk9EVVBj?=
 =?utf-8?B?WW8xSkUwUUR2ZlVvOXl1SVBUM1NZS0hHbWRmNDJYZlRJdzdJVmxjcW9kUWZZ?=
 =?utf-8?B?MVAyV0xPaHhvcXdrcEI5bUdTWXBnZHF5QklTSmpWUktnOFgrdTM3QjBhalhE?=
 =?utf-8?B?ZFpJajREODBhYkR4RURVZlhoRmtvTjYwN0pDR0hWSlRpTlFRek9pUkowZmpB?=
 =?utf-8?B?aW1uYTFud3hjeVpFY1hWVmY3MjNxb2FSRnE4T3FwSGR0dVRXQ3dMOWM5eHN4?=
 =?utf-8?B?M2MxdDJwb3BZajZZODNiZStUVDUyWms4QVNxRE1kQzdnTWI1WkRWMTQyOXNt?=
 =?utf-8?B?WG56emtHQXhaZHNTcXEzSkRhK1JqWGk5MUlNM0tadXNqSmZZbTE4RjY3Ryt1?=
 =?utf-8?B?MEhnODBQeHhOTkV5cG9jL2J5NGwzUGppN203MGdJSTcxUTBuYWJMZFdmaXNZ?=
 =?utf-8?B?ck5KWHBjMnNHQU9VdkM1NWRlWGtrWkhFU1k3TEJZWUZUbTlEejlYVEVzS0wx?=
 =?utf-8?B?dWhTeVJiRm0vdWxvS3BWeEFmdERNRW1wcW80bnh6eDhlSWwvSy81MFZENTVa?=
 =?utf-8?B?MllabGw1M1BpckUyZHl2N2NGeUkzbkJuZ0xPMGw2bVVXMEZuRWx0ZUJpNkg4?=
 =?utf-8?B?NmlRL0swVkRiWlRDeTcxWXFFcnlnb0FZNS9PaXQ4SEFzVnUvQXNNdVE5b3hH?=
 =?utf-8?B?aFdMKzczTUNUUGJES1hlTndHVDJmWGhQejc4dSttZmZMbi9LQUM4YjBIMjZ0?=
 =?utf-8?B?RnBEeTN3TXZQU2Fsdk5QZ3NhOXVreitHSHNHZHYveUNuckg4OUZNK2kvY3My?=
 =?utf-8?B?Q3NyTzBra3JqL2NuVms5QWcvRWZmQU5WVEkyMTJJazc5SjhhMWNBSEcwQVV0?=
 =?utf-8?B?WDNDZXNtV0FVSFF1TEh1Zlh1eWZjWWVOczJlUEdXM2J4bEdzcmlmZUNHcW16?=
 =?utf-8?B?L0JxbzcwQ2pvNU9CZUpqTnBERWJjaG5zVWluRnJxTTRkRno2ampER0k2NTRI?=
 =?utf-8?B?K3B3QkltY2VGMTFaMVJpcmFSYldTZ0lKRm5YbDk4alFqNVJiZlliKy9FbVNL?=
 =?utf-8?B?RzRzSG05ak9FOW5OUGZzK0dkcTBjWWV0U1BiVW1VL2hnTXRJRlFzSHBveGhC?=
 =?utf-8?Q?b58As6Eeis0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6395.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S09hcHJiVGxzQU1QNDhMbkwyYUZQazltblBLbWd2anRsUG5DWUsvWjYwbHZi?=
 =?utf-8?B?Z2huZXdUcDQ0MjBiOWJDVFR0MDFMQUtKRVczb054UjZKZ3lmcDdFWm5TcXJO?=
 =?utf-8?B?MmlsMkcyMmhVejVDNS9TTU1YUXpNZGdJbHl4NWgwOGtUQ3REM2xmekFhTEtU?=
 =?utf-8?B?S1VOZks1SkxJN3VpY2RTYnV5ZFc0WGZxRGZ2aUpjVVZYcFp6L0RlVURGZGlo?=
 =?utf-8?B?RitPK0VwdEhHWmdoTEZwRHRZNHp6S2llN3FxS3NYU0lmaSttVnpmY0laRFJs?=
 =?utf-8?B?YTREL2p1eDd2eVNFRWsrWEdEU3NIUTQxRGVremNSTko0bWs1b1ZhM3lFSEY0?=
 =?utf-8?B?bitIRnFlU1NRaEdyalIvMkJweExDL3I0RDd2SHI5eGNYa1RVdGl2VXdQU2xM?=
 =?utf-8?B?Zis4d243bWVGVzJQdmhSOXlEbWpoanoyeTc0ODI4OXFkMmhzeHJoelI4VDdQ?=
 =?utf-8?B?Y2FSbGRmUVJzUitWRndjYTRIeld0YmFXdGo1dWpQcHFEdUdDQS9tK1ZoTDBo?=
 =?utf-8?B?SVhod1dHdlQxaXVkSWxjZmEzR3lHRnBtMldiYnczTkxCMGxyR2NjdlJTbEZz?=
 =?utf-8?B?TTNWbUV1c1pMSGYrMVFZb2dNUU5OYmtQM2c4NllTNjQxejVBdk5oYTRVOHIv?=
 =?utf-8?B?bnBia1c0ais2aTQrQWVZNEMvOVVSeCtTYjFpZlR4R1ZjbmY1bW1DRHlha1Rk?=
 =?utf-8?B?L1RNRW9tRUlVY3JTM1dGUzZzZmw1N0pyTFY2TXlKNTZwcExVRDhiS2M3dzlP?=
 =?utf-8?B?blU3Ti8xdmJLM1pMVEE5WFIzdWhGdmxBZWpFMVFlMStKUG1BbDh1dlhCd1BU?=
 =?utf-8?B?MlhLV1dpd3hjZEFsZ1pMS0RaRzVkdjRIcjJlMkVVUkxjZW5FK2Y2OWRFOUd6?=
 =?utf-8?B?M0tCNXBYaUVhL0p3ZjdGNWFsUXVzT3JnSkNSbXQ0bENiZ3R5a0dFZkVNN2xB?=
 =?utf-8?B?YkwzU1VVR1kvY3o4UFRHbGk0cGUrOFVzbFdHeE1yS0hVaDI3YUgxK2Z4OUVp?=
 =?utf-8?B?TW1icExXeTlDeGJkOWY0Qkp1OUtWLzc4aHg1RFp3eVN1NmVXNlE2dy80SU1p?=
 =?utf-8?B?VXF1OTREeHN6NWtsdWZJZ2IwQmI0ZDEra2NNR0Y1U2lVRjkyakh2dHZpOTBD?=
 =?utf-8?B?dXh5Tjk5RUJjbytoa3NQMW1JZGp0QmR0Z0QwMTgzeUtiWjBiYWgydld2WEdW?=
 =?utf-8?B?UjVrUFk3OXV5ZStYRFF2YVlFaXcvNjY0UGxjUzFkMWpYQTF2N3hEYWh2WFJj?=
 =?utf-8?B?aE9xYVY2T3czVXdMSlcvQ3JJbkpUOXAyRWdBUG80TFlTWE9VdUg0aVplZWtM?=
 =?utf-8?B?RFFpdHlXdllTNHhBQ045R201UlZZdUJTVW56L01pZUJaOVo2U0ZabWNqbCty?=
 =?utf-8?B?U2xQUTZsbytvZGtjZFpYK0ZyMkNwVWNZTENONDdzNVRIeTJPdE4xUFZFT3RB?=
 =?utf-8?B?QlpMZ2VGNkhEOTdONFk5V2ZuOGo2M1hhMkM3ejZ1Qi9HYlhhYzJjSS9tQTdE?=
 =?utf-8?B?MXk1N1puc21TdE54OUVpMm1vb2JGcmdtV2NoUGZCZStqNStjQ2dnaEdJc3Fw?=
 =?utf-8?B?bG1QYUNjZHM3MlVWYndtTlNybGxuWkIrdmthM1B4M3N2UlVnd2FUR0Z3c3pF?=
 =?utf-8?B?NDNNeDRWSGxwMUJ1WGsrYnVnNVhzR3lNZWl0SVAvNGxoSERVaDZCdlo4TWcw?=
 =?utf-8?B?SXFPeWErQlpOMGR2ekVwVXFIeHM1U1NUWWhRUU9GWHJIRXpFcThCVjNvcmd6?=
 =?utf-8?B?U0I1QkREWmFuZ29ZRU41L3JrUXljeTNyV053QnNzQjBXcWFKcTNjbkcrMkJI?=
 =?utf-8?B?bFVHeGY2UXpJUlg3SDRINVlZL1ZuUU5SbWY4dCtPMVRjWG5QL0FhVVlnZm9s?=
 =?utf-8?B?YkxGZXJCeWdXRkxwdExXT0llK0JLc2svUDNDVEFDaXNBU0hERkthNnJZMjlh?=
 =?utf-8?B?Z2lmYXJuc2QzYVBLU0hRWnlMMkFQbHB3Ylc2bkNXOEVaTldrSk1RMGlCOHZO?=
 =?utf-8?B?UjhVQi9qMmpNY2RYaEJ2cmFjYTVLQU1YLzBiOXpsN1VHSmFlWGRSVmhLc1Bp?=
 =?utf-8?B?Q0Fjay9TTlJoOHdvWHlueWtXM2lrbW1FMkowMVl1UFQ4TXFMbHRpaVlGU0I0?=
 =?utf-8?B?VDhBdzhhVE9PWVQwUHBPWFlqMlFKRmswYXZzYlNwNjhzajhOV3RoTi9qa3VO?=
 =?utf-8?B?SGc9PQ==?=
X-OriginatorOrg: portwell.com.tw
X-MS-Exchange-CrossTenant-Network-Message-Id: 02679494-c72a-4cbe-eede-08dddfd8dae8
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6395.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 11:01:03.8518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e309f7e-c3ee-443b-8668-97701d998b2c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NckeTaRtIXQoewYYqPX89smQzMv2dd28P6rOx4rs1rT9RWzgOFuaUOdz/Tfq/23BrGRNQZ8FYLYglmqN4RB2Is+eDR1EquHN7TaN8Aw9/l8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6532

Hi Ilpo,

When I replied earlier, I thought Wolfram's change was correct, but I had
not yet built and run the patch on hardware, so I did not provide any tags
at that time. Thanks for the clarification about the convention; I'll keep
that in mind for future reviews.

I have now built and tested this patch on NANO-6064, and it works fine.

Thanks Wolfram for the fix.

Reviewed-by: Yen-Chi Huang <jesse.huang@portwell.com.tw>
Tested-by: Yen-Chi Huang <jesse.huang@portwell.com.tw>

Best,
Yen-Chi
