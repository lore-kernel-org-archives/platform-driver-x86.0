From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 04/12] platform/x86: dell-smbios: Switch to a WMI-ACPI
 interface
Date: Wed, 27 Sep 2017 09:46:15 -0700
Message-ID: <20170927164615.GD23572@fury>
References: <cover.1505999739.git.mario.limonciello@dell.com>
 <4da87eb0d9722ed906615409586a8b4d7becd65c.1505999739.git.mario.limonciello@dell.com>
 <20170925161851.GK22190@pali>
 <12a6583cae694ae58b9b8c885958bcee@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <12a6583cae694ae58b9b8c885958bcee@ausx13mpc120.AMER.DELL.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario.Limonciello@dell.com
Cc: pali.rohar@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, quasisec@google.com
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Sep 25, 2017 at 07:28:57PM +0000, Mario.Limonciello@dell.com wrote:
> 
> 
> > -----Original Message-----
> > From: Pali Rohár [mailto:pali.rohar@gmail.com]
> > Sent: Monday, September 25, 2017 12:19 PM
> > To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> > Cc: dvhart@infradead.org; LKML <linux-kernel@vger.kernel.org>; platform-driver-
> > x86@vger.kernel.org; quasisec@google.com
> > Subject: Re: [PATCH 04/12] platform/x86: dell-smbios: Switch to a WMI-ACPI
> > interface
> > 
> > On Thursday 21 September 2017 08:57:09 Mario Limonciello wrote:
> > > The driver currently uses an SMI interface which grants direct access
> > > to physical memory to the platform via a pointer.
> > >
> > > Changing this to operate over WMI-ACPI will use an ACPI OperationRegion
> > > for a buffer of data storage when platform calls are performed.
> > >
> > > This is a safer approach to use in kernel drivers as the platform will
> > > only have access to that OperationRegion.
> > 
> > In my opinion direct access is safer then using ACPI wrapper for same
> > functionality.
> 
> I'd like to hear how this is safer.

Again, I think the disconnect is around the term "platform". I think above you
can s/platform/SMM/ right?

-- 
Darren Hart
VMware Open Source Technology Center
