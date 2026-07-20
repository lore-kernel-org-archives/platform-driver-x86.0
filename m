Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E793976AD;
	Mon, 20 Jul 2026 10:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784542699; cv=none; b=Oy1FsFiAwgf2l+dDPTwl71xm3bqsJSO3WjAuKHpZBwrD/FecNlc+CioaObTNViz7Z9NVg5+JtxQo/TbOJzP1O3ZSgHkI0T6Imi07s1ZcMzYkJaXbpNrlpg0UC82mbA6UPbSW7DGFx4UxppF3SlSSa0KTxUWa5OA7EGA03sVTePM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784542699; c=relaxed/simple;
	bh=m97VorIS7b0Gfji9sHqFG86n22C93faK9WA473M/Vvg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=FHNIQ2vR8v4QP5BA0+SVYGszII+iwn966+xlM+3aOKjDeLrJZLpSTOTNghGCBJVaVKTExlzy4wRh1q5wKr0PljMyxlcWkqGPzuEGKtykLLYea0qbezzdy40ImheT7lcnrb3LuJPvfbEnMj1lWlrJJuZe6+tqEg+OxhC9XdQNRIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TsWMmAOx; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TsWMmAOx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784542698; x=1816078698;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=m97VorIS7b0Gfji9sHqFG86n22C93faK9WA473M/Vvg=;
  b=TsWMmAOxwlLCiVAJHzEitLHhiXexr1a7/jdQEsA9oXVXi+NGGK6rk7lP
   B0hD0Ep4uopEp4q0Zve6zbNg4NI/ry2lf+zotxWgwGgbAoyXkqhVHLkZt
   t+B9vGBDKuJD4/pCIxxC+EsOte892uQjVwfKMtl+che1DOlXCK2r9WAnE
   rg5luNU+LlVYeXvKQPjU4rDmVKv3y2ip5baXrWibBVUi8fSCpF7NmHWZO
   tHK5TZQCBjJZRWyhnNVtkMYiGfZR6XHtToD9saDZqfn4Vub3De0/HvFUC
   PHXudeiInuVjZFWRllZBm5ic/bBccSdUc8ZCwQvJOhuyOnyX48ryK/s3k
   g==;
X-CSE-ConnectionGUID: tSsorHCeTtKqOkct1Vh+JA==
X-CSE-MsgGUID: UZWH4pVXTKy9H9LIEfUqMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="87658801"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="87658801"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 03:18:17 -0700
X-CSE-ConnectionGUID: jA+MHTgxTiqYsjEFZaKU/g==
X-CSE-MsgGUID: 36PVsK3WQIm7m6zvQUyHdg==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.144])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 03:18:14 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 20 Jul 2026 13:18:11 +0300 (EEST)
To: Armin Wolf <W_Armin@gmx.de>
cc: Hans de Goede <hansg@kernel.org>, Dell.Client.Kernel@dell.com, 
    shuangpeng.kernel@gmail.com, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, arnd@arndb.de
Subject: Re: [PATCH 3/3] platform/x86: dell-smbios-wmi: Replace global list
 with single item
In-Reply-To: <20260716053337.112533-4-W_Armin@gmx.de>
Message-ID: <14853dc3-61e4-2d6f-e7ea-248aff5da157@linux.intel.com>
References: <20260716053337.112533-1-W_Armin@gmx.de> <20260716053337.112533-4-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 16 Jul 2026, Armin Wolf wrote:

