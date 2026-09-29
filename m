Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F22E4F4D19
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2026 09:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790674133; cv=none; b=XD6Hv02UzlK0aPmRd6hAEyg36ZChM5bUD9NZl+ynFoXMKU/dJlrVxwT4gK3pwil4wVSuwNwyPZ9JbW0dGGHTZ1onJV7pm1iMVWIZ9z4rPrEqooHepbd3/QQjIoXG9Z5LwuAMOiTU0TbqlnM1ZeDxSSYqNM2TLCc71yN1hc/K5kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790674133; c=relaxed/simple;
	bh=nwYtLAhnmbrGjBGv6GSjt3m/Fi9B5PcJQQlfDeJWysw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sg6VvBcZP9exV42B50HBNby720k14MowX2UXP3eQo3kIHGEYn3rFif8sxT2VmibWVbqOwl6EKWVpaU5VJXpCbfuoBK/XNYYDvyXp38S52JwWAOr1yBDctyXex/JcteLh41TWpFOIHm4kZwRE4Zl02HGcAS4rHhdqqjRQ/auHbQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ik2qnq2M; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ik2qnq2M"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b8f69a0af6so617385e87.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2026 02:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790674127; x=1791278927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sRLBtxUbLFcLi1O7YY0Vg1lrhetJe87BpP5hyxgIAws=;
        b=ik2qnq2MMje2h2C8E91fWO2kOiQBteMKS91ZPN1UDksacQTjCalAjpB3TY1OzP2yxy
         AXqjUrwuT0WZ3K7QPoSSJMiLgJq73o+m8Ur0Za/ecXS5mDqRvnWldG26WMQ0ODdO9PyL
         OlexUl4H9m4XvXe0QrPOBsgDyEmCIsTH53D/pFFNLOomZEPY9KhHsvBo39/V21qrKWKN
         Wo8ik3XEcMJqXbpqpiYWt5Ik3jEXmqGECT0FmoLFFVFzqrktBknFbTTq8kJ+NIZ+vCMj
         QEOINd+KkJrtpLX4Y5bSVknFelK3pISBvS45XqRec0IhMSzv1bivwX0GKmqw/2xjZyXd
         aJaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790674127; x=1791278927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sRLBtxUbLFcLi1O7YY0Vg1lrhetJe87BpP5hyxgIAws=;
        b=IudpEeI8klXaKvCeVf+XqQ+M5vrRah0fWVEMlMerX1577NlaIVcjWV15SEA8bYvdUI
         fYS08OXVKkRKR16lSfjoke0oWemo+lmvuk2/wYblkHu6eN/P6xdSgBD/axl5CxDVcxwW
         2T75qQLpfXzH9Pak2WUiYLbT1nIDyRUxgr9INthnm1RSiwtifUuSrMv2N+97MmuVC0ey
         NZEF1tBQrB1n3kMdz7Blvyr+lqFjwf3Vk0iBgM3zbTCYQBeQJUlysSrcnk4Jay5yPs6E
         FKiHWqnNtjhLfnvDVyNZQ3KJHs6YWgmUFAsVTVhgir7+nCfnNqH9Q00ViN0pWSvjlxJw
         +Ykw==
X-Forwarded-Encrypted: i=1; AKwUvByNz+uvWwNg7bcpSbGbFoJqjXCuhtbHC+RDnSQnduCj1wn42tZqviELYxMkeHsg8YxDJApaD04001SNjrof2RuXvoQA@vger.kernel.org
X-Gm-Message-State: AFq9FYLNVLU34fN+n+VCJsVYJJwwjAM+xy53uZNqUKNtY/II0heo1Ix5
	FBnOUlzt5jg6JI3n5aigYC9h2ubEJTlRTmQzTaB01rY2ojpMIpFtgylH
X-Gm-Gg: AYBFou1hokNgQyyWGToEffuyzP3VG9GgRCCPnE/pO1HYNcycPLDQ3Rga2tMd6L6kxrV
	UUApU+DB3JkFpHXK6bTcBJ3Ym7CD/hNFYZkk5wMjuhgcQbK2NQe4jocQt/yNjlw2Rjhnb/LGIcJ
	HHfqcClvFpTVJUNaPMCnR/4lHkM9+4vAIVZMDS+7kQBMuEFvapjeLPyUWsBslrN3ebAOmQ2Z1/z
	65l0pYztMvBuA5ycKUDz0TNFjU2GVPr2FHgAZLtR1d/to0OS1jmFkKIj4YtKYrGkC1+CSKrImJC
	dFZAb6YsSFmZMhpYoaYwFA4aTo4tnHy3PCf+K1V+SGqA9wT8bbDT7vq2fFjiePJAwnAj65VOu6E
	AEnJXDYdj0rhgZ2/BNRilMEUI6axl7ZoB8+2DDbKR+8R21rgG9mur7oeyuCKTdCBsK7h1vgj7ci
	Rs8TdGlBi24Uvg1VY8buMzeuHWwlUuHnW49rGPBuNhiw60OanXPNcKqP0F7N5PX1GBffTLWB8RO
	+Yx3d7DSm+u
X-Received: by 2002:a05:6512:2386:b0:5b8:f430:b617 with SMTP id 2adb3069b0e04-5ba2e6b132fmr607252e87.45.1790674127261;
        Tue, 29 Sep 2026 02:28:47 -0700 (PDT)
Received: from quietus.tail91f8a6.ts.net ([169.40.47.10])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b9debb0bb2sm1216403e87.37.2026.09.29.02.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:28:46 -0700 (PDT)
From: Ruslan Koreev <koreev.r@gmail.com>
To: sakari.ailus@linux.intel.com,
	benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com,
	dan.scally@ideasonboard.com
Cc: mchehab@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peter Marshall <pm@petermarshall.ca>,
	Ruslan Koreev <koreev.r@gmail.com>
Subject: [PATCH v2 4/4] media: i2c: vd55g1: Add ACPI support
Date: Tue, 29 Sep 2026 12:27:01 +0300
Message-ID: <20260929092700.1776966-6-koreev.r@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929092700.1776966-1-koreev.r@gmail.com>
References: <20260929092700.1776966-1-koreev.r@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an ACPI match table with the TBE20A1 HID that Lenovo uses for the
VD55G1, with the same match data as the st,vd55g1 compatible.

Signed-off-by: Ruslan Koreev <koreev.r@gmail.com>
---
 drivers/media/i2c/vd55g1.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
index 8043eaa50..e3939bb9b 100644
--- a/drivers/media/i2c/vd55g1.c
+++ b/drivers/media/i2c/vd55g1.c
@@ -2081,6 +2081,12 @@ static const struct of_device_id vd55g1_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, vd55g1_dt_ids);
 
+static const struct acpi_device_id vd55g1_acpi_ids[] = {
+	{ .id = "TBE20A1", .driver_data = (kernel_ulong_t)&vd55g1_versions[0] },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(acpi, vd55g1_acpi_ids);
+
 static const struct dev_pm_ops vd55g1_pm_ops = {
 	SET_RUNTIME_PM_OPS(vd55g1_power_off, vd55g1_power_on, NULL)
 };
@@ -2089,6 +2095,7 @@ static struct i2c_driver vd55g1_i2c_driver = {
 	.driver = {
 		.name  = "vd55g1",
 		.of_match_table = vd55g1_dt_ids,
+		.acpi_match_table = vd55g1_acpi_ids,
 		.pm = &vd55g1_pm_ops,
 	},
 	.probe = vd55g1_probe,
-- 
2.55.0

