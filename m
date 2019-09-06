From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH 1/3] software node: implement reference properties
Date: Fri, 6 Sep 2019 16:31:57 +0300
Message-ID: <20190906133157.GC30048@kuha.fi.intel.com>
References: <20190906043809.18990-1-dmitry.torokhov@gmail.com>
 <20190906111744.GA30048@kuha.fi.intel.com>
 <20190906124043.GS2680@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190906124043.GS2680@smile.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Sep 06, 2019 at 03:40:43PM +0300, Andy Shevchenko wrote:
> On Fri, Sep 06, 2019 at 02:17:44PM +0300, Heikki Krogerus wrote:
> > On Thu, Sep 05, 2019 at 09:38:07PM -0700, Dmitry Torokhov wrote:
> > > It is possible to store references to software nodes in the same fashion as
> > > other static properties, so that users do not need to define separate
> > > structures:
> > > 
> > > const struct software_node gpio_bank_b_node = {
> > > 	.name = "B",
> > > };
> > > 
> > > const struct property_entry simone_key_enter_props[] __initconst = {
> > > 	PROPERTY_ENTRY_U32("linux,code", KEY_ENTER),
> > > 	PROPERTY_ENTRY_STRING("label", "enter"),
> > > 	PROPERTY_ENTRY_REF("gpios", &gpio_bank_b_node, 123, GPIO_ACTIVE_LOW),
> > > 	{ }
> > > };
> > > 
> > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > 
> > This looks really good to me. I'll wait for Andy's comments on the
> > idea, but to me it makes sense.
> 
> Idea in general is fine. Though, taking into consideration, for example,
> drivers/mfd/intel-lpss-pci.c, the size of predefined structures bumps a lot.
> I think we always should keep a pointer. In this case we may not add another
> property type.

Yeah, you have a point.

thanks,

-- 
heikki
