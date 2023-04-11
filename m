Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 546B6C77B6F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 11 Apr 2023 15:45:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbjDKPpm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 11 Apr 2023 11:45:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229841AbjDKPpk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Apr 2023 11:45:40 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32D5C40FC
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Apr 2023 08:45:34 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id z8so12810451lfb.12
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Apr 2023 08:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681227932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8/VEkqOfzIP2iw/X6QyTrSeImNsRSOIjsqo3Knnpi8=;
        b=BMH2Z5pvFsmNYlpULF3R32DO6YDD6Iu1W0dXv/sTlxKqfMpc1Dq6imXMQPHK71PIf0
         tfW9vZDFKRSoJmgtrr1jDrPv+H3s2O4P3DR2+HdrT10yEQgqzExAX8/WBANV48pWTJTT
         ARGj4SNtYeiNiLXVwIBz3SVgLcrGHNLiKwg2yk5oEC/y7viaBqF1/Rpk4vclZ8j/1jY2
         GFPg5kVTD81H6m+YItpwJECK+dBF2tb3aEENNxmXQRW4PpPqxqz/rzvpfxpuL/EN7TrR
         w/a0sY9AJwowmOWO3mMeQnB3lr54dwrmMqKbvFW0W3Ni1WuFFhMyIqutuYP32hBYfwPP
         1/1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681227932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B8/VEkqOfzIP2iw/X6QyTrSeImNsRSOIjsqo3Knnpi8=;
        b=npDNZxnPi7IyPwKx3p5t+BGPuwzmVzlRWn5iFnbyIj8R2CK6eZier1OcmAdDbOVc9P
         OtTlzOYX6wJ4WIqpH+ob/3t7z0U3N6qFYOXoezbOzx2i68xyDaLjIiiv7snwhfdIzxdE
         eXPtHkReVPbFu8qI++iKpGfO975INFAjmnjWQPR7AdUzFWjepQGg9gW9MV7FflYH3y7Z
         CgSzpqg1WRdwzs2uebKBoFZZiRAu+Exiu9kVXC/tPHBz9YgnbDLg31O6blyxQGjebbDz
         VK6hTY59vgJZ6x1Rx185kLkMLap2fsRDN3OPBJOmy5+P4aFwgCze7eYUplhollrKD82k
         8oBw==
X-Gm-Message-State: AAQBX9epQKCN/to+DokwzLhKkHWF0zntpVW5SzMW+Z9iD9W+wzwWU7ht
        fla8gwZfdg8la5AhAWGy/ruX48sR1BNrnw6tvEA=
X-Google-Smtp-Source: AKy350ZS+Ug9G9FyGsm6mbw2ke+l7rxDa6DjJZS6E4IwErxtE4Qw0lRJ2rpqlIQULB8/G0sWZeISZyqo3ATuqJT6AdQ=
X-Received: by 2002:ac2:4475:0:b0:4ec:9350:e588 with SMTP id
 y21-20020ac24475000000b004ec9350e588mr928804lfl.2.1681227932199; Tue, 11 Apr
 2023 08:45:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230309201022.9502-1-jorge.lopez2@hp.com> <20230309201022.9502-4-jorge.lopez2@hp.com>
 <ef741af7-caf4-4f30-a02d-a939fa9cc48f@t-8ch.de> <CAOOmCE_cV+n5Wn1MW13zOw69SqbSzsyg35RjR18Ed8+Wmwz5TQ@mail.gmail.com>
 <f75018a8-cd8c-48dc-b6da-4469e95239bb@t-8ch.de>
In-Reply-To: <f75018a8-cd8c-48dc-b6da-4469e95239bb@t-8ch.de>
From:   Jorge Lopez <jorgealtxwork@gmail.com>
Date:   Tue, 11 Apr 2023 10:45:12 -0500
Message-ID: <CAOOmCE99_eTRAFT_5biAszFvHnmqQszDHjv8JQEB3ir9tHqbRg@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] Introduction of HP-BIOSCFG driver [3]
To:     =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>
Cc:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Thanks, I'll check it out.

