Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8908C1759F
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Mar 2024 05:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709701671; cv=fail; b=bh3kOOalHZLM2/E0uRDEB9YzZDt0iN8JAmzimspVeM29l+VPCFMHzZa4P4oA1Pp0hSQUFN95RYLiAf6wiToW7f30eUnbRxiHPJXWQaWWaWowBbIQ+NexhPNKpB8TE+rkVLAE+JnpQt7WBEYWFAjbF0nHc8yx7+XALBnENppsLEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709701671; c=relaxed/simple;
	bh=WMv/gJs+LSQcmN9nm6i+XtngBnNTZG9iLWkbjsDduDM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZDJvDegx72KukPEH/uEhV8uAtEuUvdTzMvRXo4LxPwY4XDhoLEN9NA4IeMtTfGmijd3k1bBekcuGHHsS9lEOQfnhag2QvPGwaHobIOx/4mxcwGniHSU1Cguh+6Au5s07ABh4k7ucWpKQsZZCXVZD2PKxMYyqKGPkeB3o1afoEAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rYZQXMFW; arc=fail smtp.client-ip=40.107.236.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rYZQXMFW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PYC+mv6aVTUTKiMO3HUvuf6smgo0jbRcnNoA+jR3Wh/EhbzRRkeRo1kvkVg+2Wg0rrTuJI5ZUtDQcLzDMZ7Z3ahbhXUo6OVFrP2QQdQsgCy+4UzMsj80KDsIJupjw1a6RJkKMJP1bcZ6lcxOdtfeQx74h6U0I9BlKdqUwm8LFj9/5NoXytFTcfz22+8k1X//qrpabosVbaOrhoOiGE+bDQ9HZespk9n8UZyl+7sLQUViPFJhdS12m83kqDU/liyc7aCP+xaK1/qi/i+I5yC3VMjsSGNA6MLd3ylWXSfLvekhlEgesadx87sWRMYEoeJtqjo71/b39sSwvTB4L8UXAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vs1PW8GyQMfGWMekZtj9cV3Ut6ajuEB4GEri1jnLK1A=;
 b=FuQwCabbhF/CNr8be4boXW5FFdPj40Gig+kEv4TdaBiGoChqKaP51GkpGtUI2M4LI2xFDPXCAuvu1QldeW11QopOpqGjYd2iTLRkAfv2SAIj0P4y6Iox7lVd/qDjER8ArO9O96urhWGzjLn0njFUPS7zoAavl7wPHCyRwxb5Vi7FT30Vg6G56vFSmDl3FJECAnwx3wu5uKbPjT6Btuq6D5I8AlXYCwKySpZuo2Hmve1BjR6umgxnyMrbmnjCd1iKYR+ILQBVhgLdeL/QRvExPXC/36uxJ07U1nJ+Nlny+VPyqPrLzPhg7mmFnM+fsCIef75RxyJZyzKeEHbNT7vVbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vs1PW8GyQMfGWMekZtj9cV3Ut6ajuEB4GEri1jnLK1A=;
 b=rYZQXMFWKhj25JB1sQX5LopY/jT1DmM67OTmO7p+EhO93hyVIkxNaeUniz7U9ubASfZWxENxalpaYyMxI6CCGMhBYwMRDQYk4VKHmqFTr3cBQfFaOrM0LYtQMbE4gcejILo+cpuApUnDtyCzzVRteYhVVdHxRxxJAtvwqs+kHAs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CYYPR12MB8731.namprd12.prod.outlook.com (2603:10b6:930:ba::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Wed, 6 Mar
 2024 05:07:46 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::3476:df27:437c:12b8]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::3476:df27:437c:12b8%5]) with mapi id 15.20.7362.019; Wed, 6 Mar 2024
 05:07:46 +0000
Message-ID: <b8f846b8-c3b4-4d7f-b75b-a4444009a877@amd.com>
Date: Wed, 6 Mar 2024 10:37:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] platform/x86/amd/pmf: Add support to get sbios
 requests in PMF driver
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org,
 Patil.Reddy@amd.com
