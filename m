From: Ameya Palande <ameya.palande@nokia.com>
Subject: [PATCH] platform-x86: intel_mid_thermal: Fix coding
	style
Date: Fri,  1 Apr 2011 16:54:11 +0300
Message-ID: <1301666051-27021-1-git-send-email-ameya.palande@nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <meego-kernel-bounces@lists.meego.com>
List-Unsubscribe: <http://lists.meego.com/options/meego-kernel>,
	<mailto:meego-kernel-request@lists.meego.com?subject=unsubscribe>
List-Archive: <http://lists.meego.com/pipermail/meego-kernel>
List-Post: <mailto:meego-kernel@lists.meego.com>
List-Help: <mailto:meego-kernel-request@lists.meego.com?subject=help>
List-Subscribe: <http://lists.meego.com/listinfo/meego-kernel>,
	<mailto:meego-kernel-request@lists.meego.com?subject=subscribe>
Sender: meego-kernel-bounces@lists.meego.com
Errors-To: meego-kernel-bounces@lists.meego.com
To: platform-driver-x86@vger.kernel.org
Cc: meego-kernel@lists.meego.com, durgadoss.r@intel.com, mjg@redhat.com
List-Id: platform-driver-x86.vger.kernel.org

Before fixing checkpatch.pl reported 74 errors and 234 warnings

Signed-off-by: Ameya Palande <ameya.palande@nokia.com>
---
 drivers/platform/x86/intel_mid_thermal.c |  606 +++++++++++++++---------------
 1 files changed, 300 insertions(+), 306 deletions(-)

diff --git a/drivers/platform/x86/intel_mid_thermal.c b/drivers/platform/x86/intel_mid_thermal.c
index 6c12db5..9ee707f 100644
--- a/drivers/platform/x86/intel_mid_thermal.c
+++ b/drivers/platform/x86/intel_mid_thermal.c
@@ -37,49 +37,50 @@
 #include <asm/intel_scu_ipc.h>
 
 /* Number of thermal sensors */
-#define MSIC_THERMAL_SENSORS   4
+#define MSIC_THERMAL_SENSORS	4
 
 /* ADC1 - thermal registers */
-#define MSIC_THERM_ADC1CNTL1   0x1C0
-#define MSIC_ADC_ENBL          0x10
-#define MSIC_ADC_START         0x08
+#define MSIC_THERM_ADC1CNTL1	0x1C0
+#define MSIC_ADC_ENBL		0x10
+#define MSIC_ADC_START		0x08
 
-#define MSIC_THERM_ADC1CNTL3   0x1C2
-#define MSIC_ADCTHERM_ENBL     0x04
-#define MSIC_ADCRRDATA_ENBL    0x05
-#define MSIC_CHANL_MASK_VAL    0x0F
+#define MSIC_THERM_ADC1CNTL3	0x1C2
+#define MSIC_ADCTHERM_ENBL	0x04
+#define MSIC_ADCRRDATA_ENBL	0x05
+#define MSIC_CHANL_MASK_VAL	0x0F
 
-#define MSIC_STOPBIT_MASK      16
-#define MSIC_ADCTHERM_MASK     4
-#define ADC_CHANLS_MAX         15 /* Number of ADC channels */
-#define ADC_LOOP_MAX           (ADC_CHANLS_MAX - MSIC_THERMAL_SENSORS)
+#define MSIC_STOPBIT_MASK	16
+#define MSIC_ADCTHERM_MASK	4
+/* Number of ADC channels */
+#define ADC_CHANLS_MAX		15
+#define ADC_LOOP_MAX		(ADC_CHANLS_MAX - MSIC_THERMAL_SENSORS)
 
 /* ADC channel code values */
-#define SKIN_SENSOR0_CODE      0x08
-#define SKIN_SENSOR1_CODE      0x09
-#define SYS_SENSOR_CODE                0x0A
-#define MSIC_DIE_SENSOR_CODE   0x03
+#define SKIN_SENSOR0_CODE	0x08
+#define SKIN_SENSOR1_CODE	0x09
+#define SYS_SENSOR_CODE		0x0A
+#define MSIC_DIE_SENSOR_CODE	0x03
 
