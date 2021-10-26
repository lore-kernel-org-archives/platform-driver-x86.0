Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDC1FC433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Oct 2021 18:57:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C505260EBD
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Oct 2021 18:57:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236759AbhJZS7y (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Oct 2021 14:59:54 -0400
Received: from mail-dm6nam11on2054.outbound.protection.outlook.com ([40.107.223.54]:64420
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231592AbhJZS7x (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Oct 2021 14:59:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nQG3OFwxq+l4Jqr7jPysWW9EsH+5RwHtWuhjW6d7uQIPzUWtKB86CgfHpE4kki+zDl2VDobaLeYBiCCFK0pJoFKnLd/N4e/WE9Rarnvv5/aZpSawJOW4EXmkFXqk70WvHniUQy6lIV5N9Vxu7LSQLDqjfA1aveDshONq0QGs4PxMj3P+7Ms1RCaf0ufhB8lQAjhzx3Aq9lkj9PUmJQk9qNkBBIz1kSH0wNNq7xez5gxIxtkEQ8kmrCIa87vzMj1yaHhxN8t2LmhOpo7GN9h/S6CicfnsyTvZ42RuY0iNpW046N35ZAakyisYW7QcFvp646FnDDz7jnu+7t/tziKgiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sXGqeNgX7SZsCE2L9fwtHZrjHckIH0asmE0nocZ5GxM=;
 b=Zj5LdRlyX9VuU5Y/Fsz6LC9/XRtme/plSlQ65BAUzsbAF7LabvjZx2m5cKdiUuZxOUABS0uNIPwnGtq/8nkubV6jPsqnEkeLJzvHnJYyJaT3r1AumMM8LYglbd9aPR5Nog9qL8P1ALDD5bOrEx4yjAG3yBP6FK0ytVnMsGHfaJXD7MLN/YZsH+idnDsUHafGx4R1rcDHa+UvgSZzldCyt7Ou3BznZ7jjua8VFTBaUZZm7L4cBpcSnj9nrH3dddoDKdZScQ4AMDm3nFtw/EAul4wI3E4ilI7EK6qs9Mp+uxR/PkqfS02LSuar2NeIRm2BO+6HX6pAn+JZP6ekORHKEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sXGqeNgX7SZsCE2L9fwtHZrjHckIH0asmE0nocZ5GxM=;
 b=CBPtDd88ihyTC+euLlBJVg3onSHBYf45PqmGqaGbwfEgVlNCAkRq2xJgr7xWDIMe5vrgZhEVf6cvkI7d3C/1KPIauJ/LObARw81+gKFTNXbiZY+u+oASZsFCW7eRvtvMqsg2QSVOPUjWnUQkHAtWASji9ETbtorByjQ4BmyO8v8=
Received: from BN8PR12MB3508.namprd12.prod.outlook.com (2603:10b6:408:6b::19)
 by BN8PR12MB3011.namprd12.prod.outlook.com (2603:10b6:408:4a::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Tue, 26 Oct
 2021 18:57:27 +0000
Received: from BN8PR12MB3508.namprd12.prod.outlook.com
 ([fe80::1d74:c55a:fe83:bd18]) by BN8PR12MB3508.namprd12.prod.outlook.com
 ([fe80::1d74:c55a:fe83:bd18%6]) with mapi id 15.20.4628.020; Tue, 26 Oct 2021
 18:57:27 +0000
From:   "Goswami, Sanket" <Sanket.Goswami@amd.com>
To:     "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>
CC:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "smbruce@gmail.com" <smbruce@gmail.com>
Subject: RE: [PATCH v4 3/3] platform/x86: amd-pmc: Add support for AMD Smart
 Trace Buffer
Thread-Topic: [PATCH v4 3/3] platform/x86: amd-pmc: Add support for AMD Smart
 Trace Buffer
Thread-Index: AQHXypkvusLmvSWb6Euu4e+RUJ57jqvloO4A
Date:   Tue, 26 Oct 2021 18:57:26 +0000
Message-ID: <BN8PR12MB3508437615126E2E6F93F1959C849@BN8PR12MB3508.namprd12.prod.outlook.com>
References: <20211026184045.2201-1-Sanket.Goswami@amd.com>
 <20211026184045.2201-4-Sanket.Goswami@amd.com>
In-Reply-To: <20211026184045.2201-4-Sanket.Goswami@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-10-26T18:57:23Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=7aaad972-32ac-4254-8c4a-d5ce0171aa4d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 13add7ca-1bac-4ee5-f5e4-08d998b27446
x-ms-traffictypediagnostic: BN8PR12MB3011:
x-microsoft-antispam-prvs: <BN8PR12MB3011220B623FABA17AD0DFB49C849@BN8PR12MB3011.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5aQPNBlRFuJT3BxrguUTL533pkPvvVpoK3CHLTxIBFQSdyaPxfcJwQXGdRGYQWLKu/az4YSJyBbsRlPkbJeJgcybR2fkzCNyh+HRq8sJ08OG7I+a2fSiTRO8TShml38bOv1KdWBc0QJ3Qyv27/UtLL1j85126/yXQhRFdwuJg2QjD2CZaO0eCH1LqF11qiT+AJlLwZwDkrKUuL0DdzQ7TF9WLfB0gfLEVfZOCqv45H4iXHIC7sTK9dkaYciX+MWknWkIPTf2I0juKP/NKKztdMXHREWfulTOV9/p4ehq1JRLQlShpb/qLhCme6HoTo8P/mfi0sO6RPGxhMfutRcrX88FfH1LldGT8Py6h9TKh3Q6ZR7jI0MBSqmj3lPRIWfa7SHBIR2xXKE5+9FpIdjEEPI+IMf8ggUb4D6qUe/xVEM+xai0YQPbiL0bOhZ1AAaGRUprURP7Cqo+Eveas2D/NKDQhUOCw3zmrx7dQC8gJvPthertkfG7vKBFYgNaNoeFLf5TbqR89l61EX5ysrfoFeHGg1lMyOZJry++3Tn3IIaNusNiB2LCuCU9aUfwOQuD2QfxdXrxJ2aGxJJsr/+oHjg8KnjfmuYCI6D7UtuWzuTOhCJDy3yd49Yxgmkphx50gUSNNqaZ5NSPoxiwmjk/8bjrnZw+FA+6SdhwhzqDjpLGU062WzA3KYAQH+kb8RbH/ndAoVb9HxU2LrK3gKe0og==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR12MB3508.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(76116006)(38070700005)(122000001)(66446008)(66476007)(83380400001)(55016002)(52536014)(86362001)(186003)(71200400001)(6506007)(26005)(5660300002)(4326008)(66946007)(38100700002)(2906002)(316002)(53546011)(33656002)(8676002)(7696005)(9686003)(8936002)(508600001)(110136005)(66556008)(54906003)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?URhX8QpDqp4qwjwQw2naxN3x51cXqwEofKLknQknr6RVhojVztx/EeOyxXGa?=
 =?us-ascii?Q?YGHdTC3RtDTBmVInbbLje2rBbKntxRJJiDCcfATJQSURrljsJvUiUCKW//Wc?=
 =?us-ascii?Q?eXnXmku9hR18EnXWfWp8RjkDv3imMCqOBVWFDsTngjisSGTbxNx7v60lRlUY?=
 =?us-ascii?Q?Yg2NvDXHaLNB8zdKTzDmSPD31ko54Ryk/jhKYL/7VQSN3qB6bkBml6A0fTXR?=
 =?us-ascii?Q?+WLztRVwQZ7/7pms/seZoIoQNrJoztUMC8+dsZ+MCIE3JU7DuL7vm4lcM+eJ?=
 =?us-ascii?Q?gV2ZBsMOMrw5W5Kt8n2z5J3y8DrOL3g3MxuFCyzQEZVFACxjO1uj6l0de5Hw?=
 =?us-ascii?Q?SgOrE7quZC5ELns0FBL6xZBrvgRyjT2d0fw8VkT86rZRNXL1jBXpzeJKfdot?=
 =?us-ascii?Q?crTIi2DA6OKM6Eb3jWM+p9KWhy78nHoZpQd/R/zdH8X/TEreRMZE9STpQ5kt?=
 =?us-ascii?Q?yZaX1hsaUTkILJaJtQxW+LKUVj0fUhO8A+rUzDGo7p1ttkr6pdQCW2WdBEub?=
 =?us-ascii?Q?KzyZ61PhlgHOFe6XfnmZbRy623Igypxa6DPp+MTXp1Cdm4VeDeimUhecOKWY?=
 =?us-ascii?Q?imz5HP8UPisUcuigYgMhhZaZnbL2+Qq87CCTpGznrvxkSDxclqmVl2/8NPp1?=
 =?us-ascii?Q?PJfpGy+EtLv9mzoNuCDqJ/Zt+5SoxVi5jq3Fk5cpWfA4UJyluaOZEnscMtCW?=
 =?us-ascii?Q?+iPpPg6VhKrDf+DjnWA7RXiO7HZIe3t1xyx9r0+Xdgs9TLpIunv+yVJ8FgGj?=
 =?us-ascii?Q?Xj7JyOnq+KpYyf9nF8VBW8MR7jREVoDd5/pY+f/GdR2lk1yP5rVbob/a8OiU?=
 =?us-ascii?Q?VIuziI4h0h7BhkbNvMRvGKFO2vakaxKUX4XkoffNTLdqfn8n4SiM9uh9MnJa?=
 =?us-ascii?Q?CFc10fRxJduh3fSo806R+JOdPIloCuybYjGXGCumMJqSS/ow0WbmMuRS1J3K?=
 =?us-ascii?Q?TbYohtu1nAFPMPNNJtobLy84ZX3fRGWEzP4qYmIOLhBuhk9dft12WS/Pn/7v?=
 =?us-ascii?Q?sZ7tGAn/6pt6Y1fefNoEnjzvCeXEg1xv+Qhwuw0fTGg3qE8BL3YuxzerZA42?=
 =?us-ascii?Q?IclN/DJBXXdNjkAFBvcrktlfRwNExaqT+8nIgnQBZ1VNu60o3iU0PT3X/rQD?=
 =?us-ascii?Q?YB367aBc42HuvVlf2dtZCNHyIwGYixPZ7128cRYLxIKE1lQeNZuXUoeg4suU?=
 =?us-ascii?Q?KTNJS0SIO9THWOWnRxbAlg8d2/W67mJuskzdhFiaW69BRA+qxGE+/uPAzgm+?=
 =?us-ascii?Q?MSqVru1Ah3q9+OQEkaQ7ZaX5wDjPRMZIJGc4hMPvxxZwdfg/zf0XRxRAfVQQ?=
 =?us-ascii?Q?vSthyRery6LUi1QdA8KVeQAIWkYl877bKRNEDp0shiiBTzA9g0P0A5vXC1xl?=
 =?us-ascii?Q?AxqPH2+OnQDtl+sc3+FgwuFEYcDpQuDkbuD/mw7eptFcjOgy/W6pfkrMOwii?=
 =?us-ascii?Q?SNS2v680+MkXLv105GyI2d62DGBoKStdC11XdW8TMz77rL1SXGCipD8KsVm+?=
 =?us-ascii?Q?PShZSpQ+EVnUXYqYds5Aoi5IObZaNL//IHYw083XZDLi3UO+naMnb5IRvSA7?=
 =?us-ascii?Q?IISKfXLDzc7NvdQeSj2IoGBJqz7DMtYP63a+ZtmJwWNk/e/r31TNxMM81quf?=
 =?us-ascii?Q?7A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3508.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13add7ca-1bac-4ee5-f5e4-08d998b27446
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2021 18:57:26.9825
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JzTy13bN+c3TzOxKhwOJ/QMElA8Jf16iykFCjjv8PEPoTktItOSDugKKuxJgS2jRSawwM7rVGjGuYbihhFFOCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3011
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

[AMD Official Use Only]

+Scott

-----Original Message-----
From: Goswami, Sanket <Sanket.Goswami@amd.com>=20
Sent: Wednesday, October 27, 2021 0:11
To: S-k, Shyam-sundar <Shyam-sundar.S-k@amd.com>; hdegoede@redhat.com; mgro=
ss@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org; Goswami, Sanket <Sanket.Goswami@am=
d.com>
Subject: [PATCH v4 3/3] platform/x86: amd-pmc: Add support for AMD Smart Tr=
ace Buffer

STB (Smart Trace Buffer), is a debug trace buffer which is used to help iso=
late failures by analyzing the last feature that a system was running befor=
e hitting a failure. This nonintrusive way is always running in the backgro=
und and trace is stored into the SoC.

This patch provides mechanism to access the STB buffer using the read and w=
rite routines.

Co-developed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
---
Changes in v4:
- Use kzalloc() for memory allocation.

Changes in v3:
- Address review comments from Mark Gross.

Changes in v2:
- Create amd_pmc_stb_debugfs_fops structure to get STB data.
- Address review comments from Hans.

 drivers/platform/x86/amd-pmc.c | 122 +++++++++++++++++++++++++++++++++
 1 file changed, 122 insertions(+)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.=
c index 50cb65e38d11..e55c48f675e1 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -35,6 +35,12 @@
 #define AMD_PMC_SCRATCH_REG_CZN		0x94
 #define AMD_PMC_SCRATCH_REG_YC		0xD14
=20
+/* STB Registers */
+#define AMD_PMC_STB_INDEX_ADDRESS	0xF8
+#define AMD_PMC_STB_INDEX_DATA		0xFC
+#define AMD_PMC_STB_PMI_0		0x03E30600
+#define AMD_PMC_STB_PREDEF		0xC6000001
+
 /* Base address of SMU for mapping physical address to virtual address */
 #define AMD_PMC_SMU_INDEX_ADDRESS	0xB8
 #define AMD_PMC_SMU_INDEX_DATA		0xBC
@@ -82,6 +88,7 @@
 #define SOC_SUBSYSTEM_IP_MAX	12
 #define DELAY_MIN_US		2000
 #define DELAY_MAX_US		3000
+#define FIFO_SIZE		4096
 enum amd_pmc_def {
 	MSG_TEST =3D 0x01,
 	MSG_OS_HINT_PCO,
@@ -128,8 +135,14 @@ struct amd_pmc_dev {  #endif /* CONFIG_DEBUG_FS */  };
=20
+static bool enable_stb;
+module_param(enable_stb, bool, 0644);
+MODULE_PARM_DESC(enable_stb, "Enable the STB debug mechanism");
+
 static struct amd_pmc_dev pmc;
 static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u=
8 msg, bool ret);
+static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data); static=20
+int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf);
=20
 static inline u32 amd_pmc_reg_read(struct amd_pmc_dev *dev, int reg_offset=
)  { @@ -176,6 +189,53 @@ static int amd_pmc_get_smu_version(struct amd_pmc=
_dev *dev)
 	return 0;
 }
=20
+static int amd_pmc_stb_debugfs_open(struct inode *inode, struct file=20
+*filp) {
+	struct amd_pmc_dev *dev =3D filp->f_inode->i_private;
+	u32 size =3D FIFO_SIZE * sizeof(u32);
+	u32 *buf;
+	int rc;
+
+	buf =3D kzalloc(size, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	rc =3D amd_pmc_read_stb(dev, buf);
+	if (rc)
+		goto out;
+
+	filp->private_data =3D buf;
+
+out:
+	kfree(buf);
+	return rc;
+}
+
+static ssize_t amd_pmc_stb_debugfs_read(struct file *filp, char __user *bu=
f, size_t size,
+					loff_t *pos)
+{
+	if (!filp->private_data)
+		return -EINVAL;
+
+	return simple_read_from_buffer(buf, size, pos, filp->private_data,
+				       FIFO_SIZE * sizeof(u32));
+}
+
+static int amd_pmc_stb_debugfs_release(struct inode *inode, struct file=20
+*filp) {
+	kfree(filp->private_data);
+	filp->private_data =3D NULL;
+
+	return 0;
+}
+
+const struct file_operations amd_pmc_stb_debugfs_fops =3D {
+	.owner =3D THIS_MODULE,
+	.open =3D amd_pmc_stb_debugfs_open,
+	.read =3D amd_pmc_stb_debugfs_read,
+	.release =3D amd_pmc_stb_debugfs_release, };
+
 static int amd_pmc_idlemask_read(struct amd_pmc_dev *pdev, struct device *=
dev,
 				 struct seq_file *s)
 {
@@ -289,6 +349,10 @@ static void amd_pmc_dbgfs_register(struct amd_pmc_dev =
*dev)
 			    &s0ix_stats_fops);
 	debugfs_create_file("amd_pmc_idlemask", 0644, dev->dbgfs_dir, dev,
 			    &amd_pmc_idlemask_fops);
+	/* Enable STB only when the module_param is set */
+	if (enable_stb)
+		debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
+				    &amd_pmc_stb_debugfs_fops);
 }
 #else
 static inline void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev) @@ -488=
,6 +552,9 @@ static int __maybe_unused amd_pmc_suspend(struct device *dev)
 	if (rc)
 		dev_err(pdev->dev, "suspend failed\n");
=20
+	if (enable_stb)
+		amd_pmc_write_stb(pdev, AMD_PMC_STB_PREDEF);
+
 	return rc;
 }
