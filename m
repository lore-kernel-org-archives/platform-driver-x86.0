Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F99C001B0
	for <platform-driver-x86@archiver.kernel.org>; Sat, 15 Jul 2023 21:24:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbjGOVYd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 15 Jul 2023 17:24:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjGOVYc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 15 Jul 2023 17:24:32 -0400
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FBF3270A
        for <platform-driver-x86@vger.kernel.org>; Sat, 15 Jul 2023 14:24:31 -0700 (PDT)
Date:   Sat, 15 Jul 2023 21:24:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1689456269; x=1689715469;
        bh=D16/wC9ybg52jiDQV5+eLtWgvfFQ5TkNWX0NVbvr7UM=;
        h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
         Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
        b=HEgOvr1gXJfy3G3zyZiPwPxBdoD7tktehWXIfQl+Sm1e2Hm0s/k6GRcV8TV+XeZNz
         hh8E2Eq8rjgZURZ0ZRfjRfW072M6VW2tbTnwUmR68cifj5lxylUJ4SuXjdwjbtzp4j
         m6TA4hW/B4Qm7a7kCNlzCvAarU8o9HHaytB9V9zCCUOo/iBXBKSccN4t4deV7xOzig
         BZhJaXNO8bYWBO4lGuqrWPg1+ySeA2MC5iYBCsq9yDmYF218ldwWyH8bj4V7Z2Mh5b
         GB2iE57fDk0zm0nOV1dMfg4J7FiTD4WUwn7GeTo+TqAtbz0eo2NLOwFHVfCouI3faf
         ikSm1Ec7BpaIA==
To:     linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Mark Gross <markgross@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Armin Wolf <W_Armin@gmx.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [RFC PATCH v1] platform/x86: wmi: Do not register driver with invalid GUID
Message-ID: <20230715211604.1272227-1-pobrn@protonmail.com>
Feedback-ID: 20568564:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Since a WMI driver's ID table contains strings it is relatively
easy to make mistakes. At the moment, there is no feedback
if any of the specified GUIDs are invalid (since
028e6e204ace1f080cfeacd72c50397eb8ae8883).

So check if the GUIDs in the driver's ID table are valid,
print all invalid ones, and refuse to register the driver
if any of the GUIDs are invalid.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
---
 drivers/platform/x86/wmi.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index a78ddd83cda0..bf0be40b418a 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -1513,6 +1513,19 @@ static int acpi_wmi_probe(struct platform_device *de=
vice)
 int __must_check __wmi_driver_register(struct wmi_driver *driver,
 =09=09=09=09       struct module *owner)
 {
+=09bool any_id_invalid =3D false;
+
+=09for (const struct wmi_device_id *id =3D driver->id_table; *id->guid_str=
ing; id++) {
+=09=09if (!uuid_is_valid(id->guid_string)) {
+=09=09=09pr_err("driver '%s' has invalid GUID: %s",
+=09=09=09       driver->driver.name, id->guid_string);
+=09=09=09any_id_invalid =3D true;
+=09=09}
+=09}
+
+=09if (any_id_invalid)
+=09=09return -EINVAL;
+
 =09driver->driver.owner =3D owner;
 =09driver->driver.bus =3D &wmi_bus_type;
=20
--=20
2.41.0


