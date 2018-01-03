From: Darren Hart <dvhart@infradead.org>
Subject: Re: [patch v6 2/3] platform/mellanox: mlxreg-hotplug: allow driver
 for ARM architecture
Date: Tue, 2 Jan 2018 16:15:16 -0800
Message-ID: <20180103001516.GD24794@fury>
References: <1513603204-13536-3-git-send-email-vadimp@mellanox.com>
 <201712201716.2qABc99R%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:42177 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751063AbeACAPW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Jan 2018 19:15:22 -0500
Content-Disposition: inline
In-Reply-To: <201712201716.2qABc99R%fengguang.wu@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: kbuild test robot <lkp@intel.com>
Cc: Vadim Pasternak <vadimp@mellanox.com>, kbuild-all@01.org, andy.shevchenko@gmail.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us

On Wed, Dec 20, 2017 at 05:11:51PM +0800, kbuild test robot wrote:
> Hi Vadim,
> 

Hi Vadim,

This has been a long time in development, and has been tricky to get everyone
aligned for review. I'm prioritizing this series now and will commit to
reviewing in a timely manner. I assume you have seen the build error below -
will you prepare a v7 which addresses the build issue?

Regards,

> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on platform-drivers-x86/for-next]
> [also build test ERROR on v4.15-rc4 next-20171220]
> [cannot apply to linus/master]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Vadim-Pasternak/drivers-platform-replace-module-x86-mlxcpld-hotplug-with-mellanox-mlxreg-hotplug/20171220-163359
> base:   git://git.infradead.org/users/dvhart/linux-platform-drivers-x86.git for-next
> config: sparc64-allyesconfig (attached as .config)
> compiler: sparc64-linux-gnu-gcc (Debian 7.2.0-11) 7.2.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         make.cross ARCH=sparc64 
> 
> Note: the linux-review/Vadim-Pasternak/drivers-platform-replace-module-x86-mlxcpld-hotplug-with-mellanox-mlxreg-hotplug/20171220-163359 HEAD 7e98e72a743e69069c34f3bbd3b9289740e30de0 builds fine.
>       It only hurts bisectibility.
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/platform/mellanox/mlxreg-hotplug.c: In function 'mlxreg_hotplug_attr_show':
> >> drivers/platform/mellanox/mlxreg-hotplug.c:224:17: error: implicit declaration of function 'inb' [-Werror=implicit-function-declaration]
>       reg_val = !!!(inb(priv->plat->psu_reg_offset) & BIT(index));
>                     ^~~
>    drivers/platform/mellanox/mlxreg-hotplug.c: In function 'mlxreg_hotplug_work_helper':
> >> drivers/platform/mellanox/mlxreg-hotplug.c:305:2: error: implicit declaration of function 'outb' [-Werror=implicit-function-declaration]
>      outb(0, offset + MLXREG_HOTPLUG_MASK_OFF);
>      ^~~~
>    cc1: some warnings being treated as errors
> 
> vim +/inb +224 drivers/platform/mellanox/mlxreg-hotplug.c
> 
> 86a4f473 drivers/platform/mellanox/mlxreg-hotplug.c Vadim Pasternak 2017-12-18  210  
> ebea1439 drivers/platform/mellanox/mlxreg-hotplug.c Vadim Pasternak 2017-12-18  211  static ssize_t mlxreg_hotplug_attr_show(struct device *dev,
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  212  					struct device_attribute *attr,
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  213  					char *buf)
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  214  {
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  215  	struct platform_device *pdev = to_platform_device(dev);
> ebea1439 drivers/platform/mellanox/mlxreg-hotplug.c Vadim Pasternak 2017-12-18  216  	struct mlxreg_hotplug_priv_data *priv = platform_get_drvdata(pdev);
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  217  	int index = to_sensor_dev_attr_2(attr)->index;
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  218  	int nr = to_sensor_dev_attr_2(attr)->nr;
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  219  	u8 reg_val = 0;
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  220  
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  221  	switch (nr) {
> ebea1439 drivers/platform/mellanox/mlxreg-hotplug.c Vadim Pasternak 2017-12-18  222  	case MLXREG_HOTPLUG_ATTR_TYPE_PSU:
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  223  		/* Bit = 0 : PSU is present. */
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20 @224  		reg_val = !!!(inb(priv->plat->psu_reg_offset) & BIT(index));
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  225  		break;
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  226  
> ebea1439 drivers/platform/mellanox/mlxreg-hotplug.c Vadim Pasternak 2017-12-18  227  	case MLXREG_HOTPLUG_ATTR_TYPE_PWR:
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  228  		/* Bit = 1 : power cable is attached. */
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  229  		reg_val = !!(inb(priv->plat->pwr_reg_offset) & BIT(index %
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  230  						priv->plat->pwr_count));
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  231  		break;
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  232  
> ebea1439 drivers/platform/mellanox/mlxreg-hotplug.c Vadim Pasternak 2017-12-18  233  	case MLXREG_HOTPLUG_ATTR_TYPE_FAN:
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  234  		/* Bit = 0 : FAN is present. */
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  235  		reg_val = !!!(inb(priv->plat->fan_reg_offset) & BIT(index %
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  236  						priv->plat->fan_count));
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  237  		break;
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  238  	}
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  239  
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  240  	return sprintf(buf, "%u\n", reg_val);
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  241  }
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  242  
> ebea1439 drivers/platform/mellanox/mlxreg-hotplug.c Vadim Pasternak 2017-12-18  243  #define PRIV_ATTR(i) priv->mlxreg_hotplug_attr[i]
> ebea1439 drivers/platform/mellanox/mlxreg-hotplug.c Vadim Pasternak 2017-12-18  244  #define PRIV_DEV_ATTR(i) priv->mlxreg_hotplug_dev_attr[i]
> ebea1439 drivers/platform/mellanox/mlxreg-hotplug.c Vadim Pasternak 2017-12-18  245  static int mlxreg_hotplug_attr_init(struct mlxreg_hotplug_priv_data *priv)
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  246  {
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  247  	int num_attrs = priv->plat->psu_count + priv->plat->pwr_count +
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  248  			priv->plat->fan_count;
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  249  	int i;
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  250  
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  251  	priv->group.attrs = devm_kzalloc(&priv->pdev->dev, num_attrs *
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  252  					 sizeof(struct attribute *),
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  253  					 GFP_KERNEL);
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  254  	if (!priv->group.attrs)
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  255  		return -ENOMEM;
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  256  
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  257  	for (i = 0; i < num_attrs; i++) {
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  258  		PRIV_ATTR(i) = &PRIV_DEV_ATTR(i).dev_attr.attr;
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  259  
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  260  		if (i < priv->plat->psu_count) {
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  261  			PRIV_ATTR(i)->name = devm_kasprintf(&priv->pdev->dev,
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  262  						GFP_KERNEL, "psu%u", i + 1);
> ebea1439 drivers/platform/mellanox/mlxreg-hotplug.c Vadim Pasternak 2017-12-18  263  			PRIV_DEV_ATTR(i).nr = MLXREG_HOTPLUG_ATTR_TYPE_PSU;
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  264  		} else if (i < priv->plat->psu_count + priv->plat->pwr_count) {
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  265  			PRIV_ATTR(i)->name = devm_kasprintf(&priv->pdev->dev,
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  266  						GFP_KERNEL, "pwr%u", i %
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  267  						priv->plat->pwr_count + 1);
> ebea1439 drivers/platform/mellanox/mlxreg-hotplug.c Vadim Pasternak 2017-12-18  268  			PRIV_DEV_ATTR(i).nr = MLXREG_HOTPLUG_ATTR_TYPE_PWR;
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  269  		} else {
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  270  			PRIV_ATTR(i)->name = devm_kasprintf(&priv->pdev->dev,
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  271  						GFP_KERNEL, "fan%u", i %
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  272  						priv->plat->fan_count + 1);
> ebea1439 drivers/platform/mellanox/mlxreg-hotplug.c Vadim Pasternak 2017-12-18  273  			PRIV_DEV_ATTR(i).nr = MLXREG_HOTPLUG_ATTR_TYPE_FAN;
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  274  		}
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  275  
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  276  		if (!PRIV_ATTR(i)->name) {
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  277  			dev_err(&priv->pdev->dev, "Memory allocation failed for sysfs attribute %d.\n",
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  278  				i + 1);
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  279  			return -ENOMEM;
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  280  		}
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  281  
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  282  		PRIV_DEV_ATTR(i).dev_attr.attr.name = PRIV_ATTR(i)->name;
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  283  		PRIV_DEV_ATTR(i).dev_attr.attr.mode = S_IRUGO;
> ebea1439 drivers/platform/mellanox/mlxreg-hotplug.c Vadim Pasternak 2017-12-18  284  		PRIV_DEV_ATTR(i).dev_attr.show = mlxreg_hotplug_attr_show;
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  285  		PRIV_DEV_ATTR(i).index = i;
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  286  		sysfs_attr_init(&PRIV_DEV_ATTR(i).dev_attr.attr);
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  287  	}
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  288  
> ebea1439 drivers/platform/mellanox/mlxreg-hotplug.c Vadim Pasternak 2017-12-18  289  	priv->group.attrs = priv->mlxreg_hotplug_attr;
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  290  	priv->groups[0] = &priv->group;
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  291  	priv->groups[1] = NULL;
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  292  
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  293  	return 0;
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  294  }
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  295  
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  296  static inline void
> ebea1439 drivers/platform/mellanox/mlxreg-hotplug.c Vadim Pasternak 2017-12-18  297  mlxreg_hotplug_work_helper(struct device *dev,
> ebea1439 drivers/platform/mellanox/mlxreg-hotplug.c Vadim Pasternak 2017-12-18  298  			   struct mlxreg_hotplug_device *item, u8 is_inverse,
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  299  			   u16 offset, u8 mask, u8 *cache)
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  300  {
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  301  	u8 val, asserted;
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  302  	int bit;
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  303  
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  304  	/* Mask event. */
> ebea1439 drivers/platform/mellanox/mlxreg-hotplug.c Vadim Pasternak 2017-12-18 @305  	outb(0, offset + MLXREG_HOTPLUG_MASK_OFF);
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  306  	/* Read status. */
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  307  	val = inb(offset) & mask;
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  308  	asserted = *cache ^ val;
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  309  	*cache = val;
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  310  
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  311  	/*
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  312  	 * Validate if item related to received signal type is valid.
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  313  	 * It should never happen, excepted the situation when some
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  314  	 * piece of hardware is broken. In such situation just produce
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  315  	 * error message and return. Caller must continue to handle the
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  316  	 * signals from other devices if any.
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  317  	 */
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  318  	if (unlikely(!item)) {
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  319  		dev_err(dev, "False signal is received: register at offset 0x%02x, mask 0x%02x.\n",
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  320  			offset, mask);
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  321  		return;
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  322  	}
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  323  
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  324  	for_each_set_bit(bit, (unsigned long *)&asserted, 8) {
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  325  		if (val & BIT(bit)) {
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  326  			if (is_inverse)
> 86a4f473 drivers/platform/mellanox/mlxreg-hotplug.c Vadim Pasternak 2017-12-18  327  				mlxreg_hotplug_dev_disable(item + bit);
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  328  			else
> 86a4f473 drivers/platform/mellanox/mlxreg-hotplug.c Vadim Pasternak 2017-12-18  329  				mlxreg_hotplug_dev_enable(item + bit);
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  330  		} else {
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  331  			if (is_inverse)
> 86a4f473 drivers/platform/mellanox/mlxreg-hotplug.c Vadim Pasternak 2017-12-18  332  				mlxreg_hotplug_dev_enable(item + bit);
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  333  			else
> 86a4f473 drivers/platform/mellanox/mlxreg-hotplug.c Vadim Pasternak 2017-12-18  334  				mlxreg_hotplug_dev_disable(item + bit);
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  335  		}
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  336  	}
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  337  
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  338  	/* Acknowledge event. */
> ebea1439 drivers/platform/mellanox/mlxreg-hotplug.c Vadim Pasternak 2017-12-18  339  	outb(0, offset + MLXREG_HOTPLUG_EVENT_OFF);
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  340  	/* Unmask event. */
> ebea1439 drivers/platform/mellanox/mlxreg-hotplug.c Vadim Pasternak 2017-12-18  341  	outb(mask, offset + MLXREG_HOTPLUG_MASK_OFF);
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  342  }
> 30488704 drivers/platform/x86/mlxcpld-hotplug.c     Vadim Pasternak 2016-10-20  343  
> 
> :::::: The code at line 224 was first introduced by commit
> :::::: 304887041d953b6692c0d4a9f8fafb252d32e9a0 platform/x86: Introduce support for Mellanox hotplug driver
> 
> :::::: TO: Vadim Pasternak <vadimp@mellanox.com>
> :::::: CC: Darren Hart <dvhart@linux.intel.com>
> 
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation



-- 
Darren Hart
VMware Open Source Technology Center
