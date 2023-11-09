Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95BB3C4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu,  9 Nov 2023 14:15:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234183AbjKIOPb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 9 Nov 2023 09:15:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234085AbjKIOPa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Nov 2023 09:15:30 -0500
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2068.outbound.protection.outlook.com [40.107.243.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCDAA30CF
        for <platform-driver-x86@vger.kernel.org>; Thu,  9 Nov 2023 06:15:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h9YZDoV1otumyW6aEicEo6Hf0zbO6TBY1admYn9jqI5pb5DgPDir83jkSE3+jnJYArzJ6HxUgyP2FrK7j3td06jVeKsptJzL3dz2g4tEf+/07bJBrol2/SAN/WLU63hNMz4ybAJ5ytdXpqdKSZOoxZ/p7bcncAwJsykZ1csAgQfwLRdOQDY7cZQTh4FO1auWjnLOUoOTs9xTcaS9rW+LC4ebef0RUL7XUyr0ntf9BtJ9X+AWuqjuljfj/rmwE13AAKzzsubx/akQHLY1hytLf9BcGVf90K8zWJkugxvJFBGFbUqJHHI3xi5dTHD31HbGFPtv4xJPCtX8VxZFTjcsyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CcEGvC/nfxJzPZRjIdqTx8/IzBtho0j3sy4z6/uXAqI=;
 b=m94KvReDJjf9EtIVp4GdpNZ5eK5SwT71M9NVMW1H3x4jcP8SNPWixmmBvF8qLDBxh911yQIvUPVNecoj4t462IIG254ywSArLLRaA7rCDCw5Ecezw/KjV1q3JRDWXmzuMUP8ip0Knqpw1doZ+/SWQcDgfgHiaPAQhBj/q8PJ+264bUfV0qVR/Wf0EtbMbmkSuR0aUXz2M+4I9mbpSI0WQqwWe9Mni4rha6YsLclKUPoUqQdAVrC8k19ZNnqD6lBGJ820WTY+gKYPCyNpMFzFS6W0L9/vrCdE0WEoCL6OzCya0qNK402nIKF8pP82WveOTfUfoqcUtn3vbO2mdATekQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CcEGvC/nfxJzPZRjIdqTx8/IzBtho0j3sy4z6/uXAqI=;
 b=SstoOUCUr55z2O8XCv5WcatxGHQ1UNbP5jDsEXHxDMXrqGw+ChcKwKu/eKRUPhNCosDXDMubSjCi5bd8Rkv3z/sRK2NNkIQwTvOJOKtFpvTl8CeipOTbSnwLlgeYZNlS9Z3rtqRHYmVhfANmgT1sM/LHXj1bHRnlMJeGmVBPL+E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH7PR12MB8777.namprd12.prod.outlook.com (2603:10b6:510:26b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.19; Thu, 9 Nov
 2023 14:15:23 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a%5]) with mapi id 15.20.6954.027; Thu, 9 Nov 2023
 14:15:23 +0000
Message-ID: <3fcaf803-5e95-4609-9d3a-e7a43b331b5c@amd.com>
Date:   Thu, 9 Nov 2023 08:15:20 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86/amd/pmc: adjust amd_pmc_get_dram_size()
 behavior
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
        ilpo.jarvinen@linux.intel.com, markgross@kernel.org
Cc:     Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org,
        Mark Hasemeyer <markhas@chromium.org>
References: <20231109061709.2964246-1-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From:   Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20231109061709.2964246-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0030.namprd13.prod.outlook.com
 (2603:10b6:806:21::35) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH7PR12MB8777:EE_
