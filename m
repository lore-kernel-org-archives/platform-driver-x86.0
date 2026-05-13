Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BDA477E4C
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 May 2026 15:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778684724; cv=none; b=a/IRyzwKgnUrObC48ekesi6pLheO2uly7A4Vi4e+LGdmxeChVlBjiGl2+OvwKC7zVNRt+KNkCbnHryKiuC+SdjRg4+ucZp2YOHZ1Pw+32+QHND6HfHfR2epHfaObxPWhMaUxAFS8d5liWNbfNM929GplpBR8Oe4GUNhEtJxOBR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778684724; c=relaxed/simple;
	bh=7CT4RdGd8vHFfi08UzdJ0gY35hkIPSgc6GixhOhNOoI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TtSxSb/EgnfQGE8cES/xYnF6O9A4yh9ZFiUtAcWhg8dCu0I2DlRRbMTjPVa2wBh4jhO3TD3dFnXjJqToITFdq4jxqi9SjmGo5ozMWlv3/cGx8JChrxCeE4t5/AvNbbhXPRG9i8NNfmwMPkNj9dQg7yqN2JHTMjDQbAWDKQ3mZV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DOwwEpAU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fcg8EzNl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DOwwEpAU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fcg8EzNl"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DBt9j43324713
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 May 2026 15:05:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aSJkUW3sdSq9NIEJuMhwmsrLO5ZZJ71MntJqYUHfhdY=; b=DOwwEpAURofCdVa7
	yv9NCVkgVXf6qOSXWpoJOH/2S03kgX4XgnyWYb2qvUSF4JjAHww/oADGgpxMaxBu
	YKzJdMhp4NOo+2iFX0sVOdAHZk50u08fBqWNesmNVX7wSvo3V4Ni7yFnlwt1uruH
	w25Eec0tpCjffLBEZIfRbNW6gCBEux5x+txW/k0l50OCBeP5GhQ6D/ul2S2PWAHx
	i0Zd1o/t+gGXPnd3DqMMvZ2QbC/ZIEOgajsrH31T4GgkLxatRBnqrGxuHGzV6dpb
	cLlph7q0pKUsGwMEae+ChC850z142pZv42PdEOW2TWEiJ7W0wsAvWYcVs3hZAoyN
	bhrGew==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4kvda2ky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 May 2026 15:05:21 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6968cf5a116so9269677eaf.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 May 2026 08:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778684721; x=1779289521; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aSJkUW3sdSq9NIEJuMhwmsrLO5ZZJ71MntJqYUHfhdY=;
        b=fcg8EzNloiT3KadZYpzeUHvH6MvPVX5Toz93MShCo9lYPjQVW3R7tj7+RztJYaRy8B
         zHnMj48jsH8gKOnkIMaiFM51hK9UslMBusqaUdwXbX4vvp92+jYBgNlxv8yAFv03yTGZ
         F4R/7rbVXYm1XSagrvydHNfHFojN4ya1CUzMKtx/lPkci2a4WJEsE3dqwcm/Ecq5AH2F
         z6uvi7tOlqiKOjR6CFhHwNIPli2S+lCKZcxztViVXmyuSGbsvHfllYDxz6JIWTyOEjzK
         /Obe2LTtyxGHEdAShzDu1XlbTnA2QLifemG+8QG6A6+3vWZQIoDLpP6JQvtyb1CvrV3D
         nSpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778684721; x=1779289521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aSJkUW3sdSq9NIEJuMhwmsrLO5ZZJ71MntJqYUHfhdY=;
        b=P6qq2i57Ib2f8b9DdEMu3M5nmRA8V1u4dEDsNXb7CW/5oNIQBgIHa8uIcPiuL5yOXJ
         lyEfENyZIzCRqXUPLs0v7ML6OOmyKJ8GLkWe/OvHJ3X3WQVabiHwkp5Zc6i2l0jxwjoh
         BC17GKXv/pH1le+RkeXvAxiPdfSAVNWoaTKdWLkkX3W4wz7LAl1UZ9KEX5Gg1EhJs30q
         wPonK9LeRJIPVejLjWKE7jBFLyQ9iuWawN4ILqZS47n6aHVeXxV+5A3lsOuqs0uw8Iyf
         zvjQczVlMzxPp5tV94sVQjoSb/binLC1lzMdenaiC5PlUjfaFfkiQdVMozGvkXFJ5C1e
         QlNA==
