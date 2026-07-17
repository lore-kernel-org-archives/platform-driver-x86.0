Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DAB3A9D80;
	Fri, 17 Jul 2026 05:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784267619; cv=none; b=gKExgmV2TsA0udvH0xOaGZvc7SOImWBylJSI6ddPX+60OtkTCtwU1CSs+02pcSomsSU3UT/zr/1pYc0b8nGOEmy07AGeUF3gwrpSh/4MMfO0XSHTXHZGVs4avQ2QWcE1NfBZd3yVYJ0ZkkUdDj87navFkuMjRC+EkWeBMo3cMKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784267619; c=relaxed/simple;
	bh=XwpbIvAMbfiotVAkJaWpvjaHtWzTOheLxNeKMbUwJJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uqD55QUel4xaogHe82fg7bzekzwZySnJJ4QUSR/oBQvk8FajEa/54lsH8aCdMrdg8OBymYfdSRzf2uRurIPNtLrHA6JYaAhcmDwJHrSV4cs/UFNXrtTcdK9plN5hSE2MJwb3hr679gEVPcnmHOH/tNLONzKy6mM+/ScmCqhRrEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MtxfQbJP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MtxfQbJP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D049B1F000E9;
	Fri, 17 Jul 2026 05:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784267617;
	bh=BtwiwC1OOAz/Ngi0IL20lPmx0q2+dVmLQEL3FN1Pjug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MtxfQbJP9qmEz0Rj5q9ZDsk1cKzW2+u7/oDJAc4FfCaZMbwZ0DtQ0HBIo/gIFSCgA
	 CJfgkzXee+Jo+KIA1xVcFBj/AAw6xw3akbrAQQtNGD4PVG/erlV0cHfg6Yr/1HkvzV
	 B3i+IR48la1BEEU6MqYVBxh5RxB/HZ6LZevpQPWGjFzUe8Y4FIKL3O7ZjJVMs7WtzY
	 ttrK95uNRFqdlRJ/VOYvx6DqWdnUYSXk/m3L89gEwMc5AYwPTojftfjqQI5wmg76s2
	 v4rOSGbYzo9hp6bWcKtGLKLlN6TE0LDOMFYsUZ46irIG9ZE+SJ5IR8B0LyOPW56z2F
	 iJYdeMD1M9ICg==
Date: Fri, 17 Jul 2026 05:53:31 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Sean Rhodes <sean@starlabs.systems>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
	corentin.chary@gmail.com, luke@ljones.dev, denis.benato@linux.dev,
	prasanth.ksr@dell.com, jorge.lopez2@hp.com,
	mpearson-lenovo@squebb.ca, derekjohn.clark@gmail.com,
	josh@joshuagrisham.com, briannorris@chromium.org,
	jwerner@chromium.org, tzimmermann@suse.de, javierm@redhat.com,
	kees@kernel.org, u.kleine-koenig@baylibre.com, mst@redhat.com,
	chenhuacai@kernel.org, wenst@chromium.org,
	florian.fainelli@broadcom.com, titouan.ameline@gmail.com,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com, chrome-platform@lists.linux.dev
Subject: Re: [PATCH v6 3/3] firmware: coreboot: Add CFR firmware attributes
 driver
Message-ID: <alnDWxTSZv5DKcB9@google.com>
References: <20260713054526.2902319-1-sean@starlabs.systems>
 <20260713081317.2954586-1-sean@starlabs.systems>
 <20260713081317.2954586-4-sean@starlabs.systems>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713081317.2954586-4-sean@starlabs.systems>

