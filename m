Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587ED34D3B8
	for <platform-driver-x86@vger.kernel.org>; Mon,  3 Nov 2025 19:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762196587; cv=none; b=WpK4JRS5AqFgLmPMPp3nD9BenLzEcJ65wkGLeu388MlUV7+77WrdWXxhSV82VDk3hPuyur4AbNiI6cYBFVHaV/01DEUsIpmRQZrufQyMTk/Rd0qDZhZwVrX4YC0SOHoPB4in7/CADoeHVQ8x+mC7KIVB3jNOs9zrP2iKuqN7uzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762196587; c=relaxed/simple;
	bh=En0VkMeE1rhng04vLBUHmQuBemFFPSrfkQh+Rs4KkmM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bQyMt/Wz4MnbFo94eS0Te1c5GWT+YQdjENt0Ehtsys3M7t3mqrC4HPw/w10zo7BICAcJdl+JxQljQdUMQ/aixDu5NmEs36MHhA3I6pHB9Er5q1ZeqdLPfxZ4F/rIu7cRv7g8SAWq+rOPmlQmlKIT0qflX9KIv/BKYZtmZaMRWa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c5y/rDu1; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c5y/rDu1"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-55960aa131dso552386e0c.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 Nov 2025 11:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762196584; x=1762801384; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+fPkWCp8swfwdbGWYqTdbJKnDJR2KGTgvfV0JdTw2mg=;
        b=c5y/rDu16souczz6G5t48zu2c3+emph3xz5YFJd+d/4FTAS57KTh9ykRk1STVeBGHR
         EC9FT6fDi7IJy0IA+EVkr4jcgYZs50wxtYZ2iLnEAw3S+mw89+Ul/zVa49pVcBTcQC5x
         J7LhgLxBtDCDWVpynrplUlFExcA+4PbkBsT8gJL7n4FzbkQJ2oGbAc3qh8zBFdWMM3kz
         ZkkH0Aoe1ZOsUwsER47UGqqO3j5xdwZnpCqRn+OjIbAFcKg+baHioBrdccafFQpgdd4Q
         jjLw2AtCViX9qBDrPF0yF3D5v60OO/YIEycbzX9c9yLbNfISexur3URiNw+aOOnYvMbC
         EbtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762196584; x=1762801384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+fPkWCp8swfwdbGWYqTdbJKnDJR2KGTgvfV0JdTw2mg=;
        b=wnoK9JHoh15GG++P8FzMfddIMO2WfL2P4hThWpSnPnizLdhq56bUiuvbcI+37kjBAJ
         m4+HPXNIKscO3ltbcgamzTbUhIrdrv2zVa4RiInwTtP94Lx3lco+10NRLrtJ9c0jGhNv
         /tOD3gveACjsot99Fpbyzazyq0Fow9HwduBffKnoVrZt2mMPQVk89vEuuPzz3JzZHtF0
         c289n03JJys30LQQGxm5BPXQ2hnDH7Sw1D0uX8D3aKAHiOhf2Ml7hgKEw+qYQV2/1hbG
         o4ytd2Gs1EOKJjfjk2LvYeykdXZV4ToBZ5+af8x7jjW9FFldGhuleE/C/rjwUAMKM6kP
         kc0A==
X-Gm-Message-State: AOJu0YxtIN33ClaqbnHrK7ZdL+KK6vC2zmJ7S+jkhQK8kE7y2MTgdctA
	3m/AQ0X0+SJkTLRTUTBznTQdrZrfczLxEaupayHbuD7fxnPLF9o2CW1K
X-Gm-Gg: ASbGncurGDdjWH7cwREt6BgFP+A+EF7CmftaI/Ss+ZHvAp7iS0IdlRW05gTd0lBkDN7
	jFQ0TmSqZc5C9101MBH2mo5qPc68CQEDTixxKxgIhcXyzoTOSe5xUm8Rh+wKE6htmf2QD9mtfrr
	X5SJi5eYBEWrrye8Ra159lpyHP2OJkG/I93wT5eVGjYj1tWTi8f3YXx4pd1/23EO77zBhckpUyY
	wxoVY008vDmapqRc/RnqcoyYr3mWLlfKItaXOu71wdnqF5feRfnfWLNqae4py97P19RmMHAH1gX
	WM5/jF3Sf/g2E+pIt84ISgdwtFDINdfY+OZ5cPMWlvWrBtWIL6esSiZvytQ6FK9B9n2dj8v0qqg
	cGbUH+KbIRWDBnViKEEYNBjABIysgqze/lA/3s36wO5dlHlIKKGYErU4Ip2i6LJz6BLwgmGGgod
	sKAA==
X-Google-Smtp-Source: AGHT+IGv0Ms552SbiF0xYh+qZjLVNlpg4qJjDFX+UdDbb0FzhrWHb1LMmGGXktjG/NSchg1Cn7WvNw==
X-Received: by 2002:a05:6122:3c48:b0:559:6723:628c with SMTP id 71dfb90a1353d-55967236824mr1385199e0c.16.1762196528942;
        Mon, 03 Nov 2025 11:02:08 -0800 (PST)
Received: from [192.168.100.70] ([2800:bf0:82:3d2:875c:6c76:e06b:3095])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55973c834e3sm358469e0c.11.2025.11.03.11.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 11:02:08 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
Date: Mon, 03 Nov 2025 14:01:47 -0500
Subject: [PATCH 4/5] platform/x86: alienware-wmi-wmax: Add support for the
 whole "X" family
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-family-supp-v1-4-a241075d1787@gmail.com>
References: <20251103-family-supp-v1-0-a241075d1787@gmail.com>
In-Reply-To: <20251103-family-supp-v1-0-a241075d1787@gmail.com>
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
 linux-kernel@vger.kernel.org, Kurt Borja <kuurtb@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1438; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=En0VkMeE1rhng04vLBUHmQuBemFFPSrfkQh+Rs4KkmM=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDJkcf5TmVPTPaTpoEeaU/NO6Zw/DvPWhpmcb/aSEnNrla
 z9/0bvWUcrCIMbFICumyNKesOjbo6i8t34HQu/DzGFlAhnCwMUpABPRWcTI0KNpq/5E8tnJYoao
 A3vaCnOFo72Xz2y+KMIb9Ss9+h77dUaGrd2HMw/MdS1PZwj6U1aV8eXP3LJVXBtUIgKz9z2pcVb
 lBgA=
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Add support for the whole "Alienware X" laptop family.

Cc: stable@vger.kernel.org
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi-wmax.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/platform/x86/dell/alienware-wmi-wmax.c
index 53d09978efbd..c545eca9192f 100644
--- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
+++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
@@ -146,26 +146,18 @@ static const struct dmi_system_id awcc_dmi_table[] __initconst = {
 		.driver_data = &generic_quirks,
 	},
 	{
-		.ident = "Alienware x15 R1",
+		.ident = "Alienware x15",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x15 R1"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x15"),
 		},
 		.driver_data = &generic_quirks,
 	},
 	{
-		.ident = "Alienware x15 R2",
+		.ident = "Alienware x17",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x15 R2"),
-		},
-		.driver_data = &generic_quirks,
-	},
-	{
-		.ident = "Alienware x17 R2",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x17 R2"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x17"),
 		},
 		.driver_data = &generic_quirks,
 	},

-- 
2.51.2

