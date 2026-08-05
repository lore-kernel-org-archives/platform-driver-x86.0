Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4586034A3D6
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Aug 2026 14:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785939093; cv=none; b=SuyeN6z7zMBhj0Yfp6595e2SoCnOL+wbtChErgVtsRK+FK42fgdTvThjFuK5Z6HcfXGS/8wjnHQ61Lj89I4gX6CrT9iUJ1WYBsbyZp4FWXmsIRSOTuTHNLjh9TD3Pk/NcaMlPla2ovtVmq4QOar4evXscWwbAz3Sclkv+gkJHyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785939093; c=relaxed/simple;
	bh=JG8Ss0OTuVue/GXg1JY+ufj7uhyecYonzu/cP+5/qBE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JID9MZAi+pOC6KDKBDRXr1rnB44CPuMqYkmKQUvkmauwoOt4GVfiGeC0osLj5LvyULqyqoCiMUapsgM1GZsaoDbFGR0GvgwT+mCchSWLlHH9mlw1RLeITXuMLu5hUB0xRMciES1WYPjDY3Xtbpb1HpWHtn7yIYfqlVA3d9P/jhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=PJ2DDtji; arc=none smtp.client-ip=79.135.106.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="PJ2DDtji"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1785939088; x=1786198288;
	bh=xnyvNzSa/1+wPuY6P4weeVEt541R3Db4bkrZkHa7rVM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=PJ2DDtjix3v7/nh6wTYroku/zLQ19ANIfExs6Ym5alwba9XfALbwWkFPW9kCXQlLP
	 0u8USbIGH32kd3MJWhM2n919YsZ9So085xjcUqbDAbsL9mIws+94dUWB3fyzrswQaW
	 mVXuo0oKUViXC15TfYLObc+lLhl0+V42QQVoEUVVLg7w7vtvfi8vZRg/UKkk7Lx4qz
	 b5X/Jj+XFC2WgN1o8F2oqEn7fCyJvc4odrTZfrxjmU/82bbXCMu0H4IGclrTVwPekk
	 qt6FBI1n7qAAJvknCOdPzNqNyb8C9L06K6tzHOdW7fuyxlqqIIxiThAs9uOEl8YHlq
	 Bl52vhxlCPwVQ==
Date: Wed, 05 Aug 2026 14:11:25 +0000
To: hansg@kernel.org, ilpo.jarvinen@linux.intel.com
From: Robin Everaars <robineveraars@pm.me>
Cc: corentin.chary@gmail.com, luke@ljones.dev, denis.benato@linux.dev, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] platform/x86: asus-wmi: keep the lid-flip state when UNKNOWN is set
Message-ID: <20260805141114.699959-2-robineveraars@pm.me>
In-Reply-To: <20260805141114.699959-1-robineveraars@pm.me>
References: <20260805101502.235668-1-robineveraars@pm.me> <20260805141114.699959-1-robineveraars@pm.me>
Feedback-ID: 201127006:user:proton
X-Pm-Message-ID: e29f9970c4ce80904c2df159e356f55c1a293a02
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="------a54b98a1276ca93ff5c63e5a87f9c379838687be18851de58cf9cbf17cb6d8cc"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------a54b98a1276ca93ff5c63e5a87f9c379838687be18851de58cf9cbf17cb6d8cc
Content-Type: multipart/mixed;
 boundary=cc40dcb941ef3ab625d9bb6ae90aa5384c364d38907c4f6328a902378af1
From: Robin Everaars <robineveraars@pm.me>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: corentin.chary@gmail.com,
	luke@ljones.dev,
	denis.benato@linux.dev,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] platform/x86: asus-wmi: keep the lid-flip state when UNKNOWN is set
Date: Wed,  5 Aug 2026 16:11:13 +0200
Message-ID: <20260805141114.699959-2-robineveraars@pm.me>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260805141114.699959-1-robineveraars@pm.me>
References: <20260805101502.235668-1-robineveraars@pm.me>
 <20260805141114.699959-1-robineveraars@pm.me>
MIME-Version: 1.0

