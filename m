Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E531C6FA82
	for <platform-driver-x86@archiver.kernel.org>; Mon, 12 Sep 2022 14:06:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbiILOGH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 12 Sep 2022 10:06:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbiILOGG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Sep 2022 10:06:06 -0400
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on20618.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8d::618])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE731193D9
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Sep 2022 07:06:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cVotNnZTPZzmE63rjOIZa9w3bTESeJyZyC5skus2PpdMkXuIu4YA6+anOmI/fh60XQPMo444XDm7dKmSBhZmJLOueOsnnvbsKy1IzG3+XefLxT7EDxIrWvTLh6olRNxcVR+jtnAweAioU7zUzg183gP1JZmwS7h0sQavyGoDe2kyFNpvYQnxl5yS3Q48vSIKEfO1Y09Mkj9pKvClnj9CpHaWlKNvxeHlr/z1ik66hXVSaxu1jP+y8DGiZQrNdTTTsqPf7T/RdqhJ31dBEIJOXCIhZu6R0AawWgb7086ZnZZizZyZLMrn2xZGOqoypg606dPBebPaK7SVBgUrSsiJDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4lbzHBf78rdHJz9AOH+JOT6KsKZPxOb11aiXHeXgFds=;
 b=VKL9E6PkQUztAKn8bxxgKmCnnI5xQZ+SRNPLG6jBU3n9jAWhb3SX0Y3feMqhdl3cqbEbqGoopAghkVyeiGueqc4KBoJk+HCUIbnIkQrOOlyY/IRRRaCtddMJjdwgAqYbCAVcyJ+laO0SgJIbCOD79NHxakWnVS71KLqEjybeelpHyiDgAtGxKZbFYGWrK3dKJcFe7BgBwOclcsYKe2HmQMwJ0A6I2FI6RF07Wlh39GM6lv1se9rQGdU/dhUZ3s+a63Nmi2p1sYKFelATTkdzP412VpLpPqmnM7Ngzk8GEY11wD/3gfIFv4CPV4KsIMWDjnhBzk/j4DRitC06f7FIAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4lbzHBf78rdHJz9AOH+JOT6KsKZPxOb11aiXHeXgFds=;
 b=3Nq6dwikHDzit2AOdurqn+jlqdKWgQkKqglBRj36Gt9ggDTFDEiOaoKFljLb31OI2R7x0qybdE9w10H5n2uxModvOKa+I4AuonSBeu8/0yN9LzfN1b+3XAETQI0SPSMlligjVbHRpJGEDA7aImhL9YVPQjOTjRfrsKVxxij5uRI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by BL1PR12MB5128.namprd12.prod.outlook.com (2603:10b6:208:316::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Mon, 12 Sep
 2022 14:06:01 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3565:585c:3431:216c]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3565:585c:3431:216c%7]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 14:06:01 +0000
Message-ID: <8df1b75a-d081-ca0f-06d6-02c96f72f870@amd.com>
Date:   Mon, 12 Sep 2022 09:06:00 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 2/4] platform/x86/amd/pmf: Add sysfs to toggle CnQF
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
        markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
        bnocera@redhat.com
References: <20220912090641.111658-1-Shyam-sundar.S-k@amd.com>
 <20220912090641.111658-3-Shyam-sundar.S-k@amd.com>
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <20220912090641.111658-3-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR18CA0023.namprd18.prod.outlook.com
 (2603:10b6:610:4f::33) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|BL1PR12MB5128:EE_
