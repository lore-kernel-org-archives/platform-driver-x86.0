Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3353E559A
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 16:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792081906; cv=none; b=dHQ3Bn4464wDwyhkRpArzeYhH4PORObbviYncSJx4hTZW54Wo2e/T4cWy7DdMNuL5z38KApk74mAAzwwyJC/n30oNvqqZbaidw9Oq0fYXSG0z8louI4ql+2yiD4r6P81Lrgi1GzcbSNqlo7kFnS3PEjK4rqudCoaB2fW50S6UEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792081906; c=relaxed/simple;
	bh=USSRRKRHb1tZ+dj3KVBcFL3RqVwYm82zAKdb47hmuj8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ib1MVllDU84kOTh0qhEFybvodph7CvA2RewcG1TMGI7jA0lCqUgLJukJpvmbzfWeEEkNabVEb3FSpRWWBbAUY4ovnuHP1JgINcR4fW7MKo1D2VbuZsT6x/LKwNGIcmRFKMpHNQzgsBq+q6JaBGsVFNqzsIqgAPlCwMBt0cypq5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wb6zJUhA; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wb6zJUhA"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3a771ad2a9aso1345541fa.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 09:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792081894; x=1792686694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9YdI7qlJbZdihd8Em1MdyzbWsxysosA9gJKj9ci1eas=;
        b=Wb6zJUhAtWmuORyFQZ9dtYNPqxy6AGKuNu6zdRdwBLfpZvAOEwktLfUS8ReV4vbIPx
         Xx7TLVlOM2iczUFfFQhOsrmZXd9WSpONMv1g1sKAH14OmGbcmlyJAWwwObu9Zr/BB6yN
         DKpS8EFFzQh2WisYbFM7AmpeV2m7TIOtFfS2uWwtqQLNOdLmsp08k4HAQFH0YxawLUxP
         z4PKiqwEJCmUoVreXDDk3orXAmqoXT3n/vdqESfa+x0f8Gh1b66xTK839Xjv8FHyJQ3D
         KmBWUcyoe3QvxYlqZSTekiTmmaIAlsPaeTnzamP08B4Yx/4/p/t/e10uqHOQBHbPY/5w
         jWkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792081894; x=1792686694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9YdI7qlJbZdihd8Em1MdyzbWsxysosA9gJKj9ci1eas=;
        b=Ij8avEQ/W1uWPbzayazlJvtgGc5NLNrqMjzwpAH3v4bRrCAVlGupt7Z8+qzrKroLpd
         JRDZe1BvOYZOX7QIw5WT5ygUR8wntMMAS85aY4TuXwuFWH9ZhaE/rMKk76fzQsezt9Bi
         1sUJrGwfh5/WahKdezuw2t83qsMCIA6zvkEETGH7XNfan+c7R+hHlAFsvCOybdiqnESv
         VyaJZ3y7Rsl80tfyNFkAv06auMnRYYG41XBemsTJq6a+EQNGiz56v/PgQ3Kkz+NDjJIx
         FpcKP22+Y0Z/bCAWpo0i/hSIlSpks6V3TWbBSke645RzvuIaKdo90cEOriQyJlaMcmR7
         CGEA==
X-Forwarded-Encrypted: i=1; AKwUvBwIDI9BfjQHxjU+KXNKwuoqHRa8Cvlo/ytXbQd+UxhY6QncDZJlPfWMDQ+jYzMo3wI4Txodqhc9ddoB+zj1okx8jcN9@vger.kernel.org
X-Gm-Message-State: AFq9FYLoVjG+yrngrb2WO23LeYIu/cI3fisv+xCXb0bjThnLLxZO/GUO
	/f0FMC1c15kOZVCRXcFhx5ozdpVy4LkoxAKEHV/yDXDIpPXrXO7QTMEx
X-Gm-Gg: AYBFou3hd8I6c4PUtEKtw335LGGGXpt41nDnTLoSnvzkLDN61QbkDrgR5kLSS4ZYKMh
	9J23Bism9t6u6Q/plhSezAa8YbxDYHY22a8G5Pt77RJNT87TKONlSlfdj8mSvbJEv0OnxrlNmgQ
	4CQguNRDtvSls7lwPbZC8/oaeJum/55c3KuHp6tXjOURFeXVBKfEnyf1Q/zKlzpx2bTKwpo/DtU
	VXBIyao0Ptz+d5jjmgtL8L2s8STg9IsLqWYZGNLPL/dZW2KhkpWMr/s41K/an8bxuTLXbW/KR49
	uP1h2A6FabQuS4qCExcoyCKaHo9ADBzGz5Je54WXhOXVYEeesRpAA4C7nZG6fGpPWOmpQ70BxhC
	CB7Gz3Xyi2arElte08RpbhYOeUKEsDebGIDEd9I6cS+2o33fcCBKC9w6pCZ9ZakDGj86sxdmqQV
	h2waFRkjtubzPdOTezcAERruCZNCB3+A2XX+u46K1asP7NDIo7B7M5VwH3TnGtukzQVEzofj4kE
	YdkFuWRqKFDvSg3BD/khNnL6AkMpG75hZG88CA=
