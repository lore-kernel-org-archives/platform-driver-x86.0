Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795648307;
	b=n61ODf14Exmjdju8SJ1OdQOjaYZIWe1I/dsqCmqAGzrJ8+M2g7r3KpjMDklv6VmXuKLg
	 giTbjgrfnaRJrQxLgS3DcvTY2aGjA08PG3DhiGI78D/SbI8L4bsg566ztSdFGMM6pz3tj
	 afGNJGvpbihk0xjHOQCCGCnj/eVmPfZ5oN9RcTSwm0+sdFJEXFLkq/F7FkA86VRf8tY46
	 y/O8HrVS1P+QbqyuOYArFeVXaHOzwCiifTwggkq2K4QYbMBgHAOzLR4l6gJ5vn0X+eo6Q
	 awTaFkJVE1douOPRitzxqoReQ8E34ykZFcKcx3fDxcl8FuZw7pn5mZwBNdLBAd7pntQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=75sbqUsP+m2318CQ2ECdhPXFymfmplFKdqS6I0CgJTE=;
	b=vLaVZceL9UXMak5L39xhRTjGO/EvmegSUe31Xa+U4Z+7r3m+cJWXtpNI+sBlkEsN2LNn
	 qWCk05Qus84RNkb0NYjJOQCkuoVV957ZeNZpxvMTwbcpIfdqqfUkzhPucVeFbEwe5jiBj
	 7hV01wRqbe0M2BaIsRXDZn+mB3TsRLPV/x1luvwRZibCb4664/U338DAp6/xP+H8VrgZb
	 BPWbsZbIgoYpgIKusdXfEFEpW0ERYCayA+ZLL4Db9QyQTpg6viBnmopxeANBnyLecOxUJ
	 srRmkAoFcG49HaYKxPUpcVCkRiHJSoAroc/GQO4/KmC8qmHlGeU/UycVk8Chs1JLH1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GPJDFBMb;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CF5606A335
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 23:11:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0CF5606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GPJDFBMb
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3866a784546so8671865eec.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 15:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795648306; x=1796253106; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=75sbqUsP+m2318CQ2ECdhPXFymfmplFKdqS6I0CgJTE=;
        b=GPJDFBMbMeiyj7qxCpYA9GXPxQow7jA2gZJFIe57tZ3tIXfEZ3YUIuw0UQz/QZ3Qis
         LVE6uTya25ql3mCaQF/2jIVlBe/d/RbkpbQeIjbjE+83pj1/skIeoSEdsJ6FEI0jhThN
         OWqmRlEtfQb5EXAchVI8FuAHHAvQwkuzZea4h1pxjogGfhguBYy4aLSzvky3TBjsvbUP
         P/rrPJTlREKkOkRNAAsmS/BnYYfAxDmZo6YFQ1dckBMg/ligbH8xz5apYndLh96VWYcT
         rxj0rJDWoPTr6K78TEOEyMLJnQYBngIkWu7Q2TR8QDXzlcu8DAZfH65Oapt17n3FeJcb
         2b2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795648306; x=1796253106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=75sbqUsP+m2318CQ2ECdhPXFymfmplFKdqS6I0CgJTE=;
        b=cY9pv2Uhd4jhzdAn4ZIpazL45KJsjuVD0DOdFmYDboeEK8LlHeHdH4y3BXjTzCAjQ0
         i63tSFr4he3TkjKPXZ5iGdi9JcU5wvy5R6O6nnB2P/3y3AX2S3PQZnGHnAVzNpxPGx5f
         Q9R4fiZQoQ8uJlrZmzb4MJdPy8oXQmCNFy33M0ngy+vbFsr3JDPPggSLC1m9Xm1yVstd
         6SRYQCgP51bgiMZGm/DqkAA2biH1LrvoKzxj3FyeNHizx1A1r/S8JZWMn/2C5WrLj/qC
         Xpojh4BWVS//3+iJDibT99JoqEHxkSULM+nJL0hdzOG55eJ183MyK/sNDgjvG5HHQTZp
         /4nQ==
X-Gm-Message-State: APuU4Z9II+sYTZzoBV4LpeaVDsyh43EVKchLAYkguq2SDTzb+eSob+Sl
	QzBylInYvOrGxSUTkHk1BEjrhqmnTZ4ESoYyh80wRuDQo55rWc+3ps+N
X-Gm-Gg: AZFdTZdGpcKxl/KYM/x+v19qrjZ0o2ds5ghurk90PZYFPQPSTTC73RNRjMXciFW7+3E
	F48/MQbdKt/0tMwlgJZFF6TLN/JAiBchw0Gpgs3MQae0H5bFyixIkRjFOIvGdF71dQY2XgNd31+
	S99l03vs7B0KpWeT8OluiYiR+9AyJ34D3hFFid3i9COU5VQBqSjl3NSK4FEHWAASiiOnUQiwbm5
	edLmlHLNF4Fxu001UARuxlmO4mnQI6ffN5qCIFkHAJR1PbWwwaXIA49n8kSyiE4AIgpvb64/bxl
	7Nmyjlwzzri4Jyp29Ivp7zuFEb4wjFAGp2LpxdqzJavom10xdgh39j84i4qXB2pSZ5UOlsC1Bmy
	IQfqJtp9eSmYG2/yNRma9nMBthBjLO6wGdva0EcIszrORyvyZsxQHItP2YmNH4OL5rYNyRTlXvM
	PmJj5mxsr6o+sCAS/848wc8Id6xeczELnHQxEtugD0c3OTPagbjBjL/x7JhcAB5jihvpbL5sE1H
	lTSJ4VHWRHYEW1j9p7+5uopG2n6bOeAnJLpkEkc5RFwi5ZOmLh9dY/SmGUwnwXZx1HyokRxyaPY
	5e/4E3ftjolQF6MYjdDC0K2tvWfZ6wYi1VwClYORXzm69QMOqLBZuEObCxg7lsltla/aP+iCcFQ
	xcPQApptZd8XdYLgong==
X-Received: by 2002:a05:7300:1486:b0:383:6eb6:5730 with SMTP id 5a478bee46e88-38570e24c0fmr23275357eec.32.1795648305896;
        Wed, 25 Nov 2026 15:11:45 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f528:8797:fe51:9f7e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm64430145eec.26.2026.11.25.15.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:11:45 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 25 Nov 2026 15:11:20 -0800
Subject: [PATCH 7/8] platform/x86: thinkpad_acpi: remove unused
 hotkey_poll_active flag
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-thinkpad-acpi-hotkey-poll-v1-7-6dee57519c2e@gmail.com>
References: <20261125-thinkpad-acpi-hotkey-poll-v1-0-6dee57519c2e@gmail.com>
In-Reply-To: <20261125-thinkpad-acpi-hotkey-poll-v1-0-6dee57519c2e@gmail.com>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, Rong Zhang <i@rong.moe>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, 
 ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev

Drop the unused hotkey_poll_active bitfield from tp_features, which has
never been referenced since it was introduced.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 0ebaea0ab96b..898d919d697a 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -377,7 +377,6 @@ static struct {
 	u32 mixer_no_level_control:1;
 	u32 battery_force_primary:1;
 	u32 platform_drv_registered:1;
-	u32 hotkey_poll_active:1;
 	u32 has_adaptive_kbd:1;
 	u32 kbd_lang:1;
 	u32 trackpoint_doubletap_enable:1;

-- 
2.56.1.839.g22a8290db9-goog