References: <20240227125520.3153140-1-Shyam-sundar.S-k@amd.com>
 <20240227125520.3153140-4-Shyam-sundar.S-k@amd.com>
 <1358d40e-5114-2d1d-c679-342cf3ca0989@linux.intel.com>
 <74f0d344-8d4f-4a33-8862-ade4ace571d1@amd.com>
 <47eadab7-0273-e037-dad9-5e23cfc6e1f2@linux.intel.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <47eadab7-0273-e037-dad9-5e23cfc6e1f2@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0105.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::9) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CYYPR12MB8731:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e874291-3ff6-41bc-83d0-08dc3d9b5c6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/7Tku/M16oClYtB2cN+K3O2JwYxCQ+U9QbQGhoUYKEtFvTl+Za3rNpz41zKCbVpvHQqKJwA9iC7cr06zhJc8MqI7YeeC33soy7FZDA4AfOhMArf4MQKq3h9H5J5kot8+Ta9y5wQaGdweU9iE1Bj3M+zZZsdycUGdX3wN10byckaTkVh6xpap2uJOzx7bW2kwlbNQgY1qp+27up9BTZVd3wtZf0xLqCxZClrReSpqHwGrLhGuybXwAwY7QUm5ky+qYxT7F01wnZ4GSZfmz9SvIUC0DDVs63f9XblmzdN4J8JMB8G9nnvMyvn4zlWprARjgDqV3aMiv7V8+u+d9+8ZR/lzCIhl618ZHU+0IXKLpk6Rj6OP2JuFp+dChe/yWydEaJjur/+gUNz8nIDsUnJ6snIAM8IPMUyulPIF4EHG9lDtN8OXIuD62jobBYFhkq14ldtTj8LrdYliZmZN16eghDuen9FRVvxu7CFmy7EaDpHhyD2QDBf6Bwd3duDcfOX/KQ3iVmXXxF31tl7RY4pl8ZyjplUi9yBh10q6p87/5NVunqCAy2nAoSSJT0n7Mb2kcFPAXYeLddg3RGkRDTMKI+RSmmizHFJpDoPANR3uG2hpcMhVjmxPWm2xdSaUHcn1d7O3gvcjPAQbBhLQ1cA4PK2Dyi5NIIkPCwOAM1KVK9A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWs4SloyUGhoR3ZXNDN6WmZSZWpBKzJ6MExKZlFjTHpIYnFCRG1MY0xPYlR4?=
 =?utf-8?B?SWdTdWVxUlRMTjNTUVRCbVp1N1NqQ3ZleHJOZVdQaGduYTZubXN3T0k4U21u?=
 =?utf-8?B?Q2pKZEJBVG5ZNWpUWTRVekNiRmVIU2kvcVZBb1pyVEl0b0VCQkhFYmFUcUhW?=
 =?utf-8?B?Z1A0WlNYb01IdVo4Wm9tNkFlSmViNFhNMFM1ZWR4U3hYUzdNaUMvTE1jU1Zv?=
 =?utf-8?B?L1dad2ZPdTZoWjN3Wmw1Z1BISDFaeUtDSXpzcjRtVUhNc0RnVTdJak5yTVlS?=
 =?utf-8?B?UGFSM3poNmRRd3hNWWdMeVlaRkpRMmlzclR6bnA5bWtZT0xSUWpEMkNTU2Ni?=
 =?utf-8?B?ZG1DZGs2cjZ6MkJ0ME5KdDNiUVlsS1QwT2dMV2tmUFJkRVI4MkxSdmY2WnFV?=
 =?utf-8?B?VEROSk1TSno4VFY3Wjkvek0xWFoyVkx2dGtaYktiY2VOajVGa3ZtS2VFVW4y?=
 =?utf-8?B?SFZJcG1FVjV1bTlCWW9Pa2FRWkVQalNJUHFmeExmVXVTSFZyV0VtQlQ1ajNm?=
 =?utf-8?B?TldnTngwWStRTElsZ2JGRVBod2cwaG9ZNElFY1FBeENkR1YrRVJUNmpjYkZK?=
 =?utf-8?B?ejZBYmY0YTVFTVNvMUI1cFcwWFhrcGtDU1RidlVqMkliRUJFeTh1dCtyQWV3?=
 =?utf-8?B?a2czTFFKZWdsRDh1d0lmb1k2dHpsNWc1d2lGdVgxQ2QwSm5wazVWVFdjTUdV?=
 =?utf-8?B?aEtiYnA3NUd1dUtEVEFENkhiTmRST3d4S0hOdEpUd2IvRUk5V2Z0ZERFMTdZ?=
 =?utf-8?B?eXdQOUVvY1VWOHEzZG5land2TVdUUmRpM2RuSlI4eFp0c2tKSU9xaW5MZGwx?=
 =?utf-8?B?R0daL1c3Z1JYSm56OGFRdjhSN3RLcWljM2s0QVFZWE16SlZ2cGI1a1pKSEV6?=
 =?utf-8?B?TzRkMVdubEluMThyczhaTlA3cDdvdHJuL0YreXBUWXh1L1RFcjRLWkk0ODM2?=
 =?utf-8?B?c0NuV01oKzJNaDhiQWZCZVRXZURhMW54UUkzTHl0WkFVazdiRVY5QVJVbUJj?=
 =?utf-8?B?TG5TTnVhYktxaVBsT3ZSckRjdE5NTWM4TXFkdlhpWjN4dkk4MVEwd1pFOWE5?=
 =?utf-8?B?SUhLWWMreStPRmxBV3FUNWYzczVyNDhQUjRGdHE3NU9BYk1zZ2w0ai95Z0FZ?=
 =?utf-8?B?WWlRNzNxNW1Ma3hmWEFiczVpanROQjNTTGJGOTNhQm1CQ2xIbU5hRXczb3d6?=
 =?utf-8?B?Y1FxamJJdlFNalVpSDNvWnEydnpFSi9tL1ZLWUNSWW1YZjcwRDJxcS9hUENw?=
 =?utf-8?B?bFdJdXg0amtwbENocjczK3RyTEgrZUV6Y0g4ZEphOUZ4RWZITjZ4MlJvSm5w?=
 =?utf-8?B?NDgvcXBGdThmRlF2MEI4andCcmVzeEVqdTZ5QkZINHVYQTNLdWdBYkwxTUNB?=
 =?utf-8?B?M0Q5dWNuVTg5QklJRUE1RUFvTXZ5amtJTWdmSjBNNkFmUWQxK1YxTDMwWDR0?=
 =?utf-8?B?TVB3TWNYcTQrbGt6MVpBS0JVQmVQUXB3WTR6SUF5QzRMNzZwd25tWkh3eE5z?=
 =?utf-8?B?S2pwODNmZ1V5NVYzN0QrbWhDRmFKbndkdjNwSUJSbEtoOENsZ0xaVTBSNCtC?=
 =?utf-8?B?WXJvYVNkTUhDeDVtQ29XU1hjeVFacjNvMExUMnZSU0hVZXh5bVdsRUVHUEFw?=
 =?utf-8?B?YS95NHdSWmh2ck9WV1g5cHh0ak51T1lCNFVaQWt0MG02VkIrWkFrZE1IY2ZM?=
 =?utf-8?B?aUxtRXdrVmpJOERRTlYzWmprNTZmMEYxZjRtRXVPUGdHakg4MzNoVTQrT0tP?=
 =?utf-8?B?d2NJZHUvWDVHUkk4WjIrVERYT2w2dHROTkNlUVZqTk5CNmJHNm1DSnNiY1lX?=
 =?utf-8?B?VXRTQlFCTTE3M2ZheHZUNFpXY2xKL3lKWnFOVnpGQys1NFZsVlhRWCtjZDVq?=
 =?utf-8?B?eGlCSk1xWHVkK2RMWEpDa0p4SmJuaVljU2JyRFFrYUhFbFhYc2QwbHFsNmxw?=
 =?utf-8?B?cUh4M0hlMHFpd2FEQ1ZSQThKTE5jS01mYzFjcGNqQ2tPOVA3SHg2NGdoSjFL?=
 =?utf-8?B?VFZiRHVxaUlUQkhMYmovdFpLRE1RQ0hodXZGc1Y2NHlNWHpCdmlycXZvbm5J?=
 =?utf-8?B?d0laczdqYUNwSHJTdWY5cXZTUHJJdU1LWEZRaGl6TlJhTEdKZWtQdWJFK2FS?=
 =?utf-8?Q?mjE0gujyxu8Lcb2LLy/P+qV1d?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e874291-3ff6-41bc-83d0-08dc3d9b5c6e
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 05:07:46.3780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H91gy52q1LX+hZrBjO6sBABkTJHO3g4Mh5wK/QujjxTPf30CRrGCLVe+73+/CVqhQ5XYSLKnSMpbVigfUpreew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8731



