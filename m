Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62CB9C433F5
	for <platform-driver-x86@archiver.kernel.org>; Sat,  2 Oct 2021 09:33:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4842661A6F
	for <platform-driver-x86@archiver.kernel.org>; Sat,  2 Oct 2021 09:33:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232744AbhJBJe7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 2 Oct 2021 05:34:59 -0400
Received: from mail-dm6nam10on2058.outbound.protection.outlook.com ([40.107.93.58]:46176
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232741AbhJBJe5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 2 Oct 2021 05:34:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UKvmgWpKFQ9xwaZUysbcXvpblIq2jHzVvwGbfqzu/81rne6b5SNe4xhll/1hpthHJp5GepaUE8VpGx0ssPwBaqQJPwUDl+NG95gUiz7AE1E8WU0NJcb+fkmrFooyxT5rU/rNnCM2hVrt1wQ2vHGH45cFXVX5XxYboEhB/ll9LIxKq8uS47D1yAYVDil7jfxqwfhc1iOQPvCybnVGZ+y6Cv7gekpS2u7FhORLvrxaPxwVZGeBQx8NvXBBgBJwipdFrYsUYR7xO32nehZeu5giTzlbApMrT6FoEok/QNjiD5jiaWM/M2a6rzXxZ+sGTVPgklyl1y+Mf9ktH18jDRlvnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wcmYRlgSIUreLqEfUCNkiGUw5wFGCY+wGn+rpzi8k28=;
 b=BCQnLRvhEUkupbPzmu+e9lokDwceWNIKbier4ppHZWpbQ2Za9cmFCCmVi6XTSJAsiYFvwywqx1Po4/KJxSsksewulXucWFqr+4Qc8W3eEh0WrA0Ml26Fe0fnfvz01h1V8LoezSriZTTrxO8+ghWpdUqC2o2U9XGjoL22JpqZnqA50/MaMD8uti04+gIbSOQbSiiNdJTwOrRTn8+Eov+2//tQVo3aR38ac56iD1/HESVfGqzYe40K+4+CnnDRg/3KKB/1bGTgrouWvmt/l8OCgWs1Tw+a3pJVG7+FmRCOMlHVngVmK0xxwBzyH1Q9VqMmodK/cpcIhbwxpzV+5tRBRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcmYRlgSIUreLqEfUCNkiGUw5wFGCY+wGn+rpzi8k28=;
 b=hsuMuQIQFMNNpX0vMgzEkLH7uceWhFBGExzpGnt949XZEKdVMtAjgkHVVdYP8SPHf4b3wnja6y4i39JlUlvhWLDSvfrtVe6dwhvze7Nd9LNISXLbkNjWQESf2zytFAJYbingshAJStvbbxVl2kbut+WHlDoH9u+Rj5NZvtpVmJWmIhr9iw7YvkcrqR9jMZXslgC+2zIaoUEFSysiLTJU7PxF9Z6ADcH6S6EoyIcvM/DXzq/OQAW8rXluOQYjq1af3R87z/g/JNePuGnRpu3yeg77CRnfUwKbac+SfoUW1kwqrdy62Nc9r2n4M5xj7wuiRKosGKSvxwjHf30MQ7FRcQ==
Received: from MW4PR04CA0173.namprd04.prod.outlook.com (2603:10b6:303:85::28)
 by BL0PR12MB4897.namprd12.prod.outlook.com (2603:10b6:208:17e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Sat, 2 Oct
 2021 09:33:09 +0000
Received: from CO1NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:85:cafe::c5) by MW4PR04CA0173.outlook.office365.com
 (2603:10b6:303:85::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Sat, 2 Oct 2021 09:33:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT055.mail.protection.outlook.com (10.13.175.129) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4566.14 via Frontend Transport; Sat, 2 Oct 2021 09:33:09 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.187.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Sat, 2 Oct 2021 09:33:07 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>, <michaelsh@nvidia.com>,
        "Vadim Pasternak" <vadimp@nvidia.com>
Subject: [PATCH platform-next 05/10] platform/mellanox: mlxreg-io: Extend number of hwmon attributes
Date:   Sat, 2 Oct 2021 12:32:34 +0300
Message-ID: <20211002093238.3771419-6-vadimp@nvidia.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211002093238.3771419-1-vadimp@nvidia.com>
References: <20211002093238.3771419-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e3225c5-e0a6-4ad7-177a-08d98587a58d
X-MS-TrafficTypeDiagnostic: BL0PR12MB4897:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4897F5A7B662C6539901A220AFAC9@BL0PR12MB4897.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fp2dA7d0yxjbetSR/XRT/efhh6NaMlpJ/pqrrS9FazIBEENTcmExKa7dQiBFcByl90whnYUB+JGmxu+FdWC57O5G7QWGY4bibWUNNiM8s2GgfQ0ykPz0/ZR+u6m4t3fVW2WTGrUpwjrrk1Xn8Jw92rgMNKW5GYE0MPjYy1fHUQLHQYXXKrx8ytlxF+cqs4s9egmNjsB2U+M9lpsDOEE7/m8TvHRq2rdWMUVsKrCXLksc0wyFGA7GG8qNbD65TzUjhqI1Df6WGhwzY3qWf0au+zgL/EY7m3++dn+TT+stDhyEN8VPG/Pi8+6lNPACoqoqTeYdfw/UrCNOTWJRvk2uK9iYHfFnQ/ZNObvqHk6N3HwZlEKlM80yuY3j8bCFCPgUFfT+zw6he4bi54dcKO/KtrIPDJihHH1K5JRMbCihQpAuE6ynYXHmN1QXcibt/7Bvtin+S7DMsuuqFmyY+wrLqwo9pWwt8Ishfw3Nwxifhv0674u/RYthtaMI0NzhALJfWne3IsICiWrpk1XDxkw7puRaUId0Epz0M51mn01tY68tF+956QKrD6sHkUsbXAuz0p1FZGzbSidvhvdY87UdEHp/8YV43Cv+genu+9qBdg74dCsz1H9QKiqF1dZ2dli56RF92nuSPlPrwMgpq54WZnp4WgepLfvBtYqKrYajFByJwjZij4i4bDtBXXwowEcB4M9F+J5+eo0JL8RjC8ghEg==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(26005)(47076005)(16526019)(6666004)(426003)(36860700001)(186003)(2616005)(107886003)(336012)(2906002)(83380400001)(508600001)(70586007)(70206006)(8936002)(4326008)(8676002)(5660300002)(36756003)(86362001)(82310400003)(6916009)(54906003)(316002)(4744005)(1076003)(356005)(7636003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2021 09:33:09.3062
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e3225c5-e0a6-4ad7-177a-08d98587a58d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4897
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Extend maximum number of the attributes, exposed to 'sysfs'.
It is requires in order to support modular systems, which
provide more attributes for system control, statuses and info.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
 drivers/platform/mellanox/mlxreg-io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/mellanox/mlxreg-io.c b/drivers/platform/mellanox/mlxreg-io.c
index 7646708d57e4..43e9228a8fd3 100644
--- a/drivers/platform/mellanox/mlxreg-io.c
+++ b/drivers/platform/mellanox/mlxreg-io.c
@@ -18,7 +18,7 @@
 
 /* Attribute parameters. */
 #define MLXREG_IO_ATT_SIZE	10
-#define MLXREG_IO_ATT_NUM	48
+#define MLXREG_IO_ATT_NUM	96
 
 /**
  * struct mlxreg_io_priv_data - driver's private data:
-- 
2.20.1

