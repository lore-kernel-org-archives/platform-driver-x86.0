From: J Witteveen <jwitteve@liacs.nl>
Subject: Re: [PATCH] Platform: add Samsung Laptop platform driver
Date: Sun, 26 Jun 2011 17:08:55 +0200
Message-ID: <20110626150855.GA19359@liacs.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: mjg@redhat.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Feb 11, 2011 at 10:17, Jouke Witteveen <j.witteveen@gmail.com> =
wrote:
> On Wed, Feb 9, 2011 at 23:40, Greg KH <greg@kroah.com> wrote:
>> From: Greg Kroah-Hartman <gregkh@suse.de>
>>
>> This adds the samsung-laptop driver to the kernel. =A0It now support=
s
>> all known Samsung laptops.
>>
>
> I don't see the N510, is this intentional? The netbook does not diffe=
r
> that much from some that are included.
>

The N510 benefits from this code as well. Below is a patch to include s=
upport.

Signed-off-by: Jouke Witteveen <j.witteveen@gmail.com>

Thanks,
- Jouke

--- a/drivers/platform/x86/samsung-laptop.c	2011-06-26 16:18:06.5178404=
68 +0200
+++ b/drivers/platform/x86/samsung-laptop.c	2011-06-26 16:19:14.6775746=
44 +0200
@@ -521,6 +521,16 @@ static struct dmi_system_id __initdata s
 		.callback =3D dmi_check_cb,
 	},
 	{
+		.ident =3D "N510",
+		.matches =3D {
+			DMI_MATCH(DMI_SYS_VENDOR,
+					"SAMSUNG ELECTRONICS CO., LTD."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "N510"),
+			DMI_MATCH(DMI_BOARD_NAME, "N510"),
+		},
+		.callback =3D dmi_check_cb,
+	},
+	{
 		.ident =3D "X125",
 		.matches =3D {
 			DMI_MATCH(DMI_SYS_VENDOR,
