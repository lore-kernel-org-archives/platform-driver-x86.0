Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794060530;
	b=chxxC6aIXl8JJp3ykdtNG7GNr7Dhybq9m206R3Tyr14LO7CW8YL00f9lVuOFgOA5JMa+
	 oqqD/qm9G+tp2d7oWUpTdEsqvzbp8/h2heJbKJQR72zJr/PQNUSGEOI/iGfc2fzfs3IhL
	 MkQwcM/gsVPSdUANpHqjgiy4yGcaRGs3gbAhpp1e+OxEUXXgsdqMp8EifkIHkRkJVt64k
	 ZpA05XGiOnVZLAyFADFzNKbFDE6073F4R/X4gI2txi6tNxAGkGvoXO2cAa5C4LMCZue/D
	 zHxBD0nZyCS8Y09Gz6/o/jSU2IfHhTY5IOvvq7Sy39yn+wERBddn954M45GQPvTbZ5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794060530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Hr16Fowc+FBEmAYx4CWWn17wGWcX/dD/MZtdPd+ASsA=;
	b=Qxvpja04IQjEq4mqMFKdFJZ+c3S7vHrdDZpY3/S30+SXuH/zJwhMXOSJmXxWG0LtNT5+
	 v1KSEGD4H6Nr3qF8b6ddMleOeB77mRSXnuJgo6klH+ymOmU3NhLt4P8tsT3mM76MNu0Hn
	 pV9PaIB9gWTPDX9Hh9EZ1GC74U4AhFFUeJXqG1FZJvY3aZK2vlOkMTwa7DrSX9BRhsY8R
	 ldhhao8BRtRYCZjC4HVhghGGe465noynLiCwZOzJ8H36EbIWEAzrLFXqjbTnhowvKnp03
	 HE4UOgFrBGmvc2KhmO4+V9pbLzMZrAPIDKpBZTI1uDJaIOLbkn2glCxXSz4sCRBcxTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="T724W/Lt";
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0DA606A326
	for <platform-driver-x86@vger.kernel.org>; Sat,  7 Nov 2026 14:08:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE0DA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T724W/Lt
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so2562053eec.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 07 Nov 2026 06:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794060529; x=1794665329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hr16Fowc+FBEmAYx4CWWn17wGWcX/dD/MZtdPd+ASsA=;
        b=T724W/LtQ4ky62wb76RYKI8r85JT2yclvz94YgeazwQ4/coL+6YO5Gec/9nSj7AqNi
         l7RwpFuU9UgLOMaI0TvjcLXmtolpEzTYLvoTZTLpWcmrcmc6absy+JekBbfAya6UkMON
         /ehVuyRrkP2aHd/+XRYavSl8rsLYcCagSrvoY7sZ+j4AIIQ6Aw4vcGHgONLKfG4Y7fzT
         7QW0yOm4/edQXTokHAOKC14hCYC4GJjNGBIIoAmWFJoVSK3zPX+eRh4jzSfn3yKokxCl
         B4a1NNurm3wYgRfU+VtrZ0nxfHkEahbptyhiQVB83TTUDbFsnJBIa7VL79FgE+gtzJGo
         8h1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794060529; x=1794665329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hr16Fowc+FBEmAYx4CWWn17wGWcX/dD/MZtdPd+ASsA=;
        b=xXL02h7qVDSjikik7uj9/GTt+9tcW9878Cr5oAg/8tuZony2ysmGDCIxFmADnU7GM0
         +tZF4YLGqc6tmWp2+1qxTHqPh7DjqRhT9hMbisjbheUlGzCR9fRgNeIOEAiz9/cPIGWw
         xrWv0bymmXNSJz5DC6mbKt1H3eCnLk16dtPoGGhbQcxW3VBH0VUXMWuj3hKxtpQHOY5j
         4FOlSp/hIIUdOAojBsFxt44Ww5Y5CDj6Hvkuo29xaJ/T4LcZEjYdg7NMg/sfQyuzxvQk
         DdApOWbjo70kogFtFTsPvULIe943JtRdKDKqkTKrVKSIyTBmOhjKjfg7gxZJRQneVRar
         DutQ==
X-Forwarded-Encrypted: i=1; AKwUvBx2qlnKT3zAF8V0rEgre6Oz+4Nk3iaGcM8AIOdKeiQ/d8gcYUF880kU8hkxwc3M2gFBlm+xnDTWi/yR3ZI1i4twlOD4@vger.kernel.org
X-Gm-Message-State: APuU4Z/k2K4GaEW6aZxOiFJGK5+K45zgvREmwNUskYz7r/+4V4zMs0WY
	lHkh2OgvJbqtoIkji9VlS7CvFwj7zAntz5I/IiEaCoU18gkZyg5tWmv3
