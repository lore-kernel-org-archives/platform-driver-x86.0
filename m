Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794386142;
	b=4sPbxSohG4w1umyR3AA0jIZSAShFNPdEkGOZY55AEuIXgeOUTUlEtG+aMSJvkebvQwg9
	 9oSb07qnZm6CO6pvszsBOfWjo7wA+aw6WXeC4cP4mY8+7M/JmGc7142BOE28HOgxR4r0D
	 08CK/gDoqowRrlUmg9R7Cvqu6d+ch8W0uDF9iHR7RoNZvzSJ6A51oCDFr9vZ7QWZ7a/18
	 IORjkLloAjqqWkDZ7BLy3pWGYO6dtwnq5ZGO0jpvxqQlzugG91I3hsc7luUX9aYQ4/mdV
	 tRQ4/E7rFuojkQz0BFQCKDiDxogy4pABRu6VEsVsK8OqKSPNimC6Oqw0DKtPAsFB1SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794386142;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=PnuzJFSDFZI5wtxrxG5vIo0Sw+blHrEArgQL8+o/p1g=;
	b=PcLrQWiMBr6L/UqhPgmI8MdM8+dRviX2kVwAtNCs302rShuRGYWx/NNNDbmJtZ3cdrmL
	 XCcOdQdsmZS7J/lofS6NRWiqOkf7BBC3LZ5Mo3UnUGD12lsoq2jJ+0BjfP8YRjGhCZni1
	 ku57ksdtW1TuXd+wJ25gLAjdNkJQ0Yb8tML00rLqJbkBz3aPTqybgACwg+kuCKeAoOack
	 xb8Yz7tsNvwqeLh8hx8mHjwhHm97HyR23EMV/Aq0vX/k1tFaAtB5dvCByg4uKqY4v47Yx
	 TH8qDbZ5nROl7IkmuzyQlq49u45QLxWPgKaS2aCAB4yuALTcUc+1s1nydIo3UB9xJMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=TpSCIbY5;
	arc=none smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0799606A324
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 08:35:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0799606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=TpSCIbY5
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2E90F3F9DC
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 08:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1794386139;
	bh=PnuzJFSDFZI5wtxrxG5vIo0Sw+blHrEArgQL8+o/p1g=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=TpSCIbY5r+yK7NXloqUdGqYuBp5GgZfw5GI7LNRDBvkr6ZXOe/63h7NH9U4JZeZWR
	 wAePnMthaxi/hsFTkEu8dT1wBB6c/3/ZJLxafpgrkBnMHXwZyfAcy3BR6QyUwaUXJ6
	 2nHzkG9vpfRksB5SbReMaVBjSWfnmtM0tDGTULoEAGHh/ho2gb364xdvlmAI0qh9/I
	 0b2vByUyn7HP6nW5epFFWRwRBfBLBvL2Rf8TBWRkQc9Sf52wFidU4iG45D4I3bxxSA
	 SrzXMgjeewHhnsF31s8CQgh0wAgqkvOHciZe9PsLOZsCcFbO+rxC8xSa24UPjqYhNx
	 C5WjVhRkJd8a8zkDDkChVcDhUeF/Li/I7SqqC65DKZz6KFzIh/T9mVvHnzXZpVy1KX
	 AJf3qfmNF2MUc0WPM2T+Y94uTo9B6ai46ILJR6KvX54mmZOosN+wYSwEC0LWmBKKgd
	 5hiMyy1bxbjp0wIIVwCXxkGWgr7yFsfA6fJmc+wb/P+wtg9M72XIrni/QsFL2086Fo
	 vREs6bV2c8RumXmS+I/lMrhvmHrAeoRK6Vd5Nb+UQzX/KfRbshMTc85wzN+KK2sOT5
	 2fh9r3QTa/N5jBEoQLingYsexMrh0yhoC5QLaoMXG+DlGQ1XW8n84cNbGPuq0wSQ0z
	 pG6GoAtYJKqMaHLhvi03OrGk=
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso5033278eec.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 00:35:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794386137; x=1794990937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PnuzJFSDFZI5wtxrxG5vIo0Sw+blHrEArgQL8+o/p1g=;
        b=mQ43kYKNbuXzpGY5lDVoxlIN2JQ0Igcij5yGewU/uuUPugjJcMv4iXnNmwIq7zXkuf
         luGXud8KkKSOMn/glJyK0LsTo1DWQYSMLKSffI39BVQJDWH1irwAP9K5F9WBt2EWgXyd
         q1vGrj2crBVrx7LsIqpPCqcelV01UviwKFBnJS2P285P9gkl3NSUlOIlewwv+83jeXYq
         Z5SPlV147vMflAgmb4wd1lbf8M/LuCZCFwrK95rerZSGzvqX5IXCp20zpbjRMzFnfzfJ
         6SoCvnGrubShT6ak6rDmJOGe0AdhYI5z4UOV0tHSmYp2wrvVsx3AjAgsLvhBnFAAlcWy
         FBEg==
X-Forwarded-Encrypted: i=1; AL+hErHI4AS30lKEgDuFFzzcwUXK69VAHAcFj8NXRdYDWE8cph5OFjKaKbJACqgvslCekyIv8KIQcgXxzrGnNMk4qIsF6rcM@vger.kernel.org
X-Gm-Message-State: APuU4Z+oCkddRxSNvxB9VQwxQTaD/3ClatqewJkKxeuTgAMvd/jvmXJg
	9PgptqnDjRr7YlqE+8eHcarW714xJxyf4ERIt97g77Q6LA2V97PxhSgxuMFT79M78UBLSH1lUUa
	+fSzMIZ6T/Sl3TS9367XgnZ+qoNqZfKOc7D6KrIMUg5fEpMCpObmhfHZGlDfDuk5Pw5FtBntCx2
	GgJiCWB/30rT4GziQ=
