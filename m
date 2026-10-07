Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A33644C4F2
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Oct 2026 12:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791377983; cv=none; b=BcWYgDmJYz6jFhsdeUrJ4TukmRn4GvpUrxyir8DpW1ukI8orGJXbQea2hplIJ/4eQg2+snultK0dmtyW5ChOGvsNzpnpvjm7mxszj448/C9Y/vpB7scUmOfML4FxRpn3EMGfT+LHjLKy1g3rAE8eXAH3p+JsDMZoWYjZM/LCOrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791377983; c=relaxed/simple;
	bh=pGfLDpKk3/1ZjeYb4FJ9B8DIgZuH7Vw697Sv9z/d/KA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=npFnua+tXzOWvBPnp1fewJScMAOqOhDNakLJk/QDk6bDRtkMyODJ6JE3/+iJkZLlEVlcBXy0m5ks+8eWPxB7GbwLkOIGZQ8hf9bJGvjnvv3ax/Oe3krvGo5N1xDoh4p2B6BeN9c5dS7h+iZGVw0LA4qs+VdICEev67cozpb/f2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EITmbD50; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EITmbD50"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a16c1608faso21397815e9.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Oct 2026 05:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791377969; x=1791982769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DwND9tREEv6TWlH8EeJ9EjioQzwdF+35qv5THb2SeOg=;
        b=EITmbD50PzpVmy/yxJsCnsB90AnECJ/I2my4LsifdmgltE/Qn0pSUCu+rhiSP+fDF4
         E7nxJqMX1Gr9iO4ZF9kSt79HfyFAj3KjIlTT/iBfUjiGEvyFGyMJXqQtxHPlrm1V1xVm
         sDSySLXPQ6JQQPds9KB/NGzhYyOJcu80YM5Qt4tIkX3KWdeJKmus9El0dam18jQMUbxc
         2v5dcKgktfvZCfQR8m59UW8TXYOW886GjqDZkzsHb+FZS5U6w33UZyVcU8GJk7zFO8/X
         cBl10sT5fpp81vrdE7L9/GuJCMLUXYoSQstJi1W4db1Y/DoDryDeZ2hjT+MRK2rl+Mmd
         J57g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791377969; x=1791982769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DwND9tREEv6TWlH8EeJ9EjioQzwdF+35qv5THb2SeOg=;
        b=Gq8ULM81WB3MPVxcBfEnroNcFNfLPlz4TlVUecIJ4v5NpMrBuHT0dRZy4Yb6vARuwh
         IiqdDSWUJf6rjv8olLNidY6aJqDwooC7jh86w7LZuuJfsT+1MikrjiczYfpI3/C+88qW
         9YnU5tL40FLi9NseDRf1izcRMa5JTyBR0dwCAy15rtE+GFeYTxnw4MP4YEihwL4tlCo1
         2qch1C16DcL4DCHot6utypRVOinaUXMRQye1/x1rlMZOLexusr+fNOKTBYD4cDq78RyS
         hZTqpBI34DMrOVXwtkgoQwVPOzu6r+coWezZPOkbOgITHnDk+FConGpou7/B/6qr4BML
         UaJA==
X-Gm-Message-State: AFuF++noVAlF6EkQlIqPXK7vK3O+wFwyUE66G7BqSzgL/CSc7zf+2g/U
	QBT/te/0a9ly6E7G6h6EF4G8/BRnjiRUpX032Lk8/pgQvCcx89ZDjcjv+fTHfGIM
X-Gm-Gg: AYBFou2cJeQLi15zv6PL199zTyo7y8XUmmyxOQQN44CpYomfq/+u0sBhRE6OtCED9pH
	p3uHImUBbRJO7hKTrz25ZrHa0MJJASiT3DLcveaShn9GzpVDGZ6AlGkuqnp6Alu3iV63E9TKuBq
	RBkjAqu7nLjAuxpIe/44UzvyJ7k9r45ALc06Kjt7HhBVyxH1st78z4iCR1TI3LawPzFBntYsN00
	PfbCnZeiCaJCkOd8tJIltI9oocxuTYCaw7/MtbZTF3E19RJpLuskdn/O3/ZPWZ2OH5ndzOTWmLF
	l/N+M7kjaMLQT4RdrgL0odxy9R/+on7LhnP9dhtlzoLBMRA7idXXCHnMowlpwDkkFR07/wkWMkC
	/a+jhkqGOpSCkjMTUUAdEZRtyn/h93DzCNcH7iX2zK5HOsUQopnmXIopEUQMTJ28hny6LZMenAb
	jnXqXp7VFlLClVfIUfXV1kKVB5uzI8qBUOMCZTMnpCppZfmlOddfFCJ8H8qApip8h0L6F4nzJLb
	B2Xz2PGJYCcutiZgf8eW8tfKAOHKH9mhfuDDbshavw=
