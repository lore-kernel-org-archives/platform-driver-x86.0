From: Mattias Jacobsson <2pi@mok.nu>
Subject: Re: [PATCH 0/3] platform/x86: wmi: add WMI support to
 MODULE_DEVICE_TABLE()
Date: Sun, 27 Jan 2019 20:15:54 +0100
Message-ID: <20190127191553.mxrqg7zyzwxwrmo5@mok.nu>
References: <cover.1547827336.git.2pi@mok.nu>
 <20190126210634.GB13882@wrath>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190126210634.GB13882@wrath>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: andy@infradead.org, mario.limonciello@dell.com, michal.lkml@markovi.net, mjg59@srcf.ucam.org, pali.rohar@gmail.com, yamada.masahiro@socionext.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 2pi@mok.nu
List-Id: platform-driver-x86.vger.kernel.org

Hi Darren,

On 2019-01-26, Darren Hart wrote:
> On Sat, Jan 19, 2019 at 12:55:52PM +0100, Mattias Jacobsson wrote:
> > This patchset adds WMI support to MODULE_DEVICE_TABLE().
> 
> Hi Mattias,
> 
> Thanks for the patch series. I've reviewed and found no major issues - but what
> I'm missing from this cover letter and each commit message is the why. What is
> the problem this series is intended to address? This should be clear in the
> commit messages so developers reading the git history have the necessary context
> to understand why the change was made and the intent behind them were.

Thanks for reviewing the patchset!

> 
> The only advantage that I see by the end of the series is removing the need for
> driver authors to prefix the modules alias  with "wmi:" - which is an advantage
> and avoids careless errors. Is that the only goal? It adds some complexity by
> spreading the implementation across more files and more directories, so we need
> to document the justification.

Now that you point it out I can definitely see that the reasoning isn't
explicitly stated. Sorry about that!

I've updated the commit messages for [PATCH 2/3] and [PATCH 3/3] in v2
of this patchset to clarify the "why".

> 
> Thanks,
> 
> -- 
> Darren Hart
> VMware Open Source Technology Center

Thanks,
Mattias
