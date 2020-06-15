From: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 3/6] x86/platform/intel-mid: convert to use i2c_new_client_device()
Date: Mon, 15 Jun 2020 09:58:12 +0200
Message-ID: <20200615075816.2848-4-wsa+renesas@sang-engineering.com>
References: <20200615075816.2848-1-wsa+renesas@sang-engineering.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200615075816.2848-1-wsa+renesas@sang-engineering.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Move away from the deprecated API and return the shiny new ERRPTR where
useful.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---

I'd like to push it via I2C for 5.8-rc2.

 arch/x86/platform/intel-mid/sfi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/platform/intel-mid/sfi.c b/arch/x86/platform/intel-mid/sfi.c
index b8f7f193f383..30bd5714a3d4 100644
--- a/arch/x86/platform/intel-mid/sfi.c
+++ b/arch/x86/platform/intel-mid/sfi.c
@@ -287,8 +287,8 @@ void intel_scu_devices_create(void)
 
 		adapter = i2c_get_adapter(i2c_bus[i]);
 		if (adapter) {
-			client = i2c_new_device(adapter, i2c_devs[i]);
-			if (!client)
+			client = i2c_new_client_device(adapter, i2c_devs[i]);
+			if (IS_ERR(client))
 				pr_err("can't create i2c device %s\n",
 					i2c_devs[i]->type);
 		} else
-- 
2.27.0
