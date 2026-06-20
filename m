Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1AF70818
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jun 2026 14:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781967594; cv=none; b=FYKhVgK42UmKNEsvULtOzJvmzLrdzID4L+BObPUPJ35okGr38UNwttkuHbDi/yjL8tJy1PspUfXI1tbTseVRcx7h9KRn3RGkHGiilbweFoU1h5DV9SV2cScrFKde1QGbdhsgP7VsplWYV2T08JoU6GeCFW03rSr5spou7vofLz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781967594; c=relaxed/simple;
	bh=QYDiFTPTtfQh17AC/sQS0/LIhBlWWaxUVS6FWTUClX0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IT8XfaLCZFviae6tns229yXAFMA7VkxGVGYb9/56Y3crlxBWFhUP0+J4v9QdD9B0lXyJ6ukyri3fvdE1gWf5d1mv0TUiv2ZXTMfwc52DWPzqRNIqf0f+9+HoT6RhG3FY/S69QtyMQuQ6gW6iXQCJzMtzVXxg83ruSp2D3wq1C8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nikableh.moe; spf=pass smtp.mailfrom=nikableh.moe; dkim=pass (2048-bit key) header.d=nikableh.moe header.i=@nikableh.moe header.b=VWNNln7L; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=EVnChGoB; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nikableh.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nikableh.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nikableh.moe header.i=@nikableh.moe header.b="VWNNln7L";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="EVnChGoB"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=VWNNln7LNy5w1/5E6lF+AWPddzpwQCvduoUneWcqi5t90C49MAWvqEzDZaeve8HZM+kynZfH5dm9pHtrO+XFeBsovL1YhTxvdy0Y4gXufifk+ULNTRdhzgMO36uVb9JXceiHHJEw/ie+Ydx4MxV4ZsLs5kGZB2a/UXUzUrX+EqzkGmfk1bW0OpdyGKaxZUbKlrVipXRYJyBUFANhSB2ZUFAnLUz6M1IVeB/tGLSQICtzfDojwcotUS7Z9vd3ps6DHGKd9+U3SN9OSMDIoJvenV4a98I3X91Su3BZzpe+JdShNWQMJzwaRKTpVZIHf0h/SsIGGPWdlK/sONyC2yFEcA==; s=purelymail1; d=nikableh.moe; v=1; bh=QYDiFTPTtfQh17AC/sQS0/LIhBlWWaxUVS6FWTUClX0=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=EVnChGoBuIdn8Lqz+8tyrHTq725qOEU1hX4BnVU2iQjYDi8Mv8hSOXXuv8nVfHXTSOppPie7+7ZO3Z5Qus556KAxcprTyzFOh+2TeolG4Kde6qgJmEv9zQAke9lyMypvX7Q5PK04KvBzknLiTxGbtrxpmgoQhAYtgUc86Y/QtueQVQvV1htG2KhziYr2XrgtB5wB+/IkUAx0726PpIjXIVgntEnDf08AMFagNErz+0UKu6sr8k9Co870Ld5pYJZyVJ2PpByKkRdoHVZkUG5ibIpp6oknxqym7YrD7uBunmHZeXAFoOn2ZUeH3A7ZFZUtzU79jIDCEiUswnui6/n8/g==; s=purelymail1; d=purelymail.com; v=1; bh=QYDiFTPTtfQh17AC/sQS0/LIhBlWWaxUVS6FWTUClX0=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 209604:18551:null:purelymail
X-Pm-Original-To: platform-driver-x86@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 943049068;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sat, 20 Jun 2026 14:59:36 +0000 (UTC)
From: Nika Krasnova <nika@nikableh.moe>
To: Gladyshev Ilya <foxido@foxido.dev>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mingyou Chen <qby140326@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Nika Krasnova <nika@nikableh.moe>
Subject: [PATCH] platform/x86: redmi-wmi: Add mic-mute key mapping
Date: Sat, 20 Jun 2026 16:59:23 +0200
Message-ID: <20260620145928.2156909-1-nika@nikableh.moe>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8

The mic-mute key (F4) on the Xiaomi RedmiBook Pro 16 produces WMI events
that were not present in the keymap, so the key did nothing under Linux.

The firmware reports the resulting mute state in the scancode, emitting
one event per press: 0x00002101 when it transitions to muted and
0x00012101 when it transitions to unmuted. Map both to KEY_MICMUTE so
each press is reported as a single mic-mute keypress to userspace.

Signed-off-by: Nika Krasnova <nika@nikableh.moe>
---
Link to the discussion that motivated this, including the redmi-wmi /
bitland-mifs-wmi event-GUID overlap:
https://lore.kernel.org/all/20260531123345.237521-1-nika@nikableh.moe/

 drivers/platform/x86/redmi-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/redmi-wmi.c b/drivers/platform/x86/redmi-=
wmi.c
index 58898630eda6..e000ce4234cb 100644
--- a/drivers/platform/x86/redmi-wmi.c
+++ b/drivers/platform/x86/redmi-wmi.c
@@ -25,6 +25,10 @@ static const struct key_entry redmi_wmi_keymap[] =3D {
 =09{KE_KEY, 0x00010101,=09{KEY_SWITCHVIDEOMODE}},
 =09{KE_KEY, 0x00001a01,=09{KEY_REFRESH_RATE_TOGGLE}},
=20
+=09/* Mic-mute key */
+=09{KE_KEY, 0x00002101,=09{KEY_MICMUTE}},
+=09{KE_KEY, 0x00012101,=09{KEY_MICMUTE}},
+
 =09/* AI button has code for each position */
 =09{KE_KEY, 0x00011801,=09{KEY_ASSISTANT}},
 =09{KE_KEY, 0x00011901,=09{KEY_ASSISTANT}},
--=20
2.51.2

