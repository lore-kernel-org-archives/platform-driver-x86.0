From: Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v3] Add driver to force WMI Thunderbolt controller power
 status
Date: Thu, 14 Sep 2017 11:14:16 +0200
Message-ID: <20170914091416.GA28049@wunner.de>
References: <1504884191-16528-1-git-send-email-mario.limonciello@dell.com>
 <20170913172024.GA8782@wunner.de>
 <27f4070678744d0f80761a95579b4cd3@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <27f4070678744d0f80761a95579b4cd3@ausx13mpc120.AMER.DELL.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario.Limonciello@dell.com
Cc: dvhart@infradead.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, hughsient@gmail.com, yehezkelshb@gmail.com, mika.westerberg@linux.intel.com
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Sep 14, 2017 at 06:42:03AM +0000, Mario.Limonciello@dell.com wrote:
> > On Fri, Sep 08, 2017 at 10:23:11AM -0500, Mario Limonciello wrote:
> > > +static const struct wmi_device_id intel_wmi_thunderbolt_id_table[] = {
> > > +	{ .guid_string = INTEL_WMI_THUNDERBOLT_GUID },
> > > +	{ },
> > > +};
> > 
> > I'm not familiar with WMI, but don't you need a MODULE_DEVICE_TABLE here?
> > How does user space know which module to load upon receiving the uevent?
> 
> Some macros for WMI bus devices.
> https://github.com/torvalds/linux/blob/e0f25a3f2d052e36ff67a9b4db835c3e27e950d8/include/linux/wmi.h#L55
> https://github.com/torvalds/linux/blob/master/include/linux/device.h#L1487

No, the init and exit hooks defined by this macro are executed
*after* the module has been loaded.  The question was, how does
the module get loaded in the first place?

Looking at drivers/platform/x86/wmi.c:wmi_dev_uevent() it seems that
a modalias consisting of "wmi:" followed by the GUID is sent to udevd.
For udevd to then load the module, I suspect you need to add a
MODULE_DEVICE_TABLE(wmi, ...) to your driver.

Thanks,

Lukas
