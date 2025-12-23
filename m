Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3A42DF13D
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Dec 2025 19:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766517594; cv=none; b=rBrHfybRADnYW+OHu4kJ8QHzGyKej+/XfK6KwbXQHjm62Y+mDjPLEG4lYJ6HyXEzkDdkIbyWGJHaPXr4Da6AwlYx6CxjktNwlv0Z3XyMvsHoizuND79b6RNKpti2rHI0w7xbMHCJeTB44TxfaEDJUpv+Wo5hdxRLTlN+/MqFTJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766517594; c=relaxed/simple;
	bh=IuW3ft2k35MAniwOYCLe7MFi00Zud8YNij77x8jy8Q8=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BwAD7aYmyieA0VBZf2qyyLQKRaXwuF0DdK7fz9XVc3EJeBUawX5MMBQKLGu+g03OkCfYip/1lfk/4qm2I4/XwNy5CHrxy2N3oy62BzOKVylDT42DkyKJE2tq0U14yPBrfMlxGfN/w9eH2lyu19rXJjpny7eitpRO7hZYZYGESL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I0KixlYW; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I0KixlYW"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59a10ef758aso4328686e87.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Dec 2025 11:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766517590; x=1767122390; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XIl8aapFfoVEdVThyT8e/W+2bxVCSeI46Ht9h2+xOy0=;
        b=I0KixlYWqhxKMDxcndrrvB4wM9amAxJ1NKhrtkdoPtu6YovR1P114uN6snZSxcL7ZH
         1Gb+U+M8bCytvDlVGmynlnW3Vhr/6/v/rWmDI/dDIHEMuPxPlj2CNjBLe5YZlV8Rvt9n
         40N378G7tWZ7awhotzZhyZ0aQut1jyT/qeE1MFwRpeMbbVypdGq6BTN8iO5lgJE0Hmah
         GixSkyWQesFUhpRwu6IG1/vapVwbsrLEzSJZba7bya2yIP73dvNxxVoYdqu5uUcZJlgP
         2KuU8YqcXlNDFWpNilOCzJNaeHrqzsnMFbmW7NpwEBc4TW4vKMEUbp6wHOw9N45i46Kn
         UekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766517590; x=1767122390;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XIl8aapFfoVEdVThyT8e/W+2bxVCSeI46Ht9h2+xOy0=;
        b=EflH4WtL9mRLA0aLOCS1+vILstLf0KqOwiyOmsPqXGumNFzcmTs+f7NfQnyqZIQNp5
         QE3WHzr4tizmo9SSyFNXXQwSp6G0yJIelePCWCwLUYNSD7YtGY68zT3lAjI3WLe0EDog
         HOUsZRFzzFMRpwJ6ZeXEDfzvqTDRv7OZ/GghzaqBURcsBU6be2wkMz/SnsYxYItWZ30U
         Wu2qR0Xpp4ES0sbyjOY0V6uR9U0+Jm9F5P3L7nn9cNmt+nrm/95H6HxNKUV2yeAjSdZ3
         tXSrTwVPAZD08tVspr3mukAN5UWrNLjVRpzRPS+IJptuGBEejmUEpYOCPS+KPKF3JODU
         i5xA==
X-Gm-Message-State: AOJu0Yw7LzvQ65ZgmKOUDgScPx/QTP7lz5y9kfj7boRhyufKCFYJKzaO
	KWexAaRAn6xqK+ZqlGpehcAMl0VZEDSkl+nrWlMG8///KAXHRBrdvrc/IuGGJIYyN1/HijaQ+V6
	U46/T3s2jCJ3xnwRszI03elJ4GHTkQnUmMvpW
X-Gm-Gg: AY/fxX5mxV/h0tXCfORnDUrEu2fyAiwOZvqB5Bzof02nklXMJ4eQmvJv9g+srqKmuEo
	CgULKGNX77uvcPdF9gnYKP+8ENXSvmvrZC7jKtYkDikWmqCPC4h169uLrhWEd/18YUwIVIRscdm
	Q7Db/QCOeAN+8qslfNlrKGJiFOfZWS31RmwC+F0EnQovuKGsQGpN5YdTTPvqQHJBTdUoqyHxV6/
	MqAhuIdRNRb6iFjjTESlhhO2EubOwCL+Ztnaj8EvfH0ezK05GAVEtPUcmVvJTC6hYgnWBM=
X-Google-Smtp-Source: AGHT+IHNrBAhAcXdlX8cz2u4uFifVxNE0J6JMW4c7P1T1MksQYe+kl6sV+tNtewCFKz0Iup2HtGcDd3QmCPS7QTv2g8=
X-Received: by 2002:a05:6512:238c:b0:594:768d:c3ef with SMTP id
 2adb3069b0e04-59a17d3c40emr5635200e87.30.1766517590076; Tue, 23 Dec 2025
 11:19:50 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Dec 2025 19:19:49 +0000
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Dec 2025 19:19:49 +0000
From: Benjamin Philip <benjamin.philip495@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <CAMEXYWcY-7Kn8V1EwZ=fUPFWDwnAHEuferY9Ap0zO6xfmXx4JQ@mail.gmail.com>
References: <CAMEXYWcY-7Kn8V1EwZ=fUPFWDwnAHEuferY9Ap0zO6xfmXx4JQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 23 Dec 2025 19:19:49 +0000
X-Gm-Features: AQt7F2oWDdGUzTnndG-Xab99IP6lVMinFR6JUjPvj448_RanV_yjy80doozqAzk
Message-ID: <CAMEXYWech3B+_7__Xo+Fa5OQ+Gu+Mkd4eedb4Ve78E+UuFaeew@mail.gmail.com>
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
