From: Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: [PATCH 0857/1285] Replace numeric parameter
	like 0444 with macro
Date: Fri, 5 Aug 2016 15:57:24 -0700
Message-ID: <20160805225724.GC4952@f23x64.localdomain>
References: <20160802115249.7120-1-baolex.ni@intel.com>
	<20160802173407.GA1939@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160802173407.GA1939-ZGHd14iZgfaRjzvQDGKj+xxZW9W5cXbT@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>
Cc: Baole Ni <baolex.ni-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, chuansheng.liu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Aug 02, 2016 at 02:34:07PM -0300, Henrique de Moraes Holschuh wrote:
> (cc list trimmed)
> 
> On Tue, 02 Aug 2016, Baole Ni wrote:
> > I find that the developers often just specified the numeric value
> > when calling a macro which is defined with a parameter for access permission.
> > As we know, these numeric value for access permission have had the corresponding macro,
> > and that using macro can improve the robustness and readability of the code,
> > thus, I suggest replacing the numeric parameter with the macro.
> > 
> > Signed-off-by: Chuansheng Liu <chuansheng.liu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> > Signed-off-by: Baole Ni <baolex.ni-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> 
> NACK.
> 
> IMO, the proposed change reduces readiability for no good reason.  Most
> people touching kernel code have 0444, 0644, 0755, etc. already
> hardwired into their pattern recognition neural network, while the POSIX
> S_* crap is actually bug food.

While I'm generally in favor of using macros where they exist, I do agree with
Henrique that this is actually less legible.

> 
> PS: no more ill-managed ultra-large patch bombs, *please*.

Indeed. 1285 patches with the same subject line is "not ideal". Prefixing with
the subsystem at the very least would have been an improvement. An RFC on the
concept, cc'ing the subsystem maintainers to get consensus and direction on how
to manage the large change would have been advisable.

I'm dropping these for pdx86 unless a compelling argument arises for including
them (like - the only subsystem not taking these is pdx86...)

-- 
Darren Hart
Intel Open Source Technology Center

------------------------------------------------------------------------------
