From: Corentin Chary <corentin.chary@gmail.com>
Subject: [PATCH 06/14] drivers, samsung-laptop: fix usage of isalnum
Date: Tue, 20 Mar 2012 09:53:06 +0100
Message-ID: <1332233594-13099-7-git-send-email-corentin.chary@gmail.com>
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

linux/ctype.h is needed for isalnum() to avoid a build error:

drivers/platform/x86/samsung-laptop.c: In function =E2=80=98samsung_sab=
i_diag=E2=80=99:
drivers/platform/x86/samsung-laptop.c:1306: error: implicit declaration=
 of function =E2=80=98isalnum=E2=80=99

Signed-off-by: David Rientjes <rientjes@google.com>
Signed-off-by: Corentin Chary <corentincj@iksaif.net>
---
 drivers/platform/x86/samsung-laptop.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform/x=
86/samsung-laptop.c
index b7c67c8..d1142e3 100644
--- a/drivers/platform/x86/samsung-laptop.c
+++ b/drivers/platform/x86/samsung-laptop.c
@@ -25,6 +25,7 @@
 #include <linux/acpi.h>
 #include <linux/seq_file.h>
 #include <linux/debugfs.h>
+#include <linux/ctype.h>
=20
 /*
  * This driver is needed because a number of Samsung laptops do not ho=
ok
--=20
1.7.3.4
