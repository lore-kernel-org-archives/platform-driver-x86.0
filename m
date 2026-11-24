Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795506286;
	b=ETTyGYnatg/Ga92bpKEurMyYK8vD4e+zAEZkKjgy9IpfgCWTMN0vrMXGljghBrBqDAtJ
	 6ZJ9jsDrC7B1gep12dm+72NGZzO5CPyEnyZr7i8vlf3+IdnjKE8HMJZB/V4660d6kMNy+
	 Mt9/uhriWUUEHJWeCOvNPSmF7wgt2vS6ONNHKyylZj3vsJEMYlVhaaa/K8FMxo/mnD0Y6
	 yvzzCHoj86kLfp60wqAl50fIVI6VocMbIyUDq/YIAiA8nQ0Fy5xyu+qRQuvlZvxI6UGYs
	 E8klqiPDDGxXprXzWj1PNPBBHeibaB4RpYjsE3HVVbyANe5uER5tGDonuX7YRGSQ56Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506286;
	h=DMARC-Filter:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=7p+204KUb5GSyd+xtDxqdDVjNrl4AxCJM7RsXDWrElo=;
	b=VxV2RoyGFXwYrvT3V4UOO/okYiOyzipwYASFirtjMby+GovTW+QchkFtkuakDwxiCAr5
	 c3yuW7Vat+s0WEoHYtsCaw4soKufEVzF5Z5okbcgilYIg1+7G+wyQESM3UTLuaDD0erK5
	 Ya/eOJWcaT/iE4KFmm14PS0u0cVj3N39fleFjajeARmsjX1tm7VbNVRCi9/9ZOrmZMTrJ
	 BjRyYFSS9FWZQ63klzduQcygROePC8RV9aWEDFySUef0AzOyGkWeBVaNn6/9fiDDYlepA
	 WUdMAnvZtztWBdvhhBZcr3XTFyhaucbdCHXSteAXLTjvutqfO4AnRzYHUduXdnKNkyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="AZ/eOOSV";
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A788606A327;
	Tue, 24 Nov 2026 07:44:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A788606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=AZ/eOOSV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=7p+204KUb5GSyd+xtDxqdDVjNrl4AxCJM7RsXDWrElo=;
	b=AZ/eOOSV1MTLaT6DWy0Ge+6ZW3wKSrLoeN+zb5Iqgijsk0Buw8iJSNzm06T8M7
	vEXv4enz16CTvvf6ZSd6tr4Iacy1woAoCBQfNZDvuXMVhEw6usLJP309YBBYgiTR
	NQagU9D2AtR2z1pnmZtbtizNfJ7O8QwqrLK8OnHJgBQoE=
Message-ID: <63c35a46-41ea-4028-b3b9-54a46ea31af3@163.com>
Date: Tue, 24 Nov 2026 15:39:23 +0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: lenovo-wmi-other: Add raw
 GetDataByPackage interface
To: Rong Zhang <i@rong.moe>, platform-driver-x86@vger.kernel.org
Cc: mpearson-lenovo@squebb.ca, derekjohn.clark@gmail.com, W_Armin@gmx.de,
 corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261116040532.154928-1-alanpluto@163.com>
 <20261123061120.18740-1-alanpluto@163.com>
 <fcabaf8647e0c1ab487cd612d5a290082613ec0b.camel@rong.moe>
 <5b327bf279357b68b91ec66b465501a2760b23eb.camel@rong.moe>
Content-Language: en-US
From: Alan <alanpluto@163.com>
In-Reply-To: <5b327bf279357b68b91ec66b465501a2760b23eb.camel@rong.moe>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgB3_uXSPwVrExwLHA--.59895S2
X-Coremail-Antispam: 1Uf129KBjvAXoW3Zw4xCry8XFy3Gry3Jr1xuFg_yoW8Xry7Wo
	WftFs3Ww1xtr1UAr4UA347AasFga48Wr1DXFWYyrsxJa1jy3W5urW3Wa1fGay5KFyrKr4D
	Was7Jr4FvFW0qr1rn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxBHqUUUUU
X-CM-SenderInfo: hdod01poxw0qqrwthudrp/xtbC0hMgFGsFP9PB7gAA3Y

Hi Rong,

