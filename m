From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v4] platform: x86: Add ACPI driver for ChromeOS
Date: Wed, 10 Jun 2020 14:40:33 -0700
Message-ID: <20200610214033.GB248110@dtor-ws>
References: <20200413134611.478441-1-enric.balletbo@collabora.com>
 <CAJZ5v0gWZ27_DwWQadsJOUxLo4a0rAMe45d4AWXS2gHJZfgfKg@mail.gmail.com>
 <a2953d50-da22-279a-f1e4-faa796d815b1@collabora.com>
 <10490419.gsntqH5CaE@kreacher>
 <4e7f8bf3-b72b-d418-ec95-e1f8c3d61261@collabora.com>
 <59771d3689da41a5bbc67541aa6f4777@AUSX13MPC105.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-acpi-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <59771d3689da41a5bbc67541aa6f4777@AUSX13MPC105.AMER.DELL.COM>
Sender: linux-acpi-owner@vger.kernel.org
To: Mario.Limonciello@dell.com
Cc: enric.balletbo@collabora.com, rjw@rjwysocki.net, rafael@kernel.org, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, lenb@kernel.org, kernel@collabora.com, groeck@chromium.org, bleung@chromium.org, dtor@chromium.org, gwendal@chromium.org, vbendeb@chromium.org, andy@infradead.org, ayman.bagabas@gmail.com, benjamin.tissoires@redhat.com, blaz@mxxn.io, dvhart@infradead.org, gregkh@linuxfoundation.org, hdegoede@redhat.com, jeremy@system76.com, 2pi@mok.nu, mchehab+samsung@kernel.org, rajatja@google.com, srinivas.pandruvada@linux.intel.com, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jun 10, 2020 at 09:28:36PM +0000, Mario.Limonciello@dell.com wrote:
> > 
> > To give you some references, if I'm not wrong, this prefix is used in all
> > or
> > almost all Intel Chromebook devices (auron, cyan, eve, fizz, hatch,
> > octopus,
> > poppy, strago ...) The ACPI source for this device can be found here [1],
> > and,
> > if not all, almost all Intel based Chromebooks are shipped with the
> > firmware
> > that supports this.
> 
> You can potentially carry a small patch in your downstream kernel for the
> legacy stuff until it reaches EOL.  At least for the new stuff you could
> enact a process that properly reserves unique numbers and changes the driver
> when the interface provided by the ACPI device has changed.

If we use this prefix for hatch EOL is ~7 years from now.

Thanks.

-- 
Dmitry
