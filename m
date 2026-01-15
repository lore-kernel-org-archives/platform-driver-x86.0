Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5D030AACA;
	Thu, 15 Jan 2026 14:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768488255; cv=none; b=gaufwCrRlpkgo8qJgDyinDPHLHG+DLQaCtpd0z/RcIt34K5zBgV7dNUyjPiJaJTKFLne+s67DYVM0UvCG5yoWyqEgVAhdb+EfafTiDjZDXrb2QmhrU+oe9nwsTSLgdpOAj7049k7ho3w9UDzGmLQgnv4SFMgQ6aJ/SMpcYFvUeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768488255; c=relaxed/simple;
	bh=cnmCubehlvyC8o15FUNL16XAx9HVbe2gusWXY29bZIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fAXuWjFX3tJZ9MAtbrOlZgLso0Z0vLyY53Sm6HpJFPTAp0pUu6dlmIF55TLBXWqEC1O055XKc0pPqFXe8gpZtjArWQo5+OJ/A+EOdj67KF2W3By4arfxP7dKyAiCtmS11Uwq4Bkga3uNeb6jV61ZjUS5SM4CvN6gh4hCbT6Cz6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ig1KAZ4d; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ig1KAZ4d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768488252; x=1800024252;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cnmCubehlvyC8o15FUNL16XAx9HVbe2gusWXY29bZIA=;
  b=ig1KAZ4dIP4kHDxtFD4zJcQwhK/O/DHzEQVyzyrbk9dWw8EBJfn4uwc0
   i3oH+C47YK1svFlJVSsq/Ki9f3Ns99MsHvi2Rvl85DFSyw5nR1Cw0xwgu
   8g2mw6ERKgxs8JtpwdOpDkn/2g88fTG0jfyxy5BR8bAUSd0/Hxs1L/A78
   B2z1EwNI7Ph34P8Ae9P07dqhCX3W+frBjyuTqqc0kypKZIIuIA53d5+EA
   7cJAaFTtZWKlyaT7j+OTvf4u294ncKskFFZGNePemb6bQEvGR+xawQWuT
   MYSQV3Gtib/wZPPFUEAkIk9s3CFXXDugpVtyW0vxA6s9rVV/0Vb5CllF5
   w==;
X-CSE-ConnectionGUID: 7n8qTY6gQMyHwiC4LGG/tg==
X-CSE-MsgGUID: EizGDbNxTjOb6RrYUrT+IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69773520"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="69773520"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 06:44:11 -0800
X-CSE-ConnectionGUID: ptGMrca2T3uI59h2ED4JbA==
X-CSE-MsgGUID: DcnJb+L7T1eB+JHLrtkw9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="236223879"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 Jan 2026 06:44:09 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgOZy-00000000I52-3pSA;
	Thu, 15 Jan 2026 14:44:06 +0000
Date: Thu, 15 Jan 2026 22:43:58 +0800
From: kernel test robot <lkp@intel.com>
To: Ciju Rajan K <crajank@nvidia.com>, hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com, tglx@linutronix.de
Cc: oe-kbuild-all@lists.linux.dev, christophe.jaillet@wanadoo.fr,
	andriy.shevchenko@linux.intel.com, vadimp@nvidia.com,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ciju Rajan K <crajank@nvidia.com>
Subject: Re: [PATCH platform-next v4 2/2] platform/mellanox: mlxreg-hotplug:
 Enabling interrupt storm detection
Message-ID: <202601152235.2MC3FUQp-lkp@intel.com>
References: <20260115074909.245852-3-crajank@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115074909.245852-3-crajank@nvidia.com>

