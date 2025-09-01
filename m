Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2047.outbound.protection.outlook.com [40.107.93.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B245821CA0A
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Sep 2025 04:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756701632; cv=fail; b=DzdqNAouPxTKJjPa58bmf0sEz4q2s3q4kJz62FVKtGvDGhh+az4JFpD3/K8UsviBptFGHR+34qQ4c47W0Kq6GkUkeldyec1OuIIWucdIjvaIrc4AbrA9RPYw67kLX/VU9ju4cbYEjy49chCcDSbMjI5bhvoblSQrhy5oZp9yejs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756701632; c=relaxed/simple;
	bh=wlkN8ig5fRTpxMpXFhQ7fDy+ERUvniQVc/I2vqHijgc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BXRKq1Cby2iCt5w21OsmWERgjnyJugDY8XFScMXF0jQtlh2E4QZcnf8P0jCBJL5DDHYOTvJEQ2DZV3XcUhtPCHItVItRrxHNuVSob2hKvP65Bcf2J7T5MBYK+VG/2h4Z4kto9ncYhxQzCTP4Ey3mFtq9jdIcRF/OQ5A8kZrd+H8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GVq5V05t; arc=fail smtp.client-ip=40.107.93.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GVq5V05t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cbBvknA/YFin7REgHx+eR54M8uppxtDjMgifkxfYtsYfZS/2NXRdpSuzQxp2o/U4CkasFIh0yJxQ31/uyAAXjfCQOfcCcfinmu4YhcF1MCjUeGyP3UuO7w+n0RM9r7+DcTcJLxqe9ydF6kS7NcBXfOektOUF/p3lza7BSXlGiE/QGQr1RFtBWGVC6ArhkZ6yf32Pgtj6BSG299V9JX555A3520lMrFVSZeMYwf1nDi67xiefwDQ9N9Z4LZoaLp6ZRnW9Pfk70/PQGFxL37/5ZnydwRld73zybWLWT9zgAHzAWc615JrKPsaKfC76e2jsHB8s5Suy/bBHHpx56JLKSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1iqbOozzUnx9qGyMJ59CK0SVHgRd23Nl1lkOdxJlfRk=;
 b=dfRFLNHcS4jPGfzxo4zK+Y2qWzYEjkj8MeXWvTPEtRT9OfocE+0BVI4U2uGK28/e7JPrdQv+wWi6rjtakxhPJ/dPQHJwuWmO6cG71PliUaz7k+LHOySRK7DKSWd96UexsBJoy5JrtC2wP6pUrsmhVB0bsKU+dauSB5f5pOfWxiUHxOo7/BAIz1HJfi6bkOBQR5YKS4H5GwSv8UyedslACzp/diGgS7ZtVNTT8uct5dQOt6W4cMGO13Q2rPsIokXreaikXKRAeJgQHgly2E7fgv94T/Plf3VioGFoDOMlyuPj9jY/JFY0IbIzcDm0gBGrknDInMoufx8rQyQARmFH2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1iqbOozzUnx9qGyMJ59CK0SVHgRd23Nl1lkOdxJlfRk=;
 b=GVq5V05tVmmAoJvtek+OpQ5+EP9IQVMdU7XO6GC91BTEXvu/iZ3q+7Ntdl45fgNoRbSRCzRyYdYh8sQfF7t3ak3XaguVNE9WC9wlEoVyuTvWP0O4tub8zFi6hww8xkiflF6SB7fVAIAyq78eQ/y1b/GFN5OF96lLgdF+2ebSZjA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by MN2PR12MB4254.namprd12.prod.outlook.com (2603:10b6:208:1d0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.25; Mon, 1 Sep
 2025 04:40:28 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%5]) with mapi id 15.20.9073.026; Mon, 1 Sep 2025
 04:40:28 +0000
Message-ID: <a7c3e818-1e14-48ff-a462-79e148cad460@amd.com>
Date: Mon, 1 Sep 2025 10:10:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/9] Enhancements to PMF Driver for Improved Custom
 BIOS Input Handling
To: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
 mario.limonciello@amd.com, Yijun.Shen@dell.com
