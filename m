Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794679042;
	b=g+IBOYtsK+TfXepnmc/EU4cSnD0D9agD8aRcn8bPk/esFsqoUHH5OIzdMJO20AapeU07
	 SwCgdA2+R/9ZPkFdtQgQ7GzVL8UM5mIjDY0uzAckhLfaS/41fqQ3Y77+i0XaUJVlItRTx
	 R0/T99B6TF1nPqXKKvNS35idQtfjJ2aCMjC99YECJGHmkGz5OQ3iRjwiegz6mQScGKjef
	 EDB78yUbNYthe5EU0DppoAZKPp3Xsgeqj4FCCB40KzUZ9FIyAaeo7wVKW39YKGfXNHdm6
	 Ogyk9F0327G6SPMzIo8UbDpdhAMRuf/eJ4OHeXgf1NcFcuG2jmWW2fowoVd9c8ckKLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794679042;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cYa2TSoAQmE/xTgSAEM6U6puxxQ1kN9FMLv5E3CPD7Y=;
	b=Ja12Q2OEqH5ZY+iMvHQcSGQ46EWbbBhe2WOG+XfS4G+loTzpLBPXUlUCVXa04aownuKb
	 ku3tn1j4QV5JZXJbbVL+klKg2oqfw7NOA7ihTR8iygtjFAs1/tUBqwin9f99j9JmE/GGY
	 8eBZomogDixEnZl3FZ/1N9Uo0b4+I1x1fKwD52L2zRSXQwJZ0LEbenWTSOK0byKoArlOs
	 FZzaaZEpJNS065TqFRn2iazI/S5ny+cVLiJmOjbdGpCh6vSwSyaSkuzAqV56xItsEV4lk
	 8O948SUQsgdgZNLGjXymAHPyNwX8030ysIQUhDCuwDSAYpI6E8XbHuZNLsot8AJFUvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iCB+37cY;
	arc=none smtp.remote-ip=74.125.227.130
Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FE3606A332
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 17:57:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5FE3606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iCB+37cY
Received: by mail-pj2-f2.google.com with SMTP id 98e67ed59e1d1-3b1478f06e3so456096a91.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 09:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794679041; x=1795283841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cYa2TSoAQmE/xTgSAEM6U6puxxQ1kN9FMLv5E3CPD7Y=;
        b=iCB+37cY8eKgy+4WFCdkIv/dFsfVU2ctUo17GkuxpB6SE/rjfoyLA7L0eQYOi/lhwL
         Z4Kq8VrPDZoYfRBySAO1ABGHPuak8VEJTLXKkeU51h/VcfDh7RdTVaXMCl5hFXtyHGOp
         hS+2dNuL4WamTDmBaeYNz2ygW7hugmfTW92ob4PenTEC7Mxgwr1EWVF9XhC/rh8kpBNv
         CU5e6krvjFBiPQ+HoB+i0MeNvI43DA+UxzjOTH6gU5nsYpwTDjg8dGzgc0+CCG1hTEKa
         8WzEraYLXqoLtoDFxy7ekEArepYOA5MZfpYSQZwWEri7WZ5XaNnrmKrN9BAvAiY3QU40
         f3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794679041; x=1795283841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cYa2TSoAQmE/xTgSAEM6U6puxxQ1kN9FMLv5E3CPD7Y=;
        b=oZ8xU7O9FkUhXWv9vf4N9tSKIMoG9IMujdwXmssymZuEm0U/WgFHGVtSjiU+Lw3e6E
         fyi0JD1Xd36fMrcC3yLcc7I15kvUy4TvpwY0tirF7a8Tjs/1g7pwL42wX0SA35SOhym/
         FdEatAtB3sa4QgJokCcWGDAaHstBOInzLq3JoEoJ4eUSytmZ8w4c8CYaa0/nUiQ/Teth
         mOgBuI8tiPzqEpgZ8FWenIE24dvVorxCqSk/ECmqsBIP+BP2JDdN4MJv+rpS26lqwEJH
         q9TdOVludSE/RVDlrk/Q4Z1Zn0bQFJ+xtYTRYoE1c2RL5bouNshfm5u8rIPy89aFWJl/
         tLTQ==
X-Forwarded-Encrypted: i=1; AL+hErHhp8e8iWx2DtqGfqimJxgsUFKlLGYzZYd9ASwV9509XScT/W9UAnyJiypbiZsg0fIJYtS+owjFv7r6mk7RCeZQj08B@vger.kernel.org
X-Gm-Message-State: APuU4Z+s39tiSbkZ95nsEpoNt/onGiXWcPnFpTW8/USxSAXIZz4IEowv
	6398a6nM4BHn2CICXbA8zDrITluAmfJjuFFs+yiAFUvklnD2aiEqsgWW
