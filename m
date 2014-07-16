From: Mathias Krause <minipli@googlemail.com>
Subject: [PATCH 04/15] acer-wmi: Hide acer_{suspend,resume} for !CONFIG_PM_SLEEP
Date: Wed, 16 Jul 2014 19:43:06 +0200
Message-ID: <1405532597-28262-5-git-send-email-minipli@googlemail.com>
References: <1405532597-28262-1-git-send-email-minipli@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-we0-f177.google.com ([74.125.82.177]:35249 "EHLO
	mail-we0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934736AbaGPRnk (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 16 Jul 2014 13:43:40 -0400
Received: by mail-we0-f177.google.com with SMTP id w62so1305418wes.36
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Jul 2014 10:43:39 -0700 (PDT)
In-Reply-To: <1405532597-28262-1-git-send-email-minipli@googlemail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: platform-driver-x86@vger.kernel.org, Mathias Krause <minipli@googlemail.com>, "Lee, Chun-Yi" <jlee@suse.com>

Encapsulate acer_suspend() and acer_resume with #ifdef CONFIG_PM_SLEEP
to get rid of the following warnings:

  ../acer-wmi.c:2046:12: warning: =E2=80=98acer_suspend=E2=80=99 define=
d but not used [-Wunused-function]
  ../acer-wmi.c:2068:12: warning: =E2=80=98acer_resume=E2=80=99 defined=
 but not used [-Wunused-function]

Signed-off-by: Mathias Krause <minipli@googlemail.com>
Cc: "Lee, Chun-Yi" <jlee@suse.com>
---
 drivers/platform/x86/acer-wmi.c |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/ace=
r-wmi.c
index fde69ee63f..0d18c23d66 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -2044,6 +2044,7 @@ static int acer_platform_remove(struct platform_d=
evice *device)
 	return 0;
 }
=20
+#ifdef CONFIG_PM_SLEEP
 static int acer_suspend(struct device *dev)
 {
 	u32 value;
@@ -2084,6 +2085,10 @@ static int acer_resume(struct device *dev)
=20
 	return 0;
 }
+#else
+#define acer_suspend	NULL
+#define acer_resume	NULL
+#endif
=20
 static SIMPLE_DEV_PM_OPS(acer_pm, acer_suspend, acer_resume);
=20
--=20
1.7.10.4
