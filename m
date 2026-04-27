Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8382E355F36
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2026 12:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777292366; cv=none; b=gFI1NZPgpqir2HjUm8PJ4jM6o3/GL8fQgDvVmkGcz56I7MR7CeOLNMvCOOqpNLbbVfswPae0NHt3Csn0Y11n7xTle4I5d9d/Ez/u5OJEdSNaHL6YpQzX0rgQn/nO1SeTG7yReqJsIGuy0C+GFpFIYMVY4qF5c6VKzpqPnznQIWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777292366; c=relaxed/simple;
	bh=ZMsB/YAZOj6U/UDCQ/t1oMRZb0Mxh7eNrcKDwBLv/0g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ax2QVJdGNtCEcRkJIaO20edSPL4r8jBvAp14dZS+fpcMdi4EKzLRnzPC0HdseDz3tY9ipuFcTnlnAFqPHqTSG6t5hIXZNQpDwjsBvHHhgncMlRuOfC5lzLs+mrSBz6Eyyg4hytXWdu4vBOmF7keCAYqUfe3fEOTPhNG/+FlEg7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QamWmMv+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aaljeVcE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QamWmMv+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aaljeVcE"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8kHGl3961988
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2026 12:19:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+DctfIa8HhN6P7zaFCRmxq
	5nJCPnS4awyNs7sIS3yRk=; b=QamWmMv+qL/90WsIUrtcgN7N22dhbsioSv8tNW
	KYZqammfecgQvU1P7dabzghUGDFS5HK4RpzwJtmBhuwNqP15OE7i6dqoaDAtdZ/+
	I9k7udIPdbs6as+gCH9moWLiS73Mb5oxocVwJ67YNDHAmjIX7ne3bddyGzTlHmUM
	C9E+wQ7//JVXkKhviVmBIyPjX31uiL+5IJXQ1wzJqEWhGj+0ou1ZkD2DSnkPjs5X
	dgRSTLkUXV8/Aw1ZHsCDEj2NxKzx/TGDhI+QHG5dqvhtKsx/29dpumW8N8HgY/Co
	LH97dSB9Gz5mdMiLFuvFkuep00dr+WxBCWEdK5aR7es4unTA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt4k310sn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2026 12:19:22 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56f60dde1d6so6940665e0c.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2026 05:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777292362; x=1777897162; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+DctfIa8HhN6P7zaFCRmxq5nJCPnS4awyNs7sIS3yRk=;
        b=aaljeVcEpy5Hk9u4+Fq0zHX9GURPWRg0gClq2Pv+YVh9HIQRgD6kK6P42i+gOEupbj
         dpgTQC2NXZTkxcnJqjwuw0ASDB6zBItWTds3NzWzxzd+omFlo5+g7vc9wpXhSzI+bU+w
         GQLmCf2dxr/aspe1wfRZLOMrKgRu1WH69X7wcQkE/K87miRIcmdHLlHevas2ozBqD51L
         q2y6rdixfDvz33ahyZE1AQkdkvABRn+gNSgJPxaEg3P4W+hn4A5kyp/AYs7ZUcHwOBTu
         fXZqWaAN4LSRG/3VQcvRr0p3SHATBhV1xwMVxArKLa+UH/BKd7jTaXqkQSQLVmK9Qd9H
         YOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777292362; x=1777897162;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+DctfIa8HhN6P7zaFCRmxq5nJCPnS4awyNs7sIS3yRk=;
        b=TMpcao7t2r7/OCew+VqBLOzf05dCWMt0/LrmGydTPig4Nh8Bu82yp2NDJnqVR+n6jC
         wn+i7WGYLGeyuaTgMQ+zzuBGAo1GIlSefi0ZuJYyjkjN66wns201eiHL70p07VQHogs1
         UOp1DhfwiQKgjM5hfw2y7Enh3RDGSKfe81vic4vub/kR1KmYo/Rf8KTwvdOBr7BDrkIn
         GKAjHtmBqFhz2NvNYhi+e19IPKuvc7woUX+HAeqK04AoWKSuQAN9TP0zh/lHseGplc1Q
         nBKQK/BPIaSKRtNF9LMZvxUyctDyUMSK5Goue9YTyb+9la8i5v0iePs3EAuJhutqpxfe
         M/Ew==
X-Forwarded-Encrypted: i=1; AFNElJ958cC0UClcLFjcCDwPiWuFUlBI1RLEL7GK7YFj4lH5OmK3Y99c8E2drff+SC/DYTuec5i8POybYsS4k2VtJHiVXWpK@vger.kernel.org
X-Gm-Message-State: AOJu0YxThcPFHexaxHSPDGH0F3coF9j2Md7o9pOEFsKpG9Tqf6eJs0e7
	awzVbak6RsB85h6IgHYwjN4osl7ooBbvFh6S+aAAZkl67QESRo6H8rCvy6TPHF5BXVpzJLymEYF
	dEdo222iPX7oqoNTzqIiyUQU+fct9JzE+JKf6v20xy4MNn1RQyA3LG+mlXDdlkxVIMCk/cVDZYS
	Ns
