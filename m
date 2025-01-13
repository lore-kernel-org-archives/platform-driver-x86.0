Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2088.outbound.protection.outlook.com [40.107.244.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A728233153
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jan 2025 08:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736757955; cv=fail; b=hltEbVlZHmcLCvNlAlCaIPy8T7U2iuJdDDgHDXJks4mP6aCh4h96F2olc3ydiUdQRsvu2gaU7hXmcNvRVMx1EkrZ4DxB6LZ/erM7eqhFxPojtoKVC9up2nEfw1kn64QtSZ5+F7TMrqbYJnfF+4hZ6j+AGS+Gvm6cqEqQGafmKEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736757955; c=relaxed/simple;
	bh=slgIsnCDjpuCDAjpbJRmmt6GVWKl6sjvz7ghqpWGR8I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kXjKLX776RLaYoCR+anU3HMxl9sGAB9VaqbA2NWDDkIvzjZo8SV5vJH2HvN17saJO47ro+Rw/cHXOIN2pPZ0xC0At2Wozo7KyxkFnx7Fm5P1CckDXmaqGuARaUYmdIcPRMSNf0Sy9AJCgH9IK+Y4gRaJmy4hmiUxLyJIfCMRvcQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TUrTsChy; arc=fail smtp.client-ip=40.107.244.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TUrTsChy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZtF0y5Pz9zqcUcOFejsyCQBy9w4r6zxwoGOHi6z3b6sWP2RbXeOb0PktqR8r/Rx0u00OjrD7kxfeL6N6QhqadwGH/zEi9ZPdciis6gg8ABcOzWIx23xYIZMzmZ1NbdK8OZ8exgTirri4gt+FU+mMkT4SmH6ux52dlS7zpLKRMSLuG5czNee24gzanCLRaLnR3IWT1fUlvDrtrtgDXCg4OOD8b+jwoTSE7SMC8M/FrpeafH6Ajp2o7IKp3Zi0Sm+4nc3A9hqHnZOTAmgAgyBsNnzkWe7UngjOdMhrPEnO48yL9/rPj81xuwtP1GZTidgdr5+onzGEcYWm+nPrexfKTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/avKyCENM+ZTXtGNAoqJqAQNA0lodrcGv0oTC2FzRw8=;
 b=mhyNmUU3levLV8EbV1+hoI7H6NM2KfUSSGjR4Xm7Ct8Fp0VzQmOinWw33P2mtEwbBmsAj59bjsqfjgblhy/UAWygnHQcsmsbBC9VUdChfmImidvJLYVgK5Cs9Dj5zIXQa1KDSUlPZsYRwjZKi0e6oOiIKcV/lf81G352go9SE0Ogngcjt4jfWvwB5ITZUxac9v5Yur24AuIALlc4dJyrdcGuKdtOokMRdFJu5vvBxo5wyS4kKQCu08Gr9TPQ6xPU2GScY0kPIXtNNkWVUESljWNjR/8NRdiyu5avO5m03hXkXtqodZioyP2nwMmcNBq3nOzN3zV/7llQC8HqQ1ADyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/avKyCENM+ZTXtGNAoqJqAQNA0lodrcGv0oTC2FzRw8=;
 b=TUrTsChyE3kr8KzMhJ21N1jmXXkT9jJ0FhuIZUXH7fwdGwg0zObDgwKqXHX/3Vewy7NlZHKI979IRI0kYHwUXQHvevc68YunFK03YeBYMei7FuGJghPhEhd8UBj0fVIAeWqYMU1xOZsr7k0GnLG62aObtd7qMqiK0OH2atyQ5wRiM6ISXNxTbB7Dg4D3JcEOgRtRgZNaEilGbZxzmK74YynePsnl6BoY5qxOHG3RvvvS2gHbB54rHEDcmINbfKiyt/0K0Us0ikAXzxBe09PIkk7I7lfpn6s7FnATckb+ShIuUEK1qxFZY5py9tRP53YSmtq+IrNJOg6Nt8bGKI2RJA==
Received: from CH0P220CA0021.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::11)
 by PH8PR12MB7448.namprd12.prod.outlook.com (2603:10b6:510:214::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 08:45:50 +0000
Received: from CH2PEPF0000009D.namprd02.prod.outlook.com
 (2603:10b6:610:ef:cafe::8a) by CH0P220CA0021.outlook.office365.com
 (2603:10b6:610:ef::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.18 via Frontend Transport; Mon,
 13 Jan 2025 08:45:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH2PEPF0000009D.mail.protection.outlook.com (10.167.244.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.11 via Frontend Transport; Mon, 13 Jan 2025 08:45:49 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 13 Jan
 2025 00:45:37 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 13 Jan 2025 00:45:34 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH platform-next v2 05/10] platform/mellanox: mlxreg-hotplug: Add support for new flavor of capability registers
Date: Mon, 13 Jan 2025 10:43:27 +0200
Message-ID: <20250113084337.24763-6-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250113084337.24763-1-vadimp@nvidia.com>
References: <20250113084337.24763-1-vadimp@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009D:EE_|PH8PR12MB7448:EE_
X-MS-Office365-Filtering-Correlation-Id: ce10d5b5-42ea-4044-bae9-08dd33aeae1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+Bw5ga14iGq+RBXhjDmBCCIvCGBbXzFdtYbypgp9AxUdjNUTgFEBXF3zxFHt?=
 =?us-ascii?Q?z4ALt5fkHv7tAb6nZ5QS21lbYqsPBEw3Ig7IouWk3a7Gr5Ch9OgSHLT8J6Bx?=
 =?us-ascii?Q?PFND7o9g3rLe0Nak58DKzabGHP0U208/Ym/NP8AU4pWnU7KgFZ7/5FLX5uI2?=
 =?us-ascii?Q?hteuxn29Uji5MovM1w5s2hAmhpqYxVvr0bsjqoQ913PyC2RKLqqowHN3QVyz?=
 =?us-ascii?Q?5EPGa7cYWAScMYPVrFd/DClJ5CRAlsSVVB2EynwWS3GfHFeTXka6yF5BGd0j?=
 =?us-ascii?Q?1TEeCfETVIYmpEZPM8vNKfKdF35zx30aiYQ1PuD0R8HVHggkrNSu44Tf2Yss?=
 =?us-ascii?Q?QlwjvdVBG/EdgSdlFK2vRzNO7foGAU42vSl8wc4hHFmB0qsSJ/qLHUKVkzLy?=
 =?us-ascii?Q?ew8Q0JK9hcGoW2sI3OyFomQpq3A09mg/8DU1P1EtFDUv1goPnT+iRD4E5tu7?=
 =?us-ascii?Q?zy0MLsJi8g4YHgM2m60Eqv2g7XoNQ8tLYh+Rol9z5hQqzc9pXIsFxA5/PgfD?=
 =?us-ascii?Q?vgAv4d1gMsMTxkLnbb4ZNDo9jOTkRMiFjqCzXzn8TaKsykalULmYMu8ImiSC?=
 =?us-ascii?Q?1fFVXpAEs14sLje5z3kQlWjOIbb/llEe0l3crFRsg3HoMzjKCHWF20PirRNF?=
 =?us-ascii?Q?xgsWz+CZ6jeuAAm+XTK+KqL/lGVSR2MviuHaMz2Ln3swB6a6MqZNH52Mu9Mx?=
 =?us-ascii?Q?+PVjFsdiuFIRquiIhKe2f5IA5aozDo4Sztavx8nRPWrEAHh3/eKfRHhS1Gpn?=
 =?us-ascii?Q?Cdku59/JS76xaKHUQsM77O5KZFf4icvVXUbfRV2nBq4T7dZKZQaOCqiEATxH?=
 =?us-ascii?Q?cwQI0b5TXel+RdO6r8U3og4N5A6AVwaZyvkbi4Rlxr1emNpzaBFNqkFp4B4K?=
 =?us-ascii?Q?0CA07VspUz1P+e3hrz1i/xiTiiQR+KO9Iyr92Uq//HX0+FGEmJ45BgWJIMTB?=
 =?us-ascii?Q?r6iEwvKHGVsellf3Av3vmbb0ji1rwMtIw8oj3xSev8ts2vGGVPkMf60prs4S?=
 =?us-ascii?Q?ZwVnJAfpgtfmLOWxOWIcgX2byrU4F38yk25Rs9jnSuZvnpKkygfSv04vvdgw?=
 =?us-ascii?Q?Pbcuy4YWpHFTFCIfwetjTk8pTAVK4cCiiBKg6dLTC+v4Daq/jd3y3V5NCi89?=
 =?us-ascii?Q?CqTGD9jrLb5as5o4iixy8nDbHN6m3AklKfJ9CTUw2Jvo0ecoduRDVwuWM0v6?=
 =?us-ascii?Q?47cQEkxdANbYM3p2TXQXzIT5gMaGYINzlmL/RMsqlcBSESSOnPzo+deQ7wP6?=
 =?us-ascii?Q?7SH6t0FLXvGULg+1x3jFaVJnI9kPCskhE9N35m4zhlcpsQBDvxyRc9YoYdTz?=
 =?us-ascii?Q?V37vX9f1LNozrp/2ULnJSlFzrOEQK6EWTXjBVjP0nxti2AJ9LDBv6s86Y+y/?=
 =?us-ascii?Q?8XNUubDFSDu5GS0xfA+YR8DmYKYmOhSeNlF4EhvElR+z1+wmidf9u9g1P/su?=
 =?us-ascii?Q?kTqs69Wxs4IiACItOjvt2psGfdFyHPzQGOmhPdjHp5QctUT7klVXowzW04+Y?=
 =?us-ascii?Q?GacP6ubkVw80YBQ=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 08:45:49.3269
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce10d5b5-42ea-4044-bae9-08dd33aeae1d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7448

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
 drivers/platform/mellanox/mlxreg-hotplug.c | 23 ++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
index 0ce9fff1f7d4..3e480c322353 100644
--- a/drivers/platform/mellanox/mlxreg-hotplug.c
+++ b/drivers/platform/mellanox/mlxreg-hotplug.c
@@ -274,6 +274,13 @@ static int mlxreg_hotplug_attr_init(struct mlxreg_hotplug_priv_data *priv)
 			if (ret)
 				return ret;
 
+			if (!regval)
+				continue;
+
+			/* Remove non-relevant bits. */
+			if (item->capability_mask)
+				regval = rol32(regval & item->capability_mask,
+					       item->capability_bit);
 			item->mask = GENMASK((regval & item->mask) - 1, 0);
 		}
 
@@ -294,7 +301,19 @@ static int mlxreg_hotplug_attr_init(struct mlxreg_hotplug_priv_data *priv)
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
+					regval = rol32(regval & data->capability_mask,
+						       data->capability_bit);
+				if (data->slot > regval) {
+					break;
+				} else if (!(regval & data->bit) && !data->slot) {
 					data++;
 					continue;
 				}
@@ -611,7 +630,7 @@ static int mlxreg_hotplug_set_irq(struct mlxreg_hotplug_priv_data *priv)
 				if (ret)
 					goto out;
 
-				if (!(regval & data->bit))
+				if (!(regval & data->bit) && !data->slot)
 					item->mask &= ~BIT(j);
 			}
 		}
-- 
2.44.0

