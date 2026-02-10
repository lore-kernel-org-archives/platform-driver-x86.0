Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63171333448;
	Tue, 10 Feb 2026 23:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770766217; cv=none; b=eODrxEr+Ib8rrA3mLJkNjsiqHN7UebIbLXDT4VP33wmj2hUIkjUDs+XWaXkAnbKjPG3Zol4LiQalb38S0QOEk0YMLsbWlDSo36DEzehPwmqZ/BS2pt3o8083B02/go1lBjmsstAbXzrq73wwAPwVE8Thy1qWI27bu6qfvbvvQaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770766217; c=relaxed/simple;
	bh=pQoG88jV7mEdEhVKU+etXqUr9H7ljQz5YkoRYnTHSss=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=a7gIdj6wHga1IRuMll+oTr2acrv8oFVAtfv1S0vQSsUPjJQnbIXxzISHNPElX0HjAjA7FcvCjE6ooh8n6ezNHjnwO8MGtCeQKzTHH58pFSkDELcb7pPu9abu4rQwWZ3Y9c24QGqsFqq8F9BJJ7nUPRjM+91n99pNyttuphQoxmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=LPY4tYIw; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="LPY4tYIw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1770766206; x=1771371006; i=w_armin@gmx.de;
	bh=ivRcoZ05eLq3QaGF2INQXAAfXk0viYFYVkQjYMzIxPE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=LPY4tYIw3mvTgK4n2eUbqM89LTpRGyxfpZnD87MQm8X+m1GCwMmRFgoE8IH0sv+r
	 o/SgmMB37MSm2WubFfC2P7vUEGN1az0eTe0/wKDHVXD4eOofllaxvh16JNYQOUUlp
	 svAkiHRUIZzTy99BdZH4lO043YMr2xvx7HDgRRIiCW1RXnPk5KOY7nwGKMQ+WDKka
	 I7xRSU+4SvvEngUkBt6+X/WFdyS7B1kCBQmSMVy0tlf8ejH+AGAOws/vCW5nZWefB
	 JQRxaQQlmjM+7149Up+hcJ2x1nFBsVLCKE/yj9xn4DramTWo4/UtknBDUKpnqYOGt
	 NOzhJK4Ru0EhxH76Ow==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.242.224]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MhlGq-1vL08r2Noe-00bJn9; Wed, 11 Feb 2026 00:30:05 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] platform/x86: uniwill-laptop: Handle super key lock events
