Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794679063;
	b=Tnp6g6lSwZfYSUvjJFDhLqI/Q9IY8PN/CIZqbHFBu4RsSlhq0SOKunmPz/1SxQc9Pq6u
	 cRHvRiNrHRkRDwAxNCBHB4o4svk68ntxLfB2YAdxw/f0HpiROXZ8iHD/mZumjgoZhBkLF
	 /mpzlUJKbF9i2+vggwgGiFGqk9si+m/W/Tt+/R2U4SuILyA6yb2Xzs6h6c9VfLVq6SgQc
	 FywPz2cgSl8EGTOo2MyXLZggQXH15EdXOGG34pY/zwXyY+WRVaOHbucrpXYrour9pG0uX
	 KqVOYbtB+VhsE21qM8fUEpnebUpzvYocFTGXyxrMen4JDcEr9BPcR3OufU1KdvwhWTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794679063;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uYeUz9sTCXWn01eb3Ii8pPNP+cm/sC+7acAv8/ZZ8X0=;
	b=avuCeNU9HAKCGM2Acy/trgwtu/60zZodmG6CXNUfMqPT/6DbdxTFgxEdjlRra1zqARum
	 ZsHCT/f6+t1tg54PmEQKwJ2lXg9BXzWP9NYFV9Sdz4/8/x/eOsfV95gzbdgCRPt77MVmS
	 VtMe2Nt8eLMLtbE8UN18/LRa9cHEQAOso/Prye5+gN8phwo51YcGEDYMnLFDitGJv2V+0
	 tTc2l6TQSSEXKRXEeVt2DaBKOofrAvnvW4/399qehrTsQJl3ya7sgK1mgjBQwLzYaLlBQ
	 lyCllmMcCFrX5hmixqVqvgiGzpQ+JZyvnrDySJIqqfrN593SlLfRUDc7pAJZy6uaS4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uVY0MyVu;
	arc=none smtp.remote-ip=74.125.227.129
Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B21606A331
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 17:57:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35B21606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uVY0MyVu
Received: by mail-pj2-f1.google.com with SMTP id 98e67ed59e1d1-3b10718b387so1237183a91.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 09:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794679062; x=1795283862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uYeUz9sTCXWn01eb3Ii8pPNP+cm/sC+7acAv8/ZZ8X0=;
        b=uVY0MyVuZmhOAAyRx9i6zCyN6goxVQeRCc9doxD5EIBEIl0RlS7avzF6/amyzR1sOR
         0k09UfZHtYRq//Ob8WDfQVipRBc36fUU/+KpAFrin/WmvQVOqVOa2KQZeKXVD65Nec0M
         czKKAj7PNb+6nkUBh6IIQIqp2RDw87Gv75E8zGIceoOe2KhcGcM+y/rfakUgbCq6Kd3e
         VwzY5msviQm1yWZS6Uf1wpJb/EksOrCft1HrMr48QhaWR4FqKyx/nqao+rig8Fy2adZT
         ApwOovPWpfc73F5yUGDsS6Ip950ezI9b4lCf0kX4bVeYYXbThhQcaNoch7WGKH2zUTwc
         wv3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794679062; x=1795283862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uYeUz9sTCXWn01eb3Ii8pPNP+cm/sC+7acAv8/ZZ8X0=;
        b=pzzk0L+ZcQea7nnVSA7//qlYDAYOkAVGgzTMb3gtOsHuGUQfDfHMQVNn32w2IcPTjq
         GLIbEbxfRbmeBohMRR0CcTedNzrM4GJB/5oEupG0uKBsdlbSbACgGvlHq1rGFSEzI1DT
         evHDQIEtaKSDoyrR5gRj+QJM63wq/ZB8hwqXUACP6ImXlFrWmkk6xvdpepsfuE6OLI0h
         297teM9dCxnfPTo5gr4Xak1zudNSvuCABIgxCV2+mF5X92mAEZy6w6bRyXWRQBw1Iuh5
         q4ZW5SR0lv23ivnFsrni7lri5b3El6YpjmGnQMaU5h7lW2LRRaDdbH99uFqculqmXgBv
         wXEg==
