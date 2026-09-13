Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF624A35
	for <platform-driver-x86@vger.kernel.org>; Sun, 13 Sep 2026 22:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789339682; cv=none; b=truPrQESgi8KgpIlHmj1N7kBs7lQiJVytA8NTzFwnb5mB5QWYDoHbt479jJFRnEf1VTU4uVvKnW/ecd1UWAcwlepjA9TImSf2qMYqqze4uBk8Uw7tapO7VZoeLkASxvGtYfICvoNDR89afIonT+LVKTQlAiqSd7z0lqo54/2JhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789339682; c=relaxed/simple;
	bh=9J39yLspIUiCYmkRfCmgGYZzHHZzoDfXyhWpklU8k7M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jobQltnWoPJzfrAAd0fNesUAEFwqYODdp2nNWiiT+IHRdhzWaWp+LTAW6W8LFHZHpSne92mABeI4E5BaG/X5LoSKCrqGJod7GuYMOnbXHtFc1Drd/uwyfKYoalMOyTMZuBEEV2KOvYPpyFCCO7iGN6INbbdHaHiwWj+UREhZqyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ks7XTwvA; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ks7XTwvA"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d6ff2f2c4eso2192975ad.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 13 Sep 2026 15:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789339680; x=1789944480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3cZzu5pVka5ryTQQ2XqwnuE4e7coV/qer385o6D3Dpg=;
        b=ks7XTwvAgA5Z0/Np9WrEqrt8eBlcMkKJEOsLySUYM7X8VDMTQ2V6W8JK6VTFUti9hf
         +zy1Dy1S1w42ZuHf/NDyFGvx+xVzq2W/dBkQXUYN4SOYbbLVHsJDpBRd0JSweEsn6Ias
         TKqv7K/hyfiGMVLKmDD5qRWIfPbl07GfVjkHMUdAvM41s4WfSdMnNLQYGV72j9QpwHOg
         vCMx/N128Dai3Xh+hCkSp8zgouu4Y0zJFeYhgxzDb+BZdnm0b9qvwg2bYyrLiXKCmyC9
         nQ5CIhEpbk2/kJj1BhlIMUCGZB155SaqnsKIn9pbmcIoHC56l1gvSVksDICXuoC/4fF+
         X7kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789339680; x=1789944480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3cZzu5pVka5ryTQQ2XqwnuE4e7coV/qer385o6D3Dpg=;
        b=Kz9vSzVvdZCE3dUHJYL3NEZeWXGsZGojkxiitsDQazQq3JQoMy/D3I2fv12mXcQti7
         FjvnqVsWgOWIXfeOOTQ0L57FyVMC8vx1W5xNfGMYjqVRVIaJgBVqtomT/O3SSBwt8NUP
         Sp/biybhhV2dlowrufU6eHsJsHHeZ3gpEwXzio1TIbBTZFYGz7FEsGIxH1DigpVuuXEz
         qBArZy62yPBG5zO9X6tHUVFh+DQ8m/c3RrYvztsgOs8GKPX98R0JbOxnitdNuls0WB4g
         tMKSv5MBtg9BA2oM34IxihUzrZsonz2ZVV9gBiVSfFiiiFReihjy0JG4avbKQS0KgpFy
         JRRA==
X-Forwarded-Encrypted: i=1; AKwUvByb+q1l9dZEaksS7WMwyzbdxzrXTJkbvYBXHfNIx5DayH4P4B9i6tRvLergZGdGrHQyawoeRpZscjLX2ViY6CqhrdJT@vger.kernel.org
X-Gm-Message-State: AFuF++lqf6+Q/W+sZpBDPyscdASG7urSfIpaDCV6US/UZVWtTl3RXUzF
	tz6rs7BrD4q5dzwIoMgO1WqVd86A79Ny2mXvR38ZpZ//YCTpiJaDDDo0
