Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794212272;
	b=4v68IXB8XnqVfs0pF/CCa40JQRENDBpezAaoKwXwRFVhy625H9x8G0DEDEq9f2263jvQ
	 e2mywCfHEjSdhKeE1iBM6IeeNPCvQYNW5qaPScWbm0dbMb1cKP9jBaW35n0wIPT5tBIfH
	 krGr6CXr1vnfmG61UykKgyF2/lQLsayvlvfljkVuM57UrnwRZjeP94D9JpOHQNgC+pOHg
	 A3Uy+kJX3CcVHQtRti3Mn9o0XvLcqpBiNYaad3rKO+NhmTSUCnWggE5kPhRWMNggxmsRM
	 LdCehvacELZ7WKEP1OFGYxTW8aQndL3LDkrAfWHUNQNxu5S6xfQzAfDldh3T8Z1rokw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794212272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=b+9X6T2J+3RyQAnAuQX9Fg8kfH/4OEFG3vx3P/BfQ/w=;
	b=J9bN/ngHa0bGQ3S3s+lkNqqXDoJnLqMg8//aw+LrQ/QkM5Ar5jP2bilxrzFWqeiVBnMl
	 2nWg+86puJPHOi6S4LyjqCFPahQEKCVeN798iJLOe/FtTcFPi6xv5X1PlogoeBalv0U1y
	 XnbWpxiigWIPyL4ai8+DmUByKH33pCyIzOhwr+SyLd0l9IH3pLMeze8g3Qkxiofoc1BiT
	 sKx+xozRPCpNx5zpXhoz9OBVfmtk9GKP9jQfbdM8nYMsqnnBEH2UZ5uDhXN698Fm5GffT
	 tRor5E/d1DxsGwX7Hk5qPr8ZbDMZmgpbUsHrqrktv/V/xt4YxCyaQC34HiiUxg8/TIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cNwUGG0A;
	arc=none smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA68C606A337
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Nov 2026 08:17:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA68C606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cNwUGG0A
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5bccb867d6fso689554e87.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Nov 2026 00:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794212270; x=1794817070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b+9X6T2J+3RyQAnAuQX9Fg8kfH/4OEFG3vx3P/BfQ/w=;
        b=cNwUGG0AArH5cx4a7e4MD+zCA+4QMWJrHBWL/IlUWzR/olJz6Z7EpQtiN/14oRMwkD
         rd6nx0nV3z0cl+SnMQhZdJNyT+0f8OS0XEsW+KkRYvWwNr6xL04201nbK7SNCyIQSnc9
         fEVP9PLwBw7ZYua+6T2/5CHi9UHXhFQChTrMBNbYfNi1v+hqyK1vC7psID22gZnTnKri
         z1YToM3BT+/6iaaVtPlFd8l7Rk6iOKhJledwFe/caQwXuEPPzetJaa0/BL/y0+sphj2g
         7AKY6ekf2i1xGjO7DSq0KbHBXex6XyxQ0g7epXQcWQ1TbL6+rlT+5TDd4qLjz5BC+G7K
         b5bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794212270; x=1794817070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b+9X6T2J+3RyQAnAuQX9Fg8kfH/4OEFG3vx3P/BfQ/w=;
        b=ZOY3xFcgjPwtaDtLU/y4VavgeGzS52ADKZBuVydMhp/6asG+sYU4d6kjKuQqnnTrsY
         9t7JB4/FND52aDuXoB4KBnCpxdUjpfKtYmTA5DjL/MxQwDjsd73cUl/gVeFpZ9hWwiE9
         +G0znGYi4w4NDVrwb5SMpBXLCz4TM+goTZ9deLeJI9AW5L3X2Hsl+vgREowSDh/3rXn/
         W3iH+spn6D118pr38iE28k0FNmBmusJfkVoOKGu8TH0TxhHToWES/PuJg8moN/6w9T9e
         oLjg/PffE77i8XehH7a0PJ6XsFUo1S4ca48+F91DBacz0dCu4kXnK8eM1AUuVHfxObQl
         Zj0g==
X-Gm-Message-State: APuU4Z+DeB823azdmydcTibgdEhSiezdr1T6VTQ7BQmNMwOYmvtnX0+M
	F+8IyHJTCP91VxsZFcIafZRMl5Xpc7ioNiZjBNVIiLAbj7uQ083eRrf1QUMPGhf5L6TdNw==
