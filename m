Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0834D991D
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 12:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778587203; cv=none; b=TDLhlGyHnFugI8MskKMUrnumMvYAAeVqUuqc1EkkuhtEAhlV7JNxK+SaLpZ+fq4beL0gfyEPBGjsi+c4jIeBWGjo8DypbuFpELxn1vBL71BgzgvVXHu3MZmPVoIjIqr3qTkMEeWGCvnopS4krf75RLM7A1W2h8gESTdhZwLDzaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778587203; c=relaxed/simple;
	bh=WGHMjJxrf7oH7IgvHdLBFYDNllKP66ZEIO8mfOfwUTA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sUlezOkS4xs7OKsD5RXw3u5/Vg4zSn0rkMAjzF5yRa+4NwRuzoYpiwNFMVrfES085Fu3PnY1/Bvh50IjEpr7M+5z49oV2I1hBrdULF3C9OmFlV1V6P4h5oXIcKuO5jIn5k9T06we3tjWPMgV2DjyDet1tYinkM+r+TAp+8aT8FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PT9onUSc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VFGMYT24; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PT9onUSc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VFGMYT24"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CAkmvA740782
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 12:00:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VOna9W5wpCKqk8fmVtBrEqEi7COqbhaHvWRa0Wuj+6U=; b=PT9onUSc5JUQ2Fv9
	klheK/WVRS4OuWtLDwTjyzQgQVRWiBzHsHJLHkeZ2mNDGZf7AOZKAe4i8U34YzKR
	a7KuH78hWjKDqz0a0lsxhP0cgOZKzkIOkzkX08dRxzFEycr9b6t1UXopRx6DrqXX
	OwdHaLRVCJ3rSk9TXICDQ1poendojpV08Os3soz8mbeeUlM+9UuUaLvRMj5xyE1V
	2cA6mCFNgR8Wtjmfoco/GbUTKL4A4CTBlXqqo4BN50+Bjv2Lm9x7Z0CW0w2h5/Ul
	4PxfuWv5tUfyinHuvyxV8SHGUCP/ypbPd/H5Gd47tru6fSmYi67WBS6BcG34ZD5X
	cvDfXg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e42rhrccg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 12:00:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51009190feeso103778481cf.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 05:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778587200; x=1779192000; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VOna9W5wpCKqk8fmVtBrEqEi7COqbhaHvWRa0Wuj+6U=;
        b=VFGMYT24jPkTZYZOiWKjqD74y1d8OAsCT8Jwk0fQKcehE/N8+o0EafeC/aFCIGJBro
         VCxe9Cc/KUU4kPEGQx4/U4wCiT+yYXZ3dNwCW9uEtgfDuiDinFTYvD6QV7bYo5RxKb2N
         6AUL4bFXjGoQfTeW3CBqmX6KPTNQ1raXcS2KHB1zeTTg2tUb/tFbwksWnW/UZTGo9L3t
         4Gj++qO6no5TACu0DrekOPqVYKS8cZaNIJwRcJfOUrQFljA7RXVqPTled7prJPuKQCQY
         4Fi0KQ2xCdWku7Vi6sxmFRAQtM5dZQ5fInor7kr77wZ7Rmy17o4DTW6kfHECIPgMD38S
         4jow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778587200; x=1779192000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VOna9W5wpCKqk8fmVtBrEqEi7COqbhaHvWRa0Wuj+6U=;
        b=ElGG4FeFVJM2CG0OhsfACzJE2eQMsFflKGXx3jEsIUQToI4Cijj3JZB5uhKLUEmpxF
         gzAqMtZC34ILo+XpVQQz4kp4Pf3z9XPM1XnqUh6LMwhDATS3DDgghmUas5pu4bV17MG/
         7J2au8UD6yG1U8RhVgQar7MY3xGyrg13aDncdadJk6G/kW7joGqz4sx+Wyq2E8c5q8o8
         PNmSDBa9Wu8VIQV3IlPZN7peL1O+/Czs9aqetcsSlcylId7nT75usgICuyrPqI3NBj0f
         b/WxBT2l/K5ClDoVWNk6sqPwz1tWugokuDkwHg/cW0OZDEMU0gQkcEGG+lk4CMmMc28Y
         GPkA==
