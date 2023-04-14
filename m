Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEC42C77B71
	for <platform-driver-x86@archiver.kernel.org>; Fri, 14 Apr 2023 18:02:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229507AbjDNSCY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 14 Apr 2023 14:02:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbjDNSCY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 14 Apr 2023 14:02:24 -0400
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE8612D7F
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Apr 2023 11:02:21 -0700 (PDT)
Date:   Fri, 14 Apr 2023 18:02:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=danielbertalan.dev;
        s=protonmail; t=1681495338; x=1681754538;
        bh=cS+Yz9Rt4g22aFl67/AMvjYrRejeiQkA4zLDy7uWAB4=;
        h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
         Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
        b=B/2vUX0qYmG6D5u+eVFUUCOKH8R43Blt3WA/cvDxUjGHZkIBd6Ms0BMPHcre+ApaY
         kptaXQXjsYsjIA8URXtCaWJZN660nAYCxs9BTfEEzwvO4SISz68UgOhfVZ3sRx84wg
         mz1L/gHROXDtj5GMmZ9rb/LQjvZXWNS36UN5p1RdbCoy+GrO9J9g/djLfu5Gj9In7b
         HlC79OE01zOjdlGcw8I+sfKu8YXFaPnxFTXR8YY+xASLWog1DuTgBUUNPfJ72pe6IX
         G5cBAq6Uo7Zv+WczruEWBoXmO31QhzU1hqy0+c1JkmLt15LjLmT7jFRYqdDnPOw4lS
         u7mmFT8JuCs8w==
To:     Mark Gross <markgross@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>
From:   Daniel Bertalan <dani@danielbertalan.dev>
Cc:     ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, liavalb@gmail.com,
        Daniel Bertalan <dani@danielbertalan.dev>
Subject: [PATCH] platform/x86: thinkpad_acpi: Fix Embedded Controller access on X380 Yoga
Message-ID: <20230414180034.63914-1-dani@danielbertalan.dev>
Feedback-ID: 20340505:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On the X380 Yoga, the `ECRD` and `ECWR` ACPI objects cannot be used for
accessing the Embedded Controller: instead of a method that reads from
the EC's memory, `ECRD` is the name of a location in high memory. This
meant that trying to call them would fail with the following message:

  ACPI: \_SB.PCI0.LPCB.EC.ECRD: 1 arguments were passed to a non-method
  ACPI object (RegionField)

With this commit, it is now possible to access the EC and read
temperature and fan speed information. Note that while writes to the
HFSP register do go through (as indicated by subsequent reads showing
the new value), the fan does not actually change its speed.

Signed-off-by: Daniel Bertalan <dani@danielbertalan.dev>
---
 drivers/platform/x86/thinkpad_acpi.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/th=
inkpad_acpi.c
index 7191ff2625b1..6fe82f805ea8 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -11699,6 +11699,7 @@ static int __init thinkpad_acpi_module_init(void)
 {
 =09const struct dmi_system_id *dmi_id;
 =09int ret, i;
+=09acpi_object_type obj_type;
=20
 =09tpacpi_lifecycle =3D TPACPI_LIFE_INIT;
=20
@@ -11724,6 +11725,21 @@ static int __init thinkpad_acpi_module_init(void)
 =09TPACPI_ACPIHANDLE_INIT(ecrd);
 =09TPACPI_ACPIHANDLE_INIT(ecwr);
=20
+=09/*
+=09 * Quirk: in some models (e.g. X380 Yoga), an object named ECRD
+=09 * exists, but it is a register, not a method.
+=09 */
+=09if (ecrd_handle) {
+=09=09acpi_get_type(ecrd_handle, &obj_type);
+=09=09if (obj_type !=3D ACPI_TYPE_METHOD)
+=09=09=09ecrd_handle =3D NULL;
+=09}
+=09if (ecwr_handle) {
+=09=09acpi_get_type(ecwr_handle, &obj_type);
+=09=09if (obj_type !=3D ACPI_TYPE_METHOD)
+=09=09=09ecwr_handle =3D NULL;
+=09}
+
 =09tpacpi_wq =3D create_singlethread_workqueue(TPACPI_WORKQUEUE_NAME);
 =09if (!tpacpi_wq) {
 =09=09thinkpad_acpi_module_exit();
--=20
2.40.0