X-Gm-Gg: AYBFou1wpKTNbq3NQCOHDwzVCf+71YXIYn2+udnsfp5x9vAwwM1OLGokhMIIUxf8Wph
	fR0Qva+ii+IDCWhskrArBD/I986BujtenazitgmsgQjRpFYl62vWblcoosghXbLC3yygVNuM8FA
	xHazLKScmxush5lI2TGmtBMdUlfZ1TuDV+f0doH/0xQ3q+W7+CBaev2KVyT2rp9yI48C6rhJwj9
	DSZ7fjnkydxM0sNypzhrPCEquG0CGWhgw/6QAGI8S5ZoaPaU8Vuiz6kvPz/tnelcXRUGrPAwHnU
	ROXWBpxu5QamLrAtE82Pu+EDAdj1mtes2OSPeyw0XL5+uUlYtZgqlkKeX3qIhIbaYbTdcFu1I1K
	xWLAWCs4L3PwRVWdmz3sHzOaW5p2JAYttufIoUZtB9tfzNav+RaknY4a3Ih6T9z0VAOF/ZuJsck
	Zcwyu8y+aI04vxpGys0DSUyaB3o6e5mTS+MA+BLg5g/vJO5r6fRpXqT3Rz3tNfkNdCeFdOI+XL0
	ITO9C+QZ9m+kG55K77ThhFLCfXPYqITzs14sdlBP2c9DYjeF7Fp4762es+RxsQc8dkpSAEsYx18
	F4coIMgmI14mLSqEHnUHyMds9bDz1/rbQXRbaEzvltDIR1WZEyStsHxoL6/vAlLo8P4k
X-Received: by 2002:a05:6512:3ca9:b0:5bf:a209:f81f with SMTP id 2adb3069b0e04-5c14bffe580mr794288e87.37.1794212269955;
        Mon, 09 Nov 2026 00:17:49 -0800 (PST)
Received: from zephyrus-g16 (89-179-242-53.static.corbina.ru. [89.179.242.53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c14b81d098sm726770e87.67.2026.11.09.00.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:17:49 -0800 (PST)
From: Evgeny Volferts <eugene.wolferz@gmail.com>
To: corentin.chary@gmail.com,
	luke@ljones.dev,
	denis.benato@linux.dev,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	i@smmh.dev,
	eugene.wolferz@gmail.com
Subject: [PATCH v2] platform/x86: asus-nb-wmi: Ignore spurious 0xe5 events
Date: Mon,  9 Nov 2026 11:16:44 +0300
Message-ID: <20261109081644.2790549-1-eugene.wolferz@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261015163029.107250-1-eugene.wolferz@gmail.com>
References: <20261015163029.107250-1-eugene.wolferz@gmail.com>
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

Some ASUS laptops periodically emit WMI event 0xe5, which is not
associated with a supported key or action.

On the ROG Zephyrus G16 GU605MY, this event occurs approximately
every 12 seconds and is reported as KEY_UNKNOWN. When the session
is locked, it repeatedly wakes both the internal display and an
external monitor connected through a Thunderbolt dock.

Ignore event 0xe5 globally to prevent these spurious input events.
The same event has also been observed on other ASUS laptop models.

Signed-off-by: Evgeny Volferts <eugene.wolferz@gmail.com>
---
Changes in v2:
- Replace the GU605MY-specific DMI quirk with a global KE_IGNORE
  entry for event 0xE5, following review feedback.
- Remove the DMI quirk and associated key filter logic.

A similar global fix was independently submitted by
Seyed Mohammad Mahdi Hosseini:
https://lore.kernel.org/r/d3871d83ee3f5eea3900d8bc0da1de764a8fc2ec.1791672579.git.i@smmh.dev

 drivers/platform/x86/asus-nb-wmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index aeb461b1644d..6e784a4909a0 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -662,6 +662,7 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
 	{ KE_KEY, 0xCB, { KEY_F14 } }, /* Fn+noise-cancel */
 	{ KE_IGNORE, 0xC6, },  /* Ambient Light Sensor notification */
 	{ KE_IGNORE, 0xCF, },	/* AC mode */
+	{ KE_IGNORE, 0xE5, }, /* Periodic EC notification */
 	{ KE_KEY, 0xFA, { KEY_PROG2 } },           /* Lid flip action */
 	{ KE_KEY, 0xBD, { KEY_PROG2 } },           /* Lid flip action on ROG xflow laptops */
 	{ KE_KEY, ASUS_WMI_KEY_ARMOURY, { KEY_PROG3 } },
-- 
2.56.0

