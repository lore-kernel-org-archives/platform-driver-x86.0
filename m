Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8774302EB
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Jul 2026 12:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341922; cv=none; b=V8RDJuBVhWfZNqMxunExOfttifrTjBYO3OkWimHzX8OIt7O8HZ68GC6NR3AN+zidgdqAm6hjYMqsStxgarUxk6AaHn99tje/ia7tl5L1XLc5AuwzgcniwT8WS7toOhVxozCiZ90Mw6MY0TQBXAE1VcDrMo3hh/WGmzTgNGNqtf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341922; c=relaxed/simple;
	bh=Jgf74WxLCxW5Zz726nCnOm1WawVwm90mJr+JyHWzTfo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tCIcNHLozT1B51rnpTBxh2bJiHWvJtf1nkq4k8FHM2tqwPnkVAFs0K4necT/EbY/KJ0hn83u4/ZgpTQwgrfRNYTO3KgmswuQ8OQQVr5HkU1jYEuR9XUWE4L4yyZNyUmkGJrJOxOjN+Sm3/ojCxClW0H7qANw7aMHoDG74cQY5A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pdv8xzeb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YlWKq02o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pdv8xzeb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YlWKq02o"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxJZ9316453
	for <platform-driver-x86@vger.kernel.org>; Mon, 6 Jul 2026 12:45:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4ypedl6lAdelBq6beblP/gtF5+9BXsm+BYvhqSYvSm0=; b=pdv8xzeblN7EO7HG
	FH5xzwmFSqOU2Hgogzz26thWi65+vWdeyuOWD7eOyLyNa29P0b+SaswNqF9kS4FC
	KA1OVnpMYTn/40Nz2pxTYv4trMR0LigFtFqWn5NPzbosdepwcoCO7dLbSdFCU11+
	625Rv+YZ9WtsBt6QnCuBYwmabFKfoYm1Etyt6EIi5GTkcT84WTKLii+0R8U05BkP
	QzADCpTzhPgK8NnvXRccEl/Ux/Y7UZb18sHQKEENYHn17Kvs9gUu8wgAYrYfwdim
	kihEO6nIPf5AxXiTwzdTR5gncp7wXW5IQPREllLfupSbD+sMCFkBnKT21iqYXfA0
	EiG0KQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7h911-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 06 Jul 2026 12:45:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915f6ff639aso543675585a.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Jul 2026 05:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783341907; x=1783946707; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ypedl6lAdelBq6beblP/gtF5+9BXsm+BYvhqSYvSm0=;
        b=YlWKq02oRJMcz/JJrS76k6GCOgDGk8s0AIo51pAHuyGVptlOPrAfBvzbNXulUIgLlX
         87bMj28Wl5fUahUjbv9Xtn8Wf7xk4yAnbFMkfOCS8twqj34OiA8By6Z+RAiYJa7UpqtJ
         w+lvEumbwV16rV7xRgY5wKMK/nveg4evf/5vbe940C5nDjoD0eQr/ZhdjLu/fF8lJNrL
         ZiPFnp6zXfivbpzDjXEQKkLViw0iE5lSEgOT9MI3XKCEbUycKxNYfVLM70dvlAcpBAu1
         UZqvbIExVbHBr9K7Eiay8XwzXd0FzoAa8V8OyMXTSPHNfEUpy4YC+cd4jgOw22MlrbW7
         HSFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341907; x=1783946707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ypedl6lAdelBq6beblP/gtF5+9BXsm+BYvhqSYvSm0=;
        b=IEUyaES2Oi9BIZeFPgctuTUQcRbWw+D4vS++EXwYQw/Y/hacVgFq8cAhvHlQGshh89
         AEs/XAfO91+g8MfnpATpjcqmL64QNg56mO5BzAgiO7sXs8VEr0e9ii9GPzeRq4I7uPq8
         dZ91peC5xBLBSgX5SnWLFT4N3cweByrboFtELp450P1ET+cpbHyNg7hlEN96oJSuIews
         IRgu/ts3g46HIV+HjTqSNZr0ukhNx2pWm03k20l8MOzmlgTT4E/3umGp8oys9LbMfqam
         JPcXavhmkjnIojjwpAB9C/bsFFDY9JtzX4AX/XuiY6+N3Fy/goq+1/64zXezfNnQKrs1
         RFPA==
