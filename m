Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEC74B5CCC
	for <platform-driver-x86@vger.kernel.org>; Mon, 31 Aug 2026 16:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788192499; cv=none; b=r9E78eEQVfRrb9hjZrHNgQeHOe36mKETufhPY3H9D/F8k97u2jU/hnvcsjCgPvJkeehnKg3NF58yxcocU6wks0LNQeP1HanK1vmIhSESdvUBHNRxx0hkOc9O9MoOdALYjCrY9RFT4FeOd5oq7g1nV2Dng6BA9IV0c+A9Te/IvvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788192499; c=relaxed/simple;
	bh=UmS+Y8EHGYdZm3il/1GKD/s6a3f3J8OBYpQA7/B897A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pGbsrKOKEhOlm6tqIuMPl0kvaFTLgyscvcQztNYVrY03kIKgVqZX3Utj6t5thynAD4z6a13Ac3xYxxKLxmPpcQrQkwGXwDBzW4LVXjD/FJz6SSEBqG0NubyJm5cAbY45UXxOl0LJnsIzkIJ3xO0IfBNSN+TQY982FwBWts8Z2Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XD/4TWH4; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XD/4TWH4"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so3395746f8f.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Aug 2026 09:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788192496; x=1788797296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jPvwlP4rGOO2+Pk+QMwFAR8MHWtVs+GCtUx09ytGEmc=;
        b=XD/4TWH4sQEuGJMsc3ysZWFAwA5qqwcJQXxRY0crFpDXZCtxwCc/KMaQ8aMgxipeCc
         l4Y5z0a5oAZhl3/PyvLPu5Rf/ZXrntz2iUq+IXPOzkvCK6RnZjsoJk3opguMJXXfoG4I
         Lp+3FKunYr3mbYR4pIteLdqUjzHrN0WaQiykUw4zZzjsxcYO6lxTt7PS7O7yGp9ac0Xg
         srgwoXotuCS7RN3hHfaWAqbSDx9I70dhseu8Jeb3x4Go5KjyXYo7OpZZ9VF2w9lUoMzE
         OYQmoRLYNw6yYKpcGBfr/gnjxS19IvImcXq/yu/Z30t1WfLMeNBosdjKK2I0TxEo6xT+
         fxZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788192496; x=1788797296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jPvwlP4rGOO2+Pk+QMwFAR8MHWtVs+GCtUx09ytGEmc=;
        b=pNQZq7Mf3gvwgNRb0UHs8oYJ3IHdKHU+JjLT3+9yb6+P8A+8r+zahN6CB3lBzfHFWj
         D4RjdCHZW0tFzjKVxWBbikqXAzYMSJHkINmQ5vFF0S+IR8qtpP4CqkhlPK9YGa3VqZ9E
         cKOTa0FZI1j1VM7UETb1dH0ui+BVZsQXdGy4OV6pmpup+DH7+qrCDAfa7ursniXyPkpg
         tH6aO3ayIImIWXYQMBjSZSWLcaajb55qE4VXxvu1QO1yb8CXIvcax/y/fzJTRdcJTSoh
         e7a9PuKDAddmCSSvD7GvxinoXrblqwu7ExOrvMR4VlxUpXuvQUQjtDi7thvyihcmTsH/
         YQbg==
X-Forwarded-Encrypted: i=1; AKwUvBzog/Y9C8iuq+0ZQn2BMw+dPfFd5eMtK+1pJ3bUvqXOH5sYgiV1w/TOLkkIXvrJkxjLvszKhXXLm4frEQTzD69NMr+I@vger.kernel.org
X-Gm-Message-State: AFuF++kHA8WGOXBlHliMZ06sdSOu58cicK/gsSHsWpHpaW8Xyq9yD0um
	N/0i2h07ltkIL8fTpBjy171X+IG8drKrbFXPOg0v60gEfm7J3fCQqnWp
X-Gm-Gg: AYBFou0Hrmn82xQxMpv1STkIyQ0Oq0yIyTouSH2A4li1OKoE6fHlmG8TeIZtcQ2h5yG
	J2+DssRYh7j4h6EKXdNwLTzQimK7hCxEmBhjwsPb/B/xxJzPUbZITMIJd0MBphE0LGy6wBf3jO8
	E60vDXZDWemUxQkJr5+20YH2oM3W22M5YpK3KJFKCWGoJN1SYg9CXR2gEl4N3p2nc9T9NNkqm4o
	ZhWK6OjG1KmeC1KlOcucDcXj6M+O0pxs/CufDcYKTAdrxz92oOdAqv8Mu1VpOpxGfwo9/InPjrO
	sP/vDE++B/etgDsppWL+G84NIqL7UJ6okgBktjHrsskWdg3AxJBxcgi3kY2R032ypywsA1xZXFZ
	oTyk29Y/W3NG38xqjLkAmdrNe9UvB875tQZ2ZEIAmKNfGUci+EtYKLecwHT+OnNP+q6VEu+C4y5
	f5QVJqCWZcZga8r9P16IxcjP+3coQpfggy1f4jMkbcE8ch+BCZk5+lwV/q
X-Received: by 2002:a05:6000:2890:b0:484:3311:3176 with SMTP id ffacd0b85a97d-48433113230mr21848864f8f.23.1788192494991;
        Mon, 31 Aug 2026 09:08:14 -0700 (PDT)
Received: from TC-LAPTOP ([2a01:e0a:b8a:2610:ccbd:b529:37d3:c1b8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f3asm23849760f8f.3.2026.08.31.09.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 09:08:14 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hansg@kernel.org,
	lee@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v10 8/8] media: ov8858: add ACPI device ID INT3477
Date: Mon, 31 Aug 2026 18:07:54 +0200
Message-ID: <20260831160754.9857-9-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831160754.9857-1-tchatard@gmail.com>
References: <20260831160754.9857-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Omnivision OV8858 appears in ACPI firmware under the HID INT3477 on
Intel IPU3-based platforms such as the Dell Latitude 5285 2-in-1. Add
INT3477 to the ACPI match table so the driver binds when instantiated by
ipu_bridge.

Assisted-by: Claude Code:claude-opus-4-8
Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/media/i2c/ov8858.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 3f45f7fab..f0148c1f2 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -1981,11 +1981,18 @@ static const struct of_device_id ov8858_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, ov8858_of_match);
 
+static const struct acpi_device_id ov8858_acpi_ids[] = {
+	{ .id = "INT3477" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(acpi, ov8858_acpi_ids);
+
 static struct i2c_driver ov8858_i2c_driver = {
 	.driver = {
 		.name = "ov8858",
 		.pm = &ov8858_pm_ops,
 		.of_match_table = ov8858_of_match,
+		.acpi_match_table = ov8858_acpi_ids,
 	},
 	.probe		= ov8858_probe,
 	.remove		= ov8858_remove,
-- 
2.53.0

