Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA37C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Sep 2021 19:40:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CBEC2611AE
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Sep 2021 19:40:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230425AbhITTly (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Sep 2021 15:41:54 -0400
Received: from mail-mw2nam12on2086.outbound.protection.outlook.com ([40.107.244.86]:18016
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231371AbhITTjx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Sep 2021 15:39:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bhxQW6PlxWzUzF8wdR/hBXRsrulID7OAFITco1RR/Glx0G76+fL7cdapa0nISBWpkzLSjFJvBb4wn8Pr/e85gtjVdjoXPxlcAvxnY5xca9hwptjx+3COu3WDPhG8H4i1hpvu64ZptWII22mLIExe/Y/ZK1v5mmVP4vqTODa2IufnzY39RLQIe64ss6m6iRVQDtrSGHO7F2sAMbFDpfxXgCWB4HI/1dCcvSimDro0RFYwR/GpGi8mEDKOkJRZ/k8Bnffmb/na8IJd8/mzasvBx/hLDHXOp23RMKdtfsM0sx9Mi7535lPo9S5oMLqGKC+Qrm83d3TI2qF04HEX1wCEog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=RPb/b7IX3M9gidFy3AK72LImedQ29uHyjU7X6OUYb3o=;
 b=LetNpIQAmj0MhfCTnTXpdB+AgqP6fSvBofwiKIxLjqugKIWSY3rAVPzWadU6tw49Bs65Iw52fLjZN1qP74ZZXbOLDYuqpeg/72GncEr+Bi6Q6AA4pMJtOY88DYkBDOCb79GtNqgAWunsgc4od58WYlUEuK6qeQwcLQJPllSCsoZ5gR7qb2rrgpaUu2tr7+QRFAoN4R+lN/G43pmvrL/SBzXAHHChqWHw5jPRFW/xGAORyIC8lxX/OTOrVmiF4GmklHJmtuqY+r+KS4o0O5SQRbwaguXNn4QqAvZmf4Aug898T6arCNg7Q4r3+7Z/FTExnCjXaAykPIDm3jGLLzyy4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=weissschuh.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RPb/b7IX3M9gidFy3AK72LImedQ29uHyjU7X6OUYb3o=;
 b=r7YqsJ018rVISU8Y4/I+hpltaOYD9rgbK0dy9HemRRVjnyuAHOKlYAprYwdDwIA5iW8Dq9SW0Z0ePs1cGNNiaxeBisCf+i3CZ+HENw/X8gplPJX1Yipxf4JybNGkxtJsOY6WQWVS/kqOI/VBpXvp+nkl1BvtA9SM4+hQWqeEA3GCpOfqvHihqw5kjxnJ2qxBnre6jo3/mbz5XW/PmKLEiWq05viVcReBchs3PqCds1CSti96THR6AeJq7PkaYN0OigmI4j2SgetTsSmPNa+apwyRx6pnqElF0+DmhXPMwN5sqeP3YCqXtJXo68RmlFEMBgzyqHViQ14obkHBrvQCcg==
Received: from MW4PR04CA0316.namprd04.prod.outlook.com (2603:10b6:303:82::21)
 by BN8PR12MB3345.namprd12.prod.outlook.com (2603:10b6:408:64::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Mon, 20 Sep
 2021 19:38:23 +0000
Received: from CO1NAM11FT042.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:82:cafe::d1) by MW4PR04CA0316.outlook.office365.com
 (2603:10b6:303:82::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Mon, 20 Sep 2021 19:38:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; weissschuh.net; dkim=none (message not signed)
 header.d=none;weissschuh.net; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT042.mail.protection.outlook.com (10.13.174.250) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4523.14 via Frontend Transport; Mon, 20 Sep 2021 19:38:21 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 20 Sep
 2021 19:38:17 +0000
Received: from [10.20.115.154] (172.20.187.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 20 Sep
 2021 19:38:16 +0000
Subject: Re: [PATCH v6] platform/x86: Add driver for ACPI WMAA EC-based
 backlight control
To:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
CC:     Hans de Goede <hdegoede@redhat.com>,
        <platform-driver-x86@vger.kernel.org>,
        <mario.limonciello@outlook.com>, <pobrn@protonmail.com>,
        <andy.shevchenko@gmail.com>, <aplattner@nvidia.com>,
        =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>
References: <e63904b7-105b-4401-bd40-82854b7d42d1@t-8ch.de>
 <20210903003838.15797-1-ddadap@nvidia.com>
 <11ffe8bc-b4ee-c451-9860-46997de8fe55@redhat.com>
 <20210920132911.cus27elz36dme63g@pali>
 <8b07125d-83b9-9de4-fd52-1cb01466364a@redhat.com>
 <20210920135106.y6mi57bcmurczmka@pali>
 <1aa8fdc7-9e7a-5e86-0045-f07ad5bf118e@nvidia.com>
 <20210920175526.5itrqbif65iievxb@pali>
From:   Daniel Dadap <ddadap@nvidia.com>
Message-ID: <26399d71-38ba-18f2-1d7e-a455d727dd58@nvidia.com>
Date:   Mon, 20 Sep 2021 14:38:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920175526.5itrqbif65iievxb@pali>
Content-Type: multipart/mixed;
        boundary="------------012A0DDB4F773FA493A3A5FD"
Content-Language: en-US
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 209ec6d0-e2a6-44f9-a7a2-08d97c6e342d
X-MS-TrafficTypeDiagnostic: BN8PR12MB3345:
X-Microsoft-Antispam-PRVS: <BN8PR12MB3345D44233D1C63A6ACC6A61BCA09@BN8PR12MB3345.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nqnl0+674mUvOxbHFgMST14nh8l2BZZLIJZTFVFFZtVltj9LiqxQwPhFSljNaopksJw5U2ekJIZ7+FAk2enQAIPeqxW8vGlvoCTGI3mCNFESMBDfsW3M07Vyaqd6US7rIZJSOQ/3kLVLHz/CYfkULG/AUvjXDiT40RMd1jOtB8jcm2zBXmqPLCvE33+a4kyr5c4KMW5KXWEv+EQO2iOw50m6nXXn6rv2zoEw/v2I+VWZ2HqtNKkhah/tKqw1ojyZt8QQf3oAINfo5BP+oruoThRe588Fpzsdp3O1UePePWUpxjCfiXFKZCZtA450I+YYaqXsG9yjANhkjYyo1QAVfoA+fufFJoEpl06bpA/n8XA2H7gVOB9u0CguThQ3pGpGBVdSvHJ9e2lE9RI2dgi65n0C6HFsukZ5kSfpZqUPTjwqBP0Kiho9o/+mhNQQMtWqeegFaP0dpmrPZo4SefBuwrEQr8K2GyGjZqUH7hqiW4qHkxd9kHNXdh7IPnb/qIxWAzfs6agyYJZcop4hYMtpBwic0850YEL5LFaUApZGMiYUjuIMSTPf2ospsJ0UcFZf8QvgN8drDSQ1d6WQ7nCMx96v0/upbD35h7bkemai/Q+lrlrXAeazFYWeWzO5Yr9WCkgjXJv9riHZWZfyeEu+kFR1KOuvOIZKJftLK9ZWMz+3L2LonoQSDISJdR3H5s2O/jAqs+aZCkBwvwZhMGBLqA0HhS7917E5fg+CIxmo1iU=
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(396003)(136003)(36840700001)(53546011)(7636003)(86362001)(32650700002)(5660300002)(33964004)(356005)(6916009)(426003)(2906002)(2616005)(36756003)(82310400003)(336012)(235185007)(82740400003)(83380400001)(4326008)(36906005)(66616009)(478600001)(70586007)(36860700001)(31686004)(16526019)(66574015)(316002)(54906003)(26005)(31696002)(186003)(70206006)(16576012)(8936002)(8676002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 19:38:21.2670
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 209ec6d0-e2a6-44f9-a7a2-08d97c6e342d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT042.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3345
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

--------------012A0DDB4F773FA493A3A5FD
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 9/20/21 12:55 PM, Pali Rohár wrote:
> Just one check, has bmf2mof showed some warning on stderr? I see
> "instance" in class definition and bmf2mof does not support decompiling
> MOF instances yet, it shows warning.


None of bmf2mof, bmfdec, nor bmfparse print anything to stderr, and all 
exit with status 0 when I feed them the BMF data from this system. I am 
using bmfdec from your GitHub repository at 7f47b073... which is the 
current commit at the top of the master branch. I have attached the raw 
bmof dump in case it is of any use to you. This is from a commercially 
available system, so I don't believe there ought to be anything 
sensitive in there, as anybody who purchases the same system should be 
able to retrieve the same data.


--------------012A0DDB4F773FA493A3A5FD
Content-Type: application/octet-stream; name="bmof"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="bmof"

Rk9NQgEAAABtAwAAaAsAAERTAAEafdpUGFmFAAEGGEIgggKJwIJpJMcBDEYDiORAyAUTEyAC
Ql4F2BRgEkT9+0OUBIcSAiGJAswL0C3AsADbAkwLcAxJpYFTAkuBkFABygX4FqAdUZIFWIYR
gUcR2WgcGjsMywTTIA6jbGQReEKdCpArQJgA8ajCaA6KjCc0RgwQge0cW6M4jcIFSMfQCI7r
ALkgARoFWAcSYDQMwYEcAUYGhDxDamgmsHsB2sYiZ7PQYKI0hiJbMNIsQJkAaygaUqAIxaFo
ZkEiR41yHLGi2huCIIOECVYxjOwPgsQ7CEgCiCKNBjX4BA8DHthBHd9pHcOJeSZ1ngLIeBlW
gh8DHwvwrgF1H3gaYPMMhxmiRxzuBA6R/f8BPa8HAazDyWjWpQoweyKQRSCNx8P3fE44geUP
AjUyQ9vg+Onh4LCYWAgpgNB4wD/xd4IIrwqer88LBsYOyH4FIASPdkSPDBEeILjC0ZHJFT0s
ob8vGOH0j+HMfDQ4bos8OaDHwDFP4YjO5xiOKMppHJLPFIb3UeLRwgM4p2eGs3ofMMFAHsbK
Uj4JZGOxJpAsCGWi0mRwk4IzuyBH77OE1QPrQOIxWDeFlNNoVB6EtcIIziA+LDgEhJycCFDn
AF8MPLgjeTPwSIKyYfpAwA8ohjSy1QDS/z8Yvw28fJjAui4F0E8cHsEJPmY8axwSrFHihgTW
qXpIYNN3bAAFkC8JVnpQoGMIESaa0Xl4dArjuEOiIL4UOMpU0TMx/huCrwyYa8w7CawTQ8iI
nobhPFkO5+sAH4nvHPBHiyUocLYgh/f/H54uVRZuF3Rc/HLgKwjDPtOjeUU4w+eNg3o+8bAN
65FyWKOFPeBXE59rPDNjhPWFBhyAeO9XDzIBA7JjgO9I4PA4NeJrngLxLE71lGM8wTyOwMA6
Nd8sGMx7EIN4EIiSwDmvKKhTgXNdUUAxmjcFg70YmcD67ygo5RTSfkdBqb2jUBAfBpziHIHW
cUdBTsiHFOD1/z9F4KcE+3b1kgLwVMYlBTT//0sKH5svKcD1HIi7pIALNFrQs/JcHkkCvZLA
wXomwSq06VOjUasGZWqUaVCrT6XGjJ0yLGGxGrYDgNDwFDICIiUvQoEREAE5DRBV/gYQkHOA
CMghT2sCcmIQAVnpGgVk2SACskQTQEwwiID8/wc=
--------------012A0DDB4F773FA493A3A5FD--
