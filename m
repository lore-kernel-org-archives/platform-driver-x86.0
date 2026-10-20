Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506173;
	b=cbq0pUYbdfgbQE/ZtPyEULRwQxw3BxpUHZKhgeTXwi8hJBZQHQSZhPdgsuCiyDHQapx0
	 3rZ28di3ovJMlVMbRaJUQTxjEQlIPy4fvxvP6Q634FhDlomX4pVVhCK4OfICrjkXjmULh
	 hAHqI55dPOUtlZZD50NlDb9eb8d29ZKX870LJlHzJB5wzyV8Qk8PeZYp9YlJRHuma9IeB
	 VXtj8teKkIRdGeiePJpuI1e+dPJcB+O8Ue882KX4aG8erw42TgGKsN79T9bcMvbHDDP6N
	 MUD8S3Yi7BIMSNTCWDVthV5GJ2Jo5qlTXdlUQLvezmdB4WunjSXo1qi/vwMqAn0nkOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506173;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sy20HFe7sezSnTXwFgE9eaT+XIXNwOcq9JipMDw64bc=;
	b=LL2xNJ3r983DWqfdNNUcI5QSl9lBnJWy7zT3v+PTD1PCRumuLvkWNADDHEZDbbCZsbcn
	 ABQ//kpYqh7aefwHqJjsCNfoG1utBAIunvD1EH/Fzzos+PlNLQ5svB5HpmR+0wQbBJUP1
	 2Q1wnPzj3NwJvzDiEUnlCZ4OgWy07ONFaOBnzl8IPXkHfrMBi4smbpGzXh9RjAN+nnZMl
	 GvbShWPFcgkVA3toaYi/1FxT7o81oqvDe8UDHJBQPsYojWYTq8Rd6ozqjxfwgbniEgj+4
	 pPeMzkehps4oO2uFfFVG7f8wzg2nBw8OeppjkOTuIOEYsDFp2X+N/drCBvFnBUdts9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G7C63gyl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i0aZqIAt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A71C606A339
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 14:22:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A71C606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G7C63gyl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i0aZqIAt
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDACR01429965
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 14:22:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sy20HFe7sez
	SnTXwFgE9eaT+XIXNwOcq9JipMDw64bc=; b=G7C63gylrkLwNqEfcxXkdzjHe8A
	haVuAumVU0IOTeJ/RLg5tXDU0wjB/RdHKR16hqq0ColBs8xo4EJI19/VmkUb1WTO
	nwBayxyZOZgkgtWfMjW0s05cIQP4JQbgIzO5cJQZ6mVsNSzjw6xfzZVc5f0IJKeR
	6W4cOVW+zjmLOZ0zPg4J1zfa/+Tocew5xQI7AKoS+iJU1WsfvbLi28iyD7PQSqmS
	yd8UYUqEWUPiCxjFH3+B5DZvUed45na0JcIG1TlJglbuIXNappuEfAY1FlPqCv4I
	ka7XsbYrmHYZ6Tv4wJ3hoogn2a4JredGUxwo06UvKZGqb8/kx/aGCppkcmA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5qaury-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 14:22:52 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc48fbca26so715739137.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 07:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792506172; x=1793110972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sy20HFe7sezSnTXwFgE9eaT+XIXNwOcq9JipMDw64bc=;
        b=i0aZqIAtcPFkpYLAqMj1SbnMvyOfYBKQLG1iaJO/QNtaZ6tNJcSQZbEdkhXjxHSjW+
         rjwM4z1ma0OFySshZt9csmxHsDDzNLm1y9aqMHeikIl1hGekLKyTLrmUQ8gjbxlm6AZv
         Lsidw6QAPxrQpF7pkycLpNX7ZLthk911KtHdqxqP78AotgcPoLymPH4Og4SuibZ+glUg
         Z6sSbipMBqNtizpc1pNRju6P2oii4RjNZoW7nLRpywkDUHO3+rUHbsg0Wqbb74DThU9/
         AO8rNtWC8Hy6wR7I9X8jIz7gBuXXVzRSXS+8RvGIghgCvrZGJxDJYRfWyzvjVFD5gNWA
         Jf+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506172; x=1793110972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sy20HFe7sezSnTXwFgE9eaT+XIXNwOcq9JipMDw64bc=;
        b=q6rNkkOJ29DjjUi5yrTA/PGvSOYNJDZ+NQrvum/3kdyRuQU0Hx/MaIcGb4P0vnfSxR
         RBMTdasvYiFh2BT0DLUOihTbF98YMgp/JYf6NSZS+zmug293EgyS/270gODnLaSKWDnT
         xac7BHakwqV7Qqs/G3KtfRUDWld4uM83fpSLME8qaxo9bCGFkXg2EUeSK3WpQPVBw70L
         Oevf6sd53Qin6lE2WMeNP8zlcsmk09HnmmIPXnAifx1p5miQ6LUZe3P2henDItBmfAqv
         Oay5I3y1lpOCmIDrrCF6AiXkmeOYZwt7IPM7ThMkrkd6bZ74eWznopUP/Xt4toVJaoHS
         a5XQ==
