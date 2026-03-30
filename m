Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF06374160
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2026 15:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774885829; cv=none; b=cl4im7JOmr3VEa9W8Psgl6VYsh5RaMxMh7OOxnefOFQF/682qdkm2BzjysLNSnGmcplB6W1EfFeVDGKKKJoLMA+9hqPgFAZFcFoEFGMIht2XuHHeBcyzThn5ELMx2Tn/z96XWau/X0nSZWEyalv2Sb7qyj4+pll/n8MwUdmbHHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774885829; c=relaxed/simple;
	bh=tqAzc0do0U2xdxUstVUhKV4EBKAFQCnD93ZBaW5WJhw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bMAG6iHSPhetWaG4O9SGFeyMwpwDpX4jJtG8LWL58ceiiANLXnxJkjGHqRsKlgGmAB/NoCsSbJNYMuSUnYkftrnlBrr5hlDL+ugpUg6Nht2kCgsI12jGv8kHdxyTGhum5GKnHKkmuUUzNATK4D6VVwPIKkj61vZgSb+1bOVdHyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nZ352ot/; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nZ352ot/"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56a9a7e762bso5215095e0c.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2026 08:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774885826; x=1775490626; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p5XraBbmErh/P7n3iHU27E+IDr0J/q/UqhCS8ROScAQ=;
        b=nZ352ot/Do27bqpYTDO/tz14zu7Rs2OMkFhmT0cbI3A909zTaJyqmZANTZVV1EbEMt
         L/e+1Srm67ybaohY6p7gV1B8N8xAP6mt26Gr0kNZCHchsySggdE/hSPG1a9mRRLvkGT3
         xM2iuQmh5N3KV/02psDnJ+cdimhEg3v5L2HiUvyXKQwkX8nnHESkPtnbR7H2Z29umE+o
         VdZVs2CbmnxBCORBLRCv922JBDU1BXs4eFwgVNEYDB1gx5l043snsBBRldnQeEnh0o/K
         1ctTFiPcURMUJWRST+5MS+2pEXHVy3KJbr156lzuet2mwEtZEagxXWW5aAwXGSNf7cxK
         RKCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774885826; x=1775490626;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p5XraBbmErh/P7n3iHU27E+IDr0J/q/UqhCS8ROScAQ=;
        b=EXJ87KPja1XDsiD+IKRk8iV3/JGe4TjqeFqBD7dHVfxnXO2IYzpxkzoCzljW1RKmq8
         t8LiRQAko3KwSY7MKZb7wG6Kwf8Mxyalz6jXrKwFn5wMZwBhMNgL/8LJF+CltDIquGr5
         ZB5AcGEFSUWzF61T/ZZ6WNRCrZjILPYoZgGB/Xj9aKv9NGSuN9zMfIwbA38OSmGkhW2j
         j7AvoI/r7DdyHLuAl/n71IVE6ogGUHWJnzNphNU14ErP7QKHGd4u0GDMCgIJbtpxS1SF
         JZiMexj3i9+sTKmdc5GkypZfAazHxPt6bt5cVHDf1QLvfgEbyqJAX+Vcrl8UNovtrb1y
         IJHg==
X-Gm-Message-State: AOJu0YxndpG4FhR0ryBx18qI/OcdhNZz+QZxF0ltYXbFaTaqUH3SPB6h
	NLVS0+IVKyOQkZM/PNXyngbwZWC2dAyBtILgjbbPDpHDX0rf731rjrtzW4UqlQ==
X-Gm-Gg: ATEYQzzbYqdh8rmGkmCa2/FBNsXSDwAemHW4frC1V9ONUujMdGjEzcDqbCFQh8t7i7c
	Fpob9XLboysW2xBsL+0XRRlX0JpfT5BN9Ho1vNpMxbaDVzHSvG73CsnaZBfm4M7LKXzC0n6jkfa
	GYZr52dgthFi2MpxZDijA6R9GF791bE71V20pQPhkoDfy06j7P2M/itr0+kOLeGR59UwNi+DRkR
	Gvci8bo1g+XxEUspWwjk1+aPN4vIPDtW3GyALbQSSRP3GiyJ22Oz7sugqIRWMhzfBCHNhx1ryMj
	CcZGt1y5n/WKakPRWQF0YF6YoYmiXi8Tm4GOQ3cRHh5aq7NoJNnl0lWYiQ3cejzYMfLmWmKTMLr
	s0L2msXyVg/RPThPkG8ABfRcBUzAMvgl08Ufd0nRX9YhYJmZFwBzpRLoHNlP3Etx5U5L+t6TiQ9
	aAE8KG2O4rJdqxbHktGE+QBHSGmN6RLD7T
