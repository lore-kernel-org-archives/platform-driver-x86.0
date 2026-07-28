Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B419B40DB58
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jul 2026 08:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785227751; cv=none; b=ow0HChT1BxZlpBFiNDvZlF1baSe6f8m6uhYiP16El/o9AsKI6BH3/cSgxD5Ntco4lsCf4/x0z37Un1D7TnLj/EqJvLS6kw6MrPl1UgJcxv4XoC2wi9pbRUBsVYdMRJc5+iH19a/mYdl9aj1BZQyjtIA4BAq4yEDnYk8IeBdWDdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785227751; c=relaxed/simple;
	bh=CJeabC1g2FgI6PjocIi9ETO7Vu8vHmnvi2cZrXun5Sk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n+/yZuCbD6M/aMZ3FeoYTLu5VYG1rhH5Z26sVGP554X8rzSfWOe98bRrcMoNnP5KDXQH/pRoEC7vA0+I4VQiUEXlnCK0j37KrUrL8le1WuKp+IyIskdOjfijAI/bI87E3hxNQYr0fBw6wgbGBNBVqlLgKaILIh7txXggxPLQ1WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jqVS0GUs; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jqVS0GUs"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c15f47e6297so380650366b.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jul 2026 01:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785227741; x=1785832541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4MIVwFv4yKGLnbExdxJEPpCRumbMm8FoU7317bErcVA=;
        b=jqVS0GUskEpqz832OCgSQ9CVIyQ4UGVwCIQ2dFVW5j2x+/JgmTjjEGxnKB0nc0qv15
         AYb48U9MUGFX9Kh3ylo4CFDclTqwdDn4eGq5u8yojsd/KvRdA0XNjmJME3T5KsN+zU8M
         P2l4mW+PmOH8NeG0sm6zi2GgLtoOiqDwC0IRiiK3iTqu360amgNvZR3Zwi+SCUS41vaU
         4EsWreJ/PkXirftdJPnkAUpV5yz9s3WQ1LVmnkqligDPjZN9K9kXCb5ycNDA0Csj94FV
         L3sNBeZ8q7NSbpty/c2axyl9fOLzcMMeCJPik2OhMbl15tzuraLQC69CITBnxbL3aR5T
         wkfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785227741; x=1785832541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4MIVwFv4yKGLnbExdxJEPpCRumbMm8FoU7317bErcVA=;
        b=dwJ1tuKKvQ/BuZXsmi2huNYSPYi5CMX6IEFZyJlAPzfTIrhbQWyLprkVn8v4+R8Uw8
         3oIG0QXjQjwaq2+xQFxA7/x65NXqrbnm7jVpxnZ2Y3LuVrf50ELLh5LMkzusY0CXKUxX
         WBSVT6Nqtc6ctJgIOqyAZvhCtQtsK5ti3b4FmLn9MKDHEZRENBEWjiF1igIaWNnl2KqV
         cAvuqqeYc5QNV47jc22tZqvsMvFbbjKUW3d5PgJ3fuPOlEuHT681OUh1CykgITJh5lP7
         oWqRsJSB0v6aWpd4M4zGA6uOJDJKl6bllAlvLoYq3OKjZO6kMxYU3NXTcCKR+0q7I1hi
         QwUg==
X-Gm-Message-State: AOJu0YxfLJb7RdDbh2K/Srv1lUlYHDNdmIphDaB3GhsB8OnkhIuBQ0ik
	B5oU4BWM8JGjmkVy9JB6i1W1WLCQCgv43Xnt9G7Yw6h+C+iZ92Um/UC0Rpf+VT4KJ5Q=
X-Gm-Gg: AR+sD10y0AcFkYadGVtfZDgMPkrGN5TDbdBzp9/jLCPmTMOND1UqxFFw+cEakrjYIVu
	UGK2Qs5LPvz9ywoTMCl4lAhmRRhShkliuT3MozlP44xE9jkeHNG6UhwqMWNUsAJDndg8mhWtJ0W
	T1/Nw00jV/MnQVgIRoC47eGNXUL6Jn6fKFK67VMpVLmICuD/8Lm2EWAdUxGdSiAKGR0mUDf7Kib
	ca2FjbKABRZSRzM5v3XURAklIzmPqeNFy2KeJixZl1fZeUuYLMLbtI4fWzwG2Ub9+TO0VsAyWoC
	0hhpPJAP9zLET44Jt1+iw8ig4HC0VMptZkioqRqI8SnHahVtKLDeFD0NPEpqhVThRBoG0K26AtJ
	5/QZqNXikd43BFiWLgV5JjnkGYP4K58js4+Sg8SfMH1cVjk+P2rGodRmp1SLkg4GFpX8K1gZ164
	S2Vbg=
X-Received: by 2002:a17:906:6204:b0:c12:34f0:f7b9 with SMTP id a640c23a62f3a-c1f724882efmr68361066b.56.1785227741019;
        Tue, 28 Jul 2026 01:35:41 -0700 (PDT)
