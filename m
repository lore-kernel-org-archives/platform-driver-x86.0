Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F01930F52B
	for <platform-driver-x86@vger.kernel.org>; Mon,  3 Aug 2026 14:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785767464; cv=none; b=EUNyQ2QSW9gxwcOeTFtuV1tQUGf7XiA9RhBSMraSd6tastIvdtho1HJ8RUXKV9TeKSWX3F68GqmN70Jt8H2YiKmSrVRbmzImsxJdhVqDbaiyRv4G4FlxKl2PQlOdxrhxulORy6m4T8i/klGiID49MPmLeEduYrPmiHQ/4dl7m7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785767464; c=relaxed/simple;
	bh=r6Cbjl4OVGNVNoYln0kbEziovWGUtHxY0z02La/a0yE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DDumYLFoYghgdkHxoKDshfeu9Nks0jPiPY9JaQKe3BRc98DeVl9W2VTK/QWpUboXKkwVvlRj/UgMVifxJxTKi6/n7QNWdXMYYJrQ4wu2Cumatn1EGABrGjKNavCjZQNFqJEN+gjnH+xOBK84eE/7B890O/AAxHGU0S/W+EuofH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QWayDztU; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QWayDztU"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so20050595e9.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 Aug 2026 07:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785767458; x=1786372258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PdRDhdZcnRfVrf9wRzs0djvfPZrw61+L7S7NLduJJu4=;
        b=QWayDztU8it3Z5kTxP2qIecS6McYqBN5ZIAauyqoelfQPiwQ5IgtzqJWwFtCa/aPkU
         tqeS3AyD80t3lz60mJqFqOBLMSO9VPNUgnpvcfQGIgatmokTPf0pHJG179hbmDZELOjC
         NGXaFqKU5surkpjguKyxyXSgiYiX/AGK2Zpn7lSmBdogkgCliHxRwmTOTaGeGlL85IoN
         zrm+H5rVta6yvf9JmqzQkugYhvFg2m65cDkbkIH92x6TJ/4sQie7XNqqLxbIy9lMD5YR
         Y5oPq7F77fOtxQqw1oA4Hkfp4Gyxw3boiDAe3Sz5vzCNieDadPPtrc2Kd3C5bMm+PBq4
         0L/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785767458; x=1786372258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PdRDhdZcnRfVrf9wRzs0djvfPZrw61+L7S7NLduJJu4=;
        b=NJ2E51XjF2XcpoSNd1Gaq34XvVrZYRL797Nu7UBXy6Jecvb0HwVbUtONJn9FntA9Ig
         5aAI8VAbsPlji7TT6Ff5NbLUdyKwh3LYQn8Vw+irrD4OX7VIn9s11Sr7FUov063aem25
         ujbvO6WLyRfC7EAZgYGW1QRi168VRbpgN4Iu5vZEADL0EHApfWAihrtjbhQWhmiql2PJ
         JlC2y5iLSTdKdj7v5g0Sk6zB48zc/PVNwM2XkNJs7XwwAhGHSsJmbb8SNHDnU8RkGdqW
         UvOuZc9FooemWZo6CRG5ztl4truouY1MK3hAJejaac3WRZn6oT/5CecsUeAYZpJb2XPK
         Os4g==
X-Gm-Message-State: AOJu0YwuMYycf3t6Cz154FCpPMyNxV9tndJUDWZp05NTSUMpJN9IjJ0V
	8gP0lJgO6UDd9pB65xiPTfqFv4ABN1TKRWiVl878kEsoqeldOz/pKd8L+pdarzw2Nt0=
X-Gm-Gg: AR+sD13tEBBsEAR1Ehh0VFGcrJve4KU/p+7/TexqAh61gr+OaW8TFMIilL0qy0doIPd
	+p49ONwTEcQkZ/9CX9+Rb95q+Kq0PAucuay0pqQMopAlJ2AhGyEywTPuaVzmD6gDSaZabneB9sz
	YGaTxnNoGNEVEvwnyAe0E3P9SxzS+C5/lwCb3K+r4CTcQWvtshmMa9xA70/YgdgZ0Mtgif6ehbg
	QBUBr9bgr6jEGi460QY9vAOGXsZhQzVQPoBbjACiPUKzgEJfPBcS07R4mXO5GSx69476LyCdXQT
	f3YbfYsKtBZ9lR7KDtnmDY2ukhYh1hb5V8j4G+nLXXiFf/p30vU9oUjxZmfKaNZE9MwLiezcxtG
	ixJBI6BjmedE8dYvbuwfAt8Q48cji+zoxg3C/k2RFDukH/mWFdQ/fBh5otinBXzHdnXJBY1izjq
	lBu08+sCHq+LT81Dpsybl22DdtTob41nEMzGPvzCjxTLVH+7c9nuZLoFtFV14OA0Pe+ySCo4y+r
	GCsVW2apmEDCXFPgPGefDwcUL7V46uM9Qpc+w4Rzw==
X-Received: by 2002:a05:600d:8489:10b0:495:69eb:27fe with SMTP id 5b1f17b1804b1-4980c674ef9mr180887235e9.11.1785767457599;
        Mon, 03 Aug 2026 07:30:57 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b98284sm236575295e9.12.2026.08.03.07.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:30:57 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: jorge.lopez2@hp.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	meatuni001@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH 03/13] platform/x86: hp-bioscfg: fix heap OOB read on empty password write
Date: Mon,  3 Aug 2026 19:30:26 +0500
Message-ID: <20260803143037.93105-4-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803143037.93105-1-meatuni001@gmail.com>
References: <20260803143037.93105-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

validate_password_input() computes length = strlen(buf) and then
checks buf[length - 1] to strip a trailing newline, without checking
that length is nonzero first. Writing an empty string (a bare '\n')
to current_password or new_password gives length == 0, and
buf[length - 1] reads buf[-1], one byte before the heap allocation
holding the copied input.

KASAN confirms this directly:

  BUG: KASAN: slab-out-of-bounds in store_password_instance.constprop.0+0x223/0x2a0 [hp_bioscfg]
  Read of size 1 at addr ffff88811bd8da9f by task sh/13740
  ...
  store_password_instance.constprop.0+0x223/0x2a0 [hp_bioscfg]
  current_password_store+0x14/0x20 [hp_bioscfg]
  ...
  The buggy address is located 23 bytes to the right of
  allocated 8-byte region [ffff88811bd8da80, ffff88811bd8da88)

Reproduced identically via new_password_store. Execution continues
past the bad read (the garbage byte only affects whether "length" is
decremented by one), so the write completes and returns success; this
is a pure information read past the buffer, not a crash, but it is
still an out-of-bounds access KASAN correctly flags.

Fix by only checking buf[length - 1] when length is nonzero.

Fixes: 8646a3b5ee3a ("platform/x86: hp-bioscfg: passwdobj-attributes")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
index 4d79eb8056a5..86fa03a5ee9a 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
@@ -66,7 +66,7 @@ static int validate_password_input(int instance_id, const char *buf)
 	struct password_data *password_data = &bioscfg_drv.password_data[instance_id];
 
 	length = strlen(buf);
-	if (buf[length - 1] == '\n')
+	if (length > 0 && buf[length - 1] == '\n')
 		length--;
 
 	if (length > MAX_PASSWD_SIZE)
-- 
2.55.0