Date: Wed, 11 Feb 2026 00:29:46 +0100
Message-Id: <20260210232946.302936-6-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260210232946.302936-1-W_Armin@gmx.de>
References: <20260210232946.302936-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FiIDtqET+ZstP2srIn4xugpPLNZw7aclTpQZKhTQ3mkqd/jK64H
 LE9aj6bLkyABV5yHrPRnG28AZMYzSxfSaQsfwfuScYFP7t0+4eURYLfthJO67LYIq1+xXBv
 3qY/WXyWrpxJjk7uhRwTayN/jZEDLRNRalaQ04YHX7bAyxnVJpAgS2OI68ipdgYHAe6GKG2
 9B18kZl8pCmijlb4p7UYw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:owpcdnurq9s=;iIdxtfwmu4GhOu+lvJwAQP7q2Sb
 GUPXdoaM1ToxL9zeNQOpnSEvozp2eFIYdIXVzwgUlysXjq2d9uFQf5wB1w1tWdC8pyw1z76ne
 gpzpDlBEq06NRe1oNDAimmD7kqWm0UTMrHJF7w1IlSCgVoDayJ44W0vu7Eiy77SMCWk5qHiP4
 +jU1A6K86a7EQsIZsZXb8hiP66kJ6yFHUpx+oIL9KDv5H0y8jTBrfkhYTkLK7TdrUzJ7TGNDn
 f8LjFuicv2hBaCAq8AfjjQ1sj05MnJcC2A4Z2zHRz1DrZewaV3rzzcaIVVgKFqGsyx7EW7G1o
 jS+aUcnAHeU46yMFt9y7iZ5Zqhlt7Wgig7xAl9KVuLGLNMjC0Yjj9M89xfmCTTjEp7WlWHeYv
 E9iLN903pBAcCUE8PvsMBzlWVm6Plv7Jil+zmY1JStzNeq7pgCc4WKYuOPzs01o+3bdstUsNb
 9vZb6enLC38wcX0PhNf2veXbctf42OOB/bejEQNeK6fmJpuo0nzeOI9KFBbtypWiglVQw2qDn
 Kk/wkVjOiN0tT+gR3Ty42x5nn1I+PYX6gyc4K56rpytiA14V88VwVwuuMFQ4gNZ/tfafZhCAd
 DUCfkhQlPFs+HcIpu1LMezZMYbdyb0X0kDWrJ6a7SdOlxd916xYnkcibZxaq8VRyCzGehj8rv
 wcmpE8Ry+ZLGkFzVdFMnccjAVP/WvTuD+qYu81f01WO6BP7uPvbItKaoS4hw3lopJ66iDCjeZ
 KiV7S6XZyoKxg0/2enDQ5ejr3t2JYv8+Oh2CnsC9aeTrts4LNQ5v8FrfWwt/gbdB1++LaxcIf
 DkP+fW1gCemX7xq6SkHiAOaE9H9u4toP6y7SgHwUVWO2mvwluNXiOmEvmgNKx3HRj5dJ8C2OH
 YAMTWGpmg7u+EPErKTH9kVVduHgxDq8jvaVNdHAs0Cvv/8qBJavBq7vu1eiFzzwwf4XpItOT9
 cpkXzAQo8KjXqNg2UYRTyPCUcByoycwGhQlTz0/u/znVNCsiHJfGPpAo10exWbyrRa8Kh8SoD
 Pk5x7b1fqZB1r6YEsiS1xADXcHIq467Hca9Pw13j0t2+0sqDPrbzvLykket4v8VJNw4klDLAl
 qSCNyjb/VDjhn89zyB27321VqsUpV4Pqy1AmXhedXgt7sjmzkusEh05GZPM4ASHHiL+vo3Y7P
 hcSzYjGSiBVEkoB9RDFLR93AyNJFFRRG2APGYymNaf43xHmFMxi4nFQym0tLeDy64gbPTXvnw
 zivgakkg/LpG4QtruGTemV49tvrVLieoPneljeRlwXnrbhk3czWj5odzbdzWr1bc8P46i1PdX
 wiiCl5fFoiCi79y3CCFsbNNaYRWaIexZNVe44adbIVbjQzC0lEZ74PFR4ndxuzF9OC7n7h8sK
 ESd3wlBUqw8yFK2yDjIXyh14xtRzYGXKleXeXScBVKgykTDTiZUjjvTbR+yPQNOOZLHiF2fpe
 hiz6B9ZpFbUdw5FssEZNHnb5ITdMoBouqvdY7xsjylLPQdjMxFiXRpnIW+di515R8RrBWSphl
 VsmnMhlDwUsnYyoRgiiFgySjt8TresP+T3q3atewelAv8/88CZX1Fy+l7uQbjmEVQeTUikVAM
 0IHY2eBLDzb1tA+oWotqwsv1qscCQhgOXj80fnRTIrz62r9NHzSCsjhKGTzMjZRDgRNOKxdDG
 LPj4IVOXjp1mhfpm9PPk6FeRIMFLCH2NPEqC+iijBSDNICcSS0fExgM4r5EKsI2WlO+inwdXe
 LWR7/YLARHzOv3kKZbJoIfQpSZkaWEKJlUzL1RyaDOw9mYFUhf24i6NWasNQx/2l+D+tSohZD
 GeQU6WmR9r+xEUTMD1eroZsKViBhPImRs6pGehCEWDXQaSlJRhfZxQ7NNeI2UD3BeGNJGYSaf
 W1/C/4KcqB/+QNhvBBlHsoKW2cjqyH+Gb+IFIjhDObPqEuuL11+ckvINElT6Q3OrI1+a+odzM
 K+++L4lHwlxB2yfYS0yoLxQ2fcuhQ7zRwjS1YkREo2obZjTmA9jETtK7OeJbYrmHzGqtBtYi9
 Dxk6W4+QiWO/qgAKy9TVEn8dlEP+NFAqZ+ilmrGZy5lpZLyjls9GGOEdkkvOAYxB0iO49M2e0
 DgnaFG8WrKBGaSQ+YTlbPejrvXKrwO90A/t5iwY+rPGpwzHWDapX/SaeioEsbmmedW0u2mjzX
 d79u9kpwLLrTqPDlTBiW/B7Mec+SlnsttkGxsiV8qPNmuBtWPwivq7tBF7eEwHz4L1z1DuF0j
 wyPnqfRwwVa7335UnTyczp1YKXrZiJ+dsJMc/mzVYGUz6X01EgWzhi6jyIUcAoXSEezQ1xkRb
 qvkF8gET7wKjLS29i0vvH/q3BNSW+6MvTLL+jYDgPq/Z2OIGMjS9Yz50xUgzOrmiWEomghfsU
 xqaMgWkQP9AS6HkYrBTLmQieTgKDNnvhKgfW6qe1xQQ0XlGDISka8SudFX+aTJ0il0wAXxq0B
 e5D2OZJ7BT19OlUVKFaaVDlI2AnGaS4Qxvyh9lW8UKA+T7NvjyxCe1rDfhEXbpoN24F9RdZRI
 zL3HGbfit0usdV/P76z7t2N7vuAuOv71urxQIpb0q85n3SPzVukP3regzj6l6wNbcJ15feHMo
 Fn5dmAvFQ278Lev3mBdRhpmhr70J9/TV6+PpHxAhDVbwZTNh0cEo2Zk3XiqyYsS3K80gT2emX
 ueA7sBy0di5kTfwz1bGeGgQpXih0EXdND2GiautGhPhfsDmg72HDjAZd+3WJYjst8S66uxBRn
 a8oUde0JLHY1XjzWavUw4LY3oNzExpHG/BEFOmsAJ0hjZsFptkSr+uCh0gqxevyp/dxOUHFsI
 TJFbvu7qoI+mY+KQcDxygB5DSwjsKg0QaKn7i5SCB84isHC+7gu8l/p60Bnst/7CFTQDUhtuz
 Vi6KTDX90AG9Jskmh2KZwYW7ytmuLHOHTfkr5ZB73sBB08D5mKR4IpgLEESsG3d6H7PooqZf8
 9Alr8GB0cPxL/iEUzjIjslzVP1ZZEzjGFXQFY19uumJPlvIVqux/X2AVRfd5J6XKTiCx9pVm/
 /tDUOz89IZlOMVFLJfBZDxqR2ccXjhnim0dfT8K40sxiQQL7Sekvf8fFZ7YTLrjzk5g09d9Q6
 7KoiH6j9vCTMoCWnzQB93zcNTtiKaMALPDkdM2nAA267Tp/QperX22GK1yxOTHqY6oAQnGod8
 ZROQQZxnWcjbsukNYDEn6Kizb2j29Za9DOg+T8MejYn48C85DRTWAZvcKQNsYo34XFYkLiX5r
 g9yFszBMMknfyPWykK6HCKqilDeopqvE649l9DQSj373oUudkWnUs583JN3DE5yW31YJSr77s
 M5Jw1D1xq7b2TXEve3N9n7wMggV/x/5ahHtyIRU2rV7eQGILX2pqN1dTVzKA1WZKEMAxqu4Sz
 fqQ62ptI5aYEhJ5nz5KM72R7yfNsHMTJlHBJYEJ917Z1MBtPuEgK0/0qsLtyvLVjkNiYYf1m0
 KVQbqZtXTpPdA9nsJBzro0oJaAdFB5Oc9dw2WPT5yeE916ZmXxqnHq8RzF61dmvaC9hq0jV02
 5Ulwg4a4Hw/joGdgHhkQfHCuN0QN1jPOIQFCMoQuT2zHLwN6jNOdWasBU2sQIK4zstzeSycrg
 qzPwBFWtq+p5Rp0/X3Wa4CtpkzIOUnd9C2la6vdASjycS1HQthQuIyiOYPU+pbm1qR/Vtd7Rs
 hcr0t5dAFiOquGhwYtrU6QKOQhrpM8QEmOSpMDWCjpQaq7KQ3yfz9k461SFcFY0NM0orp8wSo
 8IooziBK3xRe9a241FqJWcA02LlPN3d2t2UgOCohuYtePGBzWWF81dh/KUn3t+2Jd5hJ9zgOI
 Z60qgXzZRS4bUhFHP3jC5BRoQMY+ckN0KJQ2UGX8a7f79y3JvGIRBAXp9Ea+q94oGC1iP6jwq
 DnNxgcqpYFM9Nbhn6JjH8rojgK0pYOonZqsbkCbnRKVis1bJukopZmkXH96WqeYwnEZ2X/C6q
 CndwWR3dSLsFLMNy0x33IV6E5CSvck+c3NpHOY6j706HN6+utBC/LSMkWYDIt6gagKc45qXif
 kyCPGokUYhWp7zl0O1dJQNLPvXp2UQHBjS+h8XMGvZyU7MZ3Oi3WLaz/+NVW5xx71FUhobNgX
 qZR59dNM511ap1dvMjGRju/SwRAPFhw0en67rl3szz1NcXWwFENsLTtavvwQ8YVgqCV4s2+uZ
 EQPbPNa++A4vsOAHay+Yj6ZO8eYimLNZ034LlVuWSOriqY0uNFXsEaiAKNjoI0oJAkoqHxSuU
 KooxXPTA4ij0WmePWnC04DWpNjW67mRY7BAHoccBA40zxTfmU1jEBktaYAdCpHgPpGsmPgwrk
 c9I9sWy5x9WbvCUOBUvPdZ4Bq4wUPfsGslvT2k0U9pct7XTRcqBV95myjFctxg73eGWP2J5yZ
 IESjHk5sOmoj4XJt6fPx8Qa45ryY1zi87jcOqmTCL5H6pzFJXj6eQBx/SzmUb8W+MWjZPJoQU
 pOWiICGzhaxyxOE3sGWdTINp3qUJKPoMVI+UvAuwseH2Gjkrwu2x8LohA51GlwsNdmTGr3XsX
 /l8fqitBIlAGNznaTyFdCkKqIT4L/X/2aZMBidgitmfRqmfXZinbz1Zj/qXdtx6KPgQmKWeub
 7CAyHIYN6pbHY3TXxK/SqJQKw7CTutyNcNRajZpSedHAswkb87xjs5PNa4Ax43Y7mXjlN33oB
 pOL7ChScKvSJrhdYfRmUYjFF6gRE2gpdUB7uuuJdWPOGoB4WGfCdzlKkGmwjBLb/iwc1Z4HeS
 6uSmxk3c3RiDZ0eBUWdUCSJRKMblAmYB4XGA518XYYAR5Jq3DDPsceil2GJeY/C6sICh3hANy
 ru9GU08k53zwiobw9V7tvxUxGnrq1Q0sqxS7M9sbRazbYrB3QdJafkurVQLRDULExRyY2y4jV
 UMIy1bGOdyT04BzhXfIhxucqZ6itG7xQ/++b4TakmpYcoqaNInv3qncKZaB7i44qRl+y9glSg
 OxJpRQUJ+7ssCXdKHoB9y/xO9/Fdk3mQ69Jy6ORbihlcrHVvZT05GbnqbE7VQ8of4srV35Ag7
 Y3MboSwCgOro/NETwdqM3G/r4a6KTPT8wN/Io70BgUq81wngFs88LuUBoUC70D2GkVoFZ6ndI
 3XImVg9mfmmh7RikZPRybA2sfvJ2Gt95xhHczRNryytjQZn2wrEQ+lc0QeXXgNz8+GJFNtebo
 mqaiI6AU=

