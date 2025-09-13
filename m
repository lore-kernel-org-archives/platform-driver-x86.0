Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazolkn19013081.outbound.protection.outlook.com [52.103.7.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0305C96
	for <platform-driver-x86@vger.kernel.org>; Sat, 13 Sep 2025 15:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.7.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757775814; cv=fail; b=hUG2el73WnqHHkhql/EIaFnlBPETt9XunvwJVbAVOXqHoxZ/XRg0YSjh101iqFy/x8QaBhXmBAmt3lltuOdHVi8C2osM1quSCTr3F4OEJxDnrgrnnHsiU4TM1RT8V3FjL502sRRVu/xgpTAjDGx9B6p24dBs+6LmE+zdrseV0vs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757775814; c=relaxed/simple;
	bh=4wbok0/fk7R6Hw/GTLN7t+V/4VKrsOOQmEvkBJwoUhE=;
	h=Message-ID:Date:Subject:From:To:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WX/t92NWacNjHpvgVne5AY5F1c5UPhxKuYW2GRbY/xIT5feLSVbqYuUhN9x8rViopp8T7JuQI0rkRUd1KzzPNfvZUzD1FlGt9kcre/1lnR1uI2VddzzqbmcrNzYMs4uPcAI7jpbifkgrJ4H9Y/KdsFjybMZqRy4eMyG+IXHNM4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.ca; spf=pass smtp.mailfrom=live.ca; dkim=pass (2048-bit key) header.d=LIVE.CA header.i=@LIVE.CA header.b=USLDchPu; arc=fail smtp.client-ip=52.103.7.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=LIVE.CA header.i=@LIVE.CA header.b="USLDchPu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aipUJ3uxdgeoSL59qPr5Om0QwcjO0cSl5BK9naqDAbWsz4d1DAuoj7Ck/G5zqJV7bB8IMwi7H8EKebrWtGzf5R+Yd7LMtY2yz86eNKZxjpG/sJmhMs74qSb+msFvLOLcMcVX5eUz71IKhbJUtMVeZBLpXzSKjJ/73nkm5312JZZ4MTL5EmdzJCDMYy30j8MPq/WW/UESWHQ1znacn9Nh+nRVxUgNzHjTcNLSBodIExNr5aAVRKwDdqCwFmPcGqN+A7KyVytVWBQF0tNCVJ3rYaLfskw0j6K9UAysRMlzPVStvry1sh6XxNbvfa4stqiawF1ZFrlwmcD/LAtl/mvwLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mkJ5Jrsc7ESeLz3crHKSVdcbdP/nMbFXYpNiXNXtXdU=;
 b=Q4f7blokRN1yMFfz23v5Zl2W3b948euwdnlFpn+0FzfPWri/TdNxof93n43WMHSWh69A+F/D5jPwoN4sbQ1sbGpp8AqaCfbnJGmgMQoqnwsXNbSzokBWwf5DB3bJ2wJcKn+f0ebp+S2H4McN7tiZF27/VlWNpwjR2riehbkgyxMHWr0UWiBzb4rYwKaB09nSQHsWGJ/htCJiemMZ5IgBGQwqtuOJoJ9JhTeyGSlkvXxSFdpdZgayNq+0HNLyKuQMXmZ9KUxaF8hI2y+mMbmvKTyWsmKo16IFvBGp1eFDkvKxKpWs+bMrNFqlPY+55OY85ISkGMcUyTuiA8pzevRLUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=LIVE.CA; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mkJ5Jrsc7ESeLz3crHKSVdcbdP/nMbFXYpNiXNXtXdU=;
 b=USLDchPuS1yD2j++SRaaomGddA0FJ+fNFfOdGIsmke0Evce+EDH/O69JD1cW7xyA5wUi529vu5wr79A0ONkZIX7bSwchdUUwwEw6CL7/n3+ITxFeW6Gq+bOQgXPSyUKFItJ41LBCbGOIkXSFB7Yvx49DEamDvpchenWybrUQ7qL4GX0EOtwgVq9qbeI15+N2J//e+wHwzJ7uhb60lwMhw4BaFLjRkW0tVrqoAAWkWKr3YN/bO2jc5c+jZmDaUosKga6A3FoAQpt3H8bzE2cVe4wN+kONFCZSj4D46OO2s85J4LPivABlidinLp/rD+Hdv6BTI/ARhS2CgM6UOv3zpw==
Received: from MN2PR06MB5598.namprd06.prod.outlook.com (2603:10b6:208:c3::13)
 by SA1PR06MB8104.namprd06.prod.outlook.com (2603:10b6:806:1db::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Sat, 13 Sep
 2025 15:03:30 +0000
Received: from MN2PR06MB5598.namprd06.prod.outlook.com
 ([fe80::96f9:fd1e:4b7c:17f4]) by MN2PR06MB5598.namprd06.prod.outlook.com
 ([fe80::96f9:fd1e:4b7c:17f4%4]) with mapi id 15.20.9115.017; Sat, 13 Sep 2025
 15:03:30 +0000
Message-ID:
 <MN2PR06MB559866AF1296AC1E99634F56DC0BA@MN2PR06MB5598.namprd06.prod.outlook.com>
Date: Sat, 13 Sep 2025 11:03:26 -0400
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
Content-Language: en-US
In-Reply-To: <MN2PR06MB559854ADB7D4F32EFE9A2E25DC0BA@MN2PR06MB5598.namprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0144.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::18) To MN2PR06MB5598.namprd06.prod.outlook.com
 (2603:10b6:208:c3::13)
X-Microsoft-Original-Message-ID:
 <6033d7b1-9a26-4683-823e-f9cf63628030@live.ca>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR06MB5598:EE_|SA1PR06MB8104:EE_
X-MS-Office365-Filtering-Correlation-Id: 200d4e17-0bf4-4c57-6df0-08ddf2d6b32d
X-MS-Exchange-SLBlob-MailProps:
	q5r2+9D+CgP82T4VPCzWdqSlYQQ2THScXMfQzPiFecQnE3iaGRffvofk22KKCZZ+3BAeJaeJljLMzwi7G8NLPHtircsxYioXklvTJZ+wvWvIdafajHFtF0UtBYdQFTHJRB2HI6IHz/T7dLhTzHRRku7TjXD3SzsjmK3ctkvL675WpB0koJNyGhy6x4TrsQsy5I25R4dO9F3e/EAxznRJWumFfX22E5RbI+31XYpVa5xEZUZWllb6/CuJWsbKx9WLbxu8TaIa6hkmRw6h0Jvgkf6ZJuQPafs5af7qRNIgF+FCAYXHHBDoDDv9hR5/+bxMZGnGfoO0bPhmENVPDVHg2VrxpLZFF9jGL6OH2M/6+0OIFZ6ke1bnHGKanw+BesOjy3QKnRz/M4YWbIiF6pqnGLU6CDgflsKcwTqtMWFZ/tqE251Tx57LcSRPVdCgTSAt1FtmjxKbxg9UgdWf1flfcIlXQEdOxjHlDSm/Pj3rgRVUf4yFaidJdJyfqOB5Q/EddDtNdpqAYkHPSAe7Yc3z3DBTatH/hcWfBxd0Stg/tvoht2vu3DD+T4yXhrccLHh26KclvEe4W/SHw0ircJqjBLaFuYszx/b2
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|23021999003|19110799012|8060799015|15080799012|6090799003|461199028|5072599009|40105399003|3412199025|440099028|3430499032|26104999006;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VnFOK1c1dElLTGpXM0NLV2F6NmVqTThpQzdyREpMc0ROYVQ0MTJQcDZBTUZB?=
 =?utf-8?B?MkgzWVpjRjdvRDRYSlhkSVF0ak5Zei8xMXlCMzEvUmhxa2x5ZnI1ZmovdXpJ?=
 =?utf-8?B?N2xJRUsxaHMwT2N2L1lVTTU4cjd5dksrRkZjRnhVUFdKM1JCZGRiMWZDNi9y?=
 =?utf-8?B?bWhUVzQwWFgySTNrVno5UHZ3YURrV2s5Q1pYMWxHNGNXQkZIS0FOTS9JQmx3?=
 =?utf-8?B?dDdOQ1pVcTcvYSt3YXY5L3RYYjZWbWVZeWRYVU00MnpHWmRaVjloVUZMNnBp?=
 =?utf-8?B?NEE0L2hsSlhMYUdJa2tucU1aRXd1TzgrRTg0Y2UrOUtFNENCRWN3ek5uMGNz?=
 =?utf-8?B?eTlFbDcrMzA3UVU5aTdJMno1RndaQStTYWhjQ2YrUDVySHlOK3RpajVvTG52?=
 =?utf-8?B?Mjliazc0aUdjNWR5UGJQb1RiM0c1WWhzRkR0Snp2YTU5RUcrVjJnYWRkZkt3?=
 =?utf-8?B?OU8xeVlsMVhoN2laOXRrcEp6YkM4MGVFaGRDMU1KTndZZHAyYnVhTmVnRnVz?=
 =?utf-8?B?ZUFvQ09rVGZEcTF1bkRSK1E0LzlYbzFrNUE3YUlsWUlhd1FUNFZzdlFLd1BP?=
 =?utf-8?B?K0xRanoyV1dRMVZhSStwSkVIaGFvKy8va0lja1pPaDFuV0JXWURLV1JwQmor?=
 =?utf-8?B?RFFnckN6TXN6OVpEaVpsOVNBL0xlSnY2RTlYQlVabDlSUExYSmovczdWWHA1?=
 =?utf-8?B?SUxJRFlGZFFIZ1JnL2pyNURWc01adWxmbTI3M3R3cndFVWx0UCtBS1pNbnpG?=
 =?utf-8?B?cy9MbEsxem44bHdwVHpQaDhyWUJVcjR2cWpLK3JoWDlqblpPeE9OMmxvNW9J?=
 =?utf-8?B?WXVlTjRacy9tcDQvY3RzaWkrVTk5UGZ5aDJtOFBFVzh2WXRQMisrTnFVWEVB?=
 =?utf-8?B?dFZrV2JxN1pIWFdYM1JlazFtT2V3NHdKSDM4OHhRMzZmVGJFanJBWS9ZYUdZ?=
 =?utf-8?B?M3BxL3JKTVB6TnZNY2EybndBK3dVN1puaEVSbS9RRkpIWWNiOXlWZU1jK1E2?=
 =?utf-8?B?a3RxcGlQYlFPMkkrNUc0ZnNpUE1aS1hQOHl2Rk02N1FYdHRwUE05UEcwNmFq?=
 =?utf-8?B?R0loaXFOemY4bGQ3aW5MRFJpZUxlWVdOYTVzUlRlK29LdGN5UGVLdXExNUhy?=
 =?utf-8?B?eEpPcTIyZ1FjTk9PTElZQ3lpaWNkYVpVTG9SZUU4SlV2WFdKc3NBYVFQdEIz?=
 =?utf-8?B?ZjF0UGVONjB3YWxQQ1piUFdxUTdNckJ5Uk1TUTV4ZmlFWnJHbmhGT3FkVTM2?=
 =?utf-8?B?QXRlaW1wTTNrK25UOEF4SWROWTBhSjRtdlAxblpDT29nRzBvZkZsSlVvbURy?=
 =?utf-8?B?bEx5SmJkSGFheWROeUE3UzNWclQ2aFhmaWExZjZMRlVWTHNEc1lVMXRRa3kr?=
 =?utf-8?B?aVY0MVdPendxNytISkZXbGx3S2YySy9jS3U2aHl3bWc1dFVsRHJPUC9FRFJP?=
 =?utf-8?B?SGhvTjR5VnMvTHZYcmJ0NDZvTG90WHhOQ2dzYnNXZThaK0ZsUDluS2xMeFli?=
 =?utf-8?B?Yk9ETm1PVmFPbWVLcTlQc1pyZlozYzJlZk9BTEQ3em55VE83RWdsWURPRFN0?=
 =?utf-8?B?MmlZYWRYM0JLUkZYQnBKaUdiS24vcWtXc0M0VDJmNVZPVENrU1l6OTVlV05l?=
 =?utf-8?B?ZUZ3Y0g4dXhkL2VCOE5hd0tZTGlRb0E9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VThpZzVpaXZYTUtKRHRLWEZkM0JwRFpnenRNNHJBY2R6cTZHVG1QQ3pIRzRo?=
 =?utf-8?B?TGdnRGNiN1QwUVVCbndjZUdjZ0VHSGJOaXdJK1ZvMXMzdUplaE9hZ3V1REND?=
 =?utf-8?B?ZjdHNEIvVkpIZVltR3FoMFEzeUdYUFFld1NyVlRidnJaanR3MEdVWkJRRnl5?=
 =?utf-8?B?bTQ1WGVPNGV6VURNbW5TaFRIZFNtdXVNQnErN3hUTEtteG8wNHdkOUlZck01?=
 =?utf-8?B?V3dZY3pqVnUvVDlkTHJyM0NveTJsa0Q5SHNtT1IzaFUyN0ZMdlozcG5temZl?=
 =?utf-8?B?VTZpRFhUT3VmZHFzK04zWjJieU5LNDVEYnptbUFDZDE0WlE0SEtkSGYrQzlW?=
 =?utf-8?B?RklYcHpxM0dtRm5tLzJvaFErdmExS1ZDUHFsd29OUGVlcytrK1RLTEY2NlhN?=
 =?utf-8?B?WldjelFxd09Ub1ltMExVbW92MWVSZGFQY3NrYkhrVmE4RUZ2QjA4Z0pmbGhr?=
 =?utf-8?B?aUN0ZXpMa0tvS0tFdjV1b29ZZUZNbGVOMVg4U3hpMzJxaENtUXpPZVhGdXh6?=
 =?utf-8?B?VnlpTThVSHVSUWRSOUNxSzE1WVpTV0MyUFk0N3JwMmpiNElYSXRQWEx1TXNS?=
 =?utf-8?B?RFNsbU9lUWRwZHR2djJPV2RkNXZyNENneDErNEo1b1llYlh6RVNDNUFMQmpZ?=
 =?utf-8?B?dUVrai9tcXZnWkxKdnZQNVNhNG1zV3dXLzliV01jc2lmZkhoMVoxSkkxelNH?=
 =?utf-8?B?eFdtK2thNFBaaWZ5VTdXQnNpWEdCZndTU2YrLzRaZHdJZFc2cXpPaTUrcUZY?=
 =?utf-8?B?YXd1ZTFlRE8vdWpyRDNkWlVHSDFVTGI3aVVFV0VqVGNMREE3Y2dBQllvSXZC?=
 =?utf-8?B?R2pSTHVwYVJJRk9xaFdGWlBuZFYybk1qcXFSWE9wcXJIeHl6TTNUQ0U4SllZ?=
 =?utf-8?B?K054MG9TZHRPQkI3bWVDSlFSQ3ZtMEkwOUxySEVrcGE3UldZKzVwK2dHU3px?=
 =?utf-8?B?NVdoK2dvd0JBTFlLT3NITGZFckVlWEluQzVSOFM5eTJFWExBZzZDR3lpdDFC?=
 =?utf-8?B?T09hSk8wUndSN21ZNFpXSEVLc1EvU3ovRE5hc05PRjlCUHVFZUtTQWpyN2Jn?=
 =?utf-8?B?Y2FoWWs1NHltSHVMK3pYRFFvY3BwYmtLR3V2ZWNyU0szK0lTWGx2bk1zU0xQ?=
 =?utf-8?B?Z2k1aWwyY2VKaHBOSUJzRkpVM2oxR0MxSXFvSkJudDN3R0VKditTWVJrYXo4?=
 =?utf-8?B?cEVzeFFuTFJrMld2T0hRVVlScmJENEY2L3E5T0ZpY2RMZ1dMTGhhV25KeklJ?=
 =?utf-8?B?eml1bFN3VjZiMm1PRzdnRzFmckpWUVF1UjFLYzdMOXZTTXVhTk5FNlRzeDRq?=
 =?utf-8?B?dS80dENkWHpiS1dCeGwyN3NlQTk5eUtIaXFCS3dobWdRZjBHalRPYXE5bzU5?=
 =?utf-8?B?TGp2YUNKQUVRM2VGTm9VcWdTWEUwVldFa2tuQ0ZSQ20wQW5TendkdEtNeGkv?=
 =?utf-8?B?R0daOHp0YzlXdDFNa2VmeTlCT0JrdjRVR2NZQlJoU05WVzg0cnJQNHZ2WUFU?=
 =?utf-8?B?VUdtK2FqOWlxRDZyaUpnS2VhdGxPSzJMeittOUtyS2hRQWpIdjhFUktlL0o4?=
 =?utf-8?B?WUJXaUc2bWpsenJCeUxCS3NhWXdHd2gxckZyUXZNR1E5MG9rdEU5TEJ1cURP?=
 =?utf-8?B?bzNFenZ1RUtBSVoyNXpJSVM4aWV2L0E9PQ==?=
X-OriginatorOrg: sct-15-20-8534-20-msonline-outlook-a1430.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 200d4e17-0bf4-4c57-6df0-08ddf2d6b32d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR06MB5598.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2025 15:03:30.3095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR06MB8104

On 2025-09-13 10:50, Daniel wrote: 
> Signed-off-by: Daniel <dany97@live.ca>
> Tested-by: Daniel <dany97@live.ca>

I left the old Sign-off there, my bad.
