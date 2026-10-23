Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792785569;
	b=AsHoWNK3NwWAFDRXUrgTMt0wL7Iq88zL/okz9HDLclFepHMY7khT8R0kDeHqOFn2l5kK
	 Jbohl7NYnfGoWEg0ck1bsDf9etjuTskPFJFQIInXBituw5eWns+EuWirOKfe84OAu7n4K
	 QrfF6ZRuZ5GCyjhdzcgpJ11udxGfJsZJ0sSDtqO5CaPsJRt/SxiBb5NX5YOnLQqMCRwQm
	 q+ZYM4vChAwBV28Hdq3nhATB5lPQ7mRViaxZysNf8uPEvtBxERTd9D7drDHnoc6xZgWSl
	 NM8TZUKyFW1VOlwXx6mC03zv1jVm6D14D1y0YEnOHhAMVdEALWocXNpNrtUM0rhnkrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792785569;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dubg1gFlwLFjUntHBfFzK7AT4OWC46obGwplwmSB/ss=;
	b=W+MmYf5h6hqXFP41dYilR9Ix8k6Jbk0Xg5p+OxAkXVikxOg3N7NatNZlGm5TcNDJWStf
	 ClS3lt5YOFTQK5SkqBPF5krc/SR5WH3usnbwYdxVKrsNXdlYTCCgFH09EDB9wujdrMO86
	 P79vcsjIhFFDbephw8Y5onpb5jGNlZc/R0Wan3QO1jef+2h7C62IYsI/l/746XOHEOikU
	 ozlF/cRz0bOAhNSYZiAHSuXto46SgdC78iszo4V+9G/x6DsH9VJ6qKw3exAT0xVWxdSJi
	 12ldysEx4zmkXx9R5ux+bpeHoltaUN1IiFco1kKbOqPj/FtVbpZWLNc6vQfrrJnOuRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="E2/f3yHA";
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EA0606A31B
	for <platform-driver-x86@vger.kernel.org>; Fri, 23 Oct 2026 19:59:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20EA0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E2/f3yHA
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso12352035e9.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 23 Oct 2026 12:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792785567; x=1793390367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dubg1gFlwLFjUntHBfFzK7AT4OWC46obGwplwmSB/ss=;
        b=E2/f3yHAM6m0IbyoviLEbfad9IrNmtVeBbDh6YA1AxtThOvKYLp8ovQ5q8wwtGi60O
         BgXsxLo1t+gu8XptqE8IfuyLV6chhKRqTa5D+suRtQS3lUHnRZArbgkuHy4rAktdR0au
         KbCYy8GlDgZUpojaCEZl484mrGDwZcibJ0L2XiUihgTW599oDMBmdWZ7yTHcpFnAlRAE
         BTwHS3OM3xolyVEfLZ/49Efzxnb75j6pRcm2q/BA2bRsTviSYElRky4f4xBs3EwRHZyG
         LSk9+lUwt8WZF0RawHk9i1RMEgkkj03W7UTzUPndV3o9Qnxupsj2h340WS1OMYwtBkU+
         ve4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792785567; x=1793390367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dubg1gFlwLFjUntHBfFzK7AT4OWC46obGwplwmSB/ss=;
        b=i8DoRFBIavXREo/qdAnRJLeNEGLBC7rw0npXakaKm8Iq9uYTX9S3ovll0bcIoqgOqE
         /Pyj+AAK42kK6KcHnLfZXF5JBZlw1lExr88V1WNgnhHhrJjpjiYBG2I4NeBPc8BXs21V
         62Pr3pfmIQjUSGDvM+3g9ygrk0mNgTaaFj4AfoHrb2lzAIQ3WzLctGTQcVKf8D4aZIjV
         OPyA7dUgTaOJ/L+37qQ48MhNp9Ouw67a4oBrqzHwfXKC3b63d69xnK7fAEq1GjOGCacN
         IcV5EjTCh/KgZ9bKFsn/ThPJtr/lF+CkyRsikavZwtX2lzKncTeBzOHdTu16UvD0eUYm
         CF6A==
X-Forwarded-Encrypted: i=1; AKwUvBySRJ8s5YrqPyOIL9tS4t8XzHAIhbh3fH3BUo6+k4fR2x9O7KxXsx5AkJbBkQ0L4yuiIhX9T/i0e6387pgBR8J2Gjvr@vger.kernel.org
X-Gm-Message-State: AFq9FYIu/3F29lwdvq2O68QZK0X0jCyZedOYculZhq/IsoZ4N0svXvA4
	B8B613BLZoneaX//HALYXmC8kbZ80hAj+3zvGRStwf5o+2ncjI3NSE4=
X-Gm-Gg: AYBFou19mp2tHqADpt9C23mFzA48B85hdCi47oMKhOMQe0VQ3/AdrCF6zrs16d5qjU/
	4u6IlZFQAgGYbqPPh9TgNH38aHHSSomxtHoT9UQBGW3GggrgN3GMmG/3GXT5wiFGUoynnjDbjEC
	J+piKuwDZZj+yyJm6Eop4P6H/4MqYGnWEF5pNVhRL98qZLnUrD0J0sE0xgOJoS0FUuIKmBQL1Me
	U+XI7LzoJIUw5V/gb5YitLsPmVlyg0Dvlqx0R/R6zIdEuQZALObB763Eb2GI8fbsawCArOae4D7
	nsHmwiq3siIzVJKGiU+6gUleey/EF3ehhVdqZTF58PrR6c/ro2sTsoBj45cUH1oLvYnGmV2ynYX
	RR5lB1rCTGJxRZ7nP6u25BekUxMGF6rfye6nzz9hPvI7FlN3v/znIkglCH6T5YKD7rsRXLzv+UZ
	lchRiVNd72MsFJuJXjNsMfQ4VBlc5ZBHIMbgYAXRNCl3AddjxQQ1K0QNfpMvhnVSxYonbwsdYb7
	06TV2gSx58I2KZcxeNHklTXbVnCCy0ocJFdAX/Qto22gQ==
X-Received: by 2002:a05:600c:a00b:b0:4a1:706f:b40d with SMTP id 5b1f17b1804b1-4a211c9c5cdmr49065325e9.7.1792785567419;
        Fri, 23 Oct 2026 12:59:27 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0bac37sm5688475e9.6.2026.10.23.12.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 12:59:25 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: "Lee, Chun-Yi" <jlee@suse.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Matthew Garrett <mjg@redhat.com>,
	Marek Vasut <marex@denx.de>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH] platform/x86: acer-wmi: validate ACPI object type in acer_gsensor_event()
Date: Fri, 23 Oct 2026 19:59:25 +0000
Message-ID: <20261023195925.3559887-1-tristmd@gmail.com>
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

