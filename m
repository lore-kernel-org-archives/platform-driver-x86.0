Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C189A22DA1C
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Jun 2025 06:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750313140; cv=none; b=EQ9wOdX9Q4FhpQZjvKcSI/8EXG2s2pLI1Q8Rye3tLm4LF3O6x+rW+Y6hmcPhmj6xvYBaau8yT6cqbpoolPAMGVcEJryEfQ/Vj0Nf5efD08WXnseSYCEwR6FdOGojfG6lTxaJtzdK887gw0Q7H8pvs+sxV0PVfVz9EoLrddNgp0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750313140; c=relaxed/simple;
	bh=CgO+21JAcJs2lN+LWGDD6mCDSCrfcT2HDPL5Ghp6NtU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WyH3vd6c9aolQp+danpis9vT7MnCRzkHrfbVmL9RHP3gW37sRU3h9huWkV+7vx6zZ5ZSMP3cUxmNmVCBikWh4nwepLsCj+19ljIOCBGrah0DlMPTe6vLxO2JreUUe0rtuuvTmcRu1/zp04WG4LdhmiGaStZS2vRa6SjBzXpdjR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZJm03jH1; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZJm03jH1"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55J0fwLL017517;
	Thu, 19 Jun 2025 06:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=g5nEbjQPNDrqji95JUFoO5+vPpPrk
	2PEISLfVmZqBLk=; b=ZJm03jH15z4/lTMg+ACQLqK7on6u6T5rUA6fsFlA0iRfv
	mQ/Rnsyvk4JuETx06mHn5KBwtSFxTUnsEdUVOw7AYAWZYJzi5UaZXzbOK+IMFuJm
	heVYgwTW4lU90ko130vtrVAVqI1BRLR0q5TB5cZBFHCEl+KNeUd7ti7x8zSIXbNi
	WE247dBMOIpONTiiywX3sBGPG61FXnkkrcNSooAy47tw6SqTNc7z4gte2o3oRLjy
	lIwhSYwyDprawG8nUfef7JtVkL9PYIrxKuPYstx+K1HJtJPpZWMpHmj4/w7CSNgd
	bKeo010ELp1O4U/O1wsi+qo+kB2F0drOgYZb7Iu1g==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 479q8r89f7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 06:05:33 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55J4Aha7032042;
	Thu, 19 Jun 2025 06:05:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yhbh8pj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 06:05:32 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55J65Vvk007833;
	Thu, 19 Jun 2025 06:05:31 GMT
Received: from ca-dev110.us.oracle.com (ca-dev110.us.oracle.com [10.129.136.45])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 478yhbh8p8-1;
	Thu, 19 Jun 2025 06:05:31 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, vadimp@nvidia.com,
        shravankr@nvidia.com, davthompson@nvidia.com
Cc: alok.a.tiwari@oracle.com, platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/mellanox: mlxbf-pmc: Fix duplicate event ID for CACHE_DATA1
Date: Wed, 18 Jun 2025 23:05:00 -0700
Message-ID: <20250619060502.3594350-1-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_02,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506190049
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDA0OSBTYWx0ZWRfX08bpASTxvRHV e2TpgeZAQDYcwDmwKxsOrScyZDs3knAbfDdg1PBCXQoGpSWZrXtKKqmK5IVUFo1cEJb2x4ulh0i 3Op15jVicR8ae4kn2ApPHFLrK3LUC6twnf66yA+AWHpyG0YLKkrCrzgrYurqLwQoTzzkurjbecX
 Qhv5kMQIniJMkiqJNYGh9kzBsOaCLD6XJuR43i8n8UBpVweK8AXcDlah6HZ5L153jqyYXKYKjAZ 7EH744rzMw/CJBaD8tg3LTxJakoZiS0z7bXOLxwaRUqIyF1sG8jEPPmiF0VLaLE9T1V16hT46hv fiE0zL2GhIT0HzJZMWFDzBap/PoLa6q0SmlwGy4xjRVRGIPToxiRGtk89uO8L5bsa/NLg3RwNby
 bm7ThU7sRf43DA5I/b2Avlrxq7mQjwyQFX3KPJYKqBUbjMTYbHKVzr9lH5GkTM+BgLvJlDIa
X-Proofpoint-GUID: fxe6WyqFBXhmvz7XGRHl9lp4Tbc5TUFX
X-Proofpoint-ORIG-GUID: fxe6WyqFBXhmvz7XGRHl9lp4Tbc5TUFX
X-Authority-Analysis: v=2.4 cv=dvLbC0g4 c=1 sm=1 tr=0 ts=6853a8ad b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=gnLfM4LeHQ2A_Um21RYA:9

same ID (103) was assigned to both GDC_BANK0_G_RSE_PIPE_CACHE_DATA0
and GDC_BANK0_G_RSE_PIPE_CACHE_DATA1. This could lead to incorrect
event mapping.
Updated the ID to 104 to ensure uniqueness.

Fixes: 423c3361855c ("platform/mellanox: mlxbf-pmc: Add support for BlueField-3")
Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
---
 drivers/platform/mellanox/mlxbf-pmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/mellanox/mlxbf-pmc.c b/drivers/platform/mellanox/mlxbf-pmc.c
index 900069eb186eb..a1c529f1ff1a4 100644
--- a/drivers/platform/mellanox/mlxbf-pmc.c
+++ b/drivers/platform/mellanox/mlxbf-pmc.c
@@ -715,7 +715,7 @@ static const struct mlxbf_pmc_events mlxbf_pmc_llt_events[] = {
 	{101, "GDC_BANK0_HIT_DCL_PARTIAL"},
 	{102, "GDC_BANK0_EVICT_DCL"},
 	{103, "GDC_BANK0_G_RSE_PIPE_CACHE_DATA0"},
-	{103, "GDC_BANK0_G_RSE_PIPE_CACHE_DATA1"},
+	{104, "GDC_BANK0_G_RSE_PIPE_CACHE_DATA1"},
 	{105, "GDC_BANK0_ARB_STRB"},
 	{106, "GDC_BANK0_ARB_WAIT"},
 	{107, "GDC_BANK0_GGA_STRB"},
-- 
2.46.0

