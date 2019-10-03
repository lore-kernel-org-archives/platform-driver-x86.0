From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v4 00/14] software node: add support for reference
 properties
Date: Wed, 2 Oct 2019 17:32:27 -0700
Message-ID: <20191003003227.GA246700@dtor-ws>
References: <20190911051231.148032-1-dmitry.torokhov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190911051231.148032-1-dmitry.torokhov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rafael@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi Rafael,

On Tue, Sep 10, 2019 at 10:12:17PM -0700, Dmitry Torokhov wrote:
> These series implement "references" properties for software nodes as true
> properties, instead of managing them completely separately.
> 
> The first 10 patches are generic cleanups and consolidation and unification
> of the existing code; patch #11 implements PROPERTY_EMTRY_REF() and friends;
> patch #12 converts the user of references to the property syntax, and patch
> #13 removes the remains of references as entities that are managed
> separately.

Now that merge window is over could you please take a look at the
series?

Thanks!

-- 
Dmitry
