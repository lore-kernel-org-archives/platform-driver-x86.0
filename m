Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013043.outbound.protection.outlook.com [40.93.196.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6645137C0E1
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Jun 2026 07:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780991174; cv=fail; b=dfgcZqzjVhYe5MidwGoFZURAVpxhluIXH2BwbeXxE8qreh/eWfseUZMPGm4r08vKvUbqCk9tpNH33GlPUuePsVs10KpsXtralZeBrZFpq7exELb89oGAEkGy1b/NTIXR+UoBEezr7OrlphvyU+AQXv3/mZwrz3acUGfOlO5MEYU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780991174; c=relaxed/simple;
	bh=sZjIbP0LVbFlR6ip80xzCcacSc2wwpOwaL/h74n+0JQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BRgnDyiAK6wkte+N1OPkWObYj+BlfQClaKbeVn3wCCe6w6LgX3uSQfwnhyyIdx23kP+czvMiO+JDfK9YHP8aexogSxG6D52rsisdkjdDju3QZu7adYa+CgwIum51S25twHyYIGxyV+PDT5kh0Ut/Q82afB08tOG3teuZwfLrXes=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JCOt/7kk; arc=fail smtp.client-ip=40.93.196.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JCOt/7kk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A8yAK5OebcUu3Qy0kfjePm10GMX6NBdNOCE/xoZeoN4X6K7JWJQ5sF/QQuxTb50D47V2fbvW1VWzutHkaiNtO+/PZXNmUgYYvpn+HRchCxZidDpA55L8PRbj5E/ekq/ddl3qevPk95FXOldy6GPghPsMC+jIp5853XM8kenLnXS/p1FabGf1LRs+gQOlm7cl5WFcB8crraS3Ro7X9paR7J3lXKAiD7FH76y3hbNi/W/j3t+1W/FQ7Qsy3Coimf2bZNSY17EqNRfAB2y/FhZTGUi4511deoRROCY6MlWIp/DtJlyk8fu+beQvFYEPc6ADkKwurTpKB3+UraVUmujUGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQyiiNcBzycshqxcZfcRT8p37vFNccGCe5e8Fy4wJdU=;
 b=SL0OmwO6caQaEGyC+qajHrdJVQeQMhoGUQ8lzk8FGzN8THEx2Rfyqfo9kGvE3IQavPBUgWsKHhxHubKq/Br6yzuTMjeTp/KnhLZ/TFuw8peJHFQ8ZS62E+12VU+yFYF6kZibC49F9bBC9Uge+GworZVyHFfleKkhm795elRi09WHluAE8+R2kCh+7GlcJoUT9q6iGt+wyMNq03uhOb3HYvvEv/40R43hf00DofEQuq+76IlimUT6HRkdBjXUYKfylkwXMtJBkZ+UBS05bU/68q3sDa300iuYSLZr3msUGuqJAjGMSBFaNW0Y3vw9J2larbDRlJjeTUEVRJca0yanSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQyiiNcBzycshqxcZfcRT8p37vFNccGCe5e8Fy4wJdU=;
 b=JCOt/7kkp6SQgj4cw1w9JpnvZl9wK6tdLi8hsuDLZb5N+iNbU1KH8L9ScB4XNX2dJAKhVqcFIhFQgl2WRxy5IAw47tf4mIb799+G4FXKIeN9Rk74zMlTLT0nVTs/Bxb6TqkpUaS0qbxWs9mEISuHNyZlRcGmmRbPdIVk7JGIBuw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CH3PR12MB8186.namprd12.prod.outlook.com (2603:10b6:610:129::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 07:46:10 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683%4]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 07:46:10 +0000
Message-ID: <d5f09f1b-c787-41eb-9a1f-e66463471aac@amd.com>
Date: Tue, 9 Jun 2026 13:16:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/8] platform/x86/amd/pmf: Add feature discovery
 support to util interface
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, mario.limonciello@amd.com,
 Sanket.Goswami@amd.com