X-Forwarded-Encrypted: i=1; AFNElJ+nveB3WTTAbgiKHkQMf0QN9tRTf2MWaWQzmLGsb6kfXHEkW+PM80iH9uGuY2sZzA1XydWIpVpK/Sqm5L6OIuOkRZfE@vger.kernel.org
X-Gm-Message-State: AOJu0YzZcLRHnghdTEkeInC3HQh9bc8dq//ZzGa/dmsL3m5NRHryG/V6
	zwBoQuhz8IvYN79+TnrV6SxiMc0Gn2OL7gs9vz0CcKw1qNWXGhM5aLaiC2ic9F5cLpfO1vgDGhd
	dST52afQn349iL1SebuqEVKmIBKXuAxM9SAgoouESYacMOv60e6YKA/ZnqP+WrRVCO46+LMAYpE
	et
X-Gm-Gg: Acq92OH69CWTdTj/fMf3RIrwHRfhpez2+jm8fIdce3jLNxIujvyntsZMD+Vg4hNKVuC
	43Urz1TkvmHG37YblUJ69HEzyd6CfbTn8KZiWbHBFzoIBbcx490KrU1d7aLp2y9m+4wvZMNEJx0
	MoZ99jX5nxCSXabs2VTQ+WbScgL4wdVj9o76ee/iF/ckRsF0d16158e4bP13EjafXmDMx4vxNJv
	VKIgW+kvva6VDDJCFrZpWZhu68LNeX6fQFqTpzvjTbLAldRqWLkEYhBH0sZfD3ScJcH6mJZO/B7
	pjjUozxpCT83ls7x0XFg/fZ+MBIemOGEGLQn5+zC5N+HpDSKzcdP1qG0JqVXhHeiAA+q0TKFgmq
	RFjD1SHiFQEkZHO0Ue5tgMbXK3g27etmaBhzbQbipL0/KPT0fag==
X-Received: by 2002:a05:6820:c88:b0:694:8646:9927 with SMTP id 006d021491bc7-69b78e151e3mr2067583eaf.35.1778684721155;
        Wed, 13 May 2026 08:05:21 -0700 (PDT)
X-Received: by 2002:a05:6820:c88:b0:694:8646:9927 with SMTP id 006d021491bc7-69b78e151e3mr2067515eaf.35.1778684720539;
        Wed, 13 May 2026 08:05:20 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:63ec:4acc:c4f6:423])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f542e56sm43216455e9.34.2026.05.13.08.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:05:19 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 13 May 2026 17:04:48 +0200
Subject: [PATCH v6 1/6] driver core: platform: remove software node on
 release()
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-swnode-remove-on-dev-unreg-v6-1-f9c58939df27@oss.qualcomm.com>
References: <20260513-swnode-remove-on-dev-unreg-v6-0-f9c58939df27@oss.qualcomm.com>
In-Reply-To: <20260513-swnode-remove-on-dev-unreg-v6-0-f9c58939df27@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Matthew Brost <matthew.brost@intel.com>,
        =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: brgl@kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2612;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=7CT4RdGd8vHFfi08UzdJ0gY35hkIPSgc6GixhOhNOoI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqBJMkJrAnP++rExRYyFuP5VzjyttTtBK61XiAG
 qYsTM0aNsqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagSTJAAKCRAFnS7L/zaE
 w0NWD/9o1//pvqg5ealCNkdfHJIPPJ6KIzTFVfZcoQZkGuENeQrqew8b+WPMREwuJ4xBgI4CLLQ
 oj0RVbrq1WJWkko8JaB0R9SQozi89OM70fo0x8TTnnvW44nRU0fo8p5spqLpj9hDG2hSBCN8i5X
 Y4CE3pwLZU7M8YSi4jN4YLlqYwV3UtIUHZjqvbL1Vd3pnYuq0N1rsA8U4WI4VhJL2/kakNQtDv7
 EJfPiV27idjSLXytXpEhlnxqvPNWD2s4Gae4H434lcYMMbTsBFKx5I7uo6yojfzlZPtdchSmzxQ
 DqM3xOEFN6iKDe6LHPgrvZKMyoowXe01Vvn/T3VwM1oL9c8+rJ1NwEUOylUBhHBahbEy9a0SuL2
 IF7MaqQwWja7QmqnLtwJvspsHg4AeSeA5Fq+baGppBDhsQUHOJUrtQSHAuEoRGgAKV2/Bdq2aKr
 Woej7bGcJ7aY2AkjYr3Eb/FsquzqyNqzeAooPsCyRi7Cs9Llg6DiQ8O0Os1OWTG+DrykGJSuo8s
 K79MWwTkOo9pYyCnsEPWhso0obnhHYPNQFPydT/EzrNTy/EFB8Vio3gy9kekzTIAdArk2tIC4KY
 IYdOHa8BaXqWHKL0uFRYc4Y9nQtF2r6rFoFIAY54ShSFFMmdZIEeHZFei9BPrc5XWYuwtxTiJ9u
 rYGfdQvm02e+g2g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: UNvez_MvQC-ab2QT10_9iOpgYy2YVW7J
