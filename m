Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DD54D4889
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Oct 2026 14:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160241; cv=none; b=ZM2W+DlDH9Ji6Zfl5fCWfJ4h+KzcM4Amg15bYYPiBst44VUsH88Y/848ekbQ4/MUuFOVZ8x59G1BKacTYKK1xy4cUqCdW/ud2dSxi/T+svc61u91gExO4eKDyFwAA1hOj2fV0hVM1OJzKvemi6ybW5dxGmCZ3sP/n3wjfzGD3mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160241; c=relaxed/simple;
	bh=ctZlcSVcJu8+Tbc907BCPo9NTDT13WghMk01OeQZFLw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DRG7FXd4sJFt2/aAZ2MPMcdap4Fi8Gu1qwN1xUiqpTDwprzmPJqPmAWyDHNW4+3x2ScvrqjSiQJNu+7TbWV8nOMGtJApuTn//KSfYI+UwGShMFa6uzztrq++jR62eLoJNixt+IEgpsYVx3slkoYP2oMljPxWrmqd9tW50CxsKco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SMgtjo/e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q/Y2NW1a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SMgtjo/e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q/Y2NW1a"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE6Qd12494912
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Oct 2026 14:17:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ooOLvqIqxWGsuVJuYXDUntOZ0JDyVOzpiYV
	OeIeO0FM=; b=SMgtjo/eA6Jtht8Y7e8o8Nztc4Y3kcp183O259O2Fak2Lxz31Ju
	gyg4QgFD1Ucxj7B2rYN/KIE53ZvK5SoNW0Ntb/Go2FsEEc2KYX7dEBQhuMDYuDC8
	FiGVIwuVhlKS4JFPO0vlsNIZQg1NQk4jeL8+Eko/9LOdPYIoNUw76aBDnbNgXlpi
	HGF8QXMh4j9naHikb9haa0sVWF14RHPynCEIqIRy9oa6FnKQEdu/13H9GPYf7kT+
	Mma5r+90BMYeLCly9JKceBnRoYPP65+j8H7yTNFpoUm33lIhKah9rxKelIvTWzcp
	BhjDnWFnUImRa8W3oEEgSVpAMIvjlpKaDEQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8a8b0d3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Oct 2026 14:17:19 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99062be02ddso537494241.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 16 Oct 2026 07:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792160239; x=1792765039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ooOLvqIqxWGsuVJuYXDUntOZ0JDyVOzpiYVOeIeO0FM=;
        b=Q/Y2NW1a2ZGXfh7yx+7UgqLPY1EiV2+vS7b8Ad7Tg4cV2oKl7I/Dcnh1NHJm/4sLU5
         XT/0LSKHdeSQY5s1xF8zIg0gya2h1bTnzg1VLC+I8I5w1xq6JnxtGuPY/stHdgpG0jgd
         je/bahv8jfXEQY9QC3B47CpGgG7Ha9ptaOTFyoUeQtX7LPvinERVn+Tgq/BJlO9GZpjy
         8nvYLrd9/fOBTW4jTrb7io6+XA6/+swgQmKGpl4aXJD/NPfy1hyZseT73RuOkWjP2oFt
         No9kKqhglxNCzKa6LcRoKcAPqTZ8gahSL6tXe4AsN1LIqaFVBjzkNUlYkcOnX7MsjS7V
         vAeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792160239; x=1792765039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ooOLvqIqxWGsuVJuYXDUntOZ0JDyVOzpiYVOeIeO0FM=;
        b=iYzgmPD/rqvYfjAUaV2HOVRtPJ5PTsgQslaIfA6L+8oAZ0KAQeCqO5CixVovA7Vfaw
         5y8rjHhnTl98+10hXrjw597WQCVdAraSewvWugzDzRX9XRuJiFkgWIKXdozxPkyOeI06
         Chqq0RexgCyQGaRen5KbG4MAi17OhY5pJBA6gPNgmWgpUP8vzVCWf/ni7Uol3HL2jZoV
         Z2c/W9phCPxIsyDRbYVypRD4o/fcoTIOg073zT62ZFcgBckJkUM1rnsLdjGf+yr1MCpf
         NrX+A/zkmBQt9dr8rzicH2K12g8ZbhYvj0H5tjE0aWTGLqNenvZ6viJE6SY45ntfsbjU
         pxgA==
X-Forwarded-Encrypted: i=1; AKwUvByXmyO9wRzlMUuqfGM31iPc0jeux4Nnls/WC/v52NSLsC/LUO9doZVjZ+JYfdqY2T/NSpJ22IE4/Gly9u4MupJM3bQM@vger.kernel.org
X-Gm-Message-State: AFq9FYJwFxgUJf/PPdGKWKai4XDkQcHQfopfeKL4TgbGz1FBFdyT3x5t
	7n5i64lgFvw3mAK8mt7fnWya4U+vmyP8hA8gvgwyuZFQqMjVPfglBJ80s2mHwBB6k9XB41bKsU8
	LoPV5TVbSIbGqUc4PKkWj6MvkE3XOh8EhcackoIOaAALmX0uYFPnM2FrJTr5OFEpAEuog5O0H9d
	5w
