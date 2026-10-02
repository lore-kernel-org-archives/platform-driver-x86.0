Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C273E8331
	for <platform-driver-x86@vger.kernel.org>; Fri,  2 Oct 2026 19:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790968514; cv=none; b=l4OETQzNVk3e0lwJq+4lo6sP877j0DbVBa6BnJ8djACm0ZlnBowsVJt6x2iEXnlw38SxbvQp/zC8WV8f+6Ag8oNCLG7DARYasUxoRnZt5mmq9b7YaxfcwcE0dkX75z9pSs+rMZ9xdcU22U8qGI6wZAgtS+XzXpISdDC0c0FKEJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790968514; c=relaxed/simple;
	bh=sNrM9JNYurmnU2j2C+GnCb0f+NAvtRnOB2X+iTI/DO4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EwsbNL5PHAyGye3WOU/H3DUGAzO7AKj7M3RCzI5j0V9saNgXDiQkcr6vxjRAKRpZhaUT7qmbc8XxQXHFTqSnbivMQbVQpI6B0rndPy4YEockaf+Wyw8k6kvYtFR0ZsP8fqjAH2NA/hZwK6e0w+3DVgMVZa44ZqZpaEwdyt/w50U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CRVUEJ4t; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CRVUEJ4t"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49fe8bf173aso1146225e9.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 02 Oct 2026 12:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790968510; x=1791573310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6HrdlYlMCSCW8XF9JagParMEQEfvUPQkj8VTEtDRKxI=;
        b=CRVUEJ4tkOPojwu7GOPspl7KASD7LvJqS7Du30wOvV+nA7bSFqvGbx724jgpvyB0I0
         wRGsZVt+hLVgy+lUY7oWlNHIwE2bM/LVw0oX8AHULff+/5Em6QDByScmjsJluEWIlfEb
         0dNCUgJew/uRo9ngfKWm2BBRDIopzs91YbSDUklWbvXq8mofT0nN9cncNjsjbL6rcbEJ
         oO8ag07oQ6EqLJkzp0Y3r+hu8LTulgLhjB7rQlFwKWb+KGnFJIdcr0DztpPBkMZ9+b95
         VnH0CGPLBjnLFajLJp4UTKUxLrhIPpOSdswYlKIeAouLJOIzTGdiZWvlz6cQ9rH2sdRr
         +Lwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790968510; x=1791573310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6HrdlYlMCSCW8XF9JagParMEQEfvUPQkj8VTEtDRKxI=;
        b=GauOp0YsQlFqpwp+TREO1qsYmnuF6PzpAOk4abD6JDARt0fB6UVd0JTgqLaS/c74kW
         VGAxJGfOLylfAj8hAlKp6iBDVZ2IMKVUPA7Td5uAFSF8SkYLa97acr9otKjR5AaterYJ
         XXtnJew1mprxkELC0Y7qQdMGftsxaZXd5lzOIvfH35vIew/l5nTOkTZkPuzG2hvYcw8q
         iAzvH4THKapgFzS38mSgBV//ei4kyU4vSi4orNjGePJ3ys5Pin8ede7yOLrKFkqdAaYK
         w3cHw9ggPUSVWsbdsZ5h9BMpua9MuIQ6NkbuuYAjKMangFiTVRlKXDiqgK97g2lLBJT7
         tYYA==
X-Forwarded-Encrypted: i=1; AKwUvBzZvkTt0I7LyqI7mS4BYzTHj/Hc46js/9731nZ07FGtT15dYU7iCbyI6vcxOUgq6t5I5giyeSH0VZ5CawKALS8qkH9j@vger.kernel.org
X-Gm-Message-State: AFuF++l2VQdYuklxK8wBBvcwqwW9uBI1bhiGGED2YzZ3Lk9HaL6j3UcY
	sXV4eWP+ufPrLi4iyhWcWpXJWLzxYGqtNx2wrAgV+7FeGGfTAviIcDIy0ub+BVUMvrk=
X-Gm-Gg: AYBFou1/O55BYgm/y38Ttqwz2+eimkMEPDqDJjnjkJuIo+ao+d7lgNWqyuQLz5T2/py
	56m7lLvUr0+GZyM0MfQ0oKBbKFhes3wx9HbhNj8AtS24G+1xM5ZdmI1FUN+a+2xYjc7XjDxBrf3
	t72AlGCvspQq/FiJhbRpbEpLfSRRfGzsP00O1MX1OzFADowDhEDLz+UYaijeP5CtQP9ZKoy8hmi
	8oi5IZRsEM8lWYk/+Ra3lOZF23BnE0sKn95SUNmgfWb19Ie/Op6c9igm6M+go9tJMvDz3mP0DNt
	JNEvIK3yCrYFd3PALfCYwoJxVDsbGMX+9gz9DHkzA9uuUbHg0eXSmBDYplnvnrqUY+aMnBPa1dt
	b7GkwUzD/V6Vai8CQlBND4jO9nfj+STQvf4iB3PVzjn4/SrrmwNn5k6cx1zZVddPvTIV+KJE5+z
	ViI8YhUZSTutLS6DdEBBGL8O2DBBvkXxBqWGK6EmfEw14vj62czkFpq6QLLL/ijW5o55NX1asMp
	SQjGMNn2uXprsEfuNyQB4ai7Xa+Njv3xp2R/6JBdxmoHEqXwi0g
X-Received: by 2002:a05:600c:5303:b0:4a0:1c10:1419 with SMTP id 5b1f17b1804b1-4a027597b34mr60410315e9.26.1790968509994;
        Fri, 02 Oct 2026 12:15:09 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0e1afbc44sm81151145e9.4.2026.10.02.12.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 12:15:09 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH v4 5/9] platform/x86: hp-bioscfg: fix off-by-one in password length check
Date: Sat,  3 Oct 2026 00:14:30 +0500
Message-ID: <20261002191434.58529-6-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002191434.58529-1-meatuni001@gmail.com>
References: <20261002191434.58529-1-meatuni001@gmail.com>
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
 - New patch

 drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
index f0551b455..a2f50ecbe 100644
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
2.43.0

