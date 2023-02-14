Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD5CC05027
	for <platform-driver-x86@archiver.kernel.org>; Tue, 14 Feb 2023 17:32:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230379AbjBNRcH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 14 Feb 2023 12:32:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231294AbjBNRcF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Feb 2023 12:32:05 -0500
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2083.outbound.protection.outlook.com [40.107.94.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81DC72C661
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Feb 2023 09:32:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hOQp5MgIAQMWLUerTBPmzFM4NAOQbme7o5L7VJ+L6M9ykzpLUuvw6cR4L86HweCUEc/ndqzbVHBGpDTTMRwS7ylrI2A3hn1jUfSWfNK9l3a4WXQIpn5N5W3hRU6fyXE4OL9gZpOyIt6e8btFBoG2cfAKxQ9TdGxw07KGByzoL2K/fyhRZxs3Mgn1dnSICCy8gGhEeqBJKo/+JEh1ebleLQ1IFBItB85ozEfuzQtcofciK2Kt3XUa/nbkqsf8TLSLmRm58YuOnhueeAXF+QbiW5qg1O28TljYWDhPCr2tU6Q6Qi1fA9Ql5obw2Wa6dUtRhUVikcZep72TyIefa9sPww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=edSQnsgU4yDr5DzK/pRnFN1UYv9WnOwj93TIUM5tXjc=;
 b=NPRCeLfw7KuumqDeyrqBd2fZVXgLsY4pVYpHakajnpme0P9OxpeneVeubGie7XVrjMyRX95Go7M3jbaqW8PvmfK4HKir179RooEsyNS8pMBBGdZubg8+u3F7sjnITF+1MZYnBS6EQMDPpv8ZYOPkzPnAsM30jwWaRLjlKGVpwSWLGWu2AC0z8LsoZ73XRRtolk3OP6CluuT/LD/vKy78r9Lf6dceVYE5+GMes5Oq4cnvnYwaY4VEcygJ9JAqLm/UltY4x5yikppQBOkDSfTGojBQ2hWQtqSAl63OgnaWJKvW1NoHnIHP4yCgKgyEuUba5Vac3b69UHM9kJ0pFAobpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=edSQnsgU4yDr5DzK/pRnFN1UYv9WnOwj93TIUM5tXjc=;
 b=Em2TcBAjdHNhD1GJPEfUCb5yQymJAYpgfCIRyl0yA4fpKMGaMr/2cVdYOSGCwgvkc9utKwu0AwP7jhEEzVC0UbBqf/g30reu2DAUiEaeMggdVNjFoLINMJZNYS4orHbrgml/f/21mHKZKdK9u6zvdbSFHdV0T2ekRUgVZfpMV8QQ4JVSo3K2VoJiWKKmTAk2SXTWxiOBkvjpK7Y2aK0rN318Tuqnxs4S1VWlIjmZpL+9bzze1kbV6Xs1++PBnrple3FAoRMl5MakV6DdhnXXBOeXj/d9xT6yCtTbN8wnrlrqtrjtOErmsza54ud3HmDedE9nxaTrO69OrN0q2gCS2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2763.namprd12.prod.outlook.com (2603:10b6:5:48::16) by
 DM4PR12MB5262.namprd12.prod.outlook.com (2603:10b6:5:399::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.26; Tue, 14 Feb 2023 17:32:02 +0000
Received: from DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::6e75:2e:a53d:a7a]) by DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::6e75:2e:a53d:a7a%6]) with mapi id 15.20.6086.021; Tue, 14 Feb 2023
 17:32:02 +0000
Date:   Tue, 14 Feb 2023 11:31:59 -0600
From:   Daniel Dadap <ddadap@nvidia.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Luke McCarthy <mail@lukehmcc.com>, regressions@lists.linux.dev,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: nvidia-wmi-ec-backlight: Add force module
 parameter
