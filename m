From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: intel_pmc_core does not initialize intel 8th gen PMC
Date: Tue, 13 Feb 2018 18:21:19 +0200
Message-ID: <CAHp75VdquuTLRgSbzKTBvyLmeFkGyDmP+U=GdOxLhBsU=w6Log@mail.gmail.com>
References: <1518426556.26505.2.camel@autistici.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1518426556.26505.2.camel@autistici.org>
Sender: linux-kernel-owner@vger.kernel.org
To: kitestramuort <kitestramuort@autistici.org>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

+Cc: Authors and correct ML

On Mon, Feb 12, 2018 at 11:09 AM, kitestramuort
<kitestramuort@autistici.org> wrote:
> don't know if this is intended. In 4.15.2 i have:

AFAIU the driver now binds to the hardcoded value of a PA of the
device. So, you still have driver enabled.

Srinivas, is my understanding correct?

> dmesg:
> intel_pmc_core 0000:00:1f.2: enabling device (0000 -> 0002)
>
> lspci:
> 00:1f.2 Memory controller: Intel Corporation Sunrise Point-LP PMC (rev
> 21)
>         Subsystem: Intel Corporation Sunrise Point-LP PMC
>         Control: I/O- Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop-
> ParErr- Stepping- SERR- FastB2B- DisINTx-
>         Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
> <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Region 0: Memory at dff00000 (32-bit, non-prefetchable)
> [size=16K]
>         Kernel driver in use: intel_pmc_core

> in 4.16.0-rc1 this becomes
> dmesg:
> intel_pmc_core:  initialized
>
> lspci:
> 00:1f.2 Memory controller: Intel Corporation Sunrise Point-LP PMC (rev
> 21)
>         Subsystem: Intel Corporation Sunrise Point-LP PMC
>         Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop-
> ParErr- Stepping- SERR- FastB2B- DisINTx-
>         Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
> <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Region 0: Memory at dff00000 (32-bit, non-prefetchable)
> [disabled] [size=16K]



-- 
With Best Regards,
Andy Shevchenko