X-Received: by 2002:a05:6122:1d0b:b0:56c:d862:37dd with SMTP id 71dfb90a1353d-56d4a68af0fmr5551618e0c.14.1774885825802;
        Mon, 30 Mar 2026 08:50:25 -0700 (PDT)
Received: from [192.168.100.6] ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d586adfa9sm8978871e0c.0.2026.03.30.08.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 08:50:25 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Mon, 30 Mar 2026 10:50:03 -0500
Subject: [PATCH] platform/x86: alienware-wmi-base: Transition to new WMI
 API
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-aw-new-api-v1-1-95910bfa1b38@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBtwlCK6SrQQG2s2JgoZiHdPW
 r7F/xUyJ+EM61Ah8SNZ7tBB4wDusuFklKMbtNKzIm3QFgxc0EZBcrR4UkTeTNCDmNjL+8+2vbU
 Pkfy0ClwAAAA=
X-Change-ID: 20260123-aw-new-api-1c18f1011f35
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
 linux-kernel@vger.kernel.org, Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1865; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=tqAzc0do0U2xdxUstVUhKV4EBKAFQCnD93ZBaW5WJhw=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDJmnZm/9N2WRd+azbT9Wd+Uyclb7OWwozm9K33y7ZteMt
 bP2xacf7ChlYRDjYpAVU2RpT1j07VFU3lu/A6H3YeawMoEMYeDiFICJrIxk+MP1PNI9pcM4fsnM
 gxumfrZ5+52jL7/15AX5PfGbs1V/bfrF8E99XsbiJs2LjxOVNXfHsx6/GF9ScVfjwazfE99c0sz
 RSOYCAA==
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Transition to the new wmi_buffer based WMI API.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi-base.c | 29 ++++++++++++++------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi-base.c b/drivers/platform/x86/dell/alienware-wmi-base.c
index 64562b92314f..ef2b4893b7b5 100644
--- a/drivers/platform/x86/dell/alienware-wmi-base.c
+++ b/drivers/platform/x86/dell/alienware-wmi-base.c
@@ -9,7 +9,6 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/acpi.h>
-#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/dmi.h>
@@ -150,23 +149,27 @@ u8 alienware_interface;
 int alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
 			  void *in_args, size_t in_size, u32 *out_data)
 {
-	struct acpi_buffer out = {ACPI_ALLOCATE_BUFFER, NULL};
-	struct acpi_buffer in = {in_size, in_args};
-	acpi_status ret;
+	struct wmi_buffer out, in = {
+		.data = in_args,
+		.length = in_size,
+	};
+	int ret;
 
-	ret = wmidev_evaluate_method(wdev, 0, method_id, &in, out_data ? &out : NULL);
-	if (ACPI_FAILURE(ret))
-		return -EIO;
+	ret = wmidev_invoke_method(wdev, 0, method_id, &in, out_data ? &out : NULL);
+	if (ret)
+		return ret;
 
-	union acpi_object *obj __free(kfree) = out.pointer;
+	if (!out_data)
+		return 0;
 
-	if (out_data) {
-		if (obj && obj->type == ACPI_TYPE_INTEGER)
-			*out_data = (u32)obj->integer.value;
-		else
-			return -ENOMSG;
+	if (out.length < sizeof(*out_data)) {
+		kfree(out.data);
+		return -ENOMSG;
 	}
 
+	*out_data = *(u32 *)out.data;
+	kfree(out.data);
+
 	return 0;
 }
 

---
base-commit: fab7c51693e95aa874d6d9db22bfae7bd0b23c66
change-id: 20260123-aw-new-api-1c18f1011f35

-- 
Thanks, 
 ~ Kurt

