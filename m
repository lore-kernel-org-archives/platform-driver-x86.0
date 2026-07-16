Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F4A41D656
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2026 12:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784205124; cv=none; b=Bik2TBmkokZct9lx7EZ4Af1THP9o8YB++WGijlwNXDlmN8oCQuOfXTUUtat1tkGKTWlEbDRnE+lPAW+AL9RH+S+q65dH6VGodQrUMmYBjxxkkvuKgukWjajJXAtyf7bskgluNJanUFNiwXqz/XxSwI5OkWmZtps21patc0uVvGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784205124; c=relaxed/simple;
	bh=8hpM+TrGfI2rbJN2akFn0gkqMVl45ni0Bp0sA4vGJ68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C+1kwJCRl7BZTTFZkmrjRR7CkIvWZxkri6xU3znpbbjqwCHPPbRZAqE1KM9m9sWjqHw5GJNNGJJNthYz9LeMgzHmu+wxbZxdwmtEDCz/uGKiOjC0PYbaO1ZfVH3xYeQWFkejgRu0Y7y4+X03VJJGFo/lgwmjYeMapBEF06jeLQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eXuj5Xjz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IWa3heKS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eXuj5Xjz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IWa3heKS"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GBiSo22824231
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2026 12:32:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T/W6God4Jx8WMmxqemjau5eSXR0NRTo0Cd6tDZl/0fQ=; b=eXuj5XjzzunNm/PP
	yT0Me3iks0+irV4A1RWwsgN/fYytSkrNebwbB3QEFO3664d7gCm6E1ZZXeeFDeCv
	6E4t5fQQOsPOfor26lfKXGo3KwdykavAK48uKvV9hEdsmqakxjsWMrt+kYlktFJ8
	P1PkLv77JgWgLalKxdfAmOORicqGsc1EgOCZmK7odqU5NhSkJso0QHrL++bifx21
	ifeVN4pLi35teK6jKFz3ZiA7Us624AVPJAG4569iETxdg8CcgdvKc7CEds3LhZOF
	AVJXVkfdZOP2NIyelNHFosMddhcOVXHcdZkEa8h2vJ66FcdwD/hnjGcSRiHInLv+
	cW/1lQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fetcf1b4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2026 12:32:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1c7f135bso61042831cf.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2026 05:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784205120; x=1784809920; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T/W6God4Jx8WMmxqemjau5eSXR0NRTo0Cd6tDZl/0fQ=;
        b=IWa3heKSCmET5u7P0Pmw5vDcaXOFdXX2wMeUd0ZMBEXf/yAM7jxsIfR8nmQRwDO7dY
         NloEELzwx2K9gQ4P7vC557GsHbVEp9H4UAamFjEaz37ZnoPly8BXjT0uqtrzXPbZ9OXP
         YI7jti0OyPfgRGfDwSYbGK6FQ5NzLaNdNKijCvOjFl8/SqRvtUsc/OzCEVsy7FMLa2j2
         ETTWUr7vlcASJLhy6TA7W6XdYlH9cLrIHeZcz9eb8dCTHOJxi9yTDW8ZsOyyJXBlUrwn
         f4jcx9sCO39DXOBkUkMqpi0rq7Ne5zueJaAW4H40jTpUymR3A9FAIo2W1zdBLcWoXWjR
         xQrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205120; x=1784809920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T/W6God4Jx8WMmxqemjau5eSXR0NRTo0Cd6tDZl/0fQ=;
        b=MJNEwRAOgDswjN3E1ENybt4BGYPtGi3IUDKbh8MDXPG1oWDOPeVr/Ro6qx+nquT8G1
         hSomRXiWAbOHCNYnyOdf5ndovgmXgS5Ox2y26IdqqZEUBUxuOrQwjNQBNJD3iPLp/yMJ
         MAv37UfMmzwhuJUG2WBBNwHs/VGW4EfNLUUJFkIgcDeThEQ8wuxlfAsJZaTVcBseNy/i
         HiyMJtEApymABSEO/QW4ShAVjQFavITHen6NRPUl2bJayU9rNB9B92Cif+dFxkqFI7h2
         qt0QfxnfSgNb4S06eMplKpERLSE9xnsGR4/kVCB+QJGk19nfPFchvn6o13Rychy7DKRj
         dXSw==
