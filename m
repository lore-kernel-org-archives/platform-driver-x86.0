Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4B8382F18
	for <platform-driver-x86@vger.kernel.org>; Fri, 22 May 2026 20:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779482076; cv=none; b=SPm3bvDOyfLwDbw6LOypTGkvJJB+/TFx4WjMQjoW2RUj7UKERcaLEodDth9ueADVUJGP6hDj0D2SSiIajIWr+OWQOKS03Uazf+PeIIxqLW+6GbY0UfGyDxTd9ydVuAYJEcNIFAJ+0b3lBgPxejmPojrniIt1Q/zgptOV3S+VUnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779482076; c=relaxed/simple;
	bh=98j8OHmCC3sLcqbFxkTqdUgv/dL91KYlQ9TZ9Typsgo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rwwU35icWYyuqQh4yxhlbboWG+CILGJ6meCBb9/f4dJ0Bwr7KBW1OrMvgIl4jtRa2FjC6YI4fOyxZQT2pJMWHGavp1dgy+7eqgvSf/cxQmVQuRI/DRTF1U4tXXMw1QNi87pyvvwE+G4hJttDsi0bbrxhQClNzixKmxywSJruCyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pBw3B9Kl; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pBw3B9Kl"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45297094718so6068491f8f.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 22 May 2026 13:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779482074; x=1780086874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ytzT8opOSsALS4pmlE4mtJLYSEho3MC1PNMx2NjloC4=;
        b=pBw3B9KlwfeiSSvv9cUgVfYnFI/jBd1p+RPyMWE9FFHu0GoggKnEg8pHPxBJA+4E18
         DT9dD6oL0fJ3l870yahkF2hCYHnmo/wG4mzE67pAOYcBnSDW0iuc9pS0ZwLe8o9K+P39
         lOf5aIaghJUzWzsEyVvhy9AIyeicnAwpWiOqTSrbDjUWD5WxBIkRHypn2deMw3oCN1JF
         7TZBaDKPoEFbLVHMY1JigvLr9Gu7f9zysbZUzUFRfEo0pb2xxSiS+2usCSc4amGmHNhz
         8F5EX8yd2HEAc29MBVitOmPMbhr/4d6HKvolVox32p8JMzOr3J9MAsVhVjUfc+LGEZwI
         7mxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779482074; x=1780086874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ytzT8opOSsALS4pmlE4mtJLYSEho3MC1PNMx2NjloC4=;
        b=A9NuN/296wu8xkm+hV0it42Cq5N8Oh2756k6kMWOi5DyGvapiTN/nFhDz16jT60Y+u
         FFlDZVWzBOwRwmLexiJ3Zpkfs4DVoNNb8oRLuKTDmWj6PhAgYF1xYkdBUN8iyZhL9HA4
         aExTEUFD5LLeNd2/6i5LhtcBnmOB/qzH9H5V/LIO92Cy7hFMGR16QRGpVl7t4iLNQXg/
         Gi8n3kewsMuLNnDB2LNTbCWQYSsZSRVcQCjV7fD/6uPSrv9JrygDHji5KygdjrSKEj7I
         XzoXQPP+MbNHbWzzZAc4I7NhUoAgARAiHhE8Inm63aJO4BGXK7b5oaEjFxoAY0ChFTmP
         kxKQ==
X-Gm-Message-State: AOJu0YxZRmqkr4s4g2hogNUZnVnLhKRxeWgCblX81rpHPk3ZbL6cai/G
	cQNKd8QjpaE8g/oQ5yDRB0COSgjvr51aEnuiD8W5ddJeN2+zHMtUHIhr
X-Gm-Gg: Acq92OFKZilRrpnmyMbaXl40LQ/EPfZ3H0TRFInCKIX4TeZvgm/b1fQEnVkoDZdxerH
	gC6CPrLxcTWvYetlXUrDvr32cUWqDIv5I/JGjUEwOpRVyf8NFXGjmtGLrLx7xuz59LYLc3ZKWvD
	4WyHjlrmPVefprIilXSjez5PSHc5LH4LVsVt4pyUdlw57LUN9dMtldB34xCzhFjDRt5A2CAHsqG
	FcwWIxrMju0UM0V9jVOnlgc+DSbOt7Kaz4p/O9+Q4GL5dIIbZLg3a0gqWiXbz/WWjxuNDSKweol
	kyca9v43Bx8ZWwPY1nV5/suU8L/EzEr1U/gmwTNesW9rjB33924YsidaZDqSJurj0BVLu6R9qlF
	KTV8fL+EUqWEVcgVBUYj5lPwnhG38b3MKsOZXlN7AjypXsJ9+Yx+1xlvoIjySsmLnz5Psd4EILi
	ygYHo7qYR5wDxV1hN6r0fZ9w==
X-Received: by 2002:a5d:64c2:0:b0:45e:b2b9:705a with SMTP id ffacd0b85a97d-45eb38baf74mr7718147f8f.23.1779482073456;
        Fri, 22 May 2026 13:34:33 -0700 (PDT)
Received: from user ([104.28.162.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d7167dsm6485485f8f.35.2026.05.22.13.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 13:34:33 -0700 (PDT)
From: yoy95104 <yahia.a.abdrabou@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yahia ahmed <yahia.a.abdrabou@gmail.com>
Subject: [PATCH v2] platform/x86: hp-wmi: Add thermal support for board 8B2F
Date: Fri, 22 May 2026 23:34:18 +0300
Message-ID: <20260522203418.28784-1-yahia.a.abdrabou@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: yahia ahmed <yahia.a.abdrabou@gmail.com>

Thank you for you review,I Added thermal support
for board 8B2f by adding the board ID to
victus_s_thermal_profile_boards table and 
I removed the definitions and checked the code 
as per ./scripts/checkpatch.pl and to clarify
i didn't use any AI or tool to make this patch

Signed-off-by: yahia ahmed <yahia.a.abdrabou@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 6950bec2a9d8..581f27204a65 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -253,6 +253,10 @@ static const struct dmi_system_id victus_s_thermal_profile_boards[] __initconst
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D87") },
 		.driver_data = (void *)&victus_s_thermal_params,
 	},
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8B2F") },
+		.driver_data = (void *)&victus_s_thermal_params,
+	},
 	{},
 };
 
2.54.0