--cc40dcb941ef3ab625d9bb6ae90aa5384c364d38907c4f6328a902378af1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On some convertibles the lid-flip devstate sets ASUS_WMI_DSTS_UNKNOWN_BIT
alongside the state bit while the machine is folded. Measured on an ASUS
ProArt PX13 (HN7306EAC), ASUS_WMI_DEVID_LID_FLIP_ROG answers 0x00010000
open and 0x00010003 folded, that is presence | status | UNKNOWN.

asus_wmi_get_devstate_simple() treats that bit as "the state is not known"
and fails the call with -ENODEV, so asus_wmi_tablet_mode_get_state()
discards a perfectly good state sitting in bit 0 and SW_TABLET_MODE never
moves.

Add asus_wmi_tablet_sw_get_state(), which gates on the presence bit only
and returns the status bit. Use it from the two tablet-switch paths. Every
other caller of asus_wmi_get_devstate_simple() is untouched, so the change
is confined to the tablet switch.

Signed-off-by: Robin Everaars <robineveraars@pm.me>
---
v2: use FIELD_GET() for both bits and add the linux/bitfield.h include,
    per Denis Benato. Drops the !! on the return. No functional change.

 drivers/p
latform/x86/asus-wmi.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 8610663..dce4d07 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -15,6 +15,7 @@
 
 #include <linux/acpi.h>
 #include <linux/backlight.h>
+#include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
@@ -706,12 +707,40 @@ static void asus_wmi_tablet_sw_report(struct asus_wmi *asus, bool value)
 	input_sync(asus->inputdev);
 }
 
