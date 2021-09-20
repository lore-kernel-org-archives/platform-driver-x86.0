Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1B64C433FE
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Sep 2021 17:36:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 866D86154B
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Sep 2021 17:36:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348715AbhITRha (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Sep 2021 13:37:30 -0400
Received: from mail-bn8nam12on2082.outbound.protection.outlook.com ([40.107.237.82]:14884
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1348090AbhITRfo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Sep 2021 13:35:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Up5W4n14kQ3CdQr1PbqbUd3pAWIfxPDuZI2xOM9AssUfV6X5nl4U9HSB7qijIrQTxZdAzV7RQvDhY47AOZ4+PjIcO6L2YJ8TqVsECt/7BSsmuATI0TkV7GPBTmrSc/IkepJ7vNYgT+PT0e/1HSgxeASF2tl6kqI3cui+G5kKQLABg2RvcsWvch7JFZHy/K2OCNFRiiVLYDiHoEnNi5fWnkBavt3AE2lKPbHengkxzAjaRrzuimX1UAVKLqPwiV1jBbx5GNah5ZimtEnyHQaJPS88B/y8IKFdMXSQoo8kP7X7y2GAiqvox8jxaVXCMu8m/LvRDXaku4QyMk4YCnVY3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=6uo6VYVL3c43XYWy1dQSylV+2D+JqWZ5DAKnkxHTH3Q=;
 b=PUWuJKceKM8HH3VA93mK1Q913LMTPARWsJ3NAulh/mY7z9G/TcOFyFgGSvW55GlMUfzI2qjvd2GQyRLlvhccrjXw2mhy1VJ2Vl8cyaQzhg9tQfMBjRv2e5uwMoR2sNzvOOhBMjjr1Mja0lCAuPrOwpLAz5SDx0NNcadbGyb/9Q6H6QLFt/nsiUORA34FBvqEjRbgJtLPKjtySa5aUUJMaw+uiNXSyLA9bfycHGpd6+LptZCr1xqPZP9W06K8gZt/+7bEJRB225OqiwuMUBCeaHZQUo5NIleZzPTA4t9JXmqdx5UjR1ENjB44L/eRgbGSxAGX/ktDbpSYgq+UsGwDnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=weissschuh.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6uo6VYVL3c43XYWy1dQSylV+2D+JqWZ5DAKnkxHTH3Q=;
 b=nIMowGpBmlbq9K/1RwHKOSbPBkSM2PEixF3FS5unBi3esdQ3aufYYQjm1SeNMQCFL4kALORnmGYld7XgAvaqZVQIcbWjP3LG8k9hFGWphyMWDlzXGxZYpsaFfrHM8NGGNNkLxznJiVZWnL/inYEKm/7jI4KryTIgxa/967Kxp5K8o0y3OtI+RQWfeldPsFH6rKGUzF9w4IPRIuxWHC8WxFB88Qp/V10lshImfnCM/lmDSmUH5EjHY4pqWN3qa/AYBmAAmBYH0g6Ng1NZGxcpmvRTVtHGpT6M7GIBl5Op5kEcQtAdRMtxpd6g9uVoxiTLT4LaMj2lQKeUrFr+kpnbxQ==
Received: from MW2PR16CA0017.namprd16.prod.outlook.com (2603:10b6:907::30) by
 CY4PR12MB1943.namprd12.prod.outlook.com (2603:10b6:903:11b::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14; Mon, 20 Sep 2021 17:34:14 +0000
Received: from CO1NAM11FT035.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:0:cafe::38) by MW2PR16CA0017.outlook.office365.com
 (2603:10b6:907::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Mon, 20 Sep 2021 17:34:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; weissschuh.net; dkim=none (message not signed)
 header.d=none;weissschuh.net; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 CO1NAM11FT035.mail.protection.outlook.com (10.13.175.36) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4523.14 via Frontend Transport; Mon, 20 Sep 2021 17:34:12 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 20 Sep
 2021 10:34:12 -0700
Received: from [10.20.115.154] (172.20.187.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 20 Sep
 2021 17:34:10 +0000
Subject: Re: [PATCH v6] platform/x86: Add driver for ACPI WMAA EC-based
 backlight control
To:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        <mario.limonciello@outlook.com>, <pobrn@protonmail.com>,
        <andy.shevchenko@gmail.com>, <aplattner@nvidia.com>,
        =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>
References: <e63904b7-105b-4401-bd40-82854b7d42d1@t-8ch.de>
 <20210903003838.15797-1-ddadap@nvidia.com>
 <11ffe8bc-b4ee-c451-9860-46997de8fe55@redhat.com>
 <20210920132911.cus27elz36dme63g@pali>
 <8b07125d-83b9-9de4-fd52-1cb01466364a@redhat.com>
 <20210920135106.y6mi57bcmurczmka@pali>
From:   Daniel Dadap <ddadap@nvidia.com>
Message-ID: <1aa8fdc7-9e7a-5e86-0045-f07ad5bf118e@nvidia.com>
Date:   Mon, 20 Sep 2021 12:34:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920135106.y6mi57bcmurczmka@pali>
Content-Type: multipart/mixed;
        boundary="------------B0A1EB28C7A8554129AE9A97"
Content-Language: en-US
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 112ce9d7-244a-4226-2e32-08d97c5cdc83
X-MS-TrafficTypeDiagnostic: CY4PR12MB1943:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1943F146FD957ADE9DEF85E6BCA09@CY4PR12MB1943.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1060;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GqlrpTtUJY86hgRCVUSETnP30fldbUhoxN7MbVj6EG1r4ekRkwbgHzUiWVAXafaGcHNn88GeMHXOchxR+eRQImMzK70RVij9wWm9Utro5xFJR15ZO9EZlAeZBL0inBCE6CZomFEJF2yqjXrHht/iwYpxt5Qj5ZahVesDh4RKC0LtgvDa2gYct+PD0b6ZnrjWLOleQJHWYRdmvMCn+UVkAaj5CFYPSmgO31PJpGnKkhxzKadncMDXGpOTadFz33oD/p/dkeYDKTFJLb2fmJdWm+eBlPxWQsgK21ij7fmmcnev9JK5NtewiaZJkWsaGkNzxGpMY78gDdbsg/t7PpwN6Mt1XeoSTL7PNCyLTLBzDLjjhGiWkXaGG95QF+iEHP+/BaLmukKn2Jb9GtDTOZfIc75lBmdIgHAqKOxhXg1Wr1z6IH6itc0d95UjUtoB1DLNaeNc28hOjfEbqaoBIIJaQFrd9jpdn7coo8pkLt/zX1klVpLAZk8IOS+uPe5T4tM9OT1DKQauTcWKAPej1X4RTTm33Q+Q4SP0s7XyKfDmmsx9A/qOFU2RN6UHXI36KThDTcXG3DvpjH5lgKoddWFyrDvoOWT+ChIlTuM/kj1XZjEX6jzCdr2VbxS8L6e7os3C+pCYg0CbDsn4zd4HqmXKtoFuJiiAsevMwHQdWsCfEyIkmokkOenE9hC71ehJRYCIdHMpo9/n/tO+W/7H7P02esOXVmc/YD0qmr2YpIo4Sr3x5r4t160fzp7ovUj6tn6iYtcq1P0ZC5Jz2sK89g+SnGytVL4mmA0OEClMt+51hKYO3VltuHHkYb4jLGemMhFjtYpUkLiSh85hYOOfF1S0i3KYptA4VZHTm8txdEvjGl4=
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(83380400001)(54906003)(66574015)(186003)(66616009)(966005)(16576012)(53546011)(8676002)(70586007)(2906002)(30864003)(110136005)(31696002)(26005)(45080400002)(5660300002)(36756003)(235185007)(31686004)(16526019)(8936002)(426003)(336012)(2616005)(33964004)(356005)(82310400003)(7636003)(316002)(36860700001)(4326008)(86362001)(70206006)(508600001)(32650700002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 17:34:12.6546
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 112ce9d7-244a-4226-2e32-08d97c5cdc83
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT035.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1943
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

--------------B0A1EB28C7A8554129AE9A97
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 9/20/21 8:51 AM, Pali Rohár wrote:
> On Monday 20 September 2021 15:33:20 Hans de Goede wrote:
>> Hi Pali,
>>
>> On 9/20/21 3:29 PM, Pali Rohár wrote:
>>> On Monday 13 September 2021 11:01:50 Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 9/3/21 2:38 AM, Daniel Dadap wrote:
>>>>> A number of upcoming notebook computer designs drive the internal
>>>>> display panel's backlight PWM through the Embedded Controller (EC).
>>>>> This EC-based backlight control can be plumbed through to an ACPI
>>>>> "WMAA" method interface, which in turn can be wrapped by WMI with
>>>>> the GUID handle 603E9613-EF25-4338-A3D0-C46177516DB7.
>>>>>
>>>>> Add a new driver, aliased to the WMAA WMI GUID, to expose a sysfs
>>>>> backlight class driver to control backlight levels on systems with
>>>>> EC-driven backlights.
>>>>>
>>>>> Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
>>>>> Reviewed-By: Thomas Weißschuh <linux@weissschuh.net>
>>>> Thank you for your patch, I've applied this patch to my review-hans
>>>> branch:
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
>>>>
>>>> Note it will show up in my review-hans branch once I've pushed my
>>>> local branch there, which might take a while.
>>>>
>>>> Once I've run some tests on this branch the patches there will be
>>>> added to the platform-drivers-x86/for-next branch and eventually
>>>> will be included in the pdx86 pull-request to Linus for the next
>>>> merge-window.
>>> Hello Hans!
>>>
>>> I would suggest to rename this driver and config option to not include
>>> -AA in its name. WMAA is just internal name of ACPI method, composed
>>> from two parts: "WM" and "AA". Second part "AA" is read from the _WDG
>>> where is the translation table from WMI GUID (in this case 603E9613...)
>>> to ACPI method name. "AA" is just autogenerated identifier by wmi
>>> compiler and because names are ASCII strings, I guess "AA" could mean
>>> the first (autogenerated) method. In the whole driver code you are not
>>> using AA function name, but directly WMI GUID, which also means that
>>> driver is prepared if vendor "recompiles" wmi code in acpi (and compiler
>>> generates another identifier, not AA). Also another argument is that
>>> there can be lot of other laptops which have WMAA ACPI method but they
>>> can have different API or do something totally different. So name WMAA
>>> is in this wmi context very misleading. Rather it should be named by
>>> vendor.
>> Right, that is a very valid point. I should have spotted this myself.


My apologies. I wasn't aware that WMAA was an autogenerated method name; 
I thought it was the name of the ACPI method and that the 603E9613... 
WMI GUID happened to wrap it. Given your explanation, I agree that the 
current name is inappropriate.


>> So what would be a better name wmi-nvidia-backlight.ko I guess ?
>> (and update the rest to match ?)
> It looks like that no vendor driver starts with "wmi-" prefix. "-wmi"
> string is used as a suffix. So for consistency it would be better to
> choose "nvidia-backlight-wmi.ko".
>
> But it would be a nice to know if this wmi "API" is nvidia specific or
> not. Because it is possible that there is vendor C who this "API"
> invented, is licensing it and nvidia was just first who started using
> this "API" + send patch to kernel. Embedded Controller, including its
> programming is done by laptop vendor, it is fully in laptop vendor
> control and I do not think that nvidia sells laptops. So there is a high
> chance that we will see laptops without any nvidia component (with e.g.
> amd or intel graphics card) and with this "API" :)


I will have to check about the origin of the "API" to be certain. My 
understanding is that this WMI backlight control scheme is part of 
NVIDIA design recommendations to notebook OEMs, with multiple OEMs 
potentially implementing it (I'm aware of at least two off the top of my 
head which already have systems in the wild). Specifically, this is 
meant to address an issue in hybrid systems with switchable graphics, by 
placing control of the backlight level with the EC rather than having to 
coordinate it between the different GPUs which might happen to be 
connected to the panel at any given time. It seems appropriate to me to 
include "nvidia" in the driver name for now; it could be renamed if it 
turns out non-NVIDIA designs use it as well. I don't have any specific 
information on whether or not that would be the case.


> Some information may be available in bmf / acpidump code. Also there can
> be information if this GUID is just for backlight or if it can provide
> also some other functionality.
>
> So for now lets stick with nvidia and I guess later driver can be
> renamed (if we find out that this "API" is used also on non-nvidia based
> laptops).


Okay, I'll send a follow-up patch to do the renaming once I get a little 
more clarification from someone who knows more about where the interface 
came from.


>
>>> Anyway, could you provide BMF code for this wmi acpi functionality? In
>>> BMF could be encoded more informations, including real, meaning human
>>> readable name of this function. Not only internal (autogenerated) AA
>>> identifier. BMF can be extracted from dumps created by 'acpidump' tool
>>> or with new kernels directly from files 'find /sys/ -name bmof'.


I've attached the output of your bmf2mof tool. Seems it's named 
"WmiBrightnessNotify", which isn't especially helpful.


>> I will leave answering this part up to Daniel Dadap, since I don't
>> have access to any of this.
>>
>> Regards,
>>
>> Hans
>>
>>
>>> For example Windows drivers use directly those real function names and
>>> let Windows NT kernel to translate real function names. So if for this
>>> functionality there is Windows driver, its .ini (or other text files)
>>> could also provide more information.
>>>
>>> In past I have written bmf2mof decompiler which decompiles binary BMF
>>> code back to MOF source code: https://github.com/pali/bmfdec
>>>
>>> So if you extract BMF code from that machine, then this bmf2mof tool can
>>> help with developing or identifying parts of wmi, and showing real
>>> function names. Sometimes there are also comments/descriptions in binary
>>> BMF code (but due to its format, not readable by 'strings', and
>>> decompilation is needed) which can provide even more information about
>>> usage.
>>>
>>>> Regards,
>>>>
>>>> Hans
>>>>
>>>>
>>>>> ---
>>>>>
>>>>> v2: Convert to WMI subsystem driver, suggested by Mario Limonciello
>>>>>      <mario.limonciello@outlook.com>; various cleanups suggested by
>>>>>      Barnabás Pőcze <pobrn@protonmail.com>
>>>>> v3: Address assorted style nits raised by Andy Shevchenko
>>>>>      <andy.shevchenko@gmail.com> in response to a related patch; remove
>>>>>      additional behavior change to WMI subsystem from patch series as
>>>>>      recommended by Hans de Goede <hdegoede@redhat.com>
>>>>> v4: Use MODULE_DEVICE_TABLE() (Thomas Weißschuh <thomas@t-8ch.de>)
>>>>>      Fix scope of internal driver state; various style fixes (Barnabás
>>>>>      Pőcze, Andy Shevchenko)
>>>>>      Use devm_backlight_device_register() (Barnabás Pőcze)
>>>>>      Add kerneldoc comments for enums and structs (Andy Shevchenko)
>>>>> v5: Remove Aaron Plattner as author, as suggested by Aaron Plattner
>>>>>      <aplattner@nvidia.com>
>>>>>      Register as BACKLIGHT_FIRMWARE rather than BACKLIGHT_PLATFORM;
>>>>>      Return negative errno if .get_brightness() fails (Thomas Weißschuh)
>>>>>      Assorted style improvements (Andy Shevchenko, Thomas Weißschuh)
>>>>> v6: Make behavior of callers of wmi_call_wmaa() more consistent;
>>>>>      simplify potentially confusing description in Kconfig help text
>>>>>      (Thomas Weißschuh)
>>>>>
>>>>>   MAINTAINERS                               |   6 +
>>>>>   drivers/platform/x86/Kconfig              |  16 ++
>>>>>   drivers/platform/x86/Makefile             |   1 +
>>>>>   drivers/platform/x86/wmaa-backlight-wmi.c | 205 ++++++++++++++++++++++
>>>>>   4 files changed, 228 insertions(+)
>>>>>   create mode 100644 drivers/platform/x86/wmaa-backlight-wmi.c
>>>>>
>>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>>> index bbaecde94aa0..fd7362a86c6d 100644
>>>>> --- a/MAINTAINERS
>>>>> +++ b/MAINTAINERS
>>>>> @@ -20008,6 +20008,12 @@ L:	linux-wireless@vger.kernel.org
>>>>>   S:	Odd fixes
>>>>>   F:	drivers/net/wireless/wl3501*
>>>>>   
>>>>> +WMAA BACKLIGHT DRIVER
>>>>> +M:	Daniel Dadap <ddadap@nvidia.com>
>>>>> +L:	platform-driver-x86@vger.kernel.org
>>>>> +S:	Supported
>>>>> +F:	drivers/platform/x86/wmaa-backlight-wmi.c
>>>>> +
>>>>>   WOLFSON MICROELECTRONICS DRIVERS
>>>>>   L:	patches@opensource.cirrus.com
>>>>>   S:	Supported
>>>>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>>>>> index d12db6c316ea..00f021eda25c 100644
>>>>> --- a/drivers/platform/x86/Kconfig
>>>>> +++ b/drivers/platform/x86/Kconfig
>>>>> @@ -113,6 +113,22 @@ config PEAQ_WMI
>>>>>   	help
>>>>>   	 Say Y here if you want to support WMI-based hotkeys on PEAQ 2-in-1s.
>>>>>   
>>>>> +config WMAA_BACKLIGHT_WMI
>>>>> +	tristate "ACPI WMAA Backlight Driver"
>>>>> +	depends on ACPI_WMI
>>>>> +	depends on BACKLIGHT_CLASS_DEVICE
>>>>> +	help
>>>>> +	  This driver provides a sysfs backlight interface for notebook
>>>>> +	  systems which expose the WMAA ACPI method and an associated WMI
>>>>> +	  wrapper to drive LCD backlight levels through the Embedded Controller
>>>>> +	  (EC).
>>>>> +
>>>>> +	  Say Y or M here if you want to control the backlight on a notebook
>>>>> +	  system with an EC-driven backlight using the ACPI WMAA method.
>>>>> +
>>>>> +	  If you choose to compile this driver as a module the module will be
>>>>> +	  called wmaa-backlight-wmi.
>>>>> +
>>>>>   config XIAOMI_WMI
>>>>>   	tristate "Xiaomi WMI key driver"
>>>>>   	depends on ACPI_WMI
>>>>> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
>>>>> index 7ee369aab10d..109c1714237d 100644
>>>>> --- a/drivers/platform/x86/Makefile
>>>>> +++ b/drivers/platform/x86/Makefile
>>>>> @@ -14,6 +14,7 @@ obj-$(CONFIG_INTEL_WMI_SBL_FW_UPDATE)	+= intel-wmi-sbl-fw-update.o
>>>>>   obj-$(CONFIG_INTEL_WMI_THUNDERBOLT)	+= intel-wmi-thunderbolt.o
>>>>>   obj-$(CONFIG_MXM_WMI)			+= mxm-wmi.o
>>>>>   obj-$(CONFIG_PEAQ_WMI)			+= peaq-wmi.o
>>>>> +obj-$(CONFIG_WMAA_BACKLIGHT_WMI)	+= wmaa-backlight-wmi.o
>>>>>   obj-$(CONFIG_XIAOMI_WMI)		+= xiaomi-wmi.o
>>>>>   obj-$(CONFIG_GIGABYTE_WMI)		+= gigabyte-wmi.o
>>>>>   
>>>>> diff --git a/drivers/platform/x86/wmaa-backlight-wmi.c b/drivers/platform/x86/wmaa-backlight-wmi.c
>>>>> new file mode 100644
>>>>> index 000000000000..f5c4f8337c2c
>>>>> --- /dev/null
>>>>> +++ b/drivers/platform/x86/wmaa-backlight-wmi.c
>>>>> @@ -0,0 +1,205 @@
>>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>>> +/*
>>>>> + * Copyright (c) 2020, NVIDIA CORPORATION.  All rights reserved.
>>>>> + */
>>>>> +
>>>>> +#include <linux/acpi.h>
>>>>> +#include <linux/backlight.h>
>>>>> +#include <linux/mod_devicetable.h>
>>>>> +#include <linux/module.h>
>>>>> +#include <linux/types.h>
>>>>> +#include <linux/wmi.h>
>>>>> +
>>>>> +/**
>>>>> + * enum wmaa_method - WMI method IDs for ACPI WMAA
>>>>> + * @WMAA_METHOD_LEVEL:  Get or set the brightness level,
>>>>> + *                      or get the maximum brightness level.
>>>>> + * @WMAA_METHOD_SOURCE: Get the source for backlight control.
>>>>> + */
>>>>> +enum wmaa_method {
>>>>> +	WMAA_METHOD_LEVEL = 1,
>>>>> +	WMAA_METHOD_SOURCE = 2,
>>>>> +	WMAA_METHOD_MAX
>>>>> +};
>>>>> +
>>>>> +/**
>>>>> + * enum wmaa_mode - Operation mode for ACPI WMAA method
>>>>> + * @WMAA_MODE_GET:           Get the current brightness level or source.
>>>>> + * @WMAA_MODE_SET:           Set the brightness level.
>>>>> + * @WMAA_MODE_GET_MAX_LEVEL: Get the maximum brightness level. This is only
>>>>> + *                           valid when the WMI method is %WMAA_METHOD_LEVEL.
>>>>> + */
>>>>> +enum wmaa_mode {
>>>>> +	WMAA_MODE_GET = 0,
>>>>> +	WMAA_MODE_SET = 1,
>>>>> +	WMAA_MODE_GET_MAX_LEVEL = 2,
>>>>> +	WMAA_MODE_MAX
>>>>> +};
>>>>> +
>>>>> +/**
>>>>> + * enum wmaa_source - Backlight brightness control source identification
>>>>> + * @WMAA_SOURCE_GPU:   Backlight brightness is controlled by the GPU.
>>>>> + * @WMAA_SOURCE_EC:    Backlight brightness is controlled by the system's
>>>>> + *                     Embedded Controller (EC).
>>>>> + * @WMAA_SOURCE_AUX:   Backlight brightness is controlled over the DisplayPort
>>>>> + *                     AUX channel.
>>>>> + */
>>>>> +enum wmaa_source {
>>>>> +	WMAA_SOURCE_GPU = 1,
>>>>> +	WMAA_SOURCE_EC = 2,
>>>>> +	WMAA_SOURCE_AUX = 3,
>>>>> +	WMAA_SOURCE_MAX
>>>>> +};
>>>>> +
>>>>> +/**
>>>>> + * struct wmaa_args - arguments for the ACPI WMAA method
>>>>> + * @mode:    Pass in an &enum wmaa_mode value to select between getting or
>>>>> + *           setting a value.
>>>>> + * @val:     In parameter for value to set when operating in %WMAA_MODE_SET
>>>>> + *           mode. Not used in %WMAA_MODE_GET or %WMAA_MODE_GET_MAX_LEVEL mode.
>>>>> + * @ret:     Out parameter returning retrieved value when operating in
>>>>> + *           %WMAA_MODE_GET or %WMAA_MODE_GET_MAX_LEVEL mode. Not used in
>>>>> + *           %WMAA_MODE_SET mode.
>>>>> + * @ignored: Padding; not used. The ACPI method expects a 24 byte params struct.
>>>>> + *
>>>>> + * This is the parameters structure for the ACPI WMAA method as wrapped by WMI.
>>>>> + * The value passed in to @val or returned by @ret will be a brightness value
>>>>> + * when the WMI method ID is %WMAA_METHOD_LEVEL, or an &enum wmaa_source value
>>>>> + * when the WMI method ID is %WMAA_METHOD_SOURCE.
>>>>> + */
>>>>> +struct wmaa_args {
>>>>> +	u32 mode;
>>>>> +	u32 val;
>>>>> +	u32 ret;
>>>>> +	u32 ignored[3];
>>>>> +};
>>>>> +
>>>>> +/**
>>>>> + * wmi_call_wmaa() - helper function for calling ACPI WMAA via its WMI wrapper
>>>>> + * @w:    Pointer to the struct wmi_device identified by %WMAA_WMI_GUID
>>>>> + * @id:   The method ID for the ACPI WMAA method (e.g. %WMAA_METHOD_LEVEL or
>>>>> + *        %WMAA_METHOD_SOURCE)
>>>>> + * @mode: The operation to perform on the ACPI WMAA method (e.g. %WMAA_MODE_SET
>>>>> + *        or %WMAA_MODE_GET)
>>>>> + * @val:  Pointer to a value passed in by the caller when @mode is
>>>>> + *        %WMAA_MODE_SET, or a value passed out to the caller when @mode is
>>>>> + *        %WMAA_MODE_GET or %WMAA_MODE_GET_MAX_LEVEL.
>>>>> + *
>>>>> + * Returns 0 on success, or a negative error number on failure.
>>>>> + */
>>>>> +static int wmi_call_wmaa(struct wmi_device *w, enum wmaa_method id, enum wmaa_mode mode, u32 *val)
>>>>> +{
>>>>> +	struct wmaa_args args = {
>>>>> +		.mode = mode,
>>>>> +		.val = 0,
>>>>> +		.ret = 0,
>>>>> +	};
>>>>> +	struct acpi_buffer buf = { (acpi_size)sizeof(args), &args };
>>>>> +	acpi_status status;
>>>>> +
>>>>> +	if (id < WMAA_METHOD_LEVEL || id >= WMAA_METHOD_MAX ||
>>>>> +	    mode < WMAA_MODE_GET || mode >= WMAA_MODE_MAX)
>>>>> +		return -EINVAL;
>>>>> +
>>>>> +	if (mode == WMAA_MODE_SET)
>>>>> +		args.val = *val;
>>>>> +
>>>>> +	status = wmidev_evaluate_method(w, 0, id, &buf, &buf);
>>>>> +	if (ACPI_FAILURE(status)) {
>>>>> +		dev_err(&w->dev, "ACPI WMAA failed: %s\n",
>>>>> +			acpi_format_exception(status));
>>>>> +		return -EIO;
>>>>> +	}
>>>>> +
>>>>> +	if (mode != WMAA_MODE_SET)
>>>>> +		*val = args.ret;
>>>>> +
>>>>> +	return 0;
>>>>> +}
>>>>> +
>>>>> +static int wmaa_backlight_update_status(struct backlight_device *bd)
>>>>> +{
>>>>> +	struct wmi_device *wdev = bl_get_data(bd);
>>>>> +
>>>>> +	return wmi_call_wmaa(wdev, WMAA_METHOD_LEVEL, WMAA_MODE_SET,
>>>>> +			     &bd->props.brightness);
>>>>> +}
>>>>> +
>>>>> +static int wmaa_backlight_get_brightness(struct backlight_device *bd)
>>>>> +{
>>>>> +	struct wmi_device *wdev = bl_get_data(bd);
>>>>> +	u32 level;
>>>>> +	int ret;
>>>>> +
>>>>> +	ret = wmi_call_wmaa(wdev, WMAA_METHOD_LEVEL, WMAA_MODE_GET, &level);
>>>>> +	if (ret < 0)
>>>>> +		return ret;
>>>>> +
>>>>> +	return level;
>>>>> +}
>>>>> +
>>>>> +static const struct backlight_ops wmaa_backlight_ops = {
>>>>> +	.update_status = wmaa_backlight_update_status,
>>>>> +	.get_brightness = wmaa_backlight_get_brightness,
>>>>> +};
>>>>> +
>>>>> +static int wmaa_backlight_wmi_probe(struct wmi_device *wdev, const void *ctx)
>>>>> +{
>>>>> +	struct backlight_properties props = {};
>>>>> +	struct backlight_device *bdev;
>>>>> +	u32 source;
>>>>> +	int ret;
>>>>> +
>>>>> +	ret = wmi_call_wmaa(wdev, WMAA_METHOD_SOURCE, WMAA_MODE_GET, &source);
>>>>> +	if (ret)
>>>>> +		return ret;
>>>>> +
>>>>> +	/*
>>>>> +	 * This driver is only to be used when brightness control is handled
>>>>> +	 * by the EC; otherwise, the GPU driver(s) should control brightness.
>>>>> +	 */
>>>>> +	if (source != WMAA_SOURCE_EC)
>>>>> +		return -ENODEV;
>>>>> +
>>>>> +	/*
>>>>> +	 * Identify this backlight device as a firmware device so that it can
>>>>> +	 * be prioritized over any exposed GPU-driven raw device(s).
>>>>> +	 */
>>>>> +	props.type = BACKLIGHT_FIRMWARE;
>>>>> +
>>>>> +	ret = wmi_call_wmaa(wdev, WMAA_METHOD_LEVEL, WMAA_MODE_GET_MAX_LEVEL,
>>>>> +			    &props.max_brightness);
>>>>> +	if (ret)
>>>>> +		return ret;
>>>>> +
>>>>> +	ret = wmi_call_wmaa(wdev, WMAA_METHOD_LEVEL, WMAA_MODE_GET,
>>>>> +			    &props.brightness);
>>>>> +	if (ret)
>>>>> +		return ret;
>>>>> +
>>>>> +	bdev = devm_backlight_device_register(&wdev->dev, "wmaa_backlight",
>>>>> +					      &wdev->dev, wdev,
>>>>> +					      &wmaa_backlight_ops, &props);
>>>>> +	return PTR_ERR_OR_ZERO(bdev);
>>>>> +}
>>>>> +
>>>>> +#define WMAA_WMI_GUID "603E9613-EF25-4338-A3D0-C46177516DB7"
>>>>> +
>>>>> +static const struct wmi_device_id wmaa_backlight_wmi_id_table[] = {
>>>>> +	{ .guid_string = WMAA_WMI_GUID },
>>>>> +	{ }
>>>>> +};
>>>>> +MODULE_DEVICE_TABLE(wmi, wmaa_backlight_wmi_id_table);
>>>>> +
>>>>> +static struct wmi_driver wmaa_backlight_wmi_driver = {
>>>>> +	.driver = {
>>>>> +		.name = "wmaa-backlight",
>>>>> +	},
>>>>> +	.probe = wmaa_backlight_wmi_probe,
>>>>> +	.id_table = wmaa_backlight_wmi_id_table,
>>>>> +};
>>>>> +module_wmi_driver(wmaa_backlight_wmi_driver);
>>>>> +
>>>>> +MODULE_AUTHOR("Daniel Dadap <ddadap@nvidia.com>");
>>>>> +MODULE_DESCRIPTION("WMAA Backlight WMI driver");
>>>>> +MODULE_LICENSE("GPL");
>>>>>

--------------B0A1EB28C7A8554129AE9A97
Content-Type: text/plain; charset="UTF-8"; name="mof"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="mof"

W1dNSSwgRHluYW1pYywgUHJvdmlkZXIoIldtaVByb3YiKSwgTG9jYWxlKCJNU1xcMHg0MDki
KSwgRGVzY3JpcHRpb24oIldNSSBGdW5jdGlvbiIpLCBndWlkKCJ7NjAzZTk2MTMtZWYyNS00
MzM4LWEzZDAtYzQ2MTc3NTE2ZGI3fSIpXQpjbGFzcyBXbWlCcmlnaHRuZXNzTm90aWZ5IHsK
ICBba2V5LCByZWFkXSBTdHJpbmcgSW5zdGFuY2VOYW1lOwogIFtyZWFkXSBCb29sZWFuIEFj
dGl2ZTsKCiAgW1dtaU1ldGhvZElkKDEpLCBJbXBsZW1lbnRlZCwgcmVhZCwgd3JpdGUsIERl
c2NyaXB0aW9uKCJHZXQvU2V0IEVDIGJyaWdodG5lc3MgbGV2ZWwgc3RhdHVzIildIHZvaWQg
Tm90aWZ5QnJpZ2h0bmVzc0xldmVsKFtpbl0gdWludDMyIGluQXJnLCBbaW5dIHVpbnQzMiBM
ZXZlbCwgW291dF0gdWludDMyIFJlc3VsdCk7CiAgW1dtaU1ldGhvZElkKDIpLCBJbXBsZW1l
bnRlZCwgcmVhZCwgd3JpdGUsIERlc2NyaXB0aW9uKCJHZXQvU2V0IERpc3BsYXkgQnJpZ2h0
bmVzcyBTb3VyY2UiKV0gdm9pZCBOb3RpZnlCcmlnaHRuZXNzU291cmNlKFtpbl0gdWludDMy
IGluQXJnMCwgW2luXSB1aW50MzIgaW5BcmcxLCBbb3V0XSB1aW50MzIgUmVzdWx0KTsKfTsK

--------------B0A1EB28C7A8554129AE9A97--
