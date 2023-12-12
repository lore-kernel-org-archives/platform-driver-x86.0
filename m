Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="SXQdYdtx"
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2044.outbound.protection.outlook.com [40.107.92.44])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2E29A0
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 Dec 2023 02:38:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DV6FUcy9u9j+T9nc7tp/wxr/az5CnO0AR39V4wrskJ/uUQHxwG8wxTL2LoFbtUBU9h/xRG3u7qlms1l0Hx0OeyrPMfC2MqVXZ6Xr9JrOGTYsyUw1XnsGkOpX/ZWQaCpz9qGjGIQflgTKuxow8G7vW2el80IOh5Ifx/xQS/wFxhIXGomANWsSb585S4Zg7w0/WV9TfTRZ4SjYa2XRvmbbbh5paSoyLcvTmo+jwqZxnyIG4XhQacx9u1kf4flAVxLItr2rqVJss8cXmVzMUG2jYGEiITkHQOHPdo6QYxNCNXe/sN9jPLG5p2gkshRtXSVDmc7MHVBMvOzz9hW8TX2Skg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7b2H3hFZ0IabmRyOrnf1USyq9iUurxz1g0N5mY3fJSU=;
 b=L1RNcV5pUSCO7rf+0K7VgD65A2tlh1azSPHZ44wOVtKF8Bihx+PkqABiaobH9YmmdotdVyovBwBK5TbeRXFI7GW15tH820qyU8xBw+gE8g9gn86RJM7ISXuPyWURpCsXWClTBkIfMELwNHGJZgQaMxDf+H+iS894AMd2q+YS8nVrB2nCVAfaViBzr3PL9idhRziyUACbmEjoWkUNyNKWd95QoH5u3M6/UWka/5wShEdmyjqh4XphSfAMfPZlZ2HU5iAYGXEEUdDJe4EBnTArP9a/ZDCvTC9V+egpXpd7b+v8GVyKVdyE/caXBP4/cgmPY3oi1s32GXrKtjODaXxo5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7b2H3hFZ0IabmRyOrnf1USyq9iUurxz1g0N5mY3fJSU=;
 b=SXQdYdtxl17ShjvkgTlW06rT7P3JrX8/dqV0zbozFvvd1fzukkSWT0P0cYq3olQF61wYJ2p6YaXucTZ8AP+xQSBlAw7rkOYZuZoJGlfu+6KIK5RFVxiQ2JubHRA2/Ot4ktq5I7tylV5oQdt2MyS27rQ+Vi1XKQpbBXZRI3I8Ypk=
