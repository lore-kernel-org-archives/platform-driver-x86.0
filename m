Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA443CB2FC
	for <platform-driver-x86@vger.kernel.org>; Thu,  2 Apr 2026 12:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775134503; cv=none; b=GlYMRGZYQ+XS9msA6Gk5j7nYNPXMxbE/adLx/6gZfE75vURiTZwom56lZ60zj5b/3WW8UWK1NtNl41k1859PVPSJODO3Z3ljipORChShP/fi2wkhpH7ng1f+2I3/qcgHUH9+gpFKjnpFhAfjALZCfdXeIFQwGCnZV93gLWhSTgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775134503; c=relaxed/simple;
	bh=mlZurhMjnNadP6KDAy67g1xVZeEONxV++y8bOiCYR0E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lu762bvpbDgnAuntdxmt17ot7LkEJVH1TiYkITyKlw8wDzmeBdJBArCZ0Hn2BQnPof3MN54oPEWYE4XEbuaIBo+dlZ5jgR/G1G2wztKZMZw7K2KZGNB8JJWDbYM7NC5ISNtmrIj7TBZRIJljr4QB7clhVGABZFIDE8V4BzeHK0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EElPktVr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hdfcTl5P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EElPktVr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hdfcTl5P"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632BW1CX948904
	for <platform-driver-x86@vger.kernel.org>; Thu, 2 Apr 2026 12:54:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WLLQEt/bxULlBw9ELKCkgAUAtDDl4p/o2jmjEXGFfa4=; b=EElPktVr/2BrPHft
	2rFAdG68Yr+mrWZbiSbrh5m4EpyBYGxgwQKe+GnyQ9si3/8ReGIXAQKmds2AYzMd
	x12Mvd+c7SPGL9FYDgZyPbdvtVPA7RPRRx/4grj0NfJqXkAt1y/le7Ziqe2vHfLf
	uae/Yjd/FVpBgibBZov1ddOCKng69PbzIXKdSjSSxTKNJ0Gv4pK+/MStyv6C6c71
	D8T82hW/vl2agitC89/xfEpPArexbIug/1uO2tFW/TLZpdSp6TJGeDmTjOdBNJRG
	3MC4y2aH3MuM4J0rEUIWwaNiT2uCcIV8s/5/hzOb2cNtYVotpb7boRhLwYOiEZ4W
	0TwqBw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9qnu0c6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Thu, 02 Apr 2026 12:54:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4987c698so1467941cf.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 Apr 2026 05:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775134492; x=1775739292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WLLQEt/bxULlBw9ELKCkgAUAtDDl4p/o2jmjEXGFfa4=;
        b=hdfcTl5PIMTxSNGnptB87VQ0Eo4YvyMqDR7w56mVx50AQTi+pd9HsKmKKz9nefomwS
         HaoW+pbazIyJrjRVm+as428XS/qJcNFL/sx3YQBisbQQgkqhosd95jEevpcpoD0VxWHY
         bTpmWxM0DJ1Tk/yOcHbDfL9XwD1HM/CZPNlNxfQ/Ojbvo8ZMaVH/9w1RuCRwjzpCbvHj
         UG+W/XE6CLbRwPnTPIDfW1DFB+3nlGkclsz/tBNPcX3H/3AfVdQOa8u8W2SshUN2cXB/
         OnTyGpxgtwGKmkWw+G5PvBs7eEmbCF1BwASQEL9Qjd6XMoyVWD4OYVJUMcECdAlxzAZp
         uuNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775134492; x=1775739292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WLLQEt/bxULlBw9ELKCkgAUAtDDl4p/o2jmjEXGFfa4=;
        b=S4Jg0IM1LwINK8Vy/0vchZjkv0dgw+3DCe7CRW/Vz2kPKouGoABjWYUHrAd1V4BhT3
         YPFKJBCCZNHHVoJ5cNG1X7Fd0a/0ZrnLU6NBPg2pUG8Csc0SlLllejT4zm22lskt4ct2
         3USjpoHiN9ob15iCa5qNPxRNVzX3fNUU3jrxLIY38J7VrdR/W0VBlk/cHXrIMdgORZZL
         K7BHe0Q9mWyB9L6WY7N/IgZtobS4VWMirhJgnD2b4cPRBGLJ4UhMs76kzcCKgWZbLkF0
         +/xmHipDe5u3ZV3vty8JLpq7KYjDNYAJtsvGhoCRflRq2fuOICRgEiTtSq4rcOS1OTqd
         /FJw==
