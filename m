Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA64419FC2
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2026 12:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784205138; cv=none; b=HVJ21BwzcSZaqGwSO6UfEEC0vZq2YZ0AyiPBCTws1iLCOGuTlQvspz1uw5H/yF5wtglJQx+zl/eEW8dcnCfOTzOtdOXUKN49yGdbHK9hdvc1/o7d2XbA2klNHDhzhlN0S4fp2++yFoud2jk4f8/SZ4EWv9YcOV9MSLNs8Y9YDSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784205138; c=relaxed/simple;
	bh=6y0x3dVDg6MbsMReImz9V4/sAZmwhZnLqrvpq5yaKmA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nn5XTEM/IEEhrHOncZQ3XIvyXsXwOIcy6ZEe7w6YilkZtdexH/ZvPXYqgN/hF/O6ZPMb4PxYVc/sSvhD57tMrqKwHtm4MZcjAFDJmbuZi4QrxonIdwKGuWXlmmozhkCmTNT+zvmhOYR7Yod2RPWvAjOtcOFburtkBHFl4mas0IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CRgQrzqk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jAvO3uVk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CRgQrzqk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jAvO3uVk"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GBjBSZ2506769
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2026 12:32:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qpH00IOQaI/bqw5+PSR/7ymija6RdUIbqHVAIBnnA5M=; b=CRgQrzqkesW4oIVV
	7F5rRIcYbXHguAE155t4EsEGyed4PIJd7wvNTKx3WyzV42NKUI+fjrqNFoz2hi8s
	DeoZ0QWzERUbfaSebfpdqIVUcP64kxGyhlM2qYur2YTaPPC+zuBh/FFWi5pdp5uw
	f/S8jHKypi+wYU8alsaEQabyyZOK68kOd6csdaJYkY6PAT8Ll0yovJDve+kojGHZ
	GBRNGxfNto/c6Wy9Zz8SzbCi45LG4qcf/vUKUlx4RJSoBcWeBgrZSVBHx2Fh2Eaq
	b/CsYkB1nNhg9LPoe+jXg+OM7uPL/av1dl1g3dmn7zBMX8VpbjiayLBD5RbDS51i
	5uhETA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feehvbsee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2026 12:32:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1e6f602cso60737681cf.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2026 05:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784205135; x=1784809935; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qpH00IOQaI/bqw5+PSR/7ymija6RdUIbqHVAIBnnA5M=;
        b=jAvO3uVkyNMj3Uunb0x2sfQuMRaxS9jONA4KBJnoB3cEATfnzhk5MNDD17HC/8+jZ9
         bgzknxjW95pcwEThiOvQiUAwCqxUE04Y0jK77gPZZJj2abONgeNMuwjh7XOb8WOK9QcE
         yOrk4z9ROuGDN3aG5bFL9/h9Gy5hc2877j6pm6bSAN2QCrFEpdBat/fPfwL6gdhqHCJ8
         LEIjsEEpPB7iZ3Kym/JgaqE3NC5ipIEgy9ZZQVWm+0kyVvwvaodneN5DcJ4vMRO71m3i
         aEd4fknOxK4iWt5BfM/P1QNVnddb/cNP2p3Mci6k2QgmDGXXeDhT5v0Im5CBB2mQkmkg
         3BFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205135; x=1784809935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qpH00IOQaI/bqw5+PSR/7ymija6RdUIbqHVAIBnnA5M=;
        b=TTuaxdSQ2KdPYyxA9L+fPjOze6OHns01RVS/ZV0s6MlPK4PTtW7K3DoGTeuiDHb2Bz
         yibQvDO+3xAcnwSAI5diVhVugof6a2PvZOkPwklCeWQGHQrJHocBEQfRoAZoYmJbcB01
         jon+xt2zbRDniq8LidEoB9k2c8UOMlivG8+HILRgkjUN21kFYxKb4v/7Er8hFXwIVMnG
         8aKjk1Gb6COvPDEmLgKyOO+8VHkKbi7nQVLcV+/0rsATle+kWpwQiBELnQu3v7bHU5m0
         3f8HFP9wCLkAIFXLBxLLR/JRfAjKdXF95QfDGTq5soXTThPaaxUg6EhOx68uNggu0xw0
         bb4w==
