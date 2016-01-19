From: Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH v2 1/3] dell-wmi: Stop storing pointers to DMI tables
Date: Tue, 19 Jan 2016 12:04:17 +0100
Message-ID: <20160119120417.2abdf415@endymion.delvare>
References: <cover.1453150613.git.luto@kernel.org>
	<eb210629e07df3a6295a2b3b370aff87625cfbef.1453150613.git.luto@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:50222 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750862AbcASLEW (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 19 Jan 2016 06:04:22 -0500
In-Reply-To: <eb210629e07df3a6295a2b3b370aff87625cfbef.1453150613.git.luto@kernel.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Lutomirski <luto@kernel.org>
Cc: Pali =?UTF-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Andy,

One more thing I just noticed...

On Mon, 18 Jan 2016 12:59:38 -0800, Andy Lutomirski wrote:
> @@ -372,20 +390,26 @@ static int __init dell_wmi_input_setup(void)
>  	dell_wmi_input_dev->phys = "wmi/input0";
>  	dell_wmi_input_dev->id.bustype = BUS_HOST;
>  
> -	if (dell_new_hk_type) {
> -		const struct key_entry *keymap = dell_wmi_prepare_new_keymap();
> -		if (!keymap) {
> -			err = -ENOMEM;
> -			goto err_free_dev;
> -		}
> +	err = dmi_walk(handle_dmi_entry, &dmi_results);
> +	if (err)
> +		goto err_free_dev;
> (...)
> @@ -431,7 +446,6 @@ static int __init dell_wmi_init(void)
>  		return -ENODEV;
>  	}
>  
> -	dmi_walk(find_hk_type, NULL);
>  
>  	err = dell_wmi_input_setup();
>  	if (err)

Before, in the absence of DMI support, the driver would load and assume
the old hotkey interface. After your change, the driver will fail to
load if DMI support is missing. This could, in theory, cause a
regression (although I would be very surprised if even the oldest
supported models don't implement DMI.)

If you want this patch to make it into stable, you probably should
stick to the original behavior and move that change (if you still
believe it is a good idea) to a separate patch, and at the same time
make DELL_WMI either select or depend on DMI. Many other platform/x86
drivers should do the same, BTW, but that's a separate topic.

-- 
Jean Delvare
SUSE L3 Support
