Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D56D2AE68
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Dec 2025 09:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766569931; cv=none; b=NeAsbwKO4YnZVvl3zPbH3nMNj4twGM0bPLvTRobR3dt3NODL6MGf3SMtRyhrhpJdDxvkvHBT67yOBwE/FePUNTpR0ijGvOxA0NuF0s0sim7gliMYd+TElUALDUunbGdQlLx30SMTvck3wEYkFPC+qjqXfPy6X5DOK8VTKt2FvHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766569931; c=relaxed/simple;
	bh=2Iv/HgCqRQYy62fsci0Nyg3xsvb2pMCwzY/rKfDLA5w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fxl2k3sfFtjXrZkDV66uDqz/lmMAg4GlXLkgEftesNTqnlOp/nVZVC+HUkD8kY0d3FmTBCuP6fIhGtLC9fef4u/irHeXNtlj0i9ahM7ZGy5QPM1D+eCc1JICLewnlHE2ZGiIAUMHzdsRoXmQVeyfObHis5dy/ClFoUib4+5Wwic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ST4cpnHh; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ST4cpnHh"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO81Nw82147886;
	Wed, 24 Dec 2025 09:52:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=4b+StJqzxZzvZH9ln2day/ddhqjvY
	6Td5HPVyiGVbIo=; b=ST4cpnHh8xGgrmy6M5Jq8NJMvWdgpNQ575VzYXdj/zNsa
	iLULYTyXrBEc12c02aI1Hbl4B363X3UmItPJnLOaQSwjHPqZWWc1Yttrqb9NNhxv
	m94c9QcktRtWHBqs83BwxMjdHIGs4qaPX2y8mFqyMpW4EhvIdsTACAHZOHyT8Q0D
	23V4l0Gsm5iaa0uJ1VkjgW4an/1IJB7j0x4SgLU9FkW+7qZaz/B/aOOiVgPwE3Wk
	O2aLAB4xnmdYLDUfcKNq4tSDINNRKfSN66ohqaC//3OdnEn83FcoGF+CmVnNuoH8
	EcnzZm3+EJcgcScocW5PG3I/jeG1nBulDf/f2SlFw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b8ca4032x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Dec 2025 09:52:04 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BO8fCNx039943;
	Wed, 24 Dec 2025 09:52:04 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4b5j899ved-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Dec 2025 09:52:04 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5BO9q3p4040288;
	Wed, 24 Dec 2025 09:52:03 GMT
Received: from ca-dev110.us.oracle.com (ca-dev110.us.oracle.com [10.129.136.45])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4b5j899ve0-1;
	Wed, 24 Dec 2025 09:52:03 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: david.e.box@linux.intel.com, hansg@kernel.org,
        ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org
Cc: alok.a.tiwarilinux@gmail.com, alok.a.tiwari@oracle.com
Subject: [PATCH] platform/x86/intel/pmt/discovery: use valid device pointer in dev_err_probe
Date: Wed, 24 Dec 2025 01:51:09 -0800
Message-ID: <20251224095133.115678-1-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2512240084
X-Authority-Analysis: v=2.4 cv=UKHQ3Sfy c=1 sm=1 tr=0 ts=694bb7c4 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=cjlv63_sTXVYdLjBQ-0A:9
X-Proofpoint-ORIG-GUID: RjapG_B8EzwLohl52CqL7GMzmbITJCuO
X-Proofpoint-GUID: RjapG_B8EzwLohl52CqL7GMzmbITJCuO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA4NCBTYWx0ZWRfXxcwc5z4cFyFS
 6ZvDqdZerNimk937TwwcAdSSgE85aH+WbooBv2QYjwWQof71ftJKqNG/xf+X+V3HYo3G8cl6uXJ
 m/HpDzt77582GwQCQp2ivRqffDsxkKbWmzy+keM9w0YsBIX4BAQfRWPyYcLwFcWBswLDewHqLSd
 7s5yy6sIdRpQoOQdODmwF1aQynYw4GyLP4KwnOvryUyGZ2XLIthwMCv3g0t7NRqCzyyQ2NV+Mvh
 4wFil2alLWFrrWihzdKBrrj20AXigJFHWW260bv5XatiKsnrHRqFcVbI/vQstIbaOI0cXfeijdv
 Py9lYsCG/z4eiw8xNj9FOzNXJPdci5A4/2CPUAv++vfOeozB5TSnSty2vlCcw0eoARaUd2pujQr
 dYXQtjiYbzb/shHhSo9Ke5B0jmmxtB7XzgSdyRwQqR7I9bU58Wzqa1Q04y+ClNzdZBkMLZPFlGR
 9FpWI2XqENdx3NHy3DQ==

The PMT feature probe creates a child device with device_create().
If device creation fail, the code pass priv->dev (which is an ERR_PTR)
to dev_err_probe(), which is not a valid device pointer.

This patch change the dev_err_probe() call to use the parent auxiliary
device (&auxdev->dev) and update the error message to reference the
parent device name. It ensure correct error reporting and avoid
passing an invalid device pointer.

Fixes: d9a078809356 ("platform/x86/intel/pmt: Add PMT Discovery driver")
Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
---
 drivers/platform/x86/intel/pmt/discovery.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/discovery.c b/drivers/platform/x86/intel/pmt/discovery.c
index 32713a194a55..fe93d4938c32 100644
--- a/drivers/platform/x86/intel/pmt/discovery.c
+++ b/drivers/platform/x86/intel/pmt/discovery.c
@@ -546,9 +546,9 @@ static int pmt_features_probe(struct auxiliary_device *auxdev, const struct auxi
 	priv->dev = device_create(&intel_pmt_class, &auxdev->dev, MKDEV(0, 0), priv,
 				  "%s-%s", "features", dev_name(priv->parent));
 	if (IS_ERR(priv->dev))
-		return dev_err_probe(priv->dev, PTR_ERR(priv->dev),
+		return dev_err_probe(&auxdev->dev, PTR_ERR(priv->dev),
 				     "Could not create %s-%s device node\n",
-				     "features", dev_name(priv->dev));
+				     "features", dev_name(priv->parent));
 
 	/* Initialize each feature */
 	for (i = 0; i < ivdev->num_resources; i++) {
-- 
2.50.1

