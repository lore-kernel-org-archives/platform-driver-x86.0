From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v5 04/14] software node: mark internal macros with double
 underscores
Date: Tue, 15 Oct 2019 11:09:29 -0700
Message-ID: <20191015180929.GC105649@dtor-ws>
References: <20191011230721.206646-1-dmitry.torokhov@gmail.com>
 <20191011230721.206646-5-dmitry.torokhov@gmail.com>
 <20191015120350.GF32742@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191015120350.GF32742@smile.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Oct 15, 2019 at 03:03:50PM +0300, Andy Shevchenko wrote:
> On Fri, Oct 11, 2019 at 04:07:11PM -0700, Dmitry Torokhov wrote:
> > Let's mark PROPERTY_ENTRY_* macros that are internal with double leading
> > underscores so users are not tempted to use them.
> 
> We may undef them at the end of file, right?

No... the macro substitution happens at the point of final use, so
somewhere in .c file.

Thanks.

-- 
Dmitry
