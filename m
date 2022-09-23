Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AAA6C6FA8B
	for <platform-driver-x86@archiver.kernel.org>; Fri, 23 Sep 2022 15:16:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230351AbiIWPQE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 23 Sep 2022 11:16:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232640AbiIWPP1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 23 Sep 2022 11:15:27 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2081.outbound.protection.outlook.com [40.107.95.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55831501B7
        for <platform-driver-x86@vger.kernel.org>; Fri, 23 Sep 2022 08:15:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nsAvjpGvaxIU2uJBoyaocBO8dKJfUq+mcR+6GgfK8fh7l58F55ku4UR8AJPRkKy7vR/8aykuM5Zom2XvKmwJeKYrvpfFK71Qm7RkBy8n7AehgtAtBKWOVM1sfr6pfVdtTaax8kGwtdGgZmJVy1FYWWFmPZZMEOqf3ttFbdllyFnKO93i03YzMuAVhjOFoInlpRpGV6R4K6grbYX6IVPejuWtzLObWvzNMQbnKiM+qOZ4tc24L/6WJAQPusmV9fRPZT1iU41rOsdUaDfZ+5m69nCVEl0jDuvu5ur+2i2boQNTgeghttM4f/CdgT9QQ2kfygoyrAkMS5f1tO3Ts/UMjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xL/neGj9ZHTfd/kKaYj3wKqFaF+lDGn3XXSZBoc9hMw=;
 b=cfAVtVUMYlDCUqJDfuTbOzIkDgImopByvYPKFmdyCmZmQgSg6N+lAdjt1nMszJC2ItfImTi5PLkoaqkP0siQX+XBXaGHDCNdNgPCLRU1tGG/0FqEtpCIJGr68byLqM5UiafBJ4LMVSFIpMHezXX8PpqBEDXmCTsuQKPfQ2jVJK8YhtaKwNraWMmuTdSZBWYWgFnQyv3Fw+nKKUsJZxkFIWOy2ZzpK8v/a8igsIvokm8yCTxX8VOsKwsioNug/XJ62y79oVwIujxTIxTlcfwgY2ZDXajj4JTDDytpBFCLfSeQzAbCzLMt9mC11s6nfWH2SVBGuBF4TCxduAkO+isN5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xL/neGj9ZHTfd/kKaYj3wKqFaF+lDGn3XXSZBoc9hMw=;
 b=FzyQ3cQR1giqbTAzUHPQpQf5uysO0SdUnuC8oKR/pq+AlX0aSISQQi6FancN43hS+V9nTl1Dn31ipwylwuAE4u9I3qAjKySOe4o2bzQjq9IzLZ1daeYMGfkIunnrwwvV7upVl7TXciG5ONdTW5KEVNG5pE+3OO0yrXfdJ7MVJ3Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MW3PR12MB4442.namprd12.prod.outlook.com (2603:10b6:303:55::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.20; Fri, 23 Sep
 2022 15:15:22 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::76ec:6acf:dd4d:76a3]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::76ec:6acf:dd4d:76a3%7]) with mapi id 15.20.5654.017; Fri, 23 Sep 2022
 15:15:22 +0000
Message-ID: <11d8e17c-5b06-bff1-fd93-cb553f008a0e@amd.com>
Date:   Fri, 23 Sep 2022 10:15:20 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH] platform/x86/amd/pmf: install notify handler after acpi
 init
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
        markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
        bnocera@redhat.com, Mark Pearson <markpearson@lenovo.com>
References: <20220923131724.1812685-1-Shyam-sundar.S-k@amd.com>
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <20220923131724.1812685-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR12CA0002.namprd12.prod.outlook.com
 (2603:10b6:610:57::12) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MW3PR12MB4442:EE_
