Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010071.outbound.protection.outlook.com [52.101.56.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FFC31985D
	for <platform-driver-x86@vger.kernel.org>; Fri,  7 Nov 2025 10:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762512130; cv=fail; b=ORKGIfcpXyPOs8I0s4OsRgzMaoy4BsLLzUgfWjiwxovHzd1+z9vgncLanTFhPsrdYf7ljb/U2Xk6nstoWGaU70TabDTHVRPDLXlPpUhxlVRUrOb6QBmkVvu2MxatqITzwyptEMqa9jFYVFM04ZIhmA94Mqd5H17NqLKI9z+bAVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762512130; c=relaxed/simple;
	bh=ZIsH8kdKpSbSv8U+sz2WOAvejFSCV3DbbdsKQWoo8AQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KdO2edRtMwPbuwsTDDhv8LTORPQhUYhvG9ET+IhJ0Y2DPLnVKbzH8+iol3Swqteo7KIUMbTzdDoI9CGwfFfiC+cSX0PKUbdTttZxf0GMfIPqW0OIwxAFzaPXhZ1IvgMcvm16HYyjXb99Pf7isfBGvx7qHBRbbGQGs4yG7+WZB4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0osDDYaL; arc=fail smtp.client-ip=52.101.56.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0osDDYaL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mDETJ52C/UmZazM0Uhi61QoSSQK8PTi4TlBWDFw+pHIHOhVUoDA6STDPJe50MVGWhfhcWPMH9L/cVk7RALMMjZwvYtrZReqS+96vvj3l8Fsk+CKIL4p5hZwdBnYeUrPAPIEgXo7OBeIH+cM3tc6yWaqh/cFNrumBaIayWCdkRd61LyQtIXi134Rc/ReI2RVlIn3+zLHrNtKHu5YdvdVQE81lhRdH9znQOyL3v3MAoeRvVlcoMip6r/3ecq63WAScxBEZu9IaJ8aMN8LGMlVLeBHuKion7Qhv1c9DY3XQksqI6G1rFAXqvIG/won1u+SVeF6K+E+nHeZy9l9XIAqyNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6hmfgSUq4Dt2IWxqq+GJybGMqortKc9giqx78oAGrPE=;
 b=k/HHUw54hABVqH/+9Och3NvBaOFhUS/s6uM4EP3Ek/cu8P4B2GGw4Dla6XDVHu6536j0Ibs5FO4xYOFcQejA0Zh76R7RPbrGXtJZXlUTM/NQZNTwjsnU0qaL29Eko+mtU7VFuh8zd7p315YI25gwKieS3+A49bGXhrPsW9v0eTN94F3WefMIdFyaXXCyOSkZdS7VSacQVVUunHuckmi8PUrpRa90SOErIlNnRNGcciWgr6HQL95MQZYR6uDk0ZCmgJrpHm0fDukTfYR5AJeF/dSLFVCa6vleAfF0gPfnn0s19+ti5RliFiYJk4kziwtyrjpIt3XspOvpCe2RIbKJYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6hmfgSUq4Dt2IWxqq+GJybGMqortKc9giqx78oAGrPE=;
 b=0osDDYaLGqSrkZ0O1Hcqo+HbB1zy2AW2zrI32jQ6uMc0R3QNT+jzt4emko2+iJvsF2+MdaGxfQ3tcCo4ZPRxBn4MaZ946E4rN8szg8Nku+uZ4j27vI7iOTZRx8SuifP0Z0XYgdYgAfNvTc9AAPgDEmzNQHdhO3m8vqhrqZQRQyU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by DS2PR12MB9589.namprd12.prod.outlook.com (2603:10b6:8:279::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.10; Fri, 7 Nov
 2025 10:41:58 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%6]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 10:41:58 +0000
Message-ID: <3cabaa47-907c-45a5-a586-555d785d703c@amd.com>
Date: Fri, 7 Nov 2025 16:11:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] platform/x86/amd/pmf: Use ring buffer to store
 custom BIOS input values
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
 mario.limonciello@amd.com, Yijun.Shen@Dell.com, hansg@kernel.org
