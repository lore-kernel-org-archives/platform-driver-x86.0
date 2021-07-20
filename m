Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27A81C07E95
	for <platform-driver-x86@archiver.kernel.org>; Tue, 20 Jul 2021 02:56:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 025AB61003
	for <platform-driver-x86@archiver.kernel.org>; Tue, 20 Jul 2021 02:56:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345055AbhGTCPY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 19 Jul 2021 22:15:24 -0400
Received: from mail-co1nam11on2088.outbound.protection.outlook.com ([40.107.220.88]:15168
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1344805AbhGTCNL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 19 Jul 2021 22:13:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WDWkxmQfTGgUZqkB1PfPIcPXM8NbxTTPwI2OoZxIqssVYY/WEcKfdqpu41JRRL5ilnMa7jD+Pp9N1dGhrNLTyGmjqBCqikfUUIiVfssjFSinIz4e22doUy9LIwcmldFwquuTzjKttPsKh3DCCGSC0zW1noVz37NXLPuoiLaqeBtAXc84ErmQp0bKGlZbKkvL9UALCYjA7Bkt6HVDOHKjgNSpkEJCoYYLIc5I0HUlgKXeO9lJyS6ElGAVtTBOOFixLYrv9gG8S0yhx/S0n3ZvvkIXMhlrj6+CRAwPf7rgISWqdjOCNiOcLHbMVQSLNtnbdtH6gJP8KHW2f7GoplUpFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o0Nsc7rr+/+q0E8f7CWVZoAxRPr0KlHihHcSNdiyE7A=;
 b=URqWysCmiZyhCrYyCMhEO4uHVI/5C1t1o6eVFzmTAoOm3I4mTeH9bte1BLQYI9F5/Yhme1ewvpKCSAY6xNYe3OqXq+e7suuLIreV4dy8b5bTlJaoVdIUMgG24Z2C5RnjQNewoPXWofxUG0MA17W/woWe7K6HMDWH9eZRRgSxTS2HJMZ31tNOXNcq9PXjRoHALVCyosSAQBGD8CtnoSQwHNd4ZQoohvAKL3u0PzBFHEoiUVzYx1qR0VshgZo+VzLq+4yNawyWiZmWsIkF67or5ykN6srbKpi68/KNXJy+KJuxeLjHY/QQEKWfcHS8sPoV5g+Tl4u8BNxT8rEtfbB8nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o0Nsc7rr+/+q0E8f7CWVZoAxRPr0KlHihHcSNdiyE7A=;
 b=a8/s8gtq2UzsJMyZkAqIXX7YZxZ7pZhb7ntYRULVqBvc7N27zX1P8Cm/3MQzDknZI2pDvR89QChDkCQ73GrwTHT/JFqR09Hb1FwEyu8+2GHtjv9x4NnxuiSACKPrZL8DDcUw40N1sHgW8tOdZTKK03CkCtva1r8IZXDW9USu1Y4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4510.namprd12.prod.outlook.com (2603:10b6:806:94::8)
 by SN6PR12MB4672.namprd12.prod.outlook.com (2603:10b6:805:12::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.29; Tue, 20 Jul
 2021 02:53:47 +0000
Received: from SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::c05f:7a93:601b:9861]) by SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::c05f:7a93:601b:9861%7]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 02:53:47 +0000
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org (open list:X86 PLATFORM DRIVERS)
Cc:     Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH] platform/x86: Kconfig: Make wireless-hotkey depend on RFKILL
Date:   Mon, 19 Jul 2021 21:53:51 -0500
Message-Id: <20210720025351.1819-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0601CA0013.namprd06.prod.outlook.com
 (2603:10b6:803:2f::23) To SA0PR12MB4510.namprd12.prod.outlook.com
 (2603:10b6:806:94::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from AUS-LX-MLIMONCI.amd.com (165.204.77.11) by SN4PR0601CA0013.namprd06.prod.outlook.com (2603:10b6:803:2f::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend Transport; Tue, 20 Jul 2021 02:53:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba9cb938-e287-4534-7bdc-08d94b299875
X-MS-TrafficTypeDiagnostic: SN6PR12MB4672:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB46724661D77039A8BFD1344CE2E29@SN6PR12MB4672.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qTcBBV6CFOZTwUKFwY+o/i/ja8VX9F4xhy7o/GxVjieDxihdgxNqRrkzCgh1Y5w6X/YiA0T4M6kWPsGBNMagdlpIOwyFOCGXtCyRDWzGD+so9sUVLDz3HFoxrVk6dd6fnIFZgSUWaweDmE1LqQkuRk4Fcrk/L7K1qZgBTNaXYQPp5fwNsVxSjYOqVmbyhR/hEUSHX9quVU6Wssz/ZswjCvRR0UN5r6/59VhCArQKmV6+WDArgc8GwO98QhFRrxpSWX6+M41cxwrkaOFB9AmkRNzh+ctaUVS219dpYNtWoa7dLheViL6pALmJORmJjeI8WsUN27dnbACnnbNkwHe3OxhIapLz2CQZcJrfKPCAJmiXRPPJiCf16iSFGw9pyoo6xGcEz+pGjAWKvtD8BVqs6+1u8VPUBWlWDCGlHLGuiShiPLvci4FA1ss7wQ4IbXIJ5JD5jfIP2EUVenpdOz+OyQ65JplNgHMnzKmrWc6THbBpcNrku2rwytF/eU7hDmqr54MOFJJ+PIAl9DNeiv5L1RJ9+yBGdqvbQ5/sfjycEgrLyvB1TWHS4J1dpQDro+M+2BZJYllZ4d9dCsOevfKmQBDfLasmu59x9u2AvhGmuEgOP+xzN4o5Lgxxy9yNLG2P5W0hcV0MzSFCvDu5b4LrreD9BWG+c2WTTlTld/TbHZRv7+byB6ZwH8SQOcyyWJiUrIG4JGnoxaCBup4YXPnF2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4510.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(396003)(39860400002)(136003)(346002)(44832011)(5660300002)(86362001)(2906002)(186003)(316002)(6666004)(110136005)(478600001)(1076003)(8936002)(4744005)(4326008)(66476007)(6486002)(26005)(52116002)(38350700002)(38100700002)(956004)(66556008)(8676002)(66946007)(2616005)(7696005)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UOkmRslo99UIkde60K7MsDkqePEBaRCtuaICn7RcAAJC2hFQUfu605LGR5N1?=
 =?us-ascii?Q?Jb6Djbw6l1S9LU1rS7Uu5WcUKZT4j7PdaPKu39eFGLRj6/A9Ni5k0acaH/28?=
 =?us-ascii?Q?HNE5ZjwSOdgCilpzIeJ89BA4tARAx9U/2qr2F/BsxxAhqczVVudYqaBWte0h?=
 =?us-ascii?Q?mJOVQGT+BKIQoskhbaUk0wtKxHIF6gw4YQzdVGMOlwE7cYfQmzmi+mLrmn+F?=
 =?us-ascii?Q?mZBSLsu9ENKo2880OEwlRmvB+X3faDv7vLcpg7FoyYNvBZmwCbSw0OfX99+2?=
 =?us-ascii?Q?aysZtzv0KAV8QxEpUHnf32ig7tm3nwQZzJxCCaJfXZY7tC6rbYhixsii4Ozc?=
 =?us-ascii?Q?L4Yfqd64Tp42SKLjn+C4xsFXNmgmrNzVE5LooDPutChm2mMOkhkqRF6tNYUA?=
 =?us-ascii?Q?FFm6O4i2YhvzpUcAQUjOIRaBGZk2GBxWwHe6JsaNzZY3EkSsEEMYZx32fh4Q?=
 =?us-ascii?Q?8GRx44GlprPZxHCgAmle2L8+8NK9XlJGQvk66psW9C2ECXQebt4xTpD+Eawo?=
 =?us-ascii?Q?dz05h70MTq+pdPODkD54jYmzqC1ov2prKNRfQIikrlMwIEQqXF1vpI02PUHA?=
 =?us-ascii?Q?ONmj6yh9ugqiMC+LrionaR2RH6HQogAmG1EJcjkRd+UECTyBkYCK/eCNWYAt?=
 =?us-ascii?Q?G2T7IWTH+IZAvk9270081rLEpo9Q+XjHOkIDcoaOslirxRNYDqMBlGC77JvI?=
 =?us-ascii?Q?RAoI7VX8sGV2oCP7LSNJ0qaIiwad4/XXkx2J1xYzTXpbsZ7FhfmLgDuPdUbt?=
 =?us-ascii?Q?WEYnuK2368icc+PtPnJ1ZtV/+L/JIkIV/vurzeHj16QK7Gu5ZGXyfxm3drYa?=
 =?us-ascii?Q?b0E1ANc4zO/EZ369wg88pemky5xS/NeOC8qDljmJkTQliHwtzq70CO50J48x?=
 =?us-ascii?Q?DvEZ2jMsDR79r2ZAXKGSrlOFklax4RVQJpY96Ee6NVAbcv5Kpd2tLcK2vWAB?=
 =?us-ascii?Q?35Bqp5qnZ0o9toAQKpLeJsH3AVewUDagIn48XBLmFQRJwL74YhktLrfg5fiW?=
 =?us-ascii?Q?OnGEDwm0bG1V7XVxFsO5Pd28+BhgdJSk7XKJSY2Gzeq8T8A/PRTFhQKJs9KG?=
 =?us-ascii?Q?l6p3AWtBlu0xSfBG3RLGlbM5wO9KLh4ArieukeWQsa6slzHiwnu9SwKfoVXS?=
 =?us-ascii?Q?HQjkPPdn4+m8/9aaV2928gmuXNRb7Rz5ZzDlx5Ilzxwg7LDsJRLBbq44QGHR?=
 =?us-ascii?Q?02uEjD+jYWDscT+XsvYaY6Sg7xVJQozSaqDgiljr7apvkZJoo8IH79r3uIwT?=
 =?us-ascii?Q?DAmeiQEYDLZXSal/rWwNqXAmpa2GRv0eVm9S27An0u5kNT3KwE71PG3CfO2L?=
 =?us-ascii?Q?bl3oyK4nszSwv/El+zFrBzXY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba9cb938-e287-4534-7bdc-08d94b299875
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4510.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 02:53:47.4986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ajnPs0JuZtgRTbl5IKq9hCyjz4S1DBzBNzaG4ct3WrUOTK30cTocljHQqiR2vR0Kgl7vdXFqydCTqSPPYTpYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4672
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This driver can be built on a kernel without rfkill, but events
won't work which causes an unexpected experience.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 7d385c3b2239..22b6e7e3da13 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -419,6 +419,7 @@ config WIRELESS_HOTKEY
 	tristate "Wireless hotkey button"
 	depends on ACPI
 	depends on INPUT
+	depends on RFKILL
 	help
 	 This driver provides supports for the wireless buttons found on some AMD,
 	 HP, & Xioami laptops.
-- 
2.25.1

