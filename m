Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634889;
	b=sNK2mmO8/uEOowY96qMBUs9GjpkHk8yLmPK0OupoprbCH5q3A6m8DVZO2FNNxZLJUSaf
	 r4xnbXW0Ymx4Ud5Pf3uqTIxtqtrVcu2ujaH3VFXuX8P5hdoT6PIKMya780PTAGnXvMuth
	 4D6v9G/ORan0Gwu/0AKPBt/PQwXrHXG1n8sow3RjnVAFK7KwV//UjpOqW5sIKqxaWjoic
	 mr0TQNihLLzBjwIgMMEm8PuJcYiN7EUA/mobrglUqf8c1OGu9NLqi5P5PHp3aXmWY8N+G
	 2LYO1hKdSpziNBwEfOAUBzg5LZOP1bmC7IR5V+wgOHxHN4S1E/V1YVa9M5wKzGIDbHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=yhNqEjK5OD5F9LH0oqPITMrFOIogMdQoBpXA7Ob2Y74=;
	b=K6Bo7AelCgyoxc/ew7wHvISseIOj/CQh1wE1DMmZLXStnIOiH5SIEzF8BIVfDiRmTHVc
	 zpxVgSPPhZwnwaPIkW3q9Ao0OOUWYAIbzXiytwTs57MaRJxSc4bck1nPPk0aZtAZ2Gb3O
	 UhSobMp0Zy+i9Jldurb0VorXc+JV36RfF0xxfuVMk4zhGaf03QNwDdjLI5Vk85OfIfp3R
	 xXdVgkcGhOC+GE9ZbNMXAjHUWWvZEhLHKML1Uh2BGL5u7hC709/MHl4Fdnpjpxafj436I
	 hudixWjA2hX2lp06+vHK/d/8ncfI0TppTEJkwpy+6kn9wZ5ASgDlBvnhz0XzWL0LPQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i1wfB7H5;
	arc=none smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EAF607B478
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Nov 2026 15:54:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67EAF607B478
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i1wfB7H5
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5ead32bc7d8so1886311e0c.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 02 Nov 2026 07:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793634888; x=1794239688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yhNqEjK5OD5F9LH0oqPITMrFOIogMdQoBpXA7Ob2Y74=;
        b=i1wfB7H5dsXJook44yczyB9c17AS9A+4OHgVqD7j3AtgwfmIc3dPAYsjP+XhsgSlpX
         d6NMckGjz7RJgJDBshDuQjKmePxG4YR8p77g9OE+FbyZAXWb2SN1oghg/Ia7uFUvDScg
         mXcVFg5KF0n5ExVl6BqQYFOFEl+j9c2dNJhXtsBOpX/dbDeGU6DJIcq7/va8u4TQ0lbR
         30/+7hHJd3+GUesJ6p7mBGzm0kN9xJDC/dFG8j1mbCtcMfjcMJ71cNY2veEfaDCvbt9Y
         mXptRpEthIUAYjgICtc0dswYnH+zM9tita0D8XRSntVhEZtLW1mhBX7LnRrjHplqjnOn
         W4gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634888; x=1794239688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yhNqEjK5OD5F9LH0oqPITMrFOIogMdQoBpXA7Ob2Y74=;
        b=xL+/QxNRa6cEQsFfWv0mhvMjBkSdi3sn7CC5OUaxmc+LN6DwIS2CK0S02WReDho0i6
         VQgqr7x/TkO/ODDzksQXuMjvSfxqSsActkJvn74insa/dkLHi8XVHNlVvx4fTal2JieM
         O6hl/2Aryf14oZ6b3RoI131p6QT2lvNYcr3KfAxn5D3cSFJVg2Lzlbyul3viyLQ+eCN1
         jk+qyysTWb85tMPcvmiz/DfRxY13nrsnPwnXv2XKY7G4HRPC/kl4M8U5i6Ujx/aHixpw
         U6oHOg4BBM6KWcvWB2I3sSQ729JgKKzmxYts7M+S5x+RIp7H0CszpadPHBdCS4V3zcWn
         UFcw==
X-Gm-Message-State: APuU4Z/b6FuicCGX1ydZI5IRcJ0GgreSQ5U8KtCnC0txCtVFWQD3n8cy
	ENE1YxWD8J8aGTFaSWJ8/eo8gop+Ns2I23ysyKmvrYp0wRYAHCD7pBADewbEg6vo
