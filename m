Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506175;
	b=jxEc2Ax80Azrgyb7qOmZlo0tkMdTIT4sCS6F43OMXpjy65QklZWQIk8ZR5xTWzO7n8WE
	 JxPpBKZmFsKquFr9/2lyDmJzYHt1YJmh7RzkX6h2nCiFtroLZAxjPOwP/eLRXZgry8o9T
	 tnOe1Rm75/iE4OMzVrcFCLjUQ4Mf9RIudgetVae6ticw4qXJdW0R/NSdVKTJyBv8S27j/
	 IAiX/XERtMvsyLjqPEx10JD3w91mhls8Fyc//btztosqDyf5EZU4nCVF6FBXQhgB/04kJ
	 2svDTzqLhbpVdYblQ1Da3saD+NyNpQEs/jjRaiyfx6ih68eSugDP1yGed8pExg8Ro9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506175;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=M5XXT9PbCeShoqfit1SVlb+9SrxFFDVVbb0WMkC3kkc=;
	b=XWrBXCcOzy1w1dk1GejHacuxIb0sY3UrDTNXsnSGdlLCX4gdPdnkOf5ejd9hDY+Ew0JC
	 +h6OglJBn0YZUi3cfSafkQ41hWkU/BX64+1ZWKTAFU+y1gL95WbCtzPruuWsSTn9r8pG5
	 mjACdMKCL3ymSAGPhRpsoYyZwYAyLM1UV/wHyjWmlcp3kTgJI5SgPlxC9wlZQIODA0k6u
	 LNhkTWCeK9ICuKW4cfnXou9LCIA2GeK0tzxW6GbA+EaZPU6gDNLJEPhb2frn+QNKFpmWq
	 BcF7vRDBTFJumTRTkX0MlqNNolvpzhrJUQjzc0LuqaHwBAWuKBRpHMuoUbWzrq1gMbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k1rzwpgc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a3irKt8J;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D438360A2603
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 14:22:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D438360A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k1rzwpgc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a3irKt8J
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDA88s1209820
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 14:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=M5XXT9PbCeS
	hoqfit1SVlb+9SrxFFDVVbb0WMkC3kkc=; b=k1rzwpgcShbZVs1T0vw8SpnpmMC
	lrNHDta41iLXknGuWHIVkKq5HQ/yYCfJ+MrZJd1xPxmN5vcqCVt+ANMTJ7VGLQ0d
	xrLfFgnGz+fk+BP78IObH2QWjJQR9Xz4sa9G73oenfs9UVPntfhJcEuNWvgucFCL
	ymfDZ4GISKOFCnJK8pHg9Bq93WHrKgO0VN7OSabQ7eBvjkIX+zx253vUXQPOuyBa
	6zrFSf0lQlRQGC3RwqZH5WUoIibhM7kQ7+1kxqOsvtL4+6d2nFduC97SdfaCXhKt
	9fYgQDNM2lMNTl5KIa278TDqPXZ5dR174rxQlWTSlUcJWlPnHdKa97dYExQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5pavm3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 14:22:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caf6c528aso544841585a.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 07:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792506173; x=1793110973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M5XXT9PbCeShoqfit1SVlb+9SrxFFDVVbb0WMkC3kkc=;
        b=a3irKt8J9zTFcvEgaowSY0f9PEcvPF/xgBzA/nUn0SW5tAWqNYkQY9PoXdaeK0LODJ
         pSs7t5jteIgw7rkdeUJRmiofDQ2W2ZKsL0de+YIIsXpsWMtCAn7FZYg1tJX3r2RbnQUf
         4TuIsBNRpu3f8fG8uFDqBZ4s9IFAVbvMddmfQ0oSZUL8b3jsZjg/S5aXPOylf3a7wujL
         HhofK0umwkAok9Z0cvzGIcF5XNFM4C+LNyGCHCGYuZ9TdcqzR9wTyjlaU/rkbRtiC7X6
         +he8kq+t94SW4gQNic5X4AdyfXtmnWvEqq/inrNLYUW0g8K1+hL7jDr7NtM82eHlRwiz
         4jWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506173; x=1793110973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M5XXT9PbCeShoqfit1SVlb+9SrxFFDVVbb0WMkC3kkc=;
        b=IlyTD/zZo41X0mFvHc6AcyYenT/L8vleiPhq3bqcbncNo7b1qeHUvf6zs1mDrSNzBk
         /Lb9ZD6jKY0UmC1vB119EFzix2R98P62Z122SAoe6H67K2C9MfhuizZiKTXXtgJtb7rk
         w1YhVkIwMcEaM7DxZ3P527sqLUQKe3eivJ3OAR7PlGkumb53BU2akqhdTepTTv7nlZhe
         5C4JidUBsBpg4vX4I71ZOc2QB48H8Fu1AwSJFibZLyY579fOf/FMccC6v2z2beMoUUnF
         TScYV+ZqCxm1hejWePUpziIm72MreZwe2bEg1rmiir3QI7+ZI/tdCQymcmG3mZKxDll4
         TrAw==
