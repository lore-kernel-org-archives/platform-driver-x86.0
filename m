Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666CE2D97A5
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Feb 2026 08:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770971166; cv=none; b=uQoXrULVUMfMmMjfehzZRCBdOgzqoYugeTRNox81U1dYPUGk6+zsxjEOI8kDhsxk2l+UYAyxS3MOqo3P2PcyHdYh7qt0ZGSObqcEGxT5+pb/blS7+OI64/zLKu0C/CT2lmByTb9Zv0NAXYRlOOfNP/CF40rawteA88qszRu39JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770971166; c=relaxed/simple;
	bh=X2KFxDDLT4tUMXyiAQnfFl7oMpITlCcd8o6K86Gecng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dcr0CYYpfY5pugT/jgku+Gwxug0OMJI4byLdO59jEH/0G2HaNeXcglZNLRZsRTobP/ZoaDLHuEbF51qblTAdnwowCWfOTLfdL0jay9c9c6e4WrdkP8Ma290HexwJqipMw4cfoMktmSwRuhCeR3SAIMC1xwTLZJQEomnt3uBOKx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XK1hoibH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yqdci1e8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XK1hoibH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yqdci1e8"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61D2jXkc2093498
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Feb 2026 08:26:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8mzj/BvqnnG7xrUDC4Rq9s+yW9whephqWvMv7jrUvxk=; b=XK1hoibHG6cpmW3+
	UnYscOfdlswgaifYMj+aK7P6cRZdRou7e3CKguPw58rXGzAFGWcaL6AY6DZiblTU
	po9H0+2Puv1UcI0y2rFs8+ujYDpSTOMwe2mpWdVSEXGrT7MYPGe1Dam9yGwUbdH5
	c68U9o2w/AD5Q/zaSTtPSLwzwf04lJUOjixtS6YbjJBYF+v4alFj/mVgpLv24Uls
	UWJz3s61hzIV94lLpoWJ+mAXmAjyGa0EVdLdPnTrvI47u7PLOjKwavubRQVqO2ak
	mrkS1+kA/PiIY3TW0ugZC5izbz0HjONkwOGCABgGuw7f0PKYW9CxzpPJTW5INryv
	0H+IFw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9k6y2tgf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Feb 2026 08:26:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c71500f274so74985985a.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Feb 2026 00:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770971164; x=1771575964; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8mzj/BvqnnG7xrUDC4Rq9s+yW9whephqWvMv7jrUvxk=;
        b=Yqdci1e8ma4w9nALydFu//WWUqXD1PoKAJwIO1DmT4NBybORMuFvwDLAlfStIfQiYP
         wbgdSRnngcJCOE4HlaTzdZqGYNbp2gApWFjz5cOVtrwFABFjDR8E2a4ZAOsitbulO9YA
         1tzYuWV7Y7aY/k0oNO1u7urEbNPMS7Jp1WKNJqPt5tSqXAnI9clmTOLUsDcav7zTdG/l
         cxHlCmnif5xlS1OBBqDT2J62VmKoFiBAQfQTsVKDgH0raaRCB7sUeFScyasnVBEN9Mvt
         55UgaZ/GxCIaizOsqHBl1OK/3qu9tqC7emeOsUK37ru371sxnrSMeEaQX5NfTD7FAvT1
         KNjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770971164; x=1771575964;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8mzj/BvqnnG7xrUDC4Rq9s+yW9whephqWvMv7jrUvxk=;
        b=FUkP0DO24Gu6tmXHEQ+xcaY1Xr4p2nDi9FmJyZz9IbDdcok84fmYuC06tv9T0cxULF
         3bY8QmDHClLZeELJfWKP84E4W/jML3qfCAFomvZ3RYip9D0ut4uJO2HyEWOBYeyxe0VE
         fuHqocXemyX5OAzaNpZXnjhZp/4UJUvj99+Sh8X5OA9+bqpVuLHTs19Iw6DXMayaYvnX
         uD9Hz7npFXVSDSNOhDmBNbz64TuO21KKzmyci+Ig3AslieL6a+NEsHbChm1lcLp+ujHj
         Eozb7ihcQyjOwTO30zgZ45goNpOV7+ypwXa9BsTdnyF0tWD00sMFA1+OVAF604eooos+
         aiBQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0yuAlr+/+DJd5kjpciozIDlougnmrD2Ca3U/oK3UWVJPxq8xPGPJOpkm25mQ6GcUe/nhGd1vj6GVzl7XZVCHCO2Sc@vger.kernel.org
