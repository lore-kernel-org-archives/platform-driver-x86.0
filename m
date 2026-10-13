Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FF73C1F54
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 Oct 2026 15:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904543; cv=none; b=k3ZsncCzhjuwrI8rXczGfIfgDJQ5ods+JGy+MXAqTEUv9S/Kh4sp6sxn5SoF59/exQNpjp+Na1p4EAyG/3U8TvSgTts6ZKdhfHconQvvpMx09Bervp+V3OxaYgcU5IVxy7CJm+iXKekpnLaUcTutMat8VsxGeqZuF8XXRnm3Qt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904543; c=relaxed/simple;
	bh=R+x6yCbTEhg1iCA8UJulcGnJ+nBmRBOkJIUUtKTcu9A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qjG3IGJSvrZPNt0RZXwMZ2kHsrvc3I+iuwKGJ2jAoAILgWJDQo5t1ARgsoX0EAhTqp4Iw2iVyY6P8ad9kSl5Q+sBB/+qwiHOsAjBNzc2WrGJzYipN3YGmFaa2JQC8goaVm5BPilBhwYWOtyAXHU1KnA72Assw3aIgkckdp2B7NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=vHocCCxH; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="vHocCCxH"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so4673072eec.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Oct 2026 08:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1791904541; x=1792509341; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=twoJ2ZpEkiCJSMJ/PObObKqGrhHPIutiqyJXjtqIqUI=;
        b=vHocCCxHqL4nYWc0Wp/pOiBxM5jb1B9v38sgNpb7gK+1BFs3izxeUqvVALMZNcQx0A
         hKVN7ZW8JwZ+r1bU/wkIyXYAkMaXSNKicQwOgcozjXzr6Q2mywdBNdCSoU4QxdxPQtNO
         wTv7hJ3DtuOtWqIuwFZiHxzUlou8SWeib4gJJ+/QIrCedEFfA6/i4uhnCjkRtJ6kSbj3
         DQAHo7KGbAm3dWR8RPF7Q656GiCk+VkzbGruyNe6JJJ+5ODGEjvO3SiBxp7pw28XZkhs
         g38IwHvT1+wU9WCyM348aWfDFpsADq1MjDzYW/juilGzwNuIhXX0DsRJqprdDgWvdb9n
         Htvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904541; x=1792509341;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=twoJ2ZpEkiCJSMJ/PObObKqGrhHPIutiqyJXjtqIqUI=;
        b=SQo/nLKkREu1EIUoLrzNia3HTm6iMvTYhi8PSt7nrygvdH9tlnSvUYW06YMVWTSYgq
         1MyOyjylATBtXBmmsfgByEuCSWJd2CUsxQJ9fV+29Ru1xhIOc7V1Rgg84L+swN+aXO1J
         HcRfX+CRrw5i6p9VF3R0UncuZoaYkFYR7UrS71tQ4b0a1GUL25Y1IceJUPc8rs3JUIRS
         3grOgpLgxX50xnV6z7ZIwsoeSFs6jE90uiesMzfz4x/YSE76TmDZ/R9NjmnCK5E6mov6
         plAymDTbe3ht3lrBPY577Aej1KyR8+zEgB6pYqJmg+wrLL7LG8mNxulV+lc10B6sXgC8
         6UUA==
X-Forwarded-Encrypted: i=1; AKwUvBzE1lSpoqTmQcwwUycPKFRK1ZbMWa7QPnFQ00B8ZKdGDm/gyqJoasoMWv5Bbj87knrnDIHT2v+B9TsStS1C4duAsKLR@vger.kernel.org
X-Gm-Message-State: AFq9FYIgYmPj1e3ejw8dVWtr2BRrVqe65r7uVUHWE17kvccgRoOOL4ov
	ubiFVcutLlYPvQWJ5xDsAxQosluGAZjhE0eTcTLBZk5U3lpVIxpmLptYNPrYRD6QfBP6DcnSXq1
	F79kdbZ0=
