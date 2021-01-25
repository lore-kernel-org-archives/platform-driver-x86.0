Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E767C433DB
	for <platform-driver-x86@archiver.kernel.org>; Mon, 25 Jan 2021 21:32:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F2A52083E
	for <platform-driver-x86@archiver.kernel.org>; Mon, 25 Jan 2021 21:32:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731802AbhAYVce (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 25 Jan 2021 16:32:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732708AbhAYVcY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 25 Jan 2021 16:32:24 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C38BC06174A
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Jan 2021 13:31:04 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id z21so9836200pgj.4
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Jan 2021 13:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7qgDfFXorEaIavEWb0TCOGbL0bXPHTvW95gzHLCNhkc=;
        b=bd7+ONTNlV5o7/uWgzVUz18/SC2IaCmxB2kLKV8ZLIsurKidDcxOdCjKPEwEQAXvjG
         GWIRhuF0n0RhQBwn1b2tXlVnHRK9brPMqGcVpfFjvbR05nX4/ei3P0l4yJaJrB1+x2Ls
         o8oqKwSToaV8lS2dTaTUJUAe1504HaOiIjH+eYw50wRYepExb/LQfeEm5A7y1cYoJ9VP
         2NPVKUVTCjqJtIhINbZajmgnrBcZ+qhwW7vUHvgMK3Vuj+8VVtm43ikfFktxDQjd8jYL
         x1SuvuahC7n0S83zWGD3sxgKod6dgB0uKUdQvhaWLngZ51Qok/A3V89pmkY3QNUlqRhh
         7oGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7qgDfFXorEaIavEWb0TCOGbL0bXPHTvW95gzHLCNhkc=;
        b=KFAZRufcTpl9J4I998shSZt6EREf64kVjWC/w8L0/mBsaiI10oH1zm0ee33p7FZu9N
         LkejedFi+w3ozodNYQny3j2DGz5WIWF1NIh64sfE05RFK61KrKs8N8rsNkJ9f5ko2lWz
         VEQYm7g06vHk2jQOwD0cbowrlt+QznAonTNHYoeZP81XJtOc2FjwCHFgC9EJEC0NomX/
         yhgSJr4OLYF9/dhcDARu5C85tivunIscZ4TH/flKAlm/My2hcK+GLEznZ7ME6ELO7wob
         RROE5rN+UkZsXmcnrh2vUNOW0mNzr0JZogUZ37DgjUBCsjwUInZxXCpaGylqEoalHgdZ
         TtOQ==
X-Gm-Message-State: AOAM530IN9OlnxAOtbKHeG3ngmCY/ODwToHT4pWq0dMLeSPhPMU4a24f
        VmlNyHTBMEryjyf3bKAVD4hrhZdAhpegC6reA0A=
X-Google-Smtp-Source: ABdhPJyeGxgLLGecsG+HYBOtxnYTkS6rbNmu4o6YRih650Xks6IiymbzOMn2ycvRfmiwg7C9/Ihpz1OZWL3DRLDEMY0=
X-Received: by 2002:a05:6a00:854:b029:1b7:6233:c5f with SMTP id
 q20-20020a056a000854b02901b762330c5fmr2125160pfk.73.1611610263852; Mon, 25
 Jan 2021 13:31:03 -0800 (PST)
MIME-Version: 1.0
References: <20210125025916.180831-1-nitjoshi@gmail.com>
In-Reply-To: <20210125025916.180831-1-nitjoshi@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 25 Jan 2021 23:30:47 +0200
Message-ID: <CAHp75VddS69zFvfWem9ZkzAkTFG2yxPKzT7OpH1GAcNiqAZJkA@mail.gmail.com>
Subject: Re: [PATCH] [v2] platform/x86: thinkpad_acpi: set keyboard language
To:     Nitin Joshi <nitjoshi@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Benjamin Berg <bberg@redhat.com>, peter.hutterer@redhat.com,
        maruichit@lenovo.com, Mark Pearson <mpearson@lenovo.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Nitin Joshi <njoshi1@lenovo.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Jan 25, 2021 at 5:03 AM Nitin Joshi <nitjoshi@gmail.com> wrote:
>
> From: Nitin Joshi <njoshi1@lenovo.com>
>

Maybe it's a bit late, but... nevertheless my comments below.

> This patch is to create sysfs entry for setting keyboard language

create a sysfs

> using ASL method. Some thinkpads models like T580 , T590 , T15 Gen 1
> etc. has "=", "(',")" numeric keys, which are not displaying correctly,
> when keyboard language is other than "english".
> This patch fixes this issue by setting keyboard language to ECFW.

> +This feature is used to set keyboard language to ECFW using ASL interface.
> +Fewer thinkpads models like T580 , T590 , T15 Gen 1 etc.. has "=", "(',
> +")" numeric keys, which are not displaying correctly, when keyboard language
> +is other than "english". This is because of default keyboard language in ECFW

