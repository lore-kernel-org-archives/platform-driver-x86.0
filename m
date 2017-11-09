From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 1/2] platform/x86: dell-wmi-descriptor: check if memory
 was allocated
Date: Thu, 9 Nov 2017 13:07:42 +0100
Message-ID: <20171109120742.6ctactdfgygdati3@pali>
References: <cover.1509725778.git.mario.limonciello@dell.com>
 <cf25805c3f247ca5c710ad9971dbc7a50e4c872c.1509725778.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:55045 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754180AbdKIMHp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Nov 2017 07:07:45 -0500
Content-Disposition: inline
In-Reply-To: <cf25805c3f247ca5c710ad9971dbc7a50e4c872c.1509725778.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org

On Friday 03 November 2017 11:27:21 Mario Limonciello wrote:
> devm_kzalloc will return NULL pointer if no memory was allocated.
> This should be checked.  This problem also existed when the driver
> was dell-wmi.c.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>

Reviewed-by: Pali Rohár <pali.rohar@gmail.com>

> ---
>  drivers/platform/x86/dell-wmi-descriptor.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/platform/x86/dell-wmi-descriptor.c b/drivers/platform/x86/dell-wmi-descriptor.c
> index 3204c408e261..28ef5f37cfbf 100644
> --- a/drivers/platform/x86/dell-wmi-descriptor.c
> +++ b/drivers/platform/x86/dell-wmi-descriptor.c
> @@ -121,6 +121,11 @@ static int dell_wmi_descriptor_probe(struct wmi_device *wdev)
>  	priv = devm_kzalloc(&wdev->dev, sizeof(struct descriptor_priv),
>  	GFP_KERNEL);
>  
> +	if (!priv) {
> +		ret = -ENOMEM;
> +		goto out;
> +	}
> +
>  	priv->interface_version = buffer[2];
>  	priv->size = buffer[3];
>  	ret = 0;

-- 
Pali Rohár
pali.rohar@gmail.com
