Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794336158;
	b=l4G6NliZ0KmeoGiYMFnEPEKOqhnfmJ5mbZ4xVEX47hYoyaJmo7+qri4eLwp/Uw0Hj+tc
	 /C9sWavda9nK2wC3EakxdLOZ9tYcayKIVUhXqXQ5ndwNLKBPSC8/Z665tIXhGI6e4owpK
	 7sPd0QGXGTSw8/GoAoTbSOrXh3w8rzNYGTiCNHmBM6hPwY2K/j78W+4Hs4jhRLuyKYnS9
	 ZOd7D7au7UeG5JE+GMPGiE2aZqsvklbTc225jrmv5S9wR5/Ku7hOAbfoKvUrTtBdV5096
	 vXmsy63Nj7XmEY+gr924OvNua03mLTmfWG7xW64RaMVynfo9oiu00pO/FW9S+OYadOQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336158;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=sVs7AEuRf7kU4P5SCe65hBRcB2CGaFowKJwUqhl9enY=;
	b=cd9ziaU6YvqfyChXb5dRnfC0tCpvr/TbUVQdTo5ltIKfDUDLXvUro7cXFpVCtf7fyLQf
	 U5rbBTvyyq/pmPEO5TS10lIVw70itlpBQO2uQyVmX+WH4CPWvBFDQ6RC6ieUUPUdV/ubj
	 6zxNDsx9L9pzNJ5fv9dZo8MD+WyCkWoSRFDdkJseuUmJh2TyVEssbqYLB7ZqruVaUVBUP
	 4OSShlLYWRSJwyzcGeRSAO+jCwtcZJVRbvPS5KpWqtXxpBBiBdYeCPwjMuymRrTe5G3w5
	 emWi6maLgUmMO+jTW7NVXgVHhwMPEceD80Wt8OThbYOMO3rsuafzr6/v/ss6TVlef6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=HkxeuUey;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0E5606A92B;
	Tue, 10 Nov 2026 18:42:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C0E5606A92B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=HkxeuUey
ARC-Seal: i=1; a=rsa-sha256; t=1794336116; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SwXUuBS99S+3Dqmjogt1iDgRTD/JXQqwe9DrKOJrFYuggy8yMsFs3tdA0TimhdDH/O2aoKB6rQAN/ruhXYRIpUihjeF7wrCsbZIHS9wtmE0bueReqKnG2EeOpPwbBXGTncNP55Sw/dWJcLkQEkrWQyZLCKXmEm67yvhvkGVltlc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794336116; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=sVs7AEuRf7kU4P5SCe65hBRcB2CGaFowKJwUqhl9enY=; 
	b=fqQMNDRBkP3H7e8olIha9tfyxK4hyzDnwf87ugDEhe/DwQ8HC+9/un8yUv7F4o3iosQSVSqfPzrQjwPShfKfL0ZUnz4w5cksReRl0EAZDbcrudL4CyeUp7yUXtdQ+43dPXIAUriQWY53SU5/a8Sxjr6zMyq6+AX2aWTHROo/ORk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=HkxeuUeyuOwtt3W+vqumYIKRC/TSxIhGjX87xuQaqMwpkDiqF0luMcYUcQqQsBRFAqZHRRVYoKgBKgz4SNZwNDyxrCxJ9TfwlDxLezNp5VHGvlv8oqdHF+90DLF0O8aHFAbKPu55D3WXvWV/NxMM6vqs5RIZtQ0GZXMbYxfKjOLp7gki94aP5X4mlpQvt8fnp+RPwx1Uo5Y2ANLS/L8lxeH1pt1TWE9p2/HViyYoCWixwnCBZE9PiCFAKdCzhl27N+mnLubMA7pqv7aeQhffMlrHTamd2pzK3dpVDcoLZfEwg6FqZ6j7sWPwt6QhDfRcF1Nxa1hY8XNK481c02fD9Q==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=sVs7AEuRf7kU4P5SCe65hBRcB2CGaFowKJwUqhl9enY=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794336114602728.4657860111748;
	Tue, 10 Nov 2026 10:41:54 -0800 (PST)
From: Rong Zhang <i@rong.moe>
Date: Wed, 11 Nov 2026 02:41:42 +0800
Subject: [PATCH v2] platform/x86: thinkpad_acpi: Add "unrestricted_leds"
 module parameter
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-tpacpi-debugfs-unlock-unsafe-led-v2-1-f23a94912a09@rong.moe>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WOQQ6CMBBFr0Jm7RimERRX3sOwKO0UqtiSFoiGc
 HcLHsDVz0t+3v8LRA6WI1yzBQLPNlrvEohDBqqTrmW0OjFURlaFkhrHQarBouZmak3EyfVePVN
 EaRh71khnqU+V0BdTKEiaIbCx733iXv84Ts2D1bh5t0Zn4+jDZ/8w09YDkYuSKD//n5sJCcuqI
 UNMuRLmFrxrjy/PUK/r+gV9UAlo4QAAAA==
X-Change-ID: 9fa95cad-tpacpi-debugfs-unlock-unsafe-led-17ad492d8f5c
To: Josh Triplett <josh@joshtriplett.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-ce4c1
X-ZohoMailClient: External