X-Forwarded-Encrypted: i=1; AFNElJ9bEXBp3VxHMdpzFBN9rjKBdYeX6GqhUOrMCqBjobFOEeK/9tVwmK79jHirx2UjtQl52Zvsh96KG26ffbKE7SkmZUaW@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1apt7LM/qQ9im33kNSjhPLHdTC9xklsu8nHQOkxPU1eqrk98y
	7VscVzpkSQocBY7VBzLT4b0nzr4tr/sw+t3/M100xsEVIbIgmIbqdWN0xp3RHW4jpg8wTIbTqVl
	OnzdZAQQK8JoCLOhHFxKJKSBIsM2yId9lvCJr/32CBFJaQvtNHexw8yAaxqp1x1XQnjeSojScaz
	sB
X-Gm-Gg: Acq92OHSKRBxpUqC+EM5gAULzOSZjUAnYyf+P6ssygGM6KZBDbxDAYP+w/x4feEvhqz
	NXkTqYPGs/nu63u3jQk7mXPuGbNluijEzOipCz90FcVz+NM+4VMc612TeV9Vb20gp1aVSEcGBHh
	KxTVna7z0fJWnUBMPU4b6TDVmr8CClB6TiHnr9jcgYk7xzIuGyhliOcJCSK855gbo10olGgzyYl
	hpx++BJ1pyKTeeZcCSNwK04xFqJnb+wBbWW2XHIBAkl1ddZj3r7yytF6v+BWWcleIF5DL0/RDe8
	qAwm9QrPC/nRDRhsC0VQqwswQSMyWmxvhfc0hUKgi+TPpZLKDvTRXowjTNoHeqxpt258VMw1Eg8
	bVeHXyZqzHCINBQPkGzLHIBWEMwBjVhsNbLiThFQgOWv9oV7p9zc=
X-Received: by 2002:a05:622a:5a0c:b0:50d:e471:2d1e with SMTP id d75a77b69052e-514a0b162bbmr197710461cf.35.1778587200198;
        Tue, 12 May 2026 05:00:00 -0700 (PDT)
X-Received: by 2002:a05:622a:5a0c:b0:50d:e471:2d1e with SMTP id d75a77b69052e-514a0b162bbmr197709991cf.35.1778587199702;
        Tue, 12 May 2026 04:59:59 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:74a7:1c82:3f14:b431])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e9067811dsm73933355e9.9.2026.05.12.04.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 04:59:58 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 12 May 2026 13:59:26 +0200
Subject: [PATCH v5 4/7] drm/xe/i2c: use platform_device_add_software_node()
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-swnode-remove-on-dev-unreg-v5-4-0035eff63812@oss.qualcomm.com>
References: <20260512-swnode-remove-on-dev-unreg-v5-0-0035eff63812@oss.qualcomm.com>
In-Reply-To: <20260512-swnode-remove-on-dev-unreg-v5-0-0035eff63812@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2520;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=WGHMjJxrf7oH7IgvHdLBFYDNllKP66ZEIO8mfOfwUTA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqAxYx2ZLKH2mMb9P0WlhVjxpG0796FSFhzeTYC
 sdRRHe05rSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagMWMQAKCRAFnS7L/zaE
 w8a7D/wIiiIDPJH/+iIMwIbha36LuO+N7wt5BKJwiQ1mnZGHaHUaehld6NCSuZ/+zP4sy1QO4VP
 HHMfo0uxwui4fTa1wEUyzrNRv9nqpCxdndVr74+DDugDpBmNpyLFl6dPKGIt3To4Z3VKBRvsWo6
 Le9q32W2epex6IrbhcIctSDzDTWFt5Owm1xmpXYy2qOM4N2rydeVx6Ok9gTCc9blWXYoJSVQd7G
 RaknUUAdAZmDTMzHZjTUu8BCF6TBbbRHKR+53IgdZn3D+i1XpDEHa+qQVsh2eL/Xi0DucI3YTKw
 IEVWs5dl5ep08Z7MtIBOf8DO9OMQXYpsWk/oMF61GL3iGo3E4MT0OyhrMY47FroSexr0iqCZ+WX
 zoYqJ+XnlaD5UHY5yNdVVEwqlBG1O/XUHFR9BpE+V7a4rCDliiV3rO12Pw7ZAemlzzJFS61fgVu
 CBPkleiltRXrUQ4wOWhue5GWWoiQn8rHnsPMmNsBp2Dnn3siL0aB8FLCL1WNE54Qw9T4xlyIQCQ
 OhpuZYuSSZmL9nmxOtqiwuHeVNThzm9A7jLkx1lWyJCCMTvRfPEuLQ9YdK/09iZv+DdmlSXVQ8x
 qrVc8Mmws39mPN7uCAd+8FMJ9ejfDq0AnLKPM2/qQO6yAsEYyf90nrFz58gE0rftVCAhvpHX1Tx
 qdjUUPNn62OIujw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEyNCBTYWx0ZWRfX4iqVk+9gCg/n
 aAZBl8akpyDNZVAEuKjMWE9f2KQ7tXYiCAZWJQ1qzBlrWdzaYxNSjkgJVz+XGT9DUsOqdeuY1o7
 THkevtB9bND13bEEksYXzduBciVW4pdY2XU6zxMIaonDfeugIvMqEJbKV2dj86aJn/Z+hqiV/TZ
 f8S63h9KN+1Cs9lThKwNRPUKLC5OqMA6YKPPC/WlNU4yannTLX9wfnDtHGMgVQE9ouF8m8/S3dz
 YYjdPDrjuk6QB/9XGbd9nf1PKfaLd1RuD75yIcQzQkr6FRNkyfGeL+B6GPUFGAAJ3i3Jb/xJJnW
 TBQQojWWy4jnv8nlQFMYMQAOIQH2HRjBT2Gl1bGvSrHaGdconENYuM8JBNCfov/1Oz/MQPflXTK
 xxjIFmUgFzCt83zmYDTGWVlqHjlXo0SIgqiZOU2NpUDRLKrNkOzP3mRg35itn4wVCcgjMEGQTKy
 M06naSY8p1NXCk3TbPw==
