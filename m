Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BE76EE4996
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Aug 2023 11:46:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234461AbjHVLqh (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Aug 2023 07:46:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235202AbjHVLqh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Aug 2023 07:46:37 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20612.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::612])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D1E1E5F
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Aug 2023 04:46:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oDA+ErQMINanb81+Bmzf0zoBbqiJgwllpYbrAxzFNcpjucQMdI52DsLkePVJj6zeprqFmrm7n06Pbvx3f01E6bdaBoMWZsty25RLZgxxYSzD5cas35OSlb08oTAhAWmJTGrRvWq8HgQBYlJIyLfjyY7dwm5k7uJTtQvsIB+9H52FMxvpNjGJBnnqDo+2Uy9n74nj1rEjAIrddRQEXZhwsEGOPW+NNUiA2YTvkH+8CoFn7DKGuXPxAHzw3dbTS7moMVa5f7WcCNBGbWcah2CxW2ng1GRQTD+4X9K5F4PDjGLh6708FJt/uD8GYwQGt8m3H8fANjfN2teKko45RvolzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rj6wdWcBaPAbNRILTYFgyCBmiR1O9FEQUZrUfEZa6AI=;
 b=JeWJ1/5BY5iZ2wVWwjVLt2BqdGeg9x5i41MCJ4RtVUBdpfPbo0lAHPfM22FqTul2QOegUPnxC20TOQCkoqy/HO7hwzsf1/zGp5HQyE0e8d1kYth2rw8ieK2zu/fZNaHNg3L1KFR7tyqLELRhwtOlD4VlRLWY+C3kd64MLo9WEXxzbjai64jHJ8VPNZnGYNb0ArgxzFw5JdNh6iarNg3nQX7mJL7DJ781FGjxExdCom2AebWcM2BzYBWe9JeCtEHqkQLHpf8NZwn8Dq+9i9rewID1cjC8yySABfk0A4LdMxCD2ZNRsTHtl83CoyY6+SVIBBUqB5wWvnn8fvH5fT9g2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rj6wdWcBaPAbNRILTYFgyCBmiR1O9FEQUZrUfEZa6AI=;
 b=dPvwcoeR+UcVUOcVmQkWCfDI/u56hPgaoMpZ2K+F/c+rsG/avkFtplKqS+/7cwNX41Gkz2g3B+LH3Sx2uLW6XnmQlgr5tR+d2fVLdVqGyuSSUVtxunl9HMYJUqx4BojPHEhcsvqKkOZfGpYgKc8WKIny3WtJTF1TvWkVhr9o+aNxVX/RDD2gJ4E1RVVrlLDRkB80TrGkxiycWLOVUamOy3fk6jqykhjlCIYVrHsT1K+H278BRgrxjba9mW/43gD9yUXx6LFtJyfQeuCqOkp6LPSpOxakrNcAnxDG7xHvoBsUz8d+X6romACZ2ecac+vq2cTWVGygLTDHD//hpaYL3A==
