Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2086.outbound.protection.outlook.com [40.107.93.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40CE12CD99
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Feb 2024 14:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708093618; cv=fail; b=Nf82j7giytk5PYD/Ub6a3sxnHIFXqJQHQ2kehxnW6+OG8ew+HpdgSkGqptb4MDujIujCLdIMxPWUzCWywSeU6e/XJ4F2OscXUYi9C65Hebi7ctmCEzH4ydVw0hHY9j5GKO+e/8VSQO2ZDqAnTlXWvP5LwboTHU6fvSjU7pRePTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708093618; c=relaxed/simple;
	bh=Aa8aEhZ0SyxKy8KA+LBCxBD6Dg1JZxQgDgWpn1wGG0A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=syOHb+lK6lnDzOrs3lWCpLzIu/kizuV1GF9zoZ5T9bcvkhnwx14C+tgKP8NF+B2JvPUQnKTUgKlOyDSin4pUV1OGO374cBwuBQ6bsUlpXa7FLNqJMLc81EvRXXM4zXCGMWlgLNNWPEZeamnHMW/m3UYHGJXnUc/9K8Fkb/f9bg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=p06I/Xqs; arc=fail smtp.client-ip=40.107.93.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="p06I/Xqs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Plf3vfoeOI4nYmSwhK+UhMdEsBaLF5h2QXtFvNp3DllynHJF29XOuorD2tlBIBbtlJzpaVHBe+/YD6sx+cWZ1BkYGKc7u3j1PUd/yYsKs1fFMS51+LmqDBqhRJVe7j7yZhpLtLq1Xwy7xYMYE/ero6IpNxrNHxrzijR/C2q9HbuC++HIGerANoarJDdpmUy35YlHeDUPGNd+18dZLC4oc3Y9rBGSNEoA4FwrWAO5su5DRhvEV04qtlyraghpqeL/56srx62SfrABixUglOmmNFan0xZ6Ud075KuHJzs2Az7wTdTvDlaOg82ImkiGT2J5tJLS14ya8+cxeIvAwr7CZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JQDKGsyAME+SD8ql559zXEhSK/xKlA0PqMVGDmza1wk=;
 b=GAcJD2dzCtSpPShV8O7pco71FAbK9itfbOlPNKZfLmXiRaL54mTPlk9TSGyrKOztcBh9276Ug19XMeiwEeYxi2dJaItN523a6Wlze6nAvpn/LZ9OkIs4frnk67OPSSvxyV9g7k742Jzu7WsGN8YQgB/zsQmtLSeMdQxm4x8b8N2wucXQ6aQNJ75J/63NU4kxSgEH67Ic11mWmdeLFhSnmwsmsFtZp1KY0BPbsEha9D2D58nFEfO6HZf2ZdeWjNhcvrHB1V31/GbLGBn6uPtStBhyPzK0sQSfdR3B1U2hug4MRlWXSj/3jsjQg4/zsemWoHl+8FjKT5D8ks45hqq5Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JQDKGsyAME+SD8ql559zXEhSK/xKlA0PqMVGDmza1wk=;
 b=p06I/XqsfBdzB2TrAAIHgWvL+1oW20+hbf5cWSPsVyTlcSHTGGUMtCx2pVwJT7MzU55ULuZ2dih2kz1E8BDh8+iUMRuM25Yb/bKjsuaREjBD3vGg8bFVr+gxMO9jLZh4xBUQ7B05Z790S4+LCW16Tla6QkpuZ7E0A5SAErx+8o4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM4PR12MB5747.namprd12.prod.outlook.com (2603:10b6:8:5e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.14; Fri, 16 Feb
 2024 14:26:54 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dd00:9ab5:4d11:2d1a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dd00:9ab5:4d11:2d1a%7]) with mapi id 15.20.7316.012; Fri, 16 Feb 2024
 14:26:54 +0000
