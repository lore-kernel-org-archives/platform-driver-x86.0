Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092F23E0242
	for <platform-driver-x86@vger.kernel.org>; Thu,  2 Apr 2026 12:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775134498; cv=none; b=A1P4fkFhq+ZmK3+Hnsa2L+JSPxiCmsMkPHpGZWihYljztATqsrCzUUn1vxDLegPm760I6XX46SyVAHIDAms3CcdBhMETNvlhjeSr/WUxDDIIgpOUpJ49fNy434YQ6tLqYmfyqEqpLNZqfAlIS4bwt1PDjSrR5P9Pqb1LRod09HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775134498; c=relaxed/simple;
	bh=OBCo64whRbgHvAnjQKSCb3nw5YJMBTL4o4QzfncDFbc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lfbJYDBNN9EtZhc3IgJ/X+vAqNS863WBUNnSQ3WtdfNdaFnUxvYt1cic7ylNdtBdtpqtHHZUCLbO3tsWqV35yPXlcVtPabLvKJtxPvxUJ8s6o8/qMlILKBgXjLLBP89tVEmVi63S23mXePNhyYKCh7oaHuuzY+shHJBVCVpSZEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LWdMWym1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eNGKedHW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LWdMWym1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eNGKedHW"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6327CS9n4088667
	for <platform-driver-x86@vger.kernel.org>; Thu, 2 Apr 2026 12:54:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SnZdOD/6HrlBeelPSBeiJj//LPmq95XUDWd5dyu/2k0=; b=LWdMWym1AetmCDBi
	ub4pTKElBowU/8h7ic3JvUb1TE//Nfv8Wd3uzFUuWrh2WHuGtvoyf/677VJSiEmh
	l44O9Boa/Rc5y58+ML8hP/VBFiyU0fLwtn1Ggwznfpj7gPbmlVsgKc8Q6OFGX4JX
	E40DrSv12SX3ucjuDJR7kYkcQOUESNUwgzQrj4qM1nTKuTFuoQaDLe5Pg+dI6/XO
	hXg8oSaf+mBOiNOlkZ5gi/APJCY3BCCDMhL2iynuxrxJBI5yov8mTstwQCS8ilgz
	9gjlDVOM/ielNUM7BnL9wYNRaRQThwjlPBXR2uu28enI7AYDg4ugcQAo1xhrPJ40
	0spX8A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d97e044yf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Thu, 02 Apr 2026 12:54:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4031b86dso28020361cf.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 Apr 2026 05:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775134490; x=1775739290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SnZdOD/6HrlBeelPSBeiJj//LPmq95XUDWd5dyu/2k0=;
        b=eNGKedHWVEpKKkq1t1BjVFBMJXR99AmhkpMTSZAC62jSLQ0ljYXhXFuKyiPBt746tX
         JP5tzqInfcPWdoA0M+0Sdov3FzslzxkAKir3SGaNTqEk3uzou3T/LrrpiuKfi4cSAQtM
         j1acTXBC9K0xcuDtsTG9Qemo3w66CH735+EjqPlQVbvje+Qkl0qdMxASp1WRW4eQZZve
         ZObnRzL4DwDR0viP1N6Lo08TZ8PLvKr3rcQj7VZzDtsywl02GR7er9nA28netuvSAmmn
         oYWYdCUwLTCYfEnmnd8v40iy9ehs5pxoEQam0vuFo8MTp9ESkxpMIaDOT51e8OfpaokP
         zIqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775134490; x=1775739290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SnZdOD/6HrlBeelPSBeiJj//LPmq95XUDWd5dyu/2k0=;
        b=hFfOJzdad9lXvQqfeNhc9wNJcV0RxgtkziykbJpw4+PtVaP0j5TDPdwZs3t9O1ZW8C
         nUSmk99XcWUDlhqK481uh46JuSuDZfZ+aDmSZ1+CdCzELol4ZGI0opiUJXC/SjXOvFQV
         KjCFawQNtcJxWcP4p3DVMJOdknZEQ4+Ws/6v1LqslQluwzzjpkY9HsEESO9F/If/HTjc
         2oGnqwaSHpBF2gw58/XbEA8oGTeiiFJ+e60eDuqUCUaxBRR5CPrtzJzvYYjQVSPMalBw
         tHMaakSQnGhIlp0UjcNdb7P/MWhhfvyNu8OzhWSs9gt8TiPrh6BKfC8hSyhCb9K5yVmY
         KklQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBqpMNoau1L/6aeP7S1qjO7uDYt8oKp8AQJoR/doJnVQrKS/AMeT4PLATWOrcjxzIS3rnmbrGHnWEy4hnY9sH9n1yV@vger.kernel.org
