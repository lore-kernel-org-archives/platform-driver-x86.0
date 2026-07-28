Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB493D6475
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jul 2026 17:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785260747; cv=none; b=ofocrnSwQ9m/p91rf+ELVWMBFuib+X9MJIklSuT4JlHhpdNhsULcdP7lbMfw6nCfucr32QfP7UdTfjXuL6xxjqJK7j8iBGFoBs0aq5FRm+mnaZXgCZO7Jv7hqWEr7wsDQHJO/5/vr/mQPr+aYuBUzse3aRnbqkKTlDfPcTEEF+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785260747; c=relaxed/simple;
	bh=FtLHHvBZP3IdOOc774WR4L7i+UG2wLsyAZrLBryavq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dp6i+IKNhSUJLZPMyEV6YmtWzxJchybsQXG10hyAgaMGnlJevwJi4Lyxc/P6qz1b31TNeg3x/ILjZA3sKxy5wC9iDEtptDehk4vgbxrxFcfk+1ejGHkXG9E1F28G+i1XVz07PUsiOd59Uqt0Y6kIKQrHgzzetvCcf0QkNEpNwYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kvwo2ANN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YHrQ5FKv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kvwo2ANN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YHrQ5FKv"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SEcW3C029636
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jul 2026 17:45:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j5nbKEu6f2VBQemGVqTJN/Rhxv0wawgQC71gUUGmCNw=; b=kvwo2ANNhS5WE6td
	vEyfITPqBV1DTzIsVmBdxmqbGFArDgj/qsr2V/iNCg1p76daH+nCcE2yVXYTKH+S
	K99p5SFfeA2JKHrCLMPmWXA1k3wbcit90iF6LF8306Ejh+qx0/KLjt2bupL47Cgx
	FjMJSkl5Vt67/L5cuv5dVgwlnvM6HFLNVQxD6xLF+18x8cZrYjuFJYTw9HEzJXSX
	+bce21Ioa+iX/7lNyUNddlqkCj0ZxE2ZR3zvPDH92umR9Pu5iSzMYi4RktST6NhN
	AW7DwNkyVW9HBvwjPM677rtSmJrn6V1krcwJd5kEy9Z/mJJXw2ugGa8juPJKBNTq
	SJ/v+Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpvxxhmvy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jul 2026 17:45:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso200107a91.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jul 2026 10:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785260744; x=1785865544; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j5nbKEu6f2VBQemGVqTJN/Rhxv0wawgQC71gUUGmCNw=;
        b=YHrQ5FKvdDGOUMoFLNidOwe3hVPs7lyLy6LVgdfTpWZqHnbdo2y/SF6ysfyHmVDflN
         maJR7QgISUeUDjbfvavQh/koMSL9ZG86O4uZ3xJ5OP0BqceXeHFxDMZ+EAMwGDUmWNqY
         c8eim34jZNguQFI7PZ5BcEHI/vof2cnPaR2WdEtha3X4qbQ/I7k6s2J3N9I3MKrBNfa6
         KQ+17SWNIXf/3+h7Va2MSacbUXm49g5Agx1n602emHzo3vdM0XqDon30FjxmgUX0grbk
         9nQfMpvh1UaYX9tjeV4Bvk20pSzI2WPmXGzhkXB6Agw6sZ3/KhnUUtYr8hwe3qRQsN3I
         TbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785260744; x=1785865544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j5nbKEu6f2VBQemGVqTJN/Rhxv0wawgQC71gUUGmCNw=;
        b=JH42T1VuyEqpdE8whPwPvQGNj1/JHNfNesFKu0TPUoXGRcXYwvGCEc6OZ/1rM1bMwD
         c+F4pyPnFPsP/Ei6HjPrs3bY+Dxc8uk2fciGJt4xI3IKzlSEw+mFyMM+/YKsCJKZN5YO
         cxvvevvhf6AAiuHjCh7DASL9V/i8dg16CBU1W6i3J9Xu53cwq3u3K6SZNeRUEZIgEyZy
         rh/+doTKWdnRHzPz9eOfzPjbrxJaAMq3Iswq6wKuG3ywLPaDbd7Id6Tfeax2qVVSzcSk
         DfiLdbHGo7W9gzfXsmVk5ls9Qq9m+odCb1R8jUdJBMMCANDb7Yz+fuFI0nVmoeJ+8cYJ
         S2fw==
X-Forwarded-Encrypted: i=1; AHgh+Rq9qt0bKQ8OLs4FPqX1k6M9ZzAREAFjbjHYH0d1KTOhfs1z8zcQWxOXtrxdCHzaJ0g7ApYZkajsSLtoqJLCKHWNWNF5@vger.kernel.org
X-Gm-Message-State: AOJu0YxGQVWd5/PTVXzh7G+A/Y6NL6mWxy0ht/zU7Bq8NfeAtqqn57pB
	31P6NG+vdMr09g8Z11r6gW3ljqcyRtCokyCq8UyG+/i8QNK/Km2YicEtlJDwyoec7lQfAV5T9mf
	MFm7E7RlFruM3cLkL9CgP5UsHdQQw66kfQwLdqSROBeR/97SFh0rYQ0kKX07gIGMYRJp1yDdryJ
	a/
