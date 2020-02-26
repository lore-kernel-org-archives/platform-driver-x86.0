From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH -next] platform/x86: intel_pmc_core: fix build error
 without CONFIG_DEBUG_FS
Date: Wed, 26 Feb 2020 10:33:08 +0200
Message-ID: <CAHp75VfkZyuu8QZ-Kc+9-yZkD_OUGxzBiXQDAQQ0oKxrJ_KR_w@mail.gmail.com>
References: <20200220033335.106963-1-chenzhou10@huawei.com>
 <CAHp75Vf3Bsjj+0ebkxMatZfUGDJ=upOHBFHfOs_PDOnFTnRJYQ@mail.gmail.com>
 <BN8PR11MB362069564569B69E42C00086F2ED0@BN8PR11MB3620.namprd11.prod.outlook.com>
 <BYAPR11MB3624FB3A1FC8F5C43D8F6DC4F2EA0@BYAPR11MB3624.namprd11.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR11MB3624FB3A1FC8F5C43D8F6DC4F2EA0@BYAPR11MB3624.namprd11.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Kammela, Gayatri" <gayatri.kammela@intel.com>, Randy Dunlap <rdunlap@infradead.org>
Cc: Chen Zhou <chenzhou10@huawei.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, "Somayaji, Vishwanath" <vishwanath.somayaji@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Feb 26, 2020 at 3:56 AM Kammela, Gayatri
<gayatri.kammela@intel.com> wrote:
> > -----Original Message-----
> > From: Kammela, Gayatri
> > Sent: Tuesday, February 25, 2020 9:11 AM
> > To: Andy Shevchenko <andy.shevchenko@gmail.com>; Chen Zhou
> > <chenzhou10@huawei.com>
> > Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>; Somayaji,
> > Vishwanath <vishwanath.somayaji@intel.com>; Darren Hart
> > <dvhart@infradead.org>; Andy Shevchenko <andy@infradead.org>;
> > Platform Driver <platform-driver-x86@vger.kernel.org>; Linux Kernel Mailing
> > List <linux-kernel@vger.kernel.org>
> > Subject: RE: [PATCH -next] platform/x86: intel_pmc_core: fix build error
> > without CONFIG_DEBUG_FS
> >
> > > -----Original Message-----
> > > From: Andy Shevchenko <andy.shevchenko@gmail.com>
> > > Sent: Tuesday, February 25, 2020 2:13 AM
> > > To: Chen Zhou <chenzhou10@huawei.com>; Kammela, Gayatri
> > > <gayatri.kammela@intel.com>
> > > Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>; Somayaji,
> > > Vishwanath <vishwanath.somayaji@intel.com>; Darren Hart
> > > <dvhart@infradead.org>; Andy Shevchenko <andy@infradead.org>;
> > Platform
> > > Driver <platform-driver-x86@vger.kernel.org>; Linux Kernel Mailing
> > > List <linux-kernel@vger.kernel.org>
> > > Subject: Re: [PATCH -next] platform/x86: intel_pmc_core: fix build
> > > error without CONFIG_DEBUG_FS
> > >
> > > On Thu, Feb 20, 2020 at 5:40 AM Chen Zhou <chenzhou10@huawei.com>
> > > wrote:
> > > >
> > > > If CONFIG_DEBUG_FS is n, build fails:
> > > >
> > > > drivers/platform/x86/intel_pmc_core.c: In function pmc_core_resume:
> > > > drivers/platform/x86/intel_pmc_core.c:1327:3: error: implicit
> > > > declaration
> > > of function pmc_core_slps0_display; did you mean
> > > pmc_core_is_pc10_failed? [-Werror=implicit-function-declaration]
> > > >    pmc_core_slps0_display(pmcdev, dev, NULL);
> > > >       ^~~~~~~~~~~~~~~~~~~~~~
> > > >
> > > > Function pmc_core_slps0_display() is responsible for displaying
> > > > debug registers, which is under CONFIG_DEBUG_FS.
> > > >
> > > > Providing the static inline stub whenever CONFIG_DEBUG_FS is
> > > > disabled to fix this. Function pmc_core_lpm_display() is the same.
> > >
> > > Thank you for the patch, but I think it's not the right approach.
> > > Basically we need to move those functions outside of #if
> > > IS_ENABLED(CONFIG_DEBUG_FS).
> > > (Move them upper).
> > Agreed
> > >
> > > Also I have noticed another issue in pmc_core_lpm_display(). It uses
> > > tgl_lpm_maps directly. It shouldn't.
> > >
> > > Cc: Gayatri.
> > >
> > > Gayatri, care to fix?
> > Hi Andy, caught this bug in our internal regression too. I will send the patch
> > shortly. Thanks!
>
> Update: Andy, I have 4 small fixes for the patch series merged in for-next branch.

I don't see it in the mailing list.
Please check if you send them correctly.

There are more bug reports coming. We must fix this ASAP.

>  I am wondering if I should send the fixup patches or if you drop the patch series from for-next branch, I can send out the new version that includes all these fixes. Please suggest. Thanks!
>
> > >
> > > > Reported-by: Hulk Robot <hulkci@huawei.com>
> > > > Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
> > > > ---
> > > >  drivers/platform/x86/intel_pmc_core.c | 14 ++++++++++++++
> > > >  1 file changed, 14 insertions(+)
> > > >
> > > > diff --git a/drivers/platform/x86/intel_pmc_core.c
> > > > b/drivers/platform/x86/intel_pmc_core.c
> > > > index f4a36fb..939f8e0 100644
> > > > --- a/drivers/platform/x86/intel_pmc_core.c
> > > > +++ b/drivers/platform/x86/intel_pmc_core.c
> > > > @@ -1117,6 +1117,20 @@ static void pmc_core_dbgfs_register(struct
> > > pmc_dev *pmcdev)
> > > >         }
> > > >  }
> > > >  #else
> > > > +static inline void pmc_core_slps0_display(struct pmc_dev *pmcdev,
> > > > +                                          struct device *dev,
> > > > +                                          struct seq_file *s) { }
> > > > +
> > > > +static inline void pmc_core_lpm_display(struct pmc_dev *pmcdev,
> > > > +                                        struct device *dev,
> > > > +                                        struct seq_file *s, u32 offset,
> > > > +                                        const char *str,
> > > > +                                        const struct pmc_bit_map
> > > > +**maps) { }
> > > > +
> > > >  static inline void pmc_core_dbgfs_register(struct pmc_dev *pmcdev)
> > > > { }
> > > > --
> > > > 2.7.4
> > > >
> > >
> > >
> > > --
> > > With Best Regards,
> > > Andy Shevchenko



--
With Best Regards,
Andy Shevchenko
