Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D9C1C68A3;
	Sun,  5 Jan 2025 15:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736091103; cv=none; b=dtnAu2sQ8mEEp+Y+WoB2UilxtgxyaScHz9f5u2AmeoiwrNLIGphQEwRduBVXpEyViRLR66nng1i3RMKgesDO0DQIsmYjOfRmeZ/0zZtKqjPlXdsLpF/HatgugeOwdCuVUsOslrd65vtreMs18BtOsUcxa0K0QxG330A94V0jQe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736091103; c=relaxed/simple;
	bh=bzPSssBgJt5ZBR3brnXSotTbVAswx/v9sJIVpn56sHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qpdMCpY7mGl/UGYWOp/GarlY9GfAFuD/H7jXQ4zNzAj1eA8TD6HSJmVvZcZ8GHeRpWg5FdRpdK+eCEcMwDICo7anJqts27JYkRHnSCs/zbbFbVAw4i3dipvDQwgHVVIVoWywOlTwn31D69UWxaxRhoPix8QaI3ONFfV6aIxtnzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UqC0gjHD; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UqC0gjHD"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5189105c5f5so7162764e0c.0;
        Sun, 05 Jan 2025 07:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736091098; x=1736695898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lYgATb3bLFskMZWLb+u6o18+64rxGqDmIoLI0qmB+ZE=;
        b=UqC0gjHDAkgIsouCmqdJqYOLhcNEIsZZlwF8HN+4p0LiVsx9/a9P10oRwyuRJluLFS
         oMcPwU9r3OG2WZpcthuKVpjGqmekWf65OcvMxqZJlvJHT0dRtTz1OjtViLdHhRoiAk5N
         cMpSdPbOw9dh57mwWOBB3BFKySVTj1XLnflkoBPrA7ZkHvWnMuD9P620bGL1atJIAZGB
         OCFpr3/8ejqeddRlmUXU4hL8sVVvqKiGAeIAKcEEGDAF9kckuuZQGNLohlpwjQlqmtDA
         ci7X543oK4kjyK3+1a7U9zPm2otqa3+G+ghr0nydvCaFUqHbMNKurwdMh1cJrnJ48rBG
         yMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736091098; x=1736695898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lYgATb3bLFskMZWLb+u6o18+64rxGqDmIoLI0qmB+ZE=;
        b=rnBiBZXaDeFWrw7TziAD7FF+HGP9Qlm93ZWvyXhKwX1QvQ/PFw62Syoeevt658H6kx
         5+Jw10y+ND8ii8XBwuXJnTnrl0a2oNAat82GRXUN27128KnhqdAiNqVypmsze/CvvqY6
         wy0LyGCLoC9HmLSpdcxdg/dXU1cOB7PmlV3ntZadGoIQOIJSu4XPR03OcynA7asFZ7Ra
         Ya0F7Ea8ecGmdwxn/i8n4Ksbjlx5sd8uUfghG3kjWUKaqlvsqVVSXRzfkT/WD3HjWc7G
         IdYQLbwHI56FQ4njK5EspVF3UFXHiojxDIW2qaWVoi0l2YGJQ6BXh219w6POwEdk/AfZ
         LORA==
X-Forwarded-Encrypted: i=1; AJvYcCUrS5Jqq8Dc02Pd+mkgprcbBEvFTb/JBsXpkGraySl2niRSoPPqHtfhyn955ukqcSDY5KCVxVXm1ygrgFU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYRP2dyWI7D0LcDarGm4+Ez9i/Q30AuzlcY0aGGCpgiswaxhBP
	7Sb/PWfxMNBR2Q8tlbtaF5XV87G8odgTKFPqIA4M6mrZtvaFwqSywlO11w==
X-Gm-Gg: ASbGncsDrlLFjJjPiW8CIIzYcQjgL14eTYmyccrDepU2YjCVfqf6BTNHDjycvLYldYm
	C1yXZdKq3a/PgaXwaMF36egwU7Diy56EG5lPtVJ0vl1etqLfsuVH6e1V0jB+9y2Ng5eP+y84HTl
	K2cPBC3/cvI6HBoAWTmiO/taY86fq5Kc139digezJLILKemJehm9H4Aq4jsnJxLO3NMJSAPFcw3
	JNTtbnswGGgUfygO+LmYtVKGWgLHWottSd4xL0nFui7QtOkUpGnI5sXlc99UoH5
X-Google-Smtp-Source: AGHT+IGO2qNPylwZEW3YTcTAGEAZ5mNAIiF8x563Xd2NZoY/Pf2qO5jxpXIxy82UYE64S0MM3t9Sqw==
X-Received: by 2002:a05:6122:4884:b0:518:89d9:dd99 with SMTP id 71dfb90a1353d-51b75c2a515mr44473050e0c.3.1736091098620;
        Sun, 05 Jan 2025 07:31:38 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ad3f34bsm6778975241.28.2025.01.05.07.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 07:31:37 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	w_armin@gmx.de,
	mario.limonciello@amd.com,
	hdegoede@redhat.com,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	Kurt Borja <kuurtb@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>
Subject: [PATCH v3 15/20] platform/x86: Rename alienware-wmi.c
Date: Sun,  5 Jan 2025 10:30:15 -0500
Message-ID: <20250105153019.19206-17-kuurtb@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250105153019.19206-2-kuurtb@gmail.com>
References: <20250105153019.19206-2-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename alienware-wmi to support upcoming split.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/Makefile                               | 1 +
 .../platform/x86/dell/{alienware-wmi.c => alienware-wmi-base.c}  | 0
 2 files changed, 1 insertion(+)
 rename drivers/platform/x86/dell/{alienware-wmi.c => alienware-wmi-base.c} (100%)

diff --git a/drivers/platform/x86/dell/Makefile b/drivers/platform/x86/dell/Makefile
index bb3cbd470a46..f8aec8502c2f 100644
--- a/drivers/platform/x86/dell/Makefile
+++ b/drivers/platform/x86/dell/Makefile
@@ -5,6 +5,7 @@
 #
 
 obj-$(CONFIG_ALIENWARE_WMI)		+= alienware-wmi.o
+alienware-wmi-objs			:= alienware-wmi-base.o
 obj-$(CONFIG_DCDBAS)			+= dcdbas.o
 obj-$(CONFIG_DELL_LAPTOP)		+= dell-laptop.o
 obj-$(CONFIG_DELL_RBTN)			+= dell-rbtn.o
diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi-base.c
similarity index 100%
rename from drivers/platform/x86/dell/alienware-wmi.c
rename to drivers/platform/x86/dell/alienware-wmi-base.c
-- 
2.47.1

