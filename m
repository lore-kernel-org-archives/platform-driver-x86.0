Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HRvU/ulz"
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCB1CAB
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 Dec 2023 02:38:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f09RDWapHBsyPJpEwAFJhMNJPYk7oflOlRf4K9nZYnOA775oERhx8yGmVjFiuTXF8jqyK2D2wtwlze+WZwgx86c/A4Quh97Vn0NufLbz8NRliL3Ns76/2UL8I7m0MKMuNyxjk7DMtAZMT2re/DZ6XEET3PMgZ9YR0hPkYtTMj6pMKUCZEySrXVmh4mL/BXmRGci9CxOpRPSwv68Aa3T/GHBu8Ci83KqDno+Npnfe4ZbDtZo8VFtZJm72KPRud7fdvnc6rHrPh5i62E+urDPOONKbJox8t8eOegYg4LrKaKcUQSDkIp9reWgR4Q7KuMEthHEuQbo7szoqX96rLjrjZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UwePveouisU+RiAcyJwFVZR+vR4X1ymy2oNpg7skZtY=;
 b=FUK4q4Mbj6unYg1ir1XQhfuJfIqIT0Fco4msgkCKhfky43Z+zZaA17JJqGSZ7qNalRQxDIfbJQyoNyzoQwFgeLVDwJRwLpBeSnkoS7mfg4/GuTKBUha5ivS6n4Miz3ocB3mMwg8Tdv/EQBq09DV8MP2/x4FYwVjDLXGxJK3YYrnr14XEsx9WrZ7o7MrrAnw8Tk0Sg9WyCcnlwUOTNnQdMami4dvcM4RqASebaejIceWNK9ASwnyhElYbVc/yx1biyi4FSqV/3sXrEU/Jgf59z1ylxSwQnjqHnkogY7dy4F9PSW1GpXkeIERmFOG+hm/3AK5TnABRHfkTANkRBj4q7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UwePveouisU+RiAcyJwFVZR+vR4X1ymy2oNpg7skZtY=;
 b=HRvU/ulzwFJcLO9Hu17TJPeE92PjXXy13cVYTrNwBa4XD27JgZJajyHeOq6NJcKPJ/jeYvl/FPbaQcfJHX0v63VcQrsye4xTk/2ti1ZDsS3xiQSb5k/58G35j1VEO1sLlF1VI2Lw3UBmVOClwSLCC1YseYKmVTM6Iytx7y2VRkk=