X-Gm-Gg: AYBFou1OvpEj9cAZRsJa7c6N9+pyVPV+JjYHsffoJDPKxduH1MYIurmWNsahjNn2k3F
	iTskabTBjULlFa7T41d7jHjmG6Jzn4pMK83WgklV4oOHjPa3DESpsCVKtBiA9oZ60lEF8lRAlk8
	wZRIqXJR7gRyBzu6DC3gWK1yY6aQjRbdMRK3nXZOUTv/p4HZ56O8mVOE9P5Ic240Q8obIBhAtDV
	nsoZRifysxWUJDpifQgCOUn11n9WH4pPhc/agctjI/e6VigQQ0N57wHbU5qoN3NFxXxDD+85cYW
	SfUIbPliSPy0mYHC6gwtiCgpT4GyQWjI5MyJqAsexUp1Ci645mfc24Wn7i3oxw7ep1uwfJ1rrhd
	iRYQLkUtFhMsCxM2ouI70zY5DxhVKCGbCdMgS4q4oXK3u62jn5nPCR95G+np73pnSPXQtPDR7mn
	3OVq2Lb6z5n2++QamiQY9m0fWBJMWx/IZVAZKNBeodnIClUHRcge7NNl1PtBV7qTYqfFvI3vzJM
	0q/BwR9SRnj8fwMc47EJfg5U+o0Vt5ZsxfwW63trl+zVrUG+FanTGI0wXBvW7Xv7ZRX7ufNSOa+
	KinItGqTSw38Rxtfdd3pNEHM3/Tu7RtCK2KoWSUwrYIWanm6JhDufRIx1DCGG8mwz4oELhtZfTF
	RLwMtcgxJ5vKZj5cJ
X-Received: by 2002:a05:7301:1887:b0:361:6884:78b1 with SMTP id 5a478bee46e88-36f7671a78cmr8352073eec.28.1794060528719;
        Sat, 07 Nov 2026 06:08:48 -0800 (PST)
Received: from localhost ([2401:4900:1c6e:17b2:fef3:c40e:ca92:2036])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea75fsm27571401eec.15.2026.11.07.06.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 06:08:47 -0800 (PST)
From: Punnay Sharma <punnaysharma805@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Ike Panhc <ikepanhc@gmail.com>
Cc: Punnay Sharma <punnaysharma805@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>,
	Stuart Hayhurst <stuart.a.hayhurst@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: ideapad-laptop: Do not warn if KBLC reports no backlight
Date: Sat,  7 Nov 2026 19:35:56 +0530
Message-ID: <20261107140700.16036-1-punnaysharma805@gmail.com>
X-Mailer: git-send-email 2.56.0
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

On probe, the driver asks KBLC for the keyboard backlight type and
warns about any result other than 0x5 or 0x7.

The LOQ 15IRX10 with an RGB keyboard returns 0x1. Its KBLC sets bit 0
in every result, and sets bit 2 for the type query only if the EC field
GZ35 is 0. On this model GZ35 is not 0, and a separate USB controller
(048d:c693) drives the keyboard lights. So 0x1 means that KBLC controls
no keyboard backlight, but the driver logs on every boot:

  ideapad_acpi VPC2004:00: Unknown keyboard type: 1

Add KBD_BL_NONE_TYPE for 0x1 and do not warn about it.

Tested on a Lenovo LOQ 15IRX10 (BIOS R3CN44WW).

Signed-off-by: Punnay Sharma <punnaysharma805@gmail.com>
---
KBD_BL_NONE_TYPE is placed last to avoid a conflict with Rong Zhang's
pending keyboard backlight series.

The same warning appears on other models, e.g. LOQ 15AHP10 [1] and
Legion 5 Pro 16ACH6H [2].

[1] https://lore.kernel.org/all/3f03931e7eafcb1781ca3cf922e588ab57caadcf@lavx.hu/
[2] https://github.com/johnfanv2/LenovoLegionLinux/issues/336

 drivers/platform/x86/lenovo/ideapad-laptop.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
index fcb5ed7035f5..eb4158bed264 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -148,6 +148,7 @@ enum {
 #define KBD_BL_QUERY_TYPE		0x1
 #define KBD_BL_TRISTATE_TYPE		0x5
 #define KBD_BL_TRISTATE_AUTO_TYPE	0x7
+#define KBD_BL_NONE_TYPE		0x1	/* No backlight through KBLC */
 
 #define KBD_BL_COMMAND_GET		0x2
 #define KBD_BL_COMMAND_SET		0x3
@@ -2246,7 +2247,7 @@ static int ideapad_check_features(struct ideapad_private *priv)
 			} else if (val == KBD_BL_TRISTATE_AUTO_TYPE) {
 				priv->features.kbd_bl = true;
 				priv->kbd_bl.type = KBD_BL_TRISTATE_AUTO;
-			} else {
+			} else if (val != KBD_BL_NONE_TYPE) {
 				dev_warn(&priv->platform_device->dev,
 					 "Unknown keyboard type: %lu",
 					 val);

base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
-- 
2.56.0

