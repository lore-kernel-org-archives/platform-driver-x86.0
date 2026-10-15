Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA5D417D99
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 21:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792098693; cv=none; b=SwBtELnmK/c8wO9viJYQl+eTNCEKa8xRkJf2qU9HzwRxqTU4J2zyfYsaseS3NPrZWL5pwl+OA/9vSTXefpDttqaMqIEpWCkDp6crxwFD9+gZ053CDw4DWnurAX6eQdvzyDPReVUeaxk4mzKnTOl1akIOPp8zKlTCC+m+U/fX8Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792098693; c=relaxed/simple;
	bh=z0yLFuYA5HfcwDrKpw0HEyb0c3PXxazURP4m7zLNZ3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u3IRE6DbJXALL2pqfCQQ6AAUiQWGvhbgWS9c7U6zhqzA+Mi38jqsW9FPqrfbAQZZEabYauLuEh1t+qanmbo9oD02NiKvFPLMNtCKoBMNW8JIPV9eY3tRrbDo2erel5lrcUPpiSD45im69X1TTMzpuJ67pjgq8PBXkDdaaowAmKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=WE+A72zP; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="WE+A72zP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1792098686; x=1792703486; i=w_armin@gmx.de;
	bh=mGv9qi/SUQNBlKAcnm1pR4ZOxKUuZJJe5P2+aH0ik1c=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=WE+A72zPg+RSQNr3pp28+/qh1u9TqLUXhgV1aOuDjEJMDqVKExQiTlpJ8PU+Laem
	 +EmiYvn6N5/egzOZCOCBqAI43xdDaQ+0wmfZM3gLnEMn6ZHZTD8dF7oQoZi9MxPHW
	 zvGs7e7GvdsEt9U6PIAGLH7nxvft5QIOCAEI7Yf6v1AxQCTwot7YcbDwkVocoe2Y+
	 /tbG6GTNUQJoBl1+ECe9lKcROBzKo5lHKmOaSxISn6sFfwchHoUxgcALKWaoVh0Gt
	 x5CTPIDglmroibW5/TVCQS4AxcBmU9030NWScVate+hNybRHnF08NQ64BHe6R6/i3
	 DaUuEbCAcJyqjiO8jg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MJE2D-1x2HMU469b-00UbEy; Thu, 15
 Oct 2026 23:11:26 +0200
Message-ID: <b5b4a63e-ab81-48b5-b2ab-d6ee3120918d@gmx.de>
Date: Thu, 15 Oct 2026 23:11:25 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] platform/x86/amd/wmi: aod: Add debugfs interface for
 raw WMI access
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, mario.limonciello@amd.com
References: <20261010190543.563161-1-Shyam-sundar.S-k@amd.com>
 <20261010190543.563161-3-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20261010190543.563161-3-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Eetc+OG9pzrmxkBhXpgbMtUaBFxnIQJQTs/oisCEwUAfD5nxrKm
 ayOCsmMkbqvq7UzpChYitru/0qKPViTqlXDxZ8lA1Pt/wubKTM15oWA6wHWNckxDc2jpH/c
 uPgspDkeK3HytO8WqugDcrmUhfkskOjPfb21aTyJwxu+CwctRjGSBD+JktpHk+fLTGt0Lo6
 15AGfpSqlIcCcSjQMt43A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:amtrxeOFmzg=;Xiy+qJ/lWsYCVuyKL8/ZhQd5yuE
 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
 u2qCkxdQWoc=

Am 10.10.26 um 21:05 schrieb Shyam Sundar S K:

