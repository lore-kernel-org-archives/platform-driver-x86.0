Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010009.outbound.protection.outlook.com [52.101.201.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6337D185B48;
	Thu, 11 Jun 2026 16:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781196348; cv=fail; b=VdefnclWrTbrXjEqng1bX4/eTRqVqACG7gxgfko8rTws0WRyUrfkTtx4K8iNBf94/BdJJXeXgXh2roaf3DOgQYMbSJOzL65fcsFIiClVre+Q+YfXRBnwTGQncoNls28ieT7AKWG7ZLckDtQ9j1tDoTAVPYBO/nhrRr4ofr/XC6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781196348; c=relaxed/simple;
	bh=j/UOp2WfQm8wSBODaahFgTZoeNHNcXP9+fk+TDXMlmw=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PKPyTTSC2mkK29w2zf1Aw35r3ltKOV7euLhT2cL5deRTYH1MvqwBBPwH5VlmH5nfCjBCgq/3LTUdq51/D4wULD3RG2dLQ3WrxxklHCVKEwHC4rHyK8QWeD8M1JjwXkJUuf/uQFJfHUUws7t7A8ee7enuWnkbGBhvZHUSYPhzqkw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=G+5xxnhI; arc=fail smtp.client-ip=52.101.201.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="G+5xxnhI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bYUok4FXfmgvbM07I06lgxj6sT1QeEpF51wcubUrC1MxdraZvY2fbAC4ksGxkRZ5VvE2VzUd+uS4Dv6nwe1cyNd5KdOj6XRjBUOOdIfcbbAsSIt00mDFxOi0FxXiHqtNOkf5aR7thpfeXQ1mNet46ZRBD5lVyILFYgH8KZ8tx7vVOIpol62v3IS5Zrtdhm+MmD6G47fTfWHLYMWrmnpyeVWE/9wgaO61C/U4tsCkLz5UwIPvkStdnpE7v8IDPq1QELLoeLJpNQl8gue9uECpqcOcLTuhdSvsc///UNGxfW5RmRfTQvnhS13Jg53izBwHvZanPMEqjjkJgsMJmBGFvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0wT7ZT3au3GE+qvG65dOX+DEq/sB9e/ko+PrXsZSF6g=;
 b=JSl4NGES4HSAUR55OUtHlZUTiEZu7pCQjvhemohdtwNwVZPuuDRr24ELM/KVBh5aBVhMz1zOTXR5//5WrReJuHk8dDoTmd4u0V6om+EYgFoUHbghti5/qwsCUNO6mF492T0WRx86ujbWHNNLMYmR1QApPi8Gjd5mvA+U5n84u6GyEP2UV5dvmM7XbhSm8BiOvy5S6sW4EwhxLJqVQ6vz5V1qNhe6+SW6wziFp4GQYUIGkqrshLadPq+H5jHcyMpFWb0d0/jGgG7sL0uMfhPHWSBqEKkR1rWjdR4bnMJTiPtQVJdS54XkUuw2RJercErgH6uQEdckQtF+mNi7Kr7Deg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0wT7ZT3au3GE+qvG65dOX+DEq/sB9e/ko+PrXsZSF6g=;
 b=G+5xxnhINoU6asB0mai+k/hD8AyGmIiVBc7AHvSODJFB7ppKvD1dqPvQn2CUvHWfgIlzcTeUwPyIzpUIub5UopLRlhIJa1i+UttskEMY5udclFdrYplF+kahckvYdM0S1Tyh1OvPxQym4WiBobzbmJc4XCkd+IhBjxQcwQdL5J8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7325.namprd12.prod.outlook.com (2603:10b6:510:217::19)
 by PH0PR12MB7080.namprd12.prod.outlook.com (2603:10b6:510:21d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Thu, 11 Jun
 2026 16:45:44 +0000
Received: from PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc]) by PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc%6]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 16:45:44 +0000
Message-ID: <c7662aed-0f42-48bb-92ba-a486a9aecdbe@amd.com>
Date: Thu, 11 Jun 2026 22:15:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] platform/x86/amd/hsmp: Source metric-table size
 from firmware
