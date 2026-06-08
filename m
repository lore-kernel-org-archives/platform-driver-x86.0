Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711063947AE
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Jun 2026 08:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780907045; cv=none; b=ZNp0j6laQ1jw3wRGsqJxScmwrwTHmCpOm4Ed0I7nw/SGA2RfEuH/PokUoXxz6BvyADw9Hf2S6zQkOq2AEFI9q+sMcNLDfeSD4KnRs29j5OLxEryj2h4ERofz1rJVdLzcZm/KrvIxVqqa9r+kMpYfARXRmTTmOC/p+nxQ0xdI1qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780907045; c=relaxed/simple;
	bh=NeXDZ+l+JJOWjDiSzO/ouNpuHT816nQEkyTDUBw4+ZM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rJLAu5snripnI3n0dYVM//xp2EWOqjcRAfD6pDmWFjqA7Fguit5nHJozi4wYOtqUGAJU6uXTpqUciUNKXfLgYLwo1VugdF1gQ/pYxOgH57n5ka5eZdYy7KBR+A/9Le9Zjj7hEFXRNkW4e1lclH1aEU03W6o8it19NX5xrIyne60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L5IYjcic; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cNlEh/aT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L5IYjcic";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cNlEh/aT"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586Omhp2317615
	for <platform-driver-x86@vger.kernel.org>; Mon, 8 Jun 2026 08:24:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+qPb7tQoDg6x3IwcPqytJEZquxNNbm3/xWq
	C4VJA8Y4=; b=L5IYjcicDCToKBPKpddWxExvSaynrHV5RWrmVXPDeuXuvhTG8sh
	l0dtG5S/6UYTNbF4FsVWcs4DkD3+pt3FC4sLct0D1JJdx2YrxQLQZvtK9QlawYi5
	Jlk74Jnhq1cRW/quG0WWyom0OB/KfcC8Fy5TXX3CzZMGGW5WOi/eWjk+K2hPHwwg
	PcMuSAXu/jVTfjl2rbR4feCkjOfZ5/H2esF+Zskqqemc7SgaKqt7vng/LKiaZlPc
	/MY7QgkEBNlfIFWZ6ypmOLWbqpAloY5mxv4kITu4SpuxLQc3q/sr14jKSBlb3qjG
	wlt3Gbv63XUmu9fBM1be6Ldu9RyojA5M4nw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcadxhcr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 08 Jun 2026 08:24:03 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-304d8613efbso3870005eec.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 Jun 2026 01:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780907043; x=1781511843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+qPb7tQoDg6x3IwcPqytJEZquxNNbm3/xWqC4VJA8Y4=;
        b=cNlEh/aT9GrNPJcgcheX1HQxtkhKuyqVRF5n6ukQPtjFj9rtLkNx/kJHMIBSMKGDg5
         hapKXogMNPEDsDXO6PjqHinoRUwT6rte9Fmml4nhs0LsPS49TEXG/ylsr1w+JEGjIhQc
         nT4lmdcXKInwmToeiWdZIrJ3Se9xGN3k4bdJfGYQHf4OVeK3ZDklBw5mSbNSqBgrjw6n
         juS7f3qjFOUUHcOb08GwpELQvcYDkifDOJxB7TJRbLsL/TRcdWMj9/Ri1FQjVrWHatAE
         K736z0V8QrSzN4ItE0wYrjaLlj0T+QkhdRfQBfkubdHdjJDDOhGoE7oA8vVAGEY+J+bF
         KMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780907043; x=1781511843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+qPb7tQoDg6x3IwcPqytJEZquxNNbm3/xWqC4VJA8Y4=;
        b=dmsag+JeaOW8BiGl/o8J/vU29FZD99I2VsGHCQ6JVbP7eKsYDJbuZbn6FzKZVbsw4n
         z9APNolAOF1cWYRfDxE7IKwEI8CQEsB/8d6LErpYqT92lKFpdD5wQCZLYWPHbsu9bYyn
         fJCWh7+OuielNXbsfjLWEWR0tUZkqyNsvGHWUjxOiPm09wh5SzyjQH9yImz7XfICzg0G
         q8IBSrakPThE6cRMNRSj6/eVjB3Zr8vt36I2t+50HbLxGnqDRjMfQ5fFSzMPPiFwV3LS
         3G5KfuasxHIoWIL8WGZLLy5sV6VJi52s3a49BWv1PBs18w93OyAWfINFCbH2rk1irgQX
         Fm5A==
X-Forwarded-Encrypted: i=1; AFNElJ+NtJ9JyrmChpj8w1anE3GnGcC4qFHKcLyhmAqiAGtrgiJZYbC4NzNJWp0GJTK7+bu8rCQRIIbkzkRTI3Br6MVehwxr@vger.kernel.org
X-Gm-Message-State: AOJu0YxW+IqoErG0/dNGnleMLU1a6JAKFBlW5AP4u0Z1ezuxnCGt6uKM
	YVNdbXGSoCx9ih9WdNkrVbDiVCx2EJ9ohiJFnNu6uPx5nB6IU0FKAPHYgVmvKEo5EAJL29YCGDW
	PTkyy+X9/pjVR7NjvGcWO/7qLUO2+aIFdgORyDAxmWh5+F4RXrdPCRdRXD60D6rAh+ZzJbMQ1Nf
	EM