X-Gm-Message-State: AOJu0YyEkFbRpcOGUmvFgJ0rv2PuItN2iG/NoWTG/9weO5q1DeGgMV+m
	j6mQ27p362X7lPXlbEvn/fkMz4Kf9kn2ix0OgdInVMmgQx0M1WZ6Iz87q9UN0/5PrB1iP2x2vds
	9kmS82hFNEmUpEchwnvg06xAkpsQbOE13TE5XAxROTTs3A4QmxM9SMEsN5mWX7SZUOcqwokAm3Q
	WK
X-Gm-Gg: ATEYQzw6g2W25sJ0nJ/SY1ipowaRWl1CnALuv43ts9F2js4aN9eFkS7nmT+DcdyYA38
	cYR0UQ5rCVYWXHdvrLsJlNTqlNfN0XC4lTgc+uutekdZ4J30QQRppazjdZDf7W638JJp/u4T9nV
	wgke2in2QIjM+nG84NyR5hOfe+6P2VhVEMY8Oy7u/lsHuMR0DZoC5WToHRCyivySpXTYhoH1tIn
	nce+Ap5lay04fe7m4AZOEIGCKiF8grgN5ErtHlOgurPVgLP2p/IaLeP33UDBR02pThRvOEt85Ab
	ujBK+twmqw63TJbVITPhq6uXQg7zNWx7NVpagHzJqdupETebMMXTHx88sX3Wb9zw42i+knDK2Qn
	Ui4hNATDrU9rmFUaqD7H5ucq5KJKxJExXTIaCiiwTLTtVit9nlvij
X-Received: by 2002:a05:622a:1489:b0:50b:2a1e:a442 with SMTP id d75a77b69052e-50d3bcf3e18mr102684511cf.52.1775134489898;
        Thu, 02 Apr 2026 05:54:49 -0700 (PDT)
X-Received: by 2002:a05:622a:1489:b0:50b:2a1e:a442 with SMTP id d75a77b69052e-50d3bcf3e18mr102684071cf.52.1775134489432;
        Thu, 02 Apr 2026 05:54:49 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4ff1:3e57:22ec:dadc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e735532sm235790765e9.0.2026.04.02.05.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 05:54:48 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 14:54:27 +0200
Subject: [PATCH v2 2/4] gpio: swnode: defer probe on references to
 unregistered software nodes
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-baytrail-real-swnode-v2-2-6f5054a4cc07@oss.qualcomm.com>
References: <20260402-baytrail-real-swnode-v2-0-6f5054a4cc07@oss.qualcomm.com>
In-Reply-To: <20260402-baytrail-real-swnode-v2-0-6f5054a4cc07@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Len Brown <lenb@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1419;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=OBCo64whRbgHvAnjQKSCb3nw5YJMBTL4o4QzfncDFbc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpzmcQUSEE6XHDFw8DGdZVpyLl+CaFoSdIrorju
 CiIynNOhIOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac5nEAAKCRAFnS7L/zaE
 w4RuEACB5VBkwCHcQ7BZCbTI/J9CdJ2yvC4mBxOlZ0uV5SppzmOiQja+z/Vz87C+5xa2o551+ON
 vYXEmO8A1CeXzPFkxkBYtB2m+V5pE5O1CO8c2UtrzVvxsSF/YQKId+9/l2b+n/X+GNbGuTUScum
 +5PExp0Yo1/6ulywtRM3aZ8a048kun2M2qwvRCgDefYUzj2nJrCau/mWu3kNkUBWeJsiI9rBM0T
 DvTF2jVhzzVsHLrJgcOFSOeZGLgyP1nOf/dGVd/S+dmadTLV3CPTg3dAN6ZpE52zRb6n+jq2hsQ
 gSIOFSdhoUKWOns4thnlVkUJCcISVJOgDxgd0cyYr92mjZV9fqfvEe2VRIpEmdNXXqnyNllIigB
 UW2wYoNcLfM9StWcLPSrTW3ooK+ZPheP+Hd5nfrWw3ZShS1dNOnZKCPKT2IgINhrplluYrn7A4R
 kfopULdzFe5ED2H8NhwEzPA7+EB/R6hfv3b3vxHnyq72fZ3+GQF3JGKh6IL0hRjLrNxeVltp4L6
 hYEtBkCuP8fNzCyRkb0Ww02+vaTTP2SJcwdD0ryBX5GPOdRW2aU1ZlIKimDX9sr5sVZ7nRvKZVI
 xNmXYKEIXGN2HxaPcliFZD3aSYk/ARhrr1xPu/bqu2BYzz5Fa7tN4RkBzGg7t2K8MAFTAMZEk86
 faSlBrvQVKIHitA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=fdGgCkQF c=1 sm=1 tr=0 ts=69ce671a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=H5P8rdbTNIBZEmRUth0A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: vvi1a5jzPKC5k7ZaWQE5m_aP7WX_JcTw
