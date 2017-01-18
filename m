From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: surface3-wmi: fix uninitialized symbol
Date: Wed, 18 Jan 2017 21:01:44 +0200
Message-ID: <CAHp75Vd_xMLHWr6i_w6XWLM3=imgmJNSe_e4QzZbbZ8ixrmBQg@mail.gmail.com>
References: <20170118081346.8451-1-benjamin.tissoires@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170118081346.8451-1-benjamin.tissoires@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Dan Carpenter <dan.carpenter@oracle.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jan 18, 2017 at 10:13 AM, Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
> The patch 3dda3b3798f9: "platform/x86: Add custom surface3 platform
> device for controlling LID" from Nov 25, 2016, leads to the following
> static checker warning:
>
>         drivers/platform/x86/surface3-wmi.c:168 s3_wmi_check_platform_device()
>         error: uninitialized symbol 'ts_adev'.
>

Pushed to fixes, thanks!

> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> ---
>
> Hi Dan,
>
> Sorry for the lag in treating this simple defect.
>
> Cheers,
> Benjamin
>
>  drivers/platform/x86/surface3-wmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/surface3-wmi.c b/drivers/platform/x86/surface3-wmi.c
> index cbf4d83..676cfca 100644
> --- a/drivers/platform/x86/surface3-wmi.c
> +++ b/drivers/platform/x86/surface3-wmi.c
> @@ -139,7 +139,7 @@ static acpi_status s3_wmi_attach_spi_device(acpi_handle handle,
>
>  static int s3_wmi_check_platform_device(struct device *dev, void *data)
>  {
> -       struct acpi_device *adev, *ts_adev;
> +       struct acpi_device *adev, *ts_adev = NULL;
>         acpi_handle handle;
>         acpi_status status;
>
> --
> 2.9.3
>



-- 
With Best Regards,
Andy Shevchenko
