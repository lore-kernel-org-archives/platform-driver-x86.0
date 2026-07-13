Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC817377EC3
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 15:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783955547; cv=none; b=a5t4+v0txmZNILlDwxeXYZajCvM7ZeOC+1CUNbNoHeF2JTCnJPuU1NiwWALdYr1PJQhhibAb3RLU3WiJ9Y0kgnPNjK0xQMXYWSHXPV7y09uX2q1UgXWhMylGri/EnuS35quUE+HkhLqGGh5XsOqeBTGdSskjEh4ew4zzwy9Z0U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783955547; c=relaxed/simple;
	bh=sfNhb2R8s/6yKt4BPY7jMkwV/kl2zg5+s7lGbts3IxA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ROeKbgmZ8mb2f/2xI81EBHwkwMONdudsagc8oRTIJRlOoIm+jANYnEOvItax+aYxUseYb6Iei062d5QsBXFmpGwbgX7dNbmcfJZnRybP90fnCH1BY+NAdmCUg5oOZIqYVUUd+3PAHOuskLZLfS2h+Wpsj0Tf26h99dVjdSxYb7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fk86STtQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QLflJ6wN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fk86STtQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QLflJ6wN"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DF86P61734676
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 15:12:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tVr5dRf8jqbsYQUjS230GnPY/TS/CzublqdJwnQejdE=; b=Fk86STtQkF1LD7T2
	ihKoY74MW02xYdI+Hk3AArC5I0aBw72cFqVeGI6Qn8XQQhNBU0PXYHompsgzaeFO
	2f5Shemhn0w7N8qTh73P3HxuvpxIPIc7IO7P3fGWCLhJtxk3hTbbF5Hi4yXOidRJ
	TDHh7GdjVbHV8TClwkoNhrFuT85q33+B4g2JcX+jWsZKVK1YEntkXo3tWFJfoj/c
	VmavKg0PZKQyc6jo+rv+aROR5Jq9ZoWmwWPXP0uSYzKAUw6h/XL0TfbxPJHtGeDb
	p0wsm7xkr1uKryrOjfPYsdr74QXrkPGe9+jAr4yDumT/5JVLL8eCd21QyhARa5jt
	gzpijA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fctc8j6g2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 15:12:25 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f1e4e0eac1so47657926d6.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 08:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783955544; x=1784560344; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tVr5dRf8jqbsYQUjS230GnPY/TS/CzublqdJwnQejdE=;
        b=QLflJ6wNydjb9dBEQs91slzDDVmWKoyLc7hLU4LWqUBFptKHk0VYVUTiLRo/md+596
         ALj7LzcmMoYK8bUIanroGG1nnaaFaRjjy9pCtTm2blAvkTY7JfDvS0HWnA9bbKuHxbOi
         pT7TiMqNhbUqGEoZzUwDG+HBkl+7u/l0y2znDuCQBgvnZ7FyKON90ILRSuTEynb4wsa3
         avNk66l9bLj5643v4EFPFZ9vQLsrA9Fa4lLgzGz5lJpMu7gKdNEQOD7lMf5lS1Gn57pQ
         Ew8BFo33Jw2KnvGpqOVx8kFdC8mknPCEMpvoOw/3OQX4uGqPeBSLidqn0MtMeWUebXka
         FDog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783955544; x=1784560344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tVr5dRf8jqbsYQUjS230GnPY/TS/CzublqdJwnQejdE=;
        b=h69PmvGxnnIRxfD5N35gTC8kOAWNN8ijIiLOqfqfsR9kz+NW1d09ZZhpuZ0HyjWN2N
         F4NutFZACnGUiLa/baoNO3Gz/PpBORHfX4sbnG8DqBfxt0vnO+qflo1nNcYYMIozOnRe
         sguY1DzfofBkTr4w1Z/I30fqTGiEGEk8XJQ4OogK503xs7H9g0XszhgkBsb93TnP7Dzu
         ks8nWnzSuTsvsU/P3WIEu9z6v2WiRQmfAy/TF83xS18TX2INADSDE/pxqh6ovpJCxoLm
         kd4ATNjMqWmqOQ69M684ULtd0fJ/SD21ntZDGuaBb/LXdAM0lcwI1L9nD9wd1PpiJiVs
         6HEQ==
