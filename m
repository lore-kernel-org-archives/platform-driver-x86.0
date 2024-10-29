Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2056.outbound.protection.outlook.com [40.107.96.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D0E194AEE
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Oct 2024 16:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730218442; cv=fail; b=cA36Xyv9st3IyMO6yPM7K3alvMLgUhCBuN4DamFEGdQ1qaU7lezT8x0qu+P+s2tnVgB1+JkvJV9DBxBrKxhn9YTWGmroSKwDXWg/pnCN3FKP9qF6M6P63VQmHQ1+sR5Dqzc4Sb+P/PhaPBA+zRHEj9i9AuYXMUb+3p9fp4219Wo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730218442; c=relaxed/simple;
	bh=jXy/D8DpsBS7prEdtddN8REPdFmxOs+YTGOBC4AmaoU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RTWWwZ2/YmecZarrZRE5OmEpQzZC3vhIBy/TUAStd9n9topsYXwpNb2kvAxKN3bkHRK8C1knOLnOYBAQTUHZ3HLlKdvFVaXLMFN8kpH6kfgz19QXVzMAqyBShpkzP0lwH7M2zzMwqow2UN53SIOl84U1ha3kjGCYXVVDNZcxQlY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ffqTbqaP; arc=fail smtp.client-ip=40.107.96.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ffqTbqaP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EiNVLjdwN8FAVaQVKSFKCjx60cLA4AV6Ykw7wFwuF9DEjPxG93kZq0vyW3eLXDpFgCpOMPAsRC941KH/IxCkP7VH5BK5UPML0bnk8pLetpkgittjMclPcg9xi2Q/l7xjEe5WPlE6XZQvwgdgpEskZuTfO//rd4YB+Tu3LF0eB0LKyS0D2NYXL4RWYtF4HV8wYm5eoSC1jQV/vQgeT49BrLzXo0ytClNjXBKYKxGeVwrea898kJwZjinjjKGPx8X77B0k16Czu9HAt8U3Z5n2eDEllMko7radsj6bhZHHEd789CZ9Zo/F9zTU2wzlgjwX78Dq5sMkAFkgrgWHc+q5CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IVYyyPApurnDa0gaZUhwZWZe1pXXtlc3AQDo8LaL2FA=;
 b=cCQxE+zhWi0qGtHXPkzlscNpn0tKvMGU+YzH9Thd6vmEv0PeTR0QNLsfWjSUN5puCBVF2DTh25rqXjrd/o6Ae2VVaT2zdRUrI9H7AZc9sgicH64LV+jA6NP0O/DFXLh4Y27AwDAlvkoEn32vyCj8Rg+lf7Vfxzz8StUpD1JXBBZstiUUwHrC0qD3pWlEob0gvnewovHXEvXRjAOAUCYQZ47+TpaE0FZCQxyCfEvEWaoCj5dYUcxmS1jWTUSn55GPCWz057Axut+xEeANobmkn6nuxdoVluvy6HNNX2zK5zdfZIKlswBEd+bI/zqgvm89Xo8E7KRQ6Vx0c/9trqLMEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IVYyyPApurnDa0gaZUhwZWZe1pXXtlc3AQDo8LaL2FA=;
 b=ffqTbqaPaN55sSsOMri3S9QDb9CpqTzJDm2lIQtwXZTXdHN4nFS+Ac2oshoarRFlSYr2vDIZft/KQhd8Ti48IZtlHyRuH3wlSGYRfM91k185qZXuuh1n7x8u1sCOTH39eKNADYG6uIUV8I0OgJXxwxAWEXE57fWTq9bedrerTOc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CY5PR12MB6528.namprd12.prod.outlook.com (2603:10b6:930:43::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Tue, 29 Oct
 2024 16:13:55 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8114.015; Tue, 29 Oct 2024
 16:13:55 +0000
Message-ID: <b55d3d6a-08b1-48fc-8543-303edc014748@amd.com>
Date: Tue, 29 Oct 2024 11:13:53 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] platform/x86/amd/pmc: Update S2D message id for
 1Ah Family 70h model
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
References: <20241029155440.3499273-1-Shyam-sundar.S-k@amd.com>
 <20241029155440.3499273-7-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241029155440.3499273-7-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0046.namprd11.prod.outlook.com
 (2603:10b6:806:d0::21) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CY5PR12MB6528:EE_
X-MS-Office365-Filtering-Correlation-Id: 0add5dd9-7515-4bf2-9787-08dcf834afd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TS8zQ0V0THV2VUpDaTlpN1hlOVNWUFBORitxQW9pakl5NUM0VU1SN0ZjSVJ2?=
 =?utf-8?B?S244MjdTdVBlRkh4M3dLQ1NNaWNsK2pDVmZXWVBqTEIwUVQ5ZmVpejV6a0Rk?=
 =?utf-8?B?ZlVBQmR1QVpja3k5eHNIQ2s3T2JUN0w0VUtZNUhhLzJjKzFkb1dVT2RBZ3k2?=
 =?utf-8?B?VExEZy9hb2JWL0w1THBLN1E3VWRwWXh3dndVYWRacTg5VTdhV0o3d2xjRVBa?=
 =?utf-8?B?M05MbGQ3d2s5cmlVdVNkYURPbjVUVVRKeUd3dlV6aVZueVNYb3hadUp6V05z?=
 =?utf-8?B?M0I1dHczMHJTWmZkcFREZ3lxaGxxMnhBUUZuSTZqRG9CVFNsZEp6WkFJNDFQ?=
 =?utf-8?B?ZDlMdzNNd01vRkphanNmZWttck5vTmRKdFd5MXlnanY2cnV1K2Z6QklXb0xG?=
 =?utf-8?B?L09PZzN1TXQ4Ty9yWmxaWkpGem9PRHRaTDFuUzlxNFBCMU5wcTR6aHFiMi84?=
 =?utf-8?B?VHpFanFiQS9ieUJDL2xvRE1MU1pzNlNYUzNKYStDK3ZUb2FkYTBGdGplTzhH?=
 =?utf-8?B?MndrMVE1RUZPMW9tTGVDcHhYRmFZaldEN1E5TzRmMWN6N3JBaDB4MjI4RE9k?=
 =?utf-8?B?bEpaYk5NcVJqSGdYU3J5dkd2MFdRSkZNRHlFS0hGcVgwRVZUZHNPazFlN3Jy?=
 =?utf-8?B?MmlHeXM5WVVzVlhqME1xaythM3phMXhGbURYTUh3ZVNHdXR3OWpYbk1FZ2ZR?=
 =?utf-8?B?ZWxPL25vdi9FT2lMUVd5UU5JZ3d1NFNxWjhJN1JyeG8zU1dQL1FjN21hMFBR?=
 =?utf-8?B?bkhQZ1BkWUhGOTd2SlZtKzZmVTNDYkk3VFIrZzlsNEtGTXRnNHBneG9uNUcx?=
 =?utf-8?B?UzV5eUV3NHFHN2RON21XY05RbWlXblVYOE1STFB2V2FLekdmcTMzRlVqU3h6?=
 =?utf-8?B?cGFERzhaTEZVL3BMNlpwM0RXQng1cEN6Mk1Bb1JyRWc1azNURHJEUXgyM1Bn?=
 =?utf-8?B?dzQvZGVCVUd5ZXROQ3dVU1AzZ3FlWXJkeTI2Ukk1ZDgrTUZIZlBtWGd4L09u?=
 =?utf-8?B?aFRWbTNNdWROS21waEpQcUVQV1h0MzRBRStDL1pkNlJkM3A3TXgyMTlyc3hQ?=
 =?utf-8?B?NWt5WFRPSU0zKzF6aDJRencvV3M4anNUWXY3bGVtRi9lRTBWZlZlekRGRldo?=
 =?utf-8?B?dWR1bmZrd1pMVTRLQ0RlYStIUjN0YnU1OFFNcVpVWEVoeDZHSGI1bDdNbVpk?=
 =?utf-8?B?N1lNTjFWM1lMQUlua2VvbFFjcTk2NkhuV3VoVHYxb2xUU1l4eS9PeE5GUENK?=
 =?utf-8?B?Vy9rWEoxdGxhT2JBY2pTOHNNRTk3bXp3cDhTeER6Ti9qUXNGTkR4ZkRTT01D?=
 =?utf-8?B?NnBlSEluUlhxZUI1VU1VbEwybkFBVzRvTlUxRzE5OTNBVzdPRzhFdVZKSzFL?=
 =?utf-8?B?UFVTL3RzUFFkYmhZRVl0U2EzZWsyMC9za3VxNW83d2E4OG82eTY4SlFVd25n?=
 =?utf-8?B?OXRWT2lhdFBqSFpNREFtcnFYSVY0VGdzaHdORWZJS1lQOUY0VmxNYUNudU5m?=
 =?utf-8?B?MDNLSFV0eW1ubUtRNmYxRlNaMHJFR0ROcE5MdzNRUzJsZ0oyR2xrbkEyMWpQ?=
 =?utf-8?B?Q1R6dzlJU3BWWGw2by9xQzl0VklyUnp3c2hLUzQxQUN5MndMU1MxeXNhZ0x2?=
 =?utf-8?B?aTd2OFJuTGladXlTVThrKy9GVUJmbHJFdTRLdkRic0xmajdQYjFTTlVrOTJ0?=
 =?utf-8?B?TlRXRktERjdyYkxQaWdkTmVoaVhRSG1tYTB0OTZ4bkhKc3cwRldSOWxmc0RQ?=
 =?utf-8?Q?S4I9hv2GT4TGTbQgsHviEY6+L0+24w1ADrl8uge?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzVnNC81Zml4Z1BoSjlzN1ltOCtQY1JSaDF6VTB3NkJ6MW96c01Ka2h1eWdX?=
 =?utf-8?B?cUlFOW1namJsQmFzd25MdXppcVJBdmxiVXdwUExMcC9aV2UvSU9NYTJoSUhK?=
 =?utf-8?B?a3hsaTVBVVg1Q1Q5aTRZM0tJa1dPM21vZWp6M2tRVUJkWnJJVXJjTGRnT2pO?=
 =?utf-8?B?QXZPYjJMb0QwYjI2WUdBckJSOWRnYVo5ajJXd2c0L1VOaUh3aENwK1FtZVk4?=
 =?utf-8?B?TG1uakN3Mzc0SVA1UG5NRlZDcVlPUjZRK2R6a2RZM2xDZ09KZWtrK05SSHAr?=
 =?utf-8?B?LzhBTjJKcWsxMW1OVGVhcjI0ZnVrV1NlRUp3NjJsNzcvS2VJN0E4OStDVCtV?=
 =?utf-8?B?MmUrR1BITUFzV1BCWk5VZmV2eWhRODZoL09KTHY5aXpDSVdoU29DT2ZOaW5x?=
 =?utf-8?B?Vml5K0JDOUY4dEJLNUwrN1RvczdWSEl1ZFVaeTdIOUdaaFZXcEUzMWlTNEpD?=
 =?utf-8?B?YjlYNi9pRHMwNDJsMXh6TXlENXl4a0VHRzdPOTcxaWVZY3hnTW9ZTW1zeEl3?=
 =?utf-8?B?RGY4ekxvT09TOEFLcmV4WE03UTQwZFZLOGlObFU5WTNwM3pqUUJubGNHZHVU?=
 =?utf-8?B?VEE2UGFRcnB0a05wWllJSnhDR3hxNUF3M3VmNDZybGlvME9OQnlsaUZ6Uk8v?=
 =?utf-8?B?dUZuTmN5WFNPRUFmNEtzeThHNElGd2h3SFJLWENhQjUvY0pzQjBmekxTWllN?=
 =?utf-8?B?Y3BRNi9KbllSVThOVytsVmFuYWZYamU1OElkMFJUSndkaDRjMnphWlNpNTE5?=
 =?utf-8?B?c09HMzVCSW1FcVhYVytOZmhXWmxxZ3hxcWlodFh5MHJ6amxEa2xGanhhZXdr?=
 =?utf-8?B?M1grTFJKQXR5RXZ6MXlncEN0Q3ZreUpldkpyOGF1a0p5aDNsa1lIVk92R1k3?=
 =?utf-8?B?SWkxVEdnNm9Xa3hqL244b3BINVhvQ2RmYkJTdWlhOW5WVVZ6NmhBYmFURVNh?=
 =?utf-8?B?YlBzSDNQTE55NVY1V2l6WHUza1lYeFRsWmRPVGUrUEZnRXJMeENtUy9pWTdq?=
 =?utf-8?B?Q0tDdXcvNTJtMENGdjdZOFlNNzFUK2YwOVd4b0ZYNERoV0lvZE4rZWpIQml3?=
 =?utf-8?B?aU5QRTBpZUdkeXZ5SXo0RzMvdUZua0lPUWFsREhWbWJTVklaaVFGd0tDaFRa?=
 =?utf-8?B?djNRMWlYV1hFZ1ZNa0dSRWx5c2Iza1lWL2txRTZ5SHowdkE3cDgrTDNIcnN1?=
 =?utf-8?B?UTl0aTB2OWEvRUN2OG1lWEtjRFdBSWM0eE1ZdUN2bEpkZXBoU2pyaFB6dVF4?=
 =?utf-8?B?VnZwY0hQVlQ2SkIvQXBURWhRYkJLeGY1djJ2ZVZWUE8wVGtxVnR0UGlXbmkx?=
 =?utf-8?B?ZXhETFhlOHhzNG9ORnJRRlArVGxDQVVtbjlIcmVyU2tlbmtRMFZQU3Vqc011?=
 =?utf-8?B?THYveEExUnNhYTdwWCtVTW1zKzVjV1hSdEY2WDVVZ3JyRTJDS25KZVJJUUU1?=
 =?utf-8?B?enJkNElweitVRENVKzNjRllXMTJEVUs0ZHV1OTc4RjlxeU5aWWhoSlVCZDB5?=
 =?utf-8?B?eUpkM25FSG5QVjN0N2xTQldDblBZYW5YRnJmaHZZVnRFdGxKTzFLSVdRTXRa?=
 =?utf-8?B?WitDWkZMQTErUlNINEt5VzFwK2NvY3JJcFM2ZHBhOEJxa29XeDFSL2RBV0xW?=
 =?utf-8?B?Yi9XTFkyZDJuekgvVWFhMjJseXlkSVRnVTVneEtDSlFEejI1NFJZQzExWXdC?=
 =?utf-8?B?UDR0dkQvckEyK0xJbHJrcmpZY2ZZLzdHU1V0OW95elJRUkxoRkhpaHZPRmdj?=
 =?utf-8?B?cXhUVkxhTUdBenBrWHg4TEk5TnlGSWFqak9UQUZxMEdLTFRBcjB1VnU4d3pY?=
 =?utf-8?B?dlQzSXhCbGZYQkFzdzludTdtcTNybjA3RGxrYzhjeGtnMnJ2MzliMnJqVFU5?=
 =?utf-8?B?TUJEa3NCTE9HU1N3dXRBRVYxc2NWQVQzS2wzZXErTGVJc1lWVzQwaEJKbHVG?=
 =?utf-8?B?M0x6WU10Z2p0VVNxam1zUCs4dlZCajk5L1IwSnRac0VuMHhMbnN6YkpUL3Zm?=
 =?utf-8?B?c1owNlovTTVwVEIvdTRlM3ZhYVFWbWQ1dEY1cUZiSjY2ZUFKQVVBVk1Hb29T?=
 =?utf-8?B?d2w0RHF3bHFhNlpHNkl6bnJCMzMydDBHMXQzK3c0TnZhc0VhZWYvU1pqT05Y?=
 =?utf-8?Q?euRZ18Dqk8VPEfP+/bAFma1ZT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0add5dd9-7515-4bf2-9787-08dcf834afd8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 16:13:55.3987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +FovTmPs/vT0ayJbLHmbRei1ZpQ6PEx2tPJalLYlDxThauVlQTfCWoy0wSypJ2gbaf/aVyToamVLQl/IJSWw6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6528

On 10/29/2024 10:54, Shyam Sundar S K wrote:
> AMD's 1Ah family 70h model uses a different S2D (Spill to DRAM) message
> ID. Update the driver with this information.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

amd_is_stb_supported() might also want a refactor in the future too with 
cpu_feature_enabled(), but as a minimal patch this makes sense.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/platform/x86/amd/pmc/mp1_stb.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc/mp1_stb.c b/drivers/platform/x86/amd/pmc/mp1_stb.c
> index 1501793b9281..917c111b31c9 100644
> --- a/drivers/platform/x86/amd/pmc/mp1_stb.c
> +++ b/drivers/platform/x86/amd/pmc/mp1_stb.c
> @@ -251,7 +251,10 @@ static bool amd_is_stb_supported(struct amd_pmc_dev *dev)
>   		break;
>   	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>   	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> -		dev->stb_arg.s2d_msg_id = 0xDE;
> +		if (boot_cpu_data.x86_model == 0x70)
> +			dev->stb_arg.s2d_msg_id = 0xF1;
> +		else
> +			dev->stb_arg.s2d_msg_id = 0xDE;
>   		break;
>   	default:
>   		return false;

