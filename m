Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04C81C433FE
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Sep 2021 20:15:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E5A9D61131
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Sep 2021 20:15:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232045AbhIBUQS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 2 Sep 2021 16:16:18 -0400
Received: from mail-mw2nam08on2087.outbound.protection.outlook.com ([40.107.101.87]:7008
        "EHLO NAM04-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1345678AbhIBUQR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Sep 2021 16:16:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mfDA0qsEq1rdlU4b97oEQmAzYzX/S9sFW1thABKwvtsYzaHPUSrKVLUhAhuKPGoDCs1L/7weRv0L3/4sahY7tsonWuM+80tWoUdbTPxkU/DcpWVn3kr/WbBIAMsclSP271ermEbwzE10X243ks8DZ+zzkbkIZE317gVI+cp8HEqor3fi9U9HC8hD3k3mTusBRtweQUWN+EGLyIXKkY/N0yGX1dU5+AyYhgIzvQ8F56YQJEaA12z9A95Z0pqnd1BvvP5/VSrjsUwLERInvyJpvcRlcxLzUXLhj9+ZYq1hpdhBGW6v4ZNUf2pCGwoPr4rmZx/8TDKgMfQduYr8f098dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9Z/u2+Fj42Mc6LUumkf1bF/e/5CEixPv9qAOVAZbKY=;
 b=LY3DQOA16cYAR4xpU26lJ9gJ7cLdPGcJ/spNNR9rEEr03YTtnEFe1TYG6Ym/6lRxR416RGzijQNVif8pe1dUnOtNZCCyryH3YRQGcd279QJ38gL2S/BpXtwGjqxe3BX+Yyr57Whdc5CcAADU7RA4R2Gq8/ULbMKACBGWBijF+1+6Agm8w5YuMOxcpf1WHCNI07aeVMTzji4TiwlEjDy7rUw2OCggNs13eaJyQxyXAkMB39SUZZR0FpGDcEaNY6MPumugwy+rU8MIFrgOoYzo365V3kNo6S5WEWM6dBP8QJCBfuzoEhMcubzFnHcgy592k7IcfONChEOIcbpNh3/8gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=t-8ch.de smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9Z/u2+Fj42Mc6LUumkf1bF/e/5CEixPv9qAOVAZbKY=;
 b=QEGPPMr9rWyPbRGmRN8sIm8NWEslcY/r0Q/jfzuS+h/6yqqR/4yrPwljIa9hctYG4W9m4nrGfze1nFR7GKdFhXPbq/jXuEhBM1LR9fx/LQbt++X/NI+0bhKtoM2pAm8/WWNYE2MIxgloG6gFtqBYErHvvx+dthnrPpPT2Zp08hpcPl3GKPAs8CXcArdbyziw0DgORE0uEMuasb//bHsmxodjH4gDMBurb6AmQfn9Ge4EspHdGQEa2zKl5J12u5f4hSYYRJULVRd8LglU0b5z+8gr6UetB+4nX28vetjDxQAoHaBnSAnBhfp2Eua+KEjglvKHuMkerZmIY4Ahx0nrAA==
Received: from BN9PR03CA0724.namprd03.prod.outlook.com (2603:10b6:408:110::9)
 by BN7PR12MB2738.namprd12.prod.outlook.com (2603:10b6:408:2d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.24; Thu, 2 Sep
 2021 20:15:16 +0000
Received: from BN8NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:110:cafe::55) by BN9PR03CA0724.outlook.office365.com
 (2603:10b6:408:110::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17 via Frontend
 Transport; Thu, 2 Sep 2021 20:15:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; t-8ch.de; dkim=none (message not signed)
 header.d=none;t-8ch.de; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 BN8NAM11FT027.mail.protection.outlook.com (10.13.177.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 20:15:15 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 2 Sep
 2021 20:15:13 +0000
Received: from [10.20.23.105] (172.20.187.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 2 Sep 2021
 20:15:12 +0000
From:   Daniel Dadap <ddadap@nvidia.com>
Subject: Re: [PATCH v4] platform/x86: Add driver for ACPI WMAA EC-based
 backlight control
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        <mario.limonciello@outlook.com>,
        =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        Darren Hart <dvhart@infradead.org>, <thomas@t-8ch.de>,
        Aaron Plattner <aplattner@nvidia.com>
References: <70b81e33-c769-4cb8-0bae-5ee10a209389@nvidia.com>
 <20210831224906.1072-1-ddadap@nvidia.com>
 <CAHp75VcvhPL2dNy4HdoEU5FtuWQkG-t0tH5rAJRKpeG0iB9AUg@mail.gmail.com>
 <91aa0937-a887-5233-5516-5137d96ae8d7@nvidia.com>
 <CAHp75Veyft+Ssb3xfasRawksozGHsnXiwoeUzJQ_Jn6u-uZsrQ@mail.gmail.com>
Message-ID: <f6dc5d3a-f46c-4cbe-4845-5467a7c0c67b@nvidia.com>
Date:   Thu, 2 Sep 2021 15:15:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Veyft+Ssb3xfasRawksozGHsnXiwoeUzJQ_Jn6u-uZsrQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 135e198d-0c4b-4285-669d-08d96e4e60c5
X-MS-TrafficTypeDiagnostic: BN7PR12MB2738:
X-Microsoft-Antispam-PRVS: <BN7PR12MB2738C598E1336EFB11C299BEBCCE9@BN7PR12MB2738.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zYGgXvCsOZ9ZajhHsKYGC5eiF18mhw0st15UaPBO1xSIMzaJ7zxsIn2WY3qxgBRdvG8dxj+QIrmRmDpJZOC2fuFxZOrAO4//e7qPaHdlTvU+q7yv4Qp0IFXXOn/C6tTb8nC5KOkdGYA7YAl5nxD9iOG/i+reHEVg0QQ+CFDEHt1Ni8WEs4vklM370vaQu9K02bJzmCuzpMMvjYHhqhAnRMBqomkbZ1e/1IU66QiVdvzfX9lMDMhnNHnGX7RBXZu7cU6vYy+oXP/Hz0E3V3VgvdZTmj0ariMzzIJoIUJsEx4qjYrZswsE4LvkTTNbdg6zxADQFbdVCdAVxIu9yD5RAXMLt4UTwm+t3KPQMJDPzMQjzL6SI7lTpotEhQl96FdxXu2Ob/IkPmrrdC3qsvAb+LF48bdKnmDrnW3AUxLusqEsl/EETW8x624wEOAVp/ogBv++w952/bV5YQgWTNrE712YITi3hZYrmBPjAPxbKSoi4SHFA4hBYIojWTHEYGCkeC7GADXwVu1+g8t7R8bszE9YzJJ4v7VIa/GAzXmZFIKwAkudJh2FGPplE27VBGYSbK3qNFzEjXDcQAIZtv/i2EP7J5YdJtbfUnMj0ieLwKRu4SGXNI9pwh+5Dso0RmC7jr3VhD4y3DkHGD4EOF77rxM6zWBlzVeJt8Bj/0WaE4B+lFSQg5tmh7V/jQSuASAqDKUeYix7d4JkeoFaZYto48bnOvr8mebc6VZDgknVx58=
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid02.nvidia.com;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(376002)(39860400002)(36840700001)(32650700002)(8676002)(26005)(6916009)(53546011)(186003)(16526019)(478600001)(8936002)(107886003)(316002)(5660300002)(54906003)(31686004)(426003)(70586007)(36906005)(356005)(2616005)(16576012)(4326008)(70206006)(36756003)(31696002)(83380400001)(2906002)(7636003)(82740400003)(86362001)(82310400003)(336012)(36860700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 20:15:15.8060
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 135e198d-0c4b-4285-669d-08d96e4e60c5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2738
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 9/2/21 4:35 AM, Andy Shevchenko wrote:
> On Thu, Sep 2, 2021 at 5:37 AM Daniel Dadap<ddadap@nvidia.com>  wrote:
>> On 9/1/21 10:57 AM, Andy Shevchenko wrote:
>>> On Wed, Sep 1, 2021 at 2:27 AM Daniel Dadap<ddadap@nvidia.com>  wrote:
> ...
>
>>>> +#include <linux/backlight.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/wmi.h>
>>> types.h ?
>>> mod_devicetable.h ?
>> Evidently, these must already be implicitly picked up by the headers
>> which I am explicitly including here. I can see the argument for
>> types.h, since it's always possible that future changes to the kernel
>> might remove it from the implicit include chain, but I'm not certain why
>> you're recommending mod_devicetable.h here. If it's because I use the
>> MODULE_DEVICE_TABLE() macro, that seems to be defined in module.h.
> No, it's because of the ID table type which leaves there.
>
> Basically you have to find a compromise between what to include and
> what to not. At least those I have mentioned are kinda core stuff that
> usually should be included explicitly in the modules like this driver.


Okay, thanks. I suppose I should have <linux/acpi.h> as well: I 
originally had that on there, then removed it when I realized that it's 
included implicitly via <linux/wmi.h>, but I do use some ACPI types and 
macros that are defined in that header.


> ...
>
>>>> +enum wmaa_get_or_set {
>>>> +       WMAA_GET = 0,
>>>> +       WMAA_SET = 1,
>>>> +       WMAA_GET_MAX = 2
>>> Is it part of HW protocol? Otherwise drop assignments.
>> Does ACPI count as HW here? I'd certainly prefer to keep the
>> assignments, since the other side of this interface is not in the Linux
>> kernel.
> Yes, that counts as FW and as you noticed out of the Linux kernel realm.
>
>>>> +};
> ...
>
>>>> + */
>>>> +enum wmaa_source {
>>>> +       WMAA_SOURCE_GPU = 1,
>>>> +       WMAA_SOURCE_EC = 2,
>>>> +       WMAA_SOURCE_AUX = 3
>>> Missed comma.
>> Oops. I am definitely a fan of using commas here, but I removed the
>> commas that I had in place for the last elements of these enums, and
>> members of static initialized structs, because I was trying to more
>> broadly apply feedback from earlier to drop the terminal comma in the
>> static initialized device table. I realize now that this feedback was
>> meant only for the case of the empty struct terminator element in the
>> device table.
> Not only, the _MAX in the above enum is correct in leaving commas out.


No, I think it does need a comma, unless I'm misunderstanding why you're 
saying it doesn't. WMAA_GET_MAX here isn't saying "this is the final 
element of the enum which is also a count of the 'real' enum values"; 
it's saying "retrieve the maximum valid brightness level from the 
firmware". I renamed the enumerant to WMAA_GET_MAX_LEVEL to avoid 
aliasing with the common "_MAX" convention for the final value defined 
in an enum.


>
>>>> +};
> ...
>
>>>> +       backlight = devm_backlight_device_register(
>>>> +               &w->dev, "wmaa_backlight",
> Strange indentation, btw.


Indeed. I'm not totally sure why I did it that way, maybe because the 
long variable and function name didn't leave much space for arguments to 
indent normally? I shortened the variable name and reindented it.


>
>>>> +               &w->dev, w, &wmaa_backlight_ops, &props);
