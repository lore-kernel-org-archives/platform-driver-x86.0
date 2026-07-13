Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9846353A7C
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 15:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783955543; cv=none; b=tqpSgIPDwxMXyS0lw791g8RQtHVmu43g+nf4DzqGezdT3NlnUl5wgD0zWmN/2ybhTLoEm9ujBUP7ukcntLg6UqprRtMQrzSF6uCpRPZvXIpu/gvMrApDp4k5oUzoONZUv+EecTNaxCPVY9NYJ1F+cUh+hrqv41XmJ/+9iKhCiYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783955543; c=relaxed/simple;
	bh=LQm6Ev5CsTQhlRz56Fas/rrihp1CyWWC4kaoHOMynUQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SvVriw72wPeVDV8e4Fd5zfAS58LfQ8UJhwFrRNE1lRKPpvO8Tw4uC1k5KH8UDcgbyweFzYv1LqaulBQg9cWsNc/rVuAKIyq34Nn9KEZpxOwpFvfEoD/9qWS4tU2zcW7WXcIdTlwGFswX2VsmjeyfvRB8mxIH4ZtbyFO/tkN5aMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kVhFl7OE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gP6ZbcyS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kVhFl7OE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gP6ZbcyS"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DF83dk1701259
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 15:12:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eOoTW+/8NGpy+8ODEceEWrPqGZMK7q4zSL4q7/aA1IE=; b=kVhFl7OEgk96yjT0
	mVa7TQ1oKGQVR5q7Z5d4fj/0gvy90stsr5AfLefa0T/l7KlaefyYpWa0WmBtfu+E
	zqF7CklezR/HLnVyafxC/A5ziJlbtdPJhYPHDYJcOcl2skPAPWU0+e3Uv9BtI8p1
	QwOVi88Eg+VNAyoujSh63u86B1jd6OSNCluOen+U2twkPTsJ0tw7HHkGCcTDSI75
	tafXva+tO9SgZkl0XanV/Es/3IlVulUIlB7U3uY2BSGAXlLjfKGYPJtYHnSNeamk
	JwQBpf8mItV1BETpKA5mSrSXTdTCGOtk5AOWg4kw0Qz8Fer+LwC5Nx6QlNdHkuXh
	FaW4aA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwk3ha0n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 15:12:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c07f25de2so33547431cf.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 08:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783955540; x=1784560340; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eOoTW+/8NGpy+8ODEceEWrPqGZMK7q4zSL4q7/aA1IE=;
        b=gP6ZbcySq6z78nRNXfYeixVSyE13eZJodcKbTgOKP+kmM+NhmR7Le3UYExbKOJYA64
         gXOZOY7+ZZjr0lUviT/yFc/ammDpGuiBnOyhBUX3Y4PhU8QoypIySOgl6biQ1X4JmczW
         9uWgJLrLGQ8BCnmCBURJaO4xL0R1tPqnxEMcsFPZ/ikvl+0kldIzaRQ5vXL4WNhxTvJj
         sq8fKUApN0MJv4vpw9DeCAIQTjxpVbpmGw3YnvIZ+YNJkoaVyB+obYXlV/EpK1GvkJpd
         +56cjQmwpWLQ8yifJfLCa/dbe2QEIOMYg257GdPr1+LKzCdEBISSFbTmDMkwk3qIXZVf
         +OEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783955540; x=1784560340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eOoTW+/8NGpy+8ODEceEWrPqGZMK7q4zSL4q7/aA1IE=;
        b=mN+CwUm1jbXdl9YyQChrj5pklkbffhb1oh7ot/YvWLq9Pa4FFm7H4PdQ4uoP9KJCG5
         H1NuuhjHK1DmaAGY9qPzSu+64udxPSnAJ1qRdXw1fw1HIBMa34FxnTr0cC9LklqBHdYP
         7aWR8mQDzpPygEu3gW3UL77WLq7dPsaDkLz7K9/Be3DDCS4nmJrmBm5unHHOTWXoKdGF
         ixMvky7ppFMRyeUcGcPQtxmQJTWmJKLImZwwx94Fa6cy1AdxukGuojEw6eAjkurXO3Uo
         RxkjTK7osZc/hQGHxTILeqasjUaNdpbX3mNh1EdrlikGdsowrSR5FPf2JHcm4sC37UqH
         6inA==
