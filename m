Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03E0479885
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2026 21:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790372026; cv=none; b=PRBSNmOCexXEdvDskGvsVlhILb5w3N8r3vY1DzCwzfGD6goLZuh/zc6tibI+wCZ9WQXh3tz8kqQOXdkjm2nnuxM/tJPqPhwLN4vtJh6c7WOK92aW0vq9oFZ3cuKl8+3Cc4Rc0Tx3B1KcMqG6tyP0NkQ4UxRHwYfA9f03i2wUGPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790372026; c=relaxed/simple;
	bh=0zBTQ42ozAXedGB+g8hLFnDwWMR9NHhVhkh1N02kpBo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nrI1Q4fmBLErhEBPTzV9qrG2VJSc5/OxWA27ceT0VJAUGrPMFlDLgwil63+EPYxwkJwCWPNm4XcFjJQ2qVkMmfcjIh+hzXmpJxiPwOHbS/joh0Ei4Gzo/rPy6kMS4HFx4HnxI8iRnPKKEKLOgo8b4g10NgcfrMcQCv4rOhagrmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LPU6Oxok; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LPU6Oxok"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d3920so9997295e9.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2026 14:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790372023; x=1790976823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mNPnuIQqoJSa2LnLqWG9FoS2zB4ik0+5Qc4IWxEH1U0=;
        b=LPU6OxokPeJl+KQO/kCqu/9DqIuIevWy/GJoosZFvzY0RtSdMV6WTTGEWmNO7ha1+x
         wfVgWDsJlJW1ABybLLOqCxfO9oDVTCXjjd+Yr2ZOh7dbRqJDDmwq8WA5j2IgR5LoiKiJ
         LrODCXd/dTfkgvSOOgiaTunEqccY5Wdm651vNXpjcnJrU7NRF2E1kHE2B2jgpykuqQXY
         k8T4BFocbOUY+zMGfkOIsLlGSsdSea0Wwi3kaQ7H/SkAo2Dl7rte2bCE5gGV9IyWwgKb
         xzd1m0U/zQ6eTnvHIoWaLqZvJS6B8xSn9Csq/yj3rowTjHsw7XEOpUf0YXuLG/D0UKSl
         Wr8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790372023; x=1790976823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mNPnuIQqoJSa2LnLqWG9FoS2zB4ik0+5Qc4IWxEH1U0=;
        b=0zAIIqe1klwhftGmJQUQkTB87yvba+dTO+dLI/kjPB8ZpdZcz1p0Q6mneBXu+nYc6V
         pvZEbjkzz/Fq+fD8rwUajbACFwKe6WO48fQ0985J4a40rBvi0HqE3SEORR0N1tvx3pJq
         7cJSRVx5ARoQLwMjKmXoxa3avEielsOR3wF5t3nCRAKbqXWtsrcw5iHCpvU01IEVttTu
         ZUvx+ke/5aJO4v2jQqEoDzEVqKq9QL6BH2qV8YdQsmlDbfihNKCWcAR5IchkblyO2nDD
         +XAnljGhVtjGWW0lWhYSm45/2//wGyneZ6woWi+G6KiaC/FZCrlHFRmgYQv9jOWfsn3+
         rpDg==
X-Forwarded-Encrypted: i=1; AKwUvBzV0THEWtwlM7987x+bwunEXkCBmFSJsix7zzkRHRL7Ox9O4Gk/Oe/ElUSgzJw0ihfy9EqAkExUnzf27/xKsiYWtctN@vger.kernel.org
X-Gm-Message-State: AFuF++lGu2x6gSiDYGi8r+G7XH7cxIM1zkW9GDzMgnVFRRvAfjof0rhK
	WjetaUC0yKrdIA2ImEYhd88IedBlilQRElxrzMJLvj6HaILGZRMBEBD3
