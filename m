Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2062.outbound.protection.outlook.com [40.107.243.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC0D19AD56
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 Aug 2024 13:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723556019; cv=fail; b=GSuHOqDvMQKq/KHYHC6iOE5CBn1FfTJzL6YD/Ln7TV1EtszJTx+5ka/HLuys5dxG/9vDvPqJRhzVyrKHujEGBAsVykpsrs4Du33wVFsbcG1CrLfmBpKQqQ2aR90RlPLGBo2PA+iDomG6USCTAw3qT4SYZju/dJUWK/H96wO6ijc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723556019; c=relaxed/simple;
	bh=g24ZdAhha7qK7SnOIbjNglBZrPgWDs6nuQRPyY5pnQc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=thYqgeOsQ2fbHs0TSu03q+lOStjSGS5ENEvkUYlZQkybhEwFeMBoKSEwE9dmtYENQmUeQcCwEki4rKGPPVx2Wk14LO3zH0fEFTSW+ym8tqnRKT/1mva9rzn2Ed5kWutpkSde4jVcUDoEOO786Li4ywHAqjKYe0i7NJTq2Wmzrho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=zcAo4OQq; arc=fail smtp.client-ip=40.107.243.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zcAo4OQq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ejS2SjTZvJ5wNNWsgoIB1gBguzv9RASD8+1Qx2IoUuMFQyrhCr4MYz5foRWwBvfAkNvRyj5D7zW93RcV7egQK6jWVzSvwx7FaX+QGtWVldr/aSn2mUANlOtcov/Tl3T4f4nKFJ+TXG6KLD8+Hc8LY8uzbFVmTkqbRjXpQMQlbUU00XLmgSTfAq3C1/1ZQrtCodEGq0ZOIbYBx9qHakgohstXP2/WWhc0WNAVjgxjq906i3Unw4HANwTlPBqU3MrVFypqD7q0EDyzdEyxtt9/bYiNOXZJpcL2wrIKocxrODN9fhKZUErA/puTxUv3GJ5CD9Z93ENV3kyBHpvvyMBbig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GB2wrZignAUDQFkg4JATPsykhjMlmop3+74aQ6Qg2fw=;
 b=JlK3yB78ki4cc9C2x1zFfza/S16pieS1igxlvqTRdP3ZwDWdqFEIx9+qtPagz1QqO/c3zKZ1WnFTv+qfzoXvnUEBUy3REsZOT97y/0TNYPjPlzQtSChk7ZOszN557ibGhH/Ux4boMngfU2uFMlolO3Vl1HkolbcuRp9RL9yWFvrthMqUvROikfbknZM/6U0PnZ95aPu86jNJ3nJBuHRCIKhZaar7V7cKw7Vavr93y6V93nEiEq03uyji9Ks2jcs7do1jrohOteij5JTpToid0Hw/jytE9spKTy+9koimTLkaceYhyR4mJCWD79TyUb179xfRN8t83ffQH7rS6UuARA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GB2wrZignAUDQFkg4JATPsykhjMlmop3+74aQ6Qg2fw=;
 b=zcAo4OQq5TCfixAMXYyM8xWXa8VWqdgwpSEV60x3tTVmAQchKMYoWnFarvgVp/pLvkwHfT9pmftIpoFVJVtPqrgg+2T3ljskHG9fpKik/FITNqxHuM3N5LwN9zGne6+h7GM2oZ2d2kLzIx+dNJvseM9GsOmg+KyA4YMXrxV62rM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CH3PR12MB9194.namprd12.prod.outlook.com (2603:10b6:610:19f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Tue, 13 Aug
 2024 13:33:34 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%4]) with mapi id 15.20.7849.023; Tue, 13 Aug 2024
 13:33:33 +0000
Message-ID: <fb53af5c-5662-44f0-bd23-999026441737@amd.com>
Date: Tue, 13 Aug 2024 19:03:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] platform/x86/amd/pmf: Update SMU metrics table for
 1AH family series
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org,
 Patil.Reddy@amd.com
References: <20240813090040.364504-1-Shyam-sundar.S-k@amd.com>
 <20240813090040.364504-2-Shyam-sundar.S-k@amd.com>
 <943494f2-5a0e-877a-d7b7-59180fec86b5@linux.intel.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <943494f2-5a0e-877a-d7b7-59180fec86b5@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::10) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CH3PR12MB9194:EE_
