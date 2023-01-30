Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF942C54EAA
	for <platform-driver-x86@archiver.kernel.org>; Mon, 30 Jan 2023 14:32:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237810AbjA3Ocg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 30 Jan 2023 09:32:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237831AbjA3OcO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 30 Jan 2023 09:32:14 -0500
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2082.outbound.protection.outlook.com [40.107.94.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4FC8FF20
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jan 2023 06:30:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AxIohm+jlXLGqWVW7i8ynl1oyJZn79n/6csxEY80XrL5t9kq7LHVIs5X9ukhhDA1BE9QLOK4/+0H1o+elQqsfjGFgkf27tYmSC8DW2sYH7EoNqJI+o1cLhf19nVwVeb/tBSzIQe+LgolMTSTedR1rwyEDZlL/fs2kcV8PZIjk88JNSktmvy+8hkFM5mIKZrZryA2ArTehTLLYaYmZu6+t6EUgqx9/whfIclNnQCPTR+0ETGTsOZ8Jn82eUPh9D8HJHAGJnKqDVCCQs2uckWc/7Km8ViqfqSGM3XqDlViCoVLvYePTU0v6fmhVgpeA90gqlMOfjMTsPboUrwrDplqyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RsSdTmU9qpxBOJD671eizEN8srjgwsrPTfMUo5ENCAs=;
 b=kmaOPovrRR43WXXkiHeiAMOWXIZmUZJSAEozbm5KHCNVPELYQclnZEZk/qVHeyjhAFm2pjB39WFjHQzW/ITLFpGAceOIqdbj6KAxIzG2wqaUOcfSltFSooHY9nCHzf8SekZ1xQbCXrojC6yPxvMfYCmyNthPRtQPRWeCRDSCyFZIsym6QVhCHZwClPVJVXuWMpIhZT1rRDYHPb9qj47J0t+DjCgJuw8s69jECNUG0vS3eScf8hNjHWBwMwC1V3EUWJl38iCis6KhyMwa/MlbvrIb03STt40mpSP3AOAknwCDtbs6803buVc1uzvo2u8hm6O39sW9CIVMwkdq5WZpcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RsSdTmU9qpxBOJD671eizEN8srjgwsrPTfMUo5ENCAs=;
 b=ZqALkTCyMhxnwxdP/AaIqSo/zg3dd9Tu7BvePGkuEmXKi8MZ9YKHYk2Cp4dOAw/1attWEZx6y+s36jUliLf2QxQvY6qb7WaqvoOb9wEk8nzr8lgIYDH3RytzgKUm3eBGiYbB44pmrD8/V3yz6+j7hUquIZ4+fTssrk6penmu0Vc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by DM4PR12MB5183.namprd12.prod.outlook.com (2603:10b6:5:396::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 14:30:57 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::e7d8:1e35:79ac:d6e0]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::e7d8:1e35:79ac:d6e0%9]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 14:30:57 +0000
Message-ID: <494db4a2-15c0-a8c3-8d59-c99489f53030@amd.com>
Date:   Mon, 30 Jan 2023 20:00:43 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 6/6] platform/x86/amd/pmf: Ensure mutexes are initialized
 before use
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Mario Limonciello <mario.limonciello@amd.com>,
        platform-driver-x86@vger.kernel.org