X-Forwarded-Encrypted: i=1; AL+hErF9VyK2F9oIUxIRdvUISfo5dsNXGi3ffE+vsHC/v02AXFcy0nXQerodxh6mvLPxMVHchTrD/EteeQAAsloQojQHaIgM@vger.kernel.org
X-Gm-Message-State: APuU4Z9RmA3IY7kt4oqHC4EOjx8H20WjM1JKoCTj6t1UZIe6ldj9JvqN
	7j0Z5sdj+QtEBKalyGGuX9nJDr2Be2kVdHNMe7E1BdWzFPwxB7sUcYHY
X-Gm-Gg: AYBFou35O0ruw9Bv0rsp0lr6Fx6nAdbVB4Jb1n6wCxKJZ9Vc1LZ9J2NXTwgA6zrhRdC
	bnt+R83DBaSTnupRmoeVjQ6JeSCKtvp32EfcdffY1iocoTYdIHK55OpNDbYm9x2S9f9M+1lZntk
	a500VrpY4+IUeJw2igcWUdj+zleFP8UvQpRp+PiLb7/y40sk7U4V77z4t/uLqYseiRPGRDJRW7H
	iSMeuK6wGW8wmlX/RBD8RT1hddZBJz0RaTzT1i+Rp+iE0yAVPUqYJD+NKAubr2jmqeIzt2TICxT
	zmnLjRjJ3ZviKs1ttEH31ihHtMWFT3/U3p/t5F6X6BF9hN7QSU8DlFuDf3Vdwtgxay7hPYeNXPa
	qpN9YcAJ4QX2KY//BDQa79phM69TR8eNBBka+fYpUrwzUdA7gTu0FTiMRkv36upChI/NdVnJIRT
	h47+MTb5rERJA9k8gkB52kxrHzDnZMRPmGASwuiHHZ6dDGOQMWyApukVacl2YVfXJqhkyGM6RT/
	dRghFbrrhJG13GWvYM9eHqIOOSXEWFR8s6JeJ1mu/Ffj1kCJpBdGxXU7N/4lnOACsBdyk1AWu5H
	XVa1D/ZQOsZ7P3/PNUZueSPf6yyT
X-Received: by 2002:a17:90b:35c8:b0:3ac:e6a:1b2b with SMTP id 98e67ed59e1d1-3b1b05ea8cfmr5861211a91.0.1794679062608;
        Sat, 14 Nov 2026 09:57:42 -0800 (PST)
Received: from ThinkPad ([192.220.23.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c6c9c5sm14569383a91.1.2026.11.14.09.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:57:42 -0800 (PST)
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
Subject: [PATCH v3 7/7] platform/x86: thinkpad_acpi: Reconcile EC level on resume
Date: Sun, 15 Nov 2026 01:48:14 +0800
Message-ID: <20261114174814.62153-8-kmatzkaczor244@gmail.com>
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

The firmware does not always restore the keyboard backlight level across
sleep: after hibernation from auto mode the EC comes back with the
backlight off, without emitting a notification.  The cached level and a
possibly still-active auto trigger then desynchronize from the hardware
until the next user action.

Check the EC level on resume on auto-mode machines and route it through
the regular notification path, which also deactivates the auto trigger
if the firmware left auto mode.

Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index f11e61417..802e0d53b 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -5395,13 +5395,22 @@ static void kbdlight_suspend(void)
 	led_classdev_suspend(led_cdev);
 }
 
+static void kbdlight_notify_change(void);
+
 static void kbdlight_resume(void)
 {
 	if (!tp_features.kbdlight)
 		return;
 
-	if (tp_features.kbdlight_auto)
+	if (tp_features.kbdlight_auto) {
+		/*
+		 * The firmware may not restore auto mode: after hibernation
+		 * from level 3 it comes back with the backlight off.  Check
+		 * the EC level and reconcile.
+		 */
+		kbdlight_notify_change();
 		return;
+	}
 
 	led_classdev_resume(&tpacpi_led_kbdlight.led_classdev);
 }
-- 
2.56.1