X-Forwarded-Encrypted: i=1; AHgh+RqvS6zzGuAPNEm22PavnImkZoL6nXFrF6tueHTjHIZxNOHSpRgtvoA2dXgz+O2iIPV2ZqSDuZ5WYBOFr7t5Lr+X4rA5@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3SEnV6AupLm1iPhiYAi9jzPS5VpUJmKNfvIGYSsTpZZrelbKP
	rBnqguRh1pi79NJSTPOQmGvnMzzQxkJxTbQdCwuGZSP87uoglGEYFazBstIlg4BhLAFYREwD4EJ
	QM+NgpcLK5RpKRQ9XZQU+jb41rIPidaD6KecJ+96yOdku0YrmQc5f/a4K0cvZKDpWxNG98uuFiz
	sP
X-Gm-Gg: AfdE7clh80oqCI/AN0+yoivQ0MkK4EJqkTmtIBSYoiSWgT6GDFCWLfUYNxX1lWOX3+9
	93xfflMoRnQ1HJMj+Y65w3VOPdn4G6AbEKX55h7ybv/SVP9W6L8JYigvWyi4Dge/FDL+rn2w68k
	oe2Pqnl/VTEpsard/EtgxUoCfwaXFipAFn0wEkW47s1XBq20GNzqdD0syMWAcvAhLM0BLov5NJX
	LVBiV2SsXEaty0XbftE2SPuzsOUxJtObf73Y06ScgYe8KtTbvCQEtu42RhxeDS0uGtgvnWA2iJF
	MAC9YdK9eTN01fhmYchhDoQcA/9t4ACn1TMvP/gvNl9iuCl2X1S+E2OwpTHoMH+fh5LpKXaHfTj
	Uex2bzxSAth+KsKVIjscrMg57Qo1ow7fXH/9fxf7r
X-Received: by 2002:a05:622a:38b:b0:51c:11aa:1cd with SMTP id d75a77b69052e-51cbf20254cmr92718801cf.50.1783955544149;
        Mon, 13 Jul 2026 08:12:24 -0700 (PDT)
X-Received: by 2002:a05:622a:38b:b0:51c:11aa:1cd with SMTP id d75a77b69052e-51cbf20254cmr92718121cf.50.1783955543604;
        Mon, 13 Jul 2026 08:12:23 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a558easm87956664f8f.27.2026.07.13.08.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 08:12:22 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 17:11:59 +0200
Subject: [PATCH v7 3/4] driver core: platform: unify release path
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-swnode-remove-on-dev-unreg-v7-3-6d6bc448427a@oss.qualcomm.com>
References: <20260713-swnode-remove-on-dev-unreg-v7-0-6d6bc448427a@oss.qualcomm.com>
In-Reply-To: <20260713-swnode-remove-on-dev-unreg-v7-0-6d6bc448427a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2372;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=sfNhb2R8s/6yKt4BPY7jMkwV/kl2zg5+s7lGbts3IxA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVQBMkeWmMCvmewYOj8J1fRY0qezWMr55m63rs
 XwMM+Ug+rKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalUATAAKCRAFnS7L/zaE
 wzJ3EACVzej+VwkeVnB5DJG57mn9yd2KIxtjlxZdjJi6jk9SdHkz51frdxdmaZB0HOwIMjI2qT5
 QHx9D0OiS7SLaC0Soqt7lOgyXIiFNJ3dHECznM2oladKUsTzLOOJZv3dDPkWajJOZ/5Dpdn3W2+
 8Yj7woq3cc+2xy7F68zqec9f6piDO61ZOCiRoKoOwN5F/fzmA5roxFCGMXG0kTnJC3qLYli9Rtq
 ksRRiLQ4xSLXtBNTFrmlGbUefn3GxekVpbQDhTko0LXCi4100tXUrJRrcLGsDIvy3ZyCk323Dtn
 s+uAezDzW5w4aZumcwTOigoEKb1PMuohjhcQuaz5WbNEk3QMi3GyrDCsHfZZeIavvh44UABOQjZ
 MVcgMuX12ZhA5O6Ipz1E1oXcMBq125MGO6jYWFgjg/kkZoGTtIJUYNReui87wI44rZJP9/+MiSr
 BPu3kKxS+ZOt3xODnlzmZJMUKsh29Zn7Q7RArB1VZ1hGE967gtxGtZjfmx8BwTc49nePXooofYl
 szN2ZI1weWNzzvJMWq5UruQuQyOg/7aNXQibTBbv4NrRgpUDEp+KaJx95KZQldPB1iD2FReuLwM
 VpVjW/B3/McT3NZ+PTzJ0V4eOXZqA+6ki+rt473xmMUbEctWt5M+/uorPc2rBL7DoioEyTqR3w2
 Zio/n6wszuIIiwA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: sEEhi_fwYIfuKlTdh60ojntIj_eWN1z2
