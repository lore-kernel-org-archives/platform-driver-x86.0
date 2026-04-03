Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840BF3346AF
	for <platform-driver-x86@vger.kernel.org>; Fri,  3 Apr 2026 13:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775224332; cv=none; b=a9iYJZMY3Z2lVIMCNv/e1tBEGAjmCcjCYdUNf0n7YExDKQerMmRYfC/Xt46Xc9pEtELnFeUm0WHhNsSNcAeqWWtPmQCaij6c4TSZGxo22G20C4N3W66X83PUAP+cIa6ip7W07HtszmreBUMeEny3cDXNay6tES3nIJHrdSiiFdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775224332; c=relaxed/simple;
	bh=2zTa1uQYxUxYRVUzJRipjA8BBDZOomn/630n+yTJVvA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ppLzQlKz1wY0BZXIYJIXaIHzbQA97cgIxFAPvMyZlHf01LsdzUQq236k1TxyRrn6txC8zBnM1g9+HrPlE2IAweOI5V9NHsN2eP32gQe5cMhZypfCUogVe5IUx8+hw/unuDbDTHfp7znjRaBu2mAWsnut+e1xxf1y+bpfSbg0KLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i31kDSEZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jp6NloGC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i31kDSEZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jp6NloGC"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63373tO73449908
	for <platform-driver-x86@vger.kernel.org>; Fri, 3 Apr 2026 13:52:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YBOqdtkmDAapfYrIsDUHeJtnSWg5R+XBtBgMNTUB28I=; b=i31kDSEZTO6j14Yq
	54cDaSv3IS/hfSe+Rz9u5i5RKKRu4WBqnfUTRtdz2hgxm7sSR9z5T2yLEr+4AKhG
	tS/pCmxgrIN49cGzBR1606L33P9goC+5bFJSGkcSO46RFe45LXtuySdhFgMmrwrm
	g8wQEDABefLem7eDkTKDhFUq3rKJobyq5Fh3By+IXRd49VkwhTIJnajqw3xJk6zq
	W2+9Vx7P3vwfZ6ikFZsjRU8QkPohcmfRt86iMT074Rj7q7B9xWjJ4YnfdRygZLtC
	ZBlUs/ekD82i3yUCrSRPLOW/tG3X9xIa/53xZkUdueT84yC4fjKgI/iuV9F93d/B
	YUFYQQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da8u59475-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Fri, 03 Apr 2026 13:52:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4661881eso23561641cf.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Apr 2026 06:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775224327; x=1775829127; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YBOqdtkmDAapfYrIsDUHeJtnSWg5R+XBtBgMNTUB28I=;
        b=Jp6NloGCA7IlEoogeTSkyiyOak2YrIbvv+R+BVWV9ueTwAkV0JWu5X4PJ0BIrmW5b5
         kACAeXpM0MsJmnbz9EceBsX9uW0Uq2G0yG9Lg1V2gKboi0mNAJhcQeJKnmypNba9wCN3
         ycaDtCk2aRkq7EWQazDsyPDLWXZtujCw7B1RJm6d1nhiNJqTl5WDRYSzut8cRPSDsPFl
         wsRF0VTscOvM3PwT9txAoNYUinhyEDS1Zjp/mRtHn+K67qltnZ7akxFFmngDbbGTYhvW
         j4nsw3IRTmCzZKizVpbp/1wAxMDs/1GbImACLEwldTNBPzazJmf0mHCvUJkBRFgg3D94
         5Y7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775224327; x=1775829127;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YBOqdtkmDAapfYrIsDUHeJtnSWg5R+XBtBgMNTUB28I=;
        b=UHXMYyR1cO5jk2Xh7cjZCOCJzNT/uBnjbx1Que8eDThduD3BdnJxKWmlyqO19sVBNm
         LMPimesJNaDZqdGu3RD/YuyxpO58Fl+8LfvLT5wCU+LzxSaX8vY+LoPEdRmwN9UZeOsL
         RqcifZURXrGS1cPNiMjgVlsX8vTT3eiEc+6ursNu4eW9FwKcxhuRc5kuJTlO1vMuRm1V
         7EfQkSk4dA0Sd6cJNfyFRtCp2HQU33dAmYrL6lxqCI5MkAZUW/2LXJMG7+MtrinjrovT
         TbFtCLRs+wZrWVSeBR2H1i7QeF3I47PFnXoRIeRh0zDBqcVGOsnUHpWxH5fKeWOwhBCP
         Ej1g==
