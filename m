Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 263E8C433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Sep 2021 22:52:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 03D9A61157
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Sep 2021 22:52:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237930AbhI0WyQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 27 Sep 2021 18:54:16 -0400
Received: from mail-sn1anam02on2076.outbound.protection.outlook.com ([40.107.96.76]:19893
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237780AbhI0WyP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Sep 2021 18:54:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FHJQbAI4LzEoTk7lxraRpNFdSghUeCpowO0gr1e5Pq6AugrTs9+bek0NXkkkuUxIsVNqnHkkbtctdWNVHrvNaGTIAaU+5tsyW3Dl+G19tlrf4OBf9++lwIWtow1GUoSrlQOvl31g1h/SqeCruBv/RBhLO4zJU8vq4ZCSlcIRwY9Pu6uQ3lnlbCPOhs+Q+Y1EYvEMDGFOetYWRikaIQczzEvfHhBpZhbeyBqJBsaCFXu8tN1zc5RSPYDZ0nYNYa9+mkqTZtUNY0pcBvBOQKQGLTthLKM+tvLrU4znCfxbOGV0oNjYxWFx9PtFJPzclStE3glaPffRQDYi/IrgbBY0sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=v4sEOdb9/Sma0Cc/QQTASA51jSP56qn5YJmtoSbTm0M=;
 b=mHr2b2AWMmCiffgzLiPNuYWhJ/cSbVOij1iBgqvyMph/Hu23u7OwcqwGaoXrYrZgRKBXu7AiMED67Eta4/zStBxGeP2bBc0DwS3ay5+Adka7jSsyNbIYl6bRKQiZyNEtB0bHIxUYhSokzSIUUYC0IA7IKQpjh7Uz4fsVBZ/CbEFO6yEuh1y0aIEbiWY8hxNV1Pf3WcZHTbCRrM5MWTL3rjPMQrTy3hme/Zh2jwvDEHQ4BF8dc6Ol/lJQrP32Z738k9KiWjYBaVGt5axXfXiCpfLAExUygYhRaD7mpyfiNY5n+CQYsfzYh4pmJzYFxrEm1vCeJXhVRRobpOPCIDnoEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=weissschuh.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v4sEOdb9/Sma0Cc/QQTASA51jSP56qn5YJmtoSbTm0M=;
 b=dCn/JxPn1IjUXX1T3ZaiO5rbhtngufznJDs6/lUokWZktpy9p9ersXZMa6qtAaIFiegxPbLPQVeqGthqRpPEdGE3nU7x2kh5QAr/EFodXagT9++ihBdT6NRRaAZKTL947EeN3gDcZ4d7EQUlPlwRHD300LAahTL50fAgL4r+F3Mdr0Gn/vdOKqawjfdbGLl7G4buNz9sNdJN8foWq5+QyNDuwOMLG6JpjDeNWYr6TasZPc59UKk4xSuvnJdpn36ICmsEfSFEt0K1OAo1yWrx/EwQLoDLICD0jTrIP5rff57Axvy+cuowDh2HIR4SDP4Nq75DTXia83NauLJquDLzCw==
Received: from BN9P223CA0024.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::29)
 by MN2PR12MB4656.namprd12.prod.outlook.com (2603:10b6:208:182::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Mon, 27 Sep
 2021 22:52:35 +0000
Received: from BN8NAM11FT043.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10b:cafe::d3) by BN9P223CA0024.outlook.office365.com
 (2603:10b6:408:10b::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15 via Frontend
 Transport; Mon, 27 Sep 2021 22:52:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; weissschuh.net; dkim=none (message not signed)
 header.d=none;weissschuh.net; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT043.mail.protection.outlook.com (10.13.177.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4544.13 via Frontend Transport; Mon, 27 Sep 2021 22:52:34 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 27 Sep
 2021 22:52:33 +0000
Received: from [10.20.112.88] (172.20.187.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 27 Sep
 2021 22:52:31 +0000
Subject: Re: [PATCH v6] platform/x86: Add driver for ACPI WMAA EC-based
 backlight control
To:     Hans de Goede <hdegoede@redhat.com>
CC:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "mario.limonciello@outlook.com" <mario.limonciello@outlook.com>,
        "pobrn@protonmail.com" <pobrn@protonmail.com>,
        "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
        Aaron Plattner <aplattner@nvidia.com>,
        =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>
References: <e63904b7-105b-4401-bd40-82854b7d42d1@t-8ch.de>
 <20210903003838.15797-1-ddadap@nvidia.com>
 <11ffe8bc-b4ee-c451-9860-46997de8fe55@redhat.com>
 <20210920132911.cus27elz36dme63g@pali>
 <8b07125d-83b9-9de4-fd52-1cb01466364a@redhat.com>
 <20210920135106.y6mi57bcmurczmka@pali>
 <57a958e2-93d7-3eea-ec7b-9496acd6aae5@redhat.com>
 <A116D719-A0BD-4FA5-A758-E48D6428A8A6@nvidia.com>
 <9cbb4e7a-4af9-32f8-0293-6c2ef7d44ceb@redhat.com>
From:   Daniel Dadap <ddadap@nvidia.com>
Message-ID: <1eee47f1-c0eb-df26-ecc1-f16b00d26a70@nvidia.com>
Date:   Mon, 27 Sep 2021 17:52:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <9cbb4e7a-4af9-32f8-0293-6c2ef7d44ceb@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c76277a0-17e2-40b7-8ae1-08d982097ec1
X-MS-TrafficTypeDiagnostic: MN2PR12MB4656:
X-Microsoft-Antispam-PRVS: <MN2PR12MB46564D656F89577B4052E36FBCA79@MN2PR12MB4656.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mLTSUQyLPOYDf5odhqonAPClE3ZUKM52HvHIJPTFRjBQtiJyp/TBJwTUG6FOGDyHDQP4RFmVEFbQEDYIwLNtd/6YNWQKvH4s+yJOpGw4UAcdkBb8Z+ZM4DqyB2YPkJLYrxsOOKA9yFDcrCGXRyIQLbSbWYH4t6QpIjyuBlztuKgvoJ3sKeOFspxwmFZq74+13gXEQUWx7pZHAfJYBSZ/3XrPgzA3HX1ebVcOBgxYSSJjCjUwHoDBvC8Rnw3lDxVCWTbh3uVBuHE89YSEP76pdqyVYg1Mysguo+lr6uACRyuPyjva6Z7zIGRBX8yujjC2y2xZbdqZTiSatFh9DqgtTGRUrXGou3fm6yUHaYrprIq+8E/VBx6rKRBVwvRbT6j4t9VojPLgwZ5TyN8YKgxzfkcfClpn8XHhOkj80UwwhC/qENHllZF4al14k2HiuTvr1X4MjwBeZGeL4VD2amV0/p+mpzK8Vv+vzYyUUDfY+oSie95yEBBp7QNPeh/dXcZG2kwmlLqOnNcxlwxl/92Xnyjn3k38UYVT1lAS922/e4vXm6v/IeCFIaYQZc6wOUkrNIR5sr0MsPqzgP9Ph6GjQ24KpypCvNOvBZfQyOjdmtfAl81MzR9vhtTXFXbjDr2IrEn4aFcjrQ4+GWeFY1cbFF3o/3QOLxFAONQy5wNGZk73La0Nzkvdjwm5Cc5aTWvue+VZ3gyySZ4XbNmFm/gVOxIGazpLQUSBPi6iGFPzjVpPX5N9jt/lp7sMSUsL5UoxYrNccPshF0Bxz27n5PBLvAIBoING2+JBU1it5jPAi3flb7u+26ARTBFJ0fbXvtls
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(6916009)(8676002)(8936002)(4326008)(54906003)(31696002)(36756003)(86362001)(31686004)(2906002)(83380400001)(66574015)(16576012)(316002)(36906005)(36860700001)(82310400003)(32650700002)(26005)(5660300002)(356005)(53546011)(966005)(70586007)(70206006)(16526019)(2616005)(336012)(426003)(6666004)(186003)(7636003)(508600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 22:52:34.0886
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c76277a0-17e2-40b7-8ae1-08d982097ec1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT043.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4656
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


On 9/21/21 9:58 AM, Hans de Goede wrote:
> Hi,
>
> On 9/21/21 4:29 PM, Daniel Dadap wrote:
>>> On Sep 21, 2021, at 08:53, Hans de Goede <hdegoede@redhat.com> wrote:
>>>
>>> ﻿Hi,
>>>
>>>> On 9/20/21 3:51 PM, Pali Rohár wrote:
>>>>> On Monday 20 September 2021 15:33:20 Hans de Goede wrote:
>>>>> Hi Pali,
>>>>>
>>>>> On 9/20/21 3:29 PM, Pali Rohár wrote:
>>>>>> On Monday 13 September 2021 11:01:50 Hans de Goede wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> On 9/3/21 2:38 AM, Daniel Dadap wrote:
>>>>>>>> A number of upcoming notebook computer designs drive the internal
>>>>>>>> display panel's backlight PWM through the Embedded Controller (EC).
>>>>>>>> This EC-based backlight control can be plumbed through to an ACPI
>>>>>>>> "WMAA" method interface, which in turn can be wrapped by WMI with
>>>>>>>> the GUID handle 603E9613-EF25-4338-A3D0-C46177516DB7.
>>>>>>>>
>>>>>>>> Add a new driver, aliased to the WMAA WMI GUID, to expose a sysfs
>>>>>>>> backlight class driver to control backlight levels on systems with
>>>>>>>> EC-driven backlights.
>>>>>>>>
>>>>>>>> Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
>>>>>>>> Reviewed-By: Thomas Weißschuh <linux@weissschuh.net>
>>>>>>> Thank you for your patch, I've applied this patch to my review-hans
>>>>>>> branch:
>>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
>>>>>>>
>>>>>>> Note it will show up in my review-hans branch once I've pushed my
>>>>>>> local branch there, which might take a while.
>>>>>>>
>>>>>>> Once I've run some tests on this branch the patches there will be
>>>>>>> added to the platform-drivers-x86/for-next branch and eventually
>>>>>>> will be included in the pdx86 pull-request to Linus for the next
>>>>>>> merge-window.
>>>>>> Hello Hans!
>>>>>>
>>>>>> I would suggest to rename this driver and config option to not include
>>>>>> -AA in its name. WMAA is just internal name of ACPI method, composed
>>>>>> from two parts: "WM" and "AA". Second part "AA" is read from the _WDG
>>>>>> where is the translation table from WMI GUID (in this case 603E9613...)
>>>>>> to ACPI method name. "AA" is just autogenerated identifier by wmi
>>>>>> compiler and because names are ASCII strings, I guess "AA" could mean
>>>>>> the first (autogenerated) method. In the whole driver code you are not
>>>>>> using AA function name, but directly WMI GUID, which also means that
>>>>>> driver is prepared if vendor "recompiles" wmi code in acpi (and compiler
>>>>>> generates another identifier, not AA). Also another argument is that
>>>>>> there can be lot of other laptops which have WMAA ACPI method but they
>>>>>> can have different API or do something totally different. So name WMAA
>>>>>> is in this wmi context very misleading. Rather it should be named by
>>>>>> vendor.
>>>>> Right, that is a very valid point. I should have spotted this myself.
>>>>>
>>>>> So what would be a better name wmi-nvidia-backlight.ko I guess ?
>>>>> (and update the rest to match ?)
>>>> It looks like that no vendor driver starts with "wmi-" prefix. "-wmi"
>>>> string is used as a suffix. So for consistency it would be better to
>>>> choose "nvidia-backlight-wmi.ko".
>>> Right, I should have checked first.
>>>
>>> So I just checked and the standard pattern used is:
>>> vendor_wmi_feature
>>>
>>> So lets go with nvidia_wmi_backlight.ko
>>>
>>> Daniel, can you prepare a patch on top of your merged patch to do
>>> the rename of the Kconfig entry and the module-name please?
>>>
>> Yes, I already had a patch prepared to rename things to nvidia-backlight-wmi; I am waiting to hear back from some folks if there’s a more specific name that might be appropriate (e.g. a name of a particular feature tied to this) or if it should be more generic (e.g., if there is a strong possibility this design may be used in systems with no NVIDIA GPU); while I’m waiting for those answers, I’ll switch to nvidia-wmi-backlight as the assumed option, if there isn’t something more appropriate.
> Ok, sounds good, thank you.


The one suggestion I got for improving the name we've discussed here is 
to include "ec" in the name, to make it clear that this isn't a driver 
for the normal backlight interface that is driven by the NVIDIA GPU. I 
intended to send this message before the rename patches that I sent a 
few hours ago, but apparently I didn't.


> Regards,
>
> Hans
>