X-MS-Office365-Filtering-Correlation-Id: 1846af68-b235-4762-d744-08da9d766f3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6TdonhWxP1WHjKDDFnT29+fSs+jsAL7X2myt2U2NFh3QW4lfjWhf3VZU+sDXsEPtnmobPsyqJj0QVU6Jpi8ELkUR878f86DDcTdc67lo1KTidZ4zVaUdX/L5fXT4WqvAztsCq7lRiRAQV8tE5N03GNLh8yqC2+E+ASLte/sZnjUjq41qmcicmqkMISZxrXP5ZQOWdVsZxK3nWvMvzBg7MrHewj+bNJN4AyHIJom31Ao/x4RQHsO//2b8dHI3KuWhmUVZFBNaKf+d8rYRuoc79LSZmp/nQgTLJGpAol1ZhJ1QYaxInv2JQzUcm3/hFjIFX8G609SCaAjJOrA+Ya0dPTalv752NGKXADjD+lobowaMHJilMhUT5CqyapSjtPB1gTxoV+BJOEiqGcwRQA6/HUwb9q9arPnyJ18WsZCxR4yxapPPlHk2ytlPBD1SwUtTpxSxG+L/JYc5r/qNOTkSLX0goCGIzPQTYiCehJA1avrIvvIeqCJmgLoAGrJfBeZgTCgaGtC7o7qSrrbo8sV8aNDwGw3vlhy+loG88kgPCIPXrvSgZZ6jbCLiKVDMOMuyyYMxiJpqfefZZ4SdBvqvt0atJvk3yzsc7KUbSMe0yfML8E7l4YdDPEr04MElPLWJRrR/W0sviDhTJVKci5oghhHH4YqXNWAtAyWvWMsrlWF10fJCZB35FwD+Lfj1dvjvRT9FWdWEnoXZhZq93/iRvLr1DLzbBVLK8JDba+de/ZoZq+XttPzLu1qpAx9/uRXF6cGOvEsJVGX2I8D0fK3NqAAisWJRumxui6gmy9Wbkk4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(39860400002)(136003)(396003)(346002)(451199015)(186003)(5660300002)(2906002)(83380400001)(38100700002)(31696002)(86362001)(36756003)(316002)(6506007)(53546011)(478600001)(6486002)(41300700001)(8936002)(66946007)(31686004)(6512007)(2616005)(8676002)(66476007)(26005)(66556008)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3BuZ05KcTZaaDg4TGJxTjQ3SCtiRTBOblJqK0VZVHlsaStKUTZieGZ5ZW1a?=
 =?utf-8?B?WGJYaEJXVXN1VmlqalB0VWFNWUlKR2JkTEFsZTdoeXBFMFNQc1kvK2FOcW43?=
 =?utf-8?B?Vmh3TGlHajZQMExRSkVnZFM4ZUxXUlk5VWcraWZHZlN1cEp6ODl4U0xOeGJH?=
 =?utf-8?B?N29OM2RMVVE2dHNFd3FjNDhQL3NxMVJxUnQxR1JSNDBGZittd1VuZXUyZnlI?=
 =?utf-8?B?b2VnblByL3hITHB1aXdEWlo1enlMSlJJTWVsL0xjY3RJR3pqRytoRzVNWDkr?=
 =?utf-8?B?NjQ2bTFpZnZnMFR1NFIxekJBZWpmbGN3Y0N5YnNrV3U0TkZ0KzRsdENvdlZR?=
 =?utf-8?B?ZjdmdVp0RFZhaVVVRjUyMGtEQWc2TkhYU1ZuZ1QwVWE1bVprV0wzTEZSQkhG?=
 =?utf-8?B?SG12YjlUTFRRZ0Iyc1Y3MjZ2a2x2dFIybGJrbDgwUHUvRmY2c21yUUdqSXlz?=
 =?utf-8?B?OC9SeTdpSTc5MzdwOEhvNU0zMW9EVndzR3NWMmdrdlk1SUhqYmtDTDlRYWRy?=
 =?utf-8?B?Vk9SR1U2dWMrcndTQTR4KzdFQU5tOTR1RkVOMXk5a1BKYktEYXRVZ2FEWnh0?=
 =?utf-8?B?SldadWc5dGkzbXRiSnVNZncwN0VCUmZ3VlI1YStQTmY2RUxGemgwbUgrRnVS?=
 =?utf-8?B?VGhtZEY0WG9BYnRtSHd0VnV2a2pXK0lzY1Q3NFFGVkk5S1JkVGVyVmdHaXVC?=
 =?utf-8?B?QTBkS1VEWWZXVC9qNFJINUtsRG1IcjBNTWNvYW8xV0Z1cUdHWmVaemV4a2lM?=
 =?utf-8?B?VkUzMFdYYVppdlR6Y2ZVSVR3bzNWTjgzWFpuQzNaOE9zc201VE1iMXpTNHJq?=
 =?utf-8?B?b2xmZjlsY01iK09Sa1J6aUV5VjVOQnBnQlYzK0xYZ1V5S2tOME5ERGlzMHMx?=
 =?utf-8?B?MU1ZeVNPR245Z3NUOWFHekpsc1EycGNYWklPWjdHcndPYWZKRi9EU2lINHVU?=
 =?utf-8?B?RElYbFdHQkJ4RWdwaW9EeFVkUjZYU3laaTVPa3hWTThaL3RTZzZicHVsemx3?=
 =?utf-8?B?a3RYMVozTnovUk5wenU2RkovWHBCZjJvdFhZMU54VTdvZGE2SVB3Y3MycDdi?=
 =?utf-8?B?ZjNhS1BFSjlxdi84bUxsZlpaOUFETFN5WDJTOEpZUFpyOVI1RHlQcTFQR3o0?=
 =?utf-8?B?NUI3a0t4ME1ML2R6dUlyaG9VdjI1M0hGZm12blhKSkdpTnFaTjRmSEN1MDgr?=
 =?utf-8?B?NjdtYXh2VHp0RC9QWXlkenJWVXkyTE5tU0lrOWpXc1kzK2Q0c0NZTis0ZWk5?=
 =?utf-8?B?WGVCWll2eW05cDF0L2ViQnZTeUttaHhDcWttb3JuTWZLdnVXMnh4MTFyTkZJ?=
 =?utf-8?B?S0hWaEpwT3FiUTR1SjcrNE1jOEtTRFZkTkpsVXp4bGRiVnB6U25tSkZDOEdm?=
 =?utf-8?B?TzhDQTJiUkg4TVNibVZVRUtpUHRVVHhoeUhhTWVaVFdFcEhUSUp6QVJZbGt4?=
 =?utf-8?B?ZGthTDArck9CWkNzTUtBQkZsc0RBUHhiTDB5SFdkV0p4bzFHbFB0T0p2Skxm?=
 =?utf-8?B?a3pQVFRWbHdRUTZ3cFpmSWZraGxqTEVCVFF5elFDdXk5eFFTNExFRktjWWpn?=
 =?utf-8?B?RzhJQUd6N0h6NWdXZ0ltZGJQVCtwTURqMlJHNzdYRWJFblluVTdQY01LSkpj?=
 =?utf-8?B?d0poM3YwTmRwcHBYWlJxSmFrZGs4Q1BsNldHWnY5K21CUGNvN2xraXc2QUM3?=
 =?utf-8?B?NGNxTXJiSlVBL2ZtRGgzNGkwUzB0UWFhL2lvYlJjMnpMcXN2UDFJdHBUWTI1?=
 =?utf-8?B?a2IwZFBxeXN1OTU0SHpnU3pSNjA0b25ZVFlJUDl6enpTeHdwdlFtS05tOTcw?=
 =?utf-8?B?NHRpNU5xaHplbUlTbDgzeWUvSERrQytYWHI3S1N6di9EdzVRbVE1dTdGdzZQ?=
 =?utf-8?B?SGg2NnMxVGg0RkpIZGkvYTZjVnVEVVdWV0k3ZGRlKzI0MjVWZDZWYmJJRElZ?=
 =?utf-8?B?SDU2U0J6S2kwZDF0WlFtMlYwNnNkbVRXR2ZOYlJraHU1ZE00WFRUSHh2d0No?=
 =?utf-8?B?SVRwOCtGYnczV1RhWTJJd2VqSmhPcS85TzUvTitFREYxSmxwNFRxd25kQjVh?=
 =?utf-8?B?aVZhUWhmUUZRR3cwMzZlYnZBemR5VDVZVzlvTGRZN1dmQitMeUZxVGxOR0ND?=
 =?utf-8?Q?cxfzA5qZ3csoBBAsNmszFotvd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1846af68-b235-4762-d744-08da9d766f3b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2022 15:15:22.5178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 20OcAsWKCA/MhJQGdSJ6rkIYuN5+Dwp8StNN2ytEQIv+EsbQZ3Ucb0blz/TAVk3BzUChJGF5efgTJ5hJtgGwIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4442
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 9/23/2022 08:17, Shyam Sundar S K wrote:
> It is observed that when thinkpad_acpi driver loads before amd-pmf
> driver, thinkpad_acpi driver sends the AMT "on" event and the request
> immediately will be part of the PMF BIOS "pending requests".
> 
> With the current amd-pmf code, as soon as the amd-pmf driver gets
> probed, it calls apmf_acpi_init() where the notify handler will be
> installed. Handler callback would call amd_pmf_handle_amt() where the
> amd_pmf_set_automode() shall update the auto-mode thermals.
> In this case, the auto-mode config_store shall have "zeros", as the
> auto mode init gets called during the later stage.
> 
> To fix this, change the order of the acpi notifer install and call it
> after the auto mode initialization is done.
> 
> Fixes: 7d77dcc83ada ("platform/x86/amd/pmf: Handle AMT and CQL events for Auto mode")
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Cc: Mark Pearson <markpearson@lenovo.com>
> Cc: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

