Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CFC3C344B
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 May 2026 08:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352682; cv=none; b=iTig9XorZy6Sj1bKoxNZy6+7ysfvo0JTm6D1wzkV/yxbMCbP4XPBbgMujAkyGRB6JUcT8LATNwpTsXHOKR+Y9xexy1hnj4zStBt91jPj47lXq4WQrJeHCyldIiS+YqeCgRuo5aH0Gnbwy+UBuMEG6Mv9/l2EQipoaXLa4N3y4Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352682; c=relaxed/simple;
	bh=1m0AW2cExEyKezaoaqpg9M8Sd9W7xIah4eoQaNoNaio=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rvEYHktxFI/5vtL3nEXKs+FIv8LuL3iPco0YJdKnOAc96QhGUgbvl/eKehb43rAuUbQ5xJ8sU/WaRnF64OVFvVMDv78BBsAcbIBFth2PaKYbCZrerOBrVRjok1TJRK9KA1/xJn/KZ+yo6CAm8YZovH33M+X+jQXBiDlz3YFDmwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U38oypav; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WfnrBFU6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U38oypav";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WfnrBFU6"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L8XXeV748732
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 May 2026 08:37:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LiqGJIubV46C/XuNtoDonnq8kzRgQ9Nd2r1gbru07SI=; b=U38oypavBMQHX5RM
	5DGo6FDgcziIR+bFjcD66h11aj4Zak1nBWnsmmy4BL0uNyqk4OOoDi8VlViPoqNz
	gcwUjAXUut08G0bW+Jku6vIOsM7mx3MUO9LbNdjuEZdKCkz3D78xRbBA3XGVKW1N
	+EU8lo1LerY6ObmfBqMRLu64nJzLgMwhgfJh3ZiTCZU2WGPZ8qbTCCKXTru3SBCm
	tmaKbCMYgNpPkycbfHHImPSC1aF1Jexy47T8eyH109lN+2ndPMR1gjwtHffYbIcm
	bX7/IKe7UXVgnq7l0bzp1rMYGM4p3cB0TM4ANHgxZM2WX3OtuoEDEOEn+WBO0Lna
	hdw/gA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9fb6kjbp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 May 2026 08:37:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-516cdd89225so294081cf.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 21 May 2026 01:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779352670; x=1779957470; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LiqGJIubV46C/XuNtoDonnq8kzRgQ9Nd2r1gbru07SI=;
        b=WfnrBFU6dZFOlfQlgTNVhRdesLRgSheSOpve58fLelm8zlgXTVO6tpA9VCWTVpRg/k
         azxIC351RvbmX0nTLel3xhwMzGA2wFIbaJN1mwGuzNVCbUYy3eUXRJNBSAETrzMbJfTX
         I3ikefhSnepQ4trYJIpljEGy7by1aykf4f9paV6C1O7O7XnfuYL3QSAUzaRz1oGmNFbl
         5qac+qlPh7lG2zbErn3jYn+caTqV4e1OA9MGHSWxcktNGfTEyt8YUGRtPZjKHISqBeDj
         tiKQnI6OJpFPMfNJGN2I7kaSfwZGnTyAGDvN3xxuKP2P/OqMkkHS/zdoctHxagnx0vX1
         4l6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779352670; x=1779957470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LiqGJIubV46C/XuNtoDonnq8kzRgQ9Nd2r1gbru07SI=;
        b=W/Ao5z9KmN/JpmMKRbKifBToBfeXA6+PyKueiGYabENXqMhEnLQFfFkNpRC0/TY8nT
         /6AcOl239tb1bQW4X6C9t+7ogtWrIg6dvXkziOm/6SfcLC3zAfDY0zN9V01H84BVrMPZ
         hliwr4bPU6YAvDjJwMbQzJW8yAw0jJps5dqQdQw6AhhLMK2AXhNqRgzE+UH85mc4J4FC
         D2o66F5sEfXV1y5/ys43ubR+AcVJpu2GnpxhnLLXLmoVxbGBV7ax+vlHmqOpeqm+2Cfm
         a5rWX5Cp9MqWZ/MqVLoIt6eE071cs5avrKmuXTlVpwOc/gQm/R00Oj3vQU8CvgHvrRd/
         Yj8A==
X-Forwarded-Encrypted: i=1; AFNElJ8+nRBMBQfjUzu/zzzWrDQwc/SPNdnZ7LNwB9CUmxSm82cWz6LNIY1rCxo53d34gJ33JNd1oh6lULsIEaE98cew8B9H@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5rHHXMF9ZJj/bLXwgWXmOMhHMz9xUWsDtr0QAIYICxKtj4oxl
	/4eIwJJO946gSNN2se+R1WElKIWY0fv/VYcUjc6vCU32HIEReQAbheC2JmffuuxYdicxqlMqHCk
	KnR0kBWTFwH7y0jOCuLWq+nhwvivxyA7lDw+DtaiT+TQQILEk7fpW5McB8Bew19VAjseP2aGfjT
	y8
X-Gm-Gg: Acq92OGRr36w0PnktuHbCDDtG0NycIM41kwca5Lb3wDOZAymgIhUEEPDCD0/b/rOwUa
	mb5/w8Vb20PLomgmy59aQU8zc4utaoIlzVoTuc7cC22tjygSMfGnQwg3CPICcFFITq+3CLnIRWg
	nsg7LK5nUJm2+ZOCOHrc+L15kicwiZhP243mXa/KF/07aZQvuCokkG5Ta8/pmymdsOuJFtLpjJo
	VYOwEV1z5wYPxbHXCOB/u0b0zaLzQOSn7abcG59MQg2Ygz5loBmougcuc8sJQTujOBrm4uj9K8m
	FdmJHQya4K6xWIYbF4pySoXLDxiicDxpZPBtOqpXmHRgGkr3qMOZ0k+2QDHyfXTJ4UKazTfOhTW
	Lh+T8U7gn1R8n+LFcexwab3V+GpEBi0B4WCMa79pA1EDRoe+eL7w=
