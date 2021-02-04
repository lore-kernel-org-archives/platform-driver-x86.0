Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCD23C433E0
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Feb 2021 14:21:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A69A564DEB
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Feb 2021 14:21:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236638AbhBDOVQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 4 Feb 2021 09:21:16 -0500
Received: from mail-40131.protonmail.ch ([185.70.40.131]:24075 "EHLO
        mail-40131.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236651AbhBDOVJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Feb 2021 09:21:09 -0500
Date:   Thu, 04 Feb 2021 14:20:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1612448424;
        bh=/3im6k1GNlJEIup7dacbvSESNlDgje5cX9xH2M6HCdg=;
        h=Date:To:From:Reply-To:Subject:From;
        b=KAiNUiVI8aFZF5B4Mqqi1Sdqnol9Bmr9Sqx89c9xe/MiCz6ETR4+oObOadzIjO3CY
         4VrNm3g8+bwi0pZAMJuLOVRpMjsYxBmuvWOAMQEhUev0lZ7AMplSJ3XBRgGwenova0
         KUMJce5LmtTF4X8pcd9zb1wwOTQpYK3bx+6t908k=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH] platform/x86: Kconfig: add missing selects for ideapad-laptop
Message-ID: <20210204142010.356675-1-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

LED class support is needed by the ideapad-laptop module to compile after
the referenced commit. Add missing NEW_LEDS and LEDS_CLASS to Kconfig.

Fixes: 503325f84bc0 ("platform/x86: ideapad-laptop: add keyboard backlight =
control support")
Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index cf76e724e8c3..89cc2936f2ef 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -452,6 +452,8 @@ config IDEAPAD_LAPTOP
 =09depends on ACPI_WMI || ACPI_WMI =3D n
 =09depends on ACPI_PLATFORM_PROFILE
 =09select INPUT_SPARSEKMAP
+=09select NEW_LEDS
+=09select LEDS_CLASS
 =09help
 =09  This is a driver for Lenovo IdeaPad netbooks contains drivers for
 =09  rfkill switch, hotkey, fan control and backlight control.
--=20
2.30.0


