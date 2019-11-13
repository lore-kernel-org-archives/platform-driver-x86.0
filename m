From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v8 1/6] software node: rename is_array to is_inline
Date: Wed, 13 Nov 2019 00:08:13 -0800
Message-ID: <20191113080813.GO13374@dtor-ws>
References: <20191108042225.45391-1-dmitry.torokhov@gmail.com>
 <20191108042225.45391-2-dmitry.torokhov@gmail.com>
 <87woc4s1xg.fsf@miraculix.mork.no>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87woc4s1xg.fsf@miraculix.mork.no>
Sender: linux-kernel-owner@vger.kernel.org
To: =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Nov 13, 2019 at 07:52:43AM +0100, Bjørn Mork wrote:
> Dmitry Torokhov <dmitry.torokhov@gmail.com> writes:
> 
> > We do not need a special flag to know if we are dealing with an array,
> > as we can get that data from ratio between element length and the data
> > size, however we do need a flag to know whether the data is stored
> > directly inside property_entry or separately.
> 
> Doesn't a non-null prop->pointer tell you this?

No it does not because pointer is a part of a union.

> 
> And inverting the flag is unnecessarily risky IMHO. An all-zero prop
> might now result in dereferencing a NULL prop->pointer instead of using
> the empty prop->value.  Now I haven't looked at the code to see if this
> is a real problem.  But I believe it's better not having to do that
> anyway...

All-zero property is a terminator and thus we will not dereference
anything.

Thanks.

-- 
Dmitry
