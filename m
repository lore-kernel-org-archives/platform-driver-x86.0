Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D984DD3CA
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Oct 2026 14:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160244; cv=none; b=VDBW73FDb0tqcoWPa+s2kJVMbW53evqiJrAs4gELZkvWI2ICFpGNq5PsoyU3ygneWTqz3xyKkYo2Cja4o2yNDHySfotr7WrpSMpWafbSXJwX2RRGaLLIRD4aGsnMVeaOGZVs1FrLlmjhiDVsyOPB45aS8TiEoYYBM+jYpYdZzLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160244; c=relaxed/simple;
	bh=R0TsCSQgfViLedCAwCa46hdGet8t/BxKhHsStKEoP7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tYE3A06Ut6GlK67b5gW1twkRAd3GUiS1P0WXp6M0PZfZB5NPrI3CGTOdvj4Zxfkk1OPf6/v+WO7Nc6Vr4Ehpqg+CUjn4wLYPAWjq7qGo2I8JXTdJXiWPGnfciFaFEklWoPMhBDlGEWQNLX7zaoSdTw7b2a/K8BoxL162QC/xvRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kBImLtUx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RH9+TWh5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kBImLtUx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RH9+TWh5"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE6QSg2494931
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Oct 2026 14:17:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ocrGJ8z2EuP
	x1tBO9RRa6tVtwbknSUeunt4oaL5gV7M=; b=kBImLtUxD1mbzntOfAZBBoFUV7A
	jnlpA7LJ+EvI9Sfaknhq5LulHQ74hfVs3gRMP9kCjDJ62QvFAfPmuLRMCbPwczKq
	eWBSiJPYzM1NE5kHrPxDxlyQhgQX2OKlo0sgh3cl1e9yY65GZrIGwMZu8V1NGffz
	t6Bqxq2OfxJM3u4t1YAIdCFSjvPiw8iy42hRTiBN/L+3pTUudtJktjV6Al6qXkx/
	k4pdZa+w772Do0mxhJ+MwJLm+i9gL6hjaX6Z/4Jwhhts64BOBkeqoimnpN5Rejyk
	2VLfnfn/7HxjBaFTkinDqjk/PYgyUOJUauSGAz5ZLf69sHOM5ELGfQzXj0A==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8a8b0dg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Oct 2026 14:17:23 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-98c70917433so1982241.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 16 Oct 2026 07:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792160242; x=1792765042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ocrGJ8z2EuPx1tBO9RRa6tVtwbknSUeunt4oaL5gV7M=;
        b=RH9+TWh5y7L+rVaI4i4ppdOOil4K59gbw4Cp2W93/PkDW3hDMQLIWkWmPuOuBSTzyp
         PBz5iAcvOP8xdlNx7eicGZwqkkKx2hMqOoOQy6VFeHQOII5vnYdThKHbSajbbal5WYzc
         75XAeiR3j9iHGBfIKjxSZ3AuNom+FE9Rxru+nL0MgIsouQ3Ag+1fzzIuAwm5q+/l6k3K
         KqOTglHbUvgSveLzKhu+Sii4XhepqZYA7UVEcmq/zpz++LLY8xWyM4Vunz0DMS4jkfh3
         WHce9kSyONfMRlkoyE/l2/OSrcaFHN6u2BVQssqx/n6NTZQUi5B7WiK7pmMDivNRzLOs
         1Gig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792160242; x=1792765042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ocrGJ8z2EuPx1tBO9RRa6tVtwbknSUeunt4oaL5gV7M=;
        b=26RudNBX5YQfDer0yotnZ0dHAr07XTV3TZRB92ApBWa0YvQaHylxbyz8WKOapYPVr6
         Q7/zCAvOaEvpSQ5TqU6t7SMCiwLpreUkjAvfC+vsihiSgwLEte+KXOgR3hWrmD5+M3Rh
         kUX9tgBZoIWmoGU7TkT2JGNEdxH7xvxfySVg3ecRkOqCvdBtCjXcRv2o3BdDHeO6OLn8
         B7MyDqmMke0vSrya8Xv7F0D9tkpYeqUba13j+PaN4GzwQqSLMAT4lUPrCWNjsYlmk+mX
         DYvLwT/ZXjX9hT3ZihM68e/D9vj4ukHkOdJVKVP0SCoiK0zc6pyUxuWeht+tm4HPB/7/
         nEFg==
X-Forwarded-Encrypted: i=1; AKwUvBy7EM5uqND2A/AvCIvEU6rg0vO0lXQjzhbEC7JXwoGejsxgk10sFfu4A+B8A+e36gnVbWBxQLXGXWPbg0ezEcDLIVsz@vger.kernel.org
X-Gm-Message-State: AFq9FYL5Z1WnylcusoZ/qtHLyuoS0cjPnNOvp57c9CLExdiQvHn7UwVM
	x1iNO3/YEBfjQWMywWzVBN6oR7F/Jp/J8GD4fNPUhHz/NC+6NfY/irkYuM81cBPpXAxML4KzC8o
	s8bB2HanbG9qa/GZgjw8E6+/Kv+fz1k/O7k6F0M+GYzR8Rg1gmohUMSjibfY+F3AFdqSMiQsTwT
	dX
