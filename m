From: Alex Hung <alex.hung@canonical.com>
Subject: Re: [PATCH v2] dell-rbtn: Ignore ACPI notifications if device is suspended
Date: Mon, 14 Mar 2016 15:55:11 +0800
Message-ID: <CAJ=jquZn=aTmKiYrk3+ofBB-+Lz=GMJ+uLSYcaar=A1OVBGriA@mail.gmail.com>
References: <1457740175-8327-1-git-send-email-gabriele.mzt@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-vk0-f44.google.com ([209.85.213.44]:36521 "EHLO
	mail-vk0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751251AbcCNHzM (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 14 Mar 2016 03:55:12 -0400
Received: by mail-vk0-f44.google.com with SMTP id c3so198684787vkb.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Mar 2016 00:55:11 -0700 (PDT)
In-Reply-To: <1457740175-8327-1-git-send-email-gabriele.mzt@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, "Jared_Dominguez@dell.com" <Jared_Dominguez@dell.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, arvidjaar@gmail.com, linux-kernel@vger.kernel.org

I tried this patch on a Latitude with ACPI Device with DELLABCE and
this patch fixes the problem.

Tested-by: Alex Hung <alex.hung@canonical.com>

On Sat, Mar 12, 2016 at 7:49 AM, Gabriele Mazzotta
<gabriele.mzt@gmail.com> wrote:
> Some BIOSes unconditionally send an ACPI notification to RBTN when the
> system is resuming from suspend. This makes dell-rbtn send an input
> event to userspace as if a function key was pressed. Prevent this by
> ignoring all the notifications received while the device is suspended.
>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=106031
> Signed-off-by: Gabriele Mazzotta <gabriele.mzt@gmail.com>
> ---
>  drivers/platform/x86/dell-rbtn.c | 41 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>
> diff --git a/drivers/platform/x86/dell-rbtn.c b/drivers/platform/x86/dell-rbtn.c
> index cd410e3..56b0da7 100644
> --- a/drivers/platform/x86/dell-rbtn.c
> +++ b/drivers/platform/x86/dell-rbtn.c
> @@ -28,6 +28,7 @@ struct rbtn_data {
>         enum rbtn_type type;
>         struct rfkill *rfkill;
>         struct input_dev *input_dev;
> +       bool suspended;
>  };
>
>
> @@ -220,9 +221,44 @@ static const struct acpi_device_id rbtn_ids[] = {
>         { "", 0 },
>  };
>
> +#ifdef CONFIG_PM_SLEEP
> +static void ACPI_SYSTEM_XFACE rbtn_acpi_clear_flag(void *context)
> +{
> +       struct rbtn_data *rbtn_data = context;
> +
> +       rbtn_data->suspended = false;
> +}
> +
> +static int rbtn_suspend(struct device *dev)
> +{
> +       struct acpi_device *device = to_acpi_device(dev);
> +       struct rbtn_data *rbtn_data = acpi_driver_data(device);
> +
> +       rbtn_data->suspended = true;
> +
> +       return 0;
> +}
> +
> +static int rbtn_resume(struct device *dev)
> +{
> +       struct acpi_device *device = to_acpi_device(dev);
> +       struct rbtn_data *rbtn_data = acpi_driver_data(device);
> +       acpi_status status;
> +
> +       status = acpi_os_execute(OSL_NOTIFY_HANDLER,
> +                        rbtn_acpi_clear_flag, rbtn_data);
> +       if (ACPI_FAILURE(status))
> +               rbtn_data->suspended = false;
> +
> +       return 0;
> +}
> +#endif
> +static SIMPLE_DEV_PM_OPS(rbtn_pm_ops, rbtn_suspend, rbtn_resume);
> +
>  static struct acpi_driver rbtn_driver = {
>         .name = "dell-rbtn",
>         .ids = rbtn_ids,
> +       .drv.pm = &rbtn_pm_ops,
>         .ops = {
>                 .add = rbtn_add,
>                 .remove = rbtn_remove,
> @@ -384,6 +420,11 @@ static void rbtn_notify(struct acpi_device *device, u32 event)
>  {
>         struct rbtn_data *rbtn_data = device->driver_data;
>
> +       if (rbtn_data->suspended) {
> +               dev_dbg(&device->dev, "ACPI notification ignored\n");
> +               return;
> +       }
> +
>         if (event != 0x80) {
>                 dev_info(&device->dev, "Received unknown event (0x%x)\n",
>                          event);
> --
> 2.7.0
>



-- 
Cheers,
Alex Hung
