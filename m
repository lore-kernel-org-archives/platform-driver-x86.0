Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54C04D8D9F
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 12:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778587205; cv=none; b=K4q85afL35sVBUm0G5yVPjVrHcINNidJGxm1Q+6MaxF7n7ionHTshq69W+4KcF1I8JduykIcSlfr6c4kKfdiWeWvlguMspOimTDDWgykZf0APH0XEJnx4B5i2c8kjWquR4X51uSmw4QlqpvryOTbgrhW5Tfxwf6visxjD19sBgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778587205; c=relaxed/simple;
	bh=o5qzvWWbh5DFQqh9VSRzCVHKMN16O5fAII+Drmf/uwQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QpVwwqx0XKQ/HgzDhzwLNbMDjsd0NrsIobvAEF9KK0HhRAj/qAJrVB/Y9yUd0dqk2HRcIn3xmEKMGXTuBZzGDxhukme/Ej7U6EWSXNWjKAE3jc/bA5+0R1L71iBOwxwY70+w6U08Z3hGmBFE/KWGDloYh4PHAEcQaj02dUG2gsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VbpRXmmu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P1LdN4RD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VbpRXmmu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P1LdN4RD"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CB5MlM591860
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 12:00:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W1ocdRKROTEYKM8Gkerub/6nliQHs5DIXO6Yt2v/oAk=; b=VbpRXmmuQqQ5qVCU
	RJJSwsi8YyzrKvLmTJW5z9ilS0EaWKFCIgIDSbAQLADWHSO+n2rJ6v1/vITsZijG
	j6inF/wJuYG5k+3ao3kOSb2gt55P7+GY4deEe4kzowQPVxgQ6ueZUdLHt9UOgZDY
	VZkt3kxDGbMA2GB5+TxAP64q0e6NghG8MrAXyLJW1HD8Ja9nzHWkqgu7KrBeYw40
	csCLSP+RZBJzaY9fyKeD8lAA8Vz78bHZtO/alvlEQgbIKF033vv4BZpe+O9ZuUxL
	aH37thCgBuoofqcZ5FT3uHpLfC12fgfDLynZRezXir5myO23d5wwqoESLlE4Dgqi
	PyUaXA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4319r8qj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 12:00:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-514b673c8f1so78655301cf.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 05:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778587202; x=1779192002; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W1ocdRKROTEYKM8Gkerub/6nliQHs5DIXO6Yt2v/oAk=;
        b=P1LdN4RDdGltGtMLITxfx9dUmXtv6/ctvyYMXNG2UBZM/1/DIbmq2O0WksKIM24bC5
         PCu9oW2Hq3afe3HybzB4KQe6CPZZsLpUJZHg7PbOLnwCu/nocVpm2mBNTM/mry7pRJZ9
         GNIW2La17Lvl6Wn4G8NmSvz5CrrW+4CZKT8U62UOaCdNp1ew7JehmQU3q00WWQt6M5By
         VeCcsdHKpUFyE9OUa4PIg6xI+2SkcMq0DGj82c0oRItFtzdaZ4OJmt2nGmPry5qtH60o
         sMB7uSjcUjKb0jNqRUfavqZo4Ker1KVIkGx+4nVlpKEt8xXSO6g0Yp4Ku7xfQoJSiSKX
         TtIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778587202; x=1779192002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W1ocdRKROTEYKM8Gkerub/6nliQHs5DIXO6Yt2v/oAk=;
        b=cOl2Ohg8cZAsshmFeqM4qvAcI6ziaJLxJpRk3cya0Y+W0pzFVCfi5tQTThbiaxER2B
         RMQQHH9iIrRLcGIe5dET51Qf/WqMHNvSR7s9WxNmxfJbUYo/mNipOFngXBoufpkCEFIZ
         fhbfIwqGB79tfHMPBevlGtEk495mUqP4Wz5j5ph8LxcfkV8Eh4QJ+tT30bkoUkZVrESc
         hKgSdfaNLYvPToX99N+m8N42LIULwjhTP5XMmgF20DM+tgeqJMRLnjKo2wBG48BJM1iV
         RjBC1EOdyH8JNia7XfOekwQfKkbC/fbUaNkT86RKkfAqwGseG4Qb6RsJDaKELAM/48XB
         mN+Q==