Message-ID: <13fb234b-f5c9-4d22-8e46-67efdbe7c933@amd.com>
Date: Fri, 16 Feb 2024 08:26:53 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] platform/x86/amd/pmf: remove smart_pc_status enum
Content-Language: en-US
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20240216064112.962582-1-Shyam-sundar.S-k@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240216064112.962582-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR07CA0079.namprd07.prod.outlook.com
 (2603:10b6:5:337::12) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM4PR12MB5747:EE_
X-MS-Office365-Filtering-Correlation-Id: 483a20d7-0987-4297-7030-08dc2efb5310
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wJJ+UlMhjG/b1ll7rW8sHGqVt0Ha3ENjUsG4gniOvmEveyoYNCvKMzTJizwbteSuPWM6G6ZpPonRCdm6ggDpg7YMbtj+9pTQhmFfgnliv7hO+6KVozPxj6wa+fDufK5+V1bRGM8xXgDSky8YvTeGoI/cXf6Q5c9BpMUxFje4I8H2qTKbhy7HIEA2+JMaCxIuGi459S7kBXNfdssx9OOS8L0Es/RYQPdqfY9FTJdztItKdutZ6/W3x+fjTAyOF/OMYrN+l/MXLL2XrLUg6y1MZz7lyjPG9jnnhbxMcByFN9qDUvVgk51KI2aLSPL5OBc4XJ4ebvhzYg9L/SKVT4h02j/4EdGbjory6BDhtnmHaBrZsl3tb4hISgwDtSxYdZGxYAb8DLEifciIDDPRB49Nh3wGORgPsDq8L4vKifPC2b6VGQy0ZrRgzXw8lqp5VRvo7YwyylY2vF46rYuKRx3LrJUJz3kiZsdyZL43brhokXQZdTtd+SQUhIpi6uk4yhBUz0LmXMdcxC96TGHN68qOiouTAhvUCz4EP7Xxm5UNXMlZ2wWV3ptJYViav8e2tvJ/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(396003)(346002)(366004)(39860400002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(44832011)(31686004)(2906002)(5660300002)(83380400001)(26005)(2616005)(36756003)(38100700002)(6512007)(478600001)(66556008)(53546011)(6486002)(66476007)(31696002)(66946007)(316002)(6506007)(8936002)(8676002)(41300700001)(4326008)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1hDVlYwWGJXSkhYalZQVmZoM3JlQzE3WVplclMvaGlXdW4xQmhxM3NIZEJE?=
 =?utf-8?B?MU16ZjJVU05raEFLeXJOQ3dtenUxQkpyZGpNSzlYdG45UnNyMlEySGllVTd2?=
 =?utf-8?B?eUFWVHpCeWl6QkNrdHNzQ3BqK2hBU015TVpzNkhneURPSHVBclFiR2EzZFV6?=
 =?utf-8?B?WU9Zbm5TbWVYMUpmZHgxVTU4T1BCNjc3TkdxcXNuTmpRZ21qbWx3aWVTOGZX?=
 =?utf-8?B?d01JOXVrcTdNMGk3NU1qK29Ebm5Qb2tGZmFVT1o4L0pCNlAxUkNsS1NpbFBB?=
 =?utf-8?B?U3FDV2FuVVBBYTlCcDhqWmdxd1ljVTdoQUowTzhNb1dteWRiK1pmQ1NCUndB?=
 =?utf-8?B?cWN3RXNVMnlHU2ZaaFhKMm1ybDRuWXpvWDRhbjNKdk5ZNHRSMjE5RU8weThl?=
 =?utf-8?B?VDBRTEc3WWdEMFdYMzd6Z1ZsRnc0MXpxTnhwL0NYaGtlT0hPL2ljclRPSUVZ?=
 =?utf-8?B?OUhnenpsall2T2N3T054VTYrR0xxWnNiUzJNbDhZRzhpakluTWJUWE1PcExY?=
 =?utf-8?B?cGFLTk84VExJRGpETHVwZnhMaUFBN0xCTUFyaitsMUFzenNsRjFGQVNqbXhz?=
 =?utf-8?B?SzZXTTFpQ1V3Y2JqenlTVWthM3RyS1lYWnh6RnJUVUd3dFZnY3pkWk0wa09C?=
 =?utf-8?B?QkovUXNUTzVuWUUzSThRN3Vma1BNQ0Z6UHRUT3dCSHNLY05Gc25HQ2U0dUY4?=
 =?utf-8?B?b3RySVdmRml2SkZ0SWdXQk9WVXFTdVluOGxxVGJoSVZsaUIvNEFES05Iemth?=
 =?utf-8?B?dU9GZkhxK3F6NjF5TU53UmN0OTZpMzYrZTlmK1gvY0hVaDU1cDQrbnV5SndK?=
 =?utf-8?B?TlJsZ29KanNQTmJHWTRPRXFpTUFXNTVsT3RqcnFhak8zdCtkcW9YZFg1V1hO?=
 =?utf-8?B?NlM0TTl1dERxRDVPc0dVWTRIaDY5MEdPcW9YamNHQTk5UjNjbUxmVG41dnVS?=
 =?utf-8?B?NzdQbnA4ZWtrbUJCZXNlWm5MUVQwWEp4WTgyVVpac3kyZlFrZURSUzVxTHRu?=
 =?utf-8?B?dGtzY1VQNVg4T0ZCNXZkWTVaZ2dabmNobmZZRVV0R0dPL2hYVFRuOVRqSEhj?=
 =?utf-8?B?RVRxbWJLS0lIcVB3d3NueXpYNk4vTk1kRUlreUt6SkRBY1JSVDFvQm11NlI2?=
 =?utf-8?B?TUJNY0RDK3J3QWxmcG1qb3dERlFBK1U2Zzg1ZHNLb3pFdWJiK2pVL0cxWTZq?=
 =?utf-8?B?Y1lTQVZCVUh4K1lpUXJhWnpMTFFTYWFDVVprOHhCREZjS3ZrOEF5cFVHWU5T?=
 =?utf-8?B?N3BXeWgzVVA2bDhFcnljY1RMOUplRGh4WHI5Q0ZiVnlFZzRUalQvTFRGeUc0?=
 =?utf-8?B?TmF1ZzcvNmMwQkpPZjZ1WC9YVG5UcVVXTzVDc25QSEhoMGR4TVhqb1JEaTFI?=
 =?utf-8?B?aU1FaG1YVDA0VElaSEZPSVZoN0YzaUhaMkp0OGtOQUtsNGtCdGR2M1ZTNjQw?=
 =?utf-8?B?QVo3RTRBUno4WCt1RzlETkVqVjNHOXNaM2VqZVo1MWh4ZTBRWUovQitBN2JB?=
 =?utf-8?B?Q2tINitnMFFYVXFhUEd0Z25jeG5ZUEhGVzBLYkFCc3dpeGJ1SitCN0U1LzFZ?=
 =?utf-8?B?MHR6anYyak5VOU5CNVRxQm1LWHdKQWFqcTJCVlE3Rm5nb2VRVGdwQlZTclNv?=
 =?utf-8?B?c0lvSTg5cnM4WXdPMEFlQmZtQjdLbTBKK2E3RTRqcktJcDAybmhiOTdwWC80?=
 =?utf-8?B?TVMwUHA1ZTQ2MUcybExkNnJwTEY0enY1SUZGNnI1RDEwb1VSY0R1YmE2WEpm?=
 =?utf-8?B?Ri91dDdWMkkzb2tSZlk5NVNRVGIrcW5CODJrWEhhamdYR1htalhNNEdHQnVL?=
 =?utf-8?B?Yk9ib015djRTa0wzN2gvUHF0RFNKRE1NZ3ZWTmppYVUwZFpQUGJaZ2F2U05r?=
 =?utf-8?B?Q2xNaExLY3FKWUM1ZHFBbTJhdzUzcFVvWGNEQWdtVjlDMGtwZlRCK1pMUGxz?=
 =?utf-8?B?c3FxWHpKS280WE9HRXFmZlV3OVh4TjNnem9uOXJURXNzMzcxUlkyanh3MFB0?=
 =?utf-8?B?RDUwRXFJQTF0MlZuSk9BcXBsYis3Q09qVjUxUjJGWHljWVh1dkc0aVV2L2pp?=
 =?utf-8?B?RTBPNVdCVzZnaXE3UFN1RWRSTjY3blJMNmFJUm9CSXdBMllQYVFvd05VVnQ5?=
 =?utf-8?Q?hKcwE1rAgthXxyVgTrATdXkYD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 483a20d7-0987-4297-7030-08dc2efb5310
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 14:26:54.6057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OOqKhn0mZcAy5K7wLr4YhmztNuAWHqr+ly8HUURONYjWQo1z52PW+W+ZW9doQxo85NeoTanTq6DyCJQ6NSE5fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5747

On 2/16/2024 00:41, Shyam Sundar S K wrote:
> Improve code readability by removing smart_pc_status enum, as the same
> can be done with a simple true/false check; Update the code checks
> accordingly.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v2->v3:
> - handle missing case for amd_pmf_init_smart_pc() after removing enum
> 
> v1->v2:
> - remove enum smart_pc_status and adjust the code handling
> 
>   drivers/platform/x86/amd/pmf/core.c   | 11 ++++++++---
>   drivers/platform/x86/amd/pmf/pmf.h    |  5 -----
>   drivers/platform/x86/amd/pmf/tee-if.c |  4 ++--
>   3 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index feaa09f5b35a..1d6dbd246d65 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -330,9 +330,14 @@ static void amd_pmf_init_features(struct amd_pmf_dev *dev)
>   		dev_dbg(dev->dev, "SPS enabled and Platform Profiles registered\n");
>   	}
>   
> -	if (!amd_pmf_init_smart_pc(dev)) {
> +	amd_pmf_init_smart_pc(dev);
> +	if (dev->smart_pc_enabled) {
>   		dev_dbg(dev->dev, "Smart PC Solution Enabled\n");
> -	} else if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
> +		/* If Smart PC is enabled, no need to check for other features */
> +		return;
> +	}
> +
> +	if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
>   		amd_pmf_init_auto_mode(dev);
>   		dev_dbg(dev->dev, "Auto Mode Init done\n");
>   	} else if (is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_AC) ||
> @@ -351,7 +356,7 @@ static void amd_pmf_deinit_features(struct amd_pmf_dev *dev)
>   		amd_pmf_deinit_sps(dev);
>   	}
>   
> -	if (!dev->smart_pc_enabled) {
> +	if (dev->smart_pc_enabled) {
>   		amd_pmf_deinit_smart_pc(dev);
>   	} else if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
>   		amd_pmf_deinit_auto_mode(dev);
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 16999c5b334f..66cae1cca73c 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -441,11 +441,6 @@ struct apmf_dyn_slider_output {
>   	struct apmf_cnqf_power_set ps[APMF_CNQF_MAX];
>   } __packed;
>   
> -enum smart_pc_status {
> -	PMF_SMART_PC_ENABLED,
> -	PMF_SMART_PC_DISABLED,
> -};
> -
>   /* Smart PC - TA internals */
>   enum system_state {
>   	SYSTEM_STATE_S0i3,
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index f8c0177afb0d..8b7e3f87702e 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -260,7 +260,7 @@ static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
>   	res = amd_pmf_invoke_cmd_init(dev);
>   	if (res == TA_PMF_TYPE_SUCCESS) {
>   		/* Now its safe to announce that smart pc is enabled */
> -		dev->smart_pc_enabled = PMF_SMART_PC_ENABLED;
> +		dev->smart_pc_enabled = true;
>   		/*
>   		 * Start collecting the data from TA FW after a small delay
>   		 * or else, we might end up getting stale values.
> @@ -268,7 +268,7 @@ static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
>   		schedule_delayed_work(&dev->pb_work, msecs_to_jiffies(pb_actions_ms * 3));
>   	} else {
>   		dev_err(dev->dev, "ta invoke cmd init failed err: %x\n", res);
> -		dev->smart_pc_enabled = PMF_SMART_PC_DISABLED;
> +		dev->smart_pc_enabled = false;
>   		return res;
>   	}
>   

