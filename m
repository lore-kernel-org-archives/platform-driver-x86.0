Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012014.outbound.protection.outlook.com [40.107.200.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBAF3AF66D;
	Sat, 17 Oct 2026 16:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792255935; cv=fail; b=ln+bd0/AGe/h/bPi5WH8/BhoVD2nyOaQoJYROKdLSC2iTkOC0yeQZCKBv0Vztz7gWSizIqawMEkVMaucKGCWdGTGJS76d4caDmALC4hd7XyyoZ8Pntgv5hMPei2t5l/xVyf1poA9BtnqAeasPs+2d4xggr7Lm0caEGZa5SgkmS0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792255935; c=relaxed/simple;
	bh=jzVqSWuV3eRFsyLqV7d/C+Kw4VF7snYjs0k7HNhAoZM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=n/GBWchg6xi7XGE911jVdGYU19VEcI4eU2OK1yxFEohzMMvfff+6veoKfo0irLzJMDGUsECs90wQEXTvlvfDJoIZ5XluJbAAQq6nBMdVLxl/rUdAbJ7wE1JXe6Gc8XiwOsVLaCXmUE37+1oQoYTP56mlToLBU9jLy+vS9VSSm+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mhC2TfJj; arc=fail smtp.client-ip=40.107.200.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mhC2TfJj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TIlm9PoWvCWohQbw42kSA3X9p03GQE5yA3r9w/TGIoJUeuuoMelCk6UD5f7brjUFZLKx54izyJVibRmJGnfuBlrqDJp/srJ4J/1NJwewxTEfp8f+Xj8y8bqh9peB1O+HLwL0uKU5oTfKU3miPHArKYRCo21xwcVxgPsSTAZiHS1jx7Hj0hlJ4jtV9xs5dqOq5w7p+b3a8aUYBjTugIZvDHreoODcZS2rHZOizXBV9UpNlxD9yEM6YDTcLk1wOspOG1vOhqs3a/6PWcY/Lo7Bl6huWO9pQuA3Lpt12SAFABDa5Uwxh36q5seaBjUmkSHpnM8s09K5uElG2tQHNPJaGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CWkMdo9tXelPMiWeSmwJ4SMEg0Ce91WAeBsCcoD18Gw=;
 b=lcgblwkrXRhJTpUm5F8amxKn64bPA4W3Wk4/OB3pnlv6dt6C0wOBmkLbxoFCoUboXFB8ml/ljUWSRZfwLNClUTdMiiJzlfFf2HbpWTIC+Ff6dJeVvKC7l116X6FVJ/n6c9Tg5JDNHCCiEmHR+ARKSM7SVchziiRuL0sQG8R1VToF3b9OsqQcLXz9fwYO/7CaQwJDx6qDNb4YQlQIYaVrS3PxjcXjUMtWTGmahEi1HAZJxyrOEBWC9C4TtYBZRhnLoPk1skrzmcwMvFh0snnPHfPJKlymCxQNzRvmT9tOjWvbSblN7vo50i4IhD0mSNsKpPWuWNh7ELYg8gHWsNTNMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CWkMdo9tXelPMiWeSmwJ4SMEg0Ce91WAeBsCcoD18Gw=;
 b=mhC2TfJjKPD5d2w/+3xRdiYU9ROAmooFtmLcF2bnoqdT6WpnbCSJrzXE3quu6S7e7CzbtT2GbCs7HNh/IzCBcSznb2iX/acvnjs7Y1n7H+rS8vzVU8Y+8FnXM228niprs/PC2V4+OpLej8iEggTV/JdjzDRThaTCaivY8H/swg4=
Received: from SJ2PR07CA0010.namprd07.prod.outlook.com (2603:10b6:a03:505::27)
 by SJ1PR12MB6362.namprd12.prod.outlook.com (2603:10b6:a03:454::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Sat, 17 Oct
 2026 16:52:11 +0000
Received: from MWH0EPF000C6184.namprd02.prod.outlook.com
 (2603:10b6:a03:505:cafe::15) by SJ2PR07CA0010.outlook.office365.com
 (2603:10b6:a03:505::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Sat,
 17 Oct 2026 16:52:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C6184.mail.protection.outlook.com (10.167.249.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Sat, 17 Oct 2026 16:52:10 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 17 Oct
 2026 11:52:02 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>
Subject: [PATCH 0/2] platform/x86/amd/hsmp: Validate num_args and Report raw SMU mailbox status
Date: Sat, 17 Oct 2026 22:21:51 +0530
Message-ID: <20261017165153.3748458-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6184:EE_|SJ1PR12MB6362:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cad52b8-8fa8-4f47-6d6e-08df2c6efcb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|10067099003|18002099003|3023799007|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	/+beaxr97KjlJAhSViCTnJE/QNSCpq+NrcAjB8dLrk2mM5DdRCilmDLyEoa7QUITdwAioAzonwi5ZPNWxDNJlAtLw/gw/NJQRHqnfEaU3GoDEca8Z0w0ygkz+AQx8MS3iWeiKnC9eitmJfEuvmCzEk+T2iFc426lO1OjIkrUCEMgj92b/5CL0vJsIvScC81dKcgpSNu7tmgj8ziYtxHuwsYPxY9d18XqYf2IV4n7h+uCtwt9AuJjN+KC61XkEC6Tz/HzgF2wkRWseJ2Ok6z5F6DlcJecZBVWh57SFuQ3mELlpwslytBrheDKQDTVK9AwUBnx8HKCH6eyndyJ/Xbzmegrple1S1bKENq4RBA37P9if+lNiBVJ0uWCEyuHSNVNYXOdENEaSDBsfVlNLypmdy9Ze0yEnB6y2FY39BrvPJxceo3bRB5fX1Fcaj7yssQVWEt9cnk+R4DPrWEG+B8X2H9pYB4pw/Wnty+xtdYzgZijlTJIgpJLlJkequ/3Q5MGMYDXqkUbZes6HwPJOK954sWYMYB+P0MDTMx+dvPH89M+aHRQSkpYp4jEuLUVChjDpI5cBktVhlCq2KmSO0hzw0ne1YV6xy2fUcbypHoP+jYeJYEZ49asmNiVaj9jDKMy3cLcUSmzWW+Ua5Exw5hgKJvthCzMKmgNHk8/w9/74t/jPdrTpQu1wTpirhS5Z/L/zJ5ZtKyOLNqHZ2xUtobFgw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(10067099003)(18002099003)(3023799007)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oCmuUWxmxn5r1aDtUgAW2AVxXMIZ0QIfEKkKHMIGW79VLieN+6j/Sgqiy+X8EgF+3SKyC3xkohffJXCdi1GcUwKMGo9PuxOYnZHS0omxXTSWbMKRPxXZEBc0EaUxR+rJU6yIdr4qo+PmOnygGIFdmDSazxuEpV6cSZBGUakd9Q0EM94jdK/1V0B9yC15fqUesj3Ll0MensorOCLTJYg4xRZSaKmIQx1tJikaVRZLDtjbIaMNc+URRFZz9Fp+0eNIK3D0KdP11WuQOvzfzpd83LnXLjMt/sJG/95TN9yq/AmQvRmcdAivnUL3WQLMO0c71upbL57T8Bi6yWTrPRJHgKxvou3C/rnK41BYrFFAodbZAK0e8I+5vFcuXtD7hTFlqcjQlextaplPrfXBjy2U4ZeRKfNlGzekhZH4CJkEsPJVqBAtAotYn7uihloa1l87
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2026 16:52:10.7032
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cad52b8-8fa8-4f47-6d6e-08df2c6efcb7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6184.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6362

This series adds a __u32 smu_response field to struct hsmp_message and
struct hsmp_telemetry_data, so userspace can inspect the raw SMU
mailbox status instead of only the translated errno.

Patch 1 is a preparatory fix: hsmp_ioctl_msg()'s fd-mode gate calls
is_get_msg(), which reads msg.args[0], before checking that num_args
matches the message descriptor, so a request with no args can still
reach that read. Validate num_args first.

Patch 2 adds smu_response to both structs, set from the polled SMU
mailbox status register, and has hsmp_ioctl_msg() always copy the
message struct back to userspace, even on failure, so smu_response is
visible on every call. It also fixes a related copy_to_user()
error-check bug in hsmp_ioctl_get_telemetry() uncovered along the way.
Both structs grow under #pragma pack(4) (44->48 and 16->20 bytes),
changing the encoded HSMP_IOCTL_CMD and HSMP_IOCTL_GET_TELEMETRY_DATA
command numbers; existing userspace needs to rebuild against the
updated header.

Each patch builds individually and is clean under checkpatch.pl
--strict.

Muralidhara M K (2):
  platform/x86/amd/hsmp: Validate num_args before the fd-mode gate in
    hsmp_ioctl_msg()
  platform/x86/amd/hsmp: Report raw SMU mailbox status via smu_response

 Documentation/arch/x86/amd_hsmp.rst  |  28 +++++--
 arch/x86/include/uapi/asm/amd_hsmp.h |  35 ++++++---
 drivers/platform/x86/amd/hsmp/hsmp.c | 111 +++++++++++++++++++--------
 3 files changed, 123 insertions(+), 51 deletions(-)


base-commit: 03f79b70cfa59c76751bc176e6a85a5a67c91801
-- 
2.34.1

