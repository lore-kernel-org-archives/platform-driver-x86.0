Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DFA6C432BE
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Sep 2021 02:12:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1EFC5610C8
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Sep 2021 02:12:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232530AbhIBCNI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 1 Sep 2021 22:13:08 -0400
Received: from mail-bn7nam10on2083.outbound.protection.outlook.com ([40.107.92.83]:17537
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232517AbhIBCNI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Sep 2021 22:13:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D7tFvhlAKXtQrfjPr74CcHTSXcQ+AvKnHsvprFCztTt+/YAs9EvPOmBg87F5fLYtiMnEVowsSEi8/Pf2uZ0If3+hgx6+F0sRkcV8KbTo/gfy/y2jcizZmRu758gkFbowZvabEsTwCvg7pz4pAsA8T1sjDHymT6v8Srt74Irwg+nk0+iGZddfqHBrk3wHQ23QwRd5q8F4I8S/LeUM8j/tsI/Gk+YjMr8t1F1UmneD1Bd3xH2o50zrAtTtS3UIW04Rbkiyuu5S1+nxOlaF6C2ASa08IHVQVdJKzsoMOROua3MtdC8X0zYwTycu3bkwXfEEGgP7nEECImLP9JEv80i6FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VZo0QH/UClS952oXKmyelsPpckvNoSka8rnHqGHEkdo=;
 b=EKLqtFsjEmToxgHhPzdRGI6MMEr9eSY6FzUD0xK4+83qX193wENSJ9pWo39tCePRFj6UK4VkEPy6XIkcqOTZ4A/hDktMier8ScJMO1IIbP/eP63YSlQM6tjwCLdeOfOrSgWBlcEXM73g3CDq4LnUjYCurP+BmMCctH5SZ7z5r5qgQ7YRjtXb+s2VI82scJSIdd2esZUv71kQZwsqyW4SZf9efbkgkrBVhpQCbsV8VTOP9Ju3H7f3hJ+A+AOb5rcqWUBH/maVm8t2YhfAcUKf8uW3+lZHyElQMYF4hOg9uo+HfjIoMmlUIYiTjOLZGhV5BbSyFohOwgI9OLmcFYrFnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=infradead.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VZo0QH/UClS952oXKmyelsPpckvNoSka8rnHqGHEkdo=;
 b=f1deDWl0hue8uX8m0FVaQDaen8u9SeUCGfbv5FGIExnmpg0VV4OcWgp2+JJgEJpvkrIjwa/r4jgRZX/miC8Ipex3KnJCsF1FLZf1B3Xoj5AxvwskIkz+9rUHUz3oU9KlfGcwKNIfDA+pC+F+nayKRvYAG5BjpeHG+1al/TvNYohPp1WmjtIt/YqSkK39LmdpfVsmjrXyvMQssIacThTeEunOzhZmriLAuKx7TmYOMy9ahtdvc0upVhDwMXNHEbLJNTYsWb7n/KwAnnGzau7BOobZ9xboKCQDX61dkdo574bJe6vgIqFx2Md2qrF6lgQrAjm2J87D4TkZoUFouzq76A==
Received: from DM6PR07CA0095.namprd07.prod.outlook.com (2603:10b6:5:337::28)
 by DM4PR12MB5360.namprd12.prod.outlook.com (2603:10b6:5:39f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18; Thu, 2 Sep
 2021 02:12:05 +0000
Received: from DM6NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:337:cafe::cb) by DM6PR07CA0095.outlook.office365.com
 (2603:10b6:5:337::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Thu, 2 Sep 2021 02:12:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 DM6NAM11FT032.mail.protection.outlook.com (10.13.173.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 02:12:04 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 1 Sep
 2021 19:12:03 -0700
Received: from [10.20.23.105] (172.20.187.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 2 Sep 2021
 02:12:02 +0000
Subject: Re: [PATCH v4] platform/x86: Add driver for ACPI WMAA EC-based
 backlight control
To:     =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>
CC:     <platform-driver-x86@vger.kernel.org>, <andy.shevchenko@gmail.com>,
        <hdegoede@redhat.com>, <mario.limonciello@outlook.com>,
        <pobrn@protonmail.com>, <dvhart@infradead.org>,
        Aaron Plattner <aplattner@nvidia.com>
References: <70b81e33-c769-4cb8-0bae-5ee10a209389@nvidia.com>
 <20210831224906.1072-1-ddadap@nvidia.com>
 <eb7d46e2-64a8-4eb7-a940-e130ddae8626@t-8ch.de>
From:   Daniel Dadap <ddadap@nvidia.com>
Message-ID: <ce05cf8a-9b1f-e3a5-33bb-4f997bc2bcec@nvidia.com>
Date:   Wed, 1 Sep 2021 21:12:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <eb7d46e2-64a8-4eb7-a940-e130ddae8626@t-8ch.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1597be92-e1bd-49f6-9b3e-08d96db70eb6
X-MS-TrafficTypeDiagnostic: DM4PR12MB5360:
X-Microsoft-Antispam-PRVS: <DM4PR12MB5360877CDFFFF544FADB928CBCCE9@DM4PR12MB5360.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L67sMWijoJfryJBfYkHQv9hJ0+wRoGdcukAjwjz8/EwobJXmchbtM3fupjEImWaKv6PCUe7turbOCa0MkGGJA+X/FleXrzHDXjkBMwGsXhUPghjnoJA4fg6f84ab+W74OGfE+oz7KaOcIdCHOyhreVMDnp/995l9US/Bqg35kkTPhxU0+68rdIko8Yl2wDDyJntExaVC02drLaBECaZtVsRtt5UQ4KFhEj0HDtj4iuPG6dY+58UwBbbwafNHm6Tot5s/Ei7SGuXesCsyUPe32cnPt3K5xG+h0h8BlaFN/DI9UdRB8CKjXAJNTvS1OMk923a3wCaFSQX5bZ0PT5ojRTXizm24pSFZoczueti7mFtawQdPM+qr48uOi5+wW2ja2bEOoMnTyrYmpApvTAfVT6YKCHOoJtL5KW0LQnrXZdj7LauiNctCchQFABAoHFueAf8RftGFQcvfNJjFszsadnhPCSA2ZXOyaU/SMjYr2zZ3E5m2qPAxwLKwzxkANcKPI6nFgbpuxekJFxP7ZOsS0AazSyhcmuMj7B4nvwtR9H9fNPeJHmXW1KNCTXAOK26eanjumDlYlh+z1sdDXmkonJaUwphgwnwV+eD1H17TEJm2yfJMMTJHQ3zu9vGKoS1GxMWke/I6Pvt+d/lE8oCae1nH2kvi+SZ+PKskKKCpGS613J3NgyWF2IT4nv3t/K8Y9BnHNScTNxpFvWCJ94NAB9L+ewh2joO0Cf3rU1yLilk=
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(39860400002)(136003)(36840700001)(426003)(16526019)(83380400001)(7636003)(2616005)(54906003)(82740400003)(336012)(107886003)(4326008)(8936002)(316002)(2906002)(31696002)(186003)(70586007)(26005)(5660300002)(356005)(36860700001)(53546011)(32650700002)(16576012)(66574015)(478600001)(70206006)(8676002)(30864003)(86362001)(31686004)(36756003)(45080400002)(6916009)(82310400003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 02:12:04.1467
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1597be92-e1bd-49f6-9b3e-08d96db70eb6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5360
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Thanks, Thomas:

On 9/1/21 4:25 AM, Thomas Weißschuh wrote:
> Hi Daniel,
>
> a few minor comments, not sure if they should be reason for a reroll.


I don't mind rerolling until I get an ACK from the maintainer. :)


>
> Thomas
>
> Reviewed-By: Thomas Weißschuh <linux@weissschuh.net>
>
> On Di, 2021-08-31T17:49-0500, Daniel Dadap wrote:
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
>>       <mario.limonciello@outlook.com>; various cleanups suggested by
>>       Barnab??s P??cze <pobrn@protonmail.com>
>> v3: Address assorted style nits raised by Andy Shevchenko
>>       <andy.shevchenko@gmail.com> in response to a related patch; remove
>>       additional behavior change to WMI subsystem from patch series as
>>       recommended by Hans de Goede <hdegoede@redhat.com>
>> v4: Use MODULE_DEVICE_TABLE() (Thomas Wei??schuh <thomas@t-8ch.de>)
>>      Fix scope of internal driver state; various style fixes (Barnab??s
>>      P??cze, Andy Shevchenko)
>>      Use devm_backlight_device_register() (Barnab??s P??cze)
>>      Add kerneldoc comments for enums and structs (Andy Shevchenko)
> It seems your Mailsetup breaks Unicode.


Strange. I've just been sending the patches via git email-patch. These 
characters are appearing correctly with my MUA (Thunderbird) in the copy 
of the message I received, so I don't know where in the pipeline they're 
getting corrupted. I'll ignore this problem unless anybody has some 
specific tips on fixing it, since the non-ASCII characters aren't going 
to actually be part of the git history of the patch.


>
>>   MAINTAINERS                               |   6 +
>>   drivers/platform/x86/Kconfig              |  16 ++
>>   drivers/platform/x86/Makefile             |   1 +
>>   drivers/platform/x86/wmaa-backlight-wmi.c | 185 ++++++++++++++++++++++
>>   4 files changed, 208 insertions(+)
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
>> index d12db6c316ea..0df908ef8d7c 100644
>> --- a/drivers/platform/x86/Kconfig
>> +++ b/drivers/platform/x86/Kconfig
>> @@ -113,6 +113,22 @@ config PEAQ_WMI
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
>> +	  Embedded Controller (EC).
>> +
>> +	  Say Y or M here if you want to control the backlight on a notebook
>> +	  system with an EC-driven backlight using the ACPI WMAA method.
>> +
>> +	  If you choose to compile this driver as a module the module will be
>> +	  called wmaa-backlight-wmi.
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
>> index 000000000000..cb1a973803b1
>> --- /dev/null
>> +++ b/drivers/platform/x86/wmaa-backlight-wmi.c
>> @@ -0,0 +1,185 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2020, NVIDIA CORPORATION.  All rights reserved.
> Also 2021?


The code was originally written in 2020. I'm not certain it's changed 
substantially enough to warrant updating the copyright date. Certainly 
there's no need to change the copyright date every time the file is 
touched. I suppose it wouldn't be wrong to have it read 2020-2021 or the 
like for the initial commit, but I personally prefer just having the 
initial date unless there's stronger guidance to do otherwise.


>
>> + */
>> +
>> +#include <linux/backlight.h>
>> +#include <linux/module.h>
>> +#include <linux/wmi.h>
>> +
>> +/**
>> + * enum wmaa_method - WMI method IDs for ACPI WMAA
>> + *
>> + * @WMAA_LEVEL:  Get or set the brightness level,
>> + *               or get the maximum brightness level.
>> + * @WMAA_SOURCE: Get the source for backlight control.
>> + */
>> +enum wmaa_method {
>> +	WMAA_LEVEL = 1,
>> +	WMAA_SOURCE = 2,
>> +};
> Nitpick: No need for explicit values here.


I think at least the 1 is required, but in any case I prefer to be 
explicit here to make it clear that these are the exact values required 
by the ACPI WMAA interface.


>
>> +/**
>> + * enum wmaa_get_or_set - Operation mode for ACPI WMAA method
>> + *
>> + * @WMAA_GET:     Get the current brightness level or backlight source.
>> + * @WMAA_SET:     Set the brightness level.
>> + * @WMAA_GET_MAX: Get the maximum brightness level. This is only valid when the
>> + *                WMI method is %WMAA_LEVEL.
>> + */
>> +enum wmaa_get_or_set {
> Nitpick: wmaa_operation/command


That is indeed better; thanks. I'll go with "mode", mainly because it's 
shorter.


>
>> +	WMAA_GET = 0,
>> +	WMAA_SET = 1,
>> +	WMAA_GET_MAX = 2
>> +};
> Nitpick: No need for explicit values here.
>
>> +/**
>> + * enum wmaa_source - Backlight brightness control source identification
>> + *
>> + * @WMAA_SOURCE_GPU:   Backlight brightness is controlled by the GPU.
>> + * @WMAA_SOURCE_EC:    Backlight brightness is controlled by the system's
>> + *                     Embedded Controller (EC).
>> + * @WMAA_SOURCE_AUX:   Backlight brightness is controlled over the DisplayPort
>> + *                     AUX channel.
>> + */
>> +enum wmaa_source {
>> +	WMAA_SOURCE_GPU = 1,
>> +	WMAA_SOURCE_EC = 2,
>> +	WMAA_SOURCE_AUX = 3
>> +};
>> +
>> +/**
>> + * struct wmaa_args - arguments for the ACPI WMAA method
>> + *
>> + * @set:     Pass in an &enum wmaa_get_or_set value to select between getting or
>> + *           setting a value.
>> + * @val:     In parameter for value to set when operating in %WMAA_SET mode. Not
>> + *           used in %WMAA_GET or %WMAA_GET_MAX mode.
>> + * @ret:     Out parameter returning retrieved value when operating in %WMAA_GET
>> + *           or %WMAA_GET_MAX mode. Not used in %WMAA_SET mode.
>> + * @ignored: Padding; not used. The ACPI method expects a 24 byte params struct.
>> + *
>> + * This is the parameters structure for the ACPI WMAA method as wrapped by WMI.
>> + * The value passed in to @val or returned by @ret will be a brightness value
>> + * when the WMI method ID is %WMAA_LEVEL, or an &enum wmaa_source value when
>> + * the WMI method ID is %WMAA_SOURCE.
>> + */
>> +struct wmaa_args {
>> +	u32 set;
>> +	u32 val;
>> +	u32 ret;
>> +	u32 ignored[3];
>> +};
>> +
>> +static int wmi_call_wmaa(struct wmi_device *w, enum wmaa_method method, enum wmaa_get_or_set set, u32 *val)
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
>> +	status = wmidev_evaluate_method(w, 0, method, &buf, &buf);
>> +	if (ACPI_FAILURE(status)) {
>> +		dev_err(&w->dev, "ACPI WMAA failed with %s\n",
>> +			acpi_format_exception(status));
>> +		return -EIO;
>> +	}
>> +
>> +	if (set != WMAA_SET)
>> +		*val = args.ret;
>> +
>> +	return 0;
>> +}
>> +
>> +static int wmaa_backlight_update_status(struct backlight_device *bd)
>> +{
>> +	struct wmi_device *wdev = bl_get_data(bd);
>> +
>> +	return wmi_call_wmaa(wdev, WMAA_LEVEL, WMAA_SET, &bd->props.brightness);
>> +}
>> +
>> +static int wmaa_backlight_get_brightness(struct backlight_device *bd)
>> +{
>> +	struct wmi_device *wdev = bl_get_data(bd);
>> +	u32 level = 0;
>> +	int ret;
>> +
>> +	ret = wmi_call_wmaa(wdev, WMAA_LEVEL, WMAA_GET, &level);
>> +
>> +	if (ret)
>> +		dev_err(&bd->dev, "ACPI WMAA failed to get backlight level.\n");
> Would it make sense to log the actual error?


I think the underlying ACPI error is already logged by wmi_call_wmaa().


> Also while the backlight core does not seem to actually handle it, other
> drivers return a negative errno on failure.


Thanks, I was aware that the backlight core doesn't seem to handle 
errors at all for .get_brightness, but I didn't think to check for 
precedent on backlight drivers returning error codes anyway. Returning 
negative errno does seem somewhat common amongst backlight drivers, so 
I'll go ahead and do that in case the backlight core is updated to 
handle them in the future.


>
>> +
>> +	return level;
>> +}
>> +
>> +static const struct backlight_ops wmaa_backlight_ops = {
>> +	.update_status = wmaa_backlight_update_status,
>> +	.get_brightness = wmaa_backlight_get_brightness
>> +};
>> +
>> +static int wmaa_backlight_wmi_probe(struct wmi_device *w, const void *ctx)
>> +{
>> +	struct backlight_properties props = {};
>> +	struct backlight_device *backlight;
>> +	u32 source;
>> +	int ret;
>> +
>> +	ret = wmi_call_wmaa(w, WMAA_SOURCE, WMAA_GET, &source);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (source != WMAA_SOURCE_EC) {
>> +		/* This driver is only to be used when brightness control is
>> +		 * handled by the EC; otherwise, the GPU driver(s) should handle
>> +		 * brightness control. */
> checkpatch.pl wants this end-of-comment to be on its own line.
>
>> +		return -ENODEV;
>> +	}
>> +
>> +	/* Identify this backlight device as a platform device so that it can
>> +	 * be prioritized over any exposed GPU-driven raw device(s). */
> checkpatch.pl wants this end-of-comment to be on its own line.


Thanks. I neglected to run checkpatch.pl after adding those comments. 
Running it on the current version of the patch now only flags an 
over-long line (the signature of wmi_call_wmaa()); I had originally 
wrapped that to 80 characters, but was told to leave it as one line 
earlier in the review process.


>> +	props.type = BACKLIGHT_PLATFORM;
> Is this WMI method a standard interface?
> If so, BACKLIGHT_FIRMWARE might actually fit better and still fulfill the
> requirements.
> The actual maintainers would know better than me, though.


I'm not certain what you mean by standard. It's defined as part of 
system design guidelines that NVIDIA shares with OEMs, but I'm not sure 
if it's part of the ACPI spec. It is implemented by multiple notebook 
system vendors, hence naming the driver after the ACPI method rather 
than a particular vendor. Reading the documentation on the backlight 
driver types, it does seem that this may fall more under the purview of 
BACKLIGHT_FIRMWARE than BACKLIGHT_PLATFORM. I'll go ahead and retest 
with the driver registered as BACKLIGHT_FIRMWARE, but I'm sure it'll 
still work after inspecting the code for at least gnome-settings-daemon, 
which implements the policy recommended by 
Documentation/ABI/stable/sysfs-class-backlight.


>> +
>> +	ret = wmi_call_wmaa(w, WMAA_LEVEL, WMAA_GET_MAX, &props.max_brightness);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = wmi_call_wmaa(w, WMAA_LEVEL, WMAA_GET, &props.brightness);
>> +	if (ret)
>> +		return ret;
>> +
>> +	backlight = devm_backlight_device_register(
>> +		&w->dev, "wmaa_backlight",
>> +		&w->dev, w, &wmaa_backlight_ops, &props);
>> +	if (IS_ERR(backlight))
>> +		return PTR_ERR(backlight);
>> +
>> +	return 0;
> Could use PTR_ERR_OR_ZERO().


Thanks, Andy suggested this too.


>
>> +}
>> +
>> +#define WMAA_WMI_GUID "603E9613-EF25-4338-A3D0-C46177516DB7"
>> +
>> +static const struct wmi_device_id wmaa_backlight_wmi_id_table[] = {
>> +	{ .guid_string = WMAA_WMI_GUID },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(wmi, wmaa_backlight_wmi_id_table);
>> +
>> +static struct wmi_driver wmaa_backlight_wmi_driver = {
>> +	.driver = {
>> +		.name = "wmaa-backlight"
>> +	},
>> +	.probe = wmaa_backlight_wmi_probe,
>> +	.id_table = wmaa_backlight_wmi_id_table
>> +};
>> +module_wmi_driver(wmaa_backlight_wmi_driver);
>> +
>> +MODULE_AUTHOR("Aaron Plattner <aplattner@nvidia.com>");
>> +MODULE_AUTHOR("Daniel Dadap <ddadap@nvidia.com>");
>> +MODULE_DESCRIPTION("WMAA Backlight WMI driver");
>> +MODULE_LICENSE("GPL v2");
> "GPL" seems to be the more modern one.
> (Equivalent to  "GPL v2", see Documentation/process/license-rules.rst)
