From: Mattias Jacobsson <2pi@mok.nu>
Subject: Re: [PATCH] platform/x86: wmi: fix potential null pointer
 dereferences
Date: Sun, 27 Jan 2019 12:46:37 +0100
Message-ID: <20190127114636.quqb2mjmb6rozzko@mok.nu>
References: <20190122200302.19861-1-2pi@mok.nu>
 <20190126204355.GA13882@wrath>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190126204355.GA13882@wrath>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 2pi@mok.nu
List-Id: platform-driver-x86.vger.kernel.org

Hi Darren,

On 2019-01-26, Darren Hart wrote:
> On Tue, Jan 22, 2019 at 09:03:01PM +0100, Mattias Jacobsson wrote:
> > In the function wmi_dev_match() there are three variables that
> > potentially can result in a null pointer dereference. Namely:
> 
> Is this something you have observed? This gets called when a new driver
> registered for each unassociated device on the bus, so I'm not
> immediately seeing how dev or driver would end up being NULL here.

I've observed that wmi_driver->id_table can be NULL, that can happen
when a WMI driver registers itself without specifying an id_table.

When adding a NULL check for wmi_driver->id_table, it felt wrong to not
do the same check for driver. After all, driver is a pointer given to me
from someone else, and can therefore be NULL. The same reasoning applies
to dev.

> 
> See: Documentation/driver-model/bus.txt
> 
> -- 
> Darren Hart
> VMware Open Source Technology Center

Thanks,
Mattias
