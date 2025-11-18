Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011055.outbound.protection.outlook.com [52.101.52.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9D926ED37
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Nov 2025 16:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763484404; cv=fail; b=ZRJhQu8kru4QAbZWNFabrll6kUw/3+6JHUx63NJpstyjcH6YUlJGxY8OqzVDUtwsxTPr79GduysXGBBe/oU4dlZih9TEqBaiDOTTK74L0tIU+hqbp3y3qJnoqXMXIGGdeGUZdmXuc3/Trk/hoACsd90T19qAizsi7QxOUqYl7tY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763484404; c=relaxed/simple;
	bh=Kpw+kblqv5k0x5fQIi4LhIHSLOxjhd0oHyGU16SGE7g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oEFyMeu/jZBIbfeLNNTZYS+U9ROGCqfd/9aD/kRFuFLJ14qJG9Amf8Hm2pG6sWSafFmTOfhkhmpIJCxO5WSM7LNvQ4mM7+8sD5As73GVCAAa81SpveFUxWq0Ww9jQfE4woWQlFWSiFC7ejGIv923u7sMs7PbUUb38+HuLw9bQXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=AZFg6Gpl; arc=fail smtp.client-ip=52.101.52.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="AZFg6Gpl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IeMYkQEucNU1ylh1jGQteVOQK7TtC1mP7iEv97sXK12yT8vBCinAPqjsAUi/0/D8nHx7Iscyyt0Rt31U8dVt3uiUnmGuJSU67Kp8SLPcXTbNUJO0VuSDdPYjz1nUJ033kofA6INn5xgok8DBwwNl2R1TmwL10beR3Fpf15dU4CB7+0hahOgGo5lgxXjAvEuFX0s+rja76RdxjkTIgaMirEarhtVInXxW2LrefrmwP5U1oqmqmZHXgKa1zLYW7vuhJ8pGYcOFe6ci+Tfvol+XI37qGb2WNQFQpt6dX0cWnHLGUsngFBG0PbFu5xohLbBxgj4iDXETpkQX/5KXU9/uQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cbifVPTEpnt9h9lhXvOLuox9WDPxmadj388UeNlNlCY=;
 b=AWSlAqnMQsvY82qHtrs91uTzmfWEXPKuqxp7eQQp09IKpBErkvylGezPcmMYY4WTlJ8DC4LRWfzpyV8TE12tjXkbMUFb7UtGhKm4CJJscsuFKyiPXYAyU6d8b0/moE4+tuciNQxlERFWGcxoqkxbwcs/49zGV0sJBEVFlhx2DtjQn+6vOLCYV70MoUorWY0+KcbRf41IEwnuECjVQ9mpEtJUfyAIeqTuktEOhSOKYk1aFxSCqFQJxj8UROxpPdSnxDDAJpKKn0WXtY/g9fctdYZoVSZ28ECKMIPIrkcN3LDGVE68zxi+UF3Pl2YmkVhNZxyUNq6xQ0jx3nto+7RyFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cbifVPTEpnt9h9lhXvOLuox9WDPxmadj388UeNlNlCY=;
 b=AZFg6GplkjGILJ66MC9f2qT3UQYBp1TgSNubhkNY8Zw+0nE2ADGhgyEf7s2PE/oLwBJkJ/40Mm49nYRUxMCgwWglkJlH3QxcQK/TDZsKfa4IAzCFYdve55j/wUUeNYkCdjm6uy0JTKqnSWOlfPIqfd9wqjdtcahVZRvrsJN17qI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by PH7PR12MB7892.namprd12.prod.outlook.com (2603:10b6:510:27e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 16:46:36 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%6]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 16:46:35 +0000
Message-ID: <bb72ff10-b9e0-47a6-8985-a68efcf204ae@amd.com>
Date: Tue, 18 Nov 2025 22:16:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] accel/amdxdna: Provide real-time NPU power
 estimate via AMD PMF
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 Patil.Reddy@amd.com, lizhi.hou@amd.com,
 VinitKumar Shukla <VinitKumar.Shukla@amd.com>
