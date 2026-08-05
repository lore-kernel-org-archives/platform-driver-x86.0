Received: from mail-43102.protonmail.ch (mail-43102.protonmail.ch [185.70.43.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4CB41D204
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Aug 2026 10:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785924932; cv=none; b=BMboEMsUFeiDo/Ry4dB09JLkyflTanDJKtx6qu0miOcIRQiYAM0yj/kjA8c6GFi7VvgNkt/0TGPN0e1xf6SWJPza745197GrFvEh4AZ4lHgCwDS47FdBmzTiAnUD0ahV26w+epJ8Dkp4tuzTIg78RDpoIo3uyFz+3pmggVippcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785924932; c=relaxed/simple;
	bh=+gwRlYA1Sq9WmrsPjYV26mAaCREZ8uqsygHYwDUd700=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IpeuJNJo8zfSPHq0Q2txpoHpNGIlys3vpSWXB6H7ml+qoVo7MxKC6aamvyM4LzUv82kVYl35lQSfbbjxRwfPqfXOq3zmo2IdlG1VTdiDmPvWTlJ+Hff42a19JRpvLxLErWHF7PJ7uJ4KTquJFzAU3+I37aYzWR5xq6n0Mvdnfmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=mD5FUTE+; arc=none smtp.client-ip=185.70.43.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="mD5FUTE+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1785924926; x=1786184126;
	bh=qR+9pvgk0/coh1G3kpBzeg4+78PIkJ0Tfb5FCpjpXjw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=mD5FUTE+M0w7g1dAswSonK3GWMARWudne9t0UnLMZidMOEoz2ghRuN3YytxTcrjuS
	 /Hu2I1JQokM/OStic9R13lmZwSz9z7USgUQ7DhAEq3iydBIZpU5VbxT28X726gDOs1
	 yBOFnh5TqBCD/FcKH6UP2m4bRW4ktF7wZU6+m/yxQiRETKn11w75RP40RWDTUcxDiK
	 EFX6YhyhS2L/1l7PpKfek/eso6FLt0udAYO/gaOr9Utf1T84Feeum/kGx4UGVXXtK+
	 JheoJ2VFOR/JbxZC6eYT+Gmf0AvBR180DV131taIkirwmqVzZ/bF6KLy3GYycNjTeu
	 Q7rWT6o/+xAnw==
Date: Wed, 05 Aug 2026 10:15:21 +0000
To: hansg@kernel.org, ilpo.jarvinen@linux.intel.com
From: Robin Everaars <robineveraars@pm.me>
Cc: corentin.chary@gmail.com, luke@ljones.dev, denis.benato@linux.dev, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] platform/x86: asus-wmi: accept either lid-flip notify code
Message-ID: <20260805101502.235668-3-robineveraars@pm.me>
In-Reply-To: <20260805101502.235668-1-robineveraars@pm.me>
References: <20260805101502.235668-1-robineveraars@pm.me>
Feedback-ID: 201127006:user:proton
X-Pm-Message-ID: 0e37a2da0e6023c6e3e9e9de6611115efb2da89b
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="------482fba0ffd51ca37e22245b7eb20ad8ed69b51e468425191705343d84d5970e8"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------482fba0ffd51ca37e22245b7eb20ad8ed69b51e468425191705343d84d5970e8
Content-Type: multipart/mixed;
 boundary=b2377afddfee960ad46b33fd48a2722905b7f618589918b65bfd0fa3a2f2
From: Robin Everaars <robineveraars@pm.me>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: corentin.chary@gmail.com,
	luke@ljones.dev,
	denis.benato@linux.dev,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] platform/x86: asus-wmi: accept either lid-flip notify code
Date: Wed,  5 Aug 2026 12:15:02 +0200
Message-ID: <20260805101502.235668-3-robineveraars@pm.me>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260805101502.235668-1-robineveraars@pm.me>
References: <20260805101502.235668-1-robineveraars@pm.me>
MIME-Version: 1.0

--b2377afddfee960ad46b33fd48a2722905b7f618589918b65bfd0fa3a2f2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