-#define SKIN_THERM_SENSOR0     0
-#define SKIN_THERM_SENSOR1     1
-#define SYS_THERM_SENSOR2      2
-#define MSIC_DIE_THERM_SENSOR3 3
+#define SKIN_THERM_SENSOR0	0
+#define SKIN_THERM_SENSOR1	1
+#define SYS_THERM_SENSOR2	2
+#define MSIC_DIE_THERM_SENSOR3	3
 
 /* ADC code range */
-#define ADC_MAX                        977
-#define ADC_MIN                        162
-#define ADC_VAL0C              887
-#define ADC_VAL20C             720
-#define ADC_VAL40C             508
-#define ADC_VAL60C             315
+#define ADC_MAX			977
+#define ADC_MIN			162
+#define ADC_VAL0C		887
+#define ADC_VAL20C		720
+#define ADC_VAL40C		508
+#define ADC_VAL60C		315
 
 /* ADC base addresses */
-#define ADC_CHNL_START_ADDR    0x1C5   /* increments by 1 */
-#define ADC_DATA_START_ADDR     0x1D4   /* increments by 2 */
+#define ADC_CHNL_START_ADDR	0x1C5	/* increments by 1 */
+#define ADC_DATA_START_ADDR	0x1D4	/* increments by 2 */
 
 /* MSIC die attributes */
