Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C371990B7;
	Sun, 29 Dec 2024 19:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735501609; cv=none; b=NsGpfwGdY6ovRzDvEF2WbrWc2hWhc2gIWevZTgacjiaiVAQawEvM4LJ6MMbhzhjsugZrCB05/Rq8SH+lhXwhgxs/p/+jwbb9yP6OKqXYvdCv7Yb46xtHyYZS8rYknG0J7IgTJQlRg1ppFmVat4ZfOsBiCj2VdzcEL8KtabaBrS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735501609; c=relaxed/simple;
	bh=tu5SELY25ilrK87/vIE1U2/MUN8uaXfuFiyt/j5TqxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bzbiti4fgZ8c+Kp0TTETeRkKJzuJi/4R/hmVHfd2GfEuahzcZv+eNckhq4fBIFuQEEadDGhTlkeulALBea4Qzs+/e3oSfyWpfAaCosApaTjZSSjg1eI5TQUXsT9VwswCYlQHr08haiTm49i8CRd10CxvEBfPHwnCTzajNf8D66w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JbMTVV2C; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JbMTVV2C"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5187f6f7bcaso2639187e0c.3;
        Sun, 29 Dec 2024 11:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735501606; x=1736106406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cJ8zNRmU/YdsMVlsWhh5/v5/soMK+hhezIf16qD3GZ0=;
        b=JbMTVV2Ce1byYP+93cAlN8O/B6c+uCq3TgbZd+8Ta7RschMVP3j91RjXTGpaBe4eEB
         AaWy1B6g5IbdIClouDIlcLSjwLmejdD93NY4cPulTxRqtISqWxgPO5sIlrOr3CJzsJpZ
         0cRXaSfJ67CEojBVKzS9yM9OJtXkW7aH7/2f8ui/elG38zQgiPEa+MS90SIljl9x6wHE
         kWHNo8llfh9oIdGPMKxtfiJ4wTSpqwpOcMF0ykNa7ipfly3T97ht3shEYyORsmIVzAr0
         L3MGrXhL6QjRpM34RmapqNVHNKtdL9vS5wyfO1iGse2wMHTjjJKNMvpJE6yMBoZyR56U
         2RuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735501606; x=1736106406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cJ8zNRmU/YdsMVlsWhh5/v5/soMK+hhezIf16qD3GZ0=;
        b=fWcqxNSQgHGAQajFDkl2YIP5kyywO79kkoCIt/xE0+bi+faBBiVae7tSx5sSyLAWBf
         siCj21GwkYC8U5tK5/I0DsFidLMjhGDwz/PpUAgS6uLl7UftKRvREje8OVN5DFTOZLyN
         p33klwZf4icjQQtT1tCL275d+6KBuudHFj3dDMALXOGzJ5AabitArJk5KU4F+HsSIH/j
         SkVfM0nMF2Kytj6W0sxP0aBgnpsI+9qKFNF+eztc2wPmnPtaSPFyCxzB6dsFMWLBLT2y
         EzKjcDlkzzShghDyMLvTvpmExU60rMdQ/p207R3zX6msfLORgFwOuczT9/NSnOcucOJO
         TQzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxQ7PkbLeZLAy3ldKc2HFO90EtRfiS9TruWTLxBbupyX0g0FzBKCtUEpvHAzKfEjRzITqkKA6srJ9U5zI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFvZg+RrJUZvDdVkyo46TZFb5MEzO0aQL0OhFyWyf4wR7anR5m
	9igwBN4WQIA5o7BeMtuLkO2oSX/VAR6urHQlAUivllLoh6swxm6Uh932sg==
X-Gm-Gg: ASbGncuTySv89CxZu97gYN3/2plZZPA9F0cLzCZK+nRQBkb/X6NkBObGEmsUvuM003N
	2JWcMFqg63CE56HFIcdQtCPiYpOVis5rtUfuaAJnhuhxaHd/jGw/Tuk2LPEMovea2pVl8xOODJV
	Y9Vkzii+HAvJeq1fHr9P8gq6qC15S5/zCJ35gKgSp4+aSx5vUJM6OOKZqOdOmzV+8TqhEiYNgeH
	2VcaMVAqL6QW5W7Br4eteMjVIRM4XGQaKIYnQWVLcQzQW7Lnzv0OzzTCohy//ZH
X-Google-Smtp-Source: AGHT+IHHRSP4gHYNha4icYITBOG6IKi/q8fMbFD7d8LSXV3BgjHm34CdL0WwQ7OowKhUTpZx7zGIvQ==
X-Received: by 2002:a05:6102:50a7:b0:4b0:4d6:bff1 with SMTP id ada2fe7eead31-4b2cc387a3cmr24880441137.14.1735501606002;
        Sun, 29 Dec 2024 11:46:46 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bf98ce0fsm3753555137.3.2024.12.29.11.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 11:46:45 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: Dell.Client.Kernel@dell.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	mario.limonciello@amd.com,
	w_armin@gmx.de,
	Kurt Borja <kuurtb@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>
Subject: [PATCH v2 01/20] alienware-wmi: Remove unnecessary check at module exit
Date: Sun, 29 Dec 2024 14:44:48 -0500
Message-ID: <20241229194506.8268-3-kuurtb@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241229194506.8268-2-kuurtb@gmail.com>
References: <20241229194506.8268-2-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Module initialization fails if platform device fails to register so it's
always not NULL at exit.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index e95d22c7b60c..ed66720260ab 100644
--- a/drivers/platform/x86/dell/alienware-wmi.c
+++ b/drivers/platform/x86/dell/alienware-wmi.c
@@ -1257,13 +1257,11 @@ module_init(alienware_wmi_init);
 
 static void __exit alienware_wmi_exit(void)
 {
-	if (platform_device) {
-		alienware_zone_exit(platform_device);
-		remove_hdmi(platform_device);
-		remove_thermal_profile();
-		platform_device_unregister(platform_device);
-		platform_driver_unregister(&platform_driver);
-	}
+	alienware_zone_exit(platform_device);
+	remove_hdmi(platform_device);
+	remove_thermal_profile();
+	platform_device_unregister(platform_device);
+	platform_driver_unregister(&platform_driver);
 }
 
 module_exit(alienware_wmi_exit);
-- 
2.47.1

