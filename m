Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793160573;
	b=q3HpAi8oDdpQaLLq+UzSNUsiC23bbVlwMyTdVGvfKhGD3phShPofVC6GeEU6vHrIqjvG
	 pLy3bzDvLx364v6Xy6s6gBQ9zuJq1TCjLdv7iZj5lIVz3HTwfH+p7++VTF/atIHR5AG9h
	 Epkw/wryTfH01Bomrplbu6Xwy0yK1osv9uAfCA3IS9RSP69zGftbQdV0fISuxP+qFa5Fj
	 DV5cn8cdgYsw86xDSSYrHdUPz+MXwr77Ty2+9Re/pWWZRwVRcDOJ8EpfpsFRKOB1SJq32
	 UYEVs8UDb6kRPqRxSFYi+73FxTmCsJE9qKLRWanGpLUEPnpNoeV06huoXh0TH0lJsYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793160573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Content-Language:To:Subject:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=6c7sQ8Bp7pAJXmrZdb6hgNZF2I6R2ywB1j0/kYQTtR8=;
	b=uDUsCiNckR7VgscKsbuyHUw8YHZnwfvqFetM+BlNLF7fEi61lUZ9/pUZdQ1sRGt/7O5R
	 SfLKERgJpLd/QOaFe5rjDz1f+D/RxjkiLL7dffk9fqUXXt4ks0e8/sEdQJKCjlbslkcji
	 lxOXqaUswn8NcpPd4on1G9mMBbqaH3rI/v1o2gdq3FXcBe2mkxkw3tM+uuZjXdYTSv22c
	 S3gO8+09f+undRMjWKOby1ZRljKFmbSELN4gCdfQbYLvGwM05dGec1KBxnwF80gJovdO0
	 X94PQbwLOFs1q9Pw8LyHeta0xJF0E7BFhAy15buobav9K4l8liqk5LAPB1rk47Txf0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yOamFJBK;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8C2606A31F
	for <platform-driver-x86@vger.kernel.org>; Wed, 28 Oct 2026 04:09:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D8C2606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yOamFJBK
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso399685a91.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Oct 2026 21:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793160572; x=1793765372; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:subject:to
         :content-language:from:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6c7sQ8Bp7pAJXmrZdb6hgNZF2I6R2ywB1j0/kYQTtR8=;
        b=yOamFJBKSnrmmc5Ksya+JqLwYTfhQ5Ca66ctpEUoMEX9msqInjwmX2J5ES7E2MFFvI
         mRq13/TuSeO/A92oPN55K4AwCaRBRHRn333GdDaUJqKDjJ+HAAWkh/AHUG9+Hicfiuq8
         9tB9YUnuZsNjTDF3HPHKIQBEth4JkJjvLDIsJSMVGdmVXaybFM12I+BTNEV6NgTKQqrY
         u4DlkZNjy/tr8dTD0CR5E3Ti4vS+XUPDvA2RNxgxrweBEWWhta0i77Jm3aKtxKSLeIJ/
         FXk+tWNiJ07kz6QcsbBu3nPd1Gv904uZuBPOeZCW235Dk2ZdaKGiEywY7vSR6G57VO6Y
         7s0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793160572; x=1793765372;
        h=content-transfer-encoding:content-type:cc:subject:to
         :content-language:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6c7sQ8Bp7pAJXmrZdb6hgNZF2I6R2ywB1j0/kYQTtR8=;
        b=SUpfvqFuBWcwiJijVHKLDVmUOjtQGlY6fwSRyGWAzaX7UeTPpJ/YuU1nmR+cqoArpO
         MnLSK5ZhOV65P86SjDLJlQDQydX4hK7dyC92BWckYLzFXwT6XKFRzmfucVW92nx8VrmS
         3MjGscSg+T1VojlxCXsmBYmVsTFNKA1fpfy+jpc2I/l5LuaBtJnpWZ/bFDFWTPVZqL9d
         XPK1VaXYMdpGuDIZXWRA6gBEG9UM5h0/L8txvtMwChcg3yvGi3xvkggOfPc0Rj8g+pA6
         cvMlKS/d4cGX5kVQrrf5vR7mxp9VZEvHmbceZ0AB6Y//exPhuZo6APAeaMe8x/5nbWoF
         elig==
X-Gm-Message-State: AFq9FYKgA/EqQ4wX5OhZFuBaSImorn3F0uUz1gNXpKyLcH7ILz3RRsow
	hFqHLTyV5RmN7fHfLyJ3+rW6jZdHOCVuiPsJCgzwre2pbxkJ0yc/MRBKj+mx5YAo
