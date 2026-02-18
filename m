Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA312FF643
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Feb 2026 10:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771411694; cv=none; b=LrNAjFcTwjq5x0DKkV7Qdtw0DgCe3bKM7cLawrH85N+hGNlBM1icaKVBhnwKB4MYT8TxJLF99Jo13f+Xo/LOBKF1kCf/k0QcBOm/NrFfpBaqAcj6n52p70urFoBRqVgaBmNqzJGXMhuhQ9nLy/TdE9YhCD5AoOTGWEVK6xHW/9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771411694; c=relaxed/simple;
	bh=xdXwDqk18Sb4e72UOP0Zc/3qXnPwHS0OKhf3kfEWOjQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AV5oyB+8r4ZChOIaEJWKWmsL2SH22Y3UAUsERnlYruHwTntnjyNo8ONS5aPV1UPL1u9pzsWfLVMrUyGCZn0yhJBrz95gUteQW8dZ4J+tbhg6IX1DAQrGm4NmiJPnHIc6X2LsdiE8snNJQJVjrwCAga01PZ7BC2y0nwsg9SgKvWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aq2f/IME; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YkOGfTYE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aq2f/IME";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YkOGfTYE"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61I5Juq6421072
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Feb 2026 10:48:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=S7AjaF54C6PclBGHMzmgsk
	eS1E1PLxUhxmXXR8olsgI=; b=aq2f/IMEklJMtFk8Nrqw/+Hg1+vCZMgZLQGFqM
	HKMAkQMlJAToTsYyF4ARlNO+GGXRH0/z2SqBIJyNygcMW0xCiDaKDD6CFktIFTu9
	PXeVQ0Ap5RfmBvGDGqCkfQObHA8KIiVOfo+gd4t5b3qDNVorJbtkDsv/7H2gEBL1
	1d9VRMWjE+t/MpAwaXxS8RVDD0OOgaHbD+lDz+6Lq/fA2ZOQ1eKyr2GSAUroCdrz
	xaTjAMIyy+hVv42Dl7OJIgpkHlvwUUpzayQycr+reTzOCN8Dp3uXH33KBnKDJVup
	OUZOgu1y4wtB+qNEs3fVsFgTQtePVADl32qgr6VdRA+kZLyQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cd76e0sg1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Feb 2026 10:48:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb706313beso191650185a.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Feb 2026 02:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771411692; x=1772016492; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S7AjaF54C6PclBGHMzmgskeS1E1PLxUhxmXXR8olsgI=;
        b=YkOGfTYEkWJYc6e7TXM9qEfF1fWqGJjl4Kr7rPWF8MGTcWxsCwdfZzNz7OI0Bvt9WI
         sWvpD11Z+Lqz7+UxWAJf8cIO2PzOVxhLaGkO4inlU9p+cRHda2Uo22MhQqBYCAe90ipq
         IOCsPInGUgwiFdERez7ntytCovEnOeLZ72/eA3lRBQ0p6ZaIQIKNFBIOO7JZLEOsCrLM
         NSA7CY+eJc3gxNuKAGD3Xbu/TpEyb/KhQlomFmXrdaYrFLVkbYljB505JLoKlPtnxWEj
         fnoMIr99FI9ru/muPu/RWaC32rKlnolYqtCYi5sK2gh++yiPZN5mlHn7XUuMEk9YZsg4
         AUbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771411692; x=1772016492;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S7AjaF54C6PclBGHMzmgskeS1E1PLxUhxmXXR8olsgI=;
        b=lmsApABdIq5TKK1Mf3znwf79NSyAHArNWBUoRAFUSHRcKFNFtj/++YKLhMLRBEKfRp
         KM/M1v1WmBwktbEkq619e/Cwuc+7Jn1LHZo+4w5qYgKBV+oiWOBSUfD09PXyiD2EA9Kz
         cZc7o7qxmj5mlfsJtUnpIlToTRm7sB7ARV4bXnJlVmCGbLd1TmksHCT2kveCcpZbLTjN
         ygB9bLeB8sSX+qJ/hO7XRMT4JkhYKN17mk+ll/aMOkF4Em2rRA/O6AIQbbKKScw9WSZi
         uZHdTanSfEmmg9nUUUEM9QCyh5nqPxM3yueKRLUE4RzbkPLMvfBNaQYNR543u8P19yAX
         OOSg==
