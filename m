Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D6C568C
	for <platform-driver-x86@vger.kernel.org>; Sat, 13 Jan 2024 18:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iwanders.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b="ayA3iXRA"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-783182d4a0aso659021885a.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 13 Jan 2024 10:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iwanders.net; s=google; t=1705170793; x=1705775593; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OvziupLQyzD7CXIhblfqO3HA/n00b86Rv0OXwbGfPwc=;
        b=ayA3iXRAae7Qvos2nxnewcRLlz5W5eGvBkPcGRMLXMAR/G6/Dl5g3QZxwe4ImcqVaT
         Dz8xITHPuj2ZFBxDdI1XR/Nqyh9uHZeNasswC1/fep86sQ/iyXEjMios7Ptl4rZ6Ukvq
         t7++7MrdH+AOPQTlBXdm/FLvkU7Cju8wDi10o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705170793; x=1705775593;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OvziupLQyzD7CXIhblfqO3HA/n00b86Rv0OXwbGfPwc=;
        b=QwU8UGzvL9We/vHd7qai/flGnMnUuYH9RZ/w3W3T9u/7CK7qZ7hRcPjY+uejQKDtJc
         egtyi+F1AkDD293SLZQWQiwOQCnjmVUtmFeCprVH+KiuJOP8NzjRTWA6yxToHYv6Kleo
         +H35tTZrOPjjzeuyY15hLMtS1/hX0ZKwEM+FLI5oqwUg1PXRVKQVEieeVZ+Mc66RXpKX
         k6n+s4qkhofcn0xPq43Vp21ab+RFxiBh58NlYCWoLuul/hKlsxi4R5mNmcZAq5KnnMRo
         HfBazDlw4k+H9B/aGXWZal6ZMSZiXH2hfZNhZ27xJPuDkDIZQPbBHcV/vnNAAE/0wV5y
         KO4w==
X-Gm-Message-State: AOJu0YzfQNXKJhGDItR7tN0CluLm4Mux4T6pVVvjLhfk8Ut5/2ityc05
	KXNMBTL5hkRZPGFfQXUkmaJbI3dJJzeWeg==
X-Google-Smtp-Source: AGHT+IFQdnDCXCdcfpK4uPkA6Gta2loKR0Z8fUh4ZmrcJurBWNwp64j+YEmBjiyiXp6ir5rk5q8ejg==
X-Received: by 2002:a05:620a:28d3:b0:783:562e:b0fc with SMTP id l19-20020a05620a28d300b00783562eb0fcmr750374qkp.7.1705170793048;
        Sat, 13 Jan 2024 10:33:13 -0800 (PST)
Received: from eagle.lan (24-246-30-234.cable.teksavvy.com. [24.246.30.234])
        by smtp.gmail.com with ESMTPSA id z4-20020ae9e604000000b0078162695b73sm1855853qkf.104.2024.01.13.10.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jan 2024 10:33:12 -0800 (PST)
From: Ivor Wanders <ivor@iwanders.net>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Ivor Wanders <ivor@iwanders.net>,
	Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 1/2] platform/surface: aggregator_registry: add entry for fan speed
Date: Sat, 13 Jan 2024 13:33:05 -0500
Message-Id: <20240113183306.9566-2-ivor@iwanders.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240113183306.9566-1-ivor@iwanders.net>
References: <20240113183306.9566-1-ivor@iwanders.net>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>

Add an entry for the fan speed function.
Add this new entry to the Surface Pro 9 group.

Signed-off-by: Ivor Wanders <ivor@iwanders.net>
Link: https://github.com/linux-surface/kernel/pull/144
Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com>
---
Changes in v3:
  - No changes in this patch.
Changes in v2:
  - No changes in this patch.
---
 drivers/platform/surface/surface_aggregator_registry.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
index 530db4db7..b0db25886 100644
--- a/drivers/platform/surface/surface_aggregator_registry.c
+++ b/drivers/platform/surface/surface_aggregator_registry.c
@@ -74,6 +74,12 @@ static const struct software_node ssam_node_tmp_pprof = {
 	.parent = &ssam_node_root,
 };
 
+/* Fan speed function. */
+static const struct software_node ssam_node_fan_speed = {
+	.name = "ssam:01:05:01:01:01",
+	.parent = &ssam_node_root,
+};
+
 /* Tablet-mode switch via KIP subsystem. */
 static const struct software_node ssam_node_kip_tablet_switch = {
 	.name = "ssam:01:0e:01:00:01",
@@ -319,6 +325,7 @@ static const struct software_node *ssam_node_group_sp9[] = {
 	&ssam_node_bat_ac,
 	&ssam_node_bat_main,
 	&ssam_node_tmp_pprof,
+	&ssam_node_fan_speed,
 	&ssam_node_pos_tablet_switch,
 	&ssam_node_hid_kip_keyboard,
 	&ssam_node_hid_kip_penstash,
-- 
2.17.1

