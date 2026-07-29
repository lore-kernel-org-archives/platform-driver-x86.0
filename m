Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010014.outbound.protection.outlook.com [52.101.46.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D714D90A0;
	Wed, 29 Jul 2026 16:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785343269; cv=fail; b=seYmHORZccbfLgWAOC4mOxAo8UHB/tUNyKs1KlbPCk/5bm9SZFHfPaHS7+8Mm2rdTxwi0sY6obk+i/O1JczZWwc3eSEVWa72iWvhbO3pfH6rCW0tKdP3qHsfRpuJQFFx7WHQTGfPx0MUvDW0Cfm8xCPQ3asyz3iKq61vEz01Qhc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785343269; c=relaxed/simple;
	bh=h/5eQ2iPRgJEv1ZJEhcjY63IXkUjEkfGdAr3WIpHHsk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y4oSok3jjz5xc1FVt+9fBegBC7wdk0GVur1jgWAytJEKoDi2EoYZOzJaYP9O+L6NoLI3nAx6sDsqgEAfvnxocm4fsWzTAxgnrqYjliTbMLDjodKD0ifPyU2NE02ftPn0SM3Q/GCFi+lIaIc+GCojJy8aQzDXqprA0Uv4/egZmA8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=y9sm+ALF; arc=fail smtp.client-ip=52.101.46.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="y9sm+ALF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PAsweh0O8EO7lc4SDLau4gbBRnLpIu6rAUT33FSY60+B5TP30vv+zbjKjiwYoITXCcsw85JR+dVuCyflCX4mgjYGGnkJT5kT4/yd9cFTUemEWamLepzLCriKqCruE3vz9/Bdp21qO7AbR8AP0ssaS7A0t0j9atefHE8LIpgb4LXRS0e42QCtR6yZ3fdTIdl8QSKWYKPoYUVV0alwO8kfgM/nQLuZqXCPFmSJrxbJhonVigebUlAFAzbfMYdeFT4p5sZGXuRGcnAHdJOfMhqprNfXfjU7xLKDJ/NXEGpY3Nhu1A5KleGtlQMFA96rsSNneuVhG2iKnvchhWWVdbtIJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/obUWUINCojMmPiH1VMPDkyefy5dNzBu0Wj+5kByWw=;
 b=qfRqZZlGjRRZj/UybVBc4G0pKT8vSSQnYIWLJ4Fm0FhauON7EE/6bN/HwIckZ8n21/vn8EJMRz1Bnq837lMPX9I0+CwRgixrc9dQLMHa7SNSCiuVDwgL8T56pAF80BB4otGeG9AprDSHMKd/bq/aaTjHcpW4VWZsdAE//cHphGDODFLKlmAfPERaNmosnbu5aoMSidqXfaW6kl3/NJxxDwyhWsj9Cs8WyeYFhrg/VCLAmazbT0cQk5xDeijnWeWcn5TaVNyPDh7yvBWLEhGf5KsXCVx78/xGIwg7XF+wqNiN4YeJdTNlR2C37MDsp5tqSgcd1m9BW5JONJHAW+IlBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/obUWUINCojMmPiH1VMPDkyefy5dNzBu0Wj+5kByWw=;
 b=y9sm+ALFiMc9VH02AHN6qsxgAiMpd91vx/9pMqFUhsBfNrpEblOW0SUuyhdKWnJ44yURjnASl/rQeyiYCuz1JJ66roIPrw9wF+KJzGNLtBgnLzlVNrZ57n/BA9Bz7/y0zP4nowKb44dHcTzWziglzSEu2hBeaXrWhL1Y5x57xL8=
Received: from SN7PR04CA0004.namprd04.prod.outlook.com (2603:10b6:806:f2::9)
 by BL1PR12MB5804.namprd12.prod.outlook.com (2603:10b6:208:394::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 16:41:04 +0000
Received: from SN1PEPF0002529E.namprd05.prod.outlook.com
 (2603:10b6:806:f2:cafe::93) by SN7PR04CA0004.outlook.office365.com
 (2603:10b6:806:f2::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.13 via Frontend Transport; Wed,
 29 Jul 2026 16:41:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002529E.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Wed, 29 Jul 2026 16:41:03 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 29 Jul
 2026 11:41:01 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<muthusamy.ramalingam@amd.com>, Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH 4/7] platform/x86/amd/hsmp: Leave the hwmon power sensors off on client platforms
Date: Wed, 29 Jul 2026 22:10:31 +0530
Message-ID: <20260729164034.1331375-5-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260729164034.1331375-1-muralidhara.mk@amd.com>
References: <20260729164034.1331375-1-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529E:EE_|BL1PR12MB5804:EE_
X-MS-Office365-Filtering-Correlation-Id: 514608fe-a110-4c15-a11d-08deed902de6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|82310400026|376014|18002099003|10067099003|11063799006|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	O5Q3+wgv3Lge9AF6rcKrhcYMeeLXBThW2BZjVPTKckq/SinWl8TehSZQMnrXDNVS2uPEO3T+dB+ygfXv10l6CuHVn57RuwNhttRGrrceOjHlogv9FAiIaJLLjmE3sPaipL9yzfDpKZmVjyV3CRGG/4PLm22FzdJ8m/6Wv6OtKwozFdEyX96hCCsjFr2jjyCVReIK9gGAmDpX8H3Ng8llcCxwoO3/tgtLkU2REz0pwiQMuNnYNZeNyb9UHBbL+H1rVRGiOhcAnNEBZaIvDudFN8o04U/uz8NICVx5hjHI2/gb62wq97ehojdRg/r1XcPkqIJC7qsd3aombAHeAjkdzAY7Ju9h9JR+pQObSCUrBCQ1+/89g57bAJWJ/Hme08WwEOtprgDAJtDnpeJwj0YFKH95wS35UYFSo7vqBaYE5JKHan/DX/iMMFoQYpdVOpQTfVC8gXL19z8WZ2NHebSljO0+7/jPQsBJDSvWvWnd0S8JHq7sKUHfe+7BtxgNOOQLupBaFnhL05GiOV69khS2J4PK1oHDbyfZ6JhQ/GLjFWlbMDrvxK8stVQTXy0Z5cNCvStPkdvysjPfwdiZJJdJtADiGX7raFJU3GX4IqmCqcz48l2s/YTwhpoMJKeMR6P0+wu714m1fYetR+iDlL0yNPerLZwpZ5K93o4HB93+ZrvpJqzzbf7OUyE/P//cTZoWvO9QAyF85awJmMbdK4Fbew==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(82310400026)(376014)(18002099003)(10067099003)(11063799006)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EYEak8kFczH6so0H/P2ZUWIuG1ouo/c1NMIEkZIIbCOlzZRxgHV7LnCMxALnHDapp0yLU5Xlf71JFbUUoANzC8v1DJiHlcmGxpXTq5IK+FxRa0r0uxGYVOoZ1XzQhd3xOn/ezxbHnFFBh09XqUUePjc5OYwlajrH4mSvJym1EeiBs2f7BUU91yslxGufgEdi8fTeuwN2BICfjM2CYri9Ky9DdKJ4yKMIS+4nWsgYbWJ4SO3YWmvieY4a3KgQlSXCAiqH/uRijO02n9mEbA0I8pzJe7mrT4YkMQMr8gMWCbYBrQuORmlD8VDn0o4xTbJvsmOyj6plStH9JbJF1/JjNDyjHTnznn24HItHvDv5BXDHPipk72T5aHMsh7ZC6ElVXRKqEPymp5VMSIjLfEJHRQK7WTWS9+8BIGyosijQQ9gZILK4vp+t1Gldb6w98LJS
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 16:41:03.3730
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 514608fe-a110-4c15-a11d-08deed902de6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5804

hwmon.c issues the server power message IDs unconditionally, so on the
Family 1Ah client platforms the sensors address whatever the Ryzen
Master SMC set puts at those numbers:

	power1_input	04h	HSMP_CLIENT_GET_METRICS_TABLE_VER
	power1_cap	06h	HSMP_CLIENT_GET_METRICS_TABLE_DRAM_ADDR

Both match the num_args and response_sz that the sensors ask for, so
validate_message() accepts them and the two files report a metrics-table
version and the low half of a DRAM address as microwatts.

The other two accesses are already rejected, as they land on a client
message taking a different num_args: power1_cap_max on 07h
(HSMP_CLIENT_SET_CORE_PSM_MARGIN) and the power1_cap write path, which
sends HSMP_SET_SOCKET_POWER_LIMIT on 05h
(HSMP_CLIENT_GET_METRICS_TABLE). No unintended firmware write is
possible either way.

The client message set has no power telemetry to report instead, so gate
the registration on the platform in both drivers rather than teach
hwmon.c two message sets. Server behaviour is unchanged.

The ACPI sysfs attributes are left alone. They are hardcoded to server
message IDs too, but on the client each one is either meaningful or
rejected: 02h and 03h are the SMU and interface version queries in both
message sets, and the num_args and response_sz checks in
validate_message() reject the rest, including every ID that lands on a
client SET.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 drivers/platform/x86/amd/hsmp/acpi.c | 13 ++++++++++---
 drivers/platform/x86/amd/hsmp/plat.c | 15 +++++++++++----
 2 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index bbf2b9a8a408..57758df9d353 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -670,9 +670,16 @@ static int init_acpi(struct device *dev)
 			dev_info(dev, "Failed to init metric table\n");
 	}
 
-	ret = hsmp_create_sensor(dev, sock_ind);
-	if (ret)
-		dev_info(dev, "Failed to register HSMP sensors with hwmon\n");
+	/*
+	 * The hwmon power messages are numbered as metric table queries in the
+	 * client message set, so the sensors would report those responses as
+	 * power readings.  Leave them off there, as plat.c does.
+	 */
+	if (!is_client_platform()) {
+		ret = hsmp_create_sensor(dev, sock_ind);
+		if (ret)
+			dev_info(dev, "Failed to register HSMP sensors with hwmon\n");
+	}
 
 	dev_set_drvdata(dev, &hsmp_pdev->sock[sock_ind]);
 
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index bc29b0ec18f7..17877e25f43e 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -196,10 +196,17 @@ static int init_platform_device(struct device *dev)
 				dev_info(dev, "Failed to init metric table\n");
 		}
 
-		/* Register with hwmon interface for reporting power */
-		ret = hsmp_create_sensor(dev, i);
-		if (ret)
-			dev_info(dev, "Failed to register HSMP sensors with hwmon\n");
+		/*
+		 * Register with hwmon interface for reporting power.  Skipped
+		 * on the client, where the power messages the sensors issue
+		 * are numbered as metric table queries and would report those
+		 * responses as power readings.
+		 */
+		if (!is_client_platform()) {
+			ret = hsmp_create_sensor(dev, i);
+			if (ret)
+				dev_info(dev, "Failed to register HSMP sensors with hwmon\n");
+		}
 	}
 
 	return 0;
-- 
2.34.1

