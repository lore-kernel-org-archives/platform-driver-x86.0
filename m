Received: from mail-106118.protonmail.ch (mail-106118.protonmail.ch [79.135.106.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DE8347537
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Aug 2026 14:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785939098; cv=none; b=Wrx5gJThGxd0nfSF95bZz5P9YtMwv8eFrupHoqO4B98iuIBbFwJ4C2b8TYDn7aG9Ae2hYFp0k3MCeqYEL7FrS6Jx5lqlQNHT8BT7HX7YGOojY6INUHjWRHIpg1+Kc8n2OCGaLrxjJ6FMs3rgZVuaNHldDyemtDA5BE+LwPgzFEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785939098; c=relaxed/simple;
	bh=mlv9MLcdbn+7HcYm+m9vNSkc4CF74X3/j3mm/v8PbvU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BEf5hvN1wqOUjVLas+l2/tFYRCkiiMsn7ngrY2JC5/po/t7RMznogFTmqW8i4oAhzW3caMXaXW7S06uCOSjU2tVsLXsxYUFMpiffeVGj+w5hQQQwJopiFybm9vQe9uFBn+LRU5lNsHG+LV8aUp6QzEVPdtXf+o4/BR66xkC40Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=BhCCSn/S; arc=none smtp.client-ip=79.135.106.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="BhCCSn/S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1785939094; x=1786198294;
	bh=jh2DdhDTj/VhijBA5wm2Fhn1Zg17FPsPhl9aSLAlSgs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=BhCCSn/SSa+aEmVXNqRO3hWmQrxEe5bQ3k4Z44iwagvGdn4emQExolu4Bg1NPZahW
	 DPb9J6f+vDs+rAWu/+BjGqP9r6TME666c2+ItlcbqYKgPkWuJUUh0VtAiaJ3SKovXM
	 9sYGiS+3lBhxFc9uXg9lbpfTFsaaeCWWyH2bkwL4fxxkdAaax9a58ENe3ukqbnIAsv
	 fudkVWUUegsnPlvzf1uno/5tOB3fPcRzW5jjweSn9C2k94MPb9NCsJ+a9SK0UmaMty
	 VWqq64nw3mrAJYuHoUAJoRYNWhTWH4VKCQ7H3P/wdjUUUW5cfGkJ0YcvUu8sb184WH
	 vBFfQCMwJXLQA==
Date: Wed, 05 Aug 2026 14:11:29 +0000
To: hansg@kernel.org, ilpo.jarvinen@linux.intel.com
From: Robin Everaars <robineveraars@pm.me>
Cc: corentin.chary@gmail.com, luke@ljones.dev, denis.benato@linux.dev, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] platform/x86: asus-wmi: accept either lid-flip notify code
Message-ID: <20260805141114.699959-3-robineveraars@pm.me>
In-Reply-To: <20260805141114.699959-1-robineveraars@pm.me>
References: <20260805101502.235668-1-robineveraars@pm.me> <20260805141114.699959-1-robineveraars@pm.me>
Feedback-ID: 201127006:user:proton
X-Pm-Message-ID: 0c7f39118ddecf221eb0f2b24ec58429fc966f5b
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="------9a3275b0c8d89c238941b489de727f844540f73add964d6bcec2f67699ba5ae8"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------9a3275b0c8d89c238941b489de727f844540f73add964d6bcec2f67699ba5ae8
Content-Type: multipart/mixed;
 boundary=8f275d80dcd37903acc880a6af70f98f7fb9fc46ab05067e6ab25d4c9798
From: Robin Everaars <robineveraars@pm.me>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: corentin.chary@gmail.com,
	luke@ljones.dev,
	denis.benato@linux.dev,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] platform/x86: asus-wmi: accept either lid-flip notify code
Date: Wed,  5 Aug 2026 16:11:14 +0200
Message-ID: <20260805141114.699959-3-robineveraars@pm.me>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260805141114.699959-1-robineveraars@pm.me>
References: <20260805101502.235668-1-robineveraars@pm.me>
 <20260805141114.699959-1-robineveraars@pm.me>
MIME-Version: 1.0

--8f275d80dcd37903acc880a6af70f98f7fb9fc46ab05067e6ab25d4c9798
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
index dce4d07..8b63fb4 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -820,6 +820,27 @@ static void asus_wmi_tablet_mode_get_state(struct asus_wmi *asus)
 		asus_wmi_tablet_sw_report(asus, result);
 }
 
+/*
+ * Some convertibles report the hinge at one lid-flip devid while their firmware
+ * notifies with the other lid-flip code, a pairing no tablet_mode_sw value
+ * covers. The ASUS ProArt PX13 (HN7306EAC) is one: ASUS_WMI_DEVID_LID_FLIP is
+ * frozen at 1 in every pose while ASUS_WMI_DEVID_LID_FLIP_ROG tracks the hinge,
+ * yet the fold notifies with NOTIFY_LID_FLIP rather than NOTIFY_LID_FLIP_ROG.
+ * Accept either code once a lid-flip switch is registered; both are the same
+ * "lid flip action" event 
and both already map to KEY_PROG2 in the sparse keymap.
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
@@ -4675,7 +4696,7 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
 		return;
 	}
 
-	if (code == asus->tablet_switch_event_code) {
+	if (asus_wmi_is_tablet_switch_code(asus, code)) {
 		asus_wmi_tablet_mode_get_state(asus);
 		return;
 	}
-- 
2.55.0


--8f275d80dcd37903acc880a6af70f98f7fb9fc46ab05067e6ab25d4c9798
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
--8f275d80dcd37903acc880a6af70f98f7fb9fc46ab05067e6ab25d4c9798--

--------9a3275b0c8d89c238941b489de727f844540f73add964d6bcec2f67699ba5ae8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wqsEARYIAF0FgmpzRJEJEB3Ff2vLBhqKNRQAAAAAABwAEHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmfByYr1joU5wJ1eyUmgZxfXFiEEi2uhMrb2XujF
nFjLHcV/a8sGGooAANYyAQCPUy4eTiS1Tfd8n02Rdl5VSo2d+YMYV07ZQlzS
WjaMugEAiejF3AEcyc1V8gqffQAhwTZyTVnYjaTdYTcnvPOwFwk=
=5wlf
-----END PGP SIGNATURE-----


--------9a3275b0c8d89c238941b489de727f844540f73add964d6bcec2f67699ba5ae8--