References: <20260527140205.4073335-1-Shyam-sundar.S-k@amd.com>
 <20260527140205.4073335-4-Shyam-sundar.S-k@amd.com>
 <90038882-254f-4507-ae85-867fafe295d2@kernel.org>
 <639d2950-ad0c-801b-ca0b-4cb8966f3133@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <639d2950-ad0c-801b-ca0b-4cb8966f3133@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0070.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:267::9) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CH3PR12MB8186:EE_
X-MS-Office365-Filtering-Correlation-Id: b25af05d-bc64-4e32-e57f-08dec5fb2c00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|6133799003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	00c6XauKz4YM5Lk7o1oOBNjNxc4CTOvKAN37tsri8/ugOu0cKNwsDln6m/MaVkW3NzTRiIEA5XqfOFmR1zu5/VSZzib0vbw8aB5tqjignXRW63mmEaMPUngNgQz723aDxgp61iVTv2qcu4c1S3ZIBj3h8v+7/kjsdGdMVxpfB8WEkTdJE7CTA7T2Fm2aveLz56j7OkWkN8C3PyhQAJlW1I9UuVQcwYSWCfczUZZWv4rsWH5P05yF30rZO7SYB5YmxeWDLHjBIT1qFnDbtpltD+wWEJ147ut4/NVpT/5zd12UGqiccG0+ENmOIDH9H9CsqnVhOJT0kz8OlVPyWN9fAD2/UoY4HNdSgv7qvgmn/bveq3OjkgAOC6ZE/q/pHwMOoYJLRRFOdD9sXQyGn6BNBYsstAaZ2c9kLrF/HdErmWzXHHSKuMKovlqrXfOoUHoomsQz92+5hmZxGIXvBtWTZ8o7p+cRLN9YTSuiir8XJ38RMe1gOsOxJR1epysJ0tri8w86ZJO/dHrEgJppuE6c5N01nrJeEmRqu3s/vEbaqBuRPhQZa0hH8Z/EiOrmOTEpXOFY7ZuozH2bnbfurs/qFRRNi5B6VV9gvbJVJUAmnd3DueZ17YdVwuWoXBRgsk1wqO8symsFjaGdm3OMXNfmGNdmnPbMeIXxJyqYh8SKKjkXa/Qqonn7STLkufpWyaQx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(6133799003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkRGZ01oWTl0QjlPVEsvSHJiOHhmVHQ2Wk5qbjMwaVdtTFMzRDVrRUhlcUFs?=
 =?utf-8?B?RVAxUW5IbXc1djdmUlp2RE8rc2d4bUV1ODlnNXBqRHBnVW14WkIxQ3pmcWRV?=
 =?utf-8?B?VldhbnArTWdiQ3FLWFNnRG9lK3ZVMVBlUlU2ZU5rQkZCaDV6c0h4M01adDlQ?=
 =?utf-8?B?TEdkeU9FU2t2dThsYzVCNnlXL0N3KzVaRHdDU3ltdTB6S1BKUmlJYTNCeEFl?=
 =?utf-8?B?R01Tb1BXajB3alJNZTNTdDBEWE1INlN5M2pPYU03Vm44UWwxY3VQUHBPcUo5?=
 =?utf-8?B?Y3l4RDBjN2o0Z3pxb0dCN0tEK0Z6R2g3VXZDTGFmMHJINDlEVGMzcnd4QWQ2?=
 =?utf-8?B?OXdUenVheDhwTGIyRHNFT1h1VFMxZzVIVXNWUUo4Y3RWSk5GOWZWQmhFWlpu?=
 =?utf-8?B?VEVvUWpMdXhiQWQrcTBPWVptY2FBM1V2SDlwWEhONFhpYSt2M3hZMDVxcHJ2?=
 =?utf-8?B?bmU0bmFLOGttaUdOS21lSStmbm9WUDJBOGl2NXUvSHJDTyt6dEp0dHN0QlRw?=
 =?utf-8?B?dlpaU1ZBUVgyeXlja0ttSkJETGxJNEhHWWt6cGEvY2xhd3pXSk9iL1B3WWNH?=
 =?utf-8?B?QzEvUWtHYTdRTFNNd2g3S2hLYnZjeWp2L25EMSttNkpIWjYvSUJGRHZ4Z3N3?=
 =?utf-8?B?QTZTUmUyT1NkT0pkVnArcXgwb09VQ1NyTWE5UmpNdmkwNlN2bnVWU1JvaUJo?=
 =?utf-8?B?STZNTjFEeTlzb0ZxUU55TFY1K0lJUC9ZdHpoZ01KbExpVTBvd1dtL2duMTZs?=
 =?utf-8?B?ZlAyNitpOVlqdWZlMWtaMTNaRVBTVlJ4RndKNnNsa2Qwd2NFbWI5d3l1Y291?=
 =?utf-8?B?QnZFSzI4Q1NLWGN6TlUvSTQ0TlAvek9rc0lGcG9EVVdDa1grdWZURjZVOGxV?=
 =?utf-8?B?TGM1dWM5MHNoRm5yMnFwUm94aTNSR20wWkNFZUxiYno5Szk3UllObXA1QmND?=
 =?utf-8?B?akhpdHNvbml3TGFpYmI4VzdpdGFWb3lMbVg5SnNRbzEydlR1MHBUVzlHb2FG?=
 =?utf-8?B?Q1FlcDVyVHhiUEY1bWRBN05GcUhoK0JQT2tId3FMWTdoREc4Z3dGbWJJWFZW?=
 =?utf-8?B?cVhSaEk1S2FkNmlvOFF1dzlZTy9wdHNrdXUwZ0VUdzZoWU5FZGphdTlnODhr?=
 =?utf-8?B?UVdiQjk2ZWVyL3EybTEyd20vT05XY0FlNHVMdlZUOEsrYVdsYzJ3d0d3V1hG?=
 =?utf-8?B?TlZra3FCT0w1Sktwa3JyRzRBMG5rQ2JvWlpZSDI4RUdudGFlLzArc056UHJu?=
 =?utf-8?B?emtpMkRDK2ZBOE5QUURpZ2tveXNrbzc4SUJkYkt2VW02M0lUbU1WLzErNENM?=
 =?utf-8?B?TU9Za1ZqanBNTGhmOEdEc0JZbFVRdU1PWGptdk5zSUxsWGJzcGZKV1RJNHVF?=
 =?utf-8?B?Vy9uM0Z1WVV4WWZjUFd0b0F2YThCQjF5aTg2SS9iZTRyZFV4cWNrdi80SHNX?=
 =?utf-8?B?U3IzcG9oNFFrbEhqMnZvODV2ejdmMFFtcnBXckRUUUgyQUhMeHZBN2lteUp1?=
 =?utf-8?B?NzVOTEREOVkvamQ3T256d0lLa1VleW5hVmdPSDJDYXVvR1ZvaEduQTNZREhB?=
 =?utf-8?B?UG5CRGg3L3dyWXhoUGZ3QmV5S1U4dW83RGRoRlJreDd0SHp4ai9mbG9KR3M1?=
 =?utf-8?B?WnZhQVNlVXhFTDcwUmgxeVNFUkQwRmJ4MnFCd0FwZzlqT0NNLy9wRXJ4NHNO?=
 =?utf-8?B?clhCYlNSSmNSTWx4OU5XYzVDMkpSZHhON3VkazYyczFkZGZ0K2lMWEZ0Q25k?=
 =?utf-8?B?YWM0NUNDQjluWFJWNFBiQTF2cWRJYWZOU2J4N1ozd3VtYlIxbHQ2dEZXRk1I?=
 =?utf-8?B?WGx4SjRNR0NBNFBiZEJCVFpseGYycW1uQUFvclErVjByM3pXZHJmMGJ6Zmx4?=
 =?utf-8?B?V2VIenY5MGxBWWppeE5aU0FIYXkyQWpUVjBlb1dteXVISHR4aWtGVUkzZVVV?=
 =?utf-8?B?VitNR05OZ2pQYWFCOWxtdzIvYXloNXhpWEt0ajltVzhUNGVqVmpIVUw4YmJl?=
 =?utf-8?B?dzFYZlpQQm9XU0lJLzRqSmxDQ1d1R09HTTNzNE01aHNrUG5XbFZMblgwNnNS?=
 =?utf-8?B?cTIwYkt1dTd4MENvc0pPbGlQS3BqVDRzcHByUmsvRFFYWkxHRVNxL3JiNzYz?=
 =?utf-8?B?WnJ3aTZZcVM0eWV5VFJRbXY5ajdWZ0dGOUxabFJJd3NmcGo5YU5vK0Rqd3RR?=
 =?utf-8?B?Z0ZBNlhwa3Jra1hZdnF6dFhQeWlMU24wcC9naGZLanRhUGp6d1QrYkVSU003?=
 =?utf-8?B?WGVZNldPcC9LeVF6VUxvRTJOWFo3REpvcEZHaExyR3R1dkFJQkRBcGFQRGRk?=
 =?utf-8?B?VFVEa3QrMmwveVNQbVVqODhoYUNCaEVwa00wOUhaNkxhTUx1ZGhXdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b25af05d-bc64-4e32-e57f-08dec5fb2c00
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 07:46:10.1442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CJFguq0Yl47MKEO+7G16iebAqbT3CH3bH33VcjEHe5WetnJyir/u1Zv96saF4LyE3+/n4hTtPbIGFH1FNy0/Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8186



On 6/8/2026 18:43, Ilpo Järvinen wrote:
> On Mon, 8 Jun 2026, Hans de Goede wrote:
>> On 27-May-26 4:02 PM, Shyam Sundar S K wrote:
>>> Add feature discovery capability to the util layer interface, allowing
>>> userspace tools to query which PMF features are supported and enabled
>>> on the current platform.
>>>
>>> The following features can now be queried through the
>>> /dev/amdpmf_interface ioctl:
>>> *  Auto Mode: Automatic power profile switching based on system activity
>>> *  Static Power Slider: User-selectable power profiles
>>> *  Policy Builder (Smart PC): Action based policy management
>>> *  Dynamic Power Slider AC: Adaptive power profiles when on AC power
>>> *  Dynamic Power Slider DC: Adaptive power profiles when on battery
>>>
>>> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
>>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>> ---
>>>  include/uapi/linux/amd-pmf.h | 11 +++++++++++
>>>  1 file changed, 11 insertions(+)
>>>
>>> diff --git a/include/uapi/linux/amd-pmf.h b/include/uapi/linux/amd-pmf.h
>>> index d29a4abe1145..9de054cfeee7 100644
>>> --- a/include/uapi/linux/amd-pmf.h
>>> +++ b/include/uapi/linux/amd-pmf.h
>>> @@ -14,6 +14,7 @@
>>>  #ifndef _UAPI_LINUX_AMD_PMF_H
>>>  #define _UAPI_LINUX_AMD_PMF_H
>>>  
>>> +#include <linux/bits.h>
>>>  #include <linux/ioctl.h>
>>>  #include <linux/types.h>
>>>  
>>> @@ -34,9 +35,19 @@
>>>  
>>>  #define AMD_PMF_BIOS_PARAMS_MAX		10
>>>  
>>> +/* AMD PMF feature flags - bitmask indicating supported features */
>>> +#define AMD_PMF_FEAT_AUTO_MODE			BIT(0)
>>> +#define AMD_PMF_FEAT_STATIC_POWER_SLIDER	BIT(1)
>>> +#define AMD_PMF_FEAT_POLICY_BUILDER		BIT(2)
>>> +#define AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_AC	BIT(3)
>>> +#define AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_DC	BIT(4)
>>> +
>>>  struct amd_pmf_info {
>>>  	__u64 size;
>>>  
>>> +	/* Feature info */
>>> +	__u32 features_supported;
>>> +
>>>  	/* Power and state info */
>>>  	__u32 platform_type;
>>>  	__u32 power_source;
>>
>> You are now changing the userspace ABI between patch 1 and
>> this patch. Please just squash this patch into patch 1.

Ack to the remarks in 1/8 and this one.

> 
> I asked to only create the interface towards the end of the series so 
> there is no real problem from the ordering.
> 

Ilpo, Squashed it in patch1, please check if this sounds good to you.

Thanks,
Shyam
