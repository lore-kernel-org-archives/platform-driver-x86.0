Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FE52500C4
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Dec 2024 17:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733246195; cv=none; b=Nm8GBbFCxq2dm1sBquTwOwL+SMH/X8RgDGPy/uLQDX4AoyaNCi5rNMBuGkK+a8B+6WO+payWswb5/wlNJDv+YVXvVh5MtuvfMy9XS5OJEU7lmzS0dWzPcLuIKgOpH9N/AOBhQyuZ/xaiszX7flBGx9nkb3YrIHjGwySeijrJ7tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733246195; c=relaxed/simple;
	bh=MLx0HXKyXXM3y8y6+2+1z0+USh/AYD3UzcwSVg7LVgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rgo/Bq3WG2CH7c/ijqyqdlk+4O8Qml23X0+aeLt2YUuUhjBShwA1LmDwKOwN6ar9Vjc+7GQ2oaXN9vmgdE48HvKo2c5AVS2OQkiIEgwY49dF7gb5pzrXiLZAQtYqFQIwKTI3Y+eJtSAYSf78XQSm51FnG/zGS5H2+y0sjlVTvko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=INQooTFH; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="INQooTFH"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-434acf1f9abso53632055e9.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 03 Dec 2024 09:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733246192; x=1733850992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bfz7EKDAPFwQQLg5EGqOmoY87z8R+/d21HRHaU4rMP8=;
        b=INQooTFHdqqQuhSunXAND/AZPy6i5KgPgYT/c8DzBDX5WCrUjBk98lEFEAM942Ivs7
         lAJyjzjpCsqLGi7+tMmYT+x0G74Jz8HivoxUlzV3WhcuOyf+a6sVNtPllkONDiqW1odM
         PF3WbZaId7+f9NpgikEnpCDckVvc5exmUvlojcx6d1ez+GEZV+SSsDbNgtz239WT5x4b
         DZlK7+16mEmCGUAsK7WzUgu9Gbab+X25pj1gcpEkvGvWUcs/x2N0EwoiqfFl1KuKtvA7
         cwC7a72bdIp+wXCETsxM7NBroPhhgfUgFDzU4TJTsPZD7XI9TosvhAovMwAqSWfvnscV
         7wlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733246192; x=1733850992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bfz7EKDAPFwQQLg5EGqOmoY87z8R+/d21HRHaU4rMP8=;
        b=QTPqpOivp3CTdUDowAY/VhRhY/ykPjI78w2Amy3F9iUZYeqx5Rf2lyTqxcFzu/Fu1W
         NdfLQl3NCeKlkilxUQhczm9i5L4Iofn3RurbocxpKsqFTTCRI6T4t8e7NYg8JFhsLWz+
         9Vd6RANLT3JMMk+2bBRmuPlE0e5Q5ma6OXYWt4ekorqL4z/1mdKf96lFgHtp4Rmfaida
         uLo594aldsrSsVbHZNiWa24/+21nPwNVF0u8YmKMcfoil/F3vutHQMLIviZ6DW7JH/v7
         y980MgJj6IkKSWrlym0mq618IQxGfDS7BTl46mGNEGrMWr5JAAvI/sYgJWjE03flKcpv
         MP/A==
X-Forwarded-Encrypted: i=1; AJvYcCUITlgCiBlwKpcfcwNHc/yrjQFdhUIjBVJdRjVIbdI5//XHA9kWxjowkH8RoH/hBmOC3DzsRaVPgdP3G9qTieZzekb8@vger.kernel.org
X-Gm-Message-State: AOJu0YwcjDNJhoZesoLso4WgGJaZO1A0Dj5tVDtT1Ju8fMIFoH2tdSUu
	kDIJ1sih8Avfp5XU9HKCvCVLxkuEw7F8Jk7x6bFKyQdgoQeQ6FUbTS4yYpgoOMk=