X-Forwarded-Encrypted: i=1; AHgh+Rqz1LvnEv875fBrfyJcnlyjfcPiw9Rh12bg01JYo8b+ykgoB3tl0uCM/W6PjPwrWjQD6n/bwGWIPI7pLEWBKOLt7/gI@vger.kernel.org
X-Gm-Message-State: AOJu0YxVHBpaoh9Ig+Yu+0D+qH3hP1e9M79OqmPTq2U1NyyKX42uRiuJ
	NpDGxzQteFf/Oy2IHnISoTJAeHT4sXjriscvnqAtYm+rb6HfKMp8Y1BN9wFhhw5LzCsHb7SeFgE
	1DDI1pfho9ZGkypDla48HBNTPF2aOsrzIEYgUjnn7q2UaE9yC+29l1GFLR0WILZcqZVn1Nx4NtS
	0U
X-Gm-Gg: AfdE7cmA6jiOyRa752AY8QbTrFCu598SgBO/Di3dABMNJ8SzOiKFtldvlgvqf81wTu+
	rDcYiVGQqYXsVhhcsRvhoAkc/0a11aXyPxpuvJcwtxNgNBiMzqwdmk0K5mrAHfrWmyeHyFg/1pY
	hiI84cdhbTv6lBg7ITvI6D1KvaSPdcJv2sbbBUiNo8cZ0UT2FAqYq4e5DDNXPvudWIIs9hvbfkh
	rvmeU93OBSMsC2hmvGnbBoTMUs/wjehsptp6HtVvTjIdrfCwq7B7JHSoCZ4YYt2a3U8/ufJXpEa
	EdKvcacq/PuhzkX56J1X2QKjaz0CVTcIznTNL59+expIkSUsp05vwE7PtM0FXV8SZ1shbxdbwQc
	S1bOLcpp5oYBMBP37EAllMKzqsWz/jeVdfLzOxRTd
X-Received: by 2002:ac8:7f13:0:b0:51c:7b12:5ff7 with SMTP id d75a77b69052e-51cbf3fe1femr91662341cf.83.1783955540011;
        Mon, 13 Jul 2026 08:12:20 -0700 (PDT)
X-Received: by 2002:ac8:7f13:0:b0:51c:7b12:5ff7 with SMTP id d75a77b69052e-51cbf3fe1femr91661821cf.83.1783955539511;
        Mon, 13 Jul 2026 08:12:19 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a558easm87956664f8f.27.2026.07.13.08.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 08:12:18 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 17:11:57 +0200
Subject: [PATCH v7 1/4] platform/surface: gpe: use
 platform_device_register_full()
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-swnode-remove-on-dev-unreg-v7-1-6d6bc448427a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2532;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=LQm6Ev5CsTQhlRz56Fas/rrihp1CyWWC4kaoHOMynUQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVQBKTlNOxz9cwYCiWhHNVnX+m3dvLDS8Snmnt
 ETAtF4KuRqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalUASgAKCRAFnS7L/zaE
 w9NMD/wPsPGJwatR1rnJxCsUwV8L2KnB0IOZCNjGmdn84DwM3P/LtTWySo2BWVUdFlYN2CT4C/4
 qrALrOWSlxzHLkMEPGkh0MoMgPmKjiYBkP0oQv/KxaLYSHUPHlWe4bq2Bvr2eO+JhDlCp9QHCaI
 LbqLglT5jrB6MurGhsFyEG8JkvB2pQRRi6qeipTPCFKhb0xQDx9xYbr/YRo4d1rU6t6duVDPj2S
 5IikQmv2kkx18DfbXcTAajxBl/vwwaUtxgL5S96fjKPnDsS8oj18iqwl+dcsOYDuei69Q9G99Nt
 d9aleGx1WW9Cs1vkgJbYYNx/224EdKSPh53xAPSBJQFeDN8Nb+JwkJrTbkc5HdeOOrELH0A5sBR
 hZ/Gh79aWzuh7wVaprBxLAZ8qaRlCm/sUwO53O1gqYOzGoiOGEi1SKNvcVer1jxB2L4EAx3RiOY
 K5kUWFHarCHNYYLbDfTYx/ih07WFJ7Er1LBkD0Ad/GwsxZXwZaAETTRq/7gSxhw812Wmy24UZwa
 AaFmkkAIOahLpJv8+0rvCXfvdLMS9OY6nF53BBnivWQSeAPRAT68B2A2GDcG+0U+WPuxXDTgv/d
 GfqrTmQ6PQo+Mo+NQhZAzHVOCqFpZRuiS3MWrfByGlLAl/Y4mUe+YUw3LtSRR65BUC/NVXeiOAC
 SXu9YrBLHre1Veg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: tlpuXR5syIRUqjCfuMbfxjGkfOjqQDeV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE1OCBTYWx0ZWRfXyiUdyQG0YDZT
 TZYlAr5ddnOEhlwobos8pWLQIvUDbFIu4z1dhqeiWbNNiKj1/Hd5CAy5oCA4KnDHJZLhmMut/S5
 jS910NnpF/7idgM5Jcv2MjjVhx3vdlY=