X-Gm-Gg: AYBFou1pi86Nk+X2+38nam+oPpnGtULFuXRZYlzUCqtyBsbn3UvXy/ouk63I21OOkw1
	KkT5iFgXFLFJ2yQYSM5rKqQwez79yG2Yt7InrBlpMpZEl4HDwLIfUtQGYmrx1kt853EYZEmogJf
	rj22FdTsAmpFnPAsWDJLTbI+zs293GFSTAY5UsgnP/dJPtoYC1ITkM0EJqQD55vYRC0lvGehVs5
	U8D5ztw0DbM9qBoW6NQ9tljd8lIo1jfDRofB0g8oHtOpLdoYA4E6LnocNKbAiLYGiyoKKZqKZM5
	q4RkhTPNNlj7+ylpUhB0jyAIdJePdvdb1CxIEPM760BzmWlPcty2U2uvVT5MVTc3NOEWZlaKDLr
	zM57G1Fewbjq3+W1jLsZGjD8gy6du1cDgp8wLS1uHqY5G0YhRdxdaYyaWJHD7V3SJJ6EAAsiY0V
	eqaXNgyqy1a1fqkdL40g3ADXJbq/yf9BjZO5QJ36XRpqFRTcVfo9ebIqOZ8DTdtabIXXarQMWyT
	9S0jUAzlA8lf9eMLNdDYvRP9/XquFULYW/865FErJoBJw5eq2M8Emn+HLnyf7AS4oHZCB1GRhWe
	LYmmUUU+5jfm+w==
X-Received: by 2002:a05:693c:83d9:10b0:36b:d3dd:2e85 with SMTP id 5a478bee46e88-37686859056mr2400666eec.36.1794386137412;
        Wed, 11 Nov 2026 00:35:37 -0800 (PST)
X-Received: by 2002:a05:693c:83d9:10b0:36b:d3dd:2e85 with SMTP id 5a478bee46e88-37686859056mr2400648eec.36.1794386136843;
        Wed, 11 Nov 2026 00:35:36 -0800 (PST)
Received: from u-ThinkPad-X1-Extreme-Gen-4i ([103.155.100.1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3766146551asm5866706eec.1.2026.11.11.00.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:35:36 -0800 (PST)
From: Aaron Ma <aaron.ma@canonical.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: lenovo-wmi-other: Deconflict battery with thinkpad_acpi
Date: Wed, 11 Nov 2026 16:35:29 +0800
Message-ID: <20261111083529.727285-1-aaron.ma@canonical.com>
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

ThinkPads expose battery charge thresholds and charge_behaviour through
thinkpad_acpi's ACPI battery hook using raw sysfs attribute groups. The
Lenovo WMI "Other Mode" driver also registers a power_supply_ext for
charge_behaviour and charge_types on systems advertising those WMI
capabilities.

When lenovo-wmi-other registers first, thinkpad_acpi fails to create a
duplicate charge_behaviour sysfs attribute and unregisters its battery
extension. Conversely, registering or updating any power_supply_ext on
the same battery runs sysfs_update_groups(), which removes standard
power-supply attributes not owned by power_supply_core and wipes out
thinkpad_acpi's charge_control_start_threshold,
charge_control_end_threshold, and charge_behaviour files.

Match the existing ideapad_laptop deconfliction and skip registering
the WMI battery extension when CONFIG_THINKPAD_ACPI is enabled and a
ThinkPad ACPI hotkey device (LEN0268, LEN0068, or IBM0068) is present,
unless overridden by force_load_psy_ext.

Fixes: 9ca8fc065b88b ("platform/x86: lenovo-wmi-other: Add WMI battery charge limiting")
Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
---
 drivers/platform/x86/lenovo/wmi-other.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index bd64e7b44669d..6175f1e6c51a7 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -909,8 +909,9 @@ static acpi_status lwmi_acpi_match(acpi_handle handle, u32 lvl,
  * lwmi_om_psy_ext_init() - Hooks power supply extension to device battery
  * @priv: Pointer to the lwmi_om_priv drvdata.
  *
- * Checks if the ideapad_laptop driver is going to manage charge attributes first,
- * then if not, hooks the battery to our WMI methods if they are supported.
+ * Checks if the thinkpad_acpi or ideapad_laptop driver is going to manage
+ * charge attributes first, then if not, hooks the battery to our WMI methods
+ * if they are supported.
  */
 static void lwmi_om_psy_ext_init(struct lwmi_om_priv *priv)
 {
@@ -928,6 +929,15 @@ static void lwmi_om_psy_ext_init(struct lwmi_om_priv *priv)
 	if (force_load_psy_ext)
 		goto load_psy_ext;
 
+	/* Deconflict thinkpad_acpi driver */
+	if (IS_ENABLED(CONFIG_THINKPAD_ACPI) &&
+	    (acpi_dev_present("LEN0268", NULL, -1) ||
+	     acpi_dev_present("LEN0068", NULL, -1) ||
+	     acpi_dev_present("IBM0068", NULL, -1))) {
+		dev_dbg(&priv->wdev->dev, "thinkpad_acpi driver manages battery for device\n");
+		return;
+	}
+
 	/* Deconflict ideapad_laptop driver */
 	ret = acpi_get_devices(ideapad_hid, lwmi_acpi_match, &handle, NULL);
 	if (ret)
-- 
2.53.0

