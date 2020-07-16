From: "David E. Box" <david.e.box@linux.intel.com>
Subject: Re: [PATCH V3 1/3] PCI: Add defines for Designated Vendor-Specific
 Capability
Date: Thu, 16 Jul 2020 11:31:25 -0700
Message-ID: <e051971b327d870476dad209ddf27055d001b9b4.camel@linux.intel.com>
References: <20200508021844.6911-1-david.e.box@linux.intel.com>
         <20200714062323.19990-2-david.e.box@linux.intel.com>
         <3f490460-62f8-8b49-0735-ad29653bfbc0@infradead.org>
         <dc459a96-1434-16bf-80d2-06b0680f9fda@linux.intel.com>
Reply-To: david.e.box@linux.intel.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <dc459a96-1434-16bf-80d2-06b0680f9fda@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexander Duyck <alexander.h.duyck@linux.intel.com>, Randy Dunlap <rdunlap@infradead.org>, lee.jones@linaro.org, dvhart@infradead.org, andy@infradead.org, bhelgaas@google.com
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-pci@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, 2020-07-16 at 10:18 -0700, Alexander Duyck wrote:
> 
> On 7/15/2020 7:55 PM, Randy Dunlap wrote:
> > On 7/13/20 11:23 PM, David E. Box wrote:
> > > Add PCIe DVSEC extended capability ID and defines for the header
> > > offsets.
> > > Defined in PCIe r5.0, sec 7.9.6.
> > > 
> > > Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> > > Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> > > ---
> > >   include/uapi/linux/pci_regs.h | 5 +++++
> > >   1 file changed, 5 insertions(+)
> > > 
> > > diff --git a/include/uapi/linux/pci_regs.h
> > > b/include/uapi/linux/pci_regs.h
> > > index f9701410d3b5..09daa9f07b6b 100644
> > > --- a/include/uapi/linux/pci_regs.h
> > > +++ b/include/uapi/linux/pci_regs.h
> > > @@ -720,6 +720,7 @@
> > > +#define PCI_EXT_CAP_ID_DVSEC	0x23	/* Designated Vendor-
> > > Specific */
> > > @@ -1062,6 +1063,10 @@
> > > +/* Designated Vendor-Specific (DVSEC, PCI_EXT_CAP_ID_DVSEC) */
> > > +#define PCI_DVSEC_HEADER1		0x4 /* Vendor-Specific
> > > Header1 */
> > > +#define PCI_DVSEC_HEADER2		0x8 /* Vendor-Specific
> > > Header2 */

These comments I'll fix to say "Designated Vendor-Specific"

> > 
> > Just a little comment: It would make more sense to me to
> > s/DVSEC/DVSPEC/g.
> > 
> > But then I don't have the PCIe documentation.
> 
> Arguably some of the confusion might be from the patch title. DVSEC
> is 
> acronym for Designated Vendor-Specific Extended Capability if I
> recall 
> correctly. It would probably be best to call that out since the
> extended 
> implies it lives in the config space accessible via the memory
> mapped 
> config.

I'll change the patch title as well, but agree DVSEC is better as it's
consistent with the spec.

Thanks

David
