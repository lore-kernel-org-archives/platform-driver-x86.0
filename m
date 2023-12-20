Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A163046B99
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Dec 2023 16:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Ad+zSJ4+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fiz78n9c6Pfm7maPAFAsWOQ+eTluwx7YAAJT+wZvmqNrW226oyGthis+SFsxHNhpqbpCIEEDYYgozCJBK4N/NbYlTsN4XT3Y28/K9560dyn7muJ4TBNPv7nDXCX+ViacG+1jxwqHSJRUxmVMdaQRpWXtlioMB7SXTD0C16USbOgiu+ex/zJVDYZ4a981K+jjkcqfdr0FRU8EFwRgmWJND4ajSFn1tttYCHDUdSnVs5H7HajqL4op5ZS7ao4IUrBtlXgj8kOzJHlno/9gF8Xedb22FiS3mIpXxfw0WVQcWtbCiVaUIyra8HvtIdeDd0hGS0vokHZEJLgiaM1w+dKIdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CXMZv1qEtKq7A2QOw9OyFBBDKCwrTHWllbf8lAjxHLE=;
 b=a32G8r7/jDXafNWwYvwy5hChU75pJlxNDe2vm2Xk7n6zaEd+Q1AxywEir7ukIJF+xP+T74d/qvrOmz7AkwZD9ugGc813vfsoHjxMCQKqxQOJqBqNezoV9yz6+tFx8xbMsvsmGrUEm23EFgv45WDANvsMLs3z3XUcBd+bkn/tkEYJmQiVj/pn6lUrJstnC2LWvgBCNXchrfVJ729sbDxmoSqLu/NnPopURhrA5dFUcV5UrIJJxhzOp4KoPU+20hwG6gkw0nCJkvBPmMDgybgdLNnnCfAf0crEvQZJY0wBrGNPH15Rd4Nhj+Qk814pfUlOPxa5osRHOvZsgwV7EMVkmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CXMZv1qEtKq7A2QOw9OyFBBDKCwrTHWllbf8lAjxHLE=;
 b=Ad+zSJ4+8bFgOKnqsT8j4WZ97v7rcmqEAZ4z5U4c51uOSlbkWwOPV37g8Q63DdFcu95XtMrbRXHrGxH0d/xhkdgt2Z79jpVC9TmjK3hS23cQ6IrGGs7gQMtatH3xpPcYwsxISOQVG5R1DUfWIEvOeoCsaysAjFjCTkI1/tEhXeo=
