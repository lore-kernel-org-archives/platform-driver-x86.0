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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CB4CC48BE5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Jun 2021 20:08:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E5759610C7
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Jun 2021 20:08:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232256AbhFVUKU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Jun 2021 16:10:20 -0400
Received: from mail-mw2nam12on2065.outbound.protection.outlook.com ([40.107.244.65]:60577
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232437AbhFVUKU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Jun 2021 16:10:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cIq3QX4IHeT58Z+OlzYoBgyn9VSRYU7Ph5kY8DxeaInSzkxdRfkFySt6cw5Z8IubE+cP5sxy0isJxLhG7fbQ2jX16MIFjrB2vcKXcY3n+ZOHVw/qNF4k1ATvNqnx7YP8Dw4A7KiNjIu+hByyA5st2/hCp3JHdzn8oJzOnhpwXPgYvV06nskcVpa3cNjVTsEE9e1Qg5pFwxbtcFeI+tdlhrOGq5aOl2XQCuMO5pIop1o9d/pBMH+4Np+l1vB7si8M06PsRPMplYru83YleybaluQMHh8QOEI26mcEDtjKNItwUyPrrDDtkDW/KdiZdXwWf/80mSYZ4SMYfEmRMhJDEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gl3E/OJiUPQJ3d7q4PuN//Sy8/3yZN7z6p2M9iKm1k0=;
 b=Bguosd2jDZRFFALb5DS4pnAISZK8BN+yD9tPqrJpVm/a+HZ0RXXBAnxwAdx3i0cIGycOkIA7r2l9oxGnlbpz5o+Lj3qr9AoFGb08jeAlzAaIoTONnI/ciuEMo/QTDpw1H1NZAxM4Z0U5Q2UfBl4fwNN0aAB8RjVW5eUoQHgwOJ8ftTWLLkwbs15viUr5Vyu1HD5wGCfZMy/4YMbE4eYH3EJMLMgiHITyosCI4ceJ1ItxdTzfrErp+Dk3hIU5gUiW2ZgpZcg6rmh8ZnCcrn0GIDOynM9pyifYHRvKHvqwTFnvwDKzeOsp5AH4p57yQSlKFARBxX9VGTUhoHkOX96SzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gl3E/OJiUPQJ3d7q4PuN//Sy8/3yZN7z6p2M9iKm1k0=;
 b=d2er9/jL9Byt7FX1oIZIh8496FRDOWFW7CsOCx7aPgbs8D3u59uEQhNyKGeACSnhiVz0240cCu5tX4DzPsLMZdGf0lNV6F/LnyLmgwKTwGSuzLd2PMyxHDErfd6VqqWyZn0Zq5WEhMvyfL94OaAi31bCOMq3D1vQDk/rLNKEs8U=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4510.namprd12.prod.outlook.com (2603:10b6:806:94::8)
 by SN1PR12MB2413.namprd12.prod.outlook.com (2603:10b6:802:2b::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Tue, 22 Jun
 2021 20:08:02 +0000
Received: from SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::9c16:2794:cd04:2be0]) by SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::9c16:2794:cd04:2be0%6]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 20:08:01 +0000
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org (open list:X86 PLATFORM DRIVERS),
        markpearson@lenovo.com
