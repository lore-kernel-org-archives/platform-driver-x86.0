Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4623D6CBD
	for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 11:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774956514; cv=none; b=nasg7WE5jkc0nbCR4ask83o+mRgCIRl6QZ+M/9zP/hJ234B5OKrNLuAHTt9Bw5GKuj11ERNpkk2MzDMP+zE9XGW19ceXL4Wjl+S7WFgqTE0ZaYY583gdeJ65dHodZsirQGYJt0oMkamWFyLcDEfFfnO6YYH/wDbaCbxUXDFmIy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774956514; c=relaxed/simple;
	bh=RK2t1pKFRtNmwu/WIPaHJ38FZWmepjffVxLREd7b5ko=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GaYevAJ6FmfFymyJ0aRr/Nv/P5sS1AEXroeOWK0xmR4zw8UvyTcRmfl6cdfpPJudj5+eGI++k831OclWnz5EXeUNIBb2wzm8DEd/Eu8VqbyDrTD+plJxmnaX09wa6suXLAAs/6+EPbmi30tuPNb0XRYPcDoYCsnR66Bf6+4rGjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=puWrgiee; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dSORfYLq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="puWrgiee";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dSORfYLq"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V7OZq52465781
	for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 11:28:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jul1fyfyJgXQHT3WeeT6iMWuXJgDPb+3irV
	gNslEZi8=; b=puWrgieei1c8KimAbXkmNUnPwUbyKyIzBbYF5os+bHbuKf7KTZg
	LvdIDbaNWqE5D6enYXzkvJ4z6GsozE9dHoowzG4yvzLHzyrI47c4Q5KtHIY5R66i
	DDVBpuUYfo71bwGHt5YGj43OFz5BtgfpsEhkWj0wksSbxLAnTymWCPCU3yYdApMI
	PwiNVkTEGLJuHO5oPGJj/w8FBvLPS7Jvryz6+HgyDLJjEjxvY7KWvqFnGqBjk5WF
	iDJOm2NDeEMkbGQfalL8xzqUPh81iz6zuEKj2EkYt6hnYMhlpB7eRjLI4X5uiSgl
	XwAgWtPXCWWTgG1/b/t48xF6mQ7uu1mbYiw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d89ut8yj2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 11:28:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5090bc4823cso41158781cf.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 04:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774956511; x=1775561311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jul1fyfyJgXQHT3WeeT6iMWuXJgDPb+3irVgNslEZi8=;
        b=dSORfYLqiGiO+mpS9G9E8rguOZ/ajb2juvod5B2x3J/koqjkOly2XZnSfQTten8hX+
         9dveLhB1jTtjhFAjK7zgFJT2gMEUdVl4Bpti+8o/t5w3xQE/F86olj0d4zMu0lI6Lnxu
         5Nxl2SheBjjBZw4ur5Wtw/IeEIsT4lXo5UUh8pmN+3jgwE3pg4hYFwNACCq2f3nxygkJ
         J+iceqDw58bspJkOo9MpbS0JzuvtdjmGqYULQtdUQ94JWy8hkL32EBBBVQIcqh4cZR1Y
         nMo3sFwKYHd0lCtnXBNPGvuRmJ7HLiFq+RgsuQxF27qfKLoP2GzoJG5edqaFJbRg24dR
         rjrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774956511; x=1775561311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jul1fyfyJgXQHT3WeeT6iMWuXJgDPb+3irVgNslEZi8=;
        b=E7lm6DmUhxhgoqFzSodZRPwwG5LdMT870vSvuDiRPcA/1MaeCauN7WemQt6eK2xJbe
         TmTw0Cfda11GOm8AWl/5S0FbsPWvW16qXZ8TSX40JC+NrStALy00b1wINkYayQRooq56
         UfzJmgHWwqnUuxPcOf2ofkOp0bLDN2CojwW4+Clko6+JDEoHXd+SrI2k7QXS4P0e+q56
         J6qFH8C0HprmHpcDupShFsQ40Ds9I62ZDIlljnLpOfCEdZQxi7ecP0f6KLGUU3gq81R3
         UIsKPh2kwiTxcwFjG8tq78H75CzAvKZh6lhFh373Wz4H+F3JvX4VSz+ht4kGivCU2Vuu
         LU1Q==
X-Gm-Message-State: AOJu0YwSGpA75kajFKFXOZ4O1VHu9kum+vluZmHQ5vZywEzcSczkXlFP
	9wxVIe7l72q8PbNSdrg7GqLAEe1XsPW1OIvUGwsbZCfQwwHJ3oEDSel474olgsQmfGf3B7g3Eba
	tBu82htOEvkirdX6WCgjLQn+lnqR0Pahh7WKKPH2OtmNXMuZidyMnTXnGwFO/bNBpEG9WMJfrvg
	pJ