On 11/23/2026 8:34 PM, Rong Zhang wrote:
> Hi Alan,
> 
> On Mon, 2026-11-23 at 20:21 +0800, Rong Zhang wrote:
>> Hi Alan,
>>
>> On Mon, 2026-11-23 at 14:11 +0800, Alan Pluto wrote:
>>> Lenovo's userspace utility uses the Other Mode WMI GetDataByPackage
>>
>> What's the purpose of the utility? Could you provide some context? You
>> can ignore this question if it's confidential, but in general providing
>> necessary context can help maintainers and reviewers learn about the
>> intent.
>>
>>> method (99) to check device readiness. Expose the method through debugfs
>>> so the firmware request and response can be inspected on Linux without
>>> adding a stable userspace ABI.
>>>
>>> The interface is disabled by default and can be enabled by passing
>>> enable_get_data_by_package=1 when loading the module.
>>>
>>> Signed-off-by: Alan Pluto <alanpluto@163.com>
>>> ---
>>> Changes in v2:
>>> - Replace the character device with a debugfs file, disabled by default.
>>> - Allow one open per WMI device and require a single read for the response.
>>> - Use scoped locks, lockdep checks, automatic buffer cleanup, and the
>>>   WMI helper's minimum response size check.
>>>
>>>  Documentation/wmi/devices/lenovo-wmi-other.rst |  12 +-
>>>  drivers/platform/x86/lenovo/wmi-other.c        | 208 +++++++++++++++++++++++++
>>>  2 files changed, 219 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documentation/wmi/devices/lenovo-wmi-other.rst
>>> index 011054d64eac5b601333373c4d405f9c5117ffc2..42e1525a8852bd7c8ddc04cc4047b1f09c5b770f 100644
>>> --- a/Documentation/wmi/devices/lenovo-wmi-other.rst
>>> +++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
>>> @@ -33,6 +33,15 @@ under the following path:
>>>  
>>>  Additionally, this driver also exports attributes to HWMON.
>>>  
>>> +GetDataByPackage diagnostics
>>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> Missing a ~
>>
>>> +
>>> +The driver does not create the diagnostic file by default. To enable it,
>>> +pass ``enable_get_data_by_package=1`` when loading ``lenovo-wmi-other``.
>>> +The file is at ``lenovo_wmi/<WMI device>/get_data_by_package``.
>>> +Not all devices support the method. Use only commands whose behavior and
>>> +side effects are understood.
>>> +
>>>  LENOVO_CAPABILITY_DATA_00
>>>  -------------------------
>>>  
>>> @@ -107,7 +116,8 @@ WMI interface description
>>>  =========================
>>>  
>>>  The WMI interface description can be decoded from the embedded binary MOF (bmof)
>>> -data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
>>> +data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility. This older
>>> +example lists ``Max(40)`` for GetDataByPackage; newer firmware uses 100 bytes.
>>
>> ??? Could you move the sentence to the right place?
>>
>>>  
>>>  ::
>>>  
>>> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
>>> index bd64e7b44669db684145298ae088dd2c7f539d29..827b4215c612fbfc052bbadff0672e68e65517f0 100644
>>> --- a/drivers/platform/x86/lenovo/wmi-other.c
>>> +++ b/drivers/platform/x86/lenovo/wmi-other.c
>>> @@ -27,13 +27,16 @@
>>>   */
>>>  
>>>  #include <linux/acpi.h>
>>> +#include <linux/atomic.h>
>>>  #include <linux/bitfield.h>
>>>  #include <linux/cleanup.h>
>>>  #include <linux/component.h>
>>>  #include <linux/container_of.h>
>>> +#include <linux/debugfs.h>
>>>  #include <linux/device.h>
>>>  #include <linux/export.h>
>>>  #include <linux/firmware_attributes.h>
>>> +#include <linux/fs.h>
>>>  #include <linux/gfp_types.h>
>>>  #include <linux/hwmon.h>
>>>  #include <linux/idr.h>
>>> @@ -41,9 +44,12 @@
>>>  #include <linux/kobject.h>
>>>  #include <linux/limits.h>
>>>  #include <linux/module.h>
>>> +#include <linux/mutex.h>
>>>  #include <linux/platform_profile.h>
>>>  #include <linux/power_supply.h>
>>> +#include <linux/slab.h>
>>>  #include <linux/types.h>
>>> +#include <linux/uaccess.h>
>>>  #include <linux/wmi.h>
>>>  
>>>  #include <acpi/battery.h>
>>> @@ -90,6 +96,8 @@ enum lwmi_feature_id_psu {
>>>  
>>>  #define LWMI_FEATURE_VALUE_GET 17
>>>  #define LWMI_FEATURE_VALUE_SET 18
>>> +#define LWMI_DATA_PACKAGE_GET 99
>>> +#define LWMI_DATA_PACKAGE_INPUT_MAX 100
>>>  
>>>  #define LWMI_FAN_ID_BASE 1
>>>  #define LWMI_FAN_NR 4
>>> @@ -141,6 +149,8 @@ struct lwmi_om_priv {
>>>  	struct device *fw_attr_dev;
>>>  	struct kset *fw_attr_kset;
>>>  	struct wmi_device *wdev;
>>> +	struct dentry *debugfs_dir;
>>> +	atomic_t package_opened;
>>>  	int ida_id;
>>>  
>>>  	struct lwmi_fan_info fan_info[LWMI_FAN_NR];
>>> @@ -156,6 +166,23 @@ struct lwmi_om_priv {
>>>  	bool bh_registered;
>>>  };
>>>  
>>> +struct lwmi_package_response {
>>> +	__le32 data_size;
>>> +	u8 data[];
>>> +};
>>
>> Even though there is no gap between data_size and data, please add a
>> __packed annotation to clearly indicate your intent.
>>
>>> +
>>> +struct lwmi_package_file {
>>> +	struct lwmi_om_priv *priv;
>>> +	/* Protects the pending response on shared descriptors. */
>>> +	struct mutex lock;
>>> +	struct lwmi_package_response *response;
>>> +	size_t response_len;
>>> +};
>>> +
>>> +static bool enable_get_data_by_package;
>>> +module_param(enable_get_data_by_package, bool, 0400);
>>> +MODULE_PARM_DESC(enable_get_data_by_package, "Enable the GetDataByPackage debugfs interface");
>>> +
>>>  /*
>>>   * Visibility of fan channels:
>>>   *
>>> @@ -1611,6 +1638,174 @@ static void lwmi_om_fw_attr_remove(struct lwmi_om_priv *priv)
>>>  
>>>  /* ======== Self (master: lenovo-wmi-other) ======== */
>>>  
>>> +static int lwmi_package_open(struct inode *inode, struct file *file)
>>> +{
>>> +	struct lwmi_om_priv *priv = inode->i_private;
>>> +	struct lwmi_package_file *state __free(kfree) = NULL;
>>
>> The declarations of __free() pointers should be placed at where it's
>> allocated, i.e., ...
>>
>>> +
>>> +	if ((file->f_mode & (FMODE_READ | FMODE_WRITE)) != (FMODE_READ | FMODE_WRITE))
>>> +		return -EINVAL;
>>> +
>>> +	state = kzalloc_obj(*state);
>>
>> ...here.
>>
>> Meanwhile, opening the file while priv->package_opened == 1 allocates
>> memory in vain. Could you move it below the package_opened check? In this
>> manner you don't need the __free() either.
>>
>>> +	if (!state)
>>> +		return -ENOMEM;
>>> +
>>> +	if (atomic_cmpxchg(&priv->package_opened, 0, 1))
>>
>> atomic_cmpxchg_acquire()
>>
>>> +		return -EBUSY;
>>> +
>>> +	mutex_init(&state->lock);
>>> +	state->priv = priv;
>>> +	file->private_data = no_free_ptr(state);
>>> +
>>> +	return stream_open(inode, file);
>>> +}
>>> +
>>> +static int lwmi_package_release(struct inode *inode, struct file *file)
>>> +{
>>> +	struct lwmi_package_file *state = file->private_data;
>>> +	struct dentry *dentry = file->f_path.dentry;
>>> +
>>> +	kfree_sensitive(state->response);
>>
>> You didn't explain what data it is in your replies. "Can contain
>> sensitive data" is not an acceptable explanation.
>>
>> Please grep the occurrence of kfree_sensitive() in the kernel tree, and
>> you'll find that they are mostly credentials. Does the data passed by the
>> interface fall into the same category? 
>>
>> TBH, anything goes through WMI is *never* secret. If a manufacturer ever
>> decided to use it to deliver "sensitive" data, it either misunderstood
>> the word or chose the wrong interface.
>>
>> An ACPI-WMI method goes through the ACPICA, then the WMI core, and
>> finally here. The former two's temporary buffers are either on stack or
>> freed by the vanilla kfree(). If leaking "sensitive" response were really
>> a concern, it must had been leaked before it reached your code.
>>
>> Please don't use kfree_sensitive() unless you really understand the data
>> flow path and have a strong reason to use it. If you insist on it, please
>> answer both questions.
>>
>>> +	mutex_destroy(&state->lock);
>>> +
>>> +	/* Unlike read and write, release can run after debugfs removal. */
>>
>> The comment is not helpful, as it's just repeating well-known knowledge.
>> Please explain what it protects:
>>
>>    The release() callback may be called after state->priv has been freed.
>>    Only when the debugfs file hasn't been removed is the pointer valid.
>>
>>> +	if (!debugfs_file_get(dentry)) {
>>> +		atomic_set(&state->priv->package_opened, 0);
>>
>> atomic_set_release()
>>
>>> +		debugfs_file_put(dentry);
>>> +	}
>>> +
>>> +	kfree(state);
>>> +	return 0;
>>> +}
>>> +
>>> +static int lwmi_package_invoke(struct lwmi_package_file *state, u8 *data)
>>> +{
>>> +	struct lwmi_om_priv *priv = state->priv;
>>> +	struct wmi_buffer input = { .length = LWMI_DATA_PACKAGE_INPUT_MAX, .data = data };
>>> +	struct wmi_buffer output;
>>> +	u32 data_size;
>>> +	int ret;
>>> +
>>> +	lockdep_assert_held(&state->lock);
>>> +
>>> +	/* The tested firmware needs two calls before its response is usable. */
>>> +	ret = wmidev_invoke_method(priv->wdev, 0, LWMI_DATA_PACKAGE_GET,
>>> +				   &input, &output, 0);
>>> +	if (ret)
>>> +		return ret;
> 
> If you don't care about the first call's response, use
> wmidev_invoke_procedure().

I'll use wmidev_invoke_procedure() for the first call.

Thanks,
Alan
> 
> Thanks,
> Rong
> 
>>> +
>>> +	kfree_sensitive(output.data);
>>> +
>>> +	ret = wmidev_invoke_method(priv->wdev, 0, LWMI_DATA_PACKAGE_GET,
>>> +				   &input, &output, sizeof(struct lwmi_package_response));
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	struct lwmi_package_response *response __free(kfree_sensitive) = output.data;
>>> +
>>> +	data_size = le32_to_cpu(response->data_size);
>>> +	if (data_size > output.length - sizeof(*response))
>>
>> Why not use struct_size() here? Considering that...
>>
>>> +		return -EPROTO;
>>> +
>>> +	state->response_len = struct_size(response, data, data_size);
>>
>> ...you've used it here, you may introduce a on-stack variable to
>> temporarily store the calculated size and use it here and there.
>>
>>> +	state->response = no_free_ptr(response);
>>> +	return 0;
>>> +}
>>> +
>>> +static ssize_t lwmi_package_write(struct file *file, const char __user *buffer,
>>> +				  size_t count, loff_t *ppos)
>>> +{
>>> +	struct lwmi_package_file *state = file->private_data;
>>> +	u8 input[LWMI_DATA_PACKAGE_INPUT_MAX] = {};
>>> +	int ret;
>>> +
>>> +	if (!count || count > sizeof(input))
>>> +		return -EINVAL;
>>> +
>>> +	ACQUIRE(mutex_try, state_guard)(&state->lock);
>>> +	if (ACQUIRE_ERR(mutex_try, &state_guard) || state->response)
>>> +		return -EBUSY;
>>
>> I don't think it's a good idea to share the same errno between the two
>> cases.
>>
>> While ACQUIRE_ERR(mutex_try, &state_guard) should return -EBUSY, a
>> pending state->response should return something like -EALREADY or
>> -ENOTEMPTY.
>>
>>> +
>>> +	if (copy_from_user(input, buffer, count))
>>> +		return -EFAULT;
>>> +
>>> +	ret = lwmi_package_invoke(state, input);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	return count;
>>> +}
>>> +
>>> +static ssize_t lwmi_package_read(struct file *file, char __user *buffer,
>>> +				 size_t count, loff_t *ppos)
>>> +{
>>> +	struct lwmi_package_file *state = file->private_data;
>>> +	size_t len;
>>> +
>>> +	if (!count)
>>> +		return 0;
>>> +
>>> +	ACQUIRE(mutex_try, state_guard)(&state->lock);
>>> +	if (ACQUIRE_ERR(mutex_try, &state_guard))
>>> +		return -EBUSY;
>>> +
>>> +	if (!state->response)
>>> +		return 0;
>>
>> Reading the file without writing to it in prior is a mistake, isn't it?
>> Thus:
>>
>> 		return -ENODATA;
>>
>>> +
>>> +	len = state->response_len;
>>> +	if (len > count)
>>> +		return -ENOSPC;
>>
>> Returning -ENOSPC is confusing as there is nothing to allocate during
>> read. How about -ENOBUFS?
>>
>>> +
>>> +	if (copy_to_user(buffer, state->response, len))
>>> +		return -EFAULT;
>>> +
>>> +	kfree_sensitive(state->response);
>>> +	state->response = NULL;
>>> +	return len;
>>> +}
>>> +
>>> +static const struct file_operations lwmi_package_fops = {
>>> +	.owner = THIS_MODULE,
>>> +	.open = lwmi_package_open,
>>> +	.release = lwmi_package_release,
>>> +	.read = lwmi_package_read,
>>> +	.write = lwmi_package_write,
>>> +};
>>> +
>>> +static void lwmi_package_debugfs_remove(void *data)
>>> +{
>>> +	debugfs_remove_recursive(data);
>>> +}
>>> +
>>> +static int devm_lwmi_package_debugfs_add(struct lwmi_om_priv *priv)
>>> +{
>>> +	struct device *dev = &priv->wdev->dev;
>>> +	struct dentry *dir, *entry;
>>> +	int ret;
>>> +
>>> +	if (!wmidev_instance_count(priv->wdev))
>>> +		return 0;
>>> +
>>> +	dir = lwmi_debugfs_create_dir(priv->wdev);
>>> +	if (IS_ERR(dir))
>>> +		return PTR_ERR(dir);
>>> +
>>> +	atomic_set(&priv->package_opened, 0);
>>
>> Why would you need this? The struct is kzalloc()-allocated.
>>
>>> +
>>> +	ret = devm_add_action_or_reset(dev, lwmi_package_debugfs_remove, dir);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	entry = debugfs_create_file("get_data_by_package", 0600, dir, priv, &lwmi_package_fops);
>>> +	if (IS_ERR(entry)) {
>>> +		devm_release_action(dev, lwmi_package_debugfs_remove, dir);
>>> +		return PTR_ERR(entry);
>>> +	}
>>> +
>>> +	priv->debugfs_dir = dir;
>>
>> Why would you need this? The dir is devm-managed.
>>
>>> +	return 0;
>>> +}
>>> +
>>>  /**
>>>   * lwmi_om_master_bind() - Bind all components of the other mode driver
>>>   * @dev: The lenovo-wmi-other driver basic device.
>>> @@ -1693,6 +1888,7 @@ static int lwmi_other_probe(struct wmi_device *wdev, const void *context)
>>>  {
>>>  	struct component_match *master_match = NULL;
>>>  	struct lwmi_om_priv *priv;
>>> +	int ret;
>>>  
>>>  	priv = devm_kzalloc_obj(&wdev->dev, *priv);
>>>  	if (!priv)
>>> @@ -1708,12 +1904,24 @@ static int lwmi_other_probe(struct wmi_device *wdev, const void *context)
>>>  	if (IS_ERR(master_match))
>>>  		return PTR_ERR(master_match);
>>>  
>>> +	if (enable_get_data_by_package) {
>>> +		ret = devm_lwmi_package_debugfs_add(priv);
>>> +		if (ret)
>>> +			dev_warn(&wdev->dev, "failed to create GetDataByPackage debugfs files: %d\n",
>>
>> The file is named get_data_by_package.
>>
>>> +				 ret);
>>> +	}
>>> +
>>>  	return component_master_add_with_match(&wdev->dev, &lwmi_om_master_ops,
>>>  					       master_match);
>>>  }
>>>  
>>>  static void lwmi_other_remove(struct wmi_device *wdev)
>>>  {
>>> +	struct lwmi_om_priv *priv = dev_get_drvdata(&wdev->dev);
>>> +
>>> +	if (priv->debugfs_dir)
>>> +		devm_release_action(&wdev->dev, lwmi_package_debugfs_remove, priv->debugfs_dir);
>>
>> Why would you need this? The interface does not depend on the components.
>>
>> Thanks,
>> Rong
>>
>>> +
>>>  	component_master_del(&wdev->dev, &lwmi_om_master_ops);
>>>  }
>>>  

