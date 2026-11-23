Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.71
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795475433;
	b=sMi7LntWuqD3SvjlBpl9HPJcJdC2LkAP3gg9afalZ3NI+9FaWevqwEaaEZG23jCSQdnv
	 zlhBC0n7nkpjdYE8Nq9lTdKNGmOkhRFGV1d0rXeQ9EYKnPy8JtyPu2kCCZA0DRIuDxiRq
	 cp0p+fwoDP0t0O7sD4oAruTb2We5ufhLHE3aAXRdEkIhJn5TrX2bo2IGISFyTe6yp/bIw
	 jZpRoFB4RNt9lDePLqMfzYOUAtFRI/iK3RGQ5FIlHqhvbaxKsm7vVHVGLzs8d6UX5f4Ej
	 e8lThC6RfvIaaem12Sm/wino/gpMKlnVAUrOWa3qw+6gTL/qe+gqljouQf02pkjibtQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795475433;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=iLoQyYanyzUfA+7HwY9nG7g2B7Dj7k15AVRWuU+ddBM=;
	b=1Nqk0GaPqK65QHyyWGaktz4DNj5nlBxpuihjnVZ2+BDUFtv/qcFlNY90zm0F1o3kQ1cO
	 vqORyFcuSCh2ICi+T03CiENND9HrFU09AVRNbgqinuvBWfQr0nvMm7WxjmfK9wUtJ+ARI
	 5iueG1c4NCGOUZ8InKJdh/TPEGB5IBadQhOx6NJIgzTcBdDHWCluZOEVSYQIA2rfK//6j
	 gJJSDiQYquSVhkuUEy34aUs9X7XiiMy8ZdOsq8flmkdPrEXyY4Gmq1vjLZQEKtDDsqPJT
	 fPhWdG8RouhJyjtcJ2UzNZkXQFdThaAy7d4Zd/zkfEKucLrGDBZB6mOtSdLKQtmtfqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=WnPpuCWi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.71
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012071.outbound.protection.outlook.com [40.107.209.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AB2606A6A7;
	Mon, 23 Nov 2026 23:10:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3AB2606A6A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=WnPpuCWi
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MMMauhcg1fpbXCE8Z9yifSfFx6+gVBQLFkktdOt0KsuaVfTiGb8W/xTuBl9m1ratWy7ukPsAfm60z0tpj+JR2Fv5jNLvgVw9ZONSWNY7TCdy4FhYCW9T0gQER2KF5MoJT4n360HQbTAx2KXKPNguGoI4baqnodMc0iqx1eWAL/n/RiSCmZZ7z+ptVDYia17kB+l9FVUulk0EtNxHpfzdarJWoYJzDKv0m2f1EaT4hiPVprlFR7SnySz6H16gm6bPrq87Dk1XgwTk/iviikr1Y23/vW+kEBogotrAKkyBxAav6LtmVBwYD4C9P9pnlgoHW3l8a7ngEFUilavI1J4r3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iLoQyYanyzUfA+7HwY9nG7g2B7Dj7k15AVRWuU+ddBM=;
 b=EtckHA1ZwjZ969RXU7zAsmSi+RgzQ0n7xi1H7u4/cVOTnPE4MlPTLy4QqF1TDIREdcFMEPoRcADLLXr/ysK1wYXn0NQz/6Zo7lttZZcEZ6wYh5Aaopk/nczyqp660FOl71ZrULkNr6hkryE6LryViLgDpUNREIqOWRw/JEpPUPng3XPk5f7gsBdO5D455E6Wz86qijhPGuwspfEv4Hm5AzoudgvGsieuZGPNacUtASnxjXV/2OB1SYL+RPyqxloVw26UO3BvpmapwWSBfI1KymAJv3UrYd038hnMYZG0NyVVb+W3U/OTxDXR5s5wdAync617nFjG05uH35eaxQDbdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLoQyYanyzUfA+7HwY9nG7g2B7Dj7k15AVRWuU+ddBM=;
 b=WnPpuCWiIEGO2lMwcWqpFKEjbwwxu40av/QDSmsfM5lKc15pukFNEQwPQxE4CmfGyKZop+WuoyTThpvwL8RK4rACKO4x4j8D7tocHDFmiuyx7xQbIuAS5HvM82HapZmNTAazK4Lzvw4t6R6peh2AcxOLAduLvMx5glYPIxQMztQQRisiBknk51xLwGni/pVyqGK4Pv41B5l+I+DvYPGFVw2Q6MudBwL/F9wGPSW7/k+bz1lvNgf+N1nHymJKzFVh3rhAIwITlPMYNR0xqHiBOYr9ndxfpcJf4hqg+CFiAbGEyRsC0wkbdYu2ZeDJoWR1WkM87xOyj3HY8V0QoQk7Hw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5786.namprd12.prod.outlook.com (2603:10b6:208:375::13)
 by CH3PR12MB8459.namprd12.prod.outlook.com (2603:10b6:610:139::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 23:10:16 +0000
Received: from MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854]) by MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 23:10:16 +0000
From: Brian Mak <bmak@nvidia.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: David Cemin <dcemin@nvidia.com>,
	Lucas De Marchi <ldemarchi@nvidia.com>,
	Kurt Borja <kuurtb@gmail.com>,
	Stuart Hayes <stuart.w.hayes@gmail.com>,
	Matthew Garrett <mjg59@srcf.ucam.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Lyndon Sanche <lsanche@lyndeno.ca>,
	Armin Wolf <W_Armin@gmx.de>,
	Prasanth Ksr <prasanth.ksr@dell.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Brian Mak <bmak@nvidia.com>