X-Received: by 2002:a05:622a:4a8b:b0:50d:7f66:dca with SMTP id d75a77b69052e-516c559259cmr24616121cf.33.1779352669649;
        Thu, 21 May 2026 01:37:49 -0700 (PDT)
X-Received: by 2002:a05:622a:4a8b:b0:50d:7f66:dca with SMTP id d75a77b69052e-516c559259cmr24615921cf.33.1779352669133;
        Thu, 21 May 2026 01:37:49 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm10502405e9.14.2026.05.21.01.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:37:48 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:36:37 +0200
Subject: [PATCH 14/23] pmdomain: imx: use platform_device_set_of_node()
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-pdev-fwnode-ref-v1-14-88c324a1b8d2@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=965;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1m0AW2cExEyKezaoaqpg9M8Sd9W7xIah4eoQaNoNaio=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDsQpYiqSx3VXdqiHIpIBUXjGa5jIwrjLGwoyq
 Gc54yDrEJyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag7EKQAKCRAFnS7L/zaE
 w87wD/4ovbkfGrByBExY1MPjO+ImreTVfGSAkWmqsKw88uLrhkyEKGHDAQSZTZE3i+FHGY/E2yW
 vuQTwIIwn0C7jebh/ZrW5OyqlKI4SfaTV8SUVza9v/w9itsoAjqdwFfTCAYtkNU0wl3z6zPIVZW
 eC5a4J3DiTbAuwujwfo0CkVMKKHGy6dNnhLhd3c5wk59h91vvRJDexswgzczEKYHYVvQ5PwEm4e
 1v1iYFCMc+jXWVLyMZMWL3qxn2LKbLI3uzw2KaE5pLc6qjG7WxuULz1fW5kc1tPHEt2UjXdtXoB
 Bu7Z+OiX94cgaD4jcN5Qf59TAYUWoTBWptl6Az7wCYIDSl4Zd4dfb/jPCgTBcEaoQMRxdT7wBp6
 04C+yAy6ZZFgQPV6NKQYtrhr10zYyMFhXjVosvUBV+a6Ji0EiFri1X1eKbRIDWPoxE/pW/NgzA2
 EIK/OJH+xDImj3AWv689ACL46miN6U4MXZhQgeeo20WrtwVz6rOsNHISp9VfDNfODARqNyRDH4y
 gYdC059xHRA7PTGRRZGWyRdRrxEDYxRds5O0j5sxjShEOV3/CBXZC7cr7dJk55o60cuiR1C1RSD
 DTE3n/guGYAoDroJBWU9vFEHo/tJTqZkDlWp9VK5ukHDUrBufG9yMNLg0PxfB2qf+8O/s29Yr1k
 PBNeRIDE8C5ssiQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=do/rzVg4 c=1 sm=1 tr=0 ts=6a0ec45e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=J9-S39C9qTGxOfEZqScA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: UFb7O9G0FmJCi19034ZIClTT1Jl8llz9
X-Proofpoint-GUID: UFb7O9G0FmJCi19034ZIClTT1Jl8llz9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MyBTYWx0ZWRfX+auLQHx4T9cA
 SeHoUps4p1ALjsFmeKRFUVceuQdqTkyOVGa7H2vqZmOuIwFgxuyYBgjz2Az3oOQ7GYw/LPQddg5
 xy2J3z1mW+1qjMNfloFucsrp9RUFL9VcYEK16A8r+38GAzyht4iFMz1m4pe7w2ybeWET1wPi/xU
 qfdcHXgR6pTqfN6pJ9xhtg98eYACgle+CTUHAsttjVoRONxFs4zerlYde222JRRHhEM8jyuluK0
 SzN3fdIeq5aBTxtgCx4J5EON42wpOZN9yVxyokK0W5mxDptZKi2VUxRLu7X/Y0NHyaRIqUiRZla
 89bKRSb8peMVNhj6UxzRSI+AtDWqUVlkHOyqJwsSG2LvBZfzF0mzxF9xf/q39Rkq7ao+DpbAzOs
 ZIYZToxry5mPWcTJSBIJdggfN7rixEQW/xul4g3ja2lJ70unUq9IoJ932/w+jHhEogdx+D7xFEh
 fQCxYKLhqnKrIFskpqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210083

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node for dynamically allocated
platform devices with the provided helper.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pmdomain/imx/gpc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
index 42e50c9b4fb9ffb96a20a462d4eb5168942a893c..abca5f449a226fbae4213926e1395c413160c950 100644
--- a/drivers/pmdomain/imx/gpc.c
+++ b/drivers/pmdomain/imx/gpc.c
@@ -487,8 +487,7 @@ static int imx_gpc_probe(struct platform_device *pdev)
 			domain->ipg_rate_mhz = ipg_rate_mhz;
 
 			pd_pdev->dev.parent = &pdev->dev;
-			pd_pdev->dev.of_node = of_node_get(np);
-			pd_pdev->dev.fwnode = of_fwnode_handle(np);
+			platform_device_set_of_node(pd_pdev, np);
 
 			ret = platform_device_add(pd_pdev);
 			if (ret) {

-- 
2.47.3