X-Proofpoint-ORIG-GUID: UNvez_MvQC-ab2QT10_9iOpgYy2YVW7J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1NCBTYWx0ZWRfX1lLr1nwbMdaI
 Ymr9gacJ7uHHvmcCga9rh5dVXuGHn8IBvqtgqlUFHmRqVAhLwslyEW3WTDYgF2tZsU/9YzCaunh
 lGx5ocq1huLFmxosp5Lv+pgmhny9Zj4mc0f/H8yAtyCI2f3BsluD+k/aWXKN6m00IVUdMdgn4Hc
 QP4d98wAJ1DhhPCob2UrY8lCVml7RVgWdp2vy0fw8ucDsg/abTuC0GOK4mhoLB+jktSlOcAJwtg
 7iS5t6qTTMeAqNr1RTff/W/fvrlMzwpbQH5IoPIQBooP8BxNc+bq6ULKC10yHaTjAe2nmK1nWRk
 nHEhzP/FB7zGHDCROIqbLYduHnWHFgzFSc9/mxavr0+YL599aCbviAMn+BcCQW4BhoDmtCV4/9j
 Yj217qgIP27R6c+Op3Xrbqx04QtInUY2JYEf6Vk5kHWCwcUL06801lKnBQIW/4dWaO1vxzx/dvj
 +ICpZ7GGSeXlfajRzGQ==
X-Authority-Analysis: v=2.4 cv=Iu0utr/g c=1 sm=1 tr=0 ts=6a049331 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=C8YuS1gbLiBEeSI6bHIA:9 a=QEXdDO2ut3YA:10 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130154

If we pass a software node to a newly created device using struct
platform_device_info, it will not be removed when the device is
released. This may happen when a module creating the device is removed
or on failure in platform_device_add().

When we try to reuse that software node in a subsequent call to
platform_device_register_full(), it will fail with -EBUSY.

Provide a wrapper around the existing platform_device_release() that
additonally calls device_remove_software_node() and use it to replace
the former if we end up adding a software node.

While at it: check all three possible situations in which two software
nodes for a single platform device can be created/assigned in
platform_device_register_full() and bail-out early.

Fixes: 0fc434bc2c45 ("driver core: platform: allow attaching software nodes when creating devices")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/platform.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 75b4698d0e582e67adafa78c312d75c72fd654cf..a19dd22deef2f3edf7cddcf824d02b4e09091852 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -606,6 +606,12 @@ static void platform_device_release(struct device *dev)
 	kfree(pa);
 }
 
+static void platform_device_release_full(struct device *dev)
+{
+	device_remove_software_node(dev);
+	platform_device_release(dev);
+}
+
 /**
  * platform_device_alloc - create a platform device
  * @name: base name of the device we're adding
@@ -848,7 +854,13 @@ struct platform_device *platform_device_register_full(const struct platform_devi
 	int ret;
 	struct platform_device *pdev;
 
-	if (pdevinfo->swnode && pdevinfo->properties)
+	/*
+	 * Only one software node per device is allowed. Make sure we don't
+	 * accept or create two.
+	 */
+	if ((pdevinfo->swnode && pdevinfo->properties) ||
+	    (pdevinfo->swnode && is_software_node(pdevinfo->fwnode)) ||
+	    (pdevinfo->properties && is_software_node(pdevinfo->fwnode)))
 		return ERR_PTR(-EINVAL);
 
 	pdev = platform_device_alloc(pdevinfo->name, pdevinfo->id);
@@ -878,6 +890,8 @@ struct platform_device *platform_device_register_full(const struct platform_devi
 		ret = device_add_software_node(&pdev->dev, pdevinfo->swnode);
 		if (ret)
 			goto err;
+
+		pdev->dev.release = platform_device_release_full;
 	} else if (pdevinfo->properties) {
 		ret = device_create_managed_software_node(&pdev->dev,
 							  pdevinfo->properties, NULL);

-- 
2.47.3