Received: from fedora (yeal.ru. [94.103.95.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f19ad49f1sm353753266b.1.2026.07.28.01.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 01:35:40 -0700 (PDT)
From: Alexander Egorov <begeebe@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	lkml@antheas.dev,
	derekjohn.clark@gmail.com,
	samsagax@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] platform/x86: oxpec: Distinguish OneXPlayer Super X board
Date: Tue, 28 Jul 2026 11:35:28 +0300
Message-ID: <20260728083529.329772-2-begeebe@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260728083529.329772-1-begeebe@gmail.com>
References: <20260727215947.118292-1-begeebe@gmail.com>
 <20260728083529.329772-1-begeebe@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Super X currently shares the oxp_g1_a board identifier because its
existing EC functionality matches the G1 AMD.

Give it a dedicated identifier so model-specific functionality can be
selected without also enabling it on the G1. Preserve the existing G1
AMD behavior for the new identifier.

Assisted-by: Codex:gpt-5.6
Signed-off-by: Alexander Egorov <begeebe@gmail.com>
---
 drivers/platform/x86/oxpec.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/oxpec.c b/drivers/platform/x86/oxpec.c
index 99c0dfc..df29e41 100644
--- a/drivers/platform/x86/oxpec.c
+++ b/drivers/platform/x86/oxpec.c
@@ -50,6 +50,7 @@ enum oxp_board {
 	oxp_x1,
 	oxp_g1_i,
 	oxp_g1_a,
+	oxp_super_x,
 };
 
 static enum oxp_board board;
@@ -210,7 +211,7 @@ static const struct dmi_system_id dmi_table[] = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER SUPER X"),
 		},
-		.driver_data = (void *)oxp_g1_a,
+		.driver_data = (void *)oxp_super_x,
 	},
 	{
 		.matches = {
@@ -345,6 +346,7 @@ static umode_t tt_toggle_is_visible(struct kobject *kobj,
 	case oxp_x1:
 	case oxp_g1_i:
 	case oxp_g1_a:
+	case oxp_super_x:
 		return attr->mode;
 	default:
 		break;
@@ -374,6 +376,7 @@ static ssize_t tt_toggle_store(struct device *dev,
 	case oxp_fly:
 	case oxp_mini_amd_pro:
 	case oxp_g1_a:
+	case oxp_super_x:
 		reg = OXP_TURBO_SWITCH_REG;
 		mask = OXP_TURBO_TAKE_VAL;
 		break;
@@ -420,6 +423,7 @@ static ssize_t tt_toggle_show(struct device *dev,
 	case oxp_fly:
 	case oxp_mini_amd_pro:
 	case oxp_g1_a:
+	case oxp_super_x:
 		reg = OXP_TURBO_SWITCH_REG;
 		mask = OXP_TURBO_TAKE_VAL;
 		break;
@@ -516,6 +520,7 @@ static bool oxp_psy_ext_supported(void)
 	case oxp_x1:
 	case oxp_g1_i:
 	case oxp_g1_a:
+	case oxp_super_x:
 	case oxp_fly:
 		return true;
 	default:
@@ -649,6 +654,7 @@ static int oxp_pwm_enable(void)
 	case oxp_x1:
 	case oxp_g1_i:
 	case oxp_g1_a:
+	case oxp_super_x:
 		return write_to_ec(OXP_SENSOR_PWM_ENABLE_REG, PWM_MODE_MANUAL);
 	default:
 		return -EINVAL;
@@ -669,6 +675,7 @@ static int oxp_pwm_disable(void)
 	case oxp_x1:
 	case oxp_g1_i:
 	case oxp_g1_a:
+	case oxp_super_x:
 		return write_to_ec(OXP_SENSOR_PWM_ENABLE_REG, PWM_MODE_AUTO);
 	default:
 		return -EINVAL;
@@ -689,6 +696,7 @@ static int oxp_pwm_read(long *val)
 	case oxp_x1:
 	case oxp_g1_i:
 	case oxp_g1_a:
+	case oxp_super_x:
 		return read_from_ec(OXP_SENSOR_PWM_ENABLE_REG, 1, val);
 	default:
 		return -EOPNOTSUPP;
@@ -725,6 +733,7 @@ static int oxp_pwm_fan_speed(long *val)
 	case oxp_mini_amd_a07:
 	case oxp_mini_amd_pro:
 	case oxp_g1_a:
+	case oxp_super_x:
 		return read_from_ec(OXP_SENSOR_FAN_REG, 2, val);
 	default:
 		return -EOPNOTSUPP;
@@ -757,6 +766,7 @@ static int oxp_pwm_input_write(long val)
 	case oxp_fly:
 	case oxp_mini_amd_pro:
 	case oxp_g1_a:
+	case oxp_super_x:
 		return write_to_ec(OXP_SENSOR_PWM_REG, val);
 	default:
 		return -EOPNOTSUPP;
@@ -796,6 +806,7 @@ static int oxp_pwm_input_read(long *val)
 	case oxp_fly:
 	case oxp_mini_amd_pro:
 	case oxp_g1_a:
+	case oxp_super_x:
 	default:
 		ret = read_from_ec(OXP_SENSOR_PWM_REG, 1, val);
 		if (ret)
-- 
2.55.0