X-Forwarded-Encrypted: i=1; AHgh+RofpsZjwUTroOkq+UCFG5WZY8C49r/AtcrCdsdIDOog4rpnCbkzg3LT+c2Y2YM+nWXe4j32VFlX/sZSxwfDIn2G0+0R@vger.kernel.org
X-Gm-Message-State: AOJu0YynWG1ZLYZhakrt6wATgV6PEfUNXNDWBWJidmKLlKttic7+LHHo
	x/b+dCFErbq+zcpyF1yfygfSO7Zg8HtY40wo08LibCn0gnag2ieP+PbOKsz1n1LZcNSpZdOuGlA
	K3MOR8BwSsRmuR1fpigcrBeA7S025hoA/bApzI/w4M5VilgJEk+RctYGpB6Cvs0zkoXJ8J96dqh
	hd
X-Gm-Gg: AfdE7cmMjbijqESbXYa8j3JNGYVFBG4IbGSNiZ+jRhuyhW6W5B5XJCWRu2Ko8JAOmqU
	7C/HpyBcie5QXpEPv8jbHgudpRk0dZ7xWTareTwjX8NhIYGlWTF795X2tdD+2P8vp7P2y1MpBx+
	/Xqbe0/GSPUqB1P8msEdfvWt6TE8m7jG5dJ+2YsJZZSC1lRE9A6soRn9bhFxduwmtWO6zs7VtwV
	u/RDJMI/9EyCM5gnjA8RWgACMmsbZmh99JaU9p66GcGvmfKjpq02t1nS++W/LlP5xnUIKEDmcEk
	PNIlfG0Ah1YUV7d4BL+qYTLACmCyVVgKCYiiYfqYbWa9DZzjtqURGwdT7gtXYvBwuc3q99G3fVX
	KUUeSyDqga8JB+KHOipCNDL1vWCBzQSUylndl1VSt
X-Received: by 2002:a05:620a:28d3:b0:92a:e474:92eb with SMTP id af79cd13be357-92ebb58d4c6mr45841785a.55.1783341905994;
        Mon, 06 Jul 2026 05:45:05 -0700 (PDT)
X-Received: by 2002:a05:620a:28d3:b0:92a:e474:92eb with SMTP id af79cd13be357-92ebb58d4c6mr45828885a.55.1783341905233;
        Mon, 06 Jul 2026 05:45:05 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm22126539f8f.31.2026.07.06.05.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:45:04 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:44:17 +0200
