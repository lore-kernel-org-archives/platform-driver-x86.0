Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82E3EC4708B
	for <platform-driver-x86@archiver.kernel.org>; Thu, 27 May 2021 14:17:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 65CE361157
	for <platform-driver-x86@archiver.kernel.org>; Thu, 27 May 2021 14:17:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236318AbhE0OSt (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 27 May 2021 10:18:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235170AbhE0OSt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 27 May 2021 10:18:49 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5373C061574
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 May 2021 07:17:14 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id l70so57332pga.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 May 2021 07:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pHMaMz+Q88wy4pUDLQP2p8w0+jEls8/DxQEa/0C9m2s=;
        b=SXsQX700YERqgmqgdHlASzj2G/58uh5vNlEfh7yZDqW5ag98PXGn7ishUBopQCswIG
         3yaOnvsfbsYi0YKSNMVz0b1ZTL/sqJt9g2lICqhEFJT0usplSZWA5PZ2b02S534bUD3g
         Fj1ivv0ex4uShUVuUeZ/K6G1risKZZb5VKhXOx6AmVaAjM8HCIRhWzEGzeXOFojH7jQO
         PtZfJUVBlzLav8NMukhBnENYJqtr5DogaDDrG2yd7kcDhlVof6GuOUArsa1DAmJAbpXn
         D777CuyzmXlAjHByDJgUEI6M08kWzFTPegIDychOm3Vq1hx3QWN8q+CHl+d8s/w7Un9D
         uEFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pHMaMz+Q88wy4pUDLQP2p8w0+jEls8/DxQEa/0C9m2s=;
        b=tH/oipAv/4/WG7kqCpZvmdyD7afv+fNlOAFEYZY53OcAK7BWVslWnobd5kIhXZQRX3
         jMCYyXKTcs7mUwPZKAz05q9xQ2edhxp1R3FukUeY73yekeNe1U8zaSiMD1ne2JQQfTd2
         PXvrIFYHWWwq1GO7/gfMpEO3Zjo/uHxMfbDAR9Aw8WZtggi4oUXuXBAH93LGnK2szG/L
         wwXLyPDpb9F2Ei695YV2qCxw6woQSJA+Ua92nHHPE4vN1rtf/YKOlG0Dygm7Qxe5O5w1
         bOWVGMdcWk8OMvBI9s8SCInmCxMoNW1PF4bj6MP9fxfEL2BwfguzH+UkwHsgm7QFb6F1
         vXNg==
X-Gm-Message-State: AOAM5305NG8/xqcZGhlLWyG52QgS9C/SH6udlTj1t11aFwbZKXGoWdu6
        nqflYg/8WPJDGkOGzF65F4jKHl3WDi/aqoFx/Wo=
X-Google-Smtp-Source: ABdhPJxtta24Veh7vHkQsnsbMKjI0C7Zv3cOeUGym5+4emg6GaqWr2xNvOgfuqcfWHlRDekbHUS0YzKTyQTt5/Wp0Lc=
X-Received: by 2002:a05:6a00:a1e:b029:2e2:89d8:5c87 with SMTP id
 p30-20020a056a000a1eb02902e289d85c87mr3943853pfh.73.1622125034148; Thu, 27
 May 2021 07:17:14 -0700 (PDT)
MIME-Version: 1.0
References: <markpearson@lenovo.com> <20210526201447.3686-1-markpearson@lenovo.com>
 <20210526201447.3686-3-markpearson@lenovo.com>
In-Reply-To: <20210526201447.3686-3-markpearson@lenovo.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 27 May 2021 17:16:57 +0300
Message-ID: <CAHp75Vd8wowab89tCZSJNfzAYAGCW8khD0JnmYTyT=czLT+R3A@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] platform/x86: think-lmi: Add WMI interface support
 on Lenovo platforms
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Prasanth KSR <prasanth.ksr@dell.com>,
        Divya Bharathi <divya.bharathi@dell.com>,
        Dell.Client.Kernel@dell.com,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, May 26, 2021 at 11:15 PM Mark Pearson <markpearson@lenovo.com> wrote:
>
> For Lenovo platforms that support a WMI interface to the BIOS add
> support, using the firmware-attributes class, to allow users to access
> and modify various BIOS related settings.

Thanks for an update! My comments below.

...

> +/*
> + * think-lmi.c - Think LMI BIOS configuration driver

It's not the best idea to include the file name into the file. If the
file gets renamed (by whatever reason) often this either brings an
additional burden or simply forgotten (as from my experience). I
recommend to drop the file names from the source code.

> + * Copyright(C) 2019-2021 Lenovo
> + *
> + * Original code from Thinkpad-wmi project https://github.com/iksaif/thinkpad-wmi
> + * Copyright(C) 2017 Corentin Chary <corentin.chary@gmail.com>
> + * Distributed under the GPL-2.0 license
> + */

...

> +#include <linux/acpi.h>

linux/errno.h ?

> +#include <linux/fs.h>

linux/string.h ?
linux/types.h ?

> +#include <linux/wmi.h>
> +#include "firmware_attributes_class.h"
> +#include "think-lmi.h"

