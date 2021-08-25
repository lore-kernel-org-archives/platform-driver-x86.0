Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B98AC4338F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Aug 2021 16:36:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 67C5E60240
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Aug 2021 16:36:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240720AbhHYQgw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 25 Aug 2021 12:36:52 -0400
Received: from mail-dm6nam11on2049.outbound.protection.outlook.com ([40.107.223.49]:5344
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S241082AbhHYQgw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 Aug 2021 12:36:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PyNh7/T8NPkNEL9A2j4GOlIUgak4LmAb5pvnOQMFFHWTzuBxlG/H/voIhQn1Q4SwEwDXwsxAifDKmS9alfSYl49JmSuy/vNNqJTeh9lR4q34QxNte2zb2wR12rDxufYMAfEtl+FCaHP0bBzZs8PUGN7kM7+CEUtlcck3sU0o30Lxvrxvr0E/5R0GYQKPaRI9NBaZOmbGhcJXAqxJPheKzIPnFlvGwlaU+BHdjBRkZv8Vcu0jGQroasVxudgw/OK+xAPdwpKqFTr+owoKGocqqwhii9mRyqVVh3iGSdqwdxSZd+bB7+ckkoRkzNKBCZO2W2CfBUmzZOhBWlmKwohrZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Ru6vY35Bw/uOyQbaDlF+0A4J8l8oOogGgqK6rE5Wzc=;
 b=Q07q7XMa1c6VU0uVol7vH300Mchqp+t3jW2U1uammxiUWkIEq65kTTjcEqWfmmABygQ/z9lOKs5roxblqm84dkGtNX8JdTbsEiKgNPAH7bRoAlODLRwol4KHsQFsgcBoBEf599gTqWm8ZVr5o5nwPwibDU9PtwvOWowgax1HDFhPu2MFaWuvWKuMhPxKu0HkaM9sn81r0d6vrc3c0w1ZqymCxLoIa9wkzrxXI7dTajzurweoLiRTaXUD1YJEp3+xtk3cVdZ8sjTxsFFEI7H6nHqODvzgyz5IdSSRwtIs6gCXz8/4re5jWAs7btqsttgn835rcpmVSmMB9rshSGUQPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=outlook.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Ru6vY35Bw/uOyQbaDlF+0A4J8l8oOogGgqK6rE5Wzc=;
 b=ALyw8KrZkzjqZrXzxYuns/EHgKGu4daqMeJLRh7tsUBYCabmG0FmdS1CUJp36YefAJg1QjcfHW7CoMT8NJdmpqPmqn2Teoa8zFY1SVn11Cy+XA+IeRpAiyyzZZxpESIJJOLPtksHG/fFsxM1j89fbnsDdUZzZkx2/E0PlHb6nXComPQA6AQB+shV6DxgEsVz0CJfCxhsOTffngFDERozx/tWA1tO9lakk2ukoos8qSBTOk2S/hkIxpLTsuyBI0HJswgBEiDOXta6eeoWxoV2cgFT7EOFkw5blB2Nljnm4u4cRudKcHKb/JUXR5cORCvIggKK/gqfTktTTfsMKyEuIw==
Received: from DM6PR07CA0089.namprd07.prod.outlook.com (2603:10b6:5:337::22)
 by SN1PR12MB2589.namprd12.prod.outlook.com (2603:10b6:802:2c::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Wed, 25 Aug
 2021 16:36:04 +0000
Received: from DM6NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:337:cafe::8) by DM6PR07CA0089.outlook.office365.com
 (2603:10b6:5:337::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Wed, 25 Aug 2021 16:36:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; outlook.com; dkim=none (message not signed)
 header.d=none;outlook.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 DM6NAM11FT063.mail.protection.outlook.com (10.13.172.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4457.17 via Frontend Transport; Wed, 25 Aug 2021 16:36:04 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 25 Aug
 2021 16:36:03 +0000
Received: from [10.20.22.215] (172.20.187.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 25 Aug
 2021 16:36:02 +0000
Subject: Re: [PATCH v3] platform/x86: Add driver for ACPI WMAA EC-based
 backlight control
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
CC:     <platform-driver-x86@vger.kernel.org>, <hdegoede@redhat.com>,
        <mario.limonciello@outlook.com>, <andy@infradead.org>,
        <dvhart@infradead.org>, Aaron Plattner <aplattner@nvidia.com>
References: <877ae34b-dcbb-a0a4-7d76-d9d78d12fd00@redhat.com>
 <20210824220437.14175-1-ddadap@nvidia.com>
 <6RpClBuJeF9Qz9ttRSWYSDf54xIAio4IkrnTPSMeRx69TjEpe833H_rZXiIoK_GJUj4oi5Qv1BUV5yxlKMi5Pu9ngpKB_U_wie_a3_S5Yjg=@protonmail.com>
From:   Daniel Dadap <ddadap@nvidia.com>
Message-ID: <e7ada2e1-245d-b12c-0257-0f49c73a5a83@nvidia.com>
Date:   Wed, 25 Aug 2021 11:36:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <6RpClBuJeF9Qz9ttRSWYSDf54xIAio4IkrnTPSMeRx69TjEpe833H_rZXiIoK_GJUj4oi5Qv1BUV5yxlKMi5Pu9ngpKB_U_wie_a3_S5Yjg=@protonmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 232c34fe-0976-4630-b48a-08d967e66e72
X-MS-TrafficTypeDiagnostic: SN1PR12MB2589:
X-Microsoft-Antispam-PRVS: <SN1PR12MB258959C94AA0982216726BDABCC69@SN1PR12MB2589.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tqPjdD+UMYeJkLeUw/dEhDG42c5zGOvfsGpsIfvjRS27zVP2JLDEXrG/KcX3n4eMpbK9U9/aSMJFpoQC5jAvyCBjDRSynR3EUeWhjaiGTuYlWtyMsqSSZYavCKEJWrJpvCm7YdVCZ0LYEOivqI/7Gek3y0CuaBSeLO1XbbXWHVoTW7uWR2/LUfj8O1EWmCgVFd/WSfVnG+/bFDakHfRbloUjY2k/2984CAIy3FiaPp8kHgXZIYrXjH/zlSLM2eLXGZqXFPCuR1z2b49Z9ODicSoRbBefLGr6BOwXFkebrSY2TwjR12gcUD5Oi0/eZBtcAEtjfMbf0HYZkbtelpONcotsuaUG1ZiOlTSAhBrY73dN8Tz0nm8zHdEEHGIVMD3qwpb+qun/cX7UK64XPPAvarD4oGB0E6UcEoNe7V4zcye99KyeMuqNqfh4jzO14/VZuuESAnyWjG+SxRT787KNN2sLirZR8icuTZQaBrv6nTnLw8TmE5DeC7tOMr9c/l2iZQSf7Y4Tfm9byCVwAVBZiEJGBtTIccZdOUYblgjNdJrmxaCd/sv24QHYwUdAFCpXILuQGPMsUwmhlk1uCGc1a5t58/5xsYakr3dfO8kXQQptbxZvLM53xS3FHnOklV4lBkETrVApjtvsvfuqX7uh1oGFhJnWeaKH6pEMe0CAMrOS4phxymseT1osIp6lib4pfSYgJKJVvvq4Q7d2NtNSyUaI97/VyWK+TQLj9V9FMr8=
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid02.nvidia.com;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(346002)(136003)(36840700001)(54906003)(36756003)(36906005)(4326008)(16576012)(36860700001)(53546011)(6916009)(45080400002)(16526019)(478600001)(426003)(8936002)(107886003)(316002)(5660300002)(70586007)(2906002)(66574015)(86362001)(32650700002)(82740400003)(31696002)(83380400001)(26005)(2616005)(70206006)(7636003)(82310400003)(186003)(8676002)(356005)(31686004)(336012)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 16:36:04.1306
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 232c34fe-0976-4630-b48a-08d967e66e72
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2589
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Thanks again:

On 8/24/21 5:47 PM, Barnabás Pőcze wrote:
> Hi
>
>
> 2021. augusztus 25., szerda 0:04 keltezéssel, Daniel Dadap írta:
>> A number of upcoming notebook computer designs drive the internal
>> display panel's backlight PWM through the Embedded Controller (EC).
>> This EC-based backlight control can be plumbed through to an ACPI
>> "WMAA" method interface, which in turn can be wrapped by WMI with
>> the GUID handle 603E9613-EF25-4338-A3D0-C46177516DB7.
>>
>> Add a new driver, aliased to the WMAA WMI GUID, to expose a sysfs
>> backlight class driver to control backlight levels on systems with
>> EC-driven backlights.
>>
>> Signed-off-by: Aaron Plattner <aplattner@nvidia.com>
>> Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
>> ---
>>
>> v2: Convert to WMI subsystem driver, suggested by Mario Limonciello
>>      <mario.limonciello@outlook.com>; various cleanups suggested by
>>      Barnabás Pőcze <pobrn@protonmail.com>
>> v3: Address assorted style nits raised by Andy Shevchenko
>>      <andy.shevchenko@gmail.com> in response to a related patch; remove
>>      additional behavior change to WMI subsystem from patch series as
>>      recommended by Hans de Goede <hdegoede@redhat.com>
>>
>>   MAINTAINERS                               |   6 +
>>   drivers/platform/x86/Kconfig              |  10 ++
>>   drivers/platform/x86/Makefile             |   1 +
>>   drivers/platform/x86/wmaa-backlight-wmi.c | 184 ++++++++++++++++++++++
>>   4 files changed, 201 insertions(+)
>>   create mode 100644 drivers/platform/x86/wmaa-backlight-wmi.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index bbaecde94aa0..fd7362a86c6d 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -20008,6 +20008,12 @@ L:	linux-wireless@vger.kernel.org
>>   S:	Odd fixes
>>   F:	drivers/net/wireless/wl3501*
>>
>> +WMAA BACKLIGHT DRIVER
>> +M:	Daniel Dadap <ddadap@nvidia.com>
>> +L:	platform-driver-x86@vger.kernel.org
>> +S:	Supported
>> +F:	drivers/platform/x86/wmaa-backlight-wmi.c
>> +
>>   WOLFSON MICROELECTRONICS DRIVERS
>>   L:	patches@opensource.cirrus.com
>>   S:	Supported
>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>> index d12db6c316ea..e54449c16d03 100644
>> --- a/drivers/platform/x86/Kconfig
>> +++ b/drivers/platform/x86/Kconfig
>> @@ -113,6 +113,16 @@ config PEAQ_WMI
>>   	help
>>   	 Say Y here if you want to support WMI-based hotkeys on PEAQ 2-in-1s.
>>
>> +config WMAA_BACKLIGHT_WMI
>> +	tristate "ACPI WMAA Backlight Driver"
>> +	depends on ACPI_WMI
>> +	depends on BACKLIGHT_CLASS_DEVICE
>> +	help
>> +	  This driver provides a sysfs backlight interface for notebook
>> +	  systems which expose the WMAA ACPI method and an associated WMI
>> +	  wrapper to drive LCD backlight levels through the system's
>> +	  Embedded Controller.
>> +
>>   config XIAOMI_WMI
>>   	tristate "Xiaomi WMI key driver"
>>   	depends on ACPI_WMI
>> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
>> index 7ee369aab10d..109c1714237d 100644
>> --- a/drivers/platform/x86/Makefile
>> +++ b/drivers/platform/x86/Makefile
>> @@ -14,6 +14,7 @@ obj-$(CONFIG_INTEL_WMI_SBL_FW_UPDATE)	+= intel-wmi-sbl-fw-update.o
>>   obj-$(CONFIG_INTEL_WMI_THUNDERBOLT)	+= intel-wmi-thunderbolt.o
>>   obj-$(CONFIG_MXM_WMI)			+= mxm-wmi.o
>>   obj-$(CONFIG_PEAQ_WMI)			+= peaq-wmi.o
>> +obj-$(CONFIG_WMAA_BACKLIGHT_WMI)	+= wmaa-backlight-wmi.o
>>   obj-$(CONFIG_XIAOMI_WMI)		+= xiaomi-wmi.o
>>   obj-$(CONFIG_GIGABYTE_WMI)		+= gigabyte-wmi.o
>>
>> diff --git a/drivers/platform/x86/wmaa-backlight-wmi.c b/drivers/platform/x86/wmaa-backlight-wmi.c
>> new file mode 100644
>> index 000000000000..b607d3f88fc2
>> --- /dev/null
>> +++ b/drivers/platform/x86/wmaa-backlight-wmi.c
>> @@ -0,0 +1,184 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2020, NVIDIA CORPORATION.  All rights reserved.
>> + */
>> +
>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> +
>> +#include <linux/acpi.h>
>> +#include <linux/backlight.h>
>> +#include <linux/module.h>
>> +#include <linux/wmi.h>
>> +
>> +#define WMAA_WMI_GUID "603E9613-EF25-4338-A3D0-C46177516DB7"
>> +
>> +struct wmi_wmaa_priv {
>> +	struct backlight_device *backlight;
>> +};
>> +
>> +enum wmaa_method {
>> +	WMAA_BRIGHTNESS_LEVEL = 1,
>> +	WMAA_BRIGHTNESS_SOURCE = 2,
>> +};
>> +
>> +enum wmaa_get_or_set {
>> +	WMAA_GET = 0,
>> +	WMAA_SET = 1,
>> +	WMAA_GET_MAX = 2, // for WMAA_BRIGHTNESS_LEVEL only
> /* this type of comments is preferred */
>
>
>> +};
>> +
>> +enum wmaa_source {
>> +	WMAA_SOURCE_CLEAR = 0,
>> +	WMAA_SOURCE_GPU = 1,
>> +	WMAA_SOURCE_EC = 2,
>> +	WMAA_SOURCE_AUX = 3,
>> +	WMAA_SOURCE_COUNT
>> +};
>> +
>> +struct wmaa_args {
>> +	u32 set;
>> +	u32 val;
>> +	u32 ret;
>> +	u32 ignored[3];
>> +};
>> +
>> +static const struct wmi_device_id wmaa_backlight_wmi_id_table[] = {
>> +	{ .guid_string = WMAA_WMI_GUID },
>> +	{ },
>> +};
>> +
>> +static struct wmi_device *wdev;
>> +
>> +static int wmi_call_wmaa(enum wmaa_method method, enum wmaa_get_or_set set, u32 *val)
>> +{
>> +	struct wmaa_args args = {
>> +		.set = set,
>> +		.val = 0,
>> +		.ret = 0,
>> +	};
>> +	struct acpi_buffer buf = { (acpi_size)sizeof(args), &args };
>> +	acpi_status status;
>> +
>> +	if (set == WMAA_SET)
>> +		args.val = *val;
>> +
>> +	status = wmidev_evaluate_method(wdev, 0, method, &buf, &buf);
>> +	if (ACPI_FAILURE(status)) {
>> +		pr_err("ACPI WMAA failed with %s\n", acpi_format_exception(status));
> I think this could be `dev_err()` instead.


Yes, it could. Looks like this is the only pr_* macro used as well, so 
we can delete the pr_fmt define.


>
>> +		return -EIO;
>> +	}
>> +
>> +	if (set != WMAA_SET)
>> +		*val = args.ret;
>> +
>> +	return 0;
>> +}
>> +
>> +static int wmaa_get_brightness(u32 *level)
>> +{
>> +	return wmi_call_wmaa(WMAA_BRIGHTNESS_LEVEL, WMAA_GET, level);
>> +}
>> +
>> +static int wmaa_set_brightness(u32 level)
>> +{
>> +	return wmi_call_wmaa(WMAA_BRIGHTNESS_LEVEL, WMAA_SET, &level);
>> +}
>> +
>> +static int wmaa_backlight_update_status(struct backlight_device *bd)
>> +{
>> +	return wmaa_set_brightness(bd->props.brightness);
>> +}
>> +
>> +static int wmaa_backlight_get_brightness(struct backlight_device *bd)
>> +{
>> +	u32 level;
>> +	int ret;
>> +
>> +	ret = wmaa_get_brightness(&level);
>> +
>> +	WARN_ON(ret != 0);
>> +	return ret == 0 ? level : 0;
>> +}
>> +
>> +static const struct backlight_ops wmaa_backlight_ops = {
>> +	.update_status = wmaa_backlight_update_status,
>> +	.get_brightness = wmaa_backlight_get_brightness,
>> +};
>> +
>> +static int wmaa_get_max_brightness(u32 *level)
>> +{
>> +	return wmi_call_wmaa(WMAA_BRIGHTNESS_LEVEL, WMAA_GET_MAX, level);
>> +}
>> +
>> +static int wmaa_get_brightness_source(u32 *source)
>> +{
>> +	return wmi_call_wmaa(WMAA_BRIGHTNESS_SOURCE, WMAA_GET, source);
>> +}
>> +
>> +static int wmaa_backlight_wmi_probe(struct wmi_device *w, const void *ctx)
>> +{
>> +	struct backlight_properties props = {0};
>> +	struct wmi_wmaa_priv *priv;
>> +	u32 source;
>> +	int ret;
>> +
>> +	priv = devm_kmalloc(&w->dev, sizeof(*priv), GFP_KERNEL);
>> +	if(!priv)
>> +		return -ENOMEM;
>> +
>> +	wdev = w;
> It seems odd to me that half of the state is per-device, but the other half is global.


You're right; the global state is unnecessary since this can be 
associated with the backlight_dev.


>
>> +
>> +	ret = wmaa_get_brightness_source(&source);
>> +	if (ret)
>> +		goto done;
>> +
>> +	if (source != WMAA_SOURCE_EC) {
>> +		ret = -ENODEV;
>> +		goto done;
>> +	}
>> +
>> +	// Register a backlight handler
>> +	props.type = BACKLIGHT_PLATFORM;
>> +	ret = wmaa_get_max_brightness(&props.max_brightness);
>> +	if (ret)
>> +		goto done;
>> +
>> +	ret = wmaa_get_brightness(&props.brightness);
>> +	if (ret)
>> +		goto done;
>> +
>> +	priv->backlight = backlight_device_register("wmaa_backlight",
>> +		NULL, NULL, &wmaa_backlight_ops, &props);
> Have you looked at `devm_backlight_device_register()`?


No; I wasn't aware of it. That does seem like it would simplify things 
by removing some more boilerplate. I'm currently testing a new patch 
incorporating your suggestions.


>
>
>> +	if (IS_ERR(priv->backlight))
>> +		return PTR_ERR(priv->backlight);
>> +
>> +	dev_set_drvdata(&w->dev, priv);
>> +
>> +done:
>> +	return ret;
>> +}
>> +
>> +static void wmaa_backlight_wmi_remove(struct wmi_device *wdev)
>> +{
>> +	struct wmi_wmaa_priv *priv = dev_get_drvdata(&wdev->dev);
>> +
>> +	backlight_device_unregister(priv->backlight);
>> +}
>> +
>> +static struct wmi_driver wmaa_backlight_wmi_driver = {
>> +	.driver = {
>> +		.name = "wmaa-backlight",
>> +	},
>> +	.probe = wmaa_backlight_wmi_probe,
>> +	.remove = wmaa_backlight_wmi_remove,
>> +	.id_table = wmaa_backlight_wmi_id_table,
>> +};
>> +
>> +module_wmi_driver(wmaa_backlight_wmi_driver);
>> +
>> +MODULE_AUTHOR("Aaron Plattner <aplattner@nvidia.com>");
>> +MODULE_AUTHOR("Daniel Dadap <ddadap@nvidia.com>");
>> +MODULE_DESCRIPTION("WMAA Backlight WMI driver");
>> +MODULE_LICENSE("GPL v2");
>> +
>> +MODULE_ALIAS("wmi:"WMAA_WMI_GUID);
>> --
>> 2.20.1
>
> Best regards,
> Barnabás Pőcze
