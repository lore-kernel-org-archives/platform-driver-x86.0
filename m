Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2045.outbound.protection.outlook.com [40.107.101.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D6055E77
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 Dec 2023 17:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hYnneLoV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N4fhxbdIapuA+JCWI9ZwmErzI+0yaFl+hm+ZAYnBL2Rb2L8iol83USTWNEmXwxzyLupCjM2luBf/rhFJEs0kc3rAo2Ha+SW5YGGJWaE6/o+RAnVw5+3sXDZ4kzufMTNg+P3BGehiJnDNOaHqR1D5jL+m1cJyS/b5smiQ3vKYTmIz0BT463/rvXTK4iWxQ6JBhVx050NHi8a+1lGV5EpSuXFvLjpjQPaEuFGiJhwQMJkYUAFSkh8F+bY1WzKuIIZy+/HollNNgfwaMNEq39QsQefZAfW/Eunvn8pkKamm0VoRbO2dFovpN95S2BtU/jxOMJDoJzQB/V+fw+LD4llCTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=85gzowP5C1qNNdmi6pbhtoTCtwbASXRe3NaOX8wpK+o=;
 b=Ut9F0tbTHRCGBe7qkd95QsYbvfzmzJ0x28eSqxjXu/sZKk32eN6YzpTnsl7Amwg947zllISBiGtYMD8/Pvwnkn5lg1LR78WJW+B9kcKKVYsmxYl9oY9qtEcpmhiPQhCsn+Ir9F3IuwSWpsEQb8gEQTGj0r0/en9wla8V1KXTkLzvz3YMn5k4IvTbqhbdE45hlg+g5C/bIbWsf3Ujy7Wg2AqPG6MYiZt+g8fxDn4JWUFiqHb0yWbJVxiN7eyRvTVk+gVG+IjA2zYrT2lu5Ij6I7gcQuQU34PT+kDxOuewOAYsng//WV4LF0YCNRAKASglpAPi/2Dd8CyPsQCWBwQEig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=85gzowP5C1qNNdmi6pbhtoTCtwbASXRe3NaOX8wpK+o=;
 b=hYnneLoVSh7niExdD/PwEx8xlFCygMu9JjF+RRDO09Y+0oHMeTECWdoiJZnglPdKoHoqTZmbxHIJ4oqaEJpCz9BnoG5s8RHektg0fTliDEeHGKShGyIfzwBiQMMLzIlPhBx1RnqHoAp7KOGF9boSXFrrJRERCRbOuppj5Ve1cII=
Received: from BL1PR13CA0427.namprd13.prod.outlook.com (2603:10b6:208:2c3::12)
 by IA1PR12MB6164.namprd12.prod.outlook.com (2603:10b6:208:3e8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.20; Thu, 21 Dec
 2023 17:21:48 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:208:2c3:cafe::a3) by BL1PR13CA0427.outlook.office365.com
 (2603:10b6:208:2c3::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.21 via Frontend
 Transport; Thu, 21 Dec 2023 17:21:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.14 via Frontend Transport; Thu, 21 Dec 2023 17:21:47 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 21 Dec
 2023 11:21:45 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v3 6/7] platform/x86: Convert to ACPI based probing
Date: Thu, 21 Dec 2023 17:21:13 +0000
Message-ID: <20231221172114.1569559-6-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231221172114.1569559-1-suma.hegde@amd.com>
References: <20231221172114.1569559-1-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|IA1PR12MB6164:EE_
X-MS-Office365-Filtering-Correlation-Id: fbbaa30b-5670-422b-641c-08dc02495026
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UWbZwffF+6kJTdeG4leXID2xl5W/CsYaziCqK1O/PRLMqukAfgSVduaB2pLzO6HN3A7tiDjr3i2eNkJZ8wugqRcTHmP9rY0i8RXmGu6MPfXUUSPgWVF1g6qP7AiSVbBxTJFWDPvU9vqcqiLXY9Psft7eJzSgQboLs7TstOk/+p4J87jXx9ZtdsUPeDZdOVa7wa/1tzIi2mfVNU/H5gN++1KY/NJVqbl3usia1mlXdrBkZ5hiWDmyqAfzIyTeeu7ftC/acJ6yem5lMJa8eNXqWO7q4LsSK+VtpDGc/iQIk2VuB4XFUUgBEWG/u4Y4N8VnAxoprJU/eIFHrV83BKqa+xozNx+RtpQxTZ8BrBNHLy644b7Fru7sG/o77j+5YTwmg/vwwQvM+ficEeOnBj5jjrgEOZTfSyyYA3G5kpoQ89KeOlfwonvkjgYEx6I/eHBxc62vmN7kBXmFvrmRT0VV1m/UD+7fCqD/2rdYQPhlWkhXeJIvTSk3DDovUUKUTSluPDtmlr2VvmMDtLuuuYDos5SJ4cz7zLpZHUx0h9EGTdJ3cZ9Kv92gcZzf7/0WV/iFL05uMaghZu8hJg1b7eiE159BkvR1A1ti9LOHTB+o2k78J4peeZ1eTLVNe5AznDesflnjJ/ky/Y3tg50mpsLw1KOdG+S+Q3e0lVPcBAjDivrtfWwk+jKmzhbhE4acd4S1nVITDAhiLNJeAjeoNcfIpPBjQIq/eO61nB3UFrTtvWPaSstbOOzsVkFh7SXehwCWh5ps1g1Q8DHjdIsadN6DbQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(396003)(39860400002)(136003)(230922051799003)(82310400011)(1800799012)(451199024)(64100799003)(186009)(36840700001)(40470700004)(46966006)(5660300002)(36860700001)(36756003)(82740400003)(8936002)(8676002)(4326008)(86362001)(41300700001)(356005)(2616005)(81166007)(40480700001)(44832011)(47076005)(30864003)(54906003)(40460700003)(2906002)(316002)(70586007)(6916009)(70206006)(83380400001)(16526019)(336012)(26005)(426003)(478600001)(6666004)(1076003)(7696005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2023 17:21:47.9860
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbbaa30b-5670-422b-641c-08dc02495026
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6164

ACPI table provides mailbox base address and register offset
information. The base address is provided as part of CRS method
and mailbox offsets are provided through DSD table.
Sockets are differentiated by UIDs.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
Changes since v1:
1. Define amd_hsmp_acpi_rdwr() for doing mailbox memory mapped io
2. Add a check to see if mailbox register offsets are set in
   hsmp_read_acpi_dsd()
3. Add a check to see if sock->mbinfo.base_addr sockck->mbinfo.size are
   set in hsmp_read_acpi_crs()
4. Change order of the statements in switch case ACPI_RESOURCE_TYPE_FIXED_MEMORY32
   in hsmp_resource()
5. Add hsmp_test() after hsmp_parse_acpi_table() call
6. Add r.end < r.start check in hsmp_resource()
7. Add !dsd error check in hsmp_read_acpi_dsd
Changes since v2:
1. Change EINVAL to ENODEV in hsmp_read_acpi_dsd()
2. Change EINVAL to ENOENT in hsmp_read_acpi_dsd()
3. Use resource_size() in hsmp_resource()

 drivers/platform/x86/amd/hsmp.c | 324 +++++++++++++++++++++++++++++---
 1 file changed, 296 insertions(+), 28 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
index e77d4cd83a07..46924c572055 100644
--- a/drivers/platform/x86/amd/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp.c
@@ -18,9 +18,11 @@
 #include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/semaphore.h>
+#include <linux/acpi.h>
 
 #define DRIVER_NAME		"amd_hsmp"
-#define DRIVER_VERSION		"2.0"
+#define DRIVER_VERSION		"2.2"
+#define ACPI_HSMP_DEVICE_HID	"AMDI0097"
 
 /* HSMP Status / Error codes */
 #define HSMP_STATUS_NOT_READY	0x00
@@ -54,6 +56,11 @@
 
 #define HSMP_ATTR_GRP_NAME_SIZE	10
 
+/* These are the strings specified in ACPI table */
+#define MSG_IDOFF_STR		"MsgIdOffset"
+#define MSG_ARGOFF_STR		"MsgArgOffset"
+#define MSG_RESPOFF_STR		"MsgRspOffset"
+
 struct hsmp_mbaddr_info {
 	u32 base_addr;
 	u32 msg_id_off;
@@ -66,6 +73,7 @@ struct hsmp_socket {
 	struct bin_attribute hsmp_attr;
 	struct hsmp_mbaddr_info mbinfo;
 	void __iomem *metric_tbl_addr;
+	void __iomem *virt_base_addr;
 	struct semaphore hsmp_sem;
 	char name[HSMP_ATTR_GRP_NAME_SIZE];
 	struct pci_dev *root;
@@ -78,12 +86,14 @@ struct hsmp_plat_device {
 	struct hsmp_socket *sock;
 	u32 proto_ver;
 	u16 num_sockets;
+	bool is_acpi_device;
+	bool is_probed;
 };
 
 static struct hsmp_plat_device plat_dev;
 
-static int amd_hsmp_rdwr(struct hsmp_socket *sock, u32 offset,
-			 u32 *value, bool write)
+static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
+			     u32 *value, bool write)
 {
 	int ret;
 
@@ -101,8 +111,29 @@ static int amd_hsmp_rdwr(struct hsmp_socket *sock, u32 offset,
 	return ret;
 }
 
+static void amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
+			       u32 *value, bool write)
+{
+	if (write)
+		iowrite32(*value, sock->virt_base_addr + offset);
+	else
+		*value = ioread32(sock->virt_base_addr + offset);
+}
+
+static int amd_hsmp_rdwr(struct hsmp_socket *sock, u32 offset,
+			 u32 *value, bool write)
+{
+	if (plat_dev.is_acpi_device)
+		amd_hsmp_acpi_rdwr(sock, offset, value, write);
+	else
+		return amd_hsmp_pci_rdwr(sock, offset, value, write);
+
+	return 0;
+}
+
 /*
- * Send a message to the HSMP port via PCI-e config space registers.
+ * Send a message to the HSMP port via PCI-e config space registers
+ * or by writing to MMIO space.
  *
  * The caller is expected to zero out any unused arguments.
  * If a response is expected, the number of response words should be greater than 0.
@@ -450,6 +481,9 @@ static int hsmp_create_sysfs_interface(void)
 	int ret;
 	u16 i;
 
+	if (plat_dev.is_acpi_device)
+		return 0;
+
 	/* String formatting is currently limited to u8 sockets */
 	if (WARN_ON(plat_dev.num_sockets > U8_MAX))
 		return -ERANGE;
@@ -487,13 +521,188 @@ static int hsmp_create_sysfs_interface(void)
 	return devm_device_add_groups(plat_dev.sock[0].dev, hsmp_attr_grps);
 }
 
-static int hsmp_cache_proto_ver(void)
+/* This is the UUID used for HSMP */
+static const guid_t acpi_hsmp_uuid = GUID_INIT(0xb74d619d, 0x5707, 0x48bd,
+						0xa6, 0x9f, 0x4e, 0xa2,
+						0x87, 0x1f, 0xc2, 0xf6);
+
+static inline bool is_acpi_hsmp_uuid(union acpi_object *obj)
+{
+	if (obj->type == ACPI_TYPE_BUFFER && obj->buffer.length == 16)
+		return guid_equal((guid_t *)obj->buffer.pointer, &acpi_hsmp_uuid);
+
+	return false;
+}
+
+static inline int hsmp_get_uid(struct device *dev, u16 *sock_ind)
+{
+	char *uid;
+
+	/*
+	 * UID (ID00, ID01..IDXX) is used for differentiating sockets,
+	 * read it and strip the "ID" part of it and convert the remaining
+	 * bytes to integer.
+	 */
+	uid = acpi_device_uid(ACPI_COMPANION(dev));
+
+	return kstrtou16((uid + 2), 10, sock_ind);
+}
+
+static acpi_status hsmp_resource(struct acpi_resource *res, void *data)
+{
+	struct hsmp_socket *sock = data;
+	struct resource r;
+
+	switch (res->type) {
+	case ACPI_RESOURCE_TYPE_FIXED_MEMORY32:
+		if (!acpi_dev_resource_memory(res, &r))
+			return AE_ERROR;
+		if (!r.start || r.end < r.start || !(r.flags & IORESOURCE_MEM_WRITEABLE))
+			return AE_ERROR;
+		sock->mbinfo.base_addr = r.start;
+		sock->mbinfo.size = resource_size(&r);
+		break;
+	case ACPI_RESOURCE_TYPE_END_TAG:
+		break;
+	default:
+		return AE_ERROR;
+	}
+
+	return AE_OK;
+}
+
+static int hsmp_read_acpi_dsd(struct hsmp_socket *sock)
+{
+	struct acpi_buffer buf = { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object *guid, *mailbox_package;
+	union acpi_object *dsd;
+	acpi_status status;
+	int ret = 0;
+	int j;
+
+	status = acpi_evaluate_object_typed(ACPI_HANDLE(sock->dev), "_DSD", NULL,
+					    &buf, ACPI_TYPE_PACKAGE);
+	if (ACPI_FAILURE(status)) {
+		dev_err(sock->dev, "Failed to read mailbox reg offsets from DSD table, err: %s\n",
+			acpi_format_exception(status));
+		return -ENODEV;
+	}
+
+	dsd = buf.pointer;
+
+	/* HSMP _DSD property should contain 2 objects.
+	 * 1. guid which is an acpi object of type ACPI_TYPE_BUFFER
+	 * 2. mailbox which is an acpi object of type ACPI_TYPE_PACKAGE
+	 *    This mailbox object contains 3 more acpi objects of type
+	 *    ACPI_TYPE_PACKAGE for holding msgid, msgresp, msgarg offsets
+	 *    these packages inturn contain 2 acpi objects of type
+	 *    ACPI_TYPE_STRING and ACPI_TYPE_INTEGER
+	 */
+	if (!dsd || dsd->type != ACPI_TYPE_PACKAGE || dsd->package.count != 2) {
+		ret = -EINVAL;
+		goto free_buf;
+	}
+
+	guid = &dsd->package.elements[0];
+	mailbox_package = &dsd->package.elements[1];
+	if (!is_acpi_hsmp_uuid(guid) || mailbox_package->type != ACPI_TYPE_PACKAGE) {
+		dev_err(sock->dev, "Invalid hsmp _DSD table data\n");
+		ret = -EINVAL;
+		goto free_buf;
+	}
+
+	for (j = 0; j < mailbox_package->package.count; j++) {
+		union acpi_object *msgobj, *msgstr, *msgint;
+
+		msgobj	= &mailbox_package->package.elements[j];
+		msgstr	= &msgobj->package.elements[0];
+		msgint	= &msgobj->package.elements[1];
+
+		/* package should have 1 string and 1 integer object */
+		if (msgobj->type != ACPI_TYPE_PACKAGE ||
+		    msgstr->type != ACPI_TYPE_STRING ||
+		    msgint->type != ACPI_TYPE_INTEGER) {
+			ret = -EINVAL;
+			goto free_buf;
+		}
+
+		if (!strncmp(msgstr->string.pointer, MSG_IDOFF_STR,
+			     msgstr->string.length)) {
+			sock->mbinfo.msg_id_off = msgint->integer.value;
+		} else if (!strncmp(msgstr->string.pointer, MSG_RESPOFF_STR,
+				    msgstr->string.length)) {
+			sock->mbinfo.msg_resp_off =  msgint->integer.value;
+		} else if (!strncmp(msgstr->string.pointer, MSG_ARGOFF_STR,
+				    msgstr->string.length)) {
+			sock->mbinfo.msg_arg_off = msgint->integer.value;
+		} else {
+			ret = -ENOENT;
+			goto free_buf;
+		}
+	}
+
+	if (!sock->mbinfo.msg_id_off || !sock->mbinfo.msg_resp_off ||
+	    !sock->mbinfo.msg_arg_off)
+		ret = -EINVAL;
+
+free_buf:
+	ACPI_FREE(buf.pointer);
+	return ret;
+}
+
+static int hsmp_read_acpi_crs(struct hsmp_socket *sock)
+{
+	acpi_status status;
+
+	status = acpi_walk_resources(ACPI_HANDLE(sock->dev), METHOD_NAME__CRS,
+				     hsmp_resource, sock);
+	if (ACPI_FAILURE(status)) {
+		dev_err(sock->dev, "Failed to look up MP1 base address from CRS method, err: %s\n",
+			acpi_format_exception(status));
+		return -EINVAL;
+	}
+	if (!sock->mbinfo.base_addr || !sock->mbinfo.size)
+		return -EINVAL;
+
+	/* The mapped region should be un cached */
+	sock->virt_base_addr = devm_ioremap_uc(sock->dev, sock->mbinfo.base_addr,
+					       sock->mbinfo.size);
+	if (!sock->virt_base_addr) {
+		dev_err(sock->dev, "Failed to ioremap MP1 base address\n");
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+/* Parse the ACPI table to read the data */
+static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
+{
+	struct hsmp_socket *sock = &plat_dev.sock[sock_ind];
+	int ret;
+
+	sock->sock_ind		= sock_ind;
+	sock->dev		= dev;
+	plat_dev.is_acpi_device	= true;
+
+	sema_init(&sock->hsmp_sem, 1);
+
+	/* Read MP1 base address from CRS method */
+	ret = hsmp_read_acpi_crs(sock);
+	if (ret)
+		return ret;
+
+	/* Read mailbox offsets from DSD table */
+	return hsmp_read_acpi_dsd(sock);
+}
+
+static int hsmp_cache_proto_ver(u16 sock_ind)
 {
 	struct hsmp_message msg = { 0 };
 	int ret;
 
 	msg.msg_id	= HSMP_GET_PROTO_VER;
-	msg.sock_ind	= 0;
+	msg.sock_ind	= sock_ind;
 	msg.response_sz = hsmp_msg_desc_table[HSMP_GET_PROTO_VER].response_sz;
 
 	ret = hsmp_send_message(&msg);
@@ -534,28 +743,61 @@ static int init_socket_objects(struct device *dev)
 	return 0;
 }
 
+static const struct acpi_device_id amd_hsmp_acpi_ids[] = {
+	{ACPI_HSMP_DEVICE_HID, 0},
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, amd_hsmp_acpi_ids);
+
 static int hsmp_pltdrv_probe(struct platform_device *pdev)
 {
+	struct acpi_device *adev;
+	u16 sock_ind = 0;
 	int ret;
 
-	plat_dev.sock = devm_kzalloc(&pdev->dev,
-				     (plat_dev.num_sockets * sizeof(struct hsmp_socket)),
-				     GFP_KERNEL);
-	if (!plat_dev.sock)
-		return -ENOMEM;
-
-	ret = init_socket_objects(&pdev->dev);
-	if (ret)
-		return ret;
-
-	plat_dev.hsmp_device.name	= HSMP_CDEV_NAME;
-	plat_dev.hsmp_device.minor	= MISC_DYNAMIC_MINOR;
-	plat_dev.hsmp_device.fops	= &hsmp_fops;
-	plat_dev.hsmp_device.parent	= &pdev->dev;
-	plat_dev.hsmp_device.nodename	= HSMP_DEVNODE_NAME;
-	plat_dev.hsmp_device.mode	= 0644;
+	/*
+	 * On ACPI supported BIOS, there is an ACPI HSMP device added for
+	 * each socket, so the per socket probing, but the memory allocated for
+	 * sockets should be contiguous to access it as an array,
+	 * Hence allocate memory for all the sockets at once instead of allocating
+	 * on each probe.
+	 */
+	if (!plat_dev.is_probed) {
+		plat_dev.sock = devm_kzalloc(&pdev->dev,
+					     (plat_dev.num_sockets * sizeof(struct hsmp_socket)),
+					     GFP_KERNEL);
+		if (!plat_dev.sock)
+			return -ENOMEM;
+	}
+	adev = ACPI_COMPANION(&pdev->dev);
+	if (adev && !acpi_match_device_ids(adev, amd_hsmp_acpi_ids)) {
+		ret = hsmp_get_uid(&pdev->dev, &sock_ind);
+		if (ret)
+			return ret;
+		if (sock_ind >= plat_dev.num_sockets)
+			return -EINVAL;
+		ret = hsmp_parse_acpi_table(&pdev->dev, sock_ind);
+		if (ret) {
+			dev_err(&pdev->dev, "Failed to parse ACPI table\n");
+			return ret;
+		}
+		/* Test the hsmp interface */
+		ret = hsmp_test(sock_ind, 0xDEADBEEF);
+		if (ret) {
+			dev_err(&pdev->dev, "HSMP test message failed on Fam:%x model:%x\n",
+				boot_cpu_data.x86, boot_cpu_data.x86_model);
+			dev_err(&pdev->dev, "Is HSMP disabled in BIOS ?\n");
+			return ret;
+		}
+	} else {
+		ret = init_socket_objects(&pdev->dev);
+		if (ret) {
+			dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
+			return ret;
+		}
+	}
 
-	ret = hsmp_cache_proto_ver();
+	ret = hsmp_cache_proto_ver(sock_ind);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to read HSMP protocol version\n");
 		return ret;
@@ -565,12 +807,35 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 	if (ret)
 		dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
 
-	return misc_register(&plat_dev.hsmp_device);
+	if (!plat_dev.is_probed) {
+		plat_dev.hsmp_device.name	= HSMP_CDEV_NAME;
+		plat_dev.hsmp_device.minor	= MISC_DYNAMIC_MINOR;
+		plat_dev.hsmp_device.fops	= &hsmp_fops;
+		plat_dev.hsmp_device.parent	= &pdev->dev;
+		plat_dev.hsmp_device.nodename	= HSMP_DEVNODE_NAME;
+		plat_dev.hsmp_device.mode	= 0644;
+
+		ret = misc_register(&plat_dev.hsmp_device);
+		if (ret)
+			return ret;
+
+		plat_dev.is_probed = true;
+	}
+
+	return 0;
+
 }
 
 static void hsmp_pltdrv_remove(struct platform_device *pdev)
 {
-	misc_deregister(&plat_dev.hsmp_device);
+	/*
+	 * We register only one misc_device even on multi socket system.
+	 * So, deregister should happen only once.
+	 */
+	if (plat_dev.is_probed) {
+		misc_deregister(&plat_dev.hsmp_device);
+		plat_dev.is_probed = false;
+	}
 }
 
 static struct platform_driver amd_hsmp_driver = {
@@ -578,6 +843,7 @@ static struct platform_driver amd_hsmp_driver = {
 	.remove_new	= hsmp_pltdrv_remove,
 	.driver		= {
 		.name	= DRIVER_NAME,
+		.acpi_match_table = amd_hsmp_acpi_ids,
 	},
 };
 
@@ -620,9 +886,11 @@ static int __init hsmp_plt_init(void)
 	if (ret)
 		return ret;
 
-	ret = hsmp_plat_dev_register();
-	if (ret)
-		platform_driver_unregister(&amd_hsmp_driver);
+	if (!plat_dev.is_acpi_device) {
+		ret = hsmp_plat_dev_register();
+		if (ret)
+			platform_driver_unregister(&amd_hsmp_driver);
+	}
 
 	return ret;
 }
-- 
2.25.1

