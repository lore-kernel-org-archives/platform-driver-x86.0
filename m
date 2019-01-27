From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 2/3] platform/x86: wmi: add WMI support to MODULE_DEVICE_TABLE()
Date: Sun, 27 Jan 2019 22:22:34 +0200
Message-ID: <CAHp75VfE0g9OVeOzJ5fBj4MGL4nv=a4S-n1fD9kfP1AaniAOGw@mail.gmail.com>
References: <cover.1548610407.git.2pi@mok.nu> <680df320c7263bdd35f87794ae12fb9a9ef3b71c.1548610407.git.2pi@mok.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <680df320c7263bdd35f87794ae12fb9a9ef3b71c.1548610407.git.2pi@mok.nu>
Sender: linux-kernel-owner@vger.kernel.org
To: Mattias Jacobsson <2pi@mok.nu>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, michal.lkml@markovi.net, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Jan 27, 2019 at 9:04 PM Mattias Jacobsson <2pi@mok.nu> wrote:
>
> The kernel provides the macro MODULE_DEVICE_TABLE() where driver authors
> can specify their device type and their array of device_ids and thereby
> trigger the generation of the appropriate MODULE_ALIAS() output. This is
> opposed to having to specify one MODULE_ALIAS() for each device. The WMI
> device type is currently not supported.
>
> While using MODULE_DEVICE_TABLE() does increase the complexity as well
> as spreading out the implementation across the kernel, it does come with
> some benefits too;
> * It makes different drivers look more similar; if you can specify the
>   array of device_ids any device type specific input to MODULE_ALIAS()
>   will automatically be generated for you.
> * It helps each driver avoid keeping multiple versions of the same
>   information in sync. That is, both the array of device_ids and the
>   potential multitude of MODULE_ALIAS()'s.
>
> Add WMI support to MODULE_DEVICE_TABLE() by adding info about struct
> wmi_device_id in devicetable-offsets.c and add a WMI entry point in
> file2alias.c.
>
> The type argument for MODULE_DEVICE_TABLE(type, name) is wmi.

> +/* Looks like: wmi:guid */
> +static int do_wmi_entry(const char *filename, void *symval, char *alias)
> +{
> +       DEF_FIELD_ADDR(symval, wmi_device_id, guid_string);
> +       if (strlen(*guid_string) != WMI_GUID_STRING_LEN) {
> +               warn("Invalid WMI device id 'wmi:%s' in '%s'\n",
> +                               *guid_string, filename);
> +               return 0;
> +       }

> +       if (snprintf(alias, 500, WMI_MODULE_PREFIX "%s", *guid_string) < 0) {

What the point to use snprintf here with arbitrary buffer size if we
exactly know 2 facts:
1. UUID string is  36 characters
2. buffer is long enough

?

> +               warn("Could not generate all MODULE_ALIAS's in '%s'\n",
> +                               filename);
> +               return 0;
> +       }
> +       return 1;
> +}

-- 
With Best Regards,
Andy Shevchenko
