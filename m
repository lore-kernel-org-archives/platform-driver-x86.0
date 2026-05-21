Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65B33A984F
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 May 2026 08:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352644; cv=none; b=gFh8RQvvYRVfR0oVTb+MXG3UfmC5ug7iXbzebzEUtPDkjoXB3Y6u2BhvwCr2Y7KJJDX6sIGEEFvPr6odtfWKZ2SFjyjltbTmWN1Gi5iNBfxN9xySaq1Ib6GA2ZpxYo9SoWzkEnJtsnQNuzijzz05YlptUwGPuCb1PYCIyPQ0tp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352644; c=relaxed/simple;
	bh=S6soBSVe9KjUpY4fV3w6m8V++eYkYCwWMWeUkaW05Ts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nVZijjZMvrYib9ay1IxtabG4CMtVItPbHOBqmq6mu6wN62bD89ti2LUlnQsyKtLL8ak5UItO07ErW4QT+dxIfsSgFqI/18zoxNqIioxIWQBT9Ox+6E1HIF95zZBBXnvianM5V8iV594EPnxY8HMXHGSKbSzy0YBvrnh3rdwqwos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=djQmFj4O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g1pm9IoU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="djQmFj4O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g1pm9IoU"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L6LwmF1798400
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 May 2026 08:37:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7/ctKXvDvcUgQZW7V3LpqjnLay8t9Q9hc/bk2yC/dt4=; b=djQmFj4O78Kw61Af
	ZTRwyYsSq1FlwApquXAjrrMNV6MDYgIBSnNZiRtCqTVIosmFcxjAkb1ty/75WjCK
	YhtUfvmst1pJLM3GcrvSe0ezIW7Y50K4lTYcWo33TJohgKYVSUOZ+WkqzTwOCbCo
	gSbIPnGGTI5VqDzxpucso1RxtjGPhan9P3mqO4xk4xxPWE95nTbckAEOX/Nhkh6A
	zpCTWRZMwjoYJuZP0mtrLG2RWeFPWj/XrmkVB+nJYoKeg7L7a3JorUpO1077eV9g
	V9PdzC9QKLJxRsQUorxPcY9EMEzc++ifXfG4xJzguDOQbn218aeX2vyAagWRixO5
	w5qyzg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9dxu41vp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 May 2026 08:37:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-516879bf1a7so158277101cf.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 21 May 2026 01:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779352639; x=1779957439; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7/ctKXvDvcUgQZW7V3LpqjnLay8t9Q9hc/bk2yC/dt4=;
        b=g1pm9IoUkisOblTKuSD5RPORrrWDPsOqAUx0N7Z84R0Zad0jgM5L60FSiwJ15zmL6R
         KIwezllm8VsIzk8OwNd1SYHRJxyu/GexUuiQYyanv3wozeoQVXF2vrs6xcJEr3XRQVCa
         JNWKXehnjEYZayWxtxus4ol7G+3CCBoS7XY9JFlOKDU3Rbg7JVPxphcelxUZ0NCxv+YI
         NmCSGz11wlSJmzPXdyUkAVgLf8yiA0dzq2GDnCWBmTm9d6WJuaO7nH8C117JcKGJcTxt
         B7yWiDSYAUdl74cYAUMfc+Vo520G6r4pOeg5b9PsE3pbmekuVtQQoKf9hMSkGzS+JUrw
         LHBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779352639; x=1779957439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7/ctKXvDvcUgQZW7V3LpqjnLay8t9Q9hc/bk2yC/dt4=;
        b=PxdJTEnLR3k6eevwicgUkNvfN2rZ4xVTWBY5gMUGYs2YQ6Z+mIkLaPJE1le3NK7qZI
         0k64OqbqdUPRMkUpZX3aS6aIMC56W4VnCDOcQu5yj1EjZJyNBjW1OyFiKd1Q79sXAZl+
         Nsg75B7AHXHzYpIzRLQcwGCa+OHFG2pY1ESm1cuhSWP5ZrHZuLtLF5SnuPChugwbE4Bu
         l7ZfAbH/yHktIz0aFxZs34hswSDVQ81C0sPo2uS1a4PFI1q+zxzBt0t8rd0S7Eq5Iu/2
         nIfe5b0ojV3x3pf2M4dbyjCpAIkst2ihBRq8dx2aTaQtm3t2h5vSUKyDZBQOLIV4e6yc
         u6JQ==
