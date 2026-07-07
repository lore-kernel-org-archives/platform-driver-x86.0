Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E2B1DC985
	for <platform-driver-x86@vger.kernel.org>; Tue,  7 Jul 2026 20:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783455724; cv=none; b=Td/o/LeGD1KuLbH5rHOz5zHimwAgpYIo2QDJjuurro1YyF2WXksFkiYQN65qaLzmGdQCT+DEsFBbQ0avdd8T8+4OCKZPIrBJUccc5khe6jrV3uSnQkgWzYrgCJQ/DnQyakrkt5SWlZDVpHXeS+ifkFScFXlKJrEmrFvHULdNz0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783455724; c=relaxed/simple;
	bh=+fb2hm/AV+gpBOcwwKZ0VASVGKm3XP6ZLpjp9sYFqfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cy1/9UhbTXU/zAn70Pol8ZzL5jEEtQmxfONQcrsAbr+AzoU1zhidFF4Sd0XtX7lRB10Eov5HDrs1q/m/eFYlH/xCAT4ywjO0SscEgXOHj5KfO4DSgAyDT5hUWW9uBY/RocFRL36dnA6VAUFweV/8JuPCWaGOkGuP9Xp5eBmYFsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rpioySt8; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rpioySt8"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-69a5ecbbfb2so3693159a12.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Jul 2026 13:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783455721; x=1784060521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aWjcO3quzBLPCQpyEkYQryJlDPpxypgV7KUttYaLljc=;
        b=rpioySt8g43amb3wPDAvzV2tjYh9b4Qgl4fCThMAkiYRotEaainWy/SOOSGD04GDPg
         T8IGYvvRYxdsAwqC40w/Pt+bNDcNjEe+JxWaMLm6OF26DuJgyj7IVeSKATgM7mp4cT9E
         wJxkv8V2howT9LDwC6kKkV2pT6PJuakqVgLyuPcKZ8ijvx3anmHzakbjgpJRNbKJTMgG
         yh3BOrfbTjzG0L3Or/DVbPXjY7OX3wKTAxWJeeNH1OxFSytdWVmJFYQsUwgFp1xZ4YQa
         4NrLifDud5PUBiBrmucFvAXHislL24VcDJuPJ7IpFdhbAEbMUAP+Yb7dXeRx7aolsQcq
         Ttxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783455721; x=1784060521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aWjcO3quzBLPCQpyEkYQryJlDPpxypgV7KUttYaLljc=;
        b=P0Wd97+P60Izorq/ivUGQaqWB09eSlDQDFGqthjaxbJpfpwLJ4gysEZDUxZXPweRJo
         Ab+YpOVcPKqp9nYD+W8UVa4baMd3Fu4Irb8r3wiP6FQVfqhiEL1UlN/PyGhqHiePCEcc
         BtZkRZAXBfVtodDnpkgcsGqdRzQvdPTmPsOSU9Y9CQ7gstS84P6TjSKLNmcqI7XkmAjv
         7qzq/dYvK1LXMmUbA7KNKKiuBUv8m9SQWB/B7UKnl8iX0IIw4MhTyGq5edYMRaRbn7kc
         h0NaeEQ7OrmFF1UCebxhRiH1OWY7s1tNEnwP8srKXFt+HkV3yAImekySMoIjJ7dL4pED
         CKMA==
X-Gm-Message-State: AOJu0YyNHYeS3eM30uaY99Ka0ootHrRd5OtRM0Pn/v29l2ehocNTK6j2
	debC1KL3QvM0QP3Khz2GCH2lTi3rMBj3jFGCyOiJJ4hRSj5pYQpjHZm6FMqO4Zvy
X-Gm-Gg: AfdE7cnqiBHxRDrnF7cCNCmYXqbDaKuyZ0Oa5X3phyTLS3McsQS6zFK8WS01yLv1bYc
	OtkQI7bkT7cXPdBasIPzK7/eoGjdOt1QbSiQMQA/AEO4GWleS8UXSKkRwyypHKrwcEsuZcmONmX
	rHxJAqQUn1PCwlHT8V683gj1zG4n+sgLq8Uork4WVjm/66WbIYxlL5N3BcrOpOYiDfLk36i5A/7
	rscEV8ywbosYm73pFbvjog/QdSSEw2eI47B/zyBbQn7ZLb3O4lfjHVuVX5vQYHYASKxxDAxJ090
	dyz0e+qD0btJ+5U0hwEkVnWvlpCyAEYEkBK0i0exdFqEBFH865iX3jvgg17Qf/xuFuvLmcO8scm
	676/waHTlwJLkHjI5bZDXvQtNaGbGNGJ6Hxf+70u4F0li47nbdjzy36bY8mYR9tVciXBSdrk1rP
	WBkv46EPLs1RUFmH3e2yHGVJ6Wt8xvVtljSkLhEgDJeuKGfaC5xe5SpIuIvisTVY4=
X-Received: by 2002:a05:6402:5107:b0:698:b23a:e54a with SMTP id 4fb4d7f45d1cf-69a85c281cdmr3729267a12.31.1783455720810;
        Tue, 07 Jul 2026 13:22:00 -0700 (PDT)
Received: from node ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69aa6dba523sm637930a12.0.2026.07.07.13.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 13:22:00 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com,
	jorge.lopez2@hp.com,
	Thomas.Weissschuh@linutronix.de,
	superm1@kernel.org,
	W_Armin@gmx.de,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH v3 4/4] platform/x86: hp-bioscfg: warn on element type mismatch instead of failing
Date: Wed,  8 Jul 2026 01:21:11 +0500
Message-ID: <20260707202111.35414-5-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260707202111.35414-1-meatuni001@gmail.com>
References: <20260707202111.35414-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hp_populate_enumeration_elements_from_package() returns -EIO and aborts
enumeration of the entire attribute when any single element has an
unexpected ACPI type. This is observed on HP EliteBook 840 G2 when the
BIOS returns malformed ACPI data following a failed WMI query:

  ACPI BIOS Error (bug): AE_AML_BUFFER_LIMIT, Index (0x000000032)
    is beyond end of object (length 0x32)
  ACPI Error: Aborting method \_SB.WMID.WQBE due to previous error
  Error expected type 2 for elem 13, but got type 1 instead
  hp_bioscfg: Returned error 0x3,
    "Invalid command value/Feature not supported"

Aborting immediately discards the attribute entirely.

Warn about the unexpected element type, free the temporary string, skip
the offending element, and continue parsing the remaining package
instead of failing the whole attribute.

Fixes: a34fc329b189 ("platform/x86: hp-bioscfg: bioscfg")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
index 3aa2c440e0528..b834303e5bc79 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
@@ -163,10 +163,11 @@ static int hp_populate_enumeration_elements_from_package(union acpi_object *enum
 
 		/* Check that both expected and read object type match */
 		if (expected_enum_types[eloc] != enum_obj[elem].type) {
-			pr_err("Error expected type %d for elem %d, but got type %d instead\n",
-			       expected_enum_types[eloc], elem, enum_obj[elem].type);
+			pr_warn("Unexpected element type at elem %d: expected %d, got %d, skipping\n",
+				elem, expected_enum_types[eloc], enum_obj[elem].type);
 			kfree(str_value);
-			return -EIO;
+			str_value = NULL;
+			continue;
 		}
 
 		/* Assign appropriate element value to corresponding field */
-- 
2.55.0

