Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994224B4043
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Oct 2026 13:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791380890; cv=none; b=vGnvA2OXBSIR2vhAvNCtXeGI8MHgQw0QcI6SqQRTqsHgY29Q+rGMzOFKghxtLOvXbS6r5sgpO3KopgtQFFljFoyQEaugXPKH1SVq/J6lk3v2xn42bI6nnmm6pr/p3Pd2DHORaoCjshpp4boYRTxiWuXJ9PDBHKIGHADTXoHJlFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791380890; c=relaxed/simple;
	bh=/HD88MhnKFAMDzoq9RntCSwhmhVSuHWz7WXu39Hvt54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uiFlePasF4uEe5YBI89vSABYvRwFYrF8Qhd1qnga6lzDNnmiOK9KAuhQPn+nd8Mm9yFakuCpwFrIgidL15wKg4Q2LNasAn1A3VjJTBpiRhWGWPYqQq2tcx8+u7Xf52fzZysE7KTUrDOGmJ2oyy0Oz8Ljt3NpHvKbUtMb+yUtuY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IuAZYJUa; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IuAZYJUa"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-34bb8b31647so6483665eec.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Oct 2026 06:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791380877; x=1791985677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sAKtW8GEm7vf+UvpgbiBVs6c9YCpJRP/yFtIzclq04Y=;
        b=IuAZYJUarA50eAcBi2+IAYJfNyZqeCZJK5bDNoc8exp+DHWdBAtyvlnzGI9qpuOSnf
         HTFmzjdDwxcnlNwwCkJWlAURbYaXuSMHQlFFJlkhbhyjxfCoblcCCGKJlBQ7ynqXU/ak
         ps3UUJkrvHG/5b07YEPmu6qIsywiB/5BuO2pdJYn8LNAvRFDJsgKPsRT0ETQmxuOGwlo
         ok3pFZDBjSQjCNdf3oRwI+RPy8J0zcxjAzoee6c5D85Ec38ycfJXTBlqS+q0nT4tolD8
         5edlxvuEJxHCrHRey48z4DK8mjc8JXc03n+blhcyK8AHRIBgPuSMFyDpJb7qodNrx88d
         fBtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791380877; x=1791985677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sAKtW8GEm7vf+UvpgbiBVs6c9YCpJRP/yFtIzclq04Y=;
        b=MoOomKeKibHmD7WPO8FlYq7cee96yeIEolCwObo/eVPrLCYZpXyqk+zeCNj/7Ppwtb
         kfJhKy+h6N/yf+8hStx81NqVG23r79Hl+14BjXitRq2h2KI8SoNKGOBy8swcwebHpWKC
         7/gEesn1QJrpjgMQ8FIEhI0oRbNqeODmWffbYofjKFqjPWF2xN4d0INvnOJOTWiRl9h+
         us6Kqlzfds0n+WnLRYFJKGXGNeuAWCrUhD3gODkQB8eqXGFGzGVCJ4nLVfwmwGJ+h8wn
         RspdTl5MlAKScgkY3klBfE3m71c7uEtX3E2S8RNd04g+l1EHlvi/HbOy5FZKbaf4qA9i
         fOWQ==
X-Forwarded-Encrypted: i=1; AKwUvBwyMZT0cUi2VmKl5bRHYLFmPmWfpguRWR6DCK72zkgMQVx/KQMJCI5Zlij8WCeSrV30E9wAtCWdlOds9hR9tbZBe2Qm@vger.kernel.org
X-Gm-Message-State: AFq9FYLZ0lI7ju/MtcjOOnk3uaOmaTukJQl/oMLQD6vabq2RFxkNSdzG
	7aJX7qCowKaHT/iILXZvMimejeevn0xbJigvzyHq3mKaFcVEH40kuFY1
X-Gm-Gg: AYBFou20D7GPjL3pln0p3XWZYGR2xcnu60s60BycjvVfsHOqGRY137Gexb3Sj1BndL4
	5KuJVct4NcXb6l1CzMKaYs8CYATj6qHvMgTlgeff6s4/PSrkuOry/9YJ+5VIJ20M4yFvvR3yLN6
	OIw0c6K9txQtVZE3cgtjtaaEnQW7+h3uSmb0uVT9aopkzqQHrAhM6F6FsOF4slrrXuUWu+MR+Mc
	heb8gEGxBLXCOqtRFtwpPX9IbY5LethwYW1LAyRNuGPwCTxzzwBsSKg4Zw+SmMAM9+oM0+uzdY0
	zQ6eLrGVkEVaCLGMmoBBnFYdMAJxP+3CsW3msvjMlGQRzHl8PKimf9MDFnOo6UVBRXqhuXkcZa9
	DnmLUS+fZpexDofx1BuC7f7NYqi/dhtjj1tA+2tXqUwCIle4bdTNcoWlMeZjPN7Ogpun6F6MU1B
	QgbWlLPORs6Hkr0/Z7NXVLwe+TXcvxnQPFmPH7MbssIple9EYhoCWmoQlUmlBe5MbEJxQdNyPta
	d4zxiHkpwxGX0oZiO7pSFwC1KOCHlaueirOB3Z39oAtQN8=
X-Received: by 2002:a05:7300:2728:b0:351:1222:7189 with SMTP id 5a478bee46e88-3515deffe63mr2519697eec.25.1791380876688;
        Wed, 07 Oct 2026 06:47:56 -0700 (PDT)
Received: from fedora ([2a02:6ea0:c803:3091::12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515aeb5c2esm7304472eec.10.2026.10.07.06.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 06:47:56 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH v5 5/9] platform/x86: hp-bioscfg: fix off-by-one in password length check
Date: Wed,  7 Oct 2026 18:47:07 +0500
Message-ID: <20261007134711.473857-6-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007134711.473857-1-meatuni001@gmail.com>
References: <20261007134711.473857-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

current_password and new_password hold MAX_PASSWD_SIZE bytes including
the NUL, but validate_password_input() accepts a password of exactly
MAX_PASSWD_SIZE characters when the firmware limits allow it.
strscpy() then truncates it and fails with -E2BIG, which
store_password_instance() ignores, so the write reports success with a
truncated password stored.

For example, with a max_password_length of 64 or more, writing 64
characters succeeds but only 63 are stored.

Reject lengths of MAX_PASSWD_SIZE or more.

Compile tested only.

Fixes: 8646a3b5ee3a ("platform/x86: hp-bioscfg: passwdobj-attributes")
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
Changes in v4:
 drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
index 96172342d4a0..af2635e31c0b 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
@@ -74,7 +74,7 @@ static int validate_password_input(int instance_id, const char *buf,
 	if (is_current && !length)
 		return 0;
 
-	if (length > MAX_PASSWD_SIZE)
+	if (length >= MAX_PASSWD_SIZE)
 		return -E2BIG;
 
 	if (password_data->min_password_length > length ||
-- 
2.55.0