On 2/29/2024 18:49, Ilpo Järvinen wrote:
> On Wed, 28 Feb 2024, Shyam Sundar S K wrote:
> 
>>
>>
>> On 2/27/2024 18:58, Ilpo Järvinen wrote:
>>> On Tue, 27 Feb 2024, Shyam Sundar S K wrote:
>>>
>>>> Update the APMF function index 2 for family 1Ah, that gets the
>>>> information of  SBIOS requests (like the pending requests from BIOS,
>>>
>>> extra space.
>>>
>>>> custom notifications, updation of power limits etc).
>>>>
>>>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>>>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>> ---
>>>>  drivers/platform/x86/amd/pmf/acpi.c |  6 ++++++
>>>>  drivers/platform/x86/amd/pmf/pmf.h  | 13 +++++++++++++
>>>>  2 files changed, 19 insertions(+)
>>>>
>>>> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
>>>> index 1f287a147c57..1b2a099c0cef 100644
>>>> --- a/drivers/platform/x86/amd/pmf/acpi.c
>>>> +++ b/drivers/platform/x86/amd/pmf/acpi.c
>>>> @@ -166,6 +166,12 @@ int apmf_get_auto_mode_def(struct amd_pmf_dev *pdev, struct apmf_auto_mode *data
>>>>  	return apmf_if_call_store_buffer(pdev, APMF_FUNC_AUTO_MODE, data, sizeof(*data));
>>>>  }
>>>>  
>>>> +int apmf_get_sbios_requests_v2(struct amd_pmf_dev *pdev, struct apmf_sbios_req_v2 *req)
>>>> +{
>>>> +	return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS,
>>>> +									req, sizeof(*req));
>>>
>>> Fix the alignment please.
>>>
>>>> +}
>>>> +
>>>>  int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req)
>>>>  {
>>>>  	return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS,
>>>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>>>> index 4364af72a7a3..f11d2a348696 100644
>>>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>>>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>>>> @@ -116,6 +116,18 @@ struct apmf_sbios_req {
>>>>  	u8 skin_temp_hs2;
>>>>  } __packed;
>>>>  
>>>> +struct apmf_sbios_req_v2 {
>>>> +	u16 size;
>>>> +	u32 pending_req;
>>>> +	u8 rsvd;
>>>> +	u32 update_ppt_pmf;
>>>> +	u32 update_ppt_pmf_apu_only;
>>>> +	u32 update_stt_min;
>>>> +	u8 update_stt_apu;
>>>> +	u8 update_stt_hs2;
>>>
>>> Is it intentional that these do not match with the names in struct 
>>> apmf_sbios_req? I mean some of the fields look suspiciously close in name 
>>> so is the purpose still the same and somebody just invented new names for the 
>>> same field?
>>
>> The idea is to optimize certain fields in the BIOS menu that OEMs have
>> to feed in while making the right choices for the power settings for
>> different features.
>>
>> The entire series is targeted towards that where the interface between
>> the driver and the BIOS is improvised so that:
>>
>> - Multiple features can link to one state, so OEMs doesn’t need to
>> program same parameters in multiple locations.
>> - If we need to add new power controller limits , we don’t have to
>> touch APMF functions, its more expandable adding new fields in APS
>> methods.
>>
>> To answers to your question of apmf_sbios_req vs apmf_sbios_req_v2:
>>
>> It calls for a new struct _v2, because:
>> - AMT support has been dropped so there shall be no pending events
>> from DYTC (like the CQL and AMT)
>> - As per the new design, the PMFW has given control to set PPT and STT
>> limits and no pending requests on updating SPL limits.
>>
>> But as per names, I don't think there is no new invention :-)
> 
> Hi again,
> 
> I'm fine with adding _v2 struct (I could see they're not identical).
> 
> What I'm still left unsure if we spoke past each other so let me state 
> the question in more concrete terms:
> 
> - apmf_sbios_req has a field called stt_min_limit
> - apmf_sbios_req_v2 has a field called update_stt_min
> 
> My question is, are those just the same but only named differently for 
> some reason, or does the "limit" and/or "update" difference actually imply 
> there's change in how that field is used?

Hi Ilpo,

Apologies for the long delay.

Your question is valid and hence I had to go back to my FW
counterparts to get my basics right before responding back.

So the crux is, for each of the power controller within the CPU
infrastructure, like the Slow PPT, Fast PPT, STAPM, TDC SOC, EDC VDD
etc., all of them are guarded by two parameters:

- one, "limit", a max threshold a software can set
- two, "value", that can be updated to based on the changing system
dynamics.

So, atleast in the PMF driver context the field names can remain
constant. The field names in apmf_sbios_req looks apt here, so in the
next revision I will make fields in apmf_sbios_req and
apmf_sbios_req_v2 look the same (w.r.t the naming).

Before respin, can you have a look at the other patches and see if you
have remarks?

Thanks,
Shyam

> 
> Similar question applies to the other fields which look close but not
> identical. There's no need for you to itemize and explain each field for 
> me specifically in the reply, I just prefer the same thing called the same
> in both structs if that's the case.
> 
> It could be you tried to answer this with your second bullet but I just 
> don't understand its meaning deeply enough, thus I'm asking again, please 
> bear with me.
> 
>> FYI, here PPT means Power Packaging Tracking, so it could be SPPT
>> (Slow PPT) or FPPT (Fast PPT) and SST means Skin Temperature Tracking.
> 
> 
