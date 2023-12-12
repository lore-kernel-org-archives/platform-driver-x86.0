Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dO4DPiby"
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2046.outbound.protection.outlook.com [40.107.223.46])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C929E9
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 Dec 2023 07:13:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mYxtvdsBvUyrzMTitjxUYlLPUZZrvlr0OCl69ToLaJScsxmhkHOmBGWS0JrGF+HfqEFqr8tu1nIpDvSxxrIYU8bMJRNpkv4FOPTasYP+8OGC7RcVlzq8r1DleYjHVcoeLM5DUDu2OAYQr1F2zTNb5UvjgGlqzZHzS8JU+uPvg+ETGGmVNLqsPE43lAWuvLCytdU1NPQISiJEOyndhjPKfO4g2PbahveWN/Hgyqn14eT8+wyrpqJ8ziImSW+OQKvtgB4YctNujqRZY02d1aoe66d2qm8UtD6mZvXrP+mUuVeOd4+WMewZp+ZXzT53WSomCq/7lw/iHPcd05gHnj3Yig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BYy/PxmvFUHhK/fgaB/CyiFPJvqs1urUXtZPcjobGww=;
 b=ME/Or4ng2NSV90IC5M7U98UlBmASq3Spk3kTTLr/nk4O5ovSTsTHkEoapqjgC50s9FMd6feWnbGMiYd+fvaulvD588awI+EfPyHN1eDdnHJhkL/SaB5Id5GKaRssWot8/kKjYuGZ6AnnnAZ4TuIOjOhZAycQnDg1Mc5Eb1DgYK0o1f2m35c8Oec2mRlvYoTyKs9ZdHWC1I74VVCp5tjElj+A0UERXLwEvOs73Qb/U2SRAVcVb9ySs4zQkfrCUXyrQY40aZ8E5e50PktrmOUXv9xSCF/hdQR5s132tSo1key6B/sHo976OKHDHng0O1dOGDsgCrWCsjdzdMvULzaN6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BYy/PxmvFUHhK/fgaB/CyiFPJvqs1urUXtZPcjobGww=;
 b=dO4DPibyben7aOQxJvnaiUedFxTfaMmYXVPwt2UI1shv1Ospe0pBO8KhecLb36sgjCa4QS5qU9iJAp7xuMn1pLm7siDuZi+AVy4TdPYph6Tn9UBtI/pFhVC5M7MoLFjvW+/qAs5H9DX3iD4QHv9pk1zNXWU+c8eC4eF+nH9pKMo=
