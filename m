From: Mattias Jacobsson <2pi@mok.nu>
Subject: Re: [PATCH v3 2/3] platform/x86: wmi: add WMI support to
 MODULE_DEVICE_TABLE()
Date: Sun, 3 Feb 2019 20:04:23 +0100
Message-ID: <20190203190423.lmsix5la6ioyawwi@mok.nu>
References: <cover.1548860212.git.2pi@mok.nu>
 <ae59210f24d66516a0af38c03fd0da923dd0e7da.1548860212.git.2pi@mok.nu>
 <CAHp75VcLizx+jtMrbc3Ev-HcJVEjH2naFC0sj=7fX5nZSCGc8Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75VcLizx+jtMrbc3Ev-HcJVEjH2naFC0sj=7fX5nZSCGc8Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, michal.lkml@markovi.net, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 2pi@mok.nu
List-Id: platform-driver-x86.vger.kernel.org

On 2019-01-30, Andy Shevchenko wrote:
> On Wed, Jan 30, 2019 at 5:15 PM Mattias Jacobsson <2pi@mok.nu> wrote:
> >
> > The kernel provides the macro MODULE_DEVICE_TABLE() where driver authors
> > can specify their device type and their array of device_ids and thereby
> > trigger the generation of the appropriate MODULE_ALIAS() output. This is
> > opposed to having to specify one MODULE_ALIAS() for each device. The WMI
> > device type is currently not supported.
> >
> > While using MODULE_DEVICE_TABLE() does increase the complexity as well
> > as spreading out the implementation across the kernel, it does come with
> > some benefits too;
> > * It makes different drivers look more similar; if you can specify the
> >   array of device_ids any device type specific input to MODULE_ALIAS()
> >   will automatically be generated for you.
> > * It helps each driver avoid keeping multiple versions of the same
> >   information in sync. That is, both the array of device_ids and the
> >   potential multitude of MODULE_ALIAS()'s.
> >
> > Add WMI support to MODULE_DEVICE_TABLE() by adding info about struct
> > wmi_device_id in devicetable-offsets.c and add a WMI entry point in
> > file2alias.c.
> >
> > The type argument for MODULE_DEVICE_TABLE(type, name) is wmi.
> >
> > Suggested-by: Pali Rohár <pali.rohar@gmail.com>
> > Signed-off-by: Mattias Jacobsson <2pi@mok.nu>
> > ---
> >
> > What do you think about this usage of snprintf()? Now we check if there
> > is an error or if the printed string tried to exceeded the buffer.
> > Ideally 500 should be a macro or a parameter, but there isn't one
> > available. The number 500 comes from a few lines below in the function
> > do_table().
> 
> This looks better, though minor comments.
> 
> Indeed, 500 would be nicer to be defined as a constant (via preprocessor macro).
> 
> > +/* Looks like: wmi:guid */
> > +static int do_wmi_entry(const char *filename, void *symval, char *alias)
> > +{
> > +       DEF_FIELD_ADDR(symval, wmi_device_id, guid_string);
> > +       if (strlen(*guid_string) != UUID_STRING_LEN) {
> > +               warn("Invalid WMI device id 'wmi:%s' in '%s'\n",
> > +                               *guid_string, filename);
> > +               return 0;
> > +       }
> > +
> 
> > +       int len = snprintf(alias, 500, WMI_MODULE_PREFIX "%s", *guid_string);
> 
> Please, split declaration and assignment...

Done.

> 
> > +
> 
> ...and drop this line.

Done.

> 
> > +       if (len < 0 || len >= 500) {
> 
> Would it even possible to get a negative number here?
> Same for any other number than slightly bigger than 36.

snprintf returns a negative number on error. BTW AFAIU the code from
file2alias.c gets dynamically linked against a libc.

> 
> You have above a check and here is the matter of either sudden
> replacement of the string during the operation or how snprintf is
> broken itself.
> Do you have a case in mind which can bring to the above conditions?
> 
> > +               warn("Could not generate all MODULE_ALIAS's in '%s'\n",
> > +                               filename);
> > +               return 0;
> > +       }
> 
> On top of that you have an ordinary case here and in similar ones we
> don't care about buffer size at all (perhaps BUILD_BUG_ON() what is
> needed here).

I used warn() as it is what is being used in similar conditions
elsewhere in the file.

> 
> So, what about simple
> 
> {
>  DEF_FIELD_ADDR(...);
>  size_t len;
> 
>  len = strlen(*guid_string);
>  if (len != ...) {
>   ...
>  }
> sprintf(...);
> return 1;
> }
> 
> ?

Then we are missing the check that we are within the bounds of alias as
well as the negative code from s*printf(). snprintf() does this nicely
for us.

> 
> > +       return 1;
> > +}
> > +
> >  /* Does namelen bytes of name exactly match the symbol? */
> >  static bool sym_is(const char *name, unsigned namelen, const char *symbol)
> >  {
> > @@ -1357,6 +1378,7 @@ static const struct devtable devtable[] = {
> >         {"fslmc", SIZE_fsl_mc_device_id, do_fsl_mc_entry},
> >         {"tbsvc", SIZE_tb_service_id, do_tbsvc_entry},
> >         {"typec", SIZE_typec_device_id, do_typec_entry},
> > +       {"wmi", SIZE_wmi_device_id, do_wmi_entry},
> >  };
> >
> >  /* Create MODULE_ALIAS() statements.
> > --
> > 2.20.1
> >
> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko

Thanks,
Mattias
