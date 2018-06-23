From: Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [PATCH] platform/x86: dell-smbios: make a function and a pointer
 static
Date: Sat, 23 Jun 2018 08:24:26 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1806230823500.2696@hadrien>
References: <20180621181524.30550-1-colin.king@canonical.com> <20180623002237.GG27466@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180623002237.GG27466@fury>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Colin King <colin.king@canonical.com>, Mario Limonciello <mario.limonciello@dell.com>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org



On Fri, 22 Jun 2018, Darren Hart wrote:

> On Thu, Jun 21, 2018 at 07:15:24PM +0100, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > The function dell_smbios_smm_call and pointer platform_device are
> > local to the source and do not need to be in global scope, so make
> > them static.
> >
> > Cleans up sparse warnings:
> > warning: symbol 'platform_device' was not declared. Should it be static?
> > warning: symbol 'dell_smbios_smm_call' was not declared. Should it be
> > static?
> >
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >  drivers/platform/x86/dell-smbios-smm.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/platform/x86/dell-smbios-smm.c b/drivers/platform/x86/dell-smbios-smm.c
> > index e9e9da556318..97a90bebc360 100644
> > --- a/drivers/platform/x86/dell-smbios-smm.c
> > +++ b/drivers/platform/x86/dell-smbios-smm.c
> > @@ -24,7 +24,7 @@
> >  static int da_command_address;
> >  static int da_command_code;
> >  static struct calling_interface_buffer *buffer;
> > -struct platform_device *platform_device;
> > +static struct platform_device *platform_device;
> >  static DEFINE_MUTEX(smm_mutex);
> >
> >  static const struct dmi_system_id dell_device_table[] __initconst = {
> > @@ -82,7 +82,7 @@ static void find_cmd_address(const struct dmi_header *dm, void *dummy)
> >  	}
> >  }
> >
> > -int dell_smbios_smm_call(struct calling_interface_buffer *input)
> > +static int dell_smbios_smm_call(struct calling_interface_buffer *input)
>
> Hrm. So these are passed by pointer to dell_smbios_register_device(), which is in
> turn called by dell_smbios_call() from dell-smbios-base.c.
>
> So while it is valid to make these static, since we're not referencing the
> symbol, but the pointer value instead - I do worry about the "static" suggesting
> to someone reading the code that this data is not used outside of this file,
> when it is.

Static protects the name.  The name in this case is very generic.

julia

>
> I'm not finding a position on this in coding-style.
>
> Andy, do you care to weigh in on this?
>
> --
> Darren Hart
> VMware Open Source Technology Center
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
