Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013012.outbound.protection.outlook.com [40.93.201.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896DB3E40F1
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Oct 2026 09:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791451833; cv=fail; b=naT96GLKlvQnh0c378u/SXw6uKe7CGFETQ5o6rS0hw02+22B9HysXnozX4PxuDU/ZsWs4YiSgDP/wd8ciaS9pUrxIhIstF5pqMDckWovYlgjvTFniCQfswsvnSh1F4EbMJCylYI9AuML6hOSr3OOSJVErOvuib5b/85/qTuD7+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791451833; c=relaxed/simple;
	bh=hKbCCdrDlJ6nYS6L2BcBcDtqC+R6o8iF+OvTK4El3MI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=biNJGrbnWqWQARzTYGkcHxRcvS0N3CvqV46Nr/DLSXLLQXd+/edCKOWiZM0tpBIyWwRH4pVL7Yr1hZ3ZmaDwmtn60Fc65unluW6Y1Z5KUdSVXc68p6Qt6FwETen1oxmvCFb94iCjtLoPDAgkht7xxNTG5kQV+rIw6yyXIRC4Wyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qQZlKsm4; arc=fail smtp.client-ip=40.93.201.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qQZlKsm4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PC6jJL1OHaqEEZVmFd7aK2BHgNHHIlkzMfxp5JdMyRsfCHH7DcPgwhP71o8g3iqkP1mlTMLYt5KkU+ICN5QivEViSGBYMoeJIV7yjSApOewpp6tqXvh/sNndws5G9zeMBuHIPm6VFxjduXdw3d3D6A0zjVAph/66JYtsSkLsXlHqs4s3Gx9Cfi5Ac+5KDLlYc+ugsvSpLWioWXhEA/b4JqjFoOXpyvUVr0l97hxhnN7HzhfaZe3RAnptkEXLip27SJdqMjSk8979gEWjO1bv+ABQuh0y+A1NXba5DkOUgO75+aq+D8zfATzrC26hAgcWRZn9wbJBDWqhue1/CVEnBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8czvT8tJtvHSO8CbiKQX601tjsjWe01G3Hk8UvzRZSY=;
 b=rufOJUYa3bEJPPk0/NOcpKTRAu0qEja4IpRHHCU8nf836WYPorWTjY/hT2jcTCFXmG4+hkk+MlCtK2r2akaxNElXnq1NTJttXyLU0YLlC2x/OReZB+veUbpu0v6XTfB1nUCpFKFBZu0LN1ZJ/EijBPB8ChWXMopMU/JY/IJYLIYOOxJwkImxswULOmOswU28GNzCFY+oaI3P1RHDkffAUqLp/CW0bVyeJ/qNiYereBkmPU4PDz1YNi6rN51E45KYdWc7NCTe70jh7kXVioq4PMfjkBxVPIy1vvbAlJYTHf4AyOp7sigXpzcTCdNeiCmrBZcOQFFFPJ29sK27C+vzUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8czvT8tJtvHSO8CbiKQX601tjsjWe01G3Hk8UvzRZSY=;
 b=qQZlKsm4hjdCAwXlSJcetq5OmUdHQmCYnILn+6USOTOEISUQiXRBp7tSX5b+rQgGL3/0yUQw5mYW7jrEY5XcVqaM69W/a/DunoJpNkzp9LEacK6ZZ2w+j3Z4/juL2hCDVQgjxYUE4tKpxH+OMOD3vbZ2OHBP+9GifD/WCVmWdbI=
Received: from BLAPR03CA0052.namprd03.prod.outlook.com (2603:10b6:208:32d::27)
 by IA1PR12MB6162.namprd12.prod.outlook.com (2603:10b6:208:3ea::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Thu, 8 Oct
 2026 09:30:22 +0000
Received: from BN1PEPF00018072.namprd04.prod.outlook.com
 (2603:10b6:208:32d:cafe::a3) by BLAPR03CA0052.outlook.office365.com
 (2603:10b6:208:32d::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Thu, 8
 Oct 2026 09:30:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00018072.mail.protection.outlook.com (10.167.245.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Thu, 8 Oct 2026 09:30:22 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 8 Oct
 2026 04:30:16 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>,
	<muthusamy.ramalingam@amd.com>, <NaveenKrishna.Chatradhi@amd.com>, Suma Hegde
	<Suma.Hegde@amd.com>, Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Subject: [PATCH 08/11] platform/x86/amd/hsmp: Populate the bitmaps dynamically on 6th Gen AMD EPYC Server
Date: Thu, 8 Oct 2026 09:29:36 +0000
Message-ID: <b2f88bee5b7fbe25126c1dc6a0287ca05ba0b23a.1791446401.git.Suma.Hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1791446401.git.Suma.Hegde@amd.com>
References: <cover.1791446401.git.Suma.Hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018072:EE_|IA1PR12MB6162:EE_
X-MS-Office365-Filtering-Correlation-Id: d45d3795-7fbe-4943-b147-08df251ec6ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|36860700016|82310400026|376014|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	qITda1lX4+EQvpp5ZPo2zXw3Mg+FDqtfcIMBxJdMk2c+dBnksFUOGCW/PciBLUZQ8110tlHhbh+cECPOu1GfsEdERZqybFMOGx6S0auxv65BSY0KinWTbTAitepc3YC7zc8GBGH6sqImlD0UCf0FQo3I+vHAqJ0/Cyd+cSPmjtvpzvvYN0fbGSll7V402YpcxlVXG3ZE4RdeF0KyTstPYrQrCCzs6C0tV0DzfhRx9U2v5x3RqAu3fAywnFksTk4D3UF0QCS12DHYSyJfPYvBK30GPw2jZOw4UnPlORPNe/nsVqlwvpssKOfkcrs4uDbvXeqjARten5lruVNSKIMiy9r3mmHolCltN8+2uDGiKYnt3cTCPnzQxfHbWBdlxEjW9OMGUssSrISBaHSqPkZqMWN8ilFrtQVzBwtjL7+E4UrUCICmNSQuKl9xur1H8yfxTDetftfmmpA+xDoZqFgFN0K9YwSP0yt0i94vwTDyvOXHP7xmg/2/z/Ls5BPt0xNWL3dKr1w18YZgvFrCQ7f8zNyzT5NaVDzJ0AX6uQs14QcqB2S2DP08WES9EYOpNYa+u3k3g+JMciW6882TwyoIdDIgyTYU5vBsQ8xTSkMYvzdNNwJOcf6zcMoMQ4xbk2s7MC8ODhh8bbVEfRM+ZeRItREwzFVfqj1DSmk/7/tXOOBoF2JSMhPEfFwW2KUaYR3oND/i2j3MkB3f85ronFTwHA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(36860700016)(82310400026)(376014)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Kc8Omj37OqR/byyW2oOntmSZmpby2wskM0FmH2g+7JVAzNR1Y7uWED/r7R4KdPJhPmTvFQhkNpVYwpflf5Oid4uuLj8v4MnN2N0u6bqjW9T8tGbNmw3hfXC4Avmawh0EjV39SdRWLu/iiLAOfcw6F97PW3xvX7SClQrDiTDJEozvdfU+fIZE+DbZZCQCJWWdMJFF0rDMJxfCY5wfwr33JK9loD9a20trgdZiM1fq0Qf9bJ9rRVNFwkzi7bRlk16hpmI8lY1Nu6KOuPkYZRXoHjMFApz4jHVzj7aIRsiGwpFzwUltPm5VwYwKTyUAAjruKjoZ+6WZIRitbR1Y5QYYkTTfk57a0tMlGEjBfj5fCFG518YovPSNV7QsShbKYlFPKOMdmh01C1ymhq1CuKMuYdnfEv5BFvfwUw10ATuJjZ7GKPhZbVrNy4LEzYRyvOcu
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 09:30:22.7398
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d45d3795-7fbe-4943-b147-08df251ec6ff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018072.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6162

From: Suma Hegde <Suma.Hegde@amd.com>

HSMP_GET_ENABLED_HSMP_CMDS(0x37) returns the read/get and write/set
messages supported on the running platform, and correctly reflects
BIOS-masked messages in its bitmap.

6th Gen AMD EPYC Server and any future platforms support this
HSMP_GET_ENABLED_HSMP_CMDS message. On 6th Gen AMD EPYC Server, SMU
sends only BIOS masked message info. Hence add a work around.

Use hsmp_send_message_locked() when fetching the bitmaps during probe,
as the caller already holds hsmp_sock_rwsem for write.

Co-developed-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
---
 drivers/platform/x86/amd/hsmp/hsmp.c | 64 ++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 89528632c9532..bb1f98def3fb6 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -867,6 +867,69 @@ static const u32 write_bitmap_zen6_variants[] = {0x00047320, 0x070007c6, 0x00000
 #define set_write_enabled_msg_bitmap(sock, src)	\
 	bitmap_from_arr32((sock)->enabled_write_msg_ids, (src), HSMP_MAX_MSGS)
 
+#define HSMP_GET_ENABLED_CMD_READ_MASK	1
+#define HSMP_GET_ENABLED_CMD_WRITE_MASK	0
+
+static int hsmp_fetch_read_enabled_msgs(u16 sock_ind, unsigned long *read_msg_bmap)
+{
+	struct hsmp_message msg = {};
+	int ret;
+
+	msg.msg_id      = HSMP_GET_ENABLED_HSMP_CMDS;
+	msg.num_args    = hsmp_msg_desc_table[HSMP_GET_ENABLED_HSMP_CMDS].num_args;
+	msg.response_sz = hsmp_msg_desc_table[HSMP_GET_ENABLED_HSMP_CMDS].response_sz;
+	msg.args[0]     = HSMP_GET_ENABLED_CMD_READ_MASK;
+	msg.sock_ind    = sock_ind;
+	ret = hsmp_send_message_locked(&msg);
+	if (!ret)
+		bitmap_from_arr32(read_msg_bmap, msg.args, HSMP_MAX_MSGS);
+
+	return ret;
+}
+
+static int hsmp_fetch_write_enabled_msgs(u16 sock_ind, unsigned long *write_msg_bmap)
+{
+	struct hsmp_message msg = {};
+	int ret;
+
+	msg.msg_id      = HSMP_GET_ENABLED_HSMP_CMDS;
+	msg.num_args    = hsmp_msg_desc_table[HSMP_GET_ENABLED_HSMP_CMDS].num_args;
+	msg.response_sz = hsmp_msg_desc_table[HSMP_GET_ENABLED_HSMP_CMDS].response_sz;
+	msg.args[0]     = HSMP_GET_ENABLED_CMD_WRITE_MASK;
+	msg.sock_ind    = sock_ind;
+	ret = hsmp_send_message_locked(&msg);
+	if (!ret)
+		bitmap_from_arr32(write_msg_bmap, msg.args, HSMP_MAX_MSGS);
+
+	return ret;
+}
+
+static void hsmp_dynamic_bitmap_zen6(u16 sock_ind)
+{
+	struct hsmp_socket *sock = &hsmp_pdev.sock[sock_ind];
+	DECLARE_BITMAP(read_msgs_bmap, HSMP_MAX_MSGS);
+	DECLARE_BITMAP(write_msgs_bmap, HSMP_MAX_MSGS);
+
+	bitmap_zero(read_msgs_bmap, HSMP_MAX_MSGS);
+	bitmap_zero(write_msgs_bmap, HSMP_MAX_MSGS);
+	/*
+	 * On 6th Gen AMD EPYC Server variants, the SMU firmware only reports
+	 * which features are disabled by BIOS — all other bits are set to 1.
+	 * Combine the static bitmap with the SMU-returned bitmap using
+	 * bitwise AND to produce the correct feature mask.
+	 */
+	if (!hsmp_fetch_read_enabled_msgs(sock_ind, read_msgs_bmap)) {
+		bitmap_and(read_msgs_bmap, read_msgs_bmap,
+			   sock->enabled_read_msg_ids, HSMP_MAX_MSGS);
+		bitmap_copy(sock->enabled_read_msg_ids, read_msgs_bmap, HSMP_MAX_MSGS);
+	}
+	if (!hsmp_fetch_write_enabled_msgs(sock_ind, write_msgs_bmap)) {
+		bitmap_and(write_msgs_bmap, write_msgs_bmap,
+			   sock->enabled_write_msg_ids, HSMP_MAX_MSGS);
+		bitmap_copy(sock->enabled_write_msg_ids, write_msgs_bmap, HSMP_MAX_MSGS);
+	}
+}
+
 int hsmp_populate_msg_bitmaps(u16 sock_ind)
 {
 	struct hsmp_socket *sock = &hsmp_pdev.sock[sock_ind];
@@ -909,6 +972,7 @@ int hsmp_populate_msg_bitmaps(u16 sock_ind)
 				clear_bit(HSMP_PC6_ENABLE, sock->enabled_read_msg_ids);
 				clear_bit(HSMP_PC6_ENABLE, sock->enabled_write_msg_ids);
 			}
+			hsmp_dynamic_bitmap_zen6(sock_ind);
 			return 0;
 		}
 	}
-- 
2.34.1

