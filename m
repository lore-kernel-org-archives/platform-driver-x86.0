Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795678283;
	b=aAsGjAy/DWa/08gbYWB3gJOGzzzLqXFV1zy+CR5O2Y01fn4okMDJix7jMh7pjAUQdYFM
	 4/pII2uCfs3DjGCmY8l4l0SyF+84sGhI6TjfKU4tap+9R2ekjZ3hPaQ6pw9iFohNJ+ib8
	 prbzDNtJdKdpdEsECD+7XBTQ2g0tuuU8E32MlzRplU9LDBw5FZfj42eAQTg6D/t8WpDBR
	 XPVFybphEy3anYtX/lTB+sUSqxuvWxVWywdm3Xw1bc1bvS0o/Vi3v9SQSRYPxhd2zjOfN
	 xa9xsD+TB+5No28cbIU3ST4/SmtNN5xuF1wtfZM+o3Am/3htwNUcVoxQ/05wlJOdiqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795678283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rBNTBr+H6EwcDVHNor08ba397xyvQ+ksvy1NJd+AEPI=;
	b=2/CjwMoxjMUCnEJv4AapwFsO1fuO4ThBpq6ssRsf8VTLLMfkKMbmX2teI6ec6htxKbHh
	 2pbvUOM1WMDtbESvegmlPnx6oEDxuShg5Lk6DjIbA25FoOZGl1nHEtz2zQFhMbWptbtXk
	 8ONI9NsJtPppTqbcrWCddqgLpSHhEY00+UfL3Cn+IsyaHbG/IdJURMCz4OARUKIvPnuZ+
	 N/eYhov/deoeng6LxJsEYjIOiub0nTLOATF22NrnkT5KvKM6ZYcmfbU1byZd8EujRpleq
	 2nP7MyPUADZ+2q/0ZKwV8aQQNqphzlURsxnFx7sJq/mywsu1EAdgzYK/4vdEtXTgrqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QLjrXMFw;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0546606A31E
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2026 07:31:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0546606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QLjrXMFw
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a594d313a3so4462064b3a.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 23:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795678282; x=1796283082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rBNTBr+H6EwcDVHNor08ba397xyvQ+ksvy1NJd+AEPI=;
        b=QLjrXMFwkQ+vB9OgMQLlVDY1Xs3OisRoWkndU/haWDzvn5r8MQ87rSPbClZ89MTZm4
         hHc3TlXdGVEJVcAi4i85fpJ6ifSQd6lnazNU3LZdHXsWWRXbsGhPRg9CwTLzDykoF5MQ
         RNosFZMfo3HnZ5xbvxY2hHsaK/dBz5DoNHSQO2qroFj02iRyiTWa9gTt28rYbY1lDClg
         /MC5zj+5WagWD3TDqdKqJsSUPQZ8KS3i1DLSzRCIziqn7bB1AnURP3d9zYOeRM4HBJHE
         +4YFaTSnkQwJ+BUlTMHXQdA3HcJNOBkCVEw7WZSWeU2qlIklgozOrNtdVbQuEWHU8gua
         Mmww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795678282; x=1796283082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rBNTBr+H6EwcDVHNor08ba397xyvQ+ksvy1NJd+AEPI=;
        b=dGsMMJds+Ep7qBEdcu0fY+XyCLNWo9MjqfXIeLg+QfAAfDdxM4EVyjK35vqI3QSevC
         VyMWKdZe0UeaD3QLrFDB+ZjbP3MvvvIPqUh8BbumEIlPdXbJ1nE42t/Pp9QK3goPPcRe
         d1qkircHBpRESyfDCOOrPFk8A87YB/Sqz5P2VbrTKouHlv/f44O1oAZvR0b/yEMSARRV
         oVRVfyCbsFyibLu+nC3XtZ7OtkW72VBhG8PB4zhLxAL2EaBFioZ8xfhszZ8HJ+7QdXdH
         wplInxEVA8WbzN7uRtVpXcymKg3EzLCR+2nwZQMTikAxbEnvcjcUKT4Izb2YfxLl73bT
         DpBA==
X-Forwarded-Encrypted: i=1; AL+hErFcEhwwIgifu3UevoiBSehSXCYblZCWftoA3UFWuNx+g+EyNAJBsKxmGhxISLxIpvtgoQqjVCIwj69qsIjQCiEEaSQK@vger.kernel.org
X-Gm-Message-State: APuU4Z/z5kS6H13/T6v0eBbbM8Bxox1uNHaujus61aJHekbfgNB7XL4p
	A6JE6QiWit6e9xffM8sojqtqfveACs361oW2mglO2SLRX595LUnlCBgp
