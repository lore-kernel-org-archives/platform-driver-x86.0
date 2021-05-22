Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04621C2B9F2
	for <platform-driver-x86@archiver.kernel.org>; Sat, 22 May 2021 11:04:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DDB2661151
	for <platform-driver-x86@archiver.kernel.org>; Sat, 22 May 2021 11:04:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231217AbhEVLGF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 22 May 2021 07:06:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230417AbhEVLGD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 22 May 2021 07:06:03 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A203C061345
        for <platform-driver-x86@vger.kernel.org>; Sat, 22 May 2021 04:04:35 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id ot16so10342130pjb.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 22 May 2021 04:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9pPHGt2o7jXuj2+o6ryePaOwYnm2LnWHUWOavKwoMQU=;
        b=CaE01swKPBrvPLw8nL6OmBtcfjNYZnkzuUN6mENKMgpVX3QtdY/mWoHPj+TU/UH+65
         EnMiWhKw61NRQ6EbCbPYZYFENDLaGBSG++ZQh7+ufvpy4msXCxmJk8tw/hSTC6uStj7D
         N6HjVqU5lNGNjoFJbbCrPdHP1J/IjklNWAp2i4PEtlCDKAM7ve1xs9ItjnhkODPJZJU4
         IV9u/8nTOzUVG9meyRO0vir4DBlTspH9avwLorUNG5c4I5SDX3ooXbJ49B8fDR/4SaWZ
         QQHEIRhB+Jdsvxb/jb9lpu6sS1BrhJV55MoPQCjU8CVn3nB1HvetWW24SQZoM2yG39Uu
         Af8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9pPHGt2o7jXuj2+o6ryePaOwYnm2LnWHUWOavKwoMQU=;
        b=covhJ75kSHiHSyOI7Y42yq9dpmGHwpe3XGn/3i9Brg2py+OB67QETmfCyV/QWQLmaz
         Hg1JddzcECltrcfoow5ECYD+3mbuymS0xToYbDjJbrwpPwmDcLqnqnvPyg82/uK7KZIw
         6Vp4m87/ghb0Z3Z/ZeXN8+rPTQNPrFkiKKo+gnfL4QOZt8GBsQXpEsGSpYDDJ+o2mQng
         tJKkUTcNAUoifXo0WzJqfNu8vanIFZ9qdMXfMFVtdisYi+fEuwUhItlQKkTP+5Tp8ALj
         u/lyXszWTEUiYgTell85rN0yyA/fRx1JH5CbO4A7UY+2W8kLF/ssHUqL50GcgrxQoKOp
         Gidw==
X-Gm-Message-State: AOAM532wvNDeI6qemOX2kOWSCJ0SoG3n79tza908LvWk3wjL6ShsVggb
        OUOPKzTTnCW+pp+Aeur0Z2ZJI+RcoxhMkPV8xMI=
X-Google-Smtp-Source: ABdhPJwAHCIC8Hm0GJpGj5LGap/nXxCw9XkzSm8F61hNVejTSNLoxTupCJ5JyIUMsRK6mja+INMix7HmgkJba74rgS4=
X-Received: by 2002:a17:90b:1091:: with SMTP id gj17mr14073600pjb.129.1621681474875;
 Sat, 22 May 2021 04:04:34 -0700 (PDT)
MIME-Version: 1.0
References: <markpearson@lenovo.com> <20210509015708.112766-1-markpearson@lenovo.com>
 <20210509015708.112766-3-markpearson@lenovo.com>
In-Reply-To: <20210509015708.112766-3-markpearson@lenovo.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 22 May 2021 14:04:18 +0300
Message-ID: <CAHp75VfM=Vv2pe=KNYQO_hf_8Ya-m8QH481xnu+OPoZL-p8TSA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] platform/x86: think-lmi: Add WMI interface support
 on Lenovo platforms
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Divya Bharathi <divya.bharathi@dell.com>,
        Prasanth KSR <prasanth.ksr@dell.com>,
        Mario Limonciello <mario.limonciello@dell.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sun, May 9, 2021 at 5:02 AM Mark Pearson <markpearson@lenovo.com> wrote:
>
> For Lenovo platforms that support a WMI interface to the BIOS add
> support, using the firmware-attributes class, to allow users to access
> and modify various BIOS related settings.

Few comments below.

...

> +/* Convert BIOS WMI error string to suitable error code */

Can it be rather the mapping structure? In that case you move string
literals, error codes and comments to its entries.
Here will be something like for-loop.

...

> +static int tlmi_extract_error(const struct acpi_buffer *output)
> +{
> +       const union acpi_object *obj;
> +       int ret;
> +
> +       obj = output->pointer;
> +       if (!obj || obj->type != ACPI_TYPE_STRING || !obj->string.pointer) {

I would split !obj check, but I don't know if it is even a useful
check. Can it be the case?

> +               kfree(obj);

Basically you double check for NULL (see above)

Same for other similar places in the code.

> +               return -EIO;
> +       }
> +
> +       ret = tlmi_errstr_to_err(obj->string.pointer);
> +       kfree(obj);
> +       return ret;

What I really do not like here is that you are freeing something out
of the scope. Please, free it where it was acquired.

> +}

