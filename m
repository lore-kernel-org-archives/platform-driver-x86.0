Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527C4199EAF;
	Sun, 29 Dec 2024 19:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735501653; cv=none; b=nMglZxqdYqx1nklYuKSUUimfZ7D8Ewdxk7KQXwUn5DaE7wrlJ/F6jN0RnHgR8VPeSuBBXGdlfMrYoc+ihRVMb061aIr8wW6zplShbaQwl2B68TZE5jB+quXll1mno2VFBpm5QVoXKm7Pir+/RX+4rKE/VgrqbsfLrCPZ2BzyBPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735501653; c=relaxed/simple;
	bh=bzPSssBgJt5ZBR3brnXSotTbVAswx/v9sJIVpn56sHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GTd+Dj7M8znnFxMl+Nk8q4voB7yULOIzBNIbfU4e/3TobKlBYRS4RODC7hqooRheZttEtvFknB+nc3ubi6xVPjO29sJXptJiJMxrPwA18Mih0W0QY97441g4RAo1DPY5tgAnlDy5GYjT8c8XUN+vdpX9+0jib+vnvEwbzBExiMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K1huCcBZ; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K1huCcBZ"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-51878d9511bso2463256e0c.0;
        Sun, 29 Dec 2024 11:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735501651; x=1736106451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lYgATb3bLFskMZWLb+u6o18+64rxGqDmIoLI0qmB+ZE=;
        b=K1huCcBZKVILaK0uIg4VvrUtJ+LdNXWz72krlCJ78Cn9MjQlOogLDollz/maWvepZ3
         avVLQlVy8S8X8Z7EqLDzXDSteW/4w5MYXaGR71e/bBAjjcjFYhuqc4kmTNbXL5jaOWg4
         yDtIGh+gSniuleOQvP1xHJg72+j+fKGCc2nTNIIYylj/ZrbauLM7HzYYJ45T28S0+Pi7
         uxlZX2W/GNODDzcnIrUFDrQ6JE7D9LjlTjk2WpyVBTX9JpX5wV8Kcz3D2TdyZ+GAQ33a
         3PlvV8nXJR1LrBOgeBnPcOgyq7ihwDjRqSb9GZ2EA2h/sq/FOJoO8YlfiacST3+IJmj3
         dksw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735501651; x=1736106451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lYgATb3bLFskMZWLb+u6o18+64rxGqDmIoLI0qmB+ZE=;
        b=XwfPOJ10MahKrgfIDLlRkdBIJ57R4Dsc33GiTthHM26vLcVH6/QjOCx+kVHXC5PYsS
         qPI5aEdtP6auauwt3lmueFngve65L5TgXogZIULkSzXv4Qh/RsEft7uSpWozn7+ll7Ut
         dnhxG+qApJ9VK7JPOhBCMU7yeYejCLwv7MuccIjkoQpJInTJEBqikiTqcsjrGifZ6E3z
         Ce1+RzUzMcYN5kNEfaJisSFRZ9CZn5p9OQdZPISwTZ3AfYYnXtGAsB/7F/Onah16vTrh
         PK6SwDWnrdan23DlmuXdcZBkubp9m8JuI1rrn1YG0lmOGXeIw+WYfSUUK5i8a07eGuUz
         5DVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCyU9Z9W6MyoobWbmJLQfM80JfqNlkZVVZAp6abpWNFGAR+BsZNYDf5LXx7hCBRVH0QlZrQtoCSXPHf7I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwN2rB3kCV0cM4OgL4nDoHr3nWUEztLYOmF8BUbrMjEwRKK82Ke
	sA2Hg/PitW7uc5GwZC4zPLTIb7wEGXpEWCskwPOtdeRa/eKco2BERVyWaw==
X-Gm-Gg: ASbGncsIVf/zrHuchYXXx3RY0I2Mc5+WS5BO7dMzdvl9YGihirrJ5wPRVRTovecuG1L
	5YmGR8oMh9xsgLP3hbE51Ha/VsDKSH6fHGg+wtc2WduZPD8nSWTfatzH7JnWo9cWAAUJC0LiG2M
	CO40EcWsqT/WlVtF43lH3ptqubWLR3g8qS2nDMDmwg12FZHdU4DlQPPLq4Xfflwy0NJdXD9leM8
	z6I3+37xhjv6fg5ZWM/UgUv5OcsKzR5JaeKvO1UjuOYyfe0fLWnFPdCv3mKockh
X-Google-Smtp-Source: AGHT+IH4aPz4dAyE+ZbMlJR/EkzF/sTCXDojky89QfjxVg3NOFOhiWUej/H6MZ1xbJnmVx0cb2HMeg==
X-Received: by 2002:a05:6102:9d7:b0:4af:4ae0:2320 with SMTP id ada2fe7eead31-4b2cc49d92amr30886900137.26.1735501650867;
        Sun, 29 Dec 2024 11:47:30 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bf98ce0fsm3753555137.3.2024.12.29.11.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 11:47:30 -0800 (PST)
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
Subject: [PATCH v2 15/20] platform/x86: Rename alienware-wmi.c
Date: Sun, 29 Dec 2024 14:45:02 -0500
Message-ID: <20241229194506.8268-17-kuurtb@gmail.com>
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

