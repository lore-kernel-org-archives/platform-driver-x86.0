Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4BA9C432BE
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Aug 2021 22:28:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 78592610A6
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Aug 2021 22:28:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230406AbhHYW3f (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 25 Aug 2021 18:29:35 -0400
Received: from mail-bn8nam12on2061.outbound.protection.outlook.com ([40.107.237.61]:55008
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230223AbhHYW3e (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 Aug 2021 18:29:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RQPj5lLiloxpNDKN20JHm+hzI2DEfSdE2SlAHsvWM9hWESUXI6GW3bAlyb08T8XDftdj+VF0oHdYqL9OYMUIisGegN33FKMoIa/dfjPKLSg4K6veIPbBFSMUkpJIqMCOwqpxXyRNgrT4wrslcAlgCY7u63RJ9B0XBF7R2ML7k/0K/4UYXmvOhTYzjNvKjjFJ7FIY1A0ey28p31xWFMC8GZY7UjJcYJTHrgK6tkLrD0jfOaMVfGqzukeN8UgarZ21s0ytpX/yqblx8CZr2hWzcrVTpZ3WBlOOqeL3nKIJ1VyklJyvCK+qVMJFWlyHQDUeZa0HWFcCTiGzc3RlRQD65A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WX+Zb83a7FR7uOmGDrBLR/HV2J06f3tATULlIljLzo8=;
 b=JWXLDAncjesMj8o9vqcfJMM1jNl8IgyqIDCaw+O2ER5j5wlTR641gk2/Uzo2gipOcicmDpachI3nIirhXEN3c2i/RvAQliAupsihuqS1PKFFpvIE767wwqkt+fxIghgSgb+iUqrj2Tq6U3w/sEnlUVnOp5AOHHKZf5t43ZSsiyqoBgcYsCpkl/YmcUOp48PRNWWFOG8GeD4JrV6jSv5R0l387JofMsMkF1uSYrCO7ipAOrTXx7KnRigzu/3jhv+XgX5sNgIgTIteLGs87EQ4D/WkB9feQ9PQhqIhfn0qTtI3vqIgyv0Bu9TmTFFhGS1FL5jlw8KgXo7CsPR/PHuNvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=protonmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WX+Zb83a7FR7uOmGDrBLR/HV2J06f3tATULlIljLzo8=;
 b=SBi84q4ytfYX3FSxqh+AN/CKc1yXWPvY31q5sp9k7e3Ul7X6SRani2ZC1zZYfYZhlQ4jRR7RYG88ji1Rfpj/F6K4ZsZEtqBq+Mlw/z+ML2RfvvmG/d6k2utG1Ybsfn8KHtohBvCJJBMNBGwtAVmXPCe4OsCB5uDQ3jX7uc2U+Wtqv/+0H5cWpke+6s20NTq0tk8AWlNcfwEltn0445pA1BXeFdI0oWLH2dU3muW/+8S1hKiPefQY6U0QIEFqrZ0xj+auLnaEb1AEm0OpTUvmjusNBwtufcD6M3QrzTZGbT+rcB5s2JoiaJy/WbuhR+pmIvdaH5BAiAio5niITekp/Q==
Received: from BN6PR22CA0025.namprd22.prod.outlook.com (2603:10b6:404:37::11)
 by BN7PR12MB2804.namprd12.prod.outlook.com (2603:10b6:408:2f::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.21; Wed, 25 Aug
 2021 22:28:47 +0000
Received: from BN8NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:37:cafe::70) by BN6PR22CA0025.outlook.office365.com
 (2603:10b6:404:37::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Wed, 25 Aug 2021 22:28:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; protonmail.com; dkim=none (message not signed)
 header.d=none;protonmail.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT038.mail.protection.outlook.com (10.13.176.246) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4457.17 via Frontend Transport; Wed, 25 Aug 2021 22:28:47 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 25 Aug
 2021 22:28:46 +0000
Received: from [10.20.22.154] (172.20.187.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 25 Aug
 2021 22:28:43 +0000
Subject: Re: [PATCH v3] platform/x86: Add driver for ACPI WMAA EC-based
 backlight control
To:     =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <thomas@t-8ch.de>
CC:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        <mario.limonciello@outlook.com>,
        Andy Shevchenko <andy@infradead.org>,
        "Darren Hart" <dvhart@infradead.org>,
        Aaron Plattner <aplattner@nvidia.com>,
        =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
References: <877ae34b-dcbb-a0a4-7d76-d9d78d12fd00@redhat.com>
 <20210824220437.14175-1-ddadap@nvidia.com>
 <CAHp75VfjSrq7vF=ry1dTHJWbKLF9AqK8kZbddO-1A3FQ5pCvhQ@mail.gmail.com>
 <b22b0882-e54c-3168-2cbd-842f2ba51c90@nvidia.com>
 <2f969bf5-0c54-41fd-ab55-108edc0dd462@t-8ch.de>
From:   Daniel Dadap <ddadap@nvidia.com>
Message-ID: <adf55c8d-4552-f7a9-c5a7-53dc1aa0483d@nvidia.com>
Date:   Wed, 25 Aug 2021 17:28:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <2f969bf5-0c54-41fd-ab55-108edc0dd462@t-8ch.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44a54de5-e62e-4b7a-f590-08d96817b4a4
X-MS-TrafficTypeDiagnostic: BN7PR12MB2804:
X-Microsoft-Antispam-PRVS: <BN7PR12MB28043DF5A1888FB964A22B40BCC69@BN7PR12MB2804.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DiZjlZhibUdC5/3wDR1fg8/UdSAZfiPlOiCw2RlzN7aL1XYWWkBm+9UjQLRU7n1ys/bojvoF60Q2o8V8z0x9jaAm5f9poJFsHcVyvOVbVqPPchVyAJJHxHtkdpjgg1YJzL9oLRLB3lgp2bu1RvTwiCLp4ZaXWyLh1ITBXAMz1k2YOhS3zLdkYZECNzTTObHvkqpIgy+FPoAlfyqeiaOkiqOSIO31lBlEVxoQhuu6RiVXJfKpfF8N6G+ORkwz1CtQuyd/9dWMbQI6MPAG2sxVqOEQO/+ZMlUW+zRVVNwJRZUmPSSmtwPIbFZLJciG+vuYQ7whRbJpylgOA5PMMSJk72ZT6FXBWie5c0bmZU6H/mQApzyloa6RATXAS3yaNNMbSp1UZxvOh8eLLKNampvHNJsPuPLH8Ev1rqd71DacMM8iCpXv1c86OjZl5KYoooeh5bQQzkRN7lWPxmwlKR1P1W82Y/O1Weg1lnsN1avv6RdO/JPglCQLhn+dJQYPnxCGPJmOb3HOpk3mXFxh3kuGiHPLS3G1SNSO4rjp20QGhD+n9RF0ioph/R5x1kt2VBAUdsxaq/UcINUywALDo5M0mJiArDJtU4iDNCVt3CGMo+DSfccBwlT9iDdSv1aCtkmp10h7XD7/PGgQ946Vn8XJaTPeNXLCxAPOoBduf5vEeQAQ5R6I+dHAMYIESzoNyAqx2Ke7xkahiC+La3LsNTer752fCXMvmF+QVsAmzk7pMjs=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(39860400002)(136003)(36840700001)(36756003)(16526019)(186003)(4744005)(336012)(7636003)(8936002)(26005)(82740400003)(31686004)(32650700002)(8676002)(426003)(70206006)(356005)(316002)(4326008)(36860700001)(36906005)(5660300002)(16576012)(54906003)(2616005)(2906002)(70586007)(478600001)(83380400001)(86362001)(31696002)(6916009)(82310400003)(53546011)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 22:28:47.2272
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44a54de5-e62e-4b7a-f590-08d96817b4a4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2804
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


On 8/25/21 5:06 PM, Thomas Weißschuh wrote:
> On Mi, 2021-08-25T11:47-0500, Daniel Dadap wrote:
>>> +static const struct wmi_device_id wmaa_backlight_wmi_id_table[] = {
>>> +       { .guid_string = WMAA_WMI_GUID },
>>> +       { },
>>>> +MODULE_ALIAS("wmi:"WMAA_WMI_GUID);
>>> Can you move this closer to GUID? But I'm not sure what is the
>>> preferred style. Hans?
>>
>> I'll do whatever is most stylistically preferred.
>>
> This could also be expressed as, which is presumably the nicer way:
>
> MODULE_DEVICE_TABLE(wmi, wmaa_backlight_wmi_id_table);


Okay, thanks. In the meantime I've moved the declaration of this table 
and the #define for the WMAA_WMI_GUID macro down to the end of the file, 
right before the pile of MODULE_* macros where we also use WMAA_WMI_GUID 
for the modalias, but if there's a more preferred style here just let me 
know.
