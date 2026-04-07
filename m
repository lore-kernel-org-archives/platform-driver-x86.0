Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6E63B7B97
	for <platform-driver-x86@vger.kernel.org>; Tue,  7 Apr 2026 13:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775568500; cv=none; b=SdwgafusQ5Ch373NcESkpzmly6z5gCIvPbwWbYO6f9cPkIs8oo86LgY9Y/RfGs9U+Eyng9iUl9KjZPL0+u5FMLbY60lnzFfdYiqpY2obwxCfQr6tOTNKVNM5TO498G1/qhZa0S0B/qTcKpR2o6glw3an59hkUEJ1Bbs9vlPWJp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775568500; c=relaxed/simple;
	bh=OEfrFqY10EtQxTVjSrDWnxKhZ0dRAZ0uYSNJWN47ZEI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JPA/pNBmH1I3oD1eH5C9/b56eB/qAHGdDJ+Ipp3TDhTDcXGbdsiW6AX2zuIaFbmZv1qKFNQWK+ogCFTAl5vF6jerBjHvlbVeh46g/dWO0EDLPRJ2Boi7As0H3m8HVffiwFurRfNEnQrUHxSFrVW9nZgytSavBTyXrk0Kg43gXA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eNC+pgOD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K2w3wvpm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eNC+pgOD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K2w3wvpm"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637D4l1P2327732
	for <platform-driver-x86@vger.kernel.org>; Tue, 7 Apr 2026 13:28:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w5c8MEzhdr4cVa+dIv0sfjNJqngruD2IfC4W4N4aSpw=; b=eNC+pgODrXDdH9Nx
	6RcG9TXWfqCBBPfRmXbLWe6K50yACYkK83ngffbftT1gbltBVuaqcCK62uNdKOnq
	lnCoy8W81mSLY10LxTEBCoZupcilNsSmOb4yUf1iAMikF4mQpAcpAGjL8Vyoj7ak
	TDz+LOjlXEIrcWi6dYaxQDZN9dC616vistiEWhQBaw0ca+z4Q0kzh0PxSF/g9Nj1
	LgY0hoYH2ancptfm9mBkj6NSTXQ827XG1kGX6gLWDwWqveZV7tln1+L17DGUEw4R
	L62F/NjISBK/H/RMVZQ419XCWK4Zc+PZMX/EOkdtiheogulxgPTPVXlbwNoW9rnW
	YooYuA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcms4tvda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 07 Apr 2026 13:28:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d68dbb77bso26852061cf.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Apr 2026 06:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775568496; x=1776173296; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w5c8MEzhdr4cVa+dIv0sfjNJqngruD2IfC4W4N4aSpw=;
        b=K2w3wvpmeV8hzKi5sTUWoRfJuSTdCiydlRzFkqj/mb+XBF2S1woecmUxK4DKGYx1s8
         R3qz46fHRPxEqXKTOD8yzHWxB2jXRlZZhugdd1wIFKpeO/wnqsCuRxnX0mhz03YDzv3I
         Qk3S2zHK0up2oGWV0UkfLIE0oFIXAefpao00oI93Ob/pIhUdVpAHeNhv2cTZO4RD479g
         Svo7nM9HkV2NlfK5ZBQC+iOsNsj0D5m97MRnByscKZ/7X7dB/brjDNKhVut7X94JpiR8
         rXDUpvNyyiRTSMinm5XrE8+qckPdbQ2WgW3s/g7zTMZREUmVtzUgBELWuQNYunU+hNoE
         Hw/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775568496; x=1776173296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w5c8MEzhdr4cVa+dIv0sfjNJqngruD2IfC4W4N4aSpw=;
        b=d+aroKOTnl5Sp4qgfKJk06ob9oEaArI5MPVb5Vx3cxHGMW6SE7RD1yyMmz0Y1bNINH
         Q16p0z1u3RIMO9Raef171J4pudi9SVOtjY+SJLgEaVZukOSJTkYwXKv+MLZ4wvpoOkCy
         ROyezmOursh+mQUosCsXvfz/rZGe39/TmhibcozWTyObqCUr3zOiNKToMtvB5e0po09n
         kAO+1ZsDT0XzAKS7mPyd6d3cwWYciQqCjZ5/eUhPCkxacdaTVjWnl8yZMyz2GPvpl1B7
         qbHIuJqc35Uxrydxw3LctbiT4lnfcR3sY7QifUlogr2acQj4XinyqjIijXyN4NqneU7d
         PKgg==
