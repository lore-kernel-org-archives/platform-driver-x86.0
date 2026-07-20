Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7CE395D98;
	Mon, 20 Jul 2026 10:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784542136; cv=none; b=SzDK7jJzYRpzpqAl/pfEPNLdE1a7uza28Gmg1iY0tFrrTjvyvWk0Pbmq79PjJ/Fi+JSOv82uTtcB6QRLfJyyOXsEXyGnyWY80+OWZqSwhm5rdGGKaIXuxnyGRnjz4e5bXmqFwfSgPmfLV2cXeAxHo4iKUSLCmZn0U0gehSOJ3dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784542136; c=relaxed/simple;
	bh=hVmHyvIWoYQU4BWWqDAdHTEpHXiTCVaFtdzxz4f3HgQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=haVlXsaVhov4u/xy0u5zoZBpgVeTZvblwukYBdQTzg3dXjMCavSva3QIxXjqvUFcMnJej0HXLbrjOGeGRjq5VvetI3k2Hl5JmOo0TLBUP26tYz0TpHcgOjytMTcyPz/L4//LBrdjAteVVC7am13a4erEcR4SCmUlY17KjsjCVcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ryd9IX1e; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ryd9IX1e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784542126; x=1816078126;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=hVmHyvIWoYQU4BWWqDAdHTEpHXiTCVaFtdzxz4f3HgQ=;
  b=Ryd9IX1eUYPlQc8KEXmzaE+TzIYpYhLN640aaJcr4X6UY2SYGSvn74DT
   S/2ZY0PsoBdB9hQROr0tZl2IsBEz0MSpNeyxndIbjWl42eV7lXUNp4cMk
   +C6Sfky2m4R2zuJ/Nz9fKuSrL3r89/kjEG8RChaJIv++GU+MUOGs5934Y
   n58354nnLfJgFO9TA6qI8uvtSL0RfyeLbOLYhmIEuQ7u8JK3T+K8UaDY/
   qBrYkGeKdmEICrFPjyY6881BWmhrVHbivmLtQQGasIOMk/4QFR97leCPm
   ZCbqMsXdqm8HbYN07nY0/7iNIC/UYBlmzwCaYvjVINPtUkaCKdXhrePXQ
   w==;
X-CSE-ConnectionGUID: seS28twdQ7m9YQQDNx8WIA==
X-CSE-MsgGUID: oshvvaTSReW5kD5FmBCkpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="87658007"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="87658007"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 03:08:42 -0700
X-CSE-ConnectionGUID: cymirO/IQJeFvO9wxeUPTg==
X-CSE-MsgGUID: MEeUAfxXS8m4877q3gniIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="256840334"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.144])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 03:08:40 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 20 Jul 2026 13:08:36 +0300 (EEST)
To: Armin Wolf <W_Armin@gmx.de>
cc: Hans de Goede <hansg@kernel.org>, Dell.Client.Kernel@dell.com, 
    shuangpeng.kernel@gmail.com, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, arnd@arndb.de
Subject: Re: [PATCH 1/3] platform/x86: dell-smbios-wmi: Fix chardev resource
 management
In-Reply-To: <20260716053337.112533-2-W_Armin@gmx.de>
Message-ID: <d7f4d4b3-f2b8-0588-03e9-b97116aedca6@linux.intel.com>
References: <20260716053337.112533-1-W_Armin@gmx.de> <20260716053337.112533-2-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 16 Jul 2026, Armin Wolf wrote:

> When unbinding the WMI driver while a userspace application has
> an open file descriptor for the character device, a UAF occurs:
> 
> KASAN: slab-use-after-free in _copy_to_user from platform/x86/dell-smbios-wmi
> 
> The reason for this is that even after calling misc_deregister(),
> userspace appications can still call read() and/or ioctl() on open
> file descriptors associated with the already unregistered character
> device. This causes a UAF by attempting to access the already freed
> state container of the WMI driver.
> 
> Fix this by no longer storing the state container inside
> filp->private_data. Instead retrieve the state container using
> get_first_smbios_priv() and return -ENODEV if the state container
> does not exist anymore.
> 
> Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
> Closes: https://lore.kernel.org/platform-driver-x86/178144969601.60470.13396800403157907003@gmail.com/
> Fixes: 93885e85a77f ("platform/x86: dell-smbios-wmi: Stop using WMI chardev")
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  drivers/platform/x86/dell/dell-smbios-wmi.c | 66 ++++++++++-----------
>  1 file changed, 33 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-smbios-wmi.c b/drivers/platform/x86/dell/dell-smbios-wmi.c
> index 64d0871b706e..c8a6e711283d 100644
> --- a/drivers/platform/x86/dell/dell-smbios-wmi.c
> +++ b/drivers/platform/x86/dell/dell-smbios-wmi.c
> @@ -6,6 +6,7 @@
>   */
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
> +#include <linux/cleanup.h>
>  #include <linux/device.h>
>  #include <linux/dmi.h>
>  #include <linux/fs.h>
> @@ -13,14 +14,14 @@
>  #include <linux/miscdevice.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> +#include <linux/rwsem.h>
>  #include <linux/uaccess.h>
>  #include <linux/wmi.h>
>  #include <uapi/linux/wmi.h>
>  #include "dell-smbios.h"
>  #include "dell-wmi-descriptor.h"
>  
> -static DEFINE_MUTEX(call_mutex);
> -static DEFINE_MUTEX(list_mutex);
> +static DECLARE_RWSEM(list_lock);

Please add a comment about what this protects.

Maybe move wmi_list next to it so the connection between them is more 
obvious?

Should get_first_smbios_priv() use lockdep_assert_held() to check it's 
called from a safe context?

