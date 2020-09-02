From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] Introduce support for Systems Management Driver over WMI
 for Dell Systems
Date: Wed, 2 Sep 2020 11:04:57 +0300
Message-ID: <CAHp75Vfxgf4ttL931M08WqiWVELtZQotHvikDbmrTGkOyd=ZtQ@mail.gmail.com>
References: <20200730143122.10237-1-divya_bharathi@dell.com> <9b0e8473-1582-eb02-70f4-0f25d09c720c@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9b0e8473-1582-eb02-70f4-0f25d09c720c@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Divya Bharathi <divya27392@gmail.com>, Darren Hart <dvhart@infradead.org>, LKML <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Divya Bharathi <divya.bharathi@dell.com>, Mario Limonciello <mario.limonciello@dell.com>, Prasanth KSR <prasanth.ksr@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Sep 1, 2020 at 5:58 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 7/30/20 4:31 PM, Divya Bharathi wrote:

...

> > +bool get_pending_changes(void)
> > +{
> > +     struct wmi_interface_priv *priv;
> > +
> > +     priv = get_first_interface_priv();
> > +     if (priv)
> > +             return priv->pending_changes;

> > +     return 0;

0 is not boolean.

> > +}

...

> > +int set_attribute(const char *a_name, const char *a_value)
> > +{

> > +     int ret = -1;
> > +     int i;
> > +     u8 *name_len, *value_len;
> > +     char *current_password, *attribute_name, *attribute_value;
> > +     size_t security_area_size;
> > +     size_t string_area_size;
> > +     size_t buffer_size;
> > +     struct wmi_interface_priv *priv;
> > +     char *buffer;

Consider to use reversed xmas tree order. And what -1 means?

> > +     /* look up if user set a password for the requests */
> > +     current_password = get_current_password("Admin");
> > +     if (!current_password)
> > +             return -ENODEV;
>
> Can we instead of passing "Admin" and "System" to this function
> just have 2 separate get_current_admin_password and get_current_system_password
> helpers and then drop the error handling ?
>
> > +
> > +     /* password is set */
> > +     if (strlen(current_password) > 0)
> > +             security_area_size = (sizeof(u32) * 2) + strlen(current_password) +
> > +                                     strlen(current_password) % 2;
> > +     /* password not set */
> > +     else
> > +             security_area_size = sizeof(u32) * 2;
>
> Since you are using more then 1 line here please use {} around the state-ments,
> also please put the /* password not set */ after the else:
>
>                 ...
>         } else { /* password not set */
>                 ...
>
> > +     string_area_size = (strlen(a_name) + strlen(a_value))*2;
> > +     buffer_size = security_area_size + string_area_size + sizeof(u16) * 2;
> > +
> > +     buffer = kzalloc(buffer_size, GFP_KERNEL);

Actually above looks like home grown kasprintf() implementation.

> > +     if (!buffer)
> > +             return -ENOMEM;
> > +
> > +     /* build security area */
> > +     if (strlen(current_password) > 0)
> > +             populate_security_buffer(buffer, current_password);

> > +     name_len = buffer + security_area_size;
> > +     attribute_name = name_len + sizeof(u16);
> > +     value_len = attribute_name + strlen(a_name)*2;
> > +     attribute_value = value_len + sizeof(u16);
> > +
> > +     /* turn into UTF16 strings, no NULL terminator */
> > +     *name_len = strlen(a_name)*2;
> > +     *value_len = strlen(a_value)*2;
> > +     for (i = 0; i < strlen(a_name); i++)
> > +             attribute_name[i*2] = a_name[i];
> > +     for (i = 0; i < strlen(a_value); i++)
> > +             attribute_value[i*2] = a_value[i];
>
> This assumes the incoming string is ASCII only and won't
> work when the incoming string is UTF-8. It is probably
> better to use the utf8s_to_utf16s() helper from the nls
> code, this will mean adding a dependency on CONFIG_NLS
> which typically is used for filesystem code, but I think
> that that will be fine.

+1. Also my thought.

> > +     mutex_lock(&call_mutex);
> > +     priv = get_first_interface_priv();
> > +     if (!priv) {
> > +             ret = -ENODEV;

> > +             pr_err(DRIVER_NAME ": no WMI backend bound");

If you wish, define pr_fmt() rather than putting this DRIVER_NAME to
each of the pr_*() call.

> > +             goto out_set_attribute;
> > +     }
> > +
> > +     ret = call_biosattributes_interface(priv->wdev, buffer, buffer_size,
> > +                                             SETATTRIBUTE_METHOD_ID);
> > +     if (ret == -EOPNOTSUPP)
> > +             dev_err(&priv->wdev->dev, "admin password must be configured");
> > +     else if (ret == -EACCES)
> > +             dev_err(&priv->wdev->dev, "invalid password");
> > +
> > +     priv->pending_changes = 1;
> > +out_set_attribute:
> > +     kfree(buffer);
> > +     mutex_unlock(&call_mutex);
> > +
> > +     return ret;
> > +}

Above comments, as a rule of thumb, should be considered against
entire code (where appropriate and applicable).

-- 
With Best Regards,
Andy Shevchenko
