Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794002528;
	b=pbC7Zxe5ckD8rGD3lB6Rf8HBLfh1oJqkF3c4ggHD90c9H4gEr1WFWDQeT2UCTbEIizGq
	 RQ2OK+7yYNQYftiSIPYqJbsRhXBhmEu5moJsifEFD3d4oMjtbPgUw1X9zMUcmHSxUjW2v
	 /TybUNLvgmvlBAtNRp7M737OYobj27Mt7gn3CWqlM10FjvP8u2a95zwV1Wz2xcn+Odu4f
	 Ofq4g338DtIgEHvhIpIh0unw8c4y3/ZGCE98fFy7DU0tCHT37UGw4q5FwLpOVb2kiTq9r
	 Xeg4Ncyp0B3/0gU1ESHhYXnBJhAdU8dgKRYqh2MA0k6/IWUISv+BO4lUxuXWvC+0enA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794002528;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=nXSfTM52771bFgr27MWDIuApROdT0+kXoNKIH23pOvk=;
	b=xLgJMs9KqCFwtD5tetWBkGHaF73WVc+siNyGqVHQXvVLsDZvPWYKo0iCB4mMjL+lB2rU
	 5p+TImJCIHbXEDH9/dTus5aEAnoy9ODcnXL0dPSIVAotmSp4DhaIAP5e2HiVoo7XQuwrI
	 HrA7d1TZC86T5NXKYadGCBRVlVHc7Dfl26yVH1Jlt0h1whARCm38fqU5r8W/CrsHMEyTa
	 orTa6FA10cu4HABoxLZ3JVIghjnNFJ7oiunyw/s+vvMC3MqJLDt5+b/hmGlaqmNVVxX3B
	 TJsv0DS0ju2CpVScF+ZPfW26rXvJErvPwa9iqgJkqfBFmWq2ZlHM/1wpmbAowS0vFQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XiJNVLBD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bAnvmpZc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1D8606A335
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Nov 2026 22:02:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E1D8606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XiJNVLBD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bAnvmpZc
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6JN5Hc1292156
	for <platform-driver-x86@vger.kernel.org>; Fri, 6 Nov 2026 22:02:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nXSfTM52771bFgr27MWDIuApROdT0+kXoNKIH23pOvk=; b=XiJNVLBDT5jl44bp
	OssmIgb2ksplpqtZfiaDYzPpOEbMMuWqlBrkzQ6mz6ezfHQY1WaR3gaqXnU0tmPA
	rs5KZY/F/0QL3Rk4c/MPsrjhFfGaW3xcSvdiFY+mNOMkMzO5WMbeNIw5NxEOE72G
	xL9eAr2HIAAcyBlnrACwJ1C9Rms7fSTSGrtB77awrd1AHAFeVwMC0waQhqC6nCNZ
	/MoTuXMbihZRV6K+eO0Q0N2YtBDI8pq7LjLTTcxXaTMa4zMuz0KIcsVlbXDuPUFj
	/rHVGTjlQz6X7RPxOI8ARA6AcYY0rWkaqdscY/m0RnjLuYw+rnO/PPb3lL+VYRyT
	Y6FvGg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsn0e0gru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Fri, 06 Nov 2026 22:02:06 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7c124d17880so234982137.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 06 Nov 2026 14:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794002526; x=1794607326; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nXSfTM52771bFgr27MWDIuApROdT0+kXoNKIH23pOvk=;
        b=bAnvmpZcoyFVaSHwcfuVCyiMO9FYIN3ULUrdGJfWTodVvDcXCuCLpEaWRFHvVZYDgf
         KqGDofBG1UOAAeB3x8q1XgRQJxLJ6HL+3bsYzI2q9RhLmDQ2QXGmlYBfqhPvtIM79u7C
         vG4kTVBFVKaeDDg+bi4gpcP7pPyimFlwvfRoRJx/FrT4PjOu9VEz9W7Fg2E3/4UEsrjG
         J5Nc2ORQ/lDYe/zGkcxgfg09f7jWs9lTz4Sb07FYG8enzfSCe2jTAQB8+KVWVuJKg+Sn
         HhBjntF/MXKASSIzDC8/S0zvan4l3b8HvK+snUb9hK0RBznD8RWlzu3ZTpFrefxudTTm
         nR6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794002526; x=1794607326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nXSfTM52771bFgr27MWDIuApROdT0+kXoNKIH23pOvk=;
        b=dUDfvYE5XspcLobOyRmae2GLjzJJIG/UHRTzwf6pdDYDusivwaFLqL7zzQGH1QHZjU
         7FVQch5YkjlcrciTi4dp5nkKqOrsSgx6Yru33cwLIcwtPGlsa2yslRe5Z3Zk8iO3a7wI
         DwclSE9k+yb1/G5bPWkmCj0G97YihnWPiuz72zpkfL0G8OqWNUvGcyBMUSZ/TsjTpgM2
         CjyK4XKpEYaC4p8aaTgrPYGWXHzvvOwqjWetzA6rqzznyZZP/CbleJrJwTmllsityZCZ
         sNlGoLfRGGAOvpOH2r64ri7K99/A3NDtz8kwUFE2+0iL941Sj8Ltt0fm4EW6LX9p/l0a
         FAdA==
