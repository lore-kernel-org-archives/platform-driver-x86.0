Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012011.outbound.protection.outlook.com [52.101.43.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEACD4749F3
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Oct 2026 09:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791451835; cv=fail; b=bH61ny82YYhuX9kcYK0e5SWTOZozuNhi1MaF/6ZwI+RohkiBj3/OX8FOrMskGERkJwhc069x1EoaTFNHPKfKV+SYutGjGvjvXmoZX67J2C7jpbiGd1ZyDRQA8j8R7IwY+uytrJiDyv3qPWGXmUzaS/Q29MfdpXxo81+5zxcdEms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791451835; c=relaxed/simple;
	bh=BaDv/GYY0bSFocxx41WsN9um1cUQCLPw5gdv4UPWaeA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d52Cdh/A9djM4iUGKH2f/e9bEmCKz21ePih+qy7t3CC9JvyQsY62xXllBkl2iskBS+4e/3MhHyamW/9glJDUTbsvuqAZxi2ruli+bvZfpThtQEheUdNHOv99ED6fr5xqGWB/4L2NlEhQCR1ifkmImWnMDZ4ydeWclZwZm5z5wcg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=d8DRdyMW; arc=fail smtp.client-ip=52.101.43.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="d8DRdyMW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BuhTIa/L+RmjmDiLenvsgRjPDqB5u8xGc9kRXNjbV4I+alA4zi2Gf9w1pN6fPCNndpokyS1qdJlzVRv6hrWxbZschwuFy4FA99qw9eCnbr/C4tzE2jV8vPPWrsOExTG211nrgYCFqnLED8/T1bNcCwYyMl27nUGYH/7+XWOsdbDWv9sso5SMbn8cvTRP6Af3wCtvreMqKmYHFBd/E2Tv1hroYN8xsx08+6iVPc9ESqFjXSFabR1jppPm68EYOGdEqueg6R9IDUYRFSraZnwAcjt87dpaXRPtF3MKpN5SjQsGiwW5UoXIlwcZ5ty2CJPWHa9l+8pBlbPCzccxXOjjLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DA82sSpgYk0ahfjoifD4mmUU0JayTjwcc1N/JwNL82A=;
 b=Rg9Dv7kT6i7iizNlakJltmvJwkVhUPEUT8QAwpBt+dR/S86RR/hZJLuguc+9h4w6k6zAc0Bl0/UN5EyDk+B51Pi75H2SH1kDE+chBd2c7tA7iiy/ozU9F2Evf+eLGgGPc4MxBbkwXuIGCUx6f4CHAXnKv3D+onlb4aWpprzlh5mEzyuk1/0MjH12y5Wboadry8yaY/RBbkBaDXp5aalbvGyqerGyLRf/tSCwq8E6ycC/6SL7yijTog1UN/NBSNYcszSMm2Ku5W25WF543+62fOHhKvYHmdquw0AAWk4te6PtCSUbN/TDYlg2YBQn9RhpwXNbbeRugSpItGl5BzM2WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DA82sSpgYk0ahfjoifD4mmUU0JayTjwcc1N/JwNL82A=;
 b=d8DRdyMWMS+72Rr134U5Osd/AI1SLlDg6Ekw2+WLUbRsJruEGLCtw4UmGv0cIgMBclSVfLRes2BQu6aSrrBJx022gFKK/RyudQfNpP2cGI+F9IKepyEayOH+Kqz7aO0bJ8Lhz133A3XLg5Z4Zi3rZCWnsQZIKcw9mZdnQMNqFcI=
Received: from BN9PR03CA0713.namprd03.prod.outlook.com (2603:10b6:408:ef::28)
 by PH7PR12MB5686.namprd12.prod.outlook.com (2603:10b6:510:13d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Thu, 8 Oct
 2026 09:30:26 +0000
Received: from BN1PEPF0001806E.namprd04.prod.outlook.com
 (2603:10b6:408:ef:cafe::56) by BN9PR03CA0713.outlook.office365.com
 (2603:10b6:408:ef::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Thu, 8
 Oct 2026 09:30:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF0001806E.mail.protection.outlook.com (10.167.245.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Thu, 8 Oct 2026 09:30:26 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 8 Oct
 2026 04:30:18 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>,
	<muthusamy.ramalingam@amd.com>, <NaveenKrishna.Chatradhi@amd.com>, Suma Hegde
	<Suma.Hegde@amd.com>, Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Subject: [PATCH 09/11] platform/x86/amd/hsmp: Populate the bitmaps dynamically for future platforms
Date: Thu, 8 Oct 2026 09:29:37 +0000
Message-ID: <125a323dbb235574e77010f9bfa39072e55676ac.1791446401.git.Suma.Hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1791446401.git.Suma.Hegde@amd.com>
References: <cover.1791446401.git.Suma.Hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0001806E:EE_|PH7PR12MB5686:EE_
X-MS-Office365-Filtering-Correlation-Id: 88e9a4aa-0980-4b1d-999d-08df251ec906
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|23010399003|18002099003|22082099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	QCHcjpvQro4p7G1USmUfy8Gex48ozMjJpH6iiJs0x63JnWMXlCvWGFmKLfy9ohrHaX7LqkAGn64LVZDISMrucFsGihaSwBVCbHYgtQrRKQRT2wJFMTDnnHMxMy0jApPC2Nga+DItOiCFC2izzymtItKG/F4IVjlNLJ2FmyvZjhIC4Bqs6ogktyfdEC08flKW+mshrZ5jovmy/9uVV09ZOfAHe8gdx2KGpJKDqTb2rcBdPD/sP0YfeFfm3cfgUXNWdnUBVPM27jjgf0s90Kdf3pBBQIoHPshbCVWA9IKv6hlQv9hVRTPFSrsWUTDXwbpKZ9G4BvVXbPUxREhHUjmuvWWj73s+zcSBV2VhmL02H/ut+35HTFYgONHNYTH5i3P/liXokeFdjmlgtw7HXIbiQANBTTUyZ9djJbupo/ii/45fUiX31zWro2difHRsZDMDF3KUzrZlZ/1FYmsD9NfbS7PgcMs+1A6r3OpkfqIaWCksNDeZS2s1wXjuiR3j1CbfnmDcUJeCZeOS8418Im/S9J1xQ7lMecxSFKw949Gx8OAcyrewU8eK864NmVfOULhN9C9l2x8bsXlgFvmbfMAH3CFkI9EQuu0J2X0riJtsNvOU3ozrKv21CuwJ8pLuG+c2xluUxESttnln1Gt5+Fig3TWE1vXy+f8wEAqV60f0F/AcaB7WNV4IObd/ruizkP6DR7wovgN0xgkDI70MegaSgA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(23010399003)(18002099003)(22082099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HGErVfSCc7AY4BGwYe/tYrYVz/J7sX58sv1tHqVmc0mD55hm59uz6uKUBpC6mmOi342UQXIah0iwBKFx2YGtvWMz2kbpHH0PqcyRFnBXkmiU9nV/rvMAGwKPJALNR+dmWwfqyv+FvVvkaSrktGvb4buyvr1wO/BWo+DN27NZPjpIH0EIoNsDoRP4//f5YSY3eXtLZiQqKuYZR8/BFqQFwGGuWYhVW1Nd5WjpKz3UMv9OneLvSBUTZQc2ZMTtfU5oApUAUr4pgNCO9vZfIDypR2FTYvRkuizcpnTvj1atB8YrNgjZ39JUnEJRLH7PD8IWk5tuoNXNvT9lDNtrLfINXa2T4plZ6lF3j7qXiNosit1AL1euNSyZv6RG602MDohxrPgp6/g7+PE86vSmagNodunPr50uNik1ziXKFzK1tqm6DCujwgIpIm2LtsCz6XlE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 09:30:26.1405
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88e9a4aa-0980-4b1d-999d-08df251ec906
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0001806E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5686

From: Suma Hegde <Suma.Hegde@amd.com>

Future AMD server platforms are expected to support the
HSMP_GET_ENABLED_HSMP_CMDS (0x37) message for reporting
which HSMP messages are available. This also handles
detection of BIOS-enabled and BIOS-disabled messages.
Instead of returning -ENODEV when no static bitmap
matches the running CPU family/model, fall back to
dynamically querying the enabled read and write message
bitmaps via 0x37.

Add hsmp_set_default_msg_bitmap() which temporarily enables the
HSMP_GET_ENABLED_HSMP_CMDS bit so that validate_message() allows
the query, then fetches the read and write bitmaps from the
firmware.

Co-developed-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
---
 drivers/platform/x86/amd/hsmp/hsmp.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index bb1f98def3fb6..1b34336aa8979 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -904,6 +904,20 @@ static int hsmp_fetch_write_enabled_msgs(u16 sock_ind, unsigned long *write_msg_
 	return ret;
 }
 
+static int hsmp_set_default_msg_bitmap(u16 sock_ind)
+{
+	struct hsmp_socket *sock = &hsmp_pdev.sock[sock_ind];
+	int ret;
+
+	/* Set HSMP_GET_ENABLED_HSMP_CMDS bit to ensure validate_message() doesn't fail */
+	bitmap_set(sock->enabled_read_msg_ids, HSMP_GET_ENABLED_HSMP_CMDS, 1);
+
+	ret = hsmp_fetch_read_enabled_msgs(sock_ind, sock->enabled_read_msg_ids);
+	if (ret)
+		return ret;
+	return hsmp_fetch_write_enabled_msgs(sock_ind, sock->enabled_write_msg_ids);
+}
+
 static void hsmp_dynamic_bitmap_zen6(u16 sock_ind)
 {
 	struct hsmp_socket *sock = &hsmp_pdev.sock[sock_ind];
@@ -976,7 +990,7 @@ int hsmp_populate_msg_bitmaps(u16 sock_ind)
 			return 0;
 		}
 	}
-	return -ENODEV;
+	return hsmp_set_default_msg_bitmap(sock_ind);
 }
 EXPORT_SYMBOL_NS_GPL(hsmp_populate_msg_bitmaps, "AMD_HSMP");
 
-- 
2.34.1

