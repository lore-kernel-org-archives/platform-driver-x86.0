Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011050.outbound.protection.outlook.com [52.101.62.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0469C42C4F0;
	Wed, 29 Jul 2026 16:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785343282; cv=fail; b=Rv4OITai8B9FuN3iwrK+p0uP3g2YL7PXohMOBPRKCGuDcfmm7lG8RJREt5vMtUf0MR5lshFDANHxn/v2u2g7ON24uy5qedw2QNgWXzsQWYXTeY3tqPR2KUKs7l22zMgJmzoH/fn4SiXbrYVDZ89zPUOWVa/MnpIdTrF35pzTIqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785343282; c=relaxed/simple;
	bh=VmD9HLuRASMHsOEl4hz8HPfWq7Fct+okaJSXLkYyiBE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jVXXIkgtHPaS8jliO/hTNQAF6z5tIZeHx2jVGkbH2Ech50vq358fZduuw9v9SOX6kvcUn0uCHCF0wQwDFAbVo7RwLU7FSh7bqFVpq1mv2e3ZiHvdayN8PGm7mqbvuiSgmMN1AacsuJzPIy6dB1eAwZGdKDDo/YPSUvCks2CdrlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=imRWpgbv; arc=fail smtp.client-ip=52.101.62.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="imRWpgbv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nL5l0GERDiLp/kMTvRaj7zlc3wY01im35RxWjGVsW6jQQAmKwRUNoNznX+XqkkPXdc7ykl+5X9bXYXaMo/VVrG6+tqr7CsUEt8KK4JSxB+rddRU/AtAzGOHsQTg1C7S/w8VxVFivxf8kdjVaMqTGFhm6cyLw4BmS5jd+RjOf7d2OLXwJGnatW/B6RVYpOJbmZ44Itjy2K2rpILvS8IF5vKiCeE3wb328TcFuxH1M79uH2SC+uF6Yji/45+3Obhh2apy+04BzE4erCykNhkaWCPhdzyuUjTbP4zJeGTdI7JCz+c/yJJTnrRcqm6j75YVqDDfj6nu1Sa/8lS78y6lT4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VuZPSmxgYt2HGyEgMGTovHtYezvIBmNewBx/sehYnGM=;
 b=gNm5QTQ1We4e7DvQsfccx5A+MHy4l6SRakvhTj744Lk/g2Vw1/vkgHhHXcoMQLrCdlk+RneCjbRDuovb7NwMkATf2MTrrpMdXkjjnwFBsKVc6yqQ+5Ieu6ZeVXO/wMZd2MeQnSpXLWUT0AoFyPxozoRuUbH4FX4hw//eDN2arNl1ZT/RTdjsa3J49WgS9xyN1z2m9XsVYgniOZIdnFsUKTLsLGgtxnWWLmxbZkcSPANxaVktsdoBTUXDDfLDrKn6uMfBHByveEiIjCa/cN5LO9oR5fJ/m6F2ywjbnuDe+2ceHOD1aneCKF9b+xAPjE7s/KJRyz7mUlWrUGUN5zDWFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VuZPSmxgYt2HGyEgMGTovHtYezvIBmNewBx/sehYnGM=;
 b=imRWpgbvQCw7pS/iNTIpu6ZhroEH7Jwo7ArinnFT1FzUZh7AM5pTd/AQ6+lhJ9VkUayK3L7jfeAMBYEUKvW5nWJU52Lr/dlsbSt3SBnrQbv9zFqVQ6iDMGuc7HosuGR+jgg5L9Lo9bxjqShqihyNN4IieYVC4MK7P1moiCHn6bM=
Received: from PH8PR02CA0008.namprd02.prod.outlook.com (2603:10b6:510:2d0::17)
 by DS7PR12MB6167.namprd12.prod.outlook.com (2603:10b6:8:98::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 16:41:13 +0000
Received: from SN1PEPF0002529F.namprd05.prod.outlook.com
 (2603:10b6:510:2d0:cafe::49) by PH8PR02CA0008.outlook.office365.com
 (2603:10b6:510:2d0::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.13 via Frontend Transport; Wed,
 29 Jul 2026 16:41:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002529F.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Wed, 29 Jul 2026 16:41:12 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 29 Jul
 2026 11:41:07 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<muthusamy.ramalingam@amd.com>, Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH 7/7] Documentation/arch/x86/amd_hsmp: Document the SMN and MSR IOCTLs
Date: Wed, 29 Jul 2026 22:10:34 +0530
Message-ID: <20260729164034.1331375-8-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529F:EE_|DS7PR12MB6167:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b59e3b7-feac-4a92-155e-08deed903337
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|23010399003|376014|18002099003|22082099003|11063799006|56012099006|3023799007|10067099003;
X-Microsoft-Antispam-Message-Info:
	XoVzauNnIaEZWiDgXCwoA5rJES4Gwoo6pel1yc9W7cw1loZaY3VENP3AzqIWQThSR/gNadk7BJtYvZKlulWr0k+ekAZqbq151EkZt+gEC0mKoNwpwhmljWubGYM7/mKMX4NCwExEP1roJYQixFhIrfi6ydmQa5chpc1YELfO3IIw/CeT4LdukojKQ16kWXq/Zo9M8Mzp5QUU4D43qi5BWSupD6Vm6PjQ+Cr2wM3SRBKI5F2KkSYvWwA+YTwYJPOBe+DnBhhh1+z7qcF/Od7LA+AFGyvEedDGAija5b/p+ps0cLxjnqD7c4cQVw2n0pXlJhzWCPHceZU/hipLjgJrm6vPdYJKzkniRobWIVR8SXqJLXxXzGfQBZZbsvdVGwCf0xKiCn9TgUJX8RD5kg6muBFuv+MAg1TPtCWSW8STzTOumrfDOstM5Zx0uPi7RFRYB5Hv8TzE0wVlyKoe8ydr2o0w8skZGxZck8KhWK1asiCiEMCe0hQHKH/aMdGowjdtqksuU75fOscCgm2dPKYasXCi/bf+qnKXigg99y7pTiMHaDu5JYLJrQoFIIZ0YfeTYeFVyO14ZK1zg4sjPwkf/BbV35cbNNtYFh73ZU5gzuxCJYWSUk7qWDAIrGPkD1WuSzf5VMOUt1/hCSc2w7crxql5MJXEQlvHgsA3N02vCG2bi0DIqhX8LX3lPFaXE4Ijf/RfORcm8aPr1KSoK/aYMQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(23010399003)(376014)(18002099003)(22082099003)(11063799006)(56012099006)(3023799007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cFxWrnbr+pBqUQX/HPQXv0qTDQCW7XEwrlsVdZJ6WFC/d7eLRikiNdb2/p0GXPNDTU3FkeiFjf0NHrr3djqbLzHZIv2slfAsB6RA7MAQf344hSbrftskn9MHMkPd6FlV6hPJxKrYXE16KlcMDBaOnQJLPvz62toN62sh4PeI1aFITHY1+Q9d8zqvOorERTd84x3cJH8S7fjxl8fYJlrEeX1VLEC2XWNztRUychy9gGqgaXHLxHrLkPjWz6C1pKwIlMbDG0ZpzHcQctVQdzgvWL7deG68xAsU8AuR0f358VUXs4sY68bQl9tNlUVVEdHZZkyqQq+FNmF+n8FEvZ5a9UpU3n5LCsIEGIkJM+Q4NhqVnjTHAgMK4V0QBMyoh2f1tFNlsjdr6nlnKcL21Qy7Tq7AAoSRi+TIJQRum8t/Skag2aVhmNMMOBIjcj1sFeix
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 16:41:12.2831
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b59e3b7-feac-4a92-155e-08deed903337
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6167

Describe HSMP_IOCTL_SMN_CMD and HSMP_IOCTL_MSR_CMD: the payload structs,
the CAP_SYS_RAWIO and open-mode requirements, and the rule that both are
read-only, so a request with @write set is refused with -EPERM even for a
fully privileged caller on an O_RDWR handle.

Also note that reading the protocol_version attribute can fail on the
Fam1Ah client platforms, because some client SMU builds reject the
interface-version query, which is why the telemetry ioctl rather than
that attribute is the way to reach the client telemetry layout.

Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 Documentation/arch/x86/amd_hsmp.rst | 44 +++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index 8a9d6fe7d4cf..0f03201a9f68 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -229,6 +229,50 @@ The following IOCTLs are defined:
   ``sizeof(struct hsmp_metric_table)``.  Later version metrics table
   layout is documented in the Public PPR.
 
+  On the Fam1Ah client platforms reading ``protocol_version`` can fail,
+  because some client SMU builds reject the interface-version query.
+  Those parts have their own telemetry layout and this ioctl is the way
+  to read it.
+
+``ioctl(file, HSMP_IOCTL_SMN_CMD, struct hsmp_smn_message *smn)``
+  Read a 32-bit SMN register on the socket given by ``sock_ind``.  This
+  reaches registers outside the HSMP message ABI, so it requires
+  ``CAP_SYS_RAWIO`` as well as a handle opened for reading, the latter
+  because the value read is written back into the request struct.
+
+  The ioctl is read-only.  ``write`` must be zero, and a request that
+  sets it is rejected with ``-EPERM`` even with ``CAP_SYS_RAWIO`` and an
+  ``O_RDWR`` handle; the field exists only so that write support could be
+  added later without changing the layout.  ``reserved`` must be zero.
+  Argument::
+
+    struct hsmp_smn_message {
+        __u32 smn_address; /* SMN address to read */
+        __u32 value;       /* Value read, filled in by the kernel */
+        __u16 sock_ind;    /* Socket index */
+        __u8  write;       /* Must be zero */
+        __u8  reserved;    /* Reserved, must be zero */
+    };
+
+``ioctl(file, HSMP_IOCTL_MSR_CMD, struct hsmp_msr_message *msr)``
+  Read a 64-bit MSR on the logical CPU given by ``core_id``, or on
+  whichever CPU the ioctl runs on when ``core_id`` is
+  ``HSMP_MSR_ANY_CPU`` (``(__u32)-1``).  Any other ``core_id`` must refer
+  to an online CPU, otherwise the call fails with ``-EINVAL``.  Requires
+  ``CAP_SYS_RAWIO`` and a handle opened for reading.
+
+  Read-only on the same terms as ``HSMP_IOCTL_SMN_CMD``: a non-zero
+  ``write`` is rejected with ``-EPERM``, and every byte of ``reserved``
+  must be zero.  Argument::
+
+    struct hsmp_msr_message {
+        __u32 msr_address; /* MSR index to read */
+        __u32 core_id;     /* Logical CPU, or HSMP_MSR_ANY_CPU */
+        __u64 value;       /* Value read, filled in by the kernel */
+        __u8  write;       /* Must be zero */
+        __u8  reserved[3]; /* Reserved, must be zero */
+    };
+
 The ioctl would return a non-zero on failure; you can read errno to see
 what happened. The transaction returns 0 on success.
 
-- 
2.34.1