Subject: [PATCH v2 06/10] platform: dell: Allow DELL_LAPTOP to be arch-independent
Date: Mon, 23 Nov 2026 15:08:57 -0800
Message-ID: <20261123230905.13899-7-bmak@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123230905.13899-1-bmak@nvidia.com>
References: <20261123230905.13899-1-bmak@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0385.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::30) To MN0PR12MB5786.namprd12.prod.outlook.com
 (2603:10b6:208:375::13)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB5786:EE_|CH3PR12MB8459:EE_
X-MS-Office365-Filtering-Correlation-Id: 01485be8-ee70-4e69-fbf6-08df49b6ed63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|7416014|23010399003|10067099003|11063799006|56012099006|261009223027099003|261021123027099003|261021121427099003|261102123227099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	irtmh6E2CbAle1zsn07qllwKxs9XZkBC5ubBoHXawWCCfQsR7R/cRXSiQ6jPPdNZOPpijX9JUni5uYONQha04UQWUqS7r71QOWR1K/0wbmqbqu3vGYSaAAOE5MNy8C6lBeeCYLjYu9jjxjvM8zNNYgD4wR6G1BauEd1/phCHWsIOMu5JoyocNe1g1gxauK11wXyqsgJmCjPIhIWvutqRExxoihAqv9+UAdzO6sgy/ahxYIBipeOUIfnFUfqZfMyLYbPgyCUVq3AU6rt0c8I3txhKzleKilTiEHpq+UyXIyTEWj3SIAcnbLA6xq2d2Claf8Cxz/gpgYvxvGe8kgUy0nXGpx2VK4xTrbgiZSnAlRRCTwJtzUORc3ybpgZn5CHa+WJK6d3VLd7SAs/LXwDwJ7lXzZe2dI+cNmp5Q1Dtoggg75eA151jRkidLgK4dt5sYZGLvoBa7Cd4uOGaBxKkyg4ifdRD5IljsmI6fXa+7eJUm0EyGAPOtRxYmtkAV1woeslWjnTd4Rzl5qQ6lBR+/xrCRhKGf1Jn1NTl7YmF+QgFDcqBobo4FmtcUeKakOvp1q2ndUTFDiuaVHYr4S/jI8KHud3dtgWHe1m7GRnsfBsUoBXlC62iAY7VZ6vISoNc4yEctBJmbZ9YK49Lq3Wl2iNj8HnTe9NFe99v0KzAibs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5786.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(23010399003)(10067099003)(11063799006)(56012099006)(261009223027099003)(261021123027099003)(261021121427099003)(261102123227099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UlTzGoij8tbzBOciHQ4HVsMTwBeWzG6dtnGRwrqRFkzZoPDHp9TtVCp951Mt?=
 =?us-ascii?Q?sayZll+rJT9g+Bv+fwv8kn2nqkIwwM+UJ+M6y6NxxP2GUAJliUe0vnOVDcfh?=
 =?us-ascii?Q?D85DU/QAruBo2O9RDsEd+ILuAx2/l/+sY/o8jlWXu2rRUbk1FUOUCaEaCqWY?=
 =?us-ascii?Q?mJIBdyjIq0uwmlAgD1Ulvp96hpQ43F3fyUoSbb9HLMJIUt/Wswer22pXF59J?=
 =?us-ascii?Q?lXW2bzlUgTx3gcXgAH2bhSqqCPa2geiK/qfKiYNkWQ3W5amMvOA335JFPGgl?=
 =?us-ascii?Q?Qk4+7bV3GiCNBXe0WZWmn/Yj+zV9o05cRh4L3nfQbsRCVWIfAC672OnNx9sV?=
 =?us-ascii?Q?tuf4/JhLF/J9WJ/B8nz28czPbnvbDdmHwDuAH1ANEfNFBeQfAtoX3dPRc8F5?=
 =?us-ascii?Q?rXdgu1sNw907OYtdgAGffga3/OGzCm7b8un81xn1eDOCltk5wY7Hu+KaWr8M?=
 =?us-ascii?Q?b5PxRq08h6p4YTox1RA+hnwYtzxKOXHjxb+zpLw25FsLkvZbDE3ATTurNwtX?=
 =?us-ascii?Q?yWLFO5Iz54yuPwAkJkl6CEUINv6Eoy9i5B6dLvIAenAJOkJVLuXodlZDXdNu?=
 =?us-ascii?Q?CIwVuU2LJ+rYTIXcylWza25gKo8dgerqs04PM2As0E/7HhgIdfSh44phs18x?=
 =?us-ascii?Q?4Ot8Exv3rk99eKOFgb1Vp5qQmDcbnlSGiX26VAZuOI8Ub3Vgaq41VaUV/dN9?=
 =?us-ascii?Q?8fAg2zLhLoRdbq79fkNtmpXxoYmd6aAetbxrokExL93PJZowi5uFV1st3dhd?=
 =?us-ascii?Q?1oQD1xE0JczjONLAjJ/bsLM4ROKIRpTwhKkGpVVCh4eONXSSlS332LauL6LT?=
 =?us-ascii?Q?By1BcRVTpjQF+ux6MYkWCzkRk/pwwhkouOPLZ5BEa/g1JytETwdqWQuF2um3?=
 =?us-ascii?Q?e+JzSaEMsR432pz0zZHkkA32H+HpFQ4Mb9bDHj1OukjD+9yijsDq+F5YTnlI?=
 =?us-ascii?Q?5qe41sXJ4F4bHnBZrXjLStccTsSgoNKIULPMvTmukxJ95ednq8YbGazZB+Z+?=
 =?us-ascii?Q?we3wsj9OZnf4EvHLSvfFc3267pnB2OMcepvItKz4RoXELmJXVj9ouNS1NrdP?=
 =?us-ascii?Q?pTI/JM57II4llM53/0lGn7tcndynWwV9KWNWKnUHCQNF07LAzMBR9W2VAS0y?=
 =?us-ascii?Q?7gh9xuMSlPMCvgGpE4NYyMXMG+nBimwxikLYpCXsB2pwfmyNhoGajbkJSnw9?=
 =?us-ascii?Q?jUFO/9xlbwyXbput8pP04pP0RK4tnTlZ9jOvNtQjA8yyL7kaUhDEBfM+URjo?=
 =?us-ascii?Q?fwHetip/8DqkBeY4I20ysiKbWxDtRoJipiddk8SvDTrBhLUyrTTD9XttRiVj?=
 =?us-ascii?Q?vSYQdEVbh9OSemQxCjqNyoB0elBJCK45x0LJaQ2Jn/bQBRoaz9JgtRZkJuno?=
 =?us-ascii?Q?ceNpW4TnSiyb6BYiLfPFIvCtIz+pFsZUwV3Ti8WGQ60knnWPBl7B2AGAPMVc?=
 =?us-ascii?Q?vlPFaOLszoBmjzmeS1gAqrQ72H03fQZvVOK66zs+w9c2SZB0C2qlSuf5RrDq?=
 =?us-ascii?Q?h4hSnjkOHSenEx6EYxvANtYpdphaqD3SUyo4EzT+qTSmgYhTvGa+yp6Ze9Eq?=
 =?us-ascii?Q?5H8PznVQR0HG5sSxxi1xZ31ebKMF1JVFXOfv+b4a3rKaTNVpa2D2pn7Vw1dW?=
 =?us-ascii?Q?9y26NSbwuVfxJXcJodyTaqQQlcYvyluZvwI65gceqRycVH5n8l8322c2Lykz?=
 =?us-ascii?Q?TUCY05BWxYY2FTJn9e0DHHhw48u4phhc1ocin76MlREZVu7CGXNpW3zt7Fm5?=
 =?us-ascii?Q?0PHEX+Wocw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01485be8-ee70-4e69-fbf6-08df49b6ed63
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5786.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 23:10:12.7337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 77v7P+CW7IpGuXcla+bLMpiJyfH7D92j2ay36nwvlWAAbQ4cBYerJq7VLpIXKo7h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8459

The i8042 uses in dell-laptop (touchpad LED and rfkill event fallback)
are now compiled out when SERIO_I8042 is disabled, so the hard
dependency is no longer needed. Relax it to be an optional dependency,
which allows building dell-laptop on architectures without an i8042
controller, such as ARM64.

Signed-off-by: Brian Mak <bmak@nvidia.com>
---
 drivers/platform/dell/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/dell/Kconfig b/drivers/platform/dell/Kconfig
index 7030f817b6af..0223e2373508 100644
--- a/drivers/platform/dell/Kconfig
+++ b/drivers/platform/dell/Kconfig
@@ -77,7 +77,7 @@ config DELL_LAPTOP
 	depends on ACPI_VIDEO || ACPI_VIDEO = n
 	depends on RFKILL || RFKILL = n
 	depends on DELL_WMI || DELL_WMI = n
-	depends on SERIO_I8042
+	depends on SERIO_I8042 || SERIO_I8042 = n
 	depends on DELL_SMBIOS
 	select POWER_SUPPLY
 	select LEDS_CLASS
-- 
2.53.0