X-Forwarded-Encrypted: i=1; AHgh+RrMJsg/tlS+LgRnRxxmqtltZVA+7vI/lgUbzLqHQvlYGGr9TGTX93nAYjZnwNr3Sswa7JZJ/Z+lQzezvl8UJ/Yn3Qpj@vger.kernel.org
X-Gm-Message-State: AOJu0YxQNHltUy6mD0v10wBZOQs0Tqp6k42Mo5KhO8J5VBNyD1Ee3XZd
	7IBhJj/5rlmiExC1At0pyfqR4ky4N6yXSEcTPtg0yjo5YLSly96C7FQKXPd1veZzAGsxoscT8lS
	fEMTsEvFGSkmn9tpTavqmf8d6itjqXk745TpZmfEqrJfoSKS2t4OGGLufDVgBF3bjiTOngySs0U
	KV
X-Gm-Gg: AfdE7cnpgZ+u4ZXo9MKe9yIIdh12bF/LKmd7k1KeZ+ousKoajBR3LXLarAVR5y3j7m4
	/S7shMaP22z7ThO55XHLyG9ATiWQQU/OsRBiwDMWhNQ+4b4XlQ7+QE3NjCu4+6UCoq3VaRj1oaC
	TNbU4vemn3QHzqxxboeJGGoliCOzdoncShQ0GPjO/jtEwZJxOhAu4K+Kjzzp8N+243bMPR/336F
	rbSxZHlXvRDiclI+xf5jUuuEgczrJqRIWunwjmcFEuovyb9ryr8Gb2WieBwooCx9bdJZnWWUAU8
	r+Xi5S8ukE0KiVSyErX2nKGQ7AnpfrLQuxgJzYPoA1ckOvnO3l8mXDSA2xdwfQiH6Ckq63IpevP
	/JGDKtHyMiDU66fwSh9LxBed3obk=
X-Received: by 2002:ac8:5747:0:b0:517:5e3e:526f with SMTP id d75a77b69052e-51cbf27a872mr223608301cf.52.1784205120358;
        Thu, 16 Jul 2026 05:32:00 -0700 (PDT)
X-Received: by 2002:ac8:5747:0:b0:517:5e3e:526f with SMTP id d75a77b69052e-51cbf27a872mr223607781cf.52.1784205119845;
        Thu, 16 Jul 2026 05:31:59 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:76f:d108:485:5b34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464c7c96sm23766635f8f.33.2026.07.16.05.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 05:31:59 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 14:31:36 +0200
Subject: [PATCH v8 1/5] driver core: platform: amend the API contract for
 fwnode setters
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-swnode-remove-on-dev-unreg-v8-1-5c2b8cc38c28@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3252;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8hpM+TrGfI2rbJN2akFn0gkqMVl45ni0Bp0sA4vGJ68=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqWM828c87nWIkYkRuS35nkpsw+eafF3SQ/NOI5
 nZphlbwEjyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaljPNgAKCRAFnS7L/zaE
 w1PYD/0ap/sMPuzCQnZ66mfD+nEmu5nhkrMsO+nv/OYqI/SxhOEAqeCdbYwNEDMFBtr3nmItPBo
 izcMwlPWbzo3M8RG25l8zyCyI4A1dX3gx87PlsQauyNvGK5+EhyDzOVmKl2l0miKpRPVg6d5ePQ
 n6x+1eThx4PH98F66txfVbot1AKaqdqN8gfpI8QF/tJd5nvxExDKUc+jhcvgsc3gIfVKtf2l+Ml
 e5qIbc1muPS4/+Ysn8rVZMhCKLMVyLQ4Q9CO+HrHCibK9guPfwNhUvfWzKEXOmOXSiTBH02PXOY
 rZyiFMCDEPKnTyGDsZ5AwcaALmSJ5FauJf4Sr5/0MAM96iaPTpDVMFotgm67DrIQw7QIaBXAYJK
 wjzJXlMa24vR2eIFaPD24p1vSJ+I7epc4XBuIt2rdTEWeA0EnjrWPtOt5146iRgmlWoko1t8AUl
 v0FRoBfcfzmSf6xyNXi6652asT0Rbz+zfkIoveYItuvk1OG1mHE4I0WNIh0c84v/pmFIEg3QO/N
 8CfVARbevx8CJnGoYN5SZkVPeHFRqrM6df/KRb3czazS02Fq2qMpHX277XkDU8BE6xBrOwLyiuH
 EwazYUjxAFzjcjYelFGMIggKKVRYZ4U62LX4kx3M5rno+x07Y2WwUUEbkVLd7XrO+TNeu5AU1nO
 vcwxjx4pFdq+45w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: mrVYDS4Fqw6vCydFV2T5XtAG_0oDFLym
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX1twh40cQssA4
 QClnx7l4r2LrZiGtE/dKsLty0hDKYr9XCuLdEHdb24GT+DeiPshplXakBa8ANFy6AC93Q2GAq2k
 EnMam0KLhApQhKqrk65p2iic6jnWNz0SRMfmkSlAw7NHbmyRg7Np3OulqUzZApMthjwt87RVdEF
 KM6kAZ15xESSRkSdGbFH2H3O3aj0CaI44oE243gDpo+3kfpb7V4UDiZoyDrSEz4kC54IjxNieZq
 4E8S2psQKIqNv/IBeg3UN24r88+VgrjOVvI0RM6QNgZ++pldP+eH9yJoAqutir/V2sA6NugkANo
 oCeE/qHcvMTqWuJYJZnI6mTbZxoTtl9NHNXlkJUE43QE/4QCEYXoIp0EObsxfUTHErvcJxgfl2L
 49PGCCaW6uKoEsHJL98sB1RfKpvVVrU1yjZ7PwMsUAv9raRZ7DWbsBBuU9rmDsE+97pm8v/rZkX
 cKfYVvSWQmQi3+v3Fsg==
