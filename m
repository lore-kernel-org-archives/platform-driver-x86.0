Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012003.outbound.protection.outlook.com [40.107.200.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E53357CE1;
	Tue, 12 May 2026 19:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778615704; cv=fail; b=dd9PCnz752N+C1oVPLTIJhwTNJF/SF8GiSRwJKcBfd/W6OyhhnQvd0kZ2oitUNu1VLGHR1Q31ROBmBjaRvMhkl4LTdM3E322S6nsAI+3Bxl0y6XCdHeXFqtbGFjUYv/fgc4x/djImoGySDQm9ER7InfqZ5DJ2ZACYP9pGJvMcQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778615704; c=relaxed/simple;
	bh=IZqwO3nO7MiUrR0Fv+OPM6SDLxh1L5GCnXH2WFKSKXU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GHDim4eYmyIzuISFdBhzGbWO/qWWvGwuSVvQgOCdHhBbt8FLnjahgead8yxqKU1PAqZJvnDD3CTRYTsxxKZb/qfbB22QXG8XqfMt54fSoWCvuoss6nBSuJgoQ0bHkSTqXmFFyzO1Qzne0JAzs6AmcrByshG4Q3wfRGXM2KUylx4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=f0jitUok; arc=fail smtp.client-ip=40.107.200.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="f0jitUok"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HNbKgAHwqtJwxafYD8aaFD1a7gOIDB8nAQ9fA6wkjRyumIowij/neqCzIaoK8/i1QSYSH1cpaS5RlOAqUIybo74If9lLbuBMVkkyIgRnMoVAtyvmfmw8Gqh+IMKU4AGaQTXDPtmn39PWwmddpbDqgyl/DvNFLA8HL3nvkELCRvh79q1CgueJZpfjHEz8m2u2N0N5+oxoYZFRSQ8KTElD4eU8mL0Jomr6KPI3cK3o/MS8obVmTvUMoZrH7YwtItF421dKXBijBo1gCEAGm4tgSwMc2dwwo6yRTrT9wdaI5YrLfevT9TAuoANHIIAKkdEg38iJkGCwg60cciOQ1L+1Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uHWA2Hnehw8FL4LQ76c+s/3a7Kk0ZFHIzuEkZw4/g1M=;
 b=Sk/lTt8gO6aF8R3fet6/G/tYdsmvCSWylC2oDvyz/2IowwJaz/VPsY44cFa8n2W4wyBmkNJ2aYMlzYRWbn5U1274RaKw5yc1bjYd/DYsev7xFXEKrzJ4ty8h4Xm70IqTbweBYnQgOCFH6S9/gopN+hNopMHtd4eetrKf6WulOWc9wtN5fieyYW8499s7HxFiLYXXkF70k0Mbnw+QwDbXdpBzGJ0ioV0VDYaoByMC7imFacESWkxuM1O9y2pp0bkObk8TSJPhKeldnAkHhSzxo5vAu5z7YGcrS4FUqVR33HZMXTk1gSGUCMJvmzXCDPGA5IiEQsRaggjLEBPM1L49LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uHWA2Hnehw8FL4LQ76c+s/3a7Kk0ZFHIzuEkZw4/g1M=;
 b=f0jitUokqXDDLXAl66FjgqJIGw5M5VqSDAmptOjz8Bd6hX0350BZhHcFBN6uepe34oRgNT7/Hqg965s8gwNaT+knciIGvLm70B9fP3OTXFjfWWklFCWPWyhe0mR0HRA3zQ0hO/0VOG+xfeHQAECIpbUapbAh9OeW866e9K+21LQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB8441.namprd12.prod.outlook.com (2603:10b6:8:123::8) by
 MW3PR12MB4458.namprd12.prod.outlook.com (2603:10b6:303:5d::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.8; Tue, 12 May 2026 19:54:58 +0000
Received: from DS0PR12MB8441.namprd12.prod.outlook.com
 ([fe80::5e43:9cfc:4490:1e3]) by DS0PR12MB8441.namprd12.prod.outlook.com
 ([fe80::5e43:9cfc:4490:1e3%4]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 19:54:58 +0000
Message-ID: <ea4a2d8a-297d-4724-a0cd-4d0e4eac1036@amd.com>
Date: Wed, 13 May 2026 01:24:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd: hfi: Support for ranking table versions
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: mario.limonciello@amd.com, Hans de Goede <hansg@kernel.org>,
 Shyam-sundar.S-k@amd.com, perry.yuan@amd.com,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20260507190926.1211726-1-krishnamoorthi.m@amd.com>
 <cb917e96-db3e-baf8-91a0-8bba4ba97208@linux.intel.com>
Content-Language: en-US
From: "M, Krishnamoorthi" <krishnamoorthi.m@amd.com>
In-Reply-To: <cb917e96-db3e-baf8-91a0-8bba4ba97208@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0223.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b4::10) To DS0PR12MB8441.namprd12.prod.outlook.com
 (2603:10b6:8:123::8)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB8441:EE_|MW3PR12MB4458:EE_
X-MS-Office365-Filtering-Correlation-Id: aca00873-f03b-4f49-e1a5-08deb060589d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|11063799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	AVSCO6qruXLcv93BZew8Aa5QsIWPFy736uDBoiMjC/vFYyCKjAmilJspYgWG9vglXZLu1xPftVtON3Q+f+NpRkTYl4K/6y7JAv4k9Pz1Xequo+kApWi7/dhZZK2SvS0m6S2VyC8WV9zN63Rdo3+K6G+9ThSCa7c5a6y22pFeK5fffM9kMsj317D4FReW/1FBXGfmeS1hq6iAjhoDlS7sMHJr2h9HcJjC+71mUph2cSDcf96R4IVDhsGaZWL68AUw0cX9JR4S5YSPp4Nt2v05ro1j0mfxot2X92tDO51ss5Qq66/v04uYIGeyAEcP1rY0oxZzuwdajpkalNW7etBAO8i9NgdM75O9+soCc/3aLO+w/uoBC5j1X4+ZxrUWJ1/bc1atEB/1RuXNLfdXML+FWo+C4trJ2ZMBXYZNPrIEesNcclkwfNkB2u7zNAOfFUWwBLpdw25alw3tCZhLQCB29imxDZHXa0LLkSRGHRcyzTV6ApNiReg+kKQR/AVq9mCd6FsAGwpln9/V4I3RpIobBt23aJdAbwpPZ0pb+shG9namPw2fF/HFDKcVZ+8RkJzKss2QbZGr3LVB7Ceq5C4mKEroOyDCdMiMEWAF4PC4xHkDYyBT8hNBYOEZr6vlrXGM9+UEgZJVOd5leVW6Z5kO6Z/ySjuvxlaoDWE1xf5AxiIU/vZl3iqtn/fSX+LkNlsT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB8441.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(11063799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjhjOGN5MkpVVjllb2FYOW1HY2s0MW5OZHdodW1CWTFuSE5CbFc1Ri83SUk1?=
 =?utf-8?B?dm9NUVJ6TTJXZ1NuQk5lamZLZ0YxVzloWXlIcDVDb1VuUHlhZXVaTzhTa3cv?=
 =?utf-8?B?VDRJRG04RWkrNlQyS1hLa2s3N1VqU09sWFRoelM0aERNSjErc2g1b2dhZ09J?=
 =?utf-8?B?Nkt3UVlNend6bUZRVXZwNjFMYkJNbEo4ZlFaSDVKd0lDU0p4U1JXMDJzcWo5?=
 =?utf-8?B?OTVqZS93VWlmMndCQ045b3hzZmE2ekxNWXozeVo3cDRnc01aZWk2NW1pWnQ1?=
 =?utf-8?B?ZkZJLzhYTEYxUTMybjVxVDNKVG1pMnIwVVBwMU1YUGtJaER3UXM5Q2dQWnZx?=
 =?utf-8?B?TVJualcydEZEcXdnSlNFb3ZMMUkyTDBzRFpwMTFHNHppN1Z5TjEzOENKZzVU?=
 =?utf-8?B?RnJsc0Y1R25ZWHdHaC9jY05lbU82bFZUaUhJd0ZYbkQveW1LQjJCc1FiVldM?=
 =?utf-8?B?eFRvakVhZ0pWKzNheUxIdVBia1BmUStoczdwVTltVjJOUlRtR0c5elFsUzRT?=
 =?utf-8?B?ZmJpQTRpem4yV2Q4SERYUkZjTVA3cGpmS3JiRHhUV1hLb1NrbHJ3MnQ0bGNs?=
 =?utf-8?B?aHNDVkJvVE8rSHpSTDVHZWpUUmxVb0F2Z1R3WHdvVmJJdWhVOTdEQm5XRU9x?=
 =?utf-8?B?SVpMU1J6Qk5mMDJZT2ZmdjlYSHJJU2M0bGVoTDdaWnM0UEJmanFNRTZiMUtZ?=
 =?utf-8?B?aXVKeWlWaStlSm9FNEtUbHFYSXVuNWY2L0ViT3E2am80Z04xK3RMaHhNL3JI?=
 =?utf-8?B?OVY1eUNabVFKVVBZZWw4c2xYQjRkMXZuTHRNNnNMa1pCYmFRNnRhZzBVemdH?=
 =?utf-8?B?blk3enRVR0ltSWk2SFlkQVYva1Y5SUl4UlpYRVdUSHhST1kzc0FaYkwyQnZN?=
 =?utf-8?B?UGdVMkRPVEpSdTMyQVl3OTBMVUZsT2Jyc0xqbUVuanZYODFxT0VlNGg5TzNu?=
 =?utf-8?B?YnMvSFp0cnZoRGVEM2Q3QitmajlneTlRQnJHMUIzYlEzM2ZDa05FM2pkYUZw?=
 =?utf-8?B?YW9JTUJQYjlUcFYvaXRxS2loVWpyWFA2UGtYUUU3MzErbjBVVktwbFdobTZ6?=
 =?utf-8?B?WjVyYXRJdEtOc0dCckd6b0s0bnF5VnoydlNBM2o3NmNuOWJZYmgzUkQyeklt?=
 =?utf-8?B?RXp1LzNDNTNSd1lGMzZ3dUxQQ291dVhwNklYVzAybGF5a0lsNnJvZDJUbE1k?=
 =?utf-8?B?a2pBN3h5L3lWUmpaZWxnbmx4cE9HSktqUDIwejRKbkpmaWt1dEVyRkMwY1Na?=
 =?utf-8?B?MHFENmJyZk1VT2RFVFR2REI0dThuSm43STR6bEd0WnM2NEFiZXhFMjd4T29J?=
 =?utf-8?B?dnRWZkVQYUd4K214Rm1XNjNSY1hvTDVBOVplV0FOTVV5SngydCtuNGhQOTJZ?=
 =?utf-8?B?WXFQWG1TMEtJTkFET1huZE9ycVROUlhiUXVwVXZpK3ZXSVgyZmp0UC85L0J4?=
 =?utf-8?B?VzlHdVhMWTAvblo0WmNkRTZjZDB0S1krSGQ1cDIwT1dtTWI4aklIZzZCa2xB?=
 =?utf-8?B?enAxZE0rU0FEcVBPQzYrRk9kdmVEOGVaTGN6aHNhVjZ3RldjVTh0NU0xSk40?=
 =?utf-8?B?b2d1QktRSGtqUWdPZWl6dDhyNENZRnVFekNqaW11V1QwNkxQSUFScHl6aGx3?=
 =?utf-8?B?M081YmVielh5QXZBZThlV0x4c3VHUys3dEdUMWEwbVo2SDNpYjViYmgrVlN0?=
 =?utf-8?B?RGtWMUN5S241TTlsUHZiTmVuOGdCdjI5bHhydHBZaTRocFkwcFMrY1E1ODUw?=
 =?utf-8?B?L1NTSHJBT2hDeVlsbi91NXNvd2RrK1RONFBGVmVDTWFhTkRPcFBWR1V1YklR?=
 =?utf-8?B?TVBIVjduSk5jRFl6bm5nWEgzejdTOFY3VytiK0V3Qkt0bWEvV2dqa2MwR0xE?=
 =?utf-8?B?dGZrV3RIQ01DRS85elhnMk90bVJPOTFJSEltUXh1RTJQTlJkTjgwakpreVMw?=
 =?utf-8?B?ek5yZ0h3SUtlOUVVNEx5SlZsU0RkN1IxOE5YT1E2U0ErbDV3ekYzMk05SjZB?=
 =?utf-8?B?b3hoKzNDYVNrRWQzSXhOVTJJMHlWZVFYc0E2ano4Tzd1ZmZtUDFzNzlKT0xk?=
 =?utf-8?B?dlJoKzJBY3VtYjVPTk9BWUI3blk0NVBkdVNJOXFLMWpPK3llY0dHdm9NSXpx?=
 =?utf-8?B?dld6c25jc0dNVHY0bjVYVzhQSVlWdXk2SG1qS0E0cDBkdHU0VlhsZWNIUW5k?=
 =?utf-8?B?ank2amdRMURoWGlEZmxrV1QzUzF6UU4yaUtDQktONHN0ZXVrMEJZckpSMzhn?=
 =?utf-8?B?dGxhTTlZcUw2S0ZsRlZhNklhSGozakFZcnplZkxUM0hKNXNUejhKdEdzcnRa?=
 =?utf-8?B?a21PVmdXNHdpNmRoSmh3TWF0aXdtSDM4a2s4UGNBekhONHo5dld5QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aca00873-f03b-4f49-e1a5-08deb060589d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB8441.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 19:54:58.5447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jbJC0pwz7XopNerJQfItM9x6yfHiSGHu9R7lhK32SES4aZI3LcSQGBZekPWp06UWo1ErS1a4aIQuAsZmIDE4ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4458

Hi,

On 5/11/2026 7:50 PM, Ilpo Järvinen wrote:
> On Fri, 8 May 2026, Krishnamoorthi M wrote:
>
>> Add changes to support new ranking table version. Version 2 of the
>> heterogeneous ranking table provides static CPU rankings. Version 3 adds
>> dynamic ranking table support on newer AMD platforms. These changes ensure
>> that platforms still reporting version 2 continue to function with the
>> existing static ranking path, avoiding regressions on older hardware
>> that does not supply a dynamic ranking table.
>>
>> Signed-off-by: Krishnamoorthi M <krishnamoorthi.m@amd.com>
> Hi,
>
> Don't we want to have Cc: stable@vger.kernel.org # 6.17 for this?
No, Cc: stable is not required. This change enables ranking table 
support for upcoming AMD platforms(which reports table version 3), so 
there is no issue to address on stable.

Thanks,
Krishna
>
> (I can add it if that's the case, no need to resubmit because of it.)
>
