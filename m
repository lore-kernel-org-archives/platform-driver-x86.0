From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: asus-wireless: Fix NULL pointer dereference
Date: Sat, 7 Apr 2018 08:50:06 -0700
Message-ID: <20180407155006.GA11256@fury>
References: <20180407053729.5434-1-jprvita@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180407053729.5434-1-jprvita@endlessm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?iso-8859-1?Q?Jo=E3o?= Paulo Rechi Vita <jprvita@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org, linux@endlessm.com, Dun Hum <bitter.taste@gmx.com>, =?iso-8859-1?Q?Jo=E3o?= Paulo Rechi Vita <jprvita@endlessm.com>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Apr 06, 2018 at 10:37:29PM -0700, João Paulo Rechi Vita wrote:
> When the module is removed the led workqueue is destroyed in the remove
> callback, before the led device is unregistered from the led subsystem.
> 
> This leads to a NULL pointer derefence when the led device is
> unregistered automatically later as part of the module removal cleanup.
> Bellow is the backtrace showing the problem.
> 

Thanks João Paulo,
...

> Unregistering the led device on the remove callback before destroying the
> workqueue avoids this problem.
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=196097
> 
> Reported-by: Dun Hum <bitter.taste@gmx.com>
> Signed-off-by: João Paulo Rechi Vita <jprvita@endlessm.com>
> ---
>  drivers/platform/x86/asus-wireless.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/asus-wireless.c b/drivers/platform/x86/asus-wireless.c
> index 343e12547660..ecd715c82de5 100644
> --- a/drivers/platform/x86/asus-wireless.c
> +++ b/drivers/platform/x86/asus-wireless.c
> @@ -181,6 +181,7 @@ static int asus_wireless_remove(struct acpi_device *adev)
>  {
>  	struct asus_wireless_data *data = acpi_driver_data(adev);
>  
> +	devm_led_classdev_unregister(&adev->dev, &data->led);
>  	if (data->wq)
>  		destroy_workqueue(data->wq);
>  	return 0;

asus_wireless_add only calls devm_led_classdev_register() iff the workqueue is
successfully created. It seems like it would make sense to move the
devm_led_classdev_unregister() call within the 'if (data->wq)' condition block.

This should also cc stable.

Thanks,

-- 
Darren Hart
VMware Open Source Technology Center