References: <20251111063737.4156385-1-Shyam-sundar.S-k@amd.com>
 <20251111063737.4156385-6-Shyam-sundar.S-k@amd.com>
 <7034fae1-4096-4cdb-a46f-5e23e7accfa0@amd.com>
 <b8f2d8a0-3131-45cc-8c55-8fbf4ca06cfc@amd.com>
 <e6551b53-cb89-46e6-9c3c-545d14d79642@amd.com>
 <8349468a-79ac-dc1c-d484-b9c9dd340e1e@linux.intel.com>
 <09397827-4233-77d6-ab17-dfe0ae5f1cfe@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <09397827-4233-77d6-ab17-dfe0ae5f1cfe@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0207.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::18) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|PH7PR12MB7892:EE_
X-MS-Office365-Filtering-Correlation-Id: 872033dc-45b5-4f35-7dd8-08de26c2094f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V3BkQ1NIOW8xZ3pYYXNES1A1VFVpMVNJWGVTY0FGbVRRcmVhZHlxblQ1Wmht?=
 =?utf-8?B?NUJjY2ZCMy9lLytFaXpkdG1sREM3blFiR2tuUkRHekJ2S09KS3R5WUhQcmlZ?=
 =?utf-8?B?ajB0aXNkeFFNSjlocVFaVE1RYUY0VmFUY1pEUlRNdEkrdFhwUzExa1ovN0dW?=
 =?utf-8?B?Q0I2UDhqSFpvWEg1bWxSODhjSGIwYytPYW9JZG1PY2NDbGljM3JCd0E0aDln?=
 =?utf-8?B?WU5HWEEwSlZvbW0rNUVKUXlDeXNIOFM2ZTkrdDdTWXlxNkltU012dzVjeHg3?=
 =?utf-8?B?Vktsek5ZZHpPTzY1b0UxVnlzVUE1L1U2R3BtWDVmMENVRWM0VkJZeVE4MzlX?=
 =?utf-8?B?Y1liTms0YURWd2ZTdWNMVGxnN3d0eW1mekpjeTZabGNvSTF6aDc3K3puamdX?=
 =?utf-8?B?b280amVyNU9vSUZ2VXNnQVBqaEdoREVoR0Qvc2ZTMHV3bWs1d1gyallMTDQ5?=
 =?utf-8?B?NHdDNTIyb3htRmlKK2VaSDg5YTFKaktmdGpRNGZsaTlPbG5OMWh3MldLVFhG?=
 =?utf-8?B?dlorOEdqWm9pWHZ6ZzdGaFBnMUhsSC94elR6dkFoRldmVDVyVXJheUR5cmRo?=
 =?utf-8?B?c05YNW0xQzJteXI4WUErS0k2Y3NXZ2FHd3hJMUVCK2tnV2dHbHZYSit2NVZM?=
 =?utf-8?B?YTRjWnJQdmN5Q2hsWEN3Z1V5RWxQSkpyUUw4eDN5OHVyRkR6cE5TNzV1NG1s?=
 =?utf-8?B?WUx6SVB0SzQ5RXc3QXl1ZjZ4WWVzMXQ3R2U2R0hUUllvb3pEalQ5ZWdPM0dJ?=
 =?utf-8?B?aThwMkJMOWxCWTU5dE9JMFNscEd4blVWME42eWxyK3U5U2pUWWRnb1JCVkdH?=
 =?utf-8?B?ZWZTc0NrK0xyRHdZa2xNamtTTFB5a3IxaFE0elU4KzBmMEhjenNUWCs0cUFD?=
 =?utf-8?B?SEd2U0svNGVaWldTdHozdWZSeXorRC9FTC9hK2NwUUtNU3kxN25DREMvQXJk?=
 =?utf-8?B?aFlDZEY1RUxQMCswRC8wWVd3SXlWQWxyVXhydFZKTlduaXJqL0pyeHJZdzVo?=
 =?utf-8?B?ODRZSFpqbUZ1UnpXaUlKNUsvY1hkWlFTQkJZSmxRS3J0Q3BTdWU1MlBlZ0Ru?=
 =?utf-8?B?SVlrbGU1azh4RnR2ZXRmWmRKb24zR0ZNU1FNSmxPaDRhYy9wdUhtaFA5T09N?=
 =?utf-8?B?T25MUEh5K0xZSVNNQXZFVDhWWFNuN1E0K0dzdmRLRGlTQ0lkcVdMNnFCWmhM?=
 =?utf-8?B?QlluUlVibUVVUXdZQXEyVUtmeWxvblBYM3pQcjRRVlQ0SDR4aGU1ZFFDNkJN?=
 =?utf-8?B?UWJVRTQ0Z3NpMUNVTU8yUTdFTlMyOStNSWdiMTZybnlZV1VKTENGQ1U2N3Nj?=
 =?utf-8?B?R2lxRDdBRGVWRFRPWjNvT1hrZDJIY2VyemxOSlVCRGVjZG9YbHR5TWJxWm1x?=
 =?utf-8?B?VFpyR2JHYXkzQm5EdVM0ZGFFL3d4UU9aV1dpcSt0VVJ5ZTkwdDJWRXcxZk1D?=
 =?utf-8?B?UXhzL3lvRzd5eFZsNS9KWWJkRWVpYko3MFRZOWp0bm96T0IzdjVGckN0Qi9v?=
 =?utf-8?B?cXJjUjM1UmpreDFIalVHWW0yYThlMWF1a0xteDV5TjZ2ZG5rQ0IzN0ppaXJl?=
 =?utf-8?B?VlNuVnl5azZsMkJwUC9GWEh3WEhDL2dxemdIZVFvZm9hUlF5MXZvNWluZEZD?=
 =?utf-8?B?RXFqaVFxNGdzNVNLNWhwbnJaK3dXMm1xVHVkUENGbmVITkQ1ZEtrVzZNQ2V0?=
 =?utf-8?B?YWxLOFN5ME51WHVnOFV2dFU2aGxRekcwbk1yL01kSks4UHZMbUlWa09MaGJm?=
 =?utf-8?B?MU1NTU1jNjRtYnl6NWdZNjMzNUlsQkduVENpb1VGaXl1UE1XbWhQMFd1OVZK?=
 =?utf-8?B?TWVXbUVSZzYrL1hHQnEzeG15MWtZbFcvRVgrRHI2Mmkva0lXTVhlR0E5NVlR?=
 =?utf-8?B?b0Z1bWtVaVM0NkcyT3MyMjF5ajRlSC9MY2U4THZHNTBBbmRtYWtBRzF1Sjk4?=
 =?utf-8?Q?SDWdaZwJZQ8Bxlv5bjDEsL7hne7fjsMU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUg3dnFnSlpCSHFaMFNKRFF1TTl3RnAzbHpMNmNFMFdSQXFlMHlQZzdST2FT?=
 =?utf-8?B?dU0vWGlSWm9STEVVcllUc0xUWTl5eGRlKzU5eWMvMUdoT09lUzlpbGx0eU9w?=
 =?utf-8?B?YkdMb21CYldFR3B1aFpmWTVJR0lMQXpGNjNHZDlqSGF0RVhvME92RWVSVWxC?=
 =?utf-8?B?RFIwbTZmZ09yK2FPazUrR0VDSDFCdVB3TVRHRVBiN2lGeVl1RjI5WlhTSUN0?=
 =?utf-8?B?ck9HdXpIUVo5TXJaSnJKN0lYeEdjRGJZcG9IQ0pocGJ6K0RCNlp2cHlIOXo1?=
 =?utf-8?B?Y0RldDZoeS81YU9yV3VDSEpXYUdVVnRSOEdlZTNVd0dmUVArUVBPalRxeHJI?=
 =?utf-8?B?Y3kzQWtBNmdWU1krSmM5THFWdjdnVEZaR09rNlczUWdRSlNSMlo5MzJtdEw4?=
 =?utf-8?B?K3ppQ3VnejZkRWE2VS9wb2lidVYwaTIxOGgxaS8zd3hXVXF3dUZYbW9jajBZ?=
 =?utf-8?B?YkxiNlptVnBJN2xKMmJVUXl4YktXajRkRU91cVZJd0xCL0UwOVduUThVVUZ3?=
 =?utf-8?B?RTJVK0xqa0pwYUkvelIxNW96a1U2N0dEd0g2S2krMWJmQ3phd1FGcXZ6bmtr?=
 =?utf-8?B?VWEwRkRXYUV6eGRFM1BINGNJckpYMUxOMklhMFRKUys3S3ZQLzJBRU1jMUtj?=
 =?utf-8?B?MVFRc0d0ZHBUSi9yQlJpajlFL2tuMXRrUEhhTGVVVVhlajZ2QlJhbnF3RGdG?=
 =?utf-8?B?NVNRVE93Q05rRU93RnNFT0RlRGN3ZWxlSjJPM1I2dFF2QzMwRDlNUU9wRUtD?=
 =?utf-8?B?ZmVZaDVNYy81RlZZU0R0NXlqSjFCS1JYYngyWGdmZlRwVHBMMlVPeDkwRFlN?=
 =?utf-8?B?MG5EZ0pGUEg3ekhFd1ZtSGVGTlRWdjdmZG9BWTc1QzQ4RHdkYmhFTTh2b3F5?=
 =?utf-8?B?eVpvekkvR0w4NG5kVlV1M2NKK3RYM2xOa3dIWGFCVlRFdVJ6ZjJHbnlvVTMv?=
 =?utf-8?B?UktyVFJ0dy9nWldrV0pTSHRSWGtianRCWjZDdU9mQkRWcU1BekdHYk05cHcz?=
 =?utf-8?B?N09OM2RBR2UyYXJ4aHZMT015R3hRcmJEN0xMMGg4UGdHOGxDdW5LZytxSlgx?=
 =?utf-8?B?eTBmS0tEOE1oRVNwc0hpZzNZS0dZMXI0U3ZYMk1KeUNJZUtrV0QzeVpvemx1?=
 =?utf-8?B?V2VFT1JTT2FSV242TTE1dkpXNllIdG1ocDU4OXVBbjhiNTJZSGRiNlI1R3Bu?=
 =?utf-8?B?L0p4T0xaUnJ2aDY1UDVybEhnMU1vQVZEYi9xeTR5dkY5ODk2RHZvRUlaMk9Q?=
 =?utf-8?B?cDFjVEt2SkVOU3c0UkdXbU5GUloxM0IzM2V4cldtMHBCc2tqUUY5MlV0RjRU?=
 =?utf-8?B?d2hHV2dEdGlySWFTR2w3cm9CeG85TkNYMHNZMDBVaytCeHdhMjBkSFBNRG4v?=
 =?utf-8?B?aEU5TVAzNFE5S0xrUkp5TVJ5bTR2d3poZTcrbVhJS2dPUVRoK3ZVRHdjb2pt?=
 =?utf-8?B?SGxuYVRMeERCdjRsNHFCTVRzakt1SDVRNm5JUXBkQTIweGFXelkya2Y3aEVn?=
 =?utf-8?B?Q3pMZEVtb2MvZC9MUjJ1L0JJY2x6ZitGNjZ1MG0wOSs4dWN4ZzlDVDVKenpO?=
 =?utf-8?B?Vk5OOUsxQkkxK0crcXhUM0pjWk9EVnVjZzBGdktNdUFmQVlrRjlSMk5KaGZV?=
 =?utf-8?B?blcrMWxhTXJuOWdDemJZMzQxZmtkVG1mMHA0Z0p6L25pVTZpWTd1bEFDY3hC?=
 =?utf-8?B?bWJMTnRvRTFPUmw2Njg2dkt1ckpoZSsvZXprd3hGMm9vdzNRT1puWUNuamZ1?=
 =?utf-8?B?eGZCbDRKejNQeTdHTlFRK0t5YlB4ZHNFZEUySHh6YkJIUVJyWEplNXRPRE1Z?=
 =?utf-8?B?ZHRXWjJGRjBTVGV3RENFNlJPMmdDeElpZVljSmVlWjVHYnhTSEF0NGFFRmlk?=
 =?utf-8?B?Q25yZGtCMVQzanE3Q2JpY3ZpTngvdzBVQSthY09TeUw1TlAvYXdnYytDTTcv?=
 =?utf-8?B?NUpVVnE2clg0aFJGUDR2d3J5MUZSV08yVjlteVFFU2kyQ3V1RHpNQi9WdGND?=
 =?utf-8?B?Q1NqZzB4MC8ycG5BS09qWk5tK0dzQlB4b3EzMGxTRWh6M0NHeHpvaTVaWHd5?=
 =?utf-8?B?eVVncUZ5RitaQi8zM2lFaDZjcHJEU01hZWRmSE12Rnl0Q3RWWnpFTVZKZTVh?=
 =?utf-8?Q?2urcyZX/w5slrItgkAep1YCvi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 872033dc-45b5-4f35-7dd8-08de26c2094f
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 16:46:35.8546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UjBFduEasJUdiU0z1LfJvqEzPeVhj4dvdfrYIFXnYOowE/VDZUZWciMniEsQ9XS9tswZyJlYmJ0qmVr8e5u+ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7892



