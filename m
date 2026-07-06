Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D258A3DDAE5
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Jul 2026 12:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341968; cv=none; b=F27yl6EgwdM9z8gEKRXnEYDOkjXpA9Y7+jWXrvCNqPzyMFr202dWVip61snyvmc0ftxTJj53evNlEG3IG2ds4xPLa3/KiJ0/BW+zp7+jsR7O2VsbroG7a6MisbNa14vfR1dVrceBnaRxKPQ6Ty0jgQMz7Swdb5oGTgeQR5OIT1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341968; c=relaxed/simple;
	bh=IqF/4dKgB1628r62VJTRc6pv/7HE6yY73nomq/D91IU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZP8UuEoo3kL8meMoLY/sYx9YvyIlilnwdvXjvmbuXj2YJt5ddK8GG7E1nT5380vCHq8y7RQmdyBZwXZYELCpxvDWwGxmcRrQbMmimuA1eXk+H+Q19Hb/Lzv7QM1X0hFn4yoprEm761dUa+Q+0pmwWj6urhaAXz29445/hbQfuBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mJEEF2hq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h6w7B2yC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mJEEF2hq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h6w7B2yC"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxOth174957
	for <platform-driver-x86@vger.kernel.org>; Mon, 6 Jul 2026 12:45:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j94N3D67YZmp+yB/bJ2N7wl2Db8ez4ZkEgubeH9mxnM=; b=mJEEF2hqlR/uOjVJ
	VGxfq6X8Coeflz9gG17PG5AS1d8bsHMFXhdZWsQVpoBGNxPvBhyMKeuA+dyOCDVQ
	f1hfsjqCoXOdNFPJoAu72h5EhTA2RJe8aHAuVR3do6hcY/6XuWdPi5v4ABh+SBK/
	rcNeX0qyntCP4cdXULNVaYmo+GOzB4IXw/vS1gy2FdSZK/epGthEs0eICwD0JDHC
	qLwA7MiAX+whloAu+BOq3pVZA9mRrwwWNHrvcFQktC3WPAB1dKapRcEh1XLp4aGO
	t0DPDKiFYVlnUQvHVG/TurGAk+efJV3NTROGxUtnqQUlu+PHgMshaUYjPMuJ3IBZ
	RMPGMA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxs9ce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 06 Jul 2026 12:45:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e82060977so311810285a.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Jul 2026 05:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783341951; x=1783946751; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j94N3D67YZmp+yB/bJ2N7wl2Db8ez4ZkEgubeH9mxnM=;
        b=h6w7B2yC64hERrSEv3KVmydDBLqbCSiU+R84v4YgZKY6Zn8jToGkof3At0DxnImDAS
         jLayZ53LM6dhN0T4pBFGl8O4aurS3grzb5UbBsi3oKuHYWr9kKwQk9/87dD7rROdzwWm
         a3oC8cZh2JYIe7K7Iq/aOK9BE8lcG0wMVr4OtN2+mLWwiQd/kQIQ4jwPV3fAwHkOk90t
         YRxaeo1Ejx4NgrX2Q49OUU5Kl7t5+467cpuv3OBclUWOm4O9lGhmSrNwdqO+uT6wGPhx
         xRribaQi1/QN+HejfnbbPG45WUs8jFO1g6RdEVLTfUV1B2K9C4Sp+Rw2ViRiVuWJIGqO
         +qyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341951; x=1783946751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j94N3D67YZmp+yB/bJ2N7wl2Db8ez4ZkEgubeH9mxnM=;
        b=pQwQUoRMx70DCTN5icg2KbvD4MmNbK7UNUoN3DS4VwYw926ZMDEh8fdmP+x4ussOzY
         k+tk8dnwjEm2acAQVQRFgQGYHXKibA6QMu2b6KvvKWuiKYVRcVrl96Rbml+68+rvGwZY
         s/KoOu5FfJHCHNHm4ohgVqSsa7eEJedVJshqJDNYf2ZWOPBuGKdA1rgyxYf+OungRJ3m
         CZ3H1xpBg6ONi668tDHj/QbH2cXC6M5uYkOmkKiD2os4+2nRQZ52moa1KqY0drj0lVYV
         GjU4sjjjGZjNtIipxzkkTWBCOjWOxsLxXZY0Yq9WnnrWRTuY4mqgmA2q/WuGwOyMiRDR
         0zwA==