X-Forwarded-Encrypted: i=1; AFNElJ+P8+qyEwq0rSq2VY/rbtbSIZ6uSts7B91b1ZF+vMI6OKgVDhrLWS6A4LlCDtRt9K9rcqMldZuqylQYw6Q0CT0bQkY4@vger.kernel.org
X-Gm-Message-State: AOJu0YwRxi3j6atPJ+E7kfwk+ToXhpMy849/y7lvSNxbTXf0VoS7CMGM
	S+bJTMNRb1FCsuxN71AfYY6WvJV2wNS3rZMIFejqCBvvqSeQTvUI+LvoamWBBReZseyMpYcBIUw
	SbKjLbTu+t5spGVZQn8QPdJ+bQS4QM4Vm/FPO7bOhZAecFWh8ukbv4OUSB51U6Cjmugc9Gao+ne
	TK
X-Gm-Gg: Acq92OGE+omwtIxka364c30KXdE0NzeiVESh+0e5wXYfT6d9RVHDL3LEWChIi1C0OWA
	bUiimyeuuZWcNQlXY7YADYbvHNCzg9q2VOLdqZBo9L9jvyRku+gw7YfI0PVIsW0uX2Zv8Onnimd
	n6rLdoZkcuZxglIE6vy9bC2rBK8tnB7o+Lo6DbQY1JqzBAo8BAhR/tHka0WIcLNLKp8LLFpz0wt
	7MTa9ynxrbsx9p5EsQOhDsm9rFTJmpTjtB9ThKh1+lMjYi8Pj6Jgt+FFjNonCyzRUCDQYw3vd8G
	Qs3nJZxzOInlucYmdWkwSs9jQH9ffxBMyfvAQye+nzxBaP5VsFWs6vGkCeC+P/MhejdHBEBA8V1
	gIx5oFezjVoM6hwACcRU2UiksuB+71XvsYzJMvcCBQXGdByazs84=
X-Received: by 2002:a05:622a:8356:b0:516:7a83:8c37 with SMTP id d75a77b69052e-516c551754bmr17064391cf.11.1779352639544;
        Thu, 21 May 2026 01:37:19 -0700 (PDT)
X-Received: by 2002:a05:622a:8356:b0:516:7a83:8c37 with SMTP id d75a77b69052e-516c551754bmr17063841cf.11.1779352638906;
        Thu, 21 May 2026 01:37:18 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm10502405e9.14.2026.05.21.01.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:37:18 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:36:27 +0200
