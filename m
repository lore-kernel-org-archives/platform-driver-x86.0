Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F55838B146
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Mar 2026 12:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773147200; cv=none; b=kTn8ARwZq2/NEzZ+3SaoAbyFWgNuDrrE5+p/qQBBQRn/7PwIgz+ZA8aD1t8leWhKLRRGpoGHgLVxQsCH6BRPFHi7XLicELuulwBUt8ldMS//4jMcroRQh3kkPOpw2r2W5Fl11xPe6hI9DPA+mWUrqBHdN0CrmMTJjA5ELWX11Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773147200; c=relaxed/simple;
	bh=YGG0XyN/OycsjP01GJP7MYhGX4WbEwgsVlO2s8LY0Y0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s8CqxBFpQQx2EKxLBrD29UXmVXWDWlHiNVCrE2/4e5kWNuUpqCKdU5ZqVC7NP25pVgPuUYtieOS/4UkTq9994P1gXRcBNnPcVqUgemoOu+lIv1ap2/iF9KV9kh1idXstQ/TSP4oXUfd+LUvn1h6+vg7UyqqjeUVcoikM7sLKFSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dxTvsAho; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dxTvsAho"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A9YRWV2581518;
	Tue, 10 Mar 2026 12:53:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=HOb/U+04F+HODnnIMWT1AfSFebJoP
	jA4XiYMVcS+QKM=; b=dxTvsAhowJ9vfHfQiEa0IA4FyDIEk0nX5jCf+sq3o9rx+
	+dvNL7i0B2YPROGL6VFoDVL/D+QHlAH0P2puJVDEjMAeZc3emu1ynSxLkswx8TTM
	Q8lj+fs2Xgbvhdfn9XTd2TaGit28PsEDTwz62f1XCWPS0CSXCyt1vbcAbQj7A78A
	PwOyNiN/DhRXfM2iUXUgSIOFi3S+rVfy94Y+UuBqOIBMZlodMrjQkIwBncNG/By3
	0JpidGOZgkymH5/2vCvu8cs+0Hjurtmv2nDS2kI08RPyUBrRfuCIrrw/f7uTshvm
	zxMixIEEFgWNT1taPsVbx+cj76BWQPtwzKhmAyUDQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4csm9cts26-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Mar 2026 12:53:11 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 62AApUZ1012852;
	Tue, 10 Mar 2026 12:53:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4crafeke9r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Mar 2026 12:53:11 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 62ACrAPa016488;
	Tue, 10 Mar 2026 12:53:10 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4crafeke8w-1;
	Tue, 10 Mar 2026 12:53:10 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: ilpo.jarvinen@linux.intel.com, hansg@kernel.org, carlos.bilbao@kernel.org,
        naveenkrishna.chatradhi@amd.com, platform-driver-x86@vger.kernel.org
Cc: alok.a.tiwarilinux@gmail.com, alok.a.tiwari@oracle.com
Subject: [PATCH] platform/x86/amd/hsmp: Fix typo in error message
Date: Tue, 10 Mar 2026 05:53:05 -0700
Message-ID: <20260310125307.700108-1-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2603100112
X-Proofpoint-ORIG-GUID: tunu_q567H5NWSb2nzexABjaEUs5u7Q9
X-Proofpoint-GUID: tunu_q567H5NWSb2nzexABjaEUs5u7Q9
X-Authority-Analysis: v=2.4 cv=LeYxKzfi c=1 sm=1 tr=0 ts=69b01438 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=o5oIOnhZENCTenyL_yNV:22 a=yPCof4ZbAAAA:8 a=tiaQlv3jnEYTPKq4PEEA:9 cc=ntf
 awl=host:13819
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExMiBTYWx0ZWRfXxgBDgNo2DX8J
 hPLdlDb0/oaTFynKZ8J05SqLzdfyvwqNt7mhHur7RREi49rKUcXRaKkpMInuz+b1yQ16fFGEyoA
 at5TYLv8aaAWvMu5bCTNUsShF9swmbiHfDtYK2vk9AODtot/fjd1RsmXSemnujVbRP5nQx73PMN
 8AW29lM1rFfJ2RVjHhWzGNvllIW07l3W9KtyfcqlGrNEsFJDh3VqYrV4FCk+i8dSIuG026SlPFR
 ghOwQO+vW5/aAfRobIHWnrYMWg0I0eVZ0XJnBYXoei3PR1FFHV3CSjft9mlbG9muyhuRDye3xoU
 cpF52bB0Mf70xi1LRCNVteUU0u816lIBTjaBdkCtSq40YzY0G+BaZ1JVpVrGS2cg9yOhuMxMIP+
 HkBB1ub4glLHDEQh81DqbE7gyWRsZkC5EWmos2Ww3iFyb+bUlWM7OHH+PQah5OoZ18yVlzIx/Zc
 IZzpXy/gTuGmHxgsvOOvRh6H7pZKcTm9RSoDclIU=

Fix a typo in the HSMP error message where "tmeout" should be "timeout".

Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
---
 drivers/platform/x86/amd/hsmp/hsmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 19f82c1d3090..631ffc0978d1 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -117,7 +117,7 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
 	}
 
 	if (unlikely(mbox_status == HSMP_STATUS_NOT_READY)) {
-		dev_err(sock->dev, "Message ID 0x%X failure : SMU tmeout (status = 0x%X)\n",
+		dev_err(sock->dev, "Message ID 0x%X failure : SMU timeout (status = 0x%X)\n",
 			msg->msg_id, mbox_status);
 		return -ETIMEDOUT;
 	} else if (unlikely(mbox_status == HSMP_ERR_INVALID_MSG)) {
-- 
2.50.1

