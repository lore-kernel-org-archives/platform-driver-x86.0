Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC577C32772
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 Aug 2022 20:37:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231982AbiHWUhN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 23 Aug 2022 16:37:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232097AbiHWUg5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 Aug 2022 16:36:57 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2085.outbound.protection.outlook.com [40.107.92.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3E4DF59A
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Aug 2022 13:20:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BDcCZOYdPn6e0Ahtl7Qud2GPP8qHe/X+k7pKJyOzEvoG2mEu8cubrJ7a3GhQTrg2n5kCWPzvtLHxQCVvf8nTVbpsKhPjTOQmWOId4UiAkrH1oYek9R6Gr07wiHTs8ZBokzYlhb7dciGRR87tc6RUYK/JziCdHiWvSfrp8ji52iA8NRlGJ44mtS4EY2ER6vluyMhqwfZsjWru/3XvNjTh6F4a+aWJLz+5mHrctUbwd+tokMkgf0VHah7Mp3WzMEAEKAcb5QEsiTQJAfbESEDdmHzCXD1+BXwQfD7O9m7jXFQoNOEdGL0BSHV3vu3g49Iq6C7SjpbfYIW0Pl5HgZ/Kmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pg262V8h7tl090SQqCskaI/DqYgRJ0s5EEqvI7s/EdE=;
 b=UuyQ3rrAvs1Jrz2St6Mb7ixDFTiyVLp+4udmgOsxCR/3P2SujYxdG8QVOqWF26jRgPJQhxZeSiD2YSHmwiwOpU2Vq5Abtq5B6M4exIZvnfnVcopgIfx3EWfiyM5uGEeUPsquoBbr0TjWsSn6arf9o5Ia/RoK2MkLDLKPWbQQokQ45JprtTN2RwduWMBuYmHzKe8tm6o/O+e6eiCM8Aao69HPFPAp8u9nsH1wfwW0bJixrQN4ADv8P095r5Ua+TD0jbAQH/gChwuCZwEKHLFoUXM+k6Jmg4XaT0zYFXUQxHL2hfzwO/XuEmb517ljWL5v+RPp85pHG2C1nupG1/yjWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pg262V8h7tl090SQqCskaI/DqYgRJ0s5EEqvI7s/EdE=;
 b=iTxx7T/VjX4Khxnui14X39S4s5jwD6rb+l+G5wBhRT63HcyxwWun1wnqKykWBB+IzP/HIL1kG5fqLrpuwxMNz6LkgJQMkQ7Uqz0sn6tIsRH3SY6uefHYWNRi5ZRke9+09LbGQxOCPhA64wXgSEHersfQlej10n3Rs4j14VqxUktAjlZq1a5FiXCdJXQIusiacgwdYxQYkWo2qvgYp+lyZL2maaPikl2q9PYUJ+2yP+NfMhVLG5n7rn3EjG+NTCCl+boSK4Ap11qqRL0hD5CA2YvYXXI47aJ121acEp7wNcjjOAnOh/rLgWNY24fr5DIvGzqgUAfOJnkmyeBpgfBpeA==
Received: from MW4P220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::9)
 by DS0PR12MB6607.namprd12.prod.outlook.com (2603:10b6:8:d1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Tue, 23 Aug
 2022 20:19:59 +0000
Received: from CO1NAM11FT110.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:115:cafe::68) by MW4P220CA0004.outlook.office365.com
 (2603:10b6:303:115::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21 via Frontend
 Transport; Tue, 23 Aug 2022 20:19:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.234) by
 CO1NAM11FT110.mail.protection.outlook.com (10.13.175.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5566.15 via Frontend Transport; Tue, 23 Aug 2022 20:19:58 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.38; Tue, 23 Aug
 2022 20:19:58 +0000
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Tue, 23 Aug 2022 13:19:56 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <dan.carpenter@oracle.comq>, <platform-driver-x86@vger.kernel.org>,
        "Vadim Pasternak" <vadimp@nvidia.com>
Subject: [PATCH platform 0/4] Fixes for issues with coverity, locking, redundant checks
Date:   Tue, 23 Aug 2022 23:19:33 +0300
Message-ID: <20220823201937.46855-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 864c397d-a4c3-420b-d6e8-08da8544d9fb
X-MS-TrafficTypeDiagnostic: DS0PR12MB6607:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rYRQEUiaWjzIUpfQI2jzYtgrG7qb4KZSc+3mrZKgxyZtJkW2SRE2+LRAFEBRARxSykrtCWCotgH+aYXM8lQ69xDXq1+ylQkK5Svkoh1XP9QMUR49Bkisgc4Lsr1yNvtv6cDN7Jvf0SzBIHpQXgf39MmPBBvoS6UGRv2zpAwsbOppCRG2oivO72v6+ugceZLC9X5D9oM6Uq5IQtiMs0ZTEXJC8EY4J0FOuB+kqK1bo2TCsDu54wAj0qJdgJm0rqDWXSvXe4AA5rHp1U/rl6mnZ6Nl/qlJ01qQylRj5DRLhT0ZZoIc9jsMGc+1KWpLd60ZbCoh8lEm9/bamVVcEOhQZp7b385y+RFPIaa4jxCxugBTuDxVeAQsX1nNStDJ8GaC2JJaRBttcXXCLQUZtDVTMTyaotl9VTnb24ErDMUh4fure55pYT7v6tjLV9wuVHw8/g5xzorxWFgfmI6N2vgCFI2i6wdrSs21n1Ebh9uJ8ufBBm/eD2jHcQ7tHpCZCqJQXN6lRcrZmdhs6KFuA36o+IbBqx6OZHgzF80GxYP0I8pZfnJemeHMXEW75gPrUsFBLaE0U0dLA7Ftdb6Hv7cTtSmXbfjAYx4U/jEuJPzNzX0aMnyEZEMk7Qhh3B/11MSQ7peMes95yBClqlIi6JZDTeC+Ccoxr0DXYj6dVMNT+S8EtVNtzjbgQk9xyCDzWHwSb9b9zWVXuUzXJ2htKiKXImOiPt5kWN7lq9bem8sL+37zNLKtJi16gJeOB0qe8+A+eFMKiCUddYiqxcfP7r/Ov66WxtiTsSzYd+8QIYECeWoqpyT/t924AKjoAiMx372P
X-Forefront-Antispam-Report: CIP:12.22.5.234;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(136003)(376002)(346002)(40470700004)(46966006)(36840700001)(47076005)(83380400001)(426003)(26005)(2906002)(2616005)(16526019)(186003)(336012)(1076003)(356005)(81166007)(40460700003)(86362001)(36860700001)(82740400003)(40480700001)(316002)(82310400005)(70586007)(4744005)(70206006)(5660300002)(41300700001)(478600001)(54906003)(8936002)(6916009)(36756003)(6666004)(107886003)(8676002)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 20:19:58.6683
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 864c397d-a4c3-420b-d6e8-08da8544d9fb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.234];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT110.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6607
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The patch set includes fixes for several issues:
Patch #1: fixes coverity issue.
Patch #2: fixes locking dependency issue.
Patches #3-#4: remove unnecessary code.

Vadim Pasternak (4):
  platform/mellanox: mlxreg-lc: Fix coverity warning
  platform/mellanox: mlxreg-lc: Fix locking issue
  platform/mellanox: Remove unnecessary code
  platform/mellanox: Remove redundant 'NULL' check

 drivers/platform/mellanox/mlxreg-lc.c | 53 ++++++++++++++++-----------
 1 file changed, 31 insertions(+), 22 deletions(-)

-- 
2.20.1