X-Forwarded-Encrypted: i=1; AJvYcCUDvWNVYjSP5FU0wkUeAepgjtXr1uAxmthqCfvFneuDA4D1aKcFPxrAyhZo693y1DnL9PLewwQKNIQVDf/CyRwHN54B@vger.kernel.org
X-Gm-Message-State: AOJu0YwUPWt5zpxW38k0XIlmauS9FxCFf+wp9FrYWUNga1bbPZd0vpzj
	fg5NcUfn2NW9l4zPOroxtJOeClRbmBfRCs81UxeVL8L7lgh4m4m+KlY0/MTFkNZXcLRqhcMRH/b
	ThMF5+Ufd0kNZ3I50+OC3WYgYvM7FDLjb/XWAI0F9qp0bx8utBMJmeHK9YHxPIiRVsBiugbU5By
	a4
X-Gm-Gg: ATEYQzzxMYaNcAz312Vu102xUIb8XocyBhRkPGTqbVrfg/iRkn2f7s0OYn6Hp+uCzwR
	2R1VoqtvhaK/p7vXwBQsTnC3PGCkngIianttbjF4l9uUjpl/p0YRNg3GVOTec1gYglOq2YCdcIM
	m9etVUJYO0m14RD7QZLlP6uKZt0+p40GiVj6q5WY6qBskj5sZvOwO5YYTIJxV+4cct2UkV+iBl7
	Xk/plyKU8Q/92N5A+mHYlarO5oplnvyXJ4dh5CHoMbDbPBbM/KDumDjx1bq0bZALPYg28T2UVDW
	uPhRgtH7Avh8/B35sqGK8lwkVw+piYW8wY4Zlsy7vonefgkyUfki79WogXJeuDuNSdN0uJxvGo2
	qBsfB4h7Ex1kAtwnq2toIRDbbQN3T67QEduFCyKYf7vx7HL0cwIb5
X-Received: by 2002:a05:622a:8d10:b0:509:451c:ff45 with SMTP id d75a77b69052e-50d4fa36175mr23346511cf.9.1775134491717;
        Thu, 02 Apr 2026 05:54:51 -0700 (PDT)
X-Received: by 2002:a05:622a:8d10:b0:509:451c:ff45 with SMTP id d75a77b69052e-50d4fa36175mr23346091cf.9.1775134491332;
        Thu, 02 Apr 2026 05:54:51 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4ff1:3e57:22ec:dadc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e735532sm235790765e9.0.2026.04.02.05.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 05:54:50 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 14:54:28 +0200
