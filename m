From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH 07/12] xhci: Add option to get next extended capability
 in list by passing id = 0
Date: Fri, 16 Feb 2018 15:21:36 +0200
Message-ID: <20180216132136.GM1480@kuha.fi.intel.com>
References: <20180216104751.8371-1-hdegoede@redhat.com>
 <20180216104751.8371-8-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180216104751.8371-8-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Feb 16, 2018 at 11:47:46AM +0100, Hans de Goede wrote:
> From: Mathias Nyman <mathias.nyman@linux.intel.com>
> 
> Modify xhci_find_next_ext_cap(base, offset, id) to return the next
> capability offset if 0 is passed for id. Otherwise it will behave as
> previously and return the offset of the next capability with matching id
> 
> capability id 0 is not used by xhci (reserved)
> 
> This is useful when we want to loop through all capabilities.
> 
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

FWIW:

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>


Br,

-- 
heikki
