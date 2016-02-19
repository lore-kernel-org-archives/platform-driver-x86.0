From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v3 1/1] ideapad-laptop: Add ideapad Y700 (15) to the
 no_hw_rfkill DMI list
Date: Fri, 19 Feb 2016 14:43:12 -0800
Message-ID: <20160219224312.GB23707@dvhart-mobl5.amr.corp.intel.com>
References: <Pine.NEB.4.64.1602180029370.7701@norge.freeshell.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.NEB.4.64.1602180029370.7701@norge.freeshell.org>
Sender: linux-kernel-owner@vger.kernel.org
To: John Dahlstrom <jodarom@SDF.ORG>
Cc: Ike Panhc <ike.pan@canonical.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Feb 18, 2016 at 01:42:20AM -0600, John Dahlstrom wrote:
> Some Lenovo ideapad models lack a physical rfkill switch.
> On Lenovo models ideapad Y700 Touch-15ISK and ideapad Y700-15ISK,
> ideapad-laptop would wrongly report all radios as blocked by
> hardware which caused wireless network connections to fail.
> 
> Add these models without an rfkill switch to the no_hw_rfkill list.
> 
> Signed-off-by: John Dahlstrom <jodarom@sdf.org>
> Cc: <stable@vger.kernel.org>
> ---
>  Relevant kernel versions: 4.5-rc4, 4.4.2, 4.3.5, 4.1.18, 3.18.27

See stable_kernel_rules.txt for how to specify relevant versions. I'm curious
why there is a gap from 3.18 to 4.1.

What you probably meant was:

Cc: <stable@vger.kernel.org> # 3.18.x

If you are going to take this approach, you may wish to verify that this applies
back to 3.18, otherwise you may need to specify dependencies (also described in
the stable_kernel_rules).

My recommendation would be to simply leave the version off and let Greg and the
other maintainers decide how far back to apply it, unless you really care about
3.18 working on these laptops.

If you don't mind leaving it up to them I can take this as is, otherwise, you'll
need to update the Cc stable lines accordingly.

-- 
Darren Hart
Intel Open Source Technology Center
