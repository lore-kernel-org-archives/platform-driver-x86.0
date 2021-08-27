Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0C06C43216
	for <platform-driver-x86@archiver.kernel.org>; Fri, 27 Aug 2021 17:13:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8F87960FD9
	for <platform-driver-x86@archiver.kernel.org>; Fri, 27 Aug 2021 17:13:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235695AbhH0RNu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 27 Aug 2021 13:13:50 -0400
Received: from mail-dm6nam10on2041.outbound.protection.outlook.com ([40.107.93.41]:61664
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236560AbhH0RNu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 27 Aug 2021 13:13:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wbvigz2YiFoQuAqhYaW/9i5089mzuByrpi+/VnYi4owCvjM4OXUAWFs5sw3t+2fJZgpaiGIxtbbOpybdoQOpLHV/wZQkpNzThTdvAC/vNZtgFZayQmxeJG84KDxaO+xQpnrWFM4/nWtP0/bWeRTkwguVEx+zRpGglPgVYwITaAIwee0LwONuMG4qZUNqbEKNeLng0YbLotY5RsTwYG5eANXX1YR72HQlZ1G845PekRoU0+ifGZtjghdc36mNcnHoslHuaUUH+RSVHO8mcSVuegQOnoCFnthMnx7T5BEDbTCQ2Vy9ULuvdfLXSiFFK4EvazWhm9A8UQa2sRXqKKoS+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nX2QvB/mhrEt+//ulKiqtsV86dL51ekmot+TkH1ijyc=;
 b=bH63RCyb7+RqFJA1cPnU9GKR8nPwOLkgXped6pgR3aw5rHV6OX0KCwN8iCtD4YW+CSg3u4Aazb2o+0UnyWNy+FrEhf1+3IGQy0fjbDaLW+pti3S00VaKIR78GnvX4dReGKTjwxuNO8122IAEpXZAcdPwSQvDyR8YBLh/cunteaBk4Y0RBFi5zFCTXUhwLPyFUYwq79JTauyXODK/7bixQCiPp92h0uDy4rjDwiRnUZrqio0CFoyc46kHZGfQ0KS3Q9q/yUMPMvK3wXdW+gMd9VQqx2c9r/fxsPzKbXjoS0VWvkKj1NYS0d2JFxEZbCmvnPlITULlGxr1hHfBjVaR9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=outlook.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nX2QvB/mhrEt+//ulKiqtsV86dL51ekmot+TkH1ijyc=;
 b=gYg8qAHmJm0iTBTrrhmOGKcFlZqCbf4oAiLAr4pt73pIia8uyQvzGKuZrVxCzgee1OhUhK64I7XkPBV9MTBpgaNltDxcSxUZYw7qQaX6K1FH4lis3FkZtiFoQ1me75hTa/heQDaXii9LogbSmfhfLjcKpCGCLPWBwY4DpFtiiQKBf7Ycy2T9Vf4V3Qqg4QXNq8Sc0gVL0Szmf6QTgPj7k5w6EyGcZB0JEYyY9CuAV/sLB/JndDDZgH0lfZ+b+f96wbtn3vZatupOyLTHeO7lqLniV7V8M08PwGkwkZh9fUlNf/3bPX7lwwYtlkgbdaFpeqDMItdvUWmU2Vn8HKiHsQ==
Received: from MW4PR04CA0155.namprd04.prod.outlook.com (2603:10b6:303:85::10)
 by DM4PR12MB5246.namprd12.prod.outlook.com (2603:10b6:5:399::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 27 Aug
 2021 17:12:59 +0000
Received: from CO1NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:85:cafe::b4) by MW4PR04CA0155.outlook.office365.com
 (2603:10b6:303:85::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.21 via Frontend
 Transport; Fri, 27 Aug 2021 17:12:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; outlook.com; dkim=none (message not signed)
 header.d=none;outlook.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 CO1NAM11FT055.mail.protection.outlook.com (10.13.175.129) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4457.17 via Frontend Transport; Fri, 27 Aug 2021 17:12:59 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 27 Aug
 2021 17:12:58 +0000
Received: from [10.20.22.154] (172.20.187.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 27 Aug
 2021 17:12:57 +0000
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
 <673a1641-cfdf-1857-21ea-a12867749912@nvidia.com>
Message-ID: <cbb1495d-745d-f3e5-892e-9bea3451d2d1@nvidia.com>
Date:   Fri, 27 Aug 2021 12:12:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <673a1641-cfdf-1857-21ea-a12867749912@nvidia.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f91dae7c-e098-446a-8ff5-08d9697deb97
X-MS-TrafficTypeDiagnostic: DM4PR12MB5246:
X-Microsoft-Antispam-PRVS: <DM4PR12MB52466E1A4E88691995CAFF5BBCC89@DM4PR12MB5246.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5DBkXSSKP1Cz0QGKsSMZjIX+NwuO+8Btbw6/oPjGGZUwPJ60sAuhSsQhzaP9qfyLMxtV3Kj8Xm3AjXoEU5mf+OipSpZi9p9A4pjlvpUFhi9acCuJYKhkwSpXkAn/xyLKGIzo16jhOQhsefKJ51cmVujIaqNWUYlfonMwYMfSG/jb2x5CapIEOl3PU6Gj+EiMeRAxE7Z8z8PAzkbSJ95a2ne/WMkO7rkadtbRki6VqvLZTowAKfZhjgQuOg3nWV2vw2dUAUt7dtK9qq66t0xgDtJps3xCQ5zuJRSGs04qo3w28mgBBboTu9Cf7Eid/gMM74+dVszb9aw0SEQErjGu627ZE6Xi+1f/XFL2WiIICTEqzgPp9oELe/jljCdrgytHXcMaC/Gdld6XjeNWeg6WH7Hez8uq+2PVF2kKRMstslL2zrWTm9frxz83tdiLcaXOUEbYn8ccmzb6xFxZD8AUAAiIoetwX41fz09uaN1z2rTvix3WCb8e0l3WOxmt7/VrLs4iIdjV1hTYj9ad1CWIOIanameJysllx5kJ3WQWfhYqNjrnm+L6FrT9Dg331mS5gZsEfqSn8t2mBomz6u8eUyx3y8H1whjxNGtGD16D2hi2CuPP80A5Rl6gdMiqAcEWAA1ldkykDHgECjcaQFMbKtBJ8VsxG0qGYl3F1hSYyRtAFJOZYRAFO0XuKEhwey7yGbvOzL/zPZwc96Kd3fPetgFbNgaVYg7Qqhz6qf2mykY=
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid04.nvidia.com;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(136003)(376002)(36840700001)(8676002)(5660300002)(70586007)(7636003)(186003)(8936002)(31686004)(26005)(478600001)(36906005)(53546011)(2616005)(16526019)(31696002)(107886003)(336012)(36860700001)(86362001)(426003)(316002)(82310400003)(16576012)(2906002)(70206006)(32650700002)(4326008)(36756003)(82740400003)(356005)(6916009)(54906003)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 17:12:59.2973
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f91dae7c-e098-446a-8ff5-08d9697deb97
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5246
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 8/27/21 11:47 AM, Daniel Dadap wrote:
> On 8/25/21 5:26 PM, Daniel Dadap wrote:
>> On 8/24/21 5:47 PM, Barnabás Pőcze wrote:
>>> Have you looked at `devm_backlight_device_register()`?
>>
>>
>> So regarding this suggestion, I have switched to 
>> devm_backlight_device_register(), but now I can't unload the module; 
>> it fails with EBUSY. I tried unbinding the device (via 
>> /sys/class/backlight/wmaa_backlight/device/driver/unbind), but that 
>> fails with ENODEV, maybe due to missing plumbing in wmi?
>>
>> I'm not sure if it's expected for users to be able to unload their 
>> backlight drivers; on the random selection of notebooks that I have 
>> immediately available to me at the moment, the backlight driver is 
>> registered by the GPU driver, and that tends to be not unloadable 
>> because e.g. it's driving the console.
>>
>> It's probably best to use devm_backlight_device_register() anyway 
>> since it seems the ordinary backlight_device_register() is 
>> deprecated, but I wanted to see if there were any strong opinions 
>> about whether it would be a problem that the driver can't be unloaded.
>>
>
> Okay, actually, I *can* unbind the device; I was apparently pasting a 
> truncated GUID into the shell so it wasn't finding it. However, even 
> after successfully unbinding, I still can't unload the module; it 
> still fails with EBUSY, even if I explicitly call 
> devm_backlight_device_unregister() in a wmi_driver .remove callback. I 
> confirmed that .remove() is getting called when the device is unbound.


Sorry for the noise. It can be unloaded after unbinding if I *don't* 
explicitly call devm_backlight_device_unregister() and leave the 
.remove() callback unimplemented. I must have accidentally been 
test-loading the wrong version of the kernel module in an earlier 
experiment. So all does indeed seem to be well. I'll provide a revised 
patch shortly, after some additional testing.