X-Forwarded-Encrypted: i=1; AJvYcCUloW8kqmA7yxQnVYwmsNkVrFFUxl7O9SdEnFFnO09SVz79qhouFUEa7zcVELjQIeN0rVMUTp8OyyTQDxBYS1+xFQiw@vger.kernel.org
X-Gm-Message-State: AOJu0YzrhztHJ3S+JA+M3H3s+sfgRuwTWN7otm2m4D4oLJAu8ztMufYD
	tqFv8INlYZa9FzBwvy48XTY6g0xJg8kKNWrycL5U6Xpbvu4Zkf/oAlvO/TYQ3ZCHSUirFx9S0ij
	GE4MG6J2tZZxVCGgRx+lNHJM0WyssY/2GKHs9ViGnZEgRphpySsflKw39hWplBERRmSzNPk4/go
	LG
X-Gm-Gg: ATEYQzz7e/EHFlGjv8VOgIVaYlG0ehpv9l9yq0DuLLhf8oaJ48AUbMjDaBFCRAqi5gM
	D1ZvgEUGMvzLG0+JjVEwHGWoP7AuZtFGE+9eqYXg+C8+/4Ahc60Gu1JRIWks5zBxEZA5znmSZyF
	1HrYmBv1BQ0ex18affms+BsqampvfQQ4726fspcDEGjBzqVSnGFggprnjMC+vHfy0YS/+QXN2M0
	0EqUNQJOv+niJh4dzrYFBujq56PO998eHvb4uvvCX2Gcct1NkFpC6n3jkFgHU6lu4c0i96dBv/v
	muod0Z/5bFfZZZPXR9Nf6aLzM3nsVzvFsRcBCQJPesPF0M2aQ2NWUMqS5xcix0wOuEVeNSZhnRX
	GO+qccvggfRO5XdIZXvQgqTTelBY/I1ihLigCmQR6phpqaZD0WhBK
X-Received: by 2002:a05:622a:6854:20b0:50b:3f50:178 with SMTP id d75a77b69052e-50d62772e90mr36398421cf.14.1775224326128;
        Fri, 03 Apr 2026 06:52:06 -0700 (PDT)
X-Received: by 2002:a05:622a:6854:20b0:50b:3f50:178 with SMTP id d75a77b69052e-50d62772e90mr36397991cf.14.1775224325617;
        Fri, 03 Apr 2026 06:52:05 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:129d:59e8:f7c9:47ca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d29bbsm16948132f8f.21.2026.04.03.06.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 06:52:04 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 03 Apr 2026 15:51:50 +0200
