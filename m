Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F31032548E
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Feb 2026 08:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770971165; cv=none; b=gH61pBgOe8NFVaruY9GFhNpU4A52y0QEhnzqxRA37eRRhvJrCMNPBJZLMATzId0JSw4y/k6EPaIf++v9hrR7ZxkSZNR3pMtAxfkAgofDmKLBLpjPTgoZnhoQ3HRTme/aEonDS0Pt0aDgfyoV8VQQG2lrnwoFXYEwXlwRq8tli3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770971165; c=relaxed/simple;
	bh=RtzMD2pjCX6WyMpu7twr4CyuotWxHzbY5NxN1zLTZrg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=c2XS+0F2Bph/ZCYXztKvOYgTqjK9zrO8Ym5apTt7xia6PN+V1DG+LjJyEBziNx9EOJmdZ2AFZUFQ1nJzzoCOYJYYITaoSy78S4ky/07xk/lawRlGLvg0gTygv4KyRWSBnJ7ziquiGFF9LToQIxJbAVec6XSo0KprtnpPz0dcMpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HTe/72tp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PnhLqYf6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HTe/72tp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PnhLqYf6"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61D66vEQ1776754
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Feb 2026 08:26:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PJdB1zKWc9470g93FI4wat
	YjoBYDw22jdFLxI1y1Cqw=; b=HTe/72tppLnceq5mvqVCt5sziK5gbhq4hutkUx
	IIUIg04dnXNkOAQXJ1MNJlRcYRpV3iSLpjPcSV7LpyQb13tNWRH/0dmNwqsUJsZ6
	JRmJ/mA1vWgVWTIXHLm7U6+LEsijceqD2WDDO1uVDyffLc+HwVW2Iwe2xycbhytn
	b7qpc7KVEZuXounNzNNK3jrIeINJZFmdKnWqKCQIk0g+IjruIx+FaF9VV2cHyv+n
	oivQDB9qUmUhv9TBWoRgpIIVjj8bP+VgkBAu5t16hxbhnuDp+kSz5YRSEzBGV3/W
	lbrlktaRtxYA5T+THCECsYSlGHieqPmDvD0T3zLbPImAO+4Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9jgbb21w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Feb 2026 08:26:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70ed6c849so211371185a.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Feb 2026 00:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770971162; x=1771575962; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PJdB1zKWc9470g93FI4watYjoBYDw22jdFLxI1y1Cqw=;
        b=PnhLqYf6D2BECiuVMCm1wOnxyDkcew5vipzJWDuLd7649AhVAtDRBA0Y4QQDrHZJjG
         3xGOhBdd7YS2G6hp9Gql96KtmoLfwT4bFwLPucvAMGfpKQsgqkHMcdX6mgjnjO5Xw3LT
         kCugPvOMuK0cwjlYOnTxhiObJnOmlUPeNeWS9qW4hNEVT/ZY7AflInZ2asRD6JOId2RZ
         uQ/DTsGpSRo/1Q69FpG1dPEsZg7vvP3YId+/Gh+mWADUhvHtN/rl16cTWmUOVZEGpOGY
         pc62G4D5tC6foGpwuxwMfzrf2vidzj4JyGsZuGrZmn2KO7NOdFXBE9liQmOm/09CUNVS
         Xa1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770971162; x=1771575962;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJdB1zKWc9470g93FI4watYjoBYDw22jdFLxI1y1Cqw=;
        b=sxHTOJq5aeV5NmnB63RbbormfhzK3U77lU7fsB3dqr9X7aFdTWvlwjplWcpvtxbtEz
         FbU3HgJmqsz0JsUc84lJquy7tpE+9At9eS0cpqg69PehnAg9eFNocQmr1coG87KEUtcH
         SyRLXWfXgLAawBD6NHN+GYjSjhKvwh/Gb+IFhmP6g/IrswKru3KzvoxILbN2mWwGiHGe
         rz3glrPDB4jrPlESMd1vUhUkyc7xF9xqzfsQvD1iMqG2s2ef5NuJy2ITl8aM1mcOkB+Z
         6dwTKEacFqT0UVyhpzZFsmWkxT0ZHfdr5C8DJ7tQHtU7AEhNoDu4qseAHrfRP6Snznq4
         oW0g==
