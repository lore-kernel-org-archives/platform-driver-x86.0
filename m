Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5DF1E9B2E;
	Sat, 21 Dec 2024 05:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734760794; cv=none; b=QxjkLFbq7JyK5w3x+5mcnXKRgBoJa2bG2Ed9Bq9ffAn2qBvKzLnW21/TYnMW5AnAI0K7KE9AeY2tz9px66JppzOJIyC2jL0sUenp3MUhPbbiZfBV3qRe6RZyGQYSL5shUKQ4vyY2r1J3ZsqBvJmald5FVYup3vju7jvKBlCYQHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734760794; c=relaxed/simple;
	bh=e5G5xXJq6UtJYXsJRb+4t7+vqOaLOFU3EPuz/vxGzOM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R6zXkURlMvQkwOcn5LZ7HJOTSiRK6Ibj3dDB/En1Z3IsjDiFsDfOnk7bp/EdS8crLi1w1Eb66hIhawPa47AAbFBFP7VNLFTn2e9nqN+4f+pRiFNHsxf69eN7s/6xScKoqR7o+1reuw1KG+sPEhfdlXE3yQGRpNotsYcvRrA3OhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=avZI0lhf; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="avZI0lhf"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6eff4f0d627so24064227b3.1;
        Fri, 20 Dec 2024 21:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734760791; x=1735365591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HSkKrNZhzv6sN1j1A6Br5kBbK34HrWwa0EWiD+lc8uk=;
        b=avZI0lhfhtjkQTQ120+epvHVhwvcWD4ovqJup4a8rjgYaCNHQ8k30QvOMSxkSXXwFc
         cYjD+b1CXHXnBPyNwCo9ZuUwAgbEkmFWkzFvrQ6m64feKTvHUlu1lyxzemKPLI1VYZjC
         hwukFyqisB39Aa1jjR+hM7CRShZFm3HLPkHyNDFMtxVaT+irIvw+skDOS5Sk6i/vtyq7
         3YvbuYRJDnwzphTN/hrLMco7rJbm8NVQuZ+Z6AIKnGS3yiFhc6fD0cKToAdysvJjTj6o
         NQ9mdo6OuMM4edOIv1Ng/MQOHhP/ZS1Hax9lHt3RleqORQJGUOQ8eXYciDpFezhAUkiB
         zgMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734760791; x=1735365591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HSkKrNZhzv6sN1j1A6Br5kBbK34HrWwa0EWiD+lc8uk=;
        b=GnIT8pnM9rYj+SzJUkg3gNOtcclkVjJrKwjpwj74OdHbhk0gWLpyKRCOqfiU5/jlw+
         qBV7IipbfB5bx3fdzzF2p9dJ7uJtRaPoRlSCt04iGVuE2kGgvgaI3/OjAn+G8faTYXZw
         ojgZGlAfk2mcZ7H2ChSPnPlBoDvFDS49diA1gmnAIzAwiC3YABum/x5sVIo8k/bCVYyu
         t6DdyUZZMVHGkteQbLDdXd9ZKjxYq7pp2MmmRREJgBicVDj4Pj33qYrCOQCBGuKfZcGB
         EcGpZQlQnFVx5nw2nhvP3suyNOSAQW4k/VNRl1V6c7u3eQn76goXbyhMdkSXDC/8Rgnq
         hOTw==
X-Forwarded-Encrypted: i=1; AJvYcCUb/zjrDsfuTOwfBAq6OoOh287viotQFCvqoJjfrhY3THCKHDRb1ZD4FbjshgSbMYAkR7ld30nACaaCUi0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzU3B8FvOBqHE+gh+Ty8+jSQeQDLGEcKILy6G1Ip6HB5+5GNyJZ
	X7cLv1aOe/wih3mcswO3QMyLoTK/WUTdqeL3I2RZiUrTHKKC91iVGzQd/w==
X-Gm-Gg: ASbGncvk8i7Q8awZjxzw+Nht50dRqoKHOSnzWtyH/q7IOo4+wNBw2ZV4+MewafhaNnL
	7WUzNhFtmzrdQljoH3uiWFkt7E2pZCj1XZtZD1PFoGJJFFNi8tHgBebJ4Gt7sO4FLFDjfasT5tn
	2dT7e/ai53j1mFx3QqTu3wIJWpvLoSjgWwJQjHtZZUK9afG5Q69SHTW7asEd17vaWEV5ffBo1zh
	6VDcfBNejq0SY011LevU77xRl4eK+mQwWZ7Uh/Ju5g84etM+nlJgrAtJtZCcZHG
X-Google-Smtp-Source: AGHT+IFzne4ymApjaGIaCu0/9Jcb9imKpvRl1NuzMKQPaL68Pl6ZJs/Jd510de5a/v6B+4RxxYh4cg==
X-Received: by 2002:a05:690c:4988:b0:6ef:6cdd:57e3 with SMTP id 00721157ae682-6f3f80d6262mr51009917b3.8.1734760791336;
        Fri, 20 Dec 2024 21:59:51 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f3e783ab9dsm12164077b3.119.2024.12.20.21.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 21:59:50 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	mario.limonciello@amd.com,
	w_armin@gmx.de,
	hdegoede@redhat.com,
	linux-kernel@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH 01/20] alienware-wmi: Remove unnecessary check at module exit
Date: Sat, 21 Dec 2024 00:58:58 -0500
Message-ID: <20241221055917.10555-2-kuurtb@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241221055917.10555-1-kuurtb@gmail.com>
References: <20241221055917.10555-1-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Module initialization fails if platform device fails to register so it's
always not NULL at exit.

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

