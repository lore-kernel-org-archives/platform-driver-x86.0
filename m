From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 0/3] platform/x86: wmi: add WMI support to
 MODULE_DEVICE_TABLE()
Date: Sat, 26 Jan 2019 13:06:34 -0800
Message-ID: <20190126210634.GB13882@wrath>
References: <cover.1547827336.git.2pi@mok.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1547827336.git.2pi@mok.nu>
Sender: linux-kernel-owner@vger.kernel.org
To: Mattias Jacobsson <2pi@mok.nu>
Cc: andy@infradead.org, mario.limonciello@dell.com, michal.lkml@markovi.net, mjg59@srcf.ucam.org, pali.rohar@gmail.com, yamada.masahiro@socionext.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Jan 19, 2019 at 12:55:52PM +0100, Mattias Jacobsson wrote:
> This patchset adds WMI support to MODULE_DEVICE_TABLE().

Hi Mattias,

Thanks for the patch series. I've reviewed and found no major issues - but what
I'm missing from this cover letter and each commit message is the why. What is
the problem this series is intended to address? This should be clear in the
commit messages so developers reading the git history have the necessary context
to understand why the change was made and the intent behind them were.

The only advantage that I see by the end of the series is removing the need for
driver authors to prefix the modules alias  with "wmi:" - which is an advantage
and avoids careless errors. Is that the only goal? It adds some complexity by
spreading the implementation across more files and more directories, so we need
to document the justification.

Thanks,

-- 
Darren Hart
VMware Open Source Technology Center
