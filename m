Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023099.outbound.protection.outlook.com [40.107.44.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B53308F10
	for <platform-driver-x86@vger.kernel.org>; Fri, 15 Aug 2025 15:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755273043; cv=fail; b=tWk5pFPv6af65sQOg4IkzNo47+T3xHz1B6z1ZFO6lJoZHjp96QKs0+NwBeVM3HasNXarTThipZo27iOjvuFuIaIxKJ2liDoFR5FKrMszF953PfdZuN/SfQ+jfB+qw+UqA4Ogt6M5mR75z1q6j4lKVeaZ9ixOxQG0YuyNTDpYJv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755273043; c=relaxed/simple;
	bh=Wtslto3G1uvdySucwzjFzbqEvOEdHI9muQcs/2E9pFU=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ryWORXhsSf8wb39Tymz5TJuNBD3kqzyrVW6gyChjeEjDfEf3JDsmYON8mIOXNbYJaNwtjEPqCKVczaEuhw6G15cOtDhdabr16mqRLlukbr930FbVQ8nzN2mZ8mk/xirHKO65aVqVkXx8pGMECWDlYhdhy7MBfCdqINNlNhkt4Q0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw; spf=pass smtp.mailfrom=portwell.com.tw; dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b=kcw46qIl; arc=fail smtp.client-ip=40.107.44.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=portwell.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b="kcw46qIl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TOsHhrCGw3dFpti0QwgdmA7BMgB2zcsNB7h7mLbGL7mQH0yUfsn1T5GovxG+05G0QzGr3YK00j4myPvClN2h116ResWamGhNQBt+dC/oCLnNRInITuMSM+tbaMNUoUBKekzLZva/RPWAv0icrmZH4zwkSIRoPmrO4XlEEwPgsUXiQ6RRGD2YPi8qdcgOI7iMQCKQnAIlHurbFgBuUzAggCSQf4TXdVtbOR3PZM+9ZCiBD2AT7s65ZadNIYXSLYYy+xSSH8TTfx/jesDzPebw6TmLPOIziRTEofjlefkukhQbOlmqViV3scCLl4K9Ig29kg5byURLgYNkEgcStXi42w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wtslto3G1uvdySucwzjFzbqEvOEdHI9muQcs/2E9pFU=;
 b=kHTrN3ncciThrSb11FUgG/jPjHaVn7mwLMC7EpYQxdxXMFJUuspDALur+FEH8V4CtHKabwCXxV0tPvQ8JfD1A6q0BwVFTteqGji+FIgeJma9oo12Ij9GzRJuqlI9DCsrMo2b26Mmm3HEnksgSXwnnssy2x8PNsXDXmQns8eevZd+wGowNn9FhEky425QTq6osf1MiR+XusY9j5J6QZlykn9opMBphiABXRj+4Kg5sxYCB4Pqw0UqJF2XTGWSWQjdvqTOdXO1GJDk5JTg1tqirU2KSxzaOmJv7yzEBjnokRta5LW5e/Pa/XZfLCimtnXdkDokT/+oGuEYXxPwQ8pJCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=portwell.com.tw; dmarc=pass action=none
 header.from=portwell.com.tw; dkim=pass header.d=portwell.com.tw; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fetCA905017.onmicrosoft.com; s=selector1-fetCA905017-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wtslto3G1uvdySucwzjFzbqEvOEdHI9muQcs/2E9pFU=;
 b=kcw46qIlKoTvNDvZfWGCJNeZSyV6flz9Ge7CLoZlEcxuPCNKFgmdMusc4k7dDABvnUMMDfVRahqYj+EfE2TOjaPX8MhSt0OPboPIFel1oaQapo+h2X2bF8uw93wiFApdkXU+F3HptKDkma7WqZBgUzW0UhL5P2s57Crt3y/Tk1OpRsqFbCoeBOLZqlHFmSOAzeouoeM2Sfk8EV2PXv4yI+0ESlfo0CWPJUX1DLBfoF/zGXfuvRk23mQtmmJja6Er9fQX1bFFMw7E14QH1okHUtrGGilIDZZEU1oJRiRWNaHdPEu393Dx/82tlz8PFMNhlgng3bJgdKuTg+iTnGx3nA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=portwell.com.tw;
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com (2603:1096:820:e7::10)
 by TYPPR06MB8103.apcprd06.prod.outlook.com (2603:1096:405:317::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 15:50:36 +0000
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224]) by KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224%4]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 15:50:36 +0000
Message-ID: <ac110365-e631-4182-9936-c346d5c05f1c@portwell.com.tw>
Date: Fri, 15 Aug 2025 23:50:32 +0800
User-Agent: Mozilla Thunderbird
From: Yen-Chi Huang <jesse.huang@portwell.com.tw>
Subject: Re: [PATCH v2] platform/x86: portwell-ec: don't print superfluous
 errors
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 platform-driver-x86@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20250813191416.6860-2-wsa+renesas@sang-engineering.com>
Content-Language: en-US
In-Reply-To: <20250813191416.6860-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TP0P295CA0058.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::17) To KL1PR06MB6395.apcprd06.prod.outlook.com
 (2603:1096:820:e7::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6395:EE_|TYPPR06MB8103:EE_
X-MS-Office365-Filtering-Correlation-Id: 51dfe328-d9a9-47a3-eb91-08dddc137962
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VTlKYnRWUkZ4dEZVSXpXRlhSSVVuZEZmcUFVcGhVbnErU3hHUzJ1N0RycDVu?=
 =?utf-8?B?SlZ5UWFBTyttYVEvQld4YWluaWdBTXNJbFJJcWpuMFBJMmdPMm54NzlqOUJS?=
 =?utf-8?B?My9OSmNvY1FJUzFZMnJCYVR3VCtBV1JPRURMclpNa1llbXQ0TXpYeS9pN3BG?=
 =?utf-8?B?S0VPM0FsaFlZLzNMbERlOHRucmVqZmFjQ01NR2J0VjRzWHFoNjJkNjlYK3RO?=
 =?utf-8?B?QVc1M2RUSG1oclZhSm04QVZTbVgvSHQvOXkvcWovcC9scmFvamJJN3VRTjhr?=
 =?utf-8?B?aHFMdHlIcGZDaEY0akJrRFgzUUp2aWptSHNpWWlRUEJQUVlpUzZLQ2ZsMDBw?=
 =?utf-8?B?V1pqd3UzZ1MwZitkazZzeU5PeDdiV01yOXlQN0x4eFlYeUxBcEdWN1g0ZkNk?=
 =?utf-8?B?MVdIYWpLM1VIdXFJSDFRbmpoYWQxSmtpRXRlUTdJVHpsQzRTd0kvNDd6QmFk?=
 =?utf-8?B?WmFNTnBWZ1hvU1NOek1jbGVPSWxwd1ZJZVZweGtiNkFTWk0vYTR5TkVkZUto?=
 =?utf-8?B?RVRnVjJMcWlCaE5tck84Nm1ROWJvWFBUb0ZzeHBDRkFvVGR3bmhHT1dNVjNu?=
 =?utf-8?B?NjUzTEttK3FqcGJxMHpiRytPSFpHdjlRakFRWVFCek1MSkc4OGl3Y2EvSGpw?=
 =?utf-8?B?UDFmWUc4UE11UjJuOFRlVlhDRWY4emVqOVBSNFJvN212M3dzeVZoWlIvZEh0?=
 =?utf-8?B?ekxxWjhhSzQ0eHlSeXBNMHErWVR3SlVaU2crSVJMVW5qUkxKSlNJdEN6MjBW?=
 =?utf-8?B?dUdPVXo2dHRxUjlrRHZvMTk2ek9EVUExVkxER28wZG1SRDY1RmR5bDFncjJn?=
 =?utf-8?B?cnJJTEVvMTAxZWpBWEdCd0xkQVpJamFkVDJ5QzBrWmVuZ0dJZWpZNmh0UTRF?=
 =?utf-8?B?QmdpdDhXdnozNHlTZmhqZTAvZVNnSHMvdFdXdmZVcE1TS01nQkEyeDFzWkdS?=
 =?utf-8?B?N0p3QmZPTEZoK0RwaEVxU3NFK2FZc1pvRTdEbkdRcTVYUm1wOGdsUEVzTndH?=
 =?utf-8?B?dzYydS9qc0Q2WlJEeVI0bkZUYXNzNnR5Ym1aZk1qUytobzdEREJKUkFiZmJP?=
 =?utf-8?B?cm5BamljN096bWVBclFVcVpMVTd6Ynh4QjVUNitSYlFURmVFT3hHUjJuSnA3?=
 =?utf-8?B?TXpVQTRLZXZMN0J5QkFpakg3cVZaSDExbEg1Wjg1dWRwM1BuNk1KZksrSHFh?=
 =?utf-8?B?QVRXNmRkNURTSUdEL0ZXYmhVQnNxbG1MMU5tY0NTQXIrL2ZZRkpBdVdLRnJX?=
 =?utf-8?B?Rm91U21ydlZ2YzZ3M0ZGcWJjbmRSTkplaFlLa29GaFRTNjk1QXZXZjljZXBT?=
 =?utf-8?B?WktZZ0NhaG1aaE9wMmtScVA1c2FweEhaaGhDY3I2dWQ0ckZWNlFhLzlFTEEx?=
 =?utf-8?B?dmIxaDduUGpJa3NOczVpZG9IUjZxdGJBaEJQMjl2clNHb1NOSVkyZCthaEgw?=
 =?utf-8?B?RlRhQ3MyTERtL001YTBFd0dSb3ZjL25mVVlCUG5MS1RLaHNoVzZWaWE0Z1hD?=
 =?utf-8?B?TU5Dd3hvZVpONThDRDZsNHV4R3BOZmhSNEg1QWhHczlKSnNHWHNINmJiQkhk?=
 =?utf-8?B?WUJRM3UzYjk3Y2M1SUsxUTRkNnNRbXRjaXBJVy9TSnRrOWcvSVMvVjRLNk9h?=
 =?utf-8?B?YVFwTlRNWFpQakJERzJyS2NhMjJ2eHh0NFhBd3dQUXNGLzQ1UllyRlZtdjlY?=
 =?utf-8?B?UXFhU1pLRnFUT2tnR2QvWWVOTklaQ2kxMlozVlFjdXN1b0ZFaGJzbm93ZGVD?=
 =?utf-8?B?SW0yZkh4Ums3TFQvMCtWRnpHOG40RStaWjV5RG1GaVBJazJWRlNlNmxtZjM4?=
 =?utf-8?B?N2tMNHkvZVJLOTc5RVA1cHJHZUZod0d0OStLeXZYeFJHeVhZMnRKVVVCM2Ns?=
 =?utf-8?B?bytackRFeEVtZmtadFVLVnMyMy9Mbk9aZnZ1MVpLYWpHSlBGQXd4bGFxWE53?=
 =?utf-8?Q?kga+fb3KpTY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6395.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czRuakZIdlpRc01hTVQvN2dhMk0vUDltVlNSMWpQWmNpNnFFNGdDWXV5ZzUw?=
 =?utf-8?B?cFBURWlCanhyM3VjSjMvSlhmYitFM3RuQ1NmSmFpTlYxME9vNWttWCs2NHJ0?=
 =?utf-8?B?VGU3NTM3Y0hMdlN0UG5CQWxraFFlMXpyS0tCSTdTOFFQN2tQWkhqSFdWbkRQ?=
 =?utf-8?B?a0hhQWFlZklkMWhyK3laajhZYkJSWjgxTTJmT1J1TmZWakJhSU83T3pKS2xm?=
 =?utf-8?B?Z21NOENkeTBzeW9hR3NnaWY5VU1RNjZsMXNVeFRoaEtsdloyTHNBMzJWQzFX?=
 =?utf-8?B?RjVpWkdFSDk4TUZkMDRDWGlETW9SUngwWHNLMm5MY2VnV0JyL1hLekQxT1cv?=
 =?utf-8?B?ZE91UG9CcGl0YWJvT242WCtHbDUreUYyYWhVS0RVNFl0MDlYM2E5MkJCMDhJ?=
 =?utf-8?B?QUpkMkxDV3EyZW55TVAxdWVjTlp4eStZQWpPK2RLcXFsckpYaFVQUWJFR1dj?=
 =?utf-8?B?N2F6cmV0bllsV3NWUVBZYzFxNmZlYUpSQm51ZlZlNnRZNXFXVDVZMkpPL0xn?=
 =?utf-8?B?VGFyc3JuT3RJWkhXUE1Tb2trek5KY3JyZHdYSVk3RzhtYU11MDdIZWQvYXlX?=
 =?utf-8?B?aHBuR0ZieVRwcWtyZDRpSUtjT1ZDUEZQTkg5RzNyNEREWllRWVVLb0c5cjFL?=
 =?utf-8?B?eWp5QlR0WUFYd1V2TGFLZDBmK0FQcXZxdkZXU1p0UzNoSFF1TzJTK2g5bS8y?=
 =?utf-8?B?VC9UUkZTS2poU2dIOVhUMzBSZFVGWUw4SXIzZEU2R1d1S1VQaXhOaFVFdTJ3?=
 =?utf-8?B?TXFFNGwzRUhUeXhQWWpBcmx5TExnNlBqWkRyaVZZQ1V5S05ZZVZBdzVqNytV?=
 =?utf-8?B?bHlmNGU2bmhKaEFRN1I0RkhUMnV2ZTBWNUVVQnhkMzRUelFCckhoa0FzR0lD?=
 =?utf-8?B?cW5ER1ZNNXNEeDRKWjVpUmwrZnVQa0ZlaUtLNmVReHkwQjdVbndjREw5bEdT?=
 =?utf-8?B?V0kxbWwwZ241Q09XdWVjNHdMMk91OGZmaVV1YU9vWVg2N2g3K3hUeUtmTjBj?=
 =?utf-8?B?MlVKSlVud0N5Zkw0enpzNllLbkgvdVdSQWxFK0JiSDNwTFFzMUorcVR5emxj?=
 =?utf-8?B?d0JFc3NXVmtra0FzZzZldVdUa0djOTk5SzBFSXVKSXhnUGxnKzgwenVneHkv?=
 =?utf-8?B?cW5MQjBaekFBUjg3ajdPRHQ3bmgzbXp2cnZrbGxvdjFpOE5SeUUyMkM2STVu?=
 =?utf-8?B?bVhRL29FWTNZY0JidHpEOHJPRGxlMVkxb2dWaSs3UlZnRWNZM1p2b0xMbmpn?=
 =?utf-8?B?Wi9JbEpmSFpiSjZmVkk0cVI1a2JyQkVTcTQzMkdubmFJWkM3bUNWVTFxcFRR?=
 =?utf-8?B?dTJEQTIvaEpOOXUrdk9BaklJTG5lZDhWdFp3SHFFOFpMMjBHV0Y5cHVxNjR0?=
 =?utf-8?B?ZjVFZEhnVHdMMlJUd1pjMVZWZjN6M3VUUG92Z3JQWlY0Z0xqVk1vWC9xQlgw?=
 =?utf-8?B?Z0pDZlhTWE04MmxobyswR3RsOWlueFo0ZGc2MEp5WjFEYStzUTB4anpYaVgy?=
 =?utf-8?B?ZWNPemhMTDdCTjZXU0lqenhEY2ZwQjZIMU9CUW15UGxWZGFtODNSdm5YanNQ?=
 =?utf-8?B?NFh6UDNoTkV4ZlBGL2pUOHlVNHJxdUpGdklCQW9BLzhNQzA3dGVuMjE2YWJs?=
 =?utf-8?B?QW9jWjBXMTdDeEtkSElXaWtIVitoUklTQ2R0cVBUcWFOUUkyblozN291RDhB?=
 =?utf-8?B?NzMxNnJjcGd4cTFFK0tUakMwS0UxV3c0SjJSTmtuVklqRnNWbWZoT1dKdzFy?=
 =?utf-8?B?R2RRc2lCZDBydDVWYVhKckRKbFlXY2k1akorcHc4U0MyQ09oMVRTbGplYkdp?=
 =?utf-8?B?OVFWU0RCYkF3N3JzYyt3OUdCTDhvdXR4VzJDU3NrbWR4U2hFRmZJMXVVRHlx?=
 =?utf-8?B?VUZQRDNFejJjN0xJS2JRcCtjQllZMTQ3ek5VMUlJOVZoQ3FkRnN3aUJGalY4?=
 =?utf-8?B?L2ZZdnVFeEtHZCswZkhOeCtKUkMxeXZCUStjb0JRWWlOcU5qVXlpMll2VVkw?=
 =?utf-8?B?RkVkRWlRNCtkallKbTNDd1ZKNzIrMjJuUWFwSnF6YzUzd2pNbHpWNlNTSGJ0?=
 =?utf-8?B?QWpVbS9RN1d4OHYwa3JnMXdrVDBLdjhNNEFCNUVMZ1RGcWtxUU85c1p5MFR1?=
 =?utf-8?B?MjlPcnhmVWxkN3EvMDBQbXgrZ3R2Mk5xbnBINmx6R0I4TDh1VWJTamNDSERm?=
 =?utf-8?B?QUE9PQ==?=
X-OriginatorOrg: portwell.com.tw
X-MS-Exchange-CrossTenant-Network-Message-Id: 51dfe328-d9a9-47a3-eb91-08dddc137962
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6395.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 15:50:36.0396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e309f7e-c3ee-443b-8668-97701d998b2c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I5KfX814lkHq2c59XD64W0MrrdTpzYEfZkUjrbtsVt6VGg1mKcpPnqy2D+u53QcpCdD2isL9QGJAMLzl0wqIxQBTndVY9m4RCqDGAjtWG68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYPPR06MB8103

Hi Wolfram,

Thanks for your cleanup.

Yen-Chi
