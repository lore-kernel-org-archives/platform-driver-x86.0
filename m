Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D959235028C
	for <platform-driver-x86@vger.kernel.org>; Sun, 12 Jul 2026 19:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783883506; cv=none; b=oWEnANlXWlRaHE33xZCkLgryODdnfIDIBfAGmo37J1CZkiYp6RWi2e5X65Hkrx+i3xw9MqF4875KYV553DFcR1Bvpdw6AKSbCmVE0Kum3/h54ptjbc0QqFMuxMhjjvaTBDWtltJs98hR4wj4JAG/dO2vgosz01JvQbB9ky1yA3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783883506; c=relaxed/simple;
	bh=POqHg5+6FWKBHhxsSFHPz7vmFEMFQNpNVx9ZCJ19P5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VBojFrF9CmmKuMLBT4lxe1ecqcW3NKGQaugpWbndgfzldVQTcTM/XlVOyWUtb0iFh3yglH2fIWvUyJ8doipFFKl+HkfYy/c3/oIAYT/Z8fnbbAZcY9SkbO7qTuWl2WeVCJTlukmouP7btSX3pH7o7kE23wFnGIriNeuazolzziw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D5v6Q8oV; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D5v6Q8oV"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493bb510ce4so16937655e9.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Jul 2026 12:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783883503; x=1784488303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ZqdQnLuciQkDjKm6+RHNAdLrIUgwZYe5nj6dP1Jgt8=;
        b=D5v6Q8oVpR6fBSb1AqsOKaw/IppF+95DcxdToou0puxn+ie2HwcglmVaXimIiZK0Jt
         vnRDcaOOftrNQaBMydoEsxDY51MwLP7CngqwzwsmXWdr8lZyguiWWRREFSTWMoEf+mg3
         TB+JzKrSXY602l+0XmKJNdj917HOTdXiIko0upErFnVN1/ZW4vW8JnyLu55dQwNiNv+b
         2t/+tt3+K6zWmyn5Bz9+jZfZwTPh1SfRCb7XW2h3/TWtb4e/3RAn2Bq3Y+gwcViDCJXN
         +6wOxPif8Ty7i7Lthpsewg43ac5PhSpgAe0mHs4V9f4nGWWkLvbORi/GAN+cQCyFRZBd
         dDtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783883503; x=1784488303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1ZqdQnLuciQkDjKm6+RHNAdLrIUgwZYe5nj6dP1Jgt8=;
        b=IKDhznI4RuFJLl2u1E6vekcMKGa8u9w7bmJmSIT5RC1MCbuhXNfSg0c1Sj2F6FtnDH
         WcPk8wUABHPN+xzT8R6m7Oj0+5koCfsFUsTvtQmlUbf4cUpcyIDBnHrgjkdOVbW19Usy
         x/oafmaZ1J7ltFbAyphUjlr93epUHkPsBtMefJPJXOcDfNtdX8DMPVZpoenSH3Zzn+M7
         bsCiMdDAJ3E9k/HclyQNHGwfkiW5ky8JZ3syYmCRANOoOaqrZ5s8Gb+CLNGWgT+WlVUv
         qpry68yTE8Hw0nKN8fkKC+C84dtd6Lo9EmQ2umNHMKbTObWvWoUCMdpy3BHWG8RRBx+g
         3oLw==
X-Gm-Message-State: AOJu0YyZl9fa47spG/FKxlcgaJUM3RIBS7rWStzYx3JYrU4KcdTxcw6t
	gspJuzbH3lRicKETmOcY13FmfWdu9NOJIMjWDmHTP/c6kjijmINIPsfkvNqYQQ==
X-Gm-Gg: AfdE7cmc43bi1rnuCFXC51IIY2C4udMFjn87/FvodcostXgy1sYPM4ZPiJiv8qBKYKX
	7x2ytMFKM8fumAoWggHL0iKlkFpuYqOKmIJFWc27XCJrWuXxNbKpcPBDm0v+wvjeGkEBAZv4Goz
	3347UJdaT7t3ZtEdLn0N2YOvLIXGNhq24DVXXsof3QePNC+ig4kTejfNxEE6BBe3XdXOriHt0os
	1p98QYW5PEn5kTxYbskazPuc+ZNOkCyV/MJy07MrFHSOvgUsVQY6PjHX4TxEdVfsNtzu7FaqJXS
	MwdILznOQbpCuQRlfk86iCmrmAEls7hxU40DrtR7x7h+91OW1XkRyskzTEyKbZPBRnt3uBzcAiT
	oFezP6UlnaF0A0pIThnZ2puijVJV012QE3PBBicEHhgIyVx4PeD71NAoBh8bHxYnQZUqSNHj0ZC
	ct4+uFINLB2LJVLg==
X-Received: by 2002:a05:600c:b90:b0:493:e365:ace9 with SMTP id 5b1f17b1804b1-493f87e4cfamr62389725e9.11.1783883502871;
        Sun, 12 Jul 2026 12:11:42 -0700 (PDT)
Received: from user ([197.197.151.111])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2a2e499sm234468265e9.0.2026.07.12.12.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 12:11:42 -0700 (PDT)
From: yahia <yahia.a.abdrabou@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	yahia ahmed <yahia.a.abdrabou@gmail.com>,
	sashiko-bot@kernel.org
Subject: [PATCH 2/3] hp-wmi: fix potential integer underflow
Date: Sun, 12 Jul 2026 22:11:29 +0300
Message-ID: <20260712191130.41183-3-yahia.a.abdrabou@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260712191130.41183-1-yahia.a.abdrabou@gmail.com>
References: <20260712191130.41183-1-yahia.a.abdrabou@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: yahia ahmed <yahia.a.abdrabou@gmail.com>

hp_wmi_query_perform() currently calculates the output size of the
returned buffer by subtracting the size of bios_return from the length
sent, However if a malicious bios or a new bios not yet tracked or
handled sends a length smaller than the size of bios_return, the
calculation will underflow, then the result will be casted to a signed
integer, as such the min() function will fail to set the size properly
leading to a huge number to be passed to memcpy.

Fix this by adding a check to ensure if the length returned by the bios
is larger than bios_return.

Reported-by: sashiko-bot@kernel.org
Link: https://sashiko.dev/#/patchset/20260706143855.35002-1-yahia.a.abdrabou%40gmail.com
Fixes: d35c9a029a73 ("platform/x86: hp-wmi: Don't log a warning on HPWMI_RET_UNKNOWN_COMMAND errors")
Signed-off-by: yahia ahmed <yahia.a.abdrabou@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index c924fbb5503f..3235ade2fa98 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -634,6 +634,10 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
 	if (!outsize)
 		return ret;
 
+	if (obj->buffer.length < sizeof(*bios_return)) {
+		pr_warn("Bios returned invalid data");
+		return -EINVAL;
+	}
 	actual_outsize = min(outsize, (int)(obj->buffer.length - sizeof(*bios_return)));
 	memcpy(buffer, obj->buffer.pointer + sizeof(*bios_return), actual_outsize);
 	memset(buffer + actual_outsize, 0, outsize - actual_outsize);
-- 
2.55.0