References: <20250830050009.454739-1-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <20250830050009.454739-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0089.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2ae::7) To DM4PR12MB5184.namprd12.prod.outlook.com
 (2603:10b6:5:397::18)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|MN2PR12MB4254:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c72a3be-c3f9-48f4-21bb-08dde911ac42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VzVZQXptdHY2MUtLWTAxbHJUTDlNbnNaREx0MGlyOWlleWhCdjBLZlNoUkdF?=
 =?utf-8?B?M0pzNTg3a3p0YzhWSlkxRkVXWEJmQW5vL2QzNm00VUhSaXBBNTZSek1TRGdD?=
 =?utf-8?B?QjlkQTd6cndlWVRVUzZCZDNvb0o2Y2xxTDJZUU40dC9aYW1LOHc5YllaaHZn?=
 =?utf-8?B?L1E1cEVUcU4zQVk3UWtSWU5IcjgydG5kWTdCOTVnSWRyaUNxZkViYWNOVWxu?=
 =?utf-8?B?MkF6TmF1cU94UU5rV1pQOWVvZ2NhZDMxdU1zVUFsUGFHczRQbkJ3cEVhZXVU?=
 =?utf-8?B?QzdlYi9MU1lFSldubFgxdnp6RERIWUllcmtCMHBVTVR3SWdRUTBFZXRSeGF6?=
 =?utf-8?B?WWEyWlBiU2ttOXpZcDNKQ0tXRlJERnA1TEFiTWE4ZW43aW9YTTJ3WWNTRERW?=
 =?utf-8?B?dHhuTTcyczhPUXdTVFdxZmhUN0xLc0JQT1lkYzE3R1BpNVV0S0hFdFNQQU51?=
 =?utf-8?B?Qk9OMFJWUTgySG9tR3ZlUCtjSnJhdDIrWnFCakhrTXF1WHpJSlkzTWp1eXpo?=
 =?utf-8?B?R2RHeUVGc3l6WXd0bjJvTGk4WnhTTWNteFZxaG13dXl4SHJEVDNZNkJiQUho?=
 =?utf-8?B?c0hjc3dtdW5WUGJqZ0c5b2NoYS9pNEphU3ZOQ3hGVlJFcWJTdW02SE5hZ083?=
 =?utf-8?B?dFVqWjl6MHF6dTZ3ZFBpbTlEQk9hT1lsbTVHTVlLSFdsVlhsU0tCWmJ5dkJy?=
 =?utf-8?B?RG1xK0VYVFZDU1hVMXhaRXI3eDA4TXVqQit0b1NJVnpEbWhQQjRjd2hQakpB?=
 =?utf-8?B?eVA3ZWpiU2JmQWVKbHNja0E4bGtEdlhCcUpzaXIwTlBPQ3ZVZXRUMXI4N05Z?=
 =?utf-8?B?dy9lVlQ3R2lSM2p3NXorRVVpMUJ1cFVTWS95ZHFldTZ3QmlGdG1HM2tYeUxy?=
 =?utf-8?B?aHZ5Wmt3SkhLNEx4b0tlNkk1S1NsNHVBV0h4c0owM2Z2ZXFoSnlUenlFSTZY?=
 =?utf-8?B?ZE9oblVIQmFwSHVKVUtWaXBzQUFPOHpmWk9UZ3hyYndTZ0R3ZWRiLzdRVE1P?=
 =?utf-8?B?WTNJZVNRT0hldmhDcTVuOWxTWDFITnVHaEVmQ0tldkJnMTdkcDd5cUkweXli?=
 =?utf-8?B?Vng0TkZIREk5TFlldGJqckVXd2dQODlRd0Rjb0pkb1AzMFE3WDBxU0NJKy80?=
 =?utf-8?B?UHJYU2ZEdHJHejRRdkZXYjdBdG5hTXQxM1ZES2pTQzUzMVl6V1FDTEloVmhH?=
 =?utf-8?B?bmZ0YjhKekpLRTczK216cXFZNWJNcG5wYjBxNG1saWlBUWMyQndQanI1bHdL?=
 =?utf-8?B?b05TNUtnSVlSOVhEaFh5aWFRSzZVR2hNcE9FM0FqeW8vOXMzQVlmVWc4L1hj?=
 =?utf-8?B?dWdPOCt4ZG0xQ1BTaEdjWUIxaElFZi9KYUVFWWwxbCt0Q3lsbDIyWkVHc2JM?=
 =?utf-8?B?QVhZWGc2WW0vbGtZazU1bDg0Y3JiVitwS0FGN2dDZEV0RXVDU1RJWFJtZHlL?=
 =?utf-8?B?VFZxbHFHa09lRngzRVZBMDRZMmJZSzRHVURXVEcyTnJScG5WZVRxdGVLMUFS?=
 =?utf-8?B?a1N2emtBZWNWdFR2bXF1TFIxbUlUR0hyay9PL3I5WCtYV0hmZEhMUmlia01P?=
 =?utf-8?B?M2VSVUlDSmVaRllMVlpEcUtmZFZRYXBrOXEzZk9TZ0gxQTBROGsvM0h3SGJJ?=
 =?utf-8?B?ZElHcXppQUwxaDcyRTl5eHdwMVZJYStwc3dFSGpBNE9EOHlBd0ZONDlQVElV?=
 =?utf-8?B?WG5hUUNTL2JQa0ZQamhMVkFaSUVFck1JSCsweUpidUlrendPTUZxZEpVcy8x?=
 =?utf-8?B?MXUwQmN5cjRwT1BTclhOYmJWamxRV3crRHBjY0tWL1hLVjlCRXBZTFoxa0dv?=
 =?utf-8?B?UFVENTlEc0hCN0VEeDByTVJOc3g0SVVCV1QrSStKV20xSXoralYxbksvMEds?=
 =?utf-8?B?dHVodUhkNlpRak9TbldSZmNaRTBHTG9vd1haZHF1SkIzWFE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmpxRWtFcWtlV1VpTi9KdVprWkNqVHVka25JRk95MkZrTUZGeHFaK0VBQmNX?=
 =?utf-8?B?OUkwSkhFOE5uNlNCU1FUVm81RDRmS0lUb05jWW53dW9Ecjd6YjZpeWFpTGt5?=
 =?utf-8?B?dnZpSWxsVSsyT3RHK3dMLzFlaHo4UUlIcHlKQmh4OHlmM21EaitiTEFXUXBM?=
 =?utf-8?B?TE1rWDNoazF3c0JtWTl3d3NNbnNMNXc1MmNmUnJzVFVVUUhPNWZza2l4akhx?=
 =?utf-8?B?NXhkVHFQTXA5SGxycjA3K1M3QmduUXVHUm51d211MU9XZURLV2RyUDhBUWxD?=
 =?utf-8?B?RllYOGJCVlYwSnEyYlpXVm5NTitxTnlvZ0xXZjE5SFBhTnM4empDTmxFYm5h?=
 =?utf-8?B?RytweHd2b0Jmd2g2MDIrZTErc0hJNVlPRXF5OVp3MzV3NDlkOEpHRTJoVXYx?=
 =?utf-8?B?TFMvakZUbUU2ZERxUkw2NldXVDFsNTVsNmRQNDNOT0FHeldGenJJVlM0ZXFs?=
 =?utf-8?B?ZWxFcGVOcnF5dHEydGw3L0VVSnJmSHhaTEFxSGJtWTJUYURZcEFHWjA5VEcv?=
 =?utf-8?B?aXJWMnN4ZFQydlJVWmplVmtxUkpaQzBUbVB5aEU2K01uYkhrbm9penV2Q0Y4?=
 =?utf-8?B?RkRsam1zSEhDSWE1bWMzR05MR1JYWEVmaUo0THphei9xak5SU0hERCtiQVdn?=
 =?utf-8?B?azlnTlNuT1FpdDBmSyt4UXNJMjA2Wi9FR1V6bnFQL2gxWjFwUWQ2OXU5RUV4?=
 =?utf-8?B?eHhtYUlhWWVhL0JqV0k2WFMyVDE2MktmdlJjeFJmWVpTWm5WRHlSbDZ2SnNz?=
 =?utf-8?B?bWxBcHpSZjJlMDdTeUtPMjFvMk1xWlJ4dVkyd0tkNEU5WmwveGhDVHBGUlJ3?=
 =?utf-8?B?Vk0vTnFIN3BoOGRCNDQxclpPZHhXUCtqbFhOeUVBNlU2Z1EzYWYrOElybzRM?=
 =?utf-8?B?ZExxcWRiamV4dTFVamVuY2FiTjZ2bjdYTkcrZ0p2dDdGZzhIRDZWWHdraFoz?=
 =?utf-8?B?TWZubVNvbzZ1WFNMbmhsQS9vaUVzQ3pjK0dUQmxMSmF5dVBpWnJldEVncmFK?=
 =?utf-8?B?aktHK1lIM0FoY0UwdThCV0d3bG5WYmJOOHRGZmdJMng3RzBBYU1FdlBaNUJz?=
 =?utf-8?B?M0R2MmNJOFBjT0dUeUhEUUI4cUFINDJHMTBRWHJESk1yREQ2TWhEVlBQdGw2?=
 =?utf-8?B?Y2djZHh5ZHBkckEyejcwNDdvM0NldVBKYk8vZGhuUktIamJqOGlNNTJjYTAr?=
 =?utf-8?B?Z1Q4V044b0VmUUxkNWdWRzgvaEIrc1dKb1h2S1NMWWFTWEFIOGlMNm5RMGE1?=
 =?utf-8?B?ZExpSmFUS1ZvOUR6a2pOWWtnOGU2WkZtM2J4SisxZ3J5a3d0UFAxTFdCVGdO?=
 =?utf-8?B?VUNwUWJvY0hvbThuc250M1ZzZTU2N1JScThQS3Bxb3VTdE04Umc4elQ3cFFa?=
 =?utf-8?B?RGhDQ1FwemREK1lpbXpxVGlmMGt5eWoyaE9maTN6cWwvQlBrTWVYWFMxem5Z?=
 =?utf-8?B?WER4UzRPMzk5bVFBVUtsTVBBcnVKMWxIV29sYjZsSU9jeFNac2JqNnFGaDZw?=
 =?utf-8?B?b1J5WDJsaDhET2ZVMVBTZFdNSzJuQWQ4aUc3enRXeTcrMTFtb0JPWHVBMHpR?=
 =?utf-8?B?NE1UanFsVS96VkhKdWhZNnk4UmdtcVlsQWJzNmYxR1B2SFFTQXl1b0p1VVRy?=
 =?utf-8?B?OXJxblI4VGNWVVZ0V1FXdUJpcEVjZ0VqV3VydGhzUnB2L0NsRmhlWGI3NFFq?=
 =?utf-8?B?L24vVi9vY09PZVozV3BrSzJZT3d3aTFoUkpFUzl2aFNwMnR4QkpMamEybm16?=
 =?utf-8?B?Y3FrcVJGb29vTE4xRzRiNEhkd1RXMTdWblpuY0NaSkJBWlVLU29Bb1lLUmZm?=
 =?utf-8?B?SitoMitVQmtqUStkeVM1b2JyR2h5WWxSdjEzR3hhS1Y1ZVJpUGhUUkdxU2d1?=
 =?utf-8?B?NFFoemF4Nk8yU2JGSXg1RGFlTDJabWsvd2RqK1ZnV0hDRENOam5mQThDMFp3?=
 =?utf-8?B?SVVRZUJEa21pSm1PaXFNUHQ1TDNVUXNNRklmbnd4NFRwZHI1OXBzQS9UT1ls?=
 =?utf-8?B?WEVPWStjcGRsdG14RFhJZnBLczMydVZBZ0k2Y09aNVRnRUV2UzVnYnJkbTd5?=
 =?utf-8?B?alBMQVhabE1oVEdBNU5WUC9pdXY3dlBORm0vQlplUFhQRCtCUnlYVmRiL1ht?=
 =?utf-8?Q?pHiUfyRm/b/uup1Af/1tanZ0V?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c72a3be-c3f9-48f4-21bb-08dde911ac42
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5184.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 04:40:28.3761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vy2hhUxFcKI3QP0U9itogrX9/FIozFomsJxjPIgghQvtdE4Fz3gzPQUs3O4oh7vmTo1tn9AIaajA8MrDqyv9Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4254

Hi Ilpo,

On 8/30/2025 10:30, Shyam Sundar S K wrote:
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
> 'commit ee1cb9b0e6a8 ("platform/x86/amd/hsmp: Replace dev_err() with dev_info() for non-fatal errors")'
> 
> v5:
> -----
> - Use unsigned int instead of int
> - Use switch and fallthrough mechanism for install/uninstall acpi handlers
>   v1 and v2. 
> - Use a switch case for amd_pmf_update_bios_inputs()

I realized that the email client did not the entire series and stopped
at "[PATCH v5 5/9]". Seems like there is some trouble with sending
more than 5 patches to me currently.

"4.4.2 Message submission rate for this client has exceeded the
configured limit"

Please ignore this series, I will do a resend again once the issue is
resolved.

Thanks,
Shyam
