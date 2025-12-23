Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF073002DD
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Dec 2025 19:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766516955; cv=none; b=SqXQ1i4zV/6tNwi3+sJLYKqbBDnrqFhBrsrp+T0hmdw3I0xAHvFtvU1O6AEF9xzh2pHLHGZzRbYzVO8CxrzeNurR/OaJ0RiKVxKV505+tgCfHZhWOHyCtilt3iL1nh4U3R81YYYYits3TPcYbXKUbu0Q4l7OzFNVHEeaCEnz2Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766516955; c=relaxed/simple;
	bh=IuW3ft2k35MAniwOYCLe7MFi00Zud8YNij77x8jy8Q8=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Re974Q7BNZ9SuOXFRZrPyTDct4pr7I+JWHC8bIX8wCt1nZVNUVMukNiH7PGF/eem42KZ2E90Wu/1b2KsQ8JnkxjFl+mSwLIkbFSzEPZbUPsaeO8xIirFJum+OAheE0Hput+7rTYKzYBDCckzkh/drZJgjSTAfn/C3CL+J0zfGGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZSpGHVVQ; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZSpGHVVQ"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-37bbb36c990so55275121fa.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Dec 2025 11:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766516951; x=1767121751; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XIl8aapFfoVEdVThyT8e/W+2bxVCSeI46Ht9h2+xOy0=;
        b=ZSpGHVVQKveqWM1d3DPa+9tOJ0OfW9xvn819qnFM9iuLCTh3ha0SZ15JwNVpdYTyYk
         3JZhvLMX31zBUaaezMuwx+xL4gSHpJozuCy2Cwqs4Xew/lFII+fIBwzZbvWeGJVrsJ5T
         +4SwJYyEGYyzxotHEN/Xy7YEaR2O6yuAXNqca31nn7VWMr8ASfRhp1KzqJqikl5vgwT5
         Q4VUJHDSk4KceMJ/IJrKxpDcRZ9NKUJhjxtv7dq1aPnBCgexrjiMe7q43ielrulUKYWA
         W7WxERPynPQkQVO9lI5SXji6RM6nKprJKvjffY/OenMRCDR9Y1kHX+Hx+Uaz8xsg9yej
         YBgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766516951; x=1767121751;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XIl8aapFfoVEdVThyT8e/W+2bxVCSeI46Ht9h2+xOy0=;
        b=NdNz3roE71FL0Odq1erP4e8nk7OLI8wI1+dv2HcG6pi1+TxupIC2d7weyF+RIGj/9B
         uvVwxzubWsX9HaJVFogewgSL5urqAuPV2Y9YsuUpFOMCb1lJyR8K9O69SiSA/5HcKsB/
         XMlH0NPrgAdcWGdmMMVGk8tlg6F3Arv7eEf4MTa0rrO0U1P1rzYVO9t8a4Igk+8aaTTF
         kfYS3GkSgltWDrnEno8sg/CG/1GDw+yCOW/dfutC4pP0RulNrfJ/icvkPRHZvPEVgqBr
         SvbfTflREFrDq1piQ8jO7RA8a1P7Sb3WtWcN43CWPd/aQE9SXj5EwtUmnhaF9SY9sVUh
         7SUw==
X-Gm-Message-State: AOJu0YxzpgQgGNJhtWjztGV/iwXLZGnVhSLVWkIDKYfD5r+VaxlqtW0d
	dclaKX7JRKNci+yN8h4awIvatRqrz3iKmkWKj5E0dlWVf19dghm/yrHAoCswPHDURKItpd96BFz
	QAAS3H4jLxDeIVhKE4qZnaJOiFB5v9UbsCqc9
X-Gm-Gg: AY/fxX5Xqqlcaw779CTruUkps7CLYh/qk0mCO3AjZNb9Iy6w0yIOADUZ4YlzeCIf2JR
	kaglWdejdLSUtJFERUkiwKVdtcWkwrh7Y5QcCFZosZXOnBqdnc6Ds6iZk+cOkXkzgbmCABTyXdh
	vNEaQ9/BzrQq3sMfhrWsytMMWQWPYeN7Gb8YjtZ0QMnLp/jmQGpT0FLNwuDW5i6QGTN4OpKHuNq
	JgfPJqd6PijHVflofXhZISotmtHEWB7JjM/1JqXSm0iwo0frXZ5luFzl9rw3BDnbTpMv0U=
X-Google-Smtp-Source: AGHT+IG50jCqDcc+09CUBzFysbZE24F89loG98D+eTbZ+Rh8F1oRwnVm6cmIaHVxkFdS1T6W0HprE1VUB9zgqANsL5k=
X-Received: by 2002:a05:651c:1506:b0:378:f3b6:f762 with SMTP id
 38308e7fff4ca-3812079a3c5mr47998221fa.8.1766516950815; Tue, 23 Dec 2025
 11:09:10 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Dec 2025 19:09:10 +0000
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Dec 2025 19:09:10 +0000
From: Benjamin Philip <benjamin.philip495@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251223190844.944633-1-benjamin.philip495@gmail.com>
References: <20251223190844.944633-1-benjamin.philip495@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 23 Dec 2025 19:09:10 +0000
X-Gm-Features: AQt7F2pdChlIABaEam7Pbv2m9UnG_RUTxsdPD1KEgOLCN-87dkHEH3bqZ6twFjg
Message-ID: <CAMEXYWdAzVQyiPaHnYgRsx70uJMLxD4rYbORg4VqXjq0tq7gMw@mail.gmail.com>
Subject: [PATCH 1/5] platform/x86: think-lmi: Clean up types in headers
To: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Benjamin Philip <benjamin.philip495@gmail.com>
Content-Type: text/plain; charset="UTF-8"

This commit replaces the uint32_t standard type with preferred u32
kernel type, fixing the following checkpatch check:

CHECK: Prefer kernel type 'u32' over 'uint32_t'

Signed-off-by: Benjamin Philip <benjamin.philip495@gmail.com>
---
 drivers/platform/x86/lenovo/think-lmi.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/lenovo/think-lmi.h
b/drivers/platform/x86/lenovo/think-lmi.h
index 017644323d46..6ea4bceafab2 100644
--- a/drivers/platform/x86/lenovo/think-lmi.h
+++ b/drivers/platform/x86/lenovo/think-lmi.h
@@ -58,19 +58,19 @@ struct tlmi_cert_guids {
 #define TLMI_PWDCFG_MODE_MULTICERT 3

 struct tlmi_pwdcfg_core {
-	uint32_t password_mode;
-	uint32_t password_state;
-	uint32_t min_length;
-	uint32_t max_length;
-	uint32_t supported_encodings;
-	uint32_t supported_keyboard;
+	u32 password_mode;
+	u32 password_state;
+	u32 min_length;
+	u32 max_length;
+	u32 supported_encodings;
+	u32 supported_keyboard;
 };

 struct tlmi_pwdcfg_ext {
-	uint32_t hdd_user_password;
-	uint32_t hdd_master_password;
-	uint32_t nvme_user_password;
-	uint32_t nvme_master_password;
+	u32 hdd_user_password;
+	u32 hdd_master_password;
+	u32 nvme_user_password;
+	u32 nvme_master_password;
 };

 struct tlmi_pwdcfg {
-- 
2.52.0
