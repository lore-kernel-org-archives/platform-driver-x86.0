Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2078.outbound.protection.outlook.com [40.107.93.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA18813A899
	for <platform-driver-x86@vger.kernel.org>; Tue, 22 Oct 2024 05:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729576470; cv=fail; b=Um+gIiEsU1PV8Pv0BJW+g+UV4uxvvLfzw6Bs0u3CQfhrhvbDqcVD2H6jYFQNN3Gkia8jQFOL46OV8UL71B1uT6RV0veOWGjBI0kOQI942Z5CT7INkXZUJnZ4+wntG4nk6wQ35T3Z8+4AhcBsfLuCfCGvHPJo7bCy0hH7mufdAAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729576470; c=relaxed/simple;
	bh=A2Hvg9c1mFvDOu1ukGokUsH1Yebs1K29+3KuFrI0124=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pGUTeEScXpuboyUveQvTa9o31m2hO13NAoixa5LU4kwYXgGmJX7xE3DvWLATtmX1JiAvyoHtEyhOKz4ZX955zFTs88keKPEoVCEEXdqnGIOTvRQujvSMl9Ft4IqSaPzxmJ0oestDXPLiapoMuNmltySy/xxsWcPeVzuLpD9dOT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QHJQSshj; arc=fail smtp.client-ip=40.107.93.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QHJQSshj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RuTxns0P/MjC+xGSrnlZFtZaJprtUgFR4QiHNZIeI9y3ufw/2GRzmfK5Dpfgr6PhiSw8H1P3X6wzjuTbMXTc/Gf/EJwBWGEhB04Pgg2U3D/xWzS5c1lnMCsWSnNHhu32wGuzA/GyHjsQlU6ep+JrqMPt79gA9/O0sEv3IkAjQ8jVoLrnp9Ojzw+4hFdAnXrF+HHVxqeppMcRhwBKI7maSz8rwxv3srYjSbueoGZ+md4snCgUml0seKNmRydSwbtjUuvOzycYCTdMorGwP8YRMgMQhL8+ESEdpHXww1lTZkXzKl4HLDbRFfqxO21kt19d5r7/majhwM/Sm4u9R+y21A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tbW9Nte7QQgkBVIjwauqsnmDvLuX3CQzbEAgn6Ni8b4=;
 b=vqfuWXPgRSQLGC6m1XMY3I4YAhLWZwj2oU8+oBsAtYDSdIpsLvlEMJOSzFTvxh3/MbQI3rwPaoCLX937YmeWn3KeYFE0dyVI6ZcPwn51FZ9d4nu8RMOwwjube36yKs4ddzv1C4+p3dvQzqf0s70EnXktMFv1Xq1RkMBtOUQsr8VEMiWYjYS58bIjBwfwwbR4ERpFeaLKmNgpqW0N2lIY7YTiKjlIOCwInBHXtifdvCVBcirUQmUc8ASLil8PbuETgSm+mWIWVcgkmRrt4cV9sTL3FJ6LE3eoV8ebLVXsnueYWuxaC9AqT7Zy3cyOIdPOhYLRUeqNoQNyF57rnNFg2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tbW9Nte7QQgkBVIjwauqsnmDvLuX3CQzbEAgn6Ni8b4=;
 b=QHJQSshjXwsuA8cCaDz+eVdbaTlYAl4xu9Z1KrfHQZUqpukis0rZhilQGbuFLxhhNf9FCTE9Ce5qsVgCQVhljKKoO5nCnLRD/+hTgEWzpGlpNXYFHluEjQXcvFU7sLc+uw5UiyZH97Y+FEN5g/kNsBhXroEkGad43FKwTq4OZp0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by MW5PR12MB5652.namprd12.prod.outlook.com (2603:10b6:303:1a0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 05:54:24 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::a3dc:7ea1:9cc7:ce0f]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::a3dc:7ea1:9cc7:ce0f%6]) with mapi id 15.20.8093.014; Tue, 22 Oct 2024
 05:54:24 +0000
