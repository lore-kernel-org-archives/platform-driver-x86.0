Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2069.outbound.protection.outlook.com [40.107.223.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863345A116
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Apr 2024 06:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714028371; cv=fail; b=ELeN5d763FMD/wGKfZTeGrNyOpUM3Os7XzToiv02BktIqw32VUGPSHglInkJaeVjip8BxFft8XvP17vNCtxaL9pYP/Rl/5El1C21Aw6cMRqrKk3kMoyR4oEn6PcOLD+aUuHfKWKSruqaXiQYLOTGyYkKpxsv7SyQ5JaQZuJ3OaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714028371; c=relaxed/simple;
	bh=ZyFMDfwz8JuWdlwvgh1f1cIBVgmO6Qr954DjBZ3lLt8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JcI/NTh0FaY8aH+1a5CcAjkgRpfrL5/QRa7WPItEbjDJGnu2IdNdFo49u1NC/hzhW93ukXQy4PN6pMVdQzHu9KRVKgPo9i+5pNvluLEv20VE3o3/VfQTp7IAbu6/MlEk0RF+nyFcAYSUKGAZVIRkStOZb5ZCxeSAvaS5ILGAA94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=J3X2AYb8; arc=fail smtp.client-ip=40.107.223.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="J3X2AYb8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BKZJ8L/8R1phyPXljRJXpCyTogBcTp5gjFtO9jViSC8ipKQdH+rF2bO33xZxC0QR3T/NiCrUHIvpJIeiE2qmk920ptcFp8MxU2Anuc3JAt0fxUEYfaI/tnTbRxIp+gKsFgJnq4dl0yBgffiVIXU+4ny32Y/gqOyzlLz+e0IOs+U49V/ecLFdhVJxzXepbmzH4G20TcityawZ4PmcmdzgnbDoU2TuzmJTnIIULnWl935hb87tTcd1UsrFkUCqx+6HNjiyEl0kAn64aMd7P3rBcKgt8E6IORMFKf0/HQMdB8Gu3Uf6XoevT+KJBtiTL/EPu50ouZJhiryS8pfJbEwdrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RyAaPtsmcuqryrNyKefjo3QSWqyUA9rheq/NKLWlMjI=;
 b=IPEJ1Wac/fPTv9ltULymwVmbdSLqFBIbpj32VVI4/0cn1Z7UWnJdao4qEmC+gz6YBn7UHroIShgFD2Nw5itMa1UJmXdv9Nb64J6kgoL4vqFzEfFjBRKg6gh4P8WBHiQ12bzxw8nmhZH6xvvxjdiwnJ1u4tUaDE05qwDyCnllpTTsvKob5jvUE3PVrgRoSgoG7NhaCwzHSDTABuBJca7lSrfw6TERNbNtinfsBQTCIYRmiDjN7kS1OGHzkb5ro1RD+DFCJsHONvZR0Gmhq0yU3RXTplnkploa/IIO60VKvVEPkLIRByJUgTy9/TMST1WDUqKP1e3h4J4lu0s4Sx9zlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RyAaPtsmcuqryrNyKefjo3QSWqyUA9rheq/NKLWlMjI=;
 b=J3X2AYb832vE+fj0x9niTt9iCO3q9uR/xQJMq9iAlhPxYp8MKyar8/JeoSJdMS1eQSFv+Gzbfw/XYHQ5UpZxiYa/OgSCC3BhafWehhzkR5Hbo7Um72UL9zRHaXdlONeEmi8o7QEp0YQr6GDfihCYr+SzZ2N4vMPCnnMba/ATFCs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV2PR12MB5966.namprd12.prod.outlook.com (2603:10b6:408:171::21)
 by DM4PR12MB5915.namprd12.prod.outlook.com (2603:10b6:8:68::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Thu, 25 Apr
 2024 06:59:27 +0000
Received: from LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::b608:279c:ed3e:b4c]) by LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::b608:279c:ed3e:b4c%4]) with mapi id 15.20.7472.044; Thu, 25 Apr 2024
 06:59:26 +0000
Message-ID: <d0777aea-c58e-4d72-b159-b09fce7ff3b0@amd.com>
Date: Thu, 25 Apr 2024 12:29:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] platform/x86/amd/hsmp: Make HSMP as default m
To: Mario Limonciello <mario.limonciello@amd.com>,
 platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
References: <20240423091434.2063246-1-suma.hegde@amd.com>
 <20240423091434.2063246-4-suma.hegde@amd.com>
 <aeb43442-a9d0-48fa-84fc-ec7ee773ee56@amd.com>
