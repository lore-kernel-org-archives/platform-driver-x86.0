Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3E6DC433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 11 Jan 2022 15:36:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245717AbiAKPgu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 11 Jan 2022 10:36:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349599AbiAKPgt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Jan 2022 10:36:49 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7380C06173F
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Jan 2022 07:36:48 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id w26so5476801wmi.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Jan 2022 07:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=EJ+Oq5F1/dMyzCOLj9sbLODEs7mhJAUL3TMU0NUxKDE=;
        b=F5BdHot8Y/hFwA2TWNvmOJ/jhFLdGJFO7VEFSO9ZCaZXtuGKceACP06A9SyX3l3+NM
         t5oYhYLIGxSD6oVpy26OSRQdwrcCxB7lb3qBjadSthbWh7MKK1Da2eTAcg8vVKuQ3be3
         u/YZcgMGb/ufSWeIbVjny8GKWxP7OLeo37T2QFZorcwFWXDX2ZKslWFE9vLQ1xrwVWxN
         kz7zxGRGmcut2QW9F9IHQDK1t3xu8msPt/znbxWJJsv7WB2RNSPQuCX1HH6OQAA3lxK6
         RlPYIAHj1fYCaeaaKQiuPEQZgVke7sYNZc2+z+RnYb+83VSYMnQxGy7e/EXSgwUPQXZu
         A1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=EJ+Oq5F1/dMyzCOLj9sbLODEs7mhJAUL3TMU0NUxKDE=;
        b=bSqp+9w+npFpwsM5UG2rpw0GBfgLC7P0M0HS6IUG9HktI8NkpvH8NYIEoxFzw9+L/G
         87URQcA/IZIez6NzcJ22hXqq++W+2CLIFvi9E/S0W0ZA7T01atuJkRK9XKCsM5YzLFve
         MAtOJtylGb9EqA+SL2ave7KKlQVwCOVF4S4DenFD4yHdBFGf9RWuzOa3nmjRuNlzLBv7
         PMEqAg1mrtG/RWWjwgzX6oCyxzMmIGHNOLY14ZeKtwyFBE59G6g4z6hmgivtClvyJt6A
         Vq51jfADAFPpx4Dr450InKwq2Fg3SPIV7ORr1Mp3I1eJCeuSSrT3sd7PBwWhBpNSo2IV
         zYWw==
X-Gm-Message-State: AOAM533w8f1s7GcFQGs5j1RTrwPxhg6BzUlcG5UQlvJVE19pgaOIrmCd
        5B/6bx3SITQY7qvH4jFdWyvbGlnmfuXVSaiEgGlZm8/bXitc7w==
X-Google-Smtp-Source: ABdhPJwXB6SZDsUItRQWgY+F8/IS+3XBi3IVLbYrSJ95Z4gFR8858rgZdvKAgNt8SLRAKieUQiegI45RzlPlZ77WQIM=
X-Received: by 2002:a1c:f613:: with SMTP id w19mr2955809wmc.58.1641915407370;
 Tue, 11 Jan 2022 07:36:47 -0800 (PST)
MIME-Version: 1.0
From:   Matt DeVillier <matt.devillier@gmail.com>
Date:   Tue, 11 Jan 2022 09:36:36 -0600
Message-ID: <CAFTm+6Aa4_zrt76Jb0=8MoGWnUVNpiuT9946R8wvEW8rx47mrA@mail.gmail.com>
Subject: [PATCH] platform/chrome: cros_ec_lpc: Fix DMI matching for newer
 Chrome devices
To:     Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Since 2017, Chrome devices running custom coreboot firmware default
to using 'Google' as the system vendor, vs 'GOOGLE' for older
devices. Add a DMI match to cover this case as well.

Test: cros_ec_lpc successfully attaches to Chromebox running
custom coreboot firmware with bios vendor 'coreboot' and
system vendor 'Google'.

Signed-off-by: Matt DeVillier <matt.devillier@gmail.com>
---
drivers/platform/chrome/cros_ec_lpc.c | 8 +++++++-
1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_lpc.c
b/drivers/platform/chrome/cros_ec_lpc.c
index d6306d2a096f..ae366a34bb63 100644
--- a/drivers/platform/chrome/cros_ec_lpc.c
+++ b/drivers/platform/chrome/cros_ec_lpc.c
@@ -465,13 +465,19 @@ static const struct dmi_system_id
cros_ec_lpc_dmi_table[] __initconst = {
* If the box is running custom coreboot firmware then the
* DMI BIOS version string will not be matched by "Google_",
* but the system vendor string will still be matched by
- * "GOOGLE".
+ * "GOOGLE" or "Google".
*/
.matches = {
DMI_MATCH(DMI_BIOS_VENDOR, "coreboot"),
DMI_MATCH(DMI_SYS_VENDOR, "GOOGLE"),
},
},
+ {
+ .matches = {
+ DMI_MATCH(DMI_BIOS_VENDOR, "coreboot"),
+ DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+ },
+ },
{
/* x86-link, the Chromebook Pixel. */
.matches = {
-- 
2.32.0