X-MS-Office365-Filtering-Correlation-Id: f30d8f46-a23a-434d-6a47-08da94c7eca6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KZap0mNwEH6+WjwKCJrJSKxx8tinokfjjBmZnOpLsF8C2qBmSyJY8um6901kek3y8ncjs/TU+O6PTF7rJO7LMm8j8MeKyQaO93zrczg3HD8jomAFl/nzCorJq+vtukfUbxLDcsNDijsdzTjwx03qWM1eV9ybKYOa9n5VwJA97J0Gw8ij41kohBmc5k79qt75cmc4RNX8HWDF/MxZaarUswuraR32ebAo4LfriYXzlNGTJ+W71LC2uobP2w1tehbIctNEy++9yXe7OPB3VMnKKKNNxhn4LuSF/tJh3Z86UPRKHPB3PtSedEUWqrh2FPWfr/mZChZxzeA2pJCWxEkgt+OtpKMaFr5hZezeO0VNpvB2Kgmjsa8hL4V2mEnCDVZweHAF25bwS9VnUDQXSMw/MfA8HOVdgWjpxOpnFM+b4dn6LJ25wniDhL8t4IZ3fwofmJBdJ4mSNTfvCaz2m7BCIxLmGkMcgqkTXCBBOVdsv14B+V0JIC77G8pcnwXm1gEHEcz3vg/1dPGuIU0DSswnvxrh28tgFzvio/i/6a3pzqO1ESlNHGVuvEJ45Kj0NjxkspCmRrvE1XZ1f6M0W+a37dcs49B1u/pnzuIa0vomA95UtGIqk9OVOaBpZco4d6iwfIqj/QVgsXEcnepT/QzgMgJp1B8yulsbriovz1haVFvpO7oGHnNNwgie9atRUw0O79z3b6BDnmbsqCODLi8l9M4lVgKui1UKyqOivmN5YVFP7o37RAfJYPKbJyCPxfAWIOlxIH8w5Itxdj4HYBaRH+eOSOsnfNxpha9S33TGzac=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(39860400002)(346002)(396003)(376002)(2616005)(83380400001)(186003)(4326008)(86362001)(31696002)(38100700002)(8676002)(66556008)(66946007)(66476007)(8936002)(36756003)(2906002)(41300700001)(6486002)(6512007)(6506007)(53546011)(5660300002)(31686004)(316002)(26005)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzRoMElSZDJROGlqSXJXdGJDeDlhVXloZmNCUmE4cCsyR1hmVGE1QnU3aldO?=
 =?utf-8?B?RVdELzJnanRMSWYwUU1MdG9FU1ExSUFYcWlHSDVjNUtOSHZJWEtXSDJ0UlpZ?=
 =?utf-8?B?dkhzNFJmOHI1Z0RwaVlSNGJydHNoZUZEMXVYSGs2Nzk5S2g0ODlPL1RKcmRs?=
 =?utf-8?B?TExJYkVkVU1kaGNhVERoYjQ4c0xydk43SG5QOHdOa2pOTjFVRW9VZHV6ZUMr?=
 =?utf-8?B?d0ZtQjdpRWQvR1dZMzkwZXFrNk9aaTgzS0srbmlrRjdMTmVHc08wVm9XL0ZB?=
 =?utf-8?B?a1E5S2ZOOFZIVUNSUlcxL1M0RVBqdWNKVHFtNHptRExnUTJ5NWJ4QzlYclV0?=
 =?utf-8?B?c3l0Tk5iZUY2Z2tqWFJNY3ZLbzVXVHVPSXo1M1YzKzJnd2g2SEZSWVI0Tmlk?=
 =?utf-8?B?TEt6QTIrdHBZMGhpS3JSOGUvYVhtaks0VDRKNVF3Q3pFTWlmUk1qbnRHMktT?=
 =?utf-8?B?anIvOVNFQ0FvcDJaeE5oM2lQekhBMVpZSUFOZkNEWkdDaXBVUEtRWFJMVDla?=
 =?utf-8?B?NGdiM1VLL1ZFSXNkMTU5YUkxa2g3anM5SnFyUU9KQlZVQ01jd0h3STNHU2Fy?=
 =?utf-8?B?d3VIU2lHczVYMHhVSnRIL3pLQ3M2anMzRGZiZlc1b01ya0d3RnljRmxPbnNa?=
 =?utf-8?B?RHB2SzZQY05aRTlKSzhtc0o5VjNDK1BpZVNrVE9lTFVnWTkrdzJjYkJwNUwy?=
 =?utf-8?B?QlUyQm80TnhmUVFwNERFT2RCQVI3cVk2ZFgwcnlEdlo0RDdnL3Q3VmJyZlVk?=
 =?utf-8?B?dGFlYnVkcHBnUyt5WCtQdWtybVpTS1l2T2FqVWlQSksvaVFGWGg5alBvb0ZH?=
 =?utf-8?B?Y3U5S0JaQ0N1cG9CT3E0NjQyOGxXMHRNdXFCUTJRaURIc3dEcVJwVHhtdlVx?=
 =?utf-8?B?R21EV0JYRm5JNzN6bnoxNllyOThqZkFYa01yNEpoaU5zRDF5YTdrOVpVbVAv?=
 =?utf-8?B?N0VOWTY5bTBObnFEelpJTUFjM2I1V2pRdU1ISVhmQVd0NkZzQVlaVFJQQXRj?=
 =?utf-8?B?SVBLTk1DY2tsNzExZElYNlZIM21uWTk5UFREeUl2SFBPbkVNMXBsQ0NvTUM5?=
 =?utf-8?B?T3ZZNkNhNE9aVDNTR0xNVGZieGZQVU1XRzBOajI2eEt4bXgrMHdvTXJCZEhQ?=
 =?utf-8?B?UjFGM0VoY1krWVZmb1NwRWl0UHptNHZ6Z09IQ1lmQXVLUDFqYXNaSE5laUNu?=
 =?utf-8?B?YUFsdEJoamtBVm5SeUhaSzFFTlZHS3V4NHBuNytlQk1xdVJLKzh6M2xSamN6?=
 =?utf-8?B?NGlLWHYxcFM0S2dvaGVtNi96R0dBd2ZOVmpGM0hWK2RhR2FTRFpGOUt5ZU9k?=
 =?utf-8?B?S0orZXl3TlcxZDRqY25UeGlLaWlrY1pXNUYvaHpGakdrSFZ5RXRjdkE0cDNN?=
 =?utf-8?B?TG8vWnVmb0VvaWI2cmtIdWFzdmdjRU5wYlp6WGN4cmhBYU80aWhCOGUyRksz?=
 =?utf-8?B?RlBybjF5QStUZU1WTmc2ek5hT25FSGI2QVJwTHdYRXNzT0Z5c1JGdkVZM0dI?=
 =?utf-8?B?ZG5xeTlTZ3EwdkRKRmFNT1RWdnNoYmh2ZlB6aGNxcHUwZUd3QU5UeHBaSC9i?=
 =?utf-8?B?SGZ0UHh6bThEWlJYM1lpSy96TGEvL1BQd0RhNmJaSi9BbHVwUU84WDBaMmRl?=
 =?utf-8?B?MXRrc2NzV2NqQ052KzVVT0pRRzBoUUY4c2NmVE5IMDdldkVhb21VYmU4U3E1?=
 =?utf-8?B?QkZlZXBpNkovWGUyaHNySVFwNEx5MVpEMElQbEtXYThZeHJDWGdZRTI5K2pq?=
 =?utf-8?B?cWJmMmloTlRkL0ZySFF3M2x0Zlc4VUI5SS9zbDNRbnp4SXBPbXhMdVZzNjJV?=
 =?utf-8?B?NVQ2d0t1WVNycTY2dTR5c2RSZEw1L1VPR0FJTVlOVnJmaVJKQjVDSEtxN2I0?=
 =?utf-8?B?R0kxaUhnVnlRaVJDTTVINTVGWnZjamlmc1cyT1RiMWNCQzZ2dGxtTDR1azZk?=
 =?utf-8?B?MTdzc01ST0taUExIVzNya2dRN2d4SHhqRml4cmpzRUd0VkV3cWFGVHhWVDcv?=
 =?utf-8?B?NXB4THI0bkVmbnZ4d3hvZGhHa3lUUnQ3ODFibW1Hc1NMTEQ2djhFL1J1aWdX?=
 =?utf-8?B?M0NkMFZNdWlDcHZ2cHB5VzRnNjd3Wmt6ZXFoNUZVekd6YkdaMzdxOXUyRlhY?=
 =?utf-8?Q?HKgvC2joXdW1CDdCYww/7Ddi3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f30d8f46-a23a-434d-6a47-08da94c7eca6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 14:06:01.7183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xggZQP9fNPyFV60d2aodLiQz3nTCM7ax1oDuI7BaUkyGs2NJMJgSuLwdypYz07dX11Q9WsUezcoEWl01OSlcOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5128
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 9/12/2022 04:06, Shyam Sundar S K wrote:
> Whether to turn CnQF on/off by default upon driver load would be decided
> by a BIOS flag. Add a sysfs node to provide a way to the user whether to
> use static slider or CnQF .
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>   drivers/platform/x86/amd/pmf/cnqf.c | 57 +++++++++++++++++++++++++++++
>   1 file changed, 57 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/cnqf.c b/drivers/platform/x86/amd/pmf/cnqf.c
> index aebcef778a0b..8d0c1eff1659 100644
> --- a/drivers/platform/x86/amd/pmf/cnqf.c
> +++ b/drivers/platform/x86/amd/pmf/cnqf.c
> @@ -294,9 +294,64 @@ void amd_pmf_load_defaults_cnqf(struct amd_pmf_dev *dev)
>   		config_store.trans_prio[i] = i;
>   }
>   
> +static ssize_t feat_store(struct device *dev,
> +			  struct device_attribute *attr,
> +			  const char *buf, size_t count)
> +{
> +	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
> +	int mode = amd_pmf_get_pprof_modes(pdev);
> +	int result, src;
> +	bool input;
> +
> +	result = kstrtobool(buf, &input);
> +	if (result)
> +		return result;
> +
> +	src = amd_pmf_get_power_source();
> +	pdev->cnqf_enabled = input;
> +
> +	if (mode < 0)
> +		return mode;
> +
> +	if (pdev->cnqf_enabled) {
> +		amd_pmf_set_cnqf(pdev, src, config_store.current_mode, NULL);
> +	} else {
> +		if (is_apmf_func_supported(pdev, APMF_FUNC_STATIC_SLIDER_GRANULAR)) {
> +			amd_pmf_init_sps(pdev);
> +			amd_pmf_update_slider(pdev, SLIDER_OP_SET, mode, NULL);
> +		}
> +	}
> +
> +	dev_dbg(pdev->dev, "Received CnQF %s\n", input ? "on" : "off");
> +	return count;
> +}
> +
> +static ssize_t feat_show(struct device *dev,
> +			 struct device_attribute *attr,
> +			 char *buf)
> +{
> +	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
> +
> +	return sprintf(buf, "%s\n", pdev->cnqf_enabled ? "on" : "off");
> +}
> +
> +static DEVICE_ATTR_RW(feat);
> +
> +static struct attribute *cnqf_feature_attrs[] = {
> +	&dev_attr_feat.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group cnqf_feature_attribute_group = {
> +	.attrs = cnqf_feature_attrs,
> +	.name = "cnqf"

Perhaps you should have a "is_visible" controlled by a function that 
checks "is_apmf_func_supported(pdev, APMF_FUNC_STATIC_SLIDER_GRANULAR)".

This will then let you adjust "feat_store" to not have to check this and 
also only expose the attribute on supported systems.

> +};
> +
>   void amd_pmf_deinit_cnqf(struct amd_pmf_dev *dev)
>   {
>   	cancel_delayed_work_sync(&dev->work_buffer);
> +	sysfs_remove_group(&dev->dev->kobj, &cnqf_feature_attribute_group);
> +	kobject_uevent(&dev->dev->kobj, KOBJ_CHANGE);
>   }
>   
>   void amd_pmf_init_cnqf(struct amd_pmf_dev *dev)
> @@ -316,4 +371,6 @@ void amd_pmf_init_cnqf(struct amd_pmf_dev *dev)
>   	/* update the thermal for CnQF */
>   	src = amd_pmf_get_power_source();
>   	amd_pmf_set_cnqf(dev, src, config_store.current_mode, NULL);
> +	ret = sysfs_create_group(&dev->dev->kobj, &cnqf_feature_attribute_group);
> +	kobject_uevent(&dev->dev->kobj, KOBJ_CHANGE);
>   }

