Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azolkn19012044.outbound.protection.outlook.com [52.103.23.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42055C96
	for <platform-driver-x86@vger.kernel.org>; Sat, 13 Sep 2025 15:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.23.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757775876; cv=fail; b=dU5dYkzLf/g+7a6aYFReMCDnZrRSHQCww5yxsEc4uMVdOzDe43fmQ/SUrUP2OG4uUYo8WNlLtdz4wx/t8WxaGEiOwVNi7fAx3AhW0OnjO9CHqmWnbepJ22sApWwRDm4n23UThA8cfWr2ieyZ9QHhD/Khhezp4Aze/8dXrcf5Yfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757775876; c=relaxed/simple;
	bh=QpkhMdJyfQ8PGIOcHexvSKT1JDoDY1navCXMe2ymK/M=;
	h=Message-ID:Date:Subject:From:To:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hjlMPdl4PcQKc9SCp0CuEzwbCNTXe3tKLVuYirMb2V+pDYNQyVTU/w+R7uP6p7RgmNEgqqnrgpMdEi56jzYMfsGwIGZR3SgA9YV+9yBl5wsVlmRE2KajiJKAJpd3V33TKivtKxnnNt7HC4k0Wd4NDpY/Isx8hR27nhs+0pprE+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.ca; spf=pass smtp.mailfrom=live.ca; dkim=pass (2048-bit key) header.d=LIVE.CA header.i=@LIVE.CA header.b=JVsPRNbj; arc=fail smtp.client-ip=52.103.23.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=LIVE.CA header.i=@LIVE.CA header.b="JVsPRNbj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b9Jh+x38Kqip3gIAMdpoJnHbYdYg8whnFdypXsR2mEckiAcGrw514QWTsfJvoGJji8N4vi9CCff0ZuhvolMZLSmEB7rwBCtfghuiYGdMR/7XnaTn1qrY7IyTJP0UFod9musQe2tVrRId+DAHbXlO8ETaC3c7Sy9xh4HPQXqcADKkjpUSNQ+0pv6cHu/vwbYccz2O7sqApN4ZBhJWUBcoQ6nVLKVsB/MbA3BjKC82hgfK/m2K3GjiOktD65gGPpgqZl+qIRUIyXcWDCp56FC4dFlbb+CU6NxCmu7qF9rWOCnzq/N28bYuUwrqJM+/0VNlP1FDR5PM503AR1bJMzxvvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mHF4V27UXpyR7c4LaiRFnk3+v+TgOIPOVc6Ge2z4YbI=;
 b=VZ3R0jJ8Z4tOgEaNGQvD6lDJtG3FvttWd3GENSrk1Zl/q9E29r/lAfF35tyV/3yAE1CE/z5AV6wOvoDB6GZf5yljvoBkJ7J1b4nrP1Hhf/ZktOPFKgiWXgwFKVZVMQMXqncECCrq8GPhJjSxH7fdQeJkPv5KXtgrcSM5J+KfYE+foyGkBSTRhEHlK0vr5C0j1bE5lvj6u+BEEqAK0slchEoi9pwrghVfyKh+ncBNRi0htuStSKLJ3mAKzQIa3A5guxiMA9V7fiUmzr4X8F3EFWBO5pMQ4q0ZgymwhgoxKcLnnUSx9VIcnXl1w4Ma9ye5HHD5jdSkJ2XAKbl6I7rrwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=LIVE.CA; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mHF4V27UXpyR7c4LaiRFnk3+v+TgOIPOVc6Ge2z4YbI=;
 b=JVsPRNbjiJlIbckis1GjlWRiHb8E4hfGteRfzWP64HZtrg6DiD0Uc9Lsg2FY+fw507lFDJLoVvkOy+/bacBwiYV2mIhBC0JEJywDR3yxd1L5w+J1TPEHv0cQznSLMLv+03IT8fdlBLfMUBNcdZGQ8AYv1QM+57fhDYUOi8ZU6ddwr4OhI0D3IgdeJA4hwnqFQI2ZJH3CmJsrUGB3nBjEn9HvGzreTOTERaMaTyoSADmI5j4ZdW8CV3fvGg65HiFioMTLOlSM/VEdCnncLfTQTfiY/7ttXOmswsv6a2p++HyHLIw89Sp5Ch1d3hFYC0lDIsZFykkM3AUEyBhXwtZUdQ==
Received: from MN2PR06MB5598.namprd06.prod.outlook.com (2603:10b6:208:c3::13)
 by SA1PR06MB8104.namprd06.prod.outlook.com (2603:10b6:806:1db::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Sat, 13 Sep
 2025 15:04:33 +0000
Received: from MN2PR06MB5598.namprd06.prod.outlook.com
 ([fe80::96f9:fd1e:4b7c:17f4]) by MN2PR06MB5598.namprd06.prod.outlook.com
 ([fe80::96f9:fd1e:4b7c:17f4%4]) with mapi id 15.20.9115.017; Sat, 13 Sep 2025
 15:04:33 +0000
Message-ID:
 <MN2PR06MB5598E835359F3ABE41E37F24DC0BA@MN2PR06MB5598.namprd06.prod.outlook.com>
Date: Sat, 13 Sep 2025 11:04:29 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] platform/x86: lg-laptop: Fix WMAB call in
 fan_mode_store()
From: Daniel <dany97@live.ca>
To: Markus Elfring <Markus.Elfring@web.de>,
 platform-driver-x86@vger.kernel.org
References: <MN2PR06MB5598DFC94FB13E9F809F0EB3DC08A@MN2PR06MB5598.namprd06.prod.outlook.com>
 <37610abe-e6ea-4694-be63-1a7147c52b73@web.de>
 <MN2PR06MB55988311E10C20DD6EF0CB97DC0BA@MN2PR06MB5598.namprd06.prod.outlook.com>
 <f8726808-9e34-44b5-b6e2-27e898c53321@web.de>
 <MN2PR06MB559854ADB7D4F32EFE9A2E25DC0BA@MN2PR06MB5598.namprd06.prod.outlook.com>
 <MN2PR06MB559866AF1296AC1E99634F56DC0BA@MN2PR06MB5598.namprd06.prod.outlook.com>
Content-Language: en-US
In-Reply-To: <MN2PR06MB559866AF1296AC1E99634F56DC0BA@MN2PR06MB5598.namprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0142.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::8) To MN2PR06MB5598.namprd06.prod.outlook.com
 (2603:10b6:208:c3::13)
