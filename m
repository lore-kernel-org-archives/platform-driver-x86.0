Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2063.outbound.protection.outlook.com [40.107.220.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63C515B10A
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 12:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712751497; cv=fail; b=CIP3w6aO7bYSVRy0YiuIXf7NadjP4jVNYSxr9DwGrEu8zdu5gzHHOb57U3IuTrXpaA4AqOXbc9Ux6Cb2M422DtIFkVKyhtmtnjJMJBOeKm6FdU3rhcZEZ+ThQ2hwmHSacd4YYdD6OUBwpBjgAmL23NoZtJqlvhrPTq/6ViH1piQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712751497; c=relaxed/simple;
	bh=KtWxdqkDi+2NeTC1xdZ87r7MslWLxK7nfzNGEeyHBAs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=n2K3l2IyATO+epaxyTPXNWFgfoVKt6DDPBEcoHJiYX+T6SisyME2zlNx7SuSnocCj9XbkiLTDkLjq2+di/u9rvI9fBdJJXNLJDxI+pSscNi/EsVxQ6ZwFIZWcQ2ix9qmd0OMd7VutClPmsmtVO0i/eqRSPC+fedzqvBTf0wHJOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=lnH/KuMi; arc=fail smtp.client-ip=40.107.220.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="lnH/KuMi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hsm8SmZNCdNRNn4I0vi/JBeZ41xZsKzTSScGZFudRAZsbGbuAuzTnnBIlsB8PZF/9cBJmjkI/Z5kg/3778nuztBA5yqs4tbeXHoaVL9eHEiHOcXFJZ5shOYbLWGvGQqu51jBgkg0zTM6qMPkhRBkag3SVkXPjf8qR9494FqVNkY7YpFOHyqrQMi0km86oBwb/Kyh5oetrHEKDshj06b/rgmC86r1zQTsLbP/4P/yNjsirApKw9z49kjxC3g/fQZGs4fLwT/DU3Y/Vp3a3DoUhPq33jeWWWjiS6cJXNZs6j2l3wJz0HVc28XnWRI0A9JBkVfDTwshg60bfz+Sa+wOIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pqSISJ8+sHVrVAd5cckOLcFEshEFODNPnG0wa51R9vY=;
 b=TGJWTF+LQMVgpYp1WRsjZJ8UH+z90RUEkt/7vIYb4xBg838wOl3obj3JlklbyuxDk4qFKdd8f55E5w0FATA68YMn5CgRj1j49Cy5jAk7YoTxKiPUFBbb+e4TIsruGOmPnBTk81wmww047nK0AYwbyiGyqVLGd+0sjZge437zMVkotWY74UCl+h1+D3iLjFyK/PTxhGMDiosnTE6sEc9313RfV4PxLM+f0ZDdQe+KH6xlcQhfRvMOlR36MV7vNgR99age85EHlCqLyzh4Tuf0pQ6ybx6YZrMWdOVglKiVt91nJVnFDZxa3zmJ1FL9EjWeLvN8yfcYB6vrRTppTu2gpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pqSISJ8+sHVrVAd5cckOLcFEshEFODNPnG0wa51R9vY=;
 b=lnH/KuMiFfxvx4wC/bIB0qL0ezaWoOsfG5AHc8gVQMRAOrCfwMGcouuJGmiftkeiS+gz8csjQMb4qay6u11roQYZM9gSPxi8rG3IbSrDsquXGbNffsZdRPfLipv4m+1hi2DIaGpdTgNCVGBVhFd9UyVUscDMvBk/sUL+aBolIvc=
Received: from MN2PR16CA0033.namprd16.prod.outlook.com (2603:10b6:208:134::46)
 by SA0PR12MB7073.namprd12.prod.outlook.com (2603:10b6:806:2d5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 10 Apr
 2024 12:18:09 +0000
Received: from BL02EPF00021F6A.namprd02.prod.outlook.com
 (2603:10b6:208:134:cafe::d0) by MN2PR16CA0033.outlook.office365.com
 (2603:10b6:208:134::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.19 via Frontend
 Transport; Wed, 10 Apr 2024 12:18:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00021F6A.mail.protection.outlook.com (10.167.249.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Wed, 10 Apr 2024 12:18:09 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 10 Apr
 2024 07:18:07 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [PATCH] platform/x86/amd/hsmp: Remove devm_* call for sysfs and use dev_groups
Date: Wed, 10 Apr 2024 12:17:46 +0000
Message-ID: <20240410121746.1955500-1-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6A:EE_|SA0PR12MB7073:EE_
X-MS-Office365-Filtering-Correlation-Id: 0991b982-04b5-4386-dce4-08dc595848fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	z2apj6zjDyxyoX7FrMWvFXPVh6qK1ZnkcLzylh9euVjMc0g+vmfW4emUqw3VeGtuemMUzWhuyjTXKu6VhPBS97245ZoWTC+A4DdmbyMdnynA1qSlBMZc0kPPz22j0DteMmgmdcwR0dWz0RBYPeqkTvJf9+wzU/1gM5A2onyFs0OQHNMAraEv5h05/vOYVGZH57bCj0kVGsNY973Dh7Ocz1mVSXmxuAX2tBBoOySLXHItWz6AXYGc4IwUaSX9mg7Tms9eEFxSrf9i9cxt2t1uPCAh6UlYmeD3yS4AXKVBS0agHSa3Om3hbatlEj3CUrywnrHa5ptcop5KzDQTrsOcbCGHh9YbZ5GtanWJprG2jk34fF0rOga24JkYBNQzlVs8VjSNwFYDRq/uMQ1iKM5nsPNFB+Gol/pG8fn9MbH9j1O85s9BQz72Ny6N6beTsg+nIYmHbaDZb+nfe5Du82jMQ/3J1bYiJLFxeeO6ol8RtcAUZ0mOaw4gcirK8tYl5NJ6ssBJR8na2PVWebXZPWIdzGLtP3DiworfkovEc6F2bKYewAulzwsnrgUuAVlh9Py4SskSPMwZJ0qGMmwEuj7Et/sk/UNMe1LFl9x0bnCXfB6fv4o7vjvug/BxzuxJNI+BdtFXWXHqS7jkaP3Fbpy+g4gu+pyDbFvVtScBbJrDU4ohAAHfwGJPis6y8m4Kj+tWtj8CTvvG5BtDj/3XXclwqmGyJDARuvmIeFkglp6VLU0SNzLv640/UpRXg1aq9B9V
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(376005)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 12:18:09.5824
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0991b982-04b5-4386-dce4-08dc595848fc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7073

Instead of manually calling devm_device_add_groups(), use
dev_groups.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
This is based on the suggestions from Hans de Goede when Greg
Kroah-Hartman had suggested to switch to use device_add_groups().

 drivers/platform/x86/amd/hsmp.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
index 1927be901108..d6b43d8e798b 100644
--- a/drivers/platform/x86/amd/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp.c
@@ -693,15 +693,29 @@ static int hsmp_create_non_acpi_sysfs_if(struct device *dev)
 		hsmp_create_attr_list(attr_grp, dev, i);
 	}
 
-	return devm_device_add_groups(dev, hsmp_attr_grps);
+	dev->driver->dev_groups = hsmp_attr_grps;
+
+	return 0;
 }
 
+/* Number of sysfs groups to be created in case of ACPI probing */
+#define NUM_HSMP_SYSFS_GRPS	1
+
 static int hsmp_create_acpi_sysfs_if(struct device *dev)
 {
+	const struct attribute_group **hsmp_attr_grps;
 	struct attribute_group *attr_grp;
 	u16 sock_ind;
 	int ret;
 
+	/* Null terminated list of attribute groups */
+	hsmp_attr_grps = devm_kcalloc(dev, NUM_HSMP_SYSFS_GRPS + 1,
+				      sizeof(*hsmp_attr_grps),
+				      GFP_KERNEL);
+
+	if (!hsmp_attr_grps)
+		return -ENOMEM;
+
 	attr_grp = devm_kzalloc(dev, sizeof(struct attribute_group), GFP_KERNEL);
 	if (!attr_grp)
 		return -ENOMEM;
@@ -716,7 +730,12 @@ static int hsmp_create_acpi_sysfs_if(struct device *dev)
 	if (ret)
 		return ret;
 
-	return devm_device_add_group(dev, attr_grp);
+	hsmp_attr_grps[0] = attr_grp;
+	hsmp_attr_grps[1] = NULL;
+
+	dev->driver->dev_groups	= hsmp_attr_grps;
+
+	return 0;
 }
 
 static int hsmp_cache_proto_ver(u16 sock_ind)
-- 
2.25.1