Since commit a4d5effcc737 ("thinkpad-acpi: restrict access to some
firmware LEDs"), most LEDs are classified as unsafe and write access to
them is restricted by default.

To enable unrestricted access, users have to build the kernel (module)
on their own with CONFIG_THINKPAD_ACPI_UNSAFE_LEDS enabled, as it's
unsupported and no distribution enables it.

The Kconfig option, for sure, acts as a gatekeeper very well, but it may
be too harsh when a user really has some sensible reasons to enable
unrestricted access, e.g., disable LEDs for better sleep quality.

As a result, there have been several attempts to loosen the restriction.

Introduce a new module parameter "unrestricted_leds" to allow enabling
unrestricted access to LEDs without rebuilding the kernel (module).

The module parameter is a bitmask, as we expect that users will read the
source code to determine which LED to enable and understand the
consequence. By limiting the scope of access to what the user needs,
this also prevents accidentally touching other unsafe LEDs via sysfs.

The Kconfig option is kept, but solely changes the default value of the
module parameter now. The preexisting pr_notice() message now prints
whenever an extra bit not in TPACPI_SAFE_LEDS is set.

Link: https://lore.kernel.org/all/20181113174136.58198c3a@gmail.com/
Link: https://lore.kernel.org/all/20250403040846.7834-1-martin@arp242.net/
Link: https://lore.kernel.org/all/a14640f58be48d4912ce5808faea1402ad7f7ad0.1793906572.git.josh@joshtriplett.org/
Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v2:
- Use a module parameter "unrestricted_leds" rather than debugfs nodes
  (thanks Henrique de Moraes Holschuh, Mark Pearson, Josh Triplett)
  - https://msgid.link/c70af6c5-3d95-44c5-8f3f-b014178234c9@app.fastmail.com
- Link to v1: https://patch.msgid.link/20261107-tpacpi-debugfs-unlock-unsafe-led-v1-1-69b1f1e10c2f@rong.moe
---
 .../admin-guide/laptops/thinkpad-acpi.rst          |  9 ++++----
 drivers/platform/x86/lenovo/Kconfig                |  3 +++
 drivers/platform/x86/lenovo/thinkpad_acpi.c        | 25 +++++++++++++++-------
 3 files changed, 25 insertions(+), 12 deletions(-)

diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
index 60bf6868b849..6e8c8575f758 100644
--- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
+++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
@@ -794,10 +794,11 @@ buses are still active), or mask an important alarm (such as a nearly
 empty battery, or a broken battery), access to most LEDs is
 restricted.
 
-Unrestricted access to all LEDs requires that thinkpad-acpi be
-compiled with the CONFIG_THINKPAD_ACPI_UNSAFE_LEDS option enabled.
-Distributions must never enable this option.  Individual users that
-are aware of the consequences are welcome to enabling it.
+Individual users that are aware of the consequences may enable
+unrestricted access to desired LEDs with either the "unrestricted_leds"
+module parameter or the CONFIG_THINKPAD_ACPI_UNSAFE_LEDS option
+(distributions must never enable it).  Please always be aware of the
+danger of unrestricted LED access.
 
 Audio mute and microphone mute LEDs are supported, but currently not
 visible to userspace. They are used by the snd-hda-intel audio driver.
diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/lenovo/Kconfig
index 516594993073..0995f61266e7 100644
--- a/drivers/platform/x86/lenovo/Kconfig
+++ b/drivers/platform/x86/lenovo/Kconfig
@@ -161,6 +161,9 @@ config THINKPAD_ACPI_UNSAFE_LEDS
 	  and the driver will allow control of every LED, including
 	  the ones on the dock stations.
 
+	  This is also configurable via the "unrestricted_leds" module
+	  parameter.
+
 	  Never enable this option on a distribution kernel.
 
 	  Say N here, unless you are building a kernel for your own
diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 4f81855ad721..dc0e4cff72cd 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -5608,15 +5608,20 @@ static const char * const tpacpi_led_names[TPACPI_LED_NUMLEDS] = {
 	"tpacpi::unknown_led3",
 	"tpacpi::thinkvantage",
 };
-#define TPACPI_SAFE_LEDS	0x1481U
 
-static inline bool tpacpi_is_led_restricted(const unsigned int led)
-{
+#define TPACPI_SAFE_LEDS		0x1481U
+
 #ifdef CONFIG_THINKPAD_ACPI_UNSAFE_LEDS
-	return false;
+#define TPACPI_UNRESTRICTED_LEDS	0xFFFFU
 #else
-	return (1U & (TPACPI_SAFE_LEDS >> led)) == 0;
+#define TPACPI_UNRESTRICTED_LEDS	TPACPI_SAFE_LEDS
 #endif
+
+static unsigned int unrestricted_leds = TPACPI_UNRESTRICTED_LEDS;
+
+static inline bool tpacpi_is_led_restricted(const unsigned int led)
+{
+	return !(unrestricted_leds & BIT(led));
 }
 
 static int led_get_status(const unsigned int led)
@@ -5892,9 +5897,9 @@ static int __init led_init(struct ibm_init_struct *iibm)
 		}
 	}
 
-#ifdef CONFIG_THINKPAD_ACPI_UNSAFE_LEDS
-	pr_notice("warning: userspace override of important firmware LEDs is enabled\n");
-#endif
+	if (unrestricted_leds & ~TPACPI_SAFE_LEDS)
+		pr_notice("warning: userspace override of important firmware LEDs is enabled\n");
+
 	return 0;
 }
 
@@ -12238,6 +12243,10 @@ MODULE_PARM_DESC(uwb_state,
 module_param(profile_force, int, 0444);
 MODULE_PARM_DESC(profile_force, "Force profile mode. -1=off, 1=MMC, 2=PSC");
 
+module_param(unrestricted_leds, uint, 0444);
+MODULE_PARM_DESC(unrestricted_leds,
+		 "Bitmask. Set/clear a bit to enable/disable unrestricted access to an LED");
+
 static void thinkpad_acpi_module_exit(void)
 {
 	tpacpi_lifecycle = TPACPI_LIFE_EXITING;

---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 9fa95cad-tpacpi-debugfs-unlock-unsafe-led-17ad492d8f5c

Thanks,
Rong