Received: from CYZPR14CA0018.namprd14.prod.outlook.com (2603:10b6:930:8f::28)
 by CY8PR12MB8411.namprd12.prod.outlook.com (2603:10b6:930:6e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 11:40:12 +0000
Received: from CY4PEPF0000E9CD.namprd03.prod.outlook.com
 (2603:10b6:930:8f:cafe::16) by CYZPR14CA0018.outlook.office365.com
 (2603:10b6:930:8f::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Tue, 22 Aug 2023 11:40:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000E9CD.mail.protection.outlook.com (10.167.241.140) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.15 via Frontend Transport; Tue, 22 Aug 2023 11:40:12 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 22 Aug 2023
 04:39:57 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Tue, 22 Aug 2023 04:39:55 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <ilpo.jarvinen@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next v4 16/16] Documentation/ABI: Add new attribute for mlxreg-io sysfs interfaces
Date:   Tue, 22 Aug 2023 11:34:51 +0000
Message-ID: <20230822113451.13785-17-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230822113451.13785-1-vadimp@nvidia.com>
References: <20230822113451.13785-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CD:EE_|CY8PR12MB8411:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c0d3920-29d4-4abf-37e5-08dba3048bd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: juWjiCCuG6+J6fRXHYTU4yhWH68RzOuuHr0PvRQjgmuueWCaShbBWEk8XigWFuTp30mK29Eb6YNC2kQoLNGTMMC7Z4aMtYhSkQaD1E1mR1KPtX3ZzmOY4bj1Wwha9VieDFZneAjIxVapWr887GN1QV8rST5TMHTcVv2lQsLtkYVu44HO6g5kYImTicVi67p8hukcw2c43STALcxVNNZLMEIk60b7NF+R823uhorvqJeYIBn1ijjNkuE+CVRf70kjbLzgno2KcE67m0AMt/GqVFguQUEk7Qa1zuiETlG0v3ZVD/gHkyEioxypsgw+mWoi/ssycB+se4mL/EIrqglw+PHzx1OFIoSSKJfqC8+xf5maQLQ4S9NLHQkxLY3s4yR/bLurR7ghq4xlntqDBd88FYF6xolht1o/JrSh+kI4YG5BZvxKlg5tN3z5THBDhpIGF9zHT1E3BV0bsSvMjbA7bnJlWoda8OH+nm5guND2stn6expWb4toaaC/pBdBR1CGsb/4D4CQVDT6igFZ/CUY5hkubgOCmO01csWDE+UCI5JEn88BcLZ7cF5X+XMidh8kGBXyk1RCHmEw5Hs8+kWwTnzuLvqxs+wxg/F5kOmfQVKPLcqnGn2+5/WU3k21lGFa2pbzQNluqcKwjwzCv5QX66SZlzKWCY5N1lNqzZeWcK7tqamkQI7CAEv732nYHst38xPhWO+AMREJz6fRFkvaNMD6RYfPNnLsKsm67YQcsx5cGWoRWXW/NFauAuuBs432
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(396003)(39860400002)(346002)(1800799009)(186009)(451199024)(82310400011)(36840700001)(40470700004)(46966006)(54906003)(6916009)(316002)(70586007)(70206006)(8676002)(8936002)(2616005)(107886003)(4326008)(7636003)(36756003)(40460700003)(41300700001)(1076003)(82740400003)(356005)(478600001)(6666004)(40480700001)(83380400001)(2906002)(86362001)(47076005)(36860700001)(336012)(426003)(5660300002)(26005)(16526019);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 11:40:12.3035
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c0d3920-29d4-4abf-37e5-08dba3048bd3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8411
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add documentation for the new attributes:
- CPLD versioning: "cpld5_pn", "cpld5_version", "cpld5_version_min".
- JTAG capability: "jtag_cap", indicating the available method of
  CPLD/FPGA devices field update.
- System lid status: "lid_open".
- Reset caused by long press of power button: "reset_long_pwr_pb".
- Reset caused by switch board DC-DC converter device failure:
  "reset_swb_dc_dc_pwr_fail".

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
v3->v4:
 Comments provided by Ilpo:
 - Modify desription for "reset_swb_dc_dc_pwr_fail".
v2->v3:
 Comments provided by Hans:
 - Document new attribute "reset_swb_dc_dc_pwr_fail".
---
 .../ABI/stable/sysfs-driver-mlxreg-io         | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/Documentation/ABI/stable/sysfs-driver-mlxreg-io b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
index 60953903d007..115302236627 100644
--- a/Documentation/ABI/stable/sysfs-driver-mlxreg-io
+++ b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
@@ -662,3 +662,55 @@ Description:	This file shows the system reset cause due to AC power failure.
 		Value 1 in file means this is reset cause, 0 - otherwise.
 
 		The file is read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld5_pn
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld5_version
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld5_version_min
+Date:		August 2023
+KernelVersion:	6.6
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	These files show with which CPLD part numbers, version and minor
+		versions have been burned the 5-th CPLD device equipped on a
+		system.
+
+		The files are read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/jtag_cap
+Date:		August 2023
+KernelVersion:	6.6
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:    This file indicates the available method of CPLD/FPGA devices
+		field update through the JTAG chain:
+		 b00 - field update through LPC bus register memory space.
+		 b01 - Reserved.
+		 b10 - Reserved.
+		 b11 - field update through CPU GPIOs bit-banging.
+
+		The file is read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lid_open
+Date:		August 2023
+KernelVersion:	6.6
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	1 - indicates that system lid is opened, otherwise 0.
+
+		The file is read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_long_pwr_pb
+Date:		August 2023
+KernelVersion:	6.6
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	This file if set 1 indicates that system has been reset by
+		long press of power button.
+
+		The file is read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_swb_dc_dc_pwr_fail
+Date:		August 2023
+KernelVersion:	6.6
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	This file shows 1 in case the system reset happened due to the
+		failure of any DC-DC power converter devices equipped on the
+		switch board.
+
+		The file is read only.
-- 
2.20.1