Message-ID: <5dce0b9f-2b91-1cac-5150-899547cd042f@amd.com>
Date: Tue, 22 Oct 2024 11:24:17 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 1/2] platform/x86/amd: amd_3d_vcache: Add AMD 3D
 V-Cache optimizer driver
Content-Language: en-US
To: Armin Wolf <W_Armin@gmx.de>, Basavaraj Natikar
 <Basavaraj.Natikar@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org
Cc: perry.yuan@amd.com, mario.limonciello@amd.com, Shyam-sundar.S-k@amd.com
References: <20241021165820.339567-1-Basavaraj.Natikar@amd.com>
 <20241021165820.339567-2-Basavaraj.Natikar@amd.com>
 <72c0b021-9778-4bbe-aa54-c7ef887c04fa@gmx.de>
From: Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <72c0b021-9778-4bbe-aa54-c7ef887c04fa@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PEPF00000179.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04::44) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|MW5PR12MB5652:EE_
X-MS-Office365-Filtering-Correlation-Id: 47f253fb-3830-4f21-091f-08dcf25dfb72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RmxVYUtoRkQzeWpBTzYrcWFaTDZuSFU4TFhyUmFxbkVWYlNVbWZ6eFNxM0ZK?=
 =?utf-8?B?T09SVm1NS2JQOW1WVUkvTnM3bmwza0hoaGc3dzhLeERrWDZnZ3lYZWlVeHhp?=
 =?utf-8?B?Q0ZlaC9IeG1pdHNTeVB0ODkvWkc2eHVnSGI1NFN0Uk1wNWVSZVQxazQveDFR?=
 =?utf-8?B?OFdVMEtiNHM5ZW9iNm0rNEJ5VjZ6TVRxTW5reGt0ZU5pRzJhV3p1bExTL0Fk?=
 =?utf-8?B?UDNuaDhvK3praG5rMTJNeEZsYWtPMTNrQlNYQ3BaQ2gzNWhxV0NKc2RkL0xO?=
 =?utf-8?B?a04veTZEbFZBTDZDRzFJcWNMN2VaR0FEOHVRWXBvVm5oVWIyVSt4S2ZVSVBp?=
 =?utf-8?B?T1VTKzh4ZC95QzE2emc0SmFZKzB3YTNQUm5xU2QxODhQaVJQZmNVT0RCMmpo?=
 =?utf-8?B?dkRNalVRV3Q2OWlmKzUyU2V0cTFNR2dCWS9DSGtKV201blFsZEhTT0ZKK2xG?=
 =?utf-8?B?UFFTbVlFSWRiZkxCZ1hOWDNGZ2EwUlhrVmJsZEhzRndyWUlQZllwdDVxQzdp?=
 =?utf-8?B?b2ZVU1kxL25hdkkreUZTQWJZQjl1ZEFzWEVnekx1SXh6RzlrbFN4SFJPUGRK?=
 =?utf-8?B?Z3BSazJvZW1XeitHVm9FNmZIMml5VVl4TDRVK2dQMFUybUdzY2NMa3FodmJw?=
 =?utf-8?B?ZW9XbXlVOUdnS1MxQ3NWUnRZUWh2eWZNR1F0WU9TeS9HL2dkays5b2NuSGNk?=
 =?utf-8?B?OC9RQjRkb0lhN0JDYWpIT0lIWHFCcFdhRFprV0NJZldPbFVzQmxVc1NVVFBT?=
 =?utf-8?B?S09QaGdMWjdQYnY0NGtDYlZQdW81Q2VKU3ZjZUsrbmJhNnJtVmt3SmNESEs5?=
 =?utf-8?B?MHJqTGsvOXhmUC9sTXJ0S0MvQ2xPNmVzblpDTHVqSzZFb2I5VnB0VmE5NlZX?=
 =?utf-8?B?T2xvNGYyeHprZmkzVko2aC8zZTByclQwWlhFTlV0NStYMlVsd2IvT2RyT3hD?=
 =?utf-8?B?M2NhNUU3MTU2Z1cyWlR6blo5TG55cnNoK2pNeWo0bkZTOS9LK0ErYWdWdUpo?=
 =?utf-8?B?VFBOOGF3OVpRSnlWdjYwRzJMTzRNeTR2dEcvQ1hYQ213NHNnV2pEdTNBYnky?=
 =?utf-8?B?SjBETWcvOGlia0xhSTlWYlR2eHhtYXpoN2ZJNXNXc3JjQzdMUEtQWnlxUzQ5?=
 =?utf-8?B?Z2RvSDA5MFRnUll2K1E5Sjlmd09QaUZtMyt0ZEFMRjljQXlqZERWbHBwcG9J?=
 =?utf-8?B?emQxS0hQQXNwV0k2MU5uNElKbWZkazNieUd2VXBZd1h5U0lkR2huQ21LYjNp?=
 =?utf-8?B?MmE0RUZSOCtYeEtoOWNDMk9JUGxWUFQrOURGZXRvS2RvWXpKYnptZlgyUU5t?=
 =?utf-8?B?d2ZGdTBPR2d2bDhiZUUxU2lXRmpNNlJKSllaWlBla3g3eFQrYVJrLzl4TTJq?=
 =?utf-8?B?b0xYL0tidTMycys5OTlBeXBjRDljUGhGSzBGejdtQVJ0RmdsN1VGdFMyMVJl?=
 =?utf-8?B?bnc0ajBKSXUxVjgwL1ZPQ1JGSVVQd0ZJdC9LdlZJUFNiaXRIM1kvekFQOVJm?=
 =?utf-8?B?S1p4UjVqUjd0bStaVzhBaythSkQzeUluMmp6aGQzOXhLTEIzNGU4cHBpWGl1?=
 =?utf-8?B?cEFHdFNLQkVBTll2R2FDZ3JSVWoveHhaNzhTa0hhdU00dE9TemFPekpvV1hs?=
 =?utf-8?B?bHMvbkxPbFJ4OGdTYlBKUW45SFdzY0FlNGZmYTZFTUEwdDh5Y0lZdjZ2ckR3?=
 =?utf-8?B?bDVBcExSYmV3QVE1ZXh3Si96dExYRW9iUWYvU1EvSncrTVdQM0krYmQvU3ZH?=
 =?utf-8?Q?+SxFK/y4WBBGSqvWbu8uzuYWCmx8DV4+7Ci7hA2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?clhLV052cTM1SlV4N0hIYnNGZmNqTG0rUlpCQVVhVlo1OHBNSXlWZ25hQ3p2?=
 =?utf-8?B?MWc1SUt4ZWRkZXo3M3liaDQ2YkNkaEhEdDQ3N082U2I3dDhXa1dWelBnejdy?=
 =?utf-8?B?bHRtUGhFb2tXS3BReG1DSVlHalVmSTBaeHh3WjRjRjVZMm5za21yelhDOTBC?=
 =?utf-8?B?ZzA2MUFxYzhqOHg3YVdJOXp5VjQ0MTJ4ZFVNNXA4UkszVDhUWTlUQTRBZlhS?=
 =?utf-8?B?R1dLTTNnQkpiOEpDbGN6RFZmZGkzS2N2cWkxNksvamZBWndQa0FTeENFazUy?=
 =?utf-8?B?THZRSEJqV2t4dmIza0F3NjJWM3Q3SUZ6ZWtSOEljUjZJUkUyWEVOSFFZUXpt?=
 =?utf-8?B?L2ZXbkZhVE9kYlFQMnRyVHBnTmg5LzBYZ2FlWEZOUGRWNXJMRk9ML0swbisr?=
 =?utf-8?B?VmZjbFNTZG1KRUtFcFNOSEw1UHozWlFsc2ZlR1BrRVpzTVpYM2xPdDFzYW41?=
 =?utf-8?B?K0pDMXA0VHhTWEZKNFExdkIyNDQ0alhTc0xYUzRHZUovVEdydmg1TkJ1TGNo?=
 =?utf-8?B?cVZlNTFyS1pZdFl1aXo2akN5KzFTNXJNYzY4cms4cDhSWUM3QnAyYUFaclQ1?=
 =?utf-8?B?VjVpcnVYUjJFamRWQUFVVG1zREJQUy8wMXBheklOYXVBNnJtaitBVWlqZWpp?=
 =?utf-8?B?MDRRaERmcjFwQ2JaQzRzcC9XN3VYWCs2d0ZHZllJZ2NlUmhNMXlVVzdnVmxN?=
 =?utf-8?B?Mkc1Ync1a1A1eHpXYmFDalU3SndadGJLOWpiWldZenoyZ3BvYWZIYUVxcEE5?=
 =?utf-8?B?dzUxUXZudUJhb3ZNZlBKNkV6WWpwT0Z5R0RJeThVeVRLWTB3ZDdRc0JPd2Zz?=
 =?utf-8?B?c3N5U1pHMmZ3M09hd1pHdlZjYXFTbkoxemFpNnV3QWlHNWJSKzlISEdxSDlH?=
 =?utf-8?B?U1d3NUpFdGNWa1dlN2hUSmVuQTNCb3lGM3Uzell0MUtFaW4zMVRMNkRvL29Z?=
 =?utf-8?B?Tk9FNHB2emtmcTV3SUJLRWZKRUtFcCsydy91NXp2TzJWVmlkVytTMjNUckJh?=
 =?utf-8?B?bHlod0VFcElsRnN4SUFLU29BQkE4eGxHeGtiTTRJTDBQc28rUGw4SjhrSVdh?=
 =?utf-8?B?NzVOVk8wbk5QdmxVOVFYcTdXWElvamdEakZNNXA5aHUybjhQWkhwRXp0aGRB?=
 =?utf-8?B?ZlZxWUVxSmg3cjF0L25aTmRZTkg0NlR0ZTU1Vlp6aWpUOWpRM0tsaGovMDhN?=
 =?utf-8?B?RFFXUEF3Sk9xTTBwSm0rNTNJWjk0LzBvdk5Rajd3L1ZTdGJlZnp4VXExSWw1?=
 =?utf-8?B?ZjRZelNZU0Zza2pya0o2RDd5WEczMnZ4WmJ2MnVYd1pCYVZFUmJxUlRvSnUv?=
 =?utf-8?B?aGhwalVVMks0cStOZVBzNGFyMSs5dWFUd1ZvSDNFdTlqaDRaaUEzZ2w3TFdx?=
 =?utf-8?B?YWlBLy85ZjVsVW9tUmpyVjdHSUVxanRsbnA3TElCN2hDbXg3b0krMDdzS2pY?=
 =?utf-8?B?UXVlN3d6b29Kck41bGZJOVI0NnJIZkNQSFdCcUwwVzVwaXJlakRpNDIyeVN3?=
 =?utf-8?B?VnZqa1J0b2ZwZXFET0duc0RMYWVuVExGSnkrUjFrdFFsMTFvRGlIS1c1aVVM?=
 =?utf-8?B?aFVJSSttbGdsdUZHVFhqMHJjeU1xRncva0ZIY2FlMHNzOVdzRzBVaEdEaHA2?=
 =?utf-8?B?ZkZ0dFpZcElqNExnamlRaFNBV2VkRjhHUmdDdEttU2dFbkJ5cGVwbVhZaUFW?=
 =?utf-8?B?b1ljUEkwR1Nuak9NeEEralBoOEZKNVRUNVh5elB5ejRLTUx2SGhHV1pnWVNL?=
 =?utf-8?B?VXNJblFZTUZoK2I4RUNrUXA5MU9pMmN3WDhzT1NUSzNKYStrTzcxSVpldWdk?=
 =?utf-8?B?RUVHRjlNSmZjREdHOU05bTBWaFRoQWZVYTVoTzhlc21NeEJhTVhqT0FaWGhE?=
 =?utf-8?B?VFA3L2tBemVKTThjTTExbXFzVFQ2RzVOUTFlMVE5c29IY3hxRVgrcmt1dlJP?=
 =?utf-8?B?U01oaFFYZkJKdklER1A0ZHFyOUtQd0JVZ2hJZmpPMHU5Q3VXV0p0OStYU3R6?=
 =?utf-8?B?NVowVUgzS2U5QWF3UXhnelBpdVVveW45UlpGeEJINmRmc0M2T2lUa245QmVN?=
 =?utf-8?B?WE15ZE94U01xWUVGdW0wclJ5TWlZbTFUOE53QzRSbnMxNzFVR25ZcU1KVnd5?=
 =?utf-8?Q?eAZ+lypi2Ify8PTGyj4WsPaQz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47f253fb-3830-4f21-091f-08dcf25dfb72
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 05:54:24.7593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4UYr2sQgZLrdDjqSl5XqackezwcCpw2fCEyaH1C92a51Yf2PyIz6YDWigFwVWbVz0E9t414mgNFs4TFv6UWP0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5652