X-Forwarded-Encrypted: i=1; AKwUvBwFfQo4yAB/v9tssHg6C+Rg9OUoQCjCl3JHmx/RoGy+42Wy65SlD1iFQB9TxoJItECLHstxrBQ1hDzjwP9e9W2tB0SL@vger.kernel.org
X-Gm-Message-State: AFq9FYIUwCvg7oVljcLlOrS0Ci0YCj2QBgJPPy4v0unbA3gPSjtGq+wS
	M4ZBmleV6RtnGcgen3kGn8Hpk0ohur1p+BYpGZ/+wMieW4Ni9xB00ZEmnsWwpPv/e5J30OOW3b5
	Eu+44H4pzKqtndTgAYuLu6RkO1SfzpqZeTjFViPk5RCNp2GwFzpfMKUwkTVXR3peYfMccOEpyts
	+Z
X-Gm-Gg: AYBFou1ReZKUzv9j3I0QieqCSV1eZFXwdns6ExeLXkB5Q/eLpCYHtJ3SA4IGLyl2E6J
	1v7gOnm6LmOcGNuGKiApYCAQbK56pjdDJCjefZtkTWYsQYZLPMuzynKpnwY6Pq3vPutnK+k4dur
	JIFM/sKiTjeL4h/19w0y0ZvTk0q/oONAneyFGvrc20efKLdqFL/RrFfxZdYQm1SnoKBakIGAhNH
	d1CHUjUIuC6VS8RexIq0VlOu73pJDtN7pXZmsDLCqSNAYcS6tZy6pjoGlz/83jNzNHwg6cXvjlB
	HyYn7asxLQLH1OXPBt/kMlxP2jZmRXoVzFOuR1h14N3V58YEJu4DMFM3pWE7EIhx5atGGZS+NLt
	nkdaJslHO0mvzSanLS1BlEK8647xvJ7W3peaBgXQ3F3CsXyMxXsyxxcbmykSebbcA0Hw/HRngF9
	fE81iI/hhlCV1VXq4=
X-Received: by 2002:a05:620a:3715:b0:93e:c12c:9dd3 with SMTP id af79cd13be357-93f29e0afd2mr1795257685a.83.1792506173069;
        Tue, 20 Oct 2026 07:22:53 -0700 (PDT)
X-Received: by 2002:a05:620a:3715:b0:93e:c12c:9dd3 with SMTP id af79cd13be357-93f29e0afd2mr1795252685a.83.1792506172509;
        Tue, 20 Oct 2026 07:22:52 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1b113dsm5185084a12.10.2026.10.20.07.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:22:51 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Antti Laakso <antti.laakso@linux.intel.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v2 3/5] platform/x86: int3472: Add support for DOVDD and DVDD GPIO types
Date: Tue, 20 Oct 2026 16:22:41 +0200
Message-ID: <20261020142243.25072-4-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020142243.25072-1-johannes.goede@oss.qualcomm.com>
References: <20261020142243.25072-1-johannes.goede@oss.qualcomm.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Ny26diB2eVP6K8woFMafkQUS0MPYqwx2
X-Authority-Analysis: v=2.4 cv=fb84WEQF c=1 sm=1 tr=0 ts=6ad7793e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=QyXUC8HyAAAA:8 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8
 a=1kVSyC6lAo2a8Bx00SMA:9 a=NFOGd7dJGGMPyQGDc5-O:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NyBTYWx0ZWRfX2y24+KTx5bH6
 dNCFqv8zJQ5CR8JNIUOpta5x2OzPlLiVXhwmhq3nPuvGbMsIHhkpcsnuAMkPjajgMwvReWQTsub
 T64jKgx8CibDgt2MC5JwfUHREmHDYxMdU0oJ6vbeqmpspO0i69t15yDVYNZZVDVcKhxwAhyjtu1
 Shx6CVswCHECKnwVIjm9mGUcMXLUAwcw1jMa1ChUVFAo6A/RflXFM7pC+P4Wl+hhoqiBkGUhF8m
 Waj3RcuQRLKwOJqmyjWiOAO16Z0pk7bF5VZLeqA9s5VJ9MgwjSATnkGhyftQzM+51nhVUUuQENo
 QuiZFrdX4K92ElyHeGIXVBkRaZ3J6FLhGLuGj7EaBSKg0673vAN6PN8ER5wBlUTatSnr4vqWfkV
 0F8jGsGfWYERkWKUrD9G2QKpCWbAKXqAtd6iNnE3dIsHjBMRYebmvrlQZUQ3moJJhfTu8uZmzv3
 u023KNSkSGDagXQzR6w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NyBTYWx0ZWRfX01XxLTDo0kZ9
 QV5/63DuBgMajDsLy6yEiG1IICLIcBMcI+9sS6/68jaqzq3mQIaSwJlZbzwiFt8/Dr4lj6JO1lq
 6nkxgYLk6/AB3zebCMizPAQa7dCxLW8=
