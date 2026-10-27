Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100575;
	b=yM5/9Y/wKPa2tX4CZdB698hnH5csQOdHFXRf8oBxt8N1YqmkHMbRd+nVp63GbyoaoBfH
	 bL4OcTo+GjnX5d2hL2DWQCXCqhPU2FZLj3cmeAOaU91A4RDgQtHP4vUm0CkA9F1ZWqpic
	 nS6LSWjqTkei4c7Vn7Swx/hQ7EHJ7sBeo4s7KEdn1NOEn3MjtWAWkE1wP6WnNZaNWPR+y
	 xPo7xoDT+gOyiDTTFldOVA+jraGpSEX9dTzJSoPAX8rXTOfvpeR7FDjEDP8ae701HAQlm
	 JybZy6fHhf9vYClnWoy7b2QDh9MsXRbbvU50maY/zwj6Dg5m9RyI3FDi1otTSehBPyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100575;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qw/kVnTqYvPCNUdSWLGnSSIvo05G/jn02YE3UUq/wv8=;
	b=YlOiO/qEYuH7EEXA+k5jUtJtZmN6T2Rqzjswc+x083TYQwmsiwVfKDv0+XVxTihsY1dT
	 1Om1GYZlIb7f0d8xRWoU1tYxxIHruEgeOokxcl/JwdxLlGUppMjBNVLo7jD3qdFn4kjRe
	 Jul4nt5D/qC0IDL33nzeYBeHF7fukOkGOCo7Kbl5O6h73aAVZ4LSIFOFKnN32Y0cklaOw
	 bx7iKmxoqNxCQGKzq+L52LgtDfvsXf2eMplUPh5nPS5PdYsu0pILNEKf5ULRWv2y3loMg
	 iWCyfkr/YKj3AgyUV2HSFe26yXf2vzTHkMJL4ZlVGJHaqY3FrtWnDExj9DNe+yG5V3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AwjsL7gV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j80wZfHZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7421B606A31D
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Oct 2026 11:29:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7421B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AwjsL7gV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j80wZfHZ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdsjL1973260
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Oct 2026 11:29:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qw/kVnTqYvPCNUdSWLGnSS
	Ivo05G/jn02YE3UUq/wv8=; b=AwjsL7gVwXS9nxOp6JytO8ylRFkSBXiQRBm01S
	v6rsWRTkNN0xsx3Oc5t1XzHz9QPMvld660VETIAQ/pBXvPw+ZfCFhtDaVRSPRRG+
	W7tIpw4mbr6C8g9jZGhnEcRSDcCzI380JaL5ZU4WoyxsVnT/X3u3ZREHjQ27rVUh
	/YQ1FEKxlbUHb9e5+d1WItGV5sNzCcivNIUjUzxKEoqtDix/KLOcMQof1ut/nwZ9
	CVRkd6IKywVf2S9ON0msAjz1TaegYz4wVi6HGGVEq/fVJh96MbehHhCSLjlCsOvh
	35xSMrTvQ2I6yU7c5THGYeoGbAJD2hJnspHUxclzUM7UQzEw==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjst1gahv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Oct 2026 11:29:33 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6dd1142710fso7316450eaf.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Oct 2026 04:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100573; x=1793705373; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qw/kVnTqYvPCNUdSWLGnSSIvo05G/jn02YE3UUq/wv8=;
        b=j80wZfHZaVjgq0zMwgAMWNHZ1pjgFL9ohI7r1ptGxy77wBM8byVfOJH+2hBJSkmH6N
         ryRsX4P/3hGvGEZOGHREyjgmBaTtws10vWDgXbC6K+C5I7nFwpGNbyEGp3eUzSgIHIr9
         J9yirjMk02wce/2JQ0X7Eklw40ERdoxMiuAfJWgNmJ0g6G/zFnZtJayngYF0fH56fgqS
         acqkmoSnezc9pZ6m6egMVH1g3KO9P1s3IUldCDJ5ExUvwF7QVexpaxVrgNxl0pTSG2gx
         eENzpAHwDnQRl2IpAEpCWJliEbWADFCpAOZf3i2QasWg54/ydI5cgTvGW32Ve4gUkJBr
         UpmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100573; x=1793705373;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qw/kVnTqYvPCNUdSWLGnSSIvo05G/jn02YE3UUq/wv8=;
        b=2Eh3pJTeudKHM5QWVDszs3kWatHV8yJ8GyZOEm9o4kETaIe7/6b7cN27Yv+NaF+RHc
         oxkZL7McKXMtQo9yKgFdYbTJIKiAs4gU5RDzgEy7IlKJkpO6cVY5vNWwSbvWuldlLGsW
         /zrdKIXQfiYrjRyJqv4PGPd7jcFIP35405Vwqj6Y74CGfJHKcvCOzRmchVinTfCKkOm2
         OlFouvpuVCn5enycUqQEDPWW8muJfP4iTWvLSWhY5/CRkH85K0rP5Vmh2UzoqcjPUGUH
         hcZXODG7rJBI/0uTj529A3CXwyY8IQUHkvCg1o6S75KYQ2KPIQShx8ITtaRxwK2p+tr7
         SjbQ==