Received: from DM5PR07CA0089.namprd07.prod.outlook.com (2603:10b6:4:ae::18) by
 DM4PR12MB5373.namprd12.prod.outlook.com (2603:10b6:5:39d::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.26; Tue, 12 Dec 2023 15:13:39 +0000
Received: from DS1PEPF00017093.namprd03.prod.outlook.com
 (2603:10b6:4:ae:cafe::6e) by DM5PR07CA0089.outlook.office365.com
 (2603:10b6:4:ae::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26 via Frontend
 Transport; Tue, 12 Dec 2023 15:13:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017093.mail.protection.outlook.com (10.167.17.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.26 via Frontend Transport; Tue, 12 Dec 2023 15:13:39 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 12 Dec
 2023 09:13:37 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Hans de Goede <hdegoede@redhat.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
	<ilpo.jarvinen@linux.intel.com>
CC: "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Goswami Sanket
	<Sanket.Goswami@amd.com>, Mario Limonciello <mario.limonciello@amd.com>,
	Kieran Levin <ktl@framework.net>
Subject: [PATCH 4/4] platform/x86/amd/pmc: Disable keyboard wakeup on AMD Framework 13
Date: Mon, 11 Dec 2023 22:50:06 -0600
Message-ID: <20231212045006.97581-5-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231212045006.97581-1-mario.limonciello@amd.com>
References: <20231212045006.97581-1-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017093:EE_|DM4PR12MB5373:EE_
X-MS-Office365-Filtering-Correlation-Id: 46b5e899-658b-48d9-cc17-08dbfb24ebc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	r6hcsAosmrzQD/xFPpDMNhA814bOuyfmaFPAx/hqx2nGrQfaxZvEm3NRbC1mFDXeuu7wajxT4TmUtp9NctmGQkSzFMJ0IPhKZxfoscvJyoBgVgMx3vZUcfqLCBbyGodmEqe6E9zhJTqNeY5NNPNZwyovxju5Z6bF32aMVthG8iTA0+cfkfFdla7V2aQjkguFAZJEu6jF2g2TvWs470Zcevqd7bw7wS42MT+zDykYFJrj31P/MqJNugljUoaoLEaElZDpi1Yrk0HY6zX4Q0/Nejqhholye+I8P0egmx+IxbyjEwPycg6cde6F0CsJYZqJGAOTJd5jLX4ZQUbYUwrLhl8YeD5AJYsV/4DfPxsmu0lngId/6dkVSLLY3edFxRB/QWgIo23bWvD85LoTftN53ifuYg3sX21JISOhEde6yovlJuBV5R7yqqLa9AAiNDxGiHn/2A/0D1HcGY1CpvX05fd0tmlNCaIVy78NIgNMP37wItqbl6ChjnoCLWpujc0ndFuDNzZNyJBSd9CijlaPM+KsT+7jTZmW7e2j2/uOsqYE11pXpj/s4nlxEhe7oiHbf7EW5tow88W0Jc2HwzBCmpviQS60yg8hxV4oWvUaVZ4uZ6pHEM9ei6kPp1l6Ylm2D0PTw2MWafSWC+y+ZHLWMb/SfUOKxp6kALawF4ACRWl2Vmj0IgwiWLRfeVr96gmd7iGJ9348DgQedvTMaAe2hkqIJZYxPI4YhDMOZzN9c44lMnZYaCmVNilRXmFv+/78
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(39860400002)(136003)(376002)(230922051799003)(64100799003)(451199024)(82310400011)(186009)(1800799012)(36840700001)(46966006)(40470700004)(54906003)(70586007)(110136005)(70206006)(41300700001)(6666004)(7696005)(1076003)(16526019)(2616005)(336012)(26005)(36756003)(426003)(47076005)(86362001)(82740400003)(356005)(81166007)(83380400001)(36860700001)(966005)(478600001)(40480700001)(44832011)(4326008)(8936002)(8676002)(2906002)(5660300002)(316002)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 15:13:39.4951
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46b5e899-658b-48d9-cc17-08dbfb24ebc0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017093.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5373
X-Spam-Level: **

The Laptop 13 (AMD Ryzen 7040Series) BIOS 03.03 has a workaround
included in the EC firmware that will cause the EC to emit a "spurious"
keypress during the resume from s0i3 [1].

This series of keypress events can be observed in the kernel log on
resume.

```
atkbd serio0: Unknown key pressed (translated set 2, code 0x6b on isa0060/serio0).
atkbd serio0: Use 'setkeycodes 6b <keycode>' to make it known.
atkbd serio0: Unknown key released (translated set 2, code 0x6b on isa0060/serio0).
atkbd serio0: Use 'setkeycodes 6b <keycode>' to make it known.
```

In some user flows this is harmless, but if a user has specifically
suspended the laptop and then closed the lid it will cause the laptop
to wakeup. The laptop wakes up because the ACPI SCI triggers when
the lid is closed and when the kernel sees that IRQ1 is "also" active.
The kernel can't distinguish from a real keyboard keypress and wakes the
system.

Add the model into the list of quirks to disable keyboard wakeup source.
This is intentionally only matching the production BIOS version in hopes
that a newer EC firmware included in a newer BIOS can avoid this behavior.

Cc: Kieran Levin <ktl@framework.net>
Link: https://github.com/FrameworkComputer/EmbeddedController/blob/lotus-zephyr/zephyr/program/lotus/azalea/src/power_sequence.c#L313 [1]
Link: https://community.frame.work/t/amd-wont-sleep-properly/41755
Link: https://community.frame.work/t/tracking-framework-amd-ryzen-7040-series-lid-wakeup-behavior-feedback/39128
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc-quirks.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/platform/x86/amd/pmc/pmc-quirks.c
index c32046dfa960..b456370166b6 100644
--- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
+++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
@@ -16,12 +16,17 @@
 
 struct quirk_entry {
 	u32 s2idle_bug_mmio;
+	bool spurious_8042;
 };
 
 static struct quirk_entry quirk_s2idle_bug = {
 	.s2idle_bug_mmio = 0xfed80380,
 };
 
+static struct quirk_entry quirk_spurious_8042 = {
+	.spurious_8042 = true,
+};
+
 static const struct dmi_system_id fwbug_list[] = {
 	{
 		.ident = "L14 Gen2 AMD",
@@ -193,6 +198,16 @@ static const struct dmi_system_id fwbug_list[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "HP Laptop 15s-eq2xxx"),
 		}
 	},
+	/* https://community.frame.work/t/tracking-framework-amd-ryzen-7040-series-lid-wakeup-behavior-feedback/39128 */
+	{
+		.ident = "Framework Laptop 13 (Phoenix)",
+		.driver_data = &quirk_spurious_8042,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Framework"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Laptop 13 (AMD Ryzen 7040Series)"),
+			DMI_MATCH(DMI_BIOS_VERSION, "03.03"),
+		}
+	},
 	{}
 };
 
@@ -245,4 +260,6 @@ void amd_pmc_quirks_init(struct amd_pmc_dev *dev)
 	if (dev->quirks->s2idle_bug_mmio)
 		pr_info("Using s2idle quirk to avoid %s platform firmware bug\n",
 			dmi_id->ident);
+	if (dev->quirks->spurious_8042)
+		dev->disable_8042_wakeup = true;
 }
-- 
2.34.1

