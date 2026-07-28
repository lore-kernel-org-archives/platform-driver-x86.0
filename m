Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9409D3B2FE7
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jul 2026 17:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785260736; cv=none; b=LWEQT0Cmwd0e58xGm1qTqjCYozz6naNmO6OESLXcCi9c6Q8OZE3tiN744RLqVsmRVn+YCmHCkKULsSN2WQQUQ0TBzpopjP88c72jMXjxe3EYYKzeYuIzoDbGJq7gys6xFCVEeFkrI0DbGvTI3N1fXvXe/r1Dpj3RySy0zhRbi1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785260736; c=relaxed/simple;
	bh=gStEzvgs7NjI1ffvpOOKeWsN7W5iJqPLd8nE6UkcCAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jhILpyrb+GsJQsX/9hjryVY5VcqD6wo+qvw8NIl2BYMz7GLnHnyJWlqTiWtFKt7st1iXss1BALRvY20MvzK5enfu/0H6HHoVm2kQTsEBD7U3HENiy6iTv0uTkvL8AVVPvSgdT8x5UkRSeUEPkLwd//HUFLnKe6HY8BNdZyXka94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yjr+DPBl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FnQpqIis; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yjr+DPBl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FnQpqIis"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SHHwo62977840
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jul 2026 17:45:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1gjUqTR9xujL56+1zqXoD7uw6MiEVy7r/K7rNUJtK7I=; b=Yjr+DPBltEEFJbC1
	wHF7mS2LSw23CjS4bgXLm3+AdaaSq75u+CbOh2lqjFrjqyXNJRKIKY70N6e1P2ud
	RaKc+ZGvQsgO8DmuX2E5LXf8YBzqNf+8mvo9uFfm4qCSTgG5CnX6O5xWRBq5yQUW
	H+dxawAsVuQDv7TCSfluQhk3dOEyF0RwOsZrQTpurzlyqH1LR3wqL7Ha0MjcEJ4B
	+U86Eu37RXHj++c9wyI2IjGn7kWdKC8Z+CFItCGuo84RkAGVZ8kwq8mZwO11U13e
	o2C0YF0RKWPegEG2PZaKHJjg6BcWnvUFAUepiHYd5lBhulv+t4vI7tnhTRXjrBzM
	8pFA0Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq0q0g3qt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jul 2026 17:45:34 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f57e31b6eso83141a91.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jul 2026 10:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785260734; x=1785865534; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1gjUqTR9xujL56+1zqXoD7uw6MiEVy7r/K7rNUJtK7I=;
        b=FnQpqIisZZxdfHlN9AmlYzIQRgQBWuBQms+2++7r7cW0QCJrRZFyS7Y0xeiRBuPl1+
         nWfMn1ih7JbUnI+tUpdlS5uP796qbNKKwL8GYOwqi17AC2GT9tZDgMpy7EpAjbMaG5Rr
         oMTTnvpzPtW+dLZ0oY/t1GG131qe6ngNGZrME8HiGpfFr3t0wzIUxYKljQhJ6EDBBNmA
         riA2u542YaMqOqPD/GbX+f1BjT0qeKMuQETStH5GpDbQFTw34j8H6h6uHBwilMyBKWmM
         lTKMVBDLn2JVSsuB6rR9Bhzi8yuNeXF6yhodAzMNdfzJjghi+3kepKSuMNV8/A4vcauC
         kLHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785260734; x=1785865534;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1gjUqTR9xujL56+1zqXoD7uw6MiEVy7r/K7rNUJtK7I=;
        b=pFM4jrXgx2zcZtUpEB8ByVH7JDqeRlgVDZyN75pg0TiNtQ+SF/EsvXi3Hv8bryx3it
         cMgneqY+k7di0tMV1cTbJwKEy+kqCJq1nRoIl2ZxA20vXvgsCZplpoHd2Jbwhma6Up6u
         64xdYKQLBuFrEcPncg8Hi/58ulnfWd4jNUU+0aBFVjCqY+6IOa2AarPPKpzEtlHDd9IL
         i4VfhwZ1U/ZZkOjROXO75+VUJWY07elVGnD5F2n/g9M4XghzsdhNPhmsx/ytTb99ZQPv
         Tf/ZX9ITh4gMVBOJglweHpW+IK8IzitRpbXaQLKnqTDO+DK90pnWr59F6bIu5PkTKFsz
         N4XA==
X-Forwarded-Encrypted: i=1; AHgh+RoPIAheMMNfImu09Gxbeka0hw8SQTu6Mh7VmL+tLcal11yGQo/tDqfzVO3sk2uVvLjws9/WeK8j1sQi0VlT9PBO5rme@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8/+/aCAflUgmSwbVr9USla+5EegocNA8wlPildDb1aTNRnWHI
	+PffrY2Gz+vl/JLiIa6wLTnhF5XO7YS7pTJNIw3IdvYZVEX5ifZ+uPkgWRRhFEmWXTmbCSKaJKp
	7sveWziPvHgmTVRv+BuGOQF34Aj8DzqhqSUY3q7ADvpUpsHzfrnIvEvFl8y8JKbGIRglrjLWFx/
	l5