> The AOD firmware supports many more commands than the ones exposed
> through sysfs, and the set of commands differs between platforms. For
> debugging and platform bring-up it is useful to have direct access to
> the WMI methods.
>
> Add debugfs files to list the supported commands, query the range of a
> command and execute a command. This interface is not a stable ABI and is
> only accessible by root.
>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>   drivers/platform/x86/amd/wmi/aod.c | 320 ++++++++++++++++++++++++++++-
>   1 file changed, 316 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/platform/x86/amd/wmi/aod.c b/drivers/platform/x86/a=
md/wmi/aod.c
> index c64a02b5d379..b7331930f4c3 100644
> --- a/drivers/platform/x86/amd/wmi/aod.c
> +++ b/drivers/platform/x86/amd/wmi/aod.c
> @@ -8,20 +8,27 @@
>    * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>    */
>  =20
> +#include <linux/align.h>
>   #include <linux/cleanup.h>
>   #include <linux/compiler_attributes.h>
>   #include <linux/container_of.h>
> +#include <linux/debugfs.h>
>   #include <linux/dev_printk.h>
>   #include <linux/device.h>
>   #include <linux/device/devres.h>
> +#include <linux/err.h>
>   #include <linux/errno.h>
> +#include <linux/fs.h>
>   #include <linux/gfp_types.h>
>   #include <linux/kobject.h>
>   #include <linux/kstrtox.h>
>   #include <linux/minmax.h>
>   #include <linux/module.h>
>   #include <linux/mutex.h>
> +#include <linux/seq_file.h>
> +#include <linux/sizes.h>
>   #include <linux/slab.h>
> +#include <linux/sprintf.h>
>   #include <linux/string.h>
>   #include <linux/sysfs.h>
>   #include <linux/types.h>
> @@ -49,11 +56,15 @@
>   #define AOD_CMD_EDC_LIMIT		0x00050003
>  =20
>   #define AOD_MAX_OID_COUNT		64
> +#define AOD_OID_STRING_LEN		64
>   #define AOD_DVALUES_COUNT		100
>  =20
>   /* Property flag of a command: discrete values or a linear range */
>   #define AOD_PROPERTY_LINEAR		1
>  =20
> +/* WMI strings are aligned on a 2-byte boundary inside WMI buffers */
> +#define AOD_WMI_STRING_ALIGN		2
> +
>   #define to_amd_aod_attr(_attr)	container_of(_attr, struct amd_aod_attr=
, dev_attr)
>  =20
>   #define AMD_AOD_ATTR(_name, _mode, _show, _store, _setting, _field, _s=
cale)	\
> @@ -103,6 +114,7 @@ struct amd_aod_oid_package {
>   	u32 length;
>   	u32 id[AOD_MAX_OID_COUNT];
>   	u32 property[AOD_MAX_OID_COUNT];
> +	char id_string[AOD_MAX_OID_COUNT][AOD_OID_STRING_LEN];
>   } __packed;
>  =20
>   enum amd_aod_setting {
> @@ -126,6 +138,10 @@ struct amd_aod_data {
>   	struct mutex lock;	/* Serializes WMI calls and protects the fields be=
low */
>   	bool supported[AOD_SETTING_MAX];
>   	bool linear[AOD_SETTING_MAX];
> +	u32 dvalues_cmd_id;
> +	u32 stepping_cmd_id;
> +	u32 run_command_status;
> +	bool run_command_status_valid;
>   };
>  =20
>   struct amd_aod_attr {
> @@ -199,8 +215,35 @@ static void amd_aod_parse_object_id(const struct wm=
i_buffer *out,
>   	}
>   }
>  =20
> +static int amd_aod_parse_names(const struct wmi_buffer *out, struct amd=
_aod_oid_package *pkg)
> +{
> +	const struct wmi_string *str;
> +	size_t offset;
> +	int ret, i;
> +
> +	offset =3D sizeof(struct amd_aod_oid_result);
> +	for (i =3D 0; i < pkg->length; i++) {
> +		offset =3D ALIGN(offset, AOD_WMI_STRING_ALIGN);
> +		if (out->length < offset + sizeof(*str))
> +			return -EPROTO;
> +
> +		str =3D out->data + offset;
> +		offset +=3D sizeof(*str) + le16_to_cpu(str->length);
> +		if (out->length < offset)
> +			return -EPROTO;
> +
> +		ret =3D wmi_string_to_utf8s(str, (u8 *)pkg->id_string[i],
> +					  sizeof(pkg->id_string[i]));
> +		if (ret < 0)
> +			return ret;
> +	}

Move the name parsing into the first patch, because doing this is necessar=
y to detect
then the firmware is giving us invalid data.

> +
> +	return 0;
> +}
> +
> +/* The command names are only decoded when requested, the driver itself=
 does not use them */
>   static int amd_aod_get_object_id(struct amd_aod_data *data, u32 method=
_id,
> -				 struct amd_aod_oid_package *pkg)
> +				 struct amd_aod_oid_package *pkg, bool names)
>   {
>   	struct wmi_buffer out;
>   	int ret;
> @@ -210,9 +253,12 @@ static int amd_aod_get_object_id(struct amd_aod_dat=
a *data, u32 method_id,
>   		return ret;
>  =20
>   	amd_aod_parse_object_id(&out, pkg);
> +	if (names)
> +		ret =3D amd_aod_parse_names(&out, pkg);
> +
>   	kfree(out.data);
>  =20
> -	return 0;
> +	return ret;
>   }
>  =20
>   static int amd_aod_get_dvalues(struct amd_aod_data *data, u32 cmd_id,
> @@ -508,6 +554,270 @@ static const struct attribute_group amd_aod_group =
=3D {
>   };
>   __ATTRIBUTE_GROUPS(amd_aod);
>  =20
> +static int amd_aod_version_show(struct seq_file *s, void *unused)
> +{
> +	struct amd_aod_data *data =3D s->private;
> +	u32 version;
> +	int ret;
> +
> +	guard(mutex)(&data->lock);
> +
> +	ret =3D amd_aod_query_version(data, &version);
> +	if (ret)
> +		return ret;
> +
> +	seq_printf(s, "%u\n", version);
> +
> +	return 0;

I suggest that you store the version inside struct amd_aid_data instead.

> +}
> +DEFINE_SHOW_ATTRIBUTE(amd_aod_version);
> +
> +static void amd_aod_oid_print(struct seq_file *s, const struct amd_aod_=
oid_package *pkg,
> +			      bool raw)
> +{
> +	u32 i;
> +
> +	if (raw) {
> +		seq_write(s, pkg, sizeof(*pkg));
> +		return;
> +	}
> +
> +	seq_printf(s, "Length: %u\n\n", pkg->length);
> +	for (i =3D 0; i < pkg->length; i++)
> +		seq_printf(s, "[%2u] ID=3D%-8u property=3D%u  \"%s\"\n",
> +			   i, pkg->id[i], pkg->property[i], pkg->id_string[i]);
> +}
> +
> +static int amd_aod_oid_show(struct seq_file *s, u32 method_id, bool raw=
)
> +{
> +	struct amd_aod_data *data =3D s->private;
> +	struct amd_aod_oid_package *pkg;
> +	int ret;
> +
> +	guard(mutex)(&data->lock);
> +
> +	pkg =3D kzalloc_obj(*pkg);
> +	if (!pkg)
> +		return -ENOMEM;
> +
> +	ret =3D amd_aod_get_object_id(data, method_id, pkg, true);
> +	if (!ret)
> +		amd_aod_oid_print(s, pkg, raw);
> +
> +	kfree(pkg);
> +
> +	return ret;
> +}
> +
> +/*
> + * The command lists do not fit into the default seq_file buffer, use a
> + * larger one so that the firmware is only called once per read.
> + */
> +#define AOD_OID_SHOW_SIZE	SZ_8K
> +
> +#define AMD_AOD_OID_ATTRIBUTE(__name)						\
> +static int __name##_open(struct inode *inode, struct file *file)		\
> +{										\
> +	return single_open_size(file, __name##_show, inode->i_private,		\
> +				AOD_OID_SHOW_SIZE);				\
> +}										\
> +										\
> +static const struct file_operations __name##_fops =3D {				\
> +	.owner		=3D THIS_MODULE,						\
> +	.open		=3D __name##_open,					\
> +	.read		=3D seq_read,						\
> +	.llseek		=3D seq_lseek,						\
> +	.release	=3D single_release,					\
> +}
> +
> +static int amd_aod_object_id_show(struct seq_file *s, void *unused)
> +{
> +	return amd_aod_oid_show(s, AOD_GET_OBJECT_ID, false);
> +}
> +AMD_AOD_OID_ATTRIBUTE(amd_aod_object_id);
> +
> +static int amd_aod_object_id2_show(struct seq_file *s, void *unused)
> +{
> +	return amd_aod_oid_show(s, AOD_GET_OBJECT_ID2, false);
> +}
> +AMD_AOD_OID_ATTRIBUTE(amd_aod_object_id2);
> +
> +static int amd_aod_object_id_raw_show(struct seq_file *s, void *unused)
> +{
> +	return amd_aod_oid_show(s, AOD_GET_OBJECT_ID, true);
> +}
> +AMD_AOD_OID_ATTRIBUTE(amd_aod_object_id_raw);
> +
> +static int amd_aod_object_id2_raw_show(struct seq_file *s, void *unused=
)
> +{
> +	return amd_aod_oid_show(s, AOD_GET_OBJECT_ID2, true);
> +}
> +AMD_AOD_OID_ATTRIBUTE(amd_aod_object_id2_raw);
> +
> +static int amd_aod_dvalues_show(struct seq_file *s, void *unused)
> +{
> +	struct amd_aod_data *data =3D s->private;
> +	struct amd_aod_dvalues_result res;
> +	u32 i, count;
> +	int ret;
> +
> +	guard(mutex)(&data->lock);
> +
> +	ret =3D amd_aod_get_dvalues(data, data->dvalues_cmd_id, &res);
> +	if (ret)
> +		return ret;
> +
> +	count =3D le32_to_cpu(res.length);
> +	seq_printf(s, "id: %u\n", le32_to_cpu(res.id));
> +	seq_printf(s, "current_value: %u\n", le32_to_cpu(res.current_value));
> +	seq_printf(s, "length: %u\n", count);
> +	seq_puts(s, "dvalues:");
> +	for (i =3D 0; i < min(count, AOD_DVALUES_COUNT); i++)
> +		seq_printf(s, " %u", le32_to_cpu(res.dvalues[i]));
> +	seq_putc(s, '\n');
> +
> +	return 0;
> +}
> +
> +static ssize_t amd_aod_dvalues_write(struct file *file, const char __us=
er *buf, size_t count,
> +				     loff_t *ppos)
> +{
> +	struct seq_file *s =3D file->private_data;
> +	struct amd_aod_data *data =3D s->private;
> +	u32 cmd_id;
> +	int ret;
> +
> +	ret =3D kstrtou32_from_user(buf, count, 0, &cmd_id);
> +	if (ret)
> +		return ret;
> +
> +	guard(mutex)(&data->lock);
> +	data->dvalues_cmd_id =3D cmd_id;
> +
> +	return count;
> +}
> +DEFINE_SHOW_STORE_ATTRIBUTE(amd_aod_dvalues);
> +
> +static int amd_aod_minmax_show(struct seq_file *s, void *unused)
> +{
> +	struct amd_aod_data *data =3D s->private;
> +	struct amd_aod_minmax_result res;
> +	int ret;
> +
> +	guard(mutex)(&data->lock);
> +
> +	ret =3D amd_aod_get_minmax_stepping(data, data->stepping_cmd_id, &res)=
;
> +	if (ret)
> +		return ret;
> +
> +	seq_printf(s, "value: %u\ncurrent_value: %u\nmin: %u\nmax: %u\nsteppin=
g: %u\n",
> +		   le32_to_cpu(res.id), le32_to_cpu(res.current_value),
> +		   le32_to_cpu(res.min), le32_to_cpu(res.max), le32_to_cpu(res.steppi=
ng));
> +
> +	return 0;
> +}
> +
> +static ssize_t amd_aod_minmax_write(struct file *file, const char __use=
r *buf, size_t count,
> +				    loff_t *ppos)
> +{
> +	struct seq_file *s =3D file->private_data;
> +	struct amd_aod_data *data =3D s->private;
> +	u32 cmd_id;
> +	int ret;
> +
> +	ret =3D kstrtou32_from_user(buf, count, 0, &cmd_id);
> +	if (ret)
> +		return ret;
> +
> +	guard(mutex)(&data->lock);
> +	data->stepping_cmd_id =3D cmd_id;
> +
> +	return count;
> +}
> +DEFINE_SHOW_STORE_ATTRIBUTE(amd_aod_minmax);
> +
> +static ssize_t amd_aod_run_command_write(struct file *file, const char =
__user *ubuf,
> +					 size_t count, loff_t *ppos)
> +{
> +	struct amd_aod_data *data =3D file->private_data;
> +	int cmd_id, value, ret;
> +	u32 status;
> +	char *buf;
> +
> +	buf =3D memdup_user_nul(ubuf, count);
> +	if (IS_ERR(buf))
> +		return PTR_ERR(buf);
> +
> +	/* Both values may be given in decimal or hexadecimal notation */
> +	ret =3D sscanf(buf, "%i %i", &cmd_id, &value);
> +	kfree(buf);
> +	if (ret !=3D 2)
> +		return -EINVAL;
> +
> +	guard(mutex)(&data->lock);
> +
> +	data->run_command_status_valid =3D false;
> +
> +	ret =3D amd_aod_run_command(data, cmd_id, value, &status);
> +	if (ret)
> +		return ret;
> +
> +	data->run_command_status =3D status;
> +	data->run_command_status_valid =3D true;
> +
> +	return count;
> +}
> +
> +static const struct file_operations amd_aod_run_command_fops =3D {
> +	.owner =3D THIS_MODULE,
> +	.open =3D simple_open,
> +	.write =3D amd_aod_run_command_write,
> +	.llseek =3D noop_llseek,
> +};
> +
> +static int amd_aod_run_command_status_show(struct seq_file *s, void *un=
used)
> +{
> +	struct amd_aod_data *data =3D s->private;
> +
> +	guard(mutex)(&data->lock);
> +
> +	if (!data->run_command_status_valid)
> +		return -ENODATA;
> +
> +	seq_printf(s, "0x%08x\n", data->run_command_status);
> +
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(amd_aod_run_command_status);
> +
> +static void amd_aod_debugfs_remove(void *dir)
> +{
> +	debugfs_remove(dir);
> +}
> +
> +static void amd_aod_debugfs_init(struct amd_aod_data *data)
> +{
> +	struct device *dev =3D &data->wdev->dev;
> +	struct dentry *dir;
> +	char name[64];
> +
> +	scnprintf(name, sizeof(name), "%s-%s", DRIVER_NAME, dev_name(dev));
> +	dir =3D debugfs_create_dir(name, NULL);
> +
> +	debugfs_create_file("query_version", 0400, dir, data, &amd_aod_version=
_fops);
> +	debugfs_create_file("get_object_id", 0400, dir, data, &amd_aod_object_=
id_fops);
> +	debugfs_create_file("get_object_id2", 0400, dir, data, &amd_aod_object=
_id2_fops);
> +	debugfs_create_file("get_object_id_raw", 0400, dir, data, &amd_aod_obj=
ect_id_raw_fops);
> +	debugfs_create_file("get_object_id2_raw", 0400, dir, data, &amd_aod_ob=
ject_id2_raw_fops);
> +	debugfs_create_file("get_dvalues", 0600, dir, data, &amd_aod_dvalues_f=
ops);
> +	debugfs_create_file("get_minmax_stepping", 0600, dir, data, &amd_aod_m=
inmax_fops);
> +	debugfs_create_file("run_command", 0200, dir, data, &amd_aod_run_comma=
nd_fops);
> +	debugfs_create_file("run_command_status", 0400, dir, data,
> +			    &amd_aod_run_command_status_fops);
> +
> +	devm_add_action_or_reset(dev, amd_aod_debugfs_remove, dir);
> +}
> +
>   static void amd_aod_scan_settings(struct amd_aod_data *data,
>   				  const struct amd_aod_oid_package *pkg)
>   {
> @@ -533,14 +843,14 @@ static int amd_aod_detect_settings(struct amd_aod_=
data *data)
>   	if (!pkg)
>   		return -ENOMEM;
>  =20
> -	ret =3D amd_aod_get_object_id(data, AOD_GET_OBJECT_ID, pkg);
> +	ret =3D amd_aod_get_object_id(data, AOD_GET_OBJECT_ID, pkg, false);

Please always parse the names to detect truncated data buffers.

Thanks,
Armin Wolf

>   	if (ret)
>   		goto out;
>  =20
>   	amd_aod_scan_settings(data, pkg);
>  =20
>   	/* GetObjectID2 might not be implemented by all firmware versions */
> -	if (amd_aod_get_object_id(data, AOD_GET_OBJECT_ID2, pkg))
> +	if (amd_aod_get_object_id(data, AOD_GET_OBJECT_ID2, pkg, false))
>   		dev_dbg(&data->wdev->dev, "GetObjectID2 not available\n");
>   	else
>   		amd_aod_scan_settings(data, pkg);
> @@ -579,6 +889,8 @@ static int amd_aod_probe(struct wmi_device *wdev, co=
nst void *context)
>   	if (ret)
>   		return dev_err_probe(dev, ret, "Failed to get the list of supported =
commands\n");
>  =20
> +	amd_aod_debugfs_init(data);
> +
>   	return 0;
>   }
>  =20