X-Forwarded-Encrypted: i=1; AJvYcCWEgTbJNTFQnarZ8xYnnHMMtXjeKaTSZ8mlRQsLpdEguT9jdabJQB9EXrQ3f7c9htN+IqUCprrkgl2bu9EBtraSbTS/@vger.kernel.org
X-Gm-Message-State: AOJu0YyYq2BJXa6gHZqg7McXJ7CuvVkuF3PoGy1XEUp8ErmAUa1m13t2
	iZt6X/aWqrhD2RmmUUknfKCE3rE0g26tmtjZ0C7qRhlUUFf8RS9E6zn5IiQyDWJNeR/zP7fMEd6
	RA81eB5/+yqILQieC0CWYLVR8ZC5JpR+55Y7coTk+GQ3Y/0RVTVg80QcYwLFDxfvHxPbtZwo8e5
	5KIpJIAw8/
X-Gm-Gg: AZuq6aI+OTnAHSQQVUCXBB3ueggm/3j/VkH4JKCIkF4AKKUWYyHfvzARSj2VJqCmf+T
	TU2VBO6lzj7/CLOrumEKJksZKm+qV9ByX+QFxsjIxJAZdPjVCXQRAqsA/TgtWvAdWkAZodBMDZS
	BhTQ2OgdJo2Z6WwcfYc23OHANDbbXAm5GZEuesbv0CFYnn+p3y28wwpEs59Pn7s+RVhKSEb4jEE
	4FV9pt8sWuzrssUHYL4pn8QNeyp8qKN9Gw+Qm3s9bkpd3sx9EYO5+WSdf5NHNAMxl5PzBtlLrSJ
	p08oJGVacLVNn05C0nFiXl8jnAXxqnmoXj9WSzzdMxTdf9WsH+oWYh4idP4+QdfPHT4F7Ph8Yjr
	AJkYo3lwuo1KxmCncebCx/6HWtMP4oFLxqXVRPwYZUeP9oBxo3M8K
X-Received: by 2002:a05:620a:29cf:b0:8ca:123e:8194 with SMTP id af79cd13be357-8cb74043603mr152555185a.33.1771411691857;
        Wed, 18 Feb 2026 02:48:11 -0800 (PST)
X-Received: by 2002:a05:620a:29cf:b0:8ca:123e:8194 with SMTP id af79cd13be357-8cb74043603mr152553085a.33.1771411691359;
        Wed, 18 Feb 2026 02:48:11 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6f70:9a29:d138:f5ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac8d46sm41907451f8f.32.2026.02.18.02.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 02:48:10 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 0/2] platform/x86: meraki-mx100: create and use real
 software node links