X-Forwarded-Encrypted: i=1; AL+hErEp6tRNqNLuMtgjrjCdVi2HJF2enypIZjnjxICPh4mQlErBl2UmxtJRczSP/qy8r0CbEUBvKKNKCzbKJqWH3O2XVuRY@vger.kernel.org
X-Gm-Message-State: APuU4Z/qRqQrFANGkKFDqwp4at4TcvCQfx/hO57nDM6DDf1qHl3Vhdj/
	sMiVjVfgy+/RNBYpTFImhxYZBT3JE5zVX1ZrixeHG8CxRj7lK8Irimk4pLMVd4NfzlLv1BCH+TB
	fyTxIZxh5cvzn1std6hnjUnScRQiFP8wt40F5PN0GoYB2XPUz2milQbnpE0RayKbV2+ErZSu9oG
	6x
X-Gm-Gg: AYBFou0pbChZDu5yejZGOY9i855S1xwkRyKAkT07bAOSISw5lRcgZRETrdUusdvK2Fw
	lTFrby25J2ozCCI5Wi8wL2x89wthuguiWf1nuZOahnv4fVugS6fxEBmgwyHg/uvpGsDTm7YIkvS
	pG32a7VHo7Kbn1eS309fdtGqxLmwMdSMfL7jThA54eZylJTvG3BLpwNGcNa+JuCt8w/zpCpeW15
	h1XyNREw3GGwF43MqxG/tEWblSQzKEl0aWlsDsKlYiKGSFz6FRtFX25VDKUr3Fa3B1FVEpfxYxs
	KM+vaQrdIK7Wk21QJ9K3cYy7jTD2Ne+Dulrl52q+F/93uJ/DpGnaD+NQ+Z//CCY9uCnCXHBlKYy
	m+of3X0EhDLmguiS2S9PIc9GsPQkumAyIXAJQNuEMh59GHGcfqa7cVUNj/g==
X-Received: by 2002:a05:6102:3c91:b0:7b4:bdf5:9307 with SMTP id ada2fe7eead31-7d2a1652da2mr1974146137.30.1794002525671;
        Fri, 06 Nov 2026 14:02:05 -0800 (PST)
X-Received: by 2002:a05:6102:3c91:b0:7b4:bdf5:9307 with SMTP id ada2fe7eead31-7d2a1652da2mr1974111137.30.1794002524946;
        Fri, 06 Nov 2026 14:02:04 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7cc6162sm5812437f8f.47.2026.11.06.14.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 14:02:03 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Sat, 07 Nov 2026 00:01:52 +0200