asus-wmi pairs the devid it polls for the tablet switch with the single
notify code it listens for, and tablet_mode_sw only offers those fixed
pairings. Some convertibles read the hinge at one lid-flip devid but
notify with the other, which no value covers.

The ASUS ProArt PX13 (HN7306EAC) is one. ASUS_WMI_DEVID_LID_FLIP is frozen
at 1 in every pose while ASUS_WMI_DEVID_LID_FLIP_ROG tracks the hinge, yet
folding notifies with NOTIFY_LID_FLIP rather than NOTIFY_LID_FLIP_ROG. So
tablet_mode_sw=2 pins the switch on and suspends the internal keyboard for
good, and tablet_mode_sw=3 reads the right devid but never hears the event.

Accept either lid-flip code once a lid-flip switch is registered. Both are
the same "lid flip action" event and both already map to KEY_PROG2 in the
sparse keymap. Machines with a keyboard-dock switch notify with 0x75 and
are unaffected, and with no switch registered the event code is 0 and the
old equality test still runs.

Signed-off-by: Robin 
Everaars <robineveraars@pm.me>
---
 drivers/platform/x86/asus-wmi.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index f68fd2bcd..bcbb98529 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -819,6 +819,27 @@ static void asus_wmi_tablet_mode_get_state(struct asus_wmi *asus)
 		asus_wmi_tablet_sw_report(asus, result);
 }
 
+/*
+ * Some convertibles report the hinge at one lid-flip devid while their firmware
+ * notifies with the other lid-flip code, a pairing no tablet_mode_sw value
+ * covers. The ASUS ProArt PX13 (HN7306EAC) is one: ASUS_WMI_DEVID_LID_FLIP is
+ * frozen at 1 in every pose while ASUS_WMI_DEVID_LID_FLIP_ROG tracks the hinge,
+ * yet the fold notifies with NOTIFY_LID_FLIP rather than NOTIFY_LID_FLIP_ROG.
+ * Accept either code once a lid-flip switch is registered; both are the same
+ * "lid flip action" ev
ent and both already map to KEY_PROG2 in the sparse keymap.
+ */
+static bool asus_wmi_is_tablet_switch_code(struct asus_wmi *asus, int code)
+{
+	if (code == asus->tablet_switch_event_code)
+		return true;
+
+	if (asus->tablet_switch_event_code == NOTIFY_LID_FLIP ||
+	    asus->tablet_switch_event_code == NOTIFY_LID_FLIP_ROG)
+		return code == NOTIFY_LID_FLIP || code == NOTIFY_LID_FLIP_ROG;
+
+	return false;
+}
+
 /* Charging mode, 1=Barrel, 2=USB ******************************************/
 #if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
 static ssize_t charge_mode_show(struct device *dev,
@@ -4674,7 +4695,7 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
 		return;
 	}
 
-	if (code == asus->tablet_switch_event_code) {
+	if (asus_wmi_is_tablet_switch_code(asus, code)) {
 		asus_wmi_tablet_mode_get_state(asus);
 		return;
 	}
-- 
2.55.0


--b2377afddfee960ad46b33fd48a2722905b7f618589918b65bfd0fa3a2f2
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
--b2377afddfee960ad46b33fd48a2722905b7f618589918b65bfd0fa3a2f2--

--------482fba0ffd51ca37e22245b7eb20ad8ed69b51e468425191705343d84d5970e8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wqsEARYIAF0FgmpzDTkJEB3Ff2vLBhqKNRQAAAAAABwAEHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmdY5Yx7bG+TFxNM2ESh180yFiEEi2uhMrb2XujF
nFjLHcV/a8sGGooAAEk3AP9ClF5NvWxfvKUrA3JCV2SAv59EQo63clyrUymr
QDJPggEA37sJw0MLQzhmtdEGNSMWKODH8BXJWlKiuEvQkLNzIAU=
=zcB1
-----END PGP SIGNATURE-----


--------482fba0ffd51ca37e22245b7eb20ad8ed69b51e468425191705343d84d5970e8--

