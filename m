Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A0A2F8E8B
	for <platform-driver-x86@vger.kernel.org>; Fri, 28 Aug 2026 00:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787877325; cv=none; b=LalWZw9ipfCYhcnLN0sDBZ4E5a3XHBl6YMx5CXzBZYyje+DASGxAeJQ/8DrqP7N4w79DnVmfQupKQkzEhFsZ7Ns3+AuqG6TqN6rZ4DqEzlL8xQgf/RcelNnZfDNpxhdRQbAqvPYZBMuWuDvxK83uyT2knT5OGkXwJN3ABxl9KoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787877325; c=relaxed/simple;
	bh=hgvBQqs9ybbtiCRwx4R8lM6PFL2reQCSBTs5mW11U7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wn01uWA0OxDz8SHuzUMiBUky4ZpN/tpAA+c+jbh+nOYeUeR49/Et08JNVu3DPfziVa5vZhpSHUEqtDW3sK3maJM5lFJpv9vUWdHITrqUJZYtJNhmWN1PDZHv7zMx/u0HsXtAPOdF2Vag7J1hLbzPzsfJAxE//ne+R020KMamxAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WH9I2c07; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WH9I2c07"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-381b831d535so986970a91.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Aug 2026 17:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787877323; x=1788482123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UqRYF/uH+FzRwfodmF4P9j9BArNyskaK986eMD8UNug=;
        b=WH9I2c07cC7oFNDolhQN14TPZFj/QtEYj1NF8+pV54//FOxc+iHGNV5JRc1b5hZV+d
         MmrtN6KPyTVIJjv+aBtHBXrPrhYL/fLWU6HHE00z9MovpIWEPWp+WVSR7X5rCN1MOLq8
         LykBSlX+SjrzUeGfNoaEyF2jsLF0p9yC78KrjbZzXlKM4vqOgnNeJ8TwFG1J0kpkdNKD
         SaPSv+tArgznf6o5pkrW2V1x4xJ37YReGWfJBPqOYP1u2N70+ES1vDm++6U8T/cbOswL
         4GmmAUeFRM8RJXfjYbb6JqaXGzu+ED+TSsfa1rJT9lCSXKrBuceqalmMkjzLy/jSPecd
         djsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787877323; x=1788482123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UqRYF/uH+FzRwfodmF4P9j9BArNyskaK986eMD8UNug=;
        b=SAB9lK2F6glJHrWKHmbyAGlhlU9c2IxPgvQWKf9EvYVdPRyyW9jaeT5D+ZQX6d0C08
         OCA3DnAuQo0M+iZmxXvkkaYo+fNT7RV6PGBZ0lFhMXPiX93M8o/0Q4+6ezm7XAop2KJs
         slexDnKIgltw18R/UUVW6uUJprzGKpqwn6eEqddq/n1AIPXK5QrWyvpOqxQgg5AzZHUv
         /MM/pz2UDy2wpm96iOOfue1IGaki/3MRdLoxEufI/VEzxIdqZLJpbrpL53yGOq6KsarX
         fOTxaPJjxTtckz9Aem4mjwDBwpj/c9zEtDyOLv913PEPHlOF96yU8Hzq5Gv15aXmZcjn
         D8PQ==
X-Gm-Message-State: AFuF++nv116C5CZbGLT9BwW7C7PSGCuqm0BCGsRIo/y08kZ0i9XJQCjq
	U2ptyZNxnVtN7NtXkphtiiAiX41+WnPUm2mzKQpPe95gfjEPet5uFr4ieQcDqmNo
