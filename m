Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DA55C05027
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Feb 2023 06:37:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229962AbjBHGhk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Feb 2023 01:37:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229984AbjBHGhj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Feb 2023 01:37:39 -0500
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2069.outbound.protection.outlook.com [40.107.101.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96F8030B22
        for <platform-driver-x86@vger.kernel.org>; Tue,  7 Feb 2023 22:37:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jOxhUvRftUIFVXecS5oMzbe70A2GI1fehJFiIs208NHbaWGLftF8Bw0MbwZrIwGN8ojy910GcEGj/061yiADmYl2GNOLkqZYapXNL1Gu3vqSFgHDpptjZlmyO4ceuFwOkQMgJOC9U71Ez6d2v9J814jUnZPRtWSQpYNCWRlpBs3/ThkLajueFnQ2kF9Ipa7Q6Za51qJfgquyE/9Pa2ZFtpBWYg3bPJEeTlS5ahIuJF5JJmN1vF55LqfsLBP3vUcO6nx3NQfKOu6AorkIW2DjhlazQ8qiHIAwtdQdzwZltHgfhMuZPFyLlRy7W4u1if/y9ztLN4u7EuiGKEWlkAeOxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BKejNIlnEkWk5bQSvcPL+eJR8UXvey9Tm1yzh41vjOQ=;
 b=jiA0bzvZsHvg7x51R9eZ9rBSFQ4K/6KIVdtheS2Jr789gz8jKjMLTZd7hAr2+T56D/MeOmlkoI5F5q0gg3qGuvql5V3Bhr0+nmm6gX/hY+Z6m5rW9jbKntk3zY9UDLpMYaMdS7uk3iCMJERUNHqLRupPc6YkmJGkh6YB7pDU0jqf5poQ7CsTJDmJoZYS6ie0bRkvz8wiNheZytp6yHoiSfdPRc5JOvY0MBsKneCcyqXou+fDhjqOwyokswU9tkPa0UKj1f4CNnhwtpV7wOYjrraMz6dTSbqB4W+aNk0UrCsfWT4Onggcb4k3UOUGKVEhEiqawPzVQhUWGzLXMtTMNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BKejNIlnEkWk5bQSvcPL+eJR8UXvey9Tm1yzh41vjOQ=;
 b=Wh2pwoDGuS34k4iNbkx6lBtlarBeEoESaLUe9L+MlAL8deacG5v727VPgW2w6+pFm82FJ90zeavThfBwKOaS24N3pm/mqFFVuajLUH73mc/kIVhNKPptIe7mOzD4pdyYp47x7NaufG5Hc7gIey+To7wGmeZu9Oe3iyUl1/3cCT1JHUbalfjQQWgN734ujD9Wy74tkT2pToGbZl6Py/X2NJBE5DnavJK14L2qPmFVTJ9+pr1wjZoLm8RyW0/BguYMtiqtGBKeaaU4DH7klb4MDT6Xkgb130s8ALo3cx7QfNWjgsn5vHNmYOcNkdiYMRy1O0NzqHEf9UXj7w72y+Tz+Q==
Received: from BN0PR04CA0067.namprd04.prod.outlook.com (2603:10b6:408:ea::12)
 by MW3PR12MB4473.namprd12.prod.outlook.com (2603:10b6:303:56::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.35; Wed, 8 Feb
 2023 06:37:33 +0000
Received: from BN8NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ea:cafe::84) by BN0PR04CA0067.outlook.office365.com
 (2603:10b6:408:ea::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17 via Frontend
 Transport; Wed, 8 Feb 2023 06:37:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN8NAM11FT034.mail.protection.outlook.com (10.13.176.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.17 via Frontend Transport; Wed, 8 Feb 2023 06:37:33 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 7 Feb 2023
 22:37:19 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 7 Feb 2023 22:37:18 -0800
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 13/13] Documentation/ABI: Add new attribute for mlxreg-io sysfs interfaces
Date:   Wed, 8 Feb 2023 08:33:30 +0200
Message-ID: <20230208063331.15560-14-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230208063331.15560-1-vadimp@nvidia.com>
References: <20230208063331.15560-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT034:EE_|MW3PR12MB4473:EE_
X-MS-Office365-Filtering-Correlation-Id: db2b5a9e-92e4-423d-51ca-08db099ef5d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kKuuVXUO4t+XORB0os3yBeMXr5vGfwFVJxTbdqq7ZchOPjQV4svOyDGve2nzUgUVmiVNGNcdDAk6iPfVjX8P9BdUeDyo65MiZ1FBFJcrEk5ufp8LM4JzPAmzkpM7Ee5ohaPoorVtAhbksii/ZLPHHg0OgAvkbAVZTQ5ROhu1d68kQls/+kxrGKuJf4tAWByo1OKoMsgFbQzbX2NVVPLJ9h8VLZ0DNe4ElzJ+xWTFA18nfdM00sgNR3auvABSS7P2Y6UenXKF/ks+zIJMKalrbEGQBBDeNd8IAYn9PGESvRedimw0O8ExmK8mn1pVhBqGoAsjPtuzwhoVtCowP0dQrPxhsAUlpAbbFwu5IuTm6dh8+L4CMiqAIHxN7lput5Hmob1vcyCPxJCWEg8T3uauWLjJ6qKTA9P8MjdSCx/ZSXQ+my17DO4CHBdQf+3qBAOMn3NQjCdTca+9lOisJp8PKM4UGA49LFrArh1qOf4W46brp/cJCT4S4jo9Y/wgxQpg+IknN/219dkiizCxXY09/x7+c/nReBtp/lndb2WxjnpLbjcDR+AAgaSwlzuabh9qaujLHE2Ttc/lrxH+SDkMso+FXtf4Uv8LpAkbHoPjYcUxw0bu9SWiV0kPO585h3Cdcw2z/dasHXYmuRjIsdkQkhQOtXHmysNqaKsWnYoRsoUwDoi/xjhbGkjXuyJMAqczXIVF2617+TTifthflv+bTg==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(346002)(39860400002)(136003)(451199018)(36840700001)(40470700004)(46966006)(82310400005)(426003)(83380400001)(36756003)(86362001)(2906002)(8936002)(5660300002)(4326008)(6916009)(70206006)(8676002)(40480700001)(70586007)(41300700001)(356005)(7636003)(82740400003)(36860700001)(316002)(54906003)(47076005)(6666004)(107886003)(40460700003)(336012)(2616005)(16526019)(478600001)(1076003)(26005)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 06:37:33.4422
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db2b5a9e-92e4-423d-51ca-08db099ef5d0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4473
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add description for new attributes added for rack manager switch and
NG800 family systems.

Attributes related to power converter board:
- reset_pwr_converter_fail;
- pwr_converter_prog_en;
Attributes related to External Root of Trust (EROT) devices recovery:
- erot1_ap_reset;
- erot2_ap_reset;
- erot1_recovery;
- erot2_recovery;
- erot1_reset;
- erot2_reset;
- erot1_wp;
- erot2_wp;
- spi_chnl_select;
Attributes related to clock board failures and recovery:
- clk_brd1_boot_fail;
- clk_brd2_boot_fail;
- clk_brd_fail;
- clk_brd_prog_en;
Attributes related to power failures:
- reset_ac_ok_fail;
- asic_pg_fail;

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
 .../ABI/stable/sysfs-driver-mlxreg-io         | 122 +++++++++++++++++-
 1 file changed, 121 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/stable/sysfs-driver-mlxreg-io b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
index af0cbf143c48..60953903d007 100644
--- a/Documentation/ABI/stable/sysfs-driver-mlxreg-io
+++ b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
@@ -522,7 +522,6 @@ Description:	These files allow to each of ASICs by writing 1.
 
 		The files are write only.
 
-
 What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/comm_chnl_ready
 Date:		July 2022
 KernelVersion:	5.20
@@ -542,3 +541,124 @@ Description:	The file indicates COME module hardware configuration.
 		The purpose is to expose some minor BOM changes for the same system SKU.
 
 		The file is read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_pwr_converter_fail
+Date:		February 2023
+KernelVersion:	6.3
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	This file shows the system reset cause due to power converter
+		devices failure.
+		Value 1 in file means this is reset cause, 0 - otherwise.
+
+		The file is read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/erot1_ap_reset
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/erot2_ap_reset
+Date:		February 2023
+KernelVersion:	6.3
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	These files aim to monitor the status of the External Root of Trust (EROT)
+		processor's RESET output to the Application Processor (AP).
+		By reading this file, could be determined if the EROT has invalidated or
+		revoked AP Firmware, at which point it will hold the AP in RESET until a
+		valid firmware is loaded. This protects the AP from running an
+		unauthorized firmware. In the normal flow, the AP reset should be released
+		after the EROT validates the integrity of the FW, and it should be done so
+		as quickly as possible so that the AP boots before the CPU starts to
+		communicate to each ASIC.
+
+		The files are read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/erot1_recovery
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/erot2_recovery
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/erot1_reset
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/erot2_reset
+Date:		February 2023
+KernelVersion:	6.3
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	These files aim to perform External Root of Trust (EROT) recovery
+		sequence after EROT device failure.
+		These EROT devices protect ASICs from unauthorized access and in normal
+		flow their reset should be released with system power – earliest power
+		up stage, so that EROTs can begin boot and authentication process before
+		CPU starts to communicate to ASICs.
+		Issuing a reset to the EROT while asserting the recovery signal will cause
+		the EROT Application Processor to enter recovery mode so that the EROT FW
+		can be updated/recovered.
+		For reset/recovery the related file should be toggled by 1/0.
+
+		The files are read/write.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/erot1_wp
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/erot2_wp
+Date:		February 2023
+KernelVersion:	6.3
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	These files allow access to External Root of Trust (EROT) for reset
+		and recovery sequence after EROT device failure.
+		Default is 0 (programming disabled).
+		If the system is in locked-down mode writing this file will not be allowed.
+
+		The files are read/write.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/spi_chnl_select
+Date:		February 2023
+KernelVersion:	6.3
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	This file allows SPI chip selection for External Root of Trust (EROT)
+		device Out-of-Band recovery.
+		File can be written with 0 or with 1. It selects which EROT can be accessed
+		through SPI device.
+
+		The file is read/write.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/asic_pg_fail
+Date:		February 2023
+KernelVersion:	6.3
+Contact:	Vadim Pasternak vadimp@nvidia.com
+Description:	This file shows ASIC Power Good status.
+		Value 1 in file means ASIC Power Good failed, 0 - otherwise.
+
+		The file is read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/clk_brd1_boot_fail
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/clk_brd2_boot_fail
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/clk_brd_fail
+Date:		February 2023
+KernelVersion:	6.3
+Contact:	Vadim Pasternak vadimp@nvidia.com
+Description:	These files are related to clock boards status in system.
+		- clk_brd1_boot_fail: warning about 1-st clock board failed to boot from CI.
+		- clk_brd2_boot_fail: warning about 2-nd clock board failed to boot from CI.
+		- clk_brd_fail: error about common clock board boot failure.
+
+		The files are read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/clk_brd_prog_en
+Date:		February 2023
+KernelVersion:	6.3
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	This file enables programming of clock boards.
+		Default is 0 (programming disabled).
+		If the system is in locked-down mode writing this file will not be allowed.
+
+		The file is read/write.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/pwr_converter_prog_en
+Date:		February 2023
+KernelVersion:	6.3
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	This file enables programming of power converters.
+		Default is 0 (programming disabled).
+		If the system is in locked-down mode writing this file will not be allowed.
+
+		The file is read/write.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_ac_ok_fail
+Date:		February 2023
+KernelVersion:	6.3
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	This file shows the system reset cause due to AC power failure.
+		Value 1 in file means this is reset cause, 0 - otherwise.
+
+		The file is read only.
-- 
2.20.1

