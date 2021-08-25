Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 023BBC432BE
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Aug 2021 22:26:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB2DA610A6
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Aug 2021 22:26:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232988AbhHYW1P (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 25 Aug 2021 18:27:15 -0400
Received: from mail-dm6nam12on2072.outbound.protection.outlook.com ([40.107.243.72]:61280
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232006AbhHYW1J (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 Aug 2021 18:27:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i1l43cLtIIgVRskjp/6HUFHrTUrv6aqCCeoBSxnaNtBQFCH0OOMM32TYWGs8VsLHHhjRxfGRQfWxTEFwirz2PdloNlJ8ov8Nv2NtXZSthDwzANERt9ASi0SrBFyfPNmjIro05gmRVTOXMqJNAL1/xPtT60nEPf9K7DGwkKNS904YibNbXo29cf844UEkIxsWNCLHTOjZB5RivvrTpzyi++/86dFthy2T2An37wqC8PhEUmYvhAvrYwS/oIRQ9z2+uwUQTVlbgIbxSZEYAe4GGooQTGOBca0QwnX99SP9ATRmGFMCtVNgYxHUlmozy1JK+7K4ZwiI/dLhHwVR1mK8tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XnVzej3T33c5tDZvA2fxb7zFzyR0FLHKHS0a3uaIUoA=;
 b=P1nsbwM7IG8IC1jFhOs63bOV6T9/bkaLr7lnAEkwPaCQpAGupG8n6g3l5L58iOWqVOK1EJE34dcrNZAzy/VxCRio1ttlocQ0Y+BzBibaDzjuyPdG3hyUYNGxCexREJQPx801jR9lFa9sN5i0KX1gk3bkUTSBplmCpJpAJ469CF7wD2NXsaysYm/++gWXs2z3R4bUdafIoptJJ2DHCaqx80CJxQLwDxHN8k7afZCPF2pTdb1IzYvk3MBv+jgAaAb1Fc1A4ftD3NVdCh0VSRwaHkWx1vagJwEw5bag8udrKTxAySXSKITxEBbjT5asExDJmfKDG0HkM2L0eELjss6xiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=outlook.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XnVzej3T33c5tDZvA2fxb7zFzyR0FLHKHS0a3uaIUoA=;
 b=lD0n6KnfebYCMHSlWI0y3EgxuhZBs5S89gUqB5mR95GAUAXzx7j9p7Pr3kJ5/S/t2TlMF2JUgm6DZ792RHu8SFliu4Fig0dKWIseyIsR3i9SRbsoxBSZUfqv/SRgzjgGViZ87uSm3GlDIoBnva52uWzDtg2NE4EERRfAPEQkc/2HRJMDl48/kqnqDVwYbG9yyw09PNHMeVCGZtNS8u78vpPO8MunKJv5JgBz30inRc1bXnb66jN9sMz3WdChtOJf27xzJrpTOGEUd8PRO68MKeTxYI9rjAK4khPtfAwPCmgq738gVvzwHYrVzNcQ9DCi2mBbhgWaVpWxmOWEtunABg==
Received: from CO2PR04CA0151.namprd04.prod.outlook.com (2603:10b6:104::29) by
 DM6PR12MB4059.namprd12.prod.outlook.com (2603:10b6:5:215::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.21; Wed, 25 Aug 2021 22:26:22 +0000
Received: from CO1NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:0:cafe::dd) by CO2PR04CA0151.outlook.office365.com
 (2603:10b6:104::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Wed, 25 Aug 2021 22:26:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; outlook.com; dkim=none (message not signed)
 header.d=none;outlook.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 CO1NAM11FT059.mail.protection.outlook.com (10.13.174.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4457.17 via Frontend Transport; Wed, 25 Aug 2021 22:26:22 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 25 Aug
 2021 15:26:19 -0700
Received: from [10.20.22.154] (172.20.187.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 25 Aug
 2021 22:26:18 +0000
Subject: Re: [PATCH v3] platform/x86: Add driver for ACPI WMAA EC-based
 backlight control
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
CC:     <platform-driver-x86@vger.kernel.org>, <hdegoede@redhat.com>,
        <mario.limonciello@outlook.com>, <andy@infradead.org>,
        <dvhart@infradead.org>, Aaron Plattner <aplattner@nvidia.com>
References: <877ae34b-dcbb-a0a4-7d76-d9d78d12fd00@redhat.com>
 <20210824220437.14175-1-ddadap@nvidia.com>
 <6RpClBuJeF9Qz9ttRSWYSDf54xIAio4IkrnTPSMeRx69TjEpe833H_rZXiIoK_GJUj4oi5Qv1BUV5yxlKMi5Pu9ngpKB_U_wie_a3_S5Yjg=@protonmail.com>
From:   Daniel Dadap <ddadap@nvidia.com>
Message-ID: <9f9ca8a0-491d-7493-5459-8f81687f2d47@nvidia.com>
Date:   Wed, 25 Aug 2021 17:26:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <6RpClBuJeF9Qz9ttRSWYSDf54xIAio4IkrnTPSMeRx69TjEpe833H_rZXiIoK_GJUj4oi5Qv1BUV5yxlKMi5Pu9ngpKB_U_wie_a3_S5Yjg=@protonmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ce10fa2-ac69-445e-f1df-08d968175e1e
X-MS-TrafficTypeDiagnostic: DM6PR12MB4059:
X-Microsoft-Antispam-PRVS: <DM6PR12MB40595BBD254F7081351C51BCBCC69@DM6PR12MB4059.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NOFqXR3CISQ/EkY+x+gjfqEfuTBn5gcEwVm4w3tfUrLHj6ESuHV3xXBlAwWYgui1I8MV59ZMMWWb5Sqf9CwO+ZY4jX9YYOaOr/AtWs6HK5Z5+9sBIeeqq7+eCTvz4bfrcihxKEcnCDMohryMS5fnRGiD3J49ui4TGRhUijAh34wjg7QQ7zsx819cwvt2/cbZj/e2q26bkhDy4TfLlXYyi4FuHSogpguwfHco3JIla3i+oVvZeFFoGmEw895SA3nkz16YRhTAsEqMh3n/kHwBLs1eyNDarDUFiiVXZ0+y0k0V4rgLUi5WhOCpNrLMwmu2PQv8VkpM0Wp+5S/ciMDpehZXrnFHDYqFeLePkOnlWGNGMxJkfo19Ob0gGmTABpU/Co8fnF+JBKY53y5sKEl4IYooCu6yx6XFWCYmCv4bn8tQXH08mPiRf5jaqMu1Uc6ck8xd1Ks52I1o67R1lGoPckdhRsi8LjEGMhBwid0jCCIkKs7MuhwihHgj9P6IzT3uTj0pIAcC61c5ct357SErNpnHWAcKuiEymYTjxk7mlM00Vx7iEbQT7DZkFf3Sq2wiBLn2O3KVTrIsDvGp5L/wQXl+qIhBqMv4aDALHigk5Ykd2F05BAsj8s85FkQkx+OzU7ll2/1XZ4k7UPsIPDPy2YV/TXU1MbT4jjBLEqsy7pyaamE9rXPDQpWE5bbAWvrv9LiOOIYOF/bEwxQv714VR5sqZhQeWuouABXJBWYg/GI=
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(39860400002)(396003)(36840700001)(107886003)(6916009)(356005)(32650700002)(53546011)(4326008)(336012)(426003)(82310400003)(4744005)(82740400003)(36756003)(316002)(36860700001)(5660300002)(83380400001)(186003)(8676002)(86362001)(70206006)(31686004)(31696002)(16526019)(8936002)(54906003)(478600001)(7636003)(2906002)(26005)(70586007)(2616005)(16576012)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 22:26:22.1149
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ce10fa2-ac69-445e-f1df-08d968175e1e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4059
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 8/24/21 5:47 PM, Barnabás Pőcze wrote:
> Have you looked at `devm_backlight_device_register()`?


So regarding this suggestion, I have switched to 
devm_backlight_device_register(), but now I can't unload the module; it 
fails with EBUSY. I tried unbinding the device (via 
/sys/class/backlight/wmaa_backlight/device/driver/unbind), but that 
fails with ENODEV, maybe due to missing plumbing in wmi?

I'm not sure if it's expected for users to be able to unload their 
backlight drivers; on the random selection of notebooks that I have 
immediately available to me at the moment, the backlight driver is 
registered by the GPU driver, and that tends to be not unloadable 
because e.g. it's driving the console.

It's probably best to use devm_backlight_device_register() anyway since 
it seems the ordinary backlight_device_register() is deprecated, but I 
wanted to see if there were any strong opinions about whether it would 
be a problem that the driver can't be unloaded.

