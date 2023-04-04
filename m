Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 531ECC761A6
	for <platform-driver-x86@archiver.kernel.org>; Tue,  4 Apr 2023 16:32:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231859AbjDDQct (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 4 Apr 2023 12:32:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231668AbjDDQcs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 4 Apr 2023 12:32:48 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1AEB1BF3
        for <platform-driver-x86@vger.kernel.org>; Tue,  4 Apr 2023 09:32:46 -0700 (PDT)
Date:   Tue, 4 Apr 2023 16:32:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
        t=1680625964; bh=T5ywBY3DvFluPFLGHkl9G2UeG1fFBSHDNS6UFBi1VQ8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CbP5pjNYe5rczHzXySutOuFf9SXlEmgGeY5GZpb59Idkk7g0Opl3W+w2H9oUL+qYY
         uRfynJxSPJtkMs6QnyBI3hDKy+zCLnEcIOUBJBcZctUnFRktyUc7b6XlXUc5Kwdm8e
         U0f3p+UyVWlShSFEYu0zb2n5VQbxLVZXc7vVvbIE=
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To:     Jorge Lopez <jorgealtxwork@gmail.com>
Cc:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v6 3/4] Introduction of HP-BIOSCFG driver [3]
Message-ID: <f75018a8-cd8c-48dc-b6da-4469e95239bb@t-8ch.de>
References: <20230309201022.9502-1-jorge.lopez2@hp.com>
 <20230309201022.9502-4-jorge.lopez2@hp.com>
 <ef741af7-caf4-4f30-a02d-a939fa9cc48f@t-8ch.de>
 <CAOOmCE_cV+n5Wn1MW13zOw69SqbSzsyg35RjR18Ed8+Wmwz5TQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOOmCE_cV+n5Wn1MW13zOw69SqbSzsyg35RjR18Ed8+Wmwz5TQ@mail.gmail.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 2023-04-03 15:18:31-0500, Jorge Lopez wrote:
> Hi Thomas,
> 
> 
> >
> > Currently the driver stores all its state in driver-global static data.
> > The kobjects are stored without any state.
> > Inside the kobject attribute operations is some fiddly logic that tries
> > to figure out the corresponding state with a fiddly mechansims.
> >
> > The more correct way would be to attach the corresponding state
> > directly to the kobject.
> >
> > Let me know if you want to give this a shot and I'll give an example.
> 
> Yes.  I would  like to give it a shot.  I can take a look at the code
> and determine when we can implement it.
> No promises.

/* data for each kernel object */
struct bios_property {
	/* This is *not* a pointer, it will be used by the core sysfs
	 * code framework to manage this "object" */
	struct kobject kobj;
	int instance_id; /* instance ID to pass to WMI functions */
	/* common members to all properties */
	u8 display_name[MAX_BUFF];
	u8 path[MAX_BUFF];
	/* all the other common stuff */

	const struct *property_ops ops;
	union {
		struct string_property_data {
			u8 current_value[MAX_BUFF];
			u8 new_value[MAX_BUFF];
			u32 min_length;
			u32 max_length;
		} string_data;
		/* same for other data types... */
	};
};

struct property_ops {
	ssize_t	(*show_current_value)(struct bios_property *, char *);
	ssize_t	(*store_current_value)(struct bios_property *, const char *, size_t);
};

static ssize_t string_property_show_current_value(struct bios_property *prop, char *buf)
{
	/* or read from WMI. Does it need to be cached? */
	return sysfs_emit(buf, prop->string_data.current_value);
}

ssize_t	string_property_store_current_value(struct bios_property *prop, const char *buf, size_t count)
{
	int ret;

	if (strlen(buf) > prop->string_data.max_length)
		return -ERANGE;

	ret = do_string_specifc_wmi_stuff(buf, count);
	if (ret)
		return ret;

	strcpy(prop->current_value, buf);
	return count;
}

/* different show/store functionality per property type */
static const struct property_ops string_property_ops = {
	.store_current_value = string_property_show_current_value,
	.show_current_value = string_property_show_current_value,
};

struct bioscfg_attribute {
	struct attribute attr;
	ssize_t (*show)(struct bioscfg_prop *prop, char *buf);
	ssize_t (*store)(struct bioscfg_prop *prop, const char *buf, size_t count);
};

/* this is one implementation for *all* property types */
static ssize_t display_name_show(struct bioscfg_prop *prop, char *buf)
{
	return sysfs_emit(buf, prop->display_name);
}
static struct bioscfg_attribute display_name = __ATTR_RO(display_name);

/* and all the other ones */

/* this dispatches into the type-specific property handlers */
static ssize_t current_value_show(struct bioscfg_prop *prop, char *buf)
{
	return prop->ops->show_current_value(prop, buf);
}
static struct bioscfg_attribute current_value = __ATTR(current_value);

static struct attribute *attrs[] = {
	&display_name.attr,
	/* other attrs here */
	NULL
};

/* reflect read-only mode in sysfs */
static umode_t bioscfg_attr_is_visible(struct kobject *kobj, struct attribute *attr, int n)
{
	struct bios_property *prop = container_of(kobj, struct bios_property, kobj);

	if (attr == &current_value.attr && prop->read_only)
		return attr->mode ^ 0222; /* clear writable bits */
	return attr->mode;
}

static const struct attribute_group attr_group = {
	.attrs      = attrs,
	.is_visible = bioscfg_attr_is_visible,
};

/* the following two functions dispatch from your the core kobj pointer
 * to your custom callbacks operating on nice bioscfg_attribute
 */
static ssize_t bioscfg_attr_show(struct kobject *kobj, struct attribute *attr,
				 char *buf)
{
	struct bioscfg_attribute *kattr;
	ssize_t ret = -EIO;

	kattr = container_of(attr, struct bioscfg_attribute, attr);
	if (kattr->show)
		ret = kattr->show(kobj, kattr, buf);
	return ret;
}

static ssize_t bioscfg_attr_store(struct kobject *kobj, struct attribute *attr,
				  const char *buf, size_t count)
{
	struct bioscfg_attribute *kattr;
	ssize_t ret = -EIO;

	kattr = container_of(attr, struct bioscfg_attribute, attr);
	if (kattr->store)
		ret = kattr->store(kobj, kattr, buf, count);
	return ret;
}

static const struct sysfs_ops bioscfg_kobj_sysfs_ops = {
	.show	= bioscfg_attr_show,
	.store	= bioscfg_attr_store,
};

/* to hook this into the generic kobject machinery */
static const struct kobj_type bioscfg_kobj_type = {
	.release	= free_struct_bios_property,
	.sysfs_ops	= &bios_property_sysfs_ops,
	.default_groups = attr_groups,
};

static int probe(void)
{
	struct bios_property *prop;

	for (each property discovered via WMI) {
		prop = kzalloc(sizeof(*prop));
		prop->readonly = is_read_only(property);
		/* other common properties */
		if (is_string_property(property)) {
			prop->ops = string_property_ops;
			prop->string_data.current_value = "";
			/* other type-specific properties */
		} else {
			; /* and so on for other types */
		}

		kobject_init(&prop->kobj, &bioscfg_kobj_type);
		kobject_add(&prop->kobj, parent, name);
	}

	/* Now all properties and their memory are managed by the kernel */
}

Instead of having one kobj_type for all properties it would also be
possible to create a new one for each. But I don't think it's worth it.