X-Gm-Gg: ATEYQzyg48GQFG7ntqdhNLyE8kzwCBoGpVI9a3e6+Q2+Pz4kPvndsJqe4qz49i/YvCU
	o9yzi8BxJ4ZOcygAZkyLpc39goqPurw7w2p4wadrTM6mXY95CC/kPN2w8f5hk/QMXraT1saeU0u
	v6jG/zG3OLWb2Yl8CXG++krBBkLc4u4mJZY0xSF3VKFfzUgbULFylloryEH8koMukhNin3LiLD0
	R3XPza9PjarGGUhv/OuaCgnlWbAHvwNmDDiwcnymvtCjxXGUkTQMMfDEIbnj7lis02qq1MXrulI
	5fDHp08qARXUyxog0BqxgY47ST1OPwKvanL89HU2uPevpp7Y1xNn1U0UpSkgl6dQuRJ+5qMbtu2
	1rjTJGKv+FmKDqb5ZPHBOWFTlnrsBdn5KlCoGp80kYnvccjR2XAY=
X-Received: by 2002:a05:622a:5594:b0:50b:2eef:c8ff with SMTP id d75a77b69052e-50ba3979a97mr216949261cf.61.1774956511380;
        Tue, 31 Mar 2026 04:28:31 -0700 (PDT)
X-Received: by 2002:a05:622a:5594:b0:50b:2eef:c8ff with SMTP id d75a77b69052e-50ba3979a97mr216948931cf.61.1774956510981;
        Tue, 31 Mar 2026 04:28:30 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:9819:4633:e2d9:81de])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf2463dc2sm26867814f8f.23.2026.03.31.04.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 04:28:30 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Santosh Kumar Yadav <santoshkumar.yadav@barco.com>,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH] platform/x86: barco-p50-gpio: attach software node to its target GPIO device
Date: Tue, 31 Mar 2026 13:28:19 +0200
Message-ID: <20260331112819.103298-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: NhP7apdkU1cVsm6YfCctj1pQ1x777Ex0
X-Authority-Analysis: v=2.4 cv=C5LkCAP+ c=1 sm=1 tr=0 ts=69cbafdf cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=0WlOheyDy-9tpDSe230A:9
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: NhP7apdkU1cVsm6YfCctj1pQ1x777Ex0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDExMSBTYWx0ZWRfX9HpKYi/+xuWJ
 xtVGcjf/9VHgD+EIvzAxV1qv7ajMfW4W6eGH+Gj7wGbPxhWfqrezfm2nf3RB0AHPOMUkIyMOTFW
 HkmAq/nj4G0oQw/JDQWERLZR0yfyvi8BDWhfOVImB1NG5UgHfAGPRAsa2Mju5bEM10yKLnP76Oa
 JWIHX54giU5R4Utf7mHqk1OGkX/PbMu9+Q+BQ4pPiwycuK5+qU4R18/GddPpsbDJGVWAbfkslvB
 YzqSlEGub+J1EkndbkX5yCiI0Y+8osbNf0kyEkgE0yFpVYgitMN2uNnmGJGzUeDOk/QfIaG7ThH
 EHPxMHfjuvTdbDNxGaiT1NtMEprfj6Aw2e/Sp4lmp2886LiMqzVbjbZE4GlomSHikTxP4KI8dr3
 YkB6l3x2ijmyXeewQWoSELypyLnsEJvD3xYV5B2Gz5r+3Ub0IBTeF4AHIf9zK5qfJ2ErJMr9PsL
 7iUKrFUiFXZ+fDlTFTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310111

The software node representing the GPIO controller to consumers is
"dangling": it's not really attached to the device. The GPIO lookup
relies on matching the name of the node to the chip's label. Set it as
the secondary firmware node of the platform device to enable proper
fwnode-based GPIO lookup.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/platform/x86/barco-p50-gpio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/barco-p50-gpio.c b/drivers/platform/x86/barco-p50-gpio.c
index 2a6d8607c402..5f4ffa584295 100644
--- a/drivers/platform/x86/barco-p50-gpio.c
+++ b/drivers/platform/x86/barco-p50-gpio.c
@@ -365,6 +365,8 @@ static int p50_gpio_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "failed to register software nodes");
 
+	set_secondary_fwnode(&pdev->dev, software_node_fwnode(&gpiochip_node));
+
 	led_info.fwnode = software_node_fwnode(&gpio_leds_node);
 	p50->leds_pdev = platform_device_register_full(&led_info);
 	if (IS_ERR(p50->leds_pdev)) {
-- 
2.47.3