X-Forwarded-Encrypted: i=1; AKwUvByHJf24ugGy1gr05+SZSyFiei50h0C/QoUjo+Xw2MvEAzrKsOj7A32MN6RWpBrvPb+bi7KWO9Hu/GNclJsOoO0PdcEN@vger.kernel.org
X-Gm-Message-State: AFq9FYJtU7ReogrHmUXMA6PCxjYcrYhL0IHmnxqfvDUSNuDJ6lJuKAZx
	svvbT3DgbuyS7HYGU+ZVKxMx/k7dGTMfQ0J7Sb5xVncEGxI1p/QljaCLoeJMqCbjdQrRtWrXNO3
	C2KNl2Yz933S2ZH1NCUIKHO55KwuDjpErobNoPUwLwPjhXsnlB+nPPiFnCFTKvKOP59SMYXmdZB
	sDbuL2B0q1
X-Gm-Gg: AYBFou3g8T6LhS9pO+/YHDUSau+ci9xrdOO9roy7uALwAPq8HYYKAdCaLt+ETp+wKzb
	frryYQ/BUGoSqK/rK7QRllYHK+DoCJoV6HECLYg/oqmNO+RvcUwUl1fUc97hnJMW9qJzJlW5QNF
	zirfLJG+fVId5KgKw/SpzaFw45GCDp2yP6DlRaw7wZHPmRG7hb4ZSgOPc+vZvMDTm0uM/COOv4U
	vzaAFXMiNu8sPtZPI1dClDs+3yEfcMTNmJPy2vI8NvK5QsMNTk31gp5KZw5yqtBDQbrMlkKq0bx
	G4aY0mgqfvnNxzc8+9j+JM8OREdb2sRkcvJfd41oDijGTLy1Yvf5m1cgtK/+Ww3UaXhD6gtEd/c
	G/hpTQkFUfyge9sbEGp9slzxg57UsTJSL6ZWx7SJaX2yG6iVOCmouTYFUV25tIQJqpSVnXv1fxv
	7NFezb9I0X4b7hiwY=
X-Received: by 2002:a05:6102:5488:b0:7cc:2bb7:1321 with SMTP id ada2fe7eead31-7cc36aba539mr2280597137.31.1792506171605;
        Tue, 20 Oct 2026 07:22:51 -0700 (PDT)
X-Received: by 2002:a05:6102:5488:b0:7cc:2bb7:1321 with SMTP id ada2fe7eead31-7cc36aba539mr2280590137.31.1792506171085;
        Tue, 20 Oct 2026 07:22:51 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1b113dsm5185084a12.10.2026.10.20.07.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:22:50 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Antti Laakso <antti.laakso@linux.intel.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v2 2/5] platform/x86: int3472: Rename DOVDD GPIO type to AVDD
