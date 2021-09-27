Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD479C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Sep 2021 14:22:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A2DCC6109F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Sep 2021 14:22:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234692AbhI0OYV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 27 Sep 2021 10:24:21 -0400
Received: from mail-bn1nam07on2071.outbound.protection.outlook.com ([40.107.212.71]:5703
        "EHLO NAM02-BN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234709AbhI0OYU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Sep 2021 10:24:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DrUbyOeXzlZR5Agu+7PQJluTgN7JuJl6oET+V+8Q9zsD8uuZnm/wgXgxZ07stURBJd2LxZXcnwxXGHcwy75ku/jRT7r5QVkbwEOkunLgTNtrAdMX6pYFiadCDVgS371Q7Fc8OiF6nuF9FBoYnhpdzpuKFyYQyIc69sMspaHBDzs1fFE2OdL3YGYW+2NeTWP0hoKVdLeXkpvbkEbSwc/nhx4m+E0zNswnf07+rcD6dIk3Sfw1fimmhKE6Ds1pz61i6oMO+m4Azup4WVYbAfSJ8L2+L83HMgKx6oVkckCPFWyrz7SUto7Z+xs7WBFh4WSgUCLWlmgp6isZNfgRM9ufjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=1IdNaauziksecPJz1UGO5pO+PZErtUFvDs9424rOGWk=;
 b=VcB1679j8ruLszfkhUx9GTJY1ZME65EfTobNSm+AK7hPFqtbUCNgPmQKTJSa+cZSdkNUDvCjU4NXbdm3eIvKD6HXvnI70dMGueSz013AQQ9i4chyuRgJJEa58uIrkd5OM7iK0CLf1aj8WHjFS4UO71UU6QvyAtgAP9MS5yvmYfMuXZrJ1cO+JSsGqr0Yxm4z+qU6NTh0lp36o7uo63qIwWn6A8z6C64xGPGkLw+hzhRoKZkdAJ9tS72C+5CKqkf6HKejljEpXqqzstINdn+79LCH5rUNOY13P4JRH9Q6KBZB2yTmAauyBphOlD2QXe/2Jdc9oab2iGqyjMhUuo5kAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1IdNaauziksecPJz1UGO5pO+PZErtUFvDs9424rOGWk=;
 b=WF464rj/GI34e/Piro0Zl9Ttilks5m/waLjBmJncZumJAZjq9AQsgm0HPF457pvMsIo9Qz0PO9NhMQW1X5Aw3MU6VnEEFgbt03Xhb+pf10YWg8WzF5OKyEObudAi0ZJgVXBYKYnjfjiX47je+fgjgTO4GbY3HfYxROgmV/QQm/Qb0f0y3KKcWx+IxD3bb4L4FCwJPsXmoNEwtF0Yg1OVGcHhqsSbFkxLnUP3KPjEJu0qAhsK8q+Y51FcpVzBF513sf4HSwlDdrp6se+qj2rGzwC1+eftMKpV6zrjMdshwIwFQ+ctX7zxR6WfyFFd41FFtxbvHSun9HYc7mAoxhWXBg==
Received: from DM5PR2001CA0020.namprd20.prod.outlook.com (2603:10b6:4:16::30)
 by CH2PR12MB4055.namprd12.prod.outlook.com (2603:10b6:610:78::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Mon, 27 Sep
 2021 14:22:41 +0000
Received: from DM6NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:16:cafe::79) by DM5PR2001CA0020.outlook.office365.com
 (2603:10b6:4:16::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Mon, 27 Sep 2021 14:22:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 DM6NAM11FT019.mail.protection.outlook.com (10.13.172.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4544.13 via Frontend Transport; Mon, 27 Sep 2021 14:22:40 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 27 Sep
 2021 07:22:40 -0700
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.187.5) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Mon, 27 Sep 2021 14:22:38 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform 2/2] platform/mellanox: mlxreg-io: Fix read access of n-bytes size attributes
Date:   Mon, 27 Sep 2021 17:22:14 +0300
Message-ID: <20210927142214.2613929-3-vadimp@nvidia.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927142214.2613929-1-vadimp@nvidia.com>
References: <20210927142214.2613929-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a0af8f0-6ecd-4a3e-f9e9-08d981c243b2
X-MS-TrafficTypeDiagnostic: CH2PR12MB4055:
X-Microsoft-Antispam-PRVS: <CH2PR12MB40554170062B363B6FB2F33EAFA79@CH2PR12MB4055.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9sWEmJVBuDk0g2FWZKZcopu++7Ei47or5o6hb5MXFqgMyy2iGbOu/bmTO7YqMv4bUSVbXJ43AjvRkv6KpZPwNne9e3MBYorD5seNeVqa2Wg0dYNQAThZ+Az6ZEbLL7r/olxba4NxULjKwJP+jZ9Q3H6lQWQQiYvjArpCC3OIbHeaFoakBv/DGQnj69zmodk5u1Jh2gw3uEdF8qQRNpmdTyaQ1I8927lkV+hHZG5mfLi+PYF6BiZ6OnEANe6v/4s8PUSlHJ9fCRPteubD1isvcss0mN7bHVID/cX+sOG9mOoGng8IQtT2laLXx1g26uDn6UrwjnEn/Qb4T6aYaZqm9kdzT6WOwr0tvBzubxwtG2/BGt43O9eS6joAZ5GcYc4T/sBkLRAYMU2BNGArmv7tCamAr7bAjl3nDNXng//1dV7djLDgkwy3gwdRtDzHSqW+PQw+On7CQ9JE0OWbfqq0PKSQ/BZ/sx2bEpa+dHp4AUrjnWuxGqP2xgNiztipd3nQy2K2jqnPCD71zikTncxnWq3nUo9qmLfElqBrVS0OZZWwHAPzw/RsoWKc46UIXnrHaQZBqXNpWm7W3CjPpzfxzQ0bp+qHEKfYRHxjXF8czmQXS/Xz0Qu2DhET8/34rQbUqkLcKRiwJXG1p5Q0XHqBPFXtxb9uQxnFYNxk5ljMNDbJdq9w4LuGMSrHLwUQbYYO+o3hAi/rVmqawEsX08WKNw==
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(26005)(336012)(70586007)(4326008)(54906003)(16526019)(508600001)(36756003)(70206006)(86362001)(2616005)(426003)(6916009)(2906002)(356005)(36860700001)(82310400003)(316002)(5660300002)(107886003)(8936002)(1076003)(83380400001)(8676002)(6666004)(7636003)(4744005)(47076005)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 14:22:40.7907
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a0af8f0-6ecd-4a3e-f9e9-08d981c243b2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4055
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Fix shift argument for function rol32(). It should be provided in bits,
while was provided in bytes.

Fixes: 86148190a7db ("platform/mellanox: mlxreg-io: Add support for complex attributes")
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/platform/mellanox/mlxreg-io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/mellanox/mlxreg-io.c b/drivers/platform/mellanox/mlxreg-io.c
index a023ec02126b..a916cd89cbbe 100644
--- a/drivers/platform/mellanox/mlxreg-io.c
+++ b/drivers/platform/mellanox/mlxreg-io.c
@@ -98,7 +98,7 @@ mlxreg_io_get_reg(void *regmap, struct mlxreg_core_data *data, u32 in_val,
 			if (ret)
 				goto access_error;
 
-			*regval |= rol32(val, regsize * i);
+			*regval |= rol32(val, regsize * i * 8);
 		}
 	}
 
-- 
2.20.1