Subject: [PATCH 1/3] dt-bindings: embedded-controller:
 lenovo,thinkpad-t14s-ec: Add Gen 7 support
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-t14s-gen7-ec-v1-1-f4a8edaac447@oss.qualcomm.com>
References: <20261107-t14s-gen7-ec-v1-0-f4a8edaac447@oss.qualcomm.com>
In-Reply-To: <20261107-t14s-gen7-ec-v1-0-f4a8edaac447@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1048;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=SyrZGulKp5uKF9cAbNVl8Do/c1rZ1PPSYOPKrxUG4DI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq7k5VQqqtyCWR+3Z2Vw8LNnei0jik/HGY3Q2v6
 R4ut5BUaNaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCau5OVQAKCRAbX0TJAJUV
 Vj3BD/9QQoX7PZ6Ph1gTJ6BzTUr0AadAkHUwogPJ3ecCwHFO66kAKQ7sZrmsgQ/S16zlOwsqhm2
 IWZ6qhZ8zlRa6WkNNli8diGHHnjDohSj4fGMrx/vVx/K8/xGQKhsrhmAy0V+a7wYncZQQjWfK6D
 KF4ZPQKP7RqWyPUwFagq+69nnDwfLW0gIVMRfSzM0c9livjcZb0w/K7RSM/GuoUngoXxOFs1BC4
 J+iA+5ccZxS3M1Le+DrkoFhgYHbp6qkaN+voc30CC7D0C9GOeU2Ax5jV1177qUevr6dRb0/KrlN
 2+8bzlF9pi2g756etklwNzkkJFAjexTm1A11UtR6v4M17mYv0W1ssfK+r81llDX1VuD+4SpnKvi
 gp4EapyZhZRVF7/yGqEObxfAOCwCS5TjnkY+RqSxiXUuF3rVvTdN4oXa/hRUSWDqHXfNLJutH2Z
 CBz3QIfYNdlu683QKfCX01T/kA1JmgMfD2e0G71BoklFefWbNbpRsry9fHY2IeY/tvOkgN0mxv0
 kEvgBebZ4bmzYIq1bhLOoUlrKXJB82/HRsXnhzNmaFK/Fw0qQ6m4sa8VVQpU3vIksKs69hvaUkQ
 qo7kA6gVATa7oO3F9wOMb2AT2UtlaRgOedlqQMw8PvspOlAGD9/8fR7xv8fdi6nTp+n0fV+Fpha
 dQZ5ilkFibImSSg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: kMvkyUBH4MWyHAe2pMAufKowlz55RoJe
X-Authority-Analysis: v=2.4 cv=ffA4WEQF c=1 sm=1 tr=0 ts=6aee4e5e cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=uZMt55wJAR8SEHwxpHMA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA4NyBTYWx0ZWRfX3eyZkLl9BIWq
 5fUrrD/yRBSuPfuTvOoBJ/6nPsfdGy5cPwmRnJ3i+aCUsaQoTM2P8q8XZahzuwEElCmom6OA1hC
 wXHEW3wWPxbFI5q2aNLQq+Q6RAAfoNj4bIO8Q4FQ24snXr3YqBH766Gd8CA0KZjmsl++R3MHV6+
 8VIdf7q/ksGivDnL4RxXB/5WUnmMe7CqEbtJdPemdPveY+xpuLxJzoGDHp+UFgjAqfmLJCa8nsW
 HfXGglw+D3xpqrWMjmCeJwhwtVFTCahJdeAaLAplFQ/it+4lD+GroTmB8pQH6awTnrnHrPOU7AG
 f6tPRz4V/M6u/+EMchZetMsE8+QLPyowEXcTcXyhR1VS0u/mxzbSqZjOF2oiYiHWmxsRnD9qCBB
 SNogKXtZ3Yo+DhilKCUUvNgPGXUGBh4tHF/cRDWOEGqNojSzKL3yCgBB4xoF5nLsZn2H+ZzQReb
 B4J+lsnvV1tTaj99cog==
X-Proofpoint-ORIG-GUID: kMvkyUBH4MWyHAe2pMAufKowlz55RoJe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA4NyBTYWx0ZWRfX20JmTPmDVFrg
 ggwz9KUdPOu8aJr2EXWH0A0tAbpgFMmLzcWyiL+gc/P02DR04GWwxx/bPFoBI0Oe87jcmaDXMap
 KxrnuoL2BGioyvxZyrUTp443MXoQJac=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060087

The ThinkPad T14s Gen 7 (Snapdragon X2) has an embedded controller at
the same I2C address as the Gen 6 one and reports the same kind of
events, but it talks a different command protocol.

Add a compatible for it.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml         | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
index c87ccb5b3086..99e5e7ae3cb6 100644
--- a/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
+++ b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
@@ -16,7 +16,9 @@ description:
 
 properties:
   compatible:
-    const: lenovo,thinkpad-t14s-ec
+    enum:
+      - lenovo,thinkpad-t14s-ec
+      - lenovo,thinkpad-t14s-gen7-ec
 
   reg:
     const: 0x28

-- 
2.54.0

