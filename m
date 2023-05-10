Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FE4EC7EE22
	for <platform-driver-x86@archiver.kernel.org>; Wed, 10 May 2023 15:23:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237462AbjEJPX6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 10 May 2023 11:23:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236355AbjEJPX5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 10 May 2023 11:23:57 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2057.outbound.protection.outlook.com [40.107.95.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CD482D68
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 May 2023 08:23:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PXLVKlhd+TKX6TE3Ra6or8qzqnSUI2rF/HHkntOty3tr3nggDXUoN1DE5DAboCXFCaw/P6RfgIC2WVN+ontXK5SCyn6Zr1y1Te0uOa11HD7UMzCg20Qked3FVpg4+v0Aja38XbjLBq0v9L30APGboxRerdnybD1lL6x0wcSJlr7XnPNnL0m6j65wYtnl7OhigAKRwStXO2LSApXLKYSzCwvSAdX4RnlFriGxOtXAdO0DlEvtn58bxJTbLo4ufFPRiHvz/VWEBSgratHuNMsMvKulJIIrXseWfvHhFs3DuENHkFUqxCEGWdU6WyivjwmFzRdvNd8aie1qu8Zr3TZwbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yZO6FFH29sxbqzU8bYnQrije929uVSBW/VfTrSoRQnY=;
 b=I8Y6ujysgKMMzPN4K98BLLYz2IR15eoBTtlz4leNOW4L+eVPXOquWpjb+zhG8yFj+DTX176bcHBwyyGX/NcRCpDQlxOTYZpyjoSEHa46qwS8ZQdDZ/iWBCFJthnlt2OG5+h6/klpa7f4lRb2+0pyTpWuoW624q6E5TnRYLn52PCFU7HWXQESCQLpUGZoAYVeiH9hE9TkZj/PE6h8a07SPitcCMwdcCMV/hqiLltyn9DPi7zkk1XRhPuWfgDn7QgML/7fgbDHrzUa02gB/nrKKgJvAL94FM2fdPgGSuM0Our8cL05cPfsiavVifHjRvzZWlu3EBer2SFFt3WT1LCsAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yZO6FFH29sxbqzU8bYnQrije929uVSBW/VfTrSoRQnY=;
 b=5ImF56ECW7doWz+k2c2OHMB4iefvQXLc96q+2lpqSCA3b0hHrWZ2A3kb2yNZSHZKIupRvvECqp1jhhxoyMLtFhO5cVXzFLqJbWA6tFY5SDNF/TMsdFNr8z5pdccr73f/9sgTilbLPf8NqM+iGNIIUjiJ1ULsEBM+eVS8Kp9YM4U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CY8PR12MB7659.namprd12.prod.outlook.com (2603:10b6:930:9f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Wed, 10 May
 2023 15:23:50 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3f45:358e:abba:24f5]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3f45:358e:abba:24f5%3]) with mapi id 15.20.6363.032; Wed, 10 May 2023
 15:23:50 +0000
Message-ID: <be84e061-5660-3fc9-7fcf-ff8b2cefaa1d@amd.com>
Date:   Wed, 10 May 2023 10:23:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 1/2] platform/x86/amd/pmf: Add PMF acpi debug support
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
        markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20230510144751.66601-1-Shyam-sundar.S-k@amd.com>