Received: from DS7PR07CA0004.namprd07.prod.outlook.com (2603:10b6:5:3af::13)
 by SA0PR12MB4431.namprd12.prod.outlook.com (2603:10b6:806:95::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Tue, 12 Dec
 2023 10:38:57 +0000
Received: from CY4PEPF0000EE3F.namprd03.prod.outlook.com
 (2603:10b6:5:3af:cafe::a6) by DS7PR07CA0004.outlook.office365.com
 (2603:10b6:5:3af::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33 via Frontend
 Transport; Tue, 12 Dec 2023 10:38:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3F.mail.protection.outlook.com (10.167.242.19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.18 via Frontend Transport; Tue, 12 Dec 2023 10:38:57 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 12 Dec
 2023 04:38:54 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [PATCH 6/7] platform/x86: Convert to ACPI based probing
Date: Tue, 12 Dec 2023 10:36:43 +0000
Message-ID: <20231212103644.768460-7-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231212103644.768460-1-suma.hegde@amd.com>
References: <20231212103644.768460-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3F:EE_|SA0PR12MB4431:EE_
X-MS-Office365-Filtering-Correlation-Id: df8d2c3a-f5b8-4c34-714e-08dbfafe8b81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	426yCmfPg+90S1Ofw0H31PfZ7NcDa7LHTQbg/agF6t3tvW04RGaA0Uhze62ZJZyhg+tL6KO21jCSvbqHwa91K5MbWdYWtpHpouE5dgI7hoFpJltG22KPITik1YO1yoZOXmvY6tfbOlXOYKiN58guJkjfqjoEGabTnS/01rc8u8OlMXtpgLFnj23O2W6Fl3eyc51TVv+OnE3DpeL88weBHf5ruX3JK1WB1jbCzQa4ujZ5h9irfFvMkrEJggq+mlwQwgi+e1q/EHPY2uTeJZUZ4xsyCmkkOT9HA4yWy9G1Ua+sCmEpKT6ShttSxGqsLsXlVVs2ynjqJ29yRXfnfvUhFytGSad901wBTIUvroU9S/zCGAEVvZmQkJ5LyxRc3kfqfpNgBm2+UU3nXdNXcb7e8CT+qOD8/WUqx3zOyIkXBXlpqyhWBcjv8rh7TpL4w4zTr+L/xMgA3CtuRuC1USNy/pXvsHFoMUah1TspRtpo3olHD7W6rmC44qKhRW5cnXm7r3bo4E8caTZPMRh6ylpyGeS6Jo/kSCDuAJEH1S3JeRbC8z8nYczXjtMhG3mzSGn96Zo4L6CDgh5dFaj77NN9gjfYTvKAZu8B65oAdp9OtOMF+CUcIij/pIqQfq1PawDmlr1QrfuGqUNp/dRJryuUabzNXsL44kg+McD2tsJvLHH0fN4k39/ZQKAASz32DGEaRV9rJQbrHYamqesHNUqjsN+5wzlZ6zRPrYgPJJbS5z84tsYKo36eZ/wwFe8+VptWtdVs7xv7UqxyjU7Qe2Fgng==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(396003)(39860400002)(136003)(230922051799003)(451199024)(1800799012)(186009)(82310400011)(64100799003)(40470700004)(36840700001)(46966006)(83380400001)(2906002)(82740400003)(41300700001)(356005)(478600001)(81166007)(86362001)(426003)(54906003)(6916009)(70206006)(70586007)(40480700001)(30864003)(316002)(6666004)(7696005)(8676002)(8936002)(4326008)(40460700003)(44832011)(36756003)(47076005)(1076003)(36860700001)(5660300002)(16526019)(26005)(2616005)(336012)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 10:38:57.1116
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df8d2c3a-f5b8-4c34-714e-08dbfafe8b81
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4431

ACPI table provides mailbox base address and register offset
information. The base address is provided as part of CRS method
and mailbox offsets are provided through DSD table.
Sockets are differentiated by UIDs.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Co-developed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Signed-off-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
 drivers/platform/x86/amd/hsmp.c | 304 +++++++++++++++++++++++++++++---
 1 file changed, 276 insertions(+), 28 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
index 87af1ad5c645..82bd4189cbd3 100644
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
 
@@ -101,8 +111,23 @@ static int amd_hsmp_rdwr(struct hsmp_socket *sock, u32 offset,
 	return ret;
 }
 
+static int amd_hsmp_rdwr(struct hsmp_socket *sock, u32 offset,
+			 u32 *value, bool write)
+{
+	if (!plat_dev.is_acpi_device)
+		return amd_hsmp_pci_rdwr(sock, offset, value, write);
+
+	if (write)
+		iowrite32(*value, sock->virt_base_addr + offset);
+	else
+		*value = ioread32(sock->virt_base_addr + offset);
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
@@ -451,6 +476,9 @@ static int hsmp_create_sysfs_interface(void)
 	int ret;
 	u16 i;
 
+	if (plat_dev.is_acpi_device)
+		return 0;
+
 	/* String formatting is currently limited to u8 sockets */
 	if (WARN_ON(plat_dev.num_sockets > U8_MAX))
 		return -ERANGE;
@@ -488,13 +516,181 @@ static int hsmp_create_sysfs_interface(void)
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
+		sock->mbinfo.base_addr = r.start;
+		sock->mbinfo.size = r.end - r.start + 1;
+		if (!r.start || !r.end || !(r.flags & IORESOURCE_MEM_WRITEABLE))
+			return AE_ERROR;
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
+	if (dsd->type != ACPI_TYPE_PACKAGE || dsd->package.count != 2) {
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
@@ -524,22 +720,55 @@ static int initialize_platdev(struct device *dev)
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
 
-	ret = initialize_platdev(&pdev->dev);
-	if (ret)
-		return ret;
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
+	} else {
+		ret = initialize_platdev(&pdev->dev);
+		if (ret) {
+			dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
+			return ret;
+		}
+	}
 
 	/* Test the hsmp interface */
-	ret = hsmp_test(0, 0xDEADBEEF);
+	ret = hsmp_test(sock_ind, 0xDEADBEEF);
 	if (ret) {
 		dev_err(&pdev->dev, "HSMP test message failed on Fam:%x model:%x\n",
 			boot_cpu_data.x86, boot_cpu_data.x86_model);
@@ -547,14 +776,7 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	plat_dev.hsmp_device.name	= HSMP_CDEV_NAME;
-	plat_dev.hsmp_device.minor	= MISC_DYNAMIC_MINOR;
-	plat_dev.hsmp_device.fops	= &hsmp_fops;
-	plat_dev.hsmp_device.parent	= &pdev->dev;
-	plat_dev.hsmp_device.nodename	= HSMP_DEVNODE_NAME;
-	plat_dev.hsmp_device.mode	= 0644;
-
-	ret = hsmp_cache_proto_ver();
+	ret = hsmp_cache_proto_ver(sock_ind);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to read HSMP protocol version\n");
 		return ret;
@@ -564,12 +786,35 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
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
@@ -577,6 +822,7 @@ static struct platform_driver amd_hsmp_driver = {
 	.remove_new	= hsmp_pltdrv_remove,
 	.driver		= {
 		.name	= DRIVER_NAME,
+		.acpi_match_table = amd_hsmp_acpi_ids,
 	},
 };
 
@@ -619,9 +865,11 @@ static int __init hsmp_plt_init(void)
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

