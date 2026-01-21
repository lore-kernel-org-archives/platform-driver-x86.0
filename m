Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011067.outbound.protection.outlook.com [40.107.208.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F597217F33
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 Jan 2026 14:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769007173; cv=fail; b=QhPm776Q9taYwyqeCD4J+IsSDzv7xuXxfcFzpSfkkkt0Hoat3PtMXRC0OLsgqrdQ7JoVtFxYXZIbLD5VHi+Pfd8McACJDe6vJKp+i8HjYTl8L3ZMfkkpq3zY7FwCHXI02hqc+NUyUnDCw60yv1IqcCkcu4DcZf67pyEVx+8Fw7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769007173; c=relaxed/simple;
	bh=SrCvOMe6bRIVhXcpuMQhZAezTNTLrGaH7vOQluFzsQs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jo20Bwb5AvSuIh77zXdsRWt3RlemUc/+uwtn1ZFt28ziS6wo46gE4GWxooDSLaTcY1MBNL1W2oWuVTk3zKbnTub951/YIWw+PJfWqrn/sxlpe75Uckged3ZGlqj6g35+Gzjxu8DN/xvh+D66BJsMTPs3YqSoNohdQkZPpHqQfrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XVpKzZm5; arc=fail smtp.client-ip=40.107.208.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XVpKzZm5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HptXoIVea6FaRnxYr5WchRunoY/kZ9wEgkCyVZmVNj+5P/D/F94Lo1/B2P2MS8qmfUhahBIU73a6Zp13PfvPjcrdTjNg6x+4AWWwlQD6P+cKadlD/gZr9HHsiPhUbi2MLR+xbzkTUeWzSXrQF60SQ16f87lgXWDp0OT7ERL1I/SqqVSjJCtV2AOrDDC02FU0y2/5qUcQCLq2NWjmt9ZUnC7pH0SZzaMpbolMVluKlDH+hizXhnwc2MgIgPXrx8wf9eZ+eMTAjwgX9Vo3bCzajOGkqbry8OSORHdI3IR70PVaNrJD+nfrvoRzQSegMTaZ445TLKkAr8bIW9jI32vL6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=urNZSE2yvaxLSGSzgOqTXIq5c8f73QcXHA1Nfgj3aDU=;
 b=jfi0lhhI2Mu0ZUhcezrK0W8DOpHiux5QIMJcub+pj24eMcPvQ0cSBW87fMh4LeNJJyt2QYg7CNyGqNLqCz1pBr9DAVYktSV5cHw4Sq1h3+mE1GPQr6i1Xvjof76kEAyEtkkHdr7aLufDyEfxMQfZc64XrAOJg0G17DXpkWvPvpS1tdkd/5nBeT0gK4JnWDhs2JFp3+7sQfElgjHhP+VolHeBoxe86K1bXbRqQMM5jkDQKrvyeWXu0caPseepRx5nbGNIUFPs9Cgo4uEB7fI6DBl35YXAXYn22g3RLPku59uGyzxrWQX/WHyNRwoN+kvW/uCkr1d+siAmZf2WV+qMRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=urNZSE2yvaxLSGSzgOqTXIq5c8f73QcXHA1Nfgj3aDU=;
 b=XVpKzZm5Jt6hvKga7SUO39N1t5ZdnjjOjho9UoyBPpzAWcg3l5vH5fXCeAPTOUn7svT1RqO5RCIzhpZKc4dON9M489Ow/N4HrQ8L3P3hH1BR/pAIFJIk2blp9EE/2/C+YbVYrcxBun73mxf3Ke62yHPg4y5Pt7YrHn7q/y5FfY63mr2GBctE59bBsRweVg0P8gY/ldfb4bm8WcHLpgrJSyM3Brli85vAkVdJRDr9Zxy9E/9s6JOCjHs2pmeSU2bRkhVaH+rcFDrdDgWNhL+ZqWdDV5zRWnr+4ctNpaZYh6r8UGveli0R2/dwiWIafC7LC4R3Lo5db9i3h8mFgO3aTA==
Received: from BN0PR02CA0058.namprd02.prod.outlook.com (2603:10b6:408:e5::33)
 by SJ2PR12MB8831.namprd12.prod.outlook.com (2603:10b6:a03:4d0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Wed, 21 Jan
 2026 14:52:45 +0000
Received: from BN1PEPF00005FFF.namprd05.prod.outlook.com
 (2603:10b6:408:e5:cafe::13) by BN0PR02CA0058.outlook.office365.com
 (2603:10b6:408:e5::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 14:52:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF00005FFF.mail.protection.outlook.com (10.167.243.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 14:52:43 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 06:52:23 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 06:52:22 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 06:52:21 -0800
From: Oleksandr Shamray <oleksandrs@nvidia.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <vadimp@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Oleksandr
 Shamray" <oleksandrs@nvidia.com>
Subject: [PATCH 0/2] Introduce new Nvidia systems
Date: Wed, 21 Jan 2026 16:52:12 +0200
Message-ID: <20260121145214.4021631-1-oleksandrs@nvidia.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFF:EE_|SJ2PR12MB8831:EE_
X-MS-Office365-Filtering-Correlation-Id: 292b48dc-b3c2-4d09-a726-08de58fcbbeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NlB5fjJcQxGRzvv84zGubH27MaI8y493NVTw8ah8Hj+EyTEvBiqj5kTJ/GlY?=
 =?us-ascii?Q?C1Gt17BK/cARMvQnKp61RfVquW/xVWytPyILd7KCSJflSk+p1PlK4O7NnZXn?=
 =?us-ascii?Q?DFUFvEgMpi9oc4sHw+lR9MZjVLceR5XquHcnqOxrrOlQ+CIUEmShBxJbXzJ4?=
 =?us-ascii?Q?haqoNkPw/uDbX0YfWlmJDdPhvFEfYJOMmyDEDIt6dR11i2I1CffBPOUD/t0+?=
 =?us-ascii?Q?nYl/dFLhEP11LJP+U1IWNK4mseDGJ+RV7QJKOVrZDwjWHhEChf6FijIEj6gE?=
 =?us-ascii?Q?utVNg0KDA6YJqRG9Crw6bBHUXoEZOc8EkQ+5Fv33bqozPtRqQfNB7mrHF6Yv?=
 =?us-ascii?Q?hNzW+fMz+XJS5ghJDH9fa2qAZTqbSn64tQlqU/nNH4eAjTf+HA0EeuX+jXlA?=
 =?us-ascii?Q?ucJy1i08qTkHuoCFkfcPP+U80zSh8uAjyTaHRK2bJi2c5oN4KR8abp7oxzEc?=
 =?us-ascii?Q?/b9eriXSNYc5OYYLWWGlzpIvgIvEHoV3EwoxBWKX/heNROa1mccaUcy2iuLe?=
 =?us-ascii?Q?d84NEmMtTwJHSrAsi8b/vM3onX7Rlye/nZ8bGtTVPlrcbWo0/cUW/k3PgVFc?=
 =?us-ascii?Q?w1gf95ba5/dYf7doqYmjl9lNfMtBsGLbPWUjb+YE7L3XsqvD8JVVKHMK5XQ+?=
 =?us-ascii?Q?ypIsNmYYlx3+14/bmcnBuN25ZFNOQoVZCzN0JHaHCHNm35BIxptlFgWhiXFs?=
 =?us-ascii?Q?zYgpHb6ksc+Lxq6z4T9Ma16PU1KM/gNnn+0Z1C6qRYVAMtuyfCrJr6F6UO3m?=
 =?us-ascii?Q?tSdY0AYYyE/N5Ks0KU0cjsWvsFWLr63A6FXs/vThgPc7qEpmwvya9LAYsi+p?=
 =?us-ascii?Q?ZqQPKVnHgq4l8T289cY5bNAyxaytsXZgedBIdtRGSmgqmjl2HuL80cyAcemf?=
 =?us-ascii?Q?GuhecLlXHLWkZomlNz/oVdk+M0BJFV1vCIUyCOBd/vXqqS/9Uu4I9r8cxhaA?=
 =?us-ascii?Q?/YcNb9FmxT4jF025sbQOXh4L4HPOWNjNUVQJ7wc5nUQgYWhTkW0nXz4z5O/1?=
 =?us-ascii?Q?PgSHx2PMNXmxVT3jazNM8pTbBtUaYvr6VBx1QuLAJ98k3eWwiUN3EcFMrum1?=
 =?us-ascii?Q?OReqcGUclXEUqNqBSTHriUAcCOmzJ301RJ4JxssY7uDcf+orVO+M6knYcv5N?=
 =?us-ascii?Q?v3k9nAHVumfYQfRoI6IZBpQqObZQuG2KXO8wiQmd9DSwHF+jcAC07+Qs/H2n?=
 =?us-ascii?Q?HTfT4TkHRxtQCccjzDTW8D2o3XzymOkq5xypz5kMbeJSv4HMkAg6mNT8Vs2q?=
 =?us-ascii?Q?I7UL7aMNlAFqLytq/MTJY2W4F3Ehxj5cBaoXEFuvvJ7JYs2OFC/A2cHCDwRR?=
 =?us-ascii?Q?ra5fckm2eWqjUWL5maTeQX5j1yFmVk4VG6AOkm8gMZ/cc76se2iQESLvBxGJ?=
 =?us-ascii?Q?CI1yydV1+vx1VFLHEVBZcCu85inU/aXHvrtnMi2be+IO8hzKwi1+F0fabsZr?=
 =?us-ascii?Q?iN8d689fTcWxKLDWRZ9yG/EVCM/WJd659Zhtk4ZehF2fAmf6DA/r5PbMXx4B?=
 =?us-ascii?Q?cMUX2XBTAGpula2e/grcYd0nPbimbldn7IIumvLRPgHyVar4Xs07Q/zqF7YB?=
 =?us-ascii?Q?TSa3G0QMIR20Eoyi9D+7vAvmrCqsrIwY+tMPVDQMSd7Lhp3DsYNjR+HolN0c?=
 =?us-ascii?Q?fNo7CYgEm10mmibcgGm8HzzvYBOdveWYpNqPgDbInpaZZXXXBnES4/hZzrjc?=
 =?us-ascii?Q?Ucr8gw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 14:52:43.9097
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 292b48dc-b3c2-4d09-a726-08de58fcbbeb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8831

Introduce new Nvidia systems:
  platform: mellanox: mlx-platform: Add support for new Nvidia DGX
    system based on class VMOD0010
  platform: mellanox: mlx-platform: Add support DGX flavor of
    next-generation 800GB/s ethernet switch.

-- 
2.47.3

