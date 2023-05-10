Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6B67C7EE22
	for <platform-driver-x86@archiver.kernel.org>; Wed, 10 May 2023 15:24:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237532AbjEJPYL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 10 May 2023 11:24:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237441AbjEJPYK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 10 May 2023 11:24:10 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2063.outbound.protection.outlook.com [40.107.92.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F04C35A0
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 May 2023 08:24:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xr1jXmDRUPq1/tlZ88kvjrJtoM3JPFb8YIEsjS0/FQdsZ2Pkcm4kaNdRwDOuDuBtVgFKUW4Y31vYGTbnxqlRj8DLCZDN6le3UBpjc1of4wsZ4WT26nq6g0hu05ZtwVEyUWMLYJUL8nOa5O/LXpsXaErKgKkU4jbDCedZn5s0l9dz16YyRk+mt4dejnRCE0ASnHEFMF3rmOk+SRZblFU2ofCive0I/zLErXfLYxOTyBjXCaKyDFt7kaZ/1yQQBvEmCxiB/zUbISLhSayJB9il7ZWpngSWT0zSvsh+z6djSbbyYwsgQDZ5HbWtTWNX5fftkk1UIs/taJZGLvNESuzN1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JaJC/mKlVlK+wW8ganpOLy+4RCKlAotbiVeiY/D8nZM=;
 b=jp6KTf99FyJGiiCzUoSPQEDfolgemz5kP7jDsgetrjpil2WBIWTxq/8F/Q+vcSfnDjHOIdVKR6KnHbtDGzR3hm29DFdatNbW6fBalcIUYT6nxy1tqQfL73YdwqsiS9KP1TAHw+rN1W81onEF8WpAh4LwXKQs5fFTeXuDu5Xoq8XhgPQw1KIY3inuPuknGQZO0n/K5jMmDSlmtfELptGHHHQ+tns+Ilp1IooBYviJXlxBYU8otDYw1BUIwZGFRT+lrgvAcsA++V2IHF/7SSpskqnYHEwn/VFHCSqUkwhRDTvVJAf899baZ//FCchAQ2u6C2CSzMwIMlaahJBlCsDW0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JaJC/mKlVlK+wW8ganpOLy+4RCKlAotbiVeiY/D8nZM=;
 b=hYkrzugV930Qr9kxBmZlhdDkrT4Tg4UeW9Qqu7PhNFQRhN8Ue15mGIMVo3zpA/zjPJocBV+0BzudABxpVHNhEKXg9N7DEqlDMjZl+qz1/u1gXROZgJ7ADOKB6TNPeSDZCRbBowjIQ3f9is6/FY/zae4fhwbSWdnUIgTOdl7A16s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM4PR12MB6639.namprd12.prod.outlook.com (2603:10b6:8:be::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.18; Wed, 10 May
 2023 15:24:06 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3f45:358e:abba:24f5]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3f45:358e:abba:24f5%3]) with mapi id 15.20.6363.032; Wed, 10 May 2023
 15:24:06 +0000
Message-ID: <e248f0b0-e6af-c75b-fc38-14611f5cb2ca@amd.com>
Date:   Wed, 10 May 2023 10:24:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 2/2] platform/x86/amd/pmf: Add PMF debug facilities
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
        markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20230510144751.66601-1-Shyam-sundar.S-k@amd.com>
 <20230510144751.66601-2-Shyam-sundar.S-k@amd.com>