Date: Tue, 20 Oct 2026 16:22:40 +0200
Message-ID: <20261020142243.25072-3-johannes.goede@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: DgkMpPo-MelUklOFv0_JIDXEzBMoFm7R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NyBTYWx0ZWRfX5xxtRygjQ61d
 fV/xukGdGbBVIVVrGzbfI+feldxb5q8KDczMRP5ZvtrHm9IB5r4bAPSKYeDadXG/BEoyvzOykhl
 6KvfmemBeV1kHpr6U6Y7Eq3CiERLqIF+Li8njEXtAJQf8IbbDGjDir9NKjoP1M249Uj0j0rlqzf
 A1Yr6FrPddgEf7DInY6SleY4cTK2owYZ6I0cnf56yEBSiJEPawDs+XHzg/LvH8+yqNm/BbSZk31
 SPLw1/Xq4HyBaSZqrSvpuCGvkatye7daIUVcVDgagXbjmEFsR6HVaEjeH/VfoZoe1uvuZz00RCa
 HvgRj+kotkwrjnvQzw7T9HzVGtNrMvsN1btQEhTfAUwlJVUKLJFfckqKAiCI92F7f5ntbUeShiZ
 rdJ2MpP87OMn3dZeqG1Wowg/kA11NV7wL2i8FiH+EGO1NIi20jHzAu/AMgC2NgxLVZijfJIIIbL
 CfhQkrIawG90WZOpICA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NyBTYWx0ZWRfX/5TvF0dsvkyt
 +YF/2CfnplP0la5NzziLmZ8bQf2Ahar3d4OCII7d+3Z6swFONxXAQ+gzi3eHJFXq9dz2LNLv5tM
 +jucX8IW5D+33B4THFJs1QsT1IZ7GSo=
X-Authority-Analysis: v=2.4 cv=LpcHWXdc c=1 sm=1 tr=0 ts=6ad7793c cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=QyXUC8HyAAAA:8 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8
 a=5k0iGRGwmvYjmk2vAgYA:9 a=crWF4MFLhNY0qMRaF8an:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-GUID: DgkMpPo-MelUklOFv0_JIDXEzBMoFm7R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200057

The window drivers call GPIO type 0x10 AVDD not DOVDD, rename
the INT3472_GPIO_TYPE_DOVDD define to INT3472_GPIO_TYPE_AVDD to match.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/platform/x86/intel/int3472/discrete.c | 7 ++++---
 include/linux/platform_data/x86/int3472.h     | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index b19ea6ee3374..f3d6c6ccad0d 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -277,7 +277,8 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
 		*con_id = "dvdd";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
 		break;
-	case INT3472_GPIO_TYPE_DOVDD:
+	case INT3472_GPIO_TYPE_AVDD:
+		/* Should be avdd kept as dovdd for now to avoid regressions */
 		*con_id = "dovdd";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
 		break;
@@ -402,7 +403,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 	case INT3472_GPIO_TYPE_STROBE:
 	case INT3472_GPIO_TYPE_POWER_ENABLE:
 	case INT3472_GPIO_TYPE_POWER1:
-	case INT3472_GPIO_TYPE_DOVDD:
+	case INT3472_GPIO_TYPE_AVDD:
 	case INT3472_GPIO_TYPE_HANDSHAKE:
 		gpio = skl_int3472_gpiod_get_from_temp_lookup(int3472, agpio, con_id, gpio_flags);
 		if (IS_ERR(gpio))
@@ -429,7 +430,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 			second_sensor = int3472->quirks.avdd_second_sensor;
 			fallthrough;
 		case INT3472_GPIO_TYPE_POWER1:
-		case INT3472_GPIO_TYPE_DOVDD:
+		case INT3472_GPIO_TYPE_AVDD:
 		case INT3472_GPIO_TYPE_HANDSHAKE:
 			ret = skl_int3472_register_regulator(int3472, gpio, enable_time_us,
 							     con_id, second_sensor);
diff --git a/include/linux/platform_data/x86/int3472.h b/include/linux/platform_data/x86/int3472.h
index b1040e36deb8..e1d5c4915ef7 100644
--- a/include/linux/platform_data/x86/int3472.h
+++ b/include/linux/platform_data/x86/int3472.h
@@ -30,7 +30,7 @@
 #define INT3472_GPIO_TYPE_POWER_ENABLE				0x0b
 #define INT3472_GPIO_TYPE_CLK_ENABLE				0x0c
 #define INT3472_GPIO_TYPE_PRIVACY_LED				0x0d
-#define INT3472_GPIO_TYPE_DOVDD					0x10
+#define INT3472_GPIO_TYPE_AVDD					0x10
 #define INT3472_GPIO_TYPE_HANDSHAKE				0x12
 #define INT3472_GPIO_TYPE_HOTPLUG_DETECT			0x13
 
-- 
2.55.0