+/*
+ * Read the lid-flip state directly rather than through
+ * asus_wmi_get_devstate_simple().
+ *
+ * On some convertibles the lid-flip devstate sets ASUS_WMI_DSTS_UNKNOWN_BIT
+ * alongside the state bit while folded. Measured on an ASUS ProArt PX13
+ * (HN7306EAC), devid ASUS_WMI_DEVID_LID_FLIP_ROG answers 0x00010000 open and
+ * 0x00010003 folded, i.e. pre
sence | state | UNKNOWN. The generic helper reads
+ * that bit as "the state is not known" and rejects the whole call with -ENODEV,
+ * so asus_wmi_tablet_mode_get_state() discards a perfectly good state sitting in
+ * bit 0 and the switch never moves. Only presence gates the value here, which is
+ * safe because this path serves the tablet switch alone.
+ */
+static int asus_wmi_tablet_sw_get_state(struct asus_wmi *asus, u32 dev_id)
+{
+	u32 retval;
+	int err;
+
+	err = asus_wmi_get_devstate(asus, dev_id, &retval);
+	if (err < 0)
+		return err;
+
+	if (!FIELD_GET(ASUS_WMI_DSTS_PRESENCE_BIT, retval))
+		return -ENODEV;
+
+	return FIELD_GET(ASUS_WMI_DSTS_STATUS_BIT, retval);
+}
+
 static void asus_wmi_tablet_sw_init(struct asus_wmi *asus, u32 dev_id, int event_code)
 {
 	struct device *dev = &asus->platform_device->dev;
 	int result;
 
-	result = asus_wmi_get_devstate_simple(asus, dev_id);
+	result = asus_wmi_tablet_sw_get_state(asus, dev_id);
 	if (result >=
 0) {
 		input_set_capability(asus->inputdev, EV_SW, SW_TABLET_MODE);
 		asus_wmi_tablet_sw_report(asus, result);
@@ -786,7 +815,7 @@ static void asus_wmi_tablet_mode_get_state(struct asus_wmi *asus)
 	if (!asus->tablet_switch_dev_id)
 		return;
 
-	result = asus_wmi_get_devstate_simple(asus, asus->tablet_switch_dev_id);
+	result = asus_wmi_tablet_sw_get_state(asus, asus->tablet_switch_dev_id);
 	if (result >= 0)
 		asus_wmi_tablet_sw_report(asus, result);
 }
-- 
2.55.0


--cc40dcb941ef3ab625d9bb6ae90aa5384c364d38907c4f6328a902378af1
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="publickey - robineveraars@pm.me -
 0x8B6BA132.asc"; name="publickey - robineveraars@pm.me - 0x8B6BA132.asc"
Content-Type: application/pgp-keys; filename="publickey -
 robineveraars@pm.me - 0x8B6BA132.asc"; name="publickey -
 robineveraars@pm.me - 0x8B6BA132.asc"

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tCkNvbW1lbnQ6IGh0dHBzOi8vZ29w
ZW5wZ3Aub3JnClZlcnNpb246IEdvcGVuUEdQIDIuMTAuMAoKeGpNRWFoOGxaUllKS3dZQkJBSGFS
dzhCQVFkQWFSa3p2ZTQ5ckJFSk1LSkg3NDZSWEhZKzJmVDc3b3hST2k1ZAo4SnBMKzY3TktYSnZZ
bWx1WlhabGNtRmhjbk5BY0cwdWJXVWdQSEp2WW1sdVpYWmxjbUZoY25OQWNHMHViV1UrCndzQVJC
Qk1XQ2dDREJZSnFIeVZsQXdzSkJ3a1FIY1YvYThzR0dvcEZGQUFBQUFBQUhBQWdjMkZzZEVCdWIz
UmgKZEdsdmJuTXViM0JsYm5CbmNHcHpMbTl5Wng2VjVxUzg5dzdDRFlTSXNjNU54dVBKSTFyZ29F
eVkvdjhkYlAzSApxa29OQXhVS0NBUVdBQUlCQWhrQkFwc0RBaDRCRmlFRWkydWhNcmIyWHVqRm5G
akxIY1YvYThzR0dvb0FBQVpzCkFQOXpJS1d3dWJDbEZFczBKNmpwUUhUS1hGVHErOTlNUmtmREtx
SVRidW1RelFEL1IyT2F6VHA0b0NKTzJiT0QKTkZsaVZBbTh5WFA2QSs1ODZ6UjJZS3QwUkFiT09B
UnFIeVZsRWdvckJnRUVBWmRWQVFVQkFRZEEzcDVGN2I1TwpGc1dLclNXRW1FSGlhL29lN25vLyta
MVcwT1BmZllyRFB5OERBUWdId3I0RUdCWUtBSEFGZ21vZkpXVUpFQjNGCmYydkxCaHFLUlJRQUFB
QUFBQndBSUhOaGJIUkFibTkwWVhScGIyNXpMbTl3Wlc1d1ozQnFjeTV2Y21ldlVkUisKViszVWd2
SVZqcURMRk9XeXlHcDVoNEpYQVBmWVpzRC8vUkhndlFLYkRCWWhCSXRyb1RLMjlsN294WnhZeXgz
RgpmMnZMQmhxS0FBQm9GZ0VBOGU0ZVNMU2FMbXY4L2UyVzFMOS9WS0FiajJaN0pFUzZLQXBpOUJa
Nm5RZ0JBTmhaCkZoTUZ6c3l6dTJZWXRhQjhTWXRWdGhKSjYvZUlRVFQ2VWRRRUlZc0YKPVlLaE0K
LS0tLS1FTkQgUEdQIFBVQkxJQyBLRVkgQkxPQ0stLS0tLQ==
--cc40dcb941ef3ab625d9bb6ae90aa5384c364d38907c4f6328a902378af1--

--------a54b98a1276ca93ff5c63e5a87f9c379838687be18851de58cf9cbf17cb6d8cc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wqsEARYIAF0FgmpzRI0JEB3Ff2vLBhqKNRQAAAAAABwAEHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmdx+RZIipQA3El/FGSVbMllFiEEi2uhMrb2XujF
nFjLHcV/a8sGGooAAOfNAP92Rq2el65F7qE8FWqJTWMaCxqjUR0rpo7qk+xM
TN/xmwD/ckZu278sN3mB+U7kE8HsdY2c4yCI1Wqh+P2ktNJb3gs=
=JFfa
-----END PGP SIGNATURE-----


--------a54b98a1276ca93ff5c63e5a87f9c379838687be18851de58cf9cbf17cb6d8cc--