Message-ID: <Y+vFj3sRMDuPmvqc@ddadap-lakeline.nvidia.com>
References: <20230214163435.7065-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230214163435.7065-1-hdegoede@redhat.com>
X-ClientProxiedBy: SA9PR13CA0003.namprd13.prod.outlook.com
 (2603:10b6:806:21::8) To DM6PR12MB2763.namprd12.prod.outlook.com
 (2603:10b6:5:48::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2763:EE_|DM4PR12MB5262:EE_
X-MS-Office365-Filtering-Correlation-Id: 43abd8ef-a80f-4173-5dac-08db0eb16229
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XqD4yJVtPOG6WD8uFkf9boASkjGqfMLbL6qVxcSO3x/garcNA4yCJHB7qhT/kDQgrQ06qsH/8vzklrWV/dBb0HMGxQQiOjs8cKWXhhASbJjfUnJdWztGLT4GROtUM+fbHHSJgC8kywBvXGzTS+uCbr39ZUXEOsczXrUwvhcD6RVcwIk5Gpr28QYfclTiUM1dzmO8jkvl0cvXS22tN5w9ltauWgXueK22T9Prrr4GZhegyDZP4NK4092fa4FybJNmTX/j96GL0pmcwQb0MNWCvGJcMGdOu8Xerm6XLj7pEyDrgbquQAL5SpfXy9i7d9Hz0GSiXUtKtUuFuQhpqx3ONhqVLSZJNytB5+KaaaV8rzj0m90raL2FpAg3rd6A1aER7/ixuB0wUxKvpy9y/w/dLugVih2LfTb31lTdvc8J5RnS31AlzQuKdE9lUr3dROsB7xKU+LIyoJUK5fw5G37vZGY3+9cPjiiNqufwEEw5M3JNS3r656Noz27q3H3prATEm3SzU2P/XsrcID9i40ft7rZszH+pLtjb+De2lTxxc7nPtsvvpGMvdtm+IRe/MVuRsqcuT5nFj7XNfpp/YdZn03r/HJPzlU1QO/NerA8xxlimtmbTv+IaT8R2Z78U6LdOK4K5+1W/mvl67OnF4XHP2nPdhUuwgVUBEpshuKcMxFqrqJSe531ix8SXhv0TeyB8ucg1ulVbJsbRVJIDWjua+xczGWlEcgrlDDlWUA9kjOucLyxR7+PDwp7+dGMMAdTL
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2763.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(136003)(396003)(376002)(346002)(39860400002)(451199018)(478600001)(6666004)(2906002)(6506007)(966005)(6512007)(26005)(186003)(38100700002)(6486002)(5660300002)(8936002)(86362001)(54906003)(316002)(66476007)(66556008)(6916009)(83380400001)(41300700001)(8676002)(66946007)(4326008)(21314003)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+kEziI1SiQsugWv9t6rUQCYw8ChMfoG4JNemD0o0qCJqOWi3OCE/EA2+fP1/?=
 =?us-ascii?Q?NjhR7a2+vrBGJvk8n4QM5AUbgY994h+MHFySy6qFcAhp7oO9ObUC6skDtcLz?=
 =?us-ascii?Q?4pFnaeF7o3ZImJYU/Ye1yZxyw/09kKj2DIC9+WYK6uKzBkFz83HJdHE6ZkD8?=
 =?us-ascii?Q?tMFGfldmIwpu78T9oHO+HXW14ygpScpxdXDBLp3BuZVoPTGTw4A+DFE4I7lX?=
 =?us-ascii?Q?PYl53eyILkEgNCUbBldJz5FxmV7Jax7U4wT7vTZ7WhTjP+xSMnlOfxl9ZIPh?=
 =?us-ascii?Q?or2WPITF3VR0oEuGjX4SMreSr73UEb82nl276NMrDl0WEXkp4VK1fkzBK/ec?=
 =?us-ascii?Q?w4w7acUYJOJdFozCNu/kbdgLWYw7P4q3dBhx/7gwRGl0X9tJYW856CwhnMpU?=
 =?us-ascii?Q?0wVSo/KHdrET+pTmPA6Ek5YuFAUR94yUS2NtiKFz6bWQ4pfH02jPIUhw6jZH?=
 =?us-ascii?Q?TBFeSN/uApN8dG0zfGNX6dQW98PaRRNbBDMKbMMaDLsZSdt6Plxd1GZbFDI+?=
 =?us-ascii?Q?x1FY7GW5diZr19H762XxvzMnp63svx9vx8/3VilTBIAlphxH+OPCt1iGkUUP?=
 =?us-ascii?Q?nURhdx4oUkzo53l2nM5Ph7RQwf5ykNbDogQH6uOR32vG3XxNiKyQRbmTc1lY?=
 =?us-ascii?Q?JNa5sefiLi/4yd+NMaD4X3XlaNhl/15odDfC6AcSt82BzQ947HBFKJ8ra2Xm?=
 =?us-ascii?Q?3KnBP37I8Dv5qCe/qcuTktYO/T0GVeGMu02lp5roYpoTN+K11o4jg3lERlMl?=
 =?us-ascii?Q?tfbCIAR+7ym6m5RJjiU7LlyLKln4/k9PcJbUxDdgXHoGKgxf1ymGLfXq3o/J?=
 =?us-ascii?Q?aAoArN0sVnZsMaVcit+0FSJZkBcu8WTffDLmX51lMSuuAeFP+P7itmiz6AyL?=
 =?us-ascii?Q?E0RUpnyyvJQpLcOAvWmRGIhsoZweWssdYJ9OhmcNyW5H/wNmVDrWoM5XD7U/?=
 =?us-ascii?Q?GidyRvIdgouERHyTl/tzb/cVUW9chafXtV13huEnxbne10V185mBw6crGlkp?=
 =?us-ascii?Q?gZUVGOnVN2drTqCZ0f/O72aIoAvW6BRVUQHiEchvfmBwcIU6/cmoyxzZ8A5H?=
 =?us-ascii?Q?YYqapbWhoQtxjx0fpHtypg5wd/G9tW/cCHS20YZkcaPlfUDMUWlurxGDO/gx?=
 =?us-ascii?Q?Ry61q6y6UE5Bx/dPX/IS7zz5YvrGA8vxxKPGAfAkQRQoqm17Dm8sWosddzJY?=
 =?us-ascii?Q?i7UaMlxXRyJUX/qcm9VDt9540YzdPFVi7kL8VV1RnJNc3S0H1ibjPuDIF5hA?=
 =?us-ascii?Q?g6DjYMvr2LMVdOzl5h5sWwMhCtfHYDNhl8UpkI16hjX0Gkq7a9f13CFyHfd0?=
 =?us-ascii?Q?4o7VPFsTAdAGtB57D+hbCosP9iaMj1P0oLueDW34cIRIU1QOA5gITGPTTy2T?=
 =?us-ascii?Q?aAx9PA01kc4LZcougUCadbmiCQkZzSLU/SVAbnmaU/FV0XDNl1/yIXzKEnNn?=
 =?us-ascii?Q?QjJO4dl6ev8vTWtUbc+UnXlr6nS8xY7zZnJHogut/vtLoin3diHdCqQblYA0?=
 =?us-ascii?Q?R9QHsaqMS3WP5Oq8Y2SebTZJgEKOaZ+mj8YROEHw4oM9xPC+aMX/RKcGY1aI?=
 =?us-ascii?Q?wHQ3i7bfN7AF/bRsfXCgnDRRBbJNFQ3475Tr5tLn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43abd8ef-a80f-4173-5dac-08db0eb16229
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2763.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 17:32:02.3810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UqZlFEgEXjPTzZrlUCMLZKpxgAno3smILAupk9dvSj8duVXNKrfgZYHW7XbDf0/YtIsuEy4yoLUfM0ALfkPp+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5262
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Thanks, Hans:

On Tue, Feb 14, 2023 at 05:34:35PM +0100, Hans de Goede wrote:
> On models with the Nvidia WMI EC backlight interface, when the laptop is
> configured in dynamic mux mode in the BIOS the backlight should always be
> controlled by the Nvidia WMI EC backlight interface.
> 
> But it turns out that on some laptop models, E.g. Some Lenovo Legion models
> /sys/class/backlight/nvidia_wmi_ec_backlight only works when the LCD panel
> is muxed to the Nvidia GPU and when muxed to the AMD iGPU amdgpu_bl0
> controls the backlight.

I'm not certain that this description is accurate. From my understanding so
far, the problem is that the working backlight device changes at runtime,
regardless of the mux state. Recall that we don't actually have support for
dynamic mux switching, yet, so if the system is booted in dynamic mode, it
will remain muxed to the AMD iGPU the whole time.

In theory the EC should in charge of backlight control at all times when
operating in dynamic mux switch mode, regardless of which GPU the mux is
switched to. However, on some of the Lenovo Legion models it appears that
occasionally the backlight control falls to the native interface, instead.
The user who initially reported this class of issue observed that only the
EC backlight interface would work upon a fresh boot, and only the native
AMD iGPU interface would work after a suspend/resume cycle, and it would
continue to work after further suspend/resume cycles. The second reporter
observed that the EC backlight interface was usually active when connected
to external power, and the iGPU native interface was usually active when
running off of internal battery power, however, occasionally this wouldn't
hold true, with no discernible pattern.

This third report sounds a little bit different: it is stated that different
interfaces work to "change the brightness of the screen depending on if I
was using the AMD GPU or NVIDIA GPU to display the current application." It
is unclear to me what it means to use a GPU to display an application: my
interpretation of this is that the system is configured to use PRIME Render
Offload, and the desktop is being primarily driven by the iGPU, while select
applications are explicitly render offloaded to be driven by the dGPU, but
displayed on the iGPU, since the display always remains muxed to the iGPU.

Since we don't fully understand what is going wrong, yet, it may be safer
to leave the mux out of the description of the problem that this patch
restores the ability to work around for, and say something more vague like
"On some Lenovo Legion models, the backlight might be driven by either one
of nvidia_wmi_ec_backlight or amdgpu_bl0 at different times."

> This appears to be a firmware bug on these laptops, but prior to 6.1.4
> users would have both nvidia_wmi_ec_backlight and amdgpu_bl0 and could
> work around this in userspace.
>
> Add a force module parameter which can be used with acpi_backlight=native
> to restore the old behavior as a workound (for now):
> 
> "acpi_backlight=native nvidia-wmi-ec-backlight.force=1"
> 
> Fixes: 8d0ca287fd8c ("platform/x86: nvidia-wmi-ec-backlight: Use acpi_video_get_backlight_type()")
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217026
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
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

This is a bit of a nit, but it took me several times reading the description
to understand that disabling the acpi_backlight check refers specifically to
disabling the acpi_video_get_backlight_type() check within the EC backlight
driver. My initial read was that it is intended to disable the various checks
in drivers/acpi/video_detect.c, which it does not. Something along the lines
of "(ignore acpi_video_get_backlight_type check)" makes the intent a little
bit clearer, I think.

Apart from the commit message and documentation nits, I think that this patch
makes sense:

ACKed-by: Daniel Dadap <ddadap@nvidia.com>

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
