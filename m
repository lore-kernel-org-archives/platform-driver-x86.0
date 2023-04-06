Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AD8FC761A6
	for <platform-driver-x86@archiver.kernel.org>; Thu,  6 Apr 2023 16:51:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238984AbjDFQvq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 6 Apr 2023 12:51:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239616AbjDFQvo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 6 Apr 2023 12:51:44 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2087.outbound.protection.outlook.com [40.107.94.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4C3719C
        for <platform-driver-x86@vger.kernel.org>; Thu,  6 Apr 2023 09:51:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dttpFzyx7fHv8RpFbe1NGviXSd1IgGBNq6eKLSkggK+prbW2fTFanq3xV0CxTJpuP3r7FMZZDp6kgQ39YgZkuWBeW6FqlldCYhaw9Z8RxpGwrj115Vl5PM7Nn8LEzW7rjO57oHDvSHjp8NArmkND4Ugs1pOEzOQSEMBk4dxvuYoYfmDj8U1gHL3p+1PUIB2WQi7yCrEhZECh4JwlgK3k9uLDsN4zzB6FaWx+nteDx3CAq790DW7BSZAIVTpGeyOzwT4uPqUcckQQDzvkOt1VhSPZWgl9+wSTbIH5QdVMsHqQ9bSIk+//SltVh+ErkrJmxS+j1DWrhvs1SFt3JpoaeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YN0shEA/6bFgtAtgjHa1oYEDf0fq9WOuNL6BF1Sj1lc=;
 b=IQXYxOSKpN456gMfXNubmCDjMmQ57zXmYmJWuxMaOe+kMHLZ+BPKicY/bMWzpvT3YOhVDOvB8m47jkcY8qMrNETkrPVDp6tzjw4fEIUjw66ALqWqWIOvSYECYf8x8ZCV6FOpD+OYGG6X63gikY4Edcy0qxHd1iM92nt3WOkeygxkrNtkBTyfVlnuA6CeaaqKIhfvkmT9sMDk26MQJeTBLtmm0J6oEllQl1G5vlr25tl+bn2SwA0DR2X8wP9ZLa63nDtYuvccFPPdFYIgk1yEqqxuKzBFpFAPlsi2WZwYjymU1+bpUiw7ZXEZzVNmPGhAIH4aW03ENnxzgFzs9OWwNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YN0shEA/6bFgtAtgjHa1oYEDf0fq9WOuNL6BF1Sj1lc=;
 b=FqfMf77PfhPb318AP22crJHmqbogHcqtRYdUeSFmbnchqWx16yExYo4SiVWxNWz+H8UnyBDRrgpTbLK7nLkMDEuB3/842Rih+jfALn/X0OC8vOL4Fx0bF5ozK8b8Lb4ZorZkwQeEncN6iMCztsWYywr6uma1WeriJ5QOYmNCXSg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ0PR12MB5469.namprd12.prod.outlook.com (2603:10b6:a03:37f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Thu, 6 Apr
 2023 16:51:40 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f4d:82d0:c8c:bebe]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f4d:82d0:c8c:bebe%2]) with mapi id 15.20.6254.035; Thu, 6 Apr 2023
 16:51:40 +0000
Message-ID: <608f08ef-edfc-0132-02ba-ce96f34728c1@amd.com>
Date:   Thu, 6 Apr 2023 11:51:38 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 2/3] platform/x86/amd/pmf: Add PMF debug facilities
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
        markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20230406164807.50969-1-Shyam-sundar.S-k@amd.com>
 <20230406164807.50969-3-Shyam-sundar.S-k@amd.com>
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <20230406164807.50969-3-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0200.namprd03.prod.outlook.com
 (2603:10b6:610:e4::25) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ0PR12MB5469:EE_