X-MS-Office365-Filtering-Correlation-Id: 18d08d0a-146d-4af4-2397-08dcbb9c86e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NWp4VGVJVDZpb2FuL3cvMGN0QW5QbGFLVHR2MVh5UFZQVHNwRzNQRThZbC9X?=
 =?utf-8?B?SjRLdVliSUM0N05Nam42b2F3YnllRzJFam12L0QvUlJXaVgrUUpVVDlmeXJr?=
 =?utf-8?B?bXNBbE1SMG1aemdWMjVwZDd3b2g2WmFyajY3czFzOEkyUGNqMXVDQlF0VUxX?=
 =?utf-8?B?WWNCMitnZi95dktmTm1jYzJaZTd6Wk5teFQ2a3JjQUxPOVV4NVNFK2xFRXZG?=
 =?utf-8?B?bURDdk03RjI5VkJVenRuT3MxdEJZQ0xtRUpFTmFJc2pyWlQ2Q1hTT3c1Nk5Y?=
 =?utf-8?B?T09GbXRBRHQyLy9DMzQrSDVoWWhSTFBPdFFzVnpJSkh2R0EwV3AzVkFRbEU0?=
 =?utf-8?B?d3dmb21NZ2hyTlBvUS9ISkQzSC9LWmFJYVlrbGJYUi9zZ25uMGJpQ0FtTkRq?=
 =?utf-8?B?RWNPZDUvQUlPWStLSTJaTk1PMy91aVhSYTZ0THdpQm5KZWhwRG9LVVJjeTdF?=
 =?utf-8?B?UFhKcHVpVG5FdG84ZFJxc2Y4Y0hhZnArVzdkSWVQTTlzQVN3OVlaUWdrYi9F?=
 =?utf-8?B?TWpGQkxMbWcyM2tUaUxoK2I2RUloMy9NZDVuSXQzZm0vTW1RU0REdU81dEtq?=
 =?utf-8?B?QWZlT2pmSEgzZmdObDJOUTJzejEyOUJibndCNTVXeEVwU3ZwNE44a0FGc2xV?=
 =?utf-8?B?K3JvRVI0UzRIMzhVeDdHYXBaT21sZGJCZmRicjZRRlFWOTRKRXVPY2g2NVcz?=
 =?utf-8?B?YitsSCticEs1OXpOVnBlUDVDRnZhQ0xuZWIzOXhtTVQ1MVVmRi82eDZBRWZj?=
 =?utf-8?B?VGpxVHZwblhmM3lSZEVUWkZYZ3RiU3FCdVo4VURaNXZjYldBQngyMUdaTGEw?=
 =?utf-8?B?dDlObVpLY1ZQTVJPaHU3dTR1bXF4UmVPTHJXL2JkNzRBdEdyZS9pekZJS2Nz?=
 =?utf-8?B?YWJ0c0JVVDMrRnpWMnYyZzBSdjNFckRablY0a2gxcWMvdHMvY255MnZpQXha?=
 =?utf-8?B?U0d5TitaS2wxT1dzQVJnaTVlSEtHZEhPZTBYMk9tTTBwRlNJSlFwWXFWTE9j?=
 =?utf-8?B?VmpyU2NSWUFtM04rdVdmM21HdndDazhnWnF4MUhJTkxmVU1qTEJLMzg1b1Z5?=
 =?utf-8?B?c2psZFc2WmJFRjJWMDNoMit2YkM5WllOeFIzM1Fkcnp3bzlYakFIUVBjQm1X?=
 =?utf-8?B?VEtPdk1sSmxUK3lUT2VTR0xBNWUwV2YzNzJPTUd0OGFPZVNWTXVtRGVwWWZQ?=
 =?utf-8?B?aGlFZGFaSjI4NEdqbCtVUzZSTmgrbmUvRmxJR2FLSDhlbmJKUnRKSkRLTVE4?=
 =?utf-8?B?REZRZmY5MGQ1Zk9vYlllOCtMREJZQW44bXc2bGloZ2p3VUl5bWx4YmJzbVdJ?=
 =?utf-8?B?OU45WTVMUEk5S2IrWHQ5UjR2N29lQ1VmZVEwalBHSWxkS2d3VFM0cnR6TUN5?=
 =?utf-8?B?T29IZng2UGN1aVhTZHRweStGVm5vMVRmNVVUNlRzQ0lEUzVBQXIrNE11cGhT?=
 =?utf-8?B?Wm1pbDVVOHBMMmxmQnRBemxCNVdEbjZ1UHoxRStnNXdsMVNnaEw5Z0ZDWjNM?=
 =?utf-8?B?YTBSaW1ya1BwZWtiMG9CNHM4V0YyWHBCN1FUcUl5QjNGQkk2V0lzWnhnZmVx?=
 =?utf-8?B?Rnh4MFZUN3N4MjY1T2V0bnpRUWVNZ0ppNGt6VHBvLzNWaHpwRHppaVU2Vkh5?=
 =?utf-8?B?VnNXeDhJdi9hcFYyV2UvOU5yU1d5aWtyT2dFcGNKeFFrUFdxaWtjZ0htR0tt?=
 =?utf-8?B?UW8rQkFORG9YNUY2R2piR3JHazhQUGF5YWhIMU5XRkt3UnpYUS9JZHdFQXZQ?=
 =?utf-8?B?YlJNZkl3MURrbWxFNzdtcE9hWnFBcU9Pc2RobmxxbUJQUVJISFBsWUtvWE96?=
 =?utf-8?B?VUVCa0JvMTBsUFAxOFFFUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDJaWXhrWjRnczhCOElQQXhOb1RSeUxoOUZ6dnJkclA5c2tmVkVmZEJoZ3Zq?=
 =?utf-8?B?N1dxNmF2bFU5TmhaMVdLTUp5Y0NBNzJpY0pDQlBDeXc2c2p5eHQvQ2Jrdmgx?=
 =?utf-8?B?TnBmVkRacitqQjVUWVYrb3pwaHd0ZzZhZjBZMFB5ZFMyQ0o2dUpidmtucXNW?=
 =?utf-8?B?UjhLZktpNEVxdFJQYTBHa3QvZnhUYTBzUTFQcHcxTWQvZGNscTdqYldXVW5v?=
 =?utf-8?B?K0p6b1BGbEJ2MWkyVjhwR0h3YVhqODIvSjZSeWNrMFcvdTRmYnp4NkoxSmFa?=
 =?utf-8?B?R1dIWXo3RjNNdWxLWXF2alhTL0duSHhNL29kOWRPV3dLeDVTbEIxYkw5SmxW?=
 =?utf-8?B?S0NDR1ZJSzNYY3p5S0VCeWRVeHdGVmprc2dMRXV2cTJqYzhzaUE1WVpvU2gv?=
 =?utf-8?B?L2ltdUl0Z2QrcGN0dHVrUjg5c1BvT2N5dER3ci9pNFF2R1pZUVJqbzIvbFZH?=
 =?utf-8?B?VWVOY2Fwci9IWXQvQ3ZJc3d3c2lkbTkxQ2tjV1B4Q05TQTQrajJLYTJVRTZy?=
 =?utf-8?B?UDU1dXVKaGpHelBjQzFPbUJOQTJNMjIwTzM1RHdJb25qUGNXUmcvVzBtSzRN?=
 =?utf-8?B?ZzZrcmtXa2M4YUlmNGF0NzYvdnR3aE9Hc3dyRFNoTlZIeFNLUk15NXBZS1N3?=
 =?utf-8?B?LzRMSEI5V1luQUsySytGd3lDQXN4Q05pMC9meTg4bHNRckFyczhOV3JBZTFR?=
 =?utf-8?B?SEZVK2VNdHlWU1NTSVNQWVZzVUxqYzZqL0w3a3d1K0NaRGtJTDBwWjR4U0xL?=
 =?utf-8?B?cmFXV1F1VFJpdTYzYlJlNFBPNVhWNHQ3SUQzM3U0aFVBTW9aUlY4TEUxK1Jz?=
 =?utf-8?B?bGFGNTFrVGJBTlpNSlZ1SWl0bER6SE5JQ04zR1hOMDNyWHZoak9oZWRBL1V0?=
 =?utf-8?B?dzFmYUVpMWMvcGV3OFpDekYrajJwUGRicHhYYlFjcm1iUkgxdHRrS2l5VC9P?=
 =?utf-8?B?SUE5d2o5M3BKN2Nzcys2WmxoQ0JLd3FXQ0FWOVZVeHJvZUZDU2pvdGtFNmNj?=
 =?utf-8?B?OHh6Qy94QUJVL3dqSVY5S01sZmdzODdMS1czdlNDSkc2MGFCWC9aa0M0TU9m?=
 =?utf-8?B?bzNvOEo5dkpSTkdJZzdFTGhjMy9TSXprRCtaWjFrcUxkRU5wTWJLR0lpdjN6?=
 =?utf-8?B?QTc2bUpJK2dRdlZ1VlU5RVo1Q1Q4N1gzZHJOTGszcW1sWWJRTWZNbXUvNWhP?=
 =?utf-8?B?Wnp0UVFBVm5aaXVQYW5TUjJxMWExL0RsRlpsK25qRUcvaVRjVGdyK3ZQTXlt?=
 =?utf-8?B?Qm4wQTJaOU5BYTdIZGFTV0RiT2c5Ulk1bVJ0cmg5aHhmUzQzQVprdm5jdVh3?=
 =?utf-8?B?QS9yMEN1Zi9HSXk4SzFCdlJqaFRnaHo1c05oTkFTSzRUWFZ2cFZQVTZzVzBP?=
 =?utf-8?B?aTBzQzBIYjZrL1RaUDFrMEx5SWwwdG5sUVZWSFliMzRCV24zWGZCako3dUNY?=
 =?utf-8?B?MGZBaFhYREkyRC95VFhPa3BnQWlBRzhqaDV0UWQxK3hjSW5OWTZyakRvSHhn?=
 =?utf-8?B?OVVFTWo5OWFwVGIrLzNUOUNaWkpGbGZEa05zZzdaRFRicTB4aWl6bG5hK2xk?=
 =?utf-8?B?aVc1TE9NaVE5OExPYVNOWEMxRUk5N0VLaG9Rekc2eUxWZllQdWI3YmtrVFpL?=
 =?utf-8?B?V0xOM0FpNUhtMGhiNFRSYU5XV0ZodU1QR1c5NU1NbDZldlZyWW1BZ1RQVlFj?=
 =?utf-8?B?cml3N2NlVEhHR0pwTnV1Znc1LytDTThUQlVuV204OGMwUTNPWTRRR0JaRXht?=
 =?utf-8?B?T1doekpMOGFGczVVaG43WG1TWmlqTWEvK1ZveHQrYzJwR2p5aGxsUW11Ymtz?=
 =?utf-8?B?UmI4eFRsY0dpVVZWclU1bzhhNUV5bGFkVkdBK25MMVFSdDBRaUxtaHpDSWxI?=
 =?utf-8?B?SW5mWXBaLzBUS2lIQzNiWnV1N2MyQ1VJT29POVR5ZjdBcHIrNTlBK0owcjBM?=
 =?utf-8?B?QVZwT2NXWGRWZElSbDdpMm5uam5XeVlUVkpGN0JtRjE1NTZndERVM29KOU9j?=
 =?utf-8?B?dHAvcUVLMGs1TnVibXRZczhrM1lDTzl1MStwai9VR3FrcUxINUJFTGY5MmNT?=
 =?utf-8?B?cWJ0dmVVaGF3aERwZHd2RTdnNnU3a25qd085YU01VmNsSHJ4UCs5WnJPRUJQ?=
 =?utf-8?Q?Y+Z1dT9zUXZfPbSWSWF/rkmBJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18d08d0a-146d-4af4-2397-08dcbb9c86e7
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 13:33:33.7939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sr3ITEoXXvPzkX5GlLW+NEJ8296Fb1XGJ116hdftNyTYliTqU+BSBDddk+ajRiWEP0gfyIhOdKYBAsIhJn3DGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9194

