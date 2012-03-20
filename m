From: Corentin Chary <corentin.chary@gmail.com>
Subject: [PATCH 05/14] drivers, samsung-laptop: fix initialization of sabi_data in sabi_set_commandb
Date: Tue, 20 Mar 2012 09:53:05 +0100
Message-ID: <1332233594-13099-6-git-send-email-corentin.chary@gmail.com>
References: <1332233594-13099-1-git-send-email-corentin.chary@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1332233594-13099-1-git-send-email-corentin.chary@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, David Rientjes <rientjes@google.com>, Corentin Chary <corentincj@iksaif.net>, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

=46rom: David Rientjes <rientjes@google.com>

=46ields d0, d1, d2, and d3 are members of an anonymous struct inside a=
n
anonymous union inside struct sabi_data.  Initialization must be done b=
y
wrapping the anonymous union and structs with brackets to avoid a build
error:

drivers/platform/x86/samsung-laptop.c: In function =E2=80=98sabi_set_co=
mmandb=E2=80=99:
drivers/platform/x86/samsung-laptop.c:433: error: unknown field =E2=80=98=
d0=E2=80=99 specified in initializer
drivers/platform/x86/samsung-laptop.c:433: warning: missing braces arou=
nd initializer
drivers/platform/x86/samsung-laptop.c:433: warning: (near initializatio=
n for =E2=80=98in.<anonymous>=E2=80=99)
=2E..

Signed-off-by: David Rientjes <rientjes@google.com>
Signed-off-by: Corentin Chary <corentincj@iksaif.net>
---
 drivers/platform/x86/samsung-laptop.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform/x=
86/samsung-laptop.c
index 7d7109f..b7c67c8 100644
--- a/drivers/platform/x86/samsung-laptop.c
+++ b/drivers/platform/x86/samsung-laptop.c
@@ -430,7 +430,7 @@ exit:
 static int sabi_set_commandb(struct samsung_laptop *samsung,
 			     u16 command, u8 data)
 {
-	struct sabi_data in =3D { .d0 =3D 0, .d1 =3D 0, .d2 =3D 0, .d3 =3D 0 =
};
+	struct sabi_data in =3D { { { .d0 =3D 0, .d1 =3D 0, .d2 =3D 0, .d3 =3D=
 0 } } };
=20
 	in.data[0] =3D data;
 	return sabi_command(samsung, command, &in, NULL);
--=20
1.7.3.4