X-Gm-Gg: AR+sD11q9GrubjowFAJNMhWNSoClp/hcwWE9H6OhI48OveQ99W214jhOM9C9e4jD019
	i6KOx4ySGsMDSCTLGFRggiHwPP8wyoATZO/3EaCgHF7nGe2IaZurkjsXbzbNw8jbSA1bILFOz4x
	AxBcgZ4vrNjxNY29bORz0w/Amfroe74ciETNrrxM7Ou7HNIk6QSqY9bjoP5R5jq+ts+Uh28874Z
	ApRNH2QAowRTPgYOYmojGxTjQf2+BFATZOYLnppYI/7Vx0cX39W19CEmrWvWQSV2nU9avEgr5mQ
	qh1ArL44IBDeIFVrcw4jznCfT2P+b6ULMtNMKCzhx2e7wrT8Kub9/ads1fjmu23prSOclxyV8lu
	nVEQNzM/arexaSw06QBBSd81O/xHwJ7AtnHuyy3hrT1SLWYPtaBqHATjvpCuIMMC5B0o6NN6Fne
	2i94ZKwIpJduf3
X-Received: by 2002:a17:90b:1e48:b0:38e:3fdc:62e5 with SMTP id 98e67ed59e1d1-38f6a479f10mr3347991a91.19.1785260744480;
        Tue, 28 Jul 2026 10:45:44 -0700 (PDT)
X-Received: by 2002:a17:90b:1e48:b0:38e:3fdc:62e5 with SMTP id 98e67ed59e1d1-38f6a479f10mr3347973a91.19.1785260744085;
        Tue, 28 Jul 2026 10:45:44 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7273cd9esm749553c88.13.2026.07.28.10.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 10:45:43 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 23:14:35 +0530
Subject: [PATCH 7/8] arm64: dts: qcom: x1p42100-crd: Add qcom,tsens for EC
 fan thermal management
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-ec_add_more_commands-v1-7-771abd65ee1a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785260700; l=1142;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=FtLHHvBZP3IdOOc774WR4L7i+UG2wLsyAZrLBryavq0=;
 b=Ghx9jnGnxQm+67/x5HlgjMXg50hEUdmvmsMU78ID0xL877ZcuHdlsH7yZEg9D8+3IBpikTGrF
 fC/onsNLcxMAlOrJx8X5nxO8lJG+hZT7VBYYq/a1Xd+Sr/h3ZkRts7m
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDE1NiBTYWx0ZWRfX0aAghYKA+BR+
 eMOvclMBIc+uXLfmnD7EWT7Bp1a3mOGzUuaDJKAg+GhVHxnvM2eJefYW+pi+mmV5WxD0xDNkaSp
 6qpxPk+7vuC4Ip4xIcR3ZX6O/cL119ZxN+dAWewa+4jMDsM94q1ZtATd5jZ6bnpV1AVgWlnbiJ9
 jyx/cxFuM2SxnbH0N9RYiAoewqA7wcrBGjxKTFI3Iet3eOAIHI620Poq7VYp8IM24HEyzRaGR7M
 eWK5BGgZ/mpVaWab1mhoLevDccIPHU+SSkplpguvfq9ug89f76f0IXj2vXcnDNEWJHnlUJhLQTn
 WFjq1edXjHXZ7nPNXiMgufU/JA4iXsr3eGUkmnqxlPmB4U0O+SuF3/3MIIjnPPGOd2TStDnkLbN
 RtJdV+6GBxvyXeIcgD4Dfb87kdAZofK8BI8kKsYXtwml3zCIAZJuxvsAC3QqEhDP6BErXUSpzpw
 JYlhIID6CVdc89+MM0g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDE1NiBTYWx0ZWRfX7eI7K+rtnS2u
 AVfn+X8o+72Yx2tDGzA00Gwfg+uMUEzJGHrcnDyNipwE7l8epTteZU2bZIEy79PMgRoUGTf5ifB
 idlKxbVig1FN9al6to1f2hsy8+uHufE=
X-Proofpoint-GUID: f5_yjPfeP8K6Xyxp3X41cWX8xm2dWHFD
X-Proofpoint-ORIG-GUID: f5_yjPfeP8K6Xyxp3X41cWX8xm2dWHFD
X-Authority-Analysis: v=2.4 cv=PeDPQChd c=1 sm=1 tr=0 ts=6a68eac9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=51hZXEhXtzUsyNNNMF0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280156

Add the qcom,tsens property to the embedded-controller node, pointing
at tsens2 and covering its first 11 sensor IDs (AOSS, NSP, GPU and
camera) whose readings are averaged to compute the SoC junction
temperature periodically reported to the EC for fan control.

The x1p42100 is a reduced part: purwa.dtsi disables tsens3 and deletes
the CPU cluster-2, CPUSS, AOSS and upper GPU thermal zones, remapping
the NSP, lower GPU and camera sensors onto tsens2. Only those sensors
are available to contribute to the SoC Tj average on this board.

Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1p42100-crd.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1p42100-crd.dts b/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
index 7ed4116b9590..b46b67c5e436 100644
--- a/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
@@ -19,3 +19,9 @@ / {
 &gpu_zap_shader {
 	firmware-name = "qcom/x1p42100/gen71500_zap.mbn";
 };
+
+&i2c5 {
+	embedded-controller@76 {
+		qcom,tsens = <&tsens2 11>;
+	};
+};

-- 
2.34.1