X-Gm-Gg: AR+sD133kBRDCLfJopP9UHEDZiBhZK/8M2bHMvb9izn3hUluavKygiSpE5AEeSHUX5j
	cg11rvGco5w+GPouaBPSCYGElRqG1POEGundVLjvlaCtucDY+8Ps6/Ca9zdF6ad3+dqKoUafJQk
	IiApLXBmLr9ruFXBzwKeT6xaMoMDVR/u3O0q7VPgeI/ikyi96dGdnbghiJOSrdooPXKZSNSuPmG
	smi2z+1QxQaAUbn7+IP1QcmEd7lcohb41v50r60lat0Xngev5Xh+ejv3vdF5rYqMAigmqWAVi1W
	eLmkzpv9+M62b+FYBhg68zI6ZKEcW8AZTH3fpp1SCurfx6nfZFo1DeVQU/603sRdKjpPbfGXdJR
	c6W62fMJmYrcEohVJ+m8GbkGGFPyG+ySHcjjvpbgLp5fjGSIXCP5I1D0HMoeHqVf1OrK/3eITbK
	nE9G91djgCH1ur
X-Received: by 2002:a17:90b:268d:b0:38e:85fb:71b9 with SMTP id 98e67ed59e1d1-38f6a311026mr4103320a91.4.1785260734195;
        Tue, 28 Jul 2026 10:45:34 -0700 (PDT)
X-Received: by 2002:a17:90b:268d:b0:38e:85fb:71b9 with SMTP id 98e67ed59e1d1-38f6a311026mr4103283a91.4.1785260733774;
        Tue, 28 Jul 2026 10:45:33 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7273cd9esm749553c88.13.2026.07.28.10.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 10:45:33 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 23:14:33 +0530
Subject: [PATCH 5/8] platform: arm64: qcom-hamoa-ec: Verify required I2C
 adapter functionality
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-ec_add_more_commands-v1-5-771abd65ee1a@oss.qualcomm.com>
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
In-Reply-To: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785260700; l=998;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=gStEzvgs7NjI1ffvpOOKeWsN7W5iJqPLd8nE6UkcCAU=;
 b=4hRPZy16gtfLknzVZFnG3R0ewTlG4RYVkBHY4haPX+cv9BGYOjLpsuon29h/psfLt2/Cxy1GE
 sOLgGg9vkzHAvmQIQZ7PuNDLql4V0BlVlYREqPm3Fsf7ZpFGTnBSXMv
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDE1NiBTYWx0ZWRfXy59XGC4b6Kob
 t0U3pJmg1UiAictNhDU+2tGG5saPfBU+wB1M3t7znkeN7PzLqZZQrf0kRoiR/7gwumI2XWpic2p
 svt0GDFONNVPyuzpK7kUUf+1Rqm7HCo6fTEJ1Wu91GtePTK+gIBf+h9UCcBG7eaMeojMvpnFo6D
 Ur8P29pDgrk6SqB93fkgFFcjLVfP4PSU0I2BESxRNqF9hctPafrZ1yyItDYZbvH72DZ22xfbQNv
 XNETVyO/fMmy1XpXBdGRISkT4tkDn4ZSOoJhxn6dtT9K7wYqgfhnJkBaeWT456IMN+S8C/v+hjh
 hwov6pXB2A9h3XNHJVUnLRWAb4MTVzYqp0CCW1+2YSCMzWBmst5taC4WIOLE0sWs45NcaEKmt8V
 LM1ZAzHMcCrrb1zbVyzt/iz8sX57snypr6X/RrT5OEmB2AvbwRZB7QUyRmQcD0PNvKBssmC6MsF
 l5CLRl3IYmGKUm/xj9g==
X-Proofpoint-ORIG-GUID: jFpClYuqVff01mAYTTbxv4pyhmaEt4uT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDE1NiBTYWx0ZWRfX85xsSGeGcH83
 f3wlrD4P4fTVlEmmYHX1J7dEbO5gqdp+8/Xzv6CIxJVpTvPH/PNeLnr2lPelQLZRrPE2WO+7Lb7
 JoIFQxti0zpfhrMJriwn0IB6KO1SVfs=
X-Authority-Analysis: v=2.4 cv=VezH+lp9 c=1 sm=1 tr=0 ts=6a68eabe cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=CFGf0PpD_GUA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=rzEn2H2MjajWylKlqLQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: jFpClYuqVff01mAYTTbxv4pyhmaEt4uT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280156

Check the underlying I2C adapter supports both the raw I2C transfers
used by the fan RPM/LUT commands and the SMBus byte and block-write
transfers used by the other EC commands, and fail probe early with a
clear error if it doesn't.

Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 drivers/platform/arm64/qcom-hamoa-ec.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
index d0c45d9970ee..a420a180a194 100644
--- a/drivers/platform/arm64/qcom-hamoa-ec.c
+++ b/drivers/platform/arm64/qcom-hamoa-ec.c
@@ -1195,6 +1195,11 @@ static int qcom_ec_probe(struct i2c_client *client)
 	unsigned int i;
 	int ret;
 
+	if (!i2c_check_functionality(client->adapter,
+				     I2C_FUNC_I2C | I2C_FUNC_SMBUS_BYTE_DATA |
+				     I2C_FUNC_SMBUS_WRITE_I2C_BLOCK))
+		return -EOPNOTSUPP;
+
 	ec = devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
 	if (!ec)
 		return -ENOMEM;

-- 
2.34.1