...

> +       /*
> +        * duplicated call required to match bios workaround for behavior
> +        * seen when WMI accessed via scripting on other OS

/*
 * Multi-line comments
 * should have this kind of
 * style. Pay attention to the details.
 */

> +        */

...

> +       *string = kstrdup(obj->string.pointer, GFP_KERNEL);
> +       kfree(obj);
> +       return *string ? 0 : -ENOMEM;

This breaks the principle "don't touch the output in error case".

...

> +       if (setting->valid)
> +               return sysfs_emit(buf, "1\n");
> +       else
> +               return sysfs_emit(buf, "0\n");

sysfs_emit(buf, "%d\n", !!setting->valid);
?

...

> +static ssize_t current_password_store(struct kobject *kobj,
> +                                     struct kobj_attribute *attr,
> +                                     const char *buf, size_t count)
> +{
> +       struct tlmi_pwd_setting *setting = container_of(kobj, struct tlmi_pwd_setting, kobj);
> +       int length;

> +       length = strlen(buf);
> +       if (buf[length-1] == '\n')
> +               length--;

This will prevent you from using \n in the password. Why?

> +       if (length >= TLMI_PWD_MAXLEN)
> +               return -EINVAL;

I guess password *string* length is wrong per se. count seems the
proper one which one should use.

> +
> +       memcpy(setting->password, buf, length);

> +       setting->password[length] = '\0';

Why is the password a *string*? From where that assumption comes from?

> +       return count;
> +}
> +
> +static struct kobj_attribute auth_current_password = __ATTR_WO(current_password);

...

> +       p = strchr(new_pwd, '\n');
> +       if (p)
> +               *p = '\0';

strtrim(). But see above.

> +       if (strlen(new_pwd) > setting->maxlen) {
> +               ret = -EINVAL;
> +               goto out;
> +       }

...

> +       /* Format: 'PasswordType,CurrentPw,NewPw,Encoding,KbdLang;' */
> +       len = strlen(setting->password) + strlen(encoding_options[setting->encoding])
> +               + strlen(setting->kbdlang) + 3 /* type */
> +               + strlen(new_pwd) + 6 /* punctuation and terminator*/;
> +       auth_str = kzalloc(len, GFP_KERNEL);
> +       snprintf(auth_str, len, "%s,%s,%s,%s,%s;",
> +                setting->pwd_type, setting->password, new_pwd,
> +                encoding_options[setting->encoding], setting->kbdlang);

NIH of kasprintf()

...

> +       return ret ? ret : count;

      return ret ?: count;

is shorter.

...

> +       if (strcmp(kobj->name, "Admin") == 0)
> +               return sprintf(buf, "bios-admin\n");
> +       else if (strcmp(kobj->name, "System") == 0)

Redundant 'else'

> +               return sprintf(buf, "power-on\n");
> +       return -EIO;

...

> +static struct attribute *auth_attrs[] = {
> +       &auth_is_pass_set.attr,
> +       &auth_min_pass_length.attr,
> +       &auth_max_pass_length.attr,
> +       &auth_current_password.attr,
> +       &auth_new_password.attr,
> +       &auth_role.attr,
> +       &auth_mechanism.attr,
> +       &auth_encoding.attr,
> +       &auth_kbdlang.attr,
> +       NULL,

The terminator line doesn't need a comma.

> +};

...

> +       new_setting = kstrdup(buf, GFP_KERNEL);

strtrim(buf) ?

> +       if (!new_setting)
> +               return -ENOMEM;

> +       p = strchr(new_setting, '\n');
> +       if (p)
> +               *p = '\0';

See above.

> +       alloc_len = strlen(setting->display_name) + 3 + strlen(new_setting);
> +
> +       if (tlmi_priv.pwd_admin->valid && tlmi_priv.pwd_admin->password) {
> +               auth_len += strlen(tlmi_priv.pwd_admin->password) + 1
> +                       + strlen(encoding_options[tlmi_priv.pwd_admin->encoding]) + 1
> +                       + strlen(tlmi_priv.pwd_admin->kbdlang) + 1 + 1;
> +               auth_str = kmalloc(auth_len, GFP_KERNEL);
> +               if (!auth_str) {
> +                       ret = -ENOMEM;
> +                       goto out;
> +               }
> +
> +               sprintf(auth_str, "%s,%s,%s;",
> +                               tlmi_priv.pwd_admin->password,
> +                               encoding_options[tlmi_priv.pwd_admin->encoding],
> +                               tlmi_priv.pwd_admin->kbdlang);
> +               alloc_len += auth_len;

HIN of kasprintf()

> +       }
> +
> +       set_str = kmalloc(alloc_len, GFP_KERNEL);
> +       if (!set_str) {
> +               ret = -ENOMEM;
> +               goto out;
> +       }
> +
> +       str_ix += sprintf(set_str, "%s,%s", setting->display_name, new_setting);