On 10/22/2024 2:05 AM, Armin Wolf wrote:
> Am 21.10.24 um 18:58 schrieb Basavaraj Natikar:
>
>> AMD X3D processors, also known as AMD 3D V-Cache, feature dual Core
>> Complex Dies (CCDs) and enlarged L3 cache, enabling dynamic mode
>> switching between Frequency and Cache modes. To optimize performance,
>> implement the AMD 3D V-Cache Optimizer, which allows selecting either:
>>
>> Frequency mode: cores within the faster CCD are prioritized before
>> those in the slower CCD.
>>
>> Cache mode: cores within the larger L3 CCD are prioritized before
>> those in the smaller L3 CCD.
>>
>> Co-developed-by: Perry Yuan <perry.yuan@amd.com>
>> Signed-off-by: Perry Yuan <perry.yuan@amd.com>
>> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>> ---
>>   MAINTAINERS                           |   7 ++
>>   drivers/platform/x86/amd/Kconfig      |  12 ++
>>   drivers/platform/x86/amd/Makefile     |   2 +
>>   drivers/platform/x86/amd/x3d_vcache.c | 174 ++++++++++++++++++++++++++
>>   4 files changed, 195 insertions(+)
>>   create mode 100644 drivers/platform/x86/amd/x3d_vcache.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index e9659a5a7fb3..11b829956499 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -965,6 +965,13 @@ Q: 
>> https://patchwork.kernel.org/project/linux-rdma/list/
>>   F:    drivers/infiniband/hw/efa/
>>   F:    include/uapi/rdma/efa-abi.h
>>
>> +AMD 3D V-CACHE PERFORMANCE OPTIMIZER DRIVER
>> +M:    Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>> +R:    Mario Limonciello <mario.limonciello@amd.com>
>> +L:    platform-driver-x86@vger.kernel.org
>> +S:    Supported
>> +F:    drivers/platform/x86/amd/x3d_vcache.c
>> +
>>   AMD ADDRESS TRANSLATION LIBRARY (ATL)
>>   M:    Yazen Ghannam <Yazen.Ghannam@amd.com>
>>   L:    linux-edac@vger.kernel.org
>> diff --git a/drivers/platform/x86/amd/Kconfig 
>> b/drivers/platform/x86/amd/Kconfig
>> index f88682d36447..d73f691020d0 100644
>> --- a/drivers/platform/x86/amd/Kconfig
>> +++ b/drivers/platform/x86/amd/Kconfig
>> @@ -6,6 +6,18 @@
>>   source "drivers/platform/x86/amd/pmf/Kconfig"
>>   source "drivers/platform/x86/amd/pmc/Kconfig"
>>
>> +config AMD_3D_VCACHE
>> +    tristate "AMD 3D V-Cache Performance Optimizer Driver"
>> +    depends on X86_64 && ACPI
>> +    help
>> +      The driver provides a sysfs interface, enabling the setting of 
>> a bias
>> +      that alters CPU core reordering. This bias prefers cores with 
>> higher
>> +      frequencies or larger L3 caches on processors supporting AMD 
>> 3D V-Cache
>> +      technology.
>> +
>> +      If you choose to compile this driver as a module the module 
>> will be
>> +      called amd_3d_vcache.
>> +
>>   config AMD_HSMP
>>       tristate "AMD HSMP Driver"
>>       depends on AMD_NB && X86_64 && ACPI
>> diff --git a/drivers/platform/x86/amd/Makefile 
>> b/drivers/platform/x86/amd/Makefile
>> index dcec0a46f8af..16e4cce02242 100644
>> --- a/drivers/platform/x86/amd/Makefile
>> +++ b/drivers/platform/x86/amd/Makefile
>> @@ -4,6 +4,8 @@
>>   # AMD x86 Platform-Specific Drivers
>>   #
>>
>> +obj-$(CONFIG_AMD_3D_VCACHE)     += amd_3d_vcache.o
>> +amd_3d_vcache-objs              := x3d_vcache.o
>>   obj-$(CONFIG_AMD_PMC)        += pmc/
>>   amd_hsmp-y            := hsmp.o
>>   obj-$(CONFIG_AMD_HSMP)        += amd_hsmp.o
>> diff --git a/drivers/platform/x86/amd/x3d_vcache.c 
>> b/drivers/platform/x86/amd/x3d_vcache.c
>> new file mode 100644
>> index 000000000000..833e7704e6f9
>> --- /dev/null
>> +++ b/drivers/platform/x86/amd/x3d_vcache.c
>> @@ -0,0 +1,174 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * AMD 3D V-Cache Performance Optimizer Driver
>> + *
>> + * Copyright (c) 2024, Advanced Micro Devices, Inc.
>> + * All Rights Reserved.
>> + *
>> + * Authors: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>> + *          Perry Yuan <perry.yuan@amd.com>
>> + *          Mario Limonciello <mario.limonciello@amd.com>
>> + *
>> + */
>> +
>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> +
>> +#include <linux/acpi.h>
>> +#include <linux/device.h>
>> +#include <linux/errno.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/platform_device.h>
>> +
>> +static char *x3d_mode = "frequency";
>> +module_param(x3d_mode, charp, 0);
>> +MODULE_PARM_DESC(x3d_mode, "Initial 3D-VCache mode; 'frequency' 
>> (default) or 'cache'");
>> +
>> +#define DSM_REVISION_ID            0
>> +#define DSM_SET_X3D_MODE        1
>> +
>> +static guid_t x3d_guid = GUID_INIT(0xdff8e55f, 0xbcfd, 0x46fb, 0xba, 
>> 0x0a,
>> +                   0xef, 0xd0, 0x45, 0x0f, 0x34, 0xee);
>> +
>> +enum amd_x3d_mode_type {
>> +    MODE_INDEX_FREQ,
>> +    MODE_INDEX_CACHE,
>> +};
>> +
>> +static const char * const amd_x3d_mode_strings[] = {
>> +    [MODE_INDEX_FREQ] = "frequency",
>> +    [MODE_INDEX_CACHE] = "cache",
>> +};
>> +
>> +struct amd_x3d_dev {
>> +    struct device *dev;
>> +    acpi_handle ahandle;
>> +    /* To protect x3d mode setting */
>> +    struct mutex lock;
>> +    enum amd_x3d_mode_type curr_mode;
>> +};
>> +
>> +static int amd_x3d_get_mode(struct amd_x3d_dev *data)
>> +{
>> +    guard(mutex)(&data->lock);
>> +
>> +    return data->curr_mode;
>> +}
>> +
>> +static int amd_x3d_mode_switch(struct amd_x3d_dev *data, int new_state)
>> +{
>> +    union acpi_object *out, argv;
>> +
>> +    guard(mutex)(&data->lock);
>> +    argv.type = ACPI_TYPE_INTEGER;
>> +    argv.integer.value = new_state;
>> +
>> +    out = acpi_evaluate_dsm(data->ahandle, &x3d_guid, 
>> DSM_REVISION_ID, DSM_SET_X3D_MODE,
>> +                &argv);
>> +    if (!out) {
>> +        dev_err(data->dev, "failed to evaluate _DSM\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    data->curr_mode = new_state;
>> +
>> +    kfree(out);
>> +
>> +    return 0;
>> +}
>> +
>> +static ssize_t amd_x3d_mode_store(struct device *dev, struct 
>> device_attribute *attr,
>> +                  const char *buf, size_t count)
>> +{
>> +    struct amd_x3d_dev *data = dev_get_drvdata(dev);
>> +    int ret;
>> +
>> +    ret = sysfs_match_string(amd_x3d_mode_strings, buf);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    ret = amd_x3d_mode_switch(data, ret);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    return count;
>> +}
>> +
>> +static ssize_t amd_x3d_mode_show(struct device *dev, struct 
>> device_attribute *attr, char *buf)
>> +{
>> +    struct amd_x3d_dev *data = dev_get_drvdata(dev);
>> +    int mode = amd_x3d_get_mode(data);
>> +
>> +    return sysfs_emit(buf, "%s\n", amd_x3d_mode_strings[mode]);
>> +}
>> +static DEVICE_ATTR_RW(amd_x3d_mode);
>> +
>> +static struct attribute *amd_x3d_attrs[] = {
>> +    &dev_attr_amd_x3d_mode.attr,
>> +    NULL
>> +};
>> +ATTRIBUTE_GROUPS(amd_x3d);
>> +
>> +static int amd_x3d_resume_handler(struct device *dev)
>> +{
>> +    struct amd_x3d_dev *data = dev_get_drvdata(dev);
>> +    int ret = amd_x3d_get_mode(data);
>> +
>> +    ret = amd_x3d_mode_switch(data, ret);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    return 0;
>
> Please directly return the result of amd_x3d_mode_switch() here.
>
> Also i think that maybe there exists a way to avoid locking data->lock 
> twice
> during resume, but i will leave that to you.

I will leave as it is.

> Other than that:
>
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>

Thanks for the feedback. I will re-spin a new version after looking for 
more feedback from others. Thanks, -- Basavaraj

>
>> +}
>> +
>> +static DEFINE_SIMPLE_DEV_PM_OPS(amd_x3d_pm, NULL, 
>> amd_x3d_resume_handler);
>> +
>> +static const struct acpi_device_id amd_x3d_acpi_ids[] = {
>> +    {"AMDI0101"},
>> +    { },
>> +};
>> +MODULE_DEVICE_TABLE(acpi, amd_x3d_acpi_ids);
>> +
>> +static int amd_x3d_probe(struct platform_device *pdev)
>> +{
>> +    struct amd_x3d_dev *data;
>> +    acpi_handle handle;
>> +    int ret;
>> +
>> +    handle = ACPI_HANDLE(&pdev->dev);
>> +    if (!handle)
>> +        return -ENODEV;
>> +
>> +    if (!acpi_check_dsm(handle, &x3d_guid, DSM_REVISION_ID, 
>> BIT(DSM_SET_X3D_MODE)))
>> +        return -ENODEV;
>> +
>> +    data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
>> +    if (!data)
>> +        return -ENOMEM;
>> +
>> +    data->dev = &pdev->dev;
>> +    data->ahandle = handle;
>> +    platform_set_drvdata(pdev, data);
>> +
>> +    ret = match_string(amd_x3d_mode_strings, 
>> ARRAY_SIZE(amd_x3d_mode_strings), x3d_mode);
>> +    if (ret < 0)
>> +        return dev_err_probe(&pdev->dev, -EINVAL, "invalid mode 
>> %s\n", x3d_mode);
>> +
>> +    devm_mutex_init(data->dev, &data->lock);
>> +
>> +    return amd_x3d_mode_switch(data, ret);
>> +}
>> +
>> +static struct platform_driver amd_3d_vcache_driver = {
>> +    .driver = {
>> +        .name = "amd_x3d_vcache",
>> +        .dev_groups = amd_x3d_groups,
>> +        .acpi_match_table = amd_x3d_acpi_ids,
>> +        .pm = pm_sleep_ptr(&amd_x3d_pm),
>> +    },
>> +    .probe = amd_x3d_probe,
>> +};
>> +module_platform_driver(amd_3d_vcache_driver);
>> +
>> +MODULE_DESCRIPTION("AMD 3D V-Cache Performance Optimizer Driver");
>> +MODULE_LICENSE("GPL");