-#define MSIC_DIE_ADC_MIN       488
-#define MSIC_DIE_ADC_MAX       1004
+#define MSIC_DIE_ADC_MIN	488
+#define MSIC_DIE_ADC_MAX	1004
 
 /* This holds the address of the first free ADC channel,
  * among the 15 channels
@@ -87,15 +88,15 @@
 static int channel_index;
 
 struct platform_info {
-       struct platform_device *pdev;
-       struct thermal_zone_device *tzd[MSIC_THERMAL_SENSORS];
+	struct platform_device *pdev;
+	struct thermal_zone_device *tzd[MSIC_THERMAL_SENSORS];
 };
 
 struct thermal_device_info {
-       unsigned int chnl_addr;
-       int direct;
-       /* This holds the current temperature in millidegree celsius */
-       long curr_temp;
+	unsigned int chnl_addr;
+	int direct;
+	/* This holds the current temperature in millidegree celsius */
+	long curr_temp;
 };
 
 /**
@@ -106,7 +107,7 @@ struct thermal_device_info {
  */
 static int to_msic_die_temp(uint16_t adc_val)
 {
-       return (368 * (adc_val) / 1000) - 220;
+	return (368 * (adc_val) / 1000) - 220;
 }
 
 /**
@@ -118,7 +119,7 @@ static int to_msic_die_temp(uint16_t adc_val)
  */
 static int is_valid_adc(uint16_t adc_val, uint16_t min, uint16_t max)
 {
-       return (adc_val >= min) && (adc_val <= max);
+	return (adc_val >= min) && (adc_val <= max);
 }
 
 /**
@@ -136,35 +137,35 @@ static int is_valid_adc(uint16_t adc_val, uint16_t min, uint16_t max)
  */
 static int adc_to_temp(int direct, uint16_t adc_val, unsigned long *tp)
 {
-       int temp;
-
-       /* Direct conversion for die temperature */
-       if (direct) {
-               if (is_valid_adc(adc_val, MSIC_DIE_ADC_MIN, MSIC_DIE_ADC_MAX)) {
-                       *tp = to_msic_die_temp(adc_val) * 1000;
-                       return 0;
-               }
-               return -ERANGE;
-       }
-
-       if (!is_valid_adc(adc_val, ADC_MIN, ADC_MAX))
-               return -ERANGE;
-
-       /* Linear approximation for skin temperature */
-       if (adc_val > ADC_VAL0C)
-               temp = 177 - (adc_val/5);
-       else if ((adc_val <= ADC_VAL0C) && (adc_val > ADC_VAL20C))
-               temp = 111 - (adc_val/8);
-       else if ((adc_val <= ADC_VAL20C) && (adc_val > ADC_VAL40C))
-               temp = 92 - (adc_val/10);
-       else if ((adc_val <= ADC_VAL40C) && (adc_val > ADC_VAL60C))
-               temp = 91 - (adc_val/10);
-       else
-               temp = 112 - (adc_val/6);
-
-       /* Convert temperature in celsius to milli degree celsius */
-       *tp = temp * 1000;
-       return 0;
+	int temp;
+
+	/* Direct conversion for die temperature */
+	if (direct) {
+		if (is_valid_adc(adc_val, MSIC_DIE_ADC_MIN, MSIC_DIE_ADC_MAX)) {
+			*tp = to_msic_die_temp(adc_val) * 1000;
+			return 0;
+		}
+		return -ERANGE;
+	}
+
+	if (!is_valid_adc(adc_val, ADC_MIN, ADC_MAX))
+		return -ERANGE;
+
+	/* Linear approximation for skin temperature */
+	if (adc_val > ADC_VAL0C)
+		temp = 177 - (adc_val/5);
+	else if ((adc_val <= ADC_VAL0C) && (adc_val > ADC_VAL20C))
+		temp = 111 - (adc_val/8);
+	else if ((adc_val <= ADC_VAL20C) && (adc_val > ADC_VAL40C))
+		temp = 92 - (adc_val/10);
+	else if ((adc_val <= ADC_VAL40C) && (adc_val > ADC_VAL60C))
+		temp = 91 - (adc_val/10);
+	else
+		temp = 112 - (adc_val/6);
+
+	/* Convert temperature in celsius to milli degree celsius */
+	*tp = temp * 1000;
+	return 0;
 }
 
 /**
@@ -178,47 +179,47 @@ static int adc_to_temp(int direct, uint16_t adc_val, unsigned long *tp)
  */
 static int mid_read_temp(struct thermal_zone_device *tzd, unsigned long *temp)
 {
-       struct thermal_device_info *td_info = tzd->devdata;
-       uint16_t adc_val, addr;
-       uint8_t data = 0;
-       int ret;
-       unsigned long curr_temp;
-
-
-       addr = td_info->chnl_addr;
-
-       /* Enable the msic for conversion before reading */
-       ret = intel_scu_ipc_iowrite8(MSIC_THERM_ADC1CNTL3, MSIC_ADCRRDATA_ENBL);
-       if (ret)
-               return ret;
-
-       /* Re-toggle the RRDATARD bit (temporary workaround) */
-       ret = intel_scu_ipc_iowrite8(MSIC_THERM_ADC1CNTL3, MSIC_ADCTHERM_ENBL);
-       if (ret)
-               return ret;
-
-       /* Read the higher bits of data */
-       ret = intel_scu_ipc_ioread8(addr, &data);
-       if (ret)
-               return ret;
-
-       /* Shift bits to accomodate the lower two data bits */
-       adc_val = (data << 2);
-       addr++;
-
-       ret = intel_scu_ipc_ioread8(addr, &data);/* Read lower bits */
-       if (ret)
-               return ret;
-
-       /* Adding lower two bits to the higher bits */
-       data &= 03;
-       adc_val += data;
-
-       /* Convert ADC value to temperature */
-       ret = adc_to_temp(td_info->direct, adc_val, &curr_temp);
-       if (ret == 0)
-               *temp = td_info->curr_temp = curr_temp;
-       return ret;
+	struct thermal_device_info *td_info = tzd->devdata;
+	uint16_t adc_val, addr;
+	uint8_t data = 0;
+	int ret;
+	unsigned long curr_temp;
+
+
+	addr = td_info->chnl_addr;
+
+	/* Enable the msic for conversion before reading */
+	ret = intel_scu_ipc_iowrite8(MSIC_THERM_ADC1CNTL3, MSIC_ADCRRDATA_ENBL);
+	if (ret)
+		return ret;
+
+	/* Re-toggle the RRDATARD bit (temporary workaround) */
+	ret = intel_scu_ipc_iowrite8(MSIC_THERM_ADC1CNTL3, MSIC_ADCTHERM_ENBL);
+	if (ret)
+		return ret;
+
+	/* Read the higher bits of data */
+	ret = intel_scu_ipc_ioread8(addr, &data);
+	if (ret)
+		return ret;
+
+	/* Shift bits to accomodate the lower two data bits */
+	adc_val = (data << 2);
+	addr++;
+
+	ret = intel_scu_ipc_ioread8(addr, &data);/* Read lower bits */
+	if (ret)
+		return ret;
+
+	/* Adding lower two bits to the higher bits */
+	data &= 03;
+	adc_val += data;
+
+	/* Convert ADC value to temperature */
+	ret = adc_to_temp(td_info->direct, adc_val, &curr_temp);
+	if (ret == 0)
+		*temp = td_info->curr_temp = curr_temp;
+	return ret;
 }
 
 /**
@@ -231,22 +232,21 @@ static int mid_read_temp(struct thermal_zone_device *tzd, unsigned long *temp)
  */
 static int configure_adc(int val)
 {
-       int ret;
-       uint8_t data;
-
-       ret = intel_scu_ipc_ioread8(MSIC_THERM_ADC1CNTL1, &data);
-       if (ret)
-               return ret;
-
-       if (val) {
-               /* Enable and start the ADC */
-               data |= (MSIC_ADC_ENBL | MSIC_ADC_START);
-       } else {
-               /* Just stop the ADC */
-               data &= (~MSIC_ADC_START);
-       }
-
-       return intel_scu_ipc_iowrite8(MSIC_THERM_ADC1CNTL1, data);
+	int ret;
+	uint8_t data;
+
+	ret = intel_scu_ipc_ioread8(MSIC_THERM_ADC1CNTL1, &data);
+	if (ret)
+		return ret;
+
+	if (val) {
+		/* Enable and start the ADC */
+		data |= (MSIC_ADC_ENBL | MSIC_ADC_START);
+	} else {
+		/* Just stop the ADC */
+		data &= (~MSIC_ADC_START);
+	}
+	return intel_scu_ipc_iowrite8(MSIC_THERM_ADC1CNTL1, data);
 }
 
 /**
@@ -259,30 +259,30 @@ static int configure_adc(int val)
  */
 static int set_up_therm_channel(u16 base_addr)
 {
-       int ret;
-
-       /* Enable all the sensor channels */
-       ret = intel_scu_ipc_iowrite8(base_addr, SKIN_SENSOR0_CODE);
-       if (ret)
-               return ret;
-
-       ret = intel_scu_ipc_iowrite8(base_addr + 1, SKIN_SENSOR1_CODE);
-       if (ret)
-               return ret;
-
-       ret = intel_scu_ipc_iowrite8(base_addr + 2, SYS_SENSOR_CODE);
-       if (ret)
-               return ret;
-
-       /* Since this is the last channel, set the stop bit
-          to 1 by ORing the DIE_SENSOR_CODE with 0x10 */
-       ret = intel_scu_ipc_iowrite8(base_addr + 3,
-                                       (MSIC_DIE_SENSOR_CODE | 0x10));
-       if (ret)
-               return ret;
-
-       /* Enable ADC and start it */
-       return configure_adc(1);
+	int ret;
+
+	/* Enable all the sensor channels */
+	ret = intel_scu_ipc_iowrite8(base_addr, SKIN_SENSOR0_CODE);
+	if (ret)
+		return ret;
+
+	ret = intel_scu_ipc_iowrite8(base_addr + 1, SKIN_SENSOR1_CODE);
+	if (ret)
+		return ret;
+
+	ret = intel_scu_ipc_iowrite8(base_addr + 2, SYS_SENSOR_CODE);
+	if (ret)
+		return ret;
+
+	/* Since this is the last channel, set the stop bit
+	 * to 1 by ORing the DIE_SENSOR_CODE with 0x10 */
+	ret = intel_scu_ipc_iowrite8(base_addr + 3,
+			(MSIC_DIE_SENSOR_CODE | 0x10));
+	if (ret)
+		return ret;
+
+	/* Enable ADC and start it */
+	return configure_adc(1);
 }
 
 /**
@@ -293,13 +293,13 @@ static int set_up_therm_channel(u16 base_addr)
  */
 static int reset_stopbit(uint16_t addr)
 {
-       int ret;
-       uint8_t data;
-       ret = intel_scu_ipc_ioread8(addr, &data);
-       if (ret)
-               return ret;
-       /* Set the stop bit to zero */
-       return intel_scu_ipc_iowrite8(addr, (data & 0xEF));
+	int ret;
+	uint8_t data;
+	ret = intel_scu_ipc_ioread8(addr, &data);
+	if (ret)
+		return ret;
+	/* Set the stop bit to zero */
+	return intel_scu_ipc_iowrite8(addr, (data & 0xEF));
 }
 
 /**
@@ -317,30 +317,30 @@ static int reset_stopbit(uint16_t addr)
  */
 static int find_free_channel(void)
 {
-       int ret;
-       int i;
-       uint8_t data;
-
-       /* check whether ADC is enabled */
-       ret = intel_scu_ipc_ioread8(MSIC_THERM_ADC1CNTL1, &data);
-       if (ret)
-               return ret;
-
-       if ((data & MSIC_ADC_ENBL) == 0)
-               return 0;
-
-       /* ADC is already enabled; Looking for an empty channel */
-       for (i = 0; i < ADC_CHANLS_MAX; i++) {
-               ret = intel_scu_ipc_ioread8(ADC_CHNL_START_ADDR + i, &data);
-               if (ret)
-                       return ret;
-
-               if (data & MSIC_STOPBIT_MASK) {
-                       ret = i;
-                       break;
-               }
-       }
-       return (ret > ADC_LOOP_MAX) ? (-EINVAL) : ret;
+	int ret;
+	int i;
+	uint8_t data;
+
+	/* check whether ADC is enabled */
+	ret = intel_scu_ipc_ioread8(MSIC_THERM_ADC1CNTL1, &data);
+	if (ret)
+		return ret;
+
+	if ((data & MSIC_ADC_ENBL) == 0)
+		return 0;
+
+	/* ADC is already enabled; Looking for an empty channel */
+	for (i = 0; i < ADC_CHANLS_MAX; i++) {
+		ret = intel_scu_ipc_ioread8(ADC_CHNL_START_ADDR + i, &data);
+		if (ret)
+			return ret;
+
+		if (data & MSIC_STOPBIT_MASK) {
+			ret = i;
+			break;
+		}
+	}
+	return (ret > ADC_LOOP_MAX) ? (-EINVAL) : ret;
 }
 
 /**
@@ -351,48 +351,48 @@ static int find_free_channel(void)
  */
 static int mid_initialize_adc(struct device *dev)
 {
-       u8  data;
-       u16 base_addr;
-       int ret;
-
-       /*
-        * Ensure that adctherm is disabled before we
-        * initialize the ADC
-        */
-       ret = intel_scu_ipc_ioread8(MSIC_THERM_ADC1CNTL3, &data);
-       if (ret)
-               return ret;
-
-       if (data & MSIC_ADCTHERM_MASK)
-               dev_warn(dev, "ADCTHERM already set");
-
-       /* Index of the first channel in which the stop bit is set */
-       channel_index = find_free_channel();
-       if (channel_index < 0) {
-               dev_err(dev, "No free ADC channels");
-               return channel_index;
-       }
-
-       base_addr = ADC_CHNL_START_ADDR + channel_index;
-
-       if (!(channel_index == 0 || channel_index == ADC_LOOP_MAX)) {
-               /* Reset stop bit for channels other than 0 and 12 */
-               ret = reset_stopbit(base_addr);
-               if (ret)
-                       return ret;
-
-               /* Index of the first free channel */
-               base_addr++;
-               channel_index++;
-       }
-
-       ret = set_up_therm_channel(base_addr);
-       if (ret) {
-               dev_err(dev, "unable to enable ADC");
-               return ret;
-       }
-       dev_dbg(dev, "ADC initialization successful");
-       return ret;
+	u8  data;
+	u16 base_addr;
+	int ret;
+
+	/*
+	 * Ensure that adctherm is disabled before we
+	 * initialize the ADC
+	 */
+	ret = intel_scu_ipc_ioread8(MSIC_THERM_ADC1CNTL3, &data);
+	if (ret)
+		return ret;
+
+	if (data & MSIC_ADCTHERM_MASK)
+		dev_warn(dev, "ADCTHERM already set");
+
+	/* Index of the first channel in which the stop bit is set */
+	channel_index = find_free_channel();
+	if (channel_index < 0) {
+		dev_err(dev, "No free ADC channels");
+		return channel_index;
+	}
+
+	base_addr = ADC_CHNL_START_ADDR + channel_index;
+
+	if (!(channel_index == 0 || channel_index == ADC_LOOP_MAX)) {
+		/* Reset stop bit for channels other than 0 and 12 */
+		ret = reset_stopbit(base_addr);
+		if (ret)
+			return ret;
+
+		/* Index of the first free channel */
+		base_addr++;
+		channel_index++;
+	}
+
+	ret = set_up_therm_channel(base_addr);
+	if (ret) {
+		dev_err(dev, "unable to enable ADC");
+		return ret;
+	}
+	dev_dbg(dev, "ADC initialization successful");
+	return ret;
 }
 
 /**
@@ -403,18 +403,18 @@ static int mid_initialize_adc(struct device *dev)
  */
 static struct thermal_device_info *initialize_sensor(int index)
 {
-       struct thermal_device_info *td_info =
-               kzalloc(sizeof(struct thermal_device_info), GFP_KERNEL);
-
-       if (!td_info)
-               return NULL;
-
-       /* Set the base addr of the channel for this sensor */
-       td_info->chnl_addr = ADC_DATA_START_ADDR + 2 * (channel_index + index);
-       /* Sensor 3 is direct conversion */
-       if (index == 3)
-               td_info->direct = 1;
-       return td_info;
+	struct thermal_device_info *td_info =
+		kzalloc(sizeof(struct thermal_device_info), GFP_KERNEL);
+
+	if (!td_info)
+		return NULL;
+
+	/* Set the base addr of the channel for this sensor */
+	td_info->chnl_addr = ADC_DATA_START_ADDR + 2 * (channel_index + index);
+	/* Sensor 3 is direct conversion */
+	if (index == 3)
+		td_info->direct = 1;
+	return td_info;
 }
 
 /**
@@ -425,7 +425,7 @@ static struct thermal_device_info *initialize_sensor(int index)
  */
 static int mid_thermal_resume(struct platform_device *pdev)
 {
-       return mid_initialize_adc(&pdev->dev);
+	return mid_initialize_adc(&pdev->dev);
 }
 
 /**
@@ -437,12 +437,12 @@ static int mid_thermal_resume(struct platform_device *pdev)
  */
 static int mid_thermal_suspend(struct platform_device *pdev, pm_message_t mesg)
 {
-       /*
-        * This just stops the ADC and does not disable it.
-        * temporary workaround until we have a generic ADC driver.
-        * If 0 is passed, it disables the ADC.
-        */
-       return configure_adc(0);
+	/*
+	 * This just stops the ADC and does not disable it.
+	 * temporary workaround until we have a generic ADC driver.
+	 * If 0 is passed, it disables the ADC.
+	 */
+	return configure_adc(0);
 }
 
 /**
@@ -453,16 +453,15 @@ static int mid_thermal_suspend(struct platform_device *pdev, pm_message_t mesg)
  */
 static int read_curr_temp(struct thermal_zone_device *tzd, unsigned long *temp)
 {
-       WARN_ON(tzd == NULL);
-       return mid_read_temp(tzd, temp);
+	WARN_ON(tzd == NULL);
+	return mid_read_temp(tzd, temp);
 }
 
 /* Can't be const */
 static struct thermal_zone_device_ops tzd_ops = {
-       .get_temp = read_curr_temp,
+	.get_temp = read_curr_temp,
 };
 