X-Gm-Message-State: AOJu0YzsEl7XUaAUjAiwSPE9tEZKNvy0ZRSQqRWT9PRzofhdtzTkNBnw
	keVoplIlW6cL4RtCRLXAYekmyhz+HBfnEAN78XoLTx13kYKSlNK7wct+FMz1Uuw5SyFi7k+eDyO
	DGCNbAulp2ZcQmZ6LSjqxYbv8oBSjQV/yYzBRddy04DUjRqOZDUUKDpTEQuEi332+zcSfo8V5oX
	ap
X-Gm-Gg: AZuq6aLvmM3kcmw5/MBQtDh2LITjkEPvMoYu1iTpMnGAOxWfiyBFd84URSoVbqkc9n6
	YzdaYuuCX2JVJjRn6/SW1tTd09Ogz96eX86F62CysvG6bGFyROmcmWAB/8IgcC1nw1Nyv4PmSxR
	IHL3U9K6ufS2biJNvTjizmNhG4cZUqDFqldtfco5v98DZoWv3fNLRcQzKNhhSlqJPQf1aJZtpxz
	/gqQsZb3cCeQ7BTKjgTR8EGEwxdBGmPi1PXQLuH5D3+SbS1h92+jaCPL/vehy+PwKtt12jbqpbp
	zN3dtMiSwQErE1xAQKCqZ1cmddknWgpR4YY++g2SJd5AFHlD1i5TeGZp+qmmlAz2AJjGRN7FwDg
	W+orgCWTmY/eRoCk8a0yxgSvnkbpXs18OWd2yf4/3Wqn7Na+mgt+r
X-Received: by 2002:a05:620a:1aa0:b0:88f:e620:21cd with SMTP id af79cd13be357-8cb424afaccmr114530785a.62.1770971163768;
        Fri, 13 Feb 2026 00:26:03 -0800 (PST)
X-Received: by 2002:a05:620a:1aa0:b0:88f:e620:21cd with SMTP id af79cd13be357-8cb424afaccmr114528985a.62.1770971163283;
        Fri, 13 Feb 2026 00:26:03 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6de6:6c0f:d493:4a7a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48370a78c89sm43075025e9.5.2026.02.13.00.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 00:26:02 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 13 Feb 2026 09:25:24 +0100
Subject: [PATCH 1/2] mfd: lpc_ich: expose the GPIO controller cell's
 software node
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-meraki-swnodes-v1-1-8e032693456c@oss.qualcomm.com>
References: <20260213-meraki-swnodes-v1-0-8e032693456c@oss.qualcomm.com>
In-Reply-To: <20260213-meraki-swnodes-v1-0-8e032693456c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2087;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=X2KFxDDLT4tUMXyiAQnfFl7oMpITlCcd8o6K86Gecng=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpjuAVGcYjNFKeEt7GSH2Y78QD73sImjacrfFky
 6j2fUYA0iGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaY7gFQAKCRAFnS7L/zaE
 w9SwD/0WVVdku3ukkznVyaO60kCSZE1wEhRef14WJybpkEfnih5cdk93f8GlzzIFJvXFoihlEgi
 4tYSA3efVfWhcAL3S/fCBybVxr4J0yxyKO3Ev0dLAWevkYL0podlLxKs4buQ5s5j02ubbdPBuFR
 38m1vy4ddcClJqYQjB+tYE/GXrMYhQWeGjOulpcOWN7VUgEAnAmAu7C91sb85LNu7kGVJ7ncnla
 1qXKInXTnnUFrXYnf+LTUZXq4SU0kh8/KlWHQFySN+2sSrxv+locQeHZ203/gnoaw3etkoxoiCV
 1Y23KA4dx8+h8siv7GU7pZHC1GdVIas+jwbnWqeshKIdNictkR0u3usuDTScLnVn/Vh4zjHviSJ
 zpRUgC5xSdyPNMPT1NF7k1W7PP8OdxpqGvvVBHb/5ucAcvYlJUcJ4euy4tQi+UIVAovEI+KPCkr
 7qhX7RaowFFGmjqFXq6ykmhyaN+ji+Q4TZvHes4JMTUpu01/bKoM+a5sWgbUpawJ6ukxdzsOO1g
 FVECl7+1tr81E4KS6PPtlw0VIis2zevHaOfX57ORSb4IGXePR6oAMBV+Vu3ze8XgOtJ9RnqdOfl
 Lx28y6X6yBTGdHS16wSoB5DjkCUOz6PniNtonAuQoM2xIII4nQezQ5kdN9ik5aEgXLaPegrBcHU
 abYl/6EVgPjDrBA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=NsTcssdJ c=1 sm=1 tr=0 ts=698ee01c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=gkop4zNMY9-1AnXrjugA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA2NCBTYWx0ZWRfX6nmH+WWUIkvI
 zCSBhF3qrqekC5xnMRh+0FX3MzB7hHPvHMlGxseoli+GwZjTr4ntCgMXXnkplwV9abJIc/YRiI+
 O4NivvVWVxVJ++JU/TaQ8axfpYj4R7Dt4B3Jgy/zlnU0euKqGigg7xdCI2aG8a6hSaB5Bj9oqXw
 a5KcdOqfUDFyWQcX7hn6V7w4rAo21QTgSwINz2FmV/qgE/fSSxntGr4wA7/2UdBu8xyhPjYi51B
 QT27//NMtTjwPJkV6cPWT1jZSCfTgvn0c+XHbDjJj0j7D63/4zNvqdSSIX/2osf6av5UbIVfR0v
 QTghWfiv7Zl9XstwttIwMBNFnG/EPBG7dkJKmyj1dzIuwJUtnW3o/wmtH6kmtFziQzf33kykoqv
 zuog8vdVMlI9+5Ff1S8K+QK0io9LZcf/UErOJE5LzWT+3PsB+dZbDJ45sNM2t0jKGUF95x4Rgsq
 w4vl+HbCrGtkkCJ1OqQ==
