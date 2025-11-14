Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011041.outbound.protection.outlook.com [40.107.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF662CCC0;
	Fri, 14 Nov 2025 20:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763152513; cv=fail; b=fU7tbiefpHWct8jFJY16Fsc8oJFblbD9fY7+1nDtf7rnfBq20ZRypCXYt5WCA/rDGG0yfpGZb8kQQl94laOgd1FqWRVMpchz5YtC/8RURSkZDn1BMwEXbtw6WVsSlcuMVk/vm3Vgu1NmAnWUCzKJxCOO1UlF5ZQyC0xeTsJltpQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763152513; c=relaxed/simple;
	bh=4GaJyTRAvFY/FHJOUrC05SUMU5RqgongV7nJqJI3L4k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Tgsj3kWuyeaqTY/le7Q96FTPL7PqXgzVt4yBDpEa3znHAtcWXXbwLT8ZErFE/+Jf9/0QYNP/uza+4hZTIACfqWc3k4cMBi7cxrDcB1C5qKgx5cmjiO/Ilz2oscWQc/xpN2fmAN/GahM7mBi7LUph82lKHUhP5d3D3r/muaGQm8c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Gj2nI8W0; arc=fail smtp.client-ip=40.107.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Gj2nI8W0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tbopU1nU7R1wSMvERTPxzgdRLORbJyeaS3s6kVUQ3wvEkJzlYwpTR8cD9rcjQElYHsVqbCkydbBE6igp0yfj4bijxA1VXYxv9dOkkErn/ujRe9vWP09zfcMylj0Qv3DoJfTyAi3duS1a5aDrjyCO5ijkSCssNHGeMgXvHbg/y3psLEvI/uNz2l8IOtXIt5BLq4i4FNdCCS0HmMynaFdlNfvs+wvHfdb9LqAsCJJc9THNz880hkxDZYfBcBR4KkKlAxpVkfuqUawEbmDqIcvZ/jZvxv07sWj2J+nv+BgsuCBcvvGYWY6mea8GBkBT/H/z872HE4i4hFUPSbexeQUo9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=smvg/BRyD4RdCqT/1RHtJ2oVSQ7992cwYdM4E+luBFQ=;
 b=k+TMm6NFVV3iPXsSjc0qzy3v8JK0kK5EwOT9E1DNr0/wnki9jfqDA3vV/B+SnmBst50/+i7ae4ESi3HuGXObl03J2y0RFKxoEWXmmSCQEhNyhiMwnKeC0IEr3Hd/oyPxel6gdNWygBmEsgaYu8h9O+MJqRMC/Rpefv/zMPvWfvEAABF5pMyQs8vgqoDTUNFMJZ52fEMDaDAWBLCcCTE4dFEHTuKjtyTdYyvrEmRIXDVxrJsgHMps5mfeQ4bU9/aiv5hYP9WJ4Fi1hSmDYKhisbYxnmc74bvnsAdRu56nHDzzlhQgRHSa8A3xt8HhtbiROcaWTDzmXPkd7p4W0Zjv9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smvg/BRyD4RdCqT/1RHtJ2oVSQ7992cwYdM4E+luBFQ=;
 b=Gj2nI8W04ztefZsm/5IX6LfBp8lpcQ5STpquWSdbfQo4y6VWuJLMAsMwlWqI16K6P2ouoWgeWC3OIwhZASvrrWIdVUSEC23107iYTVVfBZ9xq6vg0iWvhuvjn7EShBXcovluAQxd1pqY02cIhUuy4ngoskWbxRtypUFpFMMAsSE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH3PR12MB7714.namprd12.prod.outlook.com (2603:10b6:610:14e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 20:35:04 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 20:35:04 +0000
Message-ID: <8b999b96-f1bf-4231-b2f8-5c4a55e21d5f@amd.com>
Date: Fri, 14 Nov 2025 14:35:01 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: asus-armoury: do not abort probe on
 unexpected CPU cores count
To: Denis Benato <denis.benato@linux.dev>, linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Luke D . Jones" <luke@ljones.dev>, Alok Tiwari <alok.a.tiwari@oracle.com>,
 Derek John Clark <derekjohn.clark@gmail.com>,
 Mateusz Schyboll <dragonn@op.pl>, porfet828@gmail.com,
 Denis Benato <benato.denis96@gmail.com>
References: <20251114185337.578959-1-denis.benato@linux.dev>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20251114185337.578959-1-denis.benato@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR13CA0035.namprd13.prod.outlook.com
 (2603:10b6:5:bc::48) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH3PR12MB7714:EE_
X-MS-Office365-Filtering-Correlation-Id: b830261d-a4ae-4213-0840-08de23bd4ac5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UkI2OE1wVTdxQkowUGsvYkZCM2F3ZjVNZDJ1bTJ6ZEpsbkJLUW1FNTBGOTRK?=
 =?utf-8?B?emladUI0UDI5N2psaWhqdDlwVkJHNTlUNmNlUE15Qjl4U3A2UGl2ZGlic0x3?=
 =?utf-8?B?TGhGQUVDckJZY2duSlVUSkQwR2JxR29jUjFhZ3I1SDEreDZ5eDFMYUI0OTJM?=
 =?utf-8?B?cnh4aFhwMElSSjVURFd3K1ZOMlJoNFhIMlFYd05ZSGJ4SDFyMWJKM2wwWTgy?=
 =?utf-8?B?OVBSSUVYT2lxNGltY3R1cmliekpXdW9NVEJBVVVjNDExY25kOGRVb2lUZFFD?=
 =?utf-8?B?QitnRnowbVU1M0JCN29WOWF0UVlTaDZJV2JraGtoQmFneHNRdU5uUUk3c2dj?=
 =?utf-8?B?SzJWUUJEZytKN2MvelJKNlBNbUwwazZYTVVtd2sycElhOWpTd1hHZElDbXEw?=
 =?utf-8?B?YngwdExCcEl3RGx2Zk5DQzd3S01oSExkbm5NTWxwZ3FpYkVoMmV2VEVjRklp?=
 =?utf-8?B?dG5EWmVnMnRaS3JYUklFL2hWd3IrSWFvalgwU280U0JHS0Q3Q3JBTUJ4SHh3?=
 =?utf-8?B?alI0ZURIenMzbytrb29IUWdzMWJKRUY4WkRnYlpZcnFEK3dEM0NiOVVuNGNq?=
 =?utf-8?B?bWJUNWFrNi9hMGZrMEVUNTFXcVljZ2xZR0JhRmpQeGV5RERSVEdQeUpxVjV4?=
 =?utf-8?B?aWRnWWNaS3FnQWNwS3pvdEdFd3lTcEYvSUdocTM3ZnE1SkZETE05VS9scnJa?=
 =?utf-8?B?MmZXWE9lRGxzUk1TeDNIVEZOU003Q1JLNXd5UW4zL2ovUm82S09MN3NmUWpl?=
 =?utf-8?B?aVBnMEFvTVI1WCtLeGsyRzJzSGxVMVlKOXgrOEE1MGg5L0E4RmxWSjB0VjVh?=
 =?utf-8?B?OG9rOThNUnVNSWEzQXFYWGlkNHJEUUM1LzMxaFVZWHViQjJGMGZzdDJUaTFr?=
 =?utf-8?B?UGY1eU5GTXYyRE51amxFOEt2dmZWSXNBcStVb3cyM3MvTEhEbDNxWWlyekE0?=
 =?utf-8?B?MS95TUQ4eDg4Nkt2ZlhEMGIydy9HTHllL2hzWUJKNkdselhIb0Zlb3BnaXdR?=
 =?utf-8?B?di81SmtQZEcrVUxuM3hNcVBLUlJKOHZkSzdMb3UweC81V01maGxkZ0pXZDFn?=
 =?utf-8?B?a3VwRE4ydEgweDhNM2hzdUwrL2NSQjBNUnZibUo4S3hUNDYxb3JzUjVkckZj?=
 =?utf-8?B?ZlZzSms2RVRNMmp2Z1ZrTEFBWWxvR0tDbGtPb3p0TExheUxEN29kTDA2S3Fs?=
 =?utf-8?B?RWRBQUhHVFkxUmpOSktZS0R4RVFOeTlPTmxnQjZrWVFXcXkwYVU4bDFBei9p?=
 =?utf-8?B?c0N2TVorRTVrQ2psNmRWTzhLNFI3bHpNVXRjZ1dya3pmdWdzZUlhM0g2Wjky?=
 =?utf-8?B?MzdiRThNUXowcGNGa3NORlA0QlcvN3RLamJSbHFGVEdUaUxGT1ZMOVY5VEcw?=
 =?utf-8?B?d21rOEFVRmE0Qm5nckZWb0I2V3JWbGdNeWhsTzF2eUMyK1ZlT3dWcTVYUm9j?=
 =?utf-8?B?K3U3d0QxYU9GWHR6c2diZHNsTDRiSTByRlJzQWhKVmdMaUtBWWJpK215bmxw?=
 =?utf-8?B?bXAvZm1ONXQyc1NKZjVRZFhyQ0FKc2NvTzlDa2o1Uys1NVRVeXAxMFN6WTAz?=
 =?utf-8?B?YmQ5L05GL3U2Ti9pcEpvK2p2bERETllJMzNCWXl6NGdIdC92dFlzQjh3ZDFO?=
 =?utf-8?B?NkNmVkRudXg1aU54VHJ1N1BkSkZFSDEwTWNzTjA0ZnBEMkZ0c1VDTURMeXdT?=
 =?utf-8?B?UEdoZEdvWlpCZGhRbm52M0Z3a2U4SEVhdzJ1Tk5hbjkzOG9PMVFZR056aGVP?=
 =?utf-8?B?YVVuNmUzMUM3NVBrTUNFNjFyN01XL1RuOXMyNmZYRUsrQ0IxZFhRQVAwR2ow?=
 =?utf-8?B?REpzaWFPUlNLZXNidGpUdFJMTTRzTGR0SXlPaUlBUmRsRXNoMjRYVkdoN0tN?=
 =?utf-8?B?TjJKMnQ1ckloUVo4T2h3Qm9pVzh2NzR2YWE4NGE3MnJMUVJucGVHVUVZTTVG?=
 =?utf-8?Q?oOWusodIDQDX69syIEROnQr/7ektcu4K?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVZyRDJGU2p4Q2xGWFJwZ1BtOHNwKzVYcDRJOWxvcW9JWm5OaGZQOGtrTGp5?=
 =?utf-8?B?TlQ2Q1hjellrdHlNZFdkYlZmMHJScFRwaXRlYy9KVGdYZ2hCMm9oRUw2Q2x1?=
 =?utf-8?B?TzFFa0d0MjZSc3pqd3FoNWpYY3BUcWZYM0NHbEt3V1p1ZHlndXlVdlhCYWtR?=
 =?utf-8?B?eHR4blp6UCtqTnl5WnJyUzRTajh1WFdEczF3Q0ZxbkNmQTNaM05hbEVwRTEz?=
 =?utf-8?B?VGliOFIyTmRFTVFQWkxWeXE4dzd3QUhQZW5SRkwrNFVFenRhSEo4aTBrczJq?=
 =?utf-8?B?NW9xZHUyelJqb0RkNmRRbFAxeFovbUY0UXJsZnJJSmpDeDRNVHNzT2lJdjZY?=
 =?utf-8?B?VkhLYitWS05RMFB4Y0w5NWNqZFdweVJyL1pPd3FDR2RHNk1kYXc3RXZROGNh?=
 =?utf-8?B?UHB4Um5oTnJkVUNjempQeU1XVjlsMjVoNHRueHpnTVhUb3dYZlo1bmtTTjI3?=
 =?utf-8?B?ODhVL2lKMUxOZUZRRE1LLzAxWGYyeFZ4cUlreVRzd1JuMU45SGVYa0h3RWt6?=
 =?utf-8?B?cjRrTWVSUCtHT1U1MXd4QzBpRFI5TzFiR25scW5QZG15bWh6QklJMFk5bmFm?=
 =?utf-8?B?b3NHTkRYZmg5OWl5c0lyTk9xMjRvdFVIRS9mU0Zrb2Y3bEcvelZ1QU9KSXFO?=
 =?utf-8?B?ZTBoSWR4aFhwTFpxZGM5UExwV0I3Wi85TlBvbWZQME5MYkNiYThxTC9nZnQw?=
 =?utf-8?B?Z1lycHFzM1h5NmM2SWp0MDNGVWlRbjlzcC9KODFpc2pHaXo0WHQ0Z0gzNTNv?=
 =?utf-8?B?VmNIaXJFS2hucTc2UW1VNER5bFZrMUVWKy9YTkpBVnhtdDQzTEs0R08vQ0ox?=
 =?utf-8?B?cnNWdVJWTnhWNndQRjZGQjFVWDdXWWRpeEtKbWNkOGZ1TE92UDh6QmNjTFRx?=
 =?utf-8?B?QWc0bWlHSDNuNUl1MW9XcEdpSlVneng5YzhGeklTajBhV2pqeEZ5bnJpdnlq?=
 =?utf-8?B?UHk0cFJnRm9wQXU4cjBsT2x2T3lMSVlYcFpJR25jakxiZjhwL1EwdCsvZVVo?=
 =?utf-8?B?eXdmRzlMWi9lcGZ6ZERhODY3ZmtyZVVaVzljOVRaVGpTUGFWejVwSFoxMnFM?=
 =?utf-8?B?UmhUYzFiZW41TjJoYmlOSXdTTG4wRWV3aDE0K1lFSEFocXNSTUVkamhtMUxP?=
 =?utf-8?B?TkEwSDhyclVFODdQb0NsUE9CS3lQd0ZWbXlvZTJZVEhxNGtJVTlVMGFrUGZP?=
 =?utf-8?B?cGoyQ0Fla2lpLzlaOVhPaG5MYkNPOFR1Rjlvb2pybHpCdi9qNWRUV05iV3Fm?=
 =?utf-8?B?eHcvMUpDSStXbTlDVFVocGNGZDdPVUs5WjVrcStSRnE3WllwVVg4UFhicHNW?=
 =?utf-8?B?Z0o3K0NiQ05ydGxsclBHV09SYkZpa1dLYVlZQVlkM2NaanRoVFU2bVR3Qi8y?=
 =?utf-8?B?S2FnYmtXNjRJaVh1ZUd5MjhzenVhT3ViVU5EbEprNEFtTGRKYVVNd1NRNTdL?=
 =?utf-8?B?bTR3VlZpM2ZtR1QyaVhkWGIrRHJJMXAzaFp6L3RoWDg2ekRKV1FKVkM5MklU?=
 =?utf-8?B?aE5iVC9UZDBpa1ZibXRkUGhya1hFd3VSRUEybmpRZzdrUWhSU2tkazc0MVdZ?=
 =?utf-8?B?aGFxWVJ1Tkw4R2JTKzE3UGJ5MkJiM28yZkl0MFkwNHBuQWhKemE0VXRYdHd1?=
 =?utf-8?B?cGRZMHFVNnNsbFdJQm9GemxwWkVqYTJTMUxseHZsbHRPS05ONVNOd0R2UFhT?=
 =?utf-8?B?bWZNRk8rV3ZQa3hBZ1JuZmNDbmRxamthU21CM3hxRkFPeUFtOVlGMHVvenR4?=
 =?utf-8?B?d2pDeE1qUFJ6QzBHM2VjVzBHV3hGNEtCK3I4YUZncVNaKzJNcnY3VW1VTWUw?=
 =?utf-8?B?c1o3REcwMnoxVEkyTzVrUWlqdDlGYWNUQWhIRjl2MlMzdXlwbU45Wlo0UlhD?=
 =?utf-8?B?WVdnVXFPSGxYTFFBZnBpNnJkbUtIRGJXUnhEakZhbG95TXpVMk9ya0VQbmVj?=
 =?utf-8?B?SzI4YjhjanR5UnJ6YVdsYVNwRTdOUmpZMFRyS014UVJIMlhzY01xRDZDbkJB?=
 =?utf-8?B?aXIxZUsrbGF1akxpMEhDZnRheERnazZxR3p1V0FJWXVva0lML3pWSXZzb3M3?=
 =?utf-8?B?NEJpYnF6NzRmU3cxU3RHQVo2YVZBRy96SjBmRzNzdS9HMVBiUS9SSWRybkJv?=
 =?utf-8?Q?mflBv/+ZKYo0HN4w3H415E0k9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b830261d-a4ae-4213-0840-08de23bd4ac5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 20:35:04.5245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x8QzIBhAR5H4tphqaXw2usqf2HZn2pOMXwml0rVJd2CyhDyPnmA8pGU2awZOBYwlu0SoyxRCuThN9rPa2KpwNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7714



On 11/14/2025 12:53 PM, Denis Benato wrote:
> Until now the CPU cores count was only available for
> Intel hardware, however a few weeks ago an AMD hardware
> that provides aforementioned interface appeared on the
> market and data read from the interface doesn't
> follow the expected format and the driver fails to probe.

As a general statement; I don't like this feature at all.  You've said 
yourself that it's bricked systems.  Now it's not working on a bunch of 
systems due to mismatched expectations.

We already have core parking in Linux at runtime (you can trivially 
write 'offline' to any core and the kernel will put it in the right 
power state and stop using it).

So if it was me I would say axe the feature all together, or make it 
experimental and opt-in via a module parameter.

But nonetheless if you decide to keep it; code review for the patch is 
below.

> 
> Avoid failing on invalid cores count and print out debug information.

You seem to be printing it out all at err level not debug level.

> 
> Signed-off-by: Denis Benato <denis.benato@linux.dev>
> ---
>   drivers/platform/x86/asus-armoury.c | 34 ++++++++++++++++++++++++-----
>   1 file changed, 29 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
> index 9f67218ecd14..6355ec3e253f 100644
> --- a/drivers/platform/x86/asus-armoury.c
> +++ b/drivers/platform/x86/asus-armoury.c
> @@ -818,10 +818,23 @@ static struct cpu_cores *init_cpu_cores_ctrl(void)
>   	cores_p->min_power_cores = CPU_POWR_CORE_COUNT_MIN;
>   	cores_p->min_perf_cores = CPU_PERF_CORE_COUNT_MIN;
>   
> +	if (cores_p->min_perf_cores > cores_p->max_perf_cores) {
> +		pr_err("Invalid CPU performance cores count detected: min: %u, max: %u, current: %u\n",
> +		       cores_p->min_perf_cores,
> +		       cores_p->max_perf_cores,
> +		       cores_p->cur_perf_cores
> +		);

Should this be debug level?

> +		return ERR_PTR(-EINVAL);
> +	}
> +
>   	if ((cores_p->min_perf_cores > cores_p->max_perf_cores) ||
>   	    (cores_p->min_power_cores > cores_p->max_power_cores)
>   	) {
> -		pr_err("Invalid CPU cores count detected: interface is not safe to be used.\n");
> +		pr_err("Invalid CPU efficiency cores count detected: min: %u, max: %u, current: %u\n",
> +		       cores_p->min_power_cores,
> +		       cores_p->max_power_cores,
> +		       cores_p->cur_power_cores
> +		);

Should this be debug level?

>   		return ERR_PTR(-EINVAL);
>   	}
>   
> @@ -841,6 +854,11 @@ static ssize_t cores_value_show(struct kobject *kobj, struct kobj_attribute *att
>   {
>   	u32 cpu_core_value;
>   
> +	if (asus_armoury.cpu_cores == NULL) {
> +		pr_err("CPU core control interface was not initialized.\n");
> +		return -ENODEV;
> +	}
> +

I think you should control the visibility of the attribute instead. 
There is no point making an attribute that will always show an error.

>   	switch (core_value) {
>   	case CPU_CORE_DEFAULT:
>   	case CPU_CORE_MAX:
> @@ -875,6 +893,11 @@ static ssize_t cores_current_value_store(struct kobject *kobj, struct kobj_attri
>   	if (result)
>   		return result;
>   
> +	if (asus_armoury.cpu_cores == NULL) {
> +		pr_err("CPU core control interface was not initialized.\n");
> +		return -ENODEV;
> +	}
> +
>   	scoped_guard(mutex, &asus_armoury.cpu_core_mutex) {
>   		if (!asus_armoury.cpu_cores_changeable) {
>   			pr_warn("CPU core count change not allowed until reboot\n");
> @@ -1389,16 +1412,17 @@ static int __init asus_fw_init(void)
>   		return -ENODEV;
>   
>   	asus_armoury.cpu_cores_changeable = false;
> +	asus_armoury.cpu_cores = NULL;
>   	if (armoury_has_devstate(ASUS_WMI_DEVID_CORES_MAX)) {
>   		cpu_cores_ctrl = init_cpu_cores_ctrl();
>   		if (IS_ERR(cpu_cores_ctrl)) {
>   			err = PTR_ERR(cpu_cores_ctrl);
>   			pr_err("Could not initialise CPU core control: %d\n", err);

AFAICT you don't need the err variable anymore for this function.

This can just be:

if (IS_ERR(cpu_cores_ctrl))
	pr_err("Could not initialise CPU core control: %d\n", err);
else {
...
}

> -			return err;
> +		} else {
> +			pr_debug("CPU cores control available.\n");
> +			asus_armoury.cpu_cores = cpu_cores_ctrl;
> +			asus_armoury.cpu_cores_changeable = true;
>   		}
> -
> -		asus_armoury.cpu_cores = cpu_cores_ctrl;
> -		asus_armoury.cpu_cores_changeable = true;
>   	}
>   
>   	init_rog_tunables();