X-Microsoft-Original-Message-ID:
 <35db2992-058b-48f7-820b-0810f674eb97@live.ca>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR06MB5598:EE_|SA1PR06MB8104:EE_
X-MS-Office365-Filtering-Correlation-Id: f4aa4f5a-6571-4c64-ff34-08ddf2d6d8a6
X-MS-Exchange-SLBlob-MailProps:
	+cAEnstLRQ9reLZxnx3TYhqtrJb48kf6W5k1zRh4rHdHf6g6n8QRTSLD15X1Tif2E+LnIa9RrcDDnjqwJBXccVLJx12daX03BEEJhegrUaRYON0NVfZC7FTZ4A/wfywIAqQm164syglv0v3yQEvb4u1fgUuWffSyJZxFxxpC45RzEHSfvL2XBy0d5ciac6+blKPFdzlM/9KYeTErqzRN2H01302BNIt3WeOyrW4A8XyWNpaNXPeUdr5nvhY4btlZTQI9s+COIYtEnecAR6I0M/REJTPbwpVLu3Fm7a+u+YEepWFzT3UNhUSjGM+jH0vlbTpTCauT6dcWyuxN7wtt6uiJOgXDcLh+NXJL8xtjNIlS3oRK9AwZT5Xu8LB9h56CKhvrbqpFJngQqjSI8EytL6vtuh9TJXPkIjgTqN9oAdirqGQTLencTOiZGKRTJJrdpK8WkVv23p0nc5zBYhqKeBwBtqEOWFvUH+HPTr5NqJk1UtHPdDH4VA2Q94PZdvi2v4FwdQhl7M3Snjklf7e/j/0ErSzSYuWXU6ij18hV45CKe7ugzz62VoAAnCEsjUA9OBA32S4S2HAqwpFXOeqqE0COrvZR6u/0v8AWLEos/P2xOzUZNKiKwszM0n25EJ0TI56tRw+0rB25clWkybSnMgXQLkgv8mEyGr3zOZHJipmGAW1yAvdpIQ==
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|23021999003|19110799012|41001999006|8060799015|15080799012|6090799003|461199028|5072599009|40105399003|3412199025|440099028|3430499032|26104999006;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TEE3a3VUUjVQc1pWdHBkemEvcVdlL0FVdGNXbXBmdDJTOHVCUnNEdUt3NXNw?=
 =?utf-8?B?elprenF3S255N3Fjc3ZEdFZFeCtBTTl5cWlHTDhpQlEzU00zUTRTTkdQVmJ0?=
 =?utf-8?B?cXZkY0VnS3M0N2tyeUU1MTFmcThOaEFaVE9NbHU1RjBCL1FWSEFKOVl6QVhi?=
 =?utf-8?B?RlBiQVVNZnNxQ2JUbjQ4SFV5YWliUkQrWlFBbmduamVCY1FsUkd6d01zK1M5?=
 =?utf-8?B?a0dqTzI3TzVab2pySmxhN0ViWVhEMmVaWVROdlpoQnA3V0hHaTlJZ2oyMGlU?=
 =?utf-8?B?WVpvNll0RDA5cVEzMnpXdzJsSWQ3OG41clh5OVc2Yzc5a1VqNWVQdEhjVG1J?=
 =?utf-8?B?VXpxRHgvSUh3SEp2VTQydzduTHBaMzBGQmFoQU5WZnczR0JhdVVNU3NodlFu?=
 =?utf-8?B?OWllSmhKYVBTQTNrME1hRnA5bVY1TGRGRTV5NkI2TXZ1STNGaEJNUmc1dkFW?=
 =?utf-8?B?YUJSanJuMllueERHNkVLRjh3OFpDaXkrTmZEZ3FCR3VIYWZqSTV5azQyRTJo?=
 =?utf-8?B?dG1wUzdwZmgxQXZ0RGp0MzlSWjR3Z2w5SDBwaFFJeDNJWWU2ejY1V0lQd09B?=
 =?utf-8?B?b2lGZmluY2ZDVFJ6aFZmS0NzVzVRYzduQlR2SVpnT1hzQkw0RDRyL1A3Zk5B?=
 =?utf-8?B?L3BXM1ZmV29XV0VMZnVXN254STFnZE5JK24rNUdsNGFmU2hqeXQycGtUUi9I?=
 =?utf-8?B?bFZYd2hjUnRqeFlNbiszL3dSV3VnYWZGVHFJczJ6NGw5QzNKZ0d1Ynk3Vld5?=
 =?utf-8?B?RGZybEV4em1JU05TNWpEck15blRBUDJ3VnVCTjdPYmhYNWJCM1E5ajFaUE1D?=
 =?utf-8?B?UlNScDIzQmgzZk5iZDJxY01SYTBSTS9TWXIwSXU4RmwwaGo3bitJSmE4V3Vz?=
 =?utf-8?B?TGJ2ZXM1dEoyZ1d6b3VVSFJZWGR2YmZINEo4NldpNmpObFJ6RUNPbkFRZ1A3?=
 =?utf-8?B?ak5INEJsRm9ubmRiMDhQbGVjeEhUUVdFZVE4emtlcHpKK3FBdG1JNHQ5YUIw?=
 =?utf-8?B?MHhHczhMV1FkWVZlWUxnc042QW9KdENVcTlMSjkybFg5cEJudnRPREhDOG9V?=
 =?utf-8?B?ZFBYMkQzVjM5a1BvRHpaOW5JbHpMOS9hbkdZMzhLQ05yaVR5OE5mNmlzUms2?=
 =?utf-8?B?VGlSV1ZQVUdWcnczYXNSWm9nZno2ZHBkcldzQ1JCY1h2YVBycEpkaDhYTnh5?=
 =?utf-8?B?VExUSDV6cGM1RzQwdkdFSCt2Ym9TZVgvc1ZweURDTjluZFZ1Zk56cXNmMFBk?=
 =?utf-8?B?NGVjZFRMTGE3T05FRjBlZzIyYmtlM1grM0YxUjlXNzlIeDYzV2NYekY2bHJa?=
 =?utf-8?B?RjlaWWtGczJ5U0MvYVNrSE9sbHZNcnNSaEFrTG0vU3FWeU9pYTFxUTRHbFdh?=
 =?utf-8?B?MHNHeDlwMHhFUnhJcTg1eGlQbFBVZkc4MTZEcjRDOUFaWlMwZTgxdWFCUjNM?=
 =?utf-8?B?TTZvTnBlK3BWbmt6SGlITDVEdmt6ZGtORWRDQ25vQnl5MXgwMEQvMVJHYXlS?=
 =?utf-8?B?VnJ2SHZ4MkpTd3RKcjFYYVkzSXR3dlRrSEE0S1d1TE9KeklJVkpRT0NYazVL?=
 =?utf-8?B?MWRtZkRKMlJpaVp0RVB1ZmpxVmw1eU9oTjVGUnQvUGk4NEFGc1ExODZWOCtU?=
 =?utf-8?Q?P3bHMfsDmMagV9iH5lwX1/3Dd01yEVfVHRhPEEEGVH/w=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anZpYXJPdVdKMjU3K2J1MXRhQTNySXQzWHZDNHJPQ2JxSWxBcWpyVDVIcnhw?=
 =?utf-8?B?eStwT3oyWmRXN09VN3F2bWlrTEJ4TVl2Rmg0OStIbmp1ZGVtSHZ3UDg5b0xQ?=
 =?utf-8?B?dmZKRTJEL2xzQVphUDhsZWIxN2UxRHBMa0V6aEErSktrTjk2OTF4SjZyTy9y?=
 =?utf-8?B?K1M0WG5oRk1WMHRoSU9GNXBMUDVLMHJGYWkrejh0Tm53K0lKajU0MzBNQUs1?=
 =?utf-8?B?WGtCc3llYjF2ODVSUVI2T0RzRzlEVzM1RDhKZGkzR3ovNXpJYmJ0dmdxQVBs?=
 =?utf-8?B?K3JzT0pqbG1rcUExWG9scjUrNys0Yi9jbzV0OVdVTGNGUHgxWUhQZTR4YTNJ?=
 =?utf-8?B?ODNjWTYrNE13aEptRGd3a1VyWk15QmRqZVNESjdseEdEeXVMdktmTThGQWZY?=
 =?utf-8?B?b3hTQnR0WHQ3aXU5ajN6YnBwZ05lU3JpUEo0Y2w3ZlhHMHNBU2ZpelNETXZP?=
 =?utf-8?B?V1d1NUl1Z0dzcWYrZ01XZm4zOTA3djg5cEJobUw5cjFjbHZtY2o0N3lYQ2xO?=
 =?utf-8?B?WGVHNldhNG9WMlJ5T0I3aGNEOG84Y3VsdkRKNERHMzBnZkUxb3dzYTNyUkxw?=
 =?utf-8?B?bVNIMFNBT0c5NE5NcGtMWDloendtK29iNXU3QXBXOWs2cVl1Sm45b0lmVGdH?=
 =?utf-8?B?cUh4K1c3VDV4NktrVGdCMURqQzdWY0tkRkZpY1RtZTlPdlhGN1MyS1h5djVC?=
 =?utf-8?B?a2NNaFEzbnE1RlE5TzRGd2RIMlM5RmxHSEdBcVpmNUUvelRoQ3VONEwya21P?=
 =?utf-8?B?bzNkdzFmUGhDZmJBcXdWdHU0amRGa09EMkwwZ3lEM3hkSkRsNzFvZGNSZHl4?=
 =?utf-8?B?ZCtvNDhYeVVPd2VwZzJWd2pJNGxNZWcxM1V1cXBqK3RwVUt6dFFLZHlCdm1s?=
 =?utf-8?B?N1pibTE4bklpVy9xZW1tMTErSGJkeUNmOVRsR1NsNVQvS1E4cGIrUjhmb2xD?=
 =?utf-8?B?QWI4a0owV0JzSkJ6N0NtdkJyWVp4a3JCQ0lZc3ZVYmFOTDVEYnVVZG1GTGEy?=
 =?utf-8?B?dEZkbFhDazdLMFB2N2NxNk5wVzZ3d2lxK1pJdzYzdWxKZG41TUUxRllOWTBt?=
 =?utf-8?B?UTI3UVZkaVJXc2dHNmhGUllMdkl6VGJJSlhKSjl3cXFBeDJxRi9FK3ZhNTRi?=
 =?utf-8?B?R0ZVQkphVFJoMVcydCttOXNMc2RaNi9oWmZSNFNoODBJZzJNYXJ6eExldGlm?=
 =?utf-8?B?dHJqVHhoT2FaVlVnek1naFgzRFVucmFtVnhxMDJrWUszVEF2WGFEdUxpV2VO?=
 =?utf-8?B?blFhdHo4VHpudmcyOWd0RUo0aVJlMmV1dXVlcVhSbjdUYzlsVzMwZVF3RW04?=
 =?utf-8?B?d0dCVFA1QThGMDV2R09TRTdyVzlXeWd6cVcvOFdXUlNhMmdaM1h4SGVDV2No?=
 =?utf-8?B?RStEYzJWUFBCUldhS1ZIUnpvb0dTc2pQMGVkejhUSGc5Tkd2TVRtVC9keEFP?=
 =?utf-8?B?OVpiemFvbmZxR0FtRmZzUE9lMGdSOTZoc05aZEJwSm9SUmxocHd4UnV1cDFJ?=
 =?utf-8?B?cUNiQncrTW9uMWowVExmZmwxQUVXUVV3TlM4YnZOOTRBWjU4Rnl3QnBJWTN1?=
 =?utf-8?B?eklMQ2dyYXdFQjBSSHFONVdYbmMzNm5UQ290NkJ3VVNSN3pVbEpESTFDbzBW?=
 =?utf-8?B?VEM1d2h2b25vakR2VTNhSlhsRnN6Wnc9PQ==?=