X-Forwarded-Encrypted: i=1; AHgh+RphqWTisyjpJygCd2KMWLuYQkwIO9cfwY4F8gGmYcd/9LeJfkXpT7y+vrfxS8c12nX68tLE03f+i7K/NZ/kE5iBtMt1@vger.kernel.org
X-Gm-Message-State: AOJu0YybbWX560Aw+ZjmYyX3abhtE+CZcNxfsVkem/Ss4n3qJ2ZtAsv5
	6aoLZrKVxEcViqoRTXTmJi2ze07ebpTHo/vugXjeqSs6NBOTqNiIoTNJ4wOGUmN3X6YQURYt3Bz
	nTb7GfWME+vaE7/WkISBkPeuO4C47XfU6vC4uRdSi5fjg6bMPmRf+QRWCR6eJkJSW4kTsmJqQeA
	AE
X-Gm-Gg: AfdE7cksc8Fvuxxoi26EbxyvXGfsHwD5ugEjylmEa/KF0LdHenuEne66SRzW76W/JM8
	c0PeSvZ7LQlfsWMp9+yYIEaoGB/9xa4/zgjZ81Db8bnNGt3CI0srRIiehvmvz5hQXqai3xRnzHY
	4t6HQCVo1P7rjVybH4K5VjqLPq364u4D3o4WpVo74ULRxBUjmPyS9eieHtPhY12ICZwMnJNQSzw
	thji/j9BMBHJ/dkdifJL1BY8OZtShwuKda7ODGe8shjcdRqhfkAY1omV8O/aZjKHL+sjqlTum4F
	56m4PpqAP2nyN6F3O7PJJT5R4HZOLpPAdjrVAEi2mf66ljFvThL9aXiZSxhdwgT/HDG164J77vj
	xnEUdnx7YXlgFC7FVMqgPKKJR5Ck=
X-Received: by 2002:a05:622a:3c6:b0:51c:7b12:1211 with SMTP id d75a77b69052e-51cbf34e7d3mr216004821cf.79.1784205134922;
        Thu, 16 Jul 2026 05:32:14 -0700 (PDT)
X-Received: by 2002:a05:622a:3c6:b0:51c:7b12:1211 with SMTP id d75a77b69052e-51cbf34e7d3mr215997071cf.79.1784205125413;
        Thu, 16 Jul 2026 05:32:05 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:76f:d108:485:5b34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464c7c96sm23766635f8f.33.2026.07.16.05.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 05:32:04 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 14:31:39 +0200
Subject: [PATCH v8 4/5] driver core: platform: unify release path
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-swnode-remove-on-dev-unreg-v8-4-5c2b8cc38c28@oss.qualcomm.com>
References: <20260716-swnode-remove-on-dev-unreg-v8-0-5c2b8cc38c28@oss.qualcomm.com>
In-Reply-To: <20260716-swnode-remove-on-dev-unreg-v8-0-5c2b8cc38c28@oss.qualcomm.com>
To: Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Matthew Brost <matthew.brost@intel.com>,
        =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>
