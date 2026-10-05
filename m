Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010018.outbound.protection.outlook.com [40.93.198.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3D921A447
	for <platform-driver-x86@vger.kernel.org>; Mon,  5 Oct 2026 07:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791185314; cv=fail; b=Mpqz/I1Bcaj0pHK25wloj0zMQOoZYbPFlI9HxvO0o319rXBsCPSyoY/Xhmv5PX+wNnaK7f2jMJKP5NSVLDl49r6vzpCC+xINwe5nq89CVPPO+8Gs1M1YXsyU50CYXXiy230MXd9ovoeNwYsqPkU/r9N/b+1NGIilFGkTcjtLu18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791185314; c=relaxed/simple;
	bh=FNjM+vOZp6OAinW9RXh0N4unYhhyUj9m6Pz/2zt1jBM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tWS6GZesoRmv5iBqNQu4imbj4WOfieHOKsP6iZ25sAXyHso4wR6A7ZOpQBo7DVDOopqby7XzTOyqRAk8CtldCoNf6wyfbFaAu6mnA9aIAYF3To8qzEeM1d+WiIG9y+sq/gNk3MMF/I+dZgZOLxoRfLtHf3i4NHFRwqeQYSi4zuk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QfYWlrCL; arc=fail smtp.client-ip=40.93.198.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QfYWlrCL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u2xCb4ypYxwcn7p05iROC2LQQvSfujwzKUja8C/VF6qKFG2zSEWyaNxG1QdUn9XuZoWu2mz4URMjLJFt+xBcxLEafdCufySIBiHGaIzC4IcUIw8ivh3MDTsaeho1kqN1GvXLl0LjbWYTY1b6TuyeL54yPFcjhtRnHwhZW56BY84GmI7uHTexzrqzNShI4fMNcJLBylyq6hKL7mkRtziOq4gDha1w4PUnknGkmx6hq1l7X1q+L59JmH1yRVDjNZ+q8Gx1zbtuH7WbscQbJdibviWBljnMdPBn5otsoHEejU9h6wues2Mq8YEdOrrRVH3HxiVklitVYzT+zktsu0yfXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0/ZxZjC6sSXWNepxXmEaNZIhinZwluA8Bk3F0Qqpn8U=;
 b=MR4uGiIB5WsbH6BFM6RMBUFPBpn9hRqMQGad3maV1TC7oCztEUXo4bjQxFuI1J0/UGnvlus48MhdG8/MF09Th8wddwGl4DKQD9nNo9s9YGWDBo3QUZ/7OR/z1jxGhXk1v+/r7DeLZuAIWRk98Usfe0luVth7y0d0FmP6NZcEpRzR4jtGDr3WXyjz2y7VywF4fEYephOY6PET4Dn7bq1GnM4Mej/WNhxtU/YMx6V2NPCK5+MbNpTraX9cq1Is0DXiMBNr07sJLxzLwmu5pCx2s00SAseGrFNuNSTeTwONvn37qZyKB02c0xo4XX/1q4BqaoK5CeT09aI60istKSAnHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/ZxZjC6sSXWNepxXmEaNZIhinZwluA8Bk3F0Qqpn8U=;
 b=QfYWlrCLDrPQye33iKVzAJgGN6ZsTT0Qc3gudTSOX3Vuhxc09Ckz/KZ94h0RTfV7Mj1/L0tqNriEa3NiXDxpOFSDNrlSq5zplafp/zatA7Sa4FDFCP8fzqPyJRObsQxflYXXDlU6NBerGV/sUJDrmqUtbK8Za02kjUd81fJEZzs=
Received: from SJ0PR13CA0026.namprd13.prod.outlook.com (2603:10b6:a03:2c0::31)
 by SA5PPFF3CB57EDE.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8eb) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 07:28:29 +0000
Received: from SJ1PEPF00001CDC.namprd05.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::5d) by SJ0PR13CA0026.outlook.office365.com
 (2603:10b6:a03:2c0::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.17 via Frontend Transport; Mon, 5
 Oct 2026 07:28:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CDC.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 5 Oct 2026 07:28:28 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 5 Oct
 2026 02:28:25 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3] platform/x86/amd/pmf: Fix ACPI buffer validation in APTS path