X-Gm-Gg: AYBFou3KghxBfpyuMWrmNKhZhtrK3JrNKoAYn0FBheKxYlkjgqIBspE2eJ6N2ZllEAR
	j2oYHPDqvarpQE+NMRKr59TiShYpQ8L+pd7s0R9vFjYr08fupazU/Qujo93rqE4XR+NsXlZM2vU
	4QJyHLLxtVe6X43GwgsHh/5TtLmlwn9OpxCvfi57kdfsDpOAO4MqE4RpdPBTxIV8ViB7f0H1ySQ
	alGJ5jG8XHnKF9ToMdWniUxbpaxcr7NZJtXcZhUP7eeZYAt6iKCojp0SUnJKl4h1hiRBwi5movD
	hy3liFTytq0kSKnOY/8Rm368+pcDGNm4N8C++If9cO3tfN5AMUtX8eQDFscC0SxyB5UmOJ+R6Kp
	rUHOWAa+G20bxvKaWz4vHvciUezAELwU2O90rjYR57/sE7K/NaLWMVHTLcOlb6EISgIHAOe8sYR
	J4+brCeZq5LGV2OesvD7AWoE/o8ZY6sBAA1NQsY/YoIZEvJyvquLlhtCiIJZleayCbIYQ7UNpj5
	iTOVBer1b/WX0s=
X-Received: by 2002:a05:693c:88c6:20b0:359:89b9:5e09 with SMTP id 5a478bee46e88-35989b98cabmr11650319eec.36.1791904540781;
        Tue, 13 Oct 2026 08:15:40 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:49b8:4c98:b3d1:72aa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358de54fe47sm30691751eec.31.2026.10.13.08.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:15:39 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Tue, 13 Oct 2026 16:15:22 +0100
Subject: [PATCH 1/4] Input: keyboard: use named initializers for
 acpi_device_id
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-acpi-input-v1-1-53ad09ba82b7@thegoodpenguin.co.uk>
References: <20261013-acpi-input-v1-0-53ad09ba82b7@thegoodpenguin.co.uk>
In-Reply-To: <20261013-acpi-input-v1-0-53ad09ba82b7@thegoodpenguin.co.uk>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 Nick Dyer <nick@shmanahar.org>, Hans de Goede <hansg@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, platform-driver-x86@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791904532; l=2155;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=R+x6yCbTEhg1iCA8UJulcGnJ+nBmRBOkJIUUtKTcu9A=;
 b=tynwRR07lflfN2Adn7AWs9XuSyVn8FGf9xgL5LPv0Nqj7tPig8HEwG2G+MdLPy08kruyo8R1k
 Ax7l/6Y24inA8KyqOSBwWhD8NCxxp0pAXI+9hTrmm6cz4OOUXMThHXB
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a designated initializer for the acpi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base. Also drop explicitly setting fields to 0
where it is redundant.

Unify the list terminator to have a single space between the brackets and
no trailing comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/input/keyboard/applespi.c        | 2 +-
 drivers/input/keyboard/cros_ec_keyb.c    | 2 +-
 drivers/input/keyboard/goldfish_events.c | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/applespi.c b/drivers/input/keyboard/applespi.c
index b5ff71cd5a70..3d04f54c04e2 100644
--- a/drivers/input/keyboard/applespi.c
+++ b/drivers/input/keyboard/applespi.c
@@ -1904,7 +1904,7 @@ static int applespi_resume(struct device *dev)
 }
 
 static const struct acpi_device_id applespi_acpi_match[] = {
-	{ "APP000D", 0 },
+	{ .id = "APP000D" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, applespi_acpi_match);
diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
index 177e5d4a3382..bbcca6f265b6 100644
--- a/drivers/input/keyboard/cros_ec_keyb.c
+++ b/drivers/input/keyboard/cros_ec_keyb.c
@@ -911,7 +911,7 @@ static void cros_ec_keyb_remove(struct platform_device *pdev)
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id cros_ec_keyb_acpi_match[] = {
-	{ "GOOG0007", true },
+	{ .id = "GOOG0007", .driver_data = true },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, cros_ec_keyb_acpi_match);
diff --git a/drivers/input/keyboard/goldfish_events.c b/drivers/input/keyboard/goldfish_events.c
index 57d435fc5c73..d0e387f22faf 100644
--- a/drivers/input/keyboard/goldfish_events.c
+++ b/drivers/input/keyboard/goldfish_events.c
@@ -179,8 +179,8 @@ MODULE_DEVICE_TABLE(of, goldfish_events_of_match);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id goldfish_events_acpi_match[] = {
-	{ "GFSH0002", 0 },
-	{ },
+	{ .id = "GFSH0002" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, goldfish_events_acpi_match);
 #endif

-- 
2.53.0

