From: =?UTF-8?q?Georg=20M=C3=BCller?= <georgmueller@gmx.net>
Subject: [PATCH] platform/x86: pmc_atom: Add Lex 2I385SW to critclk_systems DMI table
Date: Mon,  3 Feb 2020 21:11:06 +0100
Message-ID: <20200203201105.11659-1-georgmueller@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: =?UTF-8?q?Georg=20M=C3=BCller?= <georgmueller@gmx.net>
List-Id: platform-driver-x86.vger.kernel.org

The Lex 2I385SW board has two Intel I211 ethernet controllers. Without
this patch, only the first port is usable. The second port fails to
start with the following message:

    igb: probe of 0000:02:00.0 failed with error -2

Fixes: 648e921888ad ("clk: x86: Stop marking clocks as CLK_IS_CRITICAL")
Tested-by: Georg M=C3=BCller <georgmueller@gmx.net>
Signed-off-by: Georg M=C3=BCller <georgmueller@gmx.net>
=2D--
 drivers/platform/x86/pmc_atom.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/x86/pmc_atom.c b/drivers/platform/x86/pmc_at=
om.c
index 3e3c66dfec2e..ca684ed760d1 100644
=2D-- a/drivers/platform/x86/pmc_atom.c
+++ b/drivers/platform/x86/pmc_atom.c
@@ -383,6 +383,14 @@ static const struct dmi_system_id critclk_systems[] =
=3D {
 			DMI_MATCH(DMI_PRODUCT_NAME, "3I380D"),
 		},
 	},
+	{
+		/* pmc_plt_clk* - are used for ethernet controllers */
+		.ident =3D "Lex 2I385SW",
+		.matches =3D {
+			DMI_MATCH(DMI_SYS_VENDOR, "Lex BayTrail"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "2I385SW"),
+		},
+	},
 	{
 		/* pmc_plt_clk* - are used for ethernet controllers */
 		.ident =3D "Beckhoff CB3163",
=2D-
2.24.1
