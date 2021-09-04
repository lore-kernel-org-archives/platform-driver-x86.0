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
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBDB4C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Sep 2021 17:55:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D7F1A60F38
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Sep 2021 17:55:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237253AbhIDR4u (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 4 Sep 2021 13:56:50 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:34241 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237315AbhIDR4s (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Sep 2021 13:56:48 -0400
Date:   Sat, 04 Sep 2021 17:55:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1630778143;
        bh=P9LM12VlE5+I4+Kz2fFAoC2lPJYbzC2QNFMra66jBh8=;
        h=Date:To:From:Reply-To:Subject:From;
        b=YiHMxiK3/LDi3w/NbwIm3HxktBWBYK7hx3LULtWvlZ6SFXmypSAviiLhfcfLCCuq3
         HvTliPVVo4UHSxq39sBIPrFjPGmCKjwup0BimMKVQLt5mfF02kcG69+wnh2xOUuayR
         +lyq3uWZrML+BjBz3NmLGVH4DlQuRmC6YOrAOK/4=
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [RFC PATCH v1 13/30] platform/x86: wmi: use dynamic debug to print data about events
Message-ID: <20210904175450.156801-14-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The dynamic debug framework provides a more flexible
way to configure debugging messages emitted by the kernel
than module options. Use `dev_dbg()` in `acpi_wmi_notify_handler()`
to print the event identifier and device name (which is the GUID).

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
---
 drivers/platform/x86/wmi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 90ba75247d7f..8aad8f080c64 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -1313,8 +1313,7 @@ static void acpi_wmi_notify_handler(acpi_handle handl=
e, u32 event,
 =09=09wblock->handler(event, wblock->handler_data);
 =09}

-=09if (debug_event)
-=09=09pr_info("DEBUG Event GUID: %pUL\n", wblock->gblock.guid);
+=09dev_dbg(&wblock->dev.dev, "event 0x%02X\n", event);

 =09acpi_bus_generate_netlink_event(
 =09=09wblock->acpi_device->pnp.device_class,
--
2.33.0