X-OriginatorOrg: sct-15-20-8534-20-msonline-outlook-a1430.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: f4aa4f5a-6571-4c64-ff34-08ddf2d6d8a6
X-MS-Exchange-CrossTenant-AuthSource: MN2PR06MB5598.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2025 15:04:33.0967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR06MB8104

I can confirm with this patch reading/writing the fan mode now works
as expected on my laptop, although I have not tested it on any other
LG laptop.

Also, correct the documentation to reflect that 0 corresponds to the
default mode (what the Windows app calls "Optimal") and 1 corresponds
to the silent mode.

Signed-off-by: Daniel Lee <dany97@live.ca>
Tested-by: Daniel Lee <dany97@live.ca>
Fixes: dbf0c5a6b1f8e7bec5e17baa60a1e04c28d90f9b ("platform/x86: Add LG Gram laptop special features driver")
---
V1 -> V2: Replaced bitops with GENMASK() and FIELD_PREP()
V2 -> V3: Add parentheses next to function name in summary line

 .../admin-guide/laptops/lg-laptop.rst         |  4 +--
 drivers/platform/x86/lg-laptop.c              | 29 +++++++------------
 2 files changed, 13 insertions(+), 20 deletions(-)

diff --git a/Documentation/admin-guide/laptops/lg-laptop.rst b/Documentation/admin-guide/laptops/lg-laptop.rst
index 67fd6932c..c4dd534f9 100644
--- a/Documentation/admin-guide/laptops/lg-laptop.rst
+++ b/Documentation/admin-guide/laptops/lg-laptop.rst
@@ -48,8 +48,8 @@ This value is reset to 100 when the kernel boots.
 Fan mode
 --------
 