X-Gm-Gg: AYBFou3PhOJUWERRuk9RLaXtIzOLf+VHtpeq08nY2gRa2KOVYIgv48dSlSIugzmoJeR
	/UTpzOYAisIwqKnLT9cww08qYW2pVbVtYUKkuyUGIAEuGZrOaxTmOxOkhku+B5uU+J7SGrWwx6p
	fAddvQ3jwQ+DqjOkHvo3knlKPT74QF6QCYq31hSfZnRQU20ZlNwFYiWv4gZmtIyvYE0RjTPYxlO
	E1wwpyV30rt2hmSpt6AZxnpNqwswMCzMtA7NnfGBetvDdJvCdKn7oO5ubRr4MDjEPLbr4exJdJF
	jDXBdzbJCPdTcN7fddVo8zSX4GdieIRNhwrqe2ohSvVjn79YvA7ZX1JiZIhdQbYyM2D72ZFHeBy
	fy3Z9cdACMFtG55q2plOAAoojJDvE0CeoYpIu7Bogz2Zch+J8LCczwufZtTF/E0/K5kLJykuYB+
	ouTmPZFfBHZg3Sgzp6RP+oVURVe6dwXir7ZGdGAad8b32pKZ0n7UNTa2Lo41npZ6MXHYfA3qa97
	KhdCQ54lIdA8daiAk8ZJLhaPIkxfzHfEux8GT1Wkcakgm6v+Uq7WB6vzYPuaQzR7OEyq9sJubZn
	3HCsz2uubwQsH/48iWHS7Q==
X-Received: by 2002:a05:600c:3486:b0:49f:f9d4:674d with SMTP id 5b1f17b1804b1-49ff9d4695dmr4184105e9.13.1790372022809;
        Fri, 25 Sep 2026 14:33:42 -0700 (PDT)
Received: from archlinux ([2a02:1808:c3:5607:5610:f477:1142:290b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a35fb05sm10843696f8f.20.2026.09.25.14.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 14:33:42 -0700 (PDT)
From: Patryk Pilichowski <pat.pilichowski@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	hansg@kernel.org
Cc: "Derek J . Clark" <derekjohn.clark@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Patryk Pilichowski <pat.pilichowski@gmail.com>
Subject: [PATCH] platform/x86: msi-wmi: Fix hotkeys dropped with vendor backlight
Date: Fri, 25 Sep 2026 23:33:33 +0200
Message-ID: <20260925213333.198058-1-pat.pilichowski@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit dee82409a883 ("platform/x86: msi-wmi: Reformat
msi_wmi_notify()") turned the condition for reporting a hotkey into
an early return, but only negated the brightness key comparisons,
not the backlight check. As a result, when the driver registers its
own backlight device, all WMI hotkeys are now dropped, instead of all
of them being reported as before.

Restore the original behavior: only drop the brightness keys, and
only when brightness is handled by the ACPI video driver.

This was found by code inspection. It is not tested on hardware that
uses the vendor backlight; on an MSI Katana 15 B13VFK (no vendor
backlight) hotkey handling is unchanged.

Fixes: dee82409a883 ("platform/x86: msi-wmi: Reformat msi_wmi_notify()")
Signed-off-by: Patryk Pilichowski <pat.pilichowski@gmail.com>
---
 drivers/platform/x86/msi-wmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/msi-wmi.c b/drivers/platform/x86/msi-wmi.c
index c9db750fe5..05c35133a1 100644
--- a/drivers/platform/x86/msi-wmi.c
+++ b/drivers/platform/x86/msi-wmi.c
@@ -236,9 +236,9 @@ static void msi_wmi_notify(union acpi_object *obj, void *context)
 	}
 
 	/* Brightness is served via acpi video driver */
-	if (key->type == KE_KEY &&
-	    (backlight || (key->code == MSI_KEY_BRIGHTNESSUP ||
-			   key->code == MSI_KEY_BRIGHTNESSDOWN)))
+	if (key->type == KE_KEY && !backlight &&
+	    (key->code == MSI_KEY_BRIGHTNESSUP ||
+	     key->code == MSI_KEY_BRIGHTNESSDOWN))
 		return;
 
 	pr_debug("Send key: 0x%X - Input layer keycode: %d\n", key->code, key->keycode);
-- 
2.55.0

