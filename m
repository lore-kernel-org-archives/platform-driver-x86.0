Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B58FEC433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Sep 2021 14:22:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 98BB360FC2
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Sep 2021 14:22:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234700AbhI0OYP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 27 Sep 2021 10:24:15 -0400
Received: from mail-dm6nam10on2064.outbound.protection.outlook.com ([40.107.93.64]:18272
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234692AbhI0OYP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Sep 2021 10:24:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FKlxLsm95hwxEk+VkUQpCzCJwzS5F2d7rc4aHG7jFAPTFwBcZF3ay/pRMe/toi52vDt42pojOvarEyWn4W5UxJeA8b8M/eQC2dIrTIsqqVQRWz6C/6byQ1yVLwCuOMP4rTvmWnfSAUpyxkHbdpyaladMdXe4sfahN/T8LwDpe7+D6bkHfEKVglwVveAaahocLKnsY09958coWA+Kszbqw8y1wrZVc34Vyr/SYQ4xjUVUMXMafgY7UBfkpCC93nLhaigSUSzQzrjoRTP5EEtULngePF9BGF4WZ4/v//clzW9ypn+bIQjsLvuBH0chc3qpLnQYwiWdJwRutsGUKVnY/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=zEsoR5zpXnHc7fOybp1P8hupmudBZoOB2YrTyZ6yQjU=;
 b=RhvCQDaHBhFQFdnIs6US7bvtqm1OStgEnvxIa+kXMY6/TjQxlQkkWbdInAuqAxB3YJ0kzZG6zr7xsw2CEfPcAwQn1TU7tmTnS3tzrtOwgu4bkI54NnCb6vOw7mWprV7xqzvXCEFhe/R9AzYLRRrlPmcf2NCQt7HfJwPSvW+Sxls7///FlabtXvT1RDsfpwnYgapPgUm8AvIjnjmJJL0RB73bY1Y9hMm74F12jZKLQaAPsL2Cn3hj/OOYLfEBF9qzS6zax7JARHifXoBYGAp/7BpMpy0UiKVJ/9r55UbW+TmqvDDf6L9O8iOOuewp+gzjabfQ1ibrfelK7Uf5ZXe3TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zEsoR5zpXnHc7fOybp1P8hupmudBZoOB2YrTyZ6yQjU=;
 b=tQSN5vlgvQzPY3L/EKuGp2ADSBX4IJ7SCuwDWzWi8MpCyOws8j5Jg/Nji8FQlwBhXEKh9JwTQU8qMiGeG9kMyhUJm566pElx5dKYetKXD5w/EKWGa7Av7F3K55Cfaaay7oyPA/FxgNbOOxkY23NFu+LoP8YZlCq/ZW5bqe0K4oSynpLvoe7GRM8nex2SU9xUZU0vMqgWe8B4J42Ds6Njim03ASV8uiBtlWdByHmZZ0EdVGCIZCbpPj8Y/qeJwUUXGxzSdGw6rM10MyzQovpjKCSRtiWGP5FGgQvL1QLn8hDLT2IRu0pOg39TXhufDuzoiLxEAIDAMWgOpGc/EwQKmA==
Received: from DM6PR03CA0074.namprd03.prod.outlook.com (2603:10b6:5:333::7) by
 CH2PR12MB3672.namprd12.prod.outlook.com (2603:10b6:610:2d::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.18; Mon, 27 Sep 2021 14:22:35 +0000
Received: from DM6NAM11FT035.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:333:cafe::f4) by DM6PR03CA0074.outlook.office365.com
 (2603:10b6:5:333::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15 via Frontend
 Transport; Mon, 27 Sep 2021 14:22:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 DM6NAM11FT035.mail.protection.outlook.com (10.13.172.100) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4544.13 via Frontend Transport; Mon, 27 Sep 2021 14:22:35 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 27 Sep
 2021 14:22:35 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.187.5) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Mon, 27 Sep 2021 14:22:33 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform 0/2] platform/mellanox: Fixes for register space access
Date:   Mon, 27 Sep 2021 17:22:12 +0300
Message-ID: <20210927142214.2613929-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b4d9c47-6cb7-41f5-251e-08d981c2408b
X-MS-TrafficTypeDiagnostic: CH2PR12MB3672:
X-Microsoft-Antispam-PRVS: <CH2PR12MB36728C1BC42B2B09C21DC30CAFA79@CH2PR12MB3672.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EMryiwRXKhwY8yOpRdmLC7nOa+uw349/c5r1hhHAgpmE+tEgt1WZqbDbhSblQfpUqzzEw/ZrSUQbaHhym54iHB7hqbAEL2bJwExX4iTtGaW/vNlK0626b7DvSj7hZGvI3nq6zGYLqsfVVVirtLM9JTYt3/DF4RF6X3SpsSJdXjbxafKOZw7GQRsKNKdZyzSXduW9dB5ACfLmVZmDkfFK6Lv4cNXg2SfqgqmYNev4On9XU5NGRQkwl83LZqxc6AqQdBIjNCALQeZVkstenaIcGkhWRbmThEDmeYhxyYDj+eeR7z9e5gHhagxlg/SAXUsIBNInJNUUqOPcYb4aQJ0n5Q5nH0+gDevTdESgUSEi8gX7IR6OaN1EH6qJ0tqTXHHoAz+mweg1ajPK/SyygcA7axhZ++vw5Z77vT/6lJRn+wRpwXvVpoMZO9IaLciQKkucqUUAzEba5qGAf5wvye9eyYmnVefVRuOp2z+yejqEQ/x8bCd8LvkZ5L6oLNEAgs54wdhLCOarGe7SJqHDwf1oDlWIO0mpFO59jDI3Ob/hyZ5Tm3p3gcSpIoEJX9ZkTa+3C3UyB5bhbC+s6UReuEuLYSO2dqs67dI+b1G42C/YTYxmNFlGr2FLAoW5J+KV+YMEQSIicdB6NpIanOPwDEuyZlraa+dWXvXu62eXG6cutSF1buZZtiu+PjCdPLT9CvY/zYFWcXEPef2oTiRjnGxiZA==
X-Forefront-Antispam-Report: CIP:216.228.112.36;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid05.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(107886003)(356005)(83380400001)(6666004)(4326008)(70586007)(70206006)(47076005)(8676002)(1076003)(336012)(2616005)(426003)(36756003)(8936002)(7636003)(2906002)(54906003)(36906005)(6916009)(186003)(36860700001)(508600001)(26005)(4744005)(316002)(16526019)(5660300002)(82310400003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 14:22:35.5065
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b4d9c47-6cb7-41f5-251e-08d981c2408b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.36];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT035.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3672
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Patch set contains:
Patch #1 - Fix argument for kstrtou32() conversion.
Patch #2 - Fix rea access for complex attribute.

Vadim Pasternak (2):
  platform/mellanox: mlxreg-io: Fix argument base in kstrtou32() call
  platform/mellanox: mlxreg-io: Fix read access of n-bytes size
    attributes

 drivers/platform/mellanox/mlxreg-io.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.20.1

