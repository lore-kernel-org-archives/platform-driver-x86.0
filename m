Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6628A386C08
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Jul 2026 18:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783363638; cv=none; b=j6/Cft2AsaMjpPkiAAAl5eIpNBjDujj3vBNwSLzfRaVEuEvj2H8SZpj3E505YaYoj2xdjHdJMi/iZ6vQJN9xHxfEKbkRvV1zo/2hoEQqL0TRBtXew5DS0xSXdgwzT1mwNUzZ3HZ6aQGENU3nbBpw3yoz+XJMx1HxYX1EQ7m9Y90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783363638; c=relaxed/simple;
	bh=qL9Yfw+uc5wo1DAwxzgU/wU7crRPW50fgGfVTdimoUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gH7mcfViGRxExjTBips0fCmd08uf0tqZtuUWE+RIphxqtkrtDGBrk/MaA1CPkifNLfAJRmOgtVgZINQGa/appVt887kXt4xCPoepB3WCT1QCu97VWzm2EjW1x6R8IOxPRnAjqw+ly2jDuP7yBHSXTR5WeM301SvoHi/iWxzX7+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VlLc2xdd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=br91QniJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VlLc2xdd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="br91QniJ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFDow972291
	for <platform-driver-x86@vger.kernel.org>; Mon, 6 Jul 2026 18:47:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EVhvcgnKY9L
	yRKg+mffxnRd38kGleBy0v6Ff7TCPbc4=; b=VlLc2xddVMH1DBuG7s4kdeTIyoP
	Za3yAMH+EL2nFHRwzCF69oo/wQ9MuFIdWpHteL/m4KWzH33zEfYBzqpYW6PkLUtY
	NilSAJ0e6OD/JtLPYKrPE6U1HniJ59IGn9CpRV7va2FgAunPXhHlqn1OtdoE/W2a
	UqME0Znd5dky0XsBOIMQh5G8Omv4Z+2nCDWYCxE9A4O6gQvm6NH5Uy2kghnhqVVW
	e3lT5l7O5GhRh7D+EpyvhyXm73Cr7Z3Ga42/NI3gVVfKOToGBRwwzbdXaoDNw47A
	TGIemXWE8E0NNYp6XN2llYd/CnZrHrP9vGI0JXQXbAh+VzavWw2MnQjOmhQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r2c3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 06 Jul 2026 18:47:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e53b8a302so317986485a.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Jul 2026 11:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783363633; x=1783968433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EVhvcgnKY9LyRKg+mffxnRd38kGleBy0v6Ff7TCPbc4=;
        b=br91QniJxRD6R7C3gB3JJHtw0MHvO+UTPL2L3A8GseArWM485ETQCqtufC6mf8Y7we
         5XR2cAkkChV1hYgjCRewy/UxDKHfCw2tA7wfi+tYK9Ijhzk+HmnIDI2bQmM2f6ApA6hZ
         Y85i9j9vI40vCdHmteSt8d/c/4D5zPa9qduo9U/k4UIbopQBImhjgVV5op/Xb2B5GtHD
         esGQy/olIkxfvTzlMIjqqkV7K1okBxXW86FfeMSZh2nM3N8wwBNzAxDk3eO9VEZufMsI
         NxxrfQyTIcFuiQO4j8U79VYBTOx5QK3POv0n8Lq+g0/Hk3kvUI12M/C9itCzvWeaQDwi
         ciiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783363633; x=1783968433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EVhvcgnKY9LyRKg+mffxnRd38kGleBy0v6Ff7TCPbc4=;
        b=KHu8ZhgwgirK0bgHMD8cBEvpf+dbiWRos6Mbl5U+hacyLQeinIAHsPi8feWNdgcfrf
         vSr9DpqS/x1LbxAo5ZuaV6tcWiiBSmsSt2PJYXlrz1cAgF877deo0qNY7OYByrAunLda
         n3YsppMxzSMkITM23WFHdH1THt5Gcg/urLeARQZ8Ol7VGGcFJmkxRWfB1FLDvdLJejmn
         53VRUIIrBy9Bke4Fp88ASIovaP2U+bGW0MtrEi4RgUnYRtyIDJnX5XE2G6yoK5J5Ky8e
         SUrh9jvrvU1XdYO/ui7XcH9Yp+yXVU3ZCbk/EijXuvMX5FAn/bNxFt094AIFVlaN81Tk
         tqJA==
X-Forwarded-Encrypted: i=1; AHgh+RpeyEfUPLOfDoNIsQBTchRjBYfgUo4F80h/BJYPnT94jAKqJcVTjOutUK9L+2zB0N9z14hzGzBANrGlWA8+rRthzcwJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+58xvHjTs1XaR/0Wp5sBZ+8f1UeGEfGbsmTTiWyrU2IsVbvMk
	9VrczhyxUdnzIeWlLU37snGrt/MFjyG5iW2hRDERpMFk5BKv6y4dEuykt4Sciybd5pf+9Bpoe0M
	RsALHRqo7ZXaa/vV1+HkL6xGhhM8f/oazJye9UN7MztP0EIXz3ipCJcbbHQoCTvsHi0f+Oc1sQo
	dk
