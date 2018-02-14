From: Andrey Ryabinin <aryabinin@virtuozzo.com>
Subject: [PATCH] platform/x86: wmi: fix off-by-one write in wmi_dev_probe()
Date: Wed, 14 Feb 2018 14:55:24 +0300
Message-ID: <20180214115524.25522-1-aryabinin@virtuozzo.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>, stable@vger.kernel.org, Mario Limonciello <mario.limonciello@dell.com>, Edward O'Callaghan <quasisec@google.com>, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

wmi_dev_probe() allocates one byte less than necessary, thus
subsequent sprintf() call writes trailing zero past the end
of the 'buf':

    BUG: KASAN: slab-out-of-bounds in vsnprintf+0xda4/0x1240
    Write of size 1 at addr ffff880423529caf by task kworker/1:1/32

    Call Trace:
     dump_stack+0xb3/0x14d
     print_address_description+0xd7/0x380
     kasan_report+0x166/0x2b0
     vsnprintf+0xda4/0x1240
     sprintf+0x9b/0xd0
     wmi_dev_probe+0x1c3/0x400
     driver_probe_device+0x5d1/0x990
     bus_for_each_drv+0x109/0x190
     __device_attach+0x217/0x360
     bus_probe_device+0x1ad/0x260
     deferred_probe_work_func+0x10f/0x5d0
     process_one_work+0xa8b/0x1dc0
     worker_thread+0x20d/0x17d0
     kthread+0x311/0x3d0
     ret_from_fork+0x3a/0x50

    Allocated by task 32:
     kasan_kmalloc+0xa0/0xd0
     __kmalloc+0x14f/0x3e0
     wmi_dev_probe+0x182/0x400
     driver_probe_device+0x5d1/0x990
     bus_for_each_drv+0x109/0x190
     __device_attach+0x217/0x360
     bus_probe_device+0x1ad/0x260
     deferred_probe_work_func+0x10f/0x5d0
     process_one_work+0xa8b/0x1dc0
     worker_thread+0x20d/0x17d0
     kthread+0x311/0x3d0
     ret_from_fork+0x3a/0x50

Increment allocation size to fix this.

Fixes: 44b6b7661132 ("platform/x86: wmi: create userspace interface for drivers")
Signed-off-by: Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc: <stable@vger.kernel.org>
---
 drivers/platform/x86/wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index daa68acbc900..c0c8945603cb 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -933,7 +933,7 @@ static int wmi_dev_probe(struct device *dev)
 			goto probe_failure;
 		}
 
-		buf = kmalloc(strlen(wdriver->driver.name) + 4, GFP_KERNEL);
+		buf = kmalloc(strlen(wdriver->driver.name) + 5, GFP_KERNEL);
 		if (!buf) {
 			ret = -ENOMEM;
 			goto probe_string_failure;
-- 
2.13.6
