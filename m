Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC0847277C
	for <platform-driver-x86@vger.kernel.org>; Wed,  9 Sep 2026 09:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788946790; cv=none; b=aOJGNBin4apkoRHyXTGmQmdsuKh5UQOnUuCEFgku9fhm+tL7/ySkQOBKoLFGCB0chb938PDQOHFwtDuIp2+G7lBL3PTxdkNiiFMEfHVOOaFJtmFkjSyTMPm7NGhoyO751t5+NrDBgjKf97ncTLRaFxj6wwIaxmBDHSupuxdAFPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788946790; c=relaxed/simple;
	bh=w2vep/69OYe1Fjz3Pz5QMys34XOdM/k6R5vqYZm7NTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MvocxvB4ml0EjOhwvY7di4WKtFnSCa20UQSb1lhnnv8XsO7BYAibnrhszWcK4nq87Aa2l23hsoARHgq5AaZyD4AssX8SM6yHfTyi0HanVeGsi86ND6jzgXVy3nMnJCghu34XyLC5/MdCY7nEy4FW6IauAR0kkzugVhuIvjrkxtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e5AL6wqv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UMjXFgUN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e5AL6wqv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UMjXFgUN"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6896VndV3817303
	for <platform-driver-x86@vger.kernel.org>; Wed, 9 Sep 2026 09:39:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VRkHmq5v0Xm
	mKj/bVTSxCtIOk/+XAtwEkO7O7C7PJDc=; b=e5AL6wqvCIlCXJUjUoAJyGMTG3y
	SGuoGcAw6uDhzl8jVeiT93AVUyMdbTMfD5lm8oW0Dzz5t5lMZnKUmQqBmuhG2W1/
	6T73E1aEFrf5XIMpCtD8yGigIV79cTjaZicVFKTAhhv1rLvJAt61UF60AVNs54N4
	lcyLT5D0aU/5t49Q1h8L1pRpnzR2UPBdsWHf0oB8sQgYyvJefVH1rWrD9Rzm8AMq
	S4keP7VrILx4jwNhqT+crkABAZaER+eCXvx+PH9OLsd9MmAZAUxeMm9K2Bajkh1z
	vX4s6sEZIT/6m/Eq75k6RoJiNul8wz1Cln1UEruXSalXrpay54xDMej1i4g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjstuajpt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 09 Sep 2026 09:39:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e82060977so931108685a.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 09 Sep 2026 02:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788946783; x=1789551583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VRkHmq5v0XmmKj/bVTSxCtIOk/+XAtwEkO7O7C7PJDc=;
        b=UMjXFgUNPU0oaia4JG4FXX2i1hBBV9AXNIquzKgJDVKmM6E1mjE0Djmv6+1RUaf45y
         AzZ5ZBSjiAd4BXXsBmkIXvVvpFqfazGMNHUU8F5BiFgax1sUTkOe/NJn7AOvCBr6OuSZ
         9WNQFEca7cXB4cqGKp0nxCZVNVEnGk3OTD7M9Yns67WUHtZe/L74IUBhliaIcXf0HpY4
         jx98m7rHpLfLJY4dXDVW5Ve94UXMMwR4b1heJSvH7GJcEZcdIKIRyXRPWWtZ6qAPJzxO
         eWtMAqCWNYe2d0844gbiA7sLA4WZcUY/4FMPlYW36kOjJY0fVaTI7k/OL62cT6iRL/8D
         lYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788946783; x=1789551583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VRkHmq5v0XmmKj/bVTSxCtIOk/+XAtwEkO7O7C7PJDc=;
        b=nMtQiDIbPakEIeigMLCy3LUNOQAQgZK9jsUIIrTbcsAExUJfBTM8mvuCXan6r4YxnD
         T8El7E0ik0mmCNw5s4Ap7IAKxUEqfq6MrWWcZhcCmr7wRA0opLHBTqWg7LKfMriZLwB8
         DUe9oOGQ83mlURUJKR6nvEa2QFm7D8jAYyKetzMVaiBcqOei51s9z1oBFYt2xZpCpeCY
         d5vXwE1nk/nkmf1GIN1zpP+krF54U7jfJP8Ev5qG/aXgnAdcYmrJMD24aNaQ7gvMqKEb
         twttmNjNLficQ1EUgqtPqx0HW54GcGwFw8S01JtC1XbrSemM01+soh7sCzdIAMK3WBax
         yChg==
X-Forwarded-Encrypted: i=1; AKwUvBwKcA+dMHdt0vgEb4nBaFmyzgiCxaVFhO/TfG5vDtqWw8CQDXOHVajGzmU4t3QZTW3SODGJESbEOpgx4LkrI3KstW6h@vger.kernel.org
X-Gm-Message-State: AFuF++loGMrXHwjXgMEsMFCUl7QlzFqe4x8oxHyRhrmBVTExvjwHrq2x
	Su3kUf4916KhEIt33dIRCoBkt/ngK8T04tinJ7D4QoOD/tZyC1Cko/Ygn8iHgiG/hzOnYWCV9fP
	xKVfk5+t+bbI1x6MidgGIFB70iTkt4Fky1/7hukhAkr9UhllZlnqonbD5HckFPYnwoUt+hmasGN
	O7