Subject: [PATCH v3 1/2] software node: return -ENOTCONN when referenced
 swnode is not registered yet
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-swnode-unreg-retcode-v3-1-7886092b28b4@oss.qualcomm.com>
References: <20260403-swnode-unreg-retcode-v3-0-7886092b28b4@oss.qualcomm.com>
In-Reply-To: <20260403-swnode-unreg-retcode-v3-0-7886092b28b4@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Len Brown <lenb@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1381;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=2zTa1uQYxUxYRVUzJRipjA8BBDZOomn/630n+yTJVvA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpz8X/37eCiBlH+aem1nIKwfVlK9GeJXczn48iF
 rKSzEir77eJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac/F/wAKCRAFnS7L/zaE
 w92hD/0WgKx1R1QdJujvcq6sffSUDfGGKkdEhTqJ1XuTfk9USZdzbNgpV04hIVe0Cc2kl53gVTS
 8sRcPAg0gkLKdvq4T0CIhQL5cQYK8nehO5qpF0FqyZ0ZYc1kgzRmTAIneqeRRJFqLK2zzt4NlNh
 Zo4U71ukvF6MpIXtQDp0q4gbXxdZb4R0hvWKZRQG/cv7++uYe/pQ0Xrju2LbrjxbMD99tu7tHBK
 cZUyzgnizNZi/AX9ssfQ0ENaZlG/yB8u3yoZEjXjwEj4qdHqGWhvswdtVaUZ225qMso8ICm4CRn
 1xQ0lXLzskXvwomct6OCN0PlRVgDL1Xqr+BXWnTUGB0bA3YRyXGHl6xN8/xQeDvXBg1PYkYqD30
 J9IFVBtFQz7/ZSkpHU15Z8Fv9W5xyMwKBGuIsOwEi2/y5Ukv7oqyH1DBmWxjNjo+UvIQF7ZK5kY
 BarEbjpFRoCdiSG8+cVTHbj8zh00WpFMnrLwqd6j8542JbnV7LLfD2Rh466JYurfzDObMAVQPhc
 1ltMJFE5Ocs3ON+UOcysGTNOaZF01BfieRp+Si9GR0XQlP2cnL6ycefpxJ1xEQ4RBAwSB9cg3Jm
 yxEhy7G2FlU40MrDwj8xEK7b76VPgVQBAyvSW1DvG1qHQ+UOUtYLR2y/KDN5Ob/6xVPVACGXBRR
 k64RKpZZ4Jzqgrg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDEyMyBTYWx0ZWRfX3i0+2f76jsEP
 rus/X5He5H1fzdGVBmDfd1eNogUD4kfPNoUe/8PM2VYElwYsbGuNqyRPofJMPbNjay+Z+eo4x2j
 tGzKpX9ILl4+QYOuMTyoEUYJyp6+/DJi7dt5T2oBd1kb537y1NI7gazYj4YG3kh3Ayd5V+70XxX
 7dUMTCjK/9OauoZ19ryVZpImooiGRurkeMdRkZJUVtajSSXkDZejWcutZO0eiRZc9HNhT1S/typ
 uwU+Ew7LLSMLZWGLvCeNWE6/lWzZ9tmcd4zDh7hN9P69/w4p0aC5HSD5UL2+SZYNj0SvC//huW0
 PIr0I96qK2ooIyvekMP03N2w6Hsj1Eva31VgnJ4QoyipXkAuRNINcHVJWgRdSMdhq5h7KBoT3z3
 X8hblXJRiKouXhR3fnvT+LJJmEG/4zqRryPBYnkOOIlcntKGQ0/Iop/Iu/TcBeR3TJeVWUELYdT
 PN0jY+1R2zeq73T4UEQ==
X-Authority-Analysis: v=2.4 cv=W5g1lBWk c=1 sm=1 tr=0 ts=69cfc607 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=WW6vG2jIvFMNhbJRSCoA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: HUI1OY-4XvEdikM67EbbFAcS0Vs6jBmQ
X-Proofpoint-GUID: HUI1OY-4XvEdikM67EbbFAcS0Vs6jBmQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030123

It's possible that at the time of resolving a reference to a remote
software node, the node we know exists is not yet registered as a full
firmware node. We currently return -ENOENT in this case but the same
error code is also returned in some other cases, like the reference
property with given name not existing in the property list of the local
software node.

It makes sense to let users know that we're dealing with an unregistered
software node so that they can defer probe - the situation is somewhat
similar to there existing a firmware node to which no device is bound
yet - which is valid grounds for probe deferral. To that end: use
-ENOTCONN to indicate the software node is "not connected".

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/swnode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 51320837f3a9f1bf4f65aa161d9b941affc74936..61e73417aee89feb855b0f429e112ca0af78a003 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -554,7 +554,7 @@ software_node_get_reference_args(const struct fwnode_handle *fwnode,
 		return -EINVAL;
 
 	if (!refnode)
-		return -ENOENT;
+		return -ENOTCONN;
 
 	if (nargs_prop) {
 		error = fwnode_property_read_u32(refnode, nargs_prop, &nargs_prop_val);

-- 
2.47.3