X-Gm-Gg: AYBFou3SAS8G5IHsABYcTTdyT/djEFlsyfdpny6BTCJYjPjIL+Ro9f+yOBedv0zUX+1
	XOBI5I5Kar+un21yxu8Cd/AxObjoa5wS3oe4cCgtPgy+qi+/DrsQiqqLTf1EKXdzwDzyWQEEino
	9Z626kB06EQaZzylnQKSn0zROjp0bm33eR7nWaMiJ0FPAlKFc0BDO22eB+Xl1OiVlBm/eX134lu
	j2t+sqxyQi/1ERHR3BpN1RqzxjcJdV//FfzRKh8CrFpNvY0ZH7Nub5HXpxPFBW5ksC9+W1Tbaoq
	QrhzOVCOfN2rAFHY4kUDqjwfJa+9JYPUub9C2B/twjdt6vekpRwH1QDL/w61sGxmr/NZgS+A9ha
	sV0aWEcBDo+GiMr+ydng9EQIjaYuAaZIwirE+PLnCZ+4NJ3Wd1phv5Ufh0T0P2y3vw99lD9zxAP
	jtcynZoIVm/9+JYK6yf8pDdNldIVRGR/bwkYlzqrb0yH+7YzrDqAxLAGR9c7ik/6pX+RsC7a4Fb
	RxqEnyTaorFj+xaOnA1v0klj94n5PkVURcYFfd8HYYqDhq5MZeDKC18JVha3YBR+QPsb69EvbPq
	wdcam/RZrn3MDnbyQsZxuzEZkBgzDM3lm/E=
X-Received: by 2002:a17:90b:224d:b0:3ac:8dfe:8ec9 with SMTP id 98e67ed59e1d1-3ae581b4cfemr777255a91.47.1793160572495;
        Tue, 27 Oct 2026 21:09:32 -0700 (PDT)
Received: from ?IPV6:2601:204:cd80:e00::18c? ([2601:204:cd80:e00::18c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdacd6aeb55sm2086834a12.7.2026.10.27.21.09.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 21:09:31 -0700 (PDT)
Message-ID: <34898827-b6b7-4d19-ab0c-55d55a0659ab@gmail.com>
Date: Tue, 27 Oct 2026 21:09:29 -0700
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Cymirk <cymirk874@gmail.com>
Content-Language: en-US
To: platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: asus-nb-wmi: Ignore GX651AR event 0x5e
Cc: corentin.chary@gmail.com, luke@ljones.dev, denis.benato@linux.dev,
 linux-kernel@vger.kernel.org, ilpo.jarvinen@linux.intel.com, hansg@kernel.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The ASUS ROG Zephyrus Duo GX651AR reports WMI event 0x5e when
the detachable keyboard is attached or detached. The ASUS WMI
driver handles this event alongside wireless-console events,
where it can be interpreted as a wireless key event.

Add a model-specific quirk to ignore event 0x5e on the GX651AR.
Keep handling of events 0x5d and 0x5f unchanged and leave other
ASUS models unaffected.

Tested on ASUS ROG Zephyrus Duo GX651AR, Fedora 44, kernel
7.2.11-200.fc44.x86_64, using a temporary module built from the
v7.2.11 driver source with the KEYBOARD_KEY_5e hwdb override
disabled. Keyboard detach/reattach and typing continued to work;
Wi-Fi remained enabled, and evtest no longer reported scan code
0x5e.
Assisted-by: AI LLM
Signed-off-by: Cymirk <Cymirk874@gmail.com>
---
 drivers/platform/x86/asus-nb-wmi.c | 18 +++++++++++++++++-
 drivers/platform/x86/asus-wmi.h    |  3 +++
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index aeb461b16..c2e7328b9 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -150,6 +150,10 @@ static struct quirk_entry quirk_asus_zenbook_duo_kbd = {
 	.key_wlan_event = ASUS_WMI_KEY_IGNORE,
 };
 
+static struct quirk_entry quirk_asus_gx651ar = {
+	.ignore_wlan_enable_event = true,
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
+		.ident = "ASUS ROG Zephyrus Duo GX651AR",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUS"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "ROG Zephyrus Duo GX651AR"),
+		},
+		.driver_data = &quirk_asus_gx651ar,
+	},
 	{},
 };
 
@@ -687,7 +700,10 @@ static void asus_nb_wmi_key_filter(struct asus_wmi_driver *asus_wmi, int *code,
 	case 0x5D: /* Wireless console Toggle */
 	case 0x5E: /* Wireless console Enable / Keyboard Attach, Detach */
 	case 0x5F: /* Wireless console Disable / Special Key */
-		if (quirks->key_wlan_event)
+		/* The GX651AR reports event 0x5e on keyboard attach/detach. */
+		if (*code == 0x5E && quirks->ignore_wlan_enable_event)
+			*code = ASUS_WMI_KEY_IGNORE;
+		else if (quirks->key_wlan_event)
 			*code = quirks->key_wlan_event;
 		break;
 	}
diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-wmi.h
index 5cd4392b9..b2d91e373 100644
--- a/drivers/platform/x86/asus-wmi.h
+++ b/drivers/platform/x86/asus-wmi.h
@@ -52,6 +52,9 @@ struct quirk_entry {
 	 */
 	int no_display_toggle;
 	u32 xusb2pr;
+
+	/* Ignore event 0x5e when it represents keyboard attach/detach. */
+	bool ignore_wlan_enable_event;
 };
 
 struct asus_wmi_driver {
-- 
2.56.0
