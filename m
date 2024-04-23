Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2074.outbound.protection.outlook.com [40.107.243.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF96556444
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Apr 2024 09:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713863706; cv=fail; b=t1iIAD/8z7KRIA7b4+UWsSY+opo2Rdsq5D08S6Mi/mW2X+nA14HJXYLBJY1gbm10eRKAdIslt9XOz72swrV5XhgFiPDrpaaPPdCk3DV3PntJDtmdyjqyNoMIx+fHLu1tCIw96eQWGIeNl5YpjFEyIPqmKijtZUeLE9ZiNvD5+ZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713863706; c=relaxed/simple;
	bh=ox5FpYANwRv8rYhX26mTmFX8r3C5lPm3sfBLljgIa/g=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=urZcCAh7GlZ3yiqABRK7zgM7zPY3HIUT2blONXLcYI1z3+O3bQAFEULi/V/dTvujqNt3gJE686TPYvBzF0M+h1QBGazLjq0l6rI8kcNEw3iF2xVVh6BewEY+FCGjFQC+Zi85uisPcdNOpMboSTWF9DSU3+FzTeMpK+pencIqWtE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mgD7K6/x; arc=fail smtp.client-ip=40.107.243.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mgD7K6/x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=POLRMKf87rI+u+JRZ2yHiEu470nT7iktdp5kksHxzrFF0SwsGgtA182jieK02swgKsb00GnT9i14uVNJcz7Qt60zaAu/ff51B5m0W08tVjTX6/WX2Ov6DJGyCqHrxth4SCO9fwNIY6l76c+CRb3np+2M33dzj+gQT8gkxuzkzL/hRcpb/BiP+1ca3i7oV4G7X7rfFZgo59LwqdlPj5eaihHA2wPC0CNSxSdpWOIbX9rZssPGQ6Fe/XgNyu9/vRMp1OYQDLEOils2NYCMibBpdo1FUZUw/yJYsu98XiB8EhH7F4M8JuQ0rbAY+caIyAZlEgFMhK1INzffDE4wMQcDmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HfZcdMR046REk9fqUITybxJrN9b7lwBRotYiyaBWE3w=;
 b=ALI7qHRIxvipPnJeMqmczvxPTvsPMUnhxDv0N5auGF07vX2gl2mQKhO8NoypNxmjQCNk2fA0FEKxHYBfL3j6O608zVXwiuA7ccTflEWMvMBPGT6zYGGMUGrOOlRw0LYyliIDgO4zRQFQKPqVkW5IejQgsdv3ibEnsLQFGiC19wRnfgRu0aOaekXM9vR2DQhykIRV+zLXnay9rA05Az1xunJPhAEbRZvPaDgEpERd7EoNswBdxeWE8qtvI0jU1ayg5aFc3kbfU0lMmdfnGZVwbZBNgTSdeQgcaPxMelyfAlO8wAk8FaLd/3+JUOs365/eVjRJil8Zn0FdRtJZhGHeaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfZcdMR046REk9fqUITybxJrN9b7lwBRotYiyaBWE3w=;
 b=mgD7K6/xSwXFHuvT9GeJIqMpL+U5i70ajgxJ0B1mpghCWLvXY34KPJbKYwHdxJzMPvQs/8gRBNuCDPVBbcTI807pmpVCEkNaHUVFARZyqXHtB4h5iPlkTm2rYVAykjOBQ/dxE/C/+Rsd2YnWcRxuiNG+R4NBPeczb3F8dWHRBkU=
Received: from SA1P222CA0186.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c4::18)
 by SJ0PR12MB7033.namprd12.prod.outlook.com (2603:10b6:a03:448::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Tue, 23 Apr
 2024 09:14:59 +0000
Received: from SA2PEPF00001506.namprd04.prod.outlook.com
 (2603:10b6:806:3c4:cafe::98) by SA1P222CA0186.outlook.office365.com
 (2603:10b6:806:3c4::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.34 via Frontend
 Transport; Tue, 23 Apr 2024 09:14:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001506.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Tue, 23 Apr 2024 09:14:59 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Apr
 2024 04:14:57 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>
Subject: [PATCH 0/3] platform/x86/amd/hsmp: ACPI, Non-ACPI code split and other misc changes
Date: Tue, 23 Apr 2024 09:14:31 +0000
Message-ID: <20240423091434.2063246-1-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00001506:EE_|SJ0PR12MB7033:EE_
X-MS-Office365-Filtering-Correlation-Id: 645d6ce2-2b35-4523-cf4d-08dc6375d9bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mocpLPZyzpZyvvrBCRZzeZcNPaReUwRewfIrWI6CQNJmHxwW1NYSDZGOs4Q7?=
 =?us-ascii?Q?77eaM2FZRHkw788vbg6lmAN8jRWY7DI971w81ir/2h+bat12z+Fsw4XXkVUl?=
 =?us-ascii?Q?tqIAnTUAYpHp9rd8mun6cETZMUe3s39wxf3FSZXpX5d058yUw6FS1GweLeK/?=
 =?us-ascii?Q?00J2M0CHN87i5k4VCvsCdRkQfytWt2qqztB3yK8dY92SdPX+173hxjcPvz9z?=
 =?us-ascii?Q?DC1oahrW/J6EMZmw/rMmRC8UR3Xhs7YXfILR2r2hdQIBWydddFrNeKPA3qdG?=
 =?us-ascii?Q?bxV9bbkewff/JsjcL5mL4zjCx50IVRDwW9w2uyNr/eU6p1aDGXdhc5txfeCe?=
 =?us-ascii?Q?KRsCwZIZ4b8xHRWeA2ODw1seTbzbn57la5sHrv/hd3NJk5naSvabZu+GpUpj?=
 =?us-ascii?Q?tpbm46hba09aH9Cfs4/b5YndqXfJAeKUYhhWMsKF+hbq/9w8PBIh/QaySXRq?=
 =?us-ascii?Q?2yhK2EaNbJI+jvZBkhyz0MBPyXeUo7yThTqm+7W94yRrzRMQQQQc/BskfYsf?=
 =?us-ascii?Q?LhMPXbq3gRwbiYZE0ZKoG+moMFOV+fY/5GI1d4qFwyG3Rr5DqAo299/Wwno1?=
 =?us-ascii?Q?bjeShKkYoAaDEBmXKF8ezpc8T1UJrcqQkwXUcq08g7TSUWOvxn59Bq2FB2jU?=
 =?us-ascii?Q?loMlp9foEOcMY4GisgIJhyr26VXPyFiIzW3cFVuoJjNM5qQ3dY+uu6OwsBM8?=
 =?us-ascii?Q?7SEnTbjFnZdv9pFgdo7DROkd4tRsFt26weAogv46XhhHXm68sfGtgQJEWAuS?=
 =?us-ascii?Q?HS9jcylT1KiDBSZ36Mu7WJDmCWB5O4qCls3W9XDjorWKlGTDDz6wLP29A1lz?=
 =?us-ascii?Q?ExPfPzwHrcD9LI4HOP3jCMQrP1FulO3Zh1r7ic67mJZUkkkQa2DLeP7SiRNR?=
 =?us-ascii?Q?X0l5Nc+Tjr6ILaHfQa3rXL5iOouQyY57vhjmxJO3GS2vXQ41xa/z6LF2CDRC?=
 =?us-ascii?Q?rcbXdDOKtc1M45VoHmvc8HQwx0q6fHL30TX6bUYCo5PZiAFB2yeGqEbj5gsB?=
 =?us-ascii?Q?6S+hXGlhvkLjRe03ybK5ftPPm4vjieChty4NP2Rdo5cG/9SmcUHBHOWBky/1?=
 =?us-ascii?Q?tI7HFlAUlZvE1KWv4CrRhau8jEWA2/E9+d9FqS+Rmuf7Pkj0kyOu32xW9Sae?=
 =?us-ascii?Q?2dzp1SOPDoJq+oBc/N+5LWitDcp/knn3yjaaoSO1Og1lAKIneia7evuuk7Bv?=
 =?us-ascii?Q?oXJzpvNYjDAvJed4J9pxIDF7ZK+zwOtpmXTT76RUkijKVtxHGFDsq5wDJveD?=
 =?us-ascii?Q?Q52NO8CFt7IdVU2zHlCZdmbaRhqvwzWGDmVl0o4k3IwaiNhH/RT75Jse68+7?=
 =?us-ascii?Q?o4xNtacKsEAFheENMLJsRcKbLEAgcD50S0njICU/znEW+8VZp49+LgUKuliu?=
 =?us-ascii?Q?pYUOuF6rsS0M57Xa7KDB3wOpc/YP?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(1800799015)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 09:14:59.4495
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 645d6ce2-2b35-4523-cf4d-08dc6375d9bc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001506.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7033

Patch1:
The first patch is to address the concerns mentioned by Limonciello,
Mario i.e to address the issue of 
"Probing registers that don't match the same mailboxes randomly on
client or embedded parts might lead to unexpected behaviors".

Because of some limitations, instead of the methods suggested by Mario,
family check is added to differentiate server socs and client socs.
This check is only for backward compatibility, Going forward all
systems will have ACPI based probing only.


Patch2:
The second patch splits ACPI code into  separate file there by removing the
dependency of ACPI in Kconfig.
This is based on the suggestion from Ilpo Jarvinen.


Patch3:
The third patch makes HSMP as "default m" so that anyone who uses standard
distros will be able to use HSMP by dynamically loading it.


Suma Hegde (3):
  platform/x86/amd/hsmp: Check HSMP support on AMD family of processors
  platform/x86/amd/hsmp: Split the ACPI and non-ACPI code
  platform/x86/amd/hsmp: Make HSMP as default m

 MAINTAINERS                                |   2 +-
 drivers/platform/x86/amd/Kconfig           |  14 +-
 drivers/platform/x86/amd/Makefile          |   3 +-
 drivers/platform/x86/amd/hsmp/Kconfig      |  18 +
 drivers/platform/x86/amd/hsmp/Makefile     |   9 +
 drivers/platform/x86/amd/hsmp/hsmp-acpi.c  | 219 ++++++++++++
 drivers/platform/x86/amd/{ => hsmp}/hsmp.c | 378 +++++----------------
 drivers/platform/x86/amd/hsmp/hsmp.h       |  82 +++++
 8 files changed, 425 insertions(+), 300 deletions(-)
 create mode 100644 drivers/platform/x86/amd/hsmp/Kconfig
 create mode 100644 drivers/platform/x86/amd/hsmp/Makefile
 create mode 100644 drivers/platform/x86/amd/hsmp/hsmp-acpi.c
 rename drivers/platform/x86/amd/{ => hsmp}/hsmp.c (71%)
 create mode 100644 drivers/platform/x86/amd/hsmp/hsmp.h

-- 
2.25.1

