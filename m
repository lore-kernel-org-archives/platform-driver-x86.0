From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] platform: x86: Add ACPI driver for ChromeOS
Date: Sun, 22 Mar 2020 12:10:22 +0100
Message-ID: <20200322111022.GA72939@kroah.com>
References: <20200322094334.1872663-1-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200322094334.1872663-1-enric.balletbo@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: linux-kernel@vger.kernel.org, vbendeb@chromium.org, groeck@chromium.org, bleung@chromium.org, dtor@chromium.org, gwendal@chromium.org, andy@infradead.org, Collabora Kernel ML <kernel@collabora.com>, Ayman Bagabas <ayman.bagabas@gmail.com>, Darren Hart <dvhart@infradead.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jeremy Soller <jeremy@system76.com>, Mattias Jacobsson <2pi@mok.nu>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Rajat Jain <rajatja@google.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Yauhen Kharuzhy <jekhor@gmail.com>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Mar 22, 2020 at 10:43:34AM +0100, Enric Balletbo i Serra wrote:
> This driver attaches to the ChromeOS ACPI device and then exports the values
> reported by the ACPI in a sysfs directory. The ACPI values are presented in
> the string form (numbers as decimal values) or binary blobs, and can be
> accessed as the contents of the appropriate read only files in the sysfs
> directory tree originating in /sys/devices/platform/chromeos_acpi.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

What is wrong with the "default" ACPI sysfs access?  Why do you need a
special driver just for this specific ACPI firmware?

Also, you forgot to add Documentation/ABI/ entries for your new files :(

> +config ACPI_CHROMEOS
> +	tristate "ChromeOS specific ACPI extensions"
> +	depends on ACPI
> +	depends on CHROME_PLATFORMS

No BUILD_TEST?


> +static void
> +chromeos_acpi_remove_attribs(struct chromeos_acpi_attribute_group *aag)
> +{
> +	struct chromeos_acpi_attribute *attr, *tmp_attr;
> +
> +	list_for_each_entry_safe(attr, tmp_attr, &aag->attribs, list) {
> +		sysfs_remove_bin_file(aag->kobj, &attr->bin_attr);

Attribute groups are your friend, do not do this "by hand".

> +		kfree(attr->name);
> +		kfree(attr->data);
> +		kfree(attr);
> +	}
> +}
> +
> +/**
> + * chromeos_acpi_add_group() - Create a sysfs group including attributes
> + *			       representing a nested ACPI package.
> + *
> + * @obj: Package contents as returned by ACPI.
> + * @name: Name of the group.
> + * @num_attrs: Number of attributes of this package.
> + * @index: Index number of this particular group.
> + *
> + * The created group is called @name in case there is a single instance, or
> + * @name.@index otherwise.
> + *
> + * All group and attribute storage allocations are included in the lists for
> + * tracking of allocated memory.
> + *
> + * Return: 0 on success, negative errno on failure.
> + */
> +static int chromeos_acpi_add_group(union acpi_object *obj, char *name,
> +				   int num_attrs, int index)
> +{
> +	struct device *dev = &chromeos_acpi.pdev->dev;
> +	struct chromeos_acpi_attribute_group *aag;
> +	union acpi_object *element;
> +	int i, count, ret;
> +
> +	aag = kzalloc(sizeof(*aag), GFP_KERNEL);
> +	if (!aag)
> +		return -ENOMEM;
> +
> +	aag->name = chromeos_acpi_alloc_name(name, num_attrs, index);
> +	if (!aag->name) {
> +		ret = -ENOMEM;
> +		goto free_group;
> +	}
> +
> +	aag->kobj = kobject_create_and_add(aag->name, &dev->kobj);

By using "raw" kobjects, you just now prevented any userspace tool from
seeing these attributes (like udev).  Not nice :(

Why, if you really really have to do this, are you not just using
"normal" struct device attributes instead?

> +static int __init chromeos_acpi_init(void)
> +{
> +	int ret;
> +
> +	chromeos_acpi.pdev = platform_device_register_simple("chromeos_acpi",
> +						PLATFORM_DEVID_NONE, NULL, 0);
> +	if (IS_ERR(chromeos_acpi.pdev)) {
> +		pr_err("unable to register chromeos_acpi platform device\n");
> +		return PTR_ERR(chromeos_acpi.pdev);
> +	}

Only use platform devices and drivers for things that are actually
platform devices and drivers.  That's not what this is, it is an ACPI
device and driver.  Don't abuse the platform interface please.

thanks,

greg k-h