...

> + * Type:
> + *  Method
> + * Arguments:
> + *  "Item,Value,Password,Encoding,KbdLang;"
> + * Example:
> + *  "WakeOnLAN,Disable,pswd,ascii,us;"

Is 'pswd' here an example of the password? Hacker's language can make
it more visible, e.g. 'pa55w0rd'.
Same for other examples.

> + */

...

> +       /*
> +        * Duplicated call required to match bios workaround for behavior

bios -> BIOS

> +        * seen when WMI accessed via scripting on other OS.
> +        */

...

> +       struct tlmi_pwd_setting *setting = container_of(kobj, struct tlmi_pwd_setting, kobj);

Candidate to have something like

#define to_tlmi_pwd_setting(obj)  container_of(...)

since it has appeared a few times.

> +       return sysfs_emit(buf, "%d\n", setting->valid);
> +}

> +

Unneeded blank line. Same for other similar places.

> +static struct kobj_attribute auth_is_pass_set = __ATTR_RO(is_enabled);

Hmm... We have already define_one_global_ro(). The problems with that
are the name and location. But perhaps you can copy that macro here
with the same name and at least we can see the common grounds to clean
up in the future. Another possibility is to comment that it can be
replaced with the above mentioned macro. Ideally would be to refactor
right now, but it's not anyhow crucial or required for this series, so
may be postponed.

...

> +       int pwdlen;

Strictly speaking it should be size_t.

> +       pwdlen = strlen(buf);
> +       if (buf[pwdlen-1] == '\n')
> +               pwdlen--;

But the question is what will happen with the string like
'pa55\nw0rd\n' (note all \n:s)?
See also below.

> +       /* pwdlen == 0 is allowed to clear the password */
> +       if (pwdlen != 0 && ((pwdlen < setting->minlen) || (pwdlen > setting->maxlen)))

The ' != 0' part is redundant.

> +               return -EINVAL;

> +       memcpy(setting->password, buf, pwdlen);
> +       setting->password[pwdlen] = '\0';

I'm not sure why we can't use strscpy() like you did in the other function.

> +       return count;

...

> +       /* Strip out CR if one is present, setting password won't work if it is present */
> +       strreplace(new_pwd, '\n', '\0');

Basically it will stop on the first one. See the strchrnul() trick below.

> +       pwdlen = strlen(new_pwd);
> +       /* pwdlen == 0 is allowed to clear the password */
> +       if (pwdlen != 0 && ((pwdlen < setting->minlen) || (pwdlen > setting->maxlen))) {

No need for ' != 0'.

> +               ret = -EINVAL;
> +               goto out;
> +       }

> +}


...

> +       int length;
> +
> +       length = strlen(buf);
> +       if (buf[length-1] == '\n')
> +               length--;
> +
> +       if (!length || (length >= TLMI_LANG_MAXLEN))
> +               return -EINVAL;
> +
> +       memcpy(setting->kbdlang, buf, length);
> +       setting->kbdlang[length] = '\0';
> +       return count;

Similar comments as per above.

...

> +       char *set_str = NULL, *new_setting = NULL;
> +       char *auth_str = NULL;

The rule of thumb is to avoid forward assignments on stack allocated
variables. It may decrease readability, hide real issues, and simply
be unneeded churn, like here. Please revisit all of them in entire
series.

...

> +       /* Strip out CR if one is present */
> +       strreplace(new_setting, '\n', '\0');

As per above.

...

> +               /* Remove the value part */
> +               strreplace(item, ',', '\0');

This is kinda non-standard pattern.

I would see rather something like

char *p;

p = strchrnul(item, ',');
*p = '\0';

Yes, it's longer, but better to understand what's going on here.

> +               /* Create a setting entry */
> +               setting = kzalloc(sizeof(struct tlmi_attr_setting), GFP_KERNEL);

sizeof(*setting) ?

> +               if (!setting) {
> +                       ret = -ENOMEM;
> +                       goto fail_clear_attr;
> +               }
> +               setting->index = i;
> +               strscpy(setting->display_name, item, TLMI_SETTINGS_MAXLEN);

...

> +       sprintf(tlmi_priv.pwd_admin->display_name, "admin");
> +       sprintf(tlmi_priv.pwd_admin->kbdlang, "us");

Not sure why you need printf() type of function here. strcpy() or
strscpy() should be enough.

...

> +       if (WARN_ON(pwdcfg.max_length >= TLMI_PWD_BUFSIZE))
> +               pwdcfg.max_length = TLMI_PWD_BUFSIZE - 1;

Not sure if WARN_ON() is really what has to be called here. But I
haven't checked the context deeply.

...

> +       sprintf(tlmi_priv.pwd_power->display_name, "power-on");
> +       sprintf(tlmi_priv.pwd_power->kbdlang, "us");

As above.

...

> +#ifndef _THINK_LMI_H_
> +#define _THINK_LMI_H_

+ linux/types.h

(At leas bool is from there)


> +#endif /* !_THINK_LMI_H_ */

-- 
With Best Regards,
Andy Shevchenko
