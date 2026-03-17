Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AB43C5DC9
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Mar 2026 12:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773750542; cv=none; b=vEUlvaAG1rCq+babGwEGPEHxNtqytafEU2EXPiCT+CT3U9I1HG0Cqj3xJhDxvoJqX9tSYSRLtmaDFzzfxbc9rdLd4c/6Jff+HAgtcYZ0mgyiRO75PDACBA5Spixw7GT0CtkYHReQCTiDaEWdKkLge9mM39Sm7hZhx07gYa42ibw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773750542; c=relaxed/simple;
	bh=z3t+4dAq4SSTBybuoQd5OCuGMJtELiZpMtQKu8CWNkk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HXwiwrV/z/Bnchrdv8EKNUPRmkFSI7yhVrKyeICHY0/QOov2zCZkrfOgMlMHmmeR+Z6/USB+qRb9r7zX982+UJDu44n1GY7DAwxsehrSUXPbViJ+HXhN+6m+D6ooRHLqWoKlo12i2LIU+U6EOIPoKnqSFhg1CxucMLKFgEf+TIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PeQwoj5g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fc3SvVk1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PeQwoj5g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fc3SvVk1"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H8CpfB1534052
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Mar 2026 12:29:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zJDzVUQbHdOHUfOVUrr8uKLdRjLeObgicE1T03eIebM=; b=PeQwoj5gdfYxW9lJ
	dMhAOBIhYGAdVIIs/i/tqIuuh4ErAadlhyzIEW4HwSY1pcOqcVjD99N1kyL/KIMo
	/pyg2V996w09SUIwi5oLnhY1pgNO0KtSMXqbf672DHPLIA+WeYQx8j2aKb5QYO8z
	7tB4nPQgQw1Q6TZQMu0WnJ+PtYipi1bJ5+lGO93dZmQvTr6QVQgxi01gCP7mYaUI
	kdLAGzSf9VDq6OpEs0IakKtaXzEYOVDGDjUiGv8fPPuMzk2p+v65epeF0LC8SmvG
	P0uKmqUXMu/VpPzOJACRJx2HIV8967qFN1fUjjpOGZfHdl2X4cgTSGyzAQTlQN+T
	Nqa9dQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxm5k41gx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Mar 2026 12:28:59 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-829942cf9deso4615756b3a.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Mar 2026 05:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773750539; x=1774355339; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zJDzVUQbHdOHUfOVUrr8uKLdRjLeObgicE1T03eIebM=;
        b=fc3SvVk14n2B6mafXsvRQO4a1wWJs6ifodHeV8MswNhz+ZeeKjeZkDSDdOELY5TKKP
         8opGehyDnRF2ry7cM8UYnk/nEmXDCBd21M3n+9g9oqQuFo2n1DFK0ioQniPmg4QjOWGA
         8Nuv6hSFLxnyPBwvLyou4THKOuI19v/SZk84BF4SuN47HNfUxmoFhc8QlUnSqFC1Hef4
         Aidbf4waWyHhY9lLogm2K3SXwnobAU9SjepU3X2d9KF6QOvkAWo5fWcZr3QWmifqWNA9
         7mXKMTt4SjADoS1TXMUdfY8RPXQDMolAu4ZkSVSxXLQwxegFOEDYeztlyrJqbuc1dmhL
         pFAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773750539; x=1774355339;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zJDzVUQbHdOHUfOVUrr8uKLdRjLeObgicE1T03eIebM=;
        b=U//h9l4rLo5oXOXzRyf1WaAAh5gATFaturVHFd2z+j1lMyFBxWq9XdU7iR4K1BWxTH
         JrVfOK+/mdu3xBM0Xnp0HvT4qNFOiLj0HA2qrrKE74hms25nkFlbuWVc8NoF/vdUY4qB
         WGMfNE2m19Ir7xT5oFeYCn43uR227V1+T/QRtW7rk71mqbpGRbF4h/mbD6k1cNGNWyJ8
         A0i8ngHge3c5N9uAFHqdoXfbmgBkGm1Lx6QuUNbAJ3LGmXWJhVsMl6NBj8bXNth8t9gS
         JKQchGsZs7hpzGjwg4qcnxAu/S8Dodn04Mhd//Dqi27LiO2Wy+iYpjwV+ftEUgSCfCsE
         3/SA==
X-Forwarded-Encrypted: i=1; AJvYcCUG1CTKbzUsI+FEflW4pmVvK4JMaRlyf72U1zbwsZIq2vZ7VeqzYTx+8ecSorv9KT0S1MwlOIzuZ3Ng01eum/M90KOo@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz/KY+NkYUYK+l5+PQSCUY47E8NhaoQ1IiqH4WicjnRFmp1Gtx
	CDrKv/son/YFVZ10e20JE3JZ5XVSRVUnpFIUTqSKZoF9jifJKMfXF56x70BWo4UqAu3MIzh0Vhk
	xlO8Gk/yhfCCknBTp/ViH8RB9Eyj8AH1iLhPUKcbEJqyE4bFMoPtz859jHE0Pu+vehx650nnv6A
	sJ