X-Authority-Analysis: v=2.4 cv=f8R4wuyM c=1 sm=1 tr=0 ts=6a58cf41 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=UJBV_kE8d4TeT66hubMA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: mrVYDS4Fqw6vCydFV2T5XtAG_0oDFLym
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX1CyZLngs6VXM
 yap9JNHaJPie50Xh1vi5OvhCA4uWgRTHYy/3yV02W9CjkIxcuvTgVhDrEEMOcj8HnyXJJAAJw7B
 6RjpFn9CqV5kcRH/ClXdI4077kTHHiM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160129

Calling platform_device_set_fwnode() (and by extension:
platform_device_set_of_node()) of platform_device_set_of_node_from_dev()
for a dynamically allocated platform device whose primary firmware node
is already assigned and is a software node leads to a resource leak as we
never perform the corresponding call to software_node_notify_remove(). As
there are currently no users for this special case - just disallow it and
warn loudly if it ever happens.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/platform.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index a71015f1d915340aa01ebfae67196d4d7ccecba8..fb57d487a6c2aba799b4ca5ccd089006cf2d8bf6 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -707,7 +707,9 @@ EXPORT_SYMBOL_GPL(platform_device_add_data);
  *
  * Assign an OF node to this platform device. Internally keep track of the
  * reference count. Devices created with platform_device_alloc() must use this
- * function instead of assigning the node manually.
+ * function instead of assigning the node manually. This function must not be
+ * called for a platform device that already has a software node as its primary
+ * firmware node assigned.
  */
 void platform_device_set_of_node(struct platform_device *pdev,
 				 struct device_node *np)
@@ -723,11 +725,20 @@ EXPORT_SYMBOL_GPL(platform_device_set_of_node);
  *
  * Assign a firmware node to this platform device. Internally keep track of the
  * reference count. Devices created with platform_device_alloc() must use this
- * function instead of assigning the node manually.
+ * function instead of assigning the node manually. This function must not be
+ * called for a platform device that already has a software node as its primary
+ * firmware node assigned.
  */
 void platform_device_set_fwnode(struct platform_device *pdev,
 				struct fwnode_handle *fwnode)
 {
+	/*
+	 * If we call this function for a platform device whose primary
+	 * firmware node is a software node, we'll never end up calling the
+	 * symmetric software_node_notify_remove(). There are no users for this
+	 * right now in the tree so just disallow it.
+	 */
+	WARN_ON(is_software_node(dev_fwnode(&pdev->dev)));
 	fwnode_handle_put(pdev->dev.fwnode);
 	device_set_node(&pdev->dev, fwnode_handle_get(fwnode));
 }
@@ -739,11 +750,15 @@ EXPORT_SYMBOL_GPL(platform_device_set_fwnode);
  * @dev2: device whose OF node to reuse
  *
  * Reuses the OF node of another device in this platform device while
- * internally keeping track of reference counting.
+ * internally keeping track of reference counting. This function must not be
+ * called for a platform device that already has a software node as its primary
+ * firmware node assigned.
  */
 void platform_device_set_of_node_from_dev(struct platform_device *pdev,
 					  const struct device *dev2)
 {
+	/* See platform_device_set_fwnode(). */
+	WARN_ON(is_software_node(dev_fwnode(&pdev->dev)));
 	device_set_of_node_from_dev(&pdev->dev, dev2);
 	pdev->dev.fwnode = of_fwnode_handle(pdev->dev.of_node);
 }

-- 
2.47.3

