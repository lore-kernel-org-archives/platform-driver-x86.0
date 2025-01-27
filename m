Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CC81FCFE5;
	Mon, 27 Jan 2025 04:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737950680; cv=none; b=lXIaehFwLb6gfJQ/NUufwcA6gep2EsiMy/kS2wQzB4ec0mwi/LxHI4Cj7Ds8G5K/nYx6U2cIKjOCVpAv78juJh74tyzYwxRtoHNIx3VkPBv8prCU5aTdeRjYga/EgI/onEcm0iVPr1Rh4imyWaTpPt/lkyxBGZGogsZWy0yxNrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737950680; c=relaxed/simple;
	bh=Woq4swbnYq3xsWIj3EtplDj2WuXqxSueFP8J8UTTZS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ENKyBttSlx6vInmlwBdwMpk6c6A8T9RzFj6Ll/whX+oasenM6u++HDR4nTrTZGUfTi0AMFnE8W+/f0HQs9DQ/1d324SPb+TxVkO0U9JCeDW7IsFuXzDRS68WIWA9L9eOiH2kQoLTPS9zthJ4kc6blwMMF27/HL1uJrzOZY8GJy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MhRMoBYH; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MhRMoBYH"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-518957b0533so1233061e0c.1;
        Sun, 26 Jan 2025 20:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737950677; x=1738555477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H0Qac2DNxaP3+ckGylXZbGeHgHst/csov0aaJCMEn8w=;
        b=MhRMoBYH3n4pk812YDM0s536sRIAzfbtj+Z0iW0JhibUyQJ3In2wd6amFgu2ILeTp4
         lFoZeJCuJBuIlinN15I5QxSND6pM+cvTTFrBmWINrMzmpXoAWiohlmVFngQiE5UMNyKr
         gX6PxSECGUfv+xqaUy3k0FPMw//N4K5qSLR6uR7kvPYKOGviJ9FLeGnxUY5ny/7v4q/j
         ftWR+IDkfllTpJAlbIFi4fcwe/9LEoOyIjfsFgqW0z8U1UtR1Ma6aRDATdMq0wKH31wO
         rhgGyVMicoSk3wvy90UwgLpsNLM/DpQDJjcndCQc+kdBSCCqttW4iKXLPHMF0mhUZ0U5
         2E7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737950677; x=1738555477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H0Qac2DNxaP3+ckGylXZbGeHgHst/csov0aaJCMEn8w=;
        b=PREbBiovYHacnYKOHxqDsn4b38TzidegWIK6H/bcxUmA8y/qQzdH+2QxR5bGGK4Zoc
         O9IDUQfIab/fPj2aNaR8XREuOrln/F2cSUhO9KsaKJKZ7spA2EaMizejNDRTsII9Vbd3
         nBzR7OztQU5kViRTCnfY1A4t6QKTx2b1PRKhltwkFgTHGNctGjd3TLjLT4ugzIL/8ldG
         FFUziQ5QT1DsvXXaVpn1AWh5RTiEbtucyo/0YKZCYdvvf6A0mAT2S6RrGik3XQmX4I2H
         nKOekCpG+jq9MeGvj637oG+L1epGx7xxFumiOP3iIvf6DNhSGRy9fslWSfoRXsKKpeE4
         Ai+g==
X-Forwarded-Encrypted: i=1; AJvYcCXSk+pumPR8/B2cQFQ33/E5Qj460RX+2DNuQxKGJGjQVliKjoasRR73iKGUU6pN5vYuzFLLLdiI2s1wa98=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5nEsddVs5/uLtAJimWNJj2HzYip3iioIBb9LqzdgvS2hUDowH
	5s4rI8l5XdqPlaw+PNgSxJzSOEl0JN0HCccwxK+FmpwphFgnQm9uRwAflQ==
X-Gm-Gg: ASbGncue4HD5v5/yOdH2uX8xSEh6Ahxh3/SxRLx1L9iEqO0+oUDq+JFPIKt0oBsjlft
	We7gYh/OYWjeKlC7aKaoAIxLvpd4SLD0v811Uued6QFufw4W+RnLaQXSMuNEVTq5Lbe0zw5/gYB
	PSxXALtPhSqFWWcUw2Yr2wbbs/S/2LhB0mDxNUq6kvLLH8bpS2i07waeJIkfCKKRBfDWFO3T74C
	8umN4qS4kV0hRE7EU8ZX/SmkVDdCxayx8IJhidzXq5h2sGBvJnBLUB8US6Qbs0tuJgOLhz1xK8Z
	oyEKZOKsnUCB
X-Google-Smtp-Source: AGHT+IHJvtko9ToaDuhFty2MxHFucljmX2MVHMLqxH/pmyvQFCj1Ge7vYBuFQ83tuBlvVOIiEUD9oA==
X-Received: by 2002:a05:6102:38c8:b0:4b1:11c6:d3c6 with SMTP id ada2fe7eead31-4b690b84bd7mr30988241137.5.1737950677581;
        Sun, 26 Jan 2025 20:04:37 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:c837:3446:190b:188d])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-864a9c176f0sm1733758241.23.2025.01.26.20.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 20:04:36 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v6 09/14] platform/x86: Rename alienware-wmi.c
Date: Sun, 26 Jan 2025 23:04:01 -0500
Message-ID: <20250127040406.17112-10-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250127040406.17112-1-kuurtb@gmail.com>
References: <20250127040406.17112-1-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename alienware-wmi to support upcoming split.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
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
2.48.1