X-Gm-Gg: ATEYQzxfPZ/qnpPPOq8B5MUPLT59Dqhai+QBOpUj+6sKKAmTI9qIxAbfXYb5ZjyMQAq
	UTt7JEc7iDC+dGjlOIHJ6/YEgw5gbmmMOhEihC2kPt5ijWzXW8WI6YkpX7UysAdeEYbutedlO5H
	OWbzxAG9E2LAZVbrFP7CKaQfRy3bxfNMkBW3i6Imr6SDwjaYYRCcncIWyYWlZxwEv+YS700DQ3u
	g6nZSl/AWtU2SdH5xFzDExA6mfQKbViPFxLzvBHcrZtSLVQMA7SxQYy9TvzQ2i0UlYZNWpVF0j7
	iqQWb1utYo0ZUXQGdwNgxx3UCJ/UVGwWaXmrqb6N7S+A89N48jQyD+CDF4lIRNdwOyYvj9fdgF/
	9outBq0S82a1dl/pFEl7Baii4YiY4rb9tvNMfpVtYNcJ08/G+e8CNofPU2KjIA/EoDcX8js7NK/
	k5uAj0AlPEgLwj0zjvBPn4buTx36a8A0Y62w==
X-Received: by 2002:a05:6a00:14d0:b0:81a:d633:db03 with SMTP id d2e1a72fcca58-82a198f09bamr14427509b3a.59.1773750538917;
        Tue, 17 Mar 2026 05:28:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:14d0:b0:81a:d633:db03 with SMTP id d2e1a72fcca58-82a198f09bamr14427476b3a.59.1773750537882;
        Tue, 17 Mar 2026 05:28:57 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a07340518sm16654056b3a.34.2026.03.17.05.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 05:28:57 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 17:57:59 +0530
Subject: [PATCH v5 5/5] arm64: dts: qcom: hamoa-iot-evk: Add Embedded
 controller node
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-add-driver-for-ec-v5-5-38d11f524856@oss.qualcomm.com>
References: <20260317-add-driver-for-ec-v5-0-38d11f524856@oss.qualcomm.com>
In-Reply-To: <20260317-add-driver-for-ec-v5-0-38d11f524856@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773750506; l=1511;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=m7KLE/C5+OINsGZIGvpXWdLLKIeCneyzTHdrLlOZZSo=;
 b=CgHL2K8lVoR28mEk2G54X7UBVDfBclsI1YbgG43m8Ck7WcGjCAqefdioTLmGqaXPKzqrdvc28
 1X1iqbB9mJ8BLugWK8xDzyI/7xqmo5KhknN2P3ZTSzcIQMEgzKGSgBg
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Authority-Analysis: v=2.4 cv=fJ00HJae c=1 sm=1 tr=0 ts=69b9490b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=um1wo07bdbQtbc5qrgwA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEwOSBTYWx0ZWRfX70qQev9Yy7jo
 g1g8JBQa/noHnUAXkh6wqNDeCLDiU9F6dNNRbpXrJbSF9PYbsogusxfpMjytpJgyz75dM9ivOF9
 6xa1BboybpDgUxH3M1iGVinNZAeCcxlE9m3/NYRE5Y8MnM0vUnbxRy46djYO+4oe5NbhrcpxDrx
 uRvXl28b3ME3EAKlW7Ai0I9nJTJHbj8kzTst3nVl83eqJYGycI+MafN8/hPhpKPrshMj9Unk3Ga
 EzCsV15itFBm21pg/HLiTAzRm6CJGAtMLf1hJdWc2LJx1l5hOkHQVo4y7zjaBWsc2OB5yL7OKy9
 1243LzbmFH7XrNnJ0A43Q8zHduJIow27sbn+xzt1go46Vjnf1ugPtvYgePXVss9zPaRpxJatFM2
 Exu6RofXXNZp4r9RhTgitnxAqB9o80OSK1MBh6YerpA6ueesq+iSCjJoqVHiQC5IUpjU7TF0ehS
 WISlASIyVHFNkN/6XXw==
X-Proofpoint-GUID: tOCKpX6rlDBXLCpB9ElyOYv7JKCJ9dd2
X-Proofpoint-ORIG-GUID: tOCKpX6rlDBXLCpB9ElyOYv7JKCJ9dd2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170109

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Add embedded controller node for Hamoa IOT EVK boards which adds fan
control, temperature sensors, access to EC internal state changes and
suspend entry/exit notifications to the EC.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 630642baa435..b3430424a052 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -799,6 +799,16 @@ eusb6_repeater: redriver@4f {
 		pinctrl-0 = <&eusb6_reset_n>;
 		pinctrl-names = "default";
 	};
+
+	embedded-controller@76 {
+		compatible = "qcom,hamoa-iot-evk-ec", "qcom,hamoa-crd-ec";
+		reg = <0x76>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &i2c7 {
@@ -1272,6 +1282,12 @@ right_tweeter: speaker@0,1 {
 };
 
 &tlmm {
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";

-- 
2.34.1

