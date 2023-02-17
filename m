Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA57BC6379F
	for <platform-driver-x86@archiver.kernel.org>; Fri, 17 Feb 2023 15:37:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbjBQPh1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 17 Feb 2023 10:37:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbjBQPh0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Feb 2023 10:37:26 -0500
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2056.outbound.protection.outlook.com [40.107.92.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32DD36F7FD
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Feb 2023 07:37:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mbiVe5k2YgfqJUEYCpg8Vr3dzuScJQJypvXI33UebMTaeq4pZfRUmNMu7fu7pDIpoce7zrNoy+XADASvyqZx3zs5yGG4EJYhSl4FCTm5eGFZcoPwVUf4b5stJFSLoiK8ynbbbfNn/BZgkgdCaV1xWA8NnXvnwvd83DrGROkc7HO2yrEVWkb5VPJW5Nx+z2JIYsuwhZW6hGiRjSvFvM24U5L97W7die7SwFeRSRNhkHh19UqGAuaEHR1NIHmm1JZtVWPrEIlIW1l5ZwnN0QVLlLEx3XBna8fNPPTOhWS4Hg/aC83Dj93/F6oQScocbvq6QbSbddcuEPf5rVOblRHN3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SoZox6uELnY3L9tKnKXtsUKm5srM2pSydR7BEg35A14=;
 b=QUEsPMNon4GJ3ny6Wf5aSZiI1qiDgJ7ODxlMwOGP/Dpk8NiXjpRZJUuc8edkoT5IqEQPL4VJ4TnrqLHyrMQAhw/IWhqTWFhbDIBjIygaXQrumtzmgfVmiTafPvyPKAq+I4RDMeJtx9M1Eo0bpKSXmIThLTYSAZODjUIMZ1O1r/i35Oqvu7FeiEUWdtbxFar1XTLC+lXTWLhLNL+ybtvTGk+h2WFpb1EVfAxbmz2OL/NiNfuj5uDhybzD3hZkqZObu73DSjwKuOCovQWLM1D3DQDFKBMzUMupSMhFPH9qLA1tZkESz1aZqsQSbJU8dZ3b1T8cRQTqdXSea6yU/Up4fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SoZox6uELnY3L9tKnKXtsUKm5srM2pSydR7BEg35A14=;
 b=upE/4ngoEYLsb032P1eFQb6GfIa198hXbnN7+gdHnkjxo4xKR4HZL2kMeAVO+ArrFzUuT2bqHFxxk9CcsNlwY2EZ404msLop33nFt2j9G2vXqgsE+jWO3943KWjWfnpXApwtyNWgqjPBXtFxmGpBsNsc1aW4YvGaPfeTAijy+aWYvKtTRPpYYC81RAS1RVgIVGAa5hBRAftYlmKLi/v5XpRQ3T1Q1kmByNVHUZ9CpwaNIB+BgQTO9LEXZeYm1Un2da2JS3Aerc3VtDVkxOWQTnmsKzi4uIbHbM8UMQO+smAtQesa43NE0ApOdb5LrFGO+z0QxNGrUy3eKLr2AlLeFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2763.namprd12.prod.outlook.com (2603:10b6:5:48::16) by
 PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Fri, 17 Feb
 2023 15:37:21 +0000
Received: from DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::6e75:2e:a53d:a7a]) by DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::6e75:2e:a53d:a7a%6]) with mapi id 15.20.6086.026; Fri, 17 Feb 2023
 15:37:21 +0000
Date:   Fri, 17 Feb 2023 09:37:19 -0600
From:   Daniel Dadap <ddadap@nvidia.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Luke McCarthy <mail@lukehmcc.com>,
        platform-driver-x86@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [PATCH v2] platform/x86: nvidia-wmi-ec-backlight: Add force
 module parameter
