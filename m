Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA9A5C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Oct 2021 18:41:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9107661078
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Oct 2021 18:41:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238354AbhJZSnx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Oct 2021 14:43:53 -0400
Received: from mail-dm3nam07on2088.outbound.protection.outlook.com ([40.107.95.88]:16257
        "EHLO NAM02-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235794AbhJZSnx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Oct 2021 14:43:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iCDmv5aQY0EW/80XDl540qq4veaK5qzYCDXUDqcEccom8qKkTzsiSLJUNSZTMnSx7wLtt1kGay30r9O1ee/dWJU91O2hRNwjDMSdGizWoDWZszEbsfVBX6VhC5sIPxn1GVUGQ2og85S0pu4tKVIOJTB894XsxQEmANSEcdqLNC8TUheNccQDBCVxUJ4PrGl2PFj4GYaEmz8QGZrSxq9okKmQ/Pzb1FsXCrlQfsS6oC4ImmfZC11Mn2SnXLmes9AoA5t8e/9TCqm9jZqzWyBxb2D4VMj0Gpwzv/fOen0fj42b84Bir0omsZCIWuQFPrvCFjzTB+2ToOENliIwEblQ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OF8fH2dORV0zMnu08Kft4kvT2MADVZOckcnolfxR68w=;
 b=bx1NJB5l7veMAuSCuyFJrZBdJ7GB9cxHoz9ykiW4LOEOREDMVFAA7y6/lUcoYJI9hW56r4XAQLG/VjqaWXnnDzJGJVtAOxJ3aVYnUPAApnj/qt0EGzPag1uaOWCXDoYF7ewRxaZKw+Jvz1GST5I5/8u+HOvJ9QNBU1F360JSZpxH5jxNmiVhzFJtusTDH2q4/cvYIRqcdAsfxhzIvn7QOsJVhHKVQyR7KVFW2fNZSifYiCeHu1vhAkb6JEPGCdMHYZhXQKDtNxFU7FqGdyZrOh5oxDWMXj0G4wQTF4EcPk7+fE5bOol48U5vUtfD33d3MqUO8umVoi1sxkCIvq5Kag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OF8fH2dORV0zMnu08Kft4kvT2MADVZOckcnolfxR68w=;
 b=uFUFTCQpaSR8PAcIGOTDPuRViYmZXzBMIWGYNH5RRK+br3+Y7uBuoLyUDURo88y2WPoJ9FpLDJCm14rRWmZEP2q8Jm6VYCjQgX5cpNNlfd/N4QuwlJNH6JRll8qa1y8QkAUavpSKfroV1h/t4xgGRCgsljKCcnHg/EnnSlnoDsw=
Received: from DM6PR02CA0147.namprd02.prod.outlook.com (2603:10b6:5:332::14)
 by CH0PR12MB5265.namprd12.prod.outlook.com (2603:10b6:610:d0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Tue, 26 Oct
 2021 18:41:27 +0000
Received: from DM6NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:332:cafe::6c) by DM6PR02CA0147.outlook.office365.com
 (2603:10b6:5:332::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.13 via Frontend
 Transport; Tue, 26 Oct 2021 18:41:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT067.mail.protection.outlook.com (10.13.172.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4628.16 via Frontend Transport; Tue, 26 Oct 2021 18:41:26 +0000
Received: from Celadon-CZN.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 26 Oct
 2021 13:41:24 -0500
From:   Sanket Goswami <Sanket.Goswami@amd.com>
To:     <Shyam-sundar.S-k@amd.com>, <hdegoede@redhat.com>,
        <mgross@linux.intel.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Sanket Goswami <Sanket.Goswami@amd.com>
Subject: [PATCH v4 0/3] Updates to amd-pmc driver
Date:   Wed, 27 Oct 2021 00:10:42 +0530
Message-ID: <20211026184045.2201-1-Sanket.Goswami@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04dce0dd-a298-44b2-b08c-08d998b03809
X-MS-TrafficTypeDiagnostic: CH0PR12MB5265:
X-Microsoft-Antispam-PRVS: <CH0PR12MB526536BE4A94AEA219DF37CA9C849@CH0PR12MB5265.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YfwVAd1wljI6vRvQE5w72Cg4saGatbbEOCvyuXO7G90MYXPc4+jJ61c/yYiAUeYA8I8kVx0vmUy0YD/N8M5f/8SkZ2BS7vtumFUDRxa8gMdLlehd/oopATh4xK1ZlKm5+ME8r32/Cl8IyX28gzLBsju5Tnq27JLOwzXnNAZvMEzBm0UOs6gtFbk4u9+pR7r/bAKJRix5+sjFEdjOSabhKryrK3WcO4FRjh/Ni+w5DM06Hiy1hUPH56IDkrTT8XHFgwckcIjio86Fpyun8b3weTNT4drYCqTHCUBUllLiKOfxckCUYuGKS3lcFSAY+ssw6tw+zN4avmvAz2UxMYYLq++nLBzgVDVp0PNoXOCFcK5odUd3sIBKEeb510ZQIPOeS9p7nD1wry2Nf8TU4VRamE6A4yw7m74PwVu7Z7T69WSAM4kPBpSAMBEDTnIbcXHlIs6fR+7bez6DQqHupMw4P9MLlCnfbM6QrMSfkHTg4KzQuld55S6rWx0/Ceek+gGLf6t9Vz4RBvzbAaWAKlO4tqVXhMYqvLknrOAf+oRyI1lJRpkAYrRnpveZy7VNYpUb5R9lih2Pxhw25BSFXRv2geaUM1fdX4iSylsO/z9Z4wyNUVBm8aNdL3ZB817TSXTCYL2gHKjCjYE1aAN1dbPgNwIRSpjM8I0+dLFCVU8hjuw1jjjiy8RHx1rK7m/YCT1yQ6h9nToU86x/SIgAw0Xyr1WPTErhuLGvp+Jk1wOTvCY=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(47076005)(7696005)(83380400001)(36860700001)(26005)(16526019)(81166007)(356005)(86362001)(2906002)(426003)(1076003)(36756003)(70206006)(4744005)(186003)(4326008)(6666004)(336012)(110136005)(82310400003)(8676002)(2616005)(508600001)(70586007)(316002)(54906003)(5660300002)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 18:41:26.9522
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04dce0dd-a298-44b2-b08c-08d998b03809
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5265
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This patch series includes:
- Improvements to error-exits in driver probe
- Store root port information
- Introduce support for AMD Smart Trace Buffer

Sanket Goswami (3):
  platform/x86: amd-pmc: Store the pci_dev instance inside struct
    amd_pmc_dev
  platform/x86: amd-pmc: Simplify error handling path
  platform/x86: amd-pmc: Add support for AMD Smart Trace Buffer

 drivers/platform/x86/amd-pmc.c | 148 ++++++++++++++++++++++++++++++---
 1 file changed, 135 insertions(+), 13 deletions(-)

-- 
2.25.1

