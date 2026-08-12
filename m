Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDBF433E75
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Aug 2026 11:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786533531; cv=none; b=rKozTxp3WWAKmQo/xAbU2Frt7HvQndGLFSwmhfTZkHD6I87CT8nVBqG/GRsKsH9x2IGro4Anp3CB4wb1TRcqpqSq+6ckbsoiuqBGbsSWvgSA2wD91gNS0KDiyY5CTMkcTuKuHdu4DH//yC2IPCoDI12m4g3rNlEcZFBIx+iZVsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786533531; c=relaxed/simple;
	bh=9EehTMGdJoM/pmPAG9mZtREZbrypCyCVR7Mvq/DwalQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jDWYDPDkPAlI7wrvPb+qrJTKdFgRVn3gZDRXf2h/dQKUAAl7SkcHD8dvSvKsJePTG4WNDbMU3W7IkzXvm0tNW/Sr6nNTRgJXHwvNEAc03Tbc9nMyayZ+73hQaurMA2peOJAjHWfvj6kZHHKme6r8ZJn8h2SzjDnajnRyd+zwl9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BQxHgS0H; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BQxHgS0H"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47fe377a217so490892f8f.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Aug 2026 04:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786533528; x=1787138328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K+s/eo+/pWpLLFnoufPaOpVfgTjc+a46l3h08Co/MXY=;
        b=BQxHgS0HfQtyGfRnLr5WsGMWqfVYh/WwUZwcb5pDy+K0MmzYC2/+Q2ohurf+Fg/H1Z
         5fjaure2dBsBtEc/LhkKSn2ZddCIoLxySDiIMLWhCpIGUJKBIUa11JAeO4rbQzfDHAXx
         JQ8JxDlVrPGX6AkbILVgLHrOD6M5HNFMfMGz1vVl7Ivk7opbz3C9UC9b8TSBIeJHzUtt
         SXLJNgiBsHCHJKJEHXlmRCRbd9bQ3Y+i7H5XKGtdnuw018/Kvs6EgOa9VS584/09TcD8
         ul5527RaeAYj6Sx3L5azq5ZwuAbvRM3cr7hQTjyf/pLmN3B+D/0yptVOmE+1FGvdtYm+
         tJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786533528; x=1787138328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K+s/eo+/pWpLLFnoufPaOpVfgTjc+a46l3h08Co/MXY=;
        b=KmmJo/JFW6itCtEgMDwIIcPfu0lPxyv3xARTwrqoxQoshl+PIgDvIJgFr+UREl0A+d
         JDWJZ5XHg5xEslaxhCZnvhwV/ixexEHbJuHv9UhM0urasrj3QrCbHNhRrvKe7HFJb8QQ
         sXrIAQ2B52RwXo499AR6/CaRIax5vCyNh98WJs8C/yEGJpiec29cpTIRq7Q0Ksadx5Pj
         eJZ9NZZ8sY7ynmuwJArUT8zmAAOPjzICNOs1RStYiiIaBNXzJIhDEvXX2tyKOfaZok23
         GPzGwMIeB0jdeP5u7orx8uZfGc8hdTenq7bG0Jc2mDmACK/NF85PKeH/Px62uShmNC1S
         smpA==
X-Gm-Message-State: AOJu0YynK6+K6/QSdwbsItMVl4Yq6WOtXgVEgxiMkBv1k/IKI+QxjWMa
	fI3/UjQQSLO8M+x7/CTPKUS7CArIPvRREm7pH+S6L8n9UQ1MDBo9/H0yjclzl9n1
X-Gm-Gg: AR+sD130bCMrQ3yDkkGIDDpUFlViaTH2trDG5XFUmu7JXfDCV2wDaeCnWMp/gl+wlNW
	xHvngOlf3M1RRosZ7TL4S/wcyFr0q6bk/UYMyD3FXrmFUIw0s5Nb4DyTk/PCDER3jL2vm5BpFcS
	Uhz68+UL+bEE0gHAlOpRHhDgNQO3kivED9e81KxLCc6yNibS2747lkvkkBaNWxR4Req89ENeVh2
	RavGxvp067L7cF6LanP5TixqHxoce8P87126gffbNT0wEomvLPD47FjdqVboY3WgR4nne00Of/9
	T22Cd1FpR5imhjp0Yp0XItzEG/9lHyzJfW0BBuaYn9QrL7Kgmt+cPvhgjsPubtjZhgTreLFuVGE
	SvtEP49mwNdthECwTTqz2aoNM4qgnmG5mvMYi8l8pzHDAUy90EdOcN9REIy2EeNjcArsjdxJk7+
	4awMzCMTDAiVjK7Cr92EH1ldLutTy6ZAglpk9Qai06/8oeLpJPRsc7gjIUdKxtjsfk1Y8y6FB6t
	/B0hAi/Qls/h5oGpOEToO/chx2qB1MjtdN6Q3597w==
X-Received: by 2002:a05:6000:606:b0:47f:9aef:5515 with SMTP id ffacd0b85a97d-48152b21141mr6004264f8f.13.1786533527613;
        Wed, 12 Aug 2026 04:18:47 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48150d702c9sm6670072f8f.34.2026.08.12.04.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 04:18:47 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: jorge.lopez2@hp.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH v2 5/9] platform/x86: hp-bioscfg: fix off-by-one heap OOB write in audit_log_entries_show
Date: Wed, 12 Aug 2026 16:18:25 +0500
Message-ID: <20260812111829.172273-6-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260812111829.172273-1-meatuni001@gmail.com>
References: <20260812111829.172273-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The per-iteration guard in audit_log_entries_show() is:

	if (ret < 0 || (LOG_ENTRY_SIZE * i) > PAGE_SIZE)
		break;
	...
	memcpy(buf, audit_log_buffer, LOG_ENTRY_SIZE);
	buf += LOG_ENTRY_SIZE;

At i == 256 (PAGE_SIZE / LOG_ENTRY_SIZE), LOG_ENTRY_SIZE * i equals
PAGE_SIZE exactly, which is not ">" PAGE_SIZE, so the loop does not
break and instead writes another LOG_ENTRY_SIZE (16) bytes starting at
offset 4096 of the page-sized sysfs output buffer, one entry past its
end.

This needs the BIOS to report more than 256 audit log entries, which
already exceeds this driver's own documented LOG_MAX_ENTRIES of 254,
so it requires a non-compliant or corrupted firmware value rather than
the roughly 85 million entries an unrelated integer-overflow read of
this code might suggest.

Fix by checking the bound against the offset the write is about to
reach, (i + 1), instead of the offset already written.

Fixes: 63e8f906e94e ("platform/x86: hp-bioscfg: surestart-attributes")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/platform/x86/hp/hp-bioscfg/surestart-attributes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/surestart-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/surestart-attributes.c
index b57e42f29282..6b63fdb84606 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/surestart-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/surestart-attributes.c
@@ -90,7 +90,7 @@ static ssize_t audit_log_entries_show(struct kobject *kobj,
 					   HPWMI_SURESTART,
 					   audit_log_buffer, 1, 128);
 
-		if (ret < 0 || (LOG_ENTRY_SIZE * i) > PAGE_SIZE) {
+		if (ret < 0 || (LOG_ENTRY_SIZE * (i + 1)) > PAGE_SIZE) {
 			/*
 			 * Encountered a failure while reading
 			 * individual logs. Only a partial list of
-- 
2.55.0

