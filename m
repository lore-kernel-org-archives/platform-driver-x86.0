From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 1/8] platform/x86: fujitsu-laptop: move backlight input
 device setup to a separate function
Date: Wed, 29 Mar 2017 12:54:15 -0700
Message-ID: <20170329195415.GC15472@localhost.localdomain>
References: <20170320093224.18541-1-kernel@kempniu.pl>
 <20170320093224.18541-2-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170320093224.18541-2-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Jonathan Woithe <jwoithe@just42.net>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Mar 20, 2017 at 10:32:17AM +0100, Michał Kępień wrote:
> Simplify error handling in acpi_fujitsu_bl_add() by moving code
> responsible for setting up the input device to a separate function.

Modularization is nice, two minor nits/questions below:

> 
> Signed-off-by: Michał Kępień <kernel@kempniu.pl>
> ---
>  drivers/platform/x86/fujitsu-laptop.c | 64 +++++++++++++++++++++--------------
>  1 file changed, 38 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
> index f3ccef3d5a1e..2b0dcf989e2a 100644
> --- a/drivers/platform/x86/fujitsu-laptop.c
> +++ b/drivers/platform/x86/fujitsu-laptop.c
> @@ -590,6 +590,41 @@ static const struct dmi_system_id fujitsu_dmi_table[] __initconst = {
>  
>  /* ACPI device for LCD brightness control */
>  
> +static int acpi_fujitsu_bl_input_setup(struct acpi_device *device)
> +{
> +	struct fujitsu_bl *fujitsu_bl = acpi_driver_data(device);
> +	struct input_dev *input;
> +	int error;
> +
> +	fujitsu_bl->input = input = input_allocate_device();
> +	if (!input)
> +		return -ENOMEM;
> +
> +	snprintf(fujitsu_bl->phys, sizeof(fujitsu_bl->phys),
> +		 "%s/video/input0", acpi_device_hid(device));
> +
> +	input->name = acpi_device_name(device);
> +	input->phys = fujitsu_bl->phys;
> +	input->id.bustype = BUS_HOST;
> +	input->id.product = 0x06;
> +	input->dev.parent = &device->dev;
> +	input->evbit[0] = BIT(EV_KEY);
> +	set_bit(KEY_BRIGHTNESSUP, input->keybit);
> +	set_bit(KEY_BRIGHTNESSDOWN, input->keybit);
> +	set_bit(KEY_UNKNOWN, input->keybit);
> +
> +	error = input_register_device(input);
> +	if (error)
> +		goto err_free_input_dev;
> +
> +	return 0;
> +
> +err_free_input_dev:
> +	input_free_device(input);

This leaves fujitsu_bl->input pointing at freed memory. Can this be assigned
only after successful registration? If not, it would be cleaner to NULL it on
failure.

> +
> +	return error;

This return path could be cleaned up a bit:

	error = input_register_device(input);
	if (error)
		input_free_device(input);

	return error;

But, this driver uses this "error/return 0" pattern pretty consistently, whereas
most of the kernel uses ret instead of error, and will return ret on success and
failure, relying on it being 0 in the successful case. Over the whole driver,
we'd save several lines with the conversion and be more consistent with the rest
of the kernel. But, local consistency is important too. Jonathan, do you have a
preference for this driver?

-- 
Darren Hart
VMware Open Source Technology Center
