From: "=?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?=" <jprvita@gmail.com>
Subject: [PATCH 2/4] asus-wrc: Add ACPI HID ATK4001
Date: Tue, 15 Dec 2015 10:30:40 -0500
Message-ID: <1450193442-7930-3-git-send-email-jprvita@endlessm.com>
References: <1450193442-7930-1-git-send-email-jprvita@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f170.google.com ([209.85.220.170]:35188 "EHLO
	mail-qk0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964829AbbLOPar (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 15 Dec 2015 10:30:47 -0500
Received: by mail-qk0-f170.google.com with SMTP id b125so17941974qkf.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Dec 2015 07:30:47 -0800 (PST)
In-Reply-To: <1450193442-7930-1-git-send-email-jprvita@endlessm.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, jprvita@gmail.com, =?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?= <jprvita@endlessm.com>

As reported in https://bugzilla.kernel.org/show_bug.cgi?id=3D98931#c22 =
in
the Asus UX31A the "Asus Wireless Radio Control" device (ASHS) uses the
HID "ATK4001".

Signed-off-by: Jo=C3=A3o Paulo Rechi Vita <jprvita@endlessm.com>
Reported-by: Tasev Nikola <tasev.stefanoska@skynet.be>
---
 drivers/platform/x86/asus-wrc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/asus-wrc.c b/drivers/platform/x86/asu=
s-wrc.c
index 13a2022..941ad73 100644
--- a/drivers/platform/x86/asus-wrc.c
+++ b/drivers/platform/x86/asus-wrc.c
@@ -96,6 +96,7 @@ static int asus_wrc_remove(struct acpi_device *device=
)
 }
=20
 static const struct acpi_device_id device_ids[] =3D {
+	{"ATK4001", 0},
 	{"ATK4002", 0},
 	{"", 0},
 };
--=20
2.5.0