Cc:     Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v2 2/2] platform/x86: think-lmi: Split current_value to reflect only the value
Date:   Tue, 22 Jun 2021 15:07:55 -0500
Message-Id: <20210622200755.12379-3-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210622200755.12379-1-mario.limonciello@amd.com>
References: <20210622200755.12379-1-mario.limonciello@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [76.251.167.31]
X-ClientProxiedBy: SA9PR13CA0078.namprd13.prod.outlook.com
 (2603:10b6:806:23::23) To SA0PR12MB4510.namprd12.prod.outlook.com
 (2603:10b6:806:94::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from AUS-LX-MLIMONCI.amd.com (76.251.167.31) by SA9PR13CA0078.namprd13.prod.outlook.com (2603:10b6:806:23::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.7 via Frontend Transport; Tue, 22 Jun 2021 20:08:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6fd3964-9b69-43ad-59e9-08d935b96fb2
X-MS-TrafficTypeDiagnostic: SN1PR12MB2413:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB2413A716FD772728299B2542E2099@SN1PR12MB2413.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kf2z7uxtvsEf+rc466MgJyx3hOtW5K9kyG5h+t3MkvibG08V8+2PzpcFHZ7x2/S8/81oBJcwps+e1AttHL9JwKEFH+WSuXqeOTCDx0j4QWvRKRK2ExY9JqVZeFpkK97cIdQkLbHbuQhJSpTl8JMOyVdLjx2E5iqJ4C6jcz2aJWlV4/cKoSGwLnaORyoKgwIaCpHz8pGjjszg4LezaiogJeUunxSxJCc8T0bLlI/Gk03r5QPAJTwM+IHU6/wIOYemat67CmN+y00CSZOuOYePB9aV6cKpwuFZKUed8kAECw6oqjP9QEYbcYvBIzMRNwlW3tZcJ04Bf0mGMfOXFEgEifweCS1H2+vqx2cRGK98RzjOeX1Ti2g9YxMChP+BfkwV3ceYT5TGuK3L6R5kOZYceE98fRzHV5Q5hURLx1hiJRElhYFIwwff7sXvrcc4HAgjQRVogGzwyq+9EteS/Bq2jqMLupVMuBEz47O59A1puwk4FpyrU5dW8yJpo8NY3JZoh00gFEjnW1mICectj41zd2A+hePMDDQbZXnEwAw08Her7zUiuiVZnDPLKsnHd+YUSgosmXrqezaC34RSSrfB1+lsTBhNWZq1LBcvNxtZb6zw8bmLdGbTo50gK5ElXIMLzbO5LVxTXCI/I2tculrrhTU7DYAvqMCVmK4bT/iYUMA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4510.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39860400002)(396003)(376002)(346002)(316002)(66556008)(66476007)(66946007)(16526019)(26005)(4326008)(110136005)(2906002)(8676002)(83380400001)(478600001)(5660300002)(186003)(6486002)(38350700002)(2616005)(52116002)(7696005)(6666004)(86362001)(1076003)(8936002)(36756003)(956004)(44832011)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vUXqTrit+qUqx4B5OxoNRDImsxIHPaOovf6Y8B0ei7M528nhIRZcrxIkRuMU?=
 =?us-ascii?Q?pVtqeSGxY9uW63CdJ6dy2+4O+nD1TKUDoc9NYb6AzT8Ytqdcih5kPgaFdIir?=
 =?us-ascii?Q?/Mj26RhtKE6TlfQlLKASaSnrTILVyMteysA7n0N/WQxtEJ0HLbJGEeS2iAg9?=
 =?us-ascii?Q?WHePa9WRiEocrFMxAVoOelZ7WUUIiokBnb1PpMalskWeNVNQPhHpFZyPyZDE?=
 =?us-ascii?Q?ibLZ8R5TKOPvlLHRtOIAEf8mJ4R1pYTcYjvGcO7/3JWnQZTyclfqUCY/vq1i?=
 =?us-ascii?Q?hwAiE3cgc2oiB+T2GWah0qkWFkU/3kqWzUetIgTgeKTQBDzyfu/cxXjRfUlX?=
 =?us-ascii?Q?Q6d9j5WAZtjKx5VUAgrWnj13pEuk9Ey6KIflNEBqPaGFhgvdgnQtQJvDPRSS?=
 =?us-ascii?Q?T5u1C6Dwct8XA8IpN/b1yRAno3WMIsfzBWjt753IW9WKsLqQnnNN/a7Of2vU?=
 =?us-ascii?Q?ZV3bUsek5UY1uBm5MIq0BLdlIzJGDhz7VLKQbYEiYPsLPAOhax+9RImQHXT5?=
 =?us-ascii?Q?NywPuhtv/+11HqxI67QisLwLtKA3s//lfKsbufFip6PaCpDZUJdeIJ5Xqcyp?=
 =?us-ascii?Q?6eiD7BI2XGJdd4RX+iqw7b8eDsDoLiqnNrdTPkpB5KLNwl6cRXQq4LTwQqxF?=
 =?us-ascii?Q?gItSgqdG4pJ1GC4AFjnU8qhU8ILFFXxmMJlapwyUUC3miSsR7cJFtVhbQQ7+?=
 =?us-ascii?Q?feRbSA9kkjnh6VYTSD2nWmmcV5Jg9i0Q5DuCmaOaOSGkPA8jHo54g9IBvLEs?=
 =?us-ascii?Q?NhkvQ458g6gKmZj6SXjeTUB1p0kQCKH4Q4Z2qCk3aSoAUn8blOYfddK/DVEO?=
 =?us-ascii?Q?5yV875ZaavbSmDjcupiBZ/StoAvvBs9pEKOjAiHLSfXwQRjlqSiH0zQO+OxV?=
 =?us-ascii?Q?fSdXMPIaB4HoIXq+mevYUGG0PHKuLyiW6qaib0EZ3zeuQ41lc07xK9DzFCA9?=
 =?us-ascii?Q?tdcn2+Q4OxLiBoRbAsuE2Zb7YMadvFsrrWvOTxogmUTYZBz8UAbJc4etz4+X?=
 =?us-ascii?Q?tFLsiGYgz+Ew5RIiRw/pNESrg0Rpk3/VecdD/Xfo/s9px9cjx5n7Omm5GxZN?=
 =?us-ascii?Q?JI/LdeSuzU7F33APQQZ/cHjqpZa11B9esryQn87PjIGHOrcrHZQOwxnq5m6r?=
 =?us-ascii?Q?9Kk/DIbLtqIS5bykFnNJ/0NKJE06RhQfr2Y98ghNYuEqU2/KaVt/1FxVpUve?=
 =?us-ascii?Q?djKJi6cruPj2aHf8Fn8N/v5LGd5YyMtxfaU+lY7PwUwP+1PIrFjwDlbxnG2X?=
 =?us-ascii?Q?lGpJx24FfM2Fa7XNkn9sTrPKf1HML5j07Bl1e+G3KyeJam+Thz2ftkwX/QDt?=
 =?us-ascii?Q?jlJaKWO6wnCGfpOk9K30d/eN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6fd3964-9b69-43ad-59e9-08d935b96fb2
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4510.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 20:08:00.9952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X3lBXr8pmVQ2cLQvJjMA9eF3BeChierwSyQ6uP2B9rBq3wMSx0VKh3n9QF6voMOEe/SmgMpRKcvUf1Wa5MSG6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2413
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Currently attributes will show things like:
`BootOrderLock,Disable`
rather than just
`Disable`.

Of course this works, but the attribute is intended to be read by
userspace tools and not require further processing.  That is a userspace
tool can display a drop down of `possible_values` and `current_value` is
one of them from the list.

This also aligns `think-lmi` with how `dell-wmi-sysman` works.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/think-lmi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

Changes from v1->v2:
 * Move into the series
 * Correct a char->char*

diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
index 4d8b5c185f8e..e71b631e6984 100644
--- a/drivers/platform/x86/think-lmi.c
+++ b/drivers/platform/x86/think-lmi.c
@@ -492,14 +492,19 @@ static ssize_t display_name_show(struct kobject *kobj, struct kobj_attribute *at
 static ssize_t current_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
 {
 	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
-	char *item;
+	char *item, *value;
 	int ret;
 
 	ret = tlmi_setting(setting->index, &item, LENOVO_BIOS_SETTING_GUID);
 	if (ret)
 		return ret;
 
-	ret = sysfs_emit(buf, "%s\n", item);
+	/* validate and split from `item,value` -> `value` */
+	value = strpbrk(item, ",");
+	if (!value || value == item || !strlen(value + 1))
+		return -EINVAL;
+
+	ret = sysfs_emit(buf, "%s\n", value + 1);
 	kfree(item);
 	return ret;
 }
-- 
2.25.1

