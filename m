Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42D32C433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri,  3 Sep 2021 17:56:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1ECA1601FF
	for <platform-driver-x86@archiver.kernel.org>; Fri,  3 Sep 2021 17:56:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239585AbhICR5S (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 3 Sep 2021 13:57:18 -0400
Received: from mail-sn1anam02on2082.outbound.protection.outlook.com ([40.107.96.82]:52318
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1350320AbhICR5S (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Sep 2021 13:57:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M+jyhWO6ge1aTgFaDVYtYfGMzJfU9TSEPCX/OWmLLq/hcfn1QVZ2FpClFp95AajojeYzfiYmpJ+LsehmNZ2c8CFAXMczWky2D3Mcy2YX47P/VpYWEgQeFRB1ucW25WgpibgdS7ce94sh9FoZcWzgwTFeIsYEoZXCHq+icKIZrYN/sY4oV3nfbErEgGDu59NtKoFuIRdaz72mfiqSFY/npWwkfmm0g7cX3bwmEiwZSroqrCLNxTlUSLj7BW1rc1GvW3fwpFWDpPcdUkGp4Gc1a3SfHyqCU0PSH5eY1Ou+XnEr4oTw7UKVeYDso8Db+tsdfuZ2Cegad+4an6FPMVnsxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tn4u35Q5VSdWJEo8JfiSenIURzLX1e4k/3s5hQjoOds=;
 b=lWCMlPBBgkm/vwHUG5KNKeSA639h5fFKdkJUFB+pkNh+aTiRjmHrTcmFO9lYhMMjDmHsyzzAkjIC1psszzRrD+pORYKpZBakkRfej+qeuZIdJsw372JUqJfSGowQOE2vri4ICMYvpiJtqheDzLbl7hJINOuixs2SDbQXY7AaB2T1UL9aYX0ZsULYrIs2zKi+XWom43Suv3mpIWMW877X74H6AJVVCelPBl4pE9Ql2QffwDLT5n99o5vjyGnLUB+9DfS7V6W03DCL4uhbx8b7Kx0DG25S2n4uLA/edS4nbdrb6QWf18sqrZFaacJmdL7e2Oz//1l5onRsqoSwANefsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tn4u35Q5VSdWJEo8JfiSenIURzLX1e4k/3s5hQjoOds=;
 b=fNPqzl3+lf3For+rY1KXblidkbwjsQ2eG6HN3MgT8ur5GyF2pYwIiSewIor1jYHWoS+e7Sk4VCMrFVipcIaR6D+KBlfSuok5cT2A3u0fPq7cY500vYrCfDp6v0T4IeLc9BSbpFZIsbmn0p4lGTu+v5lFTMh4zq138eLXNNBL3UVRDZC266yOc526yGflbHLuHUojZttDzQZmjaxRgmIJMul4vM4Ef7cXNUuadfZAZZsSQFwIDfPwj646fv9dhFZhPdgkxo8HPm0dF+di5/vlByKdp0Ro/EmLK6UuhamPBUhTJhMeT06E7bNOi1e+a7RDDjlnFbzGuZyZFCuGcMb8Xw==
Received: from MW4PR03CA0105.namprd03.prod.outlook.com (2603:10b6:303:b7::20)
 by BYAPR12MB2711.namprd12.prod.outlook.com (2603:10b6:a03:63::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.24; Fri, 3 Sep
 2021 17:56:16 +0000
Received: from CO1NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b7:cafe::60) by MW4PR03CA0105.outlook.office365.com
 (2603:10b6:303:b7::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17 via Frontend
 Transport; Fri, 3 Sep 2021 17:56:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT055.mail.protection.outlook.com (10.13.175.129) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4478.19 via Frontend Transport; Fri, 3 Sep 2021 17:56:16 +0000
Received: from [10.20.23.105] (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 3 Sep
 2021 17:55:56 +0000
Subject: Re: [PATCH v5] platform/x86: Add driver for ACPI WMAA EC-based
 backlight control
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        <mario.limonciello@outlook.com>,
        =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Aaron Plattner <aplattner@nvidia.com>
References: <f4802d28-3674-bbc3-0377-52d3d03af4fe@redhat.com>
 <20210902214718.13628-1-ddadap@nvidia.com>
 <e63904b7-105b-4401-bd40-82854b7d42d1@t-8ch.de>
 <43912a84-511d-18d9-7a3f-61716d9889ad@nvidia.com>
 <CAHp75VetBYgtE3ezS81K104PqkevvxSkO2mCa=GWLgEO2-UJxA@mail.gmail.com>
From:   Daniel Dadap <ddadap@nvidia.com>
Message-ID: <dca29eda-9bc9-c8b0-9be5-b44763ed5007@nvidia.com>
Date:   Fri, 3 Sep 2021 12:55:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VetBYgtE3ezS81K104PqkevvxSkO2mCa=GWLgEO2-UJxA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e66884c0-03d7-4ccc-6fe5-08d96f042073
X-MS-TrafficTypeDiagnostic: BYAPR12MB2711:
X-Microsoft-Antispam-PRVS: <BYAPR12MB2711956BFAF6D35474CBE223BCCF9@BYAPR12MB2711.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uNEtbIuj/sA7UYFJGcxgPNPXoEnTO6uMdVAYh+x14pCmGuTCt2BgCGrSRpq7K1Y43NraD+7F9fs1HNrIw/rQRSwvBcvhixti2tY8UrHhUa2L4kKt6eBKJhN8H8RnXmzqEH92iHXd6a66ivkJba4g6RAuJC3kuNkjVIOOWJkCjGINb9COlrfg1vHsVifvvi6v7G9efKtvuCXPgXFcRkFRt0qDTFffdgUv0wUnGuTFaJL+YuuxSb0EOziS5nTq0HB+RbTtXo+aniSZDOI3e9sStQEILiVd+2n0XUJCj+1ffX1PyP1Gx5UOjpggCQyVZQ8FvqecSavk/u3vpjoWZnNFH/u0mLEq/vzlu9lBOEarxdQAtQzTSzbcbVk778VajwQkQTs4fX09/vXwwwaSVHsYXTXij5Zqhr5qnc0LmBi1Vy2q+k3TlMUwmQxqBgxSzUbsmCrcqRaAswE9unFr2IPgsCYW1fHhqZO+4bpJKsG1vwoGNYBWvIl5c92E3kqgW3Nfgp/UA/jEuCCP7xJfYfpBmoFoojrWcc+buZFH835zOoSFeur96jHSZtJ86kUt4zIBG0uoYDs868c807AHLC1YQdSODJ/qxouk5wjcl+ng784HcpjEwDlNexnMR7OeKh/UurZiimXrQ3UtVqbqUQbfRsGmn5t+r+zQefe9rmBDq16WWXKunN3m3t11rwsV3Q5NcnBslPi2cT4MBWqX1A6vzY6iON03L1fUvcIrJBqPrcQ=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(136003)(39860400002)(36840700001)(36906005)(2616005)(2906002)(36860700001)(4326008)(83380400001)(8676002)(336012)(16526019)(5660300002)(66574015)(26005)(36756003)(426003)(186003)(70586007)(82740400003)(32650700002)(6916009)(70206006)(86362001)(316002)(82310400003)(16576012)(54906003)(7636003)(107886003)(356005)(31696002)(53546011)(478600001)(31686004)(8936002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2021 17:56:16.3654
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e66884c0-03d7-4ccc-6fe5-08d96f042073
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2711
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


On 9/3/21 3:14 AM, Andy Shevchenko wrote:
> On Fri, Sep 3, 2021 at 3:22 AM Daniel Dadap <ddadap@nvidia.com> wrote:
>> On 9/2/21 6:20 PM, Thomas Weißschuh wrote:
> ...
>
>>>> +#define WMAA_WMI_GUID "603E9613-EF25-4338-A3D0-C46177516DB7"
>>>> +
>>>> +static const struct wmi_device_id wmaa_backlight_wmi_id_table[] = {
>>>> +    { .guid_string = WMAA_WMI_GUID },
>>> This could also be inlined as:
>>>        { "603E9613-EF25-4338-A3D0-C46177516DB7" },
>>>
>>> More a stylistic thing though.
>> I considered that when switching to MODULE_DEVICE_TABLE, since the value
>> is now only used in one place, but looking at other similar drivers, it
>> does seem that the most common convention is to define the GUID as a
>> macro even if it's only used once. I'll leave this as-is, I think.
> I'm on Daniel's side here. But the problem I have noticed with the
> proposal is different, i.e. it loses the C99 style of member
> definitions.


Oh. I didn't even notice that the proposal excluded the designated 
initializer. What I had been considering was inlining the GUID string 
and getting rid of the preprocessor macro, while retaining the 
designated initializer. In any case, the prevailing style does seem to 
be to avoid inlining the constant, AFAICT.