X-Proofpoint-GUID: WJ5oz0R1sg7a2gTwH-lSiGaba7FRYJt7
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a031640 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=583x_htki4uszOnHNJQA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: WJ5oz0R1sg7a2gTwH-lSiGaba7FRYJt7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120124

This driver intentionally uses the fine-grained approach to creating
platform devices. It assigns a software node as the primary firmware
node of the device it creates. Ahead of improving the reference counting
of platform device software nodes, switch to the new interface that
internally uses device_add_software_node(). While at it: define a static
software node with the provided set of properties instead of allocating
it dynamically and simplify the error path.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpu/drm/xe/xe_i2c.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
index 706783863d07d66b4685005d6649b3cd143ecc3b..7f4295e7dc74f112abff8427485b5c8a5ad71383 100644
--- a/drivers/gpu/drm/xe/xe_i2c.c
+++ b/drivers/gpu/drm/xe/xe_i2c.c
@@ -53,6 +53,10 @@ static const struct property_entry xe_i2c_adapter_properties[] = {
 	{ }
 };
 
+static const struct software_node xe_i2c_adapter_swnode = {
+	.properties = xe_i2c_adapter_properties,
+};
+
 static inline void xe_i2c_read_endpoint(struct xe_mmio *mmio, void *ep)
 {
 	u32 *val = ep;
@@ -96,10 +100,6 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c)
 	struct fwnode_handle *fwnode;
 	int ret;
 
-	fwnode = fwnode_create_software_node(xe_i2c_adapter_properties, NULL);
-	if (IS_ERR(fwnode))
-		return PTR_ERR(fwnode);
-
 	/*
 	 * Not using platform_device_register_full() here because we don't have
 	 * a handle to the platform_device before it returns. xe_i2c_notifier()
@@ -107,10 +107,12 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c)
 	 * platform_device_register_full() is done.
 	 */
 	pdev = platform_device_alloc(adapter_name, pci_dev_id(pci));
-	if (!pdev) {
-		ret = -ENOMEM;
-		goto err_fwnode_remove;
-	}
+	if (!pdev)
+		return -ENOMEM;
+
+	ret = platform_device_add_software_node(pdev, &xe_i2c_adapter_swnode);
+	if (ret)
+		goto err_pdev_put;
 
 	if (i2c->adapter_irq) {
 		struct resource res;
@@ -123,7 +125,6 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c)
 	}
 
 	pdev->dev.parent = i2c->drm_dev;
-	pdev->dev.fwnode = fwnode;
 	i2c->adapter_node = fwnode;
 	i2c->pdev = pdev;
 
@@ -135,8 +136,6 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c)
 
 err_pdev_put:
 	platform_device_put(pdev);
-err_fwnode_remove:
-	fwnode_remove_software_node(fwnode);
 
 	return ret;
 }

-- 
2.47.3