=20
@@ -508,6 +575,10 @@ static int __maybe_unused amd_pmc_resume(struct device=
 *dev)
 	/* Dump the IdleMask to see the blockers */
 	amd_pmc_idlemask_read(pdev, dev, NULL);
=20
+	/* Write data incremented by 1 to distinguish in stb_read */
+	if (enable_stb)
+		amd_pmc_write_stb(pdev, AMD_PMC_STB_PREDEF + 1);
+
 	return 0;
 }
=20
@@ -524,6 +595,57 @@ static const struct pci_device_id pmc_pci_ids[] =3D {
 	{ }
 };
=20
+static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data) {
+	int rc;
+
+	rc =3D pci_write_config_dword(dev->rdev, AMD_PMC_STB_INDEX_ADDRESS, AMD_P=
MC_STB_PMI_0);
+	if (rc) {
+		dev_err(dev->dev, "failed to write addr in stb: 0x%X\n",
+			AMD_PMC_STB_INDEX_ADDRESS);
+		pci_dev_put(dev->rdev);
+		return pcibios_err_to_errno(rc);
+	}
+
+	rc =3D pci_write_config_dword(dev->rdev, AMD_PMC_STB_INDEX_DATA, data);
+	if (rc) {
+		dev_err(dev->dev, "failed to write data in stb: 0x%X\n",
+			AMD_PMC_STB_INDEX_DATA);
+		pci_dev_put(dev->rdev);
+		return pcibios_err_to_errno(rc);
+	}
+
+	return 0;
+}
+
+static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf) {
+	int i, err;
+	u32 value;
+
+	err =3D pci_write_config_dword(dev->rdev, AMD_PMC_STB_INDEX_ADDRESS, AMD_=
PMC_STB_PMI_0);
+	if (err) {
+		dev_err(dev->dev, "error writing addr to stb: 0x%X\n",
+			AMD_PMC_STB_INDEX_ADDRESS);
+		pci_dev_put(dev->rdev);
+		return pcibios_err_to_errno(err);
+	}
+
+	for (i =3D 0; i < FIFO_SIZE; i++) {
+		err =3D pci_read_config_dword(dev->rdev, AMD_PMC_STB_INDEX_DATA, &value)=
;
+		if (err) {
+			dev_err(dev->dev, "error reading data from stb: 0x%X\n",
+				AMD_PMC_STB_INDEX_DATA);
+			pci_dev_put(dev->rdev);
+			return pcibios_err_to_errno(err);
+		}
+
+		*buf++ =3D value;
+	}
+
+	return 0;
+}
+
 static int amd_pmc_probe(struct platform_device *pdev)  {
 	struct amd_pmc_dev *dev =3D &pmc;
--
2.25.1