X-MS-Office365-Filtering-Correlation-Id: 87dc5d3d-ab3d-4d8c-e563-08dbe12e503b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bbewY0ogXIqSLi88zNzp8tSX3f8Sym+DKC0PqpqfJ7gec9sEfMwZ4zX+nD3wZbfTcKWeq1AA7DfRLn15zIx7e/WYBYwjICu6quKw+IjY2JmYd0L1pl6KTp3B2rG3U0Gwe6w0PbJeQiDGsKLmLx02VnMJhrzEH8HQK+HAVqfjb5dyVWKqYDzS/BejqEWRwVjqNj7Ho28sSbK7ZyKykbQ/imzVZJNX3XMSsGpRWQyikkwpgCH2sHbS+vrPTLNkSoPkvIcKv00iqBMkGt0ZVm19Qp9Dn9GGkiH+ePbZxA/yqVkgofwl8Xn8m/szV9KcKm3fCg/X/58sb2rs3dFAyvzwpXDRHRFNV862G4rnWqyCbnfB+aNn3Wf2c83ByYGYSaBiq016Gf5Pk1YYbqv9sES7GSsnCKkyRwVuSwnjxJ7313JDuzkSC29B7WMqWA95+NXK6P29sg4Ey4rYrqS2NI8a2609nxMftRXweNcu1gVX/wK4zObGOZ2NBrHuTZ5WvgqZAV3uGiLo4Xc99y06mNOWB0hRzXr7bhhFRg5Oh1AK3wyN8jFDulA8YPbvNaPRKi5PNOOB8mHf+Hbw1kxKcz9ZrhQJPl+X+alLGWMGEMvyfysz+3Jr3EwyvmJZdEGzJvXczPS7uzSNUyNLy7qPvakp6Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(136003)(39860400002)(396003)(346002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(6486002)(966005)(478600001)(53546011)(6506007)(31696002)(86362001)(5660300002)(44832011)(41300700001)(2906002)(36756003)(316002)(66476007)(66556008)(66946007)(4326008)(8676002)(8936002)(38100700002)(2616005)(26005)(31686004)(83380400001)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S01DWFpiMGw4cW5UWnI3amVKL0NMTit1TTdqUXdVaFpGeUhUaVVMSjNURGNQ?=
 =?utf-8?B?UnBvTW1RZGN2Kys3ZGpLazZGVFVta0lWaXQ4Uk0wRXBSV2M3eDFBR1JSR2xr?=
 =?utf-8?B?SXNaeW00Nnl5QnNybE9IWU0vdXJNVndVTFN6TkJKODhzSC9YT05HdG44c2ll?=
 =?utf-8?B?MTlNR21Ic09RY3NqbXovSlM1SS8zYTdzT2VZY0M0RE1WVWFDdzY4WDhvbUE1?=
 =?utf-8?B?U293aktRZnJMK0ZzTnNHbnhzNHJlakkzMFlzQi9MU0gzT3Jjc0gzWklZbjVv?=
 =?utf-8?B?U0UzUFltT1Vzbk1qaVJIeU9pYUM5YzZMT2lnT1A0WFhEdzdRcnhBd0MyTENE?=
 =?utf-8?B?bXFpSXNUUGpTUkN2YjJ6MU5JSUhZem93QjJKZ21IR1NKK0J2WXFFWVVnSEkv?=
 =?utf-8?B?bUFCdTNOMXdhZGZ6WFlLcjdlTUVkYW92TmQ1SWpIOUFRejZvTFpEV09jUkRE?=
 =?utf-8?B?OFc0NE5JK29MQWdqQzYwSDZ3ay8xZWFxUGZLbDM2S3dnMnlxQ3NlcTlzbXJk?=
 =?utf-8?B?SFB1c1FjQ291V21TbjI2YU1SdzY0RklpL3NWRFZJQXVYZFpqZmZWWDhha002?=
 =?utf-8?B?OC9CeTI3YTNDY3BsVmlBa25IUUNld2hVVmI2Mjl3aDd4dHF3SU9qZ3JkU2ha?=
 =?utf-8?B?N3N3RGZZcUpZQURBNi9FaVR3MXl0WDRtTzNSSGdJMllUUXU1ZnRFU29RWUxE?=
 =?utf-8?B?b0NYL0RGUDlHTlBhQm5DMHk5ZmcwTXNiaTBvWXZBcGJVSWkvdTNSVkdsWDVB?=
 =?utf-8?B?cFVuYkpxRjhvai9UcVlqZldCM2xHbFRKa2ZIYlQ0cmd5VUdBcktMYVF0OWdo?=
 =?utf-8?B?NjlKTktSWUpwSFFNbjFTRkUzNzBIZTdsazZtVERZZVpZeGJnS2NUbFc0YWly?=
 =?utf-8?B?LytZditIUjhuWVp4NWF1OFZscjl4WVdvU2JodTZjOWx5Q0o5dktyMXJPdkhx?=
 =?utf-8?B?U2NvRDRKMjVUdklrMUNHclJ2dm1hSXYrREwwTktuM1FLM3k4alBFNjBSelRl?=
 =?utf-8?B?S0NlNytBOU0zTkY5dVpWVThBckJ2T3g5cmsxV3FEb2pTWUZVd0dvZ3EzWXpJ?=
 =?utf-8?B?SURORWNCK0JRVW5TVW8zZ1N6enl1cWdHYkUydVZ4VkFtTml4VWowcE5URS9K?=
 =?utf-8?B?NldQQUZMTDZ2OGZscjFBOHUwN2hpNDJscUhVczNobnAvVS9kOXV1ZkpkcmNv?=
 =?utf-8?B?SytLYVJJSEU3NHl1VmY4Q3NTbHNqbHNSWHI1SDdjSnVESmZ3TXhCK3V4YUJL?=
 =?utf-8?B?aHBKNGk3SGhwTzR0c1ZnOVRLS1liQ1hDeXV2dnd1SFZySGhWZFZTZzlwb1Z0?=
 =?utf-8?B?Zmp0b1BhS3pHdW5weFZUR2tJVk5zT0l3Q245cnAzZ1BVQi9meFNibVJpMGs3?=
 =?utf-8?B?dDR0cU5mNGJrRUNPQmNiV3FEbmpjT0JkQ3BZVUxaMmIrWGpLaWg2d2ZabzB0?=
 =?utf-8?B?R1p4RjZRUlQyenFyR2gzdkZmbUFRc1ZjS2QwSTBvTkJqc1VmdzlqelUyclRU?=
 =?utf-8?B?WkhrK1E3TXVLRUtjOERDb3ZlYkd0N2pNS1UwcFFhNjJtc1Z4TGxRWHJYSFZB?=
 =?utf-8?B?NzBwQ3M2NEQ4Ri9HRUVSanc5eE1FWHkwTm0wQWh6MEpYSnRQNVd0ajZNM1kv?=
 =?utf-8?B?NW44andFcUdQc3NhUzBZY0V5QUhKYUFacERQL0c3SUk0L3czWFVzQ0o4VktE?=
 =?utf-8?B?ckY4a3Vxcy9zOG5uQ0c5WlkvQWpkblh5SnhVeVJkbk10cmk0Tkp6K2FBcUlI?=
 =?utf-8?B?VjRFd1NpenJGMk4yTVc1NGVBRG4rajQ5dTNRdGlwUEpsc3BEVURLVHBlOXJP?=
 =?utf-8?B?bGYweWFZZ2VhY3dyejBCeE5NSExIalBaWVgvRWgyN2I2US9pd2FDTlpLN0Qy?=
 =?utf-8?B?a2V2NndwMXphbmNRcDQ1bUVzRzZPc3pDZUt1cEJPdWxGMVNqMjRkMkNyaVR0?=
 =?utf-8?B?bWM1TEhoRG9FMFFHZmh4NEF5TWhTTHFad2traDlmTEtXWGNNbTdKWS9VK1lL?=
 =?utf-8?B?UXB5QkNkMGdVU29sWFJjdHRVREg5eTZuWitabTZRd0NqL004Q2JjczdZYXN3?=
 =?utf-8?B?Ym4yNkFOSEJmeUlFcENvVHBndWNzVFJiMzlCQkVCWWVGRWZQMGo4Q0JWV1Zp?=
 =?utf-8?Q?DBtDHkl8ZK0olJ5UCKJaYZFwO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87dc5d3d-ab3d-4d8c-e563-08dbe12e503b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 14:15:23.6079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v9R5ChojcKxYPuYS2PhbyPRveWCBMIkWbqyj+q8Ubjv2ljl4vlev+LBBfrvYduelkvQwV1xRjI583gJavU3FUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8777
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 11/9/2023 00:17, Shyam Sundar S K wrote:
> After talking to the PMFW team, its understood that the "get dram size"
> mbox command would only be supported on specific platforms (like Mendocino)
> and not all. So adjust the behavior of amd_pmc_get_dram_size() function
> such that,
> 
> - if that's Rembrandt or Mendocino and the underlying PMFW knows how
> to execute the "get dram size" command it shall give the custom dram size.
> 
> - if the underlying FW does not report the dram size, we just proceed
> further and assign the default dram size.
> 
> Cc: Mark Hasemeyer <markhas@chromium.org>
> Link: https://lore.kernel.org/platform-driver-x86/3b224c62-a1d8-41bd-aced-5825f5f20e66@amd.com/
> Fixes: be8325fb3d8c ("platform/x86/amd: pmc: Get STB DRAM size from PMFW")
> Suggested-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
> 
> v2:
> - Based on review-ilpo branch
> - Drop calling get smu version from probe.
> 
>   drivers/platform/x86/amd/pmc/pmc.c | 11 +----------
>   1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index cd6ac04c1468..501c72c7d34c 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -968,17 +968,8 @@ static int amd_pmc_get_dram_size(struct amd_pmc_dev *dev)
>   {
>   	int ret;
>   
> -	switch (dev->cpu_id) {
> -	case AMD_CPU_ID_YC:
> -		if (!(dev->major > 90 || (dev->major == 90 && dev->minor > 39))) {
> -			ret = -EINVAL;
> -			goto err_dram_size;
> -		}
> -		break;
> -	default:
> -		ret = -EINVAL;
> +	if (dev->cpu_id != AMD_CPU_ID_YC)
>   		goto err_dram_size;
> -	}

I notice that the error at err_dram_size is really noisy.  Thinking 
about how this command only works on RMB or MDN I think you should also 
downgrade it to debug.

>   
>   	ret = amd_pmc_send_cmd(dev, S2D_DRAM_SIZE, &dev->dram_size, dev->s2d_msg_id, true);
>   	if (ret || !dev->dram_size)