From: "M K, Muralidhara" <muralimk@amd.com>
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Muralidhara M K <muralidhara.mk@amd.com>,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
References: <20260528093954.2461272-1-muralidhara.mk@amd.com>
 <20260528093954.2461272-5-muralidhara.mk@amd.com>
 <3ccdf8eb-861a-970a-5c05-96c1ec54b473@linux.intel.com>
 <7d496898-ecc1-42d7-bbcd-1251038f332e@amd.com>
 <210d3a07-bf77-b525-b03f-02fea5e4e833@linux.intel.com>
 <6efb0313-99a1-4588-8130-bdbd5d288cfc@amd.com>
Content-Language: en-US
In-Reply-To: <6efb0313-99a1-4588-8130-bdbd5d288cfc@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::6) To PH8PR12MB7325.namprd12.prod.outlook.com
 (2603:10b6:510:217::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7325:EE_|PH0PR12MB7080:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d31f9b6-bfaf-41d5-d923-08dec7d8e140
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|6133799003|56012099006|4143699003|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
	zjcIhSOONC4/cOexaY9J7Ewij3j/OAPVt/j3CgmPRwrMjEh2YMRcGlsU1Wh4edK9O0aZt2mcta8xpGD/jkpjnOYI4xE72bxw7VJJzOwCQtHw0JVaYr6j26tJXVM5D46W4HxiLEsdB3B2vkwSnoMumUfQdb0YoV+k/dQhYNbrn9bVVjORVx+dsGNzFY1KpGSdejLrCPt048rqumgtH9+rSNyV8MYtP/MoYMqQfm9VxMJSRqB3m6B2jGxa/fYneS0DDr2SqB5HjR/hX/RW4ZsyNkCiTutwf6I5D5OsA8qOvwLC29Ecfdb6XtCBhfkGXVQWysLl8P8JWjQRkIyhpgLvDv57Qj/VKXysOeBBYqhZelAxFTh679Y6e1gZbvUFRYgJPWyeuAnKcHaUA9vwvVdcrYzmeTL3o8BB/jqjjLzM1g+lsVNe0Xb962/x4EZgI9f2rNCX3H5Dt36jqDvOor7P4fFFYzq8bF42yJoqi296QAQlc7dhiLobF2yZxWSTUd9WfVVbDjgrqBtM2AtNEpPpZXRWrLsdgBXULRAuUDiOGjxu/OdsZpAPtgdbX1+wbMt9e1I52QxbfOrT6wUzysnl8QHIaEjBlRVZa15K4As6Oa3KdFg7yBP8Uj/k5R7IFkhePBdPVMzbDkFRyv7Zj6oPTV0OAbDKhuqDUg7x537yW/i1mvBsfL10V+LYZ7ii+RVn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7325.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(6133799003)(56012099006)(4143699003)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjZnc1BrdS9GL1M1Y0dFenQrSGNuYmxNbzZ2VlhwdjllTG5EZTJJR0dmbzNX?=
 =?utf-8?B?aTkwQ1p3cnl2TTRPRk9ybHJlRVpUdUgreEhZNWJGRXdqeWhpUUYwRTNhZHVx?=
 =?utf-8?B?THlpcDZ3S2Z5bVp6MVpnREJueEdXTFVSREd3Si82MnNNa3crTkpKaytTZFl0?=
 =?utf-8?B?VHpXL1MyV2d1amRFd3lJVSttcVlkbVBBZGxWbzBOZU1FVlVjWXhjcmhjenpR?=
 =?utf-8?B?ODQxQlJBWjZaeWZESm5Cd28raEtjWUNMblVlbnJyUFcya29iczMyZWx1Q0pZ?=
 =?utf-8?B?Z2p6SWNPTVIyUFpQbUJsT1M4UGJqT0Zia0NxUnNLV1ZxZXVZS0ViVEZDeGp0?=
 =?utf-8?B?Q0lyMXJBdXFPNFh6ejZWSXd6UTUzcDZtZUJVcktaVjFwT3J0MlFBMkdaWnlK?=
 =?utf-8?B?RUc2cHpuTkYxak1PWlBWRXRUc1hFcXpUV0p6NUNvWUw5aGxTM20zVUdLWmxB?=
 =?utf-8?B?RDVKa2l6WWNaQ0N1cFlrN2FlbzFlVFY1TmI1WjRQcFlSQUNUZWw3MVFCd3Qy?=
 =?utf-8?B?M1FzampvYzlEQWswNlpWUURzVVNENmxJSHdWUkoxQ1o5Z0IyT1dRSTN1RDkw?=
 =?utf-8?B?aVFOZmZWVFA3NURPTEZOTGt5ZmVVR1VKTzhXTnpzRlROSHdmc1ExM2VZYVZz?=
 =?utf-8?B?c00zeDBtaHovZkFmZmphVEJ5bjZBOHp4NnZJZWJMSk1xUS90bldrejg0RE1Q?=
 =?utf-8?B?aFN3NXR2c0N5anVnRlNDaWRXT0NPN1B4amJaVVhGVnRzREg5YnpXd0ZJNFg4?=
 =?utf-8?B?WlU4bnBlaUNURmZ3YVppUFJVMGFGSHVEQ0FVTDRmeDl6cDk1YjNUS1h1aDlY?=
 =?utf-8?B?MHdYYjZjMFJUdHVoMkpUUXlNYWNPRVN6dUVoUE5FbDZmMmtLeHpobCt6SU51?=
 =?utf-8?B?TUhQTGtoMStJWmxZTzBRaU4vMDladFJrVWh5b2kwVENua0daKzVmdjM0cHda?=
 =?utf-8?B?U05ZejlnZGVWZ0RBakdIS29OVE5RdHR1c0QzRlJQWHZST1JDNlk3N09LejF0?=
 =?utf-8?B?dmFIc0xrMFZqV09GMklab3FQSVlZMG1nODdSTnVUZURyTzZHSFRSa0J5Q3Js?=
 =?utf-8?B?WFpTM1d2RUkvUklDeHQxQ0RPTEhaK0M2eVVwUmt6SVJOSE9EY0ttVXg3cmVl?=
 =?utf-8?B?SmUzOHpjUjNONldEN05sVGhsdzZJazRaYlFYVnIvTmNKdUdBVXg2Z3ZuZ2xp?=
 =?utf-8?B?aC81N3RmRWhxNjl0eGNBYjU2OXVHdjYyc1JGejRiR2Npakc1ZmhDbWhPaTE2?=
 =?utf-8?B?Vjd0ZkVPWmp4SGhUdlZWejFITElLYzJRV3djd3ZHenUvTzFkOWxCWHhWa0o3?=
 =?utf-8?B?dDE2RzRiRDQ0V042eTRva1AwT3lVaWZ3S2h3dXovck51azR5T1F4eTRodll6?=
 =?utf-8?B?UUJ4SDNhY0ZLVUtldG1DTmZCekpZV1JFL1dMWFN6a1JjUzBwbTRyRUE0MEhY?=
 =?utf-8?B?c05RTFpVZTI2SFNSb1FNUm1PVTJobzFjMkdPY0lSWWd5RlNySWRCck9XTW1k?=
 =?utf-8?B?cmlQQlBTRkkrNkJBZTBVVWpSaFlCR1UvVjVhMmJPT3ZPbVJBV2Jad2Y5b2dY?=
 =?utf-8?B?WEN6cmNVdmNEV0JFL2FMb2RmaFRKWmZJdGNKRkkydnVFc3U3ZktIVHMvVTl2?=
 =?utf-8?B?bXF4VkRobTVKREFtQWVXTjRzUGQ0eDQwNnV5RVBIUTZoMXpVNTRaYVVGRnow?=
 =?utf-8?B?L1FNbXRGVEVkSUhrUkRGNkVyQktZd2dhUEwzc0NkQTBuTm9LeWlWT0hQRVd3?=
 =?utf-8?B?aUdNZitoTktTbUdlSEF1Z1RiY1Y4MWs1SkhqRUFGTlJmQWRtNEhrMUZmM0hk?=
 =?utf-8?B?SDByVW1iUW5hVndsKzVsUmVsVHpFV1ZaSW8rdXpueVhVb29JOGxkTkhra1c3?=
 =?utf-8?B?Qk12QWRhNEtDWm44ZFZDVEl1WWJjUGRFV1oxSTZPRHNPbXBybkFCT1JpRWVw?=
 =?utf-8?B?WEVURTBtSUhIYmZQYWxkQ2hVeGEwaEFjMk8yQU5OK2xFOUJDengyVmdwVk9w?=
 =?utf-8?B?c2ViTDhDeVdDbTBHU0N3MVlNZnoyQzdOWFl0cnc1VUI2ZGZGZlk0S3Q5aVFJ?=
 =?utf-8?B?UzNCQ1RpM01jUmNIaVlLN21ZSTV1dFZUWFVoM3dHYWNWMk9wVjRRS0ZXYTRM?=
 =?utf-8?B?dlV6dDgxUUhzUWlkdHV0NG1rbm1sUE5ncjdHR0hLSE93aDN1RWZsMnN0WEc5?=
 =?utf-8?B?dlZmODZJU2ZvL3VwaktHditzK05MTktnakhpK084M1Jsa1FBWjJFbXVESjlD?=
 =?utf-8?B?Tk1CQ0hGeEdidkkxeEtqYW8zWWFoWkVFN0JhbUdTbjIvN2VUYzRwTTVDS0or?=
 =?utf-8?B?eFRJRXJObTFOSmZDV2pTVHgxaVozNzhDSGthTUp1aW1DOTZVbjhJUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d31f9b6-bfaf-41d5-d923-08dec7d8e140
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7325.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 16:45:44.1156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tGXztSibcAJrw9IvtZkOWG7WDRPBp+pzRLwKrJVDkA3nFUyuSBq5wFc++nd5tEBYJoQvxku813+oLUe0ytGWaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7080



On 6/11/2026 10:14 PM, M K, Muralidhara wrote:
> 
> 
> On 6/11/2026 1:50 PM, Ilpo Järvinen wrote:
>> Caution: This message originated from an External Source. Use proper 
>> caution when opening attachments, clicking links, or responding.
>>
>>
>> On Thu, 11 Jun 2026, M K, Muralidhara wrote:
>>> On 6/10/2026 4:35 PM, Ilpo Järvinen wrote:
>>>> Caution: This message originated from an External Source. Use proper 
>>>> caution
>>>> when opening attachments, clicking links, or responding.
>>>>
>>>>
>>>> On Thu, 28 May 2026, Muralidhara M K wrote:
>>>>
>>>>> The driver hard-codes the metric-table region size to
>>>>> sizeof(struct hsmp_metric_table). That is correct for HSMP protocol
>>>>> version 6 but mis-sizes the ioremap of the SMU DRAM region on newer
>>>>> platforms: Family 1Ah Model 50h-5Fh exposes a ~13 KB
>>>>> hsmp_metric_table_zen6, and the table is expected to keep growing
>>>>> on future firmware. The same hard-coded value also forces
>>>>> hsmp_metric_tbl_read() to reject any read that follows the actual
>>>>> firmware layout.
>>>>>
>>>>> Pick up the table size from firmware instead. SMU on Family 1Ah
>>>>> Model 50h and later populates HSMP_GET_METRIC_TABLE_DRAM_ADDR's
>>>>> args[2] with the DRAM region size in bytes; older firmware leaves
>>>>> it 0. Bump the descriptor's response_sz to 3 so the field is read,
>>>>> store the value in hsmp_pdev.hsmp_table_size at probe time, and
>>>>> fall back to sizeof(struct hsmp_metric_table) when firmware reports
>>>>> 0. Use hsmp_table_size both for the devm_ioremap() of the region
>>>>> and as the upper bound for hsmp_metric_tbl_read().
>>>>>
>>>>> Behaviour on existing protocol-version-6 hardware is unchanged:
>>>>> firmware returns 0, the fallback yields the same value as the
>>>>> previous hard-coded one, and both the ioremap and the size check
>>>>> produce the same result as before.
>>>>>
>>>>> The ioctl interface added later in this series uses the same
>>>>> hsmp_table_size to validate the userspace request and to copy out
>>>>> the full firmware-reported region.
>>>>>
>>>>> Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
>>>>> Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
>>>>> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
>>>>> ---
>>>>>    arch/x86/include/uapi/asm/amd_hsmp.h |  5 +++--
>>>>>    drivers/platform/x86/amd/hsmp/hsmp.c | 11 ++++++++---
>>>>>    drivers/platform/x86/amd/hsmp/hsmp.h |  1 +
>>>>>    3 files changed, 12 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h
>>>>> b/arch/x86/include/uapi/asm/amd_hsmp.h
>>>>> index fce271282348..438ac38d0dc8 100644
>>>>> --- a/arch/x86/include/uapi/asm/amd_hsmp.h
>>>>> +++ b/arch/x86/include/uapi/asm/amd_hsmp.h
>>>>> @@ -365,11 +365,12 @@ static const struct hsmp_msg_desc
>>>>> hsmp_msg_desc_table[]
>>>>>         {0, 0, HSMP_GET},
>>>>>
>>>>>         /*
>>>>> -      * HSMP_GET_METRIC_TABLE_DRAM_ADDR, num_args = 0, response_sz 
>>>>> = 2
>>>>> +      * HSMP_GET_METRIC_TABLE_DRAM_ADDR, num_args = 0, response_sz 
>>>>> = 3
>>>>>          * output: args[0] = lower 32 bits of the address
>>>>>          * output: args[1] = upper 32 bits of the address
>>>>> +      * output: args[2] = DRAM region size in bytes
>>>>>          */
>>>>> -     {0, 2, HSMP_GET},
>>>>> +     {0, 3, HSMP_GET},
>>>>>
>>>>>         /*
>>>>>          * HSMP_SET_XGMI_PSTATE_RANGE, num_args = 1, response_sz = 0
>>>>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c
>>>>> b/drivers/platform/x86/amd/hsmp/hsmp.c
>>>>> index 9bad58fef304..cf9392f99298 100644
>>>>> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
>>>>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
>>>>> @@ -356,8 +356,7 @@ ssize_t hsmp_metric_tbl_read(struct hsmp_socket 
>>>>> *sock,
>>>>> char *buf, size_t size)
>>>>>                 return -ENOMEM;
>>>>>         }
>>>>>
>>>>> -     /* Do not support lseek(), also don't allow more than the 
>>>>> size of
>>>>> metric table */
>>>>> -     if (size != sizeof(struct hsmp_metric_table)) {
>>>>> +     if (size != hsmp_pdev.hsmp_table_size) {
>>>>>                 dev_err(sock->dev, "Wrong buffer size\n");
>>>>>                 return -EINVAL;
>>>>>         }
>>>>> @@ -398,8 +397,14 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
>>>>>                 dev_err(sock->dev, "Invalid DRAM address for metric
>>>>> table\n");
>>>>>                 return -ENOMEM;
>>>>>         }
>>>>> +     /* SMU returns table size from Family 1Ah Model 50h and 
>>>>> forward */
>>>>> +     if (msg.args[2])
>>>>> +             hsmp_pdev.hsmp_table_size = msg.args[2];
>>>>> +     else
>>>>> +             hsmp_pdev.hsmp_table_size = sizeof(struct
>>>>> hsmp_metric_table);
>>>>> +
>>>>>         sock->metric_tbl_addr = devm_ioremap(sock->dev, dram_addr,
>>>>> -                                          sizeof(struct
>>>>> hsmp_metric_table));
>>>>> +                                          hsmp_pdev.hsmp_table_size);
>>>>>         if (!sock->metric_tbl_addr) {
>>>>>                 dev_err(sock->dev, "Failed to ioremap metric table
>>>>> addr\n");
>>>>>                 return -ENOMEM;
>>>>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h
>>>>> b/drivers/platform/x86/amd/hsmp/hsmp.h
>>>>> index b153527e0a0d..e7f051475728 100644
>>>>> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
>>>>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
>>>>> @@ -55,6 +55,7 @@ struct hsmp_plat_device {
>>>>>         u32 proto_ver;
>>>>>         u16 num_sockets;
>>>>>         bool is_probed;
>>>>> +     size_t hsmp_table_size;
>>>>
>>>> Please add types.h include.
>>>>
>>> In hsmp.h, size_t becomes visible without adding anything new, 
>>> because the
>>> file already includes linux/device.h, and that pulls in linux/types.h
>>
>> Please don't rely on indirect include paths. The rule for includes is
>> Include What You Use.
>>
>> There are some exceptions to the general rule such as linux/xx.h
>> including asm/xx.h, in such case you only need to add linux/xx.h.
>>
> Understood. I will add <include/types.h>

typo mistake. I will add #include <linux/types.h>
>> -- 
>>   i.
> 

