From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 1/1] platform/x86: Add Slim Bootloader firmware update
 signaling driver
Date: Thu, 23 Apr 2020 13:21:06 +0300
Message-ID: <CAHp75VfqWkAEk3deJmjBzeinmJY3MXTWVxO4FdBWyxcY8oXtAQ@mail.gmail.com>
References: <20200420194405.8281-1-jithu.joseph@intel.com> <20200420194405.8281-2-jithu.joseph@intel.com>
 <CAHp75VeV+HOditUphBkFoy6LLh6QKfBoC-eLixquAHLTwaz4RQ@mail.gmail.com> <ac04f1aa46234496fc88354add386da725d883ab.camel@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ac04f1aa46234496fc88354add386da725d883ab.camel@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jithu Joseph <jithu.joseph@intel.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, maurice.ma@intel.com, ravi.p.rangarajan@intel.com, sean.v.kelley@intel.com, kuo-lang.tseng@intel.com
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Apr 23, 2020 at 5:08 AM Jithu Joseph <jithu.joseph@intel.com> wrote=
:

...

> > > +static ssize_t firmware_update_request_store(struct device *dev,
> > > +                                            struct
> > > device_attribute *attr,
> > > +                                            const char *buf,
> > > size_t count)
> > > +{
> > > +       bool val;
> > > +       int ret;
> > > +
> > > +       ret =3D kstrtobool(buf, &val);
> > > +       if (ret)
> > > +               return ret;
> > > +
> > > +       ret =3D set_fwu_request(dev, val ? 1 : 0);
> >
> > Hmm... If you are going to extend this, why not to pass integer
> > directly? (And thus take one from user)
>
> We have also been thinking about  extensibility =E2=80=A6
>
> So I will modify the code to allow any u32 input by the user  to be
> passed down via wmi_set_block(), though 0 and 1 will be the only
> inputs  documented  in the ABI today.( Or did you still mean  to error
> out if the user input is something other than 0 or 1 ?)

I think the best approach is to allow to parse integer input
(kstrtouint() is good enough) and return -ERANGE for values > 1. Also
put a comment before that check why is done like this (some
justification that interface may be extended in the future or so), and
pass integer value directly to set_fwu_request().

--=20
With Best Regards,
Andy Shevchenko