From:   Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20230510144751.66601-2-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0193.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::18) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM4PR12MB6639:EE_
X-MS-Office365-Filtering-Correlation-Id: 049dcbe6-35ad-4c8c-4129-08db516a981c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8uE2OtSUacJmWuV5AYi2l162HmGAFMaD5+eYKO7rqno+K2bbuz4g9xqc0A0Z+EfAr3SxkWkvimr5P+UQoZ8pS1kuPO4UZZOGhVzWRRqscGYINXGGC45v0K+XUibKwCnGztqfxOAx+lI3pntG4iqD3gk1z4BqI5ho0yNXTHM0WFcCdw441/SPd1dDp3PViEYN6louB0fyrN2YV9cA1M1gvjOiMQNOH3RjS+rHhAit2s2D6LQ7Ma5LnkwuGaYmyaLC9y4KkALpZ1BERP1pbI9w7HXQ9OeeHllZPTS63b1BIydiKLpd2iEunJWsIo3PbFOX9cTEIWU2oGsistA7Hm/T/zZw3dXGrlNaobam2hqLKR26bAWg01LeCRR8qeEvKloZUgFK+GnZoOoH/gTNY070VySSIOfRuQqQ0WM0yF6Zt3zze64t1fbgaJdiJR/DJb4lL7hT9EXLk+L24bJA++RZx0ssZNwGIUPg4g5TU5zd0ASpQbjn/96t/7yhsVSUiaSWDtISy6KgjhYDcFW2FAG05hnNxv6wLumGTAw7rr2poLRcsUWjSzHLVGDXp+gX/KlVb+kuDnRz82huaOn1OKsKJDaBPaDZ7XAKqzoZKG4jzHh8XzTkaUZ/9/0NGUH9JbHUakrSPj18HtesmiOjHDG3Gg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(366004)(376002)(39860400002)(136003)(451199021)(6486002)(41300700001)(86362001)(38100700002)(45080400002)(31686004)(2616005)(186003)(6512007)(6506007)(53546011)(36756003)(83380400001)(66946007)(66556008)(66476007)(478600001)(4326008)(31696002)(44832011)(8936002)(316002)(8676002)(5660300002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmNzcXdvZG1obm9DTlY3QlByOUoyb1Ivc1l2SUJwZFhHamF2UDNrWDQ5QXJW?=
 =?utf-8?B?Y0lQdUFDYld4d054eXdDTTZnaUxwd05DL3ZVcWtMcVJnRmdPRGgxM1N4ODh5?=
 =?utf-8?B?NTBBdjhkK2plekRnUW5xYlRtd29Id3JSbElGWnFPTWJQcG9aNm9xdUtaMXlj?=
 =?utf-8?B?VGRBSEsrUXkzdmRwNlBBbWE0WWwvdmFZRXpZbkl5dVNmcEtkbHMvRTdwbzY1?=
 =?utf-8?B?em1SOHkzMVRndFJvVExxL01vKzM5aisyK25rWDU2ZUhFUHM4Qmg0UllSZDZ4?=
 =?utf-8?B?WEtnUVp2cnJZUnpJYWJUckJ0UVNybjdrNnJXL2VtaGNjU3JyeTFEb1ptU2F1?=
 =?utf-8?B?VFpzV1RRcE1LdkZRTEZlUzNYUzJjUkp6dGZKYWxvZkJiZkhXaVQ4aHVpUjlO?=
 =?utf-8?B?aHF3dmFtSHpSaUZMZGpQaGZDWGJBd0tIcDF2ZGFaV29YeFdMZUxGZStRZTVV?=
 =?utf-8?B?NEppdFowOUpEWXRGSXJnRlZLMm5jZG1LTnV2K0w3THllRHZDYm1IdWhZZElP?=
 =?utf-8?B?MWtOWTdrK2tHdER2cmNvd3IrbFNMZjFWd2NXUEFZblFQeVNiOEZYTUpkYklh?=
 =?utf-8?B?a3MxbWQ0YTVCQ2Rmd0c4M3k3N3dzeXNWZUNLUHdHcmMxek15WmxWeVA4V1FK?=
 =?utf-8?B?NWJrNUhSYXlPbnNyR0p5ZjN1VlRzUFczMk1QUGlrZjROMG5GbklhMjB6aExt?=
 =?utf-8?B?MTRyNXBuSDJDdG41WlNDK1JmcW9TUEZ2N1dUZWxoSGUreSszckJrTUhOeXpF?=
 =?utf-8?B?MVU0Z1N4NTRVTEtXY2ZDTXNEMXMyVUh1THNpSUFjUGZPaWEwTTUrMU50cVFG?=
 =?utf-8?B?anlROXpzTVVGUnd6d0hTNCtVSFNvRHJ4Z2hDM1VKUXZpVXBaOWhTMkdacXlr?=
 =?utf-8?B?UVdKRjlzMUp6d0FsZzJVVU1xc01VUjRxRE1qZkc5aUt5MUZoYjFNaVJmdUZY?=
 =?utf-8?B?bjhVcDBaWEFjdUVEOGpmRWFxK2tyRy9XSXZDVEN3a0VFTHF5d2h5Mmp4R0x6?=
 =?utf-8?B?ZDhaTVFINFY3NDE5WkpOUStrejdSdTVLMms2NXIyNGozRnozaG4ySjRvakhY?=
 =?utf-8?B?TXB4NCtDSUZHcDIzOVJFZTJSTDVmaytHNjQ4YmY1NExlQXJJcitjRU1QM1Fj?=
 =?utf-8?B?UWhIOGtJTUpNWlVmVlVWbWRRT2FrNTBRN2QvbjZKOGhSdTVRREhBOWtHZ2lw?=
 =?utf-8?B?UmVSaWZDNGluNEl6bEJGNnNCM0VHRzA1c1RId2tDSmpOdUVDMVExUGtrSXBZ?=
 =?utf-8?B?d0xKSTdBWHRnSncxUlhKVTVSVXJmUVYxU3Y0MWlrVGpaUElzZFNSVEtrYk9K?=
 =?utf-8?B?Z2Z0bGVpTSthZ3hDQ0xrNVFDV3hFSXJPSmNHSEVNQnY1aFhSWTNmZzEwdTNr?=
 =?utf-8?B?b0VDVVNlNDhQZ2tIdU4vQnU4cW8wc3pta2tGeE9ZekJKdnc2T1hlajhTNG5w?=
 =?utf-8?B?YkhIdW9KM1dRNnZsNU9DRWVGblRpQ25EOUE3UTI4dDdjeWV3a2lCc0QyMGYz?=
 =?utf-8?B?cVR6blFtVjd4MlA4UWdqS0FQNDVRRmdsa3dFUHZvK1A4ckIrOW1vd1BWREp3?=
 =?utf-8?B?anNTSGIwcGVBUEtQdnoyZ3hTY3UyS1BJbzErekswOHlhZmIyOGZtZTd0L1Bh?=
 =?utf-8?B?U0R1N2oyMGJLbEVvbnp3RVlNUjhpYTJwZjB1SWlOSk1qR2VqNkhOQk5TQ3ND?=
 =?utf-8?B?UmtBVnp6enUvZ2YyM2trNVJNS09QUUFrQ014aS9TMTMwZHdsaWR1N1BPaEFh?=
 =?utf-8?B?Y3UyN3A4T0VOU1hMUXdLdlpYVWpHMkFaVkFId0JuYzNBQlhsSkowMy81OERZ?=
 =?utf-8?B?NDNqTUhBOENoYTFPdHF6WFpZdk9KVE51SThYMUFSdHZNdWxZQjRlMG1xblJa?=
 =?utf-8?B?VWR6dHdiMTFPdW9iVWV1ejNoRHc2d3FrNHlGVDdUcnNhNGNrL2JTTzk5aXpq?=
 =?utf-8?B?QlJPeXFLQjFuRGIwcDZ3YldiQlNYWU5iVUtVeFJRSUQwZnlYc0hrOG5UcDdv?=
 =?utf-8?B?cXB1NlNBSUhHODhDMXc5dk80MERjVUZtQ1hxTndRWlNrMEQwQjdJRU1Bd1FU?=
 =?utf-8?B?anFYR2lsdXZYMDFJR3N3eU9QQUVBOHNTV29FaWVKWnFkNGw3YVgxYzI5WEYw?=
 =?utf-8?B?ZDF1bkFGaFFidUM3SmxHR0JYNmVpRFFvRTZXMUcwZUFuNnZLTXNnb2Yvd01Z?=
 =?utf-8?Q?ten0ruog4vDA0jA7r2qTJOvUZpPLp25lomDCVU/6fjLQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 049dcbe6-35ad-4c8c-4129-08db516a981c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 15:24:06.4924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qTzwI2bPKvxR2k3lyXN3NEs/pbpIRTx1KEyrXxK4/Hr9V2v17YBFnhyuY4Pwt7EDxDR8AzHUAIliByZK6/1egA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6639
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


On 5/10/23 09:47, Shyam Sundar S K wrote:
> At times, when the mode transitions fail to happen, the current
> driver does not give enough debug information on why the transition
> failed or the default preset values did not load. Having an on-demand
> logs guarded by CONFIG would be helpful in such cases.
>
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v4:
>   - Remove extra space as pointed by Ilpo.
>
> v3:
>   - Based on review-hans branch
>   - Address Ilpo's review remarks
>   - use the right format specifiers while printing the data
>
> v2:
>   - Based on review-hans branch
>   - Drop extra CONFIG item based on feedback from Hans
>
>   drivers/platform/x86/amd/pmf/auto-mode.c | 23 +++++++++++++++++++++++
>   drivers/platform/x86/amd/pmf/cnqf.c      | 19 +++++++++++++++++++
>   2 files changed, 42 insertions(+)
>
> diff --git a/drivers/platform/x86/amd/pmf/auto-mode.c b/drivers/platform/x86/amd/pmf/auto-mode.c
> index 64425201d353..02ff68be10d0 100644
> --- a/drivers/platform/x86/amd/pmf/auto-mode.c
> +++ b/drivers/platform/x86/amd/pmf/auto-mode.c
> @@ -179,11 +179,34 @@ void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t t
>   			config_store.transition[i].applied = false;
>   			update = true;
>   		}
> +
> +#ifdef CONFIG_AMD_PMF_DEBUG
> +		dev_dbg(dev->dev, "[AUTO MODE] average_power : %d mW mode: %s\n", avg_power,
> +			state_as_str(config_store.current_mode));
> +
> +		dev_dbg(dev->dev, "[AUTO MODE] time: %lld ms timer: %u ms tc: %u ms\n",
> +			time_elapsed_ms, config_store.transition[i].timer,
> +			config_store.transition[i].time_constant);
> +
> +		dev_dbg(dev->dev, "[AUTO MODE] shiftup: %u pt: %u mW pf: %u mW pd: %u mW\n",
> +			config_store.transition[i].shifting_up,
> +			config_store.transition[i].power_threshold,
> +			config_store.mode_set[i].power_floor,
> +			config_store.transition[i].power_delta);
> +#endif
>   	}
>   
>   	dev_dbg(dev->dev, "[AUTO_MODE] avg power: %u mW mode: %s\n", avg_power,
>   		state_as_str(config_store.current_mode));
>   
> +#ifdef CONFIG_AMD_PMF_DEBUG
> +	dev_dbg(dev->dev, "[AUTO MODE] priority1: %u priority2: %u priority3: %u priority4: %u\n",
> +		config_store.transition[0].applied,
> +		config_store.transition[1].applied,
> +		config_store.transition[2].applied,
> +		config_store.transition[3].applied);
> +#endif
> +
>   	if (update) {
>   		for (j = 0; j < AUTO_TRANSITION_MAX; j++) {
>   			/* Apply the mode with highest priority indentified */
> diff --git a/drivers/platform/x86/amd/pmf/cnqf.c b/drivers/platform/x86/amd/pmf/cnqf.c
> index 35af7c18f600..539b186e9027 100644
> --- a/drivers/platform/x86/amd/pmf/cnqf.c
> +++ b/drivers/platform/x86/amd/pmf/cnqf.c
> @@ -175,6 +175,13 @@ int amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_l
>   		config_store.trans_param[src][i].count++;
>   
>   		tp = &config_store.trans_param[src][i];
> +
> +#ifdef CONFIG_AMD_PMF_DEBUG
> +		dev_dbg(dev->dev, "avg_power: %u mW total_power: %u mW count: %u timer: %u ms\n",
> +			avg_power, config_store.trans_param[src][i].total_power,
> +			config_store.trans_param[src][i].count,
> +			config_store.trans_param[src][i].timer);
> +#endif
>   		if (tp->timer >= tp->time_constant && tp->count) {
>   			avg_power = tp->total_power / tp->count;
>   
> @@ -195,6 +202,18 @@ int amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_l
>   	dev_dbg(dev->dev, "[CNQF] Avg power: %u mW socket power: %u mW mode:%s\n",
>   		avg_power, socket_power, state_as_str(config_store.current_mode));
>   
> +#ifdef CONFIG_AMD_PMF_DEBUG
> +	dev_dbg(dev->dev, "[CNQF] priority1: %u priority2: %u priority3: %u\n",
> +		config_store.trans_param[src][0].priority,
> +		config_store.trans_param[src][1].priority,
> +		config_store.trans_param[src][2].priority);
> +
> +	dev_dbg(dev->dev, "[CNQF] priority4: %u priority5: %u priority6: %u\n",
> +		config_store.trans_param[src][3].priority,
> +		config_store.trans_param[src][4].priority,
> +		config_store.trans_param[src][5].priority);
> +#endif
> +
>   	for (j = 0; j < CNQF_TRANSITION_MAX; j++) {
>   		/* apply the highest priority */
>   		if (config_store.trans_param[src][j].priority) {
