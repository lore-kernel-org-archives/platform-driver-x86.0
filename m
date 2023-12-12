Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0C7X86Rj"
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2079.outbound.protection.outlook.com [40.107.220.79])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79618DB
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 Dec 2023 07:13:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QiRUYGAbkWmMDEH87qmvBNUtRA33gGxiZeebHLKaoqmCf6w6EeU/KPFx7MeVYtUlWdcZcS/eA3xQ2JGwIvWYRISmfpFm3j34Jg4TqMAU/IOVm6Ljmwwwxj710C3G4duuHuqmAHpjS+wqQWu1g+HjEt2L8a14kX9LtJFTc1DR2PyR5KL7wn/bxwrf2QaM7KwjZug5ENwAiiLdfjF1vQvq1lbfUX/DU8K1QC1okwjlDaH62ZRreFLXXAeNUbtO48+Ellis7h4IS0f0SOttj7vrLTbwuCOzT1TyGssG6MS8mbVWvWInpLpXh0e43UZkk+yQJN4D+Ru+5hOquBaCgvtk9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ktXks/oqsGxhT1nkxlQXt1yFLr88qz3ZUo4Unqc2B88=;
 b=FDTEQ86K8vY4p9KyHbvf35bQiUIYRxMJYqDeNcFLJdsYtwjysygq79/BasOZ0tUjHyfKRG4bwxRjViePvhVxzI0TglBOI54ZjOZ9gjpgG/IhXcrKtQvrEdUylix9TdS2g4NDfJwALXI/cxyvzg+Hg2vrcJzMsoUh0diP5nP4vVHNC8qfxEs2mBsDuNxJrdxaMVheTGyHTVTCAxclyBRns+IvWbUgcM791BTQVEo9mWFG+gFiOXUNDyfwmAWkYMCIfKubxz5XzlT1COK8rpwszmNHEUI7qKCB+xPWZyWdCHp4mmx1n7Irv/TnGLrr8OV74Ar4ucFieqUpaZoqZgFZyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktXks/oqsGxhT1nkxlQXt1yFLr88qz3ZUo4Unqc2B88=;
 b=0C7X86Rje5y1Hf4Kpid4fpj/O35iSoL4LTKhopHs3H1P9I+w7C27cH9xmYjW7vw/5FCbkWqhmxXLmeWBp6ta0gVSXYokRIx1G74o+C8EKB9bYNEs8fPqK2FYlHBMYkRcZ+59uVEH34MTMELlY2YZhO8shdPr/KfLedfEvsMLjxM=
Received: from DM5PR07CA0119.namprd07.prod.outlook.com (2603:10b6:4:ae::48) by
 LV8PR12MB9271.namprd12.prod.outlook.com (2603:10b6:408:1ff::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Tue, 12 Dec
 2023 15:13:37 +0000
Received: from DS1PEPF00017093.namprd03.prod.outlook.com
 (2603:10b6:4:ae:cafe::53) by DM5PR07CA0119.outlook.office365.com
 (2603:10b6:4:ae::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26 via Frontend
 Transport; Tue, 12 Dec 2023 15:13:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017093.mail.protection.outlook.com (10.167.17.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.26 via Frontend Transport; Tue, 12 Dec 2023 15:13:37 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 12 Dec
 2023 09:13:34 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Hans de Goede <hdegoede@redhat.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
	<ilpo.jarvinen@linux.intel.com>
CC: "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Goswami Sanket
	<Sanket.Goswami@amd.com>, Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 0/4] Add a workaround for Framework 13 spurious IRQ1
Date: Mon, 11 Dec 2023 22:50:02 -0600
Message-ID: <20231212045006.97581-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017093:EE_|LV8PR12MB9271:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e21ab65-fde5-4899-dc56-08dbfb24ea6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VRKZ8ueHE6MxoTOofJM0iUxNocuqNEJzppeUDvBQH/UFcow85+1ooT9WOz2GNmc+XI5/MOMOqFlTUJ6UX4PzxEE6LPAEu1ahVGL9F2VBtYu7rMuqnTiMVc42r/fjIT5UXLvnW5W58H7rrAo2M97Avuo6tjv3RKlrTgM/mhkyt0XkUqHZXRmEtHszev6WFvaFMh0IJogv1ajC/znc4BFSYqPT1h2bM3INHezZuC+F1dMIlPF+mGLtBkO7PizpO0fS5URKxhS5EEXbYykhg98aDHlExrr0f0RhsmH8Uk1HY5YxQwVsagg4GzpvZyznbxMVQBT6jdYjQ0x2IuCdfXGoYdrhiDgn14e0IopFopTZR118h3JF6weRSui5xwA/y71XTc+Jzc5z8quU6hKUfsz0vR++vQ7T9NbIyTrJOhyscImojRUUCCh/iK2qZOABlzLeAiAwjUy5ovfUT0vqA4M3jU5es2XEfj3TZE0WbjML5SQ6Da5SN1IGUbQ1M0UwiA73NX76+Avw+My/ovdso4HiOBFrBoNbBjgT4C2RxcyWRATfWdPuf7wQpcQLvsiRlz4RcPf/YpcR/ZaBpYukFGzIA9AyTyPj5W86xKWZ+6ZnQzRVb1MBJhYpTpZimcye7ubX+bvaIw2biZgF6i48F2kJz9b9cqur4K5xXEw+S73088u7+FDWrdygRIjxT2DqTjNzklFfRreoW4Qf6Tz+O3qJeL4ZROrLexWHUCCru3EqPiZ75ebB+Olz9qQlPmxQ/84avidWGgkyrAbwtmT+EMcjxw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(376002)(346002)(39860400002)(230922051799003)(82310400011)(186009)(64100799003)(451199024)(1800799012)(36840700001)(46966006)(40470700004)(40480700001)(40460700003)(110136005)(70206006)(70586007)(82740400003)(81166007)(356005)(86362001)(36756003)(36860700001)(47076005)(83380400001)(16526019)(336012)(426003)(2616005)(1076003)(7696005)(6666004)(2906002)(4744005)(54906003)(316002)(478600001)(5660300002)(8936002)(8676002)(4326008)(44832011)(41300700001)(26005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 15:13:37.2607
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e21ab65-fde5-4899-dc56-08dbfb24ea6b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017093.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9271

The 13" Framework laptop EC emits a spurious keyboard interrupt on every
resume from hardware sleep.  When a user closes the lid on an already
suspended system this causes the system to wake up.

This series adjusts the previous Cezanne quirk (which has a much different
root cause) to be able to apply to other systems too. The Framework 13"
system is added to the list it will apply to.

Mario Limonciello (4):
  platform/x86/amd/pmc: Move platform defines to header
  platform/x86/amd/pmc: Only run IRQ1 firmware version check on Cezanne
  platform/x86/amd/pmc: Move keyboard wakeup disablement detection to
    pmc-quirks
  platform/x86/amd/pmc: Disable keyboard wakeup on AMD Framework 13

 drivers/platform/x86/amd/pmc/pmc-quirks.c | 20 ++++++++++++++
 drivers/platform/x86/amd/pmc/pmc.c        | 33 +++++++++--------------
 drivers/platform/x86/amd/pmc/pmc.h        | 12 +++++++++
 3 files changed, 45 insertions(+), 20 deletions(-)

-- 
2.34.1

