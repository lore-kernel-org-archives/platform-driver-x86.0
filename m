From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH v2] platform/x86: wmi-bmof: New driver to expose embedded
 Binary WMI MOF metadata
Date: Tue, 6 Jun 2017 15:31:22 -0700
Message-ID: <CALCETrWH9TgTF-83KG_Bndx6BRC_0eLoY6tXa_R+jyhVWFAvFA@mail.gmail.com>
References: <cd020900567e5c26af29e0735a3945a855d26a30.1496718529.git.dvhart@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-vk0-f48.google.com ([209.85.213.48]:33725 "EHLO
        mail-vk0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751430AbdFFWbo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 6 Jun 2017 18:31:44 -0400
Received: by mail-vk0-f48.google.com with SMTP id p62so52242981vkp.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 06 Jun 2017 15:31:44 -0700 (PDT)
In-Reply-To: <cd020900567e5c26af29e0735a3945a855d26a30.1496718529.git.dvhart@infradead.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Lutomirski <luto@kernel.org>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mario Limonciello <mario_limonciello@dell.com>, Rafael Wysocki <rjw@rjwysocki.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux ACPI <linux-acpi@vger.kernel.org>

On Mon, Jun 5, 2017 at 8:16 PM, Andy Lutomirski <luto@kernel.org> wrote:
> +static ssize_t
> +read_bmof(struct file *filp, struct kobject *kobj,
> +        struct bin_attribute *attr,
> +        char *buf, loff_t off, size_t count)
> +{
> +       struct bmof_priv *priv =
> +               container_of(attr, struct bmof_priv, bmof_bin_attr);
> +
> +       if (off >= priv->bmofdata->buffer.length)
> +               return 0;
> +
> +       if (count > priv->bmofdata->buffer.length - off)
> +               count = priv->bmofdata->buffer.length - off;
> +
> +       memcpy(buf, priv->bmofdata->buffer.pointer + off, count);
> +       return count;
> +}

I just discovered simple_read_from_buffer().  I think this whole
function could be:

struct bmof_priv *priv = ...;
return simple_read_from_buffer(buf, count, &off,
priv->bmofdata->buffer.pointer, priv->bmofdata->buffer.length);

--Andy
