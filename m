From: "Ni, BaoleX" <baolex.ni@intel.com>
Subject: RE: [PATCH 0857/1285] Replace numeric parameter like 0444 with macro
Date: Mon, 8 Aug 2016 06:41:46 +0000
Message-ID: <318B87A793BE164187D8851D6CE09D64012D3969@shsmsx102.ccr.corp.intel.com>
References: <20160802115249.7120-1-baolex.ni@intel.com>
 <20160802173407.GA1939@khazad-dum.debian.net>
 <20160805225724.GC4952@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160805225724.GC4952@f23x64.localdomain>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: "ibm-acpi-devel@lists.sourceforge.net" <ibm-acpi-devel@lists.sourceforge.net>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Liu, Chuansheng" <chuansheng.liu@intel.com>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>
List-Id: platform-driver-x86.vger.kernel.org

Dear Darren, 

Thank you very much! I'll be glad to take your advice.

Baole

-----Original Message-----
From: Darren Hart [mailto:dvhart@infradead.org] 
Sent: Saturday, August 06, 2016 6:57 AM
To: Henrique de Moraes Holschuh
Cc: Ni, BaoleX; ibm-acpi-devel@lists.sourceforge.net; platform-driver-x86@vger.kernel.org; linux-kernel@vger.kernel.org; Liu, Chuansheng
Subject: Re: [PATCH 0857/1285] Replace numeric parameter like 0444 with macro

On Tue, Aug 02, 2016 at 02:34:07PM -0300, Henrique de Moraes Holschuh wrote:
> (cc list trimmed)
> 
> On Tue, 02 Aug 2016, Baole Ni wrote:
> > I find that the developers often just specified the numeric value 
> > when calling a macro which is defined with a parameter for access permission.
> > As we know, these numeric value for access permission have had the 
> > corresponding macro, and that using macro can improve the robustness 
> > and readability of the code, thus, I suggest replacing the numeric parameter with the macro.
> > 
> > Signed-off-by: Chuansheng Liu <chuansheng.liu@intel.com>
> > Signed-off-by: Baole Ni <baolex.ni@intel.com>
> 
> NACK.
> 
> IMO, the proposed change reduces readiability for no good reason.  
> Most people touching kernel code have 0444, 0644, 0755, etc. already 
> hardwired into their pattern recognition neural network, while the 
> POSIX
> S_* crap is actually bug food.

While I'm generally in favor of using macros where they exist, I do agree with Henrique that this is actually less legible.

> 
> PS: no more ill-managed ultra-large patch bombs, *please*.

Indeed. 1285 patches with the same subject line is "not ideal". Prefixing with the subsystem at the very least would have been an improvement. An RFC on the concept, cc'ing the subsystem maintainers to get consensus and direction on how to manage the large change would have been advisable.

I'm dropping these for pdx86 unless a compelling argument arises for including them (like - the only subsystem not taking these is pdx86...)

--
Darren Hart
Intel Open Source Technology Center