Date: Wed, 18 Feb 2026 11:48:00 +0100
Message-Id: <20260218-meraki-swnodes-v2-0-92c521da241c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOCYlWkC/3WMOw7CMBAFrxJtjSP/MIaKe6AUJlnICmKDFwIoy
 t0x6WmeNE+amYAxEzLsqgkyjsSUYgG9qqDtQzyjoK4waKmd1MqIAXO4kOBXTB2ysNYa2Xm18Uc
 LRbplPNF7CR6awj3xI+XP0h/V7/2bGpWQwqM02m2NXbt2n5jr+zNc2zQMdRlo5nn+Ajdh5tizA
 AAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1638;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=xdXwDqk18Sb4e72UOP0Zc/3qXnPwHS0OKhf3kfEWOjQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBplZji7vguJU70PreDSdwqcdO6x4kcmxD3s1jf2
 Zn6cbqvf+CJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZWY4gAKCRAFnS7L/zaE
 w2JVD/0XHINyZ99EafvdIw+xED5sH5rbhhRfER4gCSx6E0rv7jq1U0zBLmcGQwXVLb6ASDywhID
 uOVAxH6pSSUZalbWM0d8bECZNT7lGFBXOaHWT+eeueFh0NxSQ+W1mCnO6jEH3FqLRlEgit/Lkuk
 fdTLSI8W22odsqKXldzovMPE+yIwQqVm0KYnZAtf32sPjM23sfGQutONQ/B011+u6r7UTkOP02u
 GfpmR+kcqLb0bI3PXa9JaMC01R5m8YBMpTJDqS5xwzLrWEJlpwooKgcnQdSvc6+VOZUXBuKC1JV
 U4onMMb+ybiA/frrRnOQ959AzktflOblf9xa0ydLtAREGSVRDs3SGFyz8KKco5lH0kXg/YTKjr1
 yOMnEAnsuyHffHlaR+AM+r2UDsI/wis2ldSC870xNrH+BuOrLLCHNSyPvNwvIOPdKRiF5P6GV8/
 aghVDQ6lnXYJGYKyYW2ivTlfEIW0zGSk1IQ1xnCsoNs4t+NnLSJi1PASA4HlD8OSyv21qR/Slfr
 UTfDHrtS6Z8p5EDF2cyNKxGFGB+Cy/qT9MMZj0bx3emN13ILYlwPp+mTcoXNQnGDQ9TczqiHwey
 fBAtwYKdxkl47i7QRe0FnC4OT/zDbqdaPa7XI0UZw/mKbbMwhpoo+nWuUKIBuBtY3Vya3U71kMH
 49au8m/7SjHy4IQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=OKsqHCaB c=1 sm=1 tr=0 ts=699598ed cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=ZV0Dq7xdQiWb0xfybaAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDA5NiBTYWx0ZWRfX7GccuIpv1Pso
 UPJFmqKQs/Y2duO5Xsu/EwW5Foc0WllOGo6EM5KLcroixqxA3U8bZmiZp9WthL1L/j0c2CmTNxH
 rBKOpNYTrIzoMPRUgQgv5Jm92TZQ4F5pcfuyq6j7ffPiPpwBz3S6K7GzNO/SJyW1mLvfkk5CuVd
 5ac3TxWMYUbYA0wu4h+ujSVbzvDzsgvutg5AX0rwLg7AQzVl1AJThbyYurplr9H0Wj+RJL1qwLm
 y4BPk70ybrAXos7MpIqkh149YfmPCuxfzpS8cBSeHPBe0mpgn9iK7xeLtErgnnKO/A3atBx5bez
 mKLHIlWtIH7Lh7TAQTAxRs/thne7nOAbXgDOJNYhUnO/3He/u4EI0NsqRFK7mS7D6iILPr1z8dZ
 BLReCJgYSni9prJMkfPTZzs5HVP05gZDVDCnsQ6hczHNNtAnd2EqsBVmAlpWi6o3OyFejxnaZ3Z
 NkAubde2qNW/POg71QQ==
X-Proofpoint-GUID: z3dolzRF-mBtMlxBEk1bMXM10toLyNqZ
X-Proofpoint-ORIG-GUID: z3dolzRF-mBtMlxBEk1bMXM10toLyNqZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180096

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
Changes in v2:
- Use a namespace for the exported software node
- Link to v1: https://patch.msgid.link/20260213-meraki-swnodes-v1-0-8e032693456c@oss.qualcomm.com

---
Bartosz Golaszewski (2):
      mfd: lpc_ich: expose the GPIO controller cell's software node
      platform/x86: meraki-mx100: use real software node references

 drivers/mfd/lpc_ich.c               |  7 +++++++
 drivers/platform/x86/meraki-mx100.c | 41 ++++++++++++++++---------------------
 include/linux/mfd/lpc_ich.h         |  2 ++
 3 files changed, 27 insertions(+), 23 deletions(-)
---
base-commit: fe9e3edb6a215515d1148d32a5c445c5bdd7916f
change-id: 20260213-meraki-swnodes-44430d8178b4

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