X-Gm-Gg: AYBFou2CVHg1BnBdUsY9Bgjv9AwtQdYCM6oq1nDm2v42ItDMnOrGWfXxmkJmT7oKGU6
	Zx7PGs1tfS0e2ycTUQju2Cc3OqYybM1vdiO4vkbm+WWb6xOw7kQDTIGYV8JkRG3D2v0sA+VjwAH
	H7wqy8fOAsMd5TM90JkCVwQ/HPv0NlmlqXtY36DvVYbwztuYNFShMFSkVYH3YqSeorDdXRX/Evf
	sNGef5K6cAVpGF+sd8SaExdWN1XR60fNbTqo2AHn98TOJCZdd5MNJ0xY1OV0xw7CR2xobccS4lP
	kfgJNC/cKj1rz6hfz+Sqx5Nhn/T7VnPS8fErD2/TPH0/t2PKRDoIqhHseoR5AaBu3mdYkaAKkQ0
	TCaBvhI2wtqBs9r4J6p//6onWb4wkLcO+yiO9D9RrOgJz8KkvRSyUNVm3HNcLYndfyOgjJuEa9U
	tvq/AoaV5nIB38OJO9pT2VFu12ySPAYJYpnHc2tkN1T352Mf2WxOoTx8GXpShVXUUGfxLJljl+P
	2QP18OR309EhQGyn32R3XnJeHO7+tvBb2holdXuqEgTo4dbRBHOOHLqrkga72cwdk+byH8SCRdO
	UMwuN9GT4mjxrovv/NT6
X-Received: by 2002:a17:903:2987:b0:2d6:f09a:da1f with SMTP id d9443c01a7336-2dd2a72c2d3mr184202545ad.4.1789339680400;
        Sun, 13 Sep 2026 15:48:00 -0700 (PDT)
Received: from cachyos-aura ([45.112.148.109])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e52a60sm21992705eec.6.2026.09.13.15.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 15:47:59 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: ikepanhc@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Navon John Lukose <navonjohnlukose@gmail.com>
Subject: [PATCH] platform/x86: ideapad-laptop: Add Yoga Pro 7 14IAH10 Mode key
Date: Mon, 14 Sep 2026 04:17:53 +0530
Message-ID: <20260913224753.30281-1-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The F9 "Mode" key emits WMI fn-key event 0x46, which the keymap does not
cover, so it reaches userspace as KEY_UNKNOWN and cannot be remapped from
there. Under Windows it opens a performance profile chooser, so it belongs
in the keymap as a user-assignable key. Map it to KEY_PROG4.

Signed-off-by: Navon John Lukose <navonjohnlukose@gmail.com>
---
Lenovo Yoga Pro 7 14IAH10 (83KF), BIOS QGCN35WW. No other key on this
machine emits 0x46, and pressing the Mode key leaves platform_profile
unchanged.

KEY_PROG4 per Hans's note on the 0x3d key, that a key opening a settings
dialog under Windows should get a free KEY_PROG#:
https://lore.kernel.org/platform-driver-x86/35969669-48b6-469e-9cd2-26929fb33e5f@redhat.com/

 drivers/platform/x86/lenovo/ideapad-laptop.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
index 8213524..6fa72a3 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -1360,6 +1360,8 @@ static const struct key_entry ideapad_keymap[] = {
 	{ KE_KEY,	0x45 | IDEAPAD_WMI_KEY, { KEY_PROG3 } },
 	/* Performance toggle also Fn+Q, handled inside ideapad_wmi_notify() */
 	{ KE_KEY,	0x3d | IDEAPAD_WMI_KEY, { KEY_PROG4 } },
+	/* Mode (performance profile chooser) */
+	{ KE_KEY,	0x46 | IDEAPAD_WMI_KEY, { KEY_PROG4 } },
 	/* shift + prtsc */
 	{ KE_KEY,   0x2d | IDEAPAD_WMI_KEY, { KEY_SELECTIVE_SCREENSHOT } },
 	{ KE_KEY,   0x29 | IDEAPAD_WMI_KEY, { KEY_TOUCHPAD_TOGGLE } },

base-commit: 22098763a10d9c13