X-Gm-Gg: AR+sD13jOk8syGaKMFWs99CG7/6qahoQANLoxXAsJhjqbTtA7gm6V2/IAHUSTgTIM99
	5eSNItPMuOR2GQzy0GhjYzsAEQviccPzjIG+hltpGsPEZ/yb/oz/wES8MQxQnzLkfkRwodqciO5
	NpgCTTzwuNG0Nh88zwxYgNE7qwuAMSpTpOA9To9GOjef1Nh86Sfu5NdNB9wgZy9jjzZrbKCbijm
	nw8pIicAjddGP2qb+YrxDAy1jm2ycrCMzNKUFPqZYGPygXsM/pY9R9iMdM3lygMbCdudeZJcnbr
	xqfB3bIenksC5fzi4lbxhPmtiS73Qw7hEraFoqVWJJYEWKliyDs57AKiULYfcmTtyzIKJ3eAEQm
	XKUnbrX8zpyDyqaUgOLFrKo6N51HxgBugPzu1/QwWWuCj72w8RnmNEtbABBKP1s7dBv4prG3SK0
	gkn+sYgY5AppRQ31RQsX97yL2VrdxWPVGIpraDJJc3edjvPgsgqc6PCXTi3/DG25zDpS4mQtXN0
	ul1eekQAl4ht6i0PuPG
X-Received: by 2002:a17:90a:fc4e:b0:395:5eec:b932 with SMTP id 98e67ed59e1d1-396d0f8fdbemr6212593a91.11.1787877323138;
        Thu, 27 Aug 2026 17:35:23 -0700 (PDT)
Received: from localhost ([112.204.113.180])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-396ddc58f3dsm165584a91.16.2026.08.27.17.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 17:35:22 -0700 (PDT)
From: Alex Yeo <alexyeo362@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: alexyeo362@gmail.com,
	Kenneth Chan <kenneth.t.chan@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] platform/x86: panasonic-laptop: register FN key up/down events
Date: Fri, 28 Aug 2026 08:34:31 +0800
Message-ID: <20260828003432.88748-1-alexyeo362@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For Let's Note laptops, pressing the FN key sends a signal for both
keyup and keydown.

FN key down: 0x0030
FN key up: 0x0031

Currently, pressing the FN key causes the following output in dmesg:

[  +0.322901] Unknown hotkey event: 0x0030
[  +1.101006] Unknown hotkey event: 0x0031

This has a tendency to spam dmesg as this is printed every time
the FN key is pressed regardless of whether or not it was used
as a modifier to activate functions like brightness, etc.

Map both the keyup/down events so it is no longer reported as
unknown hotkeys.

Once the patch has been applied, evtest shows the following when
the FN key is pressed (and released):

Event: time 1787875023.918171, type 4 (EV_MSC), code 4 (MSC_SCAN), value 30
Event: time 1787875023.918171, type 1 (EV_KEY), code 464 (KEY_FN), value 1
Event: time 1787875023.918171, -------------- SYN_REPORT ------------
Event: time 1787875024.038462, type 4 (EV_MSC), code 4 (MSC_SCAN), value 30
Event: time 1787875024.038462, type 1 (EV_KEY), code 464 (KEY_FN), value 0
Event: time 1787875024.038462, -------------- SYN_REPORT ------------

Tested on the following Let's Note models:
 - CF-SX1
 - CF-RZ6
 - CF-SV8
 - CF-QV9
 - CF-SR4

Signed-off-by: Alex Yeo <alexyeo362@gmail.com>
---
 drivers/platform/x86/panasonic-laptop.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
index 19d194ff37ca..cfc2c79da554 100644
--- a/drivers/platform/x86/panasonic-laptop.c
+++ b/drivers/platform/x86/panasonic-laptop.c
@@ -232,6 +232,7 @@ static const struct key_entry panasonic_keymap[] = {
 	{ KE_KEY, 41, { KEY_MACRO9 } },
 	{ KE_KEY, 42, { KEY_MACRO10 } },
 	{ KE_KEY, 43, { KEY_MACRO11 } },
+	{ KE_KEY, 48, { KEY_FN } },
 	{ KE_END, 0 }
 };
 
@@ -863,6 +864,17 @@ static void acpi_pcc_generate_keyinput(struct pcc_acpi *pcc)
 					key, 0x80, false);
 	}
 
+	/*
+	 * Let's Note models report both FN key down and key up
+	 * without the expected 0x80 key up/down bit
+	 */
+	if (key == 48) {
+		updown = 1;
+	} else if (key == 49) {
+		key = 48;
+		updown = 0;
+	}
+
 	/*
 	 * Don't report brightness key-presses if they are also reported
 	 * by the ACPI video bus.
-- 
2.55.0

