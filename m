From: Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: [PATCH v2 1/3] thinkpad_acpi: Move tablet
 detection into separate function
Date: Sat, 5 Nov 2016 12:30:22 -0700
Message-ID: <20161105193022.GH100528@f23x64.localdomain>
References: <201611010752.uqciUgvR%fengguang.wu@intel.com>
	<1477958200-23883-1-git-send-email-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1477958200-23883-1-git-send-email-lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Lyude <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Daniel Martin <consume.noise-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, ibm-acpi-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Henrique de Moraes Holschuh <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Oct 31, 2016 at 07:56:40PM -0400, Lyude wrote:
> Suggested by Daniel Martin <consume.noise-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> Lenovo's having a bit of fun randomly changing what hotkey events and
> acpi handles they use for reporting tablet mode, so unfortunately this
> means we're definitely going to need to probe for multiple types of
> tablet mode support. Since the hotkey_init() is already a lot larger
> then it should be, let's split up this detection into it's own function
> to make things a little easier to read.
> 
> As well, since we're going to have multiple types of tablet modes, make
> hotkey_tablet into an enum so we can also use it to indicate the type of
> tablet mode reporting the machine supports.
> 
> Changes since v1:
> - Don't use bool for in_tablet_mode (fixes complaints from kbuild test
>   robot)
> 

This series doesn't apply cleanly now (simple fuzz).

Once we hear back from Henrique on his enum preference and thoughts on the
refactoring (which looks reasonable to me), please resubmit this series and
review Documentation/SubmittingPatches for the changelog (below ---) and please
be consistent in your placement of "v2" in the subject [PATCH vX N/M] prefix.

Most all of my feedback here is minor, but there were enough little things that
added up and I'd like to see this resubmitted as a series with those addressed
that applies cleanly - largely to make sure I haven't missed context and somehow
merged the wrong bits.

Thanks Lyude,

-- 
Darren Hart
Intel Open Source Technology Center

------------------------------------------------------------------------------
Developer Access Program for Intel Xeon Phi Processors
Access to Intel Xeon Phi processor-based developer platforms.
With one year of Intel Parallel Studio XE.
Training and support from Colfax.
Order your platform today. http://sdm.link/xeonphi
