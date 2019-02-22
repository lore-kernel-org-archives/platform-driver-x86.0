From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 0/2] platform/x86: intel_cht_int33fe: Start using software
 nodes
Date: Fri, 22 Feb 2019 17:31:32 +0100
Message-ID: <d0e10d6f-efb5-0139-d6c9-edb66c97c0b6@redhat.com>
References: <20190219115959.55553-1-heikki.krogerus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190219115959.55553-1-heikki.krogerus@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Andy Shevchenko <andy@infradead.org>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 2/19/19 12:59 PM, Heikki Krogerus wrote:
> Hi guys,
> 
> The software nodes support node hierarchy. By using them with fusb302
> we can add a separate fwnode also for the USB connector as a child of
> fusb302. We can then use the "standard" USB connector device
> properties with the connector node, and stop using the deprecated
> fusb302 specific properties.
> 
> Since the goal is to ultimately move to the software node API from the
> old device property API, converting also max17047 in this series.
> 
> If you test this now (before v5.1-rc1 is out), then the series depends
> Greg's latest usb-next:
> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/log/?h=usb-next
> 
> and on a patch in Rafael's latest linux-next branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/commit/?h=linux-next&id=344798206f171c5abea7ab1f9762fa526d7f539d

Interesting series, I like the direction this is heading in.

Question, I currently have this hack to test DP over Type-C on the
GPD-pocket / GPD-win:

https://github.com/jwrdegoede/linux-sunxi/commit/f481b7032030dcdda1ccc39875eb59f996d3e775

Do this properly we need to add alt-modes support for usb-c-connector nodes to:
Documentation/devicetree/bindings/connector/usb-connector.txt

Do you have any ideas for what the binding this should look like, we need to
specify a svid, mode and vdo tripple in this case. Maybe use an u32 array
with 3, 6, 9, ... entries depending on how much alt-modes the fwnode needs to
specify ?

Regards,

Hans
