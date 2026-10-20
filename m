Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506169;
	b=vK3jfBcoHlUUM382VTxGCMQOvS79x0AL3oGhNh9S3O8s3WIL0mzBDmjcsL8LozVV2scV
	 h93AgeI/0ImvcqSugnbUIJGFoKD7+LQB4PKBM1o/Q1kQy03LF7nZAAXu+KSbkGlnE8/1F
	 6VE7Ty5rlOWDOb/LFINR7xLH9Ei7X7CyPYw8/jHYMPccKKR1lMI2Lw0UJo2ofWFShOXi0
	 teSJUkAWf+l3hMxjINSzkG/cvNaPNnMNNtQht27mpw0VCb2Lex60Kz0WjSJh/Bl/5RnPV
	 Fq8czMdvNI84cPwVcIjiK3oMXS9m5/eRiZZMfxgzBjb2c8rTieiKFN1xVedRsQvtqEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506169;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4r8OWkHbUTvMbqeAm4mkToT/KEGeXEr6CzHn3mxWWTY=;
	b=eV/fS9AEa3n2XBvgLlt0kdnFeb02dK/wJSHu4hpT8lI/P8G80dOI3i3uOlx47JFxyiiG
	 kQbH0Kifv2K7t2Pi1kKRNQJwRVuw/oHE/4VqPI+C7HUUnvQREuSObD38Jd38LoPFtQF27
	 Jun/58vleLJZMxgWsnucHR9NB4qC2HRB3/maxJCnqUJrOXjkL2nuBWENyWgqPm09iWg8U
	 h1+YTaUx5NUpNu7fARR4XGY1rQuNiqSADh0JemjrBWDLc5IY7UdcYiQQbYOwPWsnewlAE
	 WB6VI6r2p+cVpfu8mXac14ZiKJIAg30ImouYv2nyh6CuX1zJvxV1ixbCafAeQ4LfvjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RtlC7IKx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a4eGbTJd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C985606A329
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 14:22:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C985606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RtlC7IKx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a4eGbTJd
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDA1cZ1209332
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 14:22:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=4r8OWkHbUTvMbqeAm4mkToT/KEGeXEr6CzH
	n3mxWWTY=; b=RtlC7IKxtIqFJmNr70Gv+oXDs/vvzLEj/1wdskZzxhVhqX1yRWp
	qAawtxurCyzcXteo4eyU4KxXADNScm3Qfs9WTn1JihY/fxebijkFVnPzeBGsO6iu
	zgxopjYqOlq8Ih01O+m2BdEMtWD2JDE6a3eDXkez8wOcoc9//MCKaU/ecN6KB7Cw
	qajWgA+sodFYw58jKIKUgasvM7ZO8pvAiA9lAGe1ghS1y+6cDbxFdeM4suKxoiOT
	NIHS29lStbWIFAUEthrRj1zmLtI5JZixW9pefFQ8f31GuXebP0+abMybH/U8PxRE
	QEiUnT6OXiTEncSRzk7ivHFyQf+IMNNUg9A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5pavkm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 14:22:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934956beec8so696736885a.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 07:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792506167; x=1793110967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4r8OWkHbUTvMbqeAm4mkToT/KEGeXEr6CzHn3mxWWTY=;
        b=a4eGbTJduheBrNSP6RWMEOCL3+P0TMv+wOU3JisHWQ2T8wd1Eati1rLH17CuQPJYqT
         sOgEnV+RBplzVaRo6gc7LcLlHLMs3jRbxmwLgR8FHAPgOUaOiN6uX4emdoqLTPg+KXz+
         EsBxGkKpCQ9pZO6kGaJd9S6QYfNgkrSVAfzYC4rgDSI/5MiTR4V4zFMKoU4NpVIvY/79
         JgExdLXyC5iK1l9qkoi2owuMwel6F71sw/r+5vt5RbhjD4PA01x73URRfRRfNygmHc3r
         +Nd7XlxJv8olTwEL4+7ri9dGvxqDxhjPdYHzP7SvP9R+iRtfaS9PLM6VUJl63QFVGncn
         NN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506167; x=1793110967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4r8OWkHbUTvMbqeAm4mkToT/KEGeXEr6CzHn3mxWWTY=;
        b=aEzjir7NX4MaQnzHCDWimSozPU2X2v32SHr7o0+51FcjdzdIl3hnRECY71QX3SZTZM
         abjPNM/ubxbW1IRoLLCH+1TOJNVFU7hpnHHb9AhHQFFQMs+YoM67BSVuMZBeRy4OXxB8
         XdLyFNraUh77QZf6q308w2wukmEb5OTRlSjjoIKLKFtu1fKNszRacJvMQsmSVONVAJT1
         mbmWnR+kGPdi3uDrjMnhVFgu5tyl7sbgP+1LaFyEytwwgD7CX1yUtAuEegCjXBinijLu
         9tCXZg9ykP9vaUHJEsTppaxeRWNL8ich1udHaNkyuoe9OckzNdBtSRNF7gZtESiGl4TC
         N3XA==
X-Forwarded-Encrypted: i=1; AKwUvBxaUZwxGTPiaRhoAW7tsCsC2EyPY/AfSGPkDkEg/ZPUwmYTZE8TpEJBg+xFGS3nh9ZDuGJKrK2DLCI+4RWbfuM/qA6C@vger.kernel.org
X-Gm-Message-State: AFq9FYJRaxqRI3BciggZj2cYVo28S/y+6ceJTz/qM9hEmSBEGRSxOM46
	M76VmyvPsJHJNKe2OcwsBS41pTwBYKzGis59A4FFw48hTl2ZudeuY0Mkn1nUqkVfJOIPa+N5Kf+
	Ql9h6ESa25GLWkF6k8nTbja+shXIf84qcqVRkFVBTwG5qHgVitYvZBIO9u47f/f1euCNQAfHs9T
	sr