From:   Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20230510144751.66601-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0198.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::23) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CY8PR12MB7659:EE_
X-MS-Office365-Filtering-Correlation-Id: a8060126-15f3-430d-3d09-08db516a8e61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZVuRMLVRG43PGuSxKWYPrliGrQjb8XDh2XmmbXyShsOqjY4gg3yfhknHZ8P4ks/gih4oY9J2GJBiKenmJ4UGg1bJntHWNtcd3K5+6WhAAQJPhUkYQLq3QWUK6D9eqV2deiP9t2RoYCxLrrsC3T2pdKAhBl9R5J4RVp4pJc8qaQW9WJcz0UF3E7yG4Na/fb5wlFpdhIHTaMcsZaSBJzXKR24Z28tN/Q4gtwNpssb9w2D1QZGT+kPPH9uOBR4qm4gGWHjPLKUyMGaLAKZMHdLCjsw3TRd2lOOLZM4ICNOpsO2ID6v8Yc/ARvBqxAN6+ZSyBdTQ6TJZ207H0i8mZzRByc9tM1f9xOKwiFrIm5m5uWJXWXoeD4YKXrxc9afniOCktRhZ0tKTUaEbNCML8u19Z3PXC7zBboPP/GwCY+HNNf5Q7Unf/Hug0kZXbfUcoQybKdXSsRvqwKOdm8z8+7IlE0V9vHtU69rAhUs8nNTclc8u5wOOYTO7z51tNqyAKZbSkLCIk/yyicrDFfzRFrJ2PwoHxAbSSoEZAFjGAwHxlV+qAtjtzJ5HW0GtUTQP5vQtBwFiRFfr3N7p/Kc7bGsPNO6nxgLPWWgJdX7kV7mWKczFZFw6QUutdntP7bxPDQqd9snGseKwMppnsVyhVBiGqA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(136003)(366004)(39860400002)(451199021)(4326008)(66946007)(66556008)(2616005)(66476007)(8936002)(8676002)(6512007)(38100700002)(53546011)(6506007)(186003)(2906002)(6666004)(36756003)(6486002)(30864003)(41300700001)(86362001)(478600001)(31696002)(5660300002)(44832011)(45080400002)(316002)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGJBeDRFZnhZOTJaM1QxM0tuV2tzT2FVS3VmcVBOOTY3YkYvcnZLbmw3THRL?=
 =?utf-8?B?VkpMSUdEa1dzOUpDWmNvRW9LUzJFMzB6dFVKa21DVmZ4MndpY2ZML2pxeHNt?=
 =?utf-8?B?Q3M0UFhCcml2Yi9pUFQzUXAyeWE4VkM5OEhWWHl1OU5VdFZJa1U1aU9RQXBL?=
 =?utf-8?B?UitGV1ZCZkxJeXhMOEZpbWtuUEI3SjJMdHJMRW5Sa2llckx5Z0hWd09POUs3?=
 =?utf-8?B?UitOb0hXV2NCTHBORTR1dVo2THpKR1M3OFFuWjVwVE9rc1MxMmpueXBGbGdP?=
 =?utf-8?B?VFlMRlhUZ3dsWm9qQ0xWakJhS1NONmIwc0Nzd2tHdW1QdXBaU1JKbUtnazBv?=
 =?utf-8?B?UldLeHRHMEx6VDNDeXhXb2plZTB6bDQxSmh1SnhPL05lS0tPODhtSEpoemNN?=
 =?utf-8?B?ZTN2a1dKVHdmZnJsSDFqR09GakwyS1E4ZWZQVHJrSVBMZDZBOEpwK1g4UE1E?=
 =?utf-8?B?UTVmZHNqTXlnUEwvTjJaaldtOSt2RXpCWndTODExS3BPekNYdWpMZUVYMUdi?=
 =?utf-8?B?OVlCeDFVVXZYaUJsbm1GTytxc0RZNVVPWllXenAzUE81VmE0ckdKZmRadi9N?=
 =?utf-8?B?ck9GSk9ubFkxQ3d5YjdKSkZHeCszWFRIWmZzV3p5a0hBS1pqeWRkRXhlZUpP?=
 =?utf-8?B?ME9DamlFOHRpQkE3V2FlZG1JcTVhQnl4WUQ2US9FcmRxUzR4eEtBWDArUWE2?=
 =?utf-8?B?VUNyTk5aK24yaHY2aCtFaGhDTktPMWNOelpja3lmSDhHemJuWE1ZbEsvMXd4?=
 =?utf-8?B?Z25yZk1TMWxVcVpKVkJPQW9VQnZmVG13c2Y2SWtNeGdoOGJZZ0JqTzFhZUJa?=
 =?utf-8?B?NDJFU2tBekRuQy9oalhCem0xQitiWUkzeC9TazFtbFlnYlNMV1N0Ny82cWE2?=
 =?utf-8?B?WlFpWVFKK2UxNmVoUDd1L0VhTjNNeEQ0UHFLU012S3Rtbm5aa2ozQ1hEV2Zw?=
 =?utf-8?B?dWpPQmV0Y2lIbjUvYngybnR1dEs3dG5pVzNCVjdreVBJMU1NMjdFcEhHUnJI?=
 =?utf-8?B?cjA0OFY3eEYzc3lSVE5LOU5RT3EvT3M2bGpVUXZxbk0vQVJhS3F1ZlRjYjcx?=
 =?utf-8?B?RTk3TG9McDZhQzZBdjFHcVM5anJhY0xiYUJBQWtrNjZaREY0b3dJZ3lBajJG?=
 =?utf-8?B?WXFoM2VlTzBGNks2K3lROXJxelRQNHhtSERmM1B0b1kwcjZsdFVNZjl0aitI?=
 =?utf-8?B?ckdtdW5MQjBUdEZpcG40Tmh3NnhUZHRPOE5mTzRSdkFPWTE5NzhZTE12M2o2?=
 =?utf-8?B?V1pVaVVITnd1V0s3a1c5Wk1zbFJMQkpGTVBQai80THEycmtMMTBMNGZBZVgx?=
 =?utf-8?B?bEhuME02QXo1UWRCNWRqRllTTEtnNkxCZ0hSaGhxbUpYQnBKUElWOFVkaHBv?=
 =?utf-8?B?YWw2VXVKejBzWDNpZTdZV1hnRUJIRU9UL2d5TzRNUnBTQU5TeWF5OUR0NlVZ?=
 =?utf-8?B?bDljbHczUUdEV045cGJSdjJVNEhLSytkTmpLbFJnM2hDOURXN3dEa3dWcWc3?=
 =?utf-8?B?QTVKZ1BxUXZISHJmOUppMGxnSW80VllYZUdFclVpQWlESFNSNkJ0bUhuaFZz?=
 =?utf-8?B?SnlWRitWUzBON2RvQ00wWWJyMStnQy9jSXhlWjRzV1VOVUd3eitsd1phZGhM?=
 =?utf-8?B?dVMybFAxSFhhUjhTdWJIMTNrbjZjNXJFYXNzaGhsMWRCcC9EaldTcXQwdTBz?=
 =?utf-8?B?dXZQSFMrclk0a21keFhINSttT0RVRjNKbmQxOVdBN2EwYkh2ZlFndnJrYm0w?=
 =?utf-8?B?RUd3T0F5cjVzKzJSMVlSbXRPbzhWTTJka2d0NS9paTF0dFVIbkl1WXNCd09B?=
 =?utf-8?B?VHRuODZ5enV4dk4ramtvK0EvSXRYemtWMVVQZUUydVE3U3NrNW44VnBNZTk1?=
 =?utf-8?B?QXAwWVlRSUVPc3hBOW5jUHlWQ3A2RFI5aC9tMVd2R2ROaUVERm5mQ1lOb3d3?=
 =?utf-8?B?bS9pUUo0bHNhNE5xc1hseHhmRjhJenFsRkxEVzRnRURJVzFmd21vQmRHRDZH?=
 =?utf-8?B?S1JMcFptbEVGdlU4S1ArSUdCOG9aM0lRbm53RW5vZWtEdUtHbWh5QjR6UkhJ?=
 =?utf-8?B?UW1vL3BqdURMTW9Sa1ppU1U0R1FVYTV4QnQxbGlTc2RNNmhpaDlrb2x4cGsx?=
 =?utf-8?B?cDVUM2pmMEhoRlJZWE1rZXNmZWxCYUMvdFQ2SU52WmFzaWkvcExYaGdjVDRt?=
 =?utf-8?Q?iYZfgta1orYYKqNnFLeYXPOcZfERgLo6p7LR3VLbxAj5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8060126-15f3-430d-3d09-08db516a8e61
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 15:23:50.1749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6lp7cwOpp5FwuVJSDOWjZ0rvlRmm3IU3kOKHD3n8LA/DhWBZKGoJFjNGyIA5WtsskPgYneHbydNvynlFVUHAjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7659
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