> There can only exist a single instance of the dell-smbios-wmi driver
> at the same time because of naming conflicts with the character
> device ("wmi/dell-smbios"). Having a global list for all instances
> thus makes no sense.
> 
> Replace the global list with a single item used by the character
> device. This simplifies the driver and allows us to mark it as
> being multi-instance safe.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  drivers/platform/x86/dell/dell-smbios-wmi.c | 67 ++++++++++-----------
>  1 file changed, 31 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-smbios-wmi.c b/drivers/platform/x86/dell/dell-smbios-wmi.c
> index 552b80429688..f9443ddfff55 100644
> --- a/drivers/platform/x86/dell/dell-smbios-wmi.c
> +++ b/drivers/platform/x86/dell/dell-smbios-wmi.c
> @@ -10,7 +10,6 @@
>  #include <linux/device.h>
>  #include <linux/dmi.h>
>  #include <linux/fs.h>
> -#include <linux/list.h>
>  #include <linux/miscdevice.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> @@ -21,7 +20,6 @@
>  #include "dell-smbios.h"
>  #include "dell-wmi-descriptor.h"
>  
> -static DECLARE_RWSEM(list_lock);
>  static int wmi_supported;
>  
>  struct misc_bios_flags_structure {
> @@ -35,20 +33,14 @@ struct misc_bios_flags_structure {
>  struct wmi_smbios_priv {
>  	struct mutex call_lock; /* Protects the content of the SMBIOS buffer */
>  	struct dell_wmi_smbios_buffer *buf;
> -	struct list_head list;
>  	struct wmi_device *wdev;
>  	struct device *child;
>  	u64 req_buf_size;
>  	struct miscdevice char_dev;
>  };
> -static LIST_HEAD(wmi_list);

Okay, nevermind the comments on patch 1.

--
 i.

>  
> -static inline struct wmi_smbios_priv *get_first_smbios_priv(void)
> -{
> -	return list_first_entry_or_null(&wmi_list,
> -					struct wmi_smbios_priv,
> -					list);
> -}
> +static DECLARE_RWSEM(chardev_lock);	/* Protects chardev_priv */
> +static struct wmi_smbios_priv *chardev_priv;
>  
>  static int run_smbios_call(struct wmi_device *wdev)
>  {
> @@ -105,16 +97,13 @@ static int dell_smbios_wmi_call(struct device *dev, struct calling_interface_buf
>  static ssize_t dell_smbios_wmi_read(struct file *filp, char __user *buffer, size_t length,
>  				    loff_t *offset)
>  {
> -	struct wmi_smbios_priv *priv;
> -
> -	guard(rwsem_read)(&list_lock);
> +	guard(rwsem_read)(&chardev_lock);
>  
> -	priv = get_first_smbios_priv();
> -	if (!priv)
> +	if (!chardev_priv)
>  		return -ENODEV;
>  
> -	return simple_read_from_buffer(buffer, length, offset, &priv->req_buf_size,
> -				       sizeof(priv->req_buf_size));
> +	return simple_read_from_buffer(buffer, length, offset, &chardev_priv->req_buf_size,
> +				       sizeof(chardev_priv->req_buf_size));
>  }
>  
>  static long dell_smbios_wmi_do_ioctl(struct wmi_smbios_priv *priv,
> @@ -158,20 +147,18 @@ static long dell_smbios_wmi_do_ioctl(struct wmi_smbios_priv *priv,
>  static long dell_smbios_wmi_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  {
>  	struct dell_wmi_smbios_buffer __user *input = (struct dell_wmi_smbios_buffer __user *)arg;
> -	struct wmi_smbios_priv *priv;
>  
>  	if (cmd != DELL_WMI_SMBIOS_CMD)
>  		return -ENOIOCTLCMD;
>  
> -	guard(rwsem_read)(&list_lock);
> +	guard(rwsem_read)(&chardev_lock);
>  
> -	priv = get_first_smbios_priv();
> -	if (!priv)
> +	if (!chardev_priv)
>  		return -ENODEV;
>  
> -	guard(mutex)(&priv->call_lock);
> +	guard(mutex)(&chardev_priv->call_lock);
>  
> -	return dell_smbios_wmi_do_ioctl(priv, input);
> +	return dell_smbios_wmi_do_ioctl(chardev_priv, input);
>  }
>  
>  static const struct file_operations dell_smbios_wmi_fops = {
> @@ -188,10 +175,29 @@ static void dell_smbios_wmi_unregister_chardev(void *data)
>  	misc_deregister(char_dev);
>  }
>  
> +static void dell_smbios_wmi_clear_chardev(void *data)
> +{
> +	guard(rwsem_write)(&chardev_lock);
> +
> +	chardev_priv = NULL;
> +}
> +
>  static int dell_smbios_wmi_register_chardev(struct wmi_smbios_priv *priv)
>  {
>  	int ret;
>  
> +	scoped_guard(rwsem_write, &chardev_lock) {
> +		/* We can only have a single chardev at a time */
> +		if (chardev_priv)
> +			return -EBUSY;
> +
> +		chardev_priv = priv;
> +	}
> +
> +	ret = devm_add_action_or_reset(&priv->wdev->dev, dell_smbios_wmi_clear_chardev, NULL);
> +	if (ret < 0)
> +		return ret;
> +
>  	priv->char_dev.minor = MISC_DYNAMIC_MINOR;
>  	priv->char_dev.name = "wmi/dell-smbios";
>  	priv->char_dev.fops = &dell_smbios_wmi_fops;
> @@ -255,24 +261,12 @@ static int dell_smbios_wmi_probe(struct wmi_device *wdev, const void *context)
>  	if (ret)
>  		return ret;
>  
> -	ret = dell_smbios_register_device(&wdev->dev, 1, &dell_smbios_wmi_call);
> -	if (ret)
> -		return ret;
> -
> -	guard(rwsem_write)(&list_lock);
> -	list_add_tail(&priv->list, &wmi_list);
> -
> -	return 0;
> +	return dell_smbios_register_device(&wdev->dev, 1, &dell_smbios_wmi_call);
>  }
>  
>  static void dell_smbios_wmi_remove(struct wmi_device *wdev)
>  {
> -	struct wmi_smbios_priv *priv = dev_get_drvdata(&wdev->dev);
> -
>  	dell_smbios_unregister_device(&wdev->dev);
> -
> -	guard(rwsem_write)(&list_lock);
> -	list_del(&priv->list);
>  }
>  
>  static const struct wmi_device_id dell_smbios_wmi_id_table[] = {
> @@ -310,6 +304,7 @@ static struct wmi_driver dell_smbios_wmi_driver = {
>  	.probe = dell_smbios_wmi_probe,
>  	.remove = dell_smbios_wmi_remove,
>  	.id_table = dell_smbios_wmi_id_table,
> +	.no_singleton = true,
>  };
>  
>  int init_dell_smbios_wmi(void)
> 