Received: from BL0PR02CA0113.namprd02.prod.outlook.com (2603:10b6:208:35::18)
 by MN2PR12MB4374.namprd12.prod.outlook.com (2603:10b6:208:266::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Wed, 20 Dec
 2023 16:55:58 +0000
Received: from BL6PEPF0001AB58.namprd02.prod.outlook.com
 (2603:10b6:208:35:cafe::c0) by BL0PR02CA0113.outlook.office365.com
 (2603:10b6:208:35::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38 via Frontend
 Transport; Wed, 20 Dec 2023 16:55:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB58.mail.protection.outlook.com (10.167.241.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.14 via Frontend Transport; Wed, 20 Dec 2023 16:55:58 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 20 Dec
 2023 10:55:56 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v2 6/7] platform/x86: Convert to ACPI based probing
Date: Wed, 20 Dec 2023 16:55:27 +0000
Message-ID: <20231220165528.1351200-7-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231220165528.1351200-1-suma.hegde@amd.com>
References: <20231220165528.1351200-1-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB58:EE_|MN2PR12MB4374:EE_
X-MS-Office365-Filtering-Correlation-Id: 83cb7fa1-6152-47a0-0128-08dc017c89f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I8R+vv0p1+ndX6lv9cWWFqP3GnCpgQemsEZD4vnpM8UB08X22QQLE9rF+RHGtFad9EyNIeTNCIukOXpGHPUf0Dk6zZCvYPd+k8RuZEzOyqZKtmaBRxEJNOvSXJPQX5Gwwhb0NZNtJp3lbKXvdVhgBXJL+lMQcSKM9McTzch8pu6l/ilLe+hwjkA3GFOEYpx1Wp9rDrVIftvp92pFqrfDrvHoBSKLlj0r4sJlj9O3Ou6TaLDS13Sk6l6uY3Sb7zxuyszs8Qp26CXoWoQnpBnPpkpusxoG7ScR7Ro1tSi/ID5wbaxY9EITHbNoYHr47H6bxQtBZm2uUd80jYNNEIlJ2MRCNYnKDl27/7sKQ3FTI8nLFNjkYKycWKJtcXQkFyUPKhGQfRpS994kOfmaRLgD8/5hIMB2inWjnr6TZ83IUUKhWWZpG6bySs3C4zNTZA4dD6x35PuOk/rKFcPl/4x9UdabkbWm6Z+b497xcZoXarzmqLQeoNboqcZW/cCQl+5pZfPS6GxXDdb7df//5BDeVx/Nu/jRAtRm1SvVFlpkB45VkDgOn3dP8uhzUnGYfCEYsc7Mf84h1ziQNTqzS9GSoSWOI19IXcjN+jPI+5eBj/33XHBcCp3+rQi2VPCrj6ODdEJHtCkjz7RNmcgti0UCoiuiyLJHd1t6RStoI20dabVBbWyIV4pj+R3t0lh+LcfXQyiatavjnXPf5i6O22rF0boosr5MUxJ9CCyZVtwT/35nOHo4dAgNTnBFYY9kL31qGdae+NX0Htj0oJNaHGaWlw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(136003)(396003)(376002)(230922051799003)(186009)(82310400011)(64100799003)(451199024)(1800799012)(40470700004)(46966006)(36840700001)(7696005)(6666004)(478600001)(81166007)(356005)(2616005)(16526019)(426003)(1076003)(336012)(83380400001)(47076005)(26005)(36860700001)(40480700001)(86362001)(70586007)(44832011)(41300700001)(316002)(6916009)(54906003)(70206006)(8936002)(30864003)(8676002)(2906002)(5660300002)(36756003)(4326008)(82740400003)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2023 16:55:58.1603
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83cb7fa1-6152-47a0-0128-08dc017c89f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB58.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4374

ACPI table provides mailbox base address and register offset
information. The base address is provided as part of CRS method
and mailbox offsets are provided through DSD table.
Sockets are differentiated by UIDs.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>

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

---
 drivers/platform/x86/amd/hsmp.c | 323 +++++++++++++++++++++++++++++---
 1 file changed, 296 insertions(+), 27 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
index 3508399c6aa9..726ba73e23dd 100644
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
+		sock->mbinfo.size = r.end - r.start + 1;
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
+		return -EINVAL;
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
+			ret = -EINVAL;
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
@@ -532,28 +741,62 @@ static int initialize_platdev(struct device *dev)
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
-	ret = initialize_platdev(&pdev->dev);
-	if (ret)
-		return ret;
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
 
-	plat_dev.hsmp_device.name	= HSMP_CDEV_NAME;
-	plat_dev.hsmp_device.minor	= MISC_DYNAMIC_MINOR;
-	plat_dev.hsmp_device.fops	= &hsmp_fops;
-	plat_dev.hsmp_device.parent	= &pdev->dev;
-	plat_dev.hsmp_device.nodename	= HSMP_DEVNODE_NAME;
-	plat_dev.hsmp_device.mode	= 0644;
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
+		ret = initialize_platdev(&pdev->dev);
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
@@ -563,12 +806,35 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
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
@@ -576,6 +842,7 @@ static struct platform_driver amd_hsmp_driver = {
 	.remove_new	= hsmp_pltdrv_remove,
 	.driver		= {
 		.name	= DRIVER_NAME,
+		.acpi_match_table = amd_hsmp_acpi_ids,
 	},
 };
 
@@ -618,9 +885,11 @@ static int __init hsmp_plt_init(void)
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