On 5/10/23 09:47, Shyam Sundar S K wrote:
> PMF driver maintains an internal config store for each PMF feature
> after the feature init happens. Having a debug mechanism to triage
> in-field issues w.r.t to mode switch not happening based on the OEM
> fed values via the ACPI method to PMF driver is becoming the need of
> the hour. Add support to get more ACPI debug spew guarded by a CONFIG.
>
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v4:
>   - No change
>
> v3:
>   - Based on review-hans branch
>   - Address Ilpo's review remarks
>   - use the right format specifiers while printing the data
>
> v2:
>   - Based on review-hans branch
>   - use a pointer and not create a local copy while dumping
>   - use dummy #else blocks
>
>   drivers/platform/x86/amd/pmf/Kconfig     |  11 +++
>   drivers/platform/x86/amd/pmf/auto-mode.c | 120 +++++++++++++++++++++++
>   drivers/platform/x86/amd/pmf/cnqf.c      |  56 +++++++++++
>   drivers/platform/x86/amd/pmf/sps.c       |  55 +++++++++++
>   4 files changed, 242 insertions(+)
>
> diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
> index d87986adf91e..3064bc8ea167 100644
> --- a/drivers/platform/x86/amd/pmf/Kconfig
> +++ b/drivers/platform/x86/amd/pmf/Kconfig
> @@ -16,3 +16,14 @@ config AMD_PMF
>   
>   	  To compile this driver as a module, choose M here: the module will
>   	  be called amd_pmf.
> +
> +config AMD_PMF_DEBUG
> +	bool "PMF debug information"
> +	depends on AMD_PMF
> +	help
> +	 Enabling this option would give more debug information on the OEM fed
> +	 power setting values for each of the PMF feature. PMF driver gets this
> +	 information after evaluating a ACPI method and the information is stored
> +	 in the PMF config store.
> +
> +	 Say Y here to enable more debug logs and Say N here if you are not sure.
> diff --git a/drivers/platform/x86/amd/pmf/auto-mode.c b/drivers/platform/x86/amd/pmf/auto-mode.c
> index 96a8e1832c05..64425201d353 100644
> --- a/drivers/platform/x86/amd/pmf/auto-mode.c
> +++ b/drivers/platform/x86/amd/pmf/auto-mode.c
> @@ -15,6 +15,100 @@
>   static struct auto_mode_mode_config config_store;
>   static const char *state_as_str(unsigned int state);
>   
> +#ifdef CONFIG_AMD_PMF_DEBUG
> +static void amd_pmf_dump_auto_mode_defaults(struct auto_mode_mode_config *data)
> +{
> +	struct auto_mode_mode_settings *its_mode;
> +
> +	pr_debug("Auto Mode Data - BEGIN\n");
> +
> +	/* time constant */
> +	pr_debug("balanced_to_perf: %u ms\n",
> +		 data->transition[AUTO_TRANSITION_TO_PERFORMANCE].time_constant);
> +	pr_debug("perf_to_balanced: %u ms\n",
> +		 data->transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].time_constant);
> +	pr_debug("quiet_to_balanced: %u ms\n",
> +		 data->transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].time_constant);
> +	pr_debug("balanced_to_quiet: %u ms\n",
> +		 data->transition[AUTO_TRANSITION_TO_QUIET].time_constant);
> +
> +	/* power floor */
> +	pr_debug("pfloor_perf: %u mW\n", data->mode_set[AUTO_PERFORMANCE].power_floor);
> +	pr_debug("pfloor_balanced: %u mW\n", data->mode_set[AUTO_BALANCE].power_floor);
> +	pr_debug("pfloor_quiet: %u mW\n", data->mode_set[AUTO_QUIET].power_floor);
> +
> +	/* Power delta for mode change */
> +	pr_debug("pd_balanced_to_perf: %u mW\n",
> +		 data->transition[AUTO_TRANSITION_TO_PERFORMANCE].power_delta);
> +	pr_debug("pd_perf_to_balanced: %u mW\n",
> +		 data->transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].power_delta);
> +	pr_debug("pd_quiet_to_balanced: %u mW\n",
> +		 data->transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].power_delta);
> +	pr_debug("pd_balanced_to_quiet: %u mW\n",
> +		 data->transition[AUTO_TRANSITION_TO_QUIET].power_delta);
> +
> +	/* skin temperature limits */
> +	its_mode = &data->mode_set[AUTO_PERFORMANCE_ON_LAP];
> +	pr_debug("stt_apu_perf_on_lap: %u C\n",
> +		 its_mode->power_control.stt_skin_temp[STT_TEMP_APU]);
> +	pr_debug("stt_hs2_perf_on_lap: %u C\n",
> +		 its_mode->power_control.stt_skin_temp[STT_TEMP_HS2]);
> +	pr_debug("stt_min_limit_perf_on_lap: %u mW\n", its_mode->power_control.stt_min);
> +
> +	its_mode = &data->mode_set[AUTO_PERFORMANCE];
> +	pr_debug("stt_apu_perf: %u C\n", its_mode->power_control.stt_skin_temp[STT_TEMP_APU]);
> +	pr_debug("stt_hs2_perf: %u C\n", its_mode->power_control.stt_skin_temp[STT_TEMP_HS2]);
> +	pr_debug("stt_min_limit_perf: %u mW\n", its_mode->power_control.stt_min);
> +
> +	its_mode = &data->mode_set[AUTO_BALANCE];
> +	pr_debug("stt_apu_balanced: %u C\n", its_mode->power_control.stt_skin_temp[STT_TEMP_APU]);
> +	pr_debug("stt_hs2_balanced: %u C\n", its_mode->power_control.stt_skin_temp[STT_TEMP_HS2]);
> +	pr_debug("stt_min_limit_balanced: %u mW\n", its_mode->power_control.stt_min);
> +
> +	its_mode = &data->mode_set[AUTO_QUIET];
> +	pr_debug("stt_apu_quiet: %u C\n", its_mode->power_control.stt_skin_temp[STT_TEMP_APU]);
> +	pr_debug("stt_hs2_quiet: %u C\n", its_mode->power_control.stt_skin_temp[STT_TEMP_HS2]);
> +	pr_debug("stt_min_limit_quiet: %u mW\n", its_mode->power_control.stt_min);
> +
> +	/* SPL based power limits */
> +	its_mode = &data->mode_set[AUTO_PERFORMANCE_ON_LAP];
> +	pr_debug("fppt_perf_on_lap: %u mW\n", its_mode->power_control.fppt);
> +	pr_debug("sppt_perf_on_lap: %u mW\n", its_mode->power_control.sppt);
> +	pr_debug("spl_perf_on_lap: %u mW\n", its_mode->power_control.spl);
> +	pr_debug("sppt_apu_only_perf_on_lap: %u mW\n", its_mode->power_control.sppt_apu_only);
> +
> +	its_mode = &data->mode_set[AUTO_PERFORMANCE];
> +	pr_debug("fppt_perf: %u mW\n", its_mode->power_control.fppt);
> +	pr_debug("sppt_perf: %u mW\n", its_mode->power_control.sppt);
> +	pr_debug("spl_perf: %u mW\n", its_mode->power_control.spl);
> +	pr_debug("sppt_apu_only_perf: %u mW\n", its_mode->power_control.sppt_apu_only);
> +
> +	its_mode = &data->mode_set[AUTO_BALANCE];
> +	pr_debug("fppt_balanced: %u mW\n", its_mode->power_control.fppt);
> +	pr_debug("sppt_balanced: %u mW\n", its_mode->power_control.sppt);
> +	pr_debug("spl_balanced: %u mW\n", its_mode->power_control.spl);
> +	pr_debug("sppt_apu_only_balanced: %u mW\n", its_mode->power_control.sppt_apu_only);
> +
> +	its_mode = &data->mode_set[AUTO_QUIET];
> +	pr_debug("fppt_quiet: %u mW\n", its_mode->power_control.fppt);
> +	pr_debug("sppt_quiet: %u mW\n", its_mode->power_control.sppt);
> +	pr_debug("spl_quiet: %u mW\n", its_mode->power_control.spl);
> +	pr_debug("sppt_apu_only_quiet: %u mW\n", its_mode->power_control.sppt_apu_only);
> +
> +	/* Fan ID */
> +	pr_debug("fan_id_perf: %lu\n",
> +		 data->mode_set[AUTO_PERFORMANCE].fan_control.fan_id);
> +	pr_debug("fan_id_balanced: %lu\n",
> +		 data->mode_set[AUTO_BALANCE].fan_control.fan_id);
> +	pr_debug("fan_id_quiet: %lu\n",
> +		 data->mode_set[AUTO_QUIET].fan_control.fan_id);
> +
> +	pr_debug("Auto Mode Data - END\n");
> +}
> +#else
> +static void amd_pmf_dump_auto_mode_defaults(struct auto_mode_mode_config *data) {}
> +#endif
> +
>   static void amd_pmf_set_automode(struct amd_pmf_dev *dev, int idx,
>   				 struct auto_mode_mode_config *table)
>   {
> @@ -140,6 +234,30 @@ static void amd_pmf_get_power_threshold(void)
>   	config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].power_threshold =
>   		config_store.mode_set[AUTO_PERFORMANCE].power_floor -
>   		config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].power_delta;
> +
> +#ifdef CONFIG_AMD_PMF_DEBUG
> +	pr_debug("[AUTO MODE TO_QUIET] pt: %u mW pf: %u mW pd: %u mW\n",
> +		 config_store.transition[AUTO_TRANSITION_TO_QUIET].power_threshold,
> +		 config_store.mode_set[AUTO_BALANCE].power_floor,
> +		 config_store.transition[AUTO_TRANSITION_TO_QUIET].power_delta);
> +
> +	pr_debug("[AUTO MODE TO_PERFORMANCE] pt: %u mW pf: %u mW pd: %u mW\n",
> +		 config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].power_threshold,
> +		 config_store.mode_set[AUTO_BALANCE].power_floor,
> +		 config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].power_delta);
> +
> +	pr_debug("[AUTO MODE QUIET_TO_BALANCE] pt: %u mW pf: %u mW pd: %u mW\n",
> +		 config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE]
> +		 .power_threshold,
> +		 config_store.mode_set[AUTO_QUIET].power_floor,
> +		 config_store.transition[AUTO_TRANSITION_FROM_QUIET_TO_BALANCE].power_delta);
> +
> +	pr_debug("[AUTO MODE PERFORMANCE_TO_BALANCE] pt: %u mW pf: %u mW pd: %u mW\n",
> +		 config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE]
> +		 .power_threshold,
> +		 config_store.mode_set[AUTO_PERFORMANCE].power_floor,
> +		 config_store.transition[AUTO_TRANSITION_FROM_PERFORMANCE_TO_BALANCE].power_delta);
> +#endif
>   }
>   
>   static const char *state_as_str(unsigned int state)
> @@ -262,6 +380,8 @@ static void amd_pmf_load_defaults_auto_mode(struct amd_pmf_dev *dev)
>   	/* set to initial default values */
>   	config_store.current_mode = AUTO_BALANCE;
>   	dev->socket_power_history_idx = -1;
> +
> +	amd_pmf_dump_auto_mode_defaults(&config_store);
>   }
>   
>   int amd_pmf_reset_amt(struct amd_pmf_dev *dev)
> diff --git a/drivers/platform/x86/amd/pmf/cnqf.c b/drivers/platform/x86/amd/pmf/cnqf.c
> index 4beb22a19466..35af7c18f600 100644
> --- a/drivers/platform/x86/amd/pmf/cnqf.c
> +++ b/drivers/platform/x86/amd/pmf/cnqf.c
> @@ -13,6 +13,61 @@
>   
>   static struct cnqf_config config_store;
>   
> +#ifdef CONFIG_AMD_PMF_DEBUG
> +static const char *state_as_str_cnqf(unsigned int state)
> +{
> +	switch (state) {
> +	case APMF_CNQF_TURBO:
> +		return "turbo";
> +	case APMF_CNQF_PERFORMANCE:
> +		return "performance";
> +	case APMF_CNQF_BALANCE:
> +		return "balance";
> +	case APMF_CNQF_QUIET:
> +		return "quiet";
> +	default:
> +		return "Unknown CnQF State";
> +	}
> +}
> +
> +static void amd_pmf_cnqf_dump_defaults(struct apmf_dyn_slider_output *data, int idx)
> +{
> +	int i;
> +
> +	pr_debug("Dynamic Slider %s Defaults - BEGIN\n", idx ? "DC" : "AC");
> +	pr_debug("size: %u\n", data->size);
> +	pr_debug("flags: 0x%x\n", data->flags);
> +
> +	/* Time constants */
> +	pr_debug("t_perf_to_turbo: %u ms\n", data->t_perf_to_turbo);
> +	pr_debug("t_balanced_to_perf: %u ms\n", data->t_balanced_to_perf);
> +	pr_debug("t_quiet_to_balanced: %u ms\n", data->t_quiet_to_balanced);
> +	pr_debug("t_balanced_to_quiet: %u ms\n", data->t_balanced_to_quiet);
> +	pr_debug("t_perf_to_balanced: %u ms\n", data->t_perf_to_balanced);
> +	pr_debug("t_turbo_to_perf: %u ms\n", data->t_turbo_to_perf);
> +
> +	for (i = 0 ; i < CNQF_MODE_MAX ; i++) {
> +		pr_debug("pfloor_%s: %u mW\n", state_as_str_cnqf(i), data->ps[i].pfloor);
> +		pr_debug("fppt_%s: %u mW\n", state_as_str_cnqf(i), data->ps[i].fppt);
> +		pr_debug("sppt_%s: %u mW\n", state_as_str_cnqf(i), data->ps[i].sppt);
> +		pr_debug("sppt_apuonly_%s: %u mW\n",
> +			 state_as_str_cnqf(i), data->ps[i].sppt_apu_only);
> +		pr_debug("spl_%s: %u mW\n", state_as_str_cnqf(i), data->ps[i].spl);
> +		pr_debug("stt_minlimit_%s: %u mW\n",
> +			 state_as_str_cnqf(i), data->ps[i].stt_min_limit);
> +		pr_debug("stt_skintemp_apu_%s: %u C\n", state_as_str_cnqf(i),
> +			 data->ps[i].stt_skintemp[STT_TEMP_APU]);
> +		pr_debug("stt_skintemp_hs2_%s: %u C\n", state_as_str_cnqf(i),
> +			 data->ps[i].stt_skintemp[STT_TEMP_HS2]);
> +		pr_debug("fan_id_%s: %u\n", state_as_str_cnqf(i), data->ps[i].fan_id);
> +	}
> +
> +	pr_debug("Dynamic Slider %s Defaults - END\n", idx ? "DC" : "AC");
> +}
> +#else
> +static void amd_pmf_cnqf_dump_defaults(struct apmf_dyn_slider_output *data, int idx) {}
> +#endif
> +
>   static int amd_pmf_set_cnqf(struct amd_pmf_dev *dev, int src, int idx,
>   			    struct cnqf_config *table)
>   {
> @@ -284,6 +339,7 @@ static int amd_pmf_load_defaults_cnqf(struct amd_pmf_dev *dev)
>   			return ret;
>   		}
>   
> +		amd_pmf_cnqf_dump_defaults(&out, i);
>   		amd_pmf_update_mode_set(i, &out);
>   		amd_pmf_update_trans_data(i, &out);
>   		amd_pmf_update_power_threshold(i);
> diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
> index bed762d47a14..0a4d0549ea03 100644
> --- a/drivers/platform/x86/amd/pmf/sps.c
> +++ b/drivers/platform/x86/amd/pmf/sps.c
> @@ -12,6 +12,60 @@
>   
>   static struct amd_pmf_static_slider_granular config_store;
>   
> +#ifdef CONFIG_AMD_PMF_DEBUG
> +const char *slider_as_str(unsigned int state)
> +{
> +	switch (state) {
> +	case POWER_MODE_PERFORMANCE:
> +		return "PERFORMANCE";
> +	case POWER_MODE_BALANCED_POWER:
> +		return "BALANCED_POWER";
> +	case POWER_MODE_POWER_SAVER:
> +		return "POWER_SAVER";
> +	default:
> +		return "Unknown Slider State";
> +	}
> +}
> +
> +const char *source_as_str(unsigned int state)
> +{
> +	switch (state) {
> +	case POWER_SOURCE_AC:
> +		return "AC";
> +	case POWER_SOURCE_DC:
> +		return "DC";
> +	default:
> +		return "Unknown Power State";
> +	}
> +}
> +
> +static void amd_pmf_dump_sps_defaults(struct amd_pmf_static_slider_granular *data)
> +{
> +	int i, j;
> +
> +	pr_debug("Static Slider Data - BEGIN\n");
> +
> +	for (i = 0; i < POWER_SOURCE_MAX; i++) {
> +		for (j = 0; j < POWER_MODE_MAX; j++) {
> +			pr_debug("--- Source:%s Mode:%s ---\n", source_as_str(i), slider_as_str(j));
> +			pr_debug("SPL: %u mW\n", data->prop[i][j].spl);
> +			pr_debug("SPPT: %u mW\n", data->prop[i][j].sppt);
> +			pr_debug("SPPT_ApuOnly: %u mW\n", data->prop[i][j].sppt_apu_only);
> +			pr_debug("FPPT: %u mW\n", data->prop[i][j].fppt);
> +			pr_debug("STTMinLimit: %u mW\n", data->prop[i][j].stt_min);
> +			pr_debug("STT_SkinTempLimit_APU: %u C\n",
> +				 data->prop[i][j].stt_skin_temp[STT_TEMP_APU]);
> +			pr_debug("STT_SkinTempLimit_HS2: %u C\n",
> +				 data->prop[i][j].stt_skin_temp[STT_TEMP_HS2]);
> +		}
> +	}
> +
> +	pr_debug("Static Slider Data - END\n");
> +}
> +#else
> +static void amd_pmf_dump_sps_defaults(struct amd_pmf_static_slider_granular *data) {}
> +#endif
> +
>   static void amd_pmf_load_defaults_sps(struct amd_pmf_dev *dev)
>   {
>   	struct apmf_static_slider_granular_output output;
> @@ -36,6 +90,7 @@ static void amd_pmf_load_defaults_sps(struct amd_pmf_dev *dev)
>   			idx++;
>   		}
>   	}
> +	amd_pmf_dump_sps_defaults(&config_store);
>   }
>   
>   void amd_pmf_update_slider(struct amd_pmf_dev *dev, bool op, int idx,