References: <20230130132554.696025-1-hdegoede@redhat.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <20230130132554.696025-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0001.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::7) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|DM4PR12MB5183:EE_
X-MS-Office365-Filtering-Correlation-Id: 727f82b4-3d3e-426e-5759-08db02ce9999
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: liyPUA7TUmOULBkFZWa0PxCz8gxBehK4wERuy3tgPbgPMqUnRuLcHCh0GO25zQBzhgiLsqsXPIdyKcenhBess2FlKdEvNPEz+lnWdCSU05ydOkprrGLxBl2DtvepNNfMVMPlSVOdYNE5WDjl5lbYuE5B/iJ2YbU61sWVbgrwm3owipcAZYjK4zH1Fu9ooOtLUeQddKmYst0jncu+z8RylI4MXGpJooKQshL9fn3n9bG2bHV4ulcSSd09F+vPrn/g+c4dnZFBJYT3snqDUdcrhTKXNvOe6PdsxnhjV0kIeZD2HIvWFqNFX1Tmh3Cn167VpMAwjYaJFJlixIfl9NOWnpGTHneXF3FOAdwPC0ki1vw4CU8t20xGVnml/jN7E47FUDDrA4NsQb1BPZkJYjWZ8copVVD/0UMYQzcBC2BUaH8MRdrJcTSRYj9BpSwWhXeD4sA7URxGh+MD7212Wlj4ejxRVvSkVQCoPy78VHvFr3hoTq96okiE1czsz2WbNzfzsmDhjkjvXWsJ9/5mh6HpBChSMib6e6YoZjN0ZYwFwvxfpkmivspHtQ58VTmva2JQRbwFfmpRbDI9tGJyMRraV+fpDV/SggQU+j1Pf40P5k2OPWKZkVH+jwfmG/0foEpBtD2Dpxrabd1kmjaerH9IpwGaE6na+QCglFGIgL6iWJtRakTmcfKFg86suvSPi5TV7OqJmVa+f4J/1nsrCVYmSC71gdrRv9A6xUbPS82DWmM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(376002)(346002)(396003)(136003)(39860400002)(451199018)(36756003)(5660300002)(38100700002)(2906002)(31686004)(478600001)(2616005)(6486002)(186003)(6506007)(6512007)(26005)(53546011)(31696002)(86362001)(83380400001)(110136005)(4326008)(66556008)(66946007)(66476007)(6666004)(8676002)(316002)(41300700001)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3o5ZE1MOWR4Y1pIZXBHTVlYSTRzMzV1NVllbStQVWdOWDRVN1pSOFErTjBC?=
 =?utf-8?B?NmJQYk5zLytZckxtUERDT3NDZUl4d3ZheFc0V1FRY1QyN1J4ZitjZ1R5Wnk0?=
 =?utf-8?B?Z2hsMC93ZnNzV3lGTyt4WFlVbld4a0FKSHZaUXRGZUp5enBQR3ZuTktvUWF5?=
 =?utf-8?B?dFpYMDFPNUV4bWdRVm96YlVSQjRiSGM4aHdDWE9kTkxxbDEwWTUzTVM4dy96?=
 =?utf-8?B?YWRFZkJGMUFEaVVtNktxYTNFYWRPYTYxUGc3M21mWmZwRFpvTlh6ZVVydmJP?=
 =?utf-8?B?eXc4S3BTeXNEcmtOYnZJY2FZa000M0VPOXA3SFdKM0VNQUpscFdabDZ6a3Fu?=
 =?utf-8?B?d2dWbmtQWnlZUnhiSTdLZCtMdjlneUJGUTdSTFdoWWQrbHlnMDMxN0s3dWFC?=
 =?utf-8?B?VytsK0dZcmFBMUpxM0Fnb1JCeFo3R1RyaWZGOTdSUVRUM2RvenMwbXJwSHhh?=
 =?utf-8?B?TlpFekhCbzBoR0FZWUozeGVMNTNxTERqdHAxamt0WHpPTzhrYmhzWlhqM1ND?=
 =?utf-8?B?VzNOaE85akZzcktNYUE5MkVhUENLMjFaaHpvRENkeUtyTVlWeHcyYk1xYmo5?=
 =?utf-8?B?SjVkbVdiZzVRN0VYUXpuSmZSa3FDRXVYamVWM21odGp6N3dYeWdFWUN4eDBx?=
 =?utf-8?B?Z0ZRSklMamg4RElEVFFqbDJlWkxScWlmRWI2T3B2SWhuU3FibGZOYWY4Z2hX?=
 =?utf-8?B?allibVhWY09xZlNHOWsrTWplTzlmQ053SXBwZ1Q2RGx1MysyZ1lvN1dtbUlD?=
 =?utf-8?B?eG96K01QWVkzMGN4WFU4TW5YVjJsdXJteTlnMzBZY0VkeGNqZ24xL1RnMkJx?=
 =?utf-8?B?VGdISnNITzQ1akcwKzVQenVYdGUvVnR4RFNHNXh2UkJrc3dsUG9ybkVhOXlE?=
 =?utf-8?B?d1BQeERxZ2Qxb04vRUVtZENNOXI2RDVpWVlwTXFoblc5UGM2NjduckR5VDV5?=
 =?utf-8?B?cmt1K1FRN1Y1TVpuSzhCcE4xNkRqZzBZRkJuekFyVkszVGsza2dmdnJOazBp?=
 =?utf-8?B?Tk5CaTU3Z0ptcSt1N3JSQktMQ2xISTJtMSsxUWgzUHQ4KzhwclFJdVRnaDVM?=
 =?utf-8?B?TmtnWFc0bmllY2FwV2ZqOVcydFFyQUtXWWo4b3dmNDNpMHhVUkpQMkFyeHRC?=
 =?utf-8?B?cXRHMU1tWFRSM1JLbHNaaUhYdDBtYzM2N2c5Y09PRWM5ZHl6TEg2MFh0RzVL?=
 =?utf-8?B?TllVRTB0RDMrMTZDQlJKMk4rZUU5OXllTEoxME5iREdBVlk1RWt6ekxEQWYz?=
 =?utf-8?B?QmxyWTI5ZW1qNnRLOVFlZDFuV2lScjBwWWlucTJRbkpVU1F1cmZBejMrRGxR?=
 =?utf-8?B?VEU0SDJnNzRrMXNxWHNUdjF2NEhvMnN0SnFUUzdRbnR5akxQbkJRUTRrRDdT?=
 =?utf-8?B?NGxkcXIvM3dDNWd0a2pIUThoOWJlZzV0WVFuTlZWNGI1ZjBMUzJwVkJqaStU?=
 =?utf-8?B?d3k0b3FpRnlLS0tBM2VaTFZIREVoaDJMY0lmS1c5RTN2Z1lCSkpITWY5ZVZz?=
 =?utf-8?B?Y2NDLzliQlM1NW1mTWlZZFByUm5adlcrWUNVR1ErdXdCTjErQXRnRFJEa2Ni?=
 =?utf-8?B?Q2pyNi81WWR3N05acUY3LzV1amJkSHJYeWd0TU4xV1pCZnlTdWJIVWYwbi9O?=
 =?utf-8?B?clBVMWxqblV1eXZKRzZQbitucEVNSmhBaHg3NS94cjZYbkhxWjNoc1ZvWlVC?=
 =?utf-8?B?a0psTFdodWQ3MkJUVjl4d3FwaEJwZXhsbzVMVDFPNU5LOG9yZFg4WEUyS0hH?=
 =?utf-8?B?QlRPdjdkcGx0U2JhOUpZRnVVZUwzNFRZcmN4aDVoOStXbkJScmhnbC9BeGM3?=
 =?utf-8?B?aStkQ05sdk9CSFQ5R3g3MzcxOUdLMlZQVVFFQVllN1lMRXJ5Qkdyakd1U0xi?=
 =?utf-8?B?eXZOd1lxS1B4UTE0NTJGbkZHMkRXUFliYWh6VUl6NEplM1RxVXBpanJvVGtF?=
 =?utf-8?B?ZkxvM1BIemtEcHNCd1ZWOGE0SjlNdUZjUFR6L0lET3dNMWxLQlVya0s4cWE1?=
 =?utf-8?B?TDE5YmtjRTdjYkx0WnlXc3o1Vm9vYkE2Z1NERUFmeFVrZG5FRWZyR05zWXJr?=
 =?utf-8?B?aDFDdm1nRFZGZ3gxcEhVc3F1cHg1NVhscWQ5VWJLaGtBcm1WRnhkcHN2ckt0?=
 =?utf-8?Q?NPVq/TGL9nyfXiAqRQQaW8aVz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 727f82b4-3d3e-426e-5759-08db02ce9999
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 14:30:57.0423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 55nAP+lBgRbvSd4gdHRGsB9D7NyxRuHEeJ4hwNrxHy6mWT5MtN9Vm+8L+cbI2BL7GpDR+kw7G1zwbSIXY5GSAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5183
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/30/2023 6:55 PM, Hans de Goede wrote:
> As soon as the first handler or sysfs file is registered
> the mutex may get used.
> 
> Move the initialization to before any handler registration /
> sysfs file creation.
> 
> Likewise move the destruction of the mutex to after all
> the de-initialization is done.
> 
> Fixes: da5ce22df5fe ("platform/x86/amd/pmf: Add support for PMF core layer")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Looks good to me. Thank you.