Date: Mon, 5 Oct 2026 12:58:11 +0530
Message-ID: <20261005072811.1378555-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDC:EE_|SA5PPFF3CB57EDE:EE_
X-MS-Office365-Filtering-Correlation-Id: 37f277c0-e9b3-4308-696e-08df22b24070
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|11063799006|56012099006|10067099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	URCeVvACXi9TAtzcRu3ubC7e/r9YOnoNkKpVo2SstFuFBDBQgy6c1u5CoRlQIcLSCWyYAA5E73XhfLydf+9runglxKMcChClnF32Vx1XiyBJf9P2bJ5oJ2XW2I0r2ZcdO18kB5WLsKQCgQOtXDmzwprYh/MLu9KHBJ+CCSguaEiY/rQTriR6Qi9tGfEW5Pkoo3jrfw/Ppp96MeS5hPVU+i9gNEyr7MBRuRO24xZtCsRnFvq3tr39iff1xS4Mv7QjvaC6/8ks1W70IwoE4cPhKZaXUVdG8BmNHTifKn+wgyBKxNFNpBomR1pKmhp5nOuefw1Pfjm9iy/9kt7eZxrPpHvXyeTbehEbWSKcftO7rKvf3lvrkYLjgrSelJcmncb8gGh1onul6Z0Kw5PPOcxU0S0Ls1N+FwOFSfekZ5DruBUOy62v77eG3M9wlPo0znYIisZf/77Id19uNjgAyiCF4RR9WTtSx3tNqm+VGn4k0TcKI3qbX8DTGhTLWENOU6Cf7pv3MwjC1OlbGNo4y8Ak64qze8lXuB4ZvMoR+EJRzL01AzREL/oOq1ii3RH+h6cyoCQyZNKF4/YOrUDb9ODb8VAQXebZCMp3dsoBvI+Hxb9XNMJyMb1mhiiU8wt7OO3tNcBWNzUl8MG6eKAfUGZ9MRapqZE5we6FkcOEzkQ9oO+Zfb8JLhUmjz7bKbKRammkxF6eDjcMIsNaj5wxSloNYQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(11063799006)(56012099006)(10067099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	T3SzMDgPUixzefLmIDenilVdndaNnYJ7oKE2/b7R9iKFl0LjLRZ44ZHxxaporifWQNhAP5G4KXieorkk+g+hgc0L/UKWmSL+x8amYTIpYr6ktuTMqfeu0gpnpifLOXID40z/+tHlc/4XExS3nbpuQ2ePeUphwv2agiDft1dK7CgsSVd37mD55Yoo0aGlpz1i0DPJomNd4xBE1wwmVjYdL1Xpt0MxmlV+YT7O/Jp67XnEjMZNRnhHtixRV+gu3VSXFHhvhJJzOaZ/l187QJLkr+UQmVU6h8NNPxsreYD0ml3p6Vmug7XRb6wreorPRg5rv0rNDsLbOMlk3bZ/dqVgAS9ithC5tKsZCNkNlJM2r4hduhBZ9IAKw36eM7JrK8YNEOvKotfNk4ycMMPnqrOHrJmoytm9AWADPRfetHbYFnF6Ensu2W7UfNtHiXWre14k
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 07:28:28.9876
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37f277c0-e9b3-4308-696e-08df22b24070
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFF3CB57EDE

apts_if_call_store_buffer() reads a u16 size from info->buffer.pointer
without checking it is non-NULL and at least 2 bytes long, so a short or
NULL firmware buffer can cause an out-of-bounds read.

Add a common helper, amd_pmf_if_verify_buffer(), that validates the
buffer (type, NULL or short pointer, header and output size) and returns
the size on success. Call it from both apts_if_call_store_buffer() and
apmf_if_call_store_buffer().

Fixes: 3eecb434d7f2 ("platform/x86/amd/pmf: Add support to get sps default APTS index values")
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v3:
 - Move full buffer validation (type, NULL or short pointer, header and
   output size checks) into verify buffer helper.

v2:
 - Add a helper function for NULL pointer and buffer validation. Reuse it
   in apmf_if_call_store_buffer() and apts_if_call_store_buffer().

 drivers/platform/x86/amd/pmf/acpi.c | 70 +++++++++++++----------------
 1 file changed, 30 insertions(+), 40 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index 3d94b03cf794..59173bcc3750 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -50,47 +50,54 @@ static union acpi_object *apmf_if_call(struct amd_pmf_dev *pdev, int fn, struct
 	return buffer.pointer;
 }
 
-static int apmf_if_call_store_buffer(struct amd_pmf_dev *pdev, int fn, void *dest, size_t out_sz)
+static int amd_pmf_if_verify_buffer(struct amd_pmf_dev *pdev,
+				    union acpi_object *info, size_t out_sz)
 {
-	union acpi_object *info;
 	size_t size;
-	int err = 0;
-
-	info = apmf_if_call(pdev, fn, NULL);
-	if (!info)
-		return -EIO;
 
 	if (info->type != ACPI_TYPE_BUFFER) {
 		dev_err(pdev->dev, "object is not a buffer\n");
-		err = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
-	if (info->buffer.length < 2) {
-		dev_err(pdev->dev, "buffer too small\n");
-		err = -EINVAL;
-		goto out;
+	if (!info->buffer.pointer || info->buffer.length < 2) {
+		dev_err(pdev->dev, "buffer pointer is NULL or too small\n");
+		return -EINVAL;
 	}
 
 	size = *(u16 *)info->buffer.pointer;
 	if (info->buffer.length < size) {
-		dev_err(pdev->dev, "buffer smaller then headersize %u < %zu\n",
+		dev_err(pdev->dev, "buffer smaller than headersize %u < %zu\n",
 			info->buffer.length, size);
-		err = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	if (size < out_sz) {
 		dev_err(pdev->dev, "buffer too small %zu\n", size);
-		err = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
+	return (int)size;
+}
+
+static int apmf_if_call_store_buffer(struct amd_pmf_dev *pdev, int fn, void *dest, size_t out_sz)
+{
+	union acpi_object *info;
+	int size;
+
+	info = apmf_if_call(pdev, fn, NULL);
+	if (!info)
+		return -EIO;
+
+	size = amd_pmf_if_verify_buffer(pdev, info, out_sz);
+	if (size < 0)
+		goto out;
+
 	memcpy(dest, info->buffer.pointer, out_sz);
 
 out:
 	kfree(info);
-	return err;
+	return size < 0 ? size : 0;
 }
 
 static union acpi_object *apts_if_call(struct amd_pmf_dev *pdev, u32 state_index)
@@ -125,37 +132,20 @@ static int apts_if_call_store_buffer(struct amd_pmf_dev *pdev,
 				     u32 index, void *data, size_t out_sz)
 {
 	union acpi_object *info;
-	size_t size;
-	int err = 0;
+	int size;
 
 	info = apts_if_call(pdev, index);
 	if (!info)
 		return -EIO;
 
-	if (info->type != ACPI_TYPE_BUFFER) {
-		dev_err(pdev->dev, "object is not a buffer\n");
-		err = -EINVAL;
-		goto out;
-	}
-
-	size = *(u16 *)info->buffer.pointer;
-	if (info->buffer.length < size) {
-		dev_err(pdev->dev, "buffer smaller than header size %u < %zu\n",
-			info->buffer.length, size);
-		err = -EINVAL;
-		goto out;
-	}
-
-	if (size < out_sz) {
-		dev_err(pdev->dev, "buffer too small %zu\n", size);
-		err = -EINVAL;
+	size = amd_pmf_if_verify_buffer(pdev, info, out_sz);
+	if (size < 0)
 		goto out;
-	}
 
 	memcpy(data, info->buffer.pointer, out_sz);
 out:
 	kfree(info);
-	return err;
+	return size < 0 ? size : 0;
 }
 
 int is_apmf_func_supported(struct amd_pmf_dev *pdev, unsigned long index)
-- 
2.34.1

