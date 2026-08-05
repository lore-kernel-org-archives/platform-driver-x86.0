Received: from mail-43100.protonmail.ch (mail-43100.protonmail.ch [185.70.43.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC9C41CB39
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Aug 2026 10:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785924916; cv=none; b=SvlzNbhx6z1Pv8+/z6Q73lowX9e7dm2lvEELDcGFLmnRmYpbBOyZQHZcZfaers22YRfqxNZjjhHCn0+um9aI5vamfgBwHOl/TWlnbpLBW3sL6fhn54YBF7G9LBpwN2aSI2QBwETjVEu3Hk3F/PYKZQNQXi6vI9Pcm+ttDiNBbYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785924916; c=relaxed/simple;
	bh=mygnFC9mAZ5ghUdXldpD09TPF2H6GQJNvqm5Yf+wnEw=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rij9eidcsJT9XBiwzjiDQQInpNZvuloMO7LMYl06m81HDSrI7Dx9MZv0GsB6qDvOBKp8H8vQiLgTaF7dyVn9jEHo6rQIvyengyjzG6VFRewwyYQ4YioWOOfSzNZ0tlS5n7fL94JMAc0B5C16UPofcroWS1S149nh4E60XSJ+Qvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=kh/LA5NA; arc=none smtp.client-ip=185.70.43.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="kh/LA5NA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1785924911; x=1786184111;
	bh=rpKvQB95B0e8vSoZecOb2ZzrnzC/OO31tpSKtqo6Ujs=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=kh/LA5NAqAt6RhaLD034IhwOCnja2GDrZC6MRqSimM+hwg6vEfardm7BpHlQIhJy8
	 F44ooHBbvuN2swcM37YcXJuiB/l3drgK0+wuBT3wbi0WVMAi74XJ02gB1hiXK/fldD
	 M33sYS603nAGknJd3PF8ld4aoOIY4zp2U3Y266elJni/OhwajUH4+GsupxtJK56/Tk
	 VkRkqS/uF8yk2Ru3M6SnB97PKsRQe8CJyedMDVui2neLhGKW4Et/DFpOHcpdUiLzwO
	 Z/Sn/qtUVSrtEaxP05LLzoAD5wK/XV5qxOmPUpK5NiDToT+ompJDojAaB7P6Eqvluc
	 oWbMNwdA+C4fA==
Date: Wed, 05 Aug 2026 10:15:06 +0000
To: hansg@kernel.org, ilpo.jarvinen@linux.intel.com
From: Robin Everaars <robineveraars@pm.me>
Cc: corentin.chary@gmail.com, luke@ljones.dev, denis.benato@linux.dev, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] platform/x86: asus-wmi: make the tablet switch work on the ProArt PX13
Message-ID: <20260805101502.235668-1-robineveraars@pm.me>
Feedback-ID: 201127006:user:proton
X-Pm-Message-ID: 5837942e415d836ca3b1eaf6ce2e742a4a6b2c14
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="------d14ad7a7338fa1315514c5d7cb901469e2c4f802e727c51bf072394e47cf949a"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------d14ad7a7338fa1315514c5d7cb901469e2c4f802e727c51bf072394e47cf949a
Content-Type: multipart/mixed;
 boundary=42ff71c49c2c7741efb6d6c75c100335502352523641475b02a3c07cafde
From: Robin Everaars <robineveraars@pm.me>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: corentin.chary@gmail.com,
	luke@ljones.dev,
	denis.benato@linux.dev,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] platform/x86: asus-wmi: make the tablet switch work on the ProArt PX13
Date: Wed,  5 Aug 2026 12:15:00 +0200
Message-ID: <20260805101502.235668-1-robineveraars@pm.me>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0

--42ff71c49c2c7741efb6d6c75c100335502352523641475b02a3c07cafde
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

SW_TABLET_MODE never moves on an ASUS ProArt PX13 (HN7306EAC), and no
tablet_mode_sw value fixes it, because two independent things are in the way.

The first is a devstate quirk. The lid-flip devstate on this machine sets
ASUS_WMI_DSTS_UNKNOWN_BIT alongside the state bit while folded, so
ASUS_WMI_DEVID_LID_FLIP_ROG answers 0x00010000 open and 0x00010003 folded.
asus_wmi_get_devstate_simple() reads that bit as "state not known" and fails
with -ENODEV, throwing away a valid state that is sitting in bit 0.

The second is the devid/notify pairing. asus-wmi ties the devid it polls to the
one notify code it listens for, and tablet_mode_sw only offers fixed pairings.
This chassis reads the hinge at LID_FLIP_ROG but notifies with NOTIFY_LID_FLIP,
a combination no value covers: tablet_mode_sw=2 pins the switch on and suspends
the internal keyboard for good, while tablet_mode_sw=3 polls the right devid but
never hears the event.

Patch 1 adds a tablet-specific read that gates on
 the presence bit only, used
from the two tablet-switch paths and leaving every other
asus_wmi_get_devstate_simple() caller alone. Patch 2 accepts either lid-flip
notify code once a lid-flip switch is registered; both are the same "lid flip
action" event and both already map to KEY_PROG2 in the sparse keymap.

Machines with a keyboard-dock switch notify with 0x75 and are unaffected, and
with no switch registered the event code is 0 so the old equality test is what
still runs.

Tested on the one machine I have, an ASUS ProArt PX13 HN7306EAC: six clean
SW_TABLET_MODE transitions over three fold cycles with no stray KEY_PROG2, and
libinput suspends the internal keyboard and touchpad on fold and restores them
on unfold. I do not have another convertible to check the untouched paths on
hardware, so review of the dock case would be welcome.

Robin Everaars (2):
  platform/x86: asus-wmi: keep the lid-flip state when UNKNOWN is set
  platform/x86: asus-wmi: accept either lid-
flip notify code

 drivers/platform/x86/asus-wmi.c | 55 +++++++++++++++++++++++++++++++--
 1 file changed, 52 insertions(+), 3 deletions(-)


base-commit: aca39607c1734ed976fdd65deb75b3555a5a0326
-- 
2.55.0


--42ff71c49c2c7741efb6d6c75c100335502352523641475b02a3c07cafde
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
--42ff71c49c2c7741efb6d6c75c100335502352523641475b02a3c07cafde--

--------d14ad7a7338fa1315514c5d7cb901469e2c4f802e727c51bf072394e47cf949a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wqsEARYIAF0FgmpzDSkJEB3Ff2vLBhqKNRQAAAAAABwAEHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmeNHj29M5dFxqRf0yjRRGSqFiEEi2uhMrb2XujF
nFjLHcV/a8sGGooAABkEAP4poX3ECepIrNMqPnnTfdyUn+WunjLv+zC6xFOT
QWUHCAEAtPlThBGmtDAlEcOY3J85rOXbXtE89zzYOUYDIpYCcg4=
=Uc2B
-----END PGP SIGNATURE-----


--------d14ad7a7338fa1315514c5d7cb901469e2c4f802e727c51bf072394e47cf949a--