X-Forwarded-Encrypted: i=1; AJvYcCV+aBsVBZsQfWmqwlKrq63bpiSXmcPaZO4PmBC85pvVq12PLBGdFVhry/+RrCiYfAqsPgD2kzeU05dmCR8tUrwzgzkM@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo8ij6JDbgpGvA9BTmE0L1OQ1kgg+TbMn5WeEjPOQ0E00xPoKe
	Zab/EZGG2Si+w6gnZpDmGAOOsJuLSYRAwJwcW5gYcPhzFHymYwypqOeezB1bhO4SoHu5MJ4LaQC
	jvdnhioTEOJsa727TSkH/be9104w+tlJvkFwNlHjCcBAwLrFLu9Naj1W+/brF59C2RI3SYH3XSi
	rfNTQA1Aoi
X-Gm-Gg: AeBDieskuTgDnZClbaqxuMeOZRIgymuQzcwZD5PrNE+hayxA4rC3tGW/Upz8gYh7NWM
	83A/NQ/TxMLu7gB2bvzR+k5N0dS5O+R/nwce0OT2AJEw8H/UcRTMQ9yTrXt47cSn+SSj3m0KlPz
	qOakgsjqzzDuBR21dCl1FpSW+pxMfIZ0tg7X/eTiM8vHdxhHlwsZ/wSGhZq76tWySrDijuLfoVP
	HWx8Z2uvUqN2SyjjSj1SxeydVf5zC2sIU60/bat+H+NvhRFZyo01egCzirbCv7kol2npbv1g+ca
	2RoLOZiDHByZmzbMs48kBEchtYMXciIN24C9W+iGVTXazl9MpHgMrbOQhj2I/ubBvO3NGz4aqa7
	x+O4YbGZ+5ieQxZ72WVqx0MvVWQsCWK181zK6qGY59rC1XaIoaKM=
X-Received: by 2002:a05:622a:4c8c:b0:50d:82bc:d2b4 with SMTP id d75a77b69052e-50d82bcd411mr164477341cf.25.1775568496510;
        Tue, 07 Apr 2026 06:28:16 -0700 (PDT)
X-Received: by 2002:a05:622a:4c8c:b0:50d:82bc:d2b4 with SMTP id d75a77b69052e-50d82bcd411mr164476841cf.25.1775568496031;
        Tue, 07 Apr 2026 06:28:16 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:b36f:5370:5f91:2d5])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cccd2dsm4073807e87.67.2026.04.07.06.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 06:28:15 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 15:27:58 +0200
