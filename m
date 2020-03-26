From: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/1] x86/platform/intel-mid: convert to use i2c_new_client_device()
Date: Thu, 26 Mar 2020 22:10:15 +0100
Message-ID: <20200326211015.13654-2-wsa+renesas@sang-engineering.com>
References: <20200326211015.13654-1-wsa+renesas@sang-engineering.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-i2c-owner@vger.kernel.org>
In-Reply-To: <20200326211015.13654-1-wsa+renesas@sang-engineering.com>
Sender: linux-i2c-owner@vger.kernel.org
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Move away from the deprecated API and return the shiny new ERRPTR where
useful.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
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
2.20.1