X-Authority-Analysis: v=2.4 cv=e6c2j6p/ c=1 sm=1 tr=0 ts=6a550055 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=vKDqCkOE6BQjc6v61vgA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE1OCBTYWx0ZWRfX4IhsAdumyLrp
 jrlBuM1JmxK0jLiaSfIZP7J7rjCYnJEgP0Hu8xLCj6BJ50/WIOqLBpDLBoUckqr752MT5OwLAu2
 9kmWtDJuIIFnjGtEZm3UpmaQyWq+xLo3deAcehAjRZIJt6hV7bd6ZhEwfdmbCbIiIEasGhIRFjs
 x9uqYD9ziA0zVMOyStebOynQ3RAYV+UvNB6pHCnh0mel7hnKzq+WdxBxFEJK4T8+Mgn4rLCpEVn
 POs8sa/A9HXbaT3SO9yF12bnwWrM9RGsFxSvpkLwHGUSTsy8QpebFAspLj0tW4/cYC7rWKi2ZJR
 ubnDiIjkx+GVDeKwx0LfhAU66fC/CDkz7Cm4VmJtnFkHUkz4ZvJeAScojvDjQ9oIWmUzE1x2JzH
 WroY7Xnq/5z1hV/1tK1+L2ZiVCH1upd4BK4QuhcLslvfmsg+xJkxeV4p18Dqjc3WFYaTC0EG+Wb
 7xqEUiRk1X7Okg8gv2A==
X-Proofpoint-GUID: tlpuXR5syIRUqjCfuMbfxjGkfOjqQDeV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130158

Creating a software node for a given set of properties and adding it to
a platform device can be achieved with a single call to
platform_device_register_full(). There's nothing in this driver that
suggests using the more fine-grained interfaces was intentional so
switch to using the high-level helper.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/platform/surface/surface_gpe.c | 39 ++++++++++------------------------
 1 file changed, 11 insertions(+), 28 deletions(-)

diff --git a/drivers/platform/surface/surface_gpe.c b/drivers/platform/surface/surface_gpe.c
index 40896a8544b0a4da4261ea881b1eaed62d93b32b..4ca7ad76f3b9d2b6c455a5d5b37f23a85eb69c69 100644
--- a/drivers/platform/surface/surface_gpe.c
+++ b/drivers/platform/surface/surface_gpe.c
@@ -290,9 +290,9 @@ static struct platform_device *surface_gpe_device;
 
 static int __init surface_gpe_init(void)
 {
+	struct platform_device_info pdevinfo;
 	const struct dmi_system_id *match;
 	struct platform_device *pdev;
-	struct fwnode_handle *fwnode;
 	int status;
 
 	match = dmi_first_match(dmi_lid_device_table);
@@ -305,44 +305,27 @@ static int __init surface_gpe_init(void)
 	if (status)
 		return status;
 
-	fwnode = fwnode_create_software_node(match->driver_data, NULL);
-	if (IS_ERR(fwnode)) {
-		status = PTR_ERR(fwnode);
-		goto err_node;
-	}
-
-	pdev = platform_device_alloc("surface_gpe", PLATFORM_DEVID_NONE);
-	if (!pdev) {
-		status = -ENOMEM;
-		goto err_alloc;
+	pdevinfo = (struct platform_device_info){
+		.name = "surface_gpe",
+		.id = PLATFORM_DEVID_NONE,
+		.properties = match->driver_data,
+	};
+
+	pdev = platform_device_register_full(&pdevinfo);
+	if (IS_ERR(pdev)) {
+		platform_driver_unregister(&surface_gpe_driver);
+		return PTR_ERR(pdev);
 	}
 
-	platform_device_set_fwnode(pdev, fwnode);
-
-	status = platform_device_add(pdev);
-	if (status)
-		goto err_add;
-
 	surface_gpe_device = pdev;
 	return 0;
-
-err_add:
-	platform_device_put(pdev);
-err_alloc:
-	fwnode_remove_software_node(fwnode);
-err_node:
-	platform_driver_unregister(&surface_gpe_driver);
-	return status;
 }
 module_init(surface_gpe_init);
 
 static void __exit surface_gpe_exit(void)
 {
-	struct fwnode_handle *fwnode = surface_gpe_device->dev.fwnode;
-
 	platform_device_unregister(surface_gpe_device);
 	platform_driver_unregister(&surface_gpe_driver);
-	fwnode_remove_software_node(fwnode);
 }
 module_exit(surface_gpe_exit);
 

-- 
2.47.3