X-Gm-Message-State: AFq9FYK43xPRFukhm14VbfAqF32lFLbwb8GmCyr2zwu5oyE7jP7WvlKW
	aT8lv8UwWHTUQvHT9awcpOyRb22nh17ZnEBhocXKsxtESb6T7BgMKfeNzERJFyFM6MBdUhD1C5+
	cg9wb6gRwTol4nRtQ92n2BKRc9Sd/AtdLjX80E5X/TLWkxwBL2qp/TwgvkXT3krUhn0Aiv+SMMz
	V+cEtOqfVdy/w=
X-Gm-Gg: AYBFou3J+xtibqMAMSSRsMkGxja9ZEVC8Ja3FLMXwI269ib1DfQwEp3dur4L3DMdU7m
	DF/fzXkH6gwAxW1P0r57mTzBPcQ5GrhnYJnOv/mc+AG4AJtQjPrF2+ITPu12ldNfHdi9wMMuKgs
	RlZsiPBkO8UXHi0G2sj0s7EC+SA9umgn/ueFfrSPFCoTKwHNpDnBZKIusfeojEUE1p53a2Limc9
	SeTGD4VVXUP8+biNVKpVYfeI5Tw0OZY/lHAcbCi0EXLLFq0JbQ+nHC0nW2niwXwZYytckBp+mqg
	5QB8IDaC7rgHpFby1bI5FTWU669M5FD+LaWypGnlRDQB4s6iaZX3404+ZZk1C9nEvYeN6RQ4sZy
	DzeJ4hRU2RwWAp5wATgQn0zKyDlIf+bIxfBPvW/kUA2o4mrCJEBrXYY1rnn9FQ+I=
X-Received: by 2002:a05:6820:c44a:10b0:70a:6888:228f with SMTP id 006d021491bc7-70ba0b235a1mr3917541eaf.4.1793100572816;
        Tue, 27 Oct 2026 04:29:32 -0700 (PDT)
X-Received: by 2002:a05:6820:c44a:10b0:70a:6888:228f with SMTP id 006d021491bc7-70ba0b235a1mr3917530eaf.4.1793100572373;
        Tue, 27 Oct 2026 04:29:32 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70bfa90c943sm6842017eaf.3.2026.10.27.04.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:29:32 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 04:29:30 -0700
Subject: [PATCH] platform/surface: aggregator_registry: Fix Surface Laptop
 8th Edition compatible
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-surface-laptop-8-sam-compatible-v1-1-022cc782b0f4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABmL4GoC/yXNQQqDMBBA0avIrDugEUzpVUoXk2Rsp6gJmSgF8
 e5N7fJt/t9BOQsr3JodMm+iEpeK7tKAf9HyZJRQDaY1Q9cai7rmkTzjRKnEhFdUmtHHOVERNzE
 S2T44tmxCD7WSMo/yOQ/3x9+6ujf78svCcXwBEYWaBIMAAAA=
