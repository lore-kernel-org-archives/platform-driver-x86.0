From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3 2/3] platform/x86: wmi: add WMI support to MODULE_DEVICE_TABLE()
Date: Wed, 30 Jan 2019 18:01:19 +0200
Message-ID: <CAHp75VcLizx+jtMrbc3Ev-HcJVEjH2naFC0sj=7fX5nZSCGc8Q@mail.gmail.com>
References: <cover.1548860212.git.2pi@mok.nu> <ae59210f24d66516a0af38c03fd0da923dd0e7da.1548860212.git.2pi@mok.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ae59210f24d66516a0af38c03fd0da923dd0e7da.1548860212.git.2pi@mok.nu>
Sender: linux-kernel-owner@vger.kernel.org
To: Mattias Jacobsson <2pi@mok.nu>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, michal.lkml@markovi.net, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jan 30, 2019 at 5:15 PM Mattias Jacobsson <2pi@mok.nu> wrote:
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
>
> Suggested-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> Signed-off-by: Mattias Jacobsson <2pi@mok.nu>
> ---
>
> What do you think about this usage of snprintf()? Now we check if there
> is an error or if the printed string tried to exceeded the buffer.
> Ideally 500 should be a macro or a parameter, but there isn't one
> available. The number 500 comes from a few lines below in the function
> do_table().

This looks better, though minor comments.

Indeed, 500 would be nicer to be defined as a constant (via preprocessor ma=
cro).

> +/* Looks like: wmi:guid */
> +static int do_wmi_entry(const char *filename, void *symval, char *alias)
> +{
> +       DEF_FIELD_ADDR(symval, wmi_device_id, guid_string);
> +       if (strlen(*guid_string) !=3D UUID_STRING_LEN) {
> +               warn("Invalid WMI device id 'wmi:%s' in '%s'\n",
> +                               *guid_string, filename);
> +               return 0;
> +       }
> +

> +       int len =3D snprintf(alias, 500, WMI_MODULE_PREFIX "%s", *guid_st=
ring);

Please, split declaration and assignment...

> +

...and drop this line.

> +       if (len < 0 || len >=3D 500) {

Would it even possible to get a negative number here?
Same for any other number than slightly bigger than 36.

You have above a check and here is the matter of either sudden
replacement of the string during the operation or how snprintf is
broken itself.
Do you have a case in mind which can bring to the above conditions?

> +               warn("Could not generate all MODULE_ALIAS's in '%s'\n",
> +                               filename);
> +               return 0;
> +       }

On top of that you have an ordinary case here and in similar ones we
don't care about buffer size at all (perhaps BUILD_BUG_ON() what is
needed here).

So, what about simple

{
 DEF_FIELD_ADDR(...);
 size_t len;

 len =3D strlen(*guid_string);
 if (len !=3D ...) {
  ...
 }
sprintf(...);
return 1;
}

?

> +       return 1;
> +}
> +
>  /* Does namelen bytes of name exactly match the symbol? */
>  static bool sym_is(const char *name, unsigned namelen, const char *symbo=
l)
>  {
> @@ -1357,6 +1378,7 @@ static const struct devtable devtable[] =3D {
>         {"fslmc", SIZE_fsl_mc_device_id, do_fsl_mc_entry},
>         {"tbsvc", SIZE_tb_service_id, do_tbsvc_entry},
>         {"typec", SIZE_typec_device_id, do_typec_entry},
> +       {"wmi", SIZE_wmi_device_id, do_wmi_entry},
>  };
>
>  /* Create MODULE_ALIAS() statements.
> --
> 2.20.1
>


--=20
With Best Regards,
Andy Shevchenko