-
 /**
  * mid_thermal_probe - mfld thermal initialize
  * @pdev: platform device structure
@@ -472,46 +471,45 @@ static struct thermal_zone_device_ops tzd_ops = {
  */
 static int mid_thermal_probe(struct platform_device *pdev)
 {
-       static char *name[MSIC_THERMAL_SENSORS] = {
-               "skin0", "skin1", "sys", "msicdie"
-       };
-
-       int ret;
-       int i;
-       struct platform_info *pinfo;
-
-       pinfo = kzalloc(sizeof(struct platform_info), GFP_KERNEL);
-       if (!pinfo)
-               return -ENOMEM;
-
-       /* Initializing the hardware */
-       ret = mid_initialize_adc(&pdev->dev);
-       if (ret) {
-               dev_err(&pdev->dev, "ADC init failed");
-               kfree(pinfo);
-               return ret;
-       }
-
-       /* Register each sensor with the generic thermal framework*/
-       for (i = 0; i < MSIC_THERMAL_SENSORS; i++) {
-               pinfo->tzd[i] = thermal_zone_device_register(name[i],
-                                       0, initialize_sensor(i),
-                                       &tzd_ops, 0, 0, 0, 0);
-               if (IS_ERR(pinfo->tzd[i]))
-                       goto reg_fail;
-       }
-
-       pinfo->pdev = pdev;
-       platform_set_drvdata(pdev, pinfo);
-       return 0;
+	static char *name[MSIC_THERMAL_SENSORS] = {
+		"skin0", "skin1", "sys", "msicdie"
+	};
+
+	int ret;
+	int i;
+	struct platform_info *pinfo;
+
+	pinfo = kzalloc(sizeof(struct platform_info), GFP_KERNEL);
+	if (!pinfo)
+		return -ENOMEM;
+
+	/* Initializing the hardware */
+	ret = mid_initialize_adc(&pdev->dev);
+	if (ret) {
+		dev_err(&pdev->dev, "ADC init failed");
+		kfree(pinfo);
+		return ret;
+	}
+
+	/* Register each sensor with the generic thermal framework*/
+	for (i = 0; i < MSIC_THERMAL_SENSORS; i++) {
+		pinfo->tzd[i] = thermal_zone_device_register(name[i],
+				0, initialize_sensor(i), &tzd_ops, 0, 0, 0, 0);
+		if (IS_ERR(pinfo->tzd[i]))
+			goto reg_fail;
+	}
+
+	pinfo->pdev = pdev;
+	platform_set_drvdata(pdev, pinfo);
+	return 0;
 
 reg_fail:
-       ret = PTR_ERR(pinfo->tzd[i]);
-       while (--i >= 0)
-               thermal_zone_device_unregister(pinfo->tzd[i]);
-       configure_adc(0);
-       kfree(pinfo);
-       return ret;
+	ret = PTR_ERR(pinfo->tzd[i]);
+	while (--i >= 0)
+		thermal_zone_device_unregister(pinfo->tzd[i]);
+	configure_adc(0);
+	kfree(pinfo);
+	return ret;
 }
 
 /**
@@ -523,49 +521,45 @@ reg_fail:
  */
 static int mid_thermal_remove(struct platform_device *pdev)
 {
-       int i;
-       struct platform_info *pinfo = platform_get_drvdata(pdev);
+	int i;
+	struct platform_info *pinfo = platform_get_drvdata(pdev);
 
-       for (i = 0; i < MSIC_THERMAL_SENSORS; i++)
-               thermal_zone_device_unregister(pinfo->tzd[i]);
+	for (i = 0; i < MSIC_THERMAL_SENSORS; i++)
+		thermal_zone_device_unregister(pinfo->tzd[i]);
 
-       platform_set_drvdata(pdev, NULL);
+	platform_set_drvdata(pdev, NULL);
 
-       /* Stop the ADC */
-       return configure_adc(0);
+	/* Stop the ADC */
+	return configure_adc(0);
 }
 