X-Forwarded-Encrypted: i=1; AHgh+Rp3CHv5nT38Thck5sbclLJf1yKqcq++FlqyE/u9vyVT5MDgoX7e1AcGV4qWFmDYRT1+A1OZBGyfMQNwRn5NfjDSYDdi@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5iLnnQBZiya7fOy4urND1fwwdao3LuncBEkr73bJQkRDmNuel
	v0G0J9CbRs2Fc533/ZEpBXVV/haOAHwkrFBRLvKLsp+S4R4byrpC64yNf0/kykZVYubil8PTlry
	3u/j9rNejDAX0+m8yTIKLXGdR47X49Am7ywVqCmqtujd+zkJ3OQQVl9fL8MqGAD4iTxvGSvMxVM
	Gk
X-Gm-Gg: AfdE7ckratcIJ+EP989sHSApIBjeIkmcCzGMgPOFmIyxUCAQqXnMk/wIuRbEz+g4bJh
	N4nY2jaCyX8/p+WtAYEGcbV7GS+4D9cNk1zXEjaWm3NZJ+NYQBHbGEQKTCoripV8zF2g4XBB6F4
	WwEjUNWi02KGQKDTPNa9uvjwh13U2rZG672qr7j6b88xgvQkDJvw62NsMyb0BVn5ilW/Lnm5s9E
	pgI1J63KZ4BaBp8EuXaqM0detIg1pf7UMWCYGVr9hUVNiApgcl/XpMVwpTzWk3PsdUOmtt2weRe
	SO0RI/O0SE/ne73octd6M39POGi1trR4S9pqqeM9VfV8Likly+efCpTmnLCWvIgq1lbYTMwyhip
	WPOr2gEjL1ixQc861TZMY2FcN/K8ZFc4Iy4CnqbXJ
X-Received: by 2002:a05:620a:459f:b0:92e:5b63:224e with SMTP id af79cd13be357-92e8b5049abmr1749180285a.22.1783341951030;
        Mon, 06 Jul 2026 05:45:51 -0700 (PDT)
X-Received: by 2002:a05:620a:459f:b0:92e:5b63:224e with SMTP id af79cd13be357-92e8b5049abmr1749171985a.22.1783341950261;
        Mon, 06 Jul 2026 05:45:50 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm22126539f8f.31.2026.07.06.05.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:45:49 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:44:32 +0200
Subject: [PATCH v3 20/20] driver core: platform: count references to all
 kinds of firmware nodes
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-pdev-fwnode-ref-v3-20-1ff028e33779@oss.qualcomm.com>
References: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
In-Reply-To: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
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
        mfd@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2537;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=IqF/4dKgB1628r62VJTRc6pv/7HE6yY73nomq/D91IU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6M9ruJ8yyUk+I6pdpFWbcAtYm5CgsYvefKU+
 TywqoMuS8KJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakujPQAKCRAFnS7L/zaE
 w0+BD/9zjT3fKJr7/zYP0sHpUApNtRCsyLsJzRKuAlcO+cogBO21GRQk1DGikSTFqOqALVvaQ2g
 83j83HjHg+bMyaUlGN/FEHSMVHmKvXmesanFWRUyj5q/cQcFMH8POK0Xe3edFHZZx4BBkdJLCiU
 YBgV2p9qKU7Yx9ujTc0nbFflTLCPc+KLCa6XMeNIL7NcRgHVvMgBJocHY4ppEVSl3w0N1MqzNLN
 MJ2jEc+08OGTNE6VqBsWKGpcVcsy0c/flgXequGSLwF2lbMvrEVBeckaXblcohUFBgsZTwHIilr
 DuAyyAxwT3CWTsisqCJ/uzziDpBphBHYSMVHgzJR0EvF/dg0gFk2JrYTFDjipwiMhwshuY4pMG6
 brBELDRVNzWmoJxvrqtCNEs2g6/282jmP5bq8VSGXsiFh0Tlh1WMQesFTI3Dru/rc0SNeU4rkul
 wq2awNwyKdDtNJtZDmRz22Vrcbh76dcF1Halbc2omaKC8QdnXDZFTtncn03dXnNqBcF2/RucoRD
 PgoRvdtJOI/EakLR/ayb7hAHHB2aey6mLr7a280QfJRvxTxQ9lcDY4ZxG2oeQyo5EJpmBhQCPl8
 BmnHyLd2X+djvXjF8tGCWMjxCty1aDjcqXp8ApTdwR04CWKI/ZYVFf+bcapravEbsUypfWAAx2W
 0i3DMYG/6NOmHjA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: Dl3BlERV-dIPFxto-8A7_8GP1iVhysOK
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4ba380 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=2sGp0kyKjRk1obZUzdUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX+VYJw7BcHI7z
 yO5tMyjxsA0wabUU59hLxdxKz2uO4Sn9Bjxs7SwzCSLriipu6FaJBIarIiWvSLjM60PZrJka/bV
 ssVRvo9PE2U9w9HnaBx6DCB4eKVXVmc=
