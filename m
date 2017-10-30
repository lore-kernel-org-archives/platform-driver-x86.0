From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v11 05/15] platform/x86: dell-wmi-descriptor: split WMI
 descriptor into it's own driver
Date: Mon, 30 Oct 2017 12:46:52 +0100
Message-ID: <20171030114652.kopuffflshq2ates@pali>
References: <cover.1508515469.git.mario.limonciello@dell.com>
 <a740a284f62e9fbbefe0f2567e20ccf997d43e25.1508515469.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a740a284f62e9fbbefe0f2567e20ccf997d43e25.1508515469.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>
List-Id: platform-driver-x86.vger.kernel.org

On Friday 20 October 2017 12:40:20 Mario Limonciello wrote:
> diff --git a/drivers/platform/x86/dell-wmi-descriptor.c b/drivers/platform/x86/dell-wmi-descriptor.c
> new file mode 100644
> index 000000000000..3204c408e261
> --- /dev/null
> +++ b/drivers/platform/x86/dell-wmi-descriptor.c

This dell-wmi-descriptor.c looks good now!

> diff --git a/drivers/platform/x86/dell-wmi-descriptor.h b/drivers/platform/x86/dell-wmi-descriptor.h
> new file mode 100644
> index 000000000000..5f7b69c2c83a
> --- /dev/null
> +++ b/drivers/platform/x86/dell-wmi-descriptor.h
> @@ -721,7 +652,9 @@ static int dell_wmi_events_set_enabled(bool enable)
>  static int dell_wmi_probe(struct wmi_device *wdev)
>  {
>  	struct dell_wmi_priv *priv;
> -	int err;
> +
> +	if (!wmi_has_guid(DELL_WMI_DESCRIPTOR_GUID))
> +		return -ENODEV;
>  
>  	priv = devm_kzalloc(
>  		&wdev->dev, sizeof(struct dell_wmi_priv), GFP_KERNEL);
> @@ -729,9 +662,8 @@ static int dell_wmi_probe(struct wmi_device *wdev)
>  		return -ENOMEM;
>  	dev_set_drvdata(&wdev->dev, priv);
>  
> -	err = dell_wmi_check_descriptor_buffer(wdev);
> -	if (err)
> -		return err;
> +	if (!dell_wmi_get_interface_version(&priv->interface_version))
> +		return -EPROBE_DEFER;

But here is still a problem. You added check that
DELL_WMI_DESCRIPTOR_GUID exists in APCI table, but it does not mean that
probe method of dell-wmi-descriptor cannot fail.

With PROBE_DEFER, dell_wmi_probe function would be called later again
and again, even when probing dell-wmi-descriptor failed and so dell-wmi
in this case cannot work.

>  	return dell_wmi_input_setup(wdev);
>  }

-- 
Pali Rohár
pali.rohar@gmail.com
