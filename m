Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF615397E80
	for <platform-driver-x86@vger.kernel.org>; Tue,  7 Jul 2026 19:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783452161; cv=none; b=o9STcKF7LArEAxwZxpHZCvhD8HuZ5xBoxXFxWARO/OFdDyY4LxWwQuBamyCdDWdRG7aQ7aUE+suINrMN5KlqiDyDP1L3DHWIpm21XDKeUYpI8pLV/P2eVHTyrQ9yRv4OqISm4OYrtC3B2DhsOQ7CEMsUsNe+LorwClHwkSXM12g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783452161; c=relaxed/simple;
	bh=1Fs8N6cwVTIWmqFAeyUCV1zMsM4ASCH5uF4rAKhciGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CIX9oKYOV9CugOrk4mdJexamzpkKHEm0J8FUJcmrtWh4EWbZUazLYybYKm6OemmRri8vcLpgvVnqfHbd4ZqPuQLr62l6ULC2TehQ1ZVOEHSo2B2i+EfTvsQ7EyPBvd/uzuB0tuF3mZsLKcBG3TY2vhQdwx+YtvBvEY9+nGv27xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aWLEYor4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ayvj4HNZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aWLEYor4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ayvj4HNZ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J5dk3296075
	for <platform-driver-x86@vger.kernel.org>; Tue, 7 Jul 2026 19:22:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=l75MTQkX1SP
	NVbC3FrGgp64H9ib1BWH42DZHDWg2If8=; b=aWLEYor4HwInbMYms63/SrUsl7J
	evpOBhxgeGOmRLJ2H2oyR51YocdgARUxI0SEpYspZbM2xBOBnOu5EGB5O/+YMQz9
	tMiXTz4DWsd6k0VSoycA6Z7RKEWOvMgf7sIvUcgFpcJLjMFTGaapXCH2mKxDW1y0
	4JVTyHXJRThnA2gieFSKRVcpmMDP03+9Irgen17Bd38kNeyHalFufDXitw8ORvVg
	N2MDnD2cgLByI3eOuyfEXsm5FRRul2VihM5TdbODfBl7bGYzl9ApjydQyyTDti9P
	IMZhN4xnMW8ZzCYygJqr8221DmilU3UVqLmpzUM/13vEZ1Gbh3zlXsWqVqA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8su73tf9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 07 Jul 2026 19:22:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51a8db414c7so62543781cf.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Jul 2026 12:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783452158; x=1784056958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l75MTQkX1SPNVbC3FrGgp64H9ib1BWH42DZHDWg2If8=;
        b=ayvj4HNZxZSMp5s3w1aPP6I5zvfGv81bUtq1lH9lDKMR1siOaj9TJt30R275g5oBwd
         sw95KENczLEjudrhBJCeT4OlnP5KCxET3bJNws2uSRlXlb8woP1jbEgPLM/014fOvyNx
         kDOOyB4/1zCqipbChKHcrDCCrWFfu+l9uhitCt7qQ1DjyRTzRtQeoEY69umrJpxI64A0
         5sw0uquDMfllwVNYczui94C/lXrbcrYvu4qYmWt4lkijBojvIXk/cWVpUpo4y3+vUchO
         jhCu+UxKDzs0cANvK3eMmVuh3q4fbHvqQIhseYoJLWrFmQqTVjDAiIyShi7vFZy58qWl
         20DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783452158; x=1784056958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l75MTQkX1SPNVbC3FrGgp64H9ib1BWH42DZHDWg2If8=;
        b=jR9qVBX6yxAQerOIm2LLm+2/GdrV5ren483CKG/SpDXsbJ58tJK+5tX+f1zk8Nj/Mo
         LTn0nCBAkb7y9pgJu5Va2iCG2CVTkbJKCjTOfsPcpYtxuKvi3/9glFnfKP2+7xAmo5Qg
         6waKwv2Jj1nJMlZ0XJhfS8hD6eb5OgT7ezZEfI+eTgc9Lme+bbQD7BA8c+9AdQCXPui8
         28s7eu6nkGmokiz7+YXF7rTr8hdGDMP1T1ZovKr5rTMbH9Wd2Oj3/T7UfG87z7I4eqfF
         CG3VnXSiFZx/I8e4fMsXz3vuFAYmzKn5rF7iZ2HAciGXEZW+6iirBiMXUlpn2OPTqSrt
         8Aqg==
X-Forwarded-Encrypted: i=1; AHgh+Roy+1Ybg81Rt2NlfA2W9HeJe3A5LYjiT4XmCh0YLgoIs5NECjb6fYldWn6ukfMhHy2CSMLi5j/G8f1Q8eXhA0i7fvNq@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/FliXS/GkR2v2+8FtLj5j1cgHXMs+ME07YZXz/nA24ex+NGzY
	eXJ61H75TwcekxG3oek0Ge7dzEg54oxgLfaflSir28r/p1r5ybEmYcFn/fRI/hvTiJVNry9hy0x
	L1g3x44I3pNqfW4uGN/wJMch/IQ1dpCEUy7R1cDn6iTFTDEOkvt76YiJlYGYYGBiVQh7gqZXk53
	W+