X-Proofpoint-GUID: vvi1a5jzPKC5k7ZaWQE5m_aP7WX_JcTw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDExNSBTYWx0ZWRfXyOBjF5uqMg9z
 JxsXqIVl7e34vgG2sxXpdwVgErVlLK0XxnpIaswBke5gTidL9MiLsPg9b8dKxFAPNP8LxxShegK
 fj5LFGVmUzZcthWDH9R3cdp8TYtRy64zgpECmK+YF6bq+dErx3wjUHSUqDwPqseWGiVDvHLl9pR
 up5YSw89Y7d1b+lKT6/7Q1BxrI+OyZQC6S3ARlNSn7jtWMznM8SwK99lwCnyDN5xkKmPQp07V3q
 lmhQhdLFXbOg2L5sgzGg60ann3SjkL/pUhS5sbWMwk0EwWPgbE70sJiAqEFmk6cur0e6CDBO+Z8
 oBz3ZPAY/OKxmfVGA9y9y1E9yFVtlMqRWTssJstSVXRfI2ZQKAfcMALvwOX4Nhey3gIUTZz+vnN
 9TAhhXmvpjwAgg2Bm81Ak1wHbvSH3eKLhigVBhlHfJ5XJpPTq8bzK7jonhDHM9wOc8x6DT0I8lK
 SP25yIv0CxPbwwdAWsQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020115

fwnode_property_get_reference_args() now returns -ENXIO when called on a
software node referencing another software node which has not yet been
registered as a firmware node. It makes sense to defer probe in this
situation as the node will most likely be registered later on and we'll
be able to resolve the reference eventually. Change the behavior of
swnode_find_gpio() to return -EPROBE_DEFER if the software node reference
resolution returns -ENXIO.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-swnode.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpio/gpiolib-swnode.c b/drivers/gpio/gpiolib-swnode.c
index 0d7f3f09a0b4bee0cf1bbdaa8b7b8ae4cd5de581..06d74e9e199de0b91a019e5e15d4b83d330291e7 100644
--- a/drivers/gpio/gpiolib-swnode.c
+++ b/drivers/gpio/gpiolib-swnode.c
@@ -95,6 +95,15 @@ struct gpio_desc *swnode_find_gpio(struct fwnode_handle *fwnode,
 			break;
 	}
 	if (ret) {
+		if (ret == -ENXIO)
+			/*
+			 * -ENXIO for a software node reference lookup means
+			 *  that a remote struct software_node exists but has
+			 *  not yet been registered as a firmware node. Defer
+			 *  until this happens.
+			 */
+			return ERR_PTR(-EPROBE_DEFER);
+
 		pr_debug("%s: can't parse '%s' property of node '%pfwP[%d]'\n",
 			__func__, propname, fwnode, idx);
 		return ERR_PTR(ret);

-- 
2.47.3