-/*********************************************************************
- *             Driver initialisation and finalization
- *********************************************************************/
-
 #define DRIVER_NAME "msic_sensor"
 
 static const struct platform_device_id therm_id_table[] = {
-       { DRIVER_NAME, 1 },
-       { }
+	{ DRIVER_NAME, 1 },
+	{ }
 };
 
 static struct platform_driver mid_thermal_driver = {
-       .driver = {
-               .name = DRIVER_NAME,
-               .owner = THIS_MODULE,
-       },
-       .probe = mid_thermal_probe,
-       .suspend = mid_thermal_suspend,
-       .resume = mid_thermal_resume,
-       .remove = __devexit_p(mid_thermal_remove),
-       .id_table = therm_id_table,
+	.driver = {
+		.name = DRIVER_NAME,
+		.owner = THIS_MODULE,
+	},
+	.probe = mid_thermal_probe,
+	.suspend = mid_thermal_suspend,
+	.resume = mid_thermal_resume,
+	.remove = __devexit_p(mid_thermal_remove),
+	.id_table = therm_id_table,
 };
 
 static int __init mid_thermal_module_init(void)
 {
-       return platform_driver_register(&mid_thermal_driver);
+	return platform_driver_register(&mid_thermal_driver);
 }
 
 static void __exit mid_thermal_module_exit(void)
 {
-       platform_driver_unregister(&mid_thermal_driver);
+	platform_driver_unregister(&mid_thermal_driver);
 }
 
 module_init(mid_thermal_module_init);
-- 
1.7.1