Acked-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

> ---
>  drivers/platform/x86/amd/pmf/core.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index c9f7bcef4ac8..da23639071d7 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -385,6 +385,9 @@ static int amd_pmf_probe(struct platform_device *pdev)
>  	if (!dev->regbase)
>  		return -ENOMEM;
>  
> +	mutex_init(&dev->lock);
> +	mutex_init(&dev->update_mutex);
> +
>  	apmf_acpi_init(dev);
>  	platform_set_drvdata(pdev, dev);
>  	amd_pmf_init_features(dev);
> @@ -394,8 +397,6 @@ static int amd_pmf_probe(struct platform_device *pdev)
>  	dev->pwr_src_notifier.notifier_call = amd_pmf_pwr_src_notify_call;
>  	power_supply_reg_notifier(&dev->pwr_src_notifier);
>  
> -	mutex_init(&dev->lock);
> -	mutex_init(&dev->update_mutex);
>  	dev_info(dev->dev, "registered PMF device successfully\n");
>  
>  	return 0;
> @@ -406,11 +407,11 @@ static int amd_pmf_remove(struct platform_device *pdev)
>  	struct amd_pmf_dev *dev = platform_get_drvdata(pdev);
>  
>  	power_supply_unreg_notifier(&dev->pwr_src_notifier);
> -	mutex_destroy(&dev->lock);
> -	mutex_destroy(&dev->update_mutex);
>  	amd_pmf_deinit_features(dev);
>  	apmf_acpi_deinit(dev);
>  	amd_pmf_dbgfs_unregister(dev);
> +	mutex_destroy(&dev->lock);
> +	mutex_destroy(&dev->update_mutex);
>  	kfree(dev->buf);
>  	return 0;
>  }
> 