On Mon, Jul 13, 2026 at 09:13:17AM +0100, Sean Rhodes wrote:
> diff --git a/drivers/firmware/coreboot/coreboot-cfr.c b/drivers/firmware/coreboot/coreboot-cfr.c
...
> +static const struct coreboot_table_entry *
> +coreboot_cfr_child_entry(const void *base, size_t len, u32 tag)
> +{
> +	const struct coreboot_table_entry *entry;
> +	size_t off = 0;
> +
> +	while (off < len) {

To be concise,

    for (off = 0; off < len; off += entry->size)

> +static bool coreboot_cfr_value_is_valid(struct coreboot_cfr_setting *setting,
> +					u32 value)
> +{
> +	u32 delta;
> +
> +	if (setting->type != COREBOOT_CFR_SETTING_NUMBER)
> +		return coreboot_cfr_label_from_value(setting, value);

This deserves a comment as coreboot_cfr_label_from_value() returns a `char *`
instead of bool.

> +static ssize_t possible_values_show(struct kobject *kobj,
> +				    struct kobj_attribute *attr, char *buf)
> +{
> +	struct coreboot_cfr_setting *setting = to_coreboot_cfr_setting(kobj);
> +	ssize_t len = 0;
> +	unsigned int i;
> +
> +	for (i = 0; i < setting->n_values; i++) {
> +		len += sysfs_emit_at(buf, len, "%s%s", i ? ";" : "",
> +				     setting->values[i].label);
> +		if (len >= PAGE_SIZE)
> +			return len;

Does it really need the check?

> +static int coreboot_cfr_count_enum_values(const void *base, size_t len)
> +{
> +	const struct coreboot_table_entry *entry;
> +	size_t off = 0;
> +	int count = 0;
> +
> +	while (off < len) {

To be consie,

    for (off = 0; off < len; off += entry->size)

> +static int coreboot_cfr_copy_enum_values(struct coreboot_cfr_setting *setting,
> +					 const void *base, size_t len)
> +{
> +	const struct lb_cfr_enum_value *enum_value;
> +	const struct lb_cfr_varbinary *label;
> +	const struct coreboot_table_entry *entry;
> +	size_t off = 0;
> +	int count;
> +
> +	count = coreboot_cfr_count_enum_values(base, len);
> +	if (count <= 0)
> +		return count ?: -EINVAL;
> +
> +	setting->values = kcalloc(count, sizeof(*setting->values), GFP_KERNEL);
> +	if (!setting->values)
> +		return -ENOMEM;
> +
> +	while (off < len) {

To be consie,

    for (off = 0; off < len; off += entry->size)

> +static int coreboot_cfr_parse_records(struct coreboot_cfr_drvdata *data,
> +				      const void *base, size_t len)
> +{
> +	const struct coreboot_table_entry *entry;
> +	const void *child_base;
> +	size_t child_len;
> +	size_t off = 0;
> +	int ret;
> +
> +	while (off < len) {

To be concise,

    for (off = 0; off < len; off += entry->size)

> +		switch (entry->tag) {
> +		case CFR_TAG_OPTION_FORM:
> +			if (entry->size < sizeof(struct lb_cfr_option_form))
> +				return -EINVAL;
> +
> +			child_base = base + off + sizeof(struct lb_cfr_option_form);
> +			child_len = entry->size - sizeof(struct lb_cfr_option_form);
> +			ret = coreboot_cfr_parse_records(data, child_base,
> +							 child_len);
> +			if (ret)
> +				return ret;
> +			break;
> +		case CFR_TAG_OPTION_ENUM:
> +		case CFR_TAG_OPTION_NUMBER:
> +		case CFR_TAG_OPTION_BOOL:
> +			if (entry->size < sizeof(struct lb_cfr_numeric_option))
> +				return -EINVAL;
> +			ret = coreboot_cfr_add_numeric_option(data, base + off);
> +			if (ret)
> +				return ret;
> +			break;
> +		default:
> +			break;

Doesn't it need to do anything if sees unknown `entry->tag`?

> +static int coreboot_cfr_probe(struct coreboot_device *dev)
> +{
...
> +	data->class_dev = device_create(&firmware_attributes_class, NULL,
> +					MKDEV(0, 0), NULL, DRIVER_NAME);
> +	if (IS_ERR(data->class_dev)) {
> +		ret = PTR_ERR(data->class_dev);
> +		goto err_clear_data;

No more data to clear,

    return PTR_ERR(...);

> +err_clear_data:
> +	return ret;

Nothing to do other than a return.  The label can be removed.
