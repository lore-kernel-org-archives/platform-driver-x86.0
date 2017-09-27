From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 11/12] platform/x86: dell-wmi-smbios: introduce character
 device for userspace
Date: Wed, 27 Sep 2017 09:59:36 -0700
Message-ID: <20170927165936.GF23572@fury>
References: <cover.1505999739.git.mario.limonciello@dell.com>
 <a7829a31691da18e4d28e0760645ca2a3f302b66.1505999739.git.mario.limonciello@dell.com>
 <20170925163150.GM22190@pali>
 <CAHp75Vewet4v-kwiEGd82XicaLv_XbNt6o6q+CVqYCUFnUg+oQ@mail.gmail.com>
 <23b3029bac144f17bd3a68a13cfe9cf4@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <23b3029bac144f17bd3a68a13cfe9cf4@ausx13mpc120.AMER.DELL.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario.Limonciello@dell.com
Cc: andy.shevchenko@gmail.com, pali.rohar@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, quasisec@google.com
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Sep 25, 2017 at 05:46:54PM +0000, Mario.Limonciello@dell.com wrote:
> > -----Original Message-----
> > From: Andy Shevchenko [mailto:andy.shevchenko@gmail.com]
> > Sent: Monday, September 25, 2017 12:58 PM
> > To: Pali Rohár <pali.rohar@gmail.com>
> > Cc: Limonciello, Mario <Mario_Limonciello@Dell.com>; dvhart@infradead.org;
> > LKML <linux-kernel@vger.kernel.org>; Platform Driver <platform-driver-
> > x86@vger.kernel.org>; quasisec@google.com
> > Subject: Re: [PATCH 11/12] platform/x86: dell-wmi-smbios: introduce character
> > device for userspace
> > 
> > On Mon, Sep 25, 2017 at 7:31 PM, Pali Rohár <pali.rohar@gmail.com> wrote:
> > > On Thursday 21 September 2017 08:57:16 Mario Limonciello wrote:
> > >> This userspace character device will be used to perform SMBIOS calls
> > >> from any applications sending a properly formatted 4k calling interface
> > >> buffer.
> > >>
> > >> This character device is intended to deprecate the dcdbas kernel module
> > >> and the interface that it provides to userspace.
> > >>
> > >> It's important for the driver to provide a R/W ioctl to ensure that
> > >> two competing userspace processes don't race to provide or read each
> > >> others data.
> > 
> > >> +What:                /dev/wmi-dell-wmi-smbios
> > >
> > > What about just /dev/dell-smbios? IOCTL provided here is just SMBIOS
> > > related and I think userspace does not have to care if it is via WMI or
> > > direct SMM mode... Important is that it provides character device for
> > > SMBIOS API and not how it is implemented.

I agree with this point, the implementation (WMI under the covers) is
not relevant. That said, this is an example of exposing WMI
functionality to userspace, and I DO NOT want to have a naming
discussion for every single WMI GUID that we choose to expose.

> > >
> > > Anyway, Darren, Andy, do we have some convention for naming platform
> > > character devices?
> > 
> > For me, looking to this case, seems better to expose a folder like
> > /dev/smbios/
> > with actual vendor device nodes inside like
> > /dev/smbios/dell
> 
> I disagree with this.  Dell exposes smbios calling in this kernel interface but
> other vendor drivers may also expose different methods for character devices
> that are not SMBIOS.
> 
> I'm envisioning that this is just the first kernel module that will use a WMI
> character device to userspace.  That's why I wanted to use a generic namespace.
> 
> I would say it could be /dev/wmi-$GUID or /dev/wmi/$driver-$GUID if you want 
> something more generic.
> As long as it's discovereable from uevent that's fine to me.
> 
> > 
> > Darren?

I would like to see an automated and definiitive way to export WMI
GUIDs. Something we can look at, compare to a set of rules, and say
yay/nay. From that perspective, I like Mario's general proposal. It is
not clear to me if the $driver- prefix adds any value though - would we
ever have need of DRIVER_X-GUID_A and DRIVER_Y-GUID_A ??? I'm thinking
not.

/dev/wmi/$GUID

-- 
Darren Hart
VMware Open Source Technology Center