Cc: brgl@kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, driver-core@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1875;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6y0x3dVDg6MbsMReImz9V4/sAZmwhZnLqrvpq5yaKmA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqWM855KGpNaO9QL7bwoMnsMLTBpi+7XZHEziTV
 So+EpZSkbWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaljPOQAKCRAFnS7L/zaE
 w2swD/4+XMquiqrTLlEE5V+DkOFKbQJCB6v3BWln231RiWMUELuGlSJRmxQilk6NjMIEn5Tfi+T
 6M5dx4/ydhrlr7funY+g6Mezl9vYxe5vGVcd9Yk7xCQUufFcK/sWmNhX316m51czITDSwp/Paiw
 WowWE0ebhKwNwQyI5FvAXUn7k5atTt7TBqqhQnXZzlXW5AVW8tGEAsTvaHxaKRKeWCwW4r2Z4Qa
 HZ6eOlJJJkw9DCkrhZKH1vGK6thNPPJp+xKVOCmWL8kD6UEP1zlZrxr4qQXJMkZQ+fUvxDezaTG
 4DyHdpUpOnntHks9d7tM6Tdm3dDc5J6nh4jzJ7Ww5CeKORy9gykBuR6vY7kegnMyqXdMyLic18T
 59NoLcv+7VjkaaQ4kQTSojULBGu5XiGKwpf2tIbWTWfUd4BlSmR1lErbq1FcsbgmiCcC31mSWN0
 wU6/shhVs6OHOr33p9XcPSu5e1C19taokpKDjoxftJcewYCA/7t9BEeF0eOwvEXgGWwSUMDIs07
 YgMJyPe7z5uP5Ckdak9ydbrCvn3A6rwhDThcLp8MA3mezzW3IuH7boUILU+GylTrOZTVpgKdSDG
 g3RL2zMQyWvV2xQJ++dNNd6I4mhYzWYqfgLYJ5fV/Q0aBcT2TJ30ytxbx3rWMzrj0N95kQbcthb
 S5QmZDNmeMuwchA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=ZpDd7d7G c=1 sm=1 tr=0 ts=6a58cf4f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=djyy7gggcHwf4V7r8BUA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX9DtczLSBCguX
 H7Ztc2CagrkTGqLNkDEdOFDuohW/geUQHiU7aSdHbq39KYVLhAuiwDczec1+qKyeHk5yK4MwUi/
 J8aMIX9x2i4EvRGSnJWZBJv00jYG6LACDyYfFLysa//YtdUaf3OVjjFI7mY9AiCljpXH/YBIroR
 fqVbtqWIZenxJoNuKiD/HD45nXCm7mD/IRBjywP+XW3CpkBqGlqnqQIfL2fVRr7niWJeXFopnOi
 uuky5oaxhysfCEMy2y3q3FSdxaALz0JdmMYIFPjaLX43JLNcVRRpHDfaSq8xbyZSp6/QaPu4Hu3
 DF+Nm1kTNEW00TueD/HZZZrCSci7XcvhxIhDk5NhdA19SEffBQ4rynHu4dDdArtwMIqLi873NAE
 A/e3Q2Gv0VmQENlNkS0MjrXC3snAxPEM2NeVcCWTwrFzh7aKwaQb+PK92Q7ox4d5y4+vALzPVDH
 px+tYWTxTVe3whpLmeg==
X-Proofpoint-GUID: dIODNKvT_9Ad4uGjz24TiX_L12-JCAzT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX+7E7cZ3yA220
 qaN07F5xzuf5zoAcPCrHDV5OFGsue37ON/yh9zNA805p1Mf0rW4c2+jAaVXULl3zwiLSj0hA/YJ
 Di/KbEbBrfCS+DKwDBMuwFVpalrm47A=
X-Proofpoint-ORIG-GUID: dIODNKvT_9Ad4uGjz24TiX_L12-JCAzT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160129

With no drivers that manually assign software nodes to platform devices
created with platform_device_alloc(), we can now unify the release path
and remove platform_device_release_full().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/platform.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index fb57d487a6c2aba799b4ca5ccd089006cf2d8bf6..66f9ec73d47e90cecac9217ff6e0f051fea5b057 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -599,19 +599,19 @@ static void platform_device_release(struct device *dev)
 	struct platform_object *pa = container_of(dev, struct platform_object,
 						  pdev.dev);
 
-	fwnode_handle_put(pa->pdev.dev.fwnode);
+	device_remove_software_node(dev);
+	/*
+	 * If the primary firmware node is a software node, its reference count
+	 * was already decreased by the call to device_remove_software_node().
+	 */
+	if (!is_software_node(dev_fwnode(dev)))
+		fwnode_handle_put(pa->pdev.dev.fwnode);
 	kfree(pa->pdev.dev.platform_data);
 	kfree(pa->pdev.mfd_cell);
 	kfree(pa->pdev.resource);
 	kfree(pa);
 }
 
-static void platform_device_release_full(struct device *dev)
-{
-	device_remove_software_node(dev);
-	platform_device_release(dev);
-}
-
 /**
  * platform_device_alloc - create a platform device
  * @name: base name of the device we're adding
@@ -960,8 +960,6 @@ struct platform_device *platform_device_register_full(const struct platform_devi
 		ret = device_add_software_node(&pdev->dev, pdevinfo->swnode);
 		if (ret)
 			goto err;
-
-		pdev->dev.release = platform_device_release_full;
 	} else if (pdevinfo->properties) {
 		ret = device_create_managed_software_node(&pdev->dev,
 							  pdevinfo->properties, NULL);

-- 
2.47.3