-Writing 1/0 to /sys/devices/platform/lg-laptop/fan_mode disables/enables
-the fan silent mode.
+Writing 0/1/2 to /sys/devices/platform/lg-laptop/fan_mode sets fan mode to
+Optimal/Silent/Performance respectively.
 
 
 USB charge
diff --git a/drivers/platform/x86/lg-laptop.c b/drivers/platform/x86/lg-laptop.c
index 4b57102c7..335afdc75 100644
--- a/drivers/platform/x86/lg-laptop.c
+++ b/drivers/platform/x86/lg-laptop.c
@@ -75,6 +75,9 @@ MODULE_PARM_DESC(fw_debug, "Enable printing of firmware debug messages");
 #define WMBB_USB_CHARGE 0x10B
 #define WMBB_BATT_LIMIT 0x10C
 
+#define FAN_MODE_FIELD_LOWER GENMASK(1, 0)
+#define FAN_MODE_FIELD_UPPER GENMASK(5, 4)
+
 #define PLATFORM_NAME   "lg-laptop"
 
 MODULE_ALIAS("wmi:" WMI_EVENT_GUID0);
@@ -274,29 +277,19 @@ static ssize_t fan_mode_store(struct device *dev,
 			      struct device_attribute *attr,
 			      const char *buffer, size_t count)
 {
-	bool value;
+	unsigned long value;
 	union acpi_object *r;
-	u32 m;
 	int ret;
 
-	ret = kstrtobool(buffer, &value);
+	ret = kstrtoul(buffer, 10, &value);
 	if (ret)
 		return ret;
+	if (value >= 3)
+		return -EINVAL;
 
-	r = lg_wmab(dev, WM_FAN_MODE, WM_GET, 0);
-	if (!r)
-		return -EIO;
-
-	if (r->type != ACPI_TYPE_INTEGER) {
-		kfree(r);
-		return -EIO;
-	}
-
-	m = r->integer.value;
-	kfree(r);
-	r = lg_wmab(dev, WM_FAN_MODE, WM_SET, (m & 0xffffff0f) | (value << 4));
-	kfree(r);
-	r = lg_wmab(dev, WM_FAN_MODE, WM_SET, (m & 0xfffffff0) | value);
+	r = lg_wmab(dev, WM_FAN_MODE, WM_SET,
+		FIELD_PREP(FAN_MODE_FIELD_LOWER, value) |
+		FIELD_PREP(FAN_MODE_FIELD_UPPER, value));
 	kfree(r);
 
 	return count;
@@ -317,7 +310,7 @@ static ssize_t fan_mode_show(struct device *dev,
 		return -EIO;
 	}
 
-	status = r->integer.value & 0x01;
+	status = FIELD_GET(FAN_MODE_FIELD_LOWER, r->integer.value);
 	kfree(r);
 
 	return sysfs_emit(buffer, "%d\n", status);
-- 
2.51.0


