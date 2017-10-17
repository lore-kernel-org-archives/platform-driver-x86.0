From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v9 05/17] platform/x86: dell-wmi-descriptor: split WMI
 descriptor into it's own driver
Date: Tue, 17 Oct 2017 20:59:12 +0200
Message-ID: <20171017185912.uys7e7embiv4g3ii@pali>
References: <cover.1508259916.git.mario.limonciello@dell.com>
 <892677197340c05a67e112884cc00ea938d33e91.1508259916.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:49268 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750992AbdJQS7P (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 17 Oct 2017 14:59:15 -0400
Content-Disposition: inline
In-Reply-To: <892677197340c05a67e112884cc00ea938d33e91.1508259916.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>

On Tuesday 17 October 2017 13:21:49 Mario Limonciello wrote:
> +struct descriptor_priv {
> +	struct list_head list;
> +	u32 interface_version;
> +	u32 size;
> +};
> +static LIST_HEAD(wmi_list);
> +
> +bool dell_wmi_get_interface_version(u32 *version)
> +{
> +	struct descriptor_priv *priv;
> +
> +	priv = list_first_entry_or_null(&wmi_list,
> +					struct descriptor_priv,
> +					list);
> +	if (!priv)
> +		return false;
> +	*version = priv->interface_version;

There is a race condition. dell_wmi_descriptor_remove can be called
between list_first_entry_or_null and dereferencing priv pointer.

> +	return true;
> +}
> +EXPORT_SYMBOL_GPL(dell_wmi_get_interface_version);
> +
> +bool dell_wmi_get_size(u32 *size)
> +{
> +	struct descriptor_priv *priv;
> +
> +	priv = list_first_entry_or_null(&wmi_list,
> +					struct descriptor_priv,
> +					list);
> +	if (!priv)
> +		return false;
> +	*size = priv->size;

And same there.

> +	return true;
> +}
> +EXPORT_SYMBOL_GPL(dell_wmi_get_size);

...

> @@ -733,9 +659,8 @@ static int dell_wmi_probe(struct wmi_device *wdev)
>  		return -ENOMEM;
>  	dev_set_drvdata(&wdev->dev, priv);
>  
> -	err = dell_wmi_check_descriptor_buffer(wdev);
> -	if (err)
> -		return err;
> +	if (!dell_wmi_get_interface_version(&priv->interface_version))
> +		return -EPROBE_DEFER;

This could lead to another problem, when Dell decide to change WMI API
and would not provide descriptor WMI GUID anymore, but still provide
even WMI GUID.

Basically it is needed to distinguish between states:

1) probe function of dell-wmi was called before probe function of
   dell-wmi-descriptor device initialization

2) probe function of dell-wmi was called, but there is no device
   instance of dell-wmi-descriptor

3) there is a device instance of dell-wmi-descriptor, but device is not
   registered to dell-wmi-descriptor driver, e.g. because userspace
   decided to forbid such thing, or because probing of
   dell-wmi-descriptor device failed

4) probe function of dell-wmi was called after probe function of
   dell-wmi-descriptor successfully

I do not know how to handle such situation other drivers or how to do it
correctly. I just wanted to show the fact that binding device <-->
driver can fail in linux kernel (for more reasons) and in some cases
repeating it does not make sense...

Maybe other developers would comment this part?

>  
>  	return dell_wmi_input_setup(wdev);
>  }

-- 
Pali Rohár
pali.rohar@gmail.com