Subject: [PATCH 04/23] pmdomain: imx: fix OF node refcount
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-pdev-fwnode-ref-v1-4-88c324a1b8d2@oss.qualcomm.com>
References: <20260521-pdev-fwnode-ref-v1-0-88c324a1b8d2@oss.qualcomm.com>
In-Reply-To: <20260521-pdev-fwnode-ref-v1-0-88c324a1b8d2@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>,
        Mark Brown <broonie@opensource.wolfsonmicro.com>,
        Thierry Reding <thierry.reding@avionic-design.de>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Matthew Brost <matthew.brost@intel.com>,
        =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Peter Chen <peter.chen@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>, Bin Liu <b-liu@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: brgl@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        driver-core@lists.linux.dev, devicetree@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        iommu@lists.linux.dev, linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, intel-xe@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
        linux-mips@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1152;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=S6soBSVe9KjUpY4fV3w6m8V++eYkYCwWMWeUkaW05Ts=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDsQhtpU/CqYzAaq1jp+LLLiJjIA5Qt/YY/0VT
 S3IUh2uDoyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag7EIQAKCRAFnS7L/zaE
 w1etD/4l9O7wUTmpxjRT+gvruneHUxzYHEIhXscwzHkmXXFaTqlBavoUQKz+sPAmBcudjOXscQZ
 mu4A2CkrCOVZtrepbcDAksLfqo0RIXfw8xZ6iNAc7TSbIK3BuxmxPm9SM9FrlfFCYlcXIlQCPU3
 VVJ56YN3+53SSoxDlaWqJqOl01UWof5ledWKTH8dzoqTxaxB+LlTLL2+tl6wzT1hIGLaHrq0NHx
 bCcVpM4BywkAyrn1olQuZt9D+PmGCR/zu4IqxjWNsg1Ik47sX+JWSrJCCDlVs9WzwSP6edRFsTr
 eWVh9X/z0Zp1hPf5XkuxC8WEE+ciQUi1ZtOFxOUY3Vjfup0mR2EWcJYYwcvH85XbmRz/VZugYMl
 LhAXbqUdasak8C0n65UmlfBHkKOBeIwN23suD7Yx+Q0ORyAUBdEQEp4N7QpNWQpHLr+upEQjLOY
 2MWtqbCVH++FysZ9T8ZwTwT0ndcQDFCyMi2V3eXQjB7KVSGpXFzWPg/SFqJSbL97xhV84W6Izaz
 hKCOM+EEUU296NZs3+u5L2wPfjObJIqYpxM9fKJuc1oRI1cjHoUUBAbdGLhOXXnN62XXTsUqhLm
 zCKbcupHSwPo+aF8UgCOTdYr82ZFVr+ZBQa5PZBJSIY2Wd4qB0rRonQwRh/TRYIARXk9niYp7WR
 TMEzEazWVqpnxdg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MyBTYWx0ZWRfX3Q+lzE2QnFpR
 eHyP3tC8tmlujxLagM9nnXO/PpJQ9k/dfZRqPNb4dWNUPclywZTdBaqIwJRNI1tvRbCNTpoC1YO
 0FuE2aQtpBGOxSR1/MjC0vuwjSepTAPIw1QLTFJUDcbHvRbA2nViCz8A4xkh7RV/Ci58I/VQv0P
 igJp/3GKG5a9pdp9wGWuCGi4t9UpQRxLkuO92gXSYNMuodq8i4cvp5pThbNbXtC2pP1bx6w7AA0
 Gej8zfSWiFabhJ/BKqUFV2LVPwGO8o7XYdI540EaR8yfQ57WXJhapE4qPZobx6zkrSoN3HCeRhu
 ZLveu6RieSUuM+xGtgHCTI4g+QBA7URSqGhBNipuTlWkb6Cq2q4RJvwJLvts2Zy29+MeCbbD9GI
 rXJk4bbArD0ZkhHEvbRfOnVV4OG0ADi+yoX28z5FRCLU2bRi2SCo27hnQkdl6S6ZFvwNzeoDELr
 Xrn/IR1E2RH7dTw3jJg==
X-Authority-Analysis: v=2.4 cv=Zckt8MVA c=1 sm=1 tr=0 ts=6a0ec440 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=3puIpDhKG-71yv69WsIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: tssQ8M_l5CExxRAL2wmzkXT2UlrIGcES
X-Proofpoint-ORIG-GUID: tssQ8M_l5CExxRAL2wmzkXT2UlrIGcES
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210083

for_each_child_of_node_scoped() decrements the reference count of the
nod after each iteration. Assigning it without incrementing the refcount
to a dynamically allocated platform device will result in a double put
in platform_device_release(). Add the missing call to of_node_get().

Cc: stable@vger.kernel.org
Fixes: 3e4d109ee8fc ("pmdomain: imx: gpc: Simplify with scoped for each OF child loop")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pmdomain/imx/gpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
index de695f1944ab31de3d37ce8000d0c577579d64f9..42e50c9b4fb9ffb96a20a462d4eb5168942a893c 100644
--- a/drivers/pmdomain/imx/gpc.c
+++ b/drivers/pmdomain/imx/gpc.c
@@ -487,7 +487,7 @@ static int imx_gpc_probe(struct platform_device *pdev)
 			domain->ipg_rate_mhz = ipg_rate_mhz;
 
 			pd_pdev->dev.parent = &pdev->dev;
-			pd_pdev->dev.of_node = np;
+			pd_pdev->dev.of_node = of_node_get(np);
 			pd_pdev->dev.fwnode = of_fwnode_handle(np);
 
 			ret = platform_device_add(pd_pdev);

-- 
2.47.3

