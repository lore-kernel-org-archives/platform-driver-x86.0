From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v5 10/14] software node: rename is_array to is_inline
Date: Thu, 17 Oct 2019 09:00:46 -0700
Message-ID: <20191017160046.GF35946@dtor-ws>
References: <20191011230721.206646-1-dmitry.torokhov@gmail.com>
 <20191011230721.206646-11-dmitry.torokhov@gmail.com>
 <20191014073720.GH32742@smile.fi.intel.com>
 <20191015182206.GF105649@dtor-ws>
 <20191016075940.GP32742@smile.fi.intel.com>
 <20191016165430.GD35946@dtor-ws>
 <20191017071628.GD32742@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191017071628.GD32742@smile.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Oct 17, 2019 at 10:16:28AM +0300, Andy Shevchenko wrote:
> On Wed, Oct 16, 2019 at 09:54:30AM -0700, Dmitry Torokhov wrote:
> > On Wed, Oct 16, 2019 at 10:59:40AM +0300, Andy Shevchenko wrote:
> > > On Tue, Oct 15, 2019 at 11:22:06AM -0700, Dmitry Torokhov wrote:
> > > > On Mon, Oct 14, 2019 at 10:37:20AM +0300, Andy Shevchenko wrote:
> > > > > On Fri, Oct 11, 2019 at 04:07:17PM -0700, Dmitry Torokhov wrote:
> 
> > > > > 'stored inline' -> 'embedded in the &struct...' ?
> > > > 
> > > > I was trying to have a link "stored inline" -> "is_inline".
> > > > 
> > > > Do we want to change the flag to be "is_embedded"?
> > > 
> > > In dictionaries I have
> > > 
> > > embedded <-> unilateral
> > 
> > Are you trying to show synonym or antonym here? But I am pretty sure
> > "unilateral" is either.
> 
> Antonyms. The 'unilateral' is marked as so in the dictionary.

OK, that is not something that I would ever think of as an antonym, so
even though I am not a native speaker I do not think we should be using
it here as documentation and comments are supposed to be understood by
all people from around the world and not by English majors only.

Out of curiosity, is this dictionary available online? I would really
want to see to what particular meaning of "embedded" they assign
"unilateral" as antonym so that I know better next time I see it used.

> 
> > Antonyms for our use of "embedded" are likely "detached" or
> > "disconnected".
> > 
> > > inline <-> ???
> > 
> > "out of line" but I still believe "stored separately" explains precisely
> > what we have here.
> 
> No, 'out of line' is idiom with a special meaning.

Yes, and it is also a well defined term in CS.

Thanks.

-- 
Dmitry