X-Proofpoint-GUID: Dl3BlERV-dIPFxto-8A7_8GP1iVhysOK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX5jO2E7ODcPCc
 ytGNAI8UuqCmqyqm7ntZF9zbRGDaM9OAbXCkjjDmdoWSMCYibsw5I+ETe0NXOJ887GeXHCdtyRr
 UHY5pM3VXAB8qqTBqBlurJk+eOTPBMfe2Vc9X/3xViRNHA3vl167UVUNDTN8dXCN38hjLeyv9+n
 wo1hYnED9l+1l9RUfKNnCl4LPw7r2vRSfBqnHkN9DvhDLGV5tCiy5WKqRa9PXxpTGglN926ojck
 j7qLbMrqfDvrxZFyAkPA+8Z/JgwXXtnlJ7tWMhDCLHpyxB/tZIFIcJmwmoIKrn68IIzGfTDwCJM
 23p79MBba8ZafJy4cNf3R5YfBxnLZIOxYwSsmeYpGLHzDuSh+HZ0pAgi8bHgix8W1JYACZHB+AE
 sl0++n6t726xMP5gkLei4HZSYwsizRDl/MhVv+R5KBz4HcJmV6EPnDPdcjpHobd3ZrMwSlVbRj0
 rlm3k6NE6YfqsynZiwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060129

When using platform_device_register_full(), we currently only increase
the reference count of the OF node associated with a platform device. We
symmetrically decrease it in platform_device_release(). With all users in
tree now converted to using provided platform device helpers for
assigning OF and firmware nodes, we can now switch to counting references
of all kinds of firmware nodes.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/platform.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 9357942d0c79b032645035879b2bed3d53305b9f..a71015f1d915340aa01ebfae67196d4d7ccecba8 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -599,7 +599,7 @@ static void platform_device_release(struct device *dev)
 	struct platform_object *pa = container_of(dev, struct platform_object,
 						  pdev.dev);
 
-	of_node_put(pa->pdev.dev.of_node);
+	fwnode_handle_put(pa->pdev.dev.fwnode);
 	kfree(pa->pdev.dev.platform_data);
 	kfree(pa->pdev.mfd_cell);
 	kfree(pa->pdev.resource);
@@ -712,9 +712,7 @@ EXPORT_SYMBOL_GPL(platform_device_add_data);
 void platform_device_set_of_node(struct platform_device *pdev,
 				 struct device_node *np)
 {
-	of_node_put(pdev->dev.of_node);
-	pdev->dev.of_node = of_node_get(np);
-	pdev->dev.fwnode = of_fwnode_handle(np);
+	platform_device_set_fwnode(pdev, of_fwnode_handle(np));
 }
 EXPORT_SYMBOL_GPL(platform_device_set_of_node);
 
@@ -730,10 +728,8 @@ EXPORT_SYMBOL_GPL(platform_device_set_of_node);
 void platform_device_set_fwnode(struct platform_device *pdev,
 				struct fwnode_handle *fwnode)
 {
-	if (is_of_node(fwnode))
-		platform_device_set_of_node(pdev, to_of_node(fwnode));
-	else
-		pdev->dev.fwnode = fwnode;
+	fwnode_handle_put(pdev->dev.fwnode);
+	device_set_node(&pdev->dev, fwnode_handle_get(fwnode));
 }
 EXPORT_SYMBOL_GPL(platform_device_set_fwnode);
 
@@ -928,8 +924,7 @@ struct platform_device *platform_device_register_full(const struct platform_devi
 		return ERR_PTR(-ENOMEM);
 
 	pdev->dev.parent = pdevinfo->parent;
-	pdev->dev.fwnode = pdevinfo->fwnode;
-	pdev->dev.of_node = of_node_get(to_of_node(pdev->dev.fwnode));
+	device_set_node(&pdev->dev, fwnode_handle_get(pdevinfo->fwnode));
 	dev_assign_of_node_reused(&pdev->dev, pdevinfo->of_node_reused);
 
 	if (pdevinfo->dma_mask) {

-- 
2.47.3

