Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2054.outbound.protection.outlook.com [40.107.94.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9CB1BD9E5
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Jan 2025 17:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737739728; cv=fail; b=h1ykVu9Ld4N2xc10/w4HeL2/J0Ok+On7wZfy4Gjsuksc4T6eZhxCdzZkK9ZxhQSQZZ1IAHYMXAbd4nE9Wc00oYmIPxSJ5Adc8cVh7H3IYtr6fnFhaMXy2W+YNFRzPz4Sjh3uiCX42m1etnMlMl8wXr86RdJi/v3h/XSYKh+pUlA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737739728; c=relaxed/simple;
	bh=dM78CiEF10KfQZVdA2uYOU7ee9XL53iHYCd89BEWLec=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qauhKJOJn+6iGzymior54oHaNfvAhkp7TcMLsdreq6QZRftEy+ZdTU9w8dni/LNrtljCyWOHsH46eGFFd/nBXjT0XdHnkzADiLYB+qhdniksNEl+YTqx01Z0+PMhFkuvRN9rs1QkTEgl+otniC0gVXuJZaatjJqrbICILwqQW0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hRfdnqqu; arc=fail smtp.client-ip=40.107.94.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hRfdnqqu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WSyoQYYOWvtFb9CJC1g09UD8r3AI21tg3Si7bhNzu5SzTUkYo5gSILDUui+fbord5rqYfFqm6SJxvdZCZ1+PQrgtYsyZCbS8IgcPfjH3iLIhuQXh981wwOztKbE89KWj2EbamK5zr2+2RvpL+UNFc9Z953j7DRTM0Kj/w/PHqItDxSlMc5Ue521iiWUaAby2TcWA8yHXvraGwM4fB90Y9UXZYJM6tSbLWZpsTgseufmIF1GMEA4HamOnDXBwBNz7Ej0H/+u2HWe6kYQ+ytvdpIEjRiSFd/407vLh6wyvftyyDpRdwl6OECpfjxddIu21T+IfVYNB3D+9appdOJtzVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i1GPICH/CsYgtTeF+91GkQrmSijxAW1UibSKEz4z7ws=;
 b=G12jZbhapzwNFPPHJXapl00wof9na4oBJrrg7vUMsmAxt0flhhnrpQtc9LiLWMgymCyxECu+H8tfx2dkW/5jDr3xyHm9qBBeOq8yCs4N/igdUbpP/CHM6gTEnufoOKptGHuTe5PSKAILwmZKoTUL7EWPxGNJarccjpTZCsz4VCjuOlw5W6oGyqhCyEX4FhsHt3kU/l9J3H5X8NGM6sFjXqm5qTiMZN3WBqAWEI5L1FEIdY7uoVz4j/T6xaniRbyAUEnQXS/0kpsT/z3sObqE43gxVHneK/8LTxJwujQLPqRntmtNJeeuanMfE5P/vJ23UQ4kY4O9IbMJzpxNQ7ygXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i1GPICH/CsYgtTeF+91GkQrmSijxAW1UibSKEz4z7ws=;
 b=hRfdnqquQs2zWowJJFRMuVGQARP8zkw/9RsKlP+c6te8A4mNDgJaazq+IEls8pK1tqJew+OB+9LzRB2icf2WeWRezXSmemVprdyv6YQPNrgW8uHfWjlBEFj1jXlQMc0BBLnyuO0XAFm+VpgE4it3/bCpX62z3rxye7lTSvoHGXwXnrPP9nDe58BMIarMLerRVYewN8FXUukVgZH/2pB+qbM75IUZzywpSoaoM85C87t9BkA5ogayDswttDh3Ehu75AdYE5TZ2ejb2UN1krsD/crRL2q5joasd3qVGcbmZbjrxkoUSXrOlasIHcmol0lSbICs4Uoc/ODamp/VAdaOBg==
Received: from SJ0PR05CA0148.namprd05.prod.outlook.com (2603:10b6:a03:33d::33)
 by BL4PR12MB9482.namprd12.prod.outlook.com (2603:10b6:208:58d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.19; Fri, 24 Jan
 2025 17:28:43 +0000
Received: from SJ5PEPF000001D3.namprd05.prod.outlook.com
 (2603:10b6:a03:33d:cafe::64) by SJ0PR05CA0148.outlook.office365.com
 (2603:10b6:a03:33d::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8272.12 via Frontend Transport; Fri,
 24 Jan 2025 17:28:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001D3.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.8 via Frontend Transport; Fri, 24 Jan 2025 17:28:43 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 24 Jan
 2025 09:28:31 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 24 Jan 2025 09:28:28 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH v5 05/12] platform/mellanox: mlxreg-hotplug: Add support for new flavor of capability registers
Date: Fri, 24 Jan 2025 19:26:23 +0200
Message-ID: <20250124172632.22437-6-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250124172632.22437-1-vadimp@nvidia.com>
References: <20250124172632.22437-1-vadimp@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D3:EE_|BL4PR12MB9482:EE_
X-MS-Office365-Filtering-Correlation-Id: ffa97d1c-63c0-4d13-ffeb-08dd3c9c8cea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?p74hw3F1ADB3trnRpsszs/FLGJct/kxP+P9H4TGAJ750OdDY77U+2ukZeIgJ?=
 =?us-ascii?Q?q8v3fWl8qdlc8n10EnyWuROH9urNg6uZrr40tHfHVQYKQrJ3boMvqNgh39eS?=
 =?us-ascii?Q?18dNAMAKqACcdcv4twvedFoq86acnG3fQJEVY7K5JlktBN6SLROU7FrbjjxT?=
 =?us-ascii?Q?XRQwMv0QOjg608yN930VfXCKKYHRqBETiI2rOEvHW/PKWLC24/PBohf9+lZv?=
 =?us-ascii?Q?F5EumbBmPB2Ft6Ntkg26b1x6iHVAJJt7q6SL5NTRBZHp+JARDQ5E3DQ96Nel?=
 =?us-ascii?Q?irP0A6d2Qf7Srlrxr4ZI7dJTk5TH5eT3itT5MXX+9W+oRottkHco6L9SfCKf?=
 =?us-ascii?Q?FjaV42738yWZJQtec8X22S3lUEqoVw5pX3z3JaTFXaGfH4lomHu7JFdwOU0q?=
 =?us-ascii?Q?RBsriKSh8LaSXDStB0Fvf1uATWg2XUoqZTUHZHsKa9+TUMs4iinkXANzYB1J?=
 =?us-ascii?Q?IzBAFpN16sxRzNYp0g5e4kCGNx8eMlNE6UEcC7jVXeFyLFQmcsrF6LfBgy6v?=
 =?us-ascii?Q?Mf7c8YKGaekIkqAn/2E6KGyLsPsXKM//w7/E5SMddx8+xz5An3/64JcAzf0m?=
 =?us-ascii?Q?DcvxBhpmrof2Je1TQ2e9/sylQh21CwNRDt0L5eMlTQhB5dWvIXmrwzEB4F2h?=
 =?us-ascii?Q?IkB4EZLoxGKWWE0HOt9lRDrG77fOvHMiw/1goRwCfyu8s/51FhkyldZh91ao?=
 =?us-ascii?Q?6OSG1V8Z3kqBkoABPU0y3XXKZMTJ5Tkj5nls3fa8xDfj56gASY+aGhM2Pt+s?=
 =?us-ascii?Q?apWmt3urbTYceiE9TA3Fb6ADe/uekR07znQmjzmaquBZdROHA6Vl8UHNR6/k?=
 =?us-ascii?Q?JM4KHAtWYEZEZEBG0s80yFgjatUtgAoKnE4gRuvhx+ohZ6wu8BdID8IEnIBL?=
 =?us-ascii?Q?KLkDmrp7ngnwxE4DD4o2+7xFbA++SyIJ1o7CC0oevSpMhXpTtXCUYhvITEid?=
 =?us-ascii?Q?BsorEcFbkLNVvCxHnnPTZ8UewGVA8mVHIvWVCVLiz4+piL9zzrvPfpxrCmIb?=
 =?us-ascii?Q?A2aVHy6b11Z4hLfTQ59QtoI/1irzRrh8lXSW8g7CWcUFmOFZzVXxbWh2pmqk?=
 =?us-ascii?Q?SxlRvfEis2753/Cc+1hgveuIeMW+geCv5nXefLCgTMWjWz/WhDSTX4VK37yN?=
 =?us-ascii?Q?xEdPzL/HcQNqwUYpsh3YeySQxo+QT/Hi4roraPj+TfU0HYRP9pni0SZZXrwz?=
 =?us-ascii?Q?YuhG3yXpas8MyfEdp76Kk11OEi0ZgCYz0RVd57L2ztc6vYA/PvtFokSCLbtc?=
 =?us-ascii?Q?1G0SsTTdVPgPYwtabEQKT+45f1XfCk9QlARB483KCEZVp1k2y8upKKu1HHQ8?=
 =?us-ascii?Q?PfMR3mxFBdBt3fQ5wg2v0Pg9j6/rC+aZG2G2GWR8r7O/eKuKwBPAyXRXlnSn?=
 =?us-ascii?Q?FOPO1Q07epCn6gFUr2xCFwoanUGuD+ccYXQFQ7aZCoTHooR6jiRgLOGX0AdW?=
 =?us-ascii?Q?Bs0eh3xO4hbXRdU6gPzG/8c8GqOTUzH5QWUkGym5euUr+x3V02Be6TYrE9hy?=
 =?us-ascii?Q?08wUc/32GB0o1iY=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 17:28:43.2941
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffa97d1c-63c0-4d13-ffeb-08dd3c9c8cea
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9482

Hotplug platform data is common across the various systems, while
hotplug driver should be able to configure only the instances relevant
to specific system.

For example, platform hoptplug data might contain descriptions for fan1,
fan2, ..., fan{n}, while some systems equipped with all 'n' fans,
others with less.
Same for power units, power controllers, ASICs and so on.

For detection of the real number of equipped devices capability
registers are used.
These registers used to indicate presence of hotplug devices through
the bitmap.

For some new big modular systems, these registers will provide presence
by counters.

Use slot parameter to determine whether capability register contains
bitmask or counter.

Some 'capability' registers can be shared between different resources.
Use fields 'capability_bit' and 'capability_mask' for getting only
relevant capability bits.

Reviewed-by: Felix Radensky <fradensky@nvidia.com>
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
v2->v3
Comments pointed out by Ilpo:
- Change rol32() to shift left.
---
 drivers/platform/mellanox/mlxreg-hotplug.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
index 0ce9fff1f7d4..c525b8754d48 100644
--- a/drivers/platform/mellanox/mlxreg-hotplug.c
+++ b/drivers/platform/mellanox/mlxreg-hotplug.c
@@ -274,6 +274,12 @@ static int mlxreg_hotplug_attr_init(struct mlxreg_hotplug_priv_data *priv)
 			if (ret)
 				return ret;
 
+			if (!regval)
+				continue;
+
+			/* Remove non-relevant bits. */
+			if (item->capability_mask)
+				regval = (regval & item->capability_mask) << item->capability_bit;
 			item->mask = GENMASK((regval & item->mask) - 1, 0);
 		}
 
@@ -294,7 +300,19 @@ static int mlxreg_hotplug_attr_init(struct mlxreg_hotplug_priv_data *priv)
 				if (ret)
 					return ret;
 
-				if (!(regval & data->bit)) {
+				/*
+				 * In case slot field is provided, capability
+				 * register contains counter, otherwise bitmask.
+				 * Skip non-relevant entries if slot set and
+				 * exceeds counter. Othewise validate entry by
+				 * matching bitmask.
+				 */
+				if (data->capability_mask)
+					regval = (regval & item->capability_mask) <<
+						 item->capability_bit;
+				if (data->slot > regval) {
+					break;
+				} else if (!(regval & data->bit) && !data->slot) {
 					data++;
 					continue;
 				}
@@ -611,7 +629,7 @@ static int mlxreg_hotplug_set_irq(struct mlxreg_hotplug_priv_data *priv)
 				if (ret)
 					goto out;
 
-				if (!(regval & data->bit))
+				if (!(regval & data->bit) && !data->slot)
 					item->mask &= ~BIT(j);
 			}
 		}
-- 
2.44.0