Subject: [PATCH v3 05/20] driver core: update kerneldoc for
 platform_device_alloc()
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-pdev-fwnode-ref-v3-5-1ff028e33779@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Manuel Ebner <manuelebner@mailbox.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1416;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Jgf74WxLCxW5Zz726nCnOm1WawVwm90mJr+JyHWzTfo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6Mye7m4WIbR8PkDTH2c4X+IwaDKU66SIcDpL
 mQAGRuCAsaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakujMgAKCRAFnS7L/zaE
 w4ZfEAC41Mo4fJZG469yMU0Of0D0DGwRVaKN4uoZLlhdTRAcVxaepoBujUjtupSZqXiayqNHV5U
 gi5UTfW3wn++NDJyYjf09qZKyCOyEnE/UmdnwGURK5nJ+PshyBSYME0avY5FZHKVYTCIXlPzGqF
 UHC6t7eVnwL46lXo0kHJ7EsWs4t3tAPczpks24WUn0sdkVu3uPWOSTcCd94HIBE4WBs5ytMBh/+
 /FrSJqgIth1+QT2DtNBUdqqbCdI8jabVZp3kRhU2DP/pDsdKfBtljH8QRtloSKXSAddgv+vDvmZ
 5KdXc433Hkh/oTWAw8jbFbKHe67pgQKXGKko6LXTH77itBDpywUUWcIk/qEbCKQgqCku3xTgHZP
 H+H4trXem4YILFtiNbwsiQFtaD9iv124/YqQzguOiNSJYYbneWqaJUXkLzRdiHcklMRySNnUQ1Z
 zzlY+2vbp7eQSY7hvbHjthXmH7V3pryL4Y7yDI+OaiYJcYu8ca/YbMP5Lq2mqASntQtP0qTkBwv
 WlH7HQjT0H2v8cocaoPHpRRmZ6FmkINXxIXvK+awAkiCuscSrZeN9lSC36RmTZANo+qHicYPUm3
 0ymNHLd9ZEW7+c55YFCw8msnV5MMfdIaQF6xsNtguNg6ayHTyrtqvt38bkFvNglpZCmrVFxNFQ6
 Ysws8qDm8bTfJYQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX34OoE856AsEO
 FofPpAy+rfVH1P0Mo9lMLAP/xEA9X0649twmIWG1K0CuT6s2FYZDFEPeJKbSxlGehcXtkDtXyWJ
 +RA2ESRJwHxAlnM55kQCqAVJ1UDWNLGTp9jXXsTYaN+inrHWeatZL+vKf8iwHZBuRiDKV1GzmtM
 9tXaautgw1Qg8segU6XvvrhHq0NghEXuvTHdZUopjyr/FahH4UfK4v4Ixne5EW1lVY7jgxHnE3x
 GcJsScEglK5pJ+fq8YhIm6KXPGfU+fmuyGPWSXj7lcSy8EACXxWj3GG58Uo2LbgixGM2ymQqIdc
 q3BzsVkJ0IXLPrr+CI5+qS5/bjSrgDcbksQN+bfZzKsiUN20k8yCk7/6OyZRqW5y7pJlH5ExIAl
 dr6sV3WeqMqVtqyTZ8GsuKHLy7PZD0DVB8o/nMQo+FgkuOQv1opjrJeRNUtVTyX3cC6RPDPKaHH
 /gU4B8L7h4BvFClBPyw==
X-Proofpoint-ORIG-GUID: DjFdBoPtChWXZ9xmEzYwGrcAo9RNRVwf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX7d+wAxZnRXzl
 ed0SxYU7ZOCY3+T/3T2YyKdvjlL+F2DgQ8Ih01AeqdRKIJCyJg8o7+j4u8nlOC4utqmfLtgbm5/
 XwIXY4J1kecjVAouHBA71IF/gf4tMrg=
X-Proofpoint-GUID: DjFdBoPtChWXZ9xmEzYwGrcAo9RNRVwf
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4ba353 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=b3CbU_ItAAAA:8
 a=EUspDBNiAAAA:8 a=1vxtNpAeqxpoFZHZEuYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Rv2g8BkzVjQTVhhssdqe:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060129

Users of platform_device_alloc() + platform_device_add() must not modify
certain fields of the dynamically created platform device object. Update
the kernel doc to say which fields are affected and which functions to
use.

Suggested-by: Manuel Ebner <manuelebner@mailbox.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/platform.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index f24a5f406746b53ca9eaab9472f6dd1345e04ad6..9357942d0c79b032645035879b2bed3d53305b9f 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -619,6 +619,13 @@ static void platform_device_release_full(struct device *dev)
  *
  * Create a platform device object which can have other objects attached
  * to it, and which will have attached objects freed when it is released.
+ *
+ * The following fields of the dynamically allocated platform device must not
+ * be modified manually: resource, num_resources, dev.platform_data,
+ * dev.of_node and dev.fwnode. Users wishing to do the split platform device
+ * registration with platform_device_alloc() + platform_device_add() are
+ * required to use dedicated helpers for adding resources, platform data or
+ * assigning firmware nodes.
  */
 struct platform_device *platform_device_alloc(const char *name, int id)
 {

-- 
2.47.3