X-Received: by 2002:a05:600c:154c:b0:4a1:6282:1cf3 with SMTP id 5b1f17b1804b1-4a18043b284mr38575475e9.9.1791377968690;
        Wed, 07 Oct 2026 05:59:28 -0700 (PDT)
Received: from PF5R4XJL.retailmedia.com (284035233.box.freepro.com. [82.96.134.200])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a17f493761sm105304145e9.2.2026.10.07.05.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 05:59:28 -0700 (PDT)
From: Erwan Velu <erwanaliasr1@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
	Carlos Bilbao <carlos.bilbao@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] platform/x86/amd/hsmp: Expose socket attributes from the platform driver
Date: Wed,  7 Oct 2026 14:59:07 +0200
Message-ID: <20261007125908.321186-4-erwanaliasr1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261007125908.321186-1-erwanaliasr1@gmail.com>
References: <20261007125908.321186-1-erwanaliasr1@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Erwan Velu <e.velu@criteo.com>

The platform driver only exposes metrics_bin, so on systems without the
HSMP ACPI object, attributes such as pwr_current_active_freq_limit are
missing although the driver can send the same HSMP messages as the ACPI
one.

Register the /sys/devices/amd_hsmp/socketN devices from the platform
driver too, so both drivers expose the same attributes at the same
location. The legacy amd_hsmp/socketN/metrics_bin files are kept.

The devices are torn down by a devres action added after
hsmp_pltdrv_release(), so they are gone before the socket array they
reference is released, and they are registered before /dev/hsmp so a
probe failure leaves nothing behind.

Assisted-by: claude-opus-5-5
Signed-off-by: Erwan Velu <e.velu@criteo.com>
---
 Documentation/arch/x86/amd_hsmp.rst  | 16 ++++++++++------
 drivers/platform/x86/amd/hsmp/plat.c | 20 ++++++++++++++++++++
 2 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index aba4a009bd8d..954e938eea3d 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -57,11 +57,16 @@ In-kernel integration:
 HSMP sysfs interface
 ====================
 
-The ACPI driver exposes its per socket sysfs files in a per socket
-directory created at /sys/devices/amd_hsmp/socket%d/.
+Both the ACPI and plat drivers expose the same set of per socket sysfs
+files in a per socket directory created at /sys/devices/amd_hsmp/socket%d/.
 
-For backward compatibility, the files are also available under
-/sys/devices/platform/AMDI0097:0X/.
+For backward compatibility, the files are also available at their
+historical locations:
+
+* ACPI driver: all the files of this section under
+  /sys/devices/platform/AMDI0097:0X/.
+* plat driver: metrics_bin only, under
+  /sys/devices/platform/amd_hsmp/socket%d/.
 
 1. Metrics table binary sysfs
 
@@ -69,8 +74,7 @@ AMD MI300A MCM provides GET_METRICS_TABLE message to retrieve
 most of the system management information from SMU in one go.
 
 The metrics table is made available as hexadecimal sysfs binary file
-under per socket sysfs directory created at
-/sys/devices/platform/amd_hsmp/socket%d/metrics_bin
+/sys/devices/amd_hsmp/socket%d/metrics_bin
 
 Note: lseek() is not supported as entire metrics table is read.
 
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index e9b2b809c0f5..03317f342c69 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -222,9 +222,18 @@ static void hsmp_pltdrv_release(void *data)
 	hsmp_pdev->sock = NULL;
 }
 
+static void hsmp_pltdrv_sock_devs_release(void *data)
+{
+	u16 i;
+
+	for (i = 0; i < hsmp_pdev->num_sockets; i++)
+		hsmp_sock_dev_unregister(&hsmp_pdev->sock[i]);
+}
+
 static int hsmp_pltdrv_probe(struct platform_device *pdev)
 {
 	int ret;
+	u16 i;
 
 	hsmp_pdev->sock = devm_kcalloc(&pdev->dev, hsmp_pdev->num_sockets,
 				       sizeof(*hsmp_pdev->sock),
@@ -253,6 +262,17 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = devm_add_action_or_reset(&pdev->dev, hsmp_pltdrv_sock_devs_release, NULL);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < hsmp_pdev->num_sockets; i++) {
+		ret = hsmp_sock_dev_register(&hsmp_pdev->sock[i]);
+		if (ret)
+			dev_warn(&pdev->dev, "Failed to register HSMP socket%u device: %d\n",
+				 i, ret);
+	}
+
 	ret = hsmp_misc_register(&pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register misc device\n");
-- 
2.53.0