X-Forwarded-Encrypted: i=1; AFNElJ/JhDZRSvPyf430mxXN8YFwF+LNQSUcTixlPjqOkkPEwTFxbMYkjNWUwoDvXo0+71Hqtp6t5GX8fLsYT1hQO6/W16r9@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6DRwk7+gJTlt/dgbm50js0qR14fNMaTx0bvA5FCVdF5l8zid1
	u9fy/yfZgWNOTl4cf7YgvdxitPxfa70n/3SMrQqr9nOFLPvw5W7STya9j5FWnQ4yJDTYwzGh5dY
	zTwGthkL/NZdTE7t970qqkflvpDoSzzR3cZhLCgoKV21w1rPqFoP9O7acJpJjFIoSU+cgS00Rrs
	UP
X-Gm-Gg: Acq92OGlpuH0j2pcuJhpttTilB2B7bOkEWXqN8BLu2TIhYcBzJIA1mBRHRgmqJrANoU
	I4eOz3/cydwlm33/BhjdUhe90c8XdIFj5aVmnc+THDeIbEdAZsV1XayaYQDDgrFhzxU2zQLAOCT
	8Y13qJmTjjRpm4vcqHscBzuqngw1rJZpOAkoMlXYSVzsnGVfHarS4ZPX4Xgwtlkc+QsMBpbsOS1
	QhN2nHpbCXSiZ6uHRxCgVTIEtxDAqR6JHMh9QSzuUPLbsJZge1wexe5S0Kyvr38aOoQ/+4RAXHu
	0ROBhhYmF9QCRevetUBfXSMzBWzPjft++Ydf3ywIi3JijpCdMH6FSOhZ6nXPP9JpEBKV+kYDeHU
	m55LqCXsAvew44qyh3KE/hNn/Mvyd2uZ6/N8/vRYeloKTHH6H4EQ=
X-Received: by 2002:a05:622a:5149:b0:50e:5f71:62c3 with SMTP id d75a77b69052e-514d22362c3mr34391131cf.42.1778587202368;
        Tue, 12 May 2026 05:00:02 -0700 (PDT)
X-Received: by 2002:a05:622a:5149:b0:50e:5f71:62c3 with SMTP id d75a77b69052e-514d22362c3mr34390521cf.42.1778587201887;
        Tue, 12 May 2026 05:00:01 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:74a7:1c82:3f14:b431])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e9067811dsm73933355e9.9.2026.05.12.05.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 05:00:01 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 12 May 2026 13:59:27 +0200
