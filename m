Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013006.outbound.protection.outlook.com [40.93.196.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9185832E137
	for <platform-driver-x86@vger.kernel.org>; Thu, 20 Nov 2025 10:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763636078; cv=fail; b=N2dm3Xv1XILwm9waFCMIdo98+Pm7DLcHhF+O8C6arZi+NaTpNjurE2pmzY7c5Bst6jS5SEZwA2gNuGLGstUz1vAXTkLkUkkSbC6VXep2NcIzsrGm6n5EUdyoIFC0ayKCKliJgl+t2QPQgFRg9uS1fIzAiWZ3Sqg8hXsJjBe5ONc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763636078; c=relaxed/simple;
	bh=BAFjehbxjHQ4kjwcDdAgtfoDbEPNb35pjH93EAHYOk8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VIxgm1GUKGyvZlhZnSCmlHdmqGOGNxkGUknD3mXrqq0c4TlRiUrnMYdNLWHfPEUse0tmJQJGd2mLIhno4+grp3eMolKYIfoDDCXmvmQfl7mStbt6gk4crqysUio8D/pgeMxXz17Jv6875aJst547DDkpV89Dohtbc1ggC0mosxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bUonI9PS; arc=fail smtp.client-ip=40.93.196.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bUonI9PS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wroeTADv0vHur01mmuzgu69D0eW8fvcafbnHusKLjQLQcIzJYRlEtVdzvmoFFN85rxkQW3Vh7qsDMrm15+iy7H/4+scj43cZVge6sA+SAl/EPGx42FLTuXYzxFksyzZt/5uuZfgBIWyClKhS1y/OL1AVIoiKobMzaeNldln46nHiA1vR+3A88RMUtGwHZJ7OeEPNRzAzFfsbbvwdP8f+oz2Nxjx7kiWLRM5zHGKoMW3rqCTLEJdOovUVnMKWs1yFWaxswC999oMAfqf+37eHVI2oVm6YKKwpTF+m3z+ecva++aGhGIxBhcTq13J+E5gNAtSVILrSB9lbUI9Vk88AMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L2r1lcmVReVHTxPffap4M2QibqngmplgRg4RLqj6p80=;
 b=jj/gQCqOeG145ibSXJv3CPUX+pzTlzP6IOg9MryidQmiy0EW9ObOG0cN+dyq/9kwZROuadx04WuFru1rZaiV/GxbmXKHoqcWp9yFN9W8Z/GGsS4HwIXMnj/QNob1UJBw4wVQ7ADOJoX22pfrZcbTY5nTuBEiRBPhqeXN9Z6ZfWOY2PZkgqCR1YVK2moYDY/2hoCxcx2j1EveGclnZ8DHQ2BztBmGss5J4Kd2xdDfI6pSs5A811YObBNCQrGgdaWj5fj/vWihScHPOUxVB3Qi8/EH2o+giwXpg48o4Bx9PRvzuilmf9Du5kcpmpjPDqH0n6oV0IQkCByc3OqsbTZn0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L2r1lcmVReVHTxPffap4M2QibqngmplgRg4RLqj6p80=;
 b=bUonI9PSKdb4Zm2HUpMvOAqHJYAJFwpFA7DT9/91GC2iTyfK6ueGjUquiq+cymN0lyk17LiZ8RMXQqrBWWUgSjK1ILqoJUYCtmWsLQU3hy8EO3qnSRePmkaGlpN2tDmnHxfdAUZqav0rL+ulAl0plAugf0yoiItZW4wCzJTK9uM=
Received: from SA9P221CA0022.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:25::27)
 by SJ2PR12MB8883.namprd12.prod.outlook.com (2603:10b6:a03:538::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 10:54:32 +0000
Received: from SN1PEPF00036F43.namprd05.prod.outlook.com
 (2603:10b6:806:25:cafe::c9) by SA9P221CA0022.outlook.office365.com
 (2603:10b6:806:25::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Thu,
 20 Nov 2025 10:54:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00036F43.mail.protection.outlook.com (10.167.248.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Thu, 20 Nov 2025 10:54:32 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 20 Nov
 2025 02:54:29 -0800
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 0/3] PMF Cleanup series
Date: Thu, 20 Nov 2025 16:22:07 +0530
Message-ID: <20251120105210.3945710-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F43:EE_|SJ2PR12MB8883:EE_
X-MS-Office365-Filtering-Correlation-Id: ca4ffe26-495a-4c0e-4dc6-08de28232fad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3veRXl4byKcXe0EzonMhoQ0hRBElRXgmM1Xxc3VQpvFkseiNYRhek4PI3mkE?=
 =?us-ascii?Q?QZOM9slKpk8NFXKj9FBEapK2qLPXJQ3z3uF0tzwaY+TGnACwW8fJw4CIZCcO?=
 =?us-ascii?Q?/7p44g0zQ4bPfcRU9+EbNtZH7z1ZDa/ak9CVx3xqHj25rCpX1h6h2vgbBwTi?=
 =?us-ascii?Q?dL5qo5mN92xwUSfyAIOmhmRhWwIUKHis4CwaNl4Dj3x08Xs6ulUCH5jP2E/i?=
 =?us-ascii?Q?oYRBslOLs3mDQ258OZD3OIS1rg1ZC4mhPADJ7mUcEk492uma4y/uNQhXkV9x?=
 =?us-ascii?Q?Ei5TiOiywEsoKjSZOPub3UpaT8LDnWeFkbkwAt4AWlxmfYo9jaRDbgn9JweQ?=
 =?us-ascii?Q?x5X1xm7atmvSIFxvSWqYlbvGIHMWWOJA4Pde9NrjOQEaSG9B3xa++Ja97Ij7?=
 =?us-ascii?Q?o/AHAH3RgMIO+CSXiXn+HzWOXAr1K6ESOSsxwTYkTVx1iKaqylDAwRYJrlJX?=
 =?us-ascii?Q?NvEuh4sIlx7bZmvTrzP6JmPypasaeWS/DLeaYhfJeuzmPXF96fi5paCuZ5Bl?=
 =?us-ascii?Q?MR+lCj6hrisxxYAAV6y5sjBLjy2RDCsV4KI7nbiQiggXFvX6IR0HlivvdtJD?=
 =?us-ascii?Q?rOnM4DUCiFVqmus9MaScBx454hOAOuf6Ta8ziQ7FUmbWENl0V92nn9PY5Fmh?=
 =?us-ascii?Q?kVWskx2iuU72hFT7rZmSKTqVQJOO9GEbTpwh1LrwYj6RMiF3F8sYKeFAfsFZ?=
 =?us-ascii?Q?Slv7vgNCI5qlGfaRvSM9nBsyeXgKFE6UruJ9hRLDvsLcStqrwWOUJo4cbgHf?=
 =?us-ascii?Q?V7OcjEDeG/jazN+QUmtcLyBZmGeAMTcIjpajfgsXOCUSMEZ1yMAWKuT7v2Jd?=
 =?us-ascii?Q?bxXUXyjpF0nkG2e0mP9e5A5X1GfZYFgTJvUULjJyFB44kLrf6Ym+aG4x1itY?=
 =?us-ascii?Q?6WEz1Trxjt+bXLWdAwn5S1wV/RJNXM/MWa+F/hY8OwGzEFB745Zj3qvYb4G9?=
 =?us-ascii?Q?2wEUG8IfYRp/cKTX/nNAaKJu7twdf37sTTDdnjhTyR02peY11JBx9XCbFqfV?=
 =?us-ascii?Q?kpwmYuu9DZ27PE7f/3W5Bl1sNP5ei82dxT45u3Z0MManECD9V/f8J8wEo9yv?=
 =?us-ascii?Q?Eor6NCI5yLnEgRnwsoV5LZ5vUUE8PWNAyaicA+BxyCJCi57W7dpPsZlbt6wh?=
 =?us-ascii?Q?iPMy3oNQaQdqc+DAvgY9ve0OIueF5LtYiFfnFjyTX6KfWn804Fokeq2qjwXx?=
 =?us-ascii?Q?unILZcB2aHRbvnxXFhRrJ5qm7KhZiNIJ4gqmreJFt+qW3g+dMNcnKv/gpZlK?=
 =?us-ascii?Q?6zAfvhfFbZk0sZFzEKBxP/89RivMIFz0XPlLx0zimhLpGaz2adh64Kanbvd8?=
 =?us-ascii?Q?b6l9jhSrI4M5WI3MK0tiIAsTqIZdqED2IOFNHJ0tkglxwqdKzWDn77rFO80C?=
 =?us-ascii?Q?OTse6HZ2HYGRp1QfLjuBcUae0hXIiJJDE5r9ocur9hEN89/eItULFOPkImAr?=
 =?us-ascii?Q?by99uBglkCZborkiGGJybZS0UZan9IQmFMk6uAf0fBiHPXPRVDdk/4xIcJm0?=
 =?us-ascii?Q?gpbTgu7iKz+4j8gWxS3qp4o6ASO4oK2ElwYMeQFU2MCDSvBUt/U0p3MV9tlX?=
 =?us-ascii?Q?Pv5XqSoSe5muPMTBZ2o=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 10:54:32.1426
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca4ffe26-495a-4c0e-4dc6-08de28232fad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F43.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8883

Changes include renaming legacy IPU fields to NPU in the metrics structure
replacing ambiguous booleans and magic values with explicit
SET_CMD/GET_CMD and METRICS_TABLE_ID constants.

Note: This series can be applied on mainline with 6fb7433c7b8e
("platform/x86/amd/pmf: Use ring buffer to store custom BIOS input
values") as the tip.

v3:
----
 - Drop NPU-XDNA interface
 - Address Ilpo v2 remarks

v2:
----
 - Split the series into multiple patches per v1 feedback
 - Added preliminary PMF driver cleanups as preparatory patches
 - Introduced an initial amd_xdna patch that consumes PMF-provided data to
   establish the plumbing; additional logic can be layered on in future
   patches as more PMF metrics are utilized.

Shyam Sundar S K (3):
  platform/x86/amd/pmf: Rename IPU metrics fields to NPU for consistency
  platform/x86/amd/pmf: Use explicit SET_CMD/GET_CMD flags in
    amd_pmf_send_cmd()
  platform/x86/amd/pmf: Replace magic table id with METRICS_TABLE_ID

 drivers/platform/x86/amd/pmf/auto-mode.c | 14 ++++-----
 drivers/platform/x86/amd/pmf/cnqf.c      | 14 ++++-----
 drivers/platform/x86/amd/pmf/core.c      |  6 ++--
 drivers/platform/x86/amd/pmf/pmf.h       | 18 +++++++----
 drivers/platform/x86/amd/pmf/spc.c       |  2 +-
 drivers/platform/x86/amd/pmf/sps.c       | 38 ++++++++++++------------
 drivers/platform/x86/amd/pmf/tee-if.c    | 20 ++++++-------
 7 files changed, 59 insertions(+), 53 deletions(-)

-- 
2.34.1

