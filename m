Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627218;
	b=YnBZRg3g1h2P0ZRWkp368OOxEj7V6U5d7o78Xg/8iHBfkKIwagcnnaadhcNLZjDxqeSS
	 TnRyckWOOnQuPac6p99R5ja+dEbd+ygMf+lYg902MUQ54t32fbV3lEdYWvnIB7PEW+x3H
	 6rkJ+B3hoNUVX3MZgieKh3buZpOPkJRmD4TTgGqRB07oSyCvTZ/S9FYovdEuw4JmE69Vb
	 egXFsFxWBLHjF3AMD01tRWz8fS8zrGpW8MWje2xbHlQEWwdd3ebrZgqMByci/eQ3OjGRo
	 uqn8oGRn8UjE0nlPxHXJ90Uu8zOC/cYfIcfivWErKyW0zTQyweQqtADoVAtvtIkQhvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627218;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dubg1gFlwLFjUntHBfFzK7AT4OWC46obGwplwmSB/ss=;
	b=eHFf09qLkK3Xq6OTCv4yrdGjXL4Jpryf0rnqfgJLDZnkaPbcP1vbn0SZVYgs4mOSovhP
	 kijxxUwMNium7xz7Czfh3xBZdxE7OvAKLhAYm6ZaI/5GPT21ZQ01FcE26zCOEbsLuH6nZ
	 Jyf7nGTw3wolDK+JP00WioHG+ZOUvTDif3A0Zjtkhs0AfDGzZ3Cei6Fti47H2X5xiBPS+
	 wNVOWHlpU+cMTSu+0KzZquIqSJDpCe09Bdf9Lq/n0+eSx76mW/xAVUfqEIk6NJFl79QNR
	 bEEJvlebgwRPV71iMwEIoLrigfJQHYMf/SRPmpW/rZNgXJ+JjgsU0fyiNUELCMwOGsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Q6+Shkn/";
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8D1606A32C
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Nov 2026 13:46:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC8D1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q6+Shkn/
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso23735865e9.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 02 Nov 2026 05:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793627216; x=1794232016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dubg1gFlwLFjUntHBfFzK7AT4OWC46obGwplwmSB/ss=;
        b=Q6+Shkn/ObJr5jdATQDsyRSPLAb9MySAWl+yJX46CQKajHmZsK/iR0yiIQwuUi8y1J
         9v1QZf3SPv/OiXznYwMqUybwM8VSNfZy96EEl4hAqrzMSwGDlyCLi5unRHhqOymdpMSA
         yC/CjmhNV24dDnOUp7jrBKE1wsR/P6KqoEbo0STcFrMMOM38FZB4kn89Smwww6mXWspa
         8rgzTWjmTWIzabmKmTTBqu3Jig0z76xSvrexbGAZaNosC9cP/MchuajEj9hYb343yGgH
         KSkDgXj2Kb+7dk7qRtR1cUsRy/KLhwlPWtnZG7bHPMSCGjdwZcTgrgHtUiA1m/CgFOBC
         3QmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793627216; x=1794232016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dubg1gFlwLFjUntHBfFzK7AT4OWC46obGwplwmSB/ss=;
        b=Zb2coEoxAdWvRDnsVVcHcUv7mCnavc6DeC8bSgzBvw3GOFx//XOlaFPAgreaUuPdxH
         JoNoAtapDj1Q856hDiVx4Gi7e64MO6QNaKAONd29GlrGvKWE7cJ1CYILK5plZhTPRfwq
         2KbGGdBcir7CfegTdPmzPLAXeOHzhiOGHNa5ykP5t12KSnbnoPL4hhskrKCho7G3HGSg
         HNJ0r3ty1XuvXbYAxlWtd/mkmkgJHoFOKfCnOeexkVVy48jv+zWmHPdKJo+asZMSzFkL
         9QA7PkoFtq5cr/ru1+tDlRJFKz67pYBj3xonFMbfGTbZv2TAbEw7uZ0VMjX2bZat+vTn
         0luA==
