Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794679016;
	b=OFmieYMz9FJn1Zggrfj4OICLC8067HU0sMCRh/OcXPhqq1Y6BqaUmGLTqs1h0/exFJuN
	 Uft1iwjwjcPhU1S8WjMp1pJC90z2/fGYT2Rx8KfhN92N+Lkl//BOGMd3KnRDUCQtrm04c
	 pwJuE2KhgO59FQ/bRsg2NhLlhvkmHvL8GdL5D1GyUd1OK43FpNXdrZI2WcOzD/TrySurN
	 AHrx0WzDSGBAnqCbP0pLyGfdeVASWlxHByy88O9ML85CgVhcE8895eC+liA2u5o1qwThH
	 pNug2hsHKHb8HTYREUKXzi75gVid6aDaMCM9EHdTYJ+gLOx7DVDS0vzywb7dH/y/ofg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794679016;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pXqm1o11ElV0Ndq1bicxgprmqaYAYKEl+LsqCcEbzPs=;
	b=261NEx3EzzTCDoj98wqz/IDrtoT5zPqjzacFKmDhKaapd+J/LdnBjfdT4QBTsLk3ly5V
	 +6PgdHduGLdIt6bANDB0Kcu1SaUxvdGYKuJd9dFUpsx6V9TdtZKT3Og8TBq/cyk6P88by
	 UI/1S1I+LCzCZ451Cy5yDsZ5tZTGSsUx5pc843B36NuqQdgsUtIAGLvJmpqzrp9zwZGKv
	 Rzd66qWh1HXZJyt5vanXL7VD4ldVkGvwuhBxJSjri5iHgmOmZJ0Yrfp23Vseb3+QBiOnS
	 eJyT6lNSmyNc7ljll/jmlQMNA53C+P3r9e0pjVtNeVWkTn0+GwoKkDLk5Pykje31Mzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dGw4tmo9;
	arc=none smtp.remote-ip=74.125.227.131
Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FD9606A332
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 17:56:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8FD9606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dGw4tmo9
Received: by mail-pj2-f3.google.com with SMTP id 98e67ed59e1d1-3ada6c66964so496097a91.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 09:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794679015; x=1795283815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pXqm1o11ElV0Ndq1bicxgprmqaYAYKEl+LsqCcEbzPs=;
        b=dGw4tmo9z+t76UAJs1CPliunMuLwtHk7Ox14ZM/dtk3Hx/Hd8X6ZX5FrT+EpM1JckQ
         IPwMVUb5ioQmiV0EGAleMkifei/jmqEWDUvtweUZWM47iaFQbCs6nAoB9/lA91K+P4Xx
         a5eicwntQdaAv7r9cqukiwM57kwo5Zx50GOu5JChOqA+U9P2CFbKgR0nNzFnw7usUtVH
         vxbgtMLNRihV0HLwJpIb/0r/Jlejh4IS3jcDheSiNvWGH87KWu9hyQ+1yiPL+cHfJgM8
         mDtgppq85xKtHCrjzO5cdqP51BbfJyv3MoD06Ss23/vhOUAF5GZyYdjDlqoCf4R9Z9fq
         BzcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794679015; x=1795283815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pXqm1o11ElV0Ndq1bicxgprmqaYAYKEl+LsqCcEbzPs=;
        b=gJMEYC0/h2oWPwp+DBEmJ6MkE65N65do/HX94VJAF3bwQaUI7M5fi3RFblRM0CHlIV
         bEogMvGt7zacKJ1lu1nO4yieZi6EXZCVkiwQj1zUf7HF7NzCryLIX/8xRiARpxjyzC9v
         aGk4sLhrNRfAdFMG8OjYMq/wWrmAFk2qr4CRCpLdIccV/MIjpnEpuCPiq88LZ04SGsat
         11CpAdbIT0pPgjl0qUrYPuW2L7nmBVU2+JGkPiCZEi0rNbV30wOz2mW47GToRU2EwA+x
         NwYTYRRsPp58fzSm0YpLFdCDhhUiV9yJC3tMa9l9RR8qCdlQTkPB5KmAthvHzOFo54gl
         JY9w==
