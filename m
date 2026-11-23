Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795426526;
	b=4dg0tX6F03u94qzh19TlbvtGysgBE1aLEss0EQnWkcgtZmTSs7INYzZTWcY6/zAL1aPR
	 NEm5IChSjMUJuMBS3rsS3C/611ZC6Ng7nf15k9D/nbmk9l4ygu99CqD0bWQ8nKALI14hM
	 NARPJZj6nGWGfD0Mpu81VLG3RxKXh87fjRNH+c/8A2A6uK8f1u4auoLFp8Mf0+XxPmJeT
	 UJp3+FkLeo3uZpa8a05HudWvcHdlb3qNLTs+90TcgFt9d8uUqsnU8I+paebUjruvsO85D
	 Gs2nEL1IuW0KRrE18JlxUU6IlXbtl8bWhODYVwW1h5eUVTAYwPjjSyT6gaH6tFGqV7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426526;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KU0CqrOg+I+DA/52+PGJIa4IqUvI00bQBx1czwXomuI=;
	b=A9dKf9XUKUojloCsTWdKPGhF7dt82V1ji7DjHXzwJjHxSXp9VgFAnVOg89Aj3d3TCNGO
	 CwmXQBXpUaSwgb0Gq8fCLSOhSbZphgylK13+7nKzXX3BeehO0VCZN21k7GsovyYYsG++7
	 h81y0mJQHTY9zfAbT75FjqYp+HS7GPl9L64n/IcAd17MM4y9TohV7pjmRTFavKpqXUI7e
	 XwwSX9WO29erF3oU3Q8YuGF7kfojT0vtDqbd7vPPre5uC4Q6ljNP/JBCuzHVtz6okK5oD
	 ZGNeOb5iaLngHirte7a6yiPZdAEwGEqIwH4XWs9SJHRFksBY5HWvG7XfLWl35/J3GOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FZ+fB9Yw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GRlBPVGM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B87606A338
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 09:35:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7B87606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FZ+fB9Yw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GRlBPVGM
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9FmML1828351
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 09:35:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KU0CqrOg+I+DA/52+PGJIa4IqUvI00bQBx1czwXomuI=; b=FZ+fB9YwwOl7Z56Z
	SwqQQ8THaWDWGaJJcIiAcFbnaXqBV6uco2lBY9V2oKQ5y8A3p2t+B3DOKCnzioCJ
	zXmabR+Z4WvOC6aFJjF109/4RH40+EKGJax7gA0v9wWTri6v0Ce1poJarfce789C
	7qyJ1lHF6tHSSV9QH0FCRx++hiZgLlvXxeUOKf/oWhfCLXDbNoPj/48ZTx/Ut8ym
	vT5pQCFZaqwqQj2Jf66JafYROwGHQdpf1snyPk8DX36W6NHvABKi1Pzwqxb5obTV
	35cs0mONSkHgrmFCHAZ1nuvPmX3NQTfBBvEyGS9L0qGENPnjg9ARNu8v2BTB+1iH
	YFKbDA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1p8q7b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 09:35:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94967c6d4f4so325697885a.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 01:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795426524; x=1796031324; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KU0CqrOg+I+DA/52+PGJIa4IqUvI00bQBx1czwXomuI=;
        b=GRlBPVGM5euRKBOh+VjQ/m6yUIMVY52aylcuFXAcbaKiUa5ul+5mGZ28JZ3clrEn2j
         6X8HWv5/OYCCRMY5GxFCmbgpXaSakQm8txlWCumzfuHYK9MMZV5KSUJUZ5vypipP2RNs
         Ln/GO0H9+HfRiQcWleKZ20QPlXxrk3TqXOJrlKNIADV0Kt/IrTDiu5/ACBi+mdNUWEHr
         EBSvLCceXo/gWnEtqiiOdG5T2IyOic+nyuSfZrJe+KUBfD6ocamPEIrRYWAmNRBkH9Wl
         euvIJ31ADm2bH/Wcr8ye3Q8xVUrnouUZIWJCDSSOBS2MoogjDAUxEwlsLfInPUl4UItM
         PwAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795426524; x=1796031324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KU0CqrOg+I+DA/52+PGJIa4IqUvI00bQBx1czwXomuI=;
        b=W28eKMsLcJyh94YW0Qewd6rsUtRDHq79FW0nbTSP9meE59xrKFlaZRdDCDz0z+TSjU
         NVv2bOPQ8QfKEUY2gSg79TDrBm24k3fETAauVgDliyR1d8brRB0WKISJtcOVBSzyiwL8
         WbvHJkA4XZkXgLKpkDo12IgpQ2FNcc++8wj6UtEj4fy7m2gmk1c++WEkBcVI4584LppW
         R6zcAjQ/rNTLj36RotcUxIai0HHBv4wKAi/OqKDRZmscZRq303jZwr+DrQa+hIUQ4mJZ
         6APXlipmc63xUgGxmX0DlXri7Qd7GbL9xMVGJLm7LBHjdlWoFQXmRwA97G587jOoUZxw
         3z8Q==
