From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v6 05/14] platform/x86: dell-wmi-descriptor: split WMI
 descriptor into it's own driver
Date: Tue, 10 Oct 2017 10:17:49 +0200
Message-ID: <20171010081749.7ohuyadwsg555cli@pali>
References: <cover.1507589249.git.mario.limonciello@dell.com>
 <92fb25a14fbc24541cd758854b70268b3497d913.1507589249.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f51.google.com ([74.125.82.51]:51193 "EHLO
        mail-wm0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755405AbdJJIRy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 10 Oct 2017 04:17:54 -0400
Content-Disposition: inline
In-Reply-To: <92fb25a14fbc24541cd758854b70268b3497d913.1507589249.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>

On Monday 09 October 2017 17:51:43 Mario Limonciello wrote:
> +bool dell_wmi_get_interface_version(u32 *version)
> +{
> +	struct descriptor_priv *priv;
> +
> +	priv = list_first_entry_or_null(&wmi_list,
> +					struct descriptor_priv,
> +					list);
> +	if (!priv)
> +		return false;

This introduce race condition. In case callee of this function is
executed before binding 8D9DDCBC-A997-11DA-B012-B622A1EF5492 WMI device
into this dell-wmi-descriptor driver, then this function
dell_wmi_get_interface_version() returns false. Even it is running on
supported machine.

Loading of modulus and also binding devices to drivers (registered by
modules) is is asynchronous.

In case everything is linked into vmlinux binary, this problem could
happen too. Binding & initialization of WMI device to this driver can be
postponed and callee (dell-wmi) would get false.

> +	*version = priv->interface_version;
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

And same there.

> +	*size = priv->size;
> +	return true;
> +}
> +EXPORT_SYMBOL_GPL(dell_wmi_get_size);

-- 
Pali Rohár
pali.rohar@gmail.com