X-Gm-Gg: AYBFou1aLEpQLXxbiq3ap2E+veykzi2KYfO93aGz/Exgir0ugywPRMIyqk7uDJBoS/w
	hwn08Q1OAO86Q85Z6LHHNuGoW0kf/PyU3uHJjf0IIsmfig06WKJglvP33CRI92LJNzm+bO3/6Hk
	vbLvBjp+PuabQ2eHYwJsb7DXYnJ4I9ik32bmhHWdY6Ph/bx+Iy97HV72TanY/wua2sSLRKXIF7q
	4dIUMOrktHS/mC/gHXIPePimEO1xIN4vSu7VE6ZwdR3+JJc7Mq3OR4i2Qg+rJ24LWVir8oVdRGG
	LntLgkvsmhK+2uf7w8GiKzYlOWjvCrqWZairf2dN/0b4TrM8ikPvHSO+aHSV+nodQp1c/uMEbhL
	O1nmiOfBCCrX+zmel49DdclQnFVf3VkKAOKIdCe8kqo33+lX8vBJmW25/Vnqz2WxwNGhkowaHSj
	3tZeJkXafgW0s6TA==
X-Received: by 2002:ac5:c011:0:20b0:5e9:5e79:c7e with SMTP id 71dfb90a1353d-5eaaa8b7f87mr48830e0c.22.1792160238584;
        Fri, 16 Oct 2026 07:17:18 -0700 (PDT)
X-Received: by 2002:ac5:c011:0:20b0:5e9:5e79:c7e with SMTP id 71dfb90a1353d-5eaaa8b7f87mr48799e0c.22.1792160238004;
        Fri, 16 Oct 2026 07:17:18 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919c03bbsm71144166b.64.2026.10.16.07.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:17:17 -0700 (PDT)
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
Subject: [PATCH 0/5] platform/x86: int3472: Fix AVDD and add DOVDD + DVDD mappings
Date: Fri, 16 Oct 2026 16:17:11 +0200
Message-ID: <20261016141716.130220-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX41dW2kR5NqjA
 0MbY7VHM4Syvn65C1RU4lWfZsm3FWEFTkxKKohxTo+XWug8+PKv81VkJtUxHHo+zMB8W0qdBgyy
 CDT78Xg0ifFr8heMuIv+UOuVmuNs+UY=
X-Proofpoint-ORIG-GUID: fi3M2m0kJH50633cwfLfjhmt7383VdW9
X-Authority-Analysis: v=2.4 cv=GJadgeNK c=1 sm=1 tr=0 ts=6ad231ef cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=kVL90IzE1108TUsV_fAA:9 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX//QvpWRdav8b
 92vMiDfJ0b6yH4EQRO+mF34vD7DVTqBAkuC50vktJPmR3LEBc4kanR9AMG1LR985hZ82OUkajMC
 CPMoT+LC1XQpzStW7/VejGymWVjUNd/p8S5xuITibgEwAsfsm9HQHwttZ9Q+1/AmDyMvIpwJEub
 48Elqw9NWXwkJ+UUAdmnfJiim1aOnpx3hmrqORuTDwGZXoPHxATnxTzMreCry4tamwt80ur+mHm
 9aSkEalpEApfzRdBE5BXEF0rpN9A8qExCXbCWUEte4E25A55FSb+q7wak7RO4C634Ut+WK/aN2o
 OHenJGLlQWMgnqJkwCZMiPzOR/x7zFUWV3y0MOxcHojoLCrAnYqqpnXcbN3q9cTUkOcnYmRNklE
 ya13cipuLKbT0XhI5hlQUSIcsrPQwXkbB7qCRr6TkYVCxCI2Xl3eQDuZTNKvXF+LwVvPL1fXvkc
 XEBSvRH5JNSonWpFvtg==
X-Proofpoint-GUID: fi3M2m0kJH50633cwfLfjhmt7383VdW9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160056

Hi All,

Here is a patch-set to sort out the problems with the Linux INT3472 code
mapping the 0x10 GPIO type which is meant for AVDD to DOVDD.

This should allow the OV5678 front camera of the Lenovo Yoga Duet 7 13ITL6
to properly get powered-on by Linux, without breaking any existing setups.

See "[PATCH 5/5] platform/x86: int3472: Properly map the AVDD GPIO type to
a "avdd" regulator" for more details on this. The other patches are pretty
trivial prep patches.

Note this series is ordered so that if [PATCH 5/5] somehow does cause
regressions it can be easily reverted without needing to revert any of
the other changes (which should all be safe).

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