X-Forwarded-Encrypted: i=1; AL+hErEp1mjKHRrElQho8EGdmU7HkV0jCf4Pyb6+gadDZCCV+C+7eVhLwIue5cH8YiNw20gbWC832T+h1PUlvlNKJhAaOn6m@vger.kernel.org
X-Gm-Message-State: APuU4Z9fPH7M9F9ZdOnqOOiAaXV6AMr7KAiJtR+YnykQj33VOBaNyzLd
	TC06Fax+sJTlv2ziVIH8wrJdNbXcVuWpt6cHLqcjem8lCy8WYrBpN1iyhdBO8wYs5/JCMJSP1le
	l/jzD7yshKJGEqg+5yOjFEBacfnXhTt+ZaP7EHbVejul3LUTRJsY0eUVTKyAT2RRii6vnG+as0L
	wk
X-Gm-Gg: AZFdTZdacAgUsmHLQ1M4svyHMqvxKTEyZLV92HwVyQl/UZ2Fz5+rcFkJ5RYYJ61YWnA
	GS1Zfib3iFDGlCF5K2cDVv2AEKEcSZ3qP6Tx/nLoGYwdAFwTRgl5zfnYgncoMvBx/EOOAzk4fWg
	WhTXUiRVu2YJ3LnKUY/H0jvql9oA5JO7NjP13fw8BmcoDnyepSBbhm6tFC3MfT8h7hMOhuEB84d
	cugrVgA5XYskEZf43whRHLrrTUyggqiJXBDFTVElke6m8vhhnRe+zPrlTnOH967QtZyiDJO7uCo
	IXV9NhyEYALB4/i8T1G9cJG910UsG7AFR6qx5gZSfmZSsoczpe8kVcUEMNddPwjVqptFz3zz5OY
	hYZ9l6o7sXhHJQPjBVHdy/ZNn3t0CeLj0Xe0BvgBUNcRFKTRrgPH4gWMYbA==
X-Received: by 2002:a05:620a:4446:b0:949:70f1:de2f with SMTP id af79cd13be357-949ba8260f2mr1723261185a.8.1795426523933;
        Mon, 23 Nov 2026 01:35:23 -0800 (PST)
X-Received: by 2002:a05:620a:4446:b0:949:70f1:de2f with SMTP id af79cd13be357-949ba8260f2mr1723257785a.8.1795426523323;
        Mon, 23 Nov 2026 01:35:23 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960068fsm123208315e9.4.2026.11.23.01.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:35:22 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:35:14 +0200