X-Change-ID: 20261027-surface-laptop-8-sam-compatible-aa73dbe7e2d3
To: Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793100571; l=1792;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=exY+XT4jcML8yeOJ/NU2apc7tmgTbMHN4LZkL2zJSgE=;
 b=uuDDETTvgnen7FfmAIg10mj1MiLjrWCLWhDbmfODAaC9TEUdx3t/N4ah4lOGSaIHW/rUpOx2F
 j6q6bLYF2ysCnQZy/ZStwE0QslZmGWZVELw8P25Ui9qBkp4cgr9TtQA
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Authority-Analysis: v=2.4 cv=HJ1WhYtv c=1 sm=1 tr=0 ts=6ae08b1d cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=B4T17I3tjnCV4kOYBvQA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-ORIG-GUID: OJP5OIROrMEYtJ8-5FojTa4jw45WyyOe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX9Oth286+PrDQ
 26t7hrUCYv7GPhFWVie0cTz+NfLyIwQ86AzyT6AVMPB30zXU/q3u+eR2OmiIgNo4J+s8m/HA24O
 1tNRHvjNPfMjqOMR01MCHAev4BRzwwA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX9H39yezyH+p+
 GibTEh1+Y0v5K8l+33ro9VknFbSpBpRftFOrmBDqxOM3tCSkGFAGOjne89RWgu+HoZdxUwsEMFI
 ndYX6yVdtt4hocFxCwvnEL/wYICMtreuGGMbnLIbR82X3GWwYHc5rGMRBKQl00Ex/ZLPl0E8kwg
 +ZkhdNe88MbooK2d0wLLORPHFwzu0qM5T/h0UOwHQilfpibHoQrTt2dA1cqpLM+FNOxd+imys9G
 LqOWOCf9bhVwj3RFS+wbgx3r+GFXA9XoYCmtQbTWOP6P8sCSH/ZNvxgJX5ipolXAN1Pegjj7C0L
 0b4K/vpBaKurjOdUzN3MdVRBW+YtmttcRCAd8lkkkqiA1wFaFej6mudhUokabXI1XqRV27s9Xki
 ucjK1GdXjveBayQTVPoMtq+v3GhfxsYwLVtfhpR84l0ERJP5YTQ53FFw2SUzih9JXvz4eXEfO3x
 L8odxBKiVa1oyQZH1KQ==
X-Proofpoint-GUID: OJP5OIROrMEYtJ8-5FojTa4jw45WyyOe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270045

The Surface Laptop 13.8" 8th Edition was renamed from
microsoft,surface-laptop-8-13in to microsoft,surface-laptop-8-13p8
during review of the DT bindings, after the registry entry had already
been applied with the old name. "13in" would also clash with the 13"
model, which is a different board.

Match the new compatible so the SAM client devices (keyboard, fan,
platform profile) are registered on this board.

Fixes: e93536b1fcf7 ("platform/surface: aggregator_registry: Add Surface Laptop 8th Edition")
Link: https://lore.kernel.org/all/20261006-mahua-surface-laptop-v1-1-406fc042162a@oss.qualcomm.com/
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/platform/surface/surface_aggregator_registry.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
index cf3ae252b1c4..9852d9e67d3b 100644
--- a/drivers/platform/surface/surface_aggregator_registry.c
+++ b/drivers/platform/surface/surface_aggregator_registry.c
@@ -518,7 +518,7 @@ static const struct of_device_id ssam_platform_hub_of_match[] __maybe_unused = {
 	{ .compatible = "microsoft,romulus13", (void *)ssam_node_group_sl7 },
 	{ .compatible = "microsoft,romulus15", (void *)ssam_node_group_sl7 },
 	/* Surface Laptop 8th Edition (13.8") */
-	{ .compatible = "microsoft,surface-laptop-8-13in", (void *)ssam_node_group_sl7 },
+	{ .compatible = "microsoft,surface-laptop-8-13p8", (void *)ssam_node_group_sl7 },
 	{ },
 };
 

---
base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
change-id: 20261027-surface-laptop-8-sam-compatible-aa73dbe7e2d3

Best regards,
--  
Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

