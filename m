Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A292741A92E
	for <platform-driver-x86@vger.kernel.org>; Tue, 14 Jul 2026 18:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784054750; cv=none; b=G3ruVhElhVgz1F2tEQXFEzH5aix86Gx79s9zOIfZN054sRjc05Yl09DTijbscoPK92pVoYthSfjIZGp4oSJw43OD9KGCvPiqAkFlYs6s5IZQPEbc4UqOicJ3YPaUzB3CTR3FV+M6r95AVt8lP1y+c73XrRsu+ycPubDwpV6yWOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784054750; c=relaxed/simple;
	bh=186a36ThmF/tF1x3mL7l3w9TGjthNfSRwRqEK54fbtE=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=bHwuN218f2l/Dk05PMTtz4Es2M+oaPaOjvlTW+xHGv4zVIKzC8e2slE6rJ+2ZClGlbjtCY8zwEcHIgbyeHHHgC1O86E7cyB6OnWwr661f9NXHDAFoq7KvUwrkLVdRGiOThygNDJxpXs8RcAJcOzeeueuFKKsZfpr55Wdpi1YET0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RBiqUtwd; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RBiqUtwd"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cabc0a1ab6so56337145ad.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Jul 2026 11:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784054749; x=1784659549; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qwl3BqvfiTProMK13HWybQ2Giye2QrbR2U0JPVlA7GQ=;
        b=RBiqUtwdM84mjwWwHvAp70ASaFGmisvDWNKxMVZy6wlMBljhmTL0cWox1dUeFUiVVe
         CiqDdsJxzy7mW30Dn3Tf9Wn7l8lt7Ag6jkn5vFpTr+495CergP27aQ3QSbDMyh5cKQCx
         QUwqrNjB7LlyiaEOn5QcoSF5o9L1akJ6K7ORPJaYLRIl6OfHWq/lTEz1UqrtANs0KyFn
         XNQHbMRIj7IuB5Bvot9iO/E5apRXokhJ50PO923ial1Sh/xIlfKNEQ0Zymscn6oVmy9W
         KnYU9fVHn/HM5tpWDtZH1kGQebwQe4A9Vnao5c2WKBb105F7diiu4PkZLRzcc0UBj0Ue
         tfaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784054749; x=1784659549;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qwl3BqvfiTProMK13HWybQ2Giye2QrbR2U0JPVlA7GQ=;
        b=EUahUUlxO59MTON8jMypFeitMAyTfr3NjTm7ugChr5A0TaYUXjJRXXoUm2/1/BDIrn
         oTvhgENHU65Vdw7MzRKKT73MwyhHtCYKMTnlu3/5wAzNX10gWRzZkElAZxIgTZxtic0U
         HfAJAcp46H1rIEmk1GDILghDBpUV+RGodagWQslIP3sZg48mY11XBQbO1zYfVHbxNqh/
         saz0aQUE8qaAJ9GvVYgxNaWiH9SQFk1iy9mm/KHl5M8VdMUm32T1nPew9i90SgsMsz8r
         X3mGb8ybxFvihX6rnzga3rISiJDs7ZS7pi6wpxje4Yg0dcFOSAozn1XXqqLhyWTibmZN
         TlRQ==
X-Forwarded-Encrypted: i=1; AHgh+RqLL3t7Wcgvu/muIS3O4LqG/9osF/1Q8CZRpPnV3SkpASk9Bm8DWumDNZ0u6jp6/SznCSQNTNJ9AnwBAV6tkqHgNbA/@vger.kernel.org
X-Gm-Message-State: AOJu0YzR2SCWuf+Np+rX4Zd/0k8zGoL7kozc+UZc2KrmS7+dDlja8rbN
	2PPYucuxuPpr6/ggqPLfARSiH9B9OEZ6EGuhwaxXOjGKnl2xN3s5rDJS
X-Gm-Gg: AfdE7clalh02jVnhJdujl9m4Soi62Fkpd2wDxnzidj8N5O2ovRYq1AH6yT8ixK5BtPM
	PZwGeFxcbVn2DYypAywvnixE6uL69wtLWYWbCF6a6a8PmrYQfi3tDlEzfZurvXGTnS5Jv+ZIazO
	NFPf8yhKb9eCaTdQ7CM8fwSfZl3/9cx8ly9uBRA5LSogvNnE54AR8hvcF6pdhumP2zrO04KcEGX
	gkKg+0iM2vfwVMAkCUIAD9fww2Ckb7uIVbxY7lfEix0S98dE6FUJdq0GPvcAETW2XNwDhryEHQs
	UTjOEJYoZjT0hNV4xYxSX/Pqm4kLFBjMNIZ8vSDlTmqi7yy+NYwwA9Hh+4KRiOsB9lUG/+Tyy57
	H2o2FmDxsztADI3DaA4QjJcs2N2JDUNmSFHODgpTNnu1zUUlSSznCgEwOoDRw7ixEqZOXJd0Aca
	hAuP7uWlCbMb5OyQ==
X-Received: by 2002:a05:6a20:2590:b0:3bf:ba89:5236 with SMTP id adf61e73a8af0-3c34d615499mr5271947637.33.1784054748924;
        Tue, 14 Jul 2026 11:45:48 -0700 (PDT)
