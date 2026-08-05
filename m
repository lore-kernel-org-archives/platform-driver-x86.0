Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A027A34A3D6
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Aug 2026 14:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785939096; cv=none; b=uitHkb0wAqimQFJ9xxP8Q1uUUxZVtK+5brj5ABzdo5IrSNk4+VmbsyVZmKe3cAB2Qb85VViAFPhaXeVBrYX9cRmHz0ZDxMdaYFc5JJgL+dVvl5PmXCVPJRYyoMQi1OFzNgMo6xt0Ct9clCCFoBElKKpPtFeTfilBWpLng1adH1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785939096; c=relaxed/simple;
	bh=UZJf9dCFyTcQIjXRPW5mZ9mwUAnptuZj+Bgg9Vo+VtQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IJXTwny3P/KeTCkbI5y7d04jK4Yc30p+P29O4x++ctMghzOZ+ASDn0xlmHuamwADtPBj7QftaWI6zfmWOa/y6/q85r1KVFx5n9fyzyLPvr49S+Zg74MNDJ5M2nsDLauJGcEiFE8nc5DvzLKgJ3nzxHRtfuryHdJ46FnyT/RlA/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=owqNaVY5; arc=none smtp.client-ip=79.135.106.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="owqNaVY5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1785939086; x=1786198286;
	bh=IXPkx6aksf3K7mLJ2HH7F6xkCsrOk7IGGKuYssIcWis=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=owqNaVY5m5ubFkYZlauy/0wjFXtB1ZFmWZMjTVzdldFsw24vj4YNPj2cjeUjpZJka
	 GYKA5C7KaFpnMNyX8NHEm6+mqXPdcke7H6A7fK9y1rnqyBgSLJcmgwQE6R0Rjw1Gn8
	 LNtn+9sQRUwFvWJNo4gtN7K/INn0LAmtCoV1Ntx0n8FDiSrGpjoS53r9kp3XjLNkgl
	 kyT2nrpSI188SUdmy2ang67+nD4DdtpDGChOYpMN1au3A686fqFvhVgkel08Qyqzfv
	 /5NXKLnC5QmF51LLJsJ1rhYlx9/V22t1LdPYaxSs4cXNFL1JMznqmVIiTm5YLk4zS2
	 7EnvZs14KAlJg==
Date: Wed, 05 Aug 2026 14:11:20 +0000
To: hansg@kernel.org, ilpo.jarvinen@linux.intel.com
From: Robin Everaars <robineveraars@pm.me>
Cc: corentin.chary@gmail.com, luke@ljones.dev, denis.benato@linux.dev, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] platform/x86: asus-wmi: make the tablet switch work on the ProArt PX13
Message-ID: <20260805141114.699959-1-robineveraars@pm.me>
In-Reply-To: <20260805101502.235668-1-robineveraars@pm.me>
References: <20260805101502.235668-1-robineveraars@pm.me>
Feedback-ID: 201127006:user:proton
X-Pm-Message-ID: 2f549438a8a46a470eeddfc21fa01157284f02c6
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="------2a493985d898c0e1ed00876b59350c340a0377c3cab0d6ea9895cbfc7322e2fb"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------2a493985d898c0e1ed00876b59350c340a0377c3cab0d6ea9895cbfc7322e2fb
Content-Type: multipart/mixed;
 boundary=38bc989c5136bca246adc4176316ef3db2d6f026fb38fe4f2cc43d89c555
From: Robin Everaars <robineveraars@pm.me>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: corentin.chary@gmail.com,
	luke@ljones.dev,
	denis.benato@linux.dev,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] platform/x86: asus-wmi: make the tablet switch work on the ProArt PX13
Date: Wed,  5 Aug 2026 16:11:12 +0200
Message-ID: <20260805141114.699959-1-robineveraars@pm.me>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260805101502.235668-1-robineveraars@pm.me>
References: <20260805101502.235668-1-robineveraars@pm.me>
MIME-Version: 1.0

--38bc989c5136bca246adc4176316ef3db2d6f026fb38fe4f2cc43d89c555
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

Changes in v2:
 - Patch 1: use FIELD_GET() for the presence and state bits instead of open
   mask-and-test, and add the linux/bitfiel
d.h include it needs. Suggested by
   Denis Benato. This also drops the !! on the return, since FIELD_GET already
   yields 0 or 1. No functional change; re-tested on the same machine.
 - No other changes. Patch 2 is unchanged.

Note that asus-wmi.c had no FIELD_GET() users before this, and the neighbouring
asus_wmi_dev_is_present() still open-codes the same presence test, so the file
is now mixed. Happy to send a separate cleanup converting the remaining
ASUS_WMI_DSTS_* users, and the masks in asus-wmi.h to BIT(), if that is wanted;
it seemed wrong to fold unrelated churn into a fix.

v1: https://lore.kernel.org/platform-driver-x86/20260805101502.235668-1-robineveraars@pm.me/

Robin Everaars (2):
  platform/x86: asus-wmi: keep the lid-flip state when UNKNOWN is set
  platform/x86: asus-wmi: accept either lid-flip notify code

 drivers/platform/x86/asus-wmi.c | 56 +++++++++++++++++++++++++++++++--
 1 file changed, 53 insertions(+), 3 deletions(-)


base-commit: aca
39607c1734ed976fdd65deb75b3555a5a0326
-- 
2.55.0


--38bc989c5136bca246adc4176316ef3db2d6f026fb38fe4f2cc43d89c555
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
--38bc989c5136bca246adc4176316ef3db2d6f026fb38fe4f2cc43d89c555--

--------2a493985d898c0e1ed00876b59350c340a0377c3cab0d6ea9895cbfc7322e2fb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wqsEARYIAF0FgmpzRIgJEB3Ff2vLBhqKNRQAAAAAABwAEHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmf0kS9YJD5knszmMw2zATKOFiEEi2uhMrb2XujF
nFjLHcV/a8sGGooAAAF8AQDv+KSker4hSxoSu85+y/NyiBpJAtitwiWDeduw
ClQgOgD/RE8tb4BTdR/x7z7QmWNZ7KvP6ooFP/+zlNN7sltAAw8=
=rYjd
-----END PGP SIGNATURE-----


--------2a493985d898c0e1ed00876b59350c340a0377c3cab0d6ea9895cbfc7322e2fb--