X-Proofpoint-ORIG-GUID: sEEhi_fwYIfuKlTdh60ojntIj_eWN1z2
X-Authority-Analysis: v=2.4 cv=UtRT8ewB c=1 sm=1 tr=0 ts=6a550059 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=hkyMZWt8Xm0hL-3MNhcA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE1OCBTYWx0ZWRfX8Yh5SXIH66CM
 hjQ6MF7HF+IZ34ji4k+8Wu19VJNVAKC2XGtg6DZoKGe1zs8a2K6C980Ndr4RRyOOQMrUKhLjdui
 e8kyMJl+vKHl0nQtn9k2PtD+rLT8tKI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE1OCBTYWx0ZWRfXwiWYLjG3Zfia
 Hit0/M2MSPX+V48QQABWyFZj16+zS3EJmqja3H69BhronqmKVrldBImqbUC23l0Se9zpWKV8Skm
 YqcromURcorDP0Bo79teV/kJtkjYg5ZE3DR8IQFHi2PuCn63gRJfyscm1Czb43YZ0wlvX+bZaJ4
 P9YBBeDLd/ZkfeMvd4v8yE4j13F6/Q/ucd/fBt6m4/ci47TpC70qrAqEzfCHjCh6ieBfFvPcWZ6
 lD8snZWUuRhfGB65e8IQiKTlp74VPmqFY4jFDOgd3FPEBm9yojx9N+E/O2+5hM/slEXNBOdDqP6
 hADjG9fba5XQQofzBuofJFStOdZ1fz0kbeZES1OaT3gl08CDycr9nyMDWPzICb8M3Y4FWmFndSt
 1UD9b7Tba9FQkGY6epmRLOFZXrzcJor92HSzYbKfF/WH7faTveK0TEqWzgesJFU29BfwAHrhgcD
 VUlyVJNbn+c+6/gWGDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130158

With no drivers that manually assign software nodes to platform devices
created with platform_device_alloc(), we can now unify the release path
and remove platform_device_release_full().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/platform.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index a71015f1d915340aa01ebfae67196d4d7ccecba8..1df1a9ebd59ca6e0efdcd4038b100bebe224ee82 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -599,6 +599,7 @@ static void platform_device_release(struct device *dev)
 	struct platform_object *pa = container_of(dev, struct platform_object,
 						  pdev.dev);
 
+	device_remove_software_node(dev);
 	fwnode_handle_put(pa->pdev.dev.fwnode);
 	kfree(pa->pdev.dev.platform_data);
 	kfree(pa->pdev.mfd_cell);
@@ -606,12 +607,6 @@ static void platform_device_release(struct device *dev)
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
@@ -933,6 +928,16 @@ struct platform_device *platform_device_register_full(const struct platform_devi
 		pdev->dev.coherent_dma_mask = pdevinfo->dma_mask;
 	}
 
+	/*
+	 * If the primary firmware node is a software node and there's no
+	 * secondary firmware node, the primary will be affected by the call
+	 * to device_remove_software_node() in platform_device_release() and
+	 * its reference count will be dropped by one. Take another reference
+	 * here to make it have no effect.
+	 */
+	if (is_software_node(pdevinfo->fwnode))
+		fwnode_handle_get(pdevinfo->fwnode);
+
 	ret = platform_device_add_resources(pdev, pdevinfo->res, pdevinfo->num_res);
 	if (ret)
 		goto err;
@@ -945,8 +950,6 @@ struct platform_device *platform_device_register_full(const struct platform_devi
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

