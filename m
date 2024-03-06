Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2070.outbound.protection.outlook.com [40.107.96.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E561B26E
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Mar 2024 10:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709721930; cv=fail; b=e/wLilyExB9RtTbH/4dmz6ci/d9W23M34AA+2ijn0D3U1Z3d2clvzuPCN4Z4hY1MGQRPfI2yno6nolU8FEgzW2k7/gGNUfPjk/MJgQaIVMIVruJuMdf+Ofg/mIXdA+yqfamW76OLcLUx88AqE1rT/QWMSZWeuhByJ6cFxWahUdo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709721930; c=relaxed/simple;
	bh=QIK0zHegCOo40e/CRLig+dApVCvFj7WPnw35/zhkbqM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GUjc0Kbc6pXGv6jLq1DlbXEU+w9kfRXfQFNLbZ3A/JOloi/NTD7UHKa3mNd6jLpATzB4YtRFHtB/2ZSSVqZGak/cChrMEp8N2o/OCVV0iQzMQaeRauNPDgSSjSfoSMsRSVlJ6meBB1KOpBL7UgO1+kKp3JskaLrvrG8gZXVIIso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=MUD+lxI+; arc=fail smtp.client-ip=40.107.96.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="MUD+lxI+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J/Ez98Mf50Pzn1/vGUGI+5b3Aueu2dSZZ7kpch5yrpnbUl7ekIWyPl2oFK6R9U1/1TZFFMERk2J4POugTiCE+LNARebK+SQJfHR3VbgDrMBEQ3FzZrncvpCj8Xh3CENBd0HrbcBj9m+iDfFoYNsUZU0uUcfMCxZhM7S/p7w39tjMDfSKsS5BWF6UowUwbpWlVDIJDCcg1+gjQly70j9smav3IJhdP7pOL2my+3wXI5TkkkjucTeXQ+d3tMqaiuZYhOkhXM5XTqvhypMroven5wOElmuYjdZIUC5M/DrBYZjvp7ypuNABx/99XyKmzNiog1OfgsaKOfHtqJgQ4d7Z9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I1qDKdepRzMgGeJE1IytYeSIcH8B/pzNkZxoiPCPWok=;
 b=QIXhuowgP7lHKU4iIZ1iCajFYs+N8lVLbTlsQiKlpQtgmd8O3M0uKfEFcNqM2VY7GUTefuugHrEdgS9IJnXLvx5IGPeHdXhV8C27NowZ6hag3niO82SNqp7614ww8FY0Fq+B4ggqdh294e93jzwoxrnlQEFsf2lalWkyvHv3esQlu3fFpgTck3XU0Ns9iDIT/OfNQlNLLBldPgQ9GUeZ6D0nHOnGCFrR0+tXYiCqCDqM2wGR/oOuFdCPG/6EDL1iVXdE5jupB5lv0RnDLTUFvlVG/Y/++Q8gn9uRKNMjESpQpRN78y99bwmZ9tiIlmR4rbCxI65op7Qoccg/o7axww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I1qDKdepRzMgGeJE1IytYeSIcH8B/pzNkZxoiPCPWok=;
 b=MUD+lxI+alptYmJrILRFsIULM9+cy6B+gaiRllg8pcLR3DwIRazD0RgyL8LTJMyeJoE6pTA07G7DHuP4IN4w8t6Jsxhht0CsP0jquUYJ3g6WrY+ysVH7qzngWwdt3amWZtTcQdqQ1sq7M6yzZYpWJoUj2VX/S7Xp3C1Kv/3IxPg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by PH0PR12MB7814.namprd12.prod.outlook.com (2603:10b6:510:288::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Wed, 6 Mar
 2024 10:45:23 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::3476:df27:437c:12b8]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::3476:df27:437c:12b8%5]) with mapi id 15.20.7362.019; Wed, 6 Mar 2024
 10:45:23 +0000
Message-ID: <11321de3-204f-40af-8cc5-f8c2f6dceddf@amd.com>
Date: Wed, 6 Mar 2024 16:15:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] platform/x86/amd/pmf: Add support to get sbios
 requests in PMF driver
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org,
 Patil.Reddy@amd.com
