From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v4 00/16] Software fwnode references
Date: Fri, 31 May 2019 16:42:21 +0300
Message-ID: <20190531134221.GD7167@kuha.fi.intel.com>
References: <20190522105113.11153-1-heikki.krogerus@linux.intel.com>
 <eb63bdfe-e863-2041-9b90-81b423f92baa@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <eb63bdfe-e863-2041-9b90-81b423f92baa@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@infradead.org>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, May 29, 2019 at 11:29:10AM +0200, Hans de Goede wrote:
> Hi,
> 
> On 5/22/19 12:50 PM, Heikki Krogerus wrote:
> > Hi,
> > 
> > I'm not splitting this series in two after all. After thinking about
> > this for some time, I decided to add support for static software
> > nodes. I did not want to support them because I don't want to make it
> > easy to maintain board files, but in end they make the use of the
> > software nodes so much more easier compared to if we always had to
> > dynamically allocate them that it's a no-brainer. The references can
> > now be also described statically. Actually, those can now only be
> > described statically.
> > 
> > Hans! I applied (hopefully) all of the fixes you proposed in v3. I
> > hope you have time to test these.
> 
> I've just ran various tests with the entire series applied and
> everything (superspeed host, superspeed device, DP over Type-C,
> PD charging) seems to work fin, so you can add my:
> 
> Tested-by: Hans de Goede <hdegoede@redhat.com>
> 
> To the entire series.
> 
> I've 2 very minor nitpicks about the intel_cht_int33fe patches,
> with those fixed, you can also add my:
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> 
> To the intel_cht_int33fe patches. I will reply to the
> 2 individual patches for which I've some remarks
> separately.

Thanks Hans! I'll fix those.

Cheers,

-- 
heikki