X-Gm-Gg: AYBFou0GBxN7dxqrAtIetX/BJftgYClGPTFwTxqiPqoAmyUXy6sFnIdWu2Quixx0Zft
	ChLrV970fC1U+52aQfC3ccAlJYj1cNZ5xXrYu8KqheVQuVWERgQe7sl6LRTYUXsL3rjO1o2aBhw
	4ApxuDlnDStcJKTGmmwwM7Dlzaq0kaN1yVm4NGIIiZ37W6cr+0dfi98tp06dCVo1ksDLTXMtAhk
	hOKu2utxHUXSsY4ubm7tyb27jvZfl2xp+ChU/mC3dE357T6Hr1UEYljVSIqpzdLtwvQqwhS2k41
	4uwQXaqJw3ziLliB+aJ5V5mdo2UuejAh2HNlnSbYn+/GZEeaHhWxTvgVKN1F8g93hl0E8sO1v6E
	/mpF5F+Zvr+lK74qW0X10FxtXQrUUGy4kCMXV+qb0F/KQzPje8H1O5yGx6Z05tevy/JG05SzIpt
	0CsKaVOyF80csiGbM=
X-Received: by 2002:a05:620a:4857:b0:939:5d22:d1f0 with SMTP id af79cd13be357-9396dead4a3mr2695860485a.2.1788946782781;
        Wed, 09 Sep 2026 02:39:42 -0700 (PDT)
X-Received: by 2002:a05:620a:4857:b0:939:5d22:d1f0 with SMTP id af79cd13be357-9396dead4a3mr2695842185a.2.1788946777560;
        Wed, 09 Sep 2026 02:39:37 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68a6e19sm6387800a12.10.2026.09.09.02.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 02:39:36 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        stable@vger.kernel.org, Shashiko <sashiko-bot@kernel.org>
Subject: [PATCH v3 2/2] Input: soc_button_array - check btns_desc->package.count
Date: Wed,  9 Sep 2026 11:39:34 +0200
Message-ID: <20260909093934.29411-2-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909093934.29411-1-johannes.goede@oss.qualcomm.com>
References: <20260909093934.29411-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ItAutr/g c=1 sm=1 tr=0 ts=6aa1295f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=3jGYf1cGefsEezAl_3sA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEwNyBTYWx0ZWRfX2/p8nUIK1v9x
 sMRPlE/ZxsUsVroNvQEnY2tYAI/IMfGo5RywEkXP3ht+9UA8plaC9FXR1A7N+KdMf86BQhLANEJ
 OqcgSODUqQPEg4GuVSLvpl2jgEEwCb8=
X-Proofpoint-ORIG-GUID: D7KcsVl_R1djcvKRml9EGOZMp6GzhtcL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEwNyBTYWx0ZWRfX7UZS5mETjsKM
 kecYQ/7rMXDnZjlTLqwzvL1WZ2oBWMQrbEqRd0koxCSpqySVYFEn3oaqTK80PczjosKGfkS5vRa
 gcMPvBryUV5+3RQ4D3D6gX+ejmcyNQBlUU8loqelswvKADCT+4pigHY7D+QV8HGHvBVLNLtvho6
 sHMQqNwaWizvAHmNgCWrSHQJ6bWaySpAjW0cwlloXXRUbqA9IOl6te3+8W10vzvou5DF33i+IZx
 iVjWOmRJL/EZcd3vFwe0ni7I7AM8sJgNM+hJDJheHG741HIJ8yHccH2qD6N2xpArIVdEd8ZIvOd
 SEHxx49Ow4MfqFotgUpESXPD8hYjG2AKRdx+FEboHgCq4+ZOjYfQkpZuh+IW9xX2TM+HfEQcOz4
 NBKZT+VUmoLMzgtM5Q1o598iCv/kOIIAw0gWSv+AGpW6ueXv4gNjf0I9uQkNA6LwoVsVRRzUtYv
 Br7gAqDjig9IEehD5xQ==
X-Proofpoint-GUID: D7KcsVl_R1djcvKRml9EGOZMp6GzhtcL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090107

Check that btns_desc->package.count is not 0 before accessing
btns_desc->package.elements[0].

Fixes: 4c3362f44980 ("Input: soc_button_array - add support for ACPI 6.0 Generic Button Device")
Cc: stable@vger.kernel.org
Reported-by: Shashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-input/20260909091440.3384C1F00A3A@smtp.kernel.org/
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v3:
- This is a new patch in v3 of this series
---
 drivers/input/misc/soc_button_array.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/misc/soc_button_array.c b/drivers/input/misc/soc_button_array.c
index 264c41f80d2b..f08e29af531f 100644
--- a/drivers/input/misc/soc_button_array.c
+++ b/drivers/input/misc/soc_button_array.c
@@ -377,7 +377,7 @@ static struct soc_button_info *soc_button_get_button_info(struct device *dev)
 		}
 	}
 
-	if (!btns_desc) {
+	if (!btns_desc || !btns_desc->package.count) {
 		dev_err(dev, "ACPI Button Descriptors not found\n");
 		button_info = ERR_PTR(-ENODEV);
 		goto out;
-- 
2.55.0

