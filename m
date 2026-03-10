Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787703AF64A
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Mar 2026 13:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773147732; cv=none; b=ILGKNblCi1Pgb9SNoCdl4WojaFRSk3U1Ao4pH9YKBwtJrTMLFbO3oRivZL1KcRml8Qu4/+hYTbkb6hvHMKOlgikKr+BaMeaIw7kyzP1MTQDLqay3lorw9TAvTBnL45c/tlpQ9TI9pn98wi2HFRYuPwZVqUoWlI4wGYCRjhHHW2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773147732; c=relaxed/simple;
	bh=/y5thg8UiIv9ZmCHIlIT3H1Ui50S7JOigIetoqtdXuo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OWKSBfOeUkLepVcsKpjw425fzI1djujaLeFgfLf+Pt2gM6tXfIIeEP4p25nu9sz5FqQTkOaNAwc+EkVRdjCmw29l9yYC8/gw12E6uW7UGLUA6/ZY5D7L1xA/p7QiOsDfRkg4uDjfziILkI2MEXOoss2stol350W8jTzBKRCkCcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=oR79hMaz; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="oR79hMaz"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A9K9Rk2347887;
	Tue, 10 Mar 2026 13:01:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=wg6rHOvoz1ps/3TYpd348BaopbgDT
	S9KI70t0nsWTio=; b=oR79hMazzso2bPdSZ3H67REveKuRGgLpBPNa9yADoNRCy
	0s4G4abcJH+9BkW1cgA73Ak2neTCUwAh5hNFgC7k/tpCn7f8z70QSluRr5hT8c4u
	7v1WHj06ANaT1d25KyobgjT6yg1/ySgv8xroOeFASvX7EWeX9fIeyFFyO41MLjT+
	i6WLkuLK0bAU13QH8SWBiam1VqCIfvFDUBboZ/f729Za5IszE4kwoYXnHbKdzLjO
	+pMf3sifhOdmly+XVAVkNPl8e7oTLAifknYRmnjbGl0JV6++fgJH85rw8D85YonJ
	vFBosAlbuVjxdiSSKO3KTUumTq6daQPgu9OHz1Usw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4csmmaare9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Mar 2026 13:01:43 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 62AC7JWk020307;
	Tue, 10 Mar 2026 13:01:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4crafe2uh3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Mar 2026 13:01:42 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 62AD1ftN015592;
	Tue, 10 Mar 2026 13:01:41 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4crafe2uf0-1;
	Tue, 10 Mar 2026 13:01:41 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: lkundrak@v3.sk, rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com,
        hansg@kernel.org, carlos.bilbao@kernel.org,
        naveenkrishna.chatradhi@amd.com, platform-driver-x86@vger.kernel.org
Cc: alok.a.tiwarilinux@gmail.com, alok.a.tiwari@oracle.com
Subject: [PATCH v2] platform/olpc: olpc-xo175-ec: Fix overflow error message to print inlen
Date: Tue, 10 Mar 2026 06:01:35 -0700
Message-ID: <20260310130138.700687-1-alok.a.tiwari@oracle.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2603100113
X-Proofpoint-GUID: _ZQNNGLg6t2a8NVFK8TXQ1ugATZL4Wyl
X-Proofpoint-ORIG-GUID: _ZQNNGLg6t2a8NVFK8TXQ1ugATZL4Wyl
X-Authority-Analysis: v=2.4 cv=U5efzOru c=1 sm=1 tr=0 ts=69b01637 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=EIcjfB9IiI4px24ztqRk:22 a=yPCof4ZbAAAA:8 a=JfrnYn6hAAAA:8
 a=xBM_Zisb1Hnybyiebp4A:9 a=1CNFftbPRP8L7MoqJWF3:22 cc=ntf awl=host:12272
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExNCBTYWx0ZWRfX6Nb/4+UPSrNH
 X7agd7D8nEZVr4VHes46XbM5FI5XlnHa+xm1KgssA8hAgGEgITD4wjJoxjFMDdssSHwz4ZFyCX+
 pDJ7Be1HuRWup2VtvbPrqsFaw5ZoVd6qYeyLeyOjEUVYQSetc6u1uRmqqPlrI9fC7dSFNcz1RSj
 Rahhf34gFw76SrhbG7hzd0Y+MzmIFbX1hZFvbpT7vdFSq2fNaBfcd0nz8IibpL+dS43jaWmvdtf
 Zw46IZVx3shtVGT2n5yvL5al20tJ7SQX5O6k81O2F0l/JIbTqRdt+oXYTo4uFce64L1Cq4Kmmdu
 hli80oUaHs67Wg3uxc7lfIxfrSsTPZetqRVE/mp05l6NTY1ympzccuDNHobUP2g12o1VONwC9oN
 BWbxNPOLso8LvHgOz50+vXSLtXD8dko4eNcEbNYKstMp6W42FDBBd5UpJ/9QADFHuo6os8HLdUE
 XwP5BlbgffW5h9rmVgd4A1NzNUIRs1ik4jwpaAZg=

The command length check validates inlen (> 5), but the error message
incorrectly printed resp_len. Print inlen so the log reflects the
actual command length.

Fixes: 0c3d931b3ab9e ("Platform: OLPC: Add XO-1.75 EC driver")
Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
Acked-by: Lubomir Rintel <lkundrak@v3.sk>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
---
v1 -> v2
added  Fixes tag and Acked-by, Reviewed-by
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