X-Gm-Gg: AfdE7cnCDKgAX3CxaqiUdJIdN266jFzagje4EQ5apwoODTMqT76RSw+qlh6BxSeygjW
	/ZNYuS59Ib1TPZ+ZnQMuAKDVlNYx4RXHaZrOVf1+YwLdx2torm++1HxoPgeGQOU+Iv8Zujgv4ob
	l3v+TAaM1Rnu9MafmJPiyknyRCXlBMW88fyKVLmAXJ1wfpJuQoFuykzMhSdk+bwg0tQhO4/Vu/v
	CGYsyJU+k4bYmf9ceQuKMCOSo1ruY9Vmjbf4GOj/jLcStsmmAvOqR3mhFjn1UG+KMODL+8oBINW
	e43Dvry8Zt/rp1a92EBl4bHBiXJenoDYXcmP6+oDbm/9PhIjiqH4n/MD4dMpLhloPrGcP0Ao1GD
	8yULKEqgilk4DtM8S8i0CzUAwqIquylG4RL1uLMa+Ws8=
X-Received: by 2002:a05:622a:252:b0:51a:8c9a:8fad with SMTP id d75a77b69052e-51c748af94dmr72264961cf.62.1783452153209;
        Tue, 07 Jul 2026 12:22:33 -0700 (PDT)
X-Received: by 2002:a05:622a:252:b0:51a:8c9a:8fad with SMTP id d75a77b69052e-51c748af94dmr72264601cf.62.1783452152846;
        Tue, 07 Jul 2026 12:22:32 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:8029:bbc1:63:ed84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f3677asm70025515e9.4.2026.07.07.12.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 12:22:32 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
Subject: [PATCH v6 1/3] dt-bindings: embedded-controller: Add Lenovo ThinkPad T14s thermal sensor provider support
Date: Tue,  7 Jul 2026 21:22:26 +0200
Message-ID: <20260707192228.14647-2-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260707192228.14647-1-daniel.lezcano@oss.qualcomm.com>
References: <20260707192228.14647-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE4OSBTYWx0ZWRfX1J6+gT8nrlwn
 VvHPzLXf9CjH+XKJZUXGr7U0koKUFoj1hWawdLpjFWghdG7+QX0GfpPFX8II00tkB298NyDYBSv
 C37BwOSaqohwOZjXj2lNQayMKDbGDK6EKIqz2qfsY+IRwYXryR1Od8b+Ii45HRlmDVbowTBjB4O
 gkYZSzNbZ7LC2mfzsLS36E71jyuv2xWdtX3ZSTyfaLde+16cAkcya7aE/rRwQq2aBEFTmZpsBUV
 OHhoJk7cPWDOthsEAPsDPTXd7b1dmjYsyPfdosItT6pnsJLRDjCaqOTUmyVq56+TxfxJMBoOAim
 gs7kftGyi3hPwn6aHCHYwWBDRvdgIM7tBOstQLfJNz3xiF22Cw6o0RDIh3wtdrsz77cAE23CMAI
 0KdGaNPDnxbwKN8VqWEKqpkmNTzJbqRjtzJp+gYP+Ta9kvM5OyoyZqsDObXKKqkec4uJcCjffS8
 ZggCZBcF2nat7M14bbg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE4OSBTYWx0ZWRfX8gXHTAPJoWQz
 2Snf6NgQ41sA4i9nryTNdrhkzo54vyvXOteJ6vePc0vMiC8rXmTbJKGDpz7FZgT2+C+2u4GAUOV
 /0vaXk7JrCBgHwFAMTZd5UKg9jCkYkQ=
X-Proofpoint-GUID: Y0YzesxuzKYlr42GUU16A0-PhfntmtF0
X-Proofpoint-ORIG-GUID: Y0YzesxuzKYlr42GUU16A0-PhfntmtF0
X-Authority-Analysis: v=2.4 cv=HN7z0Itv c=1 sm=1 tr=0 ts=6a4d51ff cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=s6oxFZdllmZqp78XS98A:9
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070189

Document the Lenovo ThinkPad T14s Embedded Controller as a thermal
sensor provider by adding the '#thermal-sensor-cells' property.

This allows the EC temperature sensors to be referenced from thermal
zones in the device tree.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 .../bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
index c87ccb5b3086..f677966b52a8 100644
--- a/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
+++ b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
@@ -26,6 +26,9 @@ properties:
 
   wakeup-source: true
 
+  "#thermal-sensor-cells":
+    const: 1
+
 required:
   - compatible
   - reg
@@ -45,6 +48,7 @@ examples:
             reg = <0x28>;
             interrupts-extended = <&tlmm 66 IRQ_TYPE_LEVEL_LOW>;
             wakeup-source;
+            #thermal-sensor-cells = <1>;
         };
     };
 ...
-- 
2.53.0