X-Gm-Gg: ASbGncs9KG1QBnV6BnMPOuKidDKgsk1xjxG3Z244K2SqKhbmCa0jDkqUtKvMQT1GUPh
	mdWGMJ2sOkTdJHIvc/87g/6FY3YfGOE8PWdPyrYbI8tiheiS4lhFRiM1lyCKCfF0ikfu8TkcSAR
	ik9hvV93coyRBaZqewIF57awWHGnlzURY20tgQGLOgoOXqdvIuhe88OMB2RBZaZyPnmtThH2vw9
	wuNTFTduFs+XyuIHvYJJbu0cv7/87coXipFh6+XkhUWykO73NYnSkizWXNvjUsNh+RYC6WTGd33
	bMUt
X-Google-Smtp-Source: AGHT+IFoPJItQ+VTXRbxuqQvrsK7cTv/Gk/LwLMIXuHO9GbWZUw4c7hfqi9jkofbnT9ohgu7PhAUAg==
X-Received: by 2002:a05:600c:35cf:b0:431:52b7:a499 with SMTP id 5b1f17b1804b1-434d0a07e76mr27423905e9.20.1733246192302;
        Tue, 03 Dec 2024 09:16:32 -0800 (PST)
Received: from localhost (p5dc6838f.dip0.t-ipconnect.de. [93.198.131.143])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0f70cbfsm201776645e9.36.2024.12.03.09.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 09:16:31 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/2] pwm: lpss: Define DEFAULT_SYMBOL_NAMESPACE earlier
Date: Tue,  3 Dec 2024 18:16:15 +0100
Message-ID:  <9f0e30c514a846aec72655a52deaed276467a07e.1733245406.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1733245406.git.ukleinek@kernel.org>
References: <cover.1733245406.git.ukleinek@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1192; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=MLx0HXKyXXM3y8y6+2+1z0+USh/AYD3UzcwSVg7LVgU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnTzzjtz/i8uKDCaiZ5c+ovGLZgu/IacX8+/opL x1OD1Svgb6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ0884wAKCRCPgPtYfRL+ Tgr8B/wPprElJIbn9hU2u8ge4/4joAnkRmi39mrgL9oAOALP10H1RU8YfBaKt+whiS+3yypEWim vywS1F5ffhpg7KNG3tPQEwUTVM96cbL8ixlxatbfd9TuPyyDOON66UAXrfhO+1NP5xhMlWs5yLW GihqvnoS8cuRVUg1ErOTFGnnWQFVydOOxhLkxnR0uyybJTwtCqmPAYSig7lPrOMoYNDr/ogNzCX z4xzdCXbMYRGY31AQbQxUASQLyKXMI9YT1gcFXcWf8L6buwaagskUDKRwljaONoopVj6pog+PPh 78gNU4tnH81CRyWXaVLzAwrx8cTByxLT9+KW5zy2idk3u0ab
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

DEFAULT_SYMBOL_NAMESPACE must be already defined when <linux/export.h>
is included. So move the define above the include block.

With the DEFAULT_SYMBOL_NAMESPACE being defined too late, the exported
symbols end up in the default namespace. So the modules making use of
the symbols defined in pwm-lpss.c can import these just fine and just
import the the PWM_LPSS namespace without any gain.

Fixes: a3682d2fe3c3 ("pwm: lpss: Move exported symbols to PWM_LPSS namespace")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/pwm/pwm-lpss.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pwm/pwm-lpss.c b/drivers/pwm/pwm-lpss.c
index 867e2bc8c601..9519d1b06869 100644
--- a/drivers/pwm/pwm-lpss.c
+++ b/drivers/pwm/pwm-lpss.c
@@ -10,6 +10,8 @@
  * Author: Alan Cox <alan@linux.intel.com>
  */
 
+#define DEFAULT_SYMBOL_NAMESPACE PWM_LPSS
+
 #include <linux/bits.h>
 #include <linux/delay.h>
 #include <linux/io.h>
@@ -19,8 +21,6 @@
 #include <linux/pm_runtime.h>
 #include <linux/time.h>
 
-#define DEFAULT_SYMBOL_NAMESPACE PWM_LPSS
-
 #include "pwm-lpss.h"
 
 #define PWM				0x00000000
-- 
2.45.2

