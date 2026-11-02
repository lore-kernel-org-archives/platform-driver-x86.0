Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610095;
	b=yhWoeuzu0kIchIX+VAFyzBYWViMjW81seWLMuqD0lVJjyNnWO/G3RQbSBisx4WaGRcsM
	 MbcizsyPQIsX1PLF7xJF5YLIFpRf4XhtUQ0xulboJOyIcUIAqoRtPTWCQKzi9vh/VZcD6
	 2KcUyrzH5PGG/8Cl2S+/C9r1DoWzbukyXZmWjWwdH0krOBBmfqwhhGK9wE0/7YbYoKYN8
	 FEm5E2Dvh1NQ0hUvnuyIPcwEsNtvv7gOcKcFJc6md063wRD0hp/Vyz+HijhywH/1DdTLR
	 p5RzlTUmQ3W+a7r8zYpb3Zcyk6aE4YdDjx5yRb26sOE2ZO+yVF8vdsEV69qkn5brJgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610095;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=avrdAC3+VaiYhhDXqmosyPWkGp+PfhcvqXebzRIarOA=;
	b=iZNpiil7EIWSKUfYLKniVVmP8LeKY26fV+JQuqRMsSYHhCOdna04JrSxeiX4M7RgeXSc
	 kBUE90bYKp66W5b/WD/x6XMy76IQiKN6lbqi7g5fz5rrt4gi3YiTLyMe1NFgBHv9oDSU3
	 f6BcbcpXbK49SGzEPs9YitsNpxtDP9Bulny5KETf/8EkdEYSh4W+hzydescXnSdG0m7+w
	 t0xDNGxsVEBb7L2MJcV+/qVHTPukCZeBuZzlmb0JPq4gkN0Z3E0qdNvp2ihZzc5BVdqmP
	 kdVeOeQchA0F3ArZbQiiBHveoi1Yr5LRlLv9s0McDEWyQir2lECpN7tT+XsfPYPar6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RETzsQdM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KvYdgRbY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B26D606A326
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Nov 2026 09:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B26D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RETzsQdM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KvYdgRbY
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A24CdcQ1811587
	for <platform-driver-x86@vger.kernel.org>; Mon, 2 Nov 2026 09:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=avrdAC3+VaiYhhDXqmosyPWkGp+PfhcvqXe
	bzRIarOA=; b=RETzsQdMUr7s9g0NetCcCjXGAgFDr42EJkxjGZGB2q2GrFfyYaW
	DWDeGdfEbUYQDA8s+QqhFEvP55OcQiANvZGImtyiMi+BpHgL0DFmuOT1A3xleYo4
	syvA/qCHOPBjqwNMqKZRzAQ6ugpvSyROSSmvTOCqkVrjsBr3M4/bCsDYc+PJoMCC
	+kWY+pAwq++Miy/Yz0Z8RdBMc2wZUAgC4uldVx4egeqXU64/oMIlMgEkkD98jzIQ
	sjprm9YmAubyxaHmOEGYEgPX1NsDkZZ+oTK3F5vO+xBGN0lJTkZ1h+6XiRXzmd7g
	6GEhnGSHMqgW0STiUc6wbTSqbqnbwoeoHiw==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rgyfu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 02 Nov 2026 09:01:33 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-7150e6da54bso2167004eaf.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 02 Nov 2026 01:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793610093; x=1794214893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=avrdAC3+VaiYhhDXqmosyPWkGp+PfhcvqXebzRIarOA=;
        b=KvYdgRbY1o7291HRSHvLRZiunk3BaYTSyp4qvEjMnNXoIHfxFUJbq+Q6t23S/Ddc92
         0k49lKDeAsBvM/zxOLFB8pcBQnrgPSzzFgtSkW+5ceOMJ4JB3SAAnsWQ44MvPPvrnj+K
         +lW2VXImTvHPbT5iJ/k60O1H6Zr7L7yWdV4MmswL1qyFOg0yd8F7o0ICBLc9NyG6Vr79
         dKnILdaKKpqm36IO8uP2qZjOOaqvVoTL2CTpRB+TugkWzSQ3UiBMxWw5ruN1drj4tkEd
         R1MkxAkZLfNzGue/xDmnTDffvCa8hYh2dopOrsUzzQkG6zFmAhHlWD7iYAe8SBdvDFH2
         xKVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610093; x=1794214893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=avrdAC3+VaiYhhDXqmosyPWkGp+PfhcvqXebzRIarOA=;
        b=WRCE+bHRVICYKxIg/rkOvwkWkoR5cN/IqvRJs2rtF6e/AS4Cg9f0/1nF0HnJqA9z72
         cZGQdYC+PGqNONRPzSv9ObDyC2xx+VmddiaPxqR/aUS2VMPPumQFq6ODIBI81x3EL0S7
         yFcK+PK7fwkvceE1/UfuoD3gfO6DgZoyoAFVXEIVxTpVeN0NPQilMRgUrjKRc2cgke9j
         HoD/JipduEO/GN0WTwiXc6lZFbMGq609xAjStyKcJ+YdlI2txRCcpgTcSIXzAJ5rc8Sa
         mVLDOAnem/E0zXLbua58i9PgAaS4YdvwGUt4Z1semNEJV78mDERcUmO6owXmN1GPZhM1
         JUbw==
