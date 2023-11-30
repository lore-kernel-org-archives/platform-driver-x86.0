Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8F9EBD50;
	Thu, 30 Nov 2023 01:45:49 -0800 (PST)
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with SMTP id HwEQrABHp8SdWWhlDIwaAA--.25716S2;
	Thu, 30 Nov 2023 17:45:01 +0800 (CST)
Received: from susu-virtual-machine.localdomain (unknown [10.12.173.52])
	by gateway (Coremail) with SMTP id _____wBnUT+NWWhlIfEuAA--.57589S2;
	Thu, 30 Nov 2023 17:45:00 +0800 (CST)
From: Yu Sun <u202112062@hust.edu.cn>
To: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mark Gross <markgross@kernel.org>,
	Vadim Pasternak <vadimp@nvidia.com>
Cc: hust-os-kernel-patches@googlegroups.com,
	Yu Sun <u202112062@hust.edu.cn>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Dan Carpenter <error27@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/mellanox: mlxreg-lc: Check before variable dereferenced
Date: Thu, 30 Nov 2023 17:44:07 +0800
Message-ID: <20231130094409.3963-1-u202112062@hust.edu.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HwEQrABHp8SdWWhlDIwaAA--.25716S2
Authentication-Results: app2; spf=neutral smtp.mail=u202112062@hust.ed
	u.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW7Jw4kJw13KryxtrWUtr1kZrb_yoW8Jr4kpF
	W3Cw4S9FWYkF109w4Ut34Y9F48CayfXrWjyryFy39xAFnIqa9rZrZ8Jw1ktFZFkrWDZ3Wj
	kw48ta4Fv345X3JanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQIb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	126r1DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVWxJVW8Jr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r126r1DMx
	AIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_GFW3Jr1UJwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E74
	80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0
	I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04
	k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7Cj
	xVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU0_uctUUUUU==
X-CM-SenderInfo: rxsqjiarsqljo6kx23oohg3hdfq/

there is a warning saying variable dereferenced before
check 'data->notifier' in line 828.
add "for(data->notifier)" before variable deferenced.

Signed-off-by: Yu Sun <u202112062@hust.edu.cn>
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
Reviewed-by: Dan Carpenter <error27@gmail.com>
---
 drivers/platform/mellanox/mlxreg-lc.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/mellanox/mlxreg-lc.c b/drivers/platform/mellanox/mlxreg-lc.c
index 43d119e3a473..e92add40750b 100644
--- a/drivers/platform/mellanox/mlxreg-lc.c
+++ b/drivers/platform/mellanox/mlxreg-lc.c
@@ -824,9 +824,12 @@ static int mlxreg_lc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	mutex_init(&mlxreg_lc->lock);
-	/* Set event notification callback. */
-	data->notifier->user_handler = mlxreg_lc_event_handler;
-	data->notifier->handle = mlxreg_lc;
+
+	if (data->notifier) {
+		/* Set event notification callback. */
+		data->notifier->user_handler = mlxreg_lc_event_handler;
+		data->notifier->handle = mlxreg_lc;
+	}
 
 	data->hpdev.adapter = i2c_get_adapter(data->hpdev.nr);
 	if (!data->hpdev.adapter) {
-- 
2.42.0