Subject: [PATCH v2 1/4] dt-bindings: embedded-controller:
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
Message-Id: <20261123-t14s-gen7-ec-v2-1-3420a6202366@oss.qualcomm.com>
References: <20261123-t14s-gen7-ec-v2-0-3420a6202366@oss.qualcomm.com>
In-Reply-To: <20261123-t14s-gen7-ec-v2-0-3420a6202366@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1121;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=aW/Ws2tcO1sy5bYtB2QMD9F+QpXYhZTfqTiGgY5aZZw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBrBAjTZo2x+nFetcp/vZWh5OUfrT/X2LS3oAmUh
 a+YqdMfBZCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCawQI0wAKCRAbX0TJAJUV
 ViA+D/9AIYpciGbl2CH361KLQrGAlgpvHSNrjn/Fpn8HtxTv6jdjj8tpKpHv2tZf9BUR8nNQGr7
 uT5BI/ONMTqdWu9UTQ/bo5X5aklNg8SLS5NXHjUYth+1ZV/fifVBGOkWjDfICtuLMwN67tWUsZO
 gOtlYu1odRhvJ+l98QDXFIFOuZAinvMsyLMPTuapUrils36EGR923a9LszGOfoTM6IupbJOxvOS
 ERIWVgiPFJ1BvpfIypqjbbM5ercI9lz+z3Ix2mT0DJp/XgpReU0HNeVinkGB3HF4mAJgV5oe1C0
 IWpdFmWc1n7xi6Qu1ku+CYbnG2c9dt9cjHZ+2KkEnF54u1pVfVKANsWE8BDrY4I7ff64lYGjR28
 07weAb+ObQS0mYbbaS+9Hu3XUveGAiq9W6jDehs7Egrh5b3AE63SlHKLcVyLCPtGwjvhBsX/DOQ
 9BCo0sTNP/l/JIQQgN34LKBkYHb7gDGFAfxGNBCpaw1TNk4EwPh32Nl44j0wi+1dlriPxHy/h7k
 TDTlgzNfwdQE/Kr8+5x51HmH4JoYm4Y1svWj0CiyYF+hrP4Y7xSzie+hbzF2Cirm9lSfEb7i/UI
 SUGcf7W74pcUluJ7bUv3SEk8EdSQZehnn8ljC4Y5BcOGmfke25Zo3OwnnqP8SVQkkRJzECimzXs
 /3VWrBZENrk3U+A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAzNyBTYWx0ZWRfX9dA90iTb9Flq
 ryLjvnVKGPanE27JkFo0wVA307+7M/iLv3NUbryShMoPBGnyBZLHCtdIm3gPODTrzrZ02/JXxY/
 yCfGT9dVyEJO3K29mHBbP7338N3H1oLRFpQdH5XC1VR90GzrsHYKhmXzCLpY7WCTqcmYaRbHAdL
 VOXPE0Cb3FIynNm3pP1QWmY3QhThY4ooGskbuY8Id3qkJuGczJTNaFHgHzzi6ApQ2eKRtgFQZoO
 qkVKbKMaSBo4Lbi/xq17HUKS91miw+VzMwNOhE5tStMFS+AP4sfn18mg2IP01MwS7UAxrnGHvyG
 bYhTUIaR2qGxl63FY2IMEgV60yTCkAu+i1aHxtp0x8EVn6rIjcDSPPL8Krizettgm0fEDH4v8TS
 ZsDjZn/x92e1fv9bpibW3qgLYGqgDBrplf6fvNfjjumrhDFa5lWxkT3CTyUGNHogZyFSgPd43aT
 4pZVpaHKhzE/bdeRjWw==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b0408dd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=uZMt55wJAR8SEHwxpHMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: lUhOjwsomxrAks9R85f3DS_2I9MNT0qx
X-Proofpoint-ORIG-GUID: lUhOjwsomxrAks9R85f3DS_2I9MNT0qx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAzNyBTYWx0ZWRfX2OoAp4GtJigp
 95neR2ltvS/m15Na8nFr4vxGUX7hfQVRa7woYdF/ySSH/67T66iVuoDby58Gh2IKlgc5uB8TMIR
 RSsNoKm0ly6Y/hQ8KynWT7bqb/Q4XYk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230037

The ThinkPad T14s Gen 7 (Snapdragon X2) has an embedded controller at
the same I2C address as the Gen 6 one and reports the same kind of
events, but it talks a different command protocol.

Add a compatible for it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

