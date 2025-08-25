Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10036AD2C
	for <platform-driver-x86@vger.kernel.org>; Mon, 25 Aug 2025 22:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756162465; cv=none; b=T28eKx7A5djcoWuGsiZ6Obk6of49qVTr4cfpLJpKfbM2Ad3TFczCwhj9OKcV9QetnnJoFoHDZJjIdc5a2TF7Y2PRd7FIYWK3gWsCP6QrgMoJgrTWepzT1/srbNvVWF/aOUVfl4O1hkfjoBbr4/PCBXZUP8+XhNuX0q1SvYwC84I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756162465; c=relaxed/simple;
	bh=cyB6ntSQWZieR7i9QmBo4HNmZebc4T68wbksa0NnWiw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MQgk0sshal7aFsZf8fcU2o99ElM2o8ece+5f9eVIXe7AYAGRCBSzmsz8WJvwmyrB0j/jyl5djuLUO5v9pb9vLRU2efZFHi4CYXcly1khp9DjHfrD0pXaVT8sJd1RvEQsPLaENEQgJD4yjJG5/UkYGfE67rg4jql41QdwKn6BMuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LZx6XZzZ; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LZx6XZzZ"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7e870325db1so506963985a.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Aug 2025 15:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756162462; x=1756767262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cGvHT825RWzHtKIFxtRKcHFs+l/Ovrzl5g5WTZd7VAs=;
        b=LZx6XZzZ0+uaBl3l+w4IayaE8E/oJ48r11IaHxsb52E/YaAHgxgRt2P73+s216cgw2
         Cjq5breNhhrsAQmgnfKwIKy3NvztinnRq71NlkpgJygHi1LIxc/4B42zEJxDTWF4cHIm
         qz0D0EK8dw5w7YngIT+49pY8SorKbjtpGeasvYLxgPJdo78hWy5tQ9JMzYD5w2wy/J7a
         PxPfJqdfjC+PmXNVEf5HjMR2h5Tl1G8DnJjCm4Ga7aUcvUHbHp8F6bb8tyZ81+s6HT9p
         kGd1v1g2BIII6Ro31wW1JBA9djCHWCZlxiRd1dL2yDQg5yU1euNecL8/2f/ZS9+IItJH
         9P6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756162462; x=1756767262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cGvHT825RWzHtKIFxtRKcHFs+l/Ovrzl5g5WTZd7VAs=;
        b=hJGDyldlboZvYhOOdyJ2mySGO3c6MMJWTl0VPJyvdFHTx0EX06ECSWytj1aR8taWwS
         TKcnSCiPQxnhObrwZBUTxm6PjQQpzOyrmreLFqK+sfX/hGYzzEyo7a2cAa0r+H4Zkkfl
         vu6w1nQKRbH0LFKj5aqWXJPUhxRfxkZ9BLANEXtW2jy3Hgef/1+g6g2DQmPnpMbU2OWL
         IoIy+Xwi7tHzEAdIy8OyJza7+sYSU4CIMGqco0mARODgj6AXWDOCknkJjVxHc/CyY46t
         1+dMHH3UQEHUwCmJTC/YLDoJltIWPkwVDAuIFydPDR+6S/GAV/Bxhf4XmqedkE4P9E47
         X1RA==
X-Gm-Message-State: AOJu0YzdnZpq1GjcnwGAfL/6ZoMyrfbfTbLkibuBRBrMxQxg8FbfCpFb
	hCD+SSKEuImHzEv+BrubDoLYYScqZgNL7Q3xGjMBFVc7W+nEl/SFLToeadiTPg==
X-Gm-Gg: ASbGncuVv/fjXYDcgQvLFJ84d178ldX5v1NtoeYYUEUtp3xERYYYGMWiuyn6xxuNZ/u
	74qO0Kk9JlmuBFGmTmo5hTziH4ek3s7irqwpLUtWAPK/7GrLUY/NEa/6oD/HnlxbsAYjaAaWmnZ
	1ZwLoBLzB5W+L4hMIGdtxLkOT3CdjOpUZweTeuIh+tO/xHdSkV7eWGuTe6wAUyNzLz+u39slFQh
	ws/NqFRwD7WDa3FAnmXaIsHQer298tBf4ONFd+79/2JMg5d/nX9gq4RDc/lHkqlBX8FnG8srFTl
	jxtZkQyokya3Pm8tt80+BnU7025I4CuTAVZsEoxVHBFwoNNXym+DY5nYQvOkdwFi82NHI5pV7G2
	1EwzMb58NGyMpjriHxves6xnOFlC2EwTgmyfPuAG7KQvJ45mgJe5w+yT+dpYeHjrOaFUXD43Zvq
	z3Jy5kneeXY8fB3/53NIDMjAoan5qca1AE3P1P
X-Google-Smtp-Source: AGHT+IEai5dHwebzPShKwVuZ7OQz4af5ohSGdlv7QAO91aFGWrKpzubKNlRMqMNmEeHKadHFVPxsog==
X-Received: by 2002:a05:620a:371a:b0:7e8:2afc:c0f4 with SMTP id af79cd13be357-7ea10fe36ebmr1455916285a.29.1756162462544;
        Mon, 25 Aug 2025 15:54:22 -0700 (PDT)
Received: from davidm-laptop.home (hlfxns018gw-47-54-39-96.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.54.39.96])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ebed79a712sm570754185a.17.2025.08.25.15.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 15:54:22 -0700 (PDT)
From: David McFarland <corngood@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: David McFarland <corngood@gmail.com>
Subject: [PATCH 1/1] platform/x86/intel: disable wakeup_mode during hibernation
Date: Mon, 25 Aug 2025 19:53:56 -0300
Message-ID: <20250825225404.143288-2-corngood@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250825225404.143288-1-corngood@gmail.com>
References: <20250825225404.143288-1-corngood@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218634
---
 drivers/platform/x86/intel/hid.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/hid.c b/drivers/platform/x86/intel/hid.c
index f25a427cccda..6ed85d48ee93 100644
--- a/drivers/platform/x86/intel/hid.c
+++ b/drivers/platform/x86/intel/hid.c
@@ -406,6 +406,14 @@ static int intel_hid_pl_suspend_handler(struct device *device)
 	return 0;
 }
 
+static int intel_hid_pl_freeze_handler(struct device *device)
+{
+	struct intel_hid_priv *priv = dev_get_drvdata(device);
+
+	priv->wakeup_mode = false;
+	return intel_hid_pl_suspend_handler(device);
+}
+
 static int intel_hid_pl_resume_handler(struct device *device)
 {
 	intel_hid_pm_complete(device);
@@ -420,7 +428,7 @@ static int intel_hid_pl_resume_handler(struct device *device)
 static const struct dev_pm_ops intel_hid_pl_pm_ops = {
 	.prepare = intel_hid_pm_prepare,
 	.complete = intel_hid_pm_complete,
-	.freeze  = intel_hid_pl_suspend_handler,
+	.freeze  = intel_hid_pl_freeze_handler,
 	.thaw  = intel_hid_pl_resume_handler,
 	.restore  = intel_hid_pl_resume_handler,
 	.suspend  = intel_hid_pl_suspend_handler,
-- 
2.50.1

