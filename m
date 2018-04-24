From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] apple-gmux: fix gmux_get_client_id()'s return type
Date: Tue, 24 Apr 2018 15:15:43 +0200
Message-ID: <20180424131543.2761-1-luc.vanoostenryck@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

The method struct vga_switcheroo_handler::get_client_id() is defined
as returning an 'enum vga_switcheroo_client_id' but the implementation
in this driver, gmux_get_client_id(), returns an 'int'.

Fix this by returning 'enum vga_switcheroo_client_id' in this driver too.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 drivers/platform/x86/apple-gmux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index 7c4eb86c8..fd2ffebc8 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -495,7 +495,7 @@ static int gmux_set_power_state(enum vga_switcheroo_client_id id,
 	return gmux_set_discrete_state(apple_gmux_data, state);
 }
 
-static int gmux_get_client_id(struct pci_dev *pdev)
+static enum vga_switcheroo_client_id gmux_get_client_id(struct pci_dev *pdev)
 {
 	/*
 	 * Early Macbook Pros with switchable graphics use nvidia
-- 
2.17.0