On 11/18/2025 21:31, Ilpo Järvinen wrote:
> On Tue, 18 Nov 2025, Ilpo Järvinen wrote:
> 
>> On Fri, 14 Nov 2025, Mario Limonciello wrote:
>>> On 11/13/2025 1:33 AM, Shyam Sundar S K wrote:
>>>> On 11/12/2025 23:33, Mario Limonciello wrote:
>>>>> On 11/11/25 12:37 AM, Shyam Sundar S K wrote:
>>>>>> From: VinitKumar Shukla <VinitKumar.Shukla@amd.com>
>>>>>>
>>>>>> Add aie2_smu_get_power_estimate() to obtain NPU power readings from the
>>>>>> AMD PMF driver. This xdna interface enables user space to reflect
>>>>>> current
>>>>>> workload power consumption in real time.
>>>>>
>>>>> But.. it doesn't.  It just adds a new function that could potentially
>>>>> do this job.  The actual gluing it to userspace in some way to use
>>>>> this function will be another patch.
>>>>
>>>> For now, yes.. that's right. XDNA team will add more support on it
>>>> that goes via the accel tree. But this patch is meant to have a
>>>> minimal change on the xdna side so that there is a  consumer of the
>>>> pmf symbol that is getting exported to the kernel.
>>>>
>>>> So, there is more support coming on the way. If you think, its worth
>>>> to rephrase the commit?
>>>
>>> Yes; that other support isn't happening this kernel cycle.  So the commit
>>> message should be accurate to what it's actually doing (laying ground work).
>>
>> To me it looks this and patch 4 should be submitted with the actual user 
>> instead of trying to justify things with far in the future changes. I've 
>> no problem with creating immutable branch if necessary when multiple trees 
>> are involved.
> 
> In case it wasn't obvious, I'm fine with taking patches 1-3 in earlier.
> 

The context for this series is that the XDNA driver needs
power-related information, which is only available from the PMF
driver. We’re providing that information via an exported symbol.

Patch 4 exports the data and patch 5 begins consuming it. The goal is
to establish the channel through which power-related information can flow.

Creating an immutable branch is a reasonable idea, but in this case
all further PMF-side work stops after this patch. The subsequent
activity is primarily on the XDNA side — for example, passing the
power data into the XRT environment via IOCTLs. If both trees had
active development or large, simultaneous changes, an immutable branch
would make sense, but given the current situation it doesn’t seem
worth the added complexity.

The XDNA changes are distributed and will be implemented gradually;
they depend on this exported power information from PMF. So my
proposal is for PMF to export the information now with minimal changes
on the XDNA side, and land that upstream. The XDNA team can then build
on top of the exported interface, and their changes can be submitted
via the misc-drm tree.

Ilpo, does this approach work for you?

Thanks,
Shyam
