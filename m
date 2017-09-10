From: Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH v2 03/11] mux: core: Add usb.h header with MUX_USB_* and
 and MUX_TYPEC_* state constants
Date: Sun, 10 Sep 2017 23:36:11 +0200
Message-ID: <ae96b0e1-4152-eb30-b6db-9038920e2905@axentia.se>
References: <20170905164221.11266-1-hdegoede@redhat.com>
 <20170905164221.11266-4-hdegoede@redhat.com>
 <ef2cb0f4-00c4-fac4-2bf9-cc0230dba752@axentia.se>
 <f67ce71e-208e-9be1-8556-3bfcdda99c7f@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <f67ce71e-208e-9be1-8556-3bfcdda99c7f@redhat.com>
Content-Language: en-US
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Hans de Goede <hdegoede@redhat.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Mathias Nyman <mathias.nyman@intel.com>
Cc: devel@driverdev.osuosl.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

On 2017-09-08 19:07, Hans de Goede wrote:
> Hi,
> 
> On 08-09-17 17:47, Peter Rosin wrote:
>> On 2017-09-05 18:42, Hans de Goede wrote:
>>> Add MUX_USB_* and MUX_TYPEC_* state constant defines, which can be used by
>>> USB device/host, resp. Type-C polarity/role/altmode mux drivers and
>>> consumers to ensure that they agree on the meaning of the
>>> mux_control_select() state argument.
>>>
>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>> ---

*snip*

>>> +/*
>>> + * Mux state values for Type-C polarity/role/altmode muxes.
>>> + *
>>> + * MUX_TYPEC_POLARITY_INV may be or-ed together with any other mux-state as
>>> + * inverted-polarity (Type-C plugged in upside down) can happen with any
>>> + * other mux-state.
>>> + */
>>> +#define MUX_TYPEC_POLARITY_INV		BIT(0)   /* Polarity inverted bit */
>>> +#define MUX_TYPEC_DEVICE		(0 << 1) /* USB device mode */
>>> +#define MUX_TYPEC_HOST			(1 << 1) /* USB host mode */
>>> +#define MUX_TYPEC_HOST_AND_DP_SRC	(2 << 1) /* USB host + 2 lanes DP src */
>>> +#define MUX_TYPEC_DP_SRC		(3 << 1) /* 4 lanes Display Port src */
>>> +#define MUX_TYPEC_STATES		(4 << 1)
>>
>> But USB Type-C muxes need not support just these states If I read it right?
>> USB Type-C seems to be usable for a variety of protocols and the above list
>> seems pretty much like a special case for this mux (and perhaps a set of
>> other similar muxes). But when someone with a USB Type-C mux for different
>> protocols shows up, that person will probably be frustrated by these
>> defines, no? Or is there something I don't see that limits USB-C to DP?
> 
> In general almost all hardware is limited to the above (+ analog audio over
> the 2 Sideband use pins, but I expect that to have a separate mux).
> 
> You're right, theoretically there might be other cases, e.g. there is a spec
> for HDMI over Type-C (wishful thinking from the HDMI group, no one uses this),
> but:
> 
> 1) I expect most muxes to implement the above set, that is what all
> hardware out there supports (well that or less).
> 
> 2) We can always add extra defines here, that means that a Type-C mux may
> not implement all states and return -EINVAL when asked for something it
> does not implement, which I understand is a bit weird from a mux subsys
> pov. But that can be the case anyways because even though the mux supports
> these options, the board it is used on does no necessarily have to support
> these options, e.g. there may be only 2 lanes of DP hooked up to the mux
> (or no DP at all, but then I would them to expect a different mux).
> 
> So the Type-C Port Manager already needs to be passed some platform
> data describing which features the board has and keep that in mind
> when negotiation with the dongle attached to the Type-C port, so if
> we do get boards which do HDMI and no DP, then the TCPM would simply
> never use the MUX_TYPEC_HOST_AND_DP_SRC and MUX_TYPEC_DP_SRC states.

Ok, I googled "usb type c mux" and came up with HD3SS460 from Texas as
the first hit.

http://www.ti.com/lit/ds/symlink/hd3ss460.pdf

That one has three control pins, but two of them (AMSEL and EN) are
tri-state. So 18 states in theory. However, if EN is low everything is
HighZ, so that collapses 6 states into 1, and 2 other states are reserved.
Still 11 states, which is two more than what you have implemented for
PI3USB30532. If we ignore polarity switching, it's only a one state diff.
However, when I try to make sense of the states for the HD3SS460, I don't
see anything that selects USB device or host. And I don't really see why
a Type C mux has to know that; in my head the mux should just route the
signals. And then when I look in your PI3USB30532 driver I don't seen any
such difference either. Along the same lines, the Type C mux does not
know/care if DP is source or sink. Or?

How about:

#define MUX_TYPEC_POLARITY_INV		BIT(0)   /* Polarity inverted bit */
#define MUX_TYPEC_USB			(0 << 1) /* USB only mode */
#define MUX_TYPEC_USB_AND_DP		(1 << 1) /* USB host + 2 lanes DP */
#define MUX_TYPEC_DP			(2 << 1) /* 4 lanes Display Port */
#define MUX_TYPEC_STATES		(3 << 1)

I'm not sure what 2 states the HS3SS460 have in addition to the above, but
the way I read the spec those to are variations on the MUX_TYPEC_USB_AND_DP
state, but routing the DP signals to alternate pins. Which suggests that
more documentation is needed to describe exactly what is meant when someone
selects MUX_TYPEC_USB_AND_DP?

Cheers,
Peter
