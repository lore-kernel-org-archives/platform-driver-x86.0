From: Lars Schuetze <dev@larsschuetze.de>
Subject: [PATCH] samsung-laptop: enable better lid handling
Date: Tue, 7 Apr 2015 11:13:43 +0200
Message-ID: <CA+icb-hsnjajX78w6Ags-t8L7YDqdcD_wkSBTTvLK6MZNU3QoA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.220]:56809 "EHLO
	mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752982AbbDGJNo convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 7 Apr 2015 05:13:44 -0400
Received: from mail-wi0-f179.google.com ([209.85.212.179])
	by smtp.strato.de (RZmta 37.5 AUTH)
	with ESMTPSA id K01b1cr379DhXL0
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (curve sect571r1 with 571 ECDH bits, eq. 15360 bits RSA))
	(Client CN "smtp.gmail.com", Issuer "Google Internet Authority G2" (verification FAILED - unable to get local issuer certificate))
	(Client hostname not verified)
	for <platform-driver-x86@vger.kernel.org>;
	Tue, 7 Apr 2015 11:13:43 +0200 (CEST)
Received: by wiax7 with SMTP id x7so6106932wia.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Apr 2015 02:13:43 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@linux.intel.com, corentin.chary@gmail.com, dev@larsschuetze.de

Enable better lid handling for Samsung Series 7 Chronos 700Z3A
and other models of this product line by whitelisting models
700Z3A/700Z4A/700Z5A/700Z5B. Those use SABI in order to
resume upon lide open when in sleep.

It is a follow up of
Commit b0dcaf4fbb36 ("samsung-laptop: enable better lid handling")

Signed-off-by: Lars Sch=C3=BCtze <dev@larsschuetze.de>

diff --git a/drivers/platform/x86/samsung-laptop.c
b/drivers/platform/x86/samsung-laptop.c
index 9e701b2..4ecfcd1 100644
--- a/drivers/platform/x86/samsung-laptop.c
+++ b/drivers/platform/x86/samsung-laptop.c
@@ -1694,6 +1694,15 @@ static struct dmi_system_id __initdata
samsung_dmi_table[] =3D {
  },
  .driver_data =3D &samsung_lid_handling,
  },
+ {
+ .callback =3D samsung_dmi_matched,
+ .ident =3D "700Z3A/700Z4A/700Z5A/700Z5B",
+ .matches =3D {
+ DMI_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
+ DMI_MATCH(DMI_PRODUCT_NAME, "700Z3A/700Z4A/700Z5A/700Z5B"),
+ },
+ .driver_data =3D &samsung_lid_handling,
+ },
  { },
 };
 MODULE_DEVICE_TABLE(dmi, samsung_dmi_table);