X-MS-Office365-Filtering-Correlation-Id: f9635e62-826c-4a5d-d80c-08db36bf319e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9FYq7hIRZG1d9JWTVJSrKmlVhbEvhr5o9og2RxGZxN3WvNGRFLhnQeuoze3XE/Ui5HPq3onIXA/GQdGgUXprTM44bzYTOhuN6WPhhJ3yjo1Ltmx17LLbOFDAbGOzNPtu7mkKNbbmewR40hX7LsKrueRgM2ZCw3sY38dwni0J4hiLd/YR+bfdUKVHvfditd6Yh+NfMpl4X7Mv4QOs1yss5rT6bhttS+l5xyFCSwlTVe5mrGyYLitnPPrtMtuGxtzIyjBQTFU9gkYiG4XITxVo8+jOhEDMV9ju52lJhEIDN6kWl5U0AQPVzP6MwyuVb/DQhX4XGUvCPpgUv87CaHrjP5rHaujUyV82La5Fl4Cs0tPjf1UfH2JTDFWMOUI4aDjReIYu4MgpCBA+Omz9ICVhQ7AlMUF/vhvbdWguQmRrlgGK1t8hMz2rG/1fCtC7m81W90RNqMD1vzBNw8DB82WfFzjvNS4cUjFpcEIonQbxhx9iExSBhobUROWsPmeCSDFnjAUUWwFDN0etWMTiY5legr8acifIg0olonvQhwsBnfLDg9MInKuTQ0ZI2Gof+8OkCuyI0V01Knewf+rBd9Z5UrDaIgwx61691A3FnrzUI9qXan1r//MtYYcmtgUDHePpIXHhfFntcX+TTzn/MclTPg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(396003)(136003)(39860400002)(346002)(451199021)(6486002)(2906002)(83380400001)(478600001)(31686004)(6512007)(5660300002)(53546011)(41300700001)(6506007)(86362001)(8936002)(26005)(186003)(2616005)(316002)(8676002)(36756003)(4326008)(66556008)(66476007)(66946007)(38100700002)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WC9LYStzRkxGMSsvWEwzaW5lS0R3akdsd1BBSzNzd1duMGJyb1BXVVZ5K2Jo?=
 =?utf-8?B?NFQvVXlUamdITW1yanJaYVNDT0FUVkEvdE9CWTZKNHJKUDJPYlN3RlI1YWJB?=
 =?utf-8?B?VGlGdFQ5NlJjSWl5R3dITXYwbFlmZGcvUUp2eFBwcVlldXowTDdYTVVWSWR0?=
 =?utf-8?B?REFsbWZla1Rod2lyUjlIWTFZWVBkSGdWZ0FpTWw1eXptUkJDbkpKKzJyUlNy?=
 =?utf-8?B?UWpEZFM5cllFa29ycFpiZ0Q2c1RTdGtjMEl6b0Y5dFZjbWlYNXV2ajBJdGl2?=
 =?utf-8?B?cXhJQklEY3hheDRCRUdISjgwUFI0b2ppRmFRb1lqS3RTWHhBNFVIY2Y1azNF?=
 =?utf-8?B?cU15TkVmNjBOd20vM2s5V01mSWhNMGwrekkwZE9tWnMxcUZFN1JLNFEveld4?=
 =?utf-8?B?bE5rZFRCb3JyT0FITkpodURXaWJ1ZkJsbjhGeG1pYmNIUWduTGVUNlp5c0F0?=
 =?utf-8?B?WjM0UnhHcXNLSHBXdFVyeVZHM1FWN29CSk9DVFV0Q0JQcm1zUnpCbmNLRnN1?=
 =?utf-8?B?VmlsVnBmYUpuS3lTeXJ2alZLSW1LdTNvRjBhQ2dlVzFndXZwNTZ6ay9lWFBx?=
 =?utf-8?B?MmhCSGNlU001bDg5djFDT1lyMjRGQzl5STM5b21jOSs4eXgwbGNHRlkzS1VQ?=
 =?utf-8?B?UlRocGFRRjJ2Y0huRml6NDFab3JnU1M3anJNSTlvMDNGWEoxLzFycUllQVl3?=
 =?utf-8?B?OVRxOEFCdFpPUmp4b09XYzRMdlNycFFtVXQrekN2UWRYSk15ZmUyaC9CWTdU?=
 =?utf-8?B?MEdLSUtEZDgySVNzU0hSelI2aklDbndGWkNvekFJano2ZVJ4dWlYN28yUDJH?=
 =?utf-8?B?OXFHUWxFbndmenpVTlB5YnVNaDNqVG9TanBIZDFhcjFpbEpaeUpEZ0tOd3RG?=
 =?utf-8?B?Y0hpNS9aYVE3Mk9SQTY3dU43ZFQxd2g3MURzUlFsSnEvakJyb3NvTlJhYktv?=
 =?utf-8?B?czVXMG81bHhCWUJWRFE3eWJlZHJsSk4wcEw3c0xTSjJsbzdJUjBnN3pMMWh5?=
 =?utf-8?B?bEdBbk15Y0tsdVpjVzMzWXNyQyt6WnZWM0laKzl6aXBXVDF1dkJZMWkxeWFn?=
 =?utf-8?B?OUFiRm5oVGw2dC9wZzFNQzhiSVhSWCtlSUFQS3FHcCtqRkdZMWFFejRFNjZx?=
 =?utf-8?B?WG8raHAwYVpIaEd1VW1LV1gzMUxWZDhuVHlwN3duZ2lZdHVpUHhZV3lVY2Ra?=
 =?utf-8?B?b0hxQnBHM1MxbFJaSUxrQjBMRVpEMGdCU0dLTEYrbVFMdFFSVUdLZzJWT25h?=
 =?utf-8?B?V1ljM094cGRwOGdFZkNCaWpTa0t3S01BSUs0SDlIQjVhanNtbVNFUytBelBD?=
 =?utf-8?B?eldBcU5OWnRuVGw3WVJzTWtSMWdrZWI5S3YyRDlmTTE1TFZZWHlXbjFGWkc2?=
 =?utf-8?B?a1F5UGhWTGRab3p3WU9CallZZmlCS2NHcFJrdThiZ2twY01MV2dzdkk3THN4?=
 =?utf-8?B?UGwxeUdPNXBjME9xbVhFV013aGJoUVFNNGJrcGdjZjJqQVR3cFFHN2NCN3FF?=
 =?utf-8?B?U3p1L3FBc2ZsSi83ZzM4ays3cnJhSTBINUN6emVPZDFmdFUvMmhWQUxQdG9r?=
 =?utf-8?B?RE9tOXpjZ0dDdUlGVkMrMU5URUVvdGxVMHJQSHRrRUVDV0dDRDM2ZDNsMU1X?=
 =?utf-8?B?RTBTcWF0TWhGeUVpLzVGUzNxWDFKcVUzSjdIVGdISXIyWjNZdHNIcU5MTktI?=
 =?utf-8?B?MnJZYkE1MTlYeU5OVmVpM3JyaDdCK1FpV2dTK0ZJU2h3Y2kzRVUwZkFBNUJT?=
 =?utf-8?B?R1JJa1gydWlwTGNuTzhXOTVlbXluSzI4dmFJcUlKMVgxWXoyejlwaUs0Q0Nv?=
 =?utf-8?B?eVlvQ3VlZUZYenpQekFXVFNRVmxySHAxYkp4enNUN2ZjRlFzOW9jVHRJK1BL?=
 =?utf-8?B?dnZjSW5jc3R6eHFUMlhKMU0weHhFcDhXQTNQTE85REE5ZndrdEttbmcwWXBZ?=
 =?utf-8?B?VUVyam05dVNCS1VRNlpSY0FXL25lSWRrT1pHRGxNY3IzQTl2clgrT3NQd25P?=
 =?utf-8?B?RWlYRnoxcGhHd1lLYmZDaXQ1L1VCaXEwWTFlcDlJaktYUjVXSlEzVHVtc1Rj?=
 =?utf-8?B?RnFyRUYvbFlLN1lYNWk4RDRwb25sNDFsRlAvV2VnZ1U3cjBVclpSN3ZpSFBP?=
 =?utf-8?Q?lmhPc1gQ6KsQJ4woMrAubupTr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9635e62-826c-4a5d-d80c-08db36bf319e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 16:51:40.3624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 51fFkr4NL4+0JE9y9rRf6H+rJ8F+zC6KqlQwQnuvOxK+91SGezU89CJNCwHiAQ2AqCxdS0tPrfV1l9OxYCCnpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5469
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 4/6/2023 11:48, Shyam Sundar S K wrote:
> At times, when the mode transitions fail to happen, the current
> driver does not give enough debug information on why the transition
> failed or the default preset values did not load. Having an on-demand
> logs guarded by CONFIG would be helpful in such cases.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>   drivers/platform/x86/amd/pmf/Kconfig     | 10 ++++++++++
>   drivers/platform/x86/amd/pmf/auto-mode.c | 22 ++++++++++++++++++++++
>   drivers/platform/x86/amd/pmf/cnqf.c      | 19 +++++++++++++++++++
>   3 files changed, 51 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
> index f4fd764e55a6..7129de0fb9fb 100644
> --- a/drivers/platform/x86/amd/pmf/Kconfig
> +++ b/drivers/platform/x86/amd/pmf/Kconfig
> @@ -26,3 +26,13 @@ config AMD_PMF_ACPI_DEBUG
>   	 in the PMF config store.
>   
>   	 Say Y here to enable more debug logs and Say N here if you are not sure.
> +
> +config AMD_PMF_DEBUG_FACILITIES
> +	bool "PMF debug facilities"
> +	depends on AMD_PMF
> +	help
> +	 Enabling this option would give more debug information on the PMF interna
> +	 counters such as time constants, power thresholds, target modes and
> +	 power mode transitions of auto mode and CnQF features.