X-Proofpoint-GUID: VnX97FOBC1w1D2s7APsZuK1f8nYb0aR4
X-Proofpoint-ORIG-GUID: VnX97FOBC1w1D2s7APsZuK1f8nYb0aR4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_01,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130064

One of the users of this driver - meraki-mx100 - abuses the software
node API by setting up a dummy software node without any logical link to
this GPIO controller and uses the fact that the GPIO core matches the
controller's label against the swnode's name to make the lookup work.

We want to remove this behavior from GPIOLIB in favor of actual matching
of firmware nodes but that would break this user. To facilitate that:
create a software node for the GPIO controller cell and expose its
address in the provided MFD header.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/mfd/lpc_ich.c       | 7 +++++++
 include/linux/mfd/lpc_ich.h | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/drivers/mfd/lpc_ich.c b/drivers/mfd/lpc_ich.c
index 4b7d0cb9340f1ac51bf3845427ba1dee8cad5667..ffef785e86d34c4302f7f88a472e969c47616c9a 100644
--- a/drivers/mfd/lpc_ich.c
+++ b/drivers/mfd/lpc_ich.c
@@ -45,6 +45,7 @@
 #include <linux/acpi.h>
 #include <linux/pci.h>
 #include <linux/pinctrl/pinctrl.h>
+#include <linux/property.h>
 #include <linux/mfd/core.h>
 #include <linux/mfd/lpc_ich.h>
 #include <linux/platform_data/itco_wdt.h>
@@ -125,11 +126,17 @@ static struct mfd_cell lpc_ich_wdt_cell = {
 	.ignore_resource_conflicts = true,
 };
 
+const struct software_node lpc_ich_gpio_swnode = {
+	.name = "gpio_ich",
+};
+EXPORT_SYMBOL(lpc_ich_gpio_swnode);
+
 static struct mfd_cell lpc_ich_gpio_cell = {
 	.name = "gpio_ich",
 	.num_resources = ARRAY_SIZE(gpio_ich_res),
 	.resources = gpio_ich_res,
 	.ignore_resource_conflicts = true,
+	.swnode = &lpc_ich_gpio_swnode,
 };
 
 #define INTEL_GPIO_RESOURCE_SIZE	0x1000
diff --git a/include/linux/mfd/lpc_ich.h b/include/linux/mfd/lpc_ich.h
index 1fbda1f8967db41ba3bacd331e5d18dfa8ebca3c..1819aa743c5c9aa1ac51710bbdbbefab50670ebe 100644
--- a/include/linux/mfd/lpc_ich.h
+++ b/include/linux/mfd/lpc_ich.h
@@ -37,4 +37,6 @@ struct lpc_ich_info {
 	u8 use_gpio;
 };
 
+extern const struct software_node lpc_ich_gpio_swnode;
+
 #endif

-- 
2.47.3

