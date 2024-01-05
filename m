Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2069.outbound.protection.outlook.com [40.107.212.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A15920300
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jan 2024 07:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JGqTmfOi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SwMe4UVT70udcHb6z9+k9qjJpHf3UmuD+k2EQQXwtxEQpzEgzzlvQYPq9RJzD9Km/H2FAQ4etDiOFupR7t1IkcsMyhHh2DEfV8Z/H0eEhwWa12Ivpd/51tvp82gEH90nDfNmkOsrpRA0iTF6ehRXIiWMDSUcnvM6LQqWKAqPYeyfs9LbPvQE9wyED2219k5NtBu45H5sCrqDAT6zWO6md9YVfodq8Tl8Ql6QSCcdM+5h8Lr4BjttZoDNrppqSBhACUFfuirNUSa7T5Hk2RRyEFxgMKPY9Fy4X3MvxQls0VDCJbIdyENsMx5WafhRY9kMgDy+3fbxLxpdWPSFwvqvPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V1V4jwkYVQnoyORjEzp03LsqASCeSD1SaxZv+yIzzq8=;
 b=S5mrI8CvtvZZsPHvwV1cT2q0ht/+vG/dFjtK8r+SgXTseolhJbkl0c06GZBASkQsY0gh6DBcV4hN18CJSuS8aonZpHLvYWy7GrLFl1LE9hYV4GRzuKv4v6H+4VybDajzIJl0W/4N3WhhzE5ud8rDD1CFyhfErMFVQQSnBOR82NA32Rn7k0NOZ24G4M4EgKnCIdfXHYEEDJbST+kUVBO0aITMClT5QOiPNHlYLWmsDBpCgfpgLG9Y4bdXksVPp3ZL+F3yCTKyTkySuDR369xW1lO1B6wyckutlfDtzUT1gp2L0Sk4tC5GSyAqel15KBk3i0aoINPcwZMyU5rio7SS2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V1V4jwkYVQnoyORjEzp03LsqASCeSD1SaxZv+yIzzq8=;
 b=JGqTmfOiDbKH+M+GM7F3GktRISuxro4VZu1DJB/LlOy92OpEMXDyg2KfyL9fOwwcC5xni8LtpIVIInhWxId3v0wLphHAHcSenZctb5lN+4C0RuoV2e6xlQMi7tqZMXA0SEt++uq0WXndN4gRuORw+2P5ftS7RWr5txXOyb4Qt7g=
Received: from BL1PR13CA0115.namprd13.prod.outlook.com (2603:10b6:208:2b9::30)
 by DS0PR12MB8814.namprd12.prod.outlook.com (2603:10b6:8:14e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.14; Fri, 5 Jan
 2024 07:46:44 +0000
Received: from BL02EPF0001A0FB.namprd03.prod.outlook.com
 (2603:10b6:208:2b9:cafe::fc) by BL1PR13CA0115.outlook.office365.com
 (2603:10b6:208:2b9::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.9 via Frontend
 Transport; Fri, 5 Jan 2024 07:46:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FB.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7159.9 via Frontend Transport; Fri, 5 Jan 2024 07:46:43 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 5 Jan
 2024 01:46:42 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>
Subject: [PATCH v4 0/9] Add ACPI probing support for HSMP
Date: Fri, 5 Jan 2024 07:46:09 +0000
Message-ID: <20240105074618.1667898-1-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FB:EE_|DS0PR12MB8814:EE_
X-MS-Office365-Filtering-Correlation-Id: ea59cdf7-fce8-4816-e237-08dc0dc27656
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WVAyOQEhXD3rUJ6MAFRwyAMkqP7KQnZ1PzuJdF3cYC+eiTIDeutTBf3jvNDU67M05oBAfqbCBJiCdR1DwKQq9+MJAwCy6Cn+VOLhgq4sIH//KPHLazei3vg9I252dk8EHsxugNbDeJ99dchG5v+VOWjVo4DBE3oOpD5FWkDRCqc7YXvRLE5ctARD0CCWWxxYz5yzuxL1DM4qHeO27IT9MhPa3VQHxOIqm1ztJd4JVwrqeSTVVMMgAi3QnSZw3SopkunqSvpF2cVL1lss35yiE+V/foaYvPVoWm5jNvctXLiTJ5JvfVI0Z7r9e2FjOabQOfeS+7ZI9i8Nr/ALyE1n7QheLbjGa8ZAYcooZ7yD5lrzZje1HK8m0+AtS/tASWNvQs/x1mD19zVpw2swU3vWDyuFvEcna37OBRhoN3CtBL9zrwrRCQz9cikjMKKR1K3F7ls/nvys5+TW6vBR1Frw+0af/4xRS1Eb0Quk+7fJtpsCEZmdez/rmBjuJvJFvyByMA8zOI+li5rTp+kF+X6SXqdGlLucVRPUD428IIgnfS/U2aD4RBBWqbwHVqpPp3CU6IRBxAQdduN3MyUEP4nA8vQKQ0jV2tNo77J1CMz9wY9dsyKC78QE+0fIxbr9WSozhndn74b8j+CNqZViCeVHpOEztDKWn2MVQkDo6ZXv1CRuj22uHe0xqbEF5m5tg3VP/R5v9s7LJgg0J7koVrHuc7fOWCBzImyOv6b+etrE0pGukmddgta8FdyvuAh5MEJnedX5tJXap6cQ1ytbBJJbnA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(39860400002)(346002)(136003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(82310400011)(46966006)(36840700001)(40470700004)(81166007)(356005)(82740400003)(36756003)(40480700001)(40460700003)(86362001)(83380400001)(16526019)(26005)(336012)(426003)(1076003)(41300700001)(6916009)(2616005)(478600001)(70206006)(7696005)(966005)(70586007)(8676002)(8936002)(6666004)(47076005)(36860700001)(316002)(54906003)(2906002)(5660300002)(4326008)(44832011)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 07:46:43.8271
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea59cdf7-fce8-4816-e237-08dc0dc27656
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8814

The first 5 patches restructure the code to make it easier
to support ACPI and platform device based probing.

The 6th patch adds the ACPI support, reading the ACPI table
and decoding the data.

The 7th patch adds support for non-ACPI based probing on
family 0x1A and model 0x00-0x0F as we support both methods.

The 8th patch checks if number of sockets is not more than maximum
supported sockets in the system.

The 9th patch replaces devm_kzalloc() with devm_kcalloc() and few
cosemetic changes.

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

Patch 8:
Check plat_dev.num_sockets against MAX_AMD_SOCKETS.

Patch 9:
Replace devm_kzalloc() to devm_kcalloc()
and cosmetic changes.

The patches are rebased on
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
No issue found.


Suma Hegde (9):
  platform/x86/amd/hsmp: Move hsmp_test to probe
  platform/x86/amd/hsmp: Cache pci_dev in struct hsmp_socket
  platform/x86/amd/hsmp: Create static func to handle platdev
  platform/x86/amd/hsmp: Define a struct to hold mailbox regs
  platform/x86/amd/hsmp: Move dev from platdev to hsmp_socket
  platform/x86/amd/hsmp: Add support for ACPI based probing
  platform/x86/amd/hsmp: Non-ACPI support for AMD F1A_M00~0Fh
  platform/x86/amd/hsmp: Check num_sockets against MAX_AMD_SOCKETS
  platform/x86/amd/hsmp: Change devm_kzalloc() to devm_kcalloc()

 drivers/platform/x86/amd/hsmp.c | 579 +++++++++++++++++++++++++-------
 1 file changed, 463 insertions(+), 116 deletions(-)

-- 
2.25.1

