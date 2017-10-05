From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v4 05/14] platform/x86: dell-wmi-descriptor: split WMI
 descriptor into it's own driver
Date: Thu, 5 Oct 2017 08:34:05 +0300
Message-ID: <CAHp75VdxqbPv_fUow4gFMYwTu7CNxXAxPVkoq0UDVrh-7b5YRA@mail.gmail.com>
References: <cover.1507156392.git.mario.limonciello@dell.com> <ff211830e3953c70aa8e0d43614619f1fb423668.1507156392.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ff211830e3953c70aa8e0d43614619f1fb423668.1507156392.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: "dvhart@infradead.org" <dvhart@infradead.org>, LKML <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, mjg59@google.com, Christoph Hellwig <hch@lst.de>, Greg KH <greg@kroah.com>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Oct 5, 2017 at 1:48 AM, Mario Limonciello
<mario.limonciello@dell.com> wrote:
> All communication on individual GUIDs should occur in separate drivers.
> Allowing a driver to communicate with the bus to another GUID is just
> a hack that discourages drivers to adopt the bus model.
>
> The information found from the WMI descriptor driver is now exported
> for use by other drivers.

> +       priv = list_first_entry_or_null(&wmi_list,
> +                                       struct descriptor_priv,
> +                                       list);

> +       priv = list_first_entry_or_null(&wmi_list,
> +                                       struct descriptor_priv,
> +                                       list);

static inline ...to_priv(...)
{
 return list_first_entry_...();
}

> +       list_add_tail(&priv->list, &wmi_list);

> +       list_del(&priv->list);

Do these need locking?

> +bool dell_wmi_get_interface_version(u32 *version);
> +bool dell_wmi_get_size(u32 *size);

This might need stubs when module is not selected (when functionality
is optional if it would be the case), otherwise all users should
select it explicitly.

-- 
With Best Regards,
Andy Shevchenko
