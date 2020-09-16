From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2] platform/x86: Add Driver to set up lid GPEs on MS
 Surface device
Date: Wed, 16 Sep 2020 20:26:56 +0300
Message-ID: <CAHp75Ve8jaYsecsQjuojrihyoVsYr7G011drmXN7q9yzt_tMnQ@mail.gmail.com>
References: <20200910211520.1490626-1-luzmaximilian@gmail.com> <EMZQgUl1xLN4o0hV9ZkCD563O85SuOYB5kNFZ5_hlxLQXbJCXpQfrM2afyFIr28h31tXMxD1mxE4DkA5Wy60A0Z2mDnstwF17tEdnX4IRas=@protonmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <EMZQgUl1xLN4o0hV9ZkCD563O85SuOYB5kNFZ5_hlxLQXbJCXpQfrM2afyFIr28h31tXMxD1mxE4DkA5Wy60A0Z2mDnstwF17tEdnX4IRas=@protonmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>
Cc: Maximilian Luz <luzmaximilian@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Hans de Goede <hdegoede@redhat.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Gayatri Kammela <gayatri.kammela@intel.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Sep 16, 2020 at 2:58 AM Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.=
com> wrote:

...

> > +             dev_err(dev, "failed to set GPE wake mask: %d\n", status)=
;
>
> I'm not sure if it's technically safe to print acpi_status with the %d fo=
rmat
> specifier since 'acpi_status' is defined as 'u32' at the moment.
>  func("%lu", (unsigned long) status)
> would be safer.

Please, no explicit castings for printf(). In 99% cases it means that
something is not being used correctly.





--=20
With Best Regards,
Andy Shevchenko