X-Gm-Gg: AZFdTZdIin97OFm7ORWeX5b9pq2kuaZza7vrXhE4+kuyo1hsvShVDAGsuqdJdg1jiB6
	pu4gMdurjcaaB/90rby4UFtG+nHAvTLaY3HcAx1bbQELpWBBsbr75o/yajWPcCEM6p875Ihhjln
	SMQrk1c+vbDqEzDLBbvBBIMYlOfi9m+njTIPn1dlWR4vhebt+EvAz4yMcJShmDekCWUhYlCo5BU
	tnSeExwZPyhkk9PMyHhgwf94wZ+4r5grvBrMFlIq9vGwPoDINDoIAD3gnKFt0fPB/pcOnLfFNb9
	d1CG6OTvuYBHk/vhd3PISEjiPee4CnKzHpB1BQdfI3JJE1y7SPN9mJQcwSn4wx4c2sTNNe/t13f
	NZE3NhklCisaOfqrAsKsg0YUrGQ5WCdfhk1WDL7xoUC47Y0xWisTWDkH95+0VCnL1tkuwep7qiN
	oQRUSojKNwpSwW9zjGUiuUa4/mm64wJzBjpTr6dgh9bXKprskW5wuWJOM9WzFV4ECLSGif95gSD
	3fvFPE3zInhqa8nlblO+YhMnSVF4dUqnWpulh5fcOVWXv/imW74n6oaBFjNzHufuTa0CQseXjTC
	B4RBlQBg0faxH5F48QCu3sQYM/0Cnl9DYDXvQHbzW2GtdWVS7IF0LmSfb6nlg1ijg+PBBYFuAMx
	U7VEbVnjCktMzrp9KNNIWwbQRYzIyRHMhWcFBCUzkQBfBXZpeliS/aN5nWVUY/vK0PGGqDZUCMi
	V69AZEL7Xs8e+peQW4Xzu76Qg=
X-Received: by 2002:a05:6a00:420e:b0:899:9267:3abc with SMTP id d2e1a72fcca58-8c87ce3299dmr18009522b3a.41.1795678281937;
        Wed, 25 Nov 2026 23:31:21 -0800 (PST)
Received: from kapoor ([149.40.62.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077bff6sm10269088b3a.3.2026.11.25.23.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 23:31:21 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Ike Panhc <ikepanhc@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>,
	Stuart Hayhurst <stuart.a.hayhurst@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH] platform/x86: ideapad-laptop: don't warn about keyboard backlight type 0
Date: Thu, 26 Nov 2026 13:01:06 +0530
Message-ID: <20261126073107.765676-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
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

On the Lenovo V14 G2 ITL (82KA), which has no keyboard backlight, every
boot logs:

  ideapad_acpi VPC2004:00: Unknown keyboard type: 0

followed by "Keyboard backlight control not available". The KBLC type
query (Arg0 == 1) in this machine's DSDT reads KBGC from the EC but
always returns Zero, and KBLC also returns Zero whenever the EC is not
available or LFCM cannot be acquired. So 0 is not an unknown backlight
type but the value for "no KBLC keyboard backlight", which the driver
already handles by leaving features.kbd_bl unset.

Only warn for non-zero values, and add the missing newline to the
message.

Fixes: ecaa1867b524 ("platform/x86: ideapad-laptop: Add support for keyboard backlights using KBLC ACPI symbol")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
Tested on a V14 G2 ITL (BIOS GGCN55WW) with the 7.0.14-based
kernel: reloading the stock ideapad-laptop logs the warning, the same
module with this patch applied doesn't, and the rest of the probe output
and the sysfs state (platform profiles, fn_lock, camera_power,
usb_charging, charge_types) are unchanged. Build-tested (W=1) on pdx86
for-next.

 drivers/platform/x86/lenovo/ideapad-laptop.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
index d2344dcd6945..d5679ff2e8ab 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -2627,9 +2627,9 @@ static int ideapad_check_features(struct ideapad_private *priv)
 			} else if (val == KBD_BL_TRISTATE_AUTO_TYPE) {
 				priv->features.kbd_bl = true;
 				priv->kbd_bl.type = KBD_BL_TRISTATE_AUTO;
-			} else {
+			} else if (val) {
 				dev_warn(&priv->platform_device->dev,
-					 "Unknown keyboard type: %lu",
+					 "Unknown keyboard type: %lu\n",
 					 val);
 			}
 		}

base-commit: 61c0dac952b9308884936d05cce97565a5c89af4
-- 
2.53.0