X-Gm-Gg: AYBFou0MySgS7BF1mE+OrUUh5DxKdNn8T6uR2bNvNudiYIVoTQq/wt9ui91O2yq57eq
	GjuQL0dHqBuDqR1xRCRZg3lyDAhIVYKzRVFu0S1GiXTjyxG5r8Zecib+o+eM6dPM64Zwm/uqHpu
	1snWurD5FbjDhu6wMlf3up9j1c4k+LT7Fwk9UQa91/iQIHPaca0HuEYN1/1aYhJ0L3kIa78BWqq
	maJKmFhV9K6vhRUR5JFwVY2nhpj1J0+Q6SQmua/Dm4k9s0HCMHzAwRZLQWmVlbu/PYxfE8Iq2Rw
	16Ao/OsEBSh5Br633W7au193mTqVHu/KyRJmv0h7Yz5ZoDI0YR0tfBFfJdh6wcE4Tm1V64OR+Se
	R9iDMOvoDupwdHVmyU7B1akSTJfwo+1VABrhafXDsw6bIygB3YCu9IzaFHVrmlEdsl7fO+FWzE7
	TrVa/AGWnh3jn8sQ==
X-Received: by 2002:a05:6122:4893:b0:5e9:6d96:b6d9 with SMTP id 71dfb90a1353d-5eaaabc20a8mr55964e0c.20.1792160241979;
        Fri, 16 Oct 2026 07:17:21 -0700 (PDT)
X-Received: by 2002:a05:6122:4893:b0:5e9:6d96:b6d9 with SMTP id 71dfb90a1353d-5eaaabc20a8mr55932e0c.20.1792160241505;
        Fri, 16 Oct 2026 07:17:21 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919c03bbsm71144166b.64.2026.10.16.07.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:17:20 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Antti Laakso <antti.laakso@linux.intel.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Alexander Patrakov <patrakov@gmail.com>,
        Leif Skunberg <diamondback@cohunt.app>,
        Sahan Nissanka <adee.sahan@gmail.com>, linux-media@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/5] platform/x86: int3472: Rename DOVDD GPIO type to AVDD
Date: Fri, 16 Oct 2026 16:17:13 +0200
Message-ID: <20261016141716.130220-3-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016141716.130220-1-johannes.goede@oss.qualcomm.com>
References: <20261016141716.130220-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX+WCpdl9czdJH
 nKfSBSejXivritiRdDqzT1ean6XRiorsIG0TT3s/NFyg69mFMAgyxAZ/xqjOXhumIUPEn1TmZ2G
 GAE/i2lZpk9p/LdKc4VaDoRQye5nbmY=
X-Proofpoint-ORIG-GUID: i1CXPeCqpGlzBglucsr549FYLx-xJxTh
X-Authority-Analysis: v=2.4 cv=GJadgeNK c=1 sm=1 tr=0 ts=6ad231f3 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=5k0iGRGwmvYjmk2vAgYA:9
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfXzan3I6Kmd/Cv
 ae/F8iJsjoh7Q535j5ZT+kFIE85rnVEmv0HoDqh6LAqZFja56v0xuHTRa3B0CW0N2Ismcjxha2U
 KPrOE0n76bxUNdVs7Pnpgp2/5BIKRJ2MUyH7Zvdf6jYkvisc3v3qlN4e+5JArdCxOp3MzGVLfDQ
 la/Yzv9wze16imFxAtCEVENhaHba41lXHhx0woChqkyXeEYUQFA0dD2/Sm7681OEa34uCxp7qjc
 D7CTQeWyVtEKlAVJ8l++XC7OH759KFO8wCp9YLaQriCSIrFYKW+6Lqs5tJrvELQjZH6hyYR9+9m
 DOEqpdWyX04meL6NjJjHIC62S1V7zRocRJwf0ylN6KAN9KxT7SlaUfFZCApLkVYcdLOA96rJ3Oo
 yd6ikaQ7oT2iJlugd6ws8iHYi3YxNTC6YNz33h+vt3mCWOtzv4+BCS4v5pREJMlEI2i50icwdXB
 MmzbnEjEkV6EaTdE+Ig==
X-Proofpoint-GUID: i1CXPeCqpGlzBglucsr549FYLx-xJxTh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160056

The window drivers call GPIO type 0x10 AVDD not DOVDD, rename
the INT3472_GPIO_TYPE_DOVDD define to INT3472_GPIO_TYPE_AVDD to match.

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

