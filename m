From: Evgenii Shatokhin <eugene.shatokhin@yandex.ru>
Subject: Re: [PATCH] hp-wmi: fix wifi cannot be hard-unblock
Date: Tue, 28 Jun 2016 14:32:23 +0300
Message-ID: <57726047.6070209@yandex.ru>
References: <1465818240-11994-1-git-send-email-alex.hung@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from forward3h.cmail.yandex.net ([87.250.230.18]:33971 "EHLO
	forward3h.cmail.yandex.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751941AbcF1Lh7 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 28 Jun 2016 07:37:59 -0400
In-Reply-To: <1465818240-11994-1-git-send-email-alex.hung@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alex Hung <alex.hung@canonical.com>, dvhart@infradead.org, platform-driver-x86@vger.kernel.org, david.ward@ll.mit.edu

On 13.06.2016 14:44, Alex Hung wrote:
> Several users reported wifi cannot be unblocked as discussed in [1].
> This patch removes the useof 2009 flag by BIOS but uses the actual WMI
> function calls - it will be skipped if WMI reports unsupported
>
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=69131
>
> Signed-off-by: Alex Hung <alex.hung@canonical.com>
> ---
>   drivers/platform/x86/hp-wmi.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
> index 6f145f2..96ffda4 100644
> --- a/drivers/platform/x86/hp-wmi.c
> +++ b/drivers/platform/x86/hp-wmi.c
> @@ -718,6 +718,11 @@ static int __init hp_wmi_rfkill_setup(struct platform_device *device)
>   	if (err)
>   		return err;
>
> +	err = hp_wmi_perform_query(HPWMI_WIRELESS_QUERY, 1, &wireless,
> +				   sizeof(wireless), 0);
> +	if (err)
> +		return err;
> +
>   	if (wireless & 0x1) {
>   		wifi_rfkill = rfkill_alloc("hp-wifi", &device->dev,
>   					   RFKILL_TYPE_WLAN,
> @@ -882,7 +887,7 @@ static int __init hp_wmi_bios_setup(struct platform_device *device)
>   	wwan_rfkill = NULL;
>   	rfkill2_count = 0;
>
> -	if (hp_wmi_bios_2009_later() || hp_wmi_rfkill_setup(device))
> +	if (hp_wmi_rfkill_setup(device))
>   		hp_wmi_rfkill2_setup(device);
>
>   	err = device_create_file(&device->dev, &dev_attr_display);
>

I checked this patch with kernels 4.1.19 - 4.1.25 on HP EliteBook 6930p 
where the problem was spotted earlier. The patch does fix the problem 
for me.

Tested-by: Evgenii Shatokhin <eugene.shatokhin@yandex.ru>

Regards,
Evgenii
