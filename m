From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v2 1/1] platform/x86/intel_cht_int33fe: Split code to USB
 TypeB and TypeC variants
Date: Wed, 18 Sep 2019 14:38:35 +0300
Message-ID: <20190918113835.GA16243@kuha.fi.intel.com>
References: <20190917194507.14771-1-jekhor@gmail.com>
 <20190917194507.14771-2-jekhor@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190917194507.14771-2-jekhor@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yauhen Kharuzhy <jekhor@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Sep 17, 2019 at 10:45:07PM +0300, Yauhen Kharuzhy wrote:
> Existing intel_cht_int33fe ACPI pseudo-device driver assumes that
> hardware has TypeC connector and register related devices described as
> I2C connections in the _CRS resource.
> 
> There is at least one hardware (Lenovo Yoga Book YB1-91L/F) with micro
> USB B connector exists. It has INT33FE device in the DSDT table but
> there are only two I2C connection described: PMIC and BQ27452 battery
> fuel gauge.
> 
> Splitting existing INT33FE driver allow to maintain code for USB type B
> (AB) connector variant separately and make it simpler.

Sorry, but "Type B" is even more confusing here. Type B refers to the
Standard-B USB connector, so _not_ the micro connector family. You can
check the connector definitions from the latest USB 3.2 specification.
The standard-b definition goes something like this:

        "The standard _Type-B_ connector defined by the USB x specification."

Note that all the five supported connectors are listed in ch5
"Mechanical":

        Standard-A
        Standard-B
        Micro-B
        Micro-AB
        Type-C

So what was the problem with names that refer to the micro connector
family, for example "micro-ab" or "micro-b"?


thanks,

-- 
heikki