X-Gm-Gg: Acq92OHk3JQw/4qGlkOsPJo25n4NLUJmP9z1cC6dD81aO3mbdls4sV2vbRZLYfNDcbC
	J86DbVP388MxgwhX6SeRSRDRR6SpEV6iY9Kteknv5+5WV3/KqGxQc09edLO7SY/Kv5vGw2ZNBZ8
	8gx9ClDLiuOV20/pNq22nb3gjSZx+cCrCrbT7wshOD+GK9zRWGo+LeTRZmIgpAEHDA1sw+p7GLe
	LaazUifGzuOLn35M23dN48iu9lEvJWuebgJHptHDTgoGaxI6VW1bOlCqNqrS6oqvYROu+uJiy3t
	D4BZwjmz7HTP+QquWuzFo+WPuBIx3pdbW+j7BODcV5lOaRuN3sREZxiJyotiV224tu9+lRBHAUA
	eY7B38dNNgBHOn66YQphMP5WX7Azw9Hf7Z5klQxilmS02tLyORpEpSwOTYHW6lh99DEScwg4d19
	03e459UFl/Rg0eGS/w
X-Received: by 2002:a05:7301:4187:b0:304:acc:f079 with SMTP id 5a478bee46e88-3077b7e2385mr6971279eec.27.1780907042653;
        Mon, 08 Jun 2026 01:24:02 -0700 (PDT)
X-Received: by 2002:a05:7301:4187:b0:304:acc:f079 with SMTP id 5a478bee46e88-3077b7e2385mr6971259eec.27.1780907042125;
        Mon, 08 Jun 2026 01:24:02 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db85e10sm15771014eec.7.2026.06.08.01.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 01:24:01 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Hans de Goede <hansg@kernel.org>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] platform: arm64: qcom-hamoa-ec: Fix indentation in comment tables
Date: Mon,  8 Jun 2026 16:23:48 +0800
Message-ID: <20260608082348.92575-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DIa/JSNb c=1 sm=1 tr=0 ts=6a267c23 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=JXefCyyux0SJYChmvAAA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: YGhQbkxNyNUpisIzEp3N_nZqrbHeRnR8
X-Proofpoint-ORIG-GUID: YGhQbkxNyNUpisIzEp3N_nZqrbHeRnR8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA3NyBTYWx0ZWRfX24azgqryC5aA
 uvzRico8QmNDfZWKiGUvprqJ36eQA+G6AEG/rGbyDLj+rHZG4ng7eKuBGeYwiaa1ItKG8f0CeHz
 azLDw+vQpFyYxDsbz+vhdgTGV173ZlMQ5DYC/c/0Sl31MHRcxv+qlk6b+kiB7d57E/n8dZx75Lh
 vFqhfDz4XPPbIQJIf7PsJ0jxH8D6SpOTbsm7ejdiNRei2PirF5XBfocmANgF+YKa+dSEVXjTHQL
 gFXi4Q/4mwkczkbm0iBp7JrMF/2xNW3JS6r2/fKdBLg2kr1/wX0QV4m05ADMuukZRHkqsBwWJ8l
 7kzDL+lJbJ8ZCXmbW6tMsmwi9iGmGFJBTtJCn6UTRY+rJur8HDUPfXeAK/fZxtlsGLN6i2V+uJy
 FvGKcpIuIw8UG9OHRs1ZttFPp/niohcACU6DaJJ2RPFAggmLy7h9HPQTDMpmltAvBXkuV/ng+Qu
 YliBAp4AFSxoYouMtqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1011 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080077

With tab=8 (Linux Kernel coding style), there are a couple of lines
misaligned in the comment ASCII tables. Fix indentation for them.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/platform/arm64/qcom-hamoa-ec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
index a018f7bf35d2..89374ab3e600 100644
--- a/drivers/platform/arm64/qcom-hamoa-ec.c
+++ b/drivers/platform/arm64/qcom-hamoa-ec.c
@@ -149,7 +149,7 @@ static int qcom_ec_read_fw_version(struct device *dev)
  * | 0x00		| Byte count	| Number of bytes in response		|
  * |			|		| (excluding byte count)		|
  * ------------------------------------------------------------------------------
- * | 0x02 (LSB)	| EC Thermal	| Bit 0-1: Number of fans		|
+ * | 0x02 (LSB)		| EC Thermal	| Bit 0-1: Number of fans		|
  * | 0x03		| Capabilities	| Bit 2-4: Type of fan			|
  * |			|		| Bit 5-6: Reserved			|
  * |			|		| Bit 7: Data Valid/Invalid		|
@@ -273,7 +273,7 @@ static int qcom_ec_fan_get_cur_state(struct thermal_cooling_device *cdev, unsign
  * |			|		| Bit 1: Fan On/Off (0 - Off, 1 - ON)		|
  * |			|		| Bit 2: Debug Type (0 - RPM, 1 - PWM)		|
  * --------------------------------------------------------------------------------------
- * | 0x04 (LSB)	| Speed in RPM	| RPM value, if mode selected is RPM		|
+ * | 0x04 (LSB)		| Speed in RPM	| RPM value, if mode selected is RPM		|
  * | 0x05		|		|						|
  * --------------------------------------------------------------------------------------
  * | 0x06		| Speed in PWM	| PWM value, if mode selected is PWM (0 - 255)	|
-- 
2.43.0

