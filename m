Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795197157;
	b=1CWaRkKb6Ye0zJCrGeOLbw9IKe464RaV+AmEanV7eoGHH1gAM9YKQ9lwSZNUCCHbeGrG
	 qSMaNHuYxvGTjZVu4Eaq41CkeGean9kBDrtJx96X6MMzIv+d4Gh73gISqLvUdP3LLc0uu
	 fN8Ao7PsW1wH6roxYwwwy+P7OuUbySt+YgG94P7MmZ9LCd8Kl8XQ8UwUuYBVo1Jo7OS96
	 C1jZWT6AlDYQ1zIpj+GuwsuRVXNVDQvzVe7UkL0xbXHG5pbi/RsqMZ9wC3RHrUJVdz0IH
	 G3/ZOqPeBrXOKRcfODSkdVlxZxDx/w8iP05gJM6oNgQ3ps5Yz68eMY/fPccGma3CAJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795197157;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:CC:X-Mailer:
	 X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=1ygXtcGwTE8vlSQJnSZfTiVFOnpbPDPJw1GD0zV2xTs=;
	b=PA2/UH0JhIx0DnviwIWn/NceTqv2mnp8PvfyfWqrWA2b0VGWIHHrZ+3FneLSbFbqQkPJ
	 o5dRDjvWh/oqPp9XlTj5SK/vSS42jfrZMs7KEn9+QMwo1g3rzljuA2FluzCA0Ol9DhDzO
	 StN1ncfq/Q25punU/F22frBCUXuLjfWNgi5hbjM8czf5aKzsc1Ieg8IjR4CZ/5acVgZJa
	 8jdWVMWXN/gZbO2V/L+90MSrVHpxvC6MdUqNil64jdnZKxckJFOqCHTE7IPoH65o06tgC
	 xUaaL0tKWyVLnXkjlVA1LvxxOc/J8AUrHJlp3PW9x2UipqY2bKa3SDWUWunKIf2KqnA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=K3A462yZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.17
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013017.outbound.protection.outlook.com [40.107.201.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B24606A334;
	Fri, 20 Nov 2026 17:52:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58B24606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=K3A462yZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FaksS0cdty/W/W6EnrVuAU6tcRSdNO0ovRSqVLsmyluwJtulYHxDZgQDlCeaz+4n/70G7FFduWa8GqaRj0ICzB04HWvqU11vxV2bjjBZNkJlWx0KOqDzsXALgxLhmvVtyC0EX3Nz5VRGemqcCMWFlUXR/4qBUNzWyG+w84Upu+CeI9tSHqfNOLY2HBK7WA3c3Mq3YAotwCnIf0l5al3PszypP24g9YVvO8xK/bduQy4bmRxlOgmpayXthwT5Lr8ZBwE3uHERvtbCT8uKFDqTj5CQQZn7EFsZ2KXUk+fg3AkKyBSyWlJrLQS+SZr80S98ZHtMKoQhnbrpW7mdTZxxtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ygXtcGwTE8vlSQJnSZfTiVFOnpbPDPJw1GD0zV2xTs=;
 b=QnRP+ZrfpTLhm5rAft7JrbRmt3e9KPMDXDPUQHgK+/DIr27FJPY7fuA1cKkgdNcoZR8fRX/0Krfly+ETBRntrtAy4TFSyXo1tz7A4fx+wYBt/O4b/AZmlpQ0cWvxkDq/7DV2BmrFRm+NLnkwbizh+pxJj2Bw9DBPE1yLcBEfs0Cytb+YjNH0V9ogvwq7ci0NlKgUyDUwXioco+PRv8Rka3X5djGFNRroomhwqXObWk7cP1ufgNG15rhDMpQ/HNcrBrP8nKw19sii80xa0HpFnEscxBnp1PLjltlP+jKdOjS7UflkuG5U04gdFKZkN36dMSFWRQ5IprBV/bsnkCrW6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ygXtcGwTE8vlSQJnSZfTiVFOnpbPDPJw1GD0zV2xTs=;
 b=K3A462yZeyG9sZzHAJ8lPmb0AjpQypGixMfRwcyFFVw2aWbvEYZzCZn8XliW18c4jUzsB/dB0ghidqU6w8+a4nAtv0/WH1s7lkvCKKJ8Bb5jpm2kwQ2Hh7+F5ereMLuMGoSzhLVHTD3/GGQTgh4ZiaIRobxFKkPihicGlHRfYwI=
Received: from CY5PR22CA0082.namprd22.prod.outlook.com (2603:10b6:930:80::27)
 by DS7PR12MB6117.namprd12.prod.outlook.com (2603:10b6:8:9b::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.10; Fri, 20 Nov 2026 17:52:31 +0000
Received: from PH3PEPF0005961A.namprd05.prod.outlook.com
 (2603:10b6:930:80:cafe::6c) by CY5PR22CA0082.outlook.office365.com
 (2603:10b6:930:80::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 17:52:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH3PEPF0005961A.mail.protection.outlook.com (10.167.243.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 17:52:30 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 20 Nov
 2026 11:52:29 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v3 0/2] platform/x86/amd: send WBRF DSM payload as buffer
Date: Fri, 20 Nov 2026 11:52:23 -0600
Message-ID: <20261120-superm1-wbrf-v3-0-f6c872816dbb@amd.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANeIAGsC/32Nyw6CMBBFf4V0bU078nTlfxgXtAxQH0CmUDWEf
 7eFFRszq5Pcc2ZmFsmgZedoZoTOWNN3Hk6HiOm27BrkpvLMQEAqBRTcTgPSS/K3oppXRSwSUUI
 OEphXBsLafNbc9baxndQd9RgaYdEaO/b0Xf85GXZb2rf3aSe55CrJK38JZJm+PJA6fB57alhoO
 /hng7chVwKUijWmcmcvy/ID0uhF8fkAAAA=
X-Change-ID: 20261029-superm1-wbrf-d94050a28212
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Mario
 Limonciello" <mario.limonciello@amd.com>
CC: Hans de Goede <hansg@kernel.org>, Ma Jun <Jun.Ma2@amd.com>, Evan Quan
	<quanliangl@hotmail.com>, <platform-driver-x86@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Mario Limonciello <superm1@kernel.org>
X-Mailer: b4 0.15.1
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PEPF0005961A:EE_|DS7PR12MB6117:EE_
X-MS-Office365-Filtering-Correlation-Id: 251d4894-61d5-4261-b984-08df472f0c4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|376014|1800799024|32650700020|6133799003|18002099003|13003099007|11063799006|56012099006|261021121427099003|261021123027099003|261009223027099003|261102123227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	VPVe6Hn3w/PbW5AtZ75opugX8j2TT7YyzZDHVgKLVXYe/mJ99kBjhwfBbtwvN5/SptCWIdd/F2n+kbeMh+hsvz3Si4y2RfElXTT4rLUJw5Y3HzzFEX7n10L23xa8I5Ig33X8vmnkK1f96E8jPh3L+vIJf4U8ZaB5Ltsbre5B9p/E40Ab9E9QQXJkBZ89yeahUHqDGykcoeuST3MNbhPmx7BRKonlroX4DCBBkCDX8nWSB5xInQZoeyewt0rdXCjfcUkk2KsAnkt1oTtweJYhg4OCaaE+9ctOGL2YHQwsas3dtJ6vYQ+9wLRvWJPlmtIYVWZtsix/dp1R5CTzSlTmL0h5Ce4aRr+NfXg50U4RrKtAR8Q4k8gKYw/QCWtaam0BEDhsv2ObSPpuzT19NCQMPnKPliY+7yQpR9gi7A2fRQatthTyiGAhmnbASGLRzBYCvyXOhoaJHi2lUqVWcd9gRDZzJbcuK0BISeqkIQtPKr5arYXkpSmZ/Ph00dxOLoylg45v5aecAVc5zIeXKRtJoBXVCgKiinCG9LQnBSu3eC38QLPbQuQOPws/8N9jIeeYbuL7FGG5eu6BYXHRd8fRWEYgOSh+tDJSmCTEg0e5gJayRevNSaQIsNWef/OdY7lJsucpLNJCE0SXkkidEgKNjdyaK3zx6bTDSLdPCvUeax8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(376014)(1800799024)(32650700020)(6133799003)(18002099003)(13003099007)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0xpM++4Trx3XhYNVlTwYKx1kV++M+Jr3t9yacaz5pZQ8xEaEYe556DnsxtX4b5cPAkO2bjD15Qzd9rt9HUX5C8zPA+XwNjvvzlnWCS7x5PDwyvOzIJaO2alTEUJHzHXpvcQhEQu0F9wNKLMzOGu7Ozg3n09OOzdX3DCqXWjE+5kiDqgNkfxg56s630zje+QFcl8kHi50q9spNKDjgNlviG43gSfQnSCxjyeEd1r5Vnb6lVg/tHjgQrJwWi6j86WJCZhrhDR2UmHflWdLK0e8xeZ6ykMAm9dTfrAymKkFm7aUosZpBquTt/2Mqao/ma1jMSrPZoOR7Nr7SgkpHikaDhPs8HkWtJbUYMhgORsmHPCv0acYjegP5d1mPgm8VV5aeeYxQiS99nXt4/rDY8fJK2V1ezq1eot0eq3vJjQaIBfxbo8lr3AMz5Z+j6iPPX14
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 17:52:30.4312
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 251d4894-61d5-4261-b984-08df472f0c4f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH3PEPF0005961A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6117

Signed-off-by: Mario Limonciello <superm1@kernel.org>
---
Changes in v3:
- Drop unrelated whitespace-only changes to acpi_evaluate_dsm() calls
  (Ilpo, David)
- Drop __packed from the new payload structs; they are naturally aligned
  (David)
- Add a new prerequisite patch adding the includes the driver was already
  missing (Ilpo)
- Add the includes needed by the new code and put <asm/byteorder.h> into
  its own group (Ilpo)
- Link to v2: https://patch.msgid.link/20261102-superm1-wbrf-v2-1-28b02bb4ce61@kernel.org

Changes in v2:
- Declare payload with __free(kfree) at the kzalloc() site, after input
  validation, instead of initializing it to NULL at the top of
  wbrf_record() (Sashiko)
- Compute payload length with struct_size_t() so it no longer depends on
  payload being declared earlier (Sashiko)
- Link to v1: https://patch.msgid.link/20261102-superm1-wbrf-v1-1-b58d8d85277c@kernel.org

---
Mario Limonciello (2):
      platform/x86/amd: Add missing includes to wbrf
      platform/x86/amd: send WBRF DSM payload as buffer

 drivers/platform/x86/amd/wbrf.c | 73 +++++++++++++++++++++++++----------------
 1 file changed, 45 insertions(+), 28 deletions(-)
---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20261029-superm1-wbrf-d94050a28212

Best regards,
--  
Mario Limonciello <mario.limonciello@amd.com>

