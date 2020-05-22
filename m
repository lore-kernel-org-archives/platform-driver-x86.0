From: Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH 4/5] iio: light: lm3533-als: remove explicit parent assignment
Date: Fri, 22 May 2020 11:22:07 +0300
Message-ID: <20200522082208.383631-4-alexandru.ardelean@analog.com>
References: <20200522082208.383631-1-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <20200522082208.383631-1-alexandru.ardelean@analog.com>
Sender: linux-input-owner@vger.kernel.org
To: bcm-kernel-feedback-list@broadcom.com, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-pm@vger.kernel.org, platform-driver-x86@vger.kernel.org, devel@driverdev.osuosl.org
Cc: vilhelm.gray@gmail.com, syednwaris@gmail.com, fabrice.gasnier@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, jic23@kernel.org, dan@dlrobertson.com, jikos@kernel.org, srinivas.pandruvada@linux.intel.com, linus.walleij@linaro.org, wens@csie.org, hdegoede@redhat.com, rjui@broadcom.com, sbranden@broadcom.com, peda@axentia.se, kgene@kernel.org, krzk@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, ak@it-klinger.de, paul@crapouillou.net, milo.kim@ti.com, vz@mleia.com, slemieux.tyco@gmail.com, khilman@baylibre.com, matthias.bgg@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org, heiko@sntech.de, orsonzhai@gmail.com, baolin.wang7@gmail.com, zhang.lyra@gmail.com, mripard@kernel.org, tduszyns@gmail.
List-Id: platform-driver-x86.vger.kernel.org

This assignment is the more peculiar of the bunch as it assigns the parent
of the platform-device's device (i.e. pdev->dev.parent) as the IIO device's
parent.

It's unclear whether this is intentional or not.
Hence it is in it's own patch.

Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 drivers/iio/light/lm3533-als.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/iio/light/lm3533-als.c b/drivers/iio/light/lm3533-als.c
index bc196c212881..0f380ec8d30c 100644
--- a/drivers/iio/light/lm3533-als.c
+++ b/drivers/iio/light/lm3533-als.c
@@ -852,7 +852,6 @@ static int lm3533_als_probe(struct platform_device *pdev)
 	indio_dev->channels = lm3533_als_channels;
 	indio_dev->num_channels = ARRAY_SIZE(lm3533_als_channels);
 	indio_dev->name = dev_name(&pdev->dev);
-	indio_dev->dev.parent = pdev->dev.parent;
 	indio_dev->modes = INDIO_DIRECT_MODE;
 
 	als = iio_priv(indio_dev);
-- 
2.25.1
