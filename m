From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH v4] platform: x86: Add ACPI driver for ChromeOS
Date: Fri, 24 Apr 2020 16:43:09 +0200
Message-ID: <0f3d5b72-8ff2-ce9c-e4d5-e8e301aece9f@collabora.com>
References: <20200413134611.478441-1-enric.balletbo@collabora.com>
 <20200413141259.GA3458877@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <20200413141259.GA3458877@kroah.com>
Content-Language: en-US
Sender: linux-acpi-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Collabora Kernel ML <kernel@collabora.com>, groeck@chromium.org, bleung@chromium.org, dtor@chromium.org, gwendal@chromium.org, vbendeb@chromium.org, andy@infradead.org, Ayman Bagabas <ayman.bagabas@gmail.com>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, =?UTF-8?Q?Bla=c5=be_Hrastnik?= <blaz@mxxn.io>, Darren Hart <dvhart@infradead.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Jeremy Soller <jeremy@system76.com>, Mattias Jacobsson <2pi@mok.nu>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Rajat Jain <rajatja@google.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Hi Greg,

Thank you for your comments, some answers below.

On 13/4/20 16:12, Greg Kroah-Hartman wrote:
> Meta-comment to the ACPI developers, shouldn't all of this happen
> "automatically" with the existing ACPI entries in sysfs?  If not, is
> this driver the proper way to do this?
> 

This is something maintainers didn't answer yet, and I am not sure, to be hones,
but meanwhile, I'll rework this driver fixing the Greg comments and send a new
version.

> Minor review comments below:
> 
> 
> On Mon, Apr 13, 2020 at 03:46:11PM +0200, Enric Balletbo i Serra wrote:
>> +What:		/sys/bus/acpi/devices/GGL0001:00/BINF.{0,1,4}
>> +Date:		April 2020
>> +KernelVersion:	5.8
>> +Description:
>> +		This file is reserved and doesn't shows useful information
>> +		for now.
> 
> Then do not even have it present.  sysfs should never export files that
> nothing can be done with them, userspace "knows" that if a file is not
> present, it can not use it.  Bring it back when it is useful.
> 

Makes sense. I'll do in next version.

>> +What:		/sys/bus/acpi/devices/GGL0001:00/MECK
>> +Date:		April 2020
>> +KernelVersion:	5.8
>> +Description:
>> +		This binary file returns the SHA-1 or SHA-256 hash that is
>> +		read out of the Management Engine extend registers during
>> +		boot. The hash is exported vi ACPI so the OS can verify that
>> +		the Management Engine firmware has not changed. If Management
>> +		Engine is not present, or if the firmware was unable to read the
>> +		extend registers, this buffer can be zero.
> 
> The size is zero, or the contents are 0?
> 

The size. I'll reword in the description,

>> +static char *chromeos_acpi_alloc_name(char *name, int count, int index)
>> +{
>> +	char *str;
>> +
>> +	if (count == 1)
>> +		str = kstrdup(name, GFP_KERNEL);
>> +	else
>> +		str = kasprintf(GFP_KERNEL, "%s.%d", name, index);
> 
> That's crazy, make this more obvious that "count" affects the name so
> much.  As it is, no one would know this unless they read the function
> code, and not just the name.
> 

I see, let me think about this.

> 
>> +/**
>> + * chromeos_acpi_add_group() - Create a sysfs group including attributes
>> + *			       representing a nested ACPI package.
>> + *
>> + * @adev: ACPI device.
>> + * @obj: Package contents as returned by ACPI.
>> + * @name: Name of the group.
>> + * @num_attrs: Number of attributes of this package.
>> + * @index: Index number of this particular group.
>> + *
>> + * The created group is called @name in case there is a single instance, or
>> + * @name.@index otherwise.
>> + *
>> + * All group and attribute storage allocations are included in the lists for
>> + * tracking of allocated memory.
>> + *
>> + * Return: 0 on success, negative errno on failure.
>> + */
> 
> Meta-comment, no need for kerneldoc on static functions.  It's nice to
> see, but nothing is going to notice them...
> 
>> +static int chromeos_acpi_add_method(struct acpi_device *adev, char *name)
>> +{
>> +	struct device *dev = &adev->dev;
>> +	struct acpi_buffer output;
>> +	union acpi_object *obj;
>> +	acpi_status status;
>> +	int ret = 0;
>> +
>> +	output.length = ACPI_ALLOCATE_BUFFER;
>> +
>> +	status = acpi_evaluate_object(adev->handle, name, NULL, &output);
>> +	if (ACPI_FAILURE(status)) {
>> +		dev_err(dev, "failed to retrieve %s (%d)\n", name, status);
>> +		return status;
>> +	}
>> +
>> +	obj = output.pointer;
>> +	if (obj->type == ACPI_TYPE_PACKAGE)
>> +		ret = chromeos_acpi_handle_package(adev, obj, name);
>> +
>> +	kfree(output.pointer);
> 
> Why the need for 'obj' at all in this function?  Minor nit.
> 

Ok, I'll remove obj.

>> +
>> +	return ret;
>> +}
>> +
>> +static int chromeos_acpi_device_add(struct acpi_device *adev)
>> +{
>> +	struct chromeos_acpi_attribute_group *aag = chromeos_acpi.root;
>> +	struct device *dev = &adev->dev;
>> +	int i, ret;
>> +
>> +	aag = kzalloc(sizeof(*aag), GFP_KERNEL);
>> +	if (!aag)
>> +		return -ENOMEM;
>> +
>> +	INIT_LIST_HEAD(&aag->attribs);
>> +	INIT_LIST_HEAD(&aag->list);
>> +	INIT_LIST_HEAD(&chromeos_acpi.groups);
>> +
>> +	chromeos_acpi.root = aag;
>> +
>> +	/*
>> +	 * Attempt to add methods by querying the device's MLST method
>> +	 * for the list of methods.
>> +	 */
>> +	if (!chromeos_acpi_process_mlst(adev))
>> +		return 0;
>> +
>> +	dev_info(dev, "falling back to default list of methods\n");
> 
> Is this debugging code left over?  If not, make it an error, and what
> would a user be able to do with it?
> 

I think I can downgrade to debug level.

Thanks,
 Enric

> thanks,
> 
> greg k-h
> 
