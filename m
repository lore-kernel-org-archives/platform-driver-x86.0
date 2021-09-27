Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58324C433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Sep 2021 14:22:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3BCA160FD7
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Sep 2021 14:22:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234763AbhI0OYV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 27 Sep 2021 10:24:21 -0400
Received: from mail-bn8nam12on2046.outbound.protection.outlook.com ([40.107.237.46]:50418
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234692AbhI0OYS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Sep 2021 10:24:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LbmkmpiWneVBHuvDNxZSjeOhCeaFAoyynPzcurmYyLb8FfwfniA7oIlGD2kvmCeccW/Ee4k5/PF05bFVjiYqQoYhCBNv/cHkn/vRRGEevs6S7M7uK2aOeV8hwAEbaloLZreYrQ/mBcKdG1ncb1oKnO4IYLx4gbZPUyFLbvM88jW10VG/4hI9qCyPyXTgzPnaOGRBVJS2Fl1C39d7FZM7a3nB6P3/A4S0OcrIMDjDr371GH83oiUdwkFp56s5o23ovo0kDnseJmKpeFV8HIhlKaCN5Nx91y3cq+4/SPpZ9LhrCP8/KjV5a1mrF7XEvtDyI8eCZ7FAFochyAoYXgrZlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=vTRI4jjZ5bJyhAeMI+L8ilkckrx9XVSTMXUODYQVuTs=;
 b=givW2fDIzycDh7IQ/yzS21HwVGK0EQsmcIoPZTcUtvzc2vtnoR2/6Gd0yL00iMEvWUsQlOTG5IjiNuzRYz0ALEeRtOqnVp2PovZMyYGozkjcW/xggq2iJyn7zE+bx1qsf1+EX5ZaZABw3KVCjN+tSzm0OISCsgruXBaCHAgNhvdRWS3fpkrTUXr4SelvK6KR3emPBmhDj1eB68cpQn+o5eNyBu/FouoZR3Wnr79LHEF6dW+SR/B+4hIJe41FFLY/K+1ZlZ4dPqMUYiFsGtLIQj145QPNHxjCIOjAYnW6+8Sy8beGAJV6zwqdYqdHkLk+6YtBXnsFaYI3QMN7CwRSmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vTRI4jjZ5bJyhAeMI+L8ilkckrx9XVSTMXUODYQVuTs=;
 b=e+3DHUaLFLTp0Zd/GOmKLSSuuG4Mqizldxn/Aj+/03KiKspNkRVdP90XEogbGvOkj8Z0QR+MGVzTTYdE8lBl72l660U9TAIufcj8e5L55YLLikqKirCvSqeKNqxRbvV8m1vr9J8mbiL7PxzRB95lzUMPNDigPkSsl5f46hVgtsO1FtYsRw0S4q0B8OMylwDEXzrNaat/XLgQpjWB1okXH8XLoBkJuXOaZGU1Fh0LlA9d+/K37tj5AYlHtqolnplb1iJ9gl1h6JhODq9HhlxkstA7IJMq+6/cCNdGJnybGFAJJSSO1FMU5IBYiJ+OKIz2WBNzz0WPfGdEjMn4SVfEcQ==
Received: from DM6PR07CA0049.namprd07.prod.outlook.com (2603:10b6:5:74::26) by
 MN2PR12MB2944.namprd12.prod.outlook.com (2603:10b6:208:ae::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13; Mon, 27 Sep 2021 14:22:39 +0000
Received: from DM6NAM11FT061.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:74:cafe::78) by DM6PR07CA0049.outlook.office365.com
 (2603:10b6:5:74::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Mon, 27 Sep 2021 14:22:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 DM6NAM11FT061.mail.protection.outlook.com (10.13.173.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4544.13 via Frontend Transport; Mon, 27 Sep 2021 14:22:38 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 27 Sep
 2021 14:22:38 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.187.5) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Mon, 27 Sep 2021 14:22:36 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform 1/2] platform/mellanox: mlxreg-io: Fix argument base in kstrtou32() call
Date:   Mon, 27 Sep 2021 17:22:13 +0300
Message-ID: <20210927142214.2613929-2-vadimp@nvidia.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927142214.2613929-1-vadimp@nvidia.com>
References: <20210927142214.2613929-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ccaba68d-4f5a-4135-f106-08d981c2427c
X-MS-TrafficTypeDiagnostic: MN2PR12MB2944:
X-Microsoft-Antispam-PRVS: <MN2PR12MB2944E0BF0070BC299B5F1997AFA79@MN2PR12MB2944.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UIRvHcI0jH5rhQ2f+Qq3QB26MltcJW1gmpiylBvSG4PtExQQJhmuzfSxBBGHg4LeHvgJiDAsh+NMvE7ed46+QhZi8n0uOrItiw9HWZXEbUlpVwuA9GlIiPJkuMGncj9K3U5SMQPfaZ0BdKoePgRtZ0feKKOV/mLLo8mztoihaz0DtkgvwuKDfPxa6/a7EkgvvugW9CvnGgDGqeYAeTYUlLOgf1Bx7lZSKZuR20Cz7iK90GXH8XgruSeDUl7bGj0vrs1xQlMCUAZJptgoX7LMVzlJUIXEF0IHmOPBr14HkHd8Vt6cdB3EZA6otw9sOur4IGm6PeH75UxcWRD7ctHgcFvjJf7qZ4fR7f54h0qsy0D0UBwCQ/U6o0nNk77U43xKaHaiQ5k1hx4E+EyZyPJGv3YYS9bF4d3BqfySRt9FLv1pjPdZS/HQ/VcLXW7s1T8DjUsaLi2dPabrXLqtgCM6bkgjdukGK3Fk8rs7BCJ1zaBF8BPXupZUqyWJna9ezljlMbx99AdV5SpwG04RW+I+SAOZPV8ghmkh5DqmRfOnY1/mF53hjb4DLp3D+RBqG9POrhuvIQNmjRTzau+7gSlIPlI4KeiqJtvXgyuNvyoUWzbfsSxsh1B0IakXd8ZKB7leAn1IYkX5ZPugYI822zjXfaV8kd57HTjOqRbPlwKQkh5ORA6KHQH3JWwnCdQyHD80okrJOvvQZtBJvxZsGOHAfA==
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid02.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(2616005)(82310400003)(426003)(26005)(107886003)(186003)(16526019)(8936002)(5660300002)(83380400001)(7636003)(6666004)(36756003)(70586007)(336012)(70206006)(8676002)(47076005)(508600001)(36860700001)(316002)(36906005)(4326008)(2906002)(86362001)(54906003)(356005)(6916009)(1076003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 14:22:38.7639
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ccaba68d-4f5a-4135-f106-08d981c2427c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT061.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2944
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Change kstrtou32() argument 'base' to be zero instead of 'len'.
It works by chance for setting one bit value, but it is not supposed to
work in case value passed to mlxreg_io_attr_store() is greater than 1.

It works for example, for:
echo 1 > /sys/devices/platform/mlxplat/mlxreg-io/hwmon/.../jtag_enable
But it will fail for:
echo n > /sys/devices/platform/mlxplat/mlxreg-io/hwmon/.../jtag_enable,
where n > 1.

The flow for input buffer conversion is as below:
_kstrtoull(const char *s, unsigned int base, unsigned long long *res)
calls:
rv = _parse_integer(s, base, &_res);

For the second case, where n > 1:
- _parse_integer() converts 's' to 'val'.
  For n=2, 'len' is set to 2 (string buffer is 0x32 0x0a), for n=3
  'len' is set to 3 (string buffer 0x33 0x0a), etcetera.
- 'base' is equal or greater then '2' (length of input buffer).

As a result, _parse_integer() exits with result zero (rv):
	rv = 0;
	while (1) {
		...
		if (val >= base)-> (2 >= 2)
			break;
		...
		rv++;
		...
	}

And _kstrtoull() in their turn will fail:
	if (rv == 0)
		return -EINVAL;

Fixes: 5ec4a8ace06c ("platform/mellanox: Introduce support for Mellanox register access driver")
Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/platform/mellanox/mlxreg-io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/mellanox/mlxreg-io.c b/drivers/platform/mellanox/mlxreg-io.c
index 7646708d57e4..a023ec02126b 100644
--- a/drivers/platform/mellanox/mlxreg-io.c
+++ b/drivers/platform/mellanox/mlxreg-io.c
@@ -141,7 +141,7 @@ mlxreg_io_attr_store(struct device *dev, struct device_attribute *attr,
 		return -EINVAL;
 
 	/* Convert buffer to input value. */
-	ret = kstrtou32(buf, len, &input_val);
+	ret = kstrtou32(buf, 0, &input_val);
 	if (ret)
 		return ret;
 
-- 
2.20.1