On Tue, Apr 4, 2023 at 11:32=E2=80=AFAM Thomas Wei=C3=9Fschuh <thomas@t-8ch=
.de> wrote:
>
> On 2023-04-03 15:18:31-0500, Jorge Lopez wrote:
> > Hi Thomas,
> >
> >
> > >
> > > Currently the driver stores all its state in driver-global static dat=
a.
> > > The kobjects are stored without any state.
> > > Inside the kobject attribute operations is some fiddly logic that tri=
es
> > > to figure out the corresponding state with a fiddly mechansims.
> > >
> > > The more correct way would be to attach the corresponding state
> > > directly to the kobject.
> > >
> > > Let me know if you want to give this a shot and I'll give an example.
> >
> > Yes.  I would  like to give it a shot.  I can take a look at the code
> > and determine when we can implement it.
> > No promises.
>
> /* data for each kernel object */
> struct bios_property {
>         /* This is *not* a pointer, it will be used by the core sysfs
>          * code framework to manage this "object" */
>         struct kobject kobj;
>         int instance_id; /* instance ID to pass to WMI functions */
>         /* common members to all properties */
>         u8 display_name[MAX_BUFF];
>         u8 path[MAX_BUFF];
>         /* all the other common stuff */
>
>         const struct *property_ops ops;
>         union {
>                 struct string_property_data {
>                         u8 current_value[MAX_BUFF];
>                         u8 new_value[MAX_BUFF];
>                         u32 min_length;
>                         u32 max_length;
>                 } string_data;
>                 /* same for other data types... */
>         };
> };
>
> struct property_ops {
>         ssize_t (*show_current_value)(struct bios_property *, char *);
>         ssize_t (*store_current_value)(struct bios_property *, const char=
 *, size_t);
> };
>
> static ssize_t string_property_show_current_value(struct bios_property *p=
rop, char *buf)
> {
>         /* or read from WMI. Does it need to be cached? */
>         return sysfs_emit(buf, prop->string_data.current_value);
> }
>
> ssize_t string_property_store_current_value(struct bios_property *prop, c=
onst char *buf, size_t count)
> {
>         int ret;
>
>         if (strlen(buf) > prop->string_data.max_length)
>                 return -ERANGE;
>
>         ret =3D do_string_specifc_wmi_stuff(buf, count);
>         if (ret)
>                 return ret;
>
>         strcpy(prop->current_value, buf);
>         return count;
> }
>
> /* different show/store functionality per property type */
> static const struct property_ops string_property_ops =3D {
>         .store_current_value =3D string_property_show_current_value,
>         .show_current_value =3D string_property_show_current_value,
> };
>
> struct bioscfg_attribute {
>         struct attribute attr;
>         ssize_t (*show)(struct bioscfg_prop *prop, char *buf);
>         ssize_t (*store)(struct bioscfg_prop *prop, const char *buf, size=
_t count);
> };
>
> /* this is one implementation for *all* property types */
> static ssize_t display_name_show(struct bioscfg_prop *prop, char *buf)
> {
>         return sysfs_emit(buf, prop->display_name);
> }
> static struct bioscfg_attribute display_name =3D __ATTR_RO(display_name);
>
> /* and all the other ones */
>
> /* this dispatches into the type-specific property handlers */
> static ssize_t current_value_show(struct bioscfg_prop *prop, char *buf)
> {
>         return prop->ops->show_current_value(prop, buf);
> }
> static struct bioscfg_attribute current_value =3D __ATTR(current_value);
>
> static struct attribute *attrs[] =3D {
>         &display_name.attr,
>         /* other attrs here */
>         NULL
> };
>
> /* reflect read-only mode in sysfs */
> static umode_t bioscfg_attr_is_visible(struct kobject *kobj, struct attri=
bute *attr, int n)
> {
>         struct bios_property *prop =3D container_of(kobj, struct bios_pro=
perty, kobj);
>
>         if (attr =3D=3D &current_value.attr && prop->read_only)
>                 return attr->mode ^ 0222; /* clear writable bits */
>         return attr->mode;
> }
>
> static const struct attribute_group attr_group =3D {
>         .attrs      =3D attrs,
>         .is_visible =3D bioscfg_attr_is_visible,
> };
>
> /* the following two functions dispatch from your the core kobj pointer
>  * to your custom callbacks operating on nice bioscfg_attribute
>  */
> static ssize_t bioscfg_attr_show(struct kobject *kobj, struct attribute *=
attr,
>                                  char *buf)
> {
>         struct bioscfg_attribute *kattr;
>         ssize_t ret =3D -EIO;
>
>         kattr =3D container_of(attr, struct bioscfg_attribute, attr);
>         if (kattr->show)
>                 ret =3D kattr->show(kobj, kattr, buf);
>         return ret;
> }
>
> static ssize_t bioscfg_attr_store(struct kobject *kobj, struct attribute =
*attr,
>                                   const char *buf, size_t count)
> {
>         struct bioscfg_attribute *kattr;
>         ssize_t ret =3D -EIO;
>
>         kattr =3D container_of(attr, struct bioscfg_attribute, attr);
>         if (kattr->store)
>                 ret =3D kattr->store(kobj, kattr, buf, count);
>         return ret;
> }
>
> static const struct sysfs_ops bioscfg_kobj_sysfs_ops =3D {
>         .show   =3D bioscfg_attr_show,
>         .store  =3D bioscfg_attr_store,
> };
>
> /* to hook this into the generic kobject machinery */
> static const struct kobj_type bioscfg_kobj_type =3D {
>         .release        =3D free_struct_bios_property,
>         .sysfs_ops      =3D &bios_property_sysfs_ops,
>         .default_groups =3D attr_groups,
> };
>
> static int probe(void)
> {
>         struct bios_property *prop;
>
>         for (each property discovered via WMI) {
>                 prop =3D kzalloc(sizeof(*prop));
>                 prop->readonly =3D is_read_only(property);
>                 /* other common properties */
>                 if (is_string_property(property)) {
>                         prop->ops =3D string_property_ops;
>                         prop->string_data.current_value =3D "";
>                         /* other type-specific properties */
>                 } else {
>                         ; /* and so on for other types */
>                 }
>
>                 kobject_init(&prop->kobj, &bioscfg_kobj_type);
>                 kobject_add(&prop->kobj, parent, name);
>         }
>
>         /* Now all properties and their memory are managed by the kernel =
*/
> }
>
> Instead of having one kobj_type for all properties it would also be
> possible to create a new one for each. But I don't think it's worth it.
