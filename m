Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929B03D75A8
	for <platform-driver-x86@vger.kernel.org>; Thu,  2 Apr 2026 09:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775123837; cv=none; b=MzOTVLCxFfFvVOiSm4ZRVqOJnhYZIdKger+6UsVQVQktLDQ3m0vrqVxeR0IkV1TIJZUK2B0CD3y6ELBEt0lq6HoS8ba2ASwHB7IBWSxq9Zz4n3Yr3R8W2gVTHOua9iTbp9ARtDZHhEqqKGP058ZaFwGS+UAavsqpe0GXJR1V1H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775123837; c=relaxed/simple;
	bh=cKjEaisXXsBBcOELewZnMZ+lJI6LWxXMnwYSOMwCs4w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HS9YKuv3T8zakBK8gHb2Ks8w3gdQNmzn1YWqpNUM3v9t++5jSXlCxIqbQaQlEZVSLQmD5rl6SXuErjJTQKgsWcryua/H3H0YnCRzFdn4Qr80RXgDobwWMjeIEv4B26P3Gm8AeZvQGJxVyV85/j7A+9AyCZoXHcu/3hBW58c/+gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iNgN445k; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iNgN445k"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-82c28f0a4ecso513638b3a.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 Apr 2026 02:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775123835; x=1775728635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=35+ULPCAUQvYRpW1wrUKbHOsJuShNhGddzdfuyZZEog=;
        b=iNgN445kt+t2N3SpzLjrbgIOkGjG2Fkz+S2gI4ZKKRVt9fUcb5l68HrdQOKT/KqN78
         iHpPKoCXt9WDR0jOvdA60EkCeCXDbVaO3/1A6Dw49HT6lSTBoP6lw6hpddvmlSssP9qd
         qqxn4LxxHM4Py72/RIQZ0rZhlNau8c8VBOZ3Nbx7oq1l2HZI3we4iXnxbYKeyYY3AYDQ
         Eh6uo5Dpv87XCY/pqmQxYGOThDvfhDf6MXgBftoXGUh1V6v118FoKnnqRQD00vsmUwvD
         j9dZHzE8VY3n8oOUFhOOEiwOMz2ftKNZBP9N4wXy93cLkuUudXtE5PtGxAbFlYe0ehHJ
         OZkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775123835; x=1775728635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=35+ULPCAUQvYRpW1wrUKbHOsJuShNhGddzdfuyZZEog=;
        b=kFSW04OI/ZeC0x+hfKA7MdHdPYDbOzfSAjcYLTKkSJLrPPPDFEYumMRSDsgVkWiluj
         /qoz9RPBrlM/IdGlZoMgnHGUfaL18lSnNRLnG3EtmuY4qxr+Wmd20h4pMSnzqfor7XSm
         MQrXscop1L5BPpHy8vpbnjaOpPU3vlC6sw9a6m8bhdvpCFKcZWLkeliYFg7hfzGQa/Oy
         IczrYLjGPZ1PBywzmeMimucH+R/83V5m4lvutgfyAUKebeRth+LhokIc5fCeMMi1Z/uy
         B99vGLrIMe0PJAp2f+6fHPXpgD7Buouxfky1+GBAuTXiMQOQDcXGBPCGWptmvy/5JvHz
         RVDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvvAZjrQfD4WtjMwunOO/s2fK1+g18ouDt12UZJZ77KXy9vgAfYlrWgS854YPcKiQ9OyRYKDP3om58NyX1b7EE/LDj@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb2eyimw7recUYOUg6UQl2UJm+SBGqMDmRgeLJJGHWRNOrkpk7
	DOV5nsqPQTLtfosAFkGX6GCi16EUTO9b4ckKkezfnXdX6wDrOdkGsZ1k
X-Gm-Gg: ATEYQzzplQ702EWimurxNC/50RAUpDM0Js/hi49umTcV5IUBpdjoZRE6Ou584mMZoCC
	oHNYBzyNp34MZrE/pWZMraGsxVABKtRAJAyjGhBrhmXBvXqK8CV0vbefZYIl8zLMs5TLhvr0qek
	ZIyrOz6aDe3rO1su/25jlhzR7+CYfCIdS9qIIgdHnn+xl/U8scer1utPUq/DQcLhhyEVHjSFf+N
	dWy0IZfe/XkVoXzyDaCRuwZDmM7ZgnlcDs09xkvv5jZFWo6etGZdpEM7feqwfIeUGbyMLMHojE1
	TM3YmVoppWMKH2mptlnNjSa/3tkgn0VKF9hHEjpEKIgqiF1svdcoz55CXjs3eB+lGCp+TUk/ms6
	c6NpBz3dxkRLlOIWb1Oeez932+U/atW4/tTDBTiBMx2hCUm5ifcjVczXRrN6OQ6KPp5IYqvfUtB
	gEsiEBb8mSKiqAkCqBiYPkEdIL1la99k2V
X-Received: by 2002:a05:6a00:f87:b0:827:447f:7dbd with SMTP id d2e1a72fcca58-82cfb95141bmr3017018b3a.46.1775123834585;
        Thu, 02 Apr 2026 02:57:14 -0700 (PDT)
Received: from Omen-14.Dlink ([43.229.89.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b589b8sm2531813b3a.24.2026.04.02.02.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 02:57:14 -0700 (PDT)
From: ShaunV334 <shaunvarghese43@gmail.com>
To: hansg@kernel.org,
	platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	plotnikovanton@gmail.com,
	ShaunV334 <shaunvarghese43@gmail.com>
Subject: [PATCH] platform/x86: hp-wmi: add Omen 14-fb0xxx (board 8C58) support
Date: Thu,  2 Apr 2026 15:27:07 +0530
Message-ID: <20260402095707.64881-1-shaunvarghese43@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Board 8C58 (HP Omen Transcend Gaming Laptop 14-fb0xxx) appears to use
the same thermal profile handling as other supported Omen systems,
including board 8E41.

Add it to omen_thermal_profile_boards so hp-wmi can expose the firmware
thermal profiles through the platform_profile interface.

Tested on Omen 14-fb0xxx: the profile handler exposes cool, balanced,
and performance modes, and selecting performance increases sustained CPU
package power under load.

Link: https://lore.kernel.org/platform-driver-x86/20260203164832.40514-1-plotnikovanton@gmail.com/

Signed-off-by: ShaunV334 <shaunvarghese43@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 988a0acc9622..3cd5679828d6 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -153,6 +153,7 @@ static const char * const omen_thermal_profile_boards[] = {
 	"8900", "8901", "8902", "8912", "8917", "8918", "8949", "894A", "89EB",
 	"8A15", "8A42",
 	"8BAD",
+	"8C58",
 	"8E41",
 };
 
-- 
2.53.0

