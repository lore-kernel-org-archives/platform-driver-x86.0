Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 916B1C05027
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Feb 2023 06:37:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230064AbjBHGhf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Feb 2023 01:37:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229962AbjBHGhe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Feb 2023 01:37:34 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D15F330B22
        for <platform-driver-x86@vger.kernel.org>; Tue,  7 Feb 2023 22:37:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dn6OKAfZRmc54AWW/2013mfqNg7usP5mK9BSOqP3Mj8hQ/bwrEbZI4QCWgYVBTC493oPVPgl3jlJE26KRrLyorH5aaPjKLoW+v+j0Y+wDfZltdmIvh9en3XGpjpSPYUqRtdR10/cU9eL+egzG2aL0cRKYVuJ6Ug85mfp0YhQHzr7cI6NEHBYqSnQ+Fv1OhmwBOjdib4F/In9e5hFkaNOOypoN2TEXfeS5iTpj6QVcTys8K7rIic/Kc/OvTwcIdOg1Ocxskfbx5U8a+aEiaNjJApdQcfo8fArhJv+AT7BFZUiBHdWYPXPouvpzb4FurWeMDW1jTj/yi97N3FOcYoiDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hz0EZ0akay6idePB6w+P/MRk7qF45B9LJ+KuazC5vk4=;
 b=FQT68ovml2289JSkyNoSI5YhDW/H9EhzC6CrBs3p9Co5Tf8of+Eqy5PKkPsSea20ag5o63GaXu5bCwiOMPMeA6KZJjbFdGq8aoO+Nr3M9020JiCaf/0a6vtB74RQwGQU4SmCTixSRtZOxt4yQL9yznDcK02p0NXuBBMLz0mbYNKoOw62WVl0DciCbhYL9wSVaGv4gx7Th/Dagvvd/rhSNDHbpUr7e0eRJIn0zL+EROQ+gLNslK+XuahJYXKFlptEC25jsIQmRqC52amqp45bHF8HqeAJ8Wl43mEqBaWlHGXCvEPhyk5+V9cYI9UfMyLhdQz64OG0A/MRQWOBWezhYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hz0EZ0akay6idePB6w+P/MRk7qF45B9LJ+KuazC5vk4=;
 b=GarmA3HnKX7LuTBiUP9934PEYVMhvpduDImRIFE8pKUJrd3sK0Zd3qP6iSlGxwfClp5OHX9dGSCEwirAF3OMRHJESBPHSxiNGDeuIKVtnVIW1ccN3QGVySGoyroWh+ZXeM3XGoSC03zmm2d+9ITXiU0OI+k/l864xBBES0f/kn9hj3V9nmCMQvdIIqyj32cAMoanV+7N8hFNurFMjVLd88lIu+R4vA8eVdjKlBfXyYSVDXxfLD2c3Q3Soe7ARq1kr+pCYmop5QVSoKUkKItc+PMZ4tW3Pmdx3FeNqJobAne1BXqIdk/tLKFbCMQLYaDtu175w11REG1i5/Abe21hjA==
Received: from BN0PR04CA0068.namprd04.prod.outlook.com (2603:10b6:408:ea::13)
 by BY5PR12MB4211.namprd12.prod.outlook.com (2603:10b6:a03:20f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36; Wed, 8 Feb
 2023 06:37:30 +0000
Received: from BN8NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ea:cafe::30) by BN0PR04CA0068.outlook.office365.com
 (2603:10b6:408:ea::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36 via Frontend
 Transport; Wed, 8 Feb 2023 06:37:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN8NAM11FT034.mail.protection.outlook.com (10.13.176.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.17 via Frontend Transport; Wed, 8 Feb 2023 06:37:30 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 7 Feb 2023
 22:37:17 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 7 Feb 2023 22:37:15 -0800
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 12/13] platform: mellanox: mlx-platform: Move bus shift assignment out of the loop
Date:   Wed, 8 Feb 2023 08:33:29 +0200
Message-ID: <20230208063331.15560-13-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230208063331.15560-1-vadimp@nvidia.com>
References: <20230208063331.15560-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT034:EE_|BY5PR12MB4211:EE_
X-MS-Office365-Filtering-Correlation-Id: 8013ef0d-ae76-4e64-8596-08db099ef3f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xqKFx8kPmwQeNbRO3rfVwcopIzj7heOtazlJnnaUu3Q/HNlWmWt7K77zj0l5QxD1bKrws1jd1IUmkCk4qCOUg1YF/yPvxLKU5Zy8BQsxIy1xhWUO20Ml/pk8Z5pDjlS7ofOQDLAdAjCEMS5AphCZHIEcbkIPH//HII/RQ+ImmjWg5RpZt0PRGYv4uNQqz6Y2lVFSLFdnVa6W87zp79bBWMaHW1CsLKKv26ELm2vHMAVJzekBo5wCwOudJIFC1MfAZhScmpNu2U6a11eVOGRJWH1mCWxB+QPnQNFNXng7tod5Va0BW7GI+VEus7PToL47HXtWq4F0tocICn91FLuqZjZ99ljfprwX2lXn3Ut6zJBIamWndcMELxwCNQNJA94DUTgMleSOdJu3Jv2Cgcwul/lo1+CV3UsLx8YQWQTKzijbBGwzarO2iS9xaYY8DAB/iYMJ3kkzYw5+SmxN/9AAPAJtvLx4LLHfE3oskzYTDBgMlO7ouzdCuTVRLDOtnWM4G4jfSXVB8bHoJvwwJ0Z7Bl4w3gY//Au9kUU9btEstjL2n7+erj4LA4ls3Dev0Df3reAWa4aARrxTH0MbPdaKPD/0jJUxcSJ4qx0HnmkRXlqV+J1tqj2/djxZ/8hqODkK8QADoHD5w7+lUZSEBTKpF7YaHfMrpB0QYxeySEOMRK43/LVKbpTtz40dTPGJknU+TRdyjck1UfH5mcU1jAqNmA==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(136003)(346002)(396003)(451199018)(46966006)(40470700004)(36840700001)(107886003)(40460700003)(1076003)(36756003)(16526019)(186003)(6666004)(82310400005)(26005)(8676002)(47076005)(7636003)(356005)(54906003)(82740400003)(36860700001)(316002)(5660300002)(40480700001)(2616005)(41300700001)(8936002)(2906002)(4744005)(83380400001)(426003)(4326008)(336012)(70586007)(86362001)(70206006)(6916009)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 06:37:30.3175
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8013ef0d-ae76-4e64-8596-08db099ef3f3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4211
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Move assignment of bus shift setting out of the loop to avoid redundant
operation.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
 drivers/platform/x86/mlx-platform.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 482c62988a6f..1bf9ef6e8c97 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -6008,10 +6008,11 @@ static int mlxplat_mlxcpld_verify_bus_topology(int *nr)
 		shift = *nr - mlxplat_mux_data[i].parent;
 		mlxplat_mux_data[i].parent = *nr;
 		mlxplat_mux_data[i].base_nr += shift;
-		if (shift > 0)
-			mlxplat_hotplug->shift_nr = shift;
 	}
 
+	if (shift > 0)
+		mlxplat_hotplug->shift_nr = shift;
+
 	return 0;
 }
 
-- 
2.20.1

