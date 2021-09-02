Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB746C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Sep 2021 20:15:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C143061131
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Sep 2021 20:15:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345735AbhIBUQ2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 2 Sep 2021 16:16:28 -0400
Received: from mail-co1nam11on2053.outbound.protection.outlook.com ([40.107.220.53]:24800
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1345522AbhIBUQ2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Sep 2021 16:16:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=laFYwZzdorfaaLxivKJn3Aqsy41yhT9Vs2Gfy3A4GkyAS9/ZY6AcpKLsz9FzmP1HkOH5uAhWYVk4SdFV9eH68mCWRiDWcc1izVnPrBREFWofFSDaS4I61x4aKit3hSKOYm32tENoVPofBJvbOHE/ZUHaMmtmGqWpQ3JfwGE5JH6Lo7ev/8qLXTiz32a7aFTkbd1DAvkEgK7/W5CWVN9chXrFl2fYhHMo4NCbiwEYaaD1UI7vR3Tj5Jxvll56XeWVwFzwHEPcKmPsULP9Kqnqxzc6dzt8UBjNaSNtyoTsIgkdRvf+Zrp6obNl/88u/ph8zTFcDm20EADIdvp9mi+9Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=qwEvIv0baajQ0ygsNKerO/nMFKcMbj6ahuTY6Rj3W8E=;
 b=Ak9/7E0FhYj8fa1o9h8CAv4XydvP3qJnns2m/3T6lri1vhA2OAxkKOS6OJENNJVle0JxnN4qySGK9iCgzMwZrL+l9torGDoDetVkQ9NPFm7EiUorNZVjb+jak7ZNtYJP9uF3hJBNXmaJl2LVMTrsITVYHT8F+vMSDX+k3zXe5SJjXG2GHNDnF/cpqtr2x69ZIIhWjzaKMzMIHN+PLAL4UtPCmS//m9LaBYV+29UsdqVXGjVSrMl4U7L+YD73I32DYoR/8bgEzfBR60qjpqYvn1NqOMQ0nVhpQE1V0kwkCimDs/lHUwPN9AAXsvC1Ag/7RC4wMc31eWxzQ/sTvi0Dug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=infradead.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwEvIv0baajQ0ygsNKerO/nMFKcMbj6ahuTY6Rj3W8E=;
 b=QcLueQBBtABQ7t7wuq+t5ipBayAwGGhnt/0eNNgsYisJU8LeqL2i21Ve/nsTqTIl19cNcSfPzxNJ9xi7DleW7TiQV4DuEl5S8PvUtj0bg2DXyQFyJGvQT3l+OAVs6mizxlYUjvVSmkoNNT5LXE/R7PvWauE/poKprWz97R6vTneUmJJ5GULAeHZZ7fwA19GNQm/7F1wtTrGbt4JlukdLLjlm8FrBdhr/x91xkGrv7BcOyvBKWGibu27aSGXYYwc3BN5Mg/1DgD7WiDwhhnoWuymrIVD++ysjC/kX6BJarP76zaTXCOhY+JrNJQKAMkFeIwci1mT/v37yFAmXYa2zHA==
Received: from BN9PR03CA0729.namprd03.prod.outlook.com (2603:10b6:408:110::14)
 by BY5PR12MB3809.namprd12.prod.outlook.com (2603:10b6:a03:1aa::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.20; Thu, 2 Sep
 2021 20:15:28 +0000
Received: from BN8NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:110:cafe::b1) by BN9PR03CA0729.outlook.office365.com
 (2603:10b6:408:110::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17 via Frontend
 Transport; Thu, 2 Sep 2021 20:15:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT029.mail.protection.outlook.com (10.13.177.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 20:15:27 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 2 Sep
 2021 20:15:26 +0000
Received: from [10.20.23.105] (172.20.187.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 2 Sep 2021
 20:15:25 +0000
From:   Daniel Dadap <ddadap@nvidia.com>
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
 <ce05cf8a-9b1f-e3a5-33bb-4f997bc2bcec@nvidia.com>
 <cac5ceb8-86d3-4f67-bbac-fbaf191d5973@t-8ch.de>
Message-ID: <784b322b-ab4b-0a9f-f6cd-df81ba2d2cb5@nvidia.com>
Date:   Thu, 2 Sep 2021 15:15:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <cac5ceb8-86d3-4f67-bbac-fbaf191d5973@t-8ch.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97316e1a-5a9f-41ce-7731-08d96e4e678e
X-MS-TrafficTypeDiagnostic: BY5PR12MB3809:
X-Microsoft-Antispam-PRVS: <BY5PR12MB380956B0F59D0AC4A395458CBCCE9@BY5PR12MB3809.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tfCrwBlNG8XKLVK1P3eCDuYfKDOaErKRdMXXRM9pQHD86Nf9Wpa99I8we3XST2fF8gHu6LN/VZgi8C/81Tue+6iYJkeqSI9ztXBhS7HOlONAAHW5XjisKX1GazLrTmZH8yNa/eu4y1PgkqU9a9ItktVmQAbpKbBj8DQleyX9WOAqDrpC6K3uxnA1lM00rAxYuaBHRDdNgAyMxrz5SXKtsYoPIamfb3aTjDhP0sp5mOVTgFdevrQKWnfdH3UVcy7whEblIL1HLOzhJNGOTeSVDyZYKqJ1xX25CqtW4//UGnqIqbNwczpVqdORnJe/ZwsB3kl9QW6fRYy9CVWCbHE5LmVzOOhQTrbA3YNyP0vi9RBDKT1PROLVIUAdCshK4sjEoCPj5CFVa5NN0GryyFWgyOPP4ppV0k0FGxQVbC1pWR8kMc+tYUWnrpFmUixJPpppri2SEyGCrM/CtnyxWtbCUhmpwwUnc7IzF+GlptwW+xXBt9zGEsJW3qGD5A9URGlC9fUwoCmLr2oDWCeecwOuFyrThRw0RCXb98RP0/19h6JaxL/xIzSf8pTQDQeIonATgLXTHj8pouHUZ6wOlwqSdIkd5jLRAypmmWK4PTcfGoOXhJHTZ6wEobB+bMwvaNpxfLuUXzmXNUtmwAq5mLyaoyOkZo/x03V8hFqZ1Cj+DyEdLtMTuMG1hCCS6OfTcjiRt02wed/oWUy0W5N1eEfwA5TIsBDJwjygIvz+9i9rL30=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(136003)(346002)(36840700001)(4326008)(70206006)(36906005)(36860700001)(16576012)(26005)(53546011)(82310400003)(70586007)(36756003)(82740400003)(2906002)(32650700002)(5660300002)(316002)(478600001)(66574015)(8676002)(336012)(86362001)(16526019)(7636003)(186003)(2616005)(6916009)(426003)(31686004)(8936002)(31696002)(107886003)(356005)(54906003)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 20:15:27.1678
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97316e1a-5a9f-41ce-7731-08d96e4e678e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3809
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


On 9/2/21 5:19 AM, Thomas Weißschuh wrote:
> It seems that the encoding of the mail has been set as plain ASCII while it is
> actually UTF-8.
> Thunderbird is probly correctly inferring the actual encoding.
> Normally git-format-patch would detect the Unicode characters and add a
> matching content-type header to the patch.
> But as these Unicode characters are added after format-patch has run it is now
> git-send-emails task to add those headers again.
>
> In my version of git I get the following message from git-send-email:
>
>    The following files are 8bit, but do not declare a Content-Transfer-Encoding.
>        0001-....patch
>    Which 8bit encoding should I declare [UTF-8]?
>
> As this feature seems to be really old already it should be available.
> Is your "git email-patch" using "git send-email"?
> Do you have "sendemail.assume8bitEncoding" set in your git config?
> (It should either not be set or to UTF-8.


Ah. That's likely the problem. The actual patch and associated commit 
message don't contain any characters that require more than 7 bits to 
encode, but the eventually sent e-mail does, since I added the 
information about the review revisions. Presumably git send-email is 
evaluating the encoding before the edit stage, but not after. 
sendemail.assume8bitEncoding is unset in my git config; I'll explicitly 
set it to UTF-8.


>>>> +	props.type = BACKLIGHT_PLATFORM;
>>> Is this WMI method a standard interface?
>>> If so, BACKLIGHT_FIRMWARE might actually fit better and still fulfill the
>>> requirements.
>>> The actual maintainers would know better than me, though.
>> I'm not certain what you mean by standard. It's defined as part of system
>> design guidelines that NVIDIA shares with OEMs, but I'm not sure if it's
>> part of the ACPI spec. It is implemented by multiple notebook system
>> vendors, hence naming the driver after the ACPI method rather than a
>> particular vendor. Reading the documentation on the backlight driver types,
>> it does seem that this may fall more under the purview of BACKLIGHT_FIRMWARE
>> than BACKLIGHT_PLATFORM. I'll go ahead and retest with the driver registered
>> as BACKLIGHT_FIRMWARE, but I'm sure it'll still work after inspecting the
>> code for at least gnome-settings-daemon, which implements the policy
>> recommended by Documentation/ABI/stable/sysfs-class-backlight.
> I only went by the comment about "standard firmware interface" from
> backlight.h.
> This was mostly a pointer for you (and the pdx86 maintainers) to take a look
> and decide.


Got it. From my interpretation of linux/backlight.h and 
Documentation/ABI/stable/sysfs-class-backlight, I *think* 
BACKLIGHT_FIRMWARE is probably more appropriate, so I'll change it to 
that, unless a maintainer disagrees. Hans/Andy?

