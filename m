From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v4 00/16] Software fwnode references
Date: Wed, 29 May 2019 11:29:10 +0200
Message-ID: <eb63bdfe-e863-2041-9b90-81b423f92baa@redhat.com>
References: <20190522105113.11153-1-heikki.krogerus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190522105113.11153-1-heikki.krogerus@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@infradead.org>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 5/22/19 12:50 PM, Heikki Krogerus wrote:
> Hi,
> 
> I'm not splitting this series in two after all. After thinking about
> this for some time, I decided to add support for static software
> nodes. I did not want to support them because I don't want to make it
> easy to maintain board files, but in end they make the use of the
> software nodes so much more easier compared to if we always had to
> dynamically allocate them that it's a no-brainer. The references can
> now be also described statically. Actually, those can now only be
> described statically.
> 
> Hans! I applied (hopefully) all of the fixes you proposed in v3. I
> hope you have time to test these.

I've just ran various tests with the entire series applied and
everything (superspeed host, superspeed device, DP over Type-C,
PD charging) seems to work fin, so you can add my:

Tested-by: Hans de Goede <hdegoede@redhat.com>

To the entire series.

I've 2 very minor nitpicks about the intel_cht_int33fe patches,
with those fixed, you can also add my:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

To the intel_cht_int33fe patches. I will reply to the
2 individual patches for which I've some remarks
separately.

Regards,

Hans
