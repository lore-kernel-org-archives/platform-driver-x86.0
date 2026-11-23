Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467969;
	b=c6Nv+CiseW8qIZXuDM0grU5hhY/qJBrVH5hVMBXtz4OSkV7Nd/vgyr6lS6TNp6lDlmPc
	 3rSomVuksLVVkFCTZTXga5QCrjFsLk/6yzeewO2WkMA27YKBW2eD3cDq4LLRwajsge2CT
	 SeMHSQd43k2fgo4lAd3eQqfnIi0TQVpXNeReVAiLan7mxxfQHrnIWsKVuj+McL8wvkWiv
	 Ny14OaJkc1VTsxv8EbAt9sLxKR7M9IgIfSAS3VKb/pTBYwkkskfgjK7QAc6MnfMw/kHdZ
	 FphDZRUfA9EPjCuEba+QOfT4ovYkqaRfTxKxbEIA6iNQUiNwyX10CUqXk9lArTvAMDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8JKTUUZIAz/Cut3RL8r2H2oCBi6ViU2LdrrZpCfbw2E=;
	b=jugW7Q+80pE2GNWIbrg+PRwEBrKqgz8A7fAe7XKZudfHAqmzl00V6oi7xujFYM3N6HfH
	 2JFLl9QDfRmZWZgWMTTURBIlQlGS5UFcE7tn8W5nkjOMRP7XKC0z61JJREHB0JguRe3Rc
	 8o+fvbgqwzPjS8E9gzl3l+BmHNZtTmgvGLGcJuf7ksKDt3EQlBbbxlIsfYz/kI6IRi5Cj
	 A7irba8aaHw4XMX80nNj4RD+FZ87YoAJYOnh80YFEgcNu/8XTwzuyKwJaAjsAGrpeXPjb
	 7r2rwD9rPJGL/xLPch0QF3HLN6LntgM1jJphnUN4603rrQbiK5g4nEdWYQoRbSrRMcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zTEyIUva;
	arc=none smtp.remote-ip=209.85.222.44
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1A9606A33C
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 21:06:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB1A9606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zTEyIUva
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-99e1babd683so2126484241.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 13:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795467968; x=1796072768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8JKTUUZIAz/Cut3RL8r2H2oCBi6ViU2LdrrZpCfbw2E=;
        b=zTEyIUva6U7pvX91Q33j+FyFUCLSkg/KWl/kcKU3hLncciGM61XEYm6P+E/wKpsURh
         C6+B57oEuOQD/h3FJnDkSbWkt9AmE68sWI8jKwn671/3ar4XGr7v9cHQ/75dP3o9fByo
         iUv7e2NcAIi1lpGIdBLTq/PbvC99/oEzvOorPCLgjBFmK+QgWOZX4bwGJI4bwcyjRzoL
         6ggewgdkDt4BXZTJ/VmmMxfbU1i/uS8JcsK9IeRnKhBTlP2K6Kd9BDqoKVJjMwTg45tI
         kjz0iXz3Bav97xzvYgfUZb9dTYNGb2tS3EP4Ra67/gR4keCi+ljT1osAOQ3dSAqIn1g4
         t+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467968; x=1796072768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8JKTUUZIAz/Cut3RL8r2H2oCBi6ViU2LdrrZpCfbw2E=;
        b=NZoKWXC5AeHlxrSdziQvsfwlOLgubbfXZMEPhvHD2jnPToxtDyXbWrlP1IEGiDKlqb
         HuR7tN+xMYqOtVLMnS1ocnbjGnNcYGlFWaeDYWaTNvMLMD0wD+X4OnO1NNuOds8KuTqL
         +fFMKQU/Hqd1RdYBO+mrT8GlS4EAQi/uvAhowKLkQae0j2YoSytbw8iPj7yTZbYnhl8+
         dD4nTPb8fg2UZcaNAlyh1to+9FffgGZncdwCQkaDkEc9+zznZi+L6YHQgLKHjeyilQqp
         4hq4XKvtHAj9G2E/WHi1uJsdExKw2D9a4AZtsWQP4UwCuKIh6JOfeTcTeILVWDtzqBYe
         X0rg==
