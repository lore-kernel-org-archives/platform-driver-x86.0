Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0297480DCF
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Oct 2026 09:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792143213; cv=none; b=azFFhG8RuWzXOP/S9/c5qiJXc/0VS0sQM1kUS/PrWH9EzvUgwnrSUW6QXIaogr4oxTSXeMbYz8o7cxDnbSxHwlA7eakd84tpbMldklULUbbCQC4I6pmK0hvkZ+lAXu03KOXYe174mUEWf1JAlovfkRUjn1TWeajH36FybWJtfrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792143213; c=relaxed/simple;
	bh=diKVivvG+qd8wFFl1I74SYW8JCNICtK4clPAuT9dBLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PQVFkaGkb6n32l8XuAaE1lQC/6YFXrnQrhSOP9iLwcymuiygasSOJ/aqbO/Mc2hmuJklXR9x8L51d78GRQCTbz7RwpBb0OKIdHJiHlSTH30WzDlA8eXGBENfSqvbvk5GGokhublqAl5aKtVX9up2EMF8xsPsEaZWAtESMsdQPJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mkoIY8Dx; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mkoIY8Dx"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35d7fa491deso818176eec.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 16 Oct 2026 02:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792143210; x=1792748010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X/GQXN80gmDiH2wSRWyxE0rjeZMAPw7yjAOGz6QmUEc=;
        b=mkoIY8DxbzzpROLENPREqJAARWhsLx2Ahzg441vvKD7j/AuD17mVU/h+nF53L2hMdd
         aRzRn44fIXd1OV+bf9CNEZLl7lINPnbV6OIm2z6cWNxTexDaQLquiWUXtRZfCjSzi3oK
         gA4jdg+yJ+iOSxUkuoGIQUM6e59YQI5e6iYjCkLawTPifZDXqFdwBceKVqyrLyCRBJcL
         EbdyVC8gWOHdnLWCgDLD+edaJJiRWXOxqzq0+GypQNod4QqxMwAOcJw2cRmjYXg2p5AP
         9tI6S4JBiDviZgKlFhVT1z1PeRjNCzNVIdEO5yizltYFqMbWv6HT80yvGxsDYUc8577u
         yu0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792143210; x=1792748010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X/GQXN80gmDiH2wSRWyxE0rjeZMAPw7yjAOGz6QmUEc=;
        b=HFbHNp6jrtDmNyITh7h1dZXXN2cVpWJAjb+DecMrrOqH19jW4a6Uk0YJR6ncJF9+sH
         l5eHyx7gUjUPqCxme9H/WlY0S248jN2XP5mHX8EC3vt8/+gpBUmmLrUEpIK8Os9px8Dd
         6lxh4PKJD5OWfohUcuds7Nh8+TZ7GEeg/PCF3pm3cBknInkuEbkV+DOccjcckaxJM9go
         +9nQUgi3ej2KPafY4hlwC5qr1q1ud6npWomPKrbfrTpFUStKukDS9VHyl7b4hhFgJz00
         Zlkh5DAlZf97wX6350m0Aj+u4iKLcP1AiYdAjOMoSu3A3ae9xEvwa4QPqNuBnFLA7Twe
         +iSQ==
X-Gm-Message-State: AFq9FYKHvHAWGNX4sQQRfWmAEaaa/ix0eZbNZU4jZ2GuP6XCbGvbElqV
	1mILI8Bm/Vkb2FheRi1IDllefGHV2KyOH/Lcf878OrGPhFUQuiZdbMzO
X-Gm-Gg: AYBFou3oQxhOjC6t84EtP9nDvseaBqEUTNBuJd6oeHJ0rvhzOC80U8TyrWEqNFeHx8c
	hf2xIqhBT3It8/pgAneDBAO3spib9EafvV11LzjWt86WKCRMzXL51l4ykHY1rusyEPcFnRjEikq
	kXCxh25RU6j0P2RZ4lEDGEgAz+qwbyyQ1CGtPpTsiaZC8Fu3WX4H2hCwwH/HNRMJFOXR+tyTLyr
	Hh5lRBsMQegyB3Xx8fqFoQlc9ND5owayvvFTnWEYo6oV7iLNXqPVDpByRo85DyrqEyioY+y7MSw
	cSJAYV00f5YPq/dV61c6WACrw/t0pW77806KP245dCcHgZ6Bo+t1lVTBNgYEjs7RcK7DlVHuqHu
	0Owy+bpl9nbiN1ENTQlXlEQPjxSmW3T7AxmvJ/JyPQ3Nr7rELgirHyztSJsA0sCc2fg55MCeg5/
	3WFNZCN7E9H/C28LPQ1ABaulvOw/x9Zk9Gw/9qH4Axw885RPfOTsEA73MrxrYtseSgf8MUEOG5Q
	+tKfwO0MD+zKcPZT1rB5PP8xSQ=
X-Received: by 2002:a05:7300:3aa9:b0:360:aeee:9b8a with SMTP id 5a478bee46e88-360aeee9f90mr1700989eec.8.1792143209602;
        Fri, 16 Oct 2026 02:33:29 -0700 (PDT)
Received: from chitransh.. ([2401:4900:9390:ec4c:7580:f3c1:62f7:b0b6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608308a87csm8697922eec.28.2026.10.16.02.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:33:28 -0700 (PDT)
From: chitranshmandhaniya@gmail.com
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chitransh_Mandhaniya@dell.com
Subject: [PATCH v3 0/2] platform/x86: dell-uart-backlight: stray byte recovery and cleanup
Date: Fri, 16 Oct 2026 15:03:00 +0530
Message-ID: <20261016093302.55528-1-chitranshmandhaniya@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261004110333.5790-1-chitranshmandhaniya@gmail.com>
References: <20261004110333.5790-1-chitranshmandhaniya@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>

On some Dell AIO machines the EC occasionally inserts a spurious byte
after the cmd-echo in UART backlight response frames, causing checksum
mismatches and -EIO.

Patch 1 extracts the response parsing into a dell_uart_bl_receive_data()
helper that always returns bytes consumed. The caller checks
dell_bl->status to determine the outcome (-EBUSY = incomplete, 0 =
success, -EIO = error).

Patch 2 adds the stray byte recovery: on checksum mismatch for a fully
received frame, drop the byte at the first payload position, shift data
down, and call the helper again to re-fetch the checksum byte. Total
consumed bytes are tracked and returned to serdev exactly.  Also
switches mutex_init() to devm_mutex_init() to fix a missing
mutex_destroy() on the teardown path (noted by Ilpo during v2 review).

v2 -> v3:
  - Helper always returns bytes consumed, caller checks
    dell_bl->status instead (Ilpo)
  - Track total consumed bytes with a separate variable instead of
    returning len, so serdev gets the exact byte count (Ilpo)
  - Guard resync with resp_idx == resp_len to prevent memmove on
    truncated/out-of-range length field (sashiko.dev via Ilpo)
  - Switch mutex_init() to devm_mutex_init() in patch 2 (Ilpo)

v1 -> v2:
  - Extract dell_uart_bl_receive_data() helper instead of using a
    for-loop with pass counter, call it again after resync (Ilpo)
  - Split into two patches: refactor + feature (Ilpo)

Chitransh Mandhaniya (2):
  platform/x86: dell-uart-backlight: extract dell_uart_bl_receive_data()
    helper
  platform/x86: dell-uart-backlight: recover from stray EC response byte

 .../platform/x86/dell/dell-uart-backlight.c   | 71 ++++++++++++++-----
 1 file changed, 55 insertions(+), 16 deletions(-)

-- 
2.43.0

