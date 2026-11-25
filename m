Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596551;
	b=pu7M114japZLygVurkveFbkiuptwVK3WrA8D068PWZGBqaGEX3A2ua86CfKw6gCLTpJi
	 o7j/XBA0TpjwED6wIjhu9NOdoeNEEEGG5B3ZnktBUXeruxK3/sJR60ERl2di6otLWrpNm
	 2weTAuTBjmOGpujBxRsReYFl4hV4O/4Ue7F32Hw5DV/mlXFa/eUu0RvJkGr0PvzjZyuuV
	 7npi7DQVo7mLXZAxtxvJxSnya8tA27wA9GiHvamUb180rSa5rnxfMDMOi0Fwc3GjAEnxu
	 cdqpQI036dkqLKhfanmRUKTb+lyJy8UcqnfXzNFBKP+yy2nV6LMMxZMkVSICBBaA9YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dL4HFdKW/phf0qh8s2lHI0j2gQFVuOIUi/IyX3x3o9Q=;
	b=jKL+qmlh62zZHY7d2koYeTMGbbVykPxxIpWh5/4vzs9XcGU7U4jQtP/wgImjftA150ko
	 5ktw45A/P8TfeizqB0KUj8yP3euHzcUyHItCUeeiKnb3p6+/UmRxFMO9N4rr4Xt6NwUR8
	 FC6BLLa8jVP5A80qhwCNwXGeHi30A+ztZxQ14S5MU9TFSBydpljlv9WGFZ4ZHWV/CnjHa
	 EM7Sg83iYxDpoTvDod8n1ETMUlTQofz8D0hfFr++LqPN+jvlCDlYJ1nWh+OobVVdetSAm
	 5RxVqeKvGRzj3BNbS3XJqKjEO/94MTF330hTnIj414XbEYIR+QkjtyidAly5hDlzXjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YVdS6NKs;
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628E8606A329
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 08:49:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 628E8606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YVdS6NKs
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-33e48934fa8so1081798eec.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 00:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795596550; x=1796201350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dL4HFdKW/phf0qh8s2lHI0j2gQFVuOIUi/IyX3x3o9Q=;
        b=YVdS6NKsEgxgMl+WH2rlG2/mN2PT8hYdnHaeuOhQRZG7EfYaK1zmZXJyce0jl2qt2i
         aJiwmc9VH+KmokhJ9ZT+iLHqjlXU8UiUHvyoNMddEPFOlyNpqrp49y6xk3D+JHXSFaTU
         E/9ZUZLsJgMrty4m/xsxSZ07xNRJdc8FRWbVw0WhTYg7ONQG4vzHR8z7p7S+IOzKNJFu
         lN5LTmJE5tK0OFvdscRgKC0Bir+Wh3/mkVmi2g/0QNfdfoCCbYQVjtWjnP8j8qB3t8Lj
         vL77HHSgpry6pIZPKbEzockltK3nluzGXsFBqiXYvdWwDQw7LTJ+N2kMj+pbTJ9lOtt8
         CTMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596550; x=1796201350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dL4HFdKW/phf0qh8s2lHI0j2gQFVuOIUi/IyX3x3o9Q=;
        b=UkMSiB+RrHel5lhAVHEgor4Mvl/tBrwFdiho+Cw0MwldGJS+vmyNF7iTetU7C0wnW+
         7QMur7G0Z3vlQLcuRdFeGyFSM0WYFNTLM0CkEZJ01UWqFCKJYHEn5qYt1LvLh65vx90m
         tASVqCkMyXgwCszHSV3ozoHrP9ufvzDNBkH8NMiRUbZOaHi1u+1orVwZ8hCw7WczxC18
         cpBlEu02jdVqR00F3rbEjZWaCxv/OWgX8vC31XX9mMUI6eAFex3/eMbgzoMusoihJ3qp
         TOba0IevrYiD74oehQQ+5VPhd5lJ21VmtDXJmBTm0c1umyd8fb3gjPs9r7nydjoTnCTl
         l8Sg==
X-Gm-Message-State: APuU4Z86IFd74IK0WnV0TfxrXeDXymPAzGDvcNz16j0QHzMFhlZYOyCV
	TcD+PiRIPi2Tf6fsLaGk6IPrOXmv2Mk08nJdtCEEOGYjsLNd3ETuvDjm