Hi Ciju,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.19-rc5]
[cannot apply to tip/irq/core next-20260115]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ciju-Rajan-K/kernel-irq-Add-generic-interrupt-storm-detection-mechanism/20260115-155438
base:   linus/master
patch link:    https://lore.kernel.org/r/20260115074909.245852-3-crajank%40nvidia.com
patch subject: [PATCH platform-next v4 2/2] platform/mellanox: mlxreg-hotplug: Enabling interrupt storm detection
config: x86_64-randconfig-161-20260115 (https://download.01.org/0day-ci/archive/20260115/202601152235.2MC3FUQp-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch version: v0.5.0-8985-g2614ff1a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601152235.2MC3FUQp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601152235.2MC3FUQp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/platform/mellanox/mlxreg-hotplug.c:830:7: error: call to undeclared function 'irq_register_storm_detection'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     830 |         if (!irq_register_storm_detection(priv->irq, MLXREG_HOTPLUG_INTR_FREQ_HZ,
         |              ^
>> drivers/platform/mellanox/mlxreg-hotplug.c:847:2: error: call to undeclared function 'irq_unregister_storm_detection'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     847 |         irq_unregister_storm_detection(priv->irq);
         |         ^
   2 errors generated.


vim +/irq_register_storm_detection +830 drivers/platform/mellanox/mlxreg-hotplug.c

   762	
   763	static int mlxreg_hotplug_probe(struct platform_device *pdev)
   764	{
   765		struct mlxreg_core_hotplug_platform_data *pdata;
   766		struct mlxreg_hotplug_priv_data *priv;
   767		struct i2c_adapter *deferred_adap;
   768		int err;
   769	
   770		pdata = dev_get_platdata(&pdev->dev);
   771		if (!pdata) {
   772			dev_err(&pdev->dev, "Failed to get platform data.\n");
   773			return -EINVAL;
   774		}
   775	
   776		/* Defer probing if the necessary adapter is not configured yet. */
   777		deferred_adap = i2c_get_adapter(pdata->deferred_nr);
   778		if (!deferred_adap)
   779			return -EPROBE_DEFER;
   780		i2c_put_adapter(deferred_adap);
   781	
   782		priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
   783		if (!priv)
   784			return -ENOMEM;
   785	
   786		if (pdata->irq) {
   787			priv->irq = pdata->irq;
   788		} else {
   789			priv->irq = platform_get_irq(pdev, 0);
   790			if (priv->irq < 0)
   791				return priv->irq;
   792		}
   793	
   794		priv->regmap = pdata->regmap;
   795		priv->dev = pdev->dev.parent;
   796		priv->pdev = pdev;
   797	
   798		err = devm_request_irq(&pdev->dev, priv->irq,
   799				       mlxreg_hotplug_irq_handler, IRQF_TRIGGER_FALLING
   800				       | IRQF_SHARED, "mlxreg-hotplug", priv);
   801		if (err) {
   802			dev_err(&pdev->dev, "Failed to request irq: %d\n", err);
   803			return err;
   804		}
   805	
   806		disable_irq(priv->irq);
   807		spin_lock_init(&priv->lock);
   808		INIT_DELAYED_WORK(&priv->dwork_irq, mlxreg_hotplug_work_handler);
   809		dev_set_drvdata(&pdev->dev, priv);
   810	
   811		err = mlxreg_hotplug_attr_init(priv);
   812		if (err) {
   813			dev_err(&pdev->dev, "Failed to allocate attributes: %d\n",
   814				err);
   815			return err;
   816		}
   817	
   818		priv->hwmon = devm_hwmon_device_register_with_groups(&pdev->dev,
   819						"mlxreg_hotplug", priv, priv->groups);
   820		if (IS_ERR(priv->hwmon)) {
   821			dev_err(&pdev->dev, "Failed to register hwmon device %ld\n",
   822				PTR_ERR(priv->hwmon));
   823			return PTR_ERR(priv->hwmon);
   824		}
   825	
   826		/* Perform initial interrupts setup. */
   827		mlxreg_hotplug_set_irq(priv);
   828	
   829		/* Register with generic interrupt storm detection */
 > 830		if (!irq_register_storm_detection(priv->irq, MLXREG_HOTPLUG_INTR_FREQ_HZ,
   831						  mlxreg_hotplug_storm_handler, priv)) {
   832			dev_warn(&pdev->dev, "Failed to register generic interrupt storm detection\n");
   833		} else {
   834			dev_info(&pdev->dev, "Registered generic storm detection for IRQ %d\n", priv->irq);
   835		}
   836	
   837		priv->after_probe = true;
   838	
   839		return 0;
   840	}
   841	
   842	static void mlxreg_hotplug_remove(struct platform_device *pdev)
   843	{
   844		struct mlxreg_hotplug_priv_data *priv = dev_get_drvdata(&pdev->dev);
   845	
   846		/* Unregister generic interrupt storm detection */
 > 847		irq_unregister_storm_detection(priv->irq);
   848	
   849		/* Clean interrupts setup. */
   850		mlxreg_hotplug_unset_irq(priv);
   851		devm_free_irq(&pdev->dev, priv->irq, priv);
   852	}
   853	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
