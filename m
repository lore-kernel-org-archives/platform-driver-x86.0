Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2083.outbound.protection.outlook.com [40.107.220.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4504642E
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Dec 2023 16:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="phT+E/s8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U6CWnuEFfDlpNHWRb9IglJqUz8qO3zO5SHCnvSHpPejb9ihAq6//HJP07rrK2jxO178UCv4k95SF+vv5NSQI0Ch7r1ZNYP6YJhqkwLsSg/Aeyzzz1SouErA/tgHqJCBi6c33KL6wklaDygDb37Nyx0JUPN7Xvwz3KCFwJtfSxyBpfGN2yMgrIl578qjI6IkOce9U2cL9VHSXmvQDwE0HCZvDx5XKVabIIXltRS8cPfi2u16BTHIVK6HsGBHnHUFL06yCcEANAZ65QSqTmJGJFjUIqNdg0HjrKfOCgaX0NXpywS8DR1gVvJYBJEf79BCG/o5yWYDl0i/9KxVfO199IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=amljbWIWyqkecgzZvC2v0upw4LcjzAroWxdqlHN6yIE=;
 b=G7vL3BGKb6zqW5n6G3pPR9WozwU+OG/NgdCP4Elfik77mGkPT8U4CiT5aQinKm6RwjeNnbc0CH+kpOCXkITZUz08T1ky0xvCZFfNUensW+gMtnMxFXXuGjA04254EJM6lAxMcBFZkLdpGUKqBITJsW+COd70A6mm6vYGTOjKx7ULHYCZDPK7GDhLchpcif1jZCtIoMUsYUrgtguSRtPY2PmgPBWECtOiILdpGr1eYHyPDbGEScvKFDLKmcZHNdoxoWfl7ooFdYLyB3yTenaM0Lf2pj4ZMSXnr3HxHRlzWYi6YKDO8tVH0gF2O5SuSLyLsiLCf8c9e0ueNiEwpEZ+/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=amljbWIWyqkecgzZvC2v0upw4LcjzAroWxdqlHN6yIE=;
 b=phT+E/s8Cow/hTM8oXDyopcjFpBb9NvoZlCXBUn+MdbDQqjeKm3seAVASrCWE2R3K7QVPOF/eZuRZ6z/y/44t7frG24J+c6BNmm/enPK/n53JFTlgfw0KrsLpSYwnUQ0mOfxPS2LK1Fd5MqeH3NCogk7gKWthtgFTR9fMKuI/X8=
Received: from BL0PR02CA0139.namprd02.prod.outlook.com (2603:10b6:208:35::44)
 by PH0PR12MB7929.namprd12.prod.outlook.com (2603:10b6:510:284::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Wed, 20 Dec
 2023 16:55:47 +0000
Received: from BL6PEPF0001AB58.namprd02.prod.outlook.com
 (2603:10b6:208:35:cafe::14) by BL0PR02CA0139.outlook.office365.com
 (2603:10b6:208:35::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18 via Frontend
 Transport; Wed, 20 Dec 2023 16:55:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB58.mail.protection.outlook.com (10.167.241.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.14 via Frontend Transport; Wed, 20 Dec 2023 16:55:46 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 20 Dec
 2023 10:55:45 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>
Subject: [PATCH v2 0/7] platform/x86: Add ACPI probing support for HSMP
Date: Wed, 20 Dec 2023 16:55:21 +0000
Message-ID: <20231220165528.1351200-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB58:EE_|PH0PR12MB7929:EE_
X-MS-Office365-Filtering-Correlation-Id: c97b6e65-658b-4ec6-01d3-08dc017c8322
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IAcevIJUkkeTXCvPvf4RoAP7141zpJdWfc7TfkiDaRZOjNq1ZJWo/V4GL8r1CaOWKFDy5uA6ZDp8fpvy0opEa9V8LcSuUIXECUjrB30ceL0Tb7IfMtxFqaF2f/fg1E+fU43Gp3QPEhKaR2OgC77GSbqs1av53cNkXRp6MwfJMP7T4JJL2WiERiUvzZEl2DyeAXq8GCV1QJ+csFm0kEHbO4+VH8dwBtFZnsrCL1neTGEBPkyfhT4fGiZLalIkk4pwZrZ9kj5STT5zIy9Bsl5LmvegojZfDTZwBJYBEWiqrnN5OsNfQTFfNDhW/duHzhLUai/Kt7jT24Nylg6XGs7CPJ1ghmu1qWaxrnZHajjJ4/V+aZWktIhaZajggEtf/H8L/J+VmuKdwh+1TJQNfyf8A9k2HjBPBreTsM+KXfXbhLoAdAhjTACM3E+9KN8UW9ngfRShl+vs1UVuxy1FMnz9uA+eZEs3TwwE0W2ovXFDVl3JyGN0zqv0cEeQjLGHc9NKSg1j5gKatQ2jAOXkfzDkxBJEM57vflriLOPWonsiAWv3ogSrFvAHcUm3OH26jfhAF0VKrtfBHo09X8Dc8ePMSqa9sbK5J2zsl5uJJiXE2XPBnOG0fS9eTyW6wpFRNAkRzb9vhD5K3SG4rxyk6ikyTQ3KNgqS58sz1Ft6ybynPQkdV8La3wpiXGcOaF30wxHOHKfd5BFv/LXjDQ1eliFzlzUPdtG0OL/C1vHRmiJa8L2zIXoxJtS5lJpsvNMcruyDgzRZFm6olbsZGKYGjFl0fQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(346002)(136003)(396003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(82310400011)(46966006)(40470700004)(36840700001)(36756003)(40480700001)(40460700003)(2616005)(1076003)(26005)(7696005)(6666004)(478600001)(8676002)(6916009)(54906003)(4326008)(8936002)(16526019)(2906002)(70206006)(47076005)(36860700001)(426003)(336012)(316002)(70586007)(5660300002)(81166007)(44832011)(83380400001)(86362001)(41300700001)(356005)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2023 16:55:46.6915
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c97b6e65-658b-4ec6-01d3-08dc017c8322
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB58.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7929

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

 drivers/platform/x86/amd/hsmp.c | 501 ++++++++++++++++++++++++++------
 1 file changed, 410 insertions(+), 91 deletions(-)

-- 
2.25.1