X-Received: by 2002:ac2:4e0e:0:b0:5bc:b5eb:88eb with SMTP id 2adb3069b0e04-5be476e47f5mr201037e87.24.1792081894318;
        Thu, 15 Oct 2026 09:31:34 -0700 (PDT)
Received: from zephyrus-g16 (89-179-242-53.static.corbina.ru. [89.179.242.53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d857d9sm1508104e87.49.2026.10.15.09.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 09:31:33 -0700 (PDT)
From: Evgeny Volferts <eugene.wolferz@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Evgeny Volferts <eugene.wolferz@gmail.com>
Subject: [PATCH] platform/x86: asus-nb-wmi: Ignore spurious 0xe5 events on GU605MY
Date: Thu, 15 Oct 2026 19:30:28 +0300
Message-ID: <20261015163029.107250-1-eugene.wolferz@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ASUS ROG Zephyrus G16 GU605MY periodically emits an
unrecognized WMI event (0xe5), approximately every 12 seconds.

The event is reported as KEY_UNKNOWN through the Asus WMI hotkeys
input device. When the session is locked, it causes both the
internal display and an external monitor connected through a
Thunderbolt dock to wake up repeatedly.

Add a DMI-specific quirk to suppress this event on the GU605MY
without affecting other ASUS notebook models.

Ignoring the event was first verified on a 7.2.7-based OGC kernel.
The DMI-specific quirk was subsequently built against 7.2.8-ogc5
and tested on 7.2.9-ogc2 and 7.2.9-ogc4. On both 7.2.9 variants,
the DMI match was confirmed and the unknown 0xe5 event messages
disappeared.

Signed-off-by: Evgeny Volferts <eugene.wolferz@gmail.com>
---
 drivers/platform/x86/asus-nb-wmi.c | 17 +++++++++++++++++
 drivers/platform/x86/asus-wmi.h    |  1 +
 2 files changed, 18 insertions(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index aeb461b1644d..8d69231d25a0 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -150,6 +150,10 @@ static struct quirk_entry quirk_asus_zenbook_duo_kbd = {
 	.key_wlan_event = ASUS_WMI_KEY_IGNORE,
 };
 
+static struct quirk_entry quirk_asus_gu605my = {
+	.ignore_e5_wmi_event = true,
+};
+
 static struct quirk_entry quirk_asus_z13 = {
 	.key_wlan_event = ASUS_WMI_KEY_ARMOURY,
 	.tablet_switch_mode = asus_wmi_kbd_dock_devid,
@@ -562,6 +566,15 @@ static const struct dmi_system_id asus_quirks[] = {
 		},
 		.driver_data = &quirk_asus_z13,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUS ROG Zephyrus G16 GU605MY",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "ROG Zephyrus G16 GU605MY_GU605MY"),
+		},
+		.driver_data = &quirk_asus_gu605my,
+	},
 	{},
 };
 
@@ -690,6 +703,10 @@ static void asus_nb_wmi_key_filter(struct asus_wmi_driver *asus_wmi, int *code,
 		if (quirks->key_wlan_event)
 			*code = quirks->key_wlan_event;
 		break;
+	case 0xE5:
+		if (quirks->ignore_e5_wmi_event)
+			*code = ASUS_WMI_KEY_IGNORE;
+		break;
 	}
 }
 
diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-wmi.h
index 5cd4392b964e..e7772397cd10 100644
--- a/drivers/platform/x86/asus-wmi.h
+++ b/drivers/platform/x86/asus-wmi.h
@@ -41,6 +41,7 @@ struct quirk_entry {
 	bool wmi_force_als_set;
 	bool wmi_ignore_fan;
 	bool filter_i8042_e1_extended_codes;
+	bool ignore_e5_wmi_event;
 	int key_wlan_event;
 	enum asus_wmi_tablet_switch_mode tablet_switch_mode;
 	int wapf;
-- 
2.56.0

