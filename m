Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2065.outbound.protection.outlook.com [40.107.243.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEDA63127
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jan 2024 13:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706534702; cv=fail; b=Dloz4U87nBqYpScGXn+/AIS8em+ntqmGneUqKrUabdpd5HRIjyiDf2r997PQMI8fT/8ehKx3+eX/QG79cmy686ixCVkI8gH0929brhvzACJjyin1RK4FqSYZ+dl216afeUA47if17YWcTUe2NtpFyQTqJdloCRppkzAzfFaG0mA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706534702; c=relaxed/simple;
	bh=qp62LdCxSvtDM9h5TJSbZnixfIBmp7MttZ/8wKe2zho=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dG2dh1JXxipPxEr5M69tL9/wqynKhkWgxuabywSixhjtGIL3/VzCznve5ZZ46XO6M7q9C7WPFWDLQ/FBgZmWJDl8wtzMBLD7e78uMvoJ8a5alZNL9xkdjRsHR/1ka49vBCADZy7PIVkCBFlqCJ++PY1SFvJr02nturOuaOqzOtM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=EDvLACaz; arc=fail smtp.client-ip=40.107.243.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="EDvLACaz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eW5WsO0dErlbelDttNk4XJVmAwC9Bs4wccJwDBEnN+gunQMc4aLJhqND2S/rOcWo+wbjoZsjUJN4gllZJBHFeO3259+yWBVUF1BHIAq8E1XxXimOfAOMKVEHh4XFWq8rCk57oj+1a36Q6qX6LvSyIqUEczUEX4Eo8F4xGlXEM9daIP7Niwr0QMtX7m4p+y9I+imiwOjChQpfyKGUIrqzQF+xT26uDdva6FFmCwM8Np8BmJI0oHjtCWV3KI5LTWMu/sow1oKP//a9mQ8rSwpRxnwEzax1+hFUDwyuWCrQwpkYvJJMxaQfeW9oqioCjQWtuBbS0NxZLE5/kXVNIiDArA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q6MO87BRRb6nqSYnMkkpXWQtcZl8i24BYBeR254kQ0c=;
 b=gyFjxQ/dyCtvkQjRmKQQc7MWdKWJ218537JUlJncicBiEmTbVYrEe5hS9xGpBXOpHTmSXTvJf08DC2CKCkox5OXnfcGVotOVKroq0nM5EhS4ZG7vqeZq7OvoqXe4wKBZd7T0pmfbzvNXZHE/BQplbaGMgy2qaVkd3bxMlcWcxCkXLJT1JTaPxlVCxFgaqKtXZt561qxuBIVNQNfUw/pzbYZvDXWukr4GAD4wLXukybWEBE/Oa5Z4n2LNi4apdaLnLxfFtQm7VpR+UDTcSSzTM/nLejVSRkj79Z+cvj0s+R42wOc7Uir/6NrFPuyDfjdMdS5D2PcEOEilter0D88hbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q6MO87BRRb6nqSYnMkkpXWQtcZl8i24BYBeR254kQ0c=;
 b=EDvLACazgasWtkqmLvSA7z69PRTOL8iVBZp4lsXC+sUM9+V+KZ2qwV2mRnyLZleN9y5E1sjCErb1KStqj+q4TwLCc1Sg0zyugcUJSQgeIPajPuw10dHLnHJj9psJXVYSnCg7Y+oDBTTJPAh6t82iPfu+mI0L0OvTFubCcD3quaw=
Received: from DM6PR03CA0034.namprd03.prod.outlook.com (2603:10b6:5:40::47) by
 SJ2PR12MB7963.namprd12.prod.outlook.com (2603:10b6:a03:4c1::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7228.34; Mon, 29 Jan 2024 13:24:58 +0000
Received: from SA2PEPF000015CD.namprd03.prod.outlook.com
 (2603:10b6:5:40:cafe::6f) by DM6PR03CA0034.outlook.office365.com
 (2603:10b6:5:40::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34 via Frontend
 Transport; Mon, 29 Jan 2024 13:24:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Mon, 29 Jan 2024 13:24:57 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 29 Jan
 2024 07:24:55 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, kernel test robot <lkp@intel.com>, Dan Carpenter
	<dan.carpenter@linaro.org>, Naveen Krishna Chatradhi <naveen.krishna@amd.com>
Subject: [PATCH] platform/x86/amd/hsmp: Remove NULL dereferencing code
Date: Mon, 29 Jan 2024 13:24:33 +0000
Message-ID: <20240129132433.2087490-2-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240129132433.2087490-1-suma.hegde@amd.com>
References: <20240129132433.2087490-1-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CD:EE_|SJ2PR12MB7963:EE_
X-MS-Office365-Filtering-Correlation-Id: 45ee55d1-6591-45bd-cce0-08dc20cdb07b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZDed7lfMbXnEeR8U0I2zaoSLDqCR1D7cEZDAv7KSKz4P7C5ic25JYD16Z6SXOrfmmtPCFq1FWZxWPDF9OMS2MgZv6tiQ90cSSjpjXIGWfkCaJNBJn1M4kLpRPih6KOIS+cJL5Xlp5CIPLRqu3KQwU1CrihpSQJ50x9F3ZjsCJ/eeghGrliBo0OlvPTPupFM/jV1sC8pqQpjW7J7GXWMh2YJJ/kJofeFCQX01c1Lv7lLJD6Pwur3vMhjw3YfEbvaBOEzgHH/FWnc7g2zIt+Lx6uSrrOVMxyzXQVKEQdwRp51QHoNlsAj6nPWrC0eFJfbzvO1C6Cj+9hvx+MmBYEJJEFWruGjtLTNdb2BVCJ9+JinKgQLKURPZqX4+OpOASKgrnDoTlaUAx5yENr4harVPLh4k0XSYxaI+mFmc5OmWEXdOPgnoJ9zDrmeNSrGt39zH0iaOpm5nwq9l5+FP4GZ762hnHOvPK/lwXFbXzvKE11n6qz4i+t97vMYWbwJLUw5Q9tEAuxPafIxQzMcL1UwC+75ghTyBOO3cxqP5vdqr78rJOswuJhGv9w9qqZooABprDEw/rIiSBgeUVPXW0cfvlCD/hygw/qiRB0ReONk9olGS9r2VzHNSt99XOsM7RN7J4rOWuEb5jioMsIXJ/LO8foooxJsqBbWh4DpgReroyu9tD7yfp/PwNztYX4DYCCupySD/JU7CfdPzblpSby1JplTaB91IOHhQE0nkHB5Vj/Kpisgn8KGfnN2iv2m7btJU9y/Ek9vzjB13bEvlAsFZCA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(136003)(396003)(39860400002)(230922051799003)(64100799003)(186009)(82310400011)(1800799012)(451199024)(36840700001)(46966006)(40470700004)(41300700001)(82740400003)(81166007)(356005)(40460700003)(40480700001)(36860700001)(47076005)(7696005)(70586007)(86362001)(54906003)(70206006)(6916009)(316002)(966005)(8676002)(8936002)(44832011)(426003)(336012)(2616005)(5660300002)(26005)(478600001)(6666004)(2906002)(4326008)(1076003)(16526019)(83380400001)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 13:24:57.9336
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45ee55d1-6591-45bd-cce0-08dc20cdb07b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7963

Do not log using dev_err() in case of !sock, which causes null pointer
dereferencing. 

Also remove unnecessary check "boot_cpu_data.x86_model >= 0x00", which is
always true because its an unsigned type.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202401292056.qkUFS09Y-lkp@intel.com/
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202401291311.gzMCj6SP-lkp@intel.com/

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveen.krishna@amd.com>
---

 drivers/platform/x86/amd/hsmp.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
index 1baddf403920..1927be901108 100644
--- a/drivers/platform/x86/amd/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp.c
@@ -566,17 +566,15 @@ static ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
 	struct hsmp_message msg = { 0 };
 	int ret;
 
+	if (!sock)
+		return -EINVAL;
+
 	/* Do not support lseek(), reads entire metric table */
 	if (count < bin_attr->size) {
 		dev_err(sock->dev, "Wrong buffer size\n");
 		return -EINVAL;
 	}
 
-	if (!sock) {
-		dev_err(sock->dev, "Failed to read attribute private data\n");
-		return -EINVAL;
-	}
-
 	msg.msg_id	= HSMP_GET_METRIC_TABLE;
 	msg.sock_ind	= sock->sock_ind;
 
@@ -739,8 +737,7 @@ static int hsmp_cache_proto_ver(u16 sock_ind)
 
 static inline bool is_f1a_m0h(void)
 {
-	if (boot_cpu_data.x86 == 0x1A &&
-	    (boot_cpu_data.x86_model >= 0x00 && boot_cpu_data.x86_model <= 0x0F))
+	if (boot_cpu_data.x86 == 0x1A && boot_cpu_data.x86_model <= 0x0F)
 		return true;
 
 	return false;
-- 
2.25.1

