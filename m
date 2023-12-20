Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC11F4B15B
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Dec 2023 23:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iwanders.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b="MvZsqubi"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7810ef266d6so9705485a.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 20 Dec 2023 15:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iwanders.net; s=google; t=1703115872; x=1703720672; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nrgGbTq/7alvn7tUkOLEl/Ay2Qdm+WISS5BQ99Qmp7o=;
        b=MvZsqubi4NCS0qILkl8aNPYcC1tnIQK4fJPfNE/x/H8ve/b/KUVMB3HATG1lcGDX3T
         A44hrB2c8jD8bNgPHh7RwDOwNL/OPqnp0Kok4XOp6SFTG1nSrce4zZFqr4p2hHqD+8np
         uIiJBvbssesWXnn71hqKqD3pMx3dwjPTA/IBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703115872; x=1703720672;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nrgGbTq/7alvn7tUkOLEl/Ay2Qdm+WISS5BQ99Qmp7o=;
        b=BxGKNMbdVv/pN0L0A/+kHNbTRnYu2wPLgNH2Gwz0TXtnKhchWVTO0XfNQ7Dw0WIPgE
         0WVNtXkUHL8cTpMfa/sqgAR/GxrUJa+uw8EcmRfDDtwQ2Xw/b78WxqjRpVrpKFEVzkLY
         2wLqySkg1OykQ8O6uO+Lsx1fHPiwdnUhAwt/hGvK0osWH768wdL/RbAOgp/8nFcyafR6
         +8DzUxwGH6BHR+Y9z7KjIFEzEdXo6RCS9TKzuLbo+zdOu3kZfrM+sYyJGhIp2TX/9PpL
         YifKJ9C0cBmrmr9uR0gmwSGYXR4ALeBTgDaQDM5GxTyyvZ6D6anUmQUb2zPgX5JGwX28
         /gxA==
X-Gm-Message-State: AOJu0Yxd9tDzzwLQZHiZ6pqyaPVoMbqBIgKa8hflVeFscNtzWL7ifzRK
	OZUsDBZNCQXZ+odIYaEzrJ560oatxE7EQ9mkkh1kdw==
X-Google-Smtp-Source: AGHT+IE3mnbXYY/nAdLtGNS/SfwuPbXr2bUC/Hd+VfVmKU55oZs61zsWcSf7zbWPYNHya8GFXHEk3A==
X-Received: by 2002:a05:620a:2232:b0:77f:40e3:422b with SMTP id n18-20020a05620a223200b0077f40e3422bmr21247778qkh.131.1703115871929;
        Wed, 20 Dec 2023 15:44:31 -0800 (PST)
Received: from eagle.lan (24-246-30-234.cable.teksavvy.com. [24.246.30.234])
        by smtp.gmail.com with ESMTPSA id qj6-20020a05620a880600b0077f1645282csm276742qkn.22.2023.12.20.15.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 15:44:30 -0800 (PST)
From: Ivor Wanders <ivor@iwanders.net>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Ivor Wanders <ivor@iwanders.net>,
	Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/2] platform/surface: aggregator_registry: add entry for fan speed
Date: Wed, 20 Dec 2023 18:44:15 -0500
Message-Id: <20231220234415.5219-3-ivor@iwanders.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231220234415.5219-1-ivor@iwanders.net>
References: <20231220234415.5219-1-ivor@iwanders.net>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>

Add an entry for the fan speed function.
Add this new entry to the Surface Pro 9 group.

Signed-off-by: Ivor Wanders <ivor@iwanders.net>
Link: https://github.com/linux-surface/kernel/pull/144
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