X-Forwarded-Encrypted: i=1; AKwUvBwEmWsTPI2Kjpp4AkgpdfThgXfldSTo3tJhqfnS3GiMIVwYHZ94eXEd650SRig46CrBmYBobVsU2Jyh/M3Dr6dp1TZ+@vger.kernel.org
X-Gm-Message-State: AFq9FYJhX0ZDIGHnKx7w+iAkOqdGUED2WhIhH+n2ZRK5CATz26hdSPh2
	ni3xeYGPiwIzFCRyQhMlx9BP27xdiPfbzRf6Jq4c4gTELXiprCpLny67qNDRgNiCrfusqjXz9aK
	p9KkHEqZxlneNBZLA+axbLJjq2nplLM4kbBCRl9KEBl5y53LNYzMBT9xqrDr6GasopHJkYhTlRE
	/X
X-Gm-Gg: AYBFou3NNWfmTr7ImOmul4lWtX5+bSqM4KxVJhnHf7hFxb2Vo2ARCygCy7i3RsDNqpP
	QtX3UEHhu+TRRN7CwUkl5r91+UFUJhdseqhvaF+jpzUqLPNtY7Fw0JDsX+0Lk+LtsciZDr93TH7
	Sog5kboCoIShO/ZU0F9mmoK6TFEERf//w2iyu88irFt6otv/pL4l6gmji25yxB1u5ujWzO98fyS
	PsJwEeQlbkZC+ULWBILtyxu2dVhDY3I8JTcJQtyxPZ/wdguky3JsLlXQs08pkI1R1XIoEIelXEd
	vKGE6yvkacre6nerKDPB8R4iy3+dutEdQ2yIJgc5dakTb8JGeqWWif67DtYhOfgKnd3F8t17GIn
	g31OoboWJT86ERNEzf2067/lzDLAkB9Uj8joJ+itDgdRxgRxfRVVr+Cj0Xua+lxmIoFugL1zgdj
	Y7BRLCmh7OWgzHEgFFXhuoMNQzw95RoPak3g+p
X-Received: by 2002:a05:6820:607:b0:707:5453:73c5 with SMTP id 006d021491bc7-714f242152fmr5313442eaf.2.1793610092752;
        Mon, 02 Nov 2026 01:01:32 -0800 (PST)
X-Received: by 2002:a05:6820:607:b0:707:5453:73c5 with SMTP id 006d021491bc7-714f242152fmr5313426eaf.2.1793610092355;
        Mon, 02 Nov 2026 01:01:32 -0800 (PST)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d3545bfebsm8473636a34.4.2026.11.02.01.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:01:31 -0800 (PST)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
To: Maximilian Luz <luzmaximilian@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH] platform/surface: aggregator_registry: Add thermal sensors to SL7 group
Date: Mon,  2 Nov 2026 01:01:28 -0800
Message-Id: <20261102090128.582927-1-gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-ORIG-GUID: VrALWqox1wb6xOzusMcsndFUIyLo26-H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNSBTYWx0ZWRfX/PBUzFLJcEc0
 jlH2ql6kT5rF4S7kI2AhYkEbhJs5MNqkmdBErT1AMildaSQzHrLkyqaHXT++s4Tzi4lh1kXQ3EW
 /KcmWxLK6qKK/xA8yo6P/g5qPYjmW6UV3xhdEVYLqv8XTEe14nFc520gANcJ3Vnen+y+pQ7a8l0
 p3konj+tofDfArwU8jddlEgObG1gweRWS5NZKEVIW5kThg1Rf/VZxdxjUSBNkMGa1fKMPvlgw2I
 4Plk2m+7SETvB+HQC8TT3ku27qX+6lxF9fiqT+ECxCo8XXhlAx6WKmUmlVRBEP1+77N6LH6zxZS
 MDD1MkXFDLVtlek+jkO48NT3GSXtjJ8Nu19DPGthrXiHyEYss+Y2lRA6bl3NTzig4FzSXSeMtIO
 Fy5c8xqLu6IbU0D7Y+TdnYA5CCaCZa+lobeExevWUFHIevQMZIftPd15rlzn9qzC3s9e4PlTAaj
 rrjtbpGN5D6SVfXDnBw==
X-Proofpoint-GUID: VrALWqox1wb6xOzusMcsndFUIyLo26-H
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNSBTYWx0ZWRfX2tjt1EXH84Q6
 xqr4CiDOxGW1anAdDcTLEY6goB70nomrmKIAtZoaJNrYcIdqNi67rAUa6AewJ3458tvB+HNaJcr
 b+lb3LEqMA7Egw25qEwYXXh0dkjNFPA=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae8516d cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=UzWXxX9ZMNbWsd0j3ogA:9 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020035

The surface_temp driver is available since v6.12, so add the thermal
sensor node for the Surface Laptop 7 and Surface Laptop 8th Edition
and drop the TODO.

Tested on a Surface Laptop 8th Edition (13.8").

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/platform/surface/surface_aggregator_registry.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
index cf3ae252b1c4..db97a5fc96d4 100644
--- a/drivers/platform/surface/surface_aggregator_registry.c
+++ b/drivers/platform/surface/surface_aggregator_registry.c
@@ -296,9 +296,9 @@ static const struct software_node *ssam_node_group_sl6[] = {
 static const struct software_node *ssam_node_group_sl7[] = {
 	&ssam_node_root,
 	&ssam_node_tmp_perf_profile_with_fan,
+	&ssam_node_tmp_sensors,
 	&ssam_node_fan_speed,
 	&ssam_node_hid_sam_keyboard,
-	/* TODO: evaluate thermal sensors devices when we get a driver for that */
 	NULL,
 };
 
-- 
2.34.1

