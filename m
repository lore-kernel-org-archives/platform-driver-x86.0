From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3 03/13] software node: get rid of property_set_pointer()
Date: Mon, 9 Sep 2019 12:55:05 +0300
Message-ID: <20190909095505.GQ2680@smile.fi.intel.com>
References: <20190909081557.93766-1-dmitry.torokhov@gmail.com>
 <20190909081557.93766-4-dmitry.torokhov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190909081557.93766-4-dmitry.torokhov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Sep 09, 2019 at 01:15:47AM -0700, Dmitry Torokhov wrote:
> Instead of explicitly setting values of integer types when copying property
> entries lets just copy entire value union when processing non-array values.
> 
> When handling array values assign the pointer there using the newly introduced
> "raw" pointer union member. This allows us to remove property_set_pointer().

Is this reincarnation of 318a19718261?
Have you read 63dcc7090137?

From me NAK.

-- 
With Best Regards,
Andy Shevchenko
