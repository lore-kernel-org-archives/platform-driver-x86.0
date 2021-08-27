Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D758C432BE
	for <platform-driver-x86@archiver.kernel.org>; Fri, 27 Aug 2021 16:47:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 71CF460FD8
	for <platform-driver-x86@archiver.kernel.org>; Fri, 27 Aug 2021 16:47:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229560AbhH0QsI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 27 Aug 2021 12:48:08 -0400
Received: from mail-bn8nam11on2062.outbound.protection.outlook.com ([40.107.236.62]:44446
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229854AbhH0QsI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 27 Aug 2021 12:48:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oRl4QlJEoA0NRNwyYsTypdaYnctphlhXhcK38n2VknkYY+vcAqlcyteD+zeS1pmMOm65eMx5bEjZEQvXRVDt5OAWaaosG7osRT8YCNXtFI4Z+aGjOnNoN3ZJ3EBtHGO4lE6d8U/v0My3WSz7DoQcWBKvPaPV4gEvejfyqyQ3EY8z+s1t9mx4aqhc7d7Z3Q4vcGOU5qvJWcZiUT1KQWH6cGN8aBeTHZyQMQD3wieQ+hLPWOv8CtQZSrqZIPgcndvAdOqm5loXl/v/okaIxWQmh64cW/JXuxDpuv8Jx2vymuoHp9L0UniqRfW5TDbgK03hoSTxhSVDcZYNKGVE8/BRTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZqQNnbSc39hbm0yYa2EAWwJqi0lbxSH+hqCyi216fZ4=;
 b=CaGhZjr1EeZGXmGpfunyY4KLssIPLMefsAOsY+nEOXThnVWR0iv7uUn0QIrp63p5WXLdMinNtBBzi0MVrDvcq6uQgHz3O62T9pXTNlIliLwS/zRxnRlIp7QjCO0pP9hTd1H5O2Y6E8YFkU+ncFCTm1yekKlcIo29sUy4w9T8xsL7gHoF9XGkZDY+otPRb38LExhZRaZNkD94IGGjPnYp2tSVQ/+9EEPC3lNVK8v05rtaiiT0eYkzD7ll4ML81FySs2zRVVxporL2vEStqVleMWz+r9grGVEfSPiTpmV6G2nY0+BwIDeGOrMoYd42oXec7VV+ofqrW6YZ2M20mQHkQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=outlook.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZqQNnbSc39hbm0yYa2EAWwJqi0lbxSH+hqCyi216fZ4=;
 b=G+UETsGLBLMh1QiAZh4QL9mArQskyClX33id+WFoq0rzsksYMEnJCI0vPGzbu+QPIN0uSZRii53xe4HxkN9asd+G9zgyj+B1YfYKo0XMboBVz7i6IZb+v6zqZBYvnfC4WCO4R3leW5wNFhJyRoRhXTsqcAqMjLACh2yEZ6tIrCYb5k7A3mtk486RO3SgKV14wotE0iAxxYnqgi1cXJN7RX2P+Wo0Ew8dmJGNou/I94nMu2RpYwGbt7mn7DAl815DQyt5uUsOuVd36pDa74ZFJVFInbMEnPSXYGIdnCpkO344XaKr+AoXbYOnczbD8JDZWkWWs/Rq+gEknW6lEVxI2g==
Received: from DM5PR08CA0060.namprd08.prod.outlook.com (2603:10b6:4:60::49) by
 MWHPR12MB1359.namprd12.prod.outlook.com (2603:10b6:300:11::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17; Fri, 27 Aug 2021 16:47:16 +0000
Received: from DM6NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:60:cafe::1f) by DM5PR08CA0060.outlook.office365.com
 (2603:10b6:4:60::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Fri, 27 Aug 2021 16:47:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; outlook.com; dkim=none (message not signed)
 header.d=none;outlook.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT017.mail.protection.outlook.com (10.13.172.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4457.17 via Frontend Transport; Fri, 27 Aug 2021 16:47:16 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 27 Aug
 2021 16:47:15 +0000
Received: from [10.20.22.154] (172.20.187.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 27 Aug
 2021 16:47:14 +0000
Subject: Re: [PATCH v3] platform/x86: Add driver for ACPI WMAA EC-based
 backlight control
From:   Daniel Dadap <ddadap@nvidia.com>
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
CC:     <platform-driver-x86@vger.kernel.org>, <hdegoede@redhat.com>,
        <mario.limonciello@outlook.com>, <andy@infradead.org>,
        <dvhart@infradead.org>, Aaron Plattner <aplattner@nvidia.com>
References: <877ae34b-dcbb-a0a4-7d76-d9d78d12fd00@redhat.com>
 <20210824220437.14175-1-ddadap@nvidia.com>
 <6RpClBuJeF9Qz9ttRSWYSDf54xIAio4IkrnTPSMeRx69TjEpe833H_rZXiIoK_GJUj4oi5Qv1BUV5yxlKMi5Pu9ngpKB_U_wie_a3_S5Yjg=@protonmail.com>
 <9f9ca8a0-491d-7493-5459-8f81687f2d47@nvidia.com>
Message-ID: <673a1641-cfdf-1857-21ea-a12867749912@nvidia.com>
Date:   Fri, 27 Aug 2021 11:47:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <9f9ca8a0-491d-7493-5459-8f81687f2d47@nvidia.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f5aed77-b580-4fc8-c3c2-08d9697a53d2
X-MS-TrafficTypeDiagnostic: MWHPR12MB1359:
X-Microsoft-Antispam-PRVS: <MWHPR12MB135903C1235F198E136881AFBCC89@MWHPR12MB1359.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D4nLo2sBvXptoAjblOimDCiBdNXHYbjyOMHSgWB2x9WCmRPn26jNE7VIeUd6kgjk2mty3JWYtxy4eHd+vnSIWPkNcLnBd2zUlM0bqX2IWpaPFU6IRt3zWn4siqHwWG9ZD12TAhbCYjlSV2emTEu9Mve4Fn17hhr6QGh2WFwjCogJ2gbYFMv7UUpefNGRqyOmkNG7sk2OrtmhHACV1I4bmuoknyDMcGSEyQBaPER0H+CCcCdI9NkQWKL5pPPv4sVdZJZz3Zf+M0GSXhwbFpYO3WEm0xm/jQyFsG/0QjcIDJqFfXDO+c5v9O+vSditq1vyM+CFNMAXgx9c0XxhztJBFt7Hhr+b8NRvXSkeoDKU54KBvEbZRIyFgODB2HnvWhc+SGApc6Ma3wNUvel8VceGSD3PdwoCP+6ubPCXKAF3wI+vJkhDbd6fWAVEHrYxedMffYu8ubA46eDpnVapLrT0jCC5hMZ1mlro7ZYCcPyFEeWJbzP97i8YkNNxCd6KK3VhEdvLt0yuVWIprPGnbxfMFVRGvZISDw7GZanMbc82uBNKY8WChaIVFuwx+lwsL3RfhU+M+sHV8/ZVNtY98PzN8WHm7OCGcoNjh0/RsQ39XsnLsCVEZxtXmBDK9uf1g79LIxwp/nEdovwFI+MCO4depTZp3C5RsEYh/x6fOwisEgtfBpyho6cz2ZuKhC1gqQUhJ9C6QdDyRnG2rkusEG3NoW9mAjKCsFGVH4iDLbz4sJY=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(31686004)(7636003)(336012)(107886003)(508600001)(356005)(4326008)(5660300002)(54906003)(36860700001)(70206006)(6916009)(31696002)(86362001)(36756003)(8676002)(8936002)(83380400001)(36906005)(16576012)(316002)(53546011)(426003)(26005)(16526019)(186003)(70586007)(82310400003)(2616005)(2906002)(32650700002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 16:47:16.1834
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f5aed77-b580-4fc8-c3c2-08d9697a53d2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1359
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 8/25/21 5:26 PM, Daniel Dadap wrote:
> On 8/24/21 5:47 PM, Barnabás Pőcze wrote:
>> Have you looked at `devm_backlight_device_register()`?
>
>
> So regarding this suggestion, I have switched to 
> devm_backlight_device_register(), but now I can't unload the module; 
> it fails with EBUSY. I tried unbinding the device (via 
> /sys/class/backlight/wmaa_backlight/device/driver/unbind), but that 
> fails with ENODEV, maybe due to missing plumbing in wmi?
>
> I'm not sure if it's expected for users to be able to unload their 
> backlight drivers; on the random selection of notebooks that I have 
> immediately available to me at the moment, the backlight driver is 
> registered by the GPU driver, and that tends to be not unloadable 
> because e.g. it's driving the console.
>
> It's probably best to use devm_backlight_device_register() anyway 
> since it seems the ordinary backlight_device_register() is deprecated, 
> but I wanted to see if there were any strong opinions about whether it 
> would be a problem that the driver can't be unloaded.
>

Okay, actually, I *can* unbind the device; I was apparently pasting a 
truncated GUID into the shell so it wasn't finding it. However, even 
after successfully unbinding, I still can't unload the module; it still 
fails with EBUSY, even if I explicitly call 
devm_backlight_device_unregister() in a wmi_driver .remove callback. I 
confirmed that .remove() is getting called when the device is unbound.

