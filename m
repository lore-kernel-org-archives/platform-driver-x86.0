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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21375C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Sep 2021 17:56:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 03B206056B
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Sep 2021 17:56:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237265AbhIDR5L (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 4 Sep 2021 13:57:11 -0400
Received: from mail1.protonmail.ch ([185.70.40.18]:59067 "EHLO
        mail1.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231181AbhIDR5K (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Sep 2021 13:57:10 -0400
Date:   Sat, 04 Sep 2021 17:56:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1630778167;
        bh=q5glyydl1R8dK+AIve/gRQcjiz9BZkSLzd3soZM+koY=;
        h=Date:To:From:Reply-To:Subject:From;
        b=TwpHZfoasa17CcO3zsFKo+ZvWqQY13yD2lPLJiyftFz8AqzJmD3HZoBJT8SKGYZR9
         IBKjJXjt6ScX9c0iXlMJ8m3IvGagzdZLbJV+mpewSkmT6edm4eOtrV20cbKQlTzv5T
         dGh27Hfg15HPv+12+0GtDMm1xm01X3ploZ+ghp+s=
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [RFC PATCH v1 19/30] platform/x86: wmi: use sizeof(*p) in allocation
Message-ID: <20210904175450.156801-20-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

As per the coding style guide, the preferred way
to pass the size of objects to allocator functions
is `sizeof(*p)`. Use that.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
---
 drivers/platform/x86/wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 0e721d868bf7..7f7dfb7f9aa8 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -1176,7 +1176,7 @@ static int parse_wdg(struct device *wmi_bus_dev, stru=
ct acpi_device *device)
 =09=09if (guid_already_parsed(device, &gblock[i].guid))
 =09=09=09continue;

-=09=09wblock =3D kzalloc(sizeof(struct wmi_block), GFP_KERNEL);
+=09=09wblock =3D kzalloc(sizeof(*wblock), GFP_KERNEL);
 =09=09if (!wblock) {
 =09=09=09retval =3D -ENOMEM;
 =09=09=09break;
--
2.33.0