Received: from [127.0.1.1] ([212.241.18.9])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-13b987fc629sm42864862c88.0.2026.07.14.11.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 11:45:48 -0700 (PDT)
From: Musaev Ibragim <atomicus.xyz@gmail.com>
To: Gladyshev Ilya <foxido@foxido.dev>
Cc: Hans de Goede <hansg@kernel.org>,
 Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>,
 Mingyou Chen <qby140326@gmail.com>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: redmi-wmi: report EC state change events
Date: Wed, 15 Jul 2026 00:45:36 +0600
Message-ID: <178405473606.25865.4048095379503614221@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

The Redmibook EC/firmware fully handles the keyboard backlight cycle,
the OEM preset power mode (Fn+K) and the Fn lock toggle by itself, and
sends a WMI event carrying the resulting state in the third payload
byte. These events are currently swallowed with KE_IGNORE, so userspace
never learns that the state changed and cannot give the user any
feedback (OSD), even though the WMI event is the only notification
channel for these EC-driven changes.

Report them as key presses instead:

  - keyboard backlight cycle -> KEY_KBDILLUMTOGGLE
  - OEM preset power mode    -> KEY_PERFORMANCE
  - Fn lock toggle           -> KEY_FN_ESC

Desktops that only look at the keycode get the usual hotkey behaviour;
since sparse-keymap emits MSC_SCAN with the raw payload before the key
event, an OSD daemon can additionally recover the exact new state from
byte 2 (e.g. backlight Off/Low/High/Auto is 0x00/0x05/0x0a/0x80).

Note that the power mode event must keep being read from the WMI device
in any case: on the TM2209 the ACPI event handler (EV20) applies the
mode change as a side effect of building the event payload for _WED.

Tested on Redmi Book Pro 15 2023 (TM2209).

Signed-off-by: Musaev Ibragim <atomicus.xyz@gmail.com>
---
A related problem noticed while testing this: bitland-mifs-wmi lists the
same event GUID (46C93E13-EE9B-4262-8488-563BCA757FEF, BITLAND_EVENT_GUID)
in its wmi_device_id table, so on a Redmibook both drivers race for the
event device at boot and whichever probes first wins. When bitland-mifs-wmi
wins, the "Redmibook WMI keys" input device never appears, and since the
MIFS control methods don't work on this machine either (different SMM
interface — platform_profile writes fail, the kbd_backlight LED always
reads 0), the laptop is left with no working Fn events at all until
bitland_mifs_wmi is blacklisted. Should bitland-mifs-wmi gate its binding
on DMI, or is another way to resolve the overlap preferred? Happy to test
patches on TM2209.

 drivers/platform/x86/redmi-wmi.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/redmi-wmi.c b/drivers/platform/x86/redmi-wmi.c
index 5889863..cc82ef5 100644
--- a/drivers/platform/x86/redmi-wmi.c
+++ b/drivers/platform/x86/redmi-wmi.c
@@ -29,24 +29,24 @@ static const struct key_entry redmi_wmi_keymap[] = {
 	{KE_KEY, 0x00011801,	{KEY_ASSISTANT}},
 	{KE_KEY, 0x00011901,	{KEY_ASSISTANT}},
 
-	/* Keyboard backlight */
-	{KE_IGNORE, 0x00000501, {}},
-	{KE_IGNORE, 0x00800501, {}},
-	{KE_IGNORE, 0x00050501, {}},
-	{KE_IGNORE, 0x000a0501, {}},
+	/* Keyboard backlight: Off / Auto / Low / High (new state in byte 2) */
+	{KE_KEY, 0x00000501,	{KEY_KBDILLUMTOGGLE}},
+	{KE_KEY, 0x00800501,	{KEY_KBDILLUMTOGGLE}},
+	{KE_KEY, 0x00050501,	{KEY_KBDILLUMTOGGLE}},
+	{KE_KEY, 0x000a0501,	{KEY_KBDILLUMTOGGLE}},
 
 	/* Xiaomi G Command Center */
 	{KE_KEY, 0x00010a01,	{KEY_VENDOR}},
 
-	/* OEM preset power mode */
-	{KE_IGNORE, 0x00011601, {}},
-	{KE_IGNORE, 0x00021601, {}},
-	{KE_IGNORE, 0x00031601, {}},
-	{KE_IGNORE, 0x00041601, {}},
+	/* OEM preset power mode: 1=Balanced 2=Silent 3=Turbo 4=Full speed */
+	{KE_KEY, 0x00011601,	{KEY_PERFORMANCE}},
+	{KE_KEY, 0x00021601,	{KEY_PERFORMANCE}},
+	{KE_KEY, 0x00031601,	{KEY_PERFORMANCE}},
+	{KE_KEY, 0x00041601,	{KEY_PERFORMANCE}},
 
-	/* Fn Lock state */
-	{KE_IGNORE, 0x00000701, {}},
-	{KE_IGNORE, 0x00010701, {}},
+	/* Fn Lock state: 1=on 0=off */
+	{KE_KEY, 0x00000701,	{KEY_FN_ESC}},
+	{KE_KEY, 0x00010701,	{KEY_FN_ESC}},
 
 	/* Fn+`/1/2/3/4 */
 	{KE_KEY, 0x00011101, {KEY_F13}},
-- 
2.54.0