Content-Language: en-US
From: "Hegde, Suma" <Suma.Hegde@amd.com>
In-Reply-To: <aeb43442-a9d0-48fa-84fc-ec7ee773ee56@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0183.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::9) To LV2PR12MB5966.namprd12.prod.outlook.com
 (2603:10b6:408:171::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5966:EE_|DM4PR12MB5915:EE_
X-MS-Office365-Filtering-Correlation-Id: 4997b8fd-0bba-442e-e184-08dc64f53ec0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S25sYTNvOGljem9JMGw3WldTRnNOSllNRkl0cUh6cjBZUkFMT2t2YUd1Qlpy?=
 =?utf-8?B?YU5qRTFTajNuaWZBbTV6ZmR1VDRoT0poTUk1TDg3cUxaeEhYaWZjZ0o5YU5u?=
 =?utf-8?B?QjhCTitjbzVPa3lzSVFOOHY3VWZIeGR2ampTSHJjYjNOemR6RTM5ckFNQW9o?=
 =?utf-8?B?azR5RXhpcFVQRWJkZks2UkpkL2w5QmxpNUNEUFVyTHEzU2JjYjYwVEtJK2VM?=
 =?utf-8?B?V0tPMnlMcmdqNnRSOUpQQ2FDQ09Lb0xER2lOZnlqNFU0aWZBNlFSNW1iOTNZ?=
 =?utf-8?B?SHdLcE9YUTM3UTlZTFRsTXE2NkVxRVNzRlVYdjJGZFNYRG55cmw1cDVsbE1S?=
 =?utf-8?B?c2h2YWErMTFtOWR5aVY0U1JwY2x6MXJhbnVPcEdXNmluYU1KNFZLYjRWRGh4?=
 =?utf-8?B?U2paZ2RKK3dtUUE2NmtrNGI5cGxqb3hMS0JQcVNlblVNNWJuRENVTUdWU1BI?=
 =?utf-8?B?aW04dkU5QnFLM0NLREVaSG5CbTNNMUZveVIzdjZnUU03WXpFa2Y2MXdTSjdB?=
 =?utf-8?B?WmlWMFllQzZKbGMxNUpadDl6K000NzRENzVjYVBmMkpMdU55dkl3cHE4RXNk?=
 =?utf-8?B?TjF0NXB6ZlR3WGMxRnU0SnE4ZkozczdiT0NaL3IxdnpITElPZEJQRnNMQU1t?=
 =?utf-8?B?WFBVNEM0Um9Bc05yVDVMQ2lqNGptYThEM1VzUjVoOFk4UUxXUVZLWFhJSDI3?=
 =?utf-8?B?QTRMQnhLcmxPYlVaNkV5Z1hWM3ZBT0huVXhsRGloNHl2VGd1U0N3UWJZN1dq?=
 =?utf-8?B?dzF1U2w1NDdLOTl4WUkyMnlGcVpoNTkwRHZyNk4xQ1J2RmZkUGVycnJoKzdu?=
 =?utf-8?B?d2Ezd0VSamlaalEyUFRNeCthN1BZb1MrWkR6RUlpc05LdWpkTnpYODdTeEJa?=
 =?utf-8?B?QlljY0RQVXF2MHNiQit2WmFwSTZ4SVdsbHdwY0R2NnBPclRZMFl2OHl0ajFS?=
 =?utf-8?B?R0ZxWGo3dVhPM29qSjhmcmY4QUpyNjlvRTdCYkRpNk1XQ3NxTDVuNVZTMzAw?=
 =?utf-8?B?NUVyeHpjOHdINDVZQTNhVWpDRFhIWGkrV3RIaW1qMldQQjI5S01JU3IzQmcx?=
 =?utf-8?B?Y2tzSENod2JiOHVRT1VRYkpRcVA1Rmk2MVZNN1hMbUpHSXljMG5IRkQ2SHdS?=
 =?utf-8?B?c3JSU05CS20vTEV5MWt4Rm9ZTkFwSEFJWXh0R2FOU0xzZjBsS3I1ekxtTFBt?=
 =?utf-8?B?NXBubEIxaExlL0l2eDR3ZDczN1VSODZsblg0M3FoTnFDdEdGWnVVS2dxVC9u?=
 =?utf-8?B?TElkSkhqS2E2YmRpT21od3EwbmRjeHRNWWpCUzJhZUdFSFNOYjY0eUJMdkVj?=
 =?utf-8?B?aVVldytWUmxJWjhYYWlzcXkrTXZNKzh1OERUOEtqMzRPZkppTDREWVlZSGs2?=
 =?utf-8?B?SVc4RlBPWGE3SlVtbzQybmxpeDJvZFZLT3NySW9EQUJSRjBXL3JDWmZUQ1A0?=
 =?utf-8?B?dXE3MDFIWENkZ1NzSTNEVXVnWkkwNzRFUGxPZUt0NlEyS1YrQTdyZmpQQTJs?=
 =?utf-8?B?ZDBTcmJiOXRBVmdCM2M0UXhLSmpPeTFiZFkrbmpwMm5SdWdMdk0zRzBNcjBt?=
 =?utf-8?B?V3ZLaXpZeG9mT24zUlVtT0dnK2E5TXpsZnFIb0NoTzNlTjhtOG5hOUZCT1F5?=
 =?utf-8?B?MDNRc2U1MDduYXk1cEk3QmJxak5SbnFwWEdHMTlKa0NjUUx5ejNIQzBDMHJm?=
 =?utf-8?B?ZGFWK3RYM09XSDVIOEgrZWNuOEp5K29Nc0ZpeFY2K1pQOEM5eER6TUlnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5966.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDhqNlcwZVFrNDU4aGNEa1VIV3UwOWJVZE5UYVU0emw1S2MyU1VialJXb0lO?=
 =?utf-8?B?QU1pc2haeEg5cWZoVUVaSlFZUy9sY2I2YVFJVXNtL1BsT3p6eGFuMXlTRU13?=
 =?utf-8?B?eXdrNjg5K1FuVGRwV2o4SjNaNU5TQ2tXWnZDYVEzcVdCSDNzVXlWUUMrcHdZ?=
 =?utf-8?B?d1VGL1JuOUdVdFlzUW5UaHYwQnlSNkVaaHZVcUtpb3JrNDZwR08vc0ZVaXVG?=
 =?utf-8?B?djR2b003NWpBSElNWGd2Qk1Oc2xqZ083OUI5M0RkRCs1WWFyZDlrV1hOQXI4?=
 =?utf-8?B?Mm5WUW5KbEdaMnhBYm42Z01kRXFVSnNWSGZ1NGVWanBDR3YvYlZqSTBVUndU?=
 =?utf-8?B?cDVIUnhuV2l4Rlozekd1Tk1WbDRCTGRBMGxva1RZeXBQTEdld3F1eTQ3emk4?=
 =?utf-8?B?WmpaclRWVXhBa2pta1c2QTloWDBKVmI1ZHdaalRIa2VWNG8xRGxwL1F6RCtS?=
 =?utf-8?B?TUZmanZZOWt1QjJ0cTFTdGxiNVVRbmZRVjE0R1dpZWNqSHNaallLSmU1aVNJ?=
 =?utf-8?B?MlB5cTg5RjVNc0V6ZzA2VC9QVldaRzVBbjVNcm5BYzdGTDNnUGg5VEJjRlY0?=
 =?utf-8?B?K21RVnVCd0s4UXNmcHVyTU5oN0FwaTJzNlNyOElwUjBWOXRRWjR0ZXRVTkJT?=
 =?utf-8?B?Z2h1czk1ZlBKUHhTalp0Z1NtNmJ1WEdMbnFTRXNjU2FTVW8ySXBxOHNLdE1u?=
 =?utf-8?B?blNrTFlLb3YyS29TUVJSUGkwcXE5SEpTZDBLYVk2MWtONVFUQktnMHRPZHla?=
 =?utf-8?B?aEV1cVNPcUFLNytXMGlnWTBJc3ovU2dpSW1XQTBlb0RScG1neFBKVnRCejhD?=
 =?utf-8?B?U3psdFVGb3N0RGtLSGZlTGtscTNFT1NkdmM1SkplK0NlSjZXc3VRV2JXc25Y?=
 =?utf-8?B?S2lTY1dHWDV1dWVtY0wrMmZQaVR4Vjc4aHhGY21hcHQ3TlVRaXBKaWNoaFdz?=
 =?utf-8?B?V21LNy80ZS81QTJWZFZham9yNlpLc2hUN2hnS1JVZjA0YUdsYUQrell0UlhZ?=
 =?utf-8?B?VnZ3WnFCQlY5eEV6ZmN6MzhSNVBWVEx6L2xLc1cySDRlZ2hucGd6UlBNcWVO?=
 =?utf-8?B?bzJBNTNUVkp0TGRwTzRwcHZYR1FRWVJJeEhUV051NnhzK29EeWdrejRtUHRR?=
 =?utf-8?B?YWZ3SnY1TzdUUWRmMzFmdkFjMElWU042T2NZUnZCbDB3WnRJN0RQWFUzcFBL?=
 =?utf-8?B?eGJEdkk2d1pNekNVSGsvblRaTGhUZ21QWldpelBBQ3JOOU9lUmVpcitwc2Nj?=
 =?utf-8?B?TEJRSkJqTVJqY3VnQkh6SUVRZXBQSGl6NnJpdk1aMGNGdmhFUzlQU0xyTFdZ?=
 =?utf-8?B?Qm9HQnJ6bUZqN2pGQjJucXpTRUhVMGQ0aTF1ZnpuNE91dTRPN3VNTThab1VQ?=
 =?utf-8?B?TEhaVTBjU2R0c3JaSGdYeks1RHp6QldtQkY0YXBiUVQyckJYWUIwd1RpY0F4?=
 =?utf-8?B?VHZ1K242NHQrZy9wb1g2eDZSbWI2dnM4SVg4cmpTd21YTkdDZkgxNUQ5eWE5?=
 =?utf-8?B?QjYxbEtOMVF1WnI3SEk4RmpRaVdBWmIzTFViemdWTWpuTENTL1BQZ2xrZ1Iw?=
 =?utf-8?B?NUJleEhaRi9lcGhBU05UQytWMVBObzArYktHRTdocWJ4TmQzczI4ZDJaemZU?=
 =?utf-8?B?WjdtZ2dIb2tNTzlBUTc0UUVNNy9ESG44NDJ2N0NNRzJDMTdaL3kwQkd2U3Bk?=
 =?utf-8?B?T2RrczFLVTM2a2NpNTY1Rkk5cUtpWE1ETHhhMXM0Y2t4ZmxVeDhBN0syTlJB?=
 =?utf-8?B?MFFVZHJOdCttbzlSY2FWWi84ZDZhbUNwSWNWR0dsSVVVL0NxWXEzb015RUV1?=
 =?utf-8?B?Q0J6eXhYK21HSVNPYjYrall5RjU0b3pJZWRkdUpwQm5hNlpHSG9UNmY3OEhs?=
 =?utf-8?B?aFdHUEhiMExVRGI2TndNRzNoSXdZS29BUFJSaDNybUJLSDEzTE5hM0FoV2kr?=
 =?utf-8?B?R25VRnE0SDZuVkpZTExuVG5qZEhsQjFFQmtIVlV5WElHSE1CM01MTitEdERi?=
 =?utf-8?B?OGFsOEJYeUdBMXRNU2YrWVpJZHFQeW9EZjN6NXhYcHJtVkJ2V0UrMk9EaFZa?=
 =?utf-8?B?bGE0UmpUWEhwYURkYVZhTktiWlovaU12WkpDMS9zeHNlbzd4ZFhWcklRSXlM?=
 =?utf-8?Q?ZI/eRZBCrEgQb95Z7TcUupYNo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4997b8fd-0bba-442e-e184-08dc64f53ec0
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5966.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 06:59:26.5689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d/ficq8RLdY0p8I+mOe7c/3BgkMPavHwSdTtOgp+GhOgECAVo4tUT+JlylWHGjk+R+6vxEgS+5rRps9PUWUc9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5915

Hi Mario,

On 4/23/2024 10:47 PM, Mario Limonciello wrote:
> On 4/23/2024 04:14, Suma Hegde wrote:
>> Making HSMP as "default m" in Kconfig, enables customers
>> who rely on the standard distros to use the HSMP by dynamically
>> loading it.
>>
>> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
>> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
>> ---
>>   drivers/platform/x86/amd/hsmp/Kconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/platform/x86/amd/hsmp/Kconfig 
>> b/drivers/platform/x86/amd/hsmp/Kconfig
>> index 26096f901c22..9d3f422b3f81 100644
>> --- a/drivers/platform/x86/amd/hsmp/Kconfig
>> +++ b/drivers/platform/x86/amd/hsmp/Kconfig
>> @@ -6,6 +6,7 @@
>>   config AMD_HSMP
>>       tristate "AMD HSMP Driver"
>>       depends on AMD_NB && X86_64
>> +    default m
>
> I don't think Linus likes to see things default to 'm'.  I don't see 
> anything in the platform-x86 subsystem that is defaulted 'm'.
>
> IMO It's better to request the distros to enable it.
>
Ok, then we will request the distros to enable it.

Hans, request you to drop this patch.

>>       help
>>         The driver provides a way for user space tools to monitor and 
>> manage
>>         system management functionality on EPYC server CPUs from AMD.
>
Thanks and Regards,

Suma