References: <20240227125520.3153140-1-Shyam-sundar.S-k@amd.com>
 <20240227125520.3153140-4-Shyam-sundar.S-k@amd.com>
 <1358d40e-5114-2d1d-c679-342cf3ca0989@linux.intel.com>
 <74f0d344-8d4f-4a33-8862-ade4ace571d1@amd.com>
 <47eadab7-0273-e037-dad9-5e23cfc6e1f2@linux.intel.com>
 <b8f846b8-c3b4-4d7f-b75b-a4444009a877@amd.com>
 <6f246c52-3873-e1d2-900b-75343ae21e2b@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <6f246c52-3873-e1d2-900b-75343ae21e2b@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0203.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::15) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|PH0PR12MB7814:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fc0d749-5095-4414-bb40-08dc3dca8692
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c/DOngMEDj4O+dgiU6TiCOIKDSQXaNd1p1kHo1dDSI81SZ7uaHS7uXCnzysWACJ3t4b+fsEiJhdQgN3JM13lsHkH+yIV9wkU3r2fkvdTyVU7FrjFchnTZCHLmktJTwIj9rKl0Czf4naz/TV6LdTCFDUoY5EMi9iwvH6y7UcqCFA/uYaP1wnkSRDQ1u4PkTkuKsUm+3kXhAyCNYaLMQnPigogKpJ2FH5ccUFUj9N6T0Fm0ggUINjySoQIrGkLlnFHswZIhUA/cMpbTP1OPB5chOslRK4A0HBKImjK4TvnCCqcf64QjJI2Jic5nLsWXW+IKvZxoFLRiE6y+nEW0fHUcpSaNXKS2VnGu9yViRzMtnt3MqZiull04weU9zkwpCHx/IjauDxEqzOYwuIw78Deo2ODZ8rOsWtWUMORzCQZGbd2v6e/2MeWE9tEqbRgtUyj4DyJzYm7eFKuCBYyWkzhoE6fdXSFrO8BpluP3TG00Fj9lrpZ6gDwkYF/gR6cRYxQfnW/unD9iKGeYgUTj+8eEfhfazDEtQDwU/ZZc/8RGGlPX9oqzPSdD8iA/4e/dE8VAehB9Llsc1ochC0a4N1E5Ptxkar/vCAmdWMEUmMDLFkXAvILuairIN9nCeQ8d3vp4IvfueXgPjNO8pjv4CYgQ8gCpMtPtuZ6hhV0SNB8xxY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHpCVlpSSHJhQ1U0SjJkUTlXeHdFNFBLZ085bGM3ZlFzcDl2Ymw3SjBrV2Mw?=
 =?utf-8?B?NUlrODlrY2tWZ2g2MFcvN3BYaDhoUU9mRCt2RHY4bGQvdEhIM24yYVRFWVlE?=
 =?utf-8?B?TlBKRDNlelUyTStNbm9TWHc2QlVMNUxQZG45UlIyQzcxRHZNU3plSHFSbVhH?=
 =?utf-8?B?ZzdTeVMrTVNWWDJqUkk5Ti9yck5aVk0zelVHckdOZDhvWENwVVg2R2JVN2E4?=
 =?utf-8?B?dkZud3A1emRKRDF6Z2xISFJBY3krQXRMNWdIbW1PalBneWQ2SHpaOFRJT2ZV?=
 =?utf-8?B?b0VPQkN2VWZiaHloQ2pFT2pRNEdEQ1NOZzhFUG9LYU9TL0xjTHYzK1NybE1R?=
 =?utf-8?B?Wko1T1JwVVFuTE05V2FGbkc0bFJEQk9lWXcvOUVYQTFmWHYycTlNSEJmQU9I?=
 =?utf-8?B?Ulc4VjVMbVhxeDl0Nnk5enhKTmVSYkpkTTJnWUs5QkgvUWRxc21KQ1pyUWxr?=
 =?utf-8?B?RVl0Wk5hblZyQVRFMTQzeldOUGlPbE1WalJzRmw3T2xIM3QyV0VWVkZnSUdQ?=
 =?utf-8?B?b05KZEhPZHM0cjE2QWJ2RHp5UWpmKzN2VWI2NnAwKythSXZZbTVZZHFIZ0RF?=
 =?utf-8?B?UHhpZng1MVgyUWVnczFRWTA5L2RsOFMyUHFld3FJZjZrdEMvNit5Rzl6YzZw?=
 =?utf-8?B?OUl1Y2ltMkhEUVVaNE5sMGRGYTl1YWpRdkVZWWtvdFJVTFg1ZUsyRE5OSjU2?=
 =?utf-8?B?UjNXRWRLN01mVDNaNzB1YTkyOEgzMkM4T2xZVzduVkRJL2kzOHFUZS9wVURS?=
 =?utf-8?B?K2p0RUlpbTl2V3U1d2JJbHdBcVdrYmZLSElBa09iNWFUWTFyalZiYWtuMmFP?=
 =?utf-8?B?QjBMYTcrbEtqcmQwSHQ3WDNnNytLdE5LVG4zM3UyZy9zRVpjVUE5aEtmV3Fw?=
 =?utf-8?B?eFd4WjlmcHhFdnVNSzRyZ1RsS2oranUvbjE1Uk5zN05kdnc0ckEwVTFFSEIw?=
 =?utf-8?B?YUkvNDdHR2tpNVR2Umprd0IwTVFwblJxVGRhSzhrMXBkTUt3Y2pKRUNnZzlv?=
 =?utf-8?B?YTF2YVFYbTg2UWJOMGVtSHpWc3E5UHhLMWJFNGRjR2R6d2VtZVNUaHB4U1Q2?=
 =?utf-8?B?K3Urb0MrdDdWekhEMXowV1NvN3R3YitMd29ZSmJFNzZGeGVSYjd2bHFrdHFI?=
 =?utf-8?B?UWxaY0pwWTdVdTdrZ2ZOZkJKTVovMW91aG1oWW53N3dEL3NhdlJUNkZPSklo?=
 =?utf-8?B?bERJa1BTWW1vbFZVNTFicFVVWlVqbnkydlZ5THAvTHN3RGJITDRqTStqMGdD?=
 =?utf-8?B?M0x2azcrbHJYbHhrRG1BbHVodWkxRyswOEpJTFlxaCtXaG5xZjBXY1A5aVRT?=
 =?utf-8?B?cHl2YVBPWmVvQi9XQUt6bnF1U2tQK0xKeWZXT2RWa21ZTUFDcGNuZWJ5UzM1?=
 =?utf-8?B?bmNNa21kelpXL2d3Vnh5NjZGZVlUbXg3Y3J2dFFobGZLV2ZEa2tTNnZlZjRo?=
 =?utf-8?B?bUpUNUNEUHV1RVFraGgwOHppNFI3RWFMbjQ2NVlJcDR6OE8vRnNUbGV6dU1y?=
 =?utf-8?B?ZXlpcTU4ekxGYzNpeDhiL0JaYW9JWXhWbnVVL1o1U1F4Q21xQkJxUWdaK0tq?=
 =?utf-8?B?b1V3UFBMQmdmRFAxcHMwYTMxN1U1T0JNdzlRblBVdDlzdkJBOGNGMkt0c1Q5?=
 =?utf-8?B?SjBpalRtL0N0cjdJeTFYaUhaSEpyWEcxSlVqa1c2bTBzOUhhTmVQdWc3YjZi?=
 =?utf-8?B?UEgwVWZwbkVXTTF1Y09ySHZzdlg4a0J4RE1ONmZ3NGJ1bnBxdFVIZTBaVTFB?=
 =?utf-8?B?OHRCY3B5U0NoeVphelMzb3N6VjFWYnRuZHlROXl3bFlMT043RkJ0d3RKcklv?=
 =?utf-8?B?Y2NTWlhMMmg3dHpCeEZCRlFQdzVSVHFXQmZSdER3SVpYeGREWnZXNnhWYlhp?=
 =?utf-8?B?YWRjZVVNNE5MdVBIeEIrTDdaUHpNNW9CRTNMY005K3lHMTVNZFJ4M29GbDZ5?=
 =?utf-8?B?T0VyMmtxT1RqdkFzY3Fja1QyUjlrU0k5Y2hsNU9GaDVUdmU5TitRdU1KZ2FO?=
 =?utf-8?B?ck55b3FlcVpPRk1WQXlYcXRyTHdDRmMzbW5HMER3aTdwMGtTMzNSUDVZNlNt?=
 =?utf-8?B?U2JMQmt1WUhzSHMraXZRdEt5d3F1djRiajNBajg5eFpsWk9pUFlpZjBlLzRK?=
 =?utf-8?Q?wqM4NpzBzb7LNJRQQ0JuDZe+t?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fc0d749-5095-4414-bb40-08dc3dca8692
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 10:45:23.5085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xhUl2Z7+IdnLNCLQ20vzmITZTFIUyUKsuDGi5s4x5YexXD2GMOaApw2PR1WTvotmLy4QjwJFMXIcidp36B3AaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7814



