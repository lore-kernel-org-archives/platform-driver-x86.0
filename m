Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2085.outbound.protection.outlook.com [40.107.101.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCF820FA8B
	for <platform-driver-x86@vger.kernel.org>; Mon, 21 Apr 2025 09:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745227299; cv=fail; b=Ky2bY8dErovOhJ/ofhbhS1DI4f0AOMSxCisIiV/b3/EXPT+xQEiwcAy1jK0HFPfTVxwX+4AkHGTsjlKdlAfdLZTN8vLaq6CamQLAMPS73j7DQ89rqqn0b8Q+aHcCr9myhP2RlkF7onY3rjirkdKMg9eOFh7a4N9usGoI28sCm5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745227299; c=relaxed/simple;
	bh=F8KFZd/G5BE5I1lxzu5A0MeneyUYLT7vaVYYlyT12sE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VaM3CG1sPCP46dAdgkGthBR9lDn5Xa8gJB1kbuhg+9Cy84c/CT0UCF9WE2eL+4GYe+gEjXZD9uGvaR326aPch7gDwpZlhNLzAwCCyn3/L8HZxawNCX1HfrCZEzoxNbzFJPH8kh0b+e1R/iGU7nU1qiGz7Wu9Xibf0An7C8gbNbU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hvkKWmr9; arc=fail smtp.client-ip=40.107.101.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hvkKWmr9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jLRPco6hET6/jYLADYQijrxyPS+aH+uJUdGkEo+FHVO6apgADwJG64lBZPaMqiw/+vNgKaLxVD41UwWeRniF1Ca5z7u/zGc4u1TfnK+ZQ2mGQtLjtjsGuueJbwTvS8jmit4Apo0G6KDRSp0dtozhogXTAdX/cdx1lqMlSuRayl0I5/fVybK5YSaQBFWxe8niejl4blws1JWDnfVLy/f1pABuCM+uAmLLkzA/AESGlAnOBb/IJUChXZWWyfQ0CziU4+QlyfirEFihd+VLaa7ThsvxKp0HDL7DIn4hKlTQ/X/DwjDY9gbg1nc3Oed8AIjcCzrpR8KUDILFB2pKOwhwpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DkGnuvNVxWDtWpBeqU9bj7IalGR77jvUo5rbZYj5xqw=;
 b=OFK4/xEXq2RcbjAKQbmmukKRtu0ZU1iLqWn97xHUkjDyJjqxB6T7EicyxUoPxMEJCODiIQ4MBra0XR+4xrkpO2NBbKB3+2qW3aDW5W9EYb0xvczNYTcn3LfTDD/oD/QiQEvOo0cKZO2Zmf9Kr2s2lfsf3ebdfA1ieD0hDm1FJdriQJ/OJs575hAqZYF+mGnaw4a2qkyIzY6gLWLwQRNCE65yXDWymbGwB4Ce8A0Fs+XGDwN0SSDa1gcPwyq+kA8nCNmQoJewrsFclx2VYSSl8LO+axB0JVs/WHc3UZQy1dw40rqf5n3N/noNuXE5U35R/lRmwNDF0Q5QVKe7T6J+0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DkGnuvNVxWDtWpBeqU9bj7IalGR77jvUo5rbZYj5xqw=;
 b=hvkKWmr9S8+fHzIfsUOjIale9UM3ufoLIQCETlHRXEraGbOku1KvR49dI54ZxFPIijSmqItPowrQmPiX/z1d+3LDwWPlKWuPaNj4wAhsw43dhrI08PqeO32GEAp9N7JKIHYXOQE3a821V7/6qr9kILQtr6c1m+b+2+iIFEcCWdP0+lhI8ATlYRYBvuMYBwDtFJ0po99wfInMZjiPVoqwyYSB2FfBmEVFI/e9jQjl+hEajS1rBWXDEjH+obYBMdwnema6WuK2L4h7OPIMfHW3j5OpqEcj6khLPF1KseMLZz1DWYDyqR9HNFtwV1yq7jlRGSO+/toAAzw2BU9Ed5ntOA==
Received: from BL1PR13CA0188.namprd13.prod.outlook.com (2603:10b6:208:2be::13)
 by DM6PR12MB4284.namprd12.prod.outlook.com (2603:10b6:5:21a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 09:21:33 +0000
Received: from BL6PEPF0001AB55.namprd02.prod.outlook.com
 (2603:10b6:208:2be:cafe::14) by BL1PR13CA0188.outlook.office365.com
 (2603:10b6:208:2be::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.15 via Frontend Transport; Mon,
 21 Apr 2025 09:21:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL6PEPF0001AB55.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Mon, 21 Apr 2025 09:21:33 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 21 Apr
 2025 02:21:17 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 21 Apr 2025 02:21:15 -0700
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <michaelsh@nvidia.com>, <crajank@nvidia.com>, <fradensky@nvidia.com>,
	<oleksandrs@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH platform-next v9 0/6] Add support for new systems, amendments
Date: Mon, 21 Apr 2025 12:20:45 +0300
Message-ID: <20250421092051.7687-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB55:EE_|DM6PR12MB4284:EE_
X-MS-Office365-Filtering-Correlation-Id: a8647d3b-7f4a-4f80-0e63-08dd80b5e867
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d1k1bzVPRDNqREsweFZuZkVtVzlZd0ZJZnN6M3NrNlRxQWI5cUhYV1lpcW5V?=
 =?utf-8?B?bWFGZnIyZWZCckZmeksvVlhSNnBGVVNRQm05VXo3eHNER09RV09Wb1oxUlJo?=
 =?utf-8?B?a0p4Rk9GRWNKZ2ZOVC8xQWErV0lFVzJZSG0zenZqdnN0T0MxNVBYWkJvSnVk?=
 =?utf-8?B?Ui94UVoveGJUZXcrZ3c2Ukh1NHJCOWpXUTNYR0wwZlFwNXdvZk00MGR0YURJ?=
 =?utf-8?B?OTJuUzNSR0l5bklxSCtQa3RjSEZjNHVJdjNlYlRzdUFYZU90NjNxT1lLbG0y?=
 =?utf-8?B?aUl1a3g3VGhCZ1QvWGYzS05SQSs0SHAwNmZVY3JCdmJtWXpESTU1NjBHQ09J?=
 =?utf-8?B?UVhnT0l2NG1EWmlTRTlEbWh1MzBRZVA4NFJaeHRQczh3dHVON3BveExWZTJ3?=
 =?utf-8?B?d0RnMUs0YW5ESFJaeWE0bW44ZGNYOUVUR0E5N1cyWE0yNmRIeDUvNE9pckth?=
 =?utf-8?B?bTVNMFdPRlVYS0g3cTl4dzhwSHdHbkVMWG1ab01mUStpS2VKZE13VHNpWDlT?=
 =?utf-8?B?dXpHUUN4SCtQWnM4RDlWOVNrcmR6bWtwMUVyNkcwdFJiQy9MbW5rMGo0cE5N?=
 =?utf-8?B?emViMUxEdHhQUFlqN1FkREdudXRhcW9mdG5VdVRrUFY4aWZnUjdIc21BWlZT?=
 =?utf-8?B?VHB5TDl0NEdBdHFOTUFxOUdQdlcxRnM3VnlyVFdseDYvcEZuUkd4NkhBUWx0?=
 =?utf-8?B?QlFjTmZROWNMWTVxLzJFbUMvc2IvUWRpSktNTVFrcjdONHZaVnJlMVRrbW5m?=
 =?utf-8?B?bVMxY1dWQUN2ZGlUQlAxU0R0RE5XWDh6T011c0k2OXU5QnBuWU8zYjNxOTh2?=
 =?utf-8?B?V1pOVzJmSmd5a1NPN08rRHlTRUpBbi9hZ2YxdUluVHlpOFk3SzI0b3NHamNn?=
 =?utf-8?B?UTU2MTZ5OVYvWS9uS0h0d1ZTdkJHeWdOMCtqenVnWFlxalo4UHZuN3pxMTlL?=
 =?utf-8?B?citobUliU2dtaTl5TDJ3amxEdmVyS1lYMWNJWUJLY1JiQjJiOGFvcG9YWGp4?=
 =?utf-8?B?VHFBcE1iOFJPWHFvNFVaYVZEMys2QlVuQ1N4OTNsd05lVThwMTloT282aHhP?=
 =?utf-8?B?czdVMUJXV0VucDFvNml4ayswUTdjL0F6eGFmVUVUR0pGY0EweEtYb1BtVktj?=
 =?utf-8?B?Z2hFNVRhR25hYlBkeFFKcnd3dWlwMHRscDQ5QW1qd1AwRWVxUmlQcWJHaUkw?=
 =?utf-8?B?ZUNlL0VibHZsSlFJMVFaVXZvRm5HQVdIZ2llcXhjYW5EYTdCcERmblFnVTRD?=
 =?utf-8?B?eHVCendiVVhkdnNnejhVMmVzMHZmNnFlUXNGSTdTUHF4RFQ0SjNJbmlMTzAx?=
 =?utf-8?B?S05uL3RVbjRGWTBDbzQ4MG94V2NoMXREUDlHeU1SaVU5RUN6NWNsRDJFSktx?=
 =?utf-8?B?TGNKRmVnQkV5bHp3KzRsR2RjcmVqYTJOdWtoK0swckE1U085WEZFbEFsS1ZL?=
 =?utf-8?B?andmZlF1SzljVnRzTVVFVnlqYnIvSWFYdld2T2lpS3FselhleHZ4Q1hKSkVw?=
 =?utf-8?B?UUFLbkdLc0p2NkZMZHJXcXFxb2c2akQ3ZnV1bGphLzZzbTlTemtnQ2VVaGVq?=
 =?utf-8?B?SUE5M1k4UTRLQm9VOHFqRXFqUzRnMktxT3B2ZmJYTXJrcjlaODkvR3pyRDM3?=
 =?utf-8?B?M3Z5R3plcmZiQU80VkZWb01KM1FaNlJYeGY4OWUzZ00xWEhyWWh3ZlNyMlRK?=
 =?utf-8?B?RVNnODk0cFA5RkpsVVR1bDVQOXcrcENhNW9KSXVyZ2xoS2FOd0xpdW90ZW9X?=
 =?utf-8?B?UUNkZ1pHUUdKMS95WDcycmhHYWYwMktiRUJCMDFGZEhmb1JyL0FHSC8yS05Z?=
 =?utf-8?B?aWVQTkhEYUNKWUVlbWJjbE55SWZwS3lSY1ZxQVJZUjB3bjhDU3RkWjA1KzJJ?=
 =?utf-8?B?Z2tPQWY4L0RxaGR5SUNOdzBKOXJ3NU94alpUQUlQdWFUcDdsWkpPNlNHbmRZ?=
 =?utf-8?B?ekFRV1dmYW51YzVlaUJuSVN3MzFsYWwxdlJSTzc3RUk5OGsrOFNDSWNqWlgr?=
 =?utf-8?B?cjAwNjFrelpmcmNpWXJoUUNGdWFYV1p1N3ZyVkk4TEgrRFdRbk9QWDlzMkdG?=
 =?utf-8?Q?PX4AX5?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 09:21:33.1097
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8647d3b-7f4a-4f80-0e63-08dd80b5e867
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB55.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4284

Patches #1; #2; #4; #5 : Introduce systems: new SN428 smart switch
	equipped with DPU for offloading, new 2U systems SN5610 and SN5640,
	new compact system SN2200 OCP rack complained.
Patche #3: Add cosmetic changes - removing spaces, style.
Patch #6 - Adds documentation.

Vadim Pasternak (6):
  platform/mellanox: mlxreg-dpu: Add initial support for Nvidia DPU
  platform: mellanox: Introduce support of Nvidia smart switch
  platform: mellanox: Cosmetic changes to improve code style
  platform: mellanox: mlx-platform: Add support for new Nvidia system
  platform: mellanox: nvsw-sn2200: Add support for new system flavour
  Documentation/ABI: Add new attribute for mlxreg-io sysfs interfaces

 .../ABI/stable/sysfs-driver-mlxreg-io         |   96 +
 drivers/platform/mellanox/Kconfig             |   12 +
 drivers/platform/mellanox/Makefile            |    1 +
 drivers/platform/mellanox/mlx-platform.c      | 3612 ++++++++++++-----
 drivers/platform/mellanox/mlxreg-dpu.c        |  611 +++
 drivers/platform/mellanox/nvsw-sn2201.c       |  110 +-
 6 files changed, 3389 insertions(+), 1053 deletions(-)
 create mode 100644 drivers/platform/mellanox/mlxreg-dpu.c

-- 
2.44.0

