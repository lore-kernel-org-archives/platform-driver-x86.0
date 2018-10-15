From: Alan Cox <gnomes@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH v2] platform/x86: Add Intel AtomISP2 dummy /
 power-management driver
Date: Mon, 15 Oct 2018 11:31:03 +0100
Message-ID: <20181015113103.27dc106c@alans-desktop>
References: <20181014175427.22139-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181014175427.22139-1-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Sun, 14 Oct 2018 19:54:27 +0200
Hans de Goede <hdegoede@redhat.com> wrote:

> The Image Signal Processor found on Cherry Trail devices is brought up in
> D0 state on devices which have camera sensors attached to it. The ISP will
> not enter D3 state again without some massaging of its registers beforehand
> and the ISP not being in D3 state blocks the SoC from entering S0ix modes.
> 
> There was a driver for the ISP in drivers/staging but that got removed
> again because it never worked. It does not seem likely that a real
> driver for the ISP will be added to the mainline kernel anytime soon.
> 
> This commit adds a dummy driver which contains the necessary magic from
> the staging driver to powerdown the ISP, so that Cherry Trail devices where
> the ISP is used will properly use S0ix modes when suspended.
> 
> Together with other recent S0ix related fixes this allows S0ix modes to
> be entered on e.g. a Chuwi Hi8 Pro and a HP x2 210.
> 
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=196915
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Alan Cox <alan@linux.intel.com>

Thanks
