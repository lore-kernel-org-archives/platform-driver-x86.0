From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v11 05/10] test_firmware: add support for
 firmware_request_platform
Date: Mon, 13 Jan 2020 16:22:36 +0100
Message-ID: <54f70265-265b-ad23-7d2d-af0b27ab1475@redhat.com>
References: <20200111145703.533809-1-hdegoede@redhat.com>
 <20200111145703.533809-6-hdegoede@redhat.com>
 <20200113145328.GA11244@42.do-not-panic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <20200113145328.GA11244@42.do-not-panic.com>
Content-Language: en-US
Sender: linux-input-owner@vger.kernel.org
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Peter Jones <pjones@redhat.com>, Dave Olsthoorn <dave@bewaar.me>, x86@kernel.org, platform-driver-x86@vger.kernel.org, linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-input@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 13-01-2020 15:53, Luis Chamberlain wrote:
> On Sat, Jan 11, 2020 at 03:56:58PM +0100, Hans de Goede wrote:
>> Add support for testing firmware_request_platform through a new
>> trigger_request_platform trigger.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Changes in v11:
>> - Drop a few empty lines which were accidentally introduced
> 
> But you didn't address my other feedback.
> 
>> --- a/lib/test_firmware.c
>> +++ b/lib/test_firmware.c
>> @@ -507,6 +508,61 @@ static ssize_t trigger_request_store(struct device *dev,
>>   }
>>   static DEVICE_ATTR_WO(trigger_request);
>>   
>> +#ifdef CONFIG_EFI_EMBEDDED_FIRMWARE
>> +static ssize_t trigger_request_platform_store(struct device *dev,
>> +					      struct device_attribute *attr,
>> +					      const char *buf, size_t count)
>> +{
>> +	static const u8 test_data[] = {
>> +		0x55, 0xaa, 0x55, 0xaa, 0x01, 0x02, 0x03, 0x04,
>> +		0x55, 0xaa, 0x55, 0xaa, 0x05, 0x06, 0x07, 0x08,
>> +		0x55, 0xaa, 0x55, 0xaa, 0x10, 0x20, 0x30, 0x40,
>> +		0x55, 0xaa, 0x55, 0xaa, 0x50, 0x60, 0x70, 0x80
>> +	};
>> +	struct efi_embedded_fw fw;
>> +	int rc;
>> +	char *name;
>> +
>> +	name = kstrndup(buf, count, GFP_KERNEL);
>> +	if (!name)
>> +		return -ENOSPC;
>> +
>> +	pr_info("inserting test platform fw '%s'\n", name);
>> +	fw.name = name;
>> +	fw.data = (void *)test_data;
>> +	fw.length = sizeof(test_data);
>> +	list_add(&fw.list, &efi_embedded_fw_list);
>> +
>> +	pr_info("loading '%s'\n", name);
>> +
> 
> I mentioned this in my last review, and it seems you forgot to address
> this.

I did address this in my reply to your review, as explained there,
the check + free on test_firmware before calling firmware_request_platform()
is necessary because test_firmware may be non NULL when entering
the function (continued below) ...

> But now some more feedback:
> 
> These two:
> 
>> +	mutex_lock(&test_fw_mutex);
>> +	release_firmware(test_firmware);
> 
> You are doing this because this is a test, but a typical driver will
> do this after, and we don't loose anything in doing this after. Can you
> move the mutex lock and assign the pointer to a temporary used pointer
> for the call, *after* your call.
> 
> But since your test is not using any interfaces to query information
> about the firmware, and you are just doing the test in C code right
> away, instead of say, using a trigger for later use in userspace,
> you can just do away with the mutex lock and make the call use its
> own pointer:
> 
> 	rc = firmware_request_platform(&tmp_test_firmware, name, dev);
> 	if (rc) {
> 		...
> 	}
> 	/* Your test branch code goes here */
> 
> I see no reason why you use the test_firmware pointer.

I agree that using a private/local firmware pointer instead of
test_firmware and dropping the mutex calls is better. I will make
this change for v12 of this series.

I'll send out a v12 once the remarks from Andy Lutomirski's
have also been discussed.

Regards,

Hans


> 
>> +	test_firmware = NULL;
>> +	rc = firmware_request_platform(&test_firmware, name, dev);
>> +	if (rc) {
>> +		pr_info("load of '%s' failed: %d\n", name, rc);
>> +		goto out;
>> +	}
>> +	if (test_firmware->size != sizeof(test_data) ||
>> +	    memcmp(test_firmware->data, test_data, sizeof(test_data)) != 0) {
>> +		pr_info("firmware contents mismatch for '%s'\n", name);
>> +		rc = -EINVAL;
>> +		goto out;
>> +	}
>> +	pr_info("loaded: %zu\n", test_firmware->size);
>> +	rc = count;
>> +
>> +out:
>> +	mutex_unlock(&test_fw_mutex);
>> +
>> +	list_del(&fw.list);
>> +	kfree(name);
>> +
>> +	return rc;
>> +}
> 
