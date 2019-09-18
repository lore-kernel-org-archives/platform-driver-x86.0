From: Yauhen Kharuzhy <jekhor@gmail.com>
Subject: Re: [PATCH v2 1/1] platform/x86/intel_cht_int33fe: Split code to USB
 TypeB and TypeC variants
Date: Wed, 18 Sep 2019 14:52:51 +0300
Message-ID: <20190918115251.GA28946@jeknote.loshitsa1.net>
References: <20190917194507.14771-1-jekhor@gmail.com>
 <20190917194507.14771-2-jekhor@gmail.com>
 <20190918113835.GA16243@kuha.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190918113835.GA16243@kuha.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Sep 18, 2019 at 02:38:35PM +0300, Heikki Krogerus wrote:
> On Tue, Sep 17, 2019 at 10:45:07PM +0300, Yauhen Kharuzhy wrote:
> > Existing intel_cht_int33fe ACPI pseudo-device driver assumes that
> > hardware has TypeC connector and register related devices described as
> > I2C connections in the _CRS resource.
> > 
> > There is at least one hardware (Lenovo Yoga Book YB1-91L/F) with micro
> > USB B connector exists. It has INT33FE device in the DSDT table but
> > there are only two I2C connection described: PMIC and BQ27452 battery
> > fuel gauge.
> > 
> > Splitting existing INT33FE driver allow to maintain code for USB type B
> > (AB) connector variant separately and make it simpler.
> 
> Sorry, but "Type B" is even more confusing here. Type B refers to the
> Standard-B USB connector, so _not_ the micro connector family. You can
> check the connector definitions from the latest USB 3.2 specification.
> The standard-b definition goes something like this:
> 
>         "The standard _Type-B_ connector defined by the USB x specification."
> 
> Note that all the five supported connectors are listed in ch5
> "Mechanical":
> 
>         Standard-A
>         Standard-B
>         Micro-B
>         Micro-AB
>         Type-C
> 
> So what was the problem with names that refer to the micro connector
> family, for example "micro-ab" or "micro-b"?

Only one problem: there is no difference between micro B, micro AB, mini
B or Standard-B types of connectors from this driver point of view – all
of them can be used for device charging. Now we have only two kind of
hardware with INT33FE pseudo-device: with Micro-B and Type-C connectors
but other kind may exist. TypeB is not standartized but it seemed to me
a good generalization of "USB connectors to charger connection but not
Type-C". No problem to change it to other suitable name, 'simple', 'dumb',
'non-TypeC' or 'micro-B'. All this names are not ideal.

-- 
Yauhen Kharuzhy
