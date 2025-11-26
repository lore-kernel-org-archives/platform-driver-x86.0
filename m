Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010026.outbound.protection.outlook.com [52.101.46.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A7131B10E
	for <platform-driver-x86@vger.kernel.org>; Wed, 26 Nov 2025 09:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764150286; cv=fail; b=YByZJv/cmhnDPH31QicQNYByWIRujDtxX90hrgWG9qGouNSdDaLyL+lBI8V5LrFvs5R1vZydMc1+JcSkYzaZjkAkV/fOBWvSo2G+87B3o6ioUWSyr+iLNaB96fvZ6OconWMrq66r0zhQsRcz/XaNaSR2IzuwDTuIai8+SgMfaRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764150286; c=relaxed/simple;
	bh=dg2IH/y+BrpKXUv3ussYF3ZSTOjR9elqnj1bKT1BBMw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=F1P44NcBJVrNDwFPyhI/Ni4jCkR+J891g9xLRLaPwJ9817hsP6cVfdp9tvSund6o8rDMFcXSu/8k6qVd+YKEdccAVZyfjm7di3Nf/wotjfnm6Ekv9qTiG44jy6+8bqwfFXVR1UERWf3MlsdR5g07UTtUX9DXiWr+ekDQ7Rk2kcE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=S4aXhkdm; arc=fail smtp.client-ip=52.101.46.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="S4aXhkdm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UnRgYTiDtwBWTu2kM5D1BpxLu0RQwIwjBywTavl6sTZWgik+VkN8klPaZ7gQK+C08CpHzsL+PWOWAFV8Ws4OduVsWHR8+/8pie5dd6alP/mh9EsTsvfsa5Pf8L7LNyOyCN8GWkiWoWfkHmzGYS5+3rIIra+PKU1OFvRy9s/3OQ3ML8G8aTVKXbWN/OFwhfcwG3RWtb+YhpadR6DFOAGdH9x1Ly2dvL8yw1EjprHKf457vWLQS31AE0f6xShh0i8u3a9b/jjCz9fpF8Tmwzz6VdgP7WhJNJTfXysTZgKOQYE82/hQSp6Zy4RPBxgw/5cLDNlGYDPCXXnL/PAEzXImMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z3lr+Ep/06BxNgGgpVNik8ypxio1Tv9MqP2cSmB4hqI=;
 b=byy7bbBQoNaI5NlHYnxvm4gyu7f1QbiqbsWHpORNROMyD4AtVVq6ETYGUCpGI7ORrWjBbtGBNWV8xJlDU8KxwotLW54vDd0F99C3FNot6WsEyjpF2Ei/8rsxpdZs4v1X5f7bfxMMLfT2WjUhX9g0v0SM/u7DEWv+Fz6+QEBdFsksoOjzoq3g5ltVW0durOKZy8qWEln4C2EiOWA5q2ZV7lM8x+aNj6LYRW13ieqfIDZugRQd8O01J6LtsHgTKY1XDAQIea8gyrcZhcNAi0UKnRlgG1sZX94FVsNOZ9HxeXDf7lUPRPWQ9DxSYhFBk8wXo4o8CIyUaqosqg+N1u8aYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3lr+Ep/06BxNgGgpVNik8ypxio1Tv9MqP2cSmB4hqI=;
 b=S4aXhkdmu48aiBThkTsHRP9GYBkywv5xmEQ1ORIBKiLirzNvdkICXotOSM73FpLgtPe65BifBTdT/54Fiw27w4p1xZF2q9oTjaPYSUlmqqIyP6/qHGUQg0nCHz2bK2MtPZ5zzADKG+rgkFNhUXpN6ciNztSM3HCS7HUoyYTsSx8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5177.namprd12.prod.outlook.com (2603:10b6:408:11a::19)
 by IA0PR12MB8422.namprd12.prod.outlook.com (2603:10b6:208:3de::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 09:44:39 +0000
Received: from BN9PR12MB5177.namprd12.prod.outlook.com
 ([fe80::d8ff:d187:656:572d]) by BN9PR12MB5177.namprd12.prod.outlook.com
 ([fe80::d8ff:d187:656:572d%6]) with mapi id 15.20.9366.012; Wed, 26 Nov 2025
 09:44:39 +0000
Message-ID: <e9f5450b-3bcf-45c4-af10-e64947cef118@amd.com>
Date: Wed, 26 Nov 2025 15:14:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/pmf: Refactor repetitive BIOS output
 handling
To: Hans de Goede <hansg@kernel.org>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
 mario.limonciello@amd.com
References: <20251126093146.3775572-1-Shyam-sundar.S-k@amd.com>
 <07435916-caed-41db-aaa6-7c94d44f0284@kernel.org>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <07435916-caed-41db-aaa6-7c94d44f0284@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0027.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:273::17) To BN9PR12MB5177.namprd12.prod.outlook.com
 (2603:10b6:408:11a::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5177:EE_|IA0PR12MB8422:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e115a37-3625-477b-0fea-08de2cd06b43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aEpQamFsQ2RldzIyMEVWcnRLbnNVN0dzQ1JBdjBSWXJzcUhoa2dESWtEbFU3?=
 =?utf-8?B?d1RWVzFNWi9RRDN1TXJmbEFXT0ZZSktBTitSUGE3RWorNVh5S1FaMWRNWGhE?=
 =?utf-8?B?ZjF5UHdjWjBxRW5oNThuTTdkbFVzeHpmdlFjdlhtb2tMbHlEVmZxMEZPRVAv?=
 =?utf-8?B?MDdVNGhCajZ6akJVTld5ZTFNQkFCNEF1bGVEWVpjbkN3OG01aHZXQ05CNXhk?=
 =?utf-8?B?UXpFS21Ic1lyYXNTenRKOU9FNFViTnlUWlRwZDN3RXJGYkdCczVwMmxnTGl3?=
 =?utf-8?B?NVNSZkwvMVM5UHBteCtGdGxWbEZ5WnlZKzZXNWxtbmxKRklmVWNFdWhIWExQ?=
 =?utf-8?B?RXYranRmWWpId21oQkM4ZWFEK2RmOVpNb3JPWnIwVThydDdsMEpzWjB3UXZE?=
 =?utf-8?B?VTBjRlNKcndKWFIwWHNEcEZka0VweTVZTEI3SDVQRmlYa2NRYXU4Q3RqQ081?=
 =?utf-8?B?MktkbWViMStRdXBMZG0xMW14cnBLSnIyY3RxTmtLUWlQMDNmMDcvNDlHR1FR?=
 =?utf-8?B?OXE5elQxQzF6aTdmTll1a056RWY2ajFLeklESUVFUXpnbStKVGlDeUxGdlV0?=
 =?utf-8?B?bDZiYm5ZelhxSGk0Y2tsQmxTNWUzRzRkYUpVc21pMmJtZWRleW15TGFZS0FJ?=
 =?utf-8?B?QmN3Mk1FRE5iY0lQcktHbFM2RG1ER1hnTWJiUUJ5cmpneWp0SUVCR2ZHcStu?=
 =?utf-8?B?cGdqRWt0K3ByMzhYZm5BS2VCczYvM2NwYlpqcmE5NjQvOVE1ejJVWXRScUlN?=
 =?utf-8?B?WVZ0MWFJMmVjTTlGTm9raUdIMVJPUzdST1dpZkkxSWtubzZXbHdhL0N0b0tn?=
 =?utf-8?B?TzN6UG5wdS8yazg3NVJkbm5HYnlJWk9ZMjZrdVdZWXRFWjVEdzlML0tnOXov?=
 =?utf-8?B?aGlpSElDU211NExpUG9hV0NvSXByVXJlZVJMNC9WMGRRaC9YUFhmNVJPK2ww?=
 =?utf-8?B?RmhOUUIvZEs1QWQ2NEhVSkMvUDVYaDUxaWpaV21XcVZ0QzZPNUEzWXNMa3Q1?=
 =?utf-8?B?Rm85REpXZUpDNU9HSWpQYlY4aFhrb2toTjlXMDllUE02bXlmNFNYa1NqOHJS?=
 =?utf-8?B?Tmk5Mm5lNWF0RThpUzhaVklJWEtyeTVwbW83MEgrT3hrNEVtMFNEZFNlQ2py?=
 =?utf-8?B?UFJnSDdBRnlDMG5XbklqSnh5d2N2Uk96cE11b0RHSm9ZWXV6bzE0T1EzVTUr?=
 =?utf-8?B?ZlEzcks3ZUE3NVJoaDlpM2ZaaDRkS1lDc0FTZTM0YWdEZDU5WkhtL1IyQyts?=
 =?utf-8?B?ckp5bGdGYnpldWdhTDdDN1dkZHRTRFlaOG5Pem9IR1dZRTNSUExSSmhOL2wv?=
 =?utf-8?B?SXMrK1hxcExuYzFJYWJKK01vNjFacm9EQ2NsckVaWWlHdnAwYTFrT2EvaHZV?=
 =?utf-8?B?MFpqUTRzamlpZFg5cHJJa2c5SkNRa0tYNWRGRmdyLzFzbjE1NGRLVmp0NXVP?=
 =?utf-8?B?Q09vdmxHYTh3RDJVcTRDYlRULzFZaURpcFBFKysyeno4WThoNTNEMWUzV3ky?=
 =?utf-8?B?Szh5enNOK0xLRFdKcHpieVU4WDVRbU5lWmdSZXBSZy9uZzJCUEZsM1FkQzlx?=
 =?utf-8?B?dUd0NlgvK0ttTFhoRldPNmZyOElaTERxZVR4QTdwRFo0bTdNNUUzNXVKSFN3?=
 =?utf-8?B?dVlPWTlhZlVCaHdCenVZZHhKMEVTVzVFOWNoRUhxSFBiR0UwcUsya2RPaUE2?=
 =?utf-8?B?ZXVzQXFaaS9XOUZra2Uzdml5ak5IdVVqcXJsa00vZUEyenB1M0JSU3RLSmtC?=
 =?utf-8?B?Q2g0eDR3NzhwcXN1OHVPMm1qa3dBcE9hTlN5YzRvTHd2ZjJZbDBtdzdOOHZl?=
 =?utf-8?B?b2lMYVJ5VUlBR0ErRGRhK1FDV3YvVzl5eTlkNkg5NHowNDJVVWQwd0lHQ1FV?=
 =?utf-8?B?QW9EQVUxc2hZM05oR0hSb3lqTmxzRnZEUkNpU2ljWU1lT0VjUk5WWHV5RndY?=
 =?utf-8?Q?OerQ0tBRMPPOMT+TSp/gfIoTFQ3RXn1A?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5177.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NEwyRVljK2NuSEVxL2hQeXNmMFowd2lWeC9Nc3d6c29LOElseTZXelpxcFdo?=
 =?utf-8?B?ZkFSUmExM2RsK0orSEhtMlFhSWorTFZna0JZOS9VczVHclV2YXZHQlBmeVBH?=
 =?utf-8?B?UEpBOFlOSDBjdDY3ZTUzb2F0dXFTN0c3dldRenF5N01aenI4OXNyYXEwdU1F?=
 =?utf-8?B?U3BvMi9vaWNXd1dYN0ZZdUozdFlZbkV5V2pKbUV3a0poVk55RmlyQmYxZ1Uv?=
 =?utf-8?B?ZEdqMEVoc2EzYmNHR0sweThJNS9NT0hLeUlUT3ZIeVlQQS9pSmpXR1BaUVlt?=
 =?utf-8?B?c2RSdGJjV2I5NE5pRXJ3R2I3UE9UcmlXbHlJbkxWMlJUVXJBMm5kOE9lVzZW?=
 =?utf-8?B?VnA5UXB3a3l1Q0hTUXpBcjZ4MlcrSlJTVE1EOUZiTG0yVlhsakVPdnNPQ3V6?=
 =?utf-8?B?SVF4a0oyZzF4cWRuSkpiektRa2VpQzdzZzUwRXMxMm5xbTQrR1lVcGYrdVFL?=
 =?utf-8?B?OVZZUldFWTNQR1pDNndCK1pDeG9ZK1l0ZUtsVEJKYytzYkFRdXN1NjFLS01H?=
 =?utf-8?B?aFN3K2JNT0IxNVIrVHBsQzRYV3pnaFVpSHZyL3RCMXp1Y3ovSkpHSFg3OG5k?=
 =?utf-8?B?ckJYTnAzQjg0Y0FLbW5FSm9pRWlCN0NnRUpERHloaldCakQvcU5uZUJVeWQ5?=
 =?utf-8?B?N0dSK1AzNm5rNHhOMmk5NURwajZ2VmI2aHRQejRBQldiczFUV0FPcnlZWXBp?=
 =?utf-8?B?ZXc3V0s2ZDZSaTU3cDIxcjY5TjRUbUxuY1N3WEh0SU5XSVA2VER4blBBczcz?=
 =?utf-8?B?QnpQNmtXOWhNekJ6eVJpRS9rUm1KZVI1ckdZbkEvQnliRmpvOTdQajBiOGlw?=
 =?utf-8?B?d2RzVk9mVW14VGtwNDA5SG9Bcmt3UU90blhKVDBIRkRiaStwc1kzd1pNR2xr?=
 =?utf-8?B?MVV5Z0VQRWhmKzBFc0VHTkRDRmlwajh0bVFFYU15end2Skl6VXd2N0NQNG1X?=
 =?utf-8?B?amNIL2xUWlVyMGhvdnV0MytwNXQxVGlVZEZLd3ZGTDRxZlZEQlo5TmF5Q2Fn?=
 =?utf-8?B?blN5RlZsVUpuNWVVZ1E1NDNxRWtnSG5vZDZOSkxDK3E1WHZUclBzS1lZcUFX?=
 =?utf-8?B?b3QwQWRidXlHeDVTTmZGTmk4Qi8wZ0svVnB3L3haS1N5S2cvMnIrS05CRXBV?=
 =?utf-8?B?R0JweU5VM0FJQm5nRlVmOEUvUnJYbGRrdlJxdld0SUFQdWxoKzZ4LzB0YnZO?=
 =?utf-8?B?NlBjYTk1RmJsajQ3Ri9ZU0NidENsL3ZBQUw2Y3M0bEN2amk3TWVUOUowRkpv?=
 =?utf-8?B?aEE5ZzdrWGFDOGFld09NMzc4ZmF6aHNOU1U2TW5TOTkrbm1zSFRaNEpmQzhX?=
 =?utf-8?B?QTNGMThoMTJleFQrMVJHM1kwVEx4MVhqS29jT1RYYmtnYUZoUzAwNEJDUWta?=
 =?utf-8?B?V05neUdoMGVLa3daZkY3MUl6MjB0MktCQm5wcGVlL1BFaXA4QS8veUR2Tk55?=
 =?utf-8?B?bmNPUzZDeHVUbGo1QWdTaWJuOVdFaHZXa2RwbURLZFYzRk10OGU3ZVhNWllJ?=
 =?utf-8?B?K2U1UmN0ajR0ZVZMRHlxK0pXZndFcFpndVpWVWVBSUxYQmcySTdWc1YyVnZs?=
 =?utf-8?B?NjNFdDd6bnMwdjh2ZWRFWlBCNjlnMEc3TjN6cTd6OGZSRStSdHZIV1FvbytY?=
 =?utf-8?B?NER3bXRMVnRVU0ZSbTloN1NCMG9LbkdnbllHTk82cDRzT1hGelpBUXR6Q1Nj?=
 =?utf-8?B?c2NHSkVaTkZIYzF1VW5WeVNKQThUM25kUGNCQURkT1dnQzhLdkl6RGdoNTZ5?=
 =?utf-8?B?Q0NmUU5ZbHMxSkd3NTVUQkMvSFgyNnp5WlRGSTVReU5VZTB1dFJMbWhPL2hS?=
 =?utf-8?B?RXN0NUJvUzJNNjdTaE1mam5pczVZanNjU2xTc2JmeWlQRlVSUC9yR0dQT3Bv?=
 =?utf-8?B?VWhpN1Nac0RUZnIxVVA0Y3JKdjJ2SCtXZ3J6QVBKMjRJUHZLYXhKbmtSb05s?=
 =?utf-8?B?czRncnBjMlljSGtlQ0JaVXVGTTMxU3VhODhKTXZraWxzTW5NSGRDTTNVVXlI?=
 =?utf-8?B?MCtmcTBlV1dCUkk3M3N6R2E5ajBXUVlDOENMS3ozdzJaYithMFhySHFtZTlI?=
 =?utf-8?B?QVplcWZ1NUhjT3VPTHd0RVdka3Fybit5d1hKbFVrcFNDNGt0QTVCL05Heitw?=
 =?utf-8?Q?IbeEFGQKpLmw8ppk9msT88RTb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e115a37-3625-477b-0fea-08de2cd06b43
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5177.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 09:44:39.8266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2P/oca+hwNYou16ECa6hqQQDWIn3CgKMRHGJxJ+LggnrSeL73a4nEz0Hk0Xa68UVWRhARlBIqWchAqzKnQKXOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8422

Hi Hans,

On 11/26/2025 15:06, Hans de Goede wrote:
> Hi Shyam,
> 
> On 26-Nov-25 10:31 AM, Shyam Sundar S K wrote:
>> Replace repetitive switch-case statements for PMF_POLICY_BIOS_OUTPUT_*
>> with a helper function and consolidated case handling. This reduces code
>> duplication and improves maintainability.
>>
>> The 10 BIOS output policies (PMF_POLICY_BIOS_OUTPUT_1 through
>> PMF_POLICY_BIOS_OUTPUT_10) previously each had individual case statements
>> with identical logic. This patch introduces
>> pmf_policy_to_bios_output_index() to map policy values to array indices,
>> consolidating the handling into a single case block with fallthrough.
>>
>> This approach handles non-sequential policy enum values gracefully and
>> makes future additions easier to implement.
>>
>> No functional changes.
>>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>> This can be applied on ilpo-next branch.
>>
>>  drivers/platform/x86/amd/pmf/tee-if.c | 64 +++++++++++++++------------
>>  1 file changed, 36 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
>> index 2c74ba2a0b51..a379556032fe 100644
>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>> @@ -73,6 +73,34 @@ static void amd_pmf_update_uevents(struct amd_pmf_dev *dev, u16 event)
>>  	input_sync(dev->pmf_idev);
>>  }
>>  
>> +static int amd_pmf_policy_to_bios_output_index(u32 action_idx)
>> +{
>> +	switch (action_idx) {
>> +	case PMF_POLICY_BIOS_OUTPUT_1:
>> +		return 0;
>> +	case PMF_POLICY_BIOS_OUTPUT_2:
>> +		return 1;
>> +	case PMF_POLICY_BIOS_OUTPUT_3:
>> +		return 2;
>> +	case PMF_POLICY_BIOS_OUTPUT_4:
>> +		return 3;
>> +	case PMF_POLICY_BIOS_OUTPUT_5:
>> +		return 4;
>> +	case PMF_POLICY_BIOS_OUTPUT_6:
>> +		return 5;
>> +	case PMF_POLICY_BIOS_OUTPUT_7:
>> +		return 6;
>> +	case PMF_POLICY_BIOS_OUTPUT_8:
>> +		return 7;
>> +	case PMF_POLICY_BIOS_OUTPUT_9:
>> +		return 8;
>> +	case PMF_POLICY_BIOS_OUTPUT_10:
>> +		return 9;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +}
>> +
>>  static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
>>  {
>>  	u32 val;
>> @@ -183,45 +211,25 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>>  			break;
>>  
>>  		case PMF_POLICY_BIOS_OUTPUT_1:
>> -			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(0), 0);
>> -			break;
>> -
>>  		case PMF_POLICY_BIOS_OUTPUT_2:
>> -			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(1), 1);
>> -			break;
>> -
>>  		case PMF_POLICY_BIOS_OUTPUT_3:
>> -			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(2), 2);
>> -			break;
>> -
>>  		case PMF_POLICY_BIOS_OUTPUT_4:
>> -			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(3), 3);
>> -			break;
>> -
>>  		case PMF_POLICY_BIOS_OUTPUT_5:
>> -			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(4), 4);
>> -			break;
>> -
>>  		case PMF_POLICY_BIOS_OUTPUT_6:
>> -			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(5), 5);
>> -			break;
>> -
>>  		case PMF_POLICY_BIOS_OUTPUT_7:
>> -			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(6), 6);
>> -			break;
>> -
>>  		case PMF_POLICY_BIOS_OUTPUT_8:
>> -			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(7), 7);
>> -			break;
>> -
>>  		case PMF_POLICY_BIOS_OUTPUT_9:
>> -			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(8), 8);
>> -			break;
>> -
>>  		case PMF_POLICY_BIOS_OUTPUT_10:
>> -			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(9), 9);
>> +		{
>> +			u32 bios_idx = amd_pmf_policy_to_bios_output_index(out->actions_list[idx]
>> +					.action_index);
>> +			if (bios_idx >= 0) {
>> +				amd_pmf_smartpc_apply_bios_output(dev, val,
>> +								  BIT(bios_idx), bios_idx);
>> +			}
> 
> Since you know you are in case PMF_POLICY_BIOS_OUTPUT_1 .. PMF_POLICY_BIOS_OUTPUT_10 here
> amd_pmf_policy_to_bios_output_index() will always return a valid index, so IMHO you
> can drop the "if (bios_idx >= 0)" check here.
> 
> Otherwise this is a nice cleanup, thank you for cleaning this up.
> 

Thank you for the quick feedback. I sent out a v2 now.

Thanks,
Shyam