LGTM, thanks.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

> ---
>   drivers/platform/x86/amd/pmf/acpi.c | 38 +++++++++++++++++------------
>   drivers/platform/x86/amd/pmf/core.c |  1 +
>   drivers/platform/x86/amd/pmf/pmf.h  |  1 +
>   3 files changed, 24 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index 05a2b8a056fc..b6453157a59d 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -243,6 +243,28 @@ int apmf_get_dyn_slider_def_dc(struct amd_pmf_dev *pdev, struct apmf_dyn_slider_
>   	return apmf_if_call_store_buffer(pdev, APMF_FUNC_DYN_SLIDER_DC, data, sizeof(*data));
>   }
>   
> +int apmf_install_handler(struct amd_pmf_dev *pmf_dev)
> +{
> +	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
> +	acpi_status status;
> +
> +	/* Install the APMF Notify handler */
> +	if (is_apmf_func_supported(pmf_dev, APMF_FUNC_AUTO_MODE) &&
> +	    is_apmf_func_supported(pmf_dev, APMF_FUNC_SBIOS_REQUESTS)) {
> +		status = acpi_install_notify_handler(ahandle, ACPI_ALL_NOTIFY,
> +						     apmf_event_handler, pmf_dev);
> +		if (ACPI_FAILURE(status)) {
> +			dev_err(pmf_dev->dev, "failed to install notify handler\n");
> +			return -ENODEV;
> +		}
> +
> +	/* Call the handler once manually to catch up with possibly missed notifies. */
> +	apmf_event_handler(ahandle, 0, pmf_dev);
> +}
> +
> +return 0;
> +}
> +
>   void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev)
>   {
>   	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
> @@ -257,8 +279,6 @@ void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev)
>   
>   int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
>   {
> -	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
> -	acpi_status status;
>   	int ret;
>   
>   	ret = apmf_if_verify_interface(pmf_dev);
> @@ -279,20 +299,6 @@ int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
>   		schedule_delayed_work(&pmf_dev->heart_beat, 0);
>   	}
>   
> -	/* Install the APMF Notify handler */
> -	if (is_apmf_func_supported(pmf_dev, APMF_FUNC_AUTO_MODE) &&
> -	    is_apmf_func_supported(pmf_dev, APMF_FUNC_SBIOS_REQUESTS)) {
> -		status = acpi_install_notify_handler(ahandle,
> -						     ACPI_ALL_NOTIFY,
> -						     apmf_event_handler, pmf_dev);
> -		if (ACPI_FAILURE(status)) {
> -			dev_err(pmf_dev->dev, "failed to install notify handler\n");
> -			return -ENODEV;
> -		}
> -		/* Call the handler once manually to catch up with possibly missed notifies. */
> -		apmf_event_handler(ahandle, 0, pmf_dev);
> -	}
> -
>   out:
>   	return ret;
>   }
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index 44fe30726b62..a5f5a4bcff6d 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -369,6 +369,7 @@ static int amd_pmf_probe(struct platform_device *pdev)
>   	apmf_acpi_init(dev);
>   	platform_set_drvdata(pdev, dev);
>   	amd_pmf_init_features(dev);
> +	apmf_install_handler(dev);
>   	amd_pmf_dbgfs_register(dev);
>   
>   	mutex_init(&dev->lock);
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index e5dc3ae238c7..84bbe2c6ea61 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -381,6 +381,7 @@ int is_apmf_func_supported(struct amd_pmf_dev *pdev, unsigned long index);
>   int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32 *data);
>   int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev);
>   int amd_pmf_get_power_source(void);
> +int apmf_install_handler(struct amd_pmf_dev *pmf_dev);
>   
>   /* SPS Layer */
>   int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);