X-Forwarded-Encrypted: i=1; AL+hErHTN5eZ5ggsBOoI9YcgVLm4aQR7+NERI/Z+qK11gKtU1ZEnQxIPm2uD5CEB1roCHuEb61tm2FmGTj1KX9dne+cRlTdl@vger.kernel.org
X-Gm-Message-State: APuU4Z9rUKfJlbOrp/akKgLAXwhwxzQ+Ftde9q3zSmEuthdIL91qIK6U
	VXtllienbMdyt1lRBQ5hVzrJ2QI9u2m/40E4SHBhdMV0TlCkOPcAwn2Y
X-Gm-Gg: AYBFou2EZXcxJ2sczT1dyNbpRNcXU2e+zrJNpPV5ooV1tFWtLpEpXuuG4iSBxzvMbHt
	wBgrKP8tZN7jj0/s4DBuh/b2FOJ8vKXbxqR3xpxeellbPDu8YGWO93KEOTQoEn7wYjrk+CdLuGU
	vTq/aRJHg+eORtNlkxnSB4VGUN1SgW/fDh/y5FSn4XMxWz0c+vCT8N7h/lQRIOIcLtdomKn6Uuh
	e91b6Iyw9ht9RKFGpKsQI3fgK4fmH9BIQ+5m2nM2hzQlFcKZTx3SF3A3xJPSi5WSnk2pICGjHTv
	3YThI3KnvBZGCj61v+fklYn12ng0izzpSrSScp4Rt5rYbsBitwzj8z/44nbzOXXLFmR3FWHGbDU
	J1XoJSexOsrtog2IiPeMeqHsKuwdTKef8GFqn1pHvD43Eu7Hbnt15+bNVOcvxMLp3gEHi6mQSKm
	+XkqBDUY0Sy1o41PJWwDyseHhx6dF+nuHFr7qAyRErbMHrO3VJd4P+l7Gah/O7fEFz7Cs7gTwMm
	nRrsVMMKA2FkK7uUb29BC2iUWfknHsW2vmvfEO9DVIICzNHsz7FZ3/LbwFYxHiDxDy+QbiYsT/E
	4JhqiqzCsUGbfiQiCO31Ir68W1fo1Nc96aTNdnVwKCoK/TZOyA==
X-Received: by 2002:a17:90b:2e83:b0:3ab:b764:826c with SMTP id 98e67ed59e1d1-3b1b0a1f097mr6398191a91.12.1794679015270;
        Sat, 14 Nov 2026 09:56:55 -0800 (PST)
Received: from ThinkPad ([192.220.23.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c6c9c5sm14569383a91.1.2026.11.14.09.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:56:54 -0800 (PST)
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
Subject: [PATCH v3 4/7] platform/x86: thinkpad_acpi: Detect auto-mode capability via MLCG
Date: Sun, 15 Nov 2026 01:48:11 +0800
Message-ID: <20261114174814.62153-5-kmatzkaczor244@gmail.com>
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

The upper bits of the MLCG return value carry capability information.
Bit 20 indicates whether the EC supports the auto mode of the keyboard
backlight (0 = manual levels only, 1 = auto mode available), as defined
by the firmware.

Record it in tp_features.kbdlight_auto, in preparation for using it to
gate the auto-mode trigger registration and the LED suspend/resume
skipping in subsequent changes.

Link: https://lore.kernel.org/r/CABxCQKuEP5wMSstO0MK1MhaqXTKrPhUSN3V2mrE_42j4cXsXZQ@mail.gmail.com
Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 657a19d11..681b340a1 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -363,6 +363,7 @@ static struct {
 		TP_HOTKEY_TABLET_USES_GMMS,
 	} hotkey_tablet;
 	u32 kbdlight:1;
+	u32 kbdlight_auto:1;
 	u32 light:1;
 	u32 light_status:1;
 	u32 bright_acpimode:1;
@@ -5161,6 +5162,13 @@ static bool kbdlight_is_supported(void)
 	}
 
 	vdbg_printk(TPACPI_DBG_INIT, "kbdlight MLCG returned 0x%x\n", status);
+
+	/*
+	 * MLCG bit 20 indicates auto mode support: 0 = manual levels only,
+	 * 1 = auto mode available (per the firmware definition).
+	 */
+	tp_features.kbdlight_auto = !!(status & BIT(20));
+
 	/*
 	 * Guessed test for keyboard backlight:
 	 *
-- 
2.56.1

