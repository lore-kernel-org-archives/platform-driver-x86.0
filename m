Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CD67E0FF
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Feb 2026 04:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770957998; cv=none; b=HMfJPAEqCPBtKHFq9AXdXDUOGsgV0FlvuCt2tkqxd7C+wUPk9Moh3dabt1SmSgrhpF7Uy/9KoFgsKoJ/l8Ee9l/lF9BPAw8/ArXspeF1/pdIEOoEF869UIpbJ8sqPM7e4Ey5SRzPj/eGwJ9sSRsYH2mIn6Y8zuqmdPcsWOiEbZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770957998; c=relaxed/simple;
	bh=KU5V7tM+QvFVuM+zAwo7t3DRn3XHvlRjvUyGN8XVV78=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZzHSSohBhOyVqBrprD5AIHSTNExcXWN4I3bp1QJSAG1fuXDX74EtLTJChZBE+xJY5icKsLyemDpeEgJQTpQZ3oSKVktvq54Xyr+FjjU+kMNVxlpSqntpYnaXzKX0zWc5gSdYu/L7FoHDuDeqoieZN1simksXURnnzgFqnQiLNRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unarin.com; spf=pass smtp.mailfrom=unarin.com; dkim=pass (2048-bit key) header.d=unarin-com.20230601.gappssmtp.com header.i=@unarin-com.20230601.gappssmtp.com header.b=Sj+greZ6; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unarin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unarin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=unarin-com.20230601.gappssmtp.com header.i=@unarin-com.20230601.gappssmtp.com header.b="Sj+greZ6"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-896f5256181so1030436d6.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Feb 2026 20:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unarin-com.20230601.gappssmtp.com; s=20230601; t=1770957996; x=1771562796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eXQUPpgnTtDZsit/fco7M8saQBikAjm2HkquLwiGwio=;
        b=Sj+greZ6p5rgXsAwk/w5sqQj4Zaem5aqm3DGU/1qR1QdLDVFX5izFKHijZgD+G2BKI
         gYLCcXhmqA5L8iecx78MnrSQiduWXm+wBOyvoX9fCCBVwsCrxa3HfjGymUd49xafbVFt
         ABRQUVgXTbLeXRiaPAx+yigwIJ+y3KqTUTQeqaOuLih3IbReHR6kd71YkjqeavJBziPC
         ZPehitZq04+Sa1Y8tLvpd7WCDeeETBIOnT/oh2x1OWYH+q2G/41C6JmcLsBHTAHQja62
         ayu0FbtmuolPToBWX65xzfk/YPSIsw4h0XGyjqCuVy7O0hYlq/3uc4BjVDnLrx+OtVA5
         VN0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770957996; x=1771562796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eXQUPpgnTtDZsit/fco7M8saQBikAjm2HkquLwiGwio=;
        b=PFcWWaBc6qI5s3/qMXWfs1Jqx3Ah6IY/SaGjZq/i7jVYt5mxZ1/6KuynT9muHdabCn
         8z9UCocRvkvQmZnPSl6WPnfieg5m37UPj8ZGPRstu2BNWlaV4lNMXT7XcY+AtJBuWdoX
         9kTWCK7R01X+6vnx6vcU4/d1qd3ITMu7OwZt7eKkpTMqhPsS17y5a4OvIPmXSJazn2m+
         /w7GjqvOKiMnTAhln1OSC+MOmwdLXR9i6cXkGv+B8v1/hsMz5pFnrfbjPNegIf8q0Ya1
         Tw0NheKatNK88pItBxRG3Nbnre3hjpsi280WrV0BeULSTA/huio+MheT/ca1bwfxpJj6
         3S5Q==
X-Gm-Message-State: AOJu0YzrKOcfSPgmIzDA/BNeh6+VZMDYtY8EvBO54QCw21MR/Npr5nr/
	QAE6XREdoAG9L0b6WGmOEtaf98Nd+SiqFjnr+jl+rz47Wks2EI41gBacnTUvzQ8uQXg=
X-Gm-Gg: AZuq6aIVs0DcRoWoaJmZbtgusTvXQgJX4ksSBUJYHSdErkaQA/9FXYNc1O3xV8qtHvQ
	9PNPnwCohxHitaGqpezYEOBfzmfERIuGXXPOfM6f3XV7wuVN0KCSPowGfza9qtIillHFJQwEVtH
	MlwhOarPsgQLzDEF+g/5L9cMoeUPETwjl7r9Zjur8Qw8tXW4s5iLQpNZZWc23d9G1nqH3eSzpLY
	N2ZuLf2yu9ZSBIy/fYRl+dWlSDSvKG5rlLD9BLqkK9vlHurmyHyKlGwFunyqFnW6/yZfwEuFJT1
	w3HX1zdpRiSIp0WTcq6RIClhCtm71JjBapCqMP4IBQCfXipyPmsBRyDt57QO+5KgC9RZXLGpb5W
	BPQfnA8G7XW+fqlji1LlzIsiKw3JebGmMgIun1VHt84PnXzx8idnxX6WCWCWV/L1Iais96tIjeh
	GjlIvl6Ra7CDCwIzIoNeqJt8Y1QupSnZfRsL7fr/NuEhqJkSn1XONYcw==
X-Received: by 2002:a05:6214:601a:b0:897:2556:d963 with SMTP id 6a1803df08f44-897346f2bf7mr15856046d6.2.1770957996320;
        Thu, 12 Feb 2026 20:46:36 -0800 (PST)
Received: from samu (c-73-141-215-85.hsd1.pa.comcast.net. [73.141.215.85])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cdc050esm65612216d6.45.2026.02.12.20.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 20:46:35 -0800 (PST)
From: Peter Metz <peter.metz@unarin.com>
To: alexhung@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: intel-hid: Add Dell 14 Plus 2-in-1 to dmi_vgbs_allow_list
Date: Thu, 12 Feb 2026 23:46:27 -0500
Message-ID: <20260213044627.203638-1-peter.metz@unarin.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Dell 14 Plus 2-in-1 (model DB04250) requires the VGBS allow list
entry to correctly enable the tablet mode switch. Without this, the
chassis state is not reported, and the hinge rotation only emits
unknown scancodes.

Verified on Dell 14 Plus 2-in-1 DB04250.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221090
Signed-off-by: Peter Metz <peter.metz@unarin.com>
---
 drivers/platform/x86/intel/hid.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/platform/x86/intel/hid.c b/drivers/platform/x86/intel/hid.c
index 560cc0631..5b475a096 100644
--- a/drivers/platform/x86/intel/hid.c
+++ b/drivers/platform/x86/intel/hid.c
@@ -189,6 +189,12 @@ static const struct dmi_system_id dmi_vgbs_allow_list[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Dell Pro Rugged 12 Tablet RA02260"),
 		},
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Dell 14 Plus 2-in-1 DB04250"),
+		},
+	},
 	{ }
 };
 
-- 
Cheers,
Peter Metz