X-Forwarded-Encrypted: i=1; AJvYcCU83I3d2C9cgl+eP6zReOLy985ZujXJxJwfGFyGrc/g5GCV3rl2VDaVP5vbOLnuSkKMXOG+Aycb57zxTs6gEQgPhZP4@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4X5+AczNasPSzCIZAvbFEoThV5C2Ao/4LERwLEl8Al+CDwKN2
	WPKR5TKQukC17PHlniuq/Xj4vqqM+KAAcmiWbWoEPcjq17Ms9bgCe1ooaYMLpFtgK9xNKOVJfoA
	j6a4/N5DYWlOF0xS1Jc45jJe3SBlYrA8ZAJEFrj7z8bx8/ed5TZK1U/n+HB1F2gOKSKcn2gz67U
	kb
X-Gm-Gg: AZuq6aL8NxaFLRIcoZYnYBdwXmBuLDE1tfkJLJKnTAnKwmLtvt9/GZzVVmjGhEJfcl6
	ePqMfZlSJRNj1kBy+iIUpfosFlEhfWN3sg8Ku57VaC1+l0YFhofFmKQoFKPFabWKUfDiXWb3mGm
	eKfBIjz3XHVvTEHgQL+5qU3MA6QKnKraXnXmQ7ze0TGdj9knaK+Icc7BW+eg/xeg77K11xQ7W3b
	MW1pVMxSiQ4M1M2XOPzIS6RK5CJdhCs89z3GxGQDmKoh8Sb/QtcRIi7st+WIbURcvqJsBrfr3q2
	wwmVr//+vqAUqDp3PheBvtTcEJEMGlxsD86thrvCgmbTiRWnfXyfYimA7fmMh9W7iAEoPMpybEh
	IeVn1h6+p/lbOQSmiUYzVHjxsPCFcdsaPLQJRVmsFZB9aUoiD5oKb
X-Received: by 2002:a05:620a:25ca:b0:8ca:4392:c202 with SMTP id af79cd13be357-8cb424b3a26mr105807885a.83.1770971162286;
        Fri, 13 Feb 2026 00:26:02 -0800 (PST)
X-Received: by 2002:a05:620a:25ca:b0:8ca:4392:c202 with SMTP id af79cd13be357-8cb424b3a26mr105805885a.83.1770971161809;
        Fri, 13 Feb 2026 00:26:01 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6de6:6c0f:d493:4a7a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48370a78c89sm43075025e9.5.2026.02.13.00.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 00:26:01 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/2] platform/x86: meraki-mx100: create and use real
 software node links
Date: Fri, 13 Feb 2026 09:25:23 +0100
Message-Id: <20260213-meraki-swnodes-v1-0-8e032693456c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPPfjmkC/x3M3QpAQBBA4VfRXNvav5BXkYtlB5MszRRK3t3m8
 rs45wFBJhRoiwcYTxLaU4YpCxiXkGZUFLPBaltpa5zakMNKSq60RxTlvXc6NqZuBg85Ohgnuv9
 h17/vB/xzhwVgAAAA