X-Gm-Gg: AYBFou2f5td3cqgLNHpko3P1qh2bSefvwx47i894bPk2pD6dLY6k1OKMfksXKGPIw0c
	bs/L21GJ3L6fy8vDVgW3/8WA8bC09pzfSYCBmowqUM+QPQWmNn790GyghhjQRfI0VqEi+wFqZWH
	Wus29bv8g2/g2dCl6nNtGAvf1C/2u9eUw0ATjCvSdWFsgDHUeT43edc+O/7pKllvtJbJUHeUQZK
	2pN7TRKOgcV/2P9mngu0gV7bBVUU2sSxdbLWREkv3eGa4Dg/CbN8ifDFAxu8F8dZ5HkpmAFVj9R
	Y2y9dITz6JlcDichdVKwNy3xc66g8F4KePTmUtg42Xv+ESVdPLEIH6Oado2qXLIuUAFmPAnlOjw
	/hTxXeYezf51bWKQmam2oLRQ2+pf8YGAanYxFNqGc9RCc7crqDL1ItoaaOq2R2s3INRNb3IdnEO
	XD8xb3/iy/QzCG3aBaGYliyvchCxQDESn7OLBe9LFYj4tCvuxBsdm8QcLJFblStT0C3gDzHsaGP
	EQrWDc7Iyi1KjCgNcsYMTO0XeY9kjXv0oTjl7EnhGxv9TLrubQf6wse0f2Trjna+CGlERmPfobl
	UvoaO5gidWwHjvhF4dEtQS597z/l0cqlgP65ERkGo1SymkSDJQOLZLQU25M1/kIUXW6KqibR+2M
	r5iquZPREqUN5NpQ1c1B/H6UApuTIDMf27DpcGoTDJqc=
X-Received: by 2002:a05:6102:c4a:b0:7cc:828b:4216 with SMTP id ada2fe7eead31-7d072cf3169mr4449450137.29.1793634888361;
        Mon, 02 Nov 2026 07:54:48 -0800 (PST)
Received: from hp-omnibook (p4ff30cbc.dip0.t-ipconnect.de. [79.243.12.188])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d077393404sm10195755137.2.2026.11.02.07.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:54:45 -0800 (PST)
From: Sergei Volkov <taranarmo@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	Sergei Volkov <taranarmo@gmail.com>
Subject: [PATCH] platform/x86: hp-wmi: Add OmniBook 7 14-fr0xxx to charge_behaviour quirks
Date: Mon,  2 Nov 2026 15:34:38 +0100
Message-ID: <20261102155409.3061761-1-taranarmo@gmail.com>
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

Extend the hp-wmi charge_behaviour quirk table with the HP OmniBook 7
14-fr0xxx (board 8E3B). The machine exposes battery charge mode control
through the same GBCO/SBCO WMI command 0x2b path as the Spectre 8C15/8C17
boards: inhibit-charge stops charging on AC, force-discharge discharges
on AC, and auto restores charging. As on other HP designs, the firmware
retains the mode across reboot, which the existing setup seed already
handles.

The extension is only registered after a successful GBCO read at probe,
so boards without the interface are unaffected by the new quirk.

Tested on HP OmniBook 7 14-fr0xxx (BIOS 94.19, board 8E3B):
inhibit-charge stops charging on AC and auto restores charging, and a
userspace 80 % hysteresis policy on top of charge_behaviour holds the
battery between 75 % and 80 % while plugged in.

Signed-off-by: Sergei Volkov <taranarmo@gmail.com>
---
Based on git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git for-next

 drivers/platform/x86/hp/hp-wmi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 52077833a..ea510696c 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -634,6 +634,13 @@ static const struct dmi_system_id hp_wmi_charge_control_quirks[] __initconst = {
 			DMI_MATCH(DMI_BOARD_NAME, "8C15"),
 		},
 	},
+	{
+		/* HP OmniBook 7 14-fr0xxx */
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
+			DMI_MATCH(DMI_BOARD_NAME, "8E3B"),
+		},
+	},
 	{}
 };
 #endif
-- 
2.56.0