On 3/6/2024 16:04, Ilpo Järvinen wrote:
> On Wed, 6 Mar 2024, Shyam Sundar S K wrote:
>> On 2/29/2024 18:49, Ilpo Järvinen wrote:
>>> On Wed, 28 Feb 2024, Shyam Sundar S K wrote:
>>>> On 2/27/2024 18:58, Ilpo Järvinen wrote:
>>>>> On Tue, 27 Feb 2024, Shyam Sundar S K wrote:
>>>>>
>>>>>> Update the APMF function index 2 for family 1Ah, that gets the
>>>>>> information of  SBIOS requests (like the pending requests from BIOS,
>>>>>
>>>>> extra space.
>>>>>
>>>>>> custom notifications, updation of power limits etc).
>>>>>>
>>>>>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>>>>>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>>>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>>>> ---
>>>>>>  drivers/platform/x86/amd/pmf/acpi.c |  6 ++++++
>>>>>>  drivers/platform/x86/amd/pmf/pmf.h  | 13 +++++++++++++
>>>>>>  2 files changed, 19 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
>>>>>> index 1f287a147c57..1b2a099c0cef 100644
>>>>>> --- a/drivers/platform/x86/amd/pmf/acpi.c
>>>>>> +++ b/drivers/platform/x86/amd/pmf/acpi.c
>>>>>> @@ -166,6 +166,12 @@ int apmf_get_auto_mode_def(struct amd_pmf_dev *pdev, struct apmf_auto_mode *data
>>>>>>  	return apmf_if_call_store_buffer(pdev, APMF_FUNC_AUTO_MODE, data, sizeof(*data));
>>>>>>  }
>>>>>>  
>>>>>> +int apmf_get_sbios_requests_v2(struct amd_pmf_dev *pdev, struct apmf_sbios_req_v2 *req)
>>>>>> +{
>>>>>> +	return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS,
>>>>>> +									req, sizeof(*req));
>>>>>
>>>>> Fix the alignment please.
>>>>>
>>>>>> +}
>>>>>> +
>>>>>>  int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req)
>>>>>>  {
>>>>>>  	return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS,
>>>>>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>>>>>> index 4364af72a7a3..f11d2a348696 100644
>>>>>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>>>>>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>>>>>> @@ -116,6 +116,18 @@ struct apmf_sbios_req {
>>>>>>  	u8 skin_temp_hs2;
>>>>>>  } __packed;
>>>>>>  
>>>>>> +struct apmf_sbios_req_v2 {
>>>>>> +	u16 size;
>>>>>> +	u32 pending_req;
>>>>>> +	u8 rsvd;
>>>>>> +	u32 update_ppt_pmf;
>>>>>> +	u32 update_ppt_pmf_apu_only;
>>>>>> +	u32 update_stt_min;
>>>>>> +	u8 update_stt_apu;
>>>>>> +	u8 update_stt_hs2;
>>>>>
>>>>> Is it intentional that these do not match with the names in struct 
>>>>> apmf_sbios_req? I mean some of the fields look suspiciously close in name 
>>>>> so is the purpose still the same and somebody just invented new names for the 
>>>>> same field?
>>>>
>>>> The idea is to optimize certain fields in the BIOS menu that OEMs have
>>>> to feed in while making the right choices for the power settings for
>>>> different features.
>>>>
>>>> The entire series is targeted towards that where the interface between
>>>> the driver and the BIOS is improvised so that:
>>>>
>>>> - Multiple features can link to one state, so OEMs doesn’t need to
>>>> program same parameters in multiple locations.
>>>> - If we need to add new power controller limits , we don’t have to
>>>> touch APMF functions, its more expandable adding new fields in APS
>>>> methods.
>>>>
>>>> To answers to your question of apmf_sbios_req vs apmf_sbios_req_v2:
>>>>
>>>> It calls for a new struct _v2, because:
>>>> - AMT support has been dropped so there shall be no pending events
>>>> from DYTC (like the CQL and AMT)
>>>> - As per the new design, the PMFW has given control to set PPT and STT
>>>> limits and no pending requests on updating SPL limits.
>>>>
>>>> But as per names, I don't think there is no new invention :-)
>>>
>>> Hi again,
>>>
>>> I'm fine with adding _v2 struct (I could see they're not identical).
>>>
>>> What I'm still left unsure if we spoke past each other so let me state 
>>> the question in more concrete terms:
>>>
>>> - apmf_sbios_req has a field called stt_min_limit
>>> - apmf_sbios_req_v2 has a field called update_stt_min
>>>
>>> My question is, are those just the same but only named differently for 
>>> some reason, or does the "limit" and/or "update" difference actually imply 
>>> there's change in how that field is used?
>>
>> Hi Ilpo,
>>
>> Apologies for the long delay.
>>
>> Your question is valid and hence I had to go back to my FW
>> counterparts to get my basics right before responding back.
>>
>> So the crux is, for each of the power controller within the CPU
>> infrastructure, like the Slow PPT, Fast PPT, STAPM, TDC SOC, EDC VDD
>> etc., all of them are guarded by two parameters:
>>
>> - one, "limit", a max threshold a software can set
>> - two, "value", that can be updated to based on the changing system
>> dynamics.
>>
>> So, atleast in the PMF driver context the field names can remain
>> constant. The field names in apmf_sbios_req looks apt here, so in the
>> next revision I will make fields in apmf_sbios_req and
>> apmf_sbios_req_v2 look the same (w.r.t the naming).
>>
>> Before respin, can you have a look at the other patches and see if you
>> have remarks?
> 
> Hi,
> 
> I already looked at them briefly and didn't come across other things to 
> say except that the use arrays made things cleaner. :-) So please just 
> respin.
> 

Sure. You want this to be rebased to review-hans or review-ilpo tree?

Thanks,
Shyam
