From: "David E. Box" <david.e.box@linux.intel.com>
Subject: Re: [PATCH V4 2/3] mfd: Intel Platform Monitoring Technology support
Date: Thu, 30 Jul 2020 10:53:55 -0700
Message-ID: <0d4e8a8130e6a78ba3b6fcb3aee9858d22e5c23b.camel@linux.intel.com>
References: <20200714062323.19990-1-david.e.box@linux.intel.com>
         <20200717190620.29821-3-david.e.box@linux.intel.com>
         <20200728075859.GH1850026@dell>
         <3DCA0A88-0890-49EE-8644-E6311E891C55@gmail.com>
Reply-To: david.e.box@linux.intel.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <3DCA0A88-0890-49EE-8644-E6311E891C55@gmail.com>
Sender: linux-pci-owner@vger.kernel.org
To: Mark D Rustad <mrustad@gmail.com>, Lee Jones <lee.jones@linaro.org>
Cc: dvhart@infradead.org, andy@infradead.org, bhelgaas@google.com, alexander.h.duyck@linux.intel.com, linux-kernel <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, linux-pci@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, 2020-07-29 at 15:59 -0700, Mark D Rustad wrote:
> at 12:58 AM, Lee Jones <lee.jones@linaro.org> wrote:
> 
> > If you do:
> > 
> > 	do {
> > 		int pos;
> > 
> > 		pos = pci_find_next_ext_capability(pdev, pos,
> > PCI_EXT_CAP_ID_DVSEC);
> > 		if (!pos)
> > 			break;
> > 
> > Then you can invoke pci_find_next_ext_capability() once, no?
> 
> Part of your suggestion here won't work, because pos needs to be  
> initialized to 0 the first time. As such it needs to be declared
> and  
> initialized outside the loop. Other than that it may be ok.

Already done in V5. Thanks.

David