X-Gm-Gg: AYBFou15nMpMLVYM0m6acIyZ2ImtOoHsEJe+mQ3LLp5U/erKXoNRXuVx26gvgLnZtnL
	o9v/p/9RvQUetdJQg+RmZygjXp6I97uPmjLKYjbkwEcvOo+wt4IQ3vE1e0C4fRg2qk2cbKFb8+F
	eUMOVZrejUBzjKVR3kfX9Gl64CjOhdRTWRZj80aasN8eYtmwY5/pDpg3yH98u4T34Y2BJiGJs0u
	QJmBe3zjkoq2jiqNbKWdHwC7hA31aveKeQgv2HIQFXEnjiQJzVdO4xl9qcnFHANmrqbHqfLuwYH
	dG0TpSOneWnaU3PrvPfZRXpw92s1QqirUSYVX8/RXfIrj3UV1H/8drkKn7o46r2SSKL2fjDnJH/
	SmwfYzyDhev1IWSGccyFKg8zfJ6D0DAYEQ6BzsvvWT6XFnYVck83eZNJBDYXV/8693zsWLUC4cW
	SjJrI6G/sU9yqaXOJylIYGIYfqZkITjmEZX6yBD27+ggfmAn8jZ/WqAtiJjBgpsPAlRai0ksW9j
	W2eejmmDh4wCBTw15xhhSA1M0/u55ogoYiU5mfCUerXtFXUG6hFxA0VlJw4RY6jVz5MXzGWruw5
	92gnPt0f0vfe3k0ljCtAPEnhaYO4
X-Received: by 2002:a17:90b:528c:b0:3b0:a9de:9884 with SMTP id 98e67ed59e1d1-3b1b0a4e3bbmr5481995a91.40.1794679041160;
        Sat, 14 Nov 2026 09:57:21 -0800 (PST)
Received: from ThinkPad ([192.220.23.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c6c9c5sm14569383a91.1.2026.11.14.09.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:57:20 -0800 (PST)
From: Qiling Zhu <kmatzkaczor244@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Andrea Rabbaglietti <rabbagliettiandrea@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	vishnuocv@gmail.com,
	vsankar@lenovo.com,
	platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qiling Zhu <kmatzkaczor244@gmail.com>
Subject: [PATCH v3 5/7] platform/x86: thinkpad_acpi: Skip LED suspend/resume on auto-mode machines
Date: Sun, 15 Nov 2026 01:48:12 +0800
Message-ID: <20261114174814.62153-6-kmatzkaczor244@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114174814.62153-1-kmatzkaczor244@gmail.com>
References: <20261102151211.40701-1-kmatzkaczor244@gmail.com>
 <20261114174814.62153-1-kmatzkaczor244@gmail.com>
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

On machines whose EC supports the auto mode (MLCG bit 20) the firmware
takes care of the keyboard backlight across suspend by itself: on a
ThinkPad X1 Carbon Gen 14 it turns the backlight off on suspend and
restores the previous level on resume for the manual levels, and keeps
auto mode across suspend; after hibernation from auto mode the
backlight comes back off.

Skip led_classdev_suspend() and led_classdev_resume() entirely on those
machines: the LED core no longer enters the suspended state, which also
removes the window in which userspace writes and pending
set_brightness work would race against a suspended LED.

Machines without auto-mode support keep the existing behavior.

Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 681b340a1..f9e2d324d 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -5317,6 +5317,14 @@ static void kbdlight_suspend(void)
 	if (!tp_features.kbdlight)
 		return;
 
+	/*
+	 * On machines with auto-mode support the firmware takes care of
+	 * the keyboard backlight across suspend by itself; keep the LED
+	 * core out of it.
+	 */
+	if (tp_features.kbdlight_auto)
+		return;
+
 	led_cdev = &tpacpi_led_kbdlight.led_classdev;
 	led_update_brightness(led_cdev);
 	led_classdev_suspend(led_cdev);
@@ -5327,6 +5335,9 @@ static void kbdlight_resume(void)
 	if (!tp_features.kbdlight)
 		return;
 
+	if (tp_features.kbdlight_auto)
+		return;
+
 	led_classdev_resume(&tpacpi_led_kbdlight.led_classdev);
 }
 
-- 
2.56.1

