From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
Subject: Re: [PATCH v8 1/6] software node: rename is_array to is_inline
Date: Wed, 13 Nov 2019 07:52:43 +0100
Message-ID: <87woc4s1xg.fsf@miraculix.mork.no>
References: <20191108042225.45391-1-dmitry.torokhov@gmail.com>
        <20191108042225.45391-2-dmitry.torokhov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191108042225.45391-2-dmitry.torokhov@gmail.com> (Dmitry
        Torokhov's message of "Thu, 7 Nov 2019 20:22:20 -0800")
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Dmitry Torokhov <dmitry.torokhov@gmail.com> writes:

> We do not need a special flag to know if we are dealing with an array,
> as we can get that data from ratio between element length and the data
> size, however we do need a flag to know whether the data is stored
> directly inside property_entry or separately.

Doesn't a non-null prop->pointer tell you this?

And inverting the flag is unnecessarily risky IMHO. An all-zero prop
might now result in dereferencing a NULL prop->pointer instead of using
the empty prop->value.  Now I haven't looked at the code to see if this
is a real problem.  But I believe it's better not having to do that
anyway...


Bj=C3=B8rn