Message-ID: <Y++fL1Wzy+6CYBYj@ddadap-lakeline.nvidia.com>
References: <20230217144208.5721-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230217144208.5721-1-hdegoede@redhat.com>
X-ClientProxiedBy: DS7PR05CA0095.namprd05.prod.outlook.com
 (2603:10b6:8:56::29) To DM6PR12MB2763.namprd12.prod.outlook.com
 (2603:10b6:5:48::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2763:EE_|PH8PR12MB7277:EE_
X-MS-Office365-Filtering-Correlation-Id: cd1f4b11-c4c0-4773-a415-08db10fcdc3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Omni9r08TIiYmFaI70wnOZVswV3pEXccldyfEWTswZMZkDA/ZTkUgRgJDu2S93XWm5ScugQ/whKq1QcuEWM/yVC/H9wkvwpqoAccKGsuUuVHdwWYAsulltho8N+eGiOnWUHB8Twftp83mqoA3o3163FR3ODFm1EwMoy1llt7AiABVw977xeseMvJZn3GkIoOGK78iNwUlOAChl6yL1iRleL9MbTOclMz0rRWlCYgiryIbvReHTjTlLYH/jLgXQlqHX7/3igzdqkxGRLi6V6YK4mU8VudutyhUpKwZJNs0Abg4+q81gShOS+vRW8VEW41yPt8VhRO/BRo6NjnPuM5Vb53ppiLMo8Bpre6Ea20IklBx8kP64QNSnm/jvqsUdl1Atmn5fprNDJU5TjdpmdS2ZVVTG/i7noCO+8ZAObW96MCNQ4ps3LZAH4OC+TlK5wL+hWsqt1K+V5dTKpEA+4yJ27qPo0qv55JPCem9uUT4rbYaQkBY2150qRuBFjl9rZSqg7V2vWeC6h0Q3i0PsdGbn4RK3g5T9dfxUDwQw0j1OhCIFHSkeW/Rjinw03Mu8N+Voqnq3cILEfiiV3QtaoEnufmPtjs9hLZFed+i2xGJ+bNyiAYC879eqgA3aI7DjuDS6TrD+qFdSPwsFU4bDILjPlPw8SkP+1rlU6C3PwtnmBXio+YKmdjz9kyEiO88IAGALIurlvKzbKNtr9GMTekeEfRsk10n3UFVwEKWnMu5uk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2763.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(451199018)(966005)(6486002)(83380400001)(86362001)(38100700002)(6512007)(26005)(186003)(6506007)(4326008)(6916009)(8676002)(66946007)(66476007)(66556008)(41300700001)(8936002)(478600001)(2906002)(5660300002)(316002)(54906003)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V/BCYYAuZyrc97VqYBfoEGC8RIt8rlQOkZDgf1XyaTUhkk3DhUC+ngbrC6IA?=
 =?us-ascii?Q?hKE9VDf51NeKtWhYZxiNTCmeWv9ydDncEWhj8PERutUAWXGZ78BSwv+GnKOY?=
 =?us-ascii?Q?Q4aAK/RXIN//eUETWRKFXjsK6WSeaeKge2/bLMbssM/7kOkqtoXsj/8eCjE8?=
 =?us-ascii?Q?neY6ZaV8lghrDKU6roAxRy4MI0JffkCofIY6hpRjz9yKNMRTKolS+Sn0XeCJ?=
 =?us-ascii?Q?0SsEmh6h9XWNjIQbwp2MSsGwVtgRdbCp62E5Q/r6Sl/1JwydqqM5PAnRXpGF?=
 =?us-ascii?Q?6yIEDLC9de/0TPgCFuuQTL+7VqCROUH8qjFsCkljZD5XyqYl32WGbj84Vmrp?=
 =?us-ascii?Q?9txeDb8aRs6IiZS6qyilaSv3IzYdqwdFW132ou+H3EUFsgSC0qeyL3Ih9IHE?=
 =?us-ascii?Q?BGSO3rrrbxJMbJJx23wNUxMoTgfX8norcXeRYObdvPQnGb5+Z7YzkYwSYes0?=
 =?us-ascii?Q?SK61n3Stxu4CXOzArI9T0CkX/1JJf91+DFg3vYPfRGwpDF/Hn9Jekx5hENCG?=
 =?us-ascii?Q?ZmbHCNgAnydOpU6UNQD1IKct046vl1/NxL7naMkU6g9ZSjI+Ixwgtd1WJNkU?=
 =?us-ascii?Q?bSHyQWHqQOxCfHxAsSiuWQcNZJNI9lNNdeIaorYGH0AJPZ5iTZhOfvAEgClE?=
 =?us-ascii?Q?MkDo4OyV+UvpqYXiyhSZG3sBc/OhC09fwMhLlOVU3QbLCrVL0d/7wRSgXwUQ?=
 =?us-ascii?Q?2UAPjqadtNHUg5PHp+OIPiiTO48x8AsyoNWup4DZzG4Zad0Zpz6hU2bgg7AI?=
 =?us-ascii?Q?WYNbcgpeSkGicBt0SW5ehED+vSMoslQAfmCMuJLI2K58W3jcmJ/eez8+N/Mr?=
 =?us-ascii?Q?O7/oOf9gtKyluTEvj0XgWT5rGOtHz0w/RJMsAifM1kTApebGiwgsoSAOhPjB?=
 =?us-ascii?Q?fBapNPFmsv66VM4W2+/IMLEIJwYuVl0EE+Y1yHAV9dykVImaMrrTJ3XfUmr1?=
 =?us-ascii?Q?H0IkpPGMqJ+GF+BsKi9FG000Kr6gbwIuKpzozjOWKkZK7u9n3DYwu0kANnGx?=
 =?us-ascii?Q?4FFAf74z/jGZFjb3Ob0xK4CbkSWxiCGZGbPhGuZeQ4jK0fC83+F/h2pJEUEf?=
 =?us-ascii?Q?H2YUcsJb8Ii2loXqDs/utZiIKKuej2RRFEnyr1F9mIkvfDcGakhmsvrq4H4A?=
 =?us-ascii?Q?05bpQwXj2XXHguUHIvnA7kAVYtv8rkFyHb9Uh9K7tfv0gQzxta3RKhVTVy/5?=
 =?us-ascii?Q?ABT/r8U3QLcTnW+uOPDvHr0Aoxoux6mejR3ll8dZovENqdr6akbF4W0ZYzi3?=
 =?us-ascii?Q?/RHmVSmEAhAObYTPSBDjIM850YsizsysOqXQf3FxxbHpJolJ3q3TpsIq2xLO?=
 =?us-ascii?Q?JJ76qqJEjTtAEGdOpBHYKaMEsyUysxro9bdqSY0ljhPrGQWIR5IACPIQ3gch?=
 =?us-ascii?Q?JW3kATeLtC7npUc/ZTaBJJSwntNwT5r2iR5GFYzlde8aSM9wBYjcJwQoXmOv?=
 =?us-ascii?Q?pbP4+P3EQierrYcfkqkqYur+SAu8+EU39cTrW8wxyoQJggeXA5smG0oRnfO4?=
 =?us-ascii?Q?7tzR/3tgG/5UuNNnQOM427dEoQXeyu/oxaCWI0sHWzQw4KnieeUInaHkwbJh?=
 =?us-ascii?Q?LsdjPlWA5KDQZOIHehKz8nwrxr7iUrsb87yqRbdw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd1f4b11-c4c0-4773-a415-08db10fcdc3e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2763.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 15:37:21.7515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VL7zlVZMT67JIWniGIfXaU0AR8ul/kmeXq5XFbeL4qOkEA2Cj1m94Oz/2dtPaCdQ2/iBE/oC3znL+CyDkYQDbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7277
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Thanks, Hans. The new commit message sounds more appropriate.

Reviewed-by: Daniel Dadap <ddadap@nvidia.com>

On Fri, Feb 17, 2023 at 03:42:08PM +0100, Hans de Goede wrote:
> On some Lenovo Legion models, the backlight might be driven by either
> one of nvidia_wmi_ec_backlight or amdgpu_bl0 at different times.
> 
> When the Nvidia WMI EC backlight interface reports the backlight is
> controlled by the EC, the current backlight handling only registers
> nvidia_wmi_ec_backlight (and registers no other backlight interfaces).
> 
> This hides (never registers) the amdgpu_bl0 interface, where as prior
> to 6.1.4 users would have both nvidia_wmi_ec_backlight and amdgpu_bl0
> and could work around things in userspace.
> 
> Add a force module parameter which can be used with acpi_backlight=native
> to restore the old behavior as a workound (for now) by passing:
> 
> "acpi_backlight=native nvidia-wmi-ec-backlight.force=1"
> 
> Fixes: 8d0ca287fd8c ("platform/x86: nvidia-wmi-ec-backlight: Use acpi_video_get_backlight_type()")
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217026
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> - Reword commit message
> ---
>  drivers/platform/x86/nvidia-wmi-ec-backlight.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/nvidia-wmi-ec-backlight.c b/drivers/platform/x86/nvidia-wmi-ec-backlight.c
> index baccdf658538..1b572c90c76e 100644
> --- a/drivers/platform/x86/nvidia-wmi-ec-backlight.c
> +++ b/drivers/platform/x86/nvidia-wmi-ec-backlight.c
> @@ -12,6 +12,10 @@
>  #include <linux/wmi.h>
>  #include <acpi/video.h>
>  
> +static bool force;
> +module_param(force, bool, 0444);
> +MODULE_PARM_DESC(force, "Force loading (disable acpi_backlight=xxx checks");
> +
>  /**
>   * wmi_brightness_notify() - helper function for calling WMI-wrapped ACPI method
>   * @w:    Pointer to the struct wmi_device identified by %WMI_BRIGHTNESS_GUID
> @@ -91,7 +95,7 @@ static int nvidia_wmi_ec_backlight_probe(struct wmi_device *wdev, const void *ct
>  	int ret;
>  
>  	/* drivers/acpi/video_detect.c also checks that SOURCE == EC */
> -	if (acpi_video_get_backlight_type() != acpi_backlight_nvidia_wmi_ec)
> +	if (!force && acpi_video_get_backlight_type() != acpi_backlight_nvidia_wmi_ec)
>  		return -ENODEV;
>  
>  	/*
> -- 
> 2.39.1
> 
