Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43CC0C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 30 Nov 2021 11:23:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237016AbhK3L1H (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 30 Nov 2021 06:27:07 -0500
Received: from mail-bn8nam11on2061.outbound.protection.outlook.com ([40.107.236.61]:7731
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236934AbhK3L1G (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 30 Nov 2021 06:27:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cvsQFZxAvuLLgxz3udCAJgbUYOP2E7YuvshyC8jOfVvz7YYG+x4N4nJKMyNx7XW1vWyiPx3M2BMdyvMrXnQWVF40OfMl9GO8B5NDHLdkH+t7Do1qo95ahlf/y9d7wehn9IEoWRxsVQMRrucSEmFvP9uFBDqq+gu/bmTDKw14ERwIsTye5ow9Y2SQZjAttm6U6mlMeQEvsMU5gBiq+XIkhGJ0qYAXGK7zuE2ZZ4iINEvQW3Bdyyn5ZHw8qKTtjn2q10EDbKBML3dWg0tVbEM6GQgQuxzF4OX4BT75qJpsBLYMASwBAkGNEhGbZV5tgKuM+wdFzos2ZRWY/Av04oPubw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U8JRRHnEUpuDrVHMovpXI8teREgfDaOw4gaXDnxbnmo=;
 b=IKIzh2vAUKXG8Hyg2dWNlHyzNVTKQraY5SdfAAreXi2WcK0qmt4dXtZ3l6YK1gBUe6Qk9m/wd0LaVqZNm1NocyGZetZ5OprxUxd4xGHtm41f+pZF8kM8fu9261MZalel9QPirI5pBJVbSVqS1ZO1BA5BWzResbJWfbSbVZh3WkqzHEg459XKxG7+kywtzgKe9REPHZ5gZvCaVTejimf1vBYaKyEDj2h8p0gOcV2TDky71KhtsiSGe9PqiZiabTLO7Lu4ni+YeJ8KHynhaS/TJDr5lDLxfeVE4v914yrH286EsWYy5WzQAaDlkc753gsDV8A2iKAtEf8NbV9+O4fnAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U8JRRHnEUpuDrVHMovpXI8teREgfDaOw4gaXDnxbnmo=;
 b=EsOmQxAVOjIZZRbG/N/ehELCKTp8Wo5ouLhJLuTpDQYH8Vo4BYRAt8eA4W2wwQIojIgqwkBMsKtT8QB83aAPam8uoCkwhm1e7wMjVlaYFcnw7RMdT+R1PTtGlOE8I4xOB7GTMKLsOB1iFt0rbMxAPmyWJSwyxfJBv8xMknh46LA=
Received: from BN9PR03CA0379.namprd03.prod.outlook.com (2603:10b6:408:f7::24)
 by DM6PR12MB4466.namprd12.prod.outlook.com (2603:10b6:5:2ae::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Tue, 30 Nov
 2021 11:23:46 +0000
Received: from BN8NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::c6) by BN9PR03CA0379.outlook.office365.com
 (2603:10b6:408:f7::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23 via Frontend
 Transport; Tue, 30 Nov 2021 11:23:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT018.mail.protection.outlook.com (10.13.176.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4734.22 via Frontend Transport; Tue, 30 Nov 2021 11:23:45 +0000
Received: from Celadon-CZN.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 30 Nov
 2021 05:23:43 -0600
From:   Sanket Goswami <Sanket.Goswami@amd.com>
To:     <Shyam-sundar.S-k@amd.com>, <hdegoede@redhat.com>,
        <markgross@kernel.org>
CC:     <platform-driver-x86@vger.kernel.org>,
        Sanket Goswami <Sanket.Goswami@amd.com>
Subject: [PATCH v6 0/2] Updates to amd-pmc driver
Date:   Tue, 30 Nov 2021 16:53:16 +0530
Message-ID: <20211130112318.92850-1-Sanket.Goswami@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd77507f-53dc-4df2-f2f4-08d9b3f3df73
X-MS-TrafficTypeDiagnostic: DM6PR12MB4466:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4466DB4BD571A052D3149F149C679@DM6PR12MB4466.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U7s2KlIxl4ZS0Y/Emz0j5vrI1cxvk9JUGtonhdVsn5VzaksWvrQKfe7RVtfz+UkTl3NSxHO3mMBLMt+fA5MH69+o8yr4xYrS3qUkc5iqfTnONnK2Uq5HbOfrSi0+Vm3NKAzZV+4RKjHM+uR6KAXjXJS0f+WkqDBzESVD4rUdIIII7SqAqhGlVCn2MP33Kv0j1S37wxFDcJnJbFwPIs65i4FueO6pN4gFTlF80vIGtqbQbaqjrAi7GvJkRCNeT+CpUGNEnUT78XtJ/qa2tHyn77mrBziaQVTW9P+FIZURTZOwt00QxsY1fZMw2pBjressblDAcGRVWu+KrVX5vx94Oc27ay01l+PcUl/DDqyszA2qflGnVJv91Rze5MvJwyUZ7YBpBKMfC5x5/0z8f9/QNsXR8t++mSA2BZrAtS3DoMvtMuUKpiWebKfFBHE1WrMFBhgr/f1F+k1Apz8gfTwGYQZswIYRJXT8NWBGjeGvzvOMVBvwwhTh/+6tOFI6Z3tlVwUcvmS0qg41nSil7Qzwi12cQ/0t78/XzohF2eJon7jr5lNzmxlTt4S6VxVFx3qvswmRVDNuURPLNcu3uePiLMEPvfP+grHeqyEcNxpGMYsGPXqDPonSrrQLL9OhlfsuYVa8F7KUpPMkFOi3EkJ4inDMSnpn8Axa1NmBwzrDgTLChVxhBM9xtuwwP+KT6V32/ikl4V7s0kkeL6Q3AyrKWjDsJpHoEMTkY8LNPZc/lQHmuaKsQ3qaoeMO0l8nUX13G7c/9hhcsujLNSx6Fz8EV/Y0YUTlMzASTRCom4V6rf8=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700001)(186003)(82310400004)(8936002)(16526019)(54906003)(86362001)(110136005)(7696005)(508600001)(36756003)(5660300002)(4744005)(26005)(40460700001)(4326008)(36860700001)(8676002)(6666004)(336012)(70206006)(47076005)(426003)(356005)(70586007)(316002)(2906002)(83380400001)(2616005)(81166007)(1076003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 11:23:45.5960
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd77507f-53dc-4df2-f2f4-08d9b3f3df73
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4466
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This patch series includes:
- Improvements to error-exits in driver probe and store root port information
- Introduce support for AMD Smart Trace Buffer

Sanket Goswami (2):
  platform/x86: amd-pmc: Simplify error handling and store the pci_dev
    in amd_pmc_dev structure
  platform/x86: amd-pmc: Add support for AMD Smart Trace Buffer

 drivers/platform/x86/amd-pmc.c | 172 ++++++++++++++++++++++++++++++---
 1 file changed, 157 insertions(+), 15 deletions(-)

-- 
2.25.1