X-Gm-Gg: AeBDieuqv359B90K6GfwfZL6qloCT9CkT6p/ibIBR1JHzAePcaR5PGFYd+VCZ8GHTYV
	ow4dKbe9Qgfrz5I3qHW81l8tzqQiSC6JbdO46tYVZjgvINJLo3lZvgvnNnrQZxEZ/q70Fugwgrh
	mZUUUST4BCMajvQv+krfH7Q+7cAxqFQUuXU55y9L9wk7S9svuvRDawO7HXjl7qHj+8O1xOi0u6z
	zlaBtCSYymAPP2Gqevhm5jm0JhD6SoEofKWneLMhFwvNpmU5U1ku8UF5Kbh2LrD+grt5Zo89HKv
	CPzbo246oW5dC2mR3m2DnLLnQQvp1Si9+caIOAA2mhiqP1F83uEpbxagFtEvpAZYPqjGTymbOiC
	LcvdUMVtldBsVSvBPuu879sAzdbvjtZvyeZUjcqJMTnDfPs1ugKrsU5JU2jDLyA==
X-Received: by 2002:a05:6122:3413:b0:56f:1c32:bd07 with SMTP id 71dfb90a1353d-56fa57dbb67mr20721984e0c.2.1777292361677;
        Mon, 27 Apr 2026 05:19:21 -0700 (PDT)
X-Received: by 2002:a05:6122:3413:b0:56f:1c32:bd07 with SMTP id 71dfb90a1353d-56fa57dbb67mr20721902e0c.2.1777292361099;
        Mon, 27 Apr 2026 05:19:21 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:83be:e944:7b0e:ef3d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891bb3d121sm882844295e9.14.2026.04.27.05.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 05:19:20 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 0/2] platform/x86: x86-android-tablets: use real
 firmware node references with intel drivers
Date: Mon, 27 Apr 2026 14:19:09 +0200
Message-Id: <20260427-baytrail-real-swnode-v3-0-0003e4c1708c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD1U72kC/4XNwQ6CMAyA4VchOzsyxmDgyfcwHuroZAkw3HBKC
 O/u4OJF46XJ36RfF+LRGfTkmCzEYTDe2CFGfkiIamG4ITVNbMIZL1me1fQK8+TAdNQhdNQ/B9s
 glQ1KyCvJtKxIPB0davPa2fMldmv8ZN28fwnZtv0DhowyKgvNeSkARa1P1vv0/oBO2b5P4yCbG
 /jHEoz/sHi0Sl2wQoBQiskv1rqub1XwV7ELAQAA
X-Change-ID: 20260319-baytrail-real-swnode-7de7a3870f78
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3938;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZMsB/YAZOj6U/UDCQ/t1oMRZb0Mxh7eNrcKDwBLv/0g=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp71Q/QXjVNFuLf0wCXH2ScolGFanhKmw8NaAPJ
 jA86+792dWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCae9UPwAKCRAFnS7L/zaE
 w/HxD/4v9OJjxeyZjvi/dkEGl7H02FDZ2O5AIKBvg1YJTalwHM+yhc466ZkxghVsvemABIyNSxv
 Qjr0CwckraSZHoxVlKe5lUZBJ5yh5pq+24xUbqjAvUuaArrn+ffqFYm4jh15vh536kRQY7rcHzV
 jDb0cvNEPzhQ+dWanbdhp/r+WBAYRvFrtASRq34huixEhNF4aPd/EAk4e/Bs32o4kwh/oIWQRU9
 L07Um7UKYJubz3dCbCZwNN+fRfyCzoQvia3iceCLaAve305TAHMnlm4Agx0uQm1L6E6T3M6qx3F
 cHQuBbfuMSSn4VVqU+EX1/F+K2BBxMkcxA4RnHcvtGckoWsw3v237tRpYaTqbHTtmQH3KF81I8r
 PVvcWXnqn1evdiyjQQZgleLaWqTkYx93aGjRodbaIBzkPiLSK26CgJonLf+qXaUN7ybDXliA8Fe
 ZKB/fLgNs594qkcUUhILAth6/w8hwENFAx3Zpjw2BvOhe0dhpx8BCumixkRVD9eD9SyZ5KUiGAP
 plgYnFOXvQAfBiJXutWastqCUdCq/OVPC9i+4iKBTg5glC+Dt8zVzoqeTh4wvwjJ3CGHUx+Q25g
 xkO84CrKz1yImZKkG5oTlRb8aMcFqDtCrl979N+z/WGpubPwUwWtsg3Knhb6yLhMCFxg2y/kN1S
 pxBy6OGvMUCzaiw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEzMCBTYWx0ZWRfX9uWwlanv3WWE
 54AkEHriuORYji48j86+3vDzHFAmQatP9izsaWvkr7fnpqRatYiAkPoCS9OeMSMBsve/+NrDoiZ
 j2wyXueXUWVytCN5XeKOqNfn0beXDyDWAO85EPZfLVSk66JKB7hkOvCXEosDDHmNQJhSCQlzePz
 tC7bCl5GJlUWLT2+nqVtX/IzONMmPc5pZ92+V35pZid5cG8s+pcRUWncvG76uz7rCS0OJ//RQ+u
 IxHiXrw3P1Js5lmlqLxnN4NRM97nqy83gSVxLbMFvMzf1r8BQEDKGLeQP+reETwaRbe4iTwnDEf
 9Te5K4oZ5su3n2zLMpK6OrKiVXT8LZbA015PTjukFCdTcGmi5XSkVJPhW2QD3UitXRTp0XZsXvj
 3QG5zF/vXUs1DNL9Spe9++BqbdRQKEm7QBEV0VACSNMf8tWOLanWAwzE2DvqtjMMJaXSZ2zj2TH
 G2SDTQ15Lwbfx2fr8SA==
