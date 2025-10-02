Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A20930FF3B
	for <platform-driver-x86@vger.kernel.org>; Thu,  2 Oct 2025 11:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759404854; cv=none; b=W7fokbd4NrA79pA5WOm2i+pzWg+59ap5LFULMPjno1YJ2oHM7ZySEsVjOy3hOmETYaOO2mwC5ihRLbqYbNFHNJ0kiIVImlZWnFWYyMKXQO9lmQrtfMnvIbHcqEXXzeIfajzxlgHVQF4jJ3a0hxup5uxIjZZjsnMQBrKD4Wjix4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759404854; c=relaxed/simple;
	bh=joJFsmLC0ahfMOA1xiYAki0VFQaETHltvy6RAJznUm8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fH3s1Pg264+BP4U2lbyjPBD4ZXsFV5z6M2D/3Iu7Mk7G5dj3p181Fbrp5/ILYl8IDRS4mAB74x2DOlt1a7F6K+eRtpXNput2opAcvk5j8IeJf7fE60phnG8KGtA9YFrujwgvJotEyVS8oXOQAFEo7ZyLsHJAYwjik8Eh5K4PsK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--srosek.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AP2/bhB3; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--srosek.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AP2/bhB3"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-634bff4ccc6so995515a12.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 Oct 2025 04:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759404851; x=1760009651; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NE2gdnRWmdJaMiCXgFNZvZRGrqhmc689a8INpdeTYqY=;
        b=AP2/bhB3lfByuFHV3N1Q37yM0KeF3t1eDI2jm37FU4kncOL2xx9i/xlP17bEmMlljM
         t9LnD5kxizrY6xv2PftiAwcckPA+1AlTtzeplwwCP4nQzhpEnugREwhr86RsfBrF/DQz
         xWcHodcigTXCKscQPhJtb4ogrqO53mkZz3KlZSi0/oppXHHI6APB1vxiA2OFQqT/0KxU
         3cLzlGVGQpI/OOXfCGjG9uDoIJCVCrqdBdV7YtSqvbgGiLsC7+VALse5i3URXxNNQcuv
         WDt565QUtP+m8SXRUdMroJUuIqbpr3dUaudPN4iQy30cD8wQCqdkbd5dzfs9YAmY66ob
         38cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759404851; x=1760009651;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NE2gdnRWmdJaMiCXgFNZvZRGrqhmc689a8INpdeTYqY=;
        b=RxJ/woEdUJgcrC7GMsS42L1nC423OcDXj9X9Si8jtFRUtqiYorH8MKof+LVW7CTWLT
         0Bq9XaX9YzTo/4vbig5mLknpzJwDPhSlzvT2hMPl17Hu/68LU8pnkt/X+dd+TLW8Q9ra
         QESbzQ8xFGDtkoQOA1snA5gKwWr6s1VNCh+oDa+WhrXumXBRJJhyYU0oQKqOXuFqCZkE
         bMwWd4+L43N8LVjwzyHzXVlT/RnlE8zmYmnuDktXUlEw0LXWBtjMIDplnUvtsrhUpQa+
         o8j8zC0qX+02eMn5zNt+1PXNuaYiYBT2YYEws932JF+sGMYagds1W2GBXeBGEiOOECQr
         sd4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVY3TWm1AoWO9ayvU46Qvtd7luGLpGu7xUx/EP8fR+hAr4lrAWSOAkfkwYoQW7mGQpEwpMkq5WRHqPCHAbWhItTkoZC@vger.kernel.org
X-Gm-Message-State: AOJu0YxwvpBiu7CIMEdNZn7Uq1OqJT5N6+jAGzZ1Cu2GV0DIIWd4uc6Z
	foi5r+ttNfSGVM8hdOSQfYPhJIxqyrq42P2bJIWD7SUlcxKIchMccTD4kUNOkKzbaH8btJVbKXE
	E0HxsUw==
X-Google-Smtp-Source: AGHT+IFnNGWeUW+2QiI2DEf6id556ZD0ID7jFmIizNY5EI0PMeiFKJnPQbdWshUAr7O6MaAV/CyVGfRtTZo=
X-Received: from edqu5.prod.google.com ([2002:aa7:d885:0:b0:634:b46f:19de])
 (user=srosek job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:3489:b0:634:e004:76fd
 with SMTP id 4fb4d7f45d1cf-63678a9a613mr6778480a12.0.1759404850841; Thu, 02
 Oct 2025 04:34:10 -0700 (PDT)
Date: Thu,  2 Oct 2025 11:34:02 +0000
In-Reply-To: <20251002113404.3117429-1-srosek@google.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251002113404.3117429-1-srosek@google.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251002113404.3117429-5-srosek@google.com>
Subject: [PATCH v3 4/6] ACPI: DPTF: Remove not supported INT340X IDs
From: Slawomir Rosek <srosek@google.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Alex Hung <alexhung@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>, 
	AceLan Kao <acelan.kao@canonical.com>, Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Zhang Rui <rui.zhang@intel.com>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Tomasz Nowicki <tnowicki@google.com>, 
	Stanislaw Kardach <skardach@google.com>, Michal Krawczyk <mikrawczyk@google.com>, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-pm@vger.kernel.org, 
	Slawomir Rosek <srosek@google.com>
Content-Type: text/plain; charset="UTF-8"

Remove not supported INT340X and Wildcat Lake ACPI device IDs
from scan handler.

Fixes: 3230bbfce8a9 ("ACPI: introduce ACPI int340x thermal scan handler")
Fixes: 9cf45756a4b9 ("ACPI: DPTF: Support for Wildcat Lake")
Signed-off-by: Slawomir Rosek <srosek@google.com>
---
 drivers/acpi/dptf/int340x_thermal.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/acpi/dptf/int340x_thermal.c b/drivers/acpi/dptf/int340x_thermal.c
index 26522ddfcbaa..7d1308b1f513 100644
--- a/drivers/acpi/dptf/int340x_thermal.c
+++ b/drivers/acpi/dptf/int340x_thermal.c
@@ -21,12 +21,6 @@ static const struct acpi_device_id int340x_thermal_device_ids[] = {
 	ACPI_INT3406_DEVICE_IDS,
 	ACPI_INT3407_DEVICE_IDS,
 	ACPI_PCH_FIVR_DEVICE_IDS,
-	{"INT3408"},
-	{"INT3409"},
-	{"INT340A"},
-	{"INT340B"},
-	{"INTC10FF"},
-	{"INTC1102"},
 	{""},
 };
 
-- 
2.51.0.618.g983fd99d29-goog