X-Forwarded-Encrypted: i=1; AL+hErHCPWUxTrMz5WFBIatrNfSFe0Zd65/ndNTZ2Qy5DeGCZItLlJuuSvZVGvZT7w+FkyEYMRWach6U0GCFxfF37tG3Pwn6@vger.kernel.org
X-Gm-Message-State: APuU4Z/tjqEAF2ll+uXYtZP32ikxeZeW26+CNxnPfGhw46QAGe0mAQML
	/nK5jtI7+tFTifT3W5RcjijJ2fIGTMKHLJvvJEoC0Zb4V4k8YSOa/9II
X-Gm-Gg: AZFdTZcw+TkkTU3xuP2+28m5IBG2lmBNoqG/oeFkhzR5ietSOxeKW3B/h2vPH4GG5uT
	u44leo9eIvyU8lDSPkFeK1kVBMqyphbpKTS5PmbgIChM7oXTt3qkTp6IacZrNQz6RbTc9lcRCNC
	V+WOLrhKCSn7LnEIHBL3HqIEeER8iMRQpcxoJoBBC0aSPHu21queYepi3liazhjDdgwtXTSrhY0
	PlGrH5qlalWkRvLj015xd0mxmKAahuxCH/uJwpU6Y374FDMjSTCoHRJakwewqsWzTYOLcF2QJ0H
	udEA38WzuQ+UOf5tTgpLBQ984LPpg6TISytbk7dxTcjZZquwzGP5xHU+wKsyUuMQb6aynOzCUP6
	/XE5yleIlGMua/Zhz5Zx1SLotBEJx+RrSOQ6RrMo7xMinSLkBgmesiys9aj9mmXpQD3lc7GeYAj
	klTP3aBcfXFxeFP4jENqx0UYcg68hm4kNwYPME6OP2+trsFm5Nv2NPfs7CKnVgzP+m9LCs6vq3y
	k5sik7XincvhVLtYo3FswhhmTNSodNRfeelM/gyQxhd9iwyUgXqhpSZARNYFyZTOD6V9Jnmgv9O
	3aZa5uy6zLOHox4BAxVAq0MF
X-Received: by 2002:a05:6102:5794:b0:7c1:62d2:e18a with SMTP id ada2fe7eead31-7d739461a80mr6614391137.16.1795467967755;
        Mon, 23 Nov 2026 13:06:07 -0800 (PST)
Received: from garuda ([187.114.10.31])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e8219b2esm13041769137.9.2026.11.23.13.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 13:06:07 -0800 (PST)
From: Renan Biegelmeyer <renan.biegel@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>,
	platform-driver-x86@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	Renan Biegelmeyer <renan.biegel@gmail.com>
Subject: [PATCH 2/2] platform/x86: uniwill: document the WMI EC fallback
Date: Mon, 23 Nov 2026 18:05:54 -0300
Message-ID: <20261123210554.3357528-3-renan.biegel@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123210554.3357528-1-renan.biegel@gmail.com>
References: <20261123210554.3357528-1-renan.biegel@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document that devices without the INOU0000 ACPI device use the
AcpiTest_MULong WMI interface in read-only mode.

Signed-off-by: Renan Biegelmeyer <renan.biegel@gmail.com>
---
 Documentation/wmi/devices/uniwill-laptop.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/wmi/devices/uniwill-laptop.rst b/Documentation/wmi/devices/uniwill-laptop.rst
index 65583b239..36dad51d3 100644
--- a/Documentation/wmi/devices/uniwill-laptop.rst
+++ b/Documentation/wmi/devices/uniwill-laptop.rst
@@ -191,6 +191,14 @@ Indexed IO with IO ports with a granularity of a single byte can be performed us
 (read) and ``WIOP`` (write) ACPI control methods. Those ACPI methods are unused because they
 provide no benefit when compared to the native IO port access functions provided by the kernel.
 
+EC WMI fallback
+---------------
+
+Some devices do not expose the ``INOU0000`` ACPI device. On those devices the driver falls back to
+the EC WMI interface described in the previous sections (``GetSetULong``, method 4). Because this
+interface is only used for read-only access, the driver exposes the CPU/GPU temperature, fan speed
+and PWM sensors, but none of the features that require writing to the EC.
+
 Special thanks go to github user `pobrn` which developed the
 `qc71_laptop <https://github.com/pobrn/qc71_laptop>`_ driver on which this driver is partly based.
 The same is true for Tuxedo Computers, which developed the
-- 
2.56.1

