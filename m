From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 1/2] ideapad-laptop: Add ideapad Y700-15ISK to the
 no_hw_rfkill DMI list
Date: Wed, 17 Feb 2016 21:50:50 -0800
Message-ID: <20160218055050.GH18421@dvhart-mobl5.amr.corp.intel.com>
References: <Pine.NEB.4.64.1602171614460.23053@faeroes.freeshell.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.NEB.4.64.1602171614460.23053@faeroes.freeshell.org>
Sender: linux-kernel-owner@vger.kernel.org
To: John Dahlstrom <jodarom@SDF.ORG>
Cc: Ike Panhc <ike.pan@canonical.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Feb 17, 2016 at 04:33:43PM -0600, John Dahlstrom wrote:
> Some Lenovo ideapad models lack a physical rfkill switch.
> On a Lenovo ideapad Y700-15ISK, the ideapad-laptop module
> would wrongly report all radios as blocked by hardware which
> caused wireless network connections to fail.
> 
> Add this model without an rfkill switch to the no_hw_rfkill list.
> 
> Tested-by: John Dahlstrom <jodarom@sdf.org>
> Signed-off-by: John Dahlstrom <jodarom@sdf.org>
> ---
>  Relevant kernel versions: 4.5-rc4, 4.4.2, 4.3.5, 4.1.18, 3.18.27
>  Patch changelog
>   v2 split patch between Touch and non-Touch devices

One patch was fine. Please see my feedback to the initial patch.

-- 
Darren Hart
Intel Open Source Technology Center