Received: from CY5PR13CA0015.namprd13.prod.outlook.com (2603:10b6:930::24) by
 PH7PR12MB8426.namprd12.prod.outlook.com (2603:10b6:510:241::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Tue, 12 Dec
 2023 10:38:37 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2603:10b6:930:0:cafe::67) by CY5PR13CA0015.outlook.office365.com
 (2603:10b6:930::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.21 via Frontend
 Transport; Tue, 12 Dec 2023 10:38:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.18 via Frontend Transport; Tue, 12 Dec 2023 10:38:36 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 12 Dec
 2023 04:37:58 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>, Suma Hegde
	<suma.hegde@amd.com>
Subject: [PATCH 0/7] platform/x86: Add ACPI probing support for HSMP
Date: Tue, 12 Dec 2023 10:36:37 +0000
Message-ID: <20231212103644.768460-1-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|PH7PR12MB8426:EE_
X-MS-Office365-Filtering-Correlation-Id: 601afddd-c2f1-4b86-ec49-08dbfafe7f49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PGEEbTPuR+Jp4dqeIvajRy8G4kus55pNqhGuY5MIvWR18U+NeJ4RopiNOMi8gMROvtSFKdyIkCuipThUxy2E3+cIc2dYOKh4AsXV569Lkw/N5s//A0fGgsmuVM0g+d3Mn+TTkj1D/mzsnwx58udaE0Jq5XCjJKM4D1TXKs5Bs5vrCLZbFGZXxjmjS4T5PrVz+FDvmWR4u/XBZ70RQeL6YHCBhS8SzEiKuGFd20IZ+HlWp6074x+o/z7FtXu02ohOJY7x5v832dkOoIdXe1MGYUha7WnQcXbTVNC12aOJ76RE8eVtyfUfpkhX6drhXoaOL/y3QAX/djICh8I1SQv7PLqOWvv0/yLZTW2OLf9pV2zM8QSGe8qfqQ/BlBR9Wu/M2UgTrq+rbljIpMQr3kW1WSDbtDujVY1lBDUs4PqgAImqECtHu5NgZkL056xQckDF2p4EofFsh+rdwCdjVUhm6f+q+v4lDyeGrTt7nRiIgA+9YSE3u812AH6BR0RlX4ytbMVE3FCEmVzBdBiDD/3E7dwAtJdI65LlIWYA//JzwSzdbXGsd+JWnU9w71tFxCbfxX0zQwKsPWD1+j0WdEeQhlRhGtBeaIEMPHHwu2mZA49lyUyF/FlH8uu+l4ybPxVF0nKZYhT0UVo3AkdLfc3PLCNqe1fXMQJTZvbbVgeyJXn1U54ajmLH/lXCGJ3lA8M260VIg6n81XFgRZtUDLsY75aNg6wsZHcPFHhrGHcuEeyVUajSNgKmSDn2RooEz/aB7cp88Bawl1qEbRu77zrMJQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(376002)(346002)(136003)(230922051799003)(1800799012)(64100799003)(82310400011)(451199024)(186009)(46966006)(40470700004)(36840700001)(86362001)(7696005)(6666004)(2906002)(44832011)(6916009)(70206006)(54906003)(356005)(81166007)(36756003)(8676002)(4326008)(8936002)(5660300002)(316002)(40480700001)(478600001)(70586007)(40460700003)(41300700001)(36860700001)(82740400003)(47076005)(26005)(336012)(426003)(1076003)(16526019)(83380400001)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 10:38:36.6151
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 601afddd-c2f1-4b86-ec49-08dbfafe7f49
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8426

The first 5 patches restructure the code to make it easier
to support ACPI and platform device based probing.

The 6th patch adds the ACPI support, reading the ACPI table
and decoding the data.

The 7th patch adds support for non-ACPI based probing on
family 0x1A and model 0x00-0x0F as we support both methods.

Patch 1:
In case of ACPI based probing, mailbox registers are read from
ACPI table which is possible only in the probe(). So, message
HSMP_TEST will not succeed during platform init time.
Hence, move hsmp_test() to probe.

Patch 2:
Cache pci device object of root complex in struct hsmp_socket.
This will make amd_hsmp_rdrw() work with both the methods.

Patch 3:
Move platform_device_alloc() and add() to a function to make
it easier to add a condition check for non acpi.

Patch 4: 
Create struct hsmp_mbaddr_info to contain all the mailbox register
information for ACPI and non-ACPI methods.

Patch 5:
Move struct device pointer to struct hsmp_socket to isolate
multiple probes in multi socket system.

Patch 6:
Convert probe to ACPI based probing with maintinaing support for
platform device probing.

Patch 7:
Support non-ACPI based BIOS on family 0x1A model 0~Fh.

Suma Hegde (7):
  platform/x86: Move hsmp_test to probe
  platform/x86: Cache pci_dev in struct hsmp_socket
  platform/x86: Create static func to handle platdev
  platform/x86: Define a struct to hold mailbox regs
  platform/x86: Move dev from platdev to hsmp_socket
  platform/x86: Convert to ACPI based probing
  platform/x86: Non-ACPI support for AMD F1A_M00~0Fh

 drivers/platform/x86/amd/hsmp.c | 481 ++++++++++++++++++++++++++------
 1 file changed, 390 insertions(+), 91 deletions(-)

-- 
2.25.1

