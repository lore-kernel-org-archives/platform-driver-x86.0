From: Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: [PATCH 3/5] iio: remove left-over comments about parent assignment
Date: Fri, 22 May 2020 11:22:06 +0300
Message-ID: <20200522082208.383631-3-alexandru.ardelean@analog.com>
References: <20200522082208.383631-1-alexandru.ardelean@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200522082208.383631-1-alexandru.ardelean@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bcm-kernel-feedback-list@broadcom.com, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-pm@vger.kernel.org, platform-driver-x86@vger.kernel.org, devel@driverdev.osuosl.org
Cc: vilhelm.gray@gmail.com, syednwaris@gmail.com, fabrice.gasnier@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, jic23@kernel.org, dan@dlrobertson.com, jikos@kernel.org, srinivas.pandruvada@linux.intel.com, linus.walleij@linaro.org, wens@csie.org, hdegoede@redhat.com, rjui@broadcom.com, sbranden@broadcom.com, peda@axentia.se, kgene@kernel.org, krzk@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, ak@it-klinger.de, paul@crapouillou.net, milo.kim@ti.com, vz@mleia.com, slemieux.tyco@gmail.com, khilman@baylibre.com, matthias.bgg@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org, heiko@sntech.de, orsonzhai@gmail.com, baolin.wang7@gmail.com, zhang.lyra@gmail.com, mripard@kernel.org, tduszyns@gmail.
List-Id: platform-driver-x86.vger.kernel.org

These were obtained by doing a 'git diff | grep \/\*', in the previous diff
to find comments. These needed a bit more manual review, as the semantic
patch isn't great for catching these.

The result is:
 	/* Initialize Counter device and driver data */
 	/* Initialize IIO device */
 	/* Establish that the iio_dev is a child of the spi device */
 	/* Estabilish that the iio_dev is a child of the spi device */
 	/* Initiate the Industrial I/O device */
 	/* Establish that the iio_dev is a child of the device */
-	/* establish that the iio_dev is a child of the i2c device */
-	/* establish that the iio_dev is a child of the i2c device */
 	/* This is only used for removal purposes */
 	/* setup the industrialio driver allocated elements */
 	/* variant specific configuration */
 	/* Setup for userspace synchronous on demand sampling. */
 	st->readback_delay_us += 5; /* Add tWAIT */
-	/* Establish that the iio_dev is a child of the i2c device */
 	/* Establish that the iio_dev is a child of the i2c device */

Out of which, 4 are really left-over comments about parent assignment.
3 of them are removed by the semantic patch, as the comment removed (by
spatch) would be for an empty line.

Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 drivers/iio/adc/ad7476.c         | 1 -
 drivers/iio/adc/ad7887.c         | 1 -
 drivers/iio/dac/ad5446.c         | 1 -
 drivers/staging/iio/cdc/ad7746.c | 1 -
 4 files changed, 4 deletions(-)

diff --git a/drivers/iio/adc/ad7476.c b/drivers/iio/adc/ad7476.c
index e2a69dd6a47e..6286e230f55b 100644
--- a/drivers/iio/adc/ad7476.c
+++ b/drivers/iio/adc/ad7476.c
@@ -300,7 +300,6 @@ static int ad7476_probe(struct spi_device *spi)
 
 	st->spi = spi;
 
-	/* Establish that the iio_dev is a child of the spi device */
 	indio_dev->dev.of_node = spi->dev.of_node;
 	indio_dev->name = spi_get_device_id(spi)->name;
 	indio_dev->modes = INDIO_DIRECT_MODE;
diff --git a/drivers/iio/adc/ad7887.c b/drivers/iio/adc/ad7887.c
index ca4c98401ebc..0f93f5c8965d 100644
--- a/drivers/iio/adc/ad7887.c
+++ b/drivers/iio/adc/ad7887.c
@@ -264,7 +264,6 @@ static int ad7887_probe(struct spi_device *spi)
 	spi_set_drvdata(spi, indio_dev);
 	st->spi = spi;
 
-	/* Estabilish that the iio_dev is a child of the spi device */
 	indio_dev->dev.of_node = spi->dev.of_node;
 	indio_dev->name = spi_get_device_id(spi)->name;
 	indio_dev->info = &ad7887_info;
diff --git a/drivers/iio/dac/ad5446.c b/drivers/iio/dac/ad5446.c
index e01ba90dc106..5931bd630c4e 100644
--- a/drivers/iio/dac/ad5446.c
+++ b/drivers/iio/dac/ad5446.c
@@ -250,7 +250,6 @@ static int ad5446_probe(struct device *dev, const char *name,
 	st->reg = reg;
 	st->dev = dev;
 
-	/* Establish that the iio_dev is a child of the device */
 	indio_dev->name = name;
 	indio_dev->info = &ad5446_info;
 	indio_dev->modes = INDIO_DIRECT_MODE;
diff --git a/drivers/staging/iio/cdc/ad7746.c b/drivers/staging/iio/cdc/ad7746.c
index bd9803c7c5b6..dfd71e99e872 100644
--- a/drivers/staging/iio/cdc/ad7746.c
+++ b/drivers/staging/iio/cdc/ad7746.c
@@ -693,7 +693,6 @@ static int ad7746_probe(struct i2c_client *client,
 	chip->client = client;
 	chip->capdac_set = -1;
 
-	/* Establish that the iio_dev is a child of the i2c device */
 	indio_dev->name = id->name;
 	indio_dev->info = &ad7746_info;
 	indio_dev->channels = ad7746_channels;
-- 
2.25.1