Subject: [PATCH v4 2/2] gpio: swnode: defer probe on references to
 unregistered software nodes
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-swnode-unreg-retcode-v4-2-1b2f0725eb9c@oss.qualcomm.com>
References: <20260407-swnode-unreg-retcode-v4-0-1b2f0725eb9c@oss.qualcomm.com>
In-Reply-To: <20260407-swnode-unreg-retcode-v4-0-1b2f0725eb9c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1448;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=OEfrFqY10EtQxTVjSrDWnxKhZ0dRAZ0uYSNJWN47ZEI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp1QZlY5tTT9u7707SEUVxT4SUMKUdcSw8KweqE
 EqfOSvq9SOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCadUGZQAKCRAFnS7L/zaE
 w86YD/0bskC9HEQp6u4n9iE5eHUdzj88nnBi8+E7bXgshffGQMjUkgQdC9LsraAR7ZsNIUUGMfv
 mvyn6HMSeU33eudv9g5ep7QGJlH7QPQKNgjTfhoJ55Ii/WHa+PVdzVESRDAGN7O7t58rW6SQDCy
 VngmqBnhvIg7oYlJPcbvJBqKJJNSidTDhk+DfHNvZnq2/mCsJGUDkUyglz5Q1WfT/CW3155Fz1U
 YBb0S+u+QMxbWG0Eh3MGovvhyGq3+0DpdQ6/i4N7f9jKcpyVLh1IhJvlyesswqzUH5S2wSpb859
 dcsgdTChI0yPEbV6K/lamQ1iC5MjvUZFciAYeApzYOwOzb8z0OT3RbFZDoWcFkUve/oJRYqpMaz
 nDSV/KCKDiH6Vq3EeO+2X47tjMrodSWhRAa/QTN3/hcl3ib3krTHyKhxIg9XdYq7ZI91ZRrSiio
 ra7IEuNGp9Pjhkc1RZlvf4UrRpoj5zX8uQ/R/OxTPro3H8m66SB1XJKtoCx8vdIfeYUEhvm3Vhj
 iqGRkBiquItARHAjuCPajV2OLCh7QSlf/fwQjwwxR0P3a5K/NX1rkEiDE8gwYX1WHVXbQLUHas9
 xO/ORkmqRvMAefGJztED0ifhQ420kzAkia2kShoCRRAFD9ukWUc3cJTzD4Ut3lrpfAlhES5bHA8
 3tPRAH2wrClAw4A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyNiBTYWx0ZWRfX/h+cTocHT+J+
 5v5Mvdcg6K9qFe6+5fe+r4WAJ9WOAlmLh5GyMzKwnrCAOGLaqGeoHIbz/fDUTkrJBVjf7qL5Z4M
 m08hUOMWVuoeQ54Dtp5fH74qULDwHdPZ3/VIg05w+AoeHzQdllNxbvkFvNXgO2Cyk44GNR4pAb1
 +wIldIW/MUM2q+KBx2bYwDS1o9hMhX/UxIn/vj9A24uJCZnYfhlc/b1Gx0OJPn+yOCbB0Twpu1i
 /USTSk348NkPjVnyra7NupTnInOXezZ0FHh7E9srHf0hJKSuC4+eF7ZwuER2ldRSSrw7rXjShnc
 GQ+bDXO6ZK0BV6mF8o4PDx+40BgUeS0rOMYG9gngRcMJ/PNTcYChrS84Xtck/RKY6p2lK2jnDEK
 YlHV0pd2hUOtrXd4aHLA2/iPK3wKAT6mMfi8x52smRJgF0mUNw1YH5cxNc4XZeZ5eqmsoBCURo4
 A8HB+RPjkZMVQVTZIzg==
X-Proofpoint-ORIG-GUID: q8CQA_W6qJ0AcrFzTZPQ7X-7azoCLlOq
X-Authority-Analysis: v=2.4 cv=WNZPmHsR c=1 sm=1 tr=0 ts=69d50672 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=H5P8rdbTNIBZEmRUth0A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: q8CQA_W6qJ0AcrFzTZPQ7X-7azoCLlOq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070126

fwnode_property_get_reference_args() now returns -ENOTCONN when called
on a software node referencing another software node which has not yet
been registered as a firmware node. It makes sense to defer probe in this
situation as the node will most likely be registered later on and we'll
be able to resolve the reference eventually. Change the behavior of
swnode_find_gpio() to return -EPROBE_DEFER if the software node reference
resolution returns -ENOTCONN.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-swnode.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpio/gpiolib-swnode.c b/drivers/gpio/gpiolib-swnode.c
index 0d7f3f09a0b4bee0cf1bbdaa8b7b8ae4cd5de581..4374067f621ed782a7e1549f7b0b7e44eac04930 100644
--- a/drivers/gpio/gpiolib-swnode.c
+++ b/drivers/gpio/gpiolib-swnode.c
@@ -93,6 +93,14 @@ struct gpio_desc *swnode_find_gpio(struct fwnode_handle *fwnode,
 		ret = swnode_gpio_get_reference(fwnode, propname, idx, &args);
 		if (ret == 0)
 			break;
+		if (ret == -ENOTCONN)
+			/*
+			 * -ENOTCONN for a software node reference lookup means
+			 *  that a remote struct software_node exists but has
+			 *  not yet been registered as a firmware node. Defer
+			 *  until this happens.
+			 */
+			return ERR_PTR(-EPROBE_DEFER);
 	}
 	if (ret) {
 		pr_debug("%s: can't parse '%s' property of node '%pfwP[%d]'\n",

-- 
2.47.3