Subject: [PATCH v5 5/7] driver core: platform: remove software node on
 release()
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-swnode-remove-on-dev-unreg-v5-5-0035eff63812@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2155;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=o5qzvWWbh5DFQqh9VSRzCVHKMN16O5fAII+Drmf/uwQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqAxYygPHpAD/qocFmp4XUtkTSI+UdhqkR026fU
 nuhG9wYasSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagMWMgAKCRAFnS7L/zaE
 w9JBEACdF9JAKwGbUN/7/vpGxkIxY4Z53T9iP0IB4Wsvrn2Z/RTWkzFYcsyta9gdVUsC30cUi1v
 Wtrud32nDPLsZjP9B+9n11nnxuVcDYM3YcmlcaFF6aFM7y2FK50ImRHVVGO3aIoaL1T7+0BA9qo
 zrX5i4uC0Y5exI93thWGPaSPt+ZTdUCUe8P8tHSfu73dvNEMa3jXxdDWxcaTqoINjtjBmDKnW5f
 MiufJMZyQk4CmPe0++KaQh7vAzdOBK9Dt1nuLk+1ARuJrQ1DFIl8wMMdJ+jFZIGt5DFaNkbMolq
 nOL0QhwG+1Uo1miuZTsiA77/sT95jq8haB4S/qZJ9uny/plHmX4N08K+/CW2LuzW6/VzEjBBaE9
 bL+tGPkLYUSDomKREI7AgNv+tmTHrPi2bvB4AScnlIJZDmS11OjPsQgriNO+6CcywhEifPUpS6A
 UQeGI18BnvvDEdqAOikuMKNyUnvnsHL22hJgKdzFwWwyjhZMrpAiTetH0p7hFPP8+uiMk9wKG3L
 Fiu4tA7yrEBfOWZaoU+ye17CQUnAVlbg6B9iChvLiBt4/Ptzh9sq0mWBbUCemFu1OLcrGTqDqAT
 vksr8UqkkJ/UKQmEwOkEMBc7ljIIYZ1SjdwxI7q6Kd5vwXNM0csDJpM8Rq47ezo1uKWv4Rj13vb
 IlMPFISGX85OT1w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEyNCBTYWx0ZWRfX4Qa56NeM/tOg
 sSoRI1NSRtueoMyfLo83eYhmsQGbMgI+HbZQRRuCPL6pV5VGxMDapuY0eT9FLICaqTKJOPrzeKn
 32ZGjeqx/anZppWGM1HdR4wz1Ozz1vgGm0IcrEHpQB7Bj1v0h1GZ812wWTI+Z4Jl+DcN2iknavJ
 Dk4BRXMbmFIBmjV6kZGvXu5hrLGG9chye2LBSVTH9517baqWJWAHAZqW/nMyg17bNiQ+Y2Hafif
 0o3RW4uD9zX7mhVftD1vRER/D7u+Gdoic6LHazcYZkorgmywLGOW9t6dLtSjKwZgL+TW0mZKVHn
 GtVHVDJQuO1QQfm8SzCv1EMlQH6ls4sULEEe0LRNjq6+Sc3n6y14+aKKtUcpLAAJyXtt4Ithb+9
 vLCLikSw/t6WG5D4eAdo+JfjE5PcB57Bntk8UcymKxwqgAukbxrMAQor9K/h9pFk7gnGhIYsU4X
 9yc9Qh8TWelKEKFD5pg==
X-Proofpoint-GUID: QvGTBK6j_siMALItChp_vSoJsIUiwKWP
X-Authority-Analysis: v=2.4 cv=bp98wkai c=1 sm=1 tr=0 ts=6a031642 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=j4F7sB7NKAO1HzpnjMcA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: QvGTBK6j_siMALItChp_vSoJsIUiwKWP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120124

If we pass a software node to a newly created device using struct
platform_device_info, it will not be removed when the device is
released. This may happen when a module creating the device is removed
or on failure in platform_device_add().

When we try to reuse that software node in a subsequent call to
platform_device_register_full(), it will fails with -EBUSY. Add the
missing call to device_remove_software_node() in release path.

In addition to the above change, make sure that we still function
correctly if a software node is used as the primary firmware node.

Fixes: 0fc434bc2c45 ("driver core: platform: allow attaching software nodes when creating devices")
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/platform.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index f617e02b171f6e59a3c40504a71f8915a41e8514..d2f40b348f193db842aa7c17c9c41be59a03d35f 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -599,6 +599,7 @@ static void platform_device_release(struct device *dev)
 	struct platform_object *pa = container_of(dev, struct platform_object,
 						  pdev.dev);
 
+	device_remove_software_node(dev);
 	of_node_put(pa->pdev.dev.of_node);
 	kfree(pa->pdev.dev.platform_data);
 	kfree(pa->pdev.mfd_cell);
@@ -895,6 +896,16 @@ struct platform_device *platform_device_register_full(const struct platform_devi
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

-- 
2.47.3