X-Gm-Gg: AfdE7ckSvpc5QHX4h4fSpqctVmRcvdRmnNx7DxKtV3r4cjlqUzunnK31jIISN41SIvx
	uYJ5QiKuc3oFgCBx5roRoSyW0C4zFaJ/fKda+nHn88SjYq3tANc0McU+dhJMoscnCQIYUAkAXXE
	S+uPUWVbQsGOoL5J7xSe67Sj/GbJrqnLNBXMSpWVGcEKyBvwbF1EHosRUl6m6PWsRsk0FW5n1Gk
	X/zVkLOW6U8sV1MwWtxYYnfLgNaIbx/COwTmaqLfif28YlTDFYHF9pkVfjvWeuOQT8sN1Svi9sh
	zxLYnTfjhGt47LOkvAMLAIzp0K6gHpG1Y8Zf5j4F5vR4QBIDh9TXkCSxVIiWyU22KIUrhx/14D8
	ahPGPfmlXqOiMHYmoMQhvgF5tyA4JWAna8T9/5r/qFejwVQ==
X-Received: by 2002:a05:620a:40c7:b0:92e:4a4a:4478 with SMTP id af79cd13be357-92ebb575ad4mr257500285a.31.1783363632917;
        Mon, 06 Jul 2026 11:47:12 -0700 (PDT)
X-Received: by 2002:a05:620a:40c7:b0:92e:4a4a:4478 with SMTP id af79cd13be357-92ebb575ad4mr257495985a.31.1783363632460;
        Mon, 06 Jul 2026 11:47:12 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:b077:843a:5587:be05])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0078d56sm3858625e9.8.2026.07.06.11.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 11:47:09 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
Subject: [PATCH v5 1/3] dt-bindings: embedded-controller: Add Lenovo ThinkPad T14s thermal sensor provider support
Date: Mon,  6 Jul 2026 20:46:46 +0200
Message-ID: <20260706184648.35613-2-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706184648.35613-1-daniel.lezcano@oss.qualcomm.com>
References: <20260706184648.35613-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE4OSBTYWx0ZWRfXxE4UGz98Yj2w
 YPxo86qLV7jqx0W4d1kYxwz8bGJAZ5etuOpOAYU1iRTdK3nSUOcNVQMBL62WH62FGTFQbIulxNB
 bH+EWee8ZeherPCBaExJkJQUO1r8ZvhmZFQP9g+7tAtOGXg09fpx+hjJ1jmvQArU+wnnYKDgqBh
 WaOsgLphc7gqUdN/gQ2XrcXJGrlSynjkW6BgvUzX2bnYgjCNNI4fTWYGXhSTCRJCH0q/BdVU5BN
 PQedPL1ycUUTot76xQpcgWJkJOw6B6RSAwx5s87FIky2GJXSm3CJkLjxhJ2eEODoF/DF8Mq4UQq
 SlBBT2gzNIgdyqXgGbWEBo/CXja4gabjJ03UEyk5fdGcJC7BP71XPt2jT5ExCtSPetOlGia0LOb
 HbJKhegC+uU1J4TfW2csMeLZz8wg5hVYTHdKuUTlrQALuZ8NUyTWhUOhvABT4T0gcpwvA16rAMr
 uSvqHwlTWVbreE3Pk2A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE4OSBTYWx0ZWRfX/UUoL/bEK7PV
 uvssglP13RFs2m2TbNVhh4bpA2J+OdvDWGwonzMqDEP1xcDJTCOnme+4ZCnBlKfgfCaCUOLgE2u
 TGupvt8dPBohJsgfhYK/NuVpDglCNDE=
X-Proofpoint-GUID: XV3iCx8Xp-NXwqMNnbFTW0yu9qXmcFQ8
X-Proofpoint-ORIG-GUID: XV3iCx8Xp-NXwqMNnbFTW0yu9qXmcFQ8
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4bf831 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=s6oxFZdllmZqp78XS98A:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060189

Document the Lenovo ThinkPad T14s Embedded Controller as a thermal
sensor provider by adding the '#thermal-sensor-cells' property.

This allows the EC temperature sensors to be referenced from thermal
zones in the device tree.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 .../embedded-controller/lenovo,thinkpad-t14s-ec.yaml         | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
index c87ccb5b3086..0d049979e35b 100644
--- a/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
+++ b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
@@ -26,10 +26,14 @@ properties:
 
   wakeup-source: true
 
+  "#thermal-sensor-cells":
+    const: 1
+
 required:
   - compatible
   - reg
   - interrupts
+  - "#thermal-sensor-cells"
 
 additionalProperties: false
 
@@ -45,6 +49,7 @@ examples:
             reg = <0x28>;
             interrupts-extended = <&tlmm 66 IRQ_TYPE_LEVEL_LOW>;
             wakeup-source;
+            #thermal-sensor-cells = <1>;
         };
     };
 ...
-- 
2.53.0

