From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH V4 2/3] mfd: Intel Platform Monitoring Technology support
Date: Fri, 31 Jul 2020 07:19:19 +0100
Message-ID: <20200731061919.GJ2419169@dell>
References: <20200714062323.19990-1-david.e.box@linux.intel.com>
 <20200717190620.29821-3-david.e.box@linux.intel.com>
 <20200728075859.GH1850026@dell>
 <3DCA0A88-0890-49EE-8644-E6311E891C55@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3DCA0A88-0890-49EE-8644-E6311E891C55@gmail.com>
Sender: linux-pci-owner@vger.kernel.org
To: Mark D Rustad <mrustad@gmail.com>
Cc: "David E. Box" <david.e.box@linux.intel.com>, dvhart@infradead.org, andy@infradead.org, bhelgaas@google.com, alexander.h.duyck@linux.intel.com, linux-kernel <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, linux-pci@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, 29 Jul 2020, Mark D Rustad wrote:

> at 12:58 AM, Lee Jones <lee.jones@linaro.org> wrote:
> 
> > If you do:
> > 
> > 	do {
> > 		int pos;
> > 
> > 		pos = pci_find_next_ext_capability(pdev, pos, PCI_EXT_CAP_ID_DVSEC);
> > 		if (!pos)
> > 			break;
> > 
> > Then you can invoke pci_find_next_ext_capability() once, no?
> 
> Part of your suggestion here won't work, because pos needs to be initialized
> to 0 the first time. As such it needs to be declared and initialized outside
> the loop. Other than that it may be ok.

Right.  It was just an example I quickly hacked out.

Feel free to move the variable, or make it static, etc.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