Ditto,

> +       if (tlmi_priv.pwd_admin->valid && tlmi_priv.pwd_admin->password)
> +               sprintf(set_str + str_ix, ",%s", auth_str);
> +       else
> +               sprintf(set_str + str_ix, ";");
> +
> +       ret = tlmi_simple_call(LENOVO_SET_BIOS_SETTINGS_GUID, set_str);
> +       if (ret)
> +               goto out;
> +
> +       if (tlmi_priv.pwd_admin->valid && tlmi_priv.pwd_admin->password)
> +               ret = tlmi_save_bios_settings(auth_str);
> +       else
> +               ret = tlmi_save_bios_settings("");

> +       if (ret)
> +               goto out;

Useless.

> +out:
> +       kfree(auth_str);
> +       kfree(set_str);
> +       kfree(new_setting);
> +       return ret ? ret : count;

Can be shorter.

> +}

> +static struct kobj_attribute attr_displ_name =
> +               __ATTR_RO(display_name);

One line (and so on for all of them).

...

> +static struct attribute *tlmi_attrs[] = {
> +       &attr_displ_name.attr,
> +       &attr_current_val.attr,
> +       &attr_possible_values.attr,
> +       NULL,

No comma.

> +};

...

> +       struct kobj_attribute *kattr;

> +       ssize_t ret = -EIO;

Useless. Use direct return.

> +
> +       kattr = container_of(attr, struct kobj_attribute, attr);
> +       if (kattr->show)
> +               ret = kattr->show(kobj, kattr, buf);
> +       return ret;

...

> +       struct kobj_attribute *kattr;
> +       ssize_t ret = -EIO;
> +
> +       kattr = container_of(attr, struct kobj_attribute, attr);
> +       if (kattr->store)
> +               ret = kattr->store(kobj, kattr, buf, count);
> +       return ret;

As above.

...

> +       for (i = 0; i < TLMI_SETTINGS_COUNT; i++) {
> +               /*Check if index is a valid setting - skip if it isn't */

Missed space.

> +               if (!tlmi_priv.setting[i])
> +                       continue;
> +
> +               /* build attribute */
> +               tlmi_priv.setting[i]->kobj.kset = tlmi_priv.attribute_kset;
> +               ret = kobject_init_and_add(&tlmi_priv.setting[i]->kobj, &attr_name_ktype,
> +                               NULL, "%s", tlmi_priv.setting[i]->display_name);
> +               if (ret)
> +                       goto fail_create_attr;
> +
> +               ret = sysfs_create_group(&tlmi_priv.setting[i]->kobj, &tlmi_attr_group);
> +               if (ret)
> +                       goto fail_create_attr;
> +       }

...

> +       int i = 0;

Why assignment?

> +       for (i = 0; i < TLMI_SETTINGS_COUNT; ++i) {
> +               char *item = NULL;
> +               int spleng = 0;
> +               int num = 0;
> +               char *p;
> +               struct tlmi_attr_setting *setting;
> +
> +               tlmi_priv.setting[i] = NULL;
> +               status = tlmi_setting(i, &item, LENOVO_BIOS_SETTING_GUID);
> +               if (ACPI_FAILURE(status))
> +                       break;
> +               if (!item)
> +                       break;
> +               if (!*item)
> +                       continue;
> +
> +               /* It is not allowed to have '/' for file name. Convert it into '\'. */
> +               spleng = strlen(item);
> +               for (num = 0; num < spleng; num++) {
> +                       if (item[num] == '/')
> +                               item[num] = '\\';
> +               }

NIH of strreplace(), but please check its name.

> +
> +               /* Remove the value part */
> +               p = strchr(item, ',');
> +               if (p)
> +                       *p = '\0';
> +
> +               /* Create a setting entry */
> +               setting = kzalloc(sizeof(struct tlmi_attr_setting), GFP_KERNEL);
> +               if (!setting) {
> +                       ret = -ENOMEM;
> +                       goto fail_clear_attr;
> +               }
> +               setting->index = i;
> +               strscpy(setting->display_name, item, TLMI_SETTINGS_MAXLEN);
> +               /* If BIOS selections supported, load those */
> +               if (tlmi_priv.can_get_bios_selections) {
> +                       ret = tlmi_get_bios_selections(setting->display_name,
> +                                       &setting->possible_values);
> +                       if (ret || !setting->possible_values)
> +                               pr_info("Error retrieving possible values for %d : %s\n",
> +                                               i, setting->display_name);
> +               }
> +               tlmi_priv.setting[i] = setting;
> +               tlmi_priv.settings_count++;
> +               kfree(item);
> +       }

I stopped here because it's full of such small issues.

Basically the summary
 - try to find the existing APIs for routines that quite often in use
(usually string operations)
 - try to make your code compact with the same level of readability


-- 
With Best Regards,
Andy Shevchenko