-- 
 i.

>  static int wmi_supported;
>  
>  struct misc_bios_flags_structure {
> @@ -32,6 +33,7 @@ struct misc_bios_flags_structure {
>  #define DELL_WMI_SMBIOS_GUID "A80593CE-A997-11DA-B012-B622A1EF5492"
>  
>  struct wmi_smbios_priv {
> +	struct mutex call_lock; /* Protects the content of the SMBIOS buffer */
>  	struct dell_wmi_smbios_buffer *buf;
>  	struct list_head list;
>  	struct wmi_device *wdev;
> @@ -87,40 +89,35 @@ static int dell_smbios_wmi_call(struct calling_interface_buffer *buffer)
>  	size_t size;
>  	int ret;
>  
> -	mutex_lock(&call_mutex);
> +	guard(rwsem_read)(&list_lock);
> +
>  	priv = get_first_smbios_priv();
> -	if (!priv) {
> -		ret = -ENODEV;
> -		goto out_wmi_call;
> -	}
> +	if (!priv)
> +		return -ENODEV;
>  
>  	size = sizeof(struct calling_interface_buffer);
>  	difference = priv->req_buf_size - sizeof(u64) - size;
>  
> +	guard(mutex)(&priv->call_lock);
> +
>  	memset(&priv->buf->ext, 0, difference);
>  	memcpy(&priv->buf->std, buffer, size);
>  	ret = run_smbios_call(priv->wdev);
>  	memcpy(buffer, &priv->buf->std, size);
> -out_wmi_call:
> -	mutex_unlock(&call_mutex);
>  
>  	return ret;
>  }
>  
> -static int dell_smbios_wmi_open(struct inode *inode, struct file *filp)
> +static ssize_t dell_smbios_wmi_read(struct file *filp, char __user *buffer, size_t length,
> +				    loff_t *offset)
>  {
>  	struct wmi_smbios_priv *priv;
>  
> -	priv = container_of(filp->private_data, struct wmi_smbios_priv, char_dev);
> -	filp->private_data = priv;
> +	guard(rwsem_read)(&list_lock);
>  
> -	return nonseekable_open(inode, filp);
> -}
> -
> -static ssize_t dell_smbios_wmi_read(struct file *filp, char __user *buffer, size_t length,
> -				    loff_t *offset)
> -{
> -	struct wmi_smbios_priv *priv = filp->private_data;
> +	priv = get_first_smbios_priv();
> +	if (!priv)
> +		return -ENODEV;
>  
>  	return simple_read_from_buffer(buffer, length, offset, &priv->req_buf_size,
>  				       sizeof(priv->req_buf_size));
> @@ -167,22 +164,24 @@ static long dell_smbios_wmi_do_ioctl(struct wmi_smbios_priv *priv,
>  static long dell_smbios_wmi_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  {
>  	struct dell_wmi_smbios_buffer __user *input = (struct dell_wmi_smbios_buffer __user *)arg;
> -	struct wmi_smbios_priv *priv = filp->private_data;
> -	long ret;
> +	struct wmi_smbios_priv *priv;
>  
>  	if (cmd != DELL_WMI_SMBIOS_CMD)
>  		return -ENOIOCTLCMD;
>  
> -	mutex_lock(&call_mutex);
> -	ret = dell_smbios_wmi_do_ioctl(priv, input);
> -	mutex_unlock(&call_mutex);
> +	guard(rwsem_read)(&list_lock);
>  
> -	return ret;
> +	priv = get_first_smbios_priv();
> +	if (!priv)
> +		return -ENODEV;
> +
> +	guard(mutex)(&priv->call_lock);
> +
> +	return dell_smbios_wmi_do_ioctl(priv, input);
>  }
>  
>  static const struct file_operations dell_smbios_wmi_fops = {
>  	.owner		= THIS_MODULE,
> -	.open		= dell_smbios_wmi_open,
>  	.read		= dell_smbios_wmi_read,
>  	.unlocked_ioctl	= dell_smbios_wmi_ioctl,
>  	.compat_ioctl	= compat_ptr_ioctl,
> @@ -254,6 +253,10 @@ static int dell_smbios_wmi_probe(struct wmi_device *wdev, const void *context)
>  	if (!priv->buf)
>  		return -ENOMEM;
>  
> +	ret = devm_mutex_init(&wdev->dev, &priv->call_lock);
> +	if (ret)
> +		return ret;
> +
>  	ret = dell_smbios_wmi_register_chardev(priv);
>  	if (ret)
>  		return ret;
> @@ -262,9 +265,8 @@ static int dell_smbios_wmi_probe(struct wmi_device *wdev, const void *context)
>  	if (ret)
>  		return ret;
>  
> -	mutex_lock(&list_mutex);
> +	guard(rwsem_write)(&list_lock);
>  	list_add_tail(&priv->list, &wmi_list);
> -	mutex_unlock(&list_mutex);
>  
>  	return 0;
>  }
> @@ -273,12 +275,10 @@ static void dell_smbios_wmi_remove(struct wmi_device *wdev)
>  {
>  	struct wmi_smbios_priv *priv = dev_get_drvdata(&wdev->dev);
>  
> -	mutex_lock(&call_mutex);
> -	mutex_lock(&list_mutex);
> -	list_del(&priv->list);
> -	mutex_unlock(&list_mutex);
>  	dell_smbios_unregister_device(&wdev->dev);
> -	mutex_unlock(&call_mutex);
> +
> +	guard(rwsem_write)(&list_lock);
> +	list_del(&priv->list);
>  }
>  
>  static const struct wmi_device_id dell_smbios_wmi_id_table[] = {
> 