On many devices, the user can toggle the super key lock state by
pressing Fn + F9. Forward the associated events to the super_key_lock
sysfs attribute as a poll notification.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/uniwill/uniwill-acpi.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
index e162af1d9118..26ee21a95a8b 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -378,9 +378,6 @@ static const struct key_entry uniwill_keymap[] =3D {
 	{ KE_IGNORE,    UNIWILL_OSD_CAPSLOCK,                   { KEY_CAPSLOCK }=
},
 	{ KE_IGNORE,    UNIWILL_OSD_NUMLOCK,                    { KEY_NUMLOCK }}=
,
=20
-	/* Reported when the user locks/unlocks the super key */
-	{ KE_IGNORE,    UNIWILL_OSD_SUPER_KEY_LOCK_ENABLE,      { KEY_UNKNOWN }}=
,
-	{ KE_IGNORE,    UNIWILL_OSD_SUPER_KEY_LOCK_DISABLE,     { KEY_UNKNOWN }}=
,
 	/* Optional, might not be reported by all devices */
 	{ KE_IGNORE,	UNIWILL_OSD_SUPER_KEY_LOCK_CHANGED,	{ KEY_UNKNOWN }},
=20
@@ -1353,6 +1350,14 @@ static int uniwill_notifier_call(struct notifier_bl=
ock *nb, unsigned long action
 	struct uniwill_battery_entry *entry;
=20
 	switch (action) {
+	case UNIWILL_OSD_SUPER_KEY_LOCK_ENABLE:
+	case UNIWILL_OSD_SUPER_KEY_LOCK_DISABLE:
+		if (!uniwill_device_supports(data, UNIWILL_FEATURE_SUPER_KEY))
+			return NOTIFY_DONE;
+
+		sysfs_notify(&data->dev->kobj, NULL, "super_key_enable");
+
+		return NOTIFY_OK;
 	case UNIWILL_OSD_BATTERY_ALERT:
 		if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY))
 			return NOTIFY_DONE;
=2D-=20
2.39.5