because the default

> +is set as "english". Hence using this sysfs, user can set correct keyboard

the user can set the correct

> +language to ECFW and then these key's will work correctly .
> +
> +Example of command to set keyboard language is mentioned below::
> +
> +        echo jp > /sys/devices/platform/thinkpad_acpi/keyboard_lang
> +
> +Text corresponding to keyboard layout to be set in sysfs are : jp (Japan), be(Belgian),
> +cz(Czech), en(English), da(Danish), de(German), es(Spain) , et(Estonian),
> +fr(French) , fr-ch (French(Switzerland)), pl(Polish), sl(Slovenian), hu
> +(Hungarian), nl(Dutch), tr(Turkey), it(Italy), sv(Sweden), pt(portugese)

Can we keep this sorted?
Also see below.

...

> +struct keyboard_lang_data keyboard_lang_data[] = {
> +       {"en", 0},

0x0000 ?

> +       {"be", 0x080c},
> +       {"cz", 0x0405},
> +       {"da", 0x0406},
> +       {"de", 0x0c07},
> +       {"es", 0x2c0a},
> +       {"et", 0x0425},
> +       {"fr", 0x040c},
> +       {"fr-ch", 0x100c},
> +       {"hu", 0x040e},
> +       {"it", 0x0410},
> +       {"jp", 0x0411},
> +       {"nl", 0x0413},
> +       {"nn", 0x0414},
> +       {"pl", 0x0415},
> +       {"pt", 0x0816},
> +       {"sl", 0x041b},
> +       {"sv", 0x081d},
> +       {"tr", 0x041f},
> +};

So, the above definitely has a meaning of the second byte as bit
field. I believe that be is something like be-be and so on.
We have 0x04,0x08, 0x0c, 0x2c, and 0x10. 0x04 seems like a basic
variant, what about the rest?

...

> +       if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "GSKL", &gskl_handle))) {
> +               /* Platform doesn't support GSKL */
> +               return -ENODEV;

Perhaps EOPNOTSUPP is better?

> +       }

...

> +       char select_lang[80] = "";
> +       char lang[8] = "";

I don't think we need assignments and moreover, we need these
variables. See below for the details.

> +
> +       err = get_keyboard_lang(&output);
> +       if (err)
> +               return err;
> +
> +       for (i = 0; i < ARRAY_SIZE(keyboard_lang_data); i++) {
> +               if (i)
> +                       strcat(select_lang, " ");
> +
> +               if (output == keyboard_lang_data[i].lang_code) {
> +                       strcat(lang, "[");
> +                       strcat(lang, keyboard_lang_data[i].lang_str);
> +                       strcat(lang, "]");
> +                       strcat(select_lang, lang);
> +               } else {
> +                       strcat(select_lang, keyboard_lang_data[i].lang_str);
> +               }
> +       }
> +
> +       return sysfs_emit(buf, "%s\n", select_lang);

We have sysfs_emit_at(), please use it instead of these ugly str*() calls.

> +}
> +
> +static ssize_t keyboard_lang_store(struct device *dev,
> +                               struct device_attribute *attr,
> +                               const char *buf, size_t count)
> +{
> +       int err, i;

> +       bool lang_found = false;

Redundant variable.

> +       int lang_code = 0;
> +
> +       for (i = 0; i < ARRAY_SIZE(keyboard_lang_data); i++) {
> +               if (sysfs_streq(buf, keyboard_lang_data[i].lang_str)) {
> +                       lang_code = keyboard_lang_data[i].lang_code;
> +                       lang_found = true;
> +                       break;
> +               }
> +       }

Don't we have sysfs_match_string() ?

> +       if (lang_found) {

Use traditional pattern, like

ret = sysfs_match_string(...);
if (ret < 0)
  return ret;

> +               lang_code = lang_code | 1 << 24;
> +
> +               /* Set language code */
> +               err = set_keyboard_lang_command(lang_code);
> +               if (err)
> +                       return err;
> +       } else {

> +               pr_err("Unknown Keyboard language. Ignoring\n");

Why not dev_err() ?

> +               return -EINVAL;
> +       }
> +
> +       tpacpi_disclose_usertask(attr->attr.name,
> +                       "keyboard language is set to  %s\n", buf);
> +
> +       sysfs_notify(&tpacpi_pdev->dev.kobj, NULL, "keyboard_lang");
> +
> +       return count;
> +}

> +

Redundant blank line.

> +static DEVICE_ATTR_RW(keyboard_lang);

...

> +       /*
> +        * If support isn't available (ENODEV) then don't return an error
> +        * just don't create the sysfs group

Missed period.

> +        */

...

> +       /* Platform supports this feature - create the sysfs file */
> +       err = sysfs_create_group(&tpacpi_pdev->dev.kobj, &kbdlang_attr_group);
> +
> +       return err;

return sysfs_create_group();

> +}

-- 
With Best Regards,
Andy Shevchenko