X-Proofpoint-ORIG-GUID: Ny26diB2eVP6K8woFMafkQUS0MPYqwx2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200057

Add defines for INT3472_GPIO_TYPE_DOVDD (type 0x0f) and
INT3472_GPIO_TYPE_DVDD (type 0x11) and map them to regulators with
matching names.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/platform/x86/intel/int3472/discrete.c | 12 ++++++++++++
 include/linux/platform_data/x86/int3472.h     |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index f3d6c6ccad0d..046f93ed1c9f 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -277,11 +277,19 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
 		*con_id = "dvdd";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
 		break;
+	case INT3472_GPIO_TYPE_DOVDD:
+		*con_id = "dovdd";
+		*gpio_flags = GPIO_ACTIVE_HIGH;
+		break;
 	case INT3472_GPIO_TYPE_AVDD:
 		/* Should be avdd kept as dovdd for now to avoid regressions */
 		*con_id = "dovdd";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
 		break;
+	case INT3472_GPIO_TYPE_DVDD:
+		*con_id = "dvdd";
+		*gpio_flags = GPIO_ACTIVE_HIGH;
+		break;
 	case INT3472_GPIO_TYPE_HANDSHAKE:
 		*con_id = "dvdd";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
@@ -403,7 +411,9 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 	case INT3472_GPIO_TYPE_STROBE:
 	case INT3472_GPIO_TYPE_POWER_ENABLE:
 	case INT3472_GPIO_TYPE_POWER1:
+	case INT3472_GPIO_TYPE_DOVDD:
 	case INT3472_GPIO_TYPE_AVDD:
+	case INT3472_GPIO_TYPE_DVDD:
 	case INT3472_GPIO_TYPE_HANDSHAKE:
 		gpio = skl_int3472_gpiod_get_from_temp_lookup(int3472, agpio, con_id, gpio_flags);
 		if (IS_ERR(gpio))
@@ -430,7 +440,9 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 			second_sensor = int3472->quirks.avdd_second_sensor;
 			fallthrough;
 		case INT3472_GPIO_TYPE_POWER1:
+		case INT3472_GPIO_TYPE_DOVDD:
 		case INT3472_GPIO_TYPE_AVDD:
+		case INT3472_GPIO_TYPE_DVDD:
 		case INT3472_GPIO_TYPE_HANDSHAKE:
 			ret = skl_int3472_register_regulator(int3472, gpio, enable_time_us,
 							     con_id, second_sensor);
diff --git a/include/linux/platform_data/x86/int3472.h b/include/linux/platform_data/x86/int3472.h
index e1d5c4915ef7..f0ec2e7c68fa 100644
--- a/include/linux/platform_data/x86/int3472.h
+++ b/include/linux/platform_data/x86/int3472.h
@@ -30,7 +30,9 @@
 #define INT3472_GPIO_TYPE_POWER_ENABLE				0x0b
 #define INT3472_GPIO_TYPE_CLK_ENABLE				0x0c
 #define INT3472_GPIO_TYPE_PRIVACY_LED				0x0d
+#define INT3472_GPIO_TYPE_DOVDD					0x0f
 #define INT3472_GPIO_TYPE_AVDD					0x10
+#define INT3472_GPIO_TYPE_DVDD					0x11
 #define INT3472_GPIO_TYPE_HANDSHAKE				0x12
 #define INT3472_GPIO_TYPE_HOTPLUG_DETECT			0x13
 
-- 
2.55.0

