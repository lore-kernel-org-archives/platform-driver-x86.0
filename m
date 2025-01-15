Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9921DD54C
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 Jan 2025 22:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736979506; cv=none; b=Q1SCmBG4qVfvhn3AKfxSpgbppG7F0weHs6Q731jM7FOPuG7dCAzHcAy9/5WMjFXXpxN14FWmfCWitHf+IdB0EVszgwdyOrGOJPJShjK9LtIlZlsifodoNTPzXsgTVGImJipRBsLWePuO6RJ4YL4p3ZtkOAEozOrLKakbirPkJ9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736979506; c=relaxed/simple;
	bh=2UQJ8Xow9dcysRIqf+A7OR/jyfLI0z3JpBvKAmzpg1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DROruytWi/uiTt1kpZriYMnH+OwQeh6JLeuuSN5FEH4jcmkEF9svgk4rNl4H/cPuO6MMx9vYN/yvScDNSgiqKR1hPw4d5yG+SJvkoBqwkApBydnwv/UfeklwNqfnMgUtcmGa3zXwjoWTIDV/RgEqqMokUPYR0K1x+fjic23oMQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a0UBgbOU; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a0UBgbOU"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2b199bb8af9so411112fac.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Jan 2025 14:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736979503; x=1737584303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5VZNEqFkeQxeahJD5UcYhf6GFamo/5WVFAllWwHMD88=;
        b=a0UBgbOUXxEnis7kyy2byT5T9qzYgmS/eYrhaz2GZ+ziypbeEdqO1mNOd1LpTNZQ7z
         XDXKq5z+rpjLAfYS1sKLQCB9A5kwEoikXUeVWL6HUQatFgQgrcDUhBn1Eu6WJTIjk3dg
         zroRZHqlAnW+mKYMBl/5tulVGVyggsZueMryIb1DCQLFqxFeH3y1soQZQpBDCELEBfiE
         cD1EhEHV9/YF5GzHGNIh5EMRp1rhXMpr4vHfbms8ummGeJ+hK2K4i0EBfUE6PSxFGxqY
         S4Wye9ouDgmsVre/AQDr1ytyXiLRzk+kil8spukCsU2eTax84JlavmNvqMaw5XKgP0QP
         6m8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736979503; x=1737584303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5VZNEqFkeQxeahJD5UcYhf6GFamo/5WVFAllWwHMD88=;
        b=DqpkplTWWPGaUamBIQ+iD5rVRkp+Q8YGPaIUxgwXIqwCyFUsJ9e5bd/j4ESLRUdAES
         b/GhAaJaJGhe4M55oVD2hpk9+hfwFp8jIu8ptJ4AtdEbS9yvN6Edp5rubHQEdIUkyYcd
         0NvXr+Niu/S7/lv4dkXKKMEGdv4WnRYdqvKpae9i1R3lC7rSTDcXC8AlQS7kfX6/zlXa
         ezdCBphGAtsVp9HfAB/dce84uhEJ67fJUfSQrsYEsJmvYeQKWU3g2o3LsZSEl3b4hXBV
         rEpoThf3FDUts0EugqtGS9VMokW92ALkWGC8Jb9id186Rz9fQtfi4IAsDIkhBePMiL/3
         Hblg==
X-Forwarded-Encrypted: i=1; AJvYcCWIE5ciSAsoKNEVkB9B3nyHIvWHIpi444vTyKbZz5WoS1dje3aWBMAdY3mMy81+xNdhbQM2KKUxqaw2iNebzL6SAYtk@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1PD4XKHiZmfzKMdqcVJY3nEEEFGEfRboIksnjLjDP8Rmi6ixq
	m84bQX1sJmW6c6Fn5SIq6LJza/BJMzDlprvxRp9oLq2kqCQPVbN6
X-Gm-Gg: ASbGncv1dPGjZF3/jOa5k437a12o0FHz7OzmNnKXOtcTtXpjSDPj+uyJ5SJqbZD8zi3
	1xSGGag12N9BhrVeeGAXvZkveGGhTCBLSDakb+CaJ3Lxxn9UPUEqZpNB+BN4UJ6pcnpGaBzUYwL
	tmOEmfTvfOfFl7h8zBK7inexES9oFQx/U00afrBAg1eSZmaOXh8znf6BSnhXWLjc9wYSlkXw0B6
	zuk7vjEmPrr83X7rejubCVSGroIVjvKS/QlEreERitoAPhHozaYZg==
X-Google-Smtp-Source: AGHT+IE2m0DQJMTjTybOQ9yXenb1apn7MV3TTq1By681FBgTFc2X7h6ZfcrSUsBdfz4EHHmMvLVtgQ==
X-Received: by 2002:a05:6870:56a2:b0:29d:ecd6:cee9 with SMTP id 586e51a60fabf-2b186a748f0mr3158595fac.5.1736979503465;
        Wed, 15 Jan 2025 14:18:23 -0800 (PST)
Received: from localhost ([2804:14c:79:808f:eedf:d2f1:c86f:35be])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ad80550b46sm6733654fac.22.2025.01.15.14.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 14:18:23 -0800 (PST)
From: Matheus Polkorny <mpolkorny@gmail.com>
To: ike.pan@canonical.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: Matheus Polkorny <mpolkorny@gmail.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH] Fix unnecessary braces warning in ideapad-laptop.c
Date: Wed, 15 Jan 2025 19:17:48 -0300
Message-ID: <20250115221751.233111-1-mpolkorny@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Address checkpatch warning: "braces {} are not necessary
for any arm of this statement" in ideapad-laptop.c:1858

Signed-off-by: Matheus Polkorny <mpolkorny@gmail.com>
---
 drivers/platform/x86/ideapad-laptop.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index e980dd18e5f6..408e7d1cfcb0 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -1633,11 +1633,10 @@ static int ideapad_kbd_bl_init(struct ideapad_private *priv)
 	if (WARN_ON(priv->kbd_bl.initialized))
 		return -EEXIST;
 
-	if (ideapad_kbd_bl_check_tristate(priv->kbd_bl.type)) {
+	if (ideapad_kbd_bl_check_tristate(priv->kbd_bl.type))
 		priv->kbd_bl.led.max_brightness = 2;
-	} else {
+	else
 		priv->kbd_bl.led.max_brightness = 1;
-	}
 
 	brightness = ideapad_kbd_bl_brightness_get(priv);
 	if (brightness < 0)
-- 
2.45.2

