From: =?ISO-8859-1?Q?Richard_Sch=FCtz?= <r.schtz@t-online.de>
Subject: Re: [PATCH] Platform: add Samsung Laptop platform driver
Date: Fri, 11 Feb 2011 17:27:19 +0100
Message-ID: <4D556367.5000202@t-online.de>
References: <20110209224006.GA11202@kroah.com> <4D551F76.1070303@t-online.de> <20110211152231.GB13487@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailout05.t-online.de ([194.25.134.82]:35386 "EHLO
	mailout05.t-online.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757337Ab1BKQ1n (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 11 Feb 2011 11:27:43 -0500
In-Reply-To: <20110211152231.GB13487@kroah.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Matthew Garrett <mjg@redhat.com>, Randy Dunlap <rdunlap@xenotime.net>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

Add DMI data for Samsung N145P/N250P/N260P

Signed-off-by: Richard Sch=FCtz <r.schtz@t-online.de>
---

> Yes I can, but do you want to send it to me in a format that I can ap=
ply
> so you can get the proper authorship credit?

Of course, here it is.

--- a/drivers/platform/x86/samsung-laptop.c
+++ b/drivers/platform/x86/samsung-laptop.c
@@ -592,6 +592,15 @@ static struct dmi_system_id __initdata s
  		},
  		.callback =3D dmi_check_cb,
  	},
+	{
+		.ident =3D "N145P/N250P/N260P",
+		.matches =3D {
+			DMI_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "N145P/N250P/N260P"),
+			DMI_MATCH(DMI_BOARD_NAME, "N145P/N250P/N260P"),
+		},
+		.callback =3D dmi_check_cb,
+	},
  	{ },
  };
  MODULE_DEVICE_TABLE(dmi, samsung_dmi_table);

--=20
Regards,
Richard Sch=FCtz