X-Authority-Analysis: v=2.4 cv=a7QAM0SF c=1 sm=1 tr=0 ts=69ef544a cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=0hPRBBDeNYaDZsltgNAA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: cuvfcnveAt1kRUGIdfM9IKbU3GXiQ4w_
X-Proofpoint-ORIG-GUID: cuvfcnveAt1kRUGIdfM9IKbU3GXiQ4w_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270130

First let me repeat the problem statement:

==

GPIO software node lookup should rely exclusively on matching the
addresses of the referenced firmware nodes. I tried to enforce it with
commit e5d527be7e69 ("gpio: swnode: don't use the swnode's name as the
key for GPIO lookup") but it broke existing users who abuse the software
node mechanism by creating "dummy" software nodes named after the device
they want to get GPIOs from but never attaching them to the actual GPIO
devices. They rely on the current behavior of GPIOLIB where it will match
the label of the GPIO controller against the name of the software node
and does not require a true link.

x86-android-tablets driver is one of the abusers in that it creates
dummy software nodes for baytrail and cherryview GPIO controllers but
they don't really reference these devices. Before we can reapply
e5d527be7e69 and support matching by fwnode address exclusively, we need
to convert all the users to using actual fwnode references.

==

Now for the new approach:

Now with the recent patches I sent or plan to send out, it turns out
that almost all existing users of software node lookup can easily have
the software node's representing the GPIO controllers attached to their
target devices as their primary firmware node. The remaining complex
cases are: pcengines-apuv2 and geode-common but in the first case we
have control over the creation of the GPIO device - we can assign it a
firmware node - and in the second case, we deal with an MFD driver so
can export the cell's software node in a header.

The only remaining use-case where we need to reference a GPIO controller
described in ACPI from a software node is the x86-android-tablets
driver. In this case, I think it no longer makes sense to propose a new
generic interface. Instead, I'd like to propose to keep it as a
driver-specific quirk.

This series proposes the following changes:
1. Export the acpi_bus_type symbol. It's already available in the
acpi_bus.h header but it's not available to loadable modules.
2. Implement support for dynamic assignment of secondary firmware nodes
in the x86-android-tablets driver. More details on how it's approached
are in the relevant commit message.

The dependencies in driver core and GPIOLIB are already upstream.

Merging strategy: I'd like to propose queing patches 1-3 independently
through their respective trees: driver core, GPIO and ACPI. The final
patch would make its way upstream after v7.1-rc1. I would probably
extend it to convert the driver to using more devres interfaces too at
this point.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v3:
- Drop dependencies that got upstream for v7.1
- Rebase on top of v7.1-rc1
- Link to v2: https://patch.msgid.link/20260402-baytrail-real-swnode-v2-0-6f5054a4cc07@oss.qualcomm.com

Changes in v2:
- Completely new approach
- Keep the cherryview and baytrail secondary fwnode handling as a
  driver-specific quirk for x86 tablets and don't introduce any new API
- Change the return value when resolving a reference to an unregistered
  software node and defer probe in GPIOLIB in that situation
- Export acpi_bus_type for use in x86-android-tablets
- Link to v1: https://patch.msgid.link/20260319-baytrail-real-swnode-v1-0-75f2264ae49f@oss.qualcomm.com

---
Bartosz Golaszewski (2):
      ACPI: bus: export the acpi_bus_type symbol
      platform/x86: x86-android-tablets: enable fwnode matching of GPIO chips

 drivers/acpi/bus.c                              |   1 +
 drivers/platform/x86/x86-android-tablets/core.c | 127 +++++++++++++++++++++++-
 2 files changed, 125 insertions(+), 3 deletions(-)
---
base-commit: 085f14acda1c46ab815605ecf2341afe5a691eb9
change-id: 20260319-baytrail-real-swnode-7de7a3870f78

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