Hi Ilpo,

On 8/13/2024 14:38, Ilpo Järvinen wrote:
> On Tue, 13 Aug 2024, Shyam Sundar S K wrote:
> 
>> The SMU metrics table has been revised for the 1AH family series.
>> Introduce a new metrics table structure to retrieve comprehensive metrics
>> information from the PMFW. This information will be utilized by the PMF
>> driver to adjust system thermals.
>>
>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>> v2:
>>  - Align comments
>>  - add helper for max and avg calculation of C0 residency
>>
>>  drivers/platform/x86/amd/pmf/core.c | 14 ++++++-
>>  drivers/platform/x86/amd/pmf/pmf.h  | 49 +++++++++++++++++++++++
>>  drivers/platform/x86/amd/pmf/spc.c  | 61 ++++++++++++++++++++++-------
>>  3 files changed, 108 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
>> index 88314b0277a3..0ba9045224d9 100644
>> --- a/drivers/platform/x86/amd/pmf/core.c
>> +++ b/drivers/platform/x86/amd/pmf/core.c
>> @@ -255,7 +255,19 @@ int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev, bool alloc_buffer)
>>  
>>  	/* Get Metrics Table Address */
>>  	if (alloc_buffer) {
>> -		dev->buf = kzalloc(sizeof(dev->m_table), GFP_KERNEL);
>> +		switch (dev->cpu_id) {
>> +		case AMD_CPU_ID_PS:
>> +		case AMD_CPU_ID_RMB:
>> +			dev->mtable_size = sizeof(dev->m_table);
>> +			break;
>> +		case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>> +			dev->mtable_size = sizeof(dev->m_table_v2);
>> +			break;
>> +		default:
>> +			dev_err(dev->dev, "Invalid cpu id: 0x%x", dev->cpu_id);
>> +		}
>> +
>> +		dev->buf = kzalloc(dev->mtable_size, GFP_KERNEL);
>>  		if (!dev->buf)
>>  			return -ENOMEM;
>>  	}
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>> index 9fc26f672f12..8ce8816da9c1 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -198,6 +198,53 @@ struct apmf_fan_idx {
>>  	u32 fan_ctl_idx;
>>  } __packed;
>>  
>> +struct smu_pmf_metrics_v2 {
>> +	u16 core_frequency[16];		/* MHz */
>> +	u16 core_power[16];		/* mW */
>> +	u16 core_temp[16];		/* centi-C */
>> +	u16 gfx_temp;			/* centi-C */
>> +	u16 soc_temp;			/* centi-C */
>> +	u16 stapm_opn_limit;		/* mW */
>> +	u16 stapm_cur_limit;		/* mW */
>> +	u16 infra_cpu_maxfreq;		/* MHz */
>> +	u16 infra_gfx_maxfreq;		/* MHz */
>> +	u16 skin_temp;			/* centi-C */
>> +	u16 gfxclk_freq;		/* MHz */
>> +	u16 fclk_freq;			/* MHz */
>> +	u16 gfx_activity;		/* GFX busy % [0-100] */
>> +	u16 socclk_freq;		/* MHz */
>> +	u16 vclk_freq;			/* MHz */
>> +	u16 vcn_activity;		/* VCN busy % [0-100] */
>> +	u16 vpeclk_freq;		/* MHz */
>> +	u16 ipuclk_freq;		/* MHz */
>> +	u16 ipu_busy[8];		/* NPU busy % [0-100] */
>> +	u16 dram_reads;			/* MB/sec */
>> +	u16 dram_writes;		/* MB/sec */
>> +	u16 core_c0residency[16];	/* C0 residency % [0-100] */
>> +	u16 ipu_power;			/* mW */
>> +	u32 apu_power;			/* mW */
>> +	u32 gfx_power;			/* mW */
>> +	u32 dgpu_power;			/* mW */
>> +	u32 socket_power;		/* mW */
>> +	u32 all_core_power;		/* mW */
>> +	u32 filter_alpha_value;		/* time constant [us] */
>> +	u32 metrics_counter;
>> +	u16 memclk_freq;		/* MHz */
>> +	u16 mpipuclk_freq;		/* MHz */
>> +	u16 ipu_reads;			/* MB/sec */
>> +	u16 ipu_writes;			/* MB/sec */
>> +	u32 throttle_residency_prochot;
>> +	u32 throttle_residency_spl;
>> +	u32 throttle_residency_fppt;
>> +	u32 throttle_residency_sppt;
>> +	u32 throttle_residency_thm_core;
>> +	u32 throttle_residency_thm_gfx;
>> +	u32 throttle_residency_thm_soc;
>> +	u16 psys;
>> +	u16 spare1;
>> +	u32 spare[6];
>> +} __packed;
>> +
>>  struct smu_pmf_metrics {
>>  	u16 gfxclk_freq; /* in MHz */
>>  	u16 socclk_freq; /* in MHz */
>> @@ -295,6 +342,7 @@ struct amd_pmf_dev {
>>  	int hb_interval; /* SBIOS heartbeat interval */
>>  	struct delayed_work heart_beat;
>>  	struct smu_pmf_metrics m_table;
>> +	struct smu_pmf_metrics_v2 m_table_v2;
>>  	struct delayed_work work_buffer;
>>  	ktime_t start_time;
>>  	int socket_power_history[AVG_SAMPLE_SIZE];
>> @@ -319,6 +367,7 @@ struct amd_pmf_dev {
>>  	bool smart_pc_enabled;
>>  	u16 pmf_if_version;
>>  	struct input_dev *pmf_idev;
>> +	size_t mtable_size;
>>  };
>>  
>>  struct apmf_sps_prop_granular_v2 {
>> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
>> index 3c153fb1425e..910ba7925f13 100644
>> --- a/drivers/platform/x86/amd/pmf/spc.c
>> +++ b/drivers/platform/x86/amd/pmf/spc.c
>> @@ -53,30 +53,61 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
>>  void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in) {}
>>  #endif
>>  
>> -static void amd_pmf_get_smu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
>> +static void amd_pmf_get_c0_residency(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
>>  {
>>  	u16 max, avg = 0;
>>  	int i;
>>  
>> -	memset(dev->buf, 0, sizeof(dev->m_table));
>> -	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, 0, 7, NULL);
>> -	memcpy(&dev->m_table, dev->buf, sizeof(dev->m_table));
>> -
>> -	in->ev_info.socket_power = dev->m_table.apu_power + dev->m_table.dgpu_power;
>> -	in->ev_info.skin_temperature = dev->m_table.skin_temp;
>> -
>>  	/* Get the avg and max C0 residency of all the cores */
>> -	max = dev->m_table.avg_core_c0residency[0];
>> -	for (i = 0; i < ARRAY_SIZE(dev->m_table.avg_core_c0residency); i++) {
>> -		avg += dev->m_table.avg_core_c0residency[i];
>> -		if (dev->m_table.avg_core_c0residency[i] > max)
>> -			max = dev->m_table.avg_core_c0residency[i];
>> +	switch (dev->cpu_id) {
>> +	case AMD_CPU_ID_PS:
>> +		max = dev->m_table.avg_core_c0residency[0];
>> +		for (i = 0; i < ARRAY_SIZE(dev->m_table.avg_core_c0residency); i++) {
>> +			avg += dev->m_table.avg_core_c0residency[i];
>> +			if (dev->m_table.avg_core_c0residency[i] > max)
>> +				max = dev->m_table.avg_core_c0residency[i];
>> +		}
>> +		avg = DIV_ROUND_CLOSEST(avg, ARRAY_SIZE(dev->m_table.avg_core_c0residency));
>> +		break;
>> +	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>> +		max = dev->m_table_v2.core_c0residency[0];
>> +		for (i = 0; i < ARRAY_SIZE(dev->m_table_v2.core_c0residency); i++) {
>> +			avg += dev->m_table_v2.core_c0residency[i];
>> +			if (dev->m_table_v2.core_c0residency[i] > max)
>> +				max = dev->m_table_v2.core_c0residency[i];
>> +		}
>> +		avg = DIV_ROUND_CLOSEST(avg, ARRAY_SIZE(dev->m_table_v2.core_c0residency));
> 
> This is not what I meant. Add a helper which takes the c0residency array 
> as a pointer and the number of elements (+ the pointers to result 
> variables, obviously). The helper should not care which struct the values 
> come from.
> 

Sorry, misunderstood your remarks. Shall send a revised version now.

Thanks,
Shyam