X-Change-ID: 20260213-meraki-swnodes-44430d8178b4
To: Peter Tyser <ptyser@xes-inc.com>, Lee Jones <lee@kernel.org>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1466;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=RtzMD2pjCX6WyMpu7twr4CyuotWxHzbY5NxN1zLTZrg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpjuAOKLgHt/A5L1FcrrXTDvbNN30v6DJ6CD2m1
 QCp2Qz5fWeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaY7gDgAKCRAFnS7L/zaE
 wxGGD/9t+ZhOqIXzLQCeTwCvH+GQtybo5o5y4oR5OTMz9Z11DKPKag2GVxVmLHTX+7rSoFi34r2
 YjFEyFcNBHxiUz3ir7ibn2YDmrRoURqFGQkFgH27Vczu+cfXkTAqCanOVROeEbuGLBAmKWun5B7
 1Y1ffSkZYFWJ5v49bPepfY/056bcAH6kwwqZDJi1I2x243efNEuYI9rMI4rW5y7k3E57R7GFd1T
 wVSPnfneOoxVuuJ768DljDQ11q9YMVwZ2g7n+YQiVlbMrtGCqJsw3q0jh2tHnPyJI8ZQZonUxWG
 k91OR1qyKpp++OBsdDrkikWx8oj4Yq/vw8p09PknvA4clVEmD6MYOROFiEgDdY0gsojDkF2fqHg
 onE6jCKt3iV1hgkp+stKtwzn5oyn+zqg83DFC1CrIY9HVMzNbCF8ffWhK0H7Sm1Y2jczuxQrPzK
 +NZJnBAD+TQpVHRgfG3cojDSZi4+T/ffGmyCRTm3z3SJ0VI6wJpFNIz9aYeiU34WhYNkdGnXj3c
 l+7GfHcom1hoPhWSqSG3GHjlDmWbzDIu6n461r1GOpyCAU692b1v1CDyfeO6gi1Sm8zEMb7EiN2
 SG0u2GstxR2eBvBahrjk3ofzUTZammJumkiZh5qrvX/0oAVEuJ933uH4anfOmb/7a0npFIuv0mw
 xZny8gA2MgR00ow==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA2NCBTYWx0ZWRfX5ppP50511LlQ
 Kg08O5blQmF2tz9heGcUiUkBy4V9rDCLc0GdDaJeuTj1Bjh0j3MxpAlcspyUA5bLwUOwp+tgjZY
 a3bggF3Ij1p6F2qW/jRCYIixbtvFppx9rEe4KZaiRvAKg4pkjs4B9yDVYSC3VAl6MLT1pKh/9PF
 tw7RAwOEMMBfBagMU08/sW9jT0sXo/7m4XgzD3EVqcV6Wx5EioKwVk4a6ED4/J1MCuYxDXe8Hae
 Uz5F6JXtQfRA1dNG0czdfwOA4Hsvk6ceXAZiyPqkNcA9sp1Z/gWzZXDwT+f8Q/DgCl5Bqpcp5ko
 raNEylySFkZkGuorlXlptNwqTOYSpiicgVAZ0Z6gAbiA3iRniPqqa6AMx0M2coj8dg2x0KXN7Yr
 jqmai5qrCL0UjRpaDoNV2nDB+InSeeMAgrvQIq9DBiki6zEgmiW6esgKbCRKiraAmde8W8CKvoG
 vCQHSLgF2IhfH4TlolQ==
X-Authority-Analysis: v=2.4 cv=ArzjHe9P c=1 sm=1 tr=0 ts=698ee01a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=xlGW1imS_p6MrAhESbQA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: wF1mo51UpquK_ORpOf65U2h0GyEHc4Wo
X-Proofpoint-GUID: wF1mo51UpquK_ORpOf65U2h0GyEHc4Wo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_01,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130064

Meraki-mx100 is one of the GPIOLIB users that abuses the software node
API by setting up a dummy software node without any logical link to the
GPIO controller it wants to use and uses the fact that the GPIO core
matches the controller's label against the swnode's name to make the
lookup work.

We want to remove this behavior from GPIOLIB in favor of actual matching
of firmware nodes but that would break this user. This series creates
a real software node in the MFD driver and references it from the meraki
driver.

This can be done in two patches and stay bisectable as the software
nodes, despite having the same name, will have different parents so
there are no kobject issues.

Merging: this should probably be acked by Hans or Ilpo and go through
the MFD tree for v7.1.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (2):
      mfd: lpc_ich: expose the GPIO controller cell's software node
      platform/x86: meraki-mx100: use real software node references

 drivers/mfd/lpc_ich.c               |  7 +++++++
 drivers/platform/x86/meraki-mx100.c | 40 ++++++++++++++++---------------------
 include/linux/mfd/lpc_ich.h         |  2 ++
 3 files changed, 26 insertions(+), 23 deletions(-)
---
base-commit: af98e93c5c39e6d0b87b42f0a32dd3066f795718
change-id: 20260213-meraki-swnodes-44430d8178b4

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

