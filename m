Received: from mail-106120.protonmail.ch (mail-106120.protonmail.ch [79.135.106.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BED3FF1CB;
	Wed,  5 Aug 2026 10:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785924932; cv=none; b=m9Y9fmdkl4cgfxJRdjnC1viOvQoqkVeXH3s/rq24QHVsuVobO0Xm0EjRU+Aff/ByLmZ/p3yHJ/ml1QJipgaMxKD0DDCehft0hP2DWtazqNJHKEhsNaGL064+n/D/OtAuveykYPXdo8rwAs6ZMyb7Jqa9r8dfTgAulBcXHfEa8pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785924932; c=relaxed/simple;
	bh=nwRRIMSMxVajraSoUuaxwWlha64XCx82uvSeUDWDAQk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RtKQ7muTeZFzoYsP/27x+d23dC3SEXjYtF/Uyc4Wq09ADZgO4MLuTrPxFQdVXxbD8lAPEr1HRs6Kk/1CZ43eKPEzgtzL8002eHMm2vBMpq10p5Tr6NsDnMElULJNcNbQKPlViRXUyiLnHFIRn5Lmb7YA7GX5JBJdwgNd43Lphfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=gzmbp/N5; arc=none smtp.client-ip=79.135.106.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="gzmbp/N5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1785924923; x=1786184123;
	bh=L3QiOl/kicliX9h02MFf5o/IW6nejDcJP/nFKuYGJn4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=gzmbp/N53l3lcH3gzIY0MleyIgM+rgjJO29kKqh0JUmTFCBVl+aulqAZ2MANGvtx0
	 mKyciCzAdBzq0uKJ8TQfxmxWSMsbbmcKAGL5MQg+eaw5UZdso+9H4kJRuoXUEyOUM5
	 arZ0FFR09DGxnCJ5lkZ+DJUh8jzfACSZ+SeBuIiU7vbRnY+TJmODN/xFjxmJh5qnao
	 TXtj5ZROWv7ys9xXB2MtCKEyYRAKc5m3uYRBgO4otzTiGfzvs+CkDsVd2KxUrrXbYG
	 PU15Roag3p0UOD7qaBwBvc2qUPUkkDIeAm1ub3jUyhzAFxANHxAIyUf7gqN81upJ4U
	 KWE0mjGoOMJcw==
Date: Wed, 05 Aug 2026 10:15:14 +0000
To: hansg@kernel.org, ilpo.jarvinen@linux.intel.com
From: Robin Everaars <robineveraars@pm.me>
Cc: corentin.chary@gmail.com, luke@ljones.dev, denis.benato@linux.dev, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] platform/x86: asus-wmi: keep the lid-flip state when UNKNOWN is set
Message-ID: <20260805101502.235668-2-robineveraars@pm.me>
In-Reply-To: <20260805101502.235668-1-robineveraars@pm.me>
References: <20260805101502.235668-1-robineveraars@pm.me>
Feedback-ID: 201127006:user:proton
X-Pm-Message-ID: 518de0b48097bf590c5303bd2d49aa0663a2031d
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="------20fa7c1726f97877add1223ab9e81a38f1c05f3772bc2c28d1990ad963fdc953"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------20fa7c1726f97877add1223ab9e81a38f1c05f3772bc2c28d1990ad963fdc953
Content-Type: multipart/mixed;
 boundary=868fdace0fdbbb72a93ff6a260411a2082498efa466d815837c21db2f9e7
From: Robin Everaars <robineveraars@pm.me>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: corentin.chary@gmail.com,
	luke@ljones.dev,
	denis.benato@linux.dev,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] platform/x86: asus-wmi: keep the lid-flip state when UNKNOWN is set
Date: Wed,  5 Aug 2026 12:15:01 +0200
Message-ID: <20260805101502.235668-2-robineveraars@pm.me>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260805101502.235668-1-robineveraars@pm.me>
References: <20260805101502.235668-1-robineveraars@pm.me>
MIME-Version: 1.0

--868fdace0fdbbb72a93ff6a260411a2082498efa466d815837c21db2f9e7
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
 drivers/platform/x86/asus-wmi.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86
/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 8610663b8..f68fd2bcd 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -706,12 +706,40 @@ static void asus_wmi_tablet_sw_report(struct asus_wmi *asus, bool value)
 	input_sync(asus->inputdev);
 }
 
+/*
+ * Read the lid-flip state directly rather than through
+ * asus_wmi_get_devstate_simple().
+ *
+ * On some convertibles the lid-flip devstate sets ASUS_WMI_DSTS_UNKNOWN_BIT
+ * alongside the state bit while folded. Measured on an ASUS ProArt PX13
+ * (HN7306EAC), devid ASUS_WMI_DEVID_LID_FLIP_ROG answers 0x00010000 open and
+ * 0x00010003 folded, i.e. presence | state | UNKNOWN. The generic helper reads
+ * that bit as "the state is not known" and rejects the whole call with -ENODEV,
+ * so asus_wmi_tablet_mode_get_state() discards a perfectly good state sitting in
+ * bit 0 and the switch never moves. Only presence gates the value here, which is
+ * safe because this path serves 
the tablet switch alone.
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
+	if (!(retval & ASUS_WMI_DSTS_PRESENCE_BIT))
+		return -ENODEV;
+
+	return !!(retval & ASUS_WMI_DSTS_STATUS_BIT);
+}
+
 static void asus_wmi_tablet_sw_init(struct asus_wmi *asus, u32 dev_id, int event_code)
 {
 	struct device *dev = &asus->platform_device->dev;
 	int result;
 
-	result = asus_wmi_get_devstate_simple(asus, dev_id);
+	result = asus_wmi_tablet_sw_get_state(asus, dev_id);
 	if (result >= 0) {
 		input_set_capability(asus->inputdev, EV_SW, SW_TABLET_MODE);
 		asus_wmi_tablet_sw_report(asus, result);
@@ -786,7 +814,7 @@ static void asus_wmi_tablet_mode_get_state(struct asus_wmi *asus)
 	if (!asus->tablet_switch_dev_id)
 		return;
 
-	result = asus_wmi_get_devstate_simple(asus, asus->tablet_switch_dev_id);
+	result = asus_wmi
_tablet_sw_get_state(asus, asus->tablet_switch_dev_id);
 	if (result >= 0)
 		asus_wmi_tablet_sw_report(asus, result);
 }
-- 
2.55.0


--868fdace0fdbbb72a93ff6a260411a2082498efa466d815837c21db2f9e7
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
--868fdace0fdbbb72a93ff6a260411a2082498efa466d815837c21db2f9e7--

--------20fa7c1726f97877add1223ab9e81a38f1c05f3772bc2c28d1990ad963fdc953
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wqsEARYIAF0FgmpzDTEJEB3Ff2vLBhqKNRQAAAAAABwAEHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmd+7UF3EzxIbjS0/r772i6DFiEEi2uhMrb2XujF
nFjLHcV/a8sGGooAAEm2AP9Um9v1lheVgRZhDU8dbXQIOvkvgJSwq8JUhQwb
nxQgoAD8CpYgyVdyQplYl9h6zEFD3SVTe7XUyE1FGbQAj0dH2gI=
=8Yuu
-----END PGP SIGNATURE-----


--------20fa7c1726f97877add1223ab9e81a38f1c05f3772bc2c28d1990ad963fdc953--