X-Gm-Gg: AZFdTZfxuaLHDAzA+R5CBJUJddbOCelkqz5zx/EXpv/bhuq5cVojNifS23Xi22PsPC4
	olFfINT2N6JGb6EN2HVn1HTe7r8lqSBlJOsCvTyQTkfgYZaz07YqTnhtLgyAnNXLMjSmgrnl8p1
	wzDtc8cfAhXaRu/jWBqB6chOI6ZrAlZIwUh6XysvlzvEb+oDEYvM2SFOdD4YsJGxrZNKQAV1gbp
	Gw8/eD6cyEC4uiMImT2VV2gAgnfrAyp5jTwhM+yiIY5Ipl0mYt9GMpBpa9Lo9NjIwR4LQJHFMiT
	ch8CqMNbM8b+uKyxtGDie9MLlTLt0mRrG8Ri/6yjUACpmumzUrIk7EOQlN8+Gdlcfr5tBfI4rtq
	TY5v/FZQmBele+GOLiaMZ8R/cLcKZjKSguFmHAhG5mLFwLxyMLUCYCR/jlamnYx8y53dBE9hmon
	C3l53sfTEE90YBwAwu8ZyaAUpMwjW5wP8yo6pGwxjTQmiN/KPDOn28sBf2frxxG57Le9UJiLtO7
	mIjiIIAxizOuXnm5uC0d16gpsSgzovyHqqgjsvGoHSazD0HkUohYkO6W2yWZgjdSOkU3nCYJSi5
	XnPbpe5x9iAg2gmbtHFWl+rGjXG0
X-Received: by 2002:a05:693c:88cd:20b0:386:a16d:1bce with SMTP id 5a478bee46e88-386a16d1cb0mr11929126eec.36.1795596550406;
        Wed, 25 Nov 2026 00:49:10 -0800 (PST)
Received: from ThinkPad ([192.220.23.71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm18879252eec.9.2026.11.25.00.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:49:10 -0800 (PST)
From: Qiling Zhu <kmatzkaczor244@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	linux-leds@vger.kernel.org,
	vishnuocv@gmail.com,
	vsankar@lenovo.com,
	Andrea Rabbaglietti <rabbagliettiandrea@gmail.com>
Subject: [PATCH v4 5/6] platform/x86: thinkpad_acpi: Detect auto-mode capability via MLCG
Date: Wed, 25 Nov 2026 16:46:42 +0800
Message-ID: <20261125084644.137506-6-kmatzkaczor244@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125084644.137506-1-kmatzkaczor244@gmail.com>
References: <20261125084644.137506-1-kmatzkaczor244@gmail.com>
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

MLCG bit 20 indicates whether the EC supports the auto mode of the
keyboard backlight (0 = manual levels only, 1 = auto mode available), as
defined by the firmware.

Record it in tp_features.kbdlight_auto, for use when registering the
auto-mode trigger in a subsequent change.

Link: https://lore.kernel.org/r/CABxCQKuEP5wMSstO0MK1MhaqXTKrPhUSN3V2mrE_42j4cXsXZQ@mail.gmail.com
Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>
Reviewed-by: Rong Zhang <i@rong.moe>

---
Mark Pearson's Reviewed-by was given on the v3 version of this patch,
which tested BIT(20) directly.  The symbolic name was added at Rong's
request, so the tag is not carried over.
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 764b1efa6..ee8f7429d 100644
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
@@ -5105,6 +5106,9 @@ static struct ibm_struct video_driver_data = {
 /* EC level that selects the auto mode for the keyboard backlight */
 #define TPACPI_KBD_LIGHT_AUTO_LEVEL 3
 
+/* MLCG bit that indicates whether the EC supports the auto mode */
+#define TPACPI_KBD_LIGHT_AUTO_CAPABLE_BIT 20
+
 /*
  * Cached EC level, including TPACPI_KBD_LIGHT_AUTO_LEVEL.  All state
  * tracking compares EC levels; the auto mode is translated to a
@@ -5189,6 +5193,13 @@ static bool kbdlight_is_supported(void)
 	}
 
 	vdbg_printk(TPACPI_DBG_INIT, "kbdlight MLCG returned 0x%x\n", status);
+
+	/*
+	 * MLCG bit 20 indicates auto mode support: 0 = manual levels only,
+	 * 1 = auto mode available (per the firmware definition).
+	 */
+	tp_features.kbdlight_auto = !!(status & BIT(TPACPI_KBD_LIGHT_AUTO_CAPABLE_BIT));
+
 	/*
 	 * Guessed test for keyboard backlight:
 	 *
-- 
2.56.1

