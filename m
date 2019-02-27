From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH 0/2] platform/x86: intel_cht_int33fe: Start using
 software nodes
Date: Wed, 27 Feb 2019 11:37:36 +0200
Message-ID: <20190227093736.GC27730@kuha.fi.intel.com>
References: <20190219115959.55553-1-heikki.krogerus@linux.intel.com>
 <d0e10d6f-efb5-0139-d6c9-edb66c97c0b6@redhat.com>
 <20190225154823.GA2808@kuha.fi.intel.com>
 <be150dea-7c55-f0f4-501f-5818e0b3873c@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <be150dea-7c55-f0f4-501f-5818e0b3873c@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Feb 25, 2019 at 08:14:55PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 25-02-19 16:48, Heikki Krogerus wrote:
> > On Fri, Feb 22, 2019 at 05:31:32PM +0100, Hans de Goede wrote:
> > > Hi,
> > > 
> > > On 2/19/19 12:59 PM, Heikki Krogerus wrote:
> > > > Hi guys,
> > > > 
> > > > The software nodes support node hierarchy. By using them with fusb302
> > > > we can add a separate fwnode also for the USB connector as a child of
> > > > fusb302. We can then use the "standard" USB connector device
> > > > properties with the connector node, and stop using the deprecated
> > > > fusb302 specific properties.
> > > > 
> > > > Since the goal is to ultimately move to the software node API from the
> > > > old device property API, converting also max17047 in this series.
> > > > 
> > > > If you test this now (before v5.1-rc1 is out), then the series depends
> > > > Greg's latest usb-next:
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/log/?h=usb-next
> > > > 
> > > > and on a patch in Rafael's latest linux-next branch:
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/commit/?h=linux-next&id=344798206f171c5abea7ab1f9762fa526d7f539d
> > > 
> > > Interesting series, I like the direction this is heading in.
> > > 
> > > Question, I currently have this hack to test DP over Type-C on the
> > > GPD-pocket / GPD-win:
> > > 
> > > https://github.com/jwrdegoede/linux-sunxi/commit/f481b7032030dcdda1ccc39875eb59f996d3e775
> > > 
> > > Do this properly we need to add alt-modes support for usb-c-connector nodes to:
> > > Documentation/devicetree/bindings/connector/usb-connector.txt
> > 
> > Yes, this is a topic I wanted to talk about.
> > 
> > > Do you have any ideas for what the binding this should look like, we need to
> > > specify a svid, mode and vdo tripple in this case. Maybe use an u32 array
> > > with 3, 6, 9, ... entries depending on how much alt-modes the fwnode needs to
> > > specify ?
> > 
> > My idea was to use sub-nodes, i.e. every alt mode a connector supports
> > would need to have its own child node under the connector node. Those
> > sub-nodes could then have a device property "svid" and another device
> > property "vdo", etc.
> 
> Right, after sending this mail I realized myself that using child-nodes
> to group the svid and vdo together was the right answer. So we
> could add child-nodes with a binding like this:
> 
> Optionally an "usb-c-connector" can have child nodes, describing
> supported alt-modes.
> 
> Required properties for usb-c-connector altmode child-nodes:
> compatible:  "usb-type-c-altmode"
> svid:        integer, Standard or Vendor ID for the altmode (u16 stored in an u32) property and an u32
> vdo:         integer, Vendor Data Object, VDO describing the altmode capabilies, SVID specific
> 
> I'm not sure if we also need to specify the altmode index here, or
> we simple assign each alt-mode an index while enumerating?

I don't think we need the index. SVID and VDO are enough.

> > I think that approach would be OK in DT, and we can now support it also
> > with the software nodes, and even in ACPI there are now something
> > called "data nodes" which can be used for this purpose.
> 
> Ack.
> 
> > There are some questions though. That "USB connector" node description
> > relies on OF graph, so should we just extend those "endpoint" nodes
> > (which are sub-nodes), or should be still have dedicated sub-nodes for
> > the alt modes? I think we may need dedicated nodes for the alt modes
> > in any case if we choose to use this approach.
> 
> Right I'm thinking dedicated nodes for the alt modes.
> 
> I guess an alt-mode could have a port child-node to point to say the
> DisplayPort pins / mux connection ?  I'm not entirely sure how the graph
> stuff will work here, but I guess that from a DT pov it will be desirable
> to be able to describe where the datalines for the alt-mode come from,
> maybe in combination with what the "mux/select" value is for the mux ???

I don't know what is the correct approach here. In a way it would feel
logical to assign the mux connection to the alt mode child-node, but
on the other hand the alt mode child-nodes are not real "device nodes"
that represent some physical device like the connector node does. The
alt mode child-node is more like a representation of a device
function. It is unlikely that a connector has multiple muxes to deal
with even when it supports multiple alt modes.

I think if I had to vote on this, I would prefer to link the muxing
with the connector node, and not the alt mode child-node.


thanks,

-- 
heikki
