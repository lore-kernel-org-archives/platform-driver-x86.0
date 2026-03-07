Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A20317A2F6
	for <platform-driver-x86@vger.kernel.org>; Sat,  7 Mar 2026 19:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772910351; cv=none; b=ZnlH20v+8vk7dj6AuzdI66oYT5y6lVOhZhokDJPt+XGcpxVZ4ekefsWccd6AxxSlj0K7VvoQCnptYVMyOceHbCmVxfIV1NQp4lhEJw8OSCcsGR3ZM+3ljHxqNqRs/S1kxeOdozLVFfYaR51KL0ACDaGA6xrYUewWiKlSqXh/se0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772910351; c=relaxed/simple;
	bh=SGYr9e8w0dES9oGyhdUGoBhpMPAJWGSOk26TA/Z6vOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ufUZBE+bLtC7WvsKnfuL8uGYAnHn9OGtGKI1Pz69mAL/+v/xDZwJoWKXGJgMEhTvX2EZJGE96s+HfPrFJzwuNWlMEVN3COpnYBXhf0TjVuhrPmFbNf6xgvabImyp20p+PiOTu25ZPyIKYBGqi6tRV+/+y69VxQbxAGFC7pMgU9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cbyzAqxf; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cbyzAqxf"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 627J3Cx31960653;
	Sat, 7 Mar 2026 19:05:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=R8P5z8pYzgAo0xe82Bu5bfEruUqAa
	qBtvyXPj8JS7G4=; b=cbyzAqxfrZFpCs/gyeaaGc6cWg77tA7xlAnBjr5dOnmOm
	ZibAhHaYg3VkRXATsYllG+99i9ppfvEi2anOW7w25gJAywagVtzDEmx3/N0QIKRZ
	0Pm/co2gjGn0+h7ZYwRQiEV9COL3CP12k4QWxxrp2RZOfushSkmq/ldk91HQK1kz
	rvXBCzqhpEASrmIegn6Jmh56RI8eg0LhJcC43d2sw28zGHXuC3eiwhdBLWVSdowM
	WUtFVXmLpmEV8aqAoihgE4bl4ts0qhvWHh8plyJEpmYnV5hc/M2goxBLxJNtoMPI
	bYTHHqY9FG2LTXV9BxCcFVs68ePMxAd3wfcHWEO/Q==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4crstjg01k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 07 Mar 2026 19:05:36 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 627I09hw022698;
	Sat, 7 Mar 2026 19:05:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4craf78qvg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 07 Mar 2026 19:05:36 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 627J5ZdP027580;
	Sat, 7 Mar 2026 19:05:35 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4craf78qv8-1;
	Sat, 07 Mar 2026 19:05:35 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: lkundrak@v3.sk, andriy.shevchenko@linux.intel.com, hansg@kernel.org,
        ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org
Cc: alok.a.tiwarilinux@gmail.com, alok.a.tiwari@oracle.com
Subject: [PATCH] platform/olpc: olpc-xo175-ec: Fix overflow error message to print inlen
Date: Sat,  7 Mar 2026 11:05:31 -0800
Message-ID: <20260307190533.3025563-1-alok.a.tiwari@oracle.com>
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
 definitions=2026-03-07_06,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2603070181
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDE4MCBTYWx0ZWRfX+AKbCGGVPO+R
 dFVixRALtEqNUwQWMI+w3HOgC1xTmzOcolfm0PeBo6WnH8as4eg2US5Nz+Lgyn1W1xxENtl/3ss
 Kr7qfYfpqVMAja1qnGHZEyv5x/LpghywkUH/9F84BQioWULqzs1NcYeXcAi+czk/5KSH8PBh8EY
 hg0aPArpvNPOHJpmPk39/yys1jt0Vid3XL3ejbAEgs5GMdqHlb4TnDeJlcp+ZV+oo0a/UKsOnN/
 3790nkGi++74pXyiaeyWyq5UGUF+UewF2VrwUjfbFaUSYBFhQMUsLLIHK7KW3DaKbHBSis5mFD0
 IAV366Kjj+3ZW95gopAuvJURGriC1sTN5g0c4iwudK+EapDfJ5CZImUttcie1ytHNR5QhDOmJxP
 BXlbb1WuaSnB4AjPdZ3Q5KvGCKJBRR9U/jTaAJgA+h4bQkVdFvK2M+0VqJIKdXF7/unFldjmS71
 hEfrjgH8B+Fr5okPzYA==
X-Authority-Analysis: v=2.4 cv=A+th/qWG c=1 sm=1 tr=0 ts=69ac7700 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x0eKOSpe3m1H3M0S9YoZ:22 a=yPCof4ZbAAAA:8 a=-AHBKWzNP_YcbjkLPSoA:9
X-Proofpoint-ORIG-GUID: NNRTZqNOgnV66-EYtlGVSF2j5luND26A
X-Proofpoint-GUID: NNRTZqNOgnV66-EYtlGVSF2j5luND26A

The command length check validates inlen (> 5), but the error message
incorrectly printed resp_len. Print inlen so the log reflects the
actual command length.

Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
---
 drivers/platform/olpc/olpc-xo175-ec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/olpc/olpc-xo175-ec.c b/drivers/platform/olpc/olpc-xo175-ec.c
index fa7b3bda688a..bee271a4fda1 100644
--- a/drivers/platform/olpc/olpc-xo175-ec.c
+++ b/drivers/platform/olpc/olpc-xo175-ec.c
@@ -482,7 +482,7 @@ static int olpc_xo175_ec_cmd(u8 cmd, u8 *inbuf, size_t inlen, u8 *resp,
 	dev_dbg(dev, "CMD %x, %zd bytes expected\n", cmd, resp_len);
 
 	if (inlen > 5) {
-		dev_err(dev, "command len %zd too big!\n", resp_len);
+		dev_err(dev, "command len %zd too big!\n", inlen);
 		return -EOVERFLOW;
 	}
 
-- 
2.50.1

