From: John Dahlstrom <jodarom@SDF.ORG>
Subject: Re: [PATCH v4 1/1] ideapad-laptop: Add ideapad Y700 (15) to the
 no_hw_rfkill DMI list
Date: Mon, 22 Feb 2016 22:29:48 -0600 (CST)
Message-ID: <Pine.NEB.4.64.1602221810140.9397@norge.freeshell.org>
References: <Pine.NEB.4.64.1602191918380.15324@faeroes.freeshell.org>
 <20160222221416.GD14101@dvhart-mobl5.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx.sdf.org ([192.94.73.23]:52625 "EHLO sdf.lonestar.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1757100AbcBWEaj (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 22 Feb 2016 23:30:39 -0500
In-Reply-To: <20160222221416.GD14101@dvhart-mobl5.amr.corp.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Ike Panhc <ike.pan@canonical.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 22 Feb 2016, Darren Hart wrote:

> Unfortunately, backporting this to stable is not quite so simple.
>
> First, 3.16 doesn't really work as between 3.16 and 3.17 the following patch
> landed:
>
> ce363c2 ideapad-laptop: Change Lenovo Yoga 2 series rfkill handling
>
> Which changes the name of the dmi_system_id struct from rfkill_blacklist to
> no_hw_rfkill_list.
>
> Following that, there were several additions to the list which should be applied
> before this patch to each stable kernel for which they haven't been picked up in
> order for this one to apply cleanly. Several of those are included below:
>

Despite the change in the no_hw_rfkill_list, GNU patch still yields the
correct output but with fuzz. I interpret apply cleanly to mean that
the patch must also apply with zero fuzz, such as with "patch -F 0".

In the case where the context has changed (including changes to an
enclosing struct or function), I gather that a patch exactly modified
for an older kernel is to be sent to stable@vger.kernel.org after the 
unmodified patch is accepted upstream with a commit ID.

> $ git l v3.17.. drivers/platform/x86/ideapad-laptop.c
[...]

> If you are going to specify a kernel version, you should also include the
> commits above necessary to make the patch apply cleanly. That would be a long
> list as you would need many of these for each version.
>

Thank you for that information. One commit is sufficient to apply the 
patch to all kernel versions without fuzz:

4fa9dab ideapad_laptop: Lenovo G50-30 fix rfkill reports wireless blocked

> What I'm going to do is include a single Cc to stable line without a kernel
> version. The maintainers will pull that back as far as they can using their own
> judgement. If you want this to go back earlier than they do on their own, you
> should submit it to linux-stable directly and include the Cc lines for the
> dependencies for each kernel you care to see this backported to. See the
> stable-kernel-rules for the specific formatting to accomplish this.
>

I've submitted v5 of the patch with a single Cc line with the prerequisite
kernel(s) and commit ID specified exactly.

Kind regards,

John
