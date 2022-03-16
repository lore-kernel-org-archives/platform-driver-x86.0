Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB117C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Mar 2022 21:29:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358231AbiCPVaR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Mar 2022 17:30:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358195AbiCPVaJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Mar 2022 17:30:09 -0400
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam08on2065.outbound.protection.outlook.com [40.107.100.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 898902F02E
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Mar 2022 14:28:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dIoHDQ+tsuUtneYtrKw17EmUeHUf7zjsErMEHIJllteKrXVNOVe0EMDkIuRGet/wZ5slcNFEiT1Mr3GO+ujeUoMZ8xTzmCjqrU1eu0NwN2s03S6pFfn/5L6JId4ofEmnsnfxIcURV+4Fn9NV26NTQHFFmQ+z9l1yfmtwkacGFylONGmzXiH7Q69ZX+MEOupxVijGP4GmYftsEptB8KOVcIJelRok2cpCC5fAbUMepzrD1GiSortBkP96viUoIIChMg6Sp6bPlyxk+8CoKmD2LsyE0KGxOHRNyGVor4g99j5aqcbPa/1zdwY+L7ubGAD3gW65vJCVMpNO4dPDYHLfRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sjq0HtRJkrTTizK9vcTzazlYqkNy6+JsP3QkZIOoVuA=;
 b=Ad0RbJun0yvBSjG7NDbVpRjzDfX08yhwXTFVzEzLsWu+fNkC4aSp+3KKLqOc2i3srLg2mTWNy6QK7XpVGyBdOcl5j5NqpzOocOYPTGUjZ3juN1iZE8AsLWa7TnzM4+0BpMYlq6TlMJ9C9pkqukEzmoRzxLzAzZuf81VKu6G0ByKnkINvEtiezFewx3FUCxZFf1xnxxcVBhYAY7/HQVHjpf0l5N8ezCFcdQZbV+n/DvwdqIHQ62OFRdHv5Hxoo4J+iq0c30Yg/1+qO5z/WnJKa39Na5QHa8xZM3RetluROj5t1oOvPJVbzsZv3VRkO+S4t08JT53xH2EF7+wZggi22w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sjq0HtRJkrTTizK9vcTzazlYqkNy6+JsP3QkZIOoVuA=;
 b=XKzy0BK1DwiopdXn/yg5DXN0rhB5hN7TgaSRYbkrdtBqFP+YFIeEMLc5cYDNU7M4VRW15TNNQOxZpWjY7UkRixb6gtaA2UdZz1zb9DcFPS6D/JqRG5s+NpaxPzm3iOzk3bNucIKyOu5xhVoEF+tc+PzrksHPzZcVmum+YTyIWaYHqbFJF/phfyeP2xyRc9Z6B/Hs01T9I3oVpDsDy0F01KNvln+Bm52izD/5OqeUDc0IHEBVa0b8hJqHgLtKHoyvznmrSrthrDPuBnk9Txc6g2k7WceiFi1eyunSnGPkc3R/xZfrcRet5jGy195zt0nw5IqBpS26JL4AU8tap+0/Aw==
Received: from MW2PR16CA0054.namprd16.prod.outlook.com (2603:10b6:907:1::31)
 by CY4PR12MB1544.namprd12.prod.outlook.com (2603:10b6:910:9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26; Wed, 16 Mar
 2022 21:28:46 +0000
Received: from CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:1:cafe::54) by MW2PR16CA0054.outlook.office365.com
 (2603:10b6:907:1::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.28 via Frontend
 Transport; Wed, 16 Mar 2022 21:28:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.236) by
 CO1NAM11FT048.mail.protection.outlook.com (10.13.175.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5081.14 via Frontend Transport; Wed, 16 Mar 2022 21:28:46 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Wed, 16 Mar
 2022 21:28:45 +0000
Received: from [10.20.113.98] (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 16 Mar
 2022 14:28:43 -0700
Message-ID: <26e0d196-5b2d-6bdc-8cbf-19c5bb9736e4@nvidia.com>
Date:   Wed, 16 Mar 2022 16:28:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2] nvidia-wmi-ec-backlight: Add workarounds for confused
 firmware
Content-Language: en-US
To:     <platform-driver-x86@vger.kernel.org>
CC:     <pobrn@protonmail.com>, <hdegoede@redhat.com>,
        <markgross@kernel.org>, <Mario.Limonciello@amd.com>,
        Alexandru Dinu <alex.dinu07@gmail.com>
References: <0fbfd32e-904d-1e04-8508-e863c357a2ff@nvidia.com>
 <20220316203325.2242536-1-ddadap@nvidia.com>
From:   Daniel Dadap <ddadap@nvidia.com>
In-Reply-To: <20220316203325.2242536-1-ddadap@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b20032c7-ae89-4364-699c-08da0793f421
X-MS-TrafficTypeDiagnostic: CY4PR12MB1544:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB1544532A75CA612D87D7D06EBC119@CY4PR12MB1544.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bH8SD+jaVfSi8ZvhuFX/si52YjJJhjuvy7lRFmdv6tO1ZMmV3NfSb3BiLM0e/FhuUFhOuhV6NkL0HDqC6PVNfJBDPB6X2SHBwkUiH41PtfwBBTQO08Nih0sQbYem72dWsd8yc1VCwTrG0pQKEtp38o+yIKUfraL37bZlc4lB9KQ48zcADObKO6h1zM1USzd6nqgWqQ+n+8YCC767v0/oNqJFXjM+TuOmeH7gVp6qnXphgt2iHk9NZWFssqCfGfL8dOqO0LfsOfCDRXDBFm8STSMGu3ftvSurz9YRUW0gqJF+apMF26W9bHlgP5kHXGchHYdWHEe3d9sB7PomIb115JnS6Js2AOnbB5alr6cmJ3mUVjCw8DQGismArQ+Z/OMbjCejtXBIjH0dQWd1AosyUW4Xf3jBJD9QcwqGRe4HPA/ydmSnuv/vsNMqsXDDqMBvfxFlG7BxP8hjkN7nQQA7XnVNjMb7FO7MwoUTSOj7IkEBbprhiVd4x7hFpq1QWtwZKdQN/XhPEnjz0YLtH7V/KSYTygie4MPOhL9lCIgI0YtbogJZkDj8SheuGoEJto44ECOYGYbn0BiJ272H/OAIf4N/nwoUXl6CA5+Bmo5ntIeKTgAw6KSaGmR4fRJoBn0WY6ak+CFRWZcRqli0vLn73LJM82HYzeH5mp1AqYrv5OeDt6qXBZn/Ams+k0unga5PBXfP52iFrjO0Tqnr7gxxAuTkTh+/X1ttN/L05SZ2PupONnZOVRks35MZHdfAPx0k
X-Forefront-Antispam-Report: CIP:12.22.5.236;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(2906002)(36860700001)(66574015)(36756003)(426003)(336012)(83380400001)(186003)(5660300002)(16526019)(31686004)(2616005)(26005)(8936002)(30864003)(47076005)(6916009)(54906003)(16576012)(508600001)(70586007)(70206006)(81166007)(86362001)(356005)(316002)(31696002)(53546011)(4326008)(6666004)(82310400004)(40460700003)(8676002)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2022 21:28:46.2357
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b20032c7-ae89-4364-699c-08da0793f421
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.236];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1544
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Sorry, just noticed a typo in a comment:

/* This quirk is preset as of firmware revision HACN31WW */

Obviously that is meant to read "present". I'll fix that with the next 
round of changes, assuming there will be additional review feedback.

On 3/16/22 15:33, Daniel Dadap wrote:
> Some notebook systems with EC-driven backlight control appear to have a
> firmware bug which causes the system to use GPU-driven backlight control
> upon a fresh boot, but then switches to EC-driven backlight control
> after completing a suspend/resume cycle. All the while, the firmware
> reports that the backlight is under EC control, regardless of what is
> actually controlling the backlight brightness.
>
> This leads to the following behavior:
>
> * nvidia-wmi-ec-backlight gets probed on a fresh boot, due to the
>    WMI-wrapped ACPI method erroneously reporting EC control.
> * nvidia-wmi-ec-backlight does not work until after a suspend/resume
>    cycle, due to the backlight control actually being GPU-driven.
> * GPU drivers also register their own backlight handlers: in the case
>    of the notebook system where this behavior has been observed, both
>    amdgpu and the NVIDIA proprietary driver register backlight handlers.
> * The GPU which has backlight control upon a fresh boot (amdgpu in the
>    case observed so far) can successfully control the backlight through
>    its backlight driver's sysfs interface, but stops working after the
>    first suspend/resume cycle.
> * nvidia-wmi-ec-backlight is unable to control the backlight upon a
>    fresh boot, but begins to work after the first suspend/resume cycle.
> * The GPU which does not have backlight control (NVIDIA in this case)
>    is not able to control the backlight at any point while the system
>    is in operation. On similar hybrid systems with an EC-controlled
>    backlight, and AMD/NVIDIA iGPU/dGPU, the NVIDIA proprietary driver
>    does not register its backlight handler. It has not been determined
>    whether the non-functional handler registered by the NVIDIA driver
>    is due to another firmware bug, or a bug in the NVIDIA driver.
>
> Since nvidia-wmi-ec-backlight registers as a BACKLIGHT_FIRMWARE type
> device, it takes precedence over the BACKLIGHT_RAW devices registered
> by the GPU drivers. This in turn leads to backlight control appearing
> to be non-functional until after completing a suspend/resume cycle.
> However, it is still possible to control the backlight through direct
> interaction with the working GPU driver's backlight sysfs interface.
>
> These systems also appear to have a second firmware bug which resets
> the EC's brightness level to 100% on resume, but leaves the state in
> the kernel at the pre-suspend level. This causes attempts to save
> and restore the backlight level across the suspend/resume cycle to
> fail, due to the level appearing not to change even though it did.
>
> In order to work around these issues, add a quirk table to detect
> systems that are known to show these behaviors. So far, there is
> only one known system that requires these workarounds, and both
> issues are present on that system, but the quirks are tracked
> separately to make it easier to add them to other systems which
> may exhibit one of the bugs, but not the other. The original systems
> that this driver was tested on during development do not exhibit
> either of these quirks.
>
> If a system with the "GPU driver has backlight control" quirk is
> detected, nvidia-wmi-ec-backlight will grab a reference to the working
> (when freshly booted) GPU backlight handler and relays any backlight
> brightness level change requests directed at the EC to also be applied
> to the GPU backlight interface. This leads to redundant updates
> directed at the GPU backlight driver after a suspend/resume cycle, but
> it does allow the EC backlight control to work when the system is
> freshly booted.
>
> If a system with the "backlight level reset to full on resume" quirk
> is detected, nvidia-wmi-ec-backlight will register a PM notifier to
> reset the backlight to the previous level upon resume.
>
> These workarounds are also plumbed through to kernel module parameters,
> to make it easier for users who suspect they may be affected by one or
> both of these bugs to test whether these workarounds are effective on
> their systems as well.
>
> Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
> Tested-by: Alexandru Dinu <alex.dinu07@gmail.com>
> ---
> Note: the Tested-by: line above applies to the previous version of this
> patch; an explicit ACK from the tester is required for it to apply to
> the current version.
>
> v2:
>   * Add readable sysfs files for module params, use linear interpolation
>     from fixp-arith.h, fix return value of notifier callback, use devm_*()
>     for kzalloc and put_device. (Barnabás Pőcze <pobrn@protonmail.com>)
>   * Add comment to denote known firmware versions that exhibit the bugs.
>     (Mario Limonciello <Mario.Limonciello@amd.com>)
>   * Unify separate per-quirk tables. (Hans de Goede <hdegoede@redhat.com>)
>
>   .../platform/x86/nvidia-wmi-ec-backlight.c    | 196 +++++++++++++++++-
>   1 file changed, 194 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/nvidia-wmi-ec-backlight.c b/drivers/platform/x86/nvidia-wmi-ec-backlight.c
> index 61e37194df70..95e1ddf780fc 100644
> --- a/drivers/platform/x86/nvidia-wmi-ec-backlight.c
> +++ b/drivers/platform/x86/nvidia-wmi-ec-backlight.c
> @@ -3,8 +3,12 @@
>    * Copyright (c) 2020, NVIDIA CORPORATION.  All rights reserved.
>    */
>   
> +#define pr_fmt(f) KBUILD_MODNAME ": " f "\n"
> +
>   #include <linux/acpi.h>
>   #include <linux/backlight.h>
> +#include <linux/dmi.h>
> +#include <linux/fixp-arith.h>
>   #include <linux/mod_devicetable.h>
>   #include <linux/module.h>
>   #include <linux/types.h>
> @@ -75,6 +79,73 @@ struct wmi_brightness_args {
>   	u32 ignored[3];
>   };
>   
> +/**
> + * struct nvidia_wmi_ec_backlight_priv - driver private data
> + * @bl_dev:       the associated backlight device
> + * @proxy_target: backlight device which receives relayed brightness changes
> + * @notifier:     notifier block for resume callback
> + */
> +struct nvidia_wmi_ec_backlight_priv {
> +	struct backlight_device *bl_dev;
> +	struct backlight_device *proxy_target;
> +	struct notifier_block nb;
> +};
> +
> +static char *backlight_proxy_target;
> +module_param(backlight_proxy_target, charp, 0444);
> +MODULE_PARM_DESC(backlight_proxy_target, "Relay brightness change requests to the named backlight driver, on systems which erroneously report EC backlight control.");
> +
> +static int max_reprobe_attempts = 128;
> +module_param(max_reprobe_attempts, int, 0444);
> +MODULE_PARM_DESC(max_reprobe_attempts, "Limit of reprobe attempts when relaying brightness change requests.");
> +
> +static bool restore_level_on_resume;
> +module_param(restore_level_on_resume, bool, 0444);
> +MODULE_PARM_DESC(restore_level_on_resume, "Restore the backlight level when resuming from suspend, on systems which reset the EC's backlight level on resume.");
> +
> +/* Bit field values for quirks table */
> +
> +#define NVIDIA_WMI_EC_BACKLIGHT_QUIRK_RESTORE_LEVEL_ON_RESUME   BIT(0)
> +
> +/* bits 1-7: reserved for future quirks; bits 8+: proxy target device names */
> +
> +#define NVIDIA_WMI_EC_BACKLIGHT_QUIRK_PROXY_TO_AMDGPU_BL1       BIT(8)
> +
> +#define QUIRK(name) NVIDIA_WMI_EC_BACKLIGHT_QUIRK_##name
> +#define HAS_QUIRK(data, name) (((long) data) & QUIRK(name))
> +
> +static int assign_quirks(const struct dmi_system_id *id)
> +{
> +	if (HAS_QUIRK(id->driver_data, RESTORE_LEVEL_ON_RESUME))
> +		restore_level_on_resume = 1;
> +
> +	/* If the module parameter is set, override the quirks table */
> +	if (!backlight_proxy_target) {
> +		if (HAS_QUIRK(id->driver_data, PROXY_TO_AMDGPU_BL1))
> +			backlight_proxy_target = "amdgpu_bl1";
> +	}
> +
> +	return true;
> +}
> +
> +#define QUIRK_ENTRY(vendor, product, quirks) {          \
> +	.callback = assign_quirks,                      \
> +	.matches = {                                    \
> +		DMI_MATCH(DMI_SYS_VENDOR, vendor),      \
> +		DMI_MATCH(DMI_PRODUCT_VERSION, product) \
> +	},                                              \
> +	.driver_data = (void *)(quirks)                 \
> +}
> +
> +static const struct dmi_system_id quirks_table[] = {
> +	QUIRK_ENTRY(
> +		/* This quirk is preset as of firmware revision HACN31WW */
> +		"LENOVO", "Legion S7 15ACH6",
> +		QUIRK(RESTORE_LEVEL_ON_RESUME) | QUIRK(PROXY_TO_AMDGPU_BL1)
> +	),
> +	{ }
> +};
> +
>   /**
>    * wmi_brightness_notify() - helper function for calling WMI-wrapped ACPI method
>    * @w:    Pointer to the struct wmi_device identified by %WMI_BRIGHTNESS_GUID
> @@ -119,9 +190,30 @@ static int wmi_brightness_notify(struct wmi_device *w, enum wmi_brightness_metho
>   	return 0;
>   }
>   
> +/* Scale the current brightness level of 'from' to the range of 'to'. */
> +static int scale_backlight_level(const struct backlight_device *from,
> +				 const struct backlight_device *to)
> +{
> +	int from_max = from->props.max_brightness;
> +	int from_level = from->props.brightness;
> +	int to_max = to->props.max_brightness;
> +
> +	return fixp_linear_interpolate(0, 0, from_max, to_max, from_level);
> +}
> +
>   static int nvidia_wmi_ec_backlight_update_status(struct backlight_device *bd)
>   {
>   	struct wmi_device *wdev = bl_get_data(bd);
> +	struct nvidia_wmi_ec_backlight_priv *priv = dev_get_drvdata(&wdev->dev);
> +	struct backlight_device *proxy_target = priv->proxy_target;
> +
> +	if (proxy_target) {
> +		int level = scale_backlight_level(bd, proxy_target);
> +
> +		if (backlight_device_set_brightness(proxy_target, level))
> +			pr_warn("Failed to relay backlight update to \"%s\"",
> +				backlight_proxy_target);
> +	}
>   
>   	return wmi_brightness_notify(wdev, WMI_BRIGHTNESS_METHOD_LEVEL,
>   	                             WMI_BRIGHTNESS_MODE_SET,
> @@ -147,13 +239,78 @@ static const struct backlight_ops nvidia_wmi_ec_backlight_ops = {
>   	.get_brightness = nvidia_wmi_ec_backlight_get_brightness,
>   };
>   
> +static int nvidia_wmi_ec_backlight_pm_notifier(struct notifier_block *nb, unsigned long event, void *d)
> +{
> +
> +	/*
> +	 * On some systems, the EC backlight level gets reset to 100% when
> +	 * resuming from suspend, but the backlight device state still reflects
> +	 * the pre-suspend value. Refresh the existing state to sync the EC's
> +	 * state back up with the kernel's.
> +	 */
> +	if (event == PM_POST_SUSPEND) {
> +		struct nvidia_wmi_ec_backlight_priv *p;
> +		int ret;
> +
> +		p = container_of(nb, struct nvidia_wmi_ec_backlight_priv, nb);
> +		ret = backlight_update_status(p->bl_dev);
> +
> +		if (ret)
> +			pr_warn("failed to refresh backlight level: %d", ret);
> +
> +		return NOTIFY_OK;
> +	}
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static void putdev(void *data)
> +{
> +	struct device *dev = data;
> +
> +	put_device(dev);
> +}
> +
>   static int nvidia_wmi_ec_backlight_probe(struct wmi_device *wdev, const void *ctx)
>   {
> +	struct backlight_device *bdev, *target = NULL;
> +	struct nvidia_wmi_ec_backlight_priv *priv;
>   	struct backlight_properties props = {};
> -	struct backlight_device *bdev;
>   	u32 source;
>   	int ret;
>   
> +	/*
> +	 * Check quirks tables to see if this system needs any of the firmware
> +	 * bug workarounds.
> +	 */
> +	dmi_check_system(quirks_table);
> +
> +	if (backlight_proxy_target && backlight_proxy_target[0]) {
> +		static int num_reprobe_attempts;
> +
> +		target = backlight_device_get_by_name(backlight_proxy_target);
> +
> +		if (target) {
> +			ret = devm_add_action_or_reset(&wdev->dev, putdev,
> +						       &target->dev);
> +			if (ret)
> +				return ret;
> +		} else {
> +			/*
> +			 * The target backlight device might not be ready;
> +			 * try again and disable backlight proxying if it
> +			 * fails too many times.
> +			 */
> +			if (num_reprobe_attempts < max_reprobe_attempts) {
> +				num_reprobe_attempts++;
> +				return -EPROBE_DEFER;
> +			}
> +
> +			pr_warn("Unable to acquire %s after %d attempts. Disabling backlight proxy.",
> +				backlight_proxy_target, max_reprobe_attempts);
> +		}
> +	}
> +
>   	ret = wmi_brightness_notify(wdev, WMI_BRIGHTNESS_METHOD_SOURCE,
>   	                           WMI_BRIGHTNESS_MODE_GET, &source);
>   	if (ret)
> @@ -188,7 +345,41 @@ static int nvidia_wmi_ec_backlight_probe(struct wmi_device *wdev, const void *ct
>   					      &wdev->dev, wdev,
>   					      &nvidia_wmi_ec_backlight_ops,
>   					      &props);
> -	return PTR_ERR_OR_ZERO(bdev);
> +
> +	if (IS_ERR(bdev))
> +		return PTR_ERR(bdev);
> +
> +	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->bl_dev = bdev;
> +
> +	dev_set_drvdata(&wdev->dev, priv);
> +
> +	if (target) {
> +		int level = scale_backlight_level(target, bdev);
> +
> +		if (backlight_device_set_brightness(bdev, level))
> +			pr_warn("Unable to import initial brightness level from %s.",
> +				backlight_proxy_target);
> +		priv->proxy_target = target;
> +	}
> +
> +	if (restore_level_on_resume) {
> +		priv->nb.notifier_call = nvidia_wmi_ec_backlight_pm_notifier;
> +		register_pm_notifier(&priv->nb);
> +	}
> +
> +	return 0;
> +}
> +
> +static void nvidia_wmi_ec_backlight_remove(struct wmi_device *wdev)
> +{
> +	struct nvidia_wmi_ec_backlight_priv *priv = dev_get_drvdata(&wdev->dev);
> +
> +	if (priv->nb.notifier_call)
> +		unregister_pm_notifier(&priv->nb);
>   }
>   
>   #define WMI_BRIGHTNESS_GUID "603E9613-EF25-4338-A3D0-C46177516DB7"
> @@ -204,6 +395,7 @@ static struct wmi_driver nvidia_wmi_ec_backlight_driver = {
>   		.name = "nvidia-wmi-ec-backlight",
>   	},
>   	.probe = nvidia_wmi_ec_backlight_probe,
> +	.remove = nvidia_wmi_ec_backlight_remove,
>   	.id_table = nvidia_wmi_ec_backlight_id_table,
>   };
>   module_wmi_driver(nvidia_wmi_ec_backlight_driver);