With the availability of dynamic debugging is there a lot of benefit to 
guarding all the new dev_dbg statements behind a config option?

Is it because of performance impact?

> +
> +	 Say Y here to enable logs and Say N here if you are not sure.
> diff --git a/drivers/platform/x86/amd/pmf/auto-mode.c b/drivers/platform/x86/amd/pmf/auto-mode.c
> index 777490fcf8b9..560379b5cda7 100644
> --- a/drivers/platform/x86/amd/pmf/auto-mode.c
> +++ b/drivers/platform/x86/amd/pmf/auto-mode.c
> @@ -177,11 +177,33 @@ void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t t
>   			config_store.transition[i].applied = false;
>   			update = true;
>   		}
> +
> +#ifdef CONFIG_AMD_PMF_DEBUG_FACILITIES
> +		dev_dbg(dev->dev, "[AUTO MODE] time_ms:%lld avg_power:%d mode:%s timer:%u tc:%d\n",
> +			time_elapsed_ms, avg_power,
> +			state_as_str(config_store.current_mode),
> +			config_store.transition[i].timer,
> +			config_store.transition[i].time_constant);
> +
> +		dev_dbg(dev->dev, "[AUTO MODE] shiftup:%d pt:%d pf:%d pd:%u\n",
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
> +#ifdef CONFIG_AMD_PMF_DEBUG_FACILITIES
> +	dev_dbg(dev->dev, "[AUTO MODE] priority1: %u, priority2: %u, priority3: %u, priority4: %u",
> +		config_store.transition[0].applied,
> +		config_store.transition[1].applied,
> +		config_store.transition[2].applied,
> +		config_store. transition[3].applied);
> +#endif
> +
>   	if (update) {
>   		for (j = 0; j < AUTO_TRANSITION_MAX; j++) {
>   			/* Apply the mode with highest priority indentified */
> diff --git a/drivers/platform/x86/amd/pmf/cnqf.c b/drivers/platform/x86/amd/pmf/cnqf.c
> index 4b9691cd592a..1f25016b3865 100644
> --- a/drivers/platform/x86/amd/pmf/cnqf.c
> +++ b/drivers/platform/x86/amd/pmf/cnqf.c
> @@ -174,6 +174,13 @@ int amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_l
>   		config_store.trans_param[src][i].count++;
>   
>   		tp = &config_store.trans_param[src][i];
> +
> +#ifdef CONFIG_AMD_PMF_DEBUG_FACILITIES
> +		dev_dbg(dev->dev, "avg_power:%d total_power:%d count:%d timer:%d\n", avg_power,
> +			config_store.trans_param[src][i].total_power,
> +			config_store.trans_param[src][i].count,
> +			config_store.trans_param[src][i].timer);
> +#endif
>   		if (tp->timer >= tp->time_constant && tp->count) {
>   			avg_power = tp->total_power / tp->count;
>   
> @@ -194,6 +201,18 @@ int amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_l
>   	dev_dbg(dev->dev, "[CNQF] Avg power: %u mW socket power: %u mW mode:%s\n",
>   		avg_power, socket_power, state_as_str(config_store.current_mode));
>   
> +#ifdef AMD_PMF_DEBUG_FACILITIES
> +	dev_dbg(dev->dev, "[CNQF] priority 1: %u, priority 2: %u, priority 3: %u",
> +		config_store.trans_param[src][0].priority,
> +		config_store.trans_param[src][1].priority,
> +		config_store.trans_param[src][2].priority);
> +
> +	dev_dbg(dev->dev, "[CNQF] priority 4: %u, priority 5: %u, priority 6: %u",
> +		config_store.trans_param[src][3].priority,
> +		config_store.trans_param[src][4].priority,
> +		config_store.trans_param[src][5].priority);
> +#endif
> +
>   	for (j = 0; j < CNQF_TRANSITION_MAX; j++) {
>   		/* apply the highest priority */
>   		if (config_store.trans_param[src][j].priority) {