X-Gm-Gg: AYBFou1waP9I54Iz8jNW7oLyDHl54EWkTavwT3vWEUC9oBFxco66dlA1lgj2LUUdVZk
	zbyofr6JiFqZcJomC3fWFWuMg7HbpaWeFmv1go/9CRanRESwIuinvrvVeyE/ekSm67xd0QWU7XP
	SdS4MqWM+LgPWfmL3NLhjqP0Nl3yZBKX9JKN0+t7HFuYfwsvc2/HBTkBANu3KHargCJtpb/e++o
	ExcLhezGW6zYFe2rggwV9qcPLkWEQ0R8WLcy+vmJ2y8oefCb9Yw/UvAJ86w/TxH/wVQtlCxy9LZ
	bkiuTUtp9C7igs5ZSDU8+pcAQrXMUdSTY0pJaoT74Z0yP8wEi/aKMrEDaPtevAe4hsODpnhWI9F
	ZKW9Sg1JUm3RRLfUxpUikbdiuke80EHmQT8H0IZz2dvCUCpYfS6WwwfOVo5B407mZRjUWRvrgwD
	j1OXwddmgsFeUMy7g=
X-Received: by 2002:a05:620a:1a25:b0:93f:38c7:70f4 with SMTP id af79cd13be357-93f38c771dfmr1256014085a.26.1792506167115;
        Tue, 20 Oct 2026 07:22:47 -0700 (PDT)
X-Received: by 2002:a05:620a:1a25:b0:93f:38c7:70f4 with SMTP id af79cd13be357-93f38c771dfmr1256006285a.26.1792506166485;
        Tue, 20 Oct 2026 07:22:46 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1b113dsm5185084a12.10.2026.10.20.07.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:22:45 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Antti Laakso <antti.laakso@linux.intel.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v2 0/5] platform/x86: int3472: Fix AVDD and add DOVDD + DVDD mappings
Date: Tue, 20 Oct 2026 16:22:38 +0200
Message-ID: <20261020142243.25072-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
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
X-Proofpoint-GUID: -G1f55j-bb1n13g0tjZSEFh17cPoI55b
X-Authority-Analysis: v=2.4 cv=fb84WEQF c=1 sm=1 tr=0 ts=6ad77938 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=kVL90IzE1108TUsV_fAA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NyBTYWx0ZWRfXxkx0L4C4ujt6
 Yt2KdUAUPWpy+biN57KsXVJjtFW02IKz/tuthAfS//8Hdn2Vu94yKUlOQAX+ktbQ4p5JAFsZQ8V
 w542481tgvrReV/T5PAJFMGJknjuMNeplCt7tpO4LCNSkydf2CGrEYGO6l7YZMluRFeQfBi2RjI
 EDbUCTqTF1vq2VOQCn3S1qvITl4o/jHW7ghnS5+LVoMk+Tl/0/efiTXj2JuZ4dKvaS6z8TrLTj5
 O1T4ssn2n/EQY1IP1wZy5tp0d7U4fC+VLCVRO+ZYcGCVmaVuSqH+1bixHRDCa9w8FlIug4X50Wa
 uAnfmwveUFn6hV84UXZadXjJkDK9TR5K/jRm7udDsf43oGcNUFxLXxXHtbc5NTS8HvLcCSFAcA+
 I8zFz72DnItES1dsb/9EjFfMyQR4Dp0dORSjuqVyOEAcOLgmNjo7l902TBN0KuOXg4GW+0eoFLC
 0L60j/VhsBc3FnHaXMw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NyBTYWx0ZWRfX1SjbQ882sF8x
 5UOqhnMwbDf1vVQtYnMcfkRgYPu41n47tCSOIH0IDPTBPmstQPGw46gAE45aeS32knw5SkF7nNh
 iSgCNuL6/n1lV9h826WRufxENTgTkGc=
X-Proofpoint-ORIG-GUID: -G1f55j-bb1n13g0tjZSEFh17cPoI55b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200057

Hi All,

Here is v2 of the patch-set to sort out the problems with the Linux INT3472
code mapping the 0x10 GPIO type which is meant for AVDD to DOVDD.

This should allow the OV5678 front camera of the Lenovo Yoga Duet 7 13ITL6
to properly get powered-on by Linux, without breaking any existing setups.

See "[PATCH 5/5] platform/x86: int3472: Properly map the AVDD GPIO type to
a "avdd" regulator" for more details on this. The other patches are pretty
trivial prep patches.

Note this series is ordered so that if [PATCH 5/5] somehow does cause
regressions it can be easily reverted without needing to revert any of
the other changes (which should all be safe).

Changes in v2:
- Fix #include-s sorting in ov05c10 patch
- Collect various Reviewed-by tags

Regards,

Hans


Hans de Goede (5):
  media: ov05c10: Support full range of power rails
  platform/x86: int3472: Rename DOVDD GPIO type to AVDD
  platform/x86: int3472: Add support for DOVDD and DVDD GPIO types
  platform/x86: int3472: Rename avdd_second_sensor to
    power_enable_second_sensor
  platform/x86: int3472: Properly map the AVDD GPIO type to a "avdd"
    regulator

 drivers/media/i2c/ov05c10.c                   | 32 +++++++++++++------
 drivers/platform/x86/intel/int3472/discrete.c | 16 ++++++++--
 .../x86/intel/int3472/discrete_quirks.c       |  2 +-
 include/linux/platform_data/x86/int3472.h     |  8 +++--
 4 files changed, 43 insertions(+), 15 deletions(-)

-- 
2.55.0

