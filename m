Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD69542A96
	for <platform-driver-x86@vger.kernel.org>; Mon,  3 Nov 2025 19:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762196530; cv=none; b=pLlE0gVWOYz8p4H+26jMctYgMS+RWfO+drgm1VxWr+0QTh0il1z5uZbxmgbNJ1UEu47tullE/a4WoaBNxM5vZ/2hAOPbx5hpxDclfOqhFXQ72eRuVTSR7OBIGyowwo0q4tllGj+GZtT59qZggZ3KdkdOqxls+4wzzUkLenY9bOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762196530; c=relaxed/simple;
	bh=2PYqlko7F9XLCyNsZ3GQYTjIvz/k9vACFLo80BZqaiw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CcdJNVBi0w/m8rrsiz6qGyaweOTxxt7ucpLD/IzInuLUGiWvzUKrOrVD+rR0DuY9z4R9rWNpJAyBOUNTMgDF4G+mHX2pRSKzHvvvhDGue0zvFv2S8J+HXzBXoEpGlBAJBblBHM4BTM3Mx/r8b4JxU/q+akWvSaJgB4elR7FqM5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cWnEba9U; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cWnEba9U"
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-93537656791so508464241.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 Nov 2025 11:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762196527; x=1762801327; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v27XtqtTE0vb8I6rwXwNjXmYzdX4QgpL8VtUmByehIQ=;
        b=cWnEba9U9sHVMFu8DnFm30y45LaII7pfpKIQjz9wpgHvnOiMoUh7E9W5KS0tOLEnVr
         aZNVupFr4FiIQKrliu3N+vslHNLxD5NPOJSO6W8Po/Rp8zIZSCBsXvXjV+tRa2VwghzJ
         rQ4mJMzMtZtehMlrDdK2jlB5mzVwFPYLaxoEc4HcHYApe4XcyDtTImy/b6VJLXW0DNxb
         nbf4JMZnOcJ8VbY9OmNpSLiPM0VDCtQZ9fnHmDn/wReYqlvCgb2GN1K7yU6NPIGkzMZS
         EKAT1CEcOZhP+eiiXZCcJyG7p1+gCOvZ6uvyDX1bHTwmYrCn+SQBztuSbRWqict3ZWje
         WFLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762196527; x=1762801327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v27XtqtTE0vb8I6rwXwNjXmYzdX4QgpL8VtUmByehIQ=;
        b=dSwpqlo3HyTD9MUvzZOWGN6FynrC6ofOeta2RWVpyMXo1pH/mXjWDBUtk6fBNd7PjY
         xs3/Q/eDHbRxvcl1xHL84uvLAErtlzdaWenN5dhXcV7VmESJJyyFUzRP1Ejmnrs03ROH
         V3K2GrWMX0pfq5NAXTQJQ6PNdMN6HCVkCtnpl9EUlmie8Llj40AxPxQkKooH4sqS8iyS
         KNCAW4eIbyuGfV7KlRvfT1E0miVTRpKrMB7upbnR6OQDmUYdg+N3shLawYRvnKUtkrsS
         EkbKl9LUVZcBdfoxxdm/Q6xBfrUx+mu8nuNKapjWJ4Kh/tbxswNuheP2B8rehpSEC8gx
         cPXg==
X-Gm-Message-State: AOJu0Ywyhl1H6tr88yYBkIz1YBrSOVQIkgLGrOkPLqVMoZt4FYA4qPK6
	NkoesyY2KlYNMGlCJqVsalGi1pKnkby2+Rbij4IuqNvO21PMdHYFAT71
X-Gm-Gg: ASbGncsE+SIpY3bW2KdqCUEBvfdlMCab51PwsepZjqs3OEa5KHk9G/LpZ02oHehExTs
	5sXvbz8TsBxPT+9HpxUnUiJ/VeY5aFlhsNJWHImVTenydFxzFu/73KvOWNBVmtvKXZNUzSZqv8k
	mbn6LFPZlno8222/d4D/TUzpjeONinABoJ4fujy1PPoujRzTB3txBvLKz1VewtlYtcVWk42ScmX
	7bjeuI+DAvQWk6/oToezykIJlLFbmaUDmm5QhvEbuPmT7X00TCG7Cpit/iMfTL2Twd1hJVphQle
	trvwI1RjhGXpMeo+4dnh8rAQzRNwfSlM0q9Y7QpHFYIxloyZjdpRw5lK5uztomnjDUxM348Ii+j
	cD2qPohZ+eDTulQkjaU2beUoUJ6jH6D+wX76OSNemQ0r7M2yHPlP8/pf2UmPqJS5KB+i0CI3DpL
	Orsg==
X-Google-Smtp-Source: AGHT+IG+IMvlrobuSL37Sfl+5yndql0M53CGtNlVs2eFmvgc5wXwNVF/JuqPRORQkst7hEsTgT2StA==
X-Received: by 2002:a05:6122:46aa:b0:559:6833:8d5 with SMTP id 71dfb90a1353d-55968330cb4mr1284865e0c.11.1762196525891;
        Mon, 03 Nov 2025 11:02:05 -0800 (PST)
Received: from [192.168.100.70] ([2800:bf0:82:3d2:875c:6c76:e06b:3095])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55973c834e3sm358469e0c.11.2025.11.03.11.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 11:02:05 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
Date: Mon, 03 Nov 2025 14:01:45 -0500
Subject: [PATCH 2/5] platform/x86: alienware-wmi-wmax: Drop redundant DMI
 entries
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-family-supp-v1-2-a241075d1787@gmail.com>
References: <20251103-family-supp-v1-0-a241075d1787@gmail.com>
In-Reply-To: <20251103-family-supp-v1-0-a241075d1787@gmail.com>
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
 linux-kernel@vger.kernel.org, Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=978; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=2PYqlko7F9XLCyNsZ3GQYTjIvz/k9vACFLo80BZqaiw=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDJkcf5SeFX7wL1h2R3zVSbNTM8Ku/Ci04vuwQInlg+y9e
 TxWb6e96ihlYRDjYpAVU2RpT1j07VFU3lu/A6H3YeawMoEMYeDiFICJZHEx/A/Zvt+NUWg9B1dD
 4yfriAorT8kJp36rqyxTmjen6N/RBS4M/2sOpn7h4pm5Zt+jveq74lfqvE7c1S+hefmqzbfYRVU
 GC1gA
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

The awcc_dmi_table[] uses DMI_MATCH() for every entry. This macro
supports partial matches, which makes the Alienware Area-51m R2 entry
redundant.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi-wmax.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/platform/x86/dell/alienware-wmi-wmax.c
index 53f476604269..b911921575ad 100644
--- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
+++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
@@ -97,14 +97,6 @@ static const struct dmi_system_id awcc_dmi_table[] __initconst = {
 		},
 		.driver_data = &generic_quirks,
 	},
-	{
-		.ident = "Alienware Area-51m R2",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware Area-51m R2"),
-		},
-		.driver_data = &generic_quirks,
-	},
 	{
 		.ident = "Alienware m15 R5",
 		.matches = {

-- 
2.51.2