X-Forwarded-Encrypted: i=1; AKwUvBwXa0x7qvZRbr+stGsSNUQARmLuoHIeVtfNfBmcRoy3sVu0cHCp7boZT+CkSJh32AR4IyRujk49Qes66gJTknNEmyyC@vger.kernel.org
X-Gm-Message-State: AFq9FYKM10tV+CV0FWD0+c1vUQTzWuV+1KDZOGHzxWG/Aek1MVplAkZ2
	Thydq596Bi+MuZKSJMENeMuaWgyFwqJOvJp+7VXQae8+8rJxk8nxos+yg5YS
X-Gm-Gg: AYBFou3BHVtLXtHU//Hq0rXO/zkKUzq2w5Qi0SB31a+OVRG75HLdlH7fWnGTaHJyHyp
	kQ18c5L4D8T+bzgrFPYAC7Cz1/QLwjGYjAk38ZZh2ED/KboYgV06hN8HTt1FePoOW7FnnjBXisC
	5RaomNOvAAlHdYev9/dNNWCalAbelHGbaVq/0bkOIukkK2RakymGsbGsmDgvStsnPHq2+KZi3f2
	3/qjrRTCVUz6AvXV0EyoMnKrKH2ikm0PBHQY3a62w5C46qB/PJsaamePIMQ+vIHqMNtHzEZrvj1
	wlZ73Nz9gonMFtzcXYxeewchUktfUV2k+rt2MTkokI39eXTy1CerG6aCFIOA9VvW9BvA4VUI2Lr
	wYpqz0rh5GDlDX1DenOnlCggC3+Fc9Fl1DiSRk6ZnLcdkXF/1eUIybPSCMnXhRmr0c3ePAc+B9l
	VzGiIpiNpPo+D0T+lsZxcWzIFzPDhgtH5YpZjAbdFO9x/Y7q4UQiwxlRGWG+jJtud4ZTyivUyL8
	A4IuZYV7ospDcKf3VlfWBKi8NTpepZWJ13c61NMBHCuaFpj6bjrXezPWRMwrQ10mBtSZbmZAw==
X-Received: by 2002:a05:600c:1f94:b0:4a8:f2ad:a9e5 with SMTP id 5b1f17b1804b1-4ac1548f591mr233240795e9.3.1793627216106;
        Mon, 02 Nov 2026 05:46:56 -0800 (PST)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896fesm388643405e9.10.2026.11.02.05.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:46:55 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: jlee@suse.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: marex@denx.de,
	mjg@redhat.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>,
	stable@vger.kernel.org
Subject: [PATCH] platform/x86: acer-wmi: validate ACPI object type in acer_gsensor_event()
Date: Mon,  2 Nov 2026 13:46:54 +0000
Message-ID: <20261102134654.638644-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
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

From: Tristan Madani <tristan@talencesecurity.com>

acer_gsensor_event() accesses the ACPI evaluation result as a package
without first verifying the object type.  If the firmware returns a
non-package type, the code reads package.count and package.elements
from the wrong union member, which can cause a NULL pointer
dereference or read from an invalid address.

Add a type check for ACPI_TYPE_PACKAGE before accessing the package
fields, and validate that each element is ACPI_TYPE_INTEGER before
reading integer.value.

Fixes: 1eb3fe1d3b6b ("ACER: Add support for accelerometer sensor")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/platform/x86/acer-wmi.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 61ae622c93d94..72b44f02a992f 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -2043,7 +2043,12 @@ static int acer_gsensor_event(void)
 	if (ACPI_FAILURE(status))
 		return -1;
 
-	if (out_obj->package.count != 4)
+	if (out_obj->type != ACPI_TYPE_PACKAGE || out_obj->package.count != 4)
+		return -1;
+
+	if (out_obj->package.elements[0].type != ACPI_TYPE_INTEGER ||
+	    out_obj->package.elements[1].type != ACPI_TYPE_INTEGER ||
+	    out_obj->package.elements[2].type != ACPI_TYPE_INTEGER)
 		return -1;
 
 	input_report_abs(acer_wmi_accel_dev, ABS_X,
-- 
2.47.3

