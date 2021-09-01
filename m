Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DF3FC4320E
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Sep 2021 23:12:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 78A0C6108B
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Sep 2021 23:12:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345103AbhIAXNj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 1 Sep 2021 19:13:39 -0400
Received: from mail-bn8nam12on2084.outbound.protection.outlook.com ([40.107.237.84]:50528
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S242620AbhIAXNj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Sep 2021 19:13:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jJbeOK5y5FG7ed3yoAVji29xs+ebcsfjzN15AS0XTLJMTP3FUKz40TmdXtLN+pT2Eg6+3arJUcO9G92/h3+dpAxBNwybpQC7U0TeQyGSE89qpHak9R04qPiWV5VRWodPPC47aEG4J//JK+lyP+qdDGqzQAe4yx/iSvRJ1MtbwLler3zqaiUmrfr0zntP1PcWrX2kDCVl9g2jHGBTkE1Agnf25FaIWc9fQ4XBRrSlakrjpcEsUFrEBicqltc809CUerj6roxDZ1UoBw/wTSpW2p6f9H14DHTd75SxlhhtanJYhzFxZeYOHfkDxwsE3OsU1665B1VVoBrqXryYa4lmSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xgKqu2l0QL3ZjHvoDy3w28i2haqI6cAPPuUatXqfO4k=;
 b=l4ZqyVO97d2HVD2uTOVcDmKhVVzih2aua0NfzVbw4NzEFUZRTOhkfBvMVpPM5QZkFOecWgrVGARrnU+5JQNCo+UpeBB4cYTmw9rUnwyECqefm4XYTsor3ay+MHgEyKx4PGQFRkB6qu6+0DUIipUShW81H1368sa2UACoLVyupJ29xIvZZ/pZom7ZEL60hLyn6c1pClYmIZOlskSrjH/jGJL43O599uEN5PFs1yP3WENYpxfhtGVm4RhGweTEGQRvYdeEJHQ3reiSfHxlVe1XgM8gA67L1yO+cfC/IGtBDyR68Q3lwslyx8d8Fa9+6BK8dGLt/OD8LnjFoxvHqidUgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=t-8ch.de smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xgKqu2l0QL3ZjHvoDy3w28i2haqI6cAPPuUatXqfO4k=;
 b=MD5YTQ7wM1ONUoe47S3RoU+fGy4mSMavnRiGUE9h6hoHmLwWoqQGdVJtJAFXcnpzXhKvRxybkeRtqsFq2S4JkIphSv23Sz3y9gfWppOqaNyyuP6v+upGrKJl+N+/W9Tc5NwaW0ypVH69B4sRMdaUXarxBdnAN3zgddineQtcA/TPDyJnplpXciTxf6ZNl11k7VDCS9novYZo3jmrq01nciTI8vSeofhN+v46K/xHbjwT+yQf41T4ESLQTfmQ5GYmLpN2IwVKhegYajL3+z/EN6egR4AOopMzmfaobTg1UIn62OJ3a6lesqPizMUN7xmi81pwpriiXRkE615Qfy0NbQ==
Received: from CO2PR04CA0182.namprd04.prod.outlook.com (2603:10b6:104:5::12)
 by MN2PR12MB4109.namprd12.prod.outlook.com (2603:10b6:208:1d9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.24; Wed, 1 Sep
 2021 23:12:40 +0000
Received: from CO1NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:5:cafe::b4) by CO2PR04CA0182.outlook.office365.com
 (2603:10b6:104:5::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Wed, 1 Sep 2021 23:12:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; t-8ch.de; dkim=none (message not signed)
 header.d=none;t-8ch.de; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 CO1NAM11FT063.mail.protection.outlook.com (10.13.175.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4478.19 via Frontend Transport; Wed, 1 Sep 2021 23:12:40 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 1 Sep
 2021 23:12:39 +0000
Received: from ace.plattner.fun (172.20.187.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 1 Sep 2021
 23:12:39 +0000
Subject: Re: [PATCH v4] platform/x86: Add driver for ACPI WMAA EC-based
 backlight control
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Daniel Dadap <ddadap@nvidia.com>
CC:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        <mario.limonciello@outlook.com>,
        =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        Darren Hart <dvhart@infradead.org>, <thomas@t-8ch.de>
References: <70b81e33-c769-4cb8-0bae-5ee10a209389@nvidia.com>
 <20210831224906.1072-1-ddadap@nvidia.com>
 <CAHp75VcvhPL2dNy4HdoEU5FtuWQkG-t0tH5rAJRKpeG0iB9AUg@mail.gmail.com>
X-Nvconfidentiality: public
From:   Aaron Plattner <aplattner@nvidia.com>
Message-ID: <c34cbe30-ecc4-aed4-2819-d8fbc7171392@nvidia.com>
Date:   Wed, 1 Sep 2021 16:12:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VcvhPL2dNy4HdoEU5FtuWQkG-t0tH5rAJRKpeG0iB9AUg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 884f6a9d-05d1-4198-1a15-08d96d9dfec5
X-MS-TrafficTypeDiagnostic: MN2PR12MB4109:
X-Microsoft-Antispam-PRVS: <MN2PR12MB410929AC28306A6F5D9FA5C3CDCD9@MN2PR12MB4109.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dQVyNE1K99Z2kT4Kl7DmffTfPlRR9iTb6FfxTWUedTIFj+jHoiArvaquWY+K1njwVAoH5vgNo56ePW+sbocf0GyYI3/TsA4Y70I8AqMckc7ZcxhnOUN1QFsgdZvTnHsrHE1ctorXNh1Ir2/2eQjtzegwC03Xj4y2bRT8hcDdo1xzixVc+Ro7o1sbU66r86ZTZV8OYXQB0HIFW/kEkhRL0RhCxczvt6ANP5OkzmbJKTc1TzP9Wn1z0hZZvXz+IqFqk8LKUh1FrsWyKhk53Q+D65UyKNo1sJLPH00c7k5Kmf4VG9+7howsJy8y76/Toal/MdodldblQM9ezyqRYLMpigzWYvSJIV94kbX6sbCxy4rFhxC1r22XbjCAnwbSur9X70OWzt7tz+qEx5x5/Ip3mob4LF1Cymk29UWxbwwgV+glD9YVylOKud8W0zZGto55TyDyYIvdydNclESKunK1oUkw0wfWIT5FhkHS0166YYSs6iqmq3mbXsBHQtYt1yssPH+glJxVSpG3UkN51MC8bkCbLKnSzm4wkXx8Vg4KrQ5/sIfB7ENI9LPAQ/9CG00d3RMIWKyVvL1ZOz80VQmEEdIFcgw2pPcniRcodXW17ip2ra/3uwZgk9EhAU5PbG335MaMxiiia0asNxlRDdlqwDehqSood6yyejUboeK7ZIukL4qlEyuHQYvCDVHNs3GC3vIM2H1P863P6B4kFnUzTQ==
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid04.nvidia.com;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(39860400002)(376002)(36840700001)(8936002)(2616005)(86362001)(83380400001)(31696002)(336012)(316002)(426003)(36756003)(31686004)(186003)(26005)(6636002)(2906002)(36906005)(8676002)(53546011)(82740400003)(5660300002)(36860700001)(54906003)(4326008)(7636003)(32650700002)(70586007)(70206006)(16526019)(110136005)(356005)(82310400003)(478600001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 23:12:40.0049
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 884f6a9d-05d1-4198-1a15-08d96d9dfec5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4109
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 9/1/21 8:57 AM, Andy Shevchenko wrote:
> On Wed, Sep 1, 2021 at 2:27 AM Daniel Dadap <ddadap@nvidia.com> wrote:
>> A number of upcoming notebook computer designs drive the internal
>> display panel's backlight PWM through the Embedded Controller (EC).
>> This EC-based backlight control can be plumbed through to an ACPI
>> "WMAA" method interface, which in turn can be wrapped by WMI with
>> the GUID handle 603E9613-EF25-4338-A3D0-C46177516DB7.
>>
>> Add a new driver, aliased to the WMAA WMI GUID, to expose a sysfs
>> backlight class driver to control backlight levels on systems with
>> EC-driven backlights.
>> Signed-off-by: Aaron Plattner <aplattner@nvidia.com>
> Seems like missed Co-developed-by. Or you are the wrong author. Fix accordingly.

I wrote the initial version of this driver that we used internally for 
testing, but Daniel almost completely rewrote it for upstreaming. I'd be 
fine with just dropping me from the patch entirely and listing Daniel as 
the author since it looks almost nothing like the code I wrote.

-- Aaron

