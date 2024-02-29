Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2042.outbound.protection.outlook.com [40.107.220.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A9C3BBD8
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Feb 2024 07:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709191956; cv=fail; b=Wa2AATkHmRf5Ovaniv9xUhFZS5bbBv5y1t0ipcHoxSF5K6YtzVz3oODrl/gNppdF3xzwtu/YSJi2v0anoCw5hTcgGidS/sA2VKllG5Ydo9aUqpGepBkIQGTbArmbQiSBqzzAZcLO8dT1eO34QgC7m0gWtZUB+8EzJ2TJh4YvMXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709191956; c=relaxed/simple;
	bh=8VfqYa6S7FhSGTncTer8a+stivJQwtMhdAdu8Ip5Uo8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TqjhoFYYGH+P6odlEpRD8X3K2x15DUisAUHgtps5VeRJbYt8Qim643a29B8sTTl5p9+yO8LkAvIG11ZYPhd4cJ31P5wt10DmpqBPwHfRYpN0/KdA3/DlPWtiOMVKkykNg0OVBxKDuaziZKcLUaA1/J8D/NrI+e0tELSSZ4/7t58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RJEPVDDr; arc=fail smtp.client-ip=40.107.220.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RJEPVDDr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y8Id84yesQfDS3ptiCJUJ6HRi9TBwg43bk8J7bs0+qneEQQsf5rwW1xbst2kPHn1/PljOuiwym/F7u2oysHMqS4qvaL/Q4VSvbnNGsSiNFm5ADWlPcjp/P7+wZJELhvjxsI0DKYkumQ4Jmahgxy7D4M25f3sCYH2vPjpHTnfnQgDLkkIDOqfZJHqC5NrChHAxqhz0Jy14hdJuuVJwkJ8DkFxmiV8yBeJmlCiHerjoHKfnBzl+ZscgfCNT051CkqMujG/cFm4S9HUxjkN4/COjLTWClB6qtDl3rG/ZuKO9FxjpqwBj3kzokhlMLoC6SzdUIUOiipMiUvXTwGbYycQFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=avYoZHXvIMDYOyHOIqnmJ/Zz2ZySZ3XqvITZ1i7fgjc=;
 b=eyLHDU2lfY7Nbqls3qVD2ZbDs7bv2WSUrZHs7EhWTXbg7y6ZOzF2n/5GozYNZHC1DNszSyrGGj0JfwtKDya1ngXBRmJiNaESwsvcmx9sQp5hJG81fTeb93PItr5cUaS+GbGqDhkWAXaSe4xKNZl3vSRl3clD9Nu4iTxeFtDsNho6xZgC11s1G+vHhNjN2IsuJIE1YkOKDlhfnSvv7hTnlD5rXAWYjwfkuXNwIsHQtTLbifTYBUcodDmT4yMVL6bLkMGaZT+zaVxl1RFkYs37Ialy5GtaH9n5Kjoq4CS5UOWrQNc+e1+UjezkJiMvq05Ex5MTG7KptF/2pkNhYUa78A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avYoZHXvIMDYOyHOIqnmJ/Zz2ZySZ3XqvITZ1i7fgjc=;
 b=RJEPVDDrEDTIMDqlL8v7z4Tsu6RG92d6a/5W5bKpD7aIFoefHfhb+DMyVnhoJJib9AweTNBQ/E6NTFH0lQwJparzk+TvKfrr+i7eO2yFxdf90YGIZCM+VADL78Nzf9waxC/TVL+esVWcrcQ27nWDKRIiOAfsMxLDXxliTNoBu00=
Received: from MN2PR14CA0020.namprd14.prod.outlook.com (2603:10b6:208:23e::25)
 by SJ0PR12MB8115.namprd12.prod.outlook.com (2603:10b6:a03:4e3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.41; Thu, 29 Feb
 2024 07:32:32 +0000
Received: from BL6PEPF0001AB4B.namprd04.prod.outlook.com
 (2603:10b6:208:23e:cafe::23) by MN2PR14CA0020.outlook.office365.com
 (2603:10b6:208:23e::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.28 via Frontend
 Transport; Thu, 29 Feb 2024 07:32:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4B.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Thu, 29 Feb 2024 07:32:32 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 29 Feb
 2024 01:32:27 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 0/7] platform/x86/amd/pmf: Updates to amd-pmf driver
Date: Thu, 29 Feb 2024 13:02:00 +0530
Message-ID: <20240229073207.4092698-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4B:EE_|SJ0PR12MB8115:EE_
X-MS-Office365-Filtering-Correlation-Id: d5b9c765-a1d7-4915-e0c1-08dc38f89751
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NFJb+jQUjn04YbZAvb4iZLGjJxrQo0xVm9gKFyxEnpxhVHg5rYtZWQMMW+f+SI3g5o4GAOe3H7oiG4Q5Uz4+3zTBJEHEJ32Dxp+h+LKWeiILwxHiz0z6knFNiCrgIGd2fiF3xdtPz/yGx9K9YK+OeKP80ORutvUPzK2XMZS+HSH1CatXP3k2UeGyxxkf6WKyS4WbXQ0l3LvIIrY0CxvrZW2O853EcQkq/O8QvfjwWeKaqgYg3sKqvONpYTvHYPAZh2F05lakg/F1T+77bnqzysAOPIR7kzE0zjPsBVqZcRY5lJ4b1WN2E1O6ckiWHPiWjQDgAf88St4CjNC4qB1HL7nIk7F9K15OF+RNJohp0cBxu2YxpYhnFaDUCDbEDN6cfFCW5/yVlFX72Tu5L4nRcS7DnCO4Nkgq78uczymQ+kuBRQCIdfuU8VN21aiyIhuZrVIVlJbvCUz8mBgJ0VnAe40sJ18nNWAUCMwYSibrK0O/+aetth8f0b87waB6eVl1Y3dfu7wYQryYPTonAwyvDwM6vMbHRdGopyV08XBq1rArEbijZ0AhWkCwW2r8Vr/q0F9I/bpeRI7+1xbpI4yKXIKayYY9xE8v9DuDxKB58aT3NBAblWfg/IuMG5vo5Fn+4Er/Y5OVt6Q/ZILEByD4FWfcyC18yvuAVEJonbKEclH6yN2mmO9vpjTKt+7f/FfYnFDeGRGIaJ/NoNWGJ5FSvlUiwBXG593d4Iir/miEJV1s3slb6oGHfiRozmlrkndT
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 07:32:32.0131
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5b9c765-a1d7-4915-e0c1-08dc38f89751
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8115

This patch series includes:
-Add support to get sbios requests and static slider as per new APMF
specification
-Add support for the APTS (AMD Performance & Thermal State) method
-Disable debugfs support for 1AH family series
-Add support for heartbeat notify event to OEM BIOS

v1->v2:
------
- Update commit-msgs
- Use 2x4 array to store power modes information
- Improvise debug prints
- Fix alignments problems
- other cosmetic remarks

Shyam Sundar S K (7):
  platform/x86/amd/pmf: Differentiate PMF ACPI versions
  platform/x86/amd/pmf: Disable debugfs support for querying power
    thermals
  platform/x86/amd/pmf: Add support to get sbios requests in PMF driver
  platform/x86/amd/pmf: Add support to notify sbios heart beat event
  platform/x86/amd/pmf: Add support to get APTS index numbers for static
    slider
  platform/x86/amd/pmf: Add support to get sps default APTS index values
  platform/x86/amd/pmf: Update sps power thermals according to the
    platform-profiles

 drivers/platform/x86/amd/pmf/acpi.c | 136 +++++++++++++++++++++++++-
 drivers/platform/x86/amd/pmf/core.c |  15 ++-
 drivers/platform/x86/amd/pmf/pmf.h  |  85 ++++++++++++++++
 drivers/platform/x86/amd/pmf/sps.c  | 145 +++++++++++++++++++++++++++-
 4 files changed, 374 insertions(+), 7 deletions(-)

-- 
2.25.1