References: <20251015145457.3231583-1-Shyam-sundar.S-k@amd.com>
 <20251015145457.3231583-2-Shyam-sundar.S-k@amd.com>
 <b0a559b4-c7fe-90c1-27a2-7dcd5d29e146@linux.intel.com>
 <e805d898-31ae-4433-8302-8b3758213039@amd.com>
 <ca8d0f58-4a6f-9c78-c6bd-11f727787d73@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <ca8d0f58-4a6f-9c78-c6bd-11f727787d73@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0106.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:276::6) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|DS2PR12MB9589:EE_
X-MS-Office365-Filtering-Correlation-Id: cbd9eb95-60e9-4f09-7a9e-08de1dea46e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a2ZWVWZwSHhKVmZGTzh3YTkvSnRWNlBibEpCVjcrOGxsRERUZVdQT2tqc0N3?=
 =?utf-8?B?Wk5wbTFwLytlWDllQVl4cEtCWFNvSkRYUUxac0tENDdIRHl0RVhXbTU0aHV3?=
 =?utf-8?B?UEMwclZ5M3NqbVo4MzlhV0l4QkZPMHhJVnJYaTVIcTljWEQ0S1UwMjRwQXJj?=
 =?utf-8?B?NFpJNzRITWdiMTQrRFl5d1R0V2Z3bURDZWd3ei9qT2RweHpXMmhNaFNaV252?=
 =?utf-8?B?TDBORkk4ZDZXUWgwamRMSzR2THdhSHA1U3Ywc1NtM1RmbnlEZ1VzMWJpd29G?=
 =?utf-8?B?NjQ1NDA5Lzd6N3V5bXRnMGtHM0dka0ErR01Sa1dlS1YydTN5RENjM3hhVVJD?=
 =?utf-8?B?b0pxaTZjM1RldXVDUmpBYVdSOHo3cW1EQmMwMlpJa1FsN1lxbVJtOHRNeEp4?=
 =?utf-8?B?d3BFbnh2UUpLU1U2NGFLbjFNVGs0eWVpMFdoOWtjajZaQW00UStuRi9rUjNq?=
 =?utf-8?B?bmdaTEFzR2ZzTURDODdVWHZjU2M5eHZHY08wVGpYRTRTMTdFM2ttUGplcFMy?=
 =?utf-8?B?VnZ3c0pMa1p0SlJncTBHejRydTN6eEpNOW9IdzBWNTZxWjR3UXVka0FMMkd2?=
 =?utf-8?B?QzRRbTlBV2FEVEdKS01LOHVTSXladHFja0JEOE1JdjlIOWRwRThHamkrTGJP?=
 =?utf-8?B?V0dTRk9hODcxK3IxdmNLRlErMzFuRkF6VnROYm9UakNPR3R5QnVqekRCODh6?=
 =?utf-8?B?OUNQZnprbXJLNVRVZmVGbG8zbHNHZnlZU1p2emkrb0JuczRCQVZWRGVUSmRI?=
 =?utf-8?B?S3RIL2lDSWE4dEJVOEZjT09KOXFVTU1qZkcrZTZiRlplRmUrenF6OW5DMXUx?=
 =?utf-8?B?THhIc0hxTVpBMWkzRk5KYTA1c3g3NDR2Q3lLTWF3anVJckJkemRSS29JdlEz?=
 =?utf-8?B?Rk9aY2Q0cjJ6U1gwVEgxeWVwNEE2K2piM1MwdVNKNmx1c1JEN2dsK0JTd29a?=
 =?utf-8?B?MjJwWVdqQmE4Nk5uWmlWSW5wTzFsZE9BTXFpM1FHRVk3YlVUK0tmM0R2QlQv?=
 =?utf-8?B?QkRPR3RMNzdRb0RERWdTRWt5K1luSktkZHJIUEZ6U296SVRJbzFaa0FlR2Vw?=
 =?utf-8?B?eElpcDR4YUlJNW9iQXJBS1p5dndkb0l4aExYN3V4czNaaEdWbnN0eWFoVXZY?=
 =?utf-8?B?MUFQVG9nZzZvdUNKUHRGU1g0S29OcllTczdTZHMveTQ3cHYxVGQ3bUhkejlF?=
 =?utf-8?B?M0pDN05HZTVKeWpNeTJUZFVkSlNKTk9LajRKb25mbW9YT1NyUXhtS0lRTjJ0?=
 =?utf-8?B?RWlHaEhqT1hkMEF5aG54cDNrVHloeWlNUGNlMEtTV1BuZjl2NVBRZjBra2xz?=
 =?utf-8?B?SEFESTg5U3MwZ0NEZUMzbTRRQytSWmRtaHI2N2FnSXVqUkNlc1JsOU1Gb3U4?=
 =?utf-8?B?M0NtbmtYbzZsVHlYWmxpTVhTbXBDL3BhZHVFTkU5SmRtRGtSSGRNQTBZT09Q?=
 =?utf-8?B?S1hwZjlJODBMZW1BM3VBbGIxaEU4VHdzSnBVbnRhdEx5YmkyOFpaaGl4TFhJ?=
 =?utf-8?B?Qm13OEpUNW1wSDE5NCtpM3JTZUgxUHZLNGk4WTcyZ0NqY3RGd2J3U21lRUdl?=
 =?utf-8?B?Tm53UGZsa2hjbkZ0aERQTERRZVJsYjMxTkp0aHNVUnJwVGFibnRDTHorTHZI?=
 =?utf-8?B?NGt3WkJENWkzdjBCdlVQK3YwdklIU3lHYjZxWmUvRlRZUEdRd09td01USEln?=
 =?utf-8?B?Y2kvS0pUMXVjWlhrck8wWGF2bGtJa1FDZHU1YlV1SkVQa2xsZEZZcjBycGc1?=
 =?utf-8?B?d3VTYW53V2lqR0hoV25uQ285RHRsRkVSbjFHNVlrTEVJSDBpRUF0Y0NrL1g1?=
 =?utf-8?B?T1g3Uk1HeEsvdzhoWHNYbk1RUTJYRVNaVk9JZjZhMmQ0ZkF2R2RER3VhWDJy?=
 =?utf-8?B?ZGlheDR3czNPRWFLeEZsa0ZZMGd0TjdqejVNelNteUl2RTdqdWt0ZWVwSnJv?=
 =?utf-8?Q?TkLvLaoHf68hFS1nqkh0RSfWqY9VR1P+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T01TdkVlMERhOU1Mc2YrNFUvajlQYTgyS25NaE0vR0xpcnd3VlBGVXZENnh4?=
 =?utf-8?B?QmN6MDV6MlV4amhoRHRCTVYxYmpPOEtJcVBjQW5raGdUM3NCTWRxUGpKTlVh?=
 =?utf-8?B?WmNWbkt0QzlrdlpvZ2lyZjdGUzdVQUtZeFpVY3RZMmduU3VXbG5ZSzQ4eFhO?=
 =?utf-8?B?cWhMN20yWmlFNGNiZ0o3RUt0czZnK2FnUVEyUTlUL21sMm9wNldRMDA2bDd6?=
 =?utf-8?B?b0RXKy9WV0FKK2FxeEJabWVybHJwVlcwTTFzMlo3dmJFUmo3TEV3UGF6T0dZ?=
 =?utf-8?B?REZIUS9aeC9Dck1GSllDYUhpY21uaUJDb0wybU01Tmo1dWNSUGFLV1g1VTI1?=
 =?utf-8?B?TVF0WkZwMHltSGwvemFpUGJ0cE5nTHNyK1p0d3czeURieDlSWE1OUmFockRZ?=
 =?utf-8?B?ZGZxdnRLN3RQVXpCQXVneTVGRjhQOWcvVmJLaVRra2tndE1QREtiMVZTRWJo?=
 =?utf-8?B?L2FjMlJ5Y0FWTW82TnpVM2hEZWpGS3NMek1EdTdScnVlSks2NldCa0dIdC9I?=
 =?utf-8?B?WXpFTElyd3B4eThlUmJva0gxbVhNTnVJcEhiME1ZUytHcVdVR2Z5YUdEK1lk?=
 =?utf-8?B?THprTG1nd2YxOTM5bnRTenlkcjNwczNDSkNlbjNwUEhxRUorcDZYNkFXUXht?=
 =?utf-8?B?VGZ6azBNNUp3dDZQTS9HRzV3azNJQUVlcUErQlgzWVJ3NmRUazMrbGxVek1B?=
 =?utf-8?B?R2VUNHNaWC9RVmFWaFZieWsyWENYaWlnVEJrcEVWa1owd2tDLzVVRVc1Y3FQ?=
 =?utf-8?B?bWxIcWdOZEMxa0VWSzJRblRLMHh2WkpmTzVIQnFkK3ZrejA3cGY3cWtQVVJJ?=
 =?utf-8?B?cEsxRFZYL1BCUTZENDh4U09YbHE5OWh2ZEtzUitBS1F2aEZISU5Dd1Zad0U4?=
 =?utf-8?B?NGR4Vmc0cU8zWW9DR2l1NkN0V04xM3FUbHZLaE51ZllCbnhIbFFOOFlyc1VE?=
 =?utf-8?B?cDZHVHVpVkhlTmprZDB6U3IzVTNYZlA3TjdjQXl1S3NraHliNGdDbnlxRVpx?=
 =?utf-8?B?Ymk4M1JSTlhBM0NpMUxxTHY3OTVtWVp5SjFOQTdBWWFDN1d6ODVQdG0yYWpl?=
 =?utf-8?B?T0MyNTlIT0dYZ2graGZTNld3N0pvK1ZuSU84RUsvN2l4ek9tbXQ3eVM3cDh4?=
 =?utf-8?B?T0oya3FidzVxQ254WGp4L2NqVnNVWkdtVnh4aG5neE01S0FYNlFIQml5TlJk?=
 =?utf-8?B?UUNldFBEUjU3bXViVm5kMlA3YzM3dDVEbXpIb254VHh3MTREZjIzeXV0THJj?=
 =?utf-8?B?SkhJaHg5alRYajhSVWFpUFRxZ2g5V1JQbHZjQ2tKY2dwZGNlK1h1cVFpMUd0?=
 =?utf-8?B?WHllSzFoWDVIRVZVVERMbkEvemhWcjJjU2dZeFlPTiswRjdadXpHbGFadTJI?=
 =?utf-8?B?ZlEvS3RaSm5pZHhOaHM4MkFQNVFqZHpSdS9yMUNVVU9Wc25VTkpiZ3FEeU52?=
 =?utf-8?B?aTYrNTMvVHRKODR4Q09FWnVNRE5zOUpUYnFnSTh5S2prK0JxVnJTeUtNZmpT?=
 =?utf-8?B?WXZhVzBtbHZLUkwrTXdFSmREekJOM2VFcG80ZmY1TnlNQkZ0VSt2a0lsYXF5?=
 =?utf-8?B?ZktaR0FKTC9uekNhN0NxSjRKR0JIbUMxdDRzSnVjbzhPVk1lVmZuZXVnMlh0?=
 =?utf-8?B?U3JXS1YzSUgwcjV0ZWcyOUg1bjRWUk02cG1ueUJnZzRoQVJCb3ByeFVNNmpL?=
 =?utf-8?B?RVZvSHUwS1krODE3eVk2ejlLZXBTR2pwb0FrYW5pZDhrNlM1RFlBd0tGVHVu?=
 =?utf-8?B?RHNCYVI1dDlaMzgxa1E5VkwxMzVJdHp0TFlCM1B0eERWeTFHSGtmTlJzemNS?=
 =?utf-8?B?TjdVZ1ZjQlVzYXY2V2drNlJ5UzFQWXBIS0NsUitySjhiN082TTY2OUluUU9w?=
 =?utf-8?B?MkJ2VzllTFBXR1NyTEVsMzNPMEd5S21sbHdaUEZlU2hNK0xKMEN0Zll3WG1L?=
 =?utf-8?B?TktZWkNJYmxxT0t3aXRrR2V4azI1bzJRSm1tV1BpVytZYnN4NkI2cFRNZkk5?=
 =?utf-8?B?RnRPNU1uNDk0cW15Z3NPME82L2srM0VLd2FFRmc3MGw4T0Y2cW1hT3RvV0gw?=
 =?utf-8?B?aDJveTY0aWQwbm5jajRNQjkyS3QvaTZTSFpBdkpGamo1T200S2QrVUJpZlBp?=
 =?utf-8?Q?W8tEpn3oAeyoHm6imhEa/Lvjy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbd9eb95-60e9-4f09-7a9e-08de1dea46e7
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 10:41:58.4250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +gAhPl4naY86uq61giPWODWSE9mydlk94Esv9W3AsxJM+ovwhEjPc8g7oJjVKRrYJN2qJetF7oqBrE8sHTCulg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9589



