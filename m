Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C5E238C36
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Aug 2026 04:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785902621; cv=none; b=qw1Miq1pdi9VFYrRwkBk0V86qDfVyUncMYtMXX+vsZRJTgq3C7rCunSTa3OzSMFXqJMVdMN++UiIrGpk0BsARZ5af7aF78L8rM9yb2uV8F4Rmd/oLgpriHYLk61INCvfCJwTOfRnePTXuFEqnDHZ/gPuHkr4dL+2Pfbo4rGcTgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785902621; c=relaxed/simple;
	bh=RCacXLcQzLMkZt/V4onImpot57AhofGIO21OqzIF1Vk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QgzJi6RPJdbpC3g4jIg4x/zBiXZfEX7j5QBhEYauUZG14NrCHMR5euYqDjyb4sq7hgnqrKTbxTmkPkwNwDJZyh8FW3GH3jFA/A+HDhZqfsSP7lBeE+k9adkhGfp+/MI/0g1iB0sjdAMC5ckb/sDPbTonPk9tVNR93T2Zm0Wg5yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S7KKniPS; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S7KKniPS"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38e69bdb0fcso518947a91.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 04 Aug 2026 21:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785902620; x=1786507420; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5emTV60DveNs6kRLEdh1K0m5cgWO3OGrdXp8a1oXBuw=;
        b=S7KKniPSigH6nzWZsJ9VaCAk+cf/Ukts/71wy2vMK+5ZIXsiqkCo20EPDzSceWzgmq
         Hs9ytNzflpHEVCufgnD9qhl5uV4oFf1sXsa7BkT6O8KX2zWJiABC8mNyGbj33Zslwn33
         xTFz2xzqKBaPqThlleRyIzk4J86fKkVbOmtlpKmdgpXBaX6XoTZPbZMrVpNOBcBeYnc5
         WPdbtvpLcNwBpVvuMuSrKcNp035nMxPBFReuhUm1XS1gSzacfjtJKLwUcAvCqeVAXvsT
         5H6F5vOA5i/oAHqHHW0LFq2bafIqYUmIUDyGFsbERj0leMvV1dvjqOye4PqderDq4LNg
         CuKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785902620; x=1786507420;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5emTV60DveNs6kRLEdh1K0m5cgWO3OGrdXp8a1oXBuw=;
        b=bNw8S/fCNO6w49xSUEGn/kXmM9y7c6oiqlLy3MKtFfkVFyPqPYFBld+2V2Kz6puB2u
         D1BZPR+DH+8snKcebQs7/PGyDVkePbe8fVvAH0F+xZmPnNii2L2IASf3EaxnZ2oUnWjt
         b5AoPkLtthDVQfHlCD6zWsb9ISG81XFlCfs/CtUjKgTPfw28+mcxmNqdx02KeLZPW8Da
         RCSEY2U5OUAvW0ToNrt+d9BrMVFd/pStRPaPBVWSUeNmfTKx0devYQN7YTT7aitcu1nh
         Cm6vX0UxbC1RyJJl4tg7YeHgLVRfr6GVM8LD+dW7hkG/MvVeWh8eUU/H/KYXouRWwboa
         hj4Q==
X-Forwarded-Encrypted: i=1; AHgh+RoTYEX8TBiopoWfgyIkNqX8GyTXgkNPDe23BQCDm6YgJbk3FjAHnX61EK/a+6q5scrUdgQTk03CvqBW2H25dWyTwgAE@vger.kernel.org
X-Gm-Message-State: AOJu0Yygp361qEyCuhUahJFtHasrMC6vrf9q6RB4BEjEDz1O+PsVobY1
	QUH59BTP0miKamFREAf6o5XGF0+MSK1HGc5dQylUdWWaUlpuqNCTJG7c
X-Gm-Gg: AR+sD12PIAk7ARJmM9n564eN8N5bjFv6fyBdlubJNA5NZ3zQu3KCr5AVsbV3qsKCXkf
	hWzwdtEAIlh0WYQAJ53vwIFRAdKdvYumFky19ICxEHH3nmss0ZHRSGqJbJcM4Os4DlTtCL6AZM9
	27FD7lhx8ufNY5mhCQt0bcnZdK8VEpdUuALM80LTadVJcgb1MvWFKA2xOD5BjkkNB2d6WHi/P1L
	sO2Wp1uhIQ7UiWiCNuEv2BEzOp/SgPPQ81T6/TkrrdJ0WDsalCBzvI7kP+O5rQU5j9DA9hwsuOm
	+NIQUL5irZZdSNRAmB69cUNN7G2gena9JbR7ZLGnJ0xxdPYNMrUwB4Z1kN0GzKs7NgN6C69j5m1
	v4ZHe38bVIaPKr8riQCuYzlXsWAGaIYQqpy8K4PFXRyaQelmXXkiXBv4Dm1Y4Oy1dcnn+Eyxk3I
	lA0duf0yfUBVpxPBGyIupkHpLjQZphPMtEDbJOEMVSQiDAWhXgOIHLAJvTA3hMiLF4s8rBCQUSZ
	aCGulgcMyK1UkOHeoLY5y3Bo2tVlQ==
X-Received: by 2002:a17:90b:52c6:b0:38e:75f3:ad4d with SMTP id 98e67ed59e1d1-3903c5381efmr3687413a91.7.1785902619905;
        Tue, 04 Aug 2026 21:03:39 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:bf3a:ac93:79c4:84fd])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca508a48sm8323396c88.1.2026.08.04.21.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 21:03:39 -0700 (PDT)
Date: Tue, 4 Aug 2026 21:03:36 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Nitin Joshi <nitjoshi@gmail.com>, Andrzej Pietrasiewicz <andrzej.p@collabora.com>, 
	platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, 
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: thinkpad_acpi: Use input_device_enabled()
Message-ID: <anK1j7hbMyFHGBUS@google.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

Use the new helper. Inspecting input device's 'users' member needs to be
done under device's mutex, so add appropriate invocations.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Link: https://lore.kernel.org/r/20200608112211.12125-7-andrzej.p@collabora.com
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

Not sure how this got stuck in my patch queue but it is still valid...

 drivers/platform/x86/lenovo/thinkpad_acpi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 445e1403308e..f8e116e8a65d 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -2547,9 +2547,10 @@ static void hotkey_poll_setup(const bool may_warn)
 
 	lockdep_assert_held(&hotkey_mutex);
 
+	mutex_lock(&tpacpi_inputdev->mutex);
 	if (hotkey_poll_freq > 0 &&
 	    (poll_driver_mask ||
-	     (poll_user_mask && tpacpi_inputdev->users > 0))) {
+	     (poll_user_mask && input_device_enabled(tpacpi_inputdev)))) {
 		if (!tpacpi_hotkey_task) {
 			tpacpi_hotkey_task = kthread_run(hotkey_kthread,
 					NULL, TPACPI_NVRAM_KTHREAD_NAME);
@@ -2566,6 +2567,7 @@ static void hotkey_poll_setup(const bool may_warn)
 				  poll_user_mask, poll_driver_mask);
 		}
 	}
+	mutex_unlock(&tpacpi_inputdev->mutex);
 }
 
 static void hotkey_poll_setup_safe(const bool may_warn)
-- 
2.55.0.571.g244d577d93-goog


-- 
Dmitry