Subject: [PATCH v2 3/4] ACPI: bus: export the acpi_bus_type symbol
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-baytrail-real-swnode-v2-3-6f5054a4cc07@oss.qualcomm.com>
References: <20260402-baytrail-real-swnode-v2-0-6f5054a4cc07@oss.qualcomm.com>
In-Reply-To: <20260402-baytrail-real-swnode-v2-0-6f5054a4cc07@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=718;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=mlZurhMjnNadP6KDAy67g1xVZeEONxV++y8bOiCYR0E=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpzmcR38lBliGpLPueBMGx9l4N7WOldUY1iBLmL
 X6A/uXsiF2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac5nEQAKCRAFnS7L/zaE
 w00jD/4znR5f8K/Iokc6CIJ3HPZwuzAtasXmeQnN75p0PzsPVZ0WR2aF9kObUCbmbf3mICyf+dz
 LhJ3MMW4QgNUxwZUy6xVGziyg4I1h5Pha4y9/AhyXK9QNArzf6t4QlxAsSmISxe5qCBo8p9Ch9O
 jOYbJ5Z+RNE/4aTnWPt+37S24FedD7XPG55pVszr4qvRH6Rw70kZKrRXGxJhUSu4uD5qKav+soO
 JMPN4NdeyhvFGa19GEXkkMld3fVQu9ySuN8RNBT/77MjDRHXJFCv9cw9zXbbl1Smo4+cTFXVi7t
 6ypKXLMPYYx03xB7oCCq1XH3chd/TxUxiWguTx57hrcLV/YgelUlMJy+3U+PJoxrXIBOkl5AKGJ
 6SQv08QIsrsXsgFzbTvRPCxicboVTcEo+2TKkX9CBAavhKI8/tqPjnPGePiRiVRAL6yc13abxgc
 yj2dpGf/IekmsWJ2S8gS2MledhgY0HIMP688XuqQC/ZM7jgF8Q77RbvRh67+gzARXLi0Gpr1PQb
 qYEPG80KGj9wqm1zN9CuY17yd5W4iAf+51VQN74CRZPQNlemBSxf0bwNlcl7aKwqgk1w4IYG+PI
 YcxOWDtz9E0ah7XmGDZquiTV7WK6dpnYEbO4sag1P92CtkkiwFkJ7jU9vnCOryMSygeLt5+Xmgx
 vrnpDJlLHqhIx2Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: i62uHiyGvJJh8qtDRFldWBtW6tePfHi2
X-Proofpoint-GUID: i62uHiyGvJJh8qtDRFldWBtW6tePfHi2
X-Authority-Analysis: v=2.4 cv=RoLI7SmK c=1 sm=1 tr=0 ts=69ce671c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=KKT4v_QfTO29Hm7g8h4A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDExNSBTYWx0ZWRfXyO65vqi0JjTa
 jGU7UYmtMabv+JyzKHLYpWxeY46kLzsfqxC9MGtQT5Xpk/GkIgnlsv1DT8y36fy6QawBaZZA6gK
 dQiOyRslKMk3MNS7BF1Zr6pzdM+nEa88+HkMYbZ9EZcbq+yjeYll9WZnxqtXhy8i6BFz/scuD+R
 9xjBC+2AlQ3BELmUzj1wYKo1onfmeC5CnZIzoXg8k+eDHTaeqzihWmwfj0silElS5SjN3FiTsYy
 mjJmtuwLN67sVVBkymp19M0FAwqHh98epoxHZ54ZG/WkMVRmTF5NWHhBC7p4aSTBS1AJuFjXIgQ
 +GtfNMkUS2vRC7EMhkmvmnO5gjPv8xzLhYHxZEOtPAYaEpax2T7gJni3hMFGvIMD60NiuRZShlJ
 TYs0xyR3fFgovSwJ1vOD11KGfly89V2kBsoL0RXSIcDfPV+C3mw5b2fnxDD3TCVLlSxZkQ0Cm6F
 uUUSrZp0fUvfKcT06Dw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020115

In order to allow loadable modules to access the ACPI bus type struct,
export the relevant symbol.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/acpi/bus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
index 2ec095e2009e40b0645f654fb051429e5679dc7c..d4da76607905473de2e25e50352450c10f598784 100644
--- a/drivers/acpi/bus.c
+++ b/drivers/acpi/bus.c
@@ -1174,6 +1174,7 @@ const struct bus_type acpi_bus_type = {
 	.remove		= acpi_device_remove,
 	.uevent		= acpi_device_uevent,
 };
+EXPORT_SYMBOL_GPL(acpi_bus_type);
 
 int acpi_bus_for_each_dev(int (*fn)(struct device *, void *), void *data)
 {

-- 
2.47.3