On 11/7/2025 15:52, Ilpo Järvinen wrote:
> On Fri, 7 Nov 2025, Shyam Sundar S K wrote:
>> On 11/5/2025 22:16, Ilpo Järvinen wrote:
>>> On Wed, 15 Oct 2025, Shyam Sundar S K wrote:
>>>
>>>> Custom BIOS input values can be updated by multiple sources, such as power
>>>> mode changes and sensor events, each triggering a custom BIOS input event.
>>>> When these events occur in rapid succession, new data may overwrite
>>>> previous values before they are processed, resulting in lost updates.
>>>>
>>>> To address this, introduce a fixed-size, power-of-two ring buffer to
>>>> capture every custom BIOS input event, storing both the pending request
>>>> and its associated input values. Access to the ring buffer is synchronized
>>>> using a mutex.
>>>>
>>>> The previous use of memset() to clear the pending request structure after
>>>> each event is removed, as each BIOS input value is now copied into the
>>>> buffer as a snapshot. Consumers now process entries directly from the ring
>>>> buffer, making explicit clearing of the pending request structure
>>>> unnecessary.
>>>>
>>>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>>>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>> ---
>>>> v2:
>>>>  - Add dev_WARN_ONCE()
>>>>  - Change variable name rb_mutex to cbi_mutex
>>>>  - Move tail increment logic above pending request check
>>>>
>>>>  drivers/platform/x86/amd/pmf/acpi.c   | 41 +++++++++++++++++++++++++++
>>>>  drivers/platform/x86/amd/pmf/core.c   |  2 ++
>>>>  drivers/platform/x86/amd/pmf/pmf.h    | 20 +++++++++++++
>>>>  drivers/platform/x86/amd/pmf/spc.c    | 23 +++++++++------
>>>>  drivers/platform/x86/amd/pmf/tee-if.c |  2 ++
>>>>  5 files changed, 79 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
>>>> index 13c4fec2c7ef..870a56f1fe07 100644
>>>> --- a/drivers/platform/x86/amd/pmf/acpi.c
>>>> +++ b/drivers/platform/x86/amd/pmf/acpi.c
>>>> @@ -331,6 +331,43 @@ int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req
>>>>  									 req, sizeof(*req));
>>>>  }
>>>>  
>>>> +/* Store custom BIOS inputs data in ring buffer */
>>>> +static void amd_pmf_custom_bios_inputs_rb(struct amd_pmf_dev *pmf_dev)
>>>> +{
>>>> +	struct cbi_ring_buffer *rb = &pmf_dev->cbi_buf;
>>>> +	struct bios_input_entry entry = { };
>>>
>>> Too generic struct name.
>>>
>>>> +	int i;
>>>> +
>>>> +	guard(mutex)(&pmf_dev->cbi_mutex);
>>>> +
>>>> +	switch (pmf_dev->cpu_id) {
>>>> +	case AMD_CPU_ID_PS:
>>>> +		for (i = 0; i < ARRAY_SIZE(custom_bios_inputs_v1); i++)
>>>> +			entry.val[i] = pmf_dev->req1.custom_policy[i];
>>>> +		entry.preq = pmf_dev->req1.pending_req;
>>>> +		break;
>>>> +	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>>>> +	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
>>>> +		for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
>>>
>>> Add include.
>>>
>>>> +			entry.val[i] = pmf_dev->req.custom_policy[i];
>>>> +		entry.preq = pmf_dev->req.pending_req;
>>>> +		break;
>>>> +	default:
>>>> +		return;
>>>> +	}
>>>> +
>>>> +	if (CIRC_SPACE(rb->head, rb->tail, CUSTOM_BIOS_INPUT_RB_SZ) > 0) {
>>>> +		rb->data[rb->head] = entry;
>>>> +		rb->head = (rb->head + 1) & (CUSTOM_BIOS_INPUT_RB_SZ - 1);
>>>> +	} else {
>>>> +		/* Rare case: ensures the newest BIOS input value is kept */
>>>> +		dev_WARN_ONCE(pmf_dev->dev, 1, "Overwriting BIOS input value, data may be lost\n");
>>>
>>> Is this really WARN_ONCE thing? That is, does it indicate a bug in the 
>>> kernel code?
>>
>> If we hit this case, we might end up in a debug spew and hence put it
>> under WARN_ONCE (that way we are not lost in debugging the odd cases,
>> if we are under this scenario).
> 
> Why doesn't printing just a dev_warn() suffice (it should be just as 
> visible in the log provided as the stacktrace, etc. is)? Why you need 
> stacktrace, etc. to differentiate?
> 

Yes, that was the intent. But let me try with dev_warn() again..

Thanks,
Shyam

